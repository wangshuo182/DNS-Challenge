#!/usr/bin/bash

# ***** Datasets for INTERSPEECH 2021 DNS Challenge 3 *****

# NOTE: This data is for the *PAST* challenge!
# Current DNS Challenge is ICASSP 2022 DNS Challenge 4, which
# has its own download script, `download-dns-challenge-4.sh`

# NOTE: Before downloading, make sure you have enough space
# on your local storage!

# In all, you will need at least 830GB to store UNPACKED data.
# Archived, the same data takes 512GB total.

# Please comment out the files you don't need before launching
# the script.

# NOTE: By default, the script *DOES NOT* DOWNLOAD ANY FILES!
# Please scroll down and edit this script to pick the
# downloading method that works best for you.

# -------------------------------------------------------------
# The directory structure of the unpacked data is:

# *** Wideband data: ***

# datasets 229G
# +-- clean 204G
# |   +-- emotional_speech 403M
# |   +-- french_data 21G
# |   +-- german_speech 66G
# |   +-- italian_speech 14G
# |   +-- mandarin_speech 21G
# |   +-- read_speech 61G
# |   +-- russian_speech 5.1G
# |   +-- singing_voice 979M
# |   \-- spanish_speech 17G
# +-- dev_testset 211M
# +-- impulse_responses 4.3G
# |   +-- SLR26 2.1G
# |   \-- SLR28 2.3G
# \-- noise 20G

# *** Fullband data: ***

# datasets_fullband 600G
# +-- clean_fullband 542G
# |   +-- VocalSet_48kHz_mono 974M
# |   +-- emotional_speech 1.2G
# |   +-- french_data 62G
# |   +-- german_speech 194G
# |   +-- italian_speech 42G
# |   +-- read_speech 182G
# |   +-- russian_speech 12G
# |   \-- spanish_speech 50G
# +-- dev_testset_fullband 630M
# \-- noise_fullband 58G

BLOB_NAMES=(

    # DEMAND dataset
    DEMAND.tar.bz2

    # Wideband clean speech
    datasets/datasets.clean.read_speech.tar.bz2

    # Wideband emotional speech
    datasets/datasets.clean.emotional_speech.tar.bz2

    # Wideband non-English clean speech
    datasets/datasets.clean.french_data.tar.bz2
    datasets/datasets.clean.german_speech.tar.bz2
    datasets/datasets.clean.italian_speech.tar.bz2
    datasets/datasets.clean.mandarin_speech.tar.bz2
    datasets/datasets.clean.russian_speech.tar.bz2
    datasets/datasets.clean.singing_voice.tar.bz2
    datasets/datasets.clean.spanish_speech.tar.bz2

    # Wideband noise, IR, and test data
    datasets/datasets.impulse_responses.tar.bz2
    datasets/datasets.noise.tar.bz2
    datasets/datasets.dev_testset.tar.bz2

    # ---------------------------------------------------------

    # Fullband clean speech
    datasets_fullband/datasets_fullband.clean_fullband.read_speech.0.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.read_speech.1.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.read_speech.2.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.read_speech.3.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.VocalSet_48kHz_mono.tar.bz2

    # Fullband emotional speech
    datasets_fullband/datasets_fullband.clean_fullband.emotional_speech.tar.bz2

    # Fullband non-English clean speech
    datasets_fullband/datasets_fullband.clean_fullband.french_data.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.0.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.1.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.2.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.3.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.4.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.5.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.6.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.7.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.8.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.9.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.10.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.11.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.12.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.13.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.14.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.15.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.16.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.17.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.18.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.german_speech.19.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.italian_speech.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.russian_speech.tar.bz2
    datasets_fullband/datasets_fullband.clean_fullband.spanish_speech.tar.bz2

    # Fullband noise and test data
    datasets_fullband/datasets_fullband.noise_fullband.tar.bz2
    datasets_fullband/datasets_fullband.dev_testset_fullband.tar.bz2
)

###############################################################

AZURE_URL="https://dns3public.blob.core.windows.net/dns3archive"

mkdir -p ./datasets ./datasets_fullband

for BLOB in ${BLOB_NAMES[@]}
do
    URL="$AZURE_URL/$BLOB"
    echo "Download: $BLOB"

    # DRY RUN: print HTTP headers WITHOUT downloading the files
    curl -s -I "$URL" | head -n 1

    # Actually download the files - UNCOMMENT it when ready to download
    # curl "$URL" -o "$BLOB"

    # Same as above, but using wget
    # wget "$URL" -O "$BLOB"

    # Same, + unpack files on the fly
    # curl "$URL" | tar -f - -x -j
done

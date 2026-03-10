#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname="$POSTGRES_DB" <<-EOSQL
    create extension IF NOT EXISTS pg_trgm;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    create extension IF NOT EXISTS hstore;
    create role chirpstack with login password 'chirpstack';
    create database chirpstack with owner chirpstack;
EOSQL

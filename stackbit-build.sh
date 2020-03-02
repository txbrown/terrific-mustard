#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5d782b6d3276001bdfa1e0/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5d782b6d3276001bdfa1e0
curl -s -X POST https://api.stackbit.com/project/5e5d782b6d3276001bdfa1e0/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5d782b6d3276001bdfa1e0/webhook/build/publish > /dev/null

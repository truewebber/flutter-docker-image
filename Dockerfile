ARG DART_VERSION
FROM dart:${DART_VERSION} AS builder

WORKDIR /

ARG FLUTTER_VERSION

ENV PATH="/flutter/bin:${PATH}"
ENV FLUTTER_GIT_URL="unknown source"

RUN apt-get update && apt-get install -y git

RUN git clone -b ${FLUTTER_VERSION} https://github.com/flutter/flutter.git \
    && flutter channel stable \
    && flutter upgrade

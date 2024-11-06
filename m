Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6329BEF03
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830962.1246102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g4t-0004ob-Uv; Wed, 06 Nov 2024 13:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830962.1246102; Wed, 06 Nov 2024 13:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g4t-0004n6-Rh; Wed, 06 Nov 2024 13:28:07 +0000
Received: by outflank-mailman (input) for mailman id 830962;
 Wed, 06 Nov 2024 13:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8g4s-0004n0-Ox
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:28:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1521756b-9c42-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:26:52 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso1062501566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:24:25 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1521756b-9c42-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE1MjE3NTZiLTljNDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk5NjE3LjYxODE3NCwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730899310; x=1731504110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45oT54b/H6Gj3avxI/jIkIoWZCdO/tkO5E9TuzQK8WA=;
        b=baN70awTY8HtKCcUi2j937ez9nkWPnYU2E0WeVLQC2NBZDBGH6ClmQqsjCYDay9K/b
         uP1TeWvRIOy8qlb5CfSqftI5/QzndzS5xqu3v1BGQ5aqU/WtlQRv4ikKn8J7PDaIn3Cw
         jYmL5V0eCSe9Om4sVsGMXO6WaaKTPn37nzdP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730899310; x=1731504110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45oT54b/H6Gj3avxI/jIkIoWZCdO/tkO5E9TuzQK8WA=;
        b=nreV8ndLUu4tfgWfYPCnnHfy0t0Vx9aHJdM9wW7P+J4mBlj1pnRG0/26BgBWZ+GWWL
         cj/I6gZ3+F6gtXMnan0hoOoqeoEwNk8ppZnYazsBwM1C5ahlDC4SGNNyL0NDJ59nqQsM
         0lVkffBkq+Xxqqk7ljZ87fBJe/8SQhcOOOP0R6ZCGQWyU90/JqSb9gWS9cZmn1XkdhhN
         vcB6VPWAGPzFYXWYYCo+tTuN1RDdpkX2f4VyZGtutUA2pQztwQqTfGNigQ/uoQwzIE0p
         JtSxmQvuTWzYmT4Sk35JPt7N2wxhYVAcG45APrS8OJ5tqlrt+FVLdWJERVWLqmVGwlFq
         FTjw==
X-Gm-Message-State: AOJu0Yw94UnDrre/Ai0gfkzfKSe7WznjKQSUznJe5ycGEyKJFlO0Jocj
	R0sZuPxfpfIMbsli1eMc1d9VZE5HSq6kx9HHvtLs0R2m3P4aeCkYsw0RSUkUHMGlVXI2wh2T64l
	mmTk=
X-Google-Smtp-Source: AGHT+IGaj5tsjSQdTpTziZ4I4VRkmICS/rKn3GSGax+Rv5p9Rgm1e9BDeOKl0uwbR2ReE9mJNcIl9A==
X-Received: by 2002:a05:6402:5203:b0:5ca:14e5:b685 with SMTP id 4fb4d7f45d1cf-5cbbf888bcemr29942500a12.3.1730898324303;
        Wed, 06 Nov 2024 05:05:24 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/6] CI: Refresh the Debian 12 arm64 container
Date: Wed,  6 Nov 2024 13:05:04 +0000
Message-ID: <ad9bcd46c85e738eccb2c51b42ae7d9d0d02fc5d.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to use heredocs for readability and use
apt-get --no-install-recommends to keep the size down.  Rename the job
to debian-12-arm64-* to follow the naming scheme of all the other CI
jobs.

This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.

The container is left running the builds and tests as root to avoid
breaking the xilinx runners.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/debian/12-arm64v8.dockerfile | 68 +++++++++++++++++++
 .../build/debian/bookworm-arm64v8.dockerfile  | 55 ---------------
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/containerize               |  2 +-
 5 files changed, 75 insertions(+), 62 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8.dockerfile

diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
new file mode 100644
index 000000000000..fa53eb174862
--- /dev/null
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -0,0 +1,68 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# build depends
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    apt-get update
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        flex
+        # Flask
+        checkpolicy
+
+        # Tools (general)
+        git-core
+        libext2fs-dev
+        libfdt-dev
+        libglib2.0-dev
+        libpixman-1-dev
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        liblzma-dev
+        liblzo2-dev
+        libzstd-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Golang bindings
+        golang-go
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # for test phase, qemu-smoke-* jobs
+        busybox-static
+        ca-certificates
+        cpio
+        curl
+        device-tree-compiler
+        expect
+        u-boot-qemu
+        # for imagebuilder
+        file
+        u-boot-tools
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER root
+WORKDIR /build
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
deleted file mode 100644
index da8ae7512589..000000000000
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ /dev/null
@@ -1,55 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python3-dev \
-        python3-setuptools \
-        uuid-dev \
-        libyajl-dev \
-        libaio-dev \
-        libglib2.0-dev \
-        clang \
-        libpixman-1-dev \
-        pkg-config \
-        flex \
-        bison \
-        acpica-tools \
-        libfdt-dev \
-        bin86 \
-        bcc \
-        liblzma-dev \
-        libnl-3-dev \
-        ocaml-nox \
-        libfindlib-ocaml-dev \
-        markdown \
-        transfig \
-        pandoc \
-        checkpolicy \
-        wget \
-        git \
-        nasm \
-        # for test phase, qemu-smoke-* jobs
-        u-boot-qemu \
-        u-boot-tools \
-        device-tree-compiler \
-        curl \
-        cpio \
-        busybox-static \
-        expect \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 871beb70e157..8ee1049d857c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -411,15 +411,15 @@ debian-bookworm-gcc-arm32-debug-earlyprintk:
 
 # Arm builds
 
-debian-bookworm-gcc-arm64:
+debian-12-arm64-gcc:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
 
-debian-bookworm-gcc-debug-arm64:
+debian-12-arm64-gcc-debug:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
 
 alpine-3.18-gcc-arm64:
   extends: .gcc-arm64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 5b89cfa33cf8..3a4d0eb7e15d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -17,7 +17,7 @@
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
     LOGFILE: qemu-smoke-arm64.log
   artifacts:
     paths:
@@ -30,7 +30,7 @@
 .qemu-arm32:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
     LOGFILE: qemu-smoke-arm32.log
   artifacts:
     paths:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index d72c22c103ff..1b75c8d93724 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -37,7 +37,7 @@ case "_${CONTAINER}" in
     _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
-    _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
+    _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
-- 
2.45.2



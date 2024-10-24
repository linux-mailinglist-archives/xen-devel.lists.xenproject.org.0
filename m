Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FA9AE213
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825100.1239312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uht-0005yU-8p; Thu, 24 Oct 2024 10:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825100.1239312; Thu, 24 Oct 2024 10:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uht-0005nS-2s; Thu, 24 Oct 2024 10:04:41 +0000
Received: by outflank-mailman (input) for mailman id 825100;
 Thu, 24 Oct 2024 10:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhr-0005hv-2V
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60db4d1f-91ef-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 12:04:38 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53a007743e7so850546e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:38 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:37 -0700 (PDT)
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
X-Inumbo-ID: 60db4d1f-91ef-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764277; x=1730369077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpCJXGcVny4qY37VLhg54wKOfSqt3MWgG1985f7jSN8=;
        b=PkLWyoz+k38ypMH0sm8zNCIbVrB1kxCg1/4MQIrPFJPHeAVGnBdEkKk5MO6J8WbjCq
         iymmPPOoCAC1hFizLEkQESNulnLpV7K4kMTPe5GG1YvkWxxuT73rpPR6trYLzeUVW9D6
         wrxH5gGYCVfy7HngK+TvIXAfgcnEAGq7CsmoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764277; x=1730369077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpCJXGcVny4qY37VLhg54wKOfSqt3MWgG1985f7jSN8=;
        b=qW2HPSo9CztD0BHf5iTWSuMb80819LZL40uTiI8huJLUmsAKCQe1qmGganWsDJEbFT
         5/nXULbmG4Ngw/Y4KvCNnsFwKgD3uSRUnHC71TiO3WUvXGPCNyWmXHQFGQRyCDEj41SB
         HwEMbeh16j9JaR8bQTynfKUcLpHxqFOroT0Fx96qdL2vovdt98Io8bouscWoik+iFJZW
         ydOew3HvpeeDxWe+eZF33hdi7jtcS1Q6eG+/XBoO1TOB0l7I2zCTo+/0pKjB0F5HbLnr
         UutpmMLYlZ8wCXlW63jApiGt2ZPYoCRu1f+46Ldvvd7Br6GaX90Qw9fZ3ZnCQ0JdZSei
         hYlw==
X-Gm-Message-State: AOJu0Yy+pC6b6dbDiXLs+bdxNZEvI5FFZoCp6slev4Vmbf5rQeJPfc2W
	pl24r1vrEUqYQ0ggBVhyXyKY47oInrdXZ/JMVD8QrRW9aeQK/R3UEe2rBT+Ym+I2lYyqP1HnjpI
	fzUg=
X-Google-Smtp-Source: AGHT+IGnKFsjEXeSsDFmCi7N84r6N86DDLlEJWdL3RWtQ8Mkd+KE+dji58Ba50xXb7lDdIyZR1gahw==
X-Received: by 2002:a05:6512:1246:b0:536:9f72:c427 with SMTP id 2adb3069b0e04-53b1a343cfamr2894874e87.28.1729764277339;
        Thu, 24 Oct 2024 03:04:37 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 3/6] CI: Refresh the Debian 12 arm64 container
Date: Thu, 24 Oct 2024 11:04:18 +0100
Message-ID: <50c1ec986787c8fe3bf975b0003069b67e885032.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729760501.git.javi.merino@cloud.com>
References: <cover.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to use heredocs for readability and use apt-get
--no-install-recommends to keep the size down.  Rename the job to
debian-12-arm64-* to follow the naming scheme of all the other CI jobs.

This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.

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
index 000000000000..4da1b074aedb
--- /dev/null
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -0,0 +1,68 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
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
index 1b322044ab19..c687298cc924 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -407,15 +407,15 @@ debian-bookworm-gcc-arm32-debug-earlyprintk:
 
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
index 0812ddb42d9b..248281f47942 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E770E9AE212
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825102.1239326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhu-0006HU-2Q; Thu, 24 Oct 2024 10:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825102.1239326; Thu, 24 Oct 2024 10:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uht-00064G-RS; Thu, 24 Oct 2024 10:04:41 +0000
Received: by outflank-mailman (input) for mailman id 825102;
 Thu, 24 Oct 2024 10:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhs-0005hp-0X
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:40 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 609a36d6-91ef-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 12:04:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539e690479cso754391e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:37 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:36 -0700 (PDT)
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
X-Inumbo-ID: 609a36d6-91ef-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764277; x=1730369077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQWmvDlLDweK6ujseIAxFWUbMQufNhICWPD0ghEGPJ8=;
        b=Tg+eaA9o6JthTTtnFFmyxTKIDNtk4tdOVpM6vncyP41BCqTdJNx0FD0vafZDlHf6/q
         PMilH1m666sckCvwmy8F9Xh8NWE2Hdx7kivVbmK4kor35ArdbVNFKc5twliNubLcYPIf
         dFHEocGoLtY//fX7h0zFpGc97q5gmvqyZZIPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764277; x=1730369077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQWmvDlLDweK6ujseIAxFWUbMQufNhICWPD0ghEGPJ8=;
        b=qHTc82W4qSXbYLBagCtQXJ+BXSGBUbMqGeBpBZGAXVNsB86rKhTz8ncUfsn8ZyFIoG
         nJZBnQhG3UOyEj53pt9YqIpa7s2wArQVkY7GK56vUlHxBWqMEEcOTKNQCf63Vo2603nC
         YLajIMoLhT2flSh024u796f/K5BYQ6NPdr/xMT/Y5z/R60QZkxNBAyMZYLWXAjfBiHyk
         ikRT54PHKZJIwTFqSBhD5MYJV7KqMk5qvPDTp9dV2m6EYULp3IUxoIwCwQcU5y7eaYdp
         2zhhz2HFRyFOj3+vjqI4ivZxfz9PBKMiwRe2DKE3kl8VPR0+gkjpCsGMr+dxyV8P7xb+
         lJcA==
X-Gm-Message-State: AOJu0Yzi4p4DP5zGBGROkyy59caVTvltxLdclp/W63Fju2X/RoZGh+ks
	DSXwi/ZvKDaJ4GAk/ImZ0wwm7/0fSU0Rque0IdO91lcJUzGK1F46OnRfvycwiuOMahlBS0ltiaH
	7T1E=
X-Google-Smtp-Source: AGHT+IHivd6x7FEdY3knn+Ey/pTnjQIOBE6BovxR+ERumwEH7ARZ/OZwbEEuuJNPlrNoyrODUcZZcA==
X-Received: by 2002:a05:6512:400d:b0:539:964c:16d4 with SMTP id 2adb3069b0e04-53b1a347b64mr3085470e87.36.1729764276837;
        Thu, 24 Oct 2024 03:04:36 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 2/6] CI: Refresh the Debian 12 x86_32 container
Date: Thu, 24 Oct 2024 11:04:17 +0100
Message-ID: <f542e8157d7fe419d7b274d749bffde086a28f32.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729760501.git.javi.merino@cloud.com>
References: <cover.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to be non-root, use heredocs for readability, and
use apt-get --no-install-recommends to keep the size down.  Rename the
job to x86_32, to be consistent with XEN_TARGET_ARCH and the
naming scheme of all the other CI jobs:
${VERSION}-${ARCH}-${BUILD_NAME}

Remove build dependencies for building QEMU, as we don't do it since
e305256e69b1 ("CI: Stop building QEMU in general").

Remove build dependencies for the documentation as we don't have to
build it for every single arch.

This reduces the size of the container from 2.22GB to 1.32Gb.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/debian/12-x86_32.dockerfile  | 51 +++++++++++++++++++
 .../build/debian/bookworm-i386.dockerfile     | 50 ------------------
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/scripts/containerize               |  2 +-
 4 files changed, 56 insertions(+), 55 deletions(-)
 create mode 100644 automation/build/debian/12-x86_32.dockerfile
 delete mode 100644 automation/build/debian/bookworm-i386.dockerfile

diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/12-x86_32.dockerfile
new file mode 100644
index 000000000000..d3c67a256212
--- /dev/null
+++ b/automation/build/debian/12-x86_32.dockerfile
@@ -0,0 +1,51 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/i386 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+# build depends
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+    )
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
+ENTRYPOINT ["linux32"]
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
deleted file mode 100644
index 66fa3121c54e..000000000000
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ /dev/null
@@ -1,50 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-ENTRYPOINT ["linux32"]
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
-        bin86 \
-        bcc \
-        liblzma-dev \
-        libc6-dev \
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
-        apt-transport-https \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index eb2c23619a2c..1b322044ab19 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -569,15 +569,15 @@ debian-12-x86_64-gcc-randconfig:
     CONTAINER: debian:12-x86_64
     RANDCONFIG: y
 
-debian-bookworm-32-clang-debug:
+debian-12-x86_32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
-    CONTAINER: debian:bookworm-i386
+    CONTAINER: debian:12-x86_32
 
-debian-bookworm-32-gcc-debug:
+debian-12-x86_32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
-    CONTAINER: debian:bookworm-i386
+    CONTAINER: debian:12-x86_32
 
 fedora-40-x86_64-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index ea6e1a9b18f4..d72c22c103ff 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -35,7 +35,7 @@ case "_${CONTAINER}" in
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
-    _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
+    _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
-- 
2.45.2



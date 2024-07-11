Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF792E5CC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757334.1166279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrm4-00031S-6C; Thu, 11 Jul 2024 11:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757334.1166279; Thu, 11 Jul 2024 11:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrm4-0002vV-0k; Thu, 11 Jul 2024 11:15:44 +0000
Received: by outflank-mailman (input) for mailman id 757334;
 Thu, 11 Jul 2024 11:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrm2-0007rJ-1b
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:42 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e80b69f7-3f76-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 13:15:40 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77d9217e6fso99243166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:40 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:38 -0700 (PDT)
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
X-Inumbo-ID: e80b69f7-3f76-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696539; x=1721301339; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC0NczTz0Vex9AArMEqFVcwewes4uJlfc6tJ7aYcqpE=;
        b=Qwip5gJKIFj5a7PCdx2YUUyuphZttosFqHo8Oq8w3jYuqh3hOS0NDdpgJQpenqtRFw
         D+6wn8H5T4i++F9s2ddXaC4dy0EijbBzsn/6yJ6D18Vga70ADHjBSHJcuOEPNQP6eTzu
         l+YHHvXal1suty3DfqhVbOaP/a4OjE+5PiEDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696539; x=1721301339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC0NczTz0Vex9AArMEqFVcwewes4uJlfc6tJ7aYcqpE=;
        b=YWBddFxmx/gRaCi1JFEf8hy+D/lD6QWzgmChSp0Mc5JVT4q2MN1sQHK2JM2ESEukvs
         u42vhsPiIbvANKWdgJv1tX/qK17F8sOgStmqBsqxjD3L88DcwI7lqLEeRMIMowGGEb9n
         /1ZySENz3ePul7vnLPHEXJoS4RWkMN/77kaTg+9P4+NMsLvfOW03qxPExIV5FNyB7ejf
         9B6X/i0tKwAIjYeKVAWalYP8c8tFv4sDPLfvzQwO169BXUJmw0llR5D4hIlEIC5QtO+j
         7+kjOtkO/KJs0nnDuJ7geVVCPE6xkSrOcW88vRmh9URowSrwwXE4A1g9UAd+ick1Ro/g
         4+EQ==
X-Gm-Message-State: AOJu0Yzl6lEfZ2FtIoHzNBlK7p346NweODaXPF4M9YO6NXwZfDgddirq
	efF645hjmn51rJd4902dAegKL3xY1G/K1HoGSrDHC8qQdjdiUXw0x0sQVEjczhEATwEBUVk/Oa3
	Q
X-Google-Smtp-Source: AGHT+IGzueVYQrd+84hpYvuyG/HPwMgW2Wl89zcTITEe9G0q0UUak58I4GmnP+NOvk9hpoUxDiq4RQ==
X-Received: by 2002:a17:906:a848:b0:a77:e2e3:355f with SMTP id a640c23a62f3a-a780b7051f2mr465011966b.41.1720696539578;
        Thu, 11 Jul 2024 04:15:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 12/12] CI: Refresh and upgrade the GCC-IBT container
Date: Thu, 11 Jul 2024 12:15:17 +0100
Message-Id: <20240711111517.3064810-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade from Debian buster to bookworm, GCC 11.3 to 11.4 and to be a non-root
container.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 ...ockerfile => 12-x86_64-gcc-ibt.dockerfile} | 81 +++++++++++--------
 automation/gitlab-ci/build.yaml               |  4 +-
 automation/scripts/containerize               |  2 +-
 3 files changed, 49 insertions(+), 38 deletions(-)
 rename automation/build/debian/{buster-gcc-ibt.dockerfile => 12-x86_64-gcc-ibt.dockerfile} (50%)

diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/12-x86_64-gcc-ibt.dockerfile
similarity index 50%
rename from automation/build/debian/buster-gcc-ibt.dockerfile
rename to automation/build/debian/12-x86_64-gcc-ibt.dockerfile
index ed9367aafbec..3ce60e7d9466 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/12-x86_64-gcc-ibt.dockerfile
@@ -1,28 +1,33 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:buster-slim AS builder
+FROM --platform=linux/amd64 debian:bookworm-slim AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
 
-RUN apt-get update && \
-    apt-get --quiet --yes --no-install-recommends install \
-        bison \
-        build-essential \
-        ca-certificates \
-        flex \
-        g++-multilib \
-        libc6-dev-i386 \
-        libgmp-dev \
-        libisl-dev \
-        libmpc-dev \
-        libmpfr-dev \
-        patch \
+RUN <<EOF
+#!/bin/bash
+    set -e
+    apt-get -y update
+
+    DEPS=(
+        bison
+        build-essential
+        ca-certificates
+        flex
+        g++-multilib
+        libc6-dev-i386
+        libgmp-dev
+        libisl-dev
+        libmpc-dev
+        libmpfr-dev
+        patch
         wget
+    )
 
-RUN mkdir /build
-WORKDIR /build
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
 
-RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.xz -O - | tar xJ --strip=1
+RUN wget -q https://ftp.gnu.org/gnu/gcc/gcc-11.4.0/gcc-11.4.0.tar.xz -O - | tar xJ --strip=1
 RUN wget -q https://xenbits.xen.org/people/andrewcoop/gcc-11.2-Add-fcf-check-attribute-yes-no.patch -O - | patch -p1
 RUN ./configure \
         --prefix=/opt/gcc-11-ibt \
@@ -42,29 +47,35 @@ RUN ./configure \
 RUN make -j`nproc` && make -j`nproc` install
 
 
-FROM --platform=linux/amd64 debian:buster-slim
+FROM --platform=linux/amd64 debian:bookworm-slim
 COPY --from=builder /opt/gcc-11-ibt /opt/gcc-11-ibt
 
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
 ENV PATH="/opt/gcc-11-ibt/bin:${PATH}"
 
-RUN mkdir /build
-WORKDIR /build
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
 
-RUN apt-get update && \
-    apt-get --quiet --yes --no-install-recommends install \
-        bison \
-        build-essential \
-        checkpolicy \
-        flex \
-        gawk \
-        make \
-        python3-minimal \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+    apt-get -y update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        python3-minimal
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 4b9d80cc5632..b4139414bc8e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -541,10 +541,10 @@ centos-7-gcc-debug:
   variables:
     CONTAINER: centos:7
 
-debian-buster-gcc-ibt:
+debian-12-x86_64-gcc-ibt:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:buster-gcc-ibt
+    CONTAINER: debian:12-x86_64-gcc-ibt
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG: |
       CONFIG_XEN_IBT=y
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 6dbf55c8f89a..4d5669c5ad01 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -34,7 +34,7 @@ case "_${CONTAINER}" in
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
-    _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
+    _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
     _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
-- 
2.39.2



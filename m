Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FF9BEE2C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830945.1246076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft2-0000tF-Oj; Wed, 06 Nov 2024 13:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830945.1246076; Wed, 06 Nov 2024 13:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ft2-0000l5-Jv; Wed, 06 Nov 2024 13:15:52 +0000
Received: by outflank-mailman (input) for mailman id 830945;
 Wed, 06 Nov 2024 13:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8ft1-0000Zv-L5
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:15:51 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6ef5a1-9c3f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:13:24 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c941623a5aso1557787a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:07:48 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:25 -0800 (PST)
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
X-Inumbo-ID: ca6ef5a1-9c3f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhNmVmNWExLTljM2YtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk4OTA4LjExNjE2Nywic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730898325; x=1731503125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYRtBXHtmMvAiHP0ZMkvKUBKJ4wJh4GIX8aEfCSEVfs=;
        b=iIb5vJMsQu7OXrYkPhL6fGYhQx5GRBIzsK26f9HeB5F0n7myYvdeZR4cWGAi0x3vLG
         cGeUEVcOT/CkSG2dsLVnhLeNPszQp91MX8uIKKQlX5VU4owg7rDXUMvBpIe7a1YaOp9i
         FryP5E6liflgBbAV5bqj9OR1y68OqFKN3+0lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730898325; x=1731503125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYRtBXHtmMvAiHP0ZMkvKUBKJ4wJh4GIX8aEfCSEVfs=;
        b=cr1nVcTD7NlePOnx5+vtH0GAgCM6vO756kDoSGLL1R9WJ2jvkg1Zqe2Alw2gn9tpZP
         tRGCvhy5B+C1IKk1m5k/3FsRlYwoWDV1ewUpsOKzO6PhEweq1Nc3XTKWgPgDk9OyEEUD
         Kskov8AD2U8Fa/xDrcL295wzQfPqW9/twbaUZlN6DMFecKnNzuTb5JmMmO1bhyvfPjwv
         HMecqmsLtlv6IsaOwOZU1e+3QdoH2WHs+veLmwcOYkvwPaS3OnZVld5G1z4HMHaf5xpk
         hPpTpFG2XRnKZ3KlCXlcTfqINSLcOQD2RZw46eIFilLprHfSptCsnE/pGqqWf6rzA2jH
         qNNg==
X-Gm-Message-State: AOJu0YxFR4rdFMp/Q/ssVGXYGyJ3Q1JzIsfcFXnAXCy0lOmYDJ+HhCk7
	mjMjnSGt7HqqS63nTSq4Rd1ntSQB2BJcbDC6KEvkwtqbmc2EXDTdfd+VOaPuxdxKVpkKTQt9G87
	lI/k=
X-Google-Smtp-Source: AGHT+IHC79vPV0iv5YoF1GyY6qEaluGz1BR00EHejTbobHaPynygyuJW4BnXPK14tPmiRf2U37Lm5A==
X-Received: by 2002:a05:6402:2684:b0:5c9:85e8:ec8c with SMTP id 4fb4d7f45d1cf-5cef550779cmr3077911a12.6.1730898325515;
        Wed, 06 Nov 2024 05:05:25 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 5/6] CI: Refresh the Debian 12 cppcheck container
Date: Wed,  6 Nov 2024 13:05:06 +0000
Message-ID: <f1045ca6fffee47fea8380424ae432d152c79b46.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to build and run cppcheck as a normal user.  User
heredocs for readability and use apt-get --no-install-recommends to
keep the size down.

Changed the libpcre3-dev dependency to libpcre3, as the -dev package
is only needed for building, not for running.

With the cleanups, the size of the container is reduced from 882MB to
782MB.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 .../debian/12-arm64v8-cppcheck.dockerfile     | 79 +++++++++++++++++++
 .../build/debian/bookworm-cppcheck.dockerfile | 54 -------------
 automation/gitlab-ci/build.yaml               | 12 +--
 automation/scripts/containerize               |  2 +-
 4 files changed, 86 insertions(+), 61 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-cppcheck.dockerfile
 delete mode 100644 automation/build/debian/bookworm-cppcheck.dockerfile

diff --git a/automation/build/debian/12-arm64v8-cppcheck.dockerfile b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
new file mode 100644
index 000000000000..21c006e74f2e
--- /dev/null
+++ b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
@@ -0,0 +1,79 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm AS builder
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CPPCHECK_VERSION=2.7
+
+# dependencies for cppcheck build
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    apt-get update
+    DEPS=(
+        build-essential
+        ca-certificates
+        curl
+        libpcre3-dev
+        python-is-python3
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+RUN useradd --home /build --create-home user
+
+WORKDIR /build
+USER user
+
+# cppcheck release build (see cppcheck readme.md)
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    curl -fsSL https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz | tar xvz
+    cd cppcheck-"$CPPCHECK_VERSION"
+
+    MAKE_OPTS=(
+        MATCHCOMPILER=yes
+        DESTDIR=/build/out
+        FILESDIR="/usr/share/cppcheck"
+        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
+    )
+    make install -j$(nproc) "${MAKE_OPTS[@]}"
+EOF
+
+FROM --platform=linux/arm64/v8 debian:bookworm
+COPY --from=builder /build/out/usr/bin/cppcheck /usr/bin/cppcheck
+COPY --from=builder /build/out/usr/share/cppcheck /usr/share/cppcheck
+
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# dependencies for cppcheck analysis including Xen-only build/cross-build
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+    DEPS=(
+        bison
+        build-essential
+        python-is-python3
+        libpcre3
+        flex
+        gcc-arm-linux-gnueabihf
+        gcc-x86-64-linux-gnu
+    )
+    apt-get --yes --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
deleted file mode 100644
index fe4cd4a1aaab..000000000000
--- a/automation/build/debian/bookworm-cppcheck.dockerfile
+++ /dev/null
@@ -1,54 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm AS builder
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV CPPCHECK_VERSION=2.7
-ENV USER root
-
-# dependencies for cppcheck build
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        curl \
-        build-essential \
-        python-is-python3 \
-        libpcre3-dev
-
-RUN mkdir /build
-WORKDIR /build
-
-# cppcheck release build (see cppcheck readme.md)
-RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
-    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
-    cd cppcheck-"$CPPCHECK_VERSION" && \
-    make install -j$(nproc) \
-        MATCHCOMPILER=yes \
-        FILESDIR=/usr/share/cppcheck \
-        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
-
-FROM --platform=linux/arm64/v8 debian:bookworm
-COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
-COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
-
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# dependencies for cppcheck analysis including Xen-only build/cross-build
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        python-is-python3 \
-        libpcre3-dev \
-        flex \
-        bison \
-        gcc-arm-linux-gnueabihf \
-        gcc-x86-64-linux-gnu \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3f87187443e2..57b013334b6c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -492,26 +492,26 @@ yocto-qemux86-64:
 
 # Cppcheck analysis jobs
 
-debian-bookworm-gcc-cppcheck:
+debian-12-x86_64-gcc-cppcheck:
   extends: .gcc-x86-64-cross-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-cppcheck:
+debian-12-arm32-gcc-cppcheck:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm64-cppcheck:
+debian-12-arm64-gcc-cppcheck:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index c9988bfe927d..e5502c81a759 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -38,7 +38,7 @@ case "_${CONTAINER}" in
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:12-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
-    _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
+    _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
-- 
2.45.2



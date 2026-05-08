Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDSWOLlV/mlTpQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C04FBEBF
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304252.1577355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl1-0005Ra-EV; Fri, 08 May 2026 21:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304252.1577355; Fri, 08 May 2026 21:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl1-0005Pm-Ah; Fri, 08 May 2026 21:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1304252;
 Fri, 08 May 2026 21:29:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLSkz-0004wH-4R
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSky-008Ead-GQ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe559a-2eae-0a2a0a5409dd-0a2a450196e8-8
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:12 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a8-c1f2-0a2a45010019-d155dd34ed8c-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:12 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so1746613f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778275752; x=1778880552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxdUfwcXb8ISQulfHsZ5+IBQxfYeU+5dzOWpCcoWqBo=;
        b=svfHOJtyRIt6foUhLLrmGzGMUWf7nLYydc6CJd3M2mBAlpVLSejt+xuCPekxhUhbfU
         sIbtHpmuxzn2TnnlTCpd84YXziOptC9Ip5oz3ZQUC0y3Wtmv+m3D921clGi6GNtwH28K
         bTkx3/nvreo7cqenRc5ISN/Q/2Z/l+e3a45AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275752; x=1778880552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxdUfwcXb8ISQulfHsZ5+IBQxfYeU+5dzOWpCcoWqBo=;
        b=RX4nrYuz05udJdGFfWbVBYKIfKWY5GTxMFCD6U/2x12YA4vTt8aLrCBavy1zC1xVpy
         4TOaUBCTMWutTXT4a7yM8zQAsCbmHgsDfK2ZITmGOMm5w5lz0n+wmYCvQauL2AuGqQbi
         Tv0PKS56KI9UJJNSqt/CLoWsNq+lVPNW830LNAqyxL4UWmCq/nQVZuFEtplJlFsQ8+JU
         ybBkt4rW6zh5F19kWNsO7hVtKFgkv67iQosH++kLjrPccZVxnWba0nw5GjmlVZCQhIua
         J1erBXgDG+ne3JNoCJmcbDURM7W/VkG6zKLZZQCYi4YGkhcnmj91QCC+JSv2B05pX/2A
         3x8Q==
X-Gm-Message-State: AOJu0YxqDW8B3NgMoEFU8SV6KlJ8JGxBh3L8t38sor26NiyFwuw1bFw7
	5qburdkioqsESKvb177z2NwYJLx3wU0dqsMSdl1KST5X144SaP+I8EpakYh/NhGBsEo1klQJYbU
	KYmua/mY=
X-Gm-Gg: Acq92OHYFnHkhjLCC16vyUBVUyphuNPwyxGvwSQpwwUDDSi6T9J+5Zc2O1ITwily+n2
	ItdWZ4QwGnWcTMQ3A07zRTswrxejqLznRouU4DXSAVArDWNFfIsnLgx7/S0FqGyQVYZBk5lhIFr
	15Q78vXMI9pA1+5F8pQRUHZrfgEvZNvKlcKcMGOlLfVXQTH9JLkSBZWxg3zH6TCdn14UIIF0vBd
	4BP7PDddxvKxlx2AmSCRJozP9MNGe118+//eoyFT4fsNwnLY17HrNnnRJMi0310zLHA7Oc8CTMl
	vYIbaezD7MInqbsz4B3NeM98WAkUBqh840avtsfxNZbFMtIXB4EpbhikQv9Cl/pkuy1XVqVGW6W
	L7bsyGse1XwSqgaxOOtsorzT0/HcMAXszfznGXiB7VtJnMSB+Jw2OKALCT/BXi23wLbkTu7zlMD
	hZ/7NKER3+G4u+kDmp9ZOLJbzapAz5rT/+o8myyq2xhOcKpvSCWxRB6QVJSk1tdFDKrnhlW5+nf
	bX0
X-Received: by 2002:a5d:5683:0:b0:452:a5c3:3e4a with SMTP id ffacd0b85a97d-452a5c33e5amr11336261f8f.2.1778275751316;
        Fri, 08 May 2026 14:29:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 3/5] CI: Refresh the Debian 12 arm64 container
Date: Fri,  8 May 2026 22:29:05 +0100
Message-Id: <20260508212907.1643761-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778275752-B7754FF4-8CED085D/10/63158204843
X-purgate-type: spam
X-purgate-size: 7184
X-Rspamd-Queue-Id: 977C04FBEBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,xenproject.org:email];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Javi Merino <javi.merino@cloud.com>

Rework the container to user heredocs for readability, derive from
bookworm-slim and use apt-get --no-install-recommends to keep the size down.

Additionally:

 * Make it a non-root container.
 * Drop libext2fs-dev which is an x86-only dependency.
 * Add libncurses5-dev for xentop and zlib1g-dev which was missing from the
   libxenguest decompressors.
 * As there's no ninja, the container can no loger build QEMU so drop
   libglib2.0-dev and libpixman-1-dev too.
 * Swap libyajl-dev for libjson-c-dev given the latters deprecation.

Rename the job to debian-12-arm64-* to follow the naming scheme of all the
other CI jobs.

This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

Depends on "[PATCH] tools/libxl: Fix libxl_nocpuid.c build with json-c"
submitted separately.
---
 automation/build/debian/12-arm64v8.dockerfile | 69 +++++++++++++++++++
 .../build/debian/bookworm-arm64v8.dockerfile  | 55 ---------------
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/containerize               |  2 +-
 5 files changed, 76 insertions(+), 62 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8.dockerfile

diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
new file mode 100644
index 000000000000..c0e08a010f6a
--- /dev/null
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -0,0 +1,69 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+
+        # Tools (general)
+        ca-certificates
+        cpio
+        git-core
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        liblzma-dev
+        liblzo2-dev
+        libzstd-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        libfdt-dev
+        libjson-c-dev
+        uuid-dev
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Golang bindings
+        golang-go
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # for test phase, qemu-* jobs
+        busybox-static
+        curl
+        device-tree-compiler
+        expect
+        file
+        ovmf
+        u-boot-qemu
+        u-boot-tools
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
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
index d027f26a6d6b..e50ff6936c5c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -413,15 +413,15 @@ debian-12-arm32-gcc-debug-mpu:
 
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
index e1d6bb505674..982fd86db079 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -37,7 +37,7 @@
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
     LOGFILE: qemu-smoke-arm64.log
   artifacts:
     paths:
@@ -50,7 +50,7 @@
 .qemu-arm32:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm-arm64v8
+    CONTAINER: debian:12-arm64v8
     LOGFILE: qemu-smoke-arm32.log
   artifacts:
     paths:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index ef3b97b65578..bda06054ebde 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -39,7 +39,7 @@ case "_${CONTAINER}" in
     _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32) CONTAINER="${BASE}/debian:12-arm64v8-arm32" ;;
-    _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
+    _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
-- 
2.39.5



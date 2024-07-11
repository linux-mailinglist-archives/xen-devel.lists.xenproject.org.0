Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DC92E5C0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757326.1166199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlr-0000Rm-SB; Thu, 11 Jul 2024 11:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757326.1166199; Thu, 11 Jul 2024 11:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlr-0000Pq-OE; Thu, 11 Jul 2024 11:15:31 +0000
Received: by outflank-mailman (input) for mailman id 757326;
 Thu, 11 Jul 2024 11:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlp-0007rD-Ro
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e144a14b-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so2725407a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:26 -0700 (PDT)
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
X-Inumbo-ID: e144a14b-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696528; x=1721301328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Zc7WCDax6tOV1wBSJ+65HBId20FDc5PP86u+0cBhQ=;
        b=hlM3SNv1corJSqJObHoUI2/dIMSUU6Nwb3sYLNxRYMcM6Wce4mJdS7p95oQsCCYirV
         fgTbewrpwiW/hVTR1KFYeJeEOSQJC89BlzE9Wb422cpfdM3GWy+pNtk/r+JyhTeDfRva
         5Qcl5AYPxxJiGldYZyusEGdSQRVTd8Q+gefJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696528; x=1721301328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Zc7WCDax6tOV1wBSJ+65HBId20FDc5PP86u+0cBhQ=;
        b=kaMcxrVkX4YQRPbOP3JA1m8rwI4csb0g3wZ5Dxv4P9u3N3yz5utkBhkub4OzS+89Gh
         Wa/V+FlimE8/xCopMz2aPFN8wbEsPvsjrXy+FRQSEUkT20st32GHrWSkd3Ah39uAWTvu
         6wt7lEQY1aDKVYVrqeMyFA80JR0YyTlIYJNNP1ObSXUctt6kOxqOSGyiprDlSj4cXbpy
         Fe344YHPyZsPv7NaGuwlP0W8Qpt2xSLZRIKMoNPmbphXFWALsSHAlWt/GN/I541nIUgP
         q1Sa8RxBpvDL5L7Xhzm0a314ualgh5K7LSH4m052KfJ5/pxL+xJlg7LRMwss3PJDGEWX
         BVjQ==
X-Gm-Message-State: AOJu0YxJoHhF0ddzA9TCEAkDp6qytW3+GEjUBw3lUanXDOhhLdKxvvAN
	7Arp7Y2bwm9zyt8Cfpltjmi63COVEMYdNE53Fpmbb/VQ6+zDSlnWqGv3eT0S76IefJvpHOLjoIP
	g
X-Google-Smtp-Source: AGHT+IHmgObZliaurhNFDctglm8aZEzzMupYYWiqFWt/5Sx/Dyv7ihYOfDkLMbusTKLGclFlNFUCgQ==
X-Received: by 2002:a17:906:308d:b0:a6f:2835:be95 with SMTP id a640c23a62f3a-a79921e4f59mr80147766b.37.1720696527778;
        Thu, 11 Jul 2024 04:15:27 -0700 (PDT)
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
Subject: [PATCH 04/12] CI: Drop Debian Stretch testing
Date: Thu, 11 Jul 2024 12:15:09 +0100
Message-Id: <20240711111517.3064810-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debian stretch is also End of Life.  Update a couple of test steps to use
bookworm instead.

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
 .../build/debian/stretch-i386.dockerfile      | 57 ------------------
 automation/build/debian/stretch.dockerfile    | 60 -------------------
 automation/gitlab-ci/build.yaml               | 34 +----------
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/containerize               |  2 -
 5 files changed, 4 insertions(+), 153 deletions(-)
 delete mode 100644 automation/build/debian/stretch-i386.dockerfile
 delete mode 100644 automation/build/debian/stretch.dockerfile

diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
deleted file mode 100644
index 905096ab0ef1..000000000000
--- a/automation/build/debian/stretch-i386.dockerfile
+++ /dev/null
@@ -1,57 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian:stretch
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
-# replace repos in archive as release is EOL
-COPY <<"END" /etc/apt/sources.list
-deb http://archive.debian.org/debian/ stretch main contrib non-free
-deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
-deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
-END
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python-dev \
-        python3-dev \
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
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
deleted file mode 100644
index b99d229acf14..000000000000
--- a/automation/build/debian/stretch.dockerfile
+++ /dev/null
@@ -1,60 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:stretch
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# replace repos in archive as release is EOL
-COPY <<"END" /etc/apt/sources.list
-deb http://archive.debian.org/debian/ stretch main contrib non-free
-deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
-deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
-END
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python-dev \
-        python3-dev \
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
-        gnupg \
-        apt-transport-https \
-        # for test phase, qemu-smoke-* jobs
-        qemu-system-x86 \
-        # for test phase, qemu-alpine-* jobs
-        cpio \
-        busybox-static \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index da7b8885aa30..2c6eb17bef50 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -354,10 +354,10 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
 
-debian-stretch-gcc-debug:
+debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:stretch
+    CONTAINER: debian:bookworm
 
 debian-bookworm-clang-debug:
   extends: .clang-x86-64-build-debug
@@ -589,31 +589,6 @@ centos-7-gcc-debug:
   variables:
     CONTAINER: centos:7
 
-debian-stretch-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
-
-debian-stretch-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
-
 debian-buster-gcc-ibt:
   extends: .gcc-x86-64-build
   variables:
@@ -632,11 +607,6 @@ debian-bookworm-gcc:
   variables:
     CONTAINER: debian:bookworm
 
-debian-bookworm-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:bookworm
-
 debian-bookworm-gcc-randconfig:
   extends: .gcc-x86-64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 898d2adc8c5b..d50e522f9f79 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -412,7 +412,7 @@ qemu-smoke-x86-64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-stretch-gcc-debug
+    - debian-bookworm-gcc-debug
 
 qemu-smoke-x86-64-clang:
   extends: .qemu-x86-64
@@ -426,7 +426,7 @@ qemu-smoke-x86-64-gcc-pvh:
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-stretch-gcc-debug
+    - debian-bookworm-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
   extends: .qemu-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 57db42d10cb5..5140765cee98 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -32,8 +32,6 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
-    _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
-    _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
     _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
-- 
2.39.2



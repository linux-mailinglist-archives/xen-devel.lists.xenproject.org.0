Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C992E5BE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757324.1166177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlp-0008Fi-CH; Thu, 11 Jul 2024 11:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757324.1166177; Thu, 11 Jul 2024 11:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlp-00088k-4a; Thu, 11 Jul 2024 11:15:29 +0000
Received: by outflank-mailman (input) for mailman id 757324;
 Thu, 11 Jul 2024 11:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlo-0007rD-35
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e045db34-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:27 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so112808166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:25 -0700 (PDT)
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
X-Inumbo-ID: e045db34-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696526; x=1721301326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/meM4LOF0SLC51tAEKjDtfLnz5/szauziEh2ia+Hxk=;
        b=aATb1H4JT4ybYjxTIs4zH2AibqoNQRrqvSAWBrynD9P91ngi3GKIvsSuuSPcLuH7wG
         qbbyfxgvmvzZUGkGy/OeoDhcikJlj0152Qy13wxx2eFIm9KuD/1c3S8nl+b31+xs+vI5
         km8vSlN2wVZFYEtmLLfOwiwQacF2nCxE0/rE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696526; x=1721301326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/meM4LOF0SLC51tAEKjDtfLnz5/szauziEh2ia+Hxk=;
        b=rr+qHBFUy/sj+LcyiBCUtbWJc7dRmM2o2kSu8eBHeG7prdkGhJINcXybsEMDJvEtKf
         xfxV/VAOQCIjvNCd2eLAALQzM7Ih5rHjCUdUUKzyZxFSHyYDcewJReCquGX+Qm0XIrl8
         Xe+5bdUUTd+A45SO8MOcyA+02C1yA9btNXFLAoAWoIt6UIimG190Uu3CTTFTi4TcWiO9
         A1PixG39Cc+irXD+r+duFg1tGpJwdXOQYjy57zLviSR654WyFmXygP9OEuWBCMhZrjWZ
         UYH5LUBrpVVOvlqEWWEO3A0yHoWEfjvYqMEmgejQzbfE+uOLmqhEtv76gpRVe6Xd7RT5
         hYIg==
X-Gm-Message-State: AOJu0Yz2PVWvIPE4TQpZ5Sj9/1EmhRPIj2hdNQsB/7MM7O6LkLhstYfg
	SD1oCY2eookHdbjrlHg7ThcTegZhFLahfCfDSw2/JfUXcw3iDtJuHz8LLagu1GyoUtvaAnxez+2
	h
X-Google-Smtp-Source: AGHT+IHHDkvg4Tc1JebNvajW43vBdtx3XCYg8dIoey6SD94uRNl0Hcmzz+XWpyqp5Wn4XnW/oUbhnQ==
X-Received: by 2002:a17:906:2342:b0:a77:e1fb:7dec with SMTP id a640c23a62f3a-a780b6b316dmr486049266b.17.1720696525947;
        Thu, 11 Jul 2024 04:15:25 -0700 (PDT)
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
Subject: [PATCH 03/12] CI: Drop Debian Jessie dockerfiles
Date: Thu, 11 Jul 2024 12:15:08 +0100
Message-Id: <20240711111517.3064810-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These were removed from testing in Xen 4.18.

Fixes: 3817e3c1b4b8 ("automation: Remove testing on Debian Jessie")
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
 .../build/debian/jessie-i386.dockerfile       | 55 -------------------
 automation/build/debian/jessie.dockerfile     | 52 ------------------
 automation/scripts/containerize               |  2 -
 3 files changed, 109 deletions(-)
 delete mode 100644 automation/build/debian/jessie-i386.dockerfile
 delete mode 100644 automation/build/debian/jessie.dockerfile

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
deleted file mode 100644
index dfa6dae06cb8..000000000000
--- a/automation/build/debian/jessie-i386.dockerfile
+++ /dev/null
@@ -1,55 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian/eol:jessie
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
-deb http://archive.debian.org/debian/ jessie main contrib non-free
-deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
-deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
-END
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python-dev \
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
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
deleted file mode 100644
index 82dae9ec70c4..000000000000
--- a/automation/build/debian/jessie.dockerfile
+++ /dev/null
@@ -1,52 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian/eol:jessie
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
-deb http://archive.debian.org/debian/ jessie main contrib non-free
-deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
-deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
-END
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python-dev \
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
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 03bc4837350c..57db42d10cb5 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -31,8 +31,6 @@ case "_${CONTAINER}" in
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
-    _jessie) CONTAINER="${BASE}/debian:jessie" ;;
-    _jessie-i386) CONTAINER="${BASE}/debian:jessie-i386" ;;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422ED92E5C4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757327.1166204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrls-0000WI-6V; Thu, 11 Jul 2024 11:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757327.1166204; Thu, 11 Jul 2024 11:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrls-0000Rb-0p; Thu, 11 Jul 2024 11:15:32 +0000
Received: by outflank-mailman (input) for mailman id 757327;
 Thu, 11 Jul 2024 11:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlq-0007rD-LO
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d1126a-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:29 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ea7d2a039so780464e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:30 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:28 -0700 (PDT)
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
X-Inumbo-ID: e1d1126a-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696528; x=1721301328; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAHuZgHoF2exqi8oaOVtjkQF+Fln/FT2w5YgzvR4eVA=;
        b=ldznZDsntPj1nxdbH6+r65PN/8suh7prGDIZiHhi66mdVizfAnRXodhEo01o/svKBb
         yeAP4W4BVz7sGT7n2whUJQgw7H+i2Mn8KngcKxzjRhwSi2vjMlK+Bfjt9QEzW9LYkfKV
         z9M5Cok+Oea8m7yeH0sGx0+/JgthwtKNk+CAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696528; x=1721301328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAHuZgHoF2exqi8oaOVtjkQF+Fln/FT2w5YgzvR4eVA=;
        b=rLIW3pDXud8+OOta33JpigkltIrDtUQE3sAAyFBx9M+Dzx14HfDDRJC+u4Txg579A1
         V8C1vQSPxn7EcMz2dMaF+aYBL8MpbnALYEhlTHrcdRotELB4JlBuqsBDI3YXI6LTsiGX
         xM2FgEf54t6mGK0MxXa2pi1wyAqopisyYPbcuUNAe0kro79W/zo0i4MyKo74CnU7jpMS
         EhKJdSfoxzrK31AhlC405l2qn0nqKYlxVoJPQqagOgwGmxqcRGg/DOT8LhUnzu9QU9DF
         mROPAKOewsswiQvih83TPWCI7n9cXN7FQUUCTTsUYUI4dr7A8YNDBfIo6RJtukWL7Fbg
         nyTw==
X-Gm-Message-State: AOJu0Yyc3i8GGIutOjdD6ytFoBT5nWef69kMdJbibqckOc+a+G/Y0JzB
	u9TWx3HyNd70rRT8s9wvADW/KKc27at5l7pKVxyr8NznENEOwY67Dgj7uyhJQHTvgjDnp5dVnIo
	8
X-Google-Smtp-Source: AGHT+IH3eHhpMt5JixBNtCVG5d70gnp7RhzK3eL2/QC1E+fTy3wxvek4a12zgAmqccSYEchjVUdzHg==
X-Received: by 2002:a05:6512:4016:b0:52c:ce28:82c8 with SMTP id 2adb3069b0e04-52eb99d4c5dmr6580137e87.52.1720696528522;
        Thu, 11 Jul 2024 04:15:28 -0700 (PDT)
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
Subject: [PATCH 05/12] CI: Drop Ubuntu Trusty testing
Date: Thu, 11 Jul 2024 12:15:10 +0100
Message-Id: <20240711111517.3064810-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is also End of Life.

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
 automation/build/ubuntu/trusty.dockerfile | 51 -----------------------
 automation/gitlab-ci/build.yaml           | 12 ------
 automation/scripts/containerize           |  1 -
 3 files changed, 64 deletions(-)
 delete mode 100644 automation/build/ubuntu/trusty.dockerfile

diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
deleted file mode 100644
index 1cda1bbd3fea..000000000000
--- a/automation/build/ubuntu/trusty.dockerfile
+++ /dev/null
@@ -1,51 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:14.04
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
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
-# Remove expired certificate that Let's Encrypt certificates used to relie on.
-# (Not needed anymore)
-RUN sed -i 's#mozilla/DST_Root_CA_X3\.crt#!\0#' /etc/ca-certificates.conf && \
-    update-ca-certificates
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2c6eb17bef50..3e299f34f461 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -633,18 +633,6 @@ fedora-gcc-debug:
   variables:
     CONTAINER: fedora:29
 
-# Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
-
-ubuntu-trusty-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:trusty
-
-ubuntu-trusty-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:trusty
-
 ubuntu-xenial-clang:
   extends: .clang-x86-64-build
   variables:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 5140765cee98..e9ad20aa0c80 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -39,7 +39,6 @@ case "_${CONTAINER}" in
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
-    _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/suse:opensuse-tumbleweed" ;;
-- 
2.39.2



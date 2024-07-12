Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD192F922
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757877.1167029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpM-0005s7-MC; Fri, 12 Jul 2024 10:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757877.1167029; Fri, 12 Jul 2024 10:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpM-0005q9-JO; Fri, 12 Jul 2024 10:48:36 +0000
Received: by outflank-mailman (input) for mailman id 757877;
 Fri, 12 Jul 2024 10:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSDpL-0005q3-Lq
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:48:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49478e4b-403c-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 12:48:34 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58b447c5112so2591394a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 03:48:34 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc4e819bsm4445410a12.51.2024.07.12.03.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:48:32 -0700 (PDT)
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
X-Inumbo-ID: 49478e4b-403c-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720781313; x=1721386113; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Y1QM2aDjAbMbU+9PSSN+1sK9TzRRFdE1CnKXuZCwU=;
        b=TzXx48jMJngvqtaEoXO82TWDdmRcDbviyPXT90DTABeMS1ij9JV8YG8SqEVtIZYZ9/
         wJGYtr03pWSBKkP7+gH5smNPw//6qm3JILtos+Md2ht1Vhg7SccM+7KgdfbFdK0NsNqg
         N/cDztxZkqzV6RC9+pTqh4GdCY7DutEBVGPRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781313; x=1721386113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Y1QM2aDjAbMbU+9PSSN+1sK9TzRRFdE1CnKXuZCwU=;
        b=ojAItrotV8uFI8gaY9o9yckZa8Zi2DzurLH2zWoSb+4UIfk6hhIIaLQLMK3oYoJBHA
         D8TZPh3+9rGVbop+BYRkIT06yaY0jkZeBljEKIZ9DlMFr0V13NuGCVoBsZcHYumUyh0G
         LObLJYP6t6zKrDds0YADE7pgtxUYJqy2sV/zOmpLTlZZSAc6s210K8LXM88HTZgCngn/
         0g0xSAbHcJjhp+CU9yfEqRXwYo+BKmMOB81pISc/9w1OutHInlW55BaT5d2gx4wgHfXx
         nBbWGyxalkWIEHzoCVIYXxxfwtDHxrjgTtzaSajcCVfYBJTv0SgVzGOPC6FAHh3/VLeS
         lDwQ==
X-Gm-Message-State: AOJu0YypxVFL6UVFbeGN/M06HhNsJamBAD0+uGbTVKXZa8FPTARPcUS5
	hNo+Y25ISOywJUvqbkfR40zsmvCLbqV0WXfsxWbwDw/NqWsvQNACAqTGdOH9dQ3j2ldTL4AuS5q
	B
X-Google-Smtp-Source: AGHT+IFsK+GY3xofEr9bwn9DrDj8vHf0xZ7YawxDEqfYmH0MNyrIQQ1Jm0x+o4KOBZwXmjxJvpIg8Q==
X-Received: by 2002:a05:6402:2791:b0:58d:115c:f529 with SMTP id 4fb4d7f45d1cf-594ba997550mr9016601a12.7.1720781312942;
        Fri, 12 Jul 2024 03:48:32 -0700 (PDT)
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
Subject: [PATCH 15/12] CI: Refresh Ubuntu Xenial container as 16.04-x86_64
Date: Fri, 12 Jul 2024 11:48:29 +0100
Message-Id: <20240712104829.3237296-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rework the container to be non-root, use heredocs for legibility, and use use
apt-get --no-install-recommends to keep the size down.

Ubuntu Xenial has no ninja-build package, so can't build the QEMU referenced
by Xen 4.16.  Therefore, drop the dependencies too.

This saves ~500M:

  registry.gitlab.com/xen-project/xen/ubuntu    16.04-x86_64           700MB
  registry.gitlab.com/xen-project/xen/ubuntu    xenial                 1.21GB

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

Runs with the new container:

  4.16: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323548805
  4.19: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323548805
---
 .../build/ubuntu/16.04-x86_64.dockerfile      | 65 +++++++++++++++++++
 automation/build/ubuntu/xenial.dockerfile     | 46 -------------
 automation/gitlab-ci/build.yaml               | 16 ++---
 automation/scripts/containerize               |  2 +-
 4 files changed, 74 insertions(+), 55 deletions(-)
 create mode 100644 automation/build/ubuntu/16.04-x86_64.dockerfile
 delete mode 100644 automation/build/ubuntu/xenial.dockerfile

diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
new file mode 100644
index 000000000000..11e878050b83
--- /dev/null
+++ b/automation/build/ubuntu/16.04-x86_64.dockerfile
@@ -0,0 +1,65 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:16.04
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get -y update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+        python3-minimal
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        gzip
+        patch
+        perl
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        libzstd-dev
+        liblzo2-dev
+        liblzma-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # Stubdom download/extract
+        bzip2
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
deleted file mode 100644
index aa8f560286b6..000000000000
--- a/automation/build/ubuntu/xenial.dockerfile
+++ /dev/null
@@ -1,46 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:16.04
-LABEL maintainer.name="The Xen Project " \
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
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 2216392a8414..a2e6815f30b3 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -588,25 +588,25 @@ fedora-gcc-debug:
   variables:
     CONTAINER: fedora:29
 
-ubuntu-xenial-clang:
+ubuntu-16.04-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: ubuntu:16.04-x86_64
 
-ubuntu-xenial-clang-debug:
+ubuntu-16.04-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: ubuntu:16.04-x86_64
 
-ubuntu-xenial-gcc:
+ubuntu-16.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: ubuntu:16.04-x86_64
 
-ubuntu-xenial-gcc-debug:
+ubuntu-16.04-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: ubuntu:16.04-x86_64
 
 ubuntu-bionic-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 0ff53b6fe4e1..5fc41c36a27c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -52,9 +52,9 @@ case "_${CONTAINER}" in
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
-    _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
+    _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
 
     *) guess_container ;;
 esac
-- 
2.39.2



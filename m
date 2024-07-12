Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB792F925
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757881.1167059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpn-0006tl-HN; Fri, 12 Jul 2024 10:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757881.1167059; Fri, 12 Jul 2024 10:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpn-0006qI-EF; Fri, 12 Jul 2024 10:49:03 +0000
Received: by outflank-mailman (input) for mailman id 757881;
 Fri, 12 Jul 2024 10:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSDpm-00069W-25
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:49:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5895b46f-403c-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 12:49:00 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a77c080b521so235972566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 03:49:00 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a871ea8sm334048666b.193.2024.07.12.03.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:48:58 -0700 (PDT)
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
X-Inumbo-ID: 5895b46f-403c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720781339; x=1721386139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7axh6EnJqklc7K7yGfILdIpHtDv1zFetY1sm/s+FSk=;
        b=v+qlJPUTJ+vNkuDGcnkBPMD6JISn3zfUSJ1FKjDtFL2rFlB8H2Trp9fLAdrH6syIfC
         3tFp9ZM7b0OUvvd0+0U4AOoZw9HceQIloRZplMJcxWv0cFGo5Op2/LYkIucHKBVDOyQA
         RGuGYWDWNEbhvahaWB/eZgvjwWBe/HGbEY0Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781339; x=1721386139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7axh6EnJqklc7K7yGfILdIpHtDv1zFetY1sm/s+FSk=;
        b=rsCDnceKHe07v0Ejjoa/TuY2vnekLbDaIG7ra5DaEh5TKIQ1mNPE6JRY+P+MZLNMdj
         3qqXBoG6i6Wf8KUWjquGGD1rGQgSYCOQdpsEmpNZhcnPVj8GDvlQQwTOfA5g1PsrGjcJ
         URwk56zJEMYS+IYpRzjFc/zILS46/dzRtMFfdKLxxgQnhEqFUTG0Roo/nAv4RbDaPJvk
         ltB8ermXlbWBi3aNIPYkUkgZtfGm+Jy2aqKj/FgGM++aMgl+Ja3MS2aNEnOV6z+xpE/B
         +oBWR0ODhUTKnB4ttNCqQUHj424KEaay6vrwK3/9miL2Cdicc00+P5K0qqeHC6adKel2
         jzoA==
X-Gm-Message-State: AOJu0Yyd+JKuL7SWJ5lfpb/88BGK6Kf3XchBb0Y2sCRQ6F0g2Lbo/M8b
	Wgd6isRbaXsFfDcZQp+9FIglZYcuyYxHtV9uiwycGHuyqruZizhWo/NIwtzuxNPZr7OgZDsDkZK
	M
X-Google-Smtp-Source: AGHT+IEH9mI7bPeqY9CpchVq/W93icxxkJeR6Th2gPdAA3bxihFGluLeVetUxVaoPxCPEBsDpE8kNg==
X-Received: by 2002:a17:906:2bcf:b0:a6f:6803:57ef with SMTP id a640c23a62f3a-a780b6b1b8amr705674366b.27.1720781339321;
        Fri, 12 Jul 2024 03:48:59 -0700 (PDT)
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
Subject: [PATCH 17/12] CI: Refresh Ubuntu Focal container as 20.04-x86_64
Date: Fri, 12 Jul 2024 11:48:55 +0100
Message-Id: <20240712104855.3237883-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Exactly as per 18.04 (Bionic).  This saves ~500M:

  registry.gitlab.com/xen-project/xen/ubuntu    20.04-x86_64           1.06GB
  registry.gitlab.com/xen-project/xen/ubuntu    focal                  1.57GB

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

  4.16: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323548811
  4.19: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323517116
---
 .../build/ubuntu/20.04-x86_64.dockerfile      | 72 +++++++++++++++++++
 automation/build/ubuntu/focal.dockerfile      | 49 -------------
 automation/gitlab-ci/build.yaml               | 16 ++---
 automation/scripts/containerize               |  2 +-
 4 files changed, 81 insertions(+), 58 deletions(-)
 create mode 100644 automation/build/ubuntu/20.04-x86_64.dockerfile
 delete mode 100644 automation/build/ubuntu/focal.dockerfile

diff --git a/automation/build/ubuntu/20.04-x86_64.dockerfile b/automation/build/ubuntu/20.04-x86_64.dockerfile
new file mode 100644
index 000000000000..39fb297519ee
--- /dev/null
+++ b/automation/build/ubuntu/20.04-x86_64.dockerfile
@@ -0,0 +1,72 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:20.04
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
+
+        # Qemu build
+        libglib2.0-dev
+        libpixman-1-dev
+        meson
+        ninja-build
+        python3-packaging
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
deleted file mode 100644
index b49e53d185b4..000000000000
--- a/automation/build/ubuntu/focal.dockerfile
+++ /dev/null
@@ -1,49 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:20.04
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
-        libnl-3-dev \
-        ocaml-nox \
-        libfindlib-ocaml-dev \
-        # libsystemd-dev for Xen < 4.19
-        libsystemd-dev \
-        transfig \
-        pandoc \
-        checkpolicy \
-        wget \
-        git \
-        nasm \
-        # QEMU
-        ninja-build \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c6f6a1ced7dc..6a2d796959a1 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -628,25 +628,25 @@ ubuntu-18.04-x86_64-gcc-debug:
   variables:
     CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-focal-gcc:
+ubuntu-20.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:focal
+    CONTAINER: ubuntu:20.04-x86_64
 
-ubuntu-focal-gcc-debug:
+ubuntu-20.04-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:focal
+    CONTAINER: ubuntu:20.04-x86_64
 
-ubuntu-focal-clang:
+ubuntu-20.04-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: ubuntu:focal
+    CONTAINER: ubuntu:20.04-x86_64
 
-ubuntu-focal-clang-debug:
+ubuntu-20.04-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:focal
+    CONTAINER: ubuntu:20.04-x86_64
 
 opensuse-leap-15.6-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index d6132b4d22af..f27932dd4561 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -40,7 +40,6 @@ case "_${CONTAINER}" in
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
-    _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
@@ -55,6 +54,7 @@ case "_${CONTAINER}" in
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:18.04-x86_64" ;;
+    _focal)  CONTAINER="${BASE}/ubuntu:20.04-x86_64" ;;
 
     *) guess_container ;;
 esac
-- 
2.39.2



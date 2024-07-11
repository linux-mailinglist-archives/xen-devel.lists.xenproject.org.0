Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D86792F0A3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 23:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757703.1166821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0z0-0003n7-H0; Thu, 11 Jul 2024 21:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757703.1166821; Thu, 11 Jul 2024 21:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0z0-0003kI-E4; Thu, 11 Jul 2024 21:05:42 +0000
Received: by outflank-mailman (input) for mailman id 757703;
 Thu, 11 Jul 2024 21:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sS0yz-0003kC-3c
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 21:05:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53715a3d-3fc9-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 23:05:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso1619107a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 14:05:40 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc3f29d2sm3858602a12.41.2024.07.11.14.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 14:05:38 -0700 (PDT)
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
X-Inumbo-ID: 53715a3d-3fc9-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720731939; x=1721336739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIJUjPuUxWvZ2Xd5AJQXA1yC+F0y1g/OHIYvnMwTMu8=;
        b=Et4sqDPVtaDDYIjm2X4tz04ueF2JntX3LGw+QhfrWuRoz4R4x86ep8cnRvkGfuvxTJ
         beoOJiymBcTwadY+D3/J3TWxKobCg7G4cwkkaZUJ27qaa/FtxdJCbPHOa30o28B9nnzk
         h8ryXXtrIug59CMzJEEwye2tzcjF35KJVhcNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731939; x=1721336739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIJUjPuUxWvZ2Xd5AJQXA1yC+F0y1g/OHIYvnMwTMu8=;
        b=KFaHRQpR4RULpPP9ojvbmMme6wA9vR7u6quxOEuJ/dUTXkplOlXnD/AQ1CToCJSztd
         pqptHqrGSq9SiKUotDGTG+ybOY6JkygqUyPaYIi6jpzqGgzP9O937iIew++/0W6g8Ong
         qTTGyWSm+CaJbq5bO1yDwq1xLPXysEV75H9Tb30PP98eFmei8ARhb1Gv1zpX9e9YX6N+
         2rj2PZu2wBnJxT89zbYlRU1b22Z7xKPYRPIHg1DyzEEwHEZmaK5S4CTECODxP8YXsJWO
         Nn6krtCRlZu/iLh+gZW+1w11ZzZuvhsLyqeXhOyz/cBuvGf7cmQkwaG3l0wCLunXaViV
         4Mig==
X-Gm-Message-State: AOJu0Ywn4qNlTDh/PtoRRv5cWbGOAj6rAp19z+xt9cS0prbCuw7VEHtT
	3FMIXDmQH7cd+gooHBgPmpfPQB6AhcMSx00klKKlaGht68se28XlrhJ9oWhmVK4ecTwDxMhYatn
	j
X-Google-Smtp-Source: AGHT+IFWfZB2wCIe/k8b0kZ7imY/ZivkWYO0JHQ/rCmwAl2cjlOjCvwlwaEB1pHaHdZA09MTaBx43A==
X-Received: by 2002:a05:6402:430b:b0:586:6365:b3cf with SMTP id 4fb4d7f45d1cf-594baf8728amr6846038a12.10.1720731938642;
        Thu, 11 Jul 2024 14:05:38 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH 14/12] CI: Refresh OpenSUSE Leap container
Date: Thu, 11 Jul 2024 22:05:34 +0100
Message-Id: <20240711210534.3141725-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See prior patch for most discussion.

Despite appearing to a fixed release (and therefore not marked as permitted
failure), the dockerfile references the `leap` tag which is rolling in
practice.  Switch to 15.6 explicitly, for better test stability.

Vs tumbleweed, use `zypper update` rather than dist-upgrade, and retain the
RomBIOS dependencies; bin86 and dev86.

In terms of size, this saves ~700M:

  registry.gitlab.com/xen-project/xen/opensuse  leap-15.6-x86_64       1.33GB
  registry.gitlab.com/xen-project/xen/suse      opensuse-leap          2.05GB

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
CC: Olaf Hering <olaf@aepfle.de>

Runs with this new container:

 4.19:  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7322493460
 4.16:  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7322499881
---
 .../opensuse/leap-15.6-x86_64.dockerfile      | 79 +++++++++++++++++++
 .../build/suse/opensuse-leap.dockerfile       | 75 ------------------
 automation/gitlab-ci/build.yaml               | 16 ++--
 automation/scripts/containerize               |  2 +-
 4 files changed, 88 insertions(+), 84 deletions(-)
 create mode 100644 automation/build/opensuse/leap-15.6-x86_64.dockerfile
 delete mode 100644 automation/build/suse/opensuse-leap.dockerfile

diff --git a/automation/build/opensuse/leap-15.6-x86_64.dockerfile b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
new file mode 100644
index 000000000000..562006672a4e
--- /dev/null
+++ b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
@@ -0,0 +1,79 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 opensuse/leap:15.6
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV XEN_TARGET_ARCH=x86_64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    zypper refresh
+    zypper update -y --no-recommends
+
+    DEPS=(
+        # Xen
+        bison
+        checkpolicy
+        clang
+        diffutils
+        findutils
+        flex
+        gawk
+        gcc
+        make
+        python3
+
+        # Tools (general)
+        git
+        gzip
+        patch
+        perl
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-devel
+        libzstd-devel
+        lzo-devel
+        xz-devel
+        zlib-devel
+        # libacpi
+        acpica
+        # libxl
+        libuuid-devel
+        libyajl-devel
+        # RomBIOS
+        bin86
+        dev86
+        # Header Check
+        gcc-c++
+        # xentop
+        ncurses-devel
+        # Python bindings
+        python3-devel
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml
+        ocaml-findlib
+
+        # Stubdom (download/extract)
+        bzip2
+        tar
+
+        # Qemu build
+        glib2-devel
+        libpixman-1-0-devel
+        meson
+        ninja
+        python3-packaging
+    )
+
+    zypper install -y --no-recommends "${DEPS[@]}"
+    zypper clean -a
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
deleted file mode 100644
index 28d333881233..000000000000
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ /dev/null
@@ -1,75 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 opensuse/leap
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN zypper ref && zypper up -y --no-recommends
-RUN zypper install -y --no-recommends \
-        acpica \
-        bc \
-        bin86 \
-        bison \
-        bzip2 \
-        checkpolicy \
-        clang \
-        cmake \
-        dev86 \
-        diffutils \
-        discount \
-        flex \
-        gawk \
-        gcc \
-        gcc-c++ \
-        git \
-        ghostscript \
-        glib2-devel \
-        glibc-devel \
-        gzip \
-        hostname \
-        libaio-devel \
-        libbz2-devel \
-        libext2fs-devel \
-        libgnutls-devel \
-        libjpeg62-devel \
-        libnl3-devel \
-        libnuma-devel \
-        libpixman-1-0-devel \
-        libpng16-devel \
-        libssh2-devel \
-        libtasn1-devel \
-        libuuid-devel \
-        libyajl-devel \
-        lzo-devel \
-        make \
-        nasm \
-        ncurses-devel \
-        ocaml \
-        ocaml-findlib-devel \
-        ocaml-ocamlbuild \
-        ocaml-ocamldoc \
-        pandoc \
-        patch \
-        pkg-config \
-        'pkgconfig(libpci)' \
-        'pkgconfig(sdl)' \
-        'pkgconfig(sdl2)' \
-        python3-devel \
-        python3-setuptools \
-        # systemd-devel for Xen < 4.19
-        systemd-devel \
-        tar \
-        transfig \
-        valgrind-devel \
-        wget \
-        which \
-        xz-devel \
-        zlib-devel \
-        # QEMU
-        ninja \
-        && \
-        zypper clean -a
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fd6ca1270e4e..f9a9275ff293 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -645,25 +645,25 @@ ubuntu-focal-clang-debug:
   variables:
     CONTAINER: ubuntu:focal
 
-opensuse-leap-clang:
+opensuse-leap-15.6-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: suse:opensuse-leap
+    CONTAINER: opensuse:leap-15.6-x86_64
 
-opensuse-leap-clang-debug:
+opensuse-leap-15.6-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: suse:opensuse-leap
+    CONTAINER: opensuse:leap-15.6-x86_64
 
-opensuse-leap-gcc:
+opensuse-leap-15.6-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: suse:opensuse-leap
+    CONTAINER: opensuse:leap-15.6-x86_64
 
-opensuse-leap-gcc-debug:
+opensuse-leap-15.6-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: suse:opensuse-leap
+    CONTAINER: opensuse:leap-15.6-x86_64
 
 opensuse-tumbleweed-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index c4f013702122..d8110b125333 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -42,7 +42,7 @@ case "_${CONTAINER}" in
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
-    _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
+    _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
 esac
 
-- 
2.39.2



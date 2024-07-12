Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1292F974
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 13:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757911.1167092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEET-0004fc-S7; Fri, 12 Jul 2024 11:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757911.1167092; Fri, 12 Jul 2024 11:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEET-0004dt-PS; Fri, 12 Jul 2024 11:14:33 +0000
Received: by outflank-mailman (input) for mailman id 757911;
 Fri, 12 Jul 2024 11:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSEES-0004dn-QN
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 11:14:32 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ba18f6-403f-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso2588188a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 04:14:30 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bbe2c853sm4456464a12.22.2024.07.12.04.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 04:14:28 -0700 (PDT)
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
X-Inumbo-ID: e8ba18f6-403f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720782869; x=1721387669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djKuoS4i+CyD1Q73DyZ8bhhbkwLmidLR05zmMiSj8Rk=;
        b=e/VY8bUAHDcNVwA0Dj2X/X10vowXiGT5YoaGNJbLNQHuzusMkYuvuWFbqlvXmp8TMp
         /WiIE2eHA+Hl2CpqkjjWdLFl33V7QZStFlrgDoOHPGMy0YJG5wRKJW3z0gXwOOWw9WiD
         99fA19qT/8+bxBaXbHPxlUagJAwnZ58IKhBNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720782869; x=1721387669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djKuoS4i+CyD1Q73DyZ8bhhbkwLmidLR05zmMiSj8Rk=;
        b=oeJcKk+GiJATRChTD373CnZk5cs3cIPMc/agyjFIzDV3+wKub6hlONm1vxj1Ezsyzt
         iBKTre6lfWDY3P53xGVyVybPyghqSg5TSPxOAzascTrnBfP9Jbr/Q+epuhvnmWJbPiWD
         ZCUgOB7E1C1bk6rf3sRCFU+xb2dKffu8KJPbw+hRtbbFKKPsGVreWvChSlzSKcqiOYdJ
         voAyCB3ZDhBePsidQCRWg7whrnD5dvsLnuipxTJlKpMlDt1ViAsJw73cL3vEoakCbbXN
         2yKeLyNJHQLvjvvMdsNgzk2dvKBGUDv1vyseClYpECmGGDQizLswcHaZDv2HY9V+Kw9r
         StTQ==
X-Gm-Message-State: AOJu0Yy0gXp7rNL6RlybLzPCMFskI/XgFYyPtJ+2WMG9P4Kl04gdzqik
	KWujF7HoT861KqNJZOBaBEb0WTR7SUUUHjwcmlbIJQfy0+1ZmU4m0/FzfBE11DZ6anCdYNQBgpV
	s
X-Google-Smtp-Source: AGHT+IEwl4DqVYtimYToZ8u9sKOxzyOWMhoqIoWS7ybbnPnWWqcg3AUBB35cr8VS/gVIKGTdXXe9Cg==
X-Received: by 2002:a05:6402:5256:b0:58d:eca:b9bf with SMTP id 4fb4d7f45d1cf-594bcab156emr7901761a12.37.1720782869530;
        Fri, 12 Jul 2024 04:14:29 -0700 (PDT)
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
Subject: [PATCH v2 13/12] CI: Refresh OpenSUSE Tumbleweed container
Date: Fri, 12 Jul 2024 12:14:26 +0100
Message-Id: <20240712111426.3244115-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711202337.3128473-1-andrew.cooper3@citrix.com>
References: <20240711202337.3128473-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Existing as suse:opensuse-tumbleweed is a historical quirk, and adjusted for
consistency with all the other containers.

Make it non-root, use heredocs for legibility, and use the zypper long names
for the benefit of those wondering what was being referenced or duplicated.

Trim the dependencies substantially.  Testing docs isn't very interesting and
saves a lot of space.  Other savings come from removing a huge pile of
optional QEMU dependencies (QEMU just needs to build the Xen parts to be
useful here, not have a full GUI environment).

Finally, there where some packages such as bc, libssh2-devel, libtasn1-devel
and nasm that I'm not aware of any reason to have had, even historically.

This shaves 1G off the size of the container:

  registry.gitlab.com/xen-project/xen/opensuse  tumbleweed-x86_64      1.39GB
  registry.gitlab.com/xen-project/xen/suse      opensuse-tumbleweed    2.35GB

Furthermore, identify which components of the build use which dependencies,
which will help managing them in the future.

Thanks to Olaf Hering for dependency fixes that have been subsumed into this
total overhaul.

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

This includes both of Olaf's recent changes, python3-packaging (now required
for a rebuilt container), and findutils (not required yet; still gets pulled
in transitively), but added for good measure.

In terms of package delta, newly included are:

  findutils            # As suggested
  ocaml-findlib        # Replaces ocaml-findlib-devel
  perl                 # Transitive previously
  python3              # Transitive previously
  python3-packaging    # As suggested

while removed are:

  bc                   # ?
  cmake                # vtpm stubdom, optional
  discount             # docs
  ghostscript          # docs
  glibc-devel          # Not really optional, given a toolchain
  hostname             # Optional, not interesting
  libaio-devel         # Xen < 4.13, perhaps Qemu still but optional
  libext2fs-devel      # Libfsimage, off by default, optional
  libgnutls-devel      # Qemu ?
  libjpeg62-devel      # Qemu ?
  libnl3-devel         # Libxl COLO(?), option
  libnuma-devel        # ?
  libpng16-devel       # Qemu ?
  libssh2-devel        # ?
  libtasn1-devel       # ?
  nasm                 # ?
  ocaml-findlib-devel  # Swapped for non-devel
  ocaml-ocamlbuild     # ?
  ocaml-ocamldoc       # ?
  pandoc               # docs
  'pkgconfig(libpci)'  # Qemu
  'pkgconfig(sdl)'     # Qemu
  'pkgconfig(sdl2)'    # Qemu
  systemd-devel        # Xen < 4.19, optional
  transfig             # docs
  valgrind-devel       # really only for developers
  which                # Xen < 4.17

I've tested this on staging-4.17 and staging, both of which build fine.
staging-4.16 does not, because of SeaBIOS which we've decided not to fix,
hence it's safe to drop `which`.

v2:
 * git -> git-core
 * Use 'pkgconfig()' references
---
 .../opensuse/tumbleweed-x86_64.dockerfile     | 76 +++++++++++++++++++
 .../build/suse/opensuse-tumbleweed.dockerfile | 74 ------------------
 automation/gitlab-ci/build.yaml               |  8 +-
 automation/scripts/containerize               |  2 +-
 4 files changed, 81 insertions(+), 79 deletions(-)
 create mode 100644 automation/build/opensuse/tumbleweed-x86_64.dockerfile
 delete mode 100644 automation/build/suse/opensuse-tumbleweed.dockerfile

diff --git a/automation/build/opensuse/tumbleweed-x86_64.dockerfile b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
new file mode 100644
index 000000000000..61e840fc67da
--- /dev/null
+++ b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
@@ -0,0 +1,76 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 opensuse/tumbleweed
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
+    zypper dist-upgrade -y --no-recommends
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
+        git-core
+        gzip
+        patch
+        perl
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        'pkgconfig(bzip2)'
+        'pkgconfig(libzstd)'
+        'pkgconfig(lzo2)'
+        'pkgconfig(liblzma)'
+        'pkgconfig(zlib)'
+        # libacpi
+        acpica
+        # libxl
+        'pkgconfig(uuid)'
+        'pkgconfig(yajl)'
+        # Header Check
+        gcc-c++
+        # xentop
+        'pkgconfig(ncurses)'
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
+        meson
+        ninja
+        'pkgconfig(glib-2.0)'
+        'pkgconfig(pixman-1)'
+        python3-packaging
+    )
+
+    zypper install -y --no-recommends "${DEPS[@]}"
+    zypper clean -a
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
deleted file mode 100644
index 077fed22260c..000000000000
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ /dev/null
@@ -1,74 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 opensuse/tumbleweed
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN zypper ref && zypper dup -y --no-recommends
-RUN zypper install -y --no-recommends \
-        acpica \
-        bc \
-        bison \
-        bzip2 \
-        checkpolicy \
-        clang \
-        cmake \
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
-        libzstd-devel \
-        lzo-devel \
-        make \
-        meson \
-        nasm \
-        ncurses-devel \
-        ninja \
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
-        && \
-        zypper clean -a
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index b4139414bc8e..fd6ca1270e4e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -668,25 +668,25 @@ opensuse-leap-gcc-debug:
 opensuse-tumbleweed-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: suse:opensuse-tumbleweed
+    CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: suse:opensuse-tumbleweed
+    CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: suse:opensuse-tumbleweed
+    CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 opensuse-tumbleweed-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: suse:opensuse-tumbleweed
+    CONTAINER: opensuse:tumbleweed-x86_64
   allow_failure: true
 
 # PowerPC builds (x86 cross)
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 4d5669c5ad01..c4f013702122 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -43,7 +43,7 @@ case "_${CONTAINER}" in
     _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
-    _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/suse:opensuse-tumbleweed" ;;
+    _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
 esac
 
 # Use this variable to control whether root should be used
-- 
2.39.2



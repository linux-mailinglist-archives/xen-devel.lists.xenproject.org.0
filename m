Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAA92F044
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 22:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757684.1166791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0KS-0005tm-QF; Thu, 11 Jul 2024 20:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757684.1166791; Thu, 11 Jul 2024 20:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS0KS-0005rT-Mj; Thu, 11 Jul 2024 20:23:48 +0000
Received: by outflank-mailman (input) for mailman id 757684;
 Thu, 11 Jul 2024 20:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sS0KQ-0005rN-Ko
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 20:23:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 774a605c-3fc3-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 22:23:42 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77d9217e6fso176226866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 13:23:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6dfb19sm284302966b.66.2024.07.11.13.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 13:23:40 -0700 (PDT)
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
X-Inumbo-ID: 774a605c-3fc3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720729421; x=1721334221; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpVMbtAPh/d/2PPbAwt7r6y7YPmwonQerNDnIDQpg6I=;
        b=N7+fOPIYefy1KC59GTFPIKgk0ZYX5vae+kY8LsynKgqmuXBt01Whv9ZOix8k8KezGU
         B5EnMDoZsmr159vNRXPEfyXglinojjmIbPJLpTq9lcEWU4o1kq5wgrX7RaWDyaT257ab
         JbFyAYTjb8I/Rgls+3vLPWgZtu5bmZPexWisM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720729421; x=1721334221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpVMbtAPh/d/2PPbAwt7r6y7YPmwonQerNDnIDQpg6I=;
        b=A0IMk1WPLvj6dNw5mTC7+cPOjP0dR6SUFZOK8Azo6zMrH3CzvM8lIfEjktn3CBVpRd
         o+rBWm4y76g9MelibTVF8GybGbp0MW/QNHpqZ3087u4PuxSIRndeXivr+mWIgZslf7ll
         0xKJ+yGnBJiVFgdJVh35z0OAemsNxyrHmEMUxokx2X14YOLgPZUGq2ESShVujYGgtrjo
         jwHTy9187qwp4InLCduf9PmwM42F8LvrIANDqoDwFT/QCgWsnEn9bIp6MJ5gBSMZ3BQz
         QeLsv17PEtjiMDublN66qecbNTXLDLkJHPa9dfuFwxFGkKBvPFMEFSopwf99F6dtRpo9
         8ZZw==
X-Gm-Message-State: AOJu0Yw9ZaYVtP4dxc1Ia/lLNBcEtMducTN55aQpeMTSHtO516bTJJNZ
	4d/yHp7ykgBwGibLzOjQ/OuVPS5aQTgCRw/GFyUjbyI2xkedmIuKkTrSrLMh03wnn4OWr3ffH4O
	h
X-Google-Smtp-Source: AGHT+IH88DM9Q4+KiHpA5R5Wpx11Z3bFn+wtvU/J/FuiR8zygZ3LCnYQIX0arYYtaqDGyqaKVcS8ug==
X-Received: by 2002:a17:906:39d6:b0:a72:9963:eb8e with SMTP id a640c23a62f3a-a780b6b307emr492899766b.28.1720729421544;
        Thu, 11 Jul 2024 13:23:41 -0700 (PDT)
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
Subject: [PATCH 13/12] CI: Refresh OpenSUSE Tumbleweed container
Date: Thu, 11 Jul 2024 21:23:37 +0100
Message-Id: <20240711202337.3128473-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Existing as suse:opensuse-tumbleweed is a historical quirk, and adjusted for
consistency with all the other containers.

Make it non-root, use heredocs for legibility, and use the zypper long names
for the benefit of those wondering what was being referenced or duplicated.

Trim the dependencies substantially.  Testing docs isn't very interesting and
saves a lot of space (pandoc pulls in all of Haskel).  Other savings come from
removing a huge pile of optional QEMU dependencies (QEMU just needs to build
the Xen parts to be useful here, not have a full GUI environment).

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
index 000000000000..8c5ff56cdc88
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



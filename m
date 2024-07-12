Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E783D92FAC6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 14:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758001.1167193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFoP-0000sV-AO; Fri, 12 Jul 2024 12:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758001.1167193; Fri, 12 Jul 2024 12:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFoP-0000qz-5d; Fri, 12 Jul 2024 12:55:45 +0000
Received: by outflank-mailman (input) for mailman id 758001;
 Fri, 12 Jul 2024 12:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSFoN-0000qt-FL
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 12:55:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bd52841-404e-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 14:55:42 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso239578866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 05:55:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a855193sm349832366b.172.2024.07.12.05.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 05:55:40 -0700 (PDT)
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
X-Inumbo-ID: 0bd52841-404e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720788941; x=1721393741; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNg/pOWAjPqRM+SUpsJY9U+grPwjqxOTySirChTWDxo=;
        b=IvHssD8eJHZvJJzz1wkvL+4fEd7WLgYRtSdMIxCcoyEJ85i/yZWUa9O3/MCzWWSCda
         hVs7731yuZD5WxEjEzteEN2+X3Eo44SNGMv8jCVfod85b9uKyKavG2LksxIX8VFMG7bh
         SDg6c39et0ChL4i0LpT3yjFXDM7K6nH5Ln/b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720788941; x=1721393741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNg/pOWAjPqRM+SUpsJY9U+grPwjqxOTySirChTWDxo=;
        b=ZyzTmJ14EcYD9/UGZwIsY3Kb4XCLeUTh928P/NGrW8Wc7OJagKIMR/6MNsUbRCLZlm
         MBwjxBy3aJ1ok1+65TDhTTSA8CfTgAaEJ7rP20XR766Io2xPfgOnPVF/zVo3b9knXoll
         XK4SKD+V74xSeaVMvjWfuoowWE7x93ChiIrkNkJA+ozUmOGt4tI8OY7sJ5YVcbCfNeL4
         2LAVIeMmO3VCF9ZuNqkWaqPzqkLGuckGWlw0nvl/Yl7B8c85rEj9eeX7IbeNAi3BOOas
         z1EH4INSleCkFeEByQQe1W763HbpF46i3G4tfI+xBgdc6q1PbQGwJE/XaUtL+NkU+X+T
         qBoA==
X-Gm-Message-State: AOJu0YyVxQvjYgtQ+oslhXvSH+Vx0cYbkEVpbyqHFzieeSCr40vHcb9V
	Eji8ofmLiZEQcN+rwQ7DsI2WfPd3iW3BGM9bFMIvPVfoNJ/hdwR0D1nRjOZxmO7vN5f4gHyIuHK
	v
X-Google-Smtp-Source: AGHT+IGTmiOUrwbQXNV4l1btu+bK5omn9YMr5FRznikwCZf+TBGYsiMs2gkF+EMfS8ZLOmVQcP8L8w==
X-Received: by 2002:a17:907:94cd:b0:a72:5470:1d6a with SMTP id a640c23a62f3a-a780b6fe30emr1009842066b.35.1720788941313;
        Fri, 12 Jul 2024 05:55:41 -0700 (PDT)
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
Subject: [PATCH v2 14/12] CI: Refresh OpenSUSE Leap container
Date: Fri, 12 Jul 2024 13:55:38 +0100
Message-Id: <20240712125538.3246947-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711210534.3141725-1-andrew.cooper3@citrix.com>
References: <20240711210534.3141725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See prior patch for most discussion.

Despite appearing to be a fixed release (and therefore not marked as permitted
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

v2:
 * git -> git-core
 * Use 'pkgconfig()' references
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
index 000000000000..ea70dffe2afc
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
+        # RomBIOS
+        bin86
+        dev86
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



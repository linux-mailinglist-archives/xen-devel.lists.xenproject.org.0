Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57829A2870
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820764.1234385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TF6-0005m8-Cy; Thu, 17 Oct 2024 16:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820764.1234385; Thu, 17 Oct 2024 16:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TF6-0005iz-9O; Thu, 17 Oct 2024 16:20:52 +0000
Received: by outflank-mailman (input) for mailman id 820764;
 Thu, 17 Oct 2024 16:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFta=RN=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t1TF4-0004vC-VW
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:20:50 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c60e79b9-8ca3-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 18:20:50 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c94b0b466cso1325224a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 09:20:50 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d77995esm2922739a12.65.2024.10.17.09.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:20:49 -0700 (PDT)
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
X-Inumbo-ID: c60e79b9-8ca3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729182049; x=1729786849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NoEGn1hLziPO1/kdmCT0M4Dt8mYyVB2krAxxwVj8SM=;
        b=EwkQ7dF0Ra18CstDcH3SOD439eNk2KSF3nAmejQfmPfZT6mKavd6rTw1uutKCQhgvz
         sfFq9iUm65QoqBOtnawsfIQlsJmE5dH+C2nc7tovw0pVEBXS88qNNFRa1isKjMn+7KnG
         MKkXfRiB29Zcef1mjigHkrph0YhCfpBc0q8D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182049; x=1729786849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NoEGn1hLziPO1/kdmCT0M4Dt8mYyVB2krAxxwVj8SM=;
        b=AQEBuPzR0hFxCJJrCRLx3jFwZFZ8rlgqqzFNhUQnSAUvkSw3kR0VDQQqnR4g1Y421Y
         avlgXlktLkqn/MSPyq0zh3pavDOvF0c6UFaG3Kk0Hfa2iXeHNy7E0B11TvcLYodV1+wd
         eBlo8qdGvdJk4XJRmCHRPReZIcI3etcfySlw7FPD/WdNV1q9UwZP2lpu6On+wyH2dAPc
         3UeI5k5Sj3UBbK+r+Wc/WlKD3v9meXvu6Jut3uYbbZQ1qy//Dh4lyfBH02fQtvMhg9y2
         dz9/3rCGSz7P6MouGeU8ZZplrkkz7fix+1qkxCYVDfD6toBN8He8YAMuiruM457HPSOi
         60HA==
X-Gm-Message-State: AOJu0YxHMp1RfEO6FjeNGHTxvsexoBgy24WCp+9Do+fX5NGyadC6qLxe
	pKXecAVDsOdR36fEUQWFOnDO7Zc6D9uuQvQLVf541MtREigtkOf4HqMq/jKKI1yk7FbmP9WBeo7
	wR64=
X-Google-Smtp-Source: AGHT+IFGc7GgRD5h3sh2qNHDcYbgjl/dkczgYrtKSi/fyrZqFFzkBmjqow0LUsh8aWmasQh1ziOdFg==
X-Received: by 2002:a05:6402:210a:b0:5c9:4d96:891 with SMTP id 4fb4d7f45d1cf-5c9950e0fd7mr5738796a12.18.1729182049619;
        Thu, 17 Oct 2024 09:20:49 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: [XEN PATCH v1 3/3] CI: Refresh and upgrade the Fedora container
Date: Thu, 17 Oct 2024 17:20:21 +0100
Message-ID: <178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1729170005.git.javi.merino@cloud.com>
References: <cover.1729170005.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

Fedora 29 is long out of date.  Move forward 5 years to Fedora 40.

Include all the usual improvements.  Rework the container to be non-root, use
heredocs for legibility, and switch to the new naming scheme.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/fedora/29.dockerfile        | 46 ------------
 automation/build/fedora/40-x86_64.dockerfile | 77 ++++++++++++++++++++
 automation/gitlab-ci/build.yaml              |  8 +-
 automation/scripts/containerize              |  2 +-
 4 files changed, 82 insertions(+), 51 deletions(-)
 delete mode 100644 automation/build/fedora/29.dockerfile
 create mode 100644 automation/build/fedora/40-x86_64.dockerfile

diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
deleted file mode 100644
index d5f017ac723d..000000000000
--- a/automation/build/fedora/29.dockerfile
+++ /dev/null
@@ -1,46 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 fedora:29
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-# install Xen depends
-RUN dnf -y install \
-        clang \
-        gcc \
-        gcc-c++ \
-        ncurses-devel \
-        zlib-devel \
-        python-devel \
-        python3-devel \
-        libuuid-devel \
-        pkgconfig \
-        flex \
-        bison \
-        libaio-devel \
-        glib2-devel \
-        yajl-devel \
-        pixman-devel \
-        glibc-devel \
-        make \
-        binutils \
-        git \
-        wget \
-        acpica-tools \
-        python-markdown \
-        patch \
-        checkpolicy \
-        dev86 \
-        xz-devel \
-        bzip2 \
-        nasm \
-        ocaml \
-        ocaml-findlib \
-        golang \
-        # QEMU
-        ninja-build \
-    && dnf clean all && \
-    rm -rf /var/cache/dnf
-
-RUN useradd --create-home user
-USER user
-WORKDIR /build
diff --git a/automation/build/fedora/40-x86_64.dockerfile b/automation/build/fedora/40-x86_64.dockerfile
new file mode 100644
index 000000000000..7d4d4cc2ac0a
--- /dev/null
+++ b/automation/build/fedora/40-x86_64.dockerfile
@@ -0,0 +1,77 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 fedora:40
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN <<EOF
+    set -e
+
+    useradd --create-home user
+
+    dnf -y update
+
+    DEPS=(
+        # Xen
+        binutils
+        gcc
+        make
+        python3
+        # Kconfig
+        bison
+        flex
+        # Flask
+        checkpolicy
+
+        # Tools (general)
+        git-core
+        gzip
+        patch
+        perl-interpreter
+        perl-File-Find
+        pkgconfig
+        wget
+        # libxenguest dombuilder
+        bzip2-devel
+        libzstd-devel
+        lzo-devel
+        xz-devel
+        zlib-devel
+        # libacpi
+        acpica-tools
+        # libxl
+        libuuid-devel
+        yajl-devel
+        # xen-foreign
+        diffutils
+        # RomBIOS
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
+        # Golang bindings
+        golang
+
+        # Stubdom download/extract
+        bzip2
+
+        # Qemu build
+        glib2-devel
+        pixman-devel
+        ninja-build
+    )
+
+    dnf -y --setopt=install_weak_deps=False install "${DEPS[@]}"
+
+    dnf clean all
+    rm -rf /var/cache/dnf
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c2db69ecf86c..09dd9e6ccbd0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -579,15 +579,15 @@ debian-bookworm-32-gcc-debug:
   variables:
     CONTAINER: debian:bookworm-i386
 
-fedora-gcc:
+fedora-40-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:40-x86_64
 
-fedora-gcc-debug:
+fedora-40-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:40-x86_64
 
 ubuntu-16.04-x86_64-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 7607b78f7666..6ac02c42d124 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -28,7 +28,7 @@ case "_${CONTAINER}" in
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
-    _fedora) CONTAINER="${BASE}/fedora:29";;
+    _fedora) CONTAINER="${BASE}/fedora:40-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
-- 
2.46.1



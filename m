Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3859306E2
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 20:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758521.1167996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShCI-0007dL-AW; Sat, 13 Jul 2024 18:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758521.1167996; Sat, 13 Jul 2024 18:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShCI-0007bG-7w; Sat, 13 Jul 2024 18:10:14 +0000
Received: by outflank-mailman (input) for mailman id 758521;
 Sat, 13 Jul 2024 18:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBzr=ON=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sShCH-0007ZN-0f
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 18:10:13 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24d45d7e-4143-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 20:10:10 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58b966b4166so3531798a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jul 2024 11:10:10 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b268a276bsm1032999a12.62.2024.07.13.11.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:10:09 -0700 (PDT)
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
X-Inumbo-ID: 24d45d7e-4143-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720894209; x=1721499009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6fAtMIT94yky8pHVJDXIYIarNbDIr23fg32SpVsiVQ=;
        b=pjW4oomp240l+7xIT7bnhVouXAHDc8+XDoVV5M6rRO+yYalpZ51+nlunaYfgG+medy
         A4KBFSyJuhQSAj5vg1tVPwY5zKIvMNgy38K278BTgC2jeVhUNj1w+x+0DZG3hbQs157a
         jAwFCWkJSRGCTaktRNAugG+139FVUThRc6S+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894209; x=1721499009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6fAtMIT94yky8pHVJDXIYIarNbDIr23fg32SpVsiVQ=;
        b=dvpyAjyf/XE3GZs4jSIE33x9h8QJ38Uw1IXL7qoDgvEBPPWLkObxRrzSucbV0Wo1sP
         FBxEurMTAjDn3yJ8mR1EjvVHfdazDMeJEXhoVitEw8C3H78aho//snDQyOkQ9P3c7QsG
         pDUYq6AB6QqJr4VQKPA08NfrX3QCN/PR58WCfUqPbDKItmqd7t1uFl6oppVgl3P/OlR2
         L/fCyDp2bLmHJhvRlBGuDdqo1phqXIB8fjurEq8ieo3fXplWaow45t2Yw2ZZOM8QMfHj
         niUYF0Rdx1fZApfekWP0eoRxpsiUbxiPD5U/idZeqmUsUnlfxS6JDxnuRZoIW3R+PxqD
         1ZaQ==
X-Gm-Message-State: AOJu0YwISa6GDxEu3RWbLsQsR79teWyVqfToWrbYobFo1xU90e8VplPM
	CPCzoWQKIKzDQrq9F/ujzcuQf22WZj6fSIwDVFYenXx5QTSSBxRR5NlU7TeikhItW64z2zKb8mO
	0
X-Google-Smtp-Source: AGHT+IGgXWdmRLGxrgbJMVxd6DutUs1bIDmd+1li+pW6atF+0sWhL7/H9Dw7FkksNRzzjdVAb4AeCQ==
X-Received: by 2002:a50:ee85:0:b0:57d:619:7721 with SMTP id 4fb4d7f45d1cf-594bb5807c7mr8840331a12.21.1720894209550;
        Sat, 13 Jul 2024 11:10:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 21/12] CI: Refresh and upgrade the Fedora container
Date: Sat, 13 Jul 2024 19:10:05 +0100
Message-Id: <20240713181005.3363912-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fedora 29 is long out of date.  Move forward 5 years to Fedora 39.

Inlcude all the usual improvements.  Rework the container to be non-root, use
heredocs for legibility, and switch to the new naming scheme.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I know Fedora 40 the latest release, but it suffers from the same stubdom
failure as Archlinux currently does.  Fedora 39 builds fine.

Fedora is (correctly) blocking, so adding 40 would be bad move at this point
in the 4.19 release.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1372042761 is a
run with both 39 and 40, showing the failure.
---
 automation/build/fedora/29.dockerfile        | 46 ------------
 automation/build/fedora/39-x86_64.dockerfile | 74 ++++++++++++++++++++
 automation/gitlab-ci/build.yaml              |  8 +--
 3 files changed, 78 insertions(+), 50 deletions(-)
 delete mode 100644 automation/build/fedora/29.dockerfile
 create mode 100644 automation/build/fedora/39-x86_64.dockerfile

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
diff --git a/automation/build/fedora/39-x86_64.dockerfile b/automation/build/fedora/39-x86_64.dockerfile
new file mode 100644
index 000000000000..e2048a437581
--- /dev/null
+++ b/automation/build/fedora/39-x86_64.dockerfile
@@ -0,0 +1,74 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 fedora:39
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
+    dnf -y install "${DEPS[@]}"
+
+    dnf clean all
+    rm -rf /var/cache/dnf
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 7ce88d38e7c7..3d35871d64f5 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -575,15 +575,15 @@ debian-bookworm-32-gcc-debug:
   variables:
     CONTAINER: debian:bookworm-i386
 
-fedora-gcc:
+fedora-39-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:39-x86_64
 
-fedora-gcc-debug:
+fedora-39-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: fedora:29
+    CONTAINER: fedora:39-x86_64
 
 ubuntu-16.04-x86_64-clang:
   extends: .clang-x86-64-build
-- 
2.39.2



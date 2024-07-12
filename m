Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0292F923
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757878.1167040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpb-0006C5-UO; Fri, 12 Jul 2024 10:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757878.1167040; Fri, 12 Jul 2024 10:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpb-00069j-RG; Fri, 12 Jul 2024 10:48:51 +0000
Received: by outflank-mailman (input) for mailman id 757878;
 Fri, 12 Jul 2024 10:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSDpb-00069W-4J
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:48:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51fe03b8-403c-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 12:48:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77e7a6cfa7so237708266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 03:48:49 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bd010sm336551666b.18.2024.07.12.03.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:48:47 -0700 (PDT)
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
X-Inumbo-ID: 51fe03b8-403c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720781328; x=1721386128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZsyhlKpPKwJu0K89EuDjhZnuB3yQi1RNCGVeTYU+Wk=;
        b=fgcQi2ph05D19wLseN4UGtkoN3Qb1NIKZPlFO0scVa+0y3x6MvjXo43/k6HcQCsxni
         WzUi8K0GgmtG4dTGk140HbJqGJYxdYpqfLQE73ukI30KVdwMq7seGXvzDPwfG/qounE+
         dsKSNWbyfeppY+BEJkQSkSRl3QqrJNtXNGIxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781328; x=1721386128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZsyhlKpPKwJu0K89EuDjhZnuB3yQi1RNCGVeTYU+Wk=;
        b=K3gjQyFGgmcqy+83f6XxeASx+jN2h6s9v82JLb7+MzAi1nV1rzt3MomOXnhsg1o5hQ
         8JNFuG84Wja7Pcsvlrv0v8vDpvALxdj/Krb6bxWrbToGdp+eBWKjr7z0lQ1KFF943/D/
         Fs5hkXACO3FqOgEgBQ+/PSpTPVomylcyia0/K1gkKNA6K3wE7VwTXgGn4lnG/iwg8BiN
         vJv2yXy/aRTdMpkG/msAo4HE7VqjNWs+GBGQrwRc1l3GLvZxrqaq1nhzsZGeLSwx/+Tz
         jBVToV+fBKb5UOgXB9vAGzAJJ9nBuJoKp+qJA/oW2UUcDq6AuS9YKJj6rQ1niCG3Vyun
         gYIQ==
X-Gm-Message-State: AOJu0YxLxnN+PTtxopl6g3S52GiXZfJmj5lO7um17SH8uj6N5HMX1bBu
	LiORJOqD7iyWrXkK5DSKzgpHLvleKh/9sZkF2PJCUoHpJ9QxCFBpDEGV4dQLPM1OF2FKgRHcCdz
	R
X-Google-Smtp-Source: AGHT+IE84WOvQj/BbutiRZNfCyOMp5XwqX7/KWYvuUB7Z1IRk7FsrRzQ6AHXAkvFvcVHfEOY1VPtPA==
X-Received: by 2002:a17:906:c110:b0:a72:b055:3de0 with SMTP id a640c23a62f3a-a780b68a358mr973345566b.6.1720781328144;
        Fri, 12 Jul 2024 03:48:48 -0700 (PDT)
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
Subject: [PATCH 16/12] CI: Refresh Ubuntu Bionic container as 18.04-x86_64
Date: Fri, 12 Jul 2024 11:48:42 +0100
Message-Id: <20240712104842.3237603-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As with 16.04 (Focal), except that ninja-build is available so QEMU can be
built.

This halves the size of the container:

  registry.gitlab.com/xen-project/xen/ubuntu    18.04-x86_64           860MB
  registry.gitlab.com/xen-project/xen/ubuntu    bionic                 1.44GB

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

  4.16: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323548809
  4.19: https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7323516970
---
 .../build/ubuntu/18.04-x86_64.dockerfile      | 72 +++++++++++++++++++
 automation/build/ubuntu/bionic.dockerfile     | 48 -------------
 automation/gitlab-ci/build.yaml               | 16 ++---
 automation/scripts/containerize               |  2 +-
 4 files changed, 81 insertions(+), 57 deletions(-)
 create mode 100644 automation/build/ubuntu/18.04-x86_64.dockerfile
 delete mode 100644 automation/build/ubuntu/bionic.dockerfile

diff --git a/automation/build/ubuntu/18.04-x86_64.dockerfile b/automation/build/ubuntu/18.04-x86_64.dockerfile
new file mode 100644
index 000000000000..24047e8f6ab2
--- /dev/null
+++ b/automation/build/ubuntu/18.04-x86_64.dockerfile
@@ -0,0 +1,72 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:18.04
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
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
deleted file mode 100644
index c1effc725e17..000000000000
--- a/automation/build/ubuntu/bionic.dockerfile
+++ /dev/null
@@ -1,48 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:18.04
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
-        # QEMU
-        ninja-build \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a2e6815f30b3..c6f6a1ced7dc 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -608,25 +608,25 @@ ubuntu-16.04-x86_64-gcc-debug:
   variables:
     CONTAINER: ubuntu:16.04-x86_64
 
-ubuntu-bionic-clang:
+ubuntu-18.04-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-bionic-clang-debug:
+ubuntu-18.04-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-bionic-gcc:
+ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-bionic-gcc-debug:
+ubuntu-18.04-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: ubuntu:18.04-x86_64
 
 ubuntu-focal-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 5fc41c36a27c..d6132b4d22af 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -51,10 +51,10 @@ case "_${CONTAINER}" in
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
-    _bionic) CONTAINER="${BASE}/ubuntu:bionic" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
+    _bionic) CONTAINER="${BASE}/ubuntu:18.04-x86_64" ;;
 
     *) guess_container ;;
 esac
-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F313D92F926
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757883.1167069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpy-0007Pw-P9; Fri, 12 Jul 2024 10:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757883.1167069; Fri, 12 Jul 2024 10:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDpy-0007NH-M7; Fri, 12 Jul 2024 10:49:14 +0000
Received: by outflank-mailman (input) for mailman id 757883;
 Fri, 12 Jul 2024 10:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSDpw-0007Cp-Fc
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:49:12 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6a0121-403c-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 12:49:11 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5957040e32aso1175131a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 03:49:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc4e8255sm4410296a12.48.2024.07.12.03.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:49:10 -0700 (PDT)
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
X-Inumbo-ID: 5f6a0121-403c-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720781351; x=1721386151; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUJT2BIdasxYaH8JNljHtksephXciRwgCfX1hQqsIME=;
        b=DndSfh7EThB2TIJPRP1vJwjWbN47zsnhOGpF3OuMsrt5kMe57zyi6ASVo8PMX7IFH7
         JDYS9YJqCQNwKE3cmKqpNejGE7AwfluLz/UFeeHmbOI/Lu3eAjbZyre/++fQXYuVQ8ve
         OW+AwRnsDp60MzGJp/NQclYRxlCjs4cXq8LCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781351; x=1721386151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUJT2BIdasxYaH8JNljHtksephXciRwgCfX1hQqsIME=;
        b=IWY2el9oqNTs3Ck3UEOvoWrXCjDXJYko1X/3ek0JH2V1nCoiZm3PgLZU0F7FrQ2kBF
         dpd1PJwZGDrtBC+cpT7VhYaGkxfQgHSNAo2HnorWPI9MuARTwu/HYQe0IvohThbUyBl2
         Up/LGTU/J0eeJwnPHCri7W9D7M4buqbIcvY1vGAi+gUwzwwamCGCVg6wJORGHc0uZJfu
         PkIp23sjH1h0tFmrxIDy+LfyfCazzHhCOhOCXZuPd41LBTsN2vy+qiTDwPbDe4UkM9tf
         LERQPEnsW/o+OmGJXTgu8Ps8Rfu3yuquT8fsVT8XKMfSk/uS+a8dTAp6u2ZGrdmxDlum
         A+Wg==
X-Gm-Message-State: AOJu0YyKscxuiEZsJUxAmwexlFPq/AAJtvKlWOZv21Tbn9+YPcH7/Q+Q
	Ls7hlNAxnI/V12Y7bF7twM5fHVJWi03OYzVNq95W7uBXVoGcOuQFeQmdxPXnKnDe4JFbMIvE2RQ
	p
X-Google-Smtp-Source: AGHT+IH0NzEy0QCq3yDjqDKTMnR6Dpc6m6QnBWJwcFrqDQtiImhLCTRfhnkGKZihr5Uw3FeOhB29CA==
X-Received: by 2002:aa7:ce1a:0:b0:57c:5f77:1136 with SMTP id 4fb4d7f45d1cf-594bb7745f7mr8979626a12.24.1720781350720;
        Fri, 12 Jul 2024 03:49:10 -0700 (PDT)
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
Subject: [PATCH 18/12] CI: Add Ubuntu 22.04 (Jammy) and 24.04 (Noble) testing
Date: Fri, 12 Jul 2024 11:49:07 +0100
Message-Id: <20240712104907.3238026-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The containers are exactly as per 20.04 (Focal).  However, this now brings us
to 5 releases * 4 build jobs worth of Ubuntu testing, which is overkill.

The oldest and newest toolchains are the most likely to find problems with new
code, so reduce the middle 3 releases (18/20/22) to just a single smoke test
each.

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

Pipeline run showing all Ubuntu testing on staging:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1371106799

There are 11 jobs in total.
---
 .../build/ubuntu/22.04-x86_64.dockerfile      | 72 +++++++++++++++++++
 .../build/ubuntu/24.04-x86_64.dockerfile      | 72 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 39 +++++-----
 automation/scripts/containerize               |  2 +
 4 files changed, 163 insertions(+), 22 deletions(-)
 create mode 100644 automation/build/ubuntu/22.04-x86_64.dockerfile
 create mode 100644 automation/build/ubuntu/24.04-x86_64.dockerfile

diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
new file mode 100644
index 000000000000..230903f624d9
--- /dev/null
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -0,0 +1,72 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:22.04
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
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
new file mode 100644
index 000000000000..277f92facfd9
--- /dev/null
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -0,0 +1,72 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:24.04
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
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6a2d796959a1..379cf17d65cc 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -608,45 +608,40 @@ ubuntu-16.04-x86_64-gcc-debug:
   variables:
     CONTAINER: ubuntu:16.04-x86_64
 
-ubuntu-18.04-x86_64-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:18.04-x86_64
-
-ubuntu-18.04-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:18.04-x86_64
-
 ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-18.04-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:18.04-x86_64
-
 ubuntu-20.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: ubuntu:20.04-x86_64
 
-ubuntu-20.04-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+ubuntu-22.04-x86_64-gcc:
+  extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:20.04-x86_64
+    CONTAINER: ubuntu:22.04-x86_64
 
-ubuntu-20.04-x86_64-clang:
+ubuntu-24.04-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: ubuntu:20.04-x86_64
+    CONTAINER: ubuntu:24.04-x86_64
 
-ubuntu-20.04-x86_64-clang-debug:
+ubuntu-24.04-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:20.04-x86_64
+    CONTAINER: ubuntu:24.04-x86_64
+
+ubuntu-24.04-x86_64-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:24.04-x86_64
+
+ubuntu-24.04-x86_64-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:24.04-x86_64
 
 opensuse-leap-15.6-clang:
   extends: .clang-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index f27932dd4561..9844133aff63 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -55,6 +55,8 @@ case "_${CONTAINER}" in
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:18.04-x86_64" ;;
     _focal)  CONTAINER="${BASE}/ubuntu:20.04-x86_64" ;;
+    _jammy)  CONTAINER="${BASE}/ubuntu:22.04-x86_64" ;;
+    _noble)  CONTAINER="${BASE}/ubuntu:24.04-x86_64" ;;
 
     *) guess_container ;;
 esac

base-commit: d46e4264c3fa68974fbb9b1bce514ea44af6d945
prerequisite-patch-id: b6875ad0bbd279067fdef31b9adf67e2a5abdf8a
prerequisite-patch-id: 5d4a01a02e7694939cdbf620a2e7509fee49dd92
prerequisite-patch-id: 65ecea93b1a320219deb8670264c3d464e00384e
prerequisite-patch-id: eb7042acce82d2bc324f8560fed3ffd57025d248
prerequisite-patch-id: 91c6663df2cfa139497e2d8b4dc17f1697f0c9f6
prerequisite-patch-id: 84c3345d580461986a3a9560735279baff21234f
prerequisite-patch-id: 5d732fc5f039fb25f7177279f63019f59acae4b1
prerequisite-patch-id: dd5006da276abc0e4da1ecb2c84d699c5bd98124
prerequisite-patch-id: 7e816655cd1066b42be5fa57a832c777c9867fc9
prerequisite-patch-id: fc25cefbee4cb69703df5c1f5b3eb317f03952af
prerequisite-patch-id: 531b3db898f54c05bff5fbcb69e0f7f62811c744
prerequisite-patch-id: ddb51b78aeaa2a6efe8035c39a128810c01aa822
prerequisite-patch-id: b4894b8120682429e1a74369c6b36bbbdc09d749
prerequisite-patch-id: c002530cb86a08b38980779a3d06cf491fdb9fae
-- 
2.39.2



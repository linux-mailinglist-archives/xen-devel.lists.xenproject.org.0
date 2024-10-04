Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F57990A23
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 19:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810570.1223273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swm5T-0004l1-4G; Fri, 04 Oct 2024 17:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810570.1223273; Fri, 04 Oct 2024 17:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swm5T-0004hq-1J; Fri, 04 Oct 2024 17:27:31 +0000
Received: by outflank-mailman (input) for mailman id 810570;
 Fri, 04 Oct 2024 17:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kl2=RA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swm5R-0004hk-NZ
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 17:27:29 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed2834fc-8275-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 19:27:27 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso459553166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 10:27:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e78757asm19247866b.102.2024.10.04.10.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 10:27:25 -0700 (PDT)
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
X-Inumbo-ID: ed2834fc-8275-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728062846; x=1728667646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMia6fLadbM0+a1izECrJVWuTiZx/3bI6/pE4unjXtg=;
        b=Jmd5Hac2V9THalrJY+/RvRAV3F1d0knGgvCI3n4qrFvrvCX8qyhagsvNzfbki7mLI5
         US3K5o6geN8aDaAq7SxbpBagOMwmw1jOcy2DJCvdJkO9IdOXga83ry5SWfzmKlFSmdle
         rcEISyP0uwmmivbwRmD5sOdqGn8BIqYwFcBX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728062846; x=1728667646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMia6fLadbM0+a1izECrJVWuTiZx/3bI6/pE4unjXtg=;
        b=ajb2USdpzhSz/MTfSLuhEduNfZJdT6AOMlpsa66bJSQEUlFNNKxhhglbhAdBDDpLUM
         XekDbBIY666rg4Y3sW4AqxxemY3bIg6mBcFHsypEY/E70ZL23i8KUtQPb1ZV4osUPFvm
         MUKDyy62uNfRPaRsd5EZ07SHAQI6jg59lBuaHMWbjfGbfN9HFa6u3q6KSnXfW9PZz8fU
         J/xEW8iBm/WtmbprmFT7CDuHS3Z5gxP8FXPONq3gJkOoX+IdmgraNQUp1T8xmJP3iceg
         2UHmGNUyGv6NXQQhgEIdVIoT6En0Rs5fBkYdYTRmopsOrOnpMMkTwltfKzmyelKyxTFq
         MXiQ==
X-Gm-Message-State: AOJu0Yy/HIj21aPCOrssshJJFJYnfMRzvKr+oW0FzO9Dh5u05cDRgmO0
	VaxFQLb8RrXvru/tipcpadtgDiQEdIlxJf3dhLe8sGUpbgB7IRChF6PQytDqFDsOeYpdrpTFUZx
	deelyIw==
X-Google-Smtp-Source: AGHT+IHikqEpKwaHPMeWAfsqi/jUGtTdWiiqZ+Rcuf5fzkVm7JWYpNyvPh22S+h+RaFqEtfoWj2fqQ==
X-Received: by 2002:a17:907:3e94:b0:a8d:41d8:14ad with SMTP id a640c23a62f3a-a990a23cd21mr833226066b.29.1728062846443;
        Fri, 04 Oct 2024 10:27:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] CI: Fix builds following qemu-xen update
Date: Fri,  4 Oct 2024 18:27:23 +0100
Message-Id: <20241004172723.2391026-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A recent update to qemu-xen has bumped the build requirements, with Python 3.8
being the new baseline but also needing the 'ensurepip' and 'tomllib/tomli'
packages.

 * Ubuntu/Debian package 'ensurepip' separately, but it can be obtained by
   installing the python3-venv package.

 * 'tomllib' was added to the python standard library in Python 3.11, but
   previously it was a separate package named 'tomli'.

In terms of changes required to build QEMU:

 * Ubuntu 24.04 (Noble) has Python 3.12 so only needs python3-venv

 * Ubuntu 22.04 (Jammy) has Python 3.10 but does have a python3-tomli package
   that QEMU is happy with.

 * FreeBSD has Python 3.9, but Python 3.11 is available.

In terms of exclusions:

 * Ubuntu 20.04 (Focal) has Python 3.8, but lacks any kind of tomli package.

 * Fedora 29 (Python 3.7), OpenSUSE Leap 15.6 (Python 3.6), and Ubuntu
   18.04/Bionic (Python 3.6) are now too old.

Detecting tomllib/tomli is more than can fit in build's oneliner, so break it
out into a proper script.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Using local container fixes:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1482180312

FreeBSD (13,14):
  https://cirrus-ci.com/build/5553798175784960

FreeBSD 15 is broken generally again so I can't confirm the fix there.
---
 .cirrus.yml                                   |  3 ++-
 .../build/ubuntu/22.04-x86_64.dockerfile      |  2 ++
 .../build/ubuntu/24.04-x86_64.dockerfile      |  1 +
 automation/scripts/build                      |  4 ++--
 automation/scripts/qemu-deps-check.py         | 19 +++++++++++++++++++
 5 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100755 automation/scripts/qemu-deps-check.py

diff --git a/.cirrus.yml b/.cirrus.yml
index 1c2a6cb8120e..00e4c57678c2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -7,10 +7,11 @@ freebsd_template: &FREEBSD_TEMPLATE
   install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf python bison perl5
                                  yajl lzo2 pixman argp-standalone
-                                 libxml2 glib git
+                                 libxml2 glib git python311
 
   build_script:
     - cc --version
+    - export PYTHON=/usr/local/bin/python3.11
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
index 230903f624d9..6aa3c4d1881d 100644
--- a/automation/build/ubuntu/22.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -62,6 +62,8 @@ RUN <<EOF
         meson
         ninja-build
         python3-packaging
+        python3-tomli
+        python3-venv
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
index 277f92facfd9..c46d152abf10 100644
--- a/automation/build/ubuntu/24.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -62,6 +62,7 @@ RUN <<EOF
         meson
         ninja-build
         python3-packaging
+        python3-venv
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
diff --git a/automation/scripts/build b/automation/scripts/build
index 1879c1db6d0d..34416297a4b7 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -91,9 +91,9 @@ else
         cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
     fi
 
-    # Qemu requires Python 3.5 or later, and ninja
+    # Qemu requires Python 3.8 or later, and ninja
     # and Clang 10 or later
-    if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
+    if ! type python3 || ! python3 automation/scripts/qemu-deps-check.py \
             || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
             || ! type ninja; then
         cfgargs+=("--with-system-qemu=/bin/false")
diff --git a/automation/scripts/qemu-deps-check.py b/automation/scripts/qemu-deps-check.py
new file mode 100755
index 000000000000..f6188afb3e2a
--- /dev/null
+++ b/automation/scripts/qemu-deps-check.py
@@ -0,0 +1,19 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+import sys
+
+if sys.version_info < (3, 8):
+    print("Python %d.%d.%d too old" %
+          (sys.version_info.major,
+           sys.version_info.minor,
+           sys.version_info.micro))
+    exit(1)
+
+try:
+    import tomllib
+except ImportError:
+    try:
+        import tomli
+    except ImportError:
+        print("No tomli")
+        exit(1)
-- 
2.39.5



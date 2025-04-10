Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E556EA84F3D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946383.1344302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaY-0008Qh-3T; Thu, 10 Apr 2025 21:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946383.1344302; Thu, 10 Apr 2025 21:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaX-0008OQ-Sk; Thu, 10 Apr 2025 21:37:33 +0000
Received: by outflank-mailman (input) for mailman id 946383;
 Thu, 10 Apr 2025 21:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zaW-0008Ll-Kz
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:37:32 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 014a5587-1654-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 23:37:30 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so918158f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:37:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm100427f8f.50.2025.04.10.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:37:29 -0700 (PDT)
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
X-Inumbo-ID: 014a5587-1654-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321049; x=1744925849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2OaDotK41umOfviUF7yzwa9T5+3+M0L5HXJtNxyImc=;
        b=JrHY9+U5xL4pu6u594H5EYi3nz5Qc7KgskW5cRuI+ck+s+XVusw7WEUlZ3HjHcCJab
         M9dwx5lkhES0NreQgU3xNLFGADguD4QHbFxFadiqpPZuvuBNC4bSleXEu0NvgdQEvhR5
         tX97ZOqStpllLvLwYtujIPoYL5+IVzuma0NNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321049; x=1744925849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2OaDotK41umOfviUF7yzwa9T5+3+M0L5HXJtNxyImc=;
        b=Sd+NviK+7HHWNYRviBQILK1+460oXF/zXKJH1kYZo5hg7wevbBAwiJSM9yaZd4yGKj
         /yzqgojHlG4jC7T8UAj4Cn/8EcMPBuuIAxLgb9F8Ko6xcbEj1kqznr3QB9nKckD9rNjd
         oAtyNOEL+N6vFva1N25z6GAWohe4nM1QMFSXNoNwY1Bj4uT+/sKZ7lY5sXug8nRa3ICl
         mzuVk6b0c6duFVrHtBK7zApXMNnAVBtng2EZl+mw6Ef3e04invGSoksD8j4EnF/HvfnP
         qF4jBlF8qKqlmZEJ6BliFVx61+L7KnlLBaPGKAkS96IwhtVsq60dc46v7Q6A7Frmjftu
         c5QQ==
X-Gm-Message-State: AOJu0YzWC0eWVRrCx09r8L9W7FY5zxINid/UzL+wGK65cy5mkKlzGgkj
	EYTnp4KZCLPuIc2pHnX8+H73WGv1t/tebqjYbqi3Kj4QlwuF76Mbm51d7UNh/Q1CESJUVmh6ikw
	1P1M=
X-Gm-Gg: ASbGncssj4ItsVIH97bNAj5760cvSwkdYSPCBvAgNa3YQEKdoCw7f573/+d1HtKjykD
	exi7ZcuCmqDyHOhMpxeyTn4oKejj226AHKHzaBJCht3HxylIvDFUOemPgo8xS6yW0eEA3YnWwIC
	US+Tk2fdbhZQQjrk3hwfX5BXQDuGEOvqIYosuu93XJKLT7ObumS2iYomgS/JOF5ow7npJKFez/N
	6jwZmfj5vud20mclfdxvYS+iPQSrO4oDSWC0CjWEFTctLFaanXkQUFc494bSlJrQYTWGdkzpsBX
	KvrlaWsT5ILOoQTCQ4N1ZvYtnmVtGhBCg/s/q8Pqdim1L3Hl9Srqck1Ukcyy3kDddKkP91XQVM2
	yi+Ckoo/DW0tCrNBTUwfL7/DX
X-Google-Smtp-Source: AGHT+IHeXj2OwodjCDoZRm/Aihv9FR+qeh0A5wNYoJt5fKTkBgxWEgmIyOPfWZO/cOugQ6jv+yb/oQ==
X-Received: by 2002:a05:6000:401f:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39eaaed1ebbmr163260f8f.49.1744321049617;
        Thu, 10 Apr 2025 14:37:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/4] Rename and adjust x86 containers
Date: Thu, 10 Apr 2025 22:37:21 +0100
Message-Id: <20250410213724.2098383-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Insert the Alpine version as we'll need a newer version in due course, and
rename 'rootfs' to 'base' as the container really is not a rootfs on it's own.

In base, add bash.  It's added later by the rootfs generation anyway, but this
way we can write the generation script in bash too.

In build, group and sort the packages.  Drop the ones we don't need, or are
pulled in by dependencies.  Include diffutils, findutils and gawk to avoid
warnings in the kernel build.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 .gitlab-ci.yml                                |  4 +--
 containerize                                  |  4 +--
 images/alpine/3.18-x86_64-base.dockerfile     |  6 ++++
 ...ockerfile => 3.18-x86_64-build.dockerfile} | 32 ++++++++++++-------
 images/alpine/x86_64-rootfs.dockerfile        |  4 ---
 5 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 images/alpine/3.18-x86_64-base.dockerfile
 rename images/alpine/{x86_64-build.dockerfile => 3.18-x86_64-build.dockerfile} (54%)
 delete mode 100644 images/alpine/x86_64-rootfs.dockerfile

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 670f9621e26d..fb997cc62162 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -28,7 +28,7 @@ stages:
   tags:
     - x86_64
   variables:
-    CONTAINER: alpine:x86_64-build
+    CONTAINER: alpine:3.18-x86_64-build
 
 #
 # ARM64 artifacts
@@ -62,7 +62,7 @@ x86_64-rootfs-alpine-3.18:
   script:
     - . scripts/x86_64-rootfs-alpine.sh
   variables:
-    CONTAINER: alpine:x86_64-rootfs
+    CONTAINER: alpine:3.18-x86_64-base
 
 x86_64-argo-linux-6.6.56:
   extends: .x86_64-artifacts
diff --git a/containerize b/containerize
index 7abeb119ff6a..c23f55ead737 100755
--- a/containerize
+++ b/containerize
@@ -25,8 +25,8 @@ die() {
 BASE="registry.gitlab.com/xen-project/hardware/test-artifacts"
 case "_${CONTAINER}" in
     _alpine-3.18-arm64-build) CONTAINER="${BASE}/alpine:3.18-arm64-build" ;;
-    _alpine-x86_64-rootfs) CONTAINER="${BASE}/alpine:x86_64-rootfs" ;;
-    _alpine-x86_64-build|_) CONTAINER="${BASE}/alpine:x86_64-build" ;;
+    _alpine-3.18-x86_64-base) CONTAINER="${BASE}/alpine:3.18-x86_64-base" ;;
+    _alpine-3.18-x86_64-build|_) CONTAINER="${BASE}/alpine:3.18-x86_64-build" ;;
 esac
 
 # Use this variable to control whether root should be used
diff --git a/images/alpine/3.18-x86_64-base.dockerfile b/images/alpine/3.18-x86_64-base.dockerfile
new file mode 100644
index 000000000000..a8cb274d5821
--- /dev/null
+++ b/images/alpine/3.18-x86_64-base.dockerfile
@@ -0,0 +1,6 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.18
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
diff --git a/images/alpine/x86_64-build.dockerfile b/images/alpine/3.18-x86_64-build.dockerfile
similarity index 54%
rename from images/alpine/x86_64-build.dockerfile
rename to images/alpine/3.18-x86_64-build.dockerfile
index 98969a5be1da..eac0cda4fed3 100644
--- a/images/alpine/x86_64-build.dockerfile
+++ b/images/alpine/3.18-x86_64-build.dockerfile
@@ -1,31 +1,39 @@
 # syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
 RUN apk --no-cache add bash
 
-RUN bash -ex <<EOF
+RUN <<EOF
+#!/bin/bash
+      set -eu
+
       adduser -D user --shell /bin/bash
 
-      DEPS=(
-            musl-dev
+      DEPS=(# Base environment
             build-base
-            libc6-compat
-            linux-headers
-            bash
-            git
             curl
-            flex
+            git
+
+            # Linux build deps
             bison
+            diffutils
             elfutils-dev
+            findutils
+            flex
+            gawk
+            linux-headers
+            openssl-dev
+            perl
+
+            # Argo build deps
             autoconf
             automake
             libtool
-            openssl-dev
       )
 
-      apk add --no-cache "\${DEPS[@]}"
+      apk add --no-cache "${DEPS[@]}"
 EOF
 
 USER user
diff --git a/images/alpine/x86_64-rootfs.dockerfile b/images/alpine/x86_64-rootfs.dockerfile
deleted file mode 100644
index b912e9c1600d..000000000000
--- a/images/alpine/x86_64-rootfs.dockerfile
+++ /dev/null
@@ -1,4 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA11A87D5C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949553.1346060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtv-0005Vo-SN; Mon, 14 Apr 2025 10:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949553.1346060; Mon, 14 Apr 2025 10:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtv-0005PY-Mq; Mon, 14 Apr 2025 10:18:51 +0000
Received: by outflank-mailman (input) for mailman id 949553;
 Mon, 14 Apr 2025 10:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gtu-0005Nh-OI
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:50 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dba1efe6-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:50 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso31780135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:49 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:48 -0700 (PDT)
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
X-Inumbo-ID: dba1efe6-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625929; x=1745230729; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2OaDotK41umOfviUF7yzwa9T5+3+M0L5HXJtNxyImc=;
        b=l3SWtHuRwR4uX7z3n9QP6/jG4TOBYv1Jzf/dZGl06A2GELx+R0KZfwFnLyVDamVT4x
         CaF4SCFuGa39VLkwn6xN3ZbWwf0Wpt9nRXuBZJPr1Tj4RPwS1NzyShipiqIBuBY5nre6
         AolIuFm9EubA4OcZ3H5hRdLKDvT8TahYZK3iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625929; x=1745230729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2OaDotK41umOfviUF7yzwa9T5+3+M0L5HXJtNxyImc=;
        b=KSGdtnqZwODcFc07+iNqn23UIBVlVZWRsP7Wpo1h9f5UtLCGu3BpPtiUrpiRlmy0YB
         oQklsuDPaD15qtuTUs/E4/tGojmMeeBHgOpKwpkX6ric2UOktulG7n94bK0jkoXWyvTT
         FI/bNSET1dxbcrRJCSp+rtAJCMNcBeU9C6Vx90UUfYjkWQ8VlB8Xr6higiYLcv7eJv9R
         +AYLItcaiEKpp1fSvTu307PeUt8uTLgqAOOVwIu1qMe3qXCQ1V42NkP/gpkdTH9f01H2
         xoCzFMRlVkRoeJsKTUu5MBUOkED9M18rNlcUuk+grAG7CyRsRtSjH1d9/AUXb42qUV80
         2gcg==
X-Gm-Message-State: AOJu0YwO5H1IbAhYMMV6j0pkaPQ0SnmpvWI5A3qR9O8QsKZ5KTP4I7qT
	NwN3Ot2qpDxhuwTPOo3VOqIkXAvvgMjEio88VqMQHr9ganUxTnIao4JLs/HKmymV6BFmtuM9k8G
	EWFY=
X-Gm-Gg: ASbGncshz0+qtRsG6UVC5lH1dRWqiRgt0zeLzyvpPGdOSnhnNSV8daG47P6Ed3hGGeE
	pnBjD+iLipT6Zb4yILK3OvNIJxBic2nslHsF4swsPQNqQ1PyP+QeV+iemqHx8wDprjlMGi7fy6Y
	vZj5rwBCgPcWhffPyrT2PEtK6K1a7iXsfbfm5rQYMNqnZYNoYVpw4JQIxGVV8XUt9nAzx0Q0ONl
	AaaR+M4NBQTMPHlCcbIN/OU0WZhmCaERVslVWqeH/st+oH2rp9mvFhOV3hBvsqGZYYnnpwWSDqq
	z0Y8kPNExRLTc+/C6VDV0CIAVngrvRWlbAw4x3pi+rk7egtaH/qZZhfoTOHPt2nEuLtp1THK55l
	6XtA4xyRNj1z9oQ==
X-Google-Smtp-Source: AGHT+IECBHZz8u3V6tGrc2lf+9uFOW2Cq+hmweb4PBH7kFIbq5/8KAfliEFxXNoMEwaeDrGE0JRJJg==
X-Received: by 2002:a05:600c:3acd:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-43f3a7d827emr112266815e9.0.1744625929077;
        Mon, 14 Apr 2025 03:18:49 -0700 (PDT)
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
Subject: [PATCH v2 1/7] Rename and adjust x86 containers
Date: Mon, 14 Apr 2025 11:18:37 +0100
Message-Id: <20250414101843.2348330-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
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



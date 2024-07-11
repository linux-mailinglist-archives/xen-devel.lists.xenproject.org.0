Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CB92E5C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757331.1166245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlx-0001ig-P5; Thu, 11 Jul 2024 11:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757331.1166245; Thu, 11 Jul 2024 11:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlx-0001eB-Fp; Thu, 11 Jul 2024 11:15:37 +0000
Received: by outflank-mailman (input) for mailman id 757331;
 Thu, 11 Jul 2024 11:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlw-0007rD-NZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5704b61-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:36 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a797c62565aso85395966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:36 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:33 -0700 (PDT)
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
X-Inumbo-ID: e5704b61-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696535; x=1721301335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1K5VtaPNhxunkEsliC4eDIJIZHlapEJxDQkRvmcxLs=;
        b=pXUpUeuHQgexaSFUDc2Cim4UX8FPHBiiMHfonhjLfRxWGKPy9Vsg2iCQuMoESLBQpF
         bX3T0OvaxUu2sEmEb+Jhy2U8slS7S48mJMQ5I4JdW/LkmRqGDzv0Tt8IwpdpK7H4ygLk
         l8/nShu3TkDxnCuJbNyT2KebyB+tif3qkKzvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696535; x=1721301335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1K5VtaPNhxunkEsliC4eDIJIZHlapEJxDQkRvmcxLs=;
        b=UL0wYO6+S9uJXJ5PCAxOqKBWE8qJlolfcGdXzB0aPeNLHtxAjwcz0LmHPq+vUp7QqD
         +uYuTP6XcVNGuwfjK/b/yVmi2AqJa8eLwqm2kLKpBS/+iEtPRIK3vC1H6iuR5cY1WkGV
         Q37kpgxEjazW3wG4E0QwD3rzKWM03NRjQnMnnL7cfs0R9U6yYNFGAQtoMV1j4La5iQs1
         +lJzRsoH2/1LTqOaF9lv1/dqGzls1rhvvjALnhQ85i4CQ9GfhEvyPsmzwmBKAit84mjg
         SWiNuwMbahlktZ+hOsVuxvdyq7LVe4FSGNlquUtWH43XR4BcUgBlgGdTRz1kKa1WHp2l
         Pyjw==
X-Gm-Message-State: AOJu0YzmrVuCUj+gqWCqz1AmS2tcYDmRQzCohzVkL9AcGP4JYCeFmn3C
	nOQgCAiYBCLtvQxfTPN8sYL+Wn8wcj62YcPzKETZnOZ/dIQSgocO/0X0wQo/9mT+PbNu9uNBM62
	R
X-Google-Smtp-Source: AGHT+IFqyNl92G3n15wNOOj5JNaGHK+GM4H6qlZ9spenU3XWIEK3ierhsCZw7bUPzFW3Lh2dEtqEJQ==
X-Received: by 2002:a17:906:c319:b0:a77:c5a5:f652 with SMTP id a640c23a62f3a-a780b6b308bmr503072966b.26.1720696535184;
        Thu, 11 Jul 2024 04:15:35 -0700 (PDT)
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
Subject: [PATCH 09/12] CI: Refresh bullseye-ppc64le as debian:11-ppc64le
Date: Thu, 11 Jul 2024 12:15:14 +0100
Message-Id: <20240711111517.3064810-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in the style of bookworm-ppc64le

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
---
 automation/build/debian/11-ppc64le.dockerfile | 33 +++++++++++++++++++
 .../build/debian/bullseye-ppc64le.dockerfile  | 32 ------------------
 automation/gitlab-ci/build.yaml               |  8 ++---
 automation/scripts/containerize               |  2 +-
 4 files changed, 38 insertions(+), 37 deletions(-)
 create mode 100644 automation/build/debian/11-ppc64le.dockerfile
 delete mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile

diff --git a/automation/build/debian/11-ppc64le.dockerfile b/automation/build/debian/11-ppc64le.dockerfile
new file mode 100644
index 000000000000..d846b670d02c
--- /dev/null
+++ b/automation/build/debian/11-ppc64le.dockerfile
@@ -0,0 +1,33 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bullseye-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
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
+        flex
+        gcc-powerpc64le-linux-gnu
+        python3-minimal
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
deleted file mode 100644
index e166d205f38c..000000000000
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ /dev/null
@@ -1,32 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bullseye-slim
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-# Add compiler path
-ENV CROSS_COMPILE powerpc64le-linux-gnu-
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes --no-install-recommends install \
-        bison \
-        build-essential \
-        checkpolicy \
-        flex \
-        gawk \
-        gcc-powerpc64le-linux-gnu \
-        make \
-        python3-minimal \
-        # QEMU runtime dependencies for test phase
-        libglib2.0-0 \
-        libpixman-1-0 \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 316dc4345f29..e081664c4e95 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -718,17 +718,17 @@ opensuse-tumbleweed-gcc-debug:
   allow_failure: true
 
 # PowerPC builds (x86 cross)
-debian-bullseye-gcc-ppc64le:
+debian-11-ppc64le-gcc:
   extends: .gcc-ppc64le-cross-build
   variables:
-    CONTAINER: debian:bullseye-ppc64le
+    CONTAINER: debian:11-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
-debian-bullseye-gcc-ppc64le-debug:
+debian-11-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
-    CONTAINER: debian:bullseye-ppc64le
+    CONTAINER: debian:11-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index aa3433f0dc98..5c3f6782d9cd 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -31,7 +31,7 @@ case "_${CONTAINER}" in
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
-    _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
+    _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930AE31A983
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 02:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84474.158473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAjt8-0002bU-3M; Sat, 13 Feb 2021 01:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84474.158473; Sat, 13 Feb 2021 01:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAjt7-0002bC-R1; Sat, 13 Feb 2021 01:38:21 +0000
Received: by outflank-mailman (input) for mailman id 84474;
 Sat, 13 Feb 2021 01:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lAjt6-0002b5-3p
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 01:38:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57219d8d-e9bf-4dc3-8ac1-5f69cdff5306;
 Sat, 13 Feb 2021 01:38:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E155B64DEE;
 Sat, 13 Feb 2021 01:38:17 +0000 (UTC)
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
X-Inumbo-ID: 57219d8d-e9bf-4dc3-8ac1-5f69cdff5306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613180298;
	bh=AAM0GsFSCFy3GGKIJsyvQXq6QgQww1bLbn609ZU5zdI=;
	h=From:To:Cc:Subject:Date:From;
	b=B1hb8f0sJcIncX6aY8cH1lkCOZ/po3kn7O80aAsqcOkPTBeaixEwN71LXO1BOoiHY
	 ArVv/3tfmjKtAve6yE2yjqycjRLHE46XJcoLhtt+cBu8jBVFjd28to2XVEQcUXwilj
	 OOY1/K160j6J0lt+EYr0Ipmv18PVcUfccW0eTgM4SJjvJpi52ya4ZC6EjZKeZgXtx2
	 7onYPhXYs6PVh5886afIgekWRzal6SMb6HsdcbuioB5AJOWNEAAMQJ8NqUdZuReQ40
	 m4SDZQHDC8Yh2aCB1B0gbhv59K87eabTN1jAamWJUJaII3pI0t49Gvra4IAHfPWXsj
	 Ub/T0B8G6t9mQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: cardoe@cardoe.com
Cc: andrew.cooper3@citrix.com,
	wl@xen.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] automation: add arm32 cross-build tests for Xen
Date: Fri, 12 Feb 2021 17:38:13 -0800
Message-Id: <20210213013813.30114-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Add a debian build container with cross-gcc for arm32 installed.
Add build jobs to cross-compile Xen-only for arm32.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 .../debian/unstable-arm32-gcc.dockerfile      | 24 +++++++++
 automation/gitlab-ci/build.yaml               | 50 +++++++++++++++++++
 automation/scripts/build                      |  9 ++++
 3 files changed, 83 insertions(+)
 create mode 100644 automation/build/debian/unstable-arm32-gcc.dockerfile

diff --git a/automation/build/debian/unstable-arm32-gcc.dockerfile b/automation/build/debian/unstable-arm32-gcc.dockerfile
new file mode 100644
index 0000000000..b41a57f197
--- /dev/null
+++ b/automation/build/debian/unstable-arm32-gcc.dockerfile
@@ -0,0 +1,24 @@
+FROM debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        flex \
+        bison \
+        git \
+        gcc-arm-linux-gnueabihf \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d00b8a5123..22114662f2 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -117,6 +117,33 @@
   variables:
     <<: *clang
 
+.arm32-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: arm32
+  tags:
+    - x86_64
+
+.arm32-cross-build:
+  extends: .arm32-cross-build-tmpl
+  variables:
+    debug: n
+
+.arm32-cross-build-debug:
+  extends: .arm32-cross-build-tmpl
+  variables:
+    debug: y
+
+.gcc-arm32-cross-build:
+  extends: .arm32-cross-build
+  variables:
+    <<: *gcc
+
+.gcc-arm32-cross-build-debug:
+  extends: .arm32-cross-build-debug
+  variables:
+    <<: *gcc
+
 .arm64-build-tmpl:
   <<: *build
   variables:
@@ -454,6 +481,29 @@ alpine-3.12-clang-debug:
     CONTAINER: alpine:3.12
   allow_failure: true
 
+# Arm32 cross-build
+
+debian-unstable-gcc-arm32:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+
+debian-unstable-gcc-arm32-debug:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+
+debian-unstable-gcc-arm32-randconfig:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+    RANDCONFIG: y
+
+debian-unstable-gcc-arm32-debug-randconfig:
+  extends: .gcc-arm32-cross-build-debug
+  variables:
+    CONTAINER: debian:unstable-arm32-gcc
+    RANDCONFIG: y
 
 # Arm builds
 
diff --git a/automation/scripts/build b/automation/scripts/build
index d8990c3bf4..e7d68f7a9d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -15,6 +15,15 @@ else
     make -j$(nproc) -C xen defconfig
 fi
 
+# arm32 only cross-compiles the hypervisor
+if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
+    make -j$(nproc) xen
+    cp xen/.config xen-config
+    mkdir binaries
+    cp xen/xen binaries/xen
+    exit 0
+fi
+
 # build up our configure options
 cfgargs=()
 cfgargs+=("--enable-docs")
-- 
2.17.1



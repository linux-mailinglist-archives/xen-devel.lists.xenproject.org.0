Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1B35FF22
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 03:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110887.211868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWqXi-0002dC-AO; Thu, 15 Apr 2021 01:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110887.211868; Thu, 15 Apr 2021 01:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWqXi-0002cn-7N; Thu, 15 Apr 2021 01:11:38 +0000
Received: by outflank-mailman (input) for mailman id 110887;
 Thu, 15 Apr 2021 01:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clmd=JM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWqXh-0002ci-BD
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 01:11:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8129c747-bd19-45f7-8cc5-ddadf3afe090;
 Thu, 15 Apr 2021 01:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3B5D61029;
 Thu, 15 Apr 2021 01:11:35 +0000 (UTC)
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
X-Inumbo-ID: 8129c747-bd19-45f7-8cc5-ddadf3afe090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618449095;
	bh=nN5vxw7wu7IXl4SI40VE6V1scdLwwyhGyhvUjTu+P4o=;
	h=From:To:Cc:Subject:Date:From;
	b=parpw4CwFAlLxAz2JjWa8g1RVei0h9H2t5E0VKwdfAmYc77/QdgKeB0V7R6lVR1dw
	 1OK6zmaNwD3KD3uAXwltfN2U1ZaMcW4c5DUpfAv+E4kwOQ7dNwwUglD3mQsNK+zvgr
	 Y9UIg0AxPXp0lOsfBFh4B1EHqLI0tCfd6HZA1Fr3G1ARvyFARN1zqjSYC1Kfv2rLnK
	 kUCl539BNGaSWwkh6CnxhcSThb3RrNS3SkxKxG9VSRAmyTROHbApXC5I0l4Az5xAC1
	 xJ/AVdaWSZRKwPHzFUfWXbUZZhNYpx1PhlSR+Z99WErbMnHLhZoYOMnEcXaqJobSuo
	 xiKNZM41QR0Dg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	wl@xen.org,
	cardoe@cardoe.com,
	andrew.cooper3@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] automation: add arm32 cross-build tests for Xen
Date: Wed, 14 Apr 2021 18:11:33 -0700
Message-Id: <20210415011133.24000-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Add a debian build container with cross-gcc for arm32 installed.
Add build jobs to cross-compile Xen-only for arm32.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Acked-by: Wei Liu <wl@xen.org>
---

Rebased on top of staging, using the new "hypervisor_only" option.

---
 .../debian/unstable-arm32-gcc.dockerfile      | 24 +++++++++
 automation/gitlab-ci/build.yaml               | 50 +++++++++++++++++++
 automation/scripts/build                      |  5 ++
 3 files changed, 79 insertions(+)
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
index cca2c310e2..57bf2c7f80 100644
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
@@ -450,6 +477,29 @@ alpine-3.12-clang-debug:
   variables:
     CONTAINER: alpine:3.12
 
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
index 1b752edfe6..eaf70b11d1 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -16,6 +16,11 @@ else
     make -j$(nproc) -C xen defconfig
 fi
 
+# arm32 only cross-compiles the hypervisor
+if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
+    hypervisor_only="y"
+fi
+
 # build up our configure options
 cfgargs=()
 cfgargs+=("--enable-docs")
-- 
2.17.1



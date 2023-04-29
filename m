Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7266F250D
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 16:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527651.820333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pslXp-0002lG-SZ; Sat, 29 Apr 2023 14:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527651.820333; Sat, 29 Apr 2023 14:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pslXp-0002jY-PO; Sat, 29 Apr 2023 14:27:25 +0000
Received: by outflank-mailman (input) for mailman id 527651;
 Sat, 29 Apr 2023 14:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ech=AU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pslXo-0002jS-6P
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 14:27:24 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f372da01-e699-11ed-8611-37d641c3527e;
 Sat, 29 Apr 2023 16:27:21 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 632395C0161;
 Sat, 29 Apr 2023 10:27:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 29 Apr 2023 10:27:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Apr 2023 10:27:19 -0400 (EDT)
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
X-Inumbo-ID: f372da01-e699-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682778440; x=1682864840; bh=9uCHS2zYFXZb16zRhgtNL5MuA
	4xe2dD4D2irqiSKyXM=; b=AHyK1OqHeuvyN/T83wHJePcKyNSIK+9jc5Dpuoula
	CzKUSEGhC3/bO/UA1m8GJ0M8CHkIOjZesfdDDRM95vBiz3olbnsaVovcY4zikodE
	91Ai8zS4YXT2c0gflRYKbnNRmo9jq1XBwFoEYYjQoHIp58+PzFI/GKQyn5ksX9eW
	XMSCTs6N+xBs5RVWUha9h+jRAHSrkl08Y5MyoLZODafU8vjXLaZAPUnOmryJhWA7
	1kCgfbxgtnQI3CBMZuIkXeRcaqA/9cADOXAEu5qmTrB2ESaiZ4QmxGtkxdUx1/z/
	2S9g1lRGqaTp7LWCO4LFQ9szAh5UiKzvJAiVopj5m4LpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1682778440; x=1682864840; bh=9
	uCHS2zYFXZb16zRhgtNL5MuA4xe2dD4D2irqiSKyXM=; b=Oo2NN5k0uxUo/UZaA
	jR3z4fDxtj1Ze6HX0O2OSX+pexYZjy4u3l4hCd9DHVIVYnzoebwE9DSvhyvOZbkH
	cxAIc/vdwbv4GHOckWE/dGLWl30nwAPCiZc7rYwtR83CnK61zSaKKc8cPcqTwL/1
	uUW+iQfP0vs22goAfBfympoIrJywzEJ2koWESSuPyR6ASkisCjOvDGRsVecCNMwl
	YYGF7Y5Qx1z6JxzUNbCapL2dc8mMUwSX9yE840zauwkTWtEReUgmWeRGjXHohlOa
	QiqaErNgNYOr0RAeweTzVx8m+65an1adp/7QcFAIQssmko1YFz1tye1OIqC6v16N
	YI3Lw==
X-ME-Sender: <xms:SClNZOiB0OZlGBgMS_7NraZiHE2hPGDh8Oz9VtJGFYE1ozjnIFMzLg>
    <xme:SClNZPDbU9VTqp1wrQ7dnv3ldAIq9mdorKD0Eptpwk2FSYiXbIerpmf0zooJqZKjk
    nzIGPoT3BSh7A>
X-ME-Received: <xmr:SClNZGGd7gSAHxpn6A5C8PYtzf1EqAON-sxyh4jypbuow3FmIkCtokN4vh0bZYKSGsR1mGuRge3dJdyrYFJgZgKlibOetsvWWA648PeK7UhJAruD-2jK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvtddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejueef
    hfelieekgeeftdfgieeugefhudetjeethfefveehffejhfeigefgjeekleenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:SClNZHSUTfOrRTeYHg8uKoFMMPMpcjqaHn3MXpjYgte9DFeoEuZxNQ>
    <xmx:SClNZLwxnPqLHEbqEHAAAt9DyoWXEws6ZAMeAdjYN34w7VhWapAInQ>
    <xmx:SClNZF6xZmsojHsfdLBSGYXKvV-HfBVuTeCm8x_1TZhTRgmR6u-Q5w>
    <xmx:SClNZEo6TygQAF7D5rNXepqXg9PrOKH8e2jsSqXpHXfvTP8HEQxbXg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: optimize build jobs order
Date: Sat, 29 Apr 2023 16:27:07 +0200
Message-Id: <20230429142707.176299-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Put jobs that are needed for (any) test earlier, so the tests can start
running in parallel to builds.
This commits splits only x86 build jobs into two sections (one on top
and one on bottom), but keep ARM build jobs in one section, as most of
them have some test connected and the few that do not are not worth
reducing readability of the file.

And also, put artifacts jobs at the very beginning, not the very end.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This made the pipeline to complete within 45 minutes. This isn't big
improvement on its own, but should make adding more runners more
beneficial. While looking at it in real time, most jobs were really
waiting for available runners and not stuck on dependencies anymore.
---
 automation/gitlab-ci/build.yaml | 735 ++++++++++++++++----------------
 1 file changed, 370 insertions(+), 365 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d323c30a8304..32dec45b8b9a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -236,359 +236,211 @@
   variables:
     <<: *gcc
 
-# Jobs below this line
+## Test artifacts common
 
-archlinux-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: archlinux:current
+.test-jobs-artifact-common:
+  stage: build
+  except: !reference [.test-jobs-common, except]
 
-archlinux-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: archlinux:current
+# Arm test artifacts
 
-centos-7-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: centos:7
+alpine-3.12-arm64-rootfs-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - arm64
 
-centos-7-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: centos:7
+kernel-5.19-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
+  script:
+    - mkdir binaries && cp /Image binaries/Image
+  artifacts:
+    paths:
+      - binaries/Image
+  tags:
+    - arm64
 
-debian-stretch-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
+qemu-system-aarch64-6.0.0-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
+  artifacts:
+    paths:
+      - binaries/qemu-system-aarch64
+  tags:
+    - arm64
 
-debian-stretch-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
+qemu-system-aarch64-6.0.0-arm32-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
+  artifacts:
+    paths:
+      - binaries/qemu-system-arm
+  tags:
+    - arm64
 
-debian-stretch-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
+# x86_64 test artifacts
 
-debian-stretch-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
+alpine-3.12-rootfs-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - x86_64
 
-debian-stretch-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
+kernel-6.1.19-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
+  script:
+    - mkdir binaries && cp /bzImage binaries/bzImage
+  artifacts:
+    paths:
+      - binaries/bzImage
+  tags:
+    - x86_64
 
-debian-stretch-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
+# Jobs below this line
 
-debian-buster-gcc-ibt:
+# Build jobs needed for tests
+
+alpine-3.12-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:buster-gcc-ibt
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_XEN_IBT=y
+    CONTAINER: alpine:3.12
 
-debian-unstable-clang:
-  extends: .clang-x86-64-build
+alpine-3.12-gcc-debug:
+  extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: alpine:3.12
+
+debian-stretch-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:stretch
 
 debian-unstable-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: debian:unstable
 
-debian-unstable-gcc:
-  extends: .gcc-x86-64-build
+# Arm32 cross-build
+
+debian-unstable-gcc-arm32:
+  extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+debian-unstable-gcc-arm32-debug:
+  extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
 
-debian-unstable-gcc-randconfig:
-  extends: .gcc-x86-64-build
+debian-unstable-gcc-arm32-randconfig:
+  extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-unstable-gcc-debug-randconfig:
-  extends: .gcc-x86-64-build-debug
+debian-unstable-gcc-arm32-debug-randconfig:
+  extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-unstable-32-clang-debug:
-  extends: .clang-x86-32-build-debug
+debian-unstable-gcc-arm32-staticmem:
+  extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-i386
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
 
-debian-unstable-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
+debian-unstable-gcc-arm32-debug-staticmem:
+  extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-i386
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
+    HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
 
-fedora-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: fedora:29
+# Arm builds
 
-fedora-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+debian-unstable-gcc-arm64:
+  extends: .gcc-arm64-build
   variables:
-    CONTAINER: fedora:29
-
-# Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
+    CONTAINER: debian:unstable-arm64v8
 
-ubuntu-trusty-gcc:
-  extends: .gcc-x86-64-build
+debian-unstable-gcc-debug-arm64:
+  extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: ubuntu:trusty
+    CONTAINER: debian:unstable-arm64v8
 
-ubuntu-trusty-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+debian-unstable-gcc-arm64-randconfig:
+  extends: .gcc-arm64-build
   variables:
-    CONTAINER: ubuntu:trusty
+    CONTAINER: debian:unstable-arm64v8
+    RANDCONFIG: y
 
-ubuntu-xenial-clang:
-  extends: .clang-x86-64-build
+debian-unstable-gcc-debug-arm64-randconfig:
+  extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: debian:unstable-arm64v8
+    RANDCONFIG: y
 
-ubuntu-xenial-clang-debug:
-  extends: .clang-x86-64-build-debug
+alpine-3.12-gcc-arm64:
+  extends: .gcc-arm64-build
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: alpine:3.12-arm64v8
 
-ubuntu-xenial-gcc:
-  extends: .gcc-x86-64-build
+alpine-3.12-gcc-debug-arm64:
+  extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: alpine:3.12-arm64v8
 
-ubuntu-xenial-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+alpine-3.12-gcc-arm64-randconfig:
+  extends: .gcc-arm64-build
   variables:
-    CONTAINER: ubuntu:xenial
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
 
-ubuntu-bionic-clang:
-  extends: .clang-x86-64-build
+alpine-3.12-gcc-debug-arm64-randconfig:
+  extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
 
-ubuntu-bionic-clang-debug:
-  extends: .clang-x86-64-build-debug
+alpine-3.12-gcc-arm64-staticmem:
+  extends: .gcc-arm64-build
   variables:
-    CONTAINER: ubuntu:bionic
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
 
-ubuntu-bionic-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-bionic-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-focal-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
-
-opensuse-leap-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-tumbleweed-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-alpine-3.12-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.12
-
-# Arm32 cross-build
-
-debian-unstable-gcc-arm32:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm32-debug:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm32-randconfig:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    RANDCONFIG: y
-
-debian-unstable-gcc-arm32-debug-randconfig:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    RANDCONFIG: y
-
-debian-unstable-gcc-arm32-staticmem:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-debian-unstable-gcc-arm32-debug-staticmem:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-# Arm builds
-
-debian-unstable-gcc-arm64:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-
-debian-unstable-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-
-debian-unstable-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-    RANDCONFIG: y
-
-debian-unstable-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-    RANDCONFIG: y
-
-alpine-3.12-gcc-arm64:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.12-arm64v8
-
-alpine-3.12-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.12-arm64v8
-
-alpine-3.12-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.12-arm64v8
-    RANDCONFIG: y
-
-alpine-3.12-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.12-arm64v8
-    RANDCONFIG: y
-
-alpine-3.12-gcc-arm64-staticmem:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.12-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-alpine-3.12-gcc-debug-arm64-staticmem:
-  extends: .gcc-arm64-build-debug
+alpine-3.12-gcc-debug-arm64-staticmem:
+  extends: .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -706,78 +558,231 @@ debian-unstable-gcc-arm64-cppcheck:
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-## Test artifacts common
+# Build jobs not needed for tests
 
-.test-jobs-artifact-common:
-  stage: build
-  except: !reference [.test-jobs-common, except]
+alpine-3.12-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: alpine:3.12
 
-# Arm test artifacts
+alpine-3.12-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: alpine:3.12
 
-alpine-3.12-arm64-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - arm64
+archlinux-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: archlinux:current
 
-kernel-5.19-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
-  script:
-    - mkdir binaries && cp /Image binaries/Image
-  artifacts:
-    paths:
-      - binaries/Image
-  tags:
-    - arm64
+archlinux-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: archlinux:current
 
-qemu-system-aarch64-6.0.0-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
-  artifacts:
-    paths:
-      - binaries/qemu-system-aarch64
-  tags:
-    - arm64
+centos-7-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: centos:7
 
-qemu-system-aarch64-6.0.0-arm32-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
-  artifacts:
-    paths:
-      - binaries/qemu-system-arm
-  tags:
-    - arm64
+centos-7-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: centos:7
 
-# x86_64 test artifacts
+debian-stretch-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:stretch
 
-alpine-3.12-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - x86_64
+debian-stretch-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:stretch
+
+debian-stretch-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: debian:stretch
+
+debian-stretch-32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:stretch-i386
+
+debian-stretch-32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:stretch-i386
+
+debian-buster-gcc-ibt:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:buster-gcc-ibt
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_XEN_IBT=y
+
+debian-unstable-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc-randconfig:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+    RANDCONFIG: y
+
+debian-unstable-gcc-debug-randconfig:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:unstable
+    RANDCONFIG: y
+
+debian-unstable-32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:unstable-i386
+
+debian-unstable-32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:unstable-i386
+
+fedora-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: fedora:29
+
+fedora-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: fedora:29
+
+# Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
+
+ubuntu-trusty-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:trusty
+
+ubuntu-trusty-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:trusty
+
+ubuntu-xenial-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-bionic-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-focal-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
+opensuse-leap-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-tumbleweed-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
 
-kernel-6.1.19-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
-  script:
-    - mkdir binaries && cp /bzImage binaries/bzImage
-  artifacts:
-    paths:
-      - binaries/bzImage
-  tags:
-    - x86_64
-- 
2.39.2



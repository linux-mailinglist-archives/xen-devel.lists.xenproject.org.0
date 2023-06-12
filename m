Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D272C8F3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547254.854544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8itq-0001Fe-8F; Mon, 12 Jun 2023 14:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547254.854544; Mon, 12 Jun 2023 14:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8itq-0001A2-4W; Mon, 12 Jun 2023 14:52:06 +0000
Received: by outflank-mailman (input) for mailman id 547254;
 Mon, 12 Jun 2023 14:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abR0=CA=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q8itp-0000ov-CD
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:52:05 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e1ce15-0930-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:52:03 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id AC45443CEC;
 Mon, 12 Jun 2023 07:52:01 -0700 (PDT)
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
X-Inumbo-ID: b0e1ce15-0930-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686581522; bh=kxbZekarbGjd8rLMSqsHPRGP6CUOtSZDXh+06sP8JiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1TAt1LeXpsrCV+A5KmR/YXVLRVydto7elZ7zpPBzVnBIKXkv1vwTFvKhk/quHXRz
	 mU6bwiKluxY7rJnO+pj0j4b2IG3I3LNxMfFm0HIQs0PLzySPXcF+8VWTMJmmHSuxiy
	 TlH6HWkcVpPihUL8xWNdTuoZ31TFwhoM4zgcjyGJioUg7gQD9BpAQ2aOzxngFBri8e
	 /sNnD3oQLpkrA2rb6t9ZknzmIxmQr8/tz+9jXKYUYjpaN0boDtXtLF/H/29bXHytVi
	 8LeQQ1gFVEJ/zivpk0dpfeIekznRlIGoF9zqUdjV8/2xRWvG0NMLb/zRewfj4WY99q
	 0NtAYKtE9NwWA==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 3/4] automation: Add ppc64le cross-build jobs
Date: Mon, 12 Jun 2023 09:51:38 -0500
Message-Id: <a11af142293ff079a8a895357bf2b0420644972e.1686580752.git.shawn@anastas.io>
In-Reply-To: <cover.1686580752.git.shawn@anastas.io>
References: <cover.1686580752.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add build jobs to cross-compile Xen for ppc64le.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 420ffa5acb..bd8c7332db 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -183,6 +183,33 @@
   variables:
     <<: *gcc
 
+.ppc64le-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: ppc64
+  tags:
+    - x86_64
+
+.ppc64le-cross-build:
+  extends: .ppc64le-cross-build-tmpl
+  variables:
+    debug: n
+
+.ppc64le-cross-build-debug:
+  extends: .ppc64le-cross-build-tmpl
+  variables:
+    debug: y
+
+.gcc-ppc64le-cross-build:
+  extends: .ppc64le-cross-build
+  variables:
+    <<: *gcc
+
+.gcc-ppc64le-cross-build-debug:
+  extends: .ppc64le-cross-build-debug
+  variables:
+    <<: *gcc
+
 .yocto-test:
   stage: build
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
@@ -516,6 +543,39 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
 
+# Power cross-build
+debian-bullseye-gcc-ppc64le:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: openpower_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-bullseye-gcc-ppc64le-debug:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: openpower_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-bullseye-gcc-ppc64le-randconfig:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: openpower_defconfig
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+
+debian-bullseye-gcc-ppc64le-debug-randconfig:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: openpower_defconfig
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
-- 
2.30.2



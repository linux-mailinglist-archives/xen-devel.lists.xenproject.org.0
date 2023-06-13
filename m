Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0F72E640
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548189.855998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95Ln-0002SN-79; Tue, 13 Jun 2023 14:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548189.855998; Tue, 13 Jun 2023 14:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95Ln-0002QD-4A; Tue, 13 Jun 2023 14:50:27 +0000
Received: by outflank-mailman (input) for mailman id 548189;
 Tue, 13 Jun 2023 14:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95Lm-0002Q3-67
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:50:26 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a066741a-09f9-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:50:25 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id B87EE43CED;
 Tue, 13 Jun 2023 07:50:21 -0700 (PDT)
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
X-Inumbo-ID: a066741a-09f9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667822; bh=kxbZekarbGjd8rLMSqsHPRGP6CUOtSZDXh+06sP8JiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZrDxSsWLt63Un/xIC1uVy/DHQB2dN2zKjj9mmlNGgUjqMewCn+f9HmWdAsukTY1l
	 v9d5oYHQACnR5kjqwzSfuqZ4OzgItx3MUVOcKTuEmNQmzVcnw1CYd+pf9Aw6ULoi5C
	 Vy5oIuIs2EBug2NC6fX0hYIMbXUEWXCOyahomSrcJfIEVFJoJIxoTvdO8LkTVfHrsw
	 eXrZ2OYUO5EfBosKiShtVxoZm9niSYrmym0BZOLr3ajF7guWhPMEcPFKI9lzL0ZW/I
	 TLhIt/aLTsv09CNy2sLpVuati7OnJMjn2ayZfp55LHPC6q7trApgTs89HoTJIqD41E
	 f0yqbX6Y73q2A==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 3/4] automation: Add ppc64le cross-build jobs
Date: Tue, 13 Jun 2023 09:50:01 -0500
Message-Id: <a11af142293ff079a8a895357bf2b0420644972e.1686667191.git.shawn@anastas.io>
In-Reply-To: <cover.1686667191.git.shawn@anastas.io>
References: <cover.1686667191.git.shawn@anastas.io>
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



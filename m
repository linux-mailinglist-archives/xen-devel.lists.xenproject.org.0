Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A181F7337A3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 19:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550338.859352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYd-0001rJ-I1; Fri, 16 Jun 2023 17:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550338.859352; Fri, 16 Jun 2023 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYd-0001lk-EQ; Fri, 16 Jun 2023 17:48:23 +0000
Received: by outflank-mailman (input) for mailman id 550338;
 Fri, 16 Jun 2023 17:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qADYb-0001iV-Vo
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 17:48:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf4300d-0c6d-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 19:48:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 610BA82857D3;
 Fri, 16 Jun 2023 12:48:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KyTCUD6tTjYk; Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 80A828285AD7;
 Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PfT1xBtayfK7; Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 234F08285717;
 Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
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
X-Inumbo-ID: faf4300d-0c6d-11ee-b232-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 80A828285AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686937698; bh=q+rmhawpP7Wzq2WnGrOzz4f9y6ngrhvev0WPdaxoaGY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=P31QQK+RNPJVA6AiV4UMviBqyWiBsCaI8UQXnz/ouJNCI4es3KlL+9E0fweBq15oD
	 m85sOaScxPGGo7wtsIad7cnMCPt6iVdRKZ0VnNFJagTdFvaHWh7sWoP0Uc4w8nPMHR
	 i9FgBygMVYhDUbIRpb/GzNzQif1/Qwaj3vAyp37E=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/4] automation: Add ppc64le cross-build jobs
Date: Fri, 16 Jun 2023 12:48:02 -0500
Message-Id: <1a09823b03b5054c97efcf7008f9626d8ee83f49.1686936278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1686936278.git.sanastasio@raptorengineering.com>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add build jobs to cross-compile Xen for ppc64le.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
.yaml
index 420ffa5acb..bd8c7332db 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -183,6 +183,33 @@
   variables:
     <<: *gcc
=20
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
       CONFIG_COVERAGE=3Dn
=20
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
+      CONFIG_COVERAGE=3Dn
+
+debian-bullseye-gcc-ppc64le-debug-randconfig:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: openpower_defconfig
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=3Dn
+
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
--=20
2.30.2



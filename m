Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B8737390
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552204.862149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqv-0006OS-BH; Tue, 20 Jun 2023 18:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552204.862149; Tue, 20 Jun 2023 18:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqv-0006Mw-7o; Tue, 20 Jun 2023 18:13:17 +0000
Received: by outflank-mailman (input) for mailman id 552204;
 Tue, 20 Jun 2023 18:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5hq=CI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBfqt-00067X-Fh
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:13:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d891862-0f96-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 20:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B64F68285961;
 Tue, 20 Jun 2023 13:13:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aKB1Pqco1J6z; Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5CF71828574D;
 Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id O7LALMQIX8yK; Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E657B8285935;
 Tue, 20 Jun 2023 13:13:08 -0500 (CDT)
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
X-Inumbo-ID: 1d891862-0f96-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5CF71828574D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687284789; bh=+wgNL3Cvv+qmmR8NScpG5xML8HpLuiHvrktZaaL4g5I=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=XIKZPn0CTfQ03U0Zpkbrp33bk/1up7MRj0OIyRz4Qv5wiFs1KaW1EQkxjlgdFHtgV
	 D+mff8gaMMmiVQj7PMJTQLFWycYArh//piK9F3ybgZ296rTf6XgHmqwNJAAbxUSq3h
	 ZqexmP7+kL5z/58o01GKFuf1fOQGe8X9HExy0x2Y=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 2/3] automation: Add ppc64le cross-build jobs
Date: Tue, 20 Jun 2023 13:12:48 -0500
Message-Id: <10e4a94316b62aafddf43c67f33f558e59eaa721.1687283294.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687283294.git.sanastasio@raptorengineering.com>
References: <cover.1687283294.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add build jobs to cross-compile Xen for ppc64le.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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



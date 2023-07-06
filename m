Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FC74A41E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 21:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560047.875633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI6-0005z6-C3; Thu, 06 Jul 2023 19:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560047.875633; Thu, 06 Jul 2023 19:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI6-0005ud-75; Thu, 06 Jul 2023 19:05:22 +0000
Received: by outflank-mailman (input) for mailman id 560047;
 Thu, 06 Jul 2023 19:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuuY=CY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qHUI4-0005cz-MI
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 19:05:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b29dc20-1c30-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 21:05:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5F21D8285345;
 Thu,  6 Jul 2023 14:05:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6n4c9tihhj2V; Thu,  6 Jul 2023 14:05:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 737E18285BEC;
 Thu,  6 Jul 2023 14:05:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fzlH4Fgri6P2; Thu,  6 Jul 2023 14:05:15 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E545C828595F;
 Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
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
X-Inumbo-ID: 0b29dc20-1c30-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 737E18285BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688670315; bh=t2XSxlE4JcYvYurr+9ZptgwwCybbDwha+GFsOD84g3s=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Z71D0EFBLYDTXmQA0N/4+MPJwD+/2jTmcFsxWy7r+uxcB9/Ghmp6/FrQg3Ai1Y44M
	 25NUtmrlHTOmRZEkHYD1irByKChWx3+2VXUDlkyd+ruLG/tvb0KBaDDZaM8ZuIdHPi
	 mVE+QGDlOhtvoAbgRJX0jcG7uyl2EaNoafJOG62U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] automation: Add smoke test for ppc64le
Date: Thu,  6 Jul 2023 14:04:41 -0500
Message-Id: <6a8ba0e562bc99903267b1c9890ab936dc468a20.1688670018.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1688670018.git.sanastasio@raptorengineering.com>
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add an initial smoke test that boots xen on a ppc64/pseries machine and
checks for a magic string. Based on the riscv smoke test.

Eventually the powernv9 (POWER9 bare metal) machine type will want to be
tested as well, but for now we only boot on pseries.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/test.yaml           | 20 ++++++++++++++++++
 automation/scripts/qemu-smoke-ppc64le.sh | 27 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-ppc64le.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
index d5cb238b0a..45e8ddb7a3 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -71,6 +71,19 @@
   tags:
     - x86_64
=20
+.qemu-ppc64le:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    LOGFILE: qemu-smoke-ppc64le.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - x86_64
+
 .xilinx-arm64:
   extends: .test-jobs-common
   variables:
@@ -444,3 +457,10 @@ qemu-smoke-riscv64-gcc:
     - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - archlinux-current-gcc-riscv64-debug
+
+qemu-smoke-ppc64le-pseries-gcc:
+  extends: .qemu-ppc64le
+  script:
+    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee =
${LOGFILE}
+  needs:
+    - debian-bullseye-gcc-ppc64le-debug
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/script=
s/qemu-smoke-ppc64le.sh
new file mode 100755
index 0000000000..eb55221221
--- /dev/null
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+
+set -ex
+
+# machine type from first arg passed directly to qemu -M
+machine=3D$1
+
+# Run the test
+rm -f smoke.serial
+set +e
+
+touch smoke.serial
+
+timeout -k 1 20 \
+qemu-system-ppc64 \
+    -M $machine \
+    -m 2g \
+    -smp 1 \
+    -vga none \
+    -monitor none \
+    -nographic \
+    -serial file:smoke.serial \
+    -kernel binaries/xen
+
+set -e
+(grep -q "Hello, ppc64le!" smoke.serial) || exit 1
+exit 0
--=20
2.30.2



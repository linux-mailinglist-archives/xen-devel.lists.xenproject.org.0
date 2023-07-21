Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A875D047
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 19:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567668.887021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtX7-0003PA-Na; Fri, 21 Jul 2023 17:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567668.887021; Fri, 21 Jul 2023 17:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtX7-0003Mk-JB; Fri, 21 Jul 2023 17:03:13 +0000
Received: by outflank-mailman (input) for mailman id 567668;
 Fri, 21 Jul 2023 17:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NI5b=DH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qMtX5-0002st-Lj
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 17:03:11 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78305254-27e8-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 19:03:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 78E5A828597B;
 Fri, 21 Jul 2023 12:03:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id F6KNfYDGUPNK; Fri, 21 Jul 2023 12:03:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DAF03828595C;
 Fri, 21 Jul 2023 12:03:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T3UZyJ_-5EvO; Fri, 21 Jul 2023 12:03:08 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A9B908285A35;
 Fri, 21 Jul 2023 12:03:07 -0500 (CDT)
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
X-Inumbo-ID: 78305254-27e8-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DAF03828595C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689958988; bh=t2XSxlE4JcYvYurr+9ZptgwwCybbDwha+GFsOD84g3s=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=HkptPHndv8brZtUT0MonN0Vk8eZkwp+Y2J6DlfOsvTzvPaAAZq+8IYcmrK8ByL/fb
	 JqurN/Q8baZqQt6XQZz3szbNwCLYcoFN8jB2QO10mTucK7SwwkKeGtOjHDQO+i+QeJ
	 YUhCNu/NMCYau+fDCrTxjXKdXxc5uKMDfRG8ZyPU=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 4/4] automation: Add smoke test for ppc64le
Date: Fri, 21 Jul 2023 12:02:55 -0500
Message-Id: <ade2e58251c506e4576424082623d9b232a435f9.1689958538.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1689958538.git.sanastasio@raptorengineering.com>
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
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



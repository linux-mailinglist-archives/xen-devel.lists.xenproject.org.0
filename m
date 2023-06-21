Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B680738C7D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553032.863366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bl-0005nB-Lc; Wed, 21 Jun 2023 17:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553032.863366; Wed, 21 Jun 2023 17:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bl-0005j3-Ea; Wed, 21 Jun 2023 17:00:13 +0000
Received: by outflank-mailman (input) for mailman id 553032;
 Wed, 21 Jun 2023 17:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC1Bk-0005SN-99
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:00:12 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139c3090-1055-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 19:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 07BAC8285AB9
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 12:00:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id foy7nxcwUnGh; Wed, 21 Jun 2023 12:00:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4B4E78286814;
 Wed, 21 Jun 2023 12:00:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LGD8GxPuDDRZ; Wed, 21 Jun 2023 12:00:07 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BD7638285AF3;
 Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
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
X-Inumbo-ID: 139c3090-1055-11ee-b236-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4B4E78286814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687366807; bh=By/cyaijYQTAGJgZfB6T8MO0SHbn04i59WFs7fwttoA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=eKNTclCHeYRdWjT6nzpqrCUd4lj1McWNTVj7Xnt1UczbjyqKNRR/OEwoYlmRSIA9a
	 kXmq0qdfb1cdZqyM4SN15KtwG12HFBIFR+4nPdSongvKzguY1/Ey92nQEm+TV07W6x
	 jZFalootMUdl25E1/LwCxtafjqi32BRwrMjYG/aQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 4/4] automation: Add smoke test for ppc64le
Date: Wed, 21 Jun 2023 11:59:53 -0500
Message-Id: <b34f2d37ab3b7a6a3fd1a451904c64f39a54c899.1687366665.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687366665.git.sanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add an initial smoke test that boots xen on a ppc64/pseries machine and
checks for a magic string. Based on the riscv smoke test.

Eventually the powernv9 (POWER9 bare metal) machine type will want to be
tested as well, but for now we only boot on pseries.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
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



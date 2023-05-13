Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652AF7013BC
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 03:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534103.831341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxe3u-0003cA-L0; Sat, 13 May 2023 01:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534103.831341; Sat, 13 May 2023 01:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxe3u-0003ZP-I7; Sat, 13 May 2023 01:28:42 +0000
Received: by outflank-mailman (input) for mailman id 534103;
 Sat, 13 May 2023 01:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxe3t-0003ZH-99
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 01:28:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5dfdff-f12d-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 03:28:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF48761DBC;
 Sat, 13 May 2023 01:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E94C433EF;
 Sat, 13 May 2023 01:28:36 +0000 (UTC)
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
X-Inumbo-ID: 7c5dfdff-f12d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683941317;
	bh=g8o3uwylLBuE9F/y1l0IWZ3FGGtPG9MdJzEjSOTO+vI=;
	h=From:To:Cc:Subject:Date:From;
	b=QSyBF95jB/W1K3LaL71FEECsNrzKHfyzHIMPNMJy70rk3edF5aF+K4TYWyfN9woHH
	 705Ujnj5CeckOLx698n/tG7jlM9vBffwHwnMqnBwfTUDR5ceIirtkszrZOnA6CZ5Ch
	 qUyJEyg1d0dnfhmiM2Lollr1Jy84sjk7dPZBW5SkZc335+kYmyjVQKAhwM1E+8Geih
	 3D1a/uP0HRXMYd7EWU3BWVSWw1tDH+EDZfgaCWz2Xv0VCBFahSW0+uW5L2i1LWItHA
	 xD4sH2PTH+SdlpVRZGN7i1vlKSs5Dp1l/7Nsd/p4C7SBzvPspKH28FZvAN3BwNDkVp
	 aDoakhUviDg5A==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	cardoe@cardoe.com,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] automation: add a Dom0 PVH test based on Qubes' runner
Date: Fri, 12 May 2023 18:28:33 -0700
Message-Id: <20230513012833.3980872-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Straightforward Dom0 PVH test based on the existing basic Smoke test for
the Qubes runner.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/test.yaml     |  8 ++++++++
 automation/scripts/qubes-x86-64.sh | 14 +++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 55ca0c27dc..9c0e08d456 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -149,6 +149,14 @@ adl-smoke-x86-64-gcc-debug:
     - *x86-64-test-needs
     - alpine-3.12-gcc-debug
 
+adl-smoke-x86-64-dom0pvh-gcc-debug:
+  extends: .adl-x86-64
+  script:
+    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.12-gcc-debug
+
 adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 056faf9e6d..35b9386e5d 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -5,6 +5,7 @@ set -ex
 test_variant=$1
 
 ### defaults
+dom0pvh=
 wait_and_wakeup=
 timeout=120
 domU_config='
@@ -18,8 +19,8 @@ vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
 
-### test: smoke test
-if [ -z "${test_variant}" ]; then
+### test: smoke test & smoke test PVH
+if [ -z "${test_variant}" ] || [ "${test_variant}" = "dom0pvh" ]; then
     passed="ping test passed"
     domU_check="
 ifconfig eth0 192.168.0.2
@@ -36,6 +37,9 @@ done
 tail -n 100 /var/log/xen/console/guest-domU.log
 echo \"${passed}\"
 "
+if [ "${test_variant}" = "dom0pvh" ]; then
+    dom0pvh="dom0=pvh"
+fi
 
 ### test: S3
 elif [ "${test_variant}" = "s3" ]; then
@@ -184,11 +188,11 @@ cd ..
 TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
-echo '
-multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
+echo "
+multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G $dom0pvh
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
 module2 (http)/gitlab-ci/initrd-dom0
-' > $TFTP/grub.cfg
+" > $TFTP/grub.cfg
 
 cp -f binaries/xen $TFTP/xen
 cp -f binaries/bzImage $TFTP/vmlinuz
-- 
2.25.1



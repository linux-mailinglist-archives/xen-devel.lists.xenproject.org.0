Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A68703ED8
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 22:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534840.832231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyf8L-0002t8-EW; Mon, 15 May 2023 20:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534840.832231; Mon, 15 May 2023 20:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyf8L-0002qr-BQ; Mon, 15 May 2023 20:49:29 +0000
Received: by outflank-mailman (input) for mailman id 534840;
 Mon, 15 May 2023 20:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyf8K-0002ql-6c
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 20:49:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f928abda-f361-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 22:49:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30973622B4;
 Mon, 15 May 2023 20:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFA6C433D2;
 Mon, 15 May 2023 20:49:21 +0000 (UTC)
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
X-Inumbo-ID: f928abda-f361-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684183762;
	bh=sQ/P2ULzjfN6VJdKvCGOHahGexxLVnAbbczGd7tIb4g=;
	h=From:To:Cc:Subject:Date:From;
	b=PHoTsjyVqEJ6xkCFgPhFCpW528/f6IZIKRYX1gquqi9O4evcYIbchSABLRDBsCBES
	 LSmMPBGJNgaM9G4w1aD9gxks7aSOdzbk1auCKHCLPpxyrjxXoL6vrhi1Hzn+MIwV73
	 tjJB/K5+ve8Tvy0OEvC6yiQx4lNup3Xry75+iMyLSb/AbBIQwPaJWDRsGzkj1VtmbR
	 QB+LnKvWfYeQYe2vwq182tJWtxsov2GB3no0jR6uBxV1SjsZunUHPj6dXBzqUDmwFh
	 UeYOmQS6hXtSSU5Yp1ANGZ18SphzLNIajaPQVMTohZyvh1PyVb4vml2B1e6p+QKiKC
	 0Jx0lJwrKXNOA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	cardoe@cardoe.com,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] automation: add a Dom0 PVH test based on Qubes' runner
Date: Mon, 15 May 2023 13:49:19 -0700
Message-Id: <20230515204919.4174845-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Straightforward Dom0 PVH test based on the existing basic Smoke test for
the Qubes runner.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- rename dom0pvh to extra_xen_opts
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
index 056faf9e6d..4f17f1dd0b 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -5,6 +5,7 @@ set -ex
 test_variant=$1
 
 ### defaults
+extra_xen_opts=
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
+    extra_xen_opts="dom0=pvh"
+fi
 
 ### test: S3
 elif [ "${test_variant}" = "s3" ]; then
@@ -184,11 +188,11 @@ cd ..
 TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
-echo '
-multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
+echo "
+multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
 module2 (http)/gitlab-ci/initrd-dom0
-' > $TFTP/grub.cfg
+" > $TFTP/grub.cfg
 
 cp -f binaries/xen $TFTP/xen
 cp -f binaries/bzImage $TFTP/vmlinuz
-- 
2.25.1



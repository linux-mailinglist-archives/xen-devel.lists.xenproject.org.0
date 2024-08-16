Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDFD9553E7
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2024 01:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778821.1188801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf6eH-00024m-Q8; Fri, 16 Aug 2024 23:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778821.1188801; Fri, 16 Aug 2024 23:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sf6eH-00022W-NF; Fri, 16 Aug 2024 23:46:25 +0000
Received: by outflank-mailman (input) for mailman id 778821;
 Fri, 16 Aug 2024 23:46:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sf6eF-00022Q-TB
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 23:46:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd3aa345-5c29-11ef-a505-bb4a2ccca743;
 Sat, 17 Aug 2024 01:46:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 853236223C;
 Fri, 16 Aug 2024 23:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6D9C32782;
 Fri, 16 Aug 2024 23:46:19 +0000 (UTC)
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
X-Inumbo-ID: bd3aa345-5c29-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723851980;
	bh=PLhVGxtx1jNthxuKNX16DF938ypPE0BLHSf5R10Cfu8=;
	h=Date:From:To:cc:Subject:From;
	b=g9ZgpBDSpFjWz/GpiawfrAcDDN4SkL36saOPg9o/iysSBuSjfzCqQYclNSQeZtA91
	 CFn5a1Cn6DkffKmDoVVg1bnDo8dqMkjY+qGHyoQLtt11vxNhjS5mCbmiIiimmcMx+h
	 Z+lVBqo+T3x2e8mYS6dPszaEpfFc0dcxplAaEIpOFIOS18AS5Df815kinOeyCIuZ1Q
	 5CnmhFEOALVP3R3CWzc8/MpIOsTPEJXPdImgvC4L4KmPd8UVam3pp4W52fpZ6YKUTJ
	 9gpe9ZII3Dh4mKlSlDrjG/W2TSFWjEcIrLp33PMwyvYVgF7S7ZDfMPnkIjiEgKePKi
	 zpESDOXWGPr5w==
Date: Fri, 16 Aug 2024 16:46:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] automation: restore CR filtering
Message-ID: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

After commit c36efb7fcea6 ("automation: use expect to run QEMU") we lost
the \r filtering introduced by b576497e3b7d ("automation: remove CR
characters from serial output"). This patch reintroduced it.

Fixes: c36efb7fcea6 ("automation: use expect to run QEMU") 
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 5359e0820b..343b71d5ac 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -89,4 +89,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index bbdcb39f1a..a3ccbbd7f4 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -96,4 +96,4 @@ export QEMU_LOG="${serial_log}"
 export LOG_MSG="Domain-0"
 export PASSED="/ #"
 
-../automation/scripts/qemu-key.exp
+../automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 0094bfc8e1..a781022d48 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -109,4 +109,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 68ffbabdb8..3c32a676ff 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -149,4 +149,4 @@ export QEMU_LOG="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"
 
-../automation/scripts/qemu-key.exp
+../automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index eb25c4af4b..a13bd8ee04 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -220,4 +220,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
 export PASSED="${passed}"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index ccb4a576f4..3c02771914 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -25,4 +25,4 @@ export QEMU_CMD="qemu-system-ppc64 \
 export QEMU_LOG="${serial_log}"
 export PASSED="Hello, ppc64le!"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 0355c075b7..7ede5a5d8a 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,4 +16,4 @@ export QEMU_CMD="qemu-system-riscv64 \
 export QEMU_LOG="smoke.serial"
 export PASSED="All set up"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 37ac10e068..81e7dba329 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -24,4 +24,4 @@ export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
 export QEMU_LOG="smoke.serial"
 export PASSED="Test result: SUCCESS"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 0666f6363e..ed44aab0f0 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
 export QEMU_LOG="smoke.serial"
 export PASSED="${passed}"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r//'


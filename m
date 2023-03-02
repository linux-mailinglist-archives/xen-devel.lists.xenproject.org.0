Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812896A7A98
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504304.776940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaop-0004a2-Vn; Thu, 02 Mar 2023 04:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504304.776940; Thu, 02 Mar 2023 04:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaop-0004Xo-Qh; Thu, 02 Mar 2023 04:45:27 +0000
Received: by outflank-mailman (input) for mailman id 504304;
 Thu, 02 Mar 2023 04:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXaoo-0004UF-Iz
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:45:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0bbdc0b0-b8b5-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 05:45:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36E2E1FB;
 Wed,  1 Mar 2023 20:46:07 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB8E83F99C;
 Wed,  1 Mar 2023 20:45:21 -0800 (PST)
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
X-Inumbo-ID: 0bbdc0b0-b8b5-11ed-96a9-2f268f93b82a
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/2] automation: arm64: Create a test job for testing static heap on qemu
Date: Thu,  2 Mar 2023 04:44:20 +0000
Message-Id: <20230302044421.136068-2-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302044421.136068-1-jiamei.xie@arm.com>
References: <20230302044421.136068-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiamei Xie <jiamei.xie@arm.com>

Create a new test job, called qemu-smoke-dom0less-arm64-gcc-staticheap.

Add property "xen,static-heap" under /chosen node to enable static-heap.
If the domU can start successfully with static-heap enabled, then this
test pass.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
 automation/gitlab-ci/test.yaml                 | 16 ++++++++++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh       | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1c5f400b68..5a9b88477a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -133,6 +133,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
     - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64-staticmem
 
+qemu-smoke-dom0less-arm64-gcc-staticheap:
+ extends: .qemu-arm64
+ script:
+   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
+ needs:
+   - *arm64-test-needs
+   - alpine-3.12-gcc-arm64
+
+qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
+ extends: .qemu-arm64
+ script:
+   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
+ needs:
+   - *arm64-test-needs
+   - alpine-3.12-gcc-debug-arm64
+
 qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 182a4b6c18..4e73857199 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -27,6 +27,11 @@ fi
 "
 fi
 
+if [[ "${test_variant}" == "static-heap" ]]; then
+    passed="${test_variant} test passed"
+    domU_check="echo \"${passed}\""
+fi
+
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
     passed="${test_variant} test passed"
@@ -128,6 +133,19 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
 fi
 
+if [[ "${test_variant}" == "static-heap" ]]; then
+    # ImageBuilder uses the config file to create the uboot script. Devicetree
+    # will be set via the generated uboot script.
+    # The valid memory range is 0x40000000 to 0x80000000 as defined before.
+    # ImageBuillder sets the kernel and ramdisk range based on the file size.
+    # It will use the memory range between 0x45600000 to 0x47AED1E8, so set
+    # memory range between 0x50000000 and 0x80000000 as static heap.
+    echo  '
+STATIC_HEAP="0x50000000 0x30000000"
+# The size of static heap should be greater than the guest memory
+DOMU_MEM[0]="128"' >> binaries/config
+fi
+
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     echo '
 CPUPOOL[0]="cpu@1 null"
-- 
2.25.1



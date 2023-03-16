Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CCA6BCA79
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510408.788027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjfH-0007L1-UH; Thu, 16 Mar 2023 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510408.788027; Thu, 16 Mar 2023 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjfH-0007Ig-PG; Thu, 16 Mar 2023 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 510408;
 Thu, 16 Mar 2023 09:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwUl=7I=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pcjfG-0006zO-Em
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:12:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b91a9c8e-c3da-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:12:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AACF32F4;
 Thu, 16 Mar 2023 02:13:32 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF1923F67D;
 Thu, 16 Mar 2023 02:12:46 -0700 (PDT)
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
X-Inumbo-ID: b91a9c8e-c3da-11ed-87f5-c1b5be75604c
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 1/2] automation: arm64: Create test jobs for testing static heap on qemu
Date: Thu, 16 Mar 2023 09:12:23 +0000
Message-Id: <20230316091224.338620-2-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316091224.338620-1-jiamei.xie@arm.com>
References: <20230316091224.338620-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiamei Xie <jiamei.xie@arm.com>

Create 2 new test jobs, called qemu-smoke-dom0less-arm64-gcc-staticheap
and qemu-smoke-dom0less-arm64-gcc-debug-staticheap.

Add property "xen,static-heap" under /chosen node to enable static-heap.
If the domU can start successfully with static-heap enabled, then this
test pass.

ImageBuillder sets the kernel and ramdisk range based on the file size.
It will use the memory range between 0x45600000 to 0x47AED1E8. It uses
MEMORY_START and MEMORY_END from the cfg file as a range in which it can
instruct u-boot where to place the images.

Change MEMORY_END to 0x50000000 for all test cases.

Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
---
Changes from v1:
 - Change MEMORY_END to 0x50000000 for all test cases.
 - Update commit message.
---
 automation/gitlab-ci/test.yaml                | 16 ++++++++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 21 ++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 2e1a6886df..37465305ff 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -158,6 +158,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
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
index 182a4b6c18..2d69d976ea 100755
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
@@ -107,7 +112,7 @@ cd ..
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0xC0000000"
+MEMORY_END="0x50000000"
 
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
@@ -128,6 +133,20 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
 fi
 
+if [[ "${test_variant}" == "static-heap" ]]; then
+    # ImageBuilder uses the config file to create the uboot script. Devicetree
+    # will be set via the generated uboot script.
+    # The valid memory range is 0x40000000 to 0x80000000 as defined before.
+    # ImageBuillder sets the kernel and ramdisk range based on the file size.
+    # It will use the memory range between 0x45600000 to 0x47AED1E8, and
+    # MEMORY_END has been set to 0x50000000 above, so set memory range between
+    # 0x50000000 and 0x80000000 as static heap.
+    echo  '
+XEN_STATIC_HEAP="0x50000000 0x30000000"
+# The size of static heap should be greater than the guest memory
+DOMU_MEM[0]="128"' >> binaries/config
+fi
+
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     echo '
 CPUPOOL[0]="cpu@1 null"
-- 
2.25.1



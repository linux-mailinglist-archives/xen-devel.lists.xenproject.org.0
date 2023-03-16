Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D56BCA7E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510410.788038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjfR-0007oS-9r; Thu, 16 Mar 2023 09:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510410.788038; Thu, 16 Mar 2023 09:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjfR-0007lf-6t; Thu, 16 Mar 2023 09:13:01 +0000
Received: by outflank-mailman (input) for mailman id 510410;
 Thu, 16 Mar 2023 09:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwUl=7I=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pcjfP-0006zO-H7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:12:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id be7f5df2-c3da-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:12:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D37E62F4;
 Thu, 16 Mar 2023 02:13:41 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBA3B3F67D;
 Thu, 16 Mar 2023 02:12:55 -0700 (PDT)
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
X-Inumbo-ID: be7f5df2-c3da-11ed-87f5-c1b5be75604c
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 2/2] automation: arm64: Create test jobs for testing static shared memory on qemu
Date: Thu, 16 Mar 2023 09:12:24 +0000
Message-Id: <20230316091224.338620-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316091224.338620-1-jiamei.xie@arm.com>
References: <20230316091224.338620-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create 2 new test jobs, called qemu-smoke-dom0less-arm64-gcc-static-shared-mem
and qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem.

Adjust qemu-smoke-dom0less-arm64.sh script to accomodate the static
shared memory test as a new test variant. The test variant is determined
based on the first argument passed to the script. For testing static
shared memory, the argument is 'static-shared-mem'.

The test configures two dom0less DOMUs with a static shared memory
region and adds a check in the init script.

The check consists in comparing the contents of the /proc/device-tree/reserved-memory
xen-shmem entry with the static shared memory range and id with which
DOMUs were configured. If the memory layout is correct, a message gets
printed by DOMU.

At the end of the qemu run, the script searches for the specific message
in the logs and fails if not found.

Signed-off-by: jiamei.xie <jiamei.xie@arm.com>
---
Changes from v1:
 - Move the second domU creation to the general ImageBuilder script.
---
 automation/gitlab-ci/build.yaml               | 18 ++++++++++++
 automation/gitlab-ci/test.yaml                | 16 ++++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 29 +++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 38bb22d860..820cc0af83 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -623,6 +623,24 @@ alpine-3.12-gcc-debug-arm64-staticmem:
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
+alpine-3.12-gcc-arm64-static-shared-mem:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+      CONFIG_STATIC_SHM=y
+
+alpine-3.12-gcc-debug-arm64-static-shared-mem:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+      CONFIG_STATIC_SHM=y
+
 alpine-3.12-gcc-arm64-boot-cpupools:
   extends: .gcc-arm64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 37465305ff..d75662358f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -174,6 +174,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
    - *arm64-test-needs
    - alpine-3.12-gcc-debug-arm64
 
+qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-arm64-static-shared-mem
+
+qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-debug-arm64-static-shared-mem
+
 qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 2d69d976ea..75f575424a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -32,6 +32,25 @@ if [[ "${test_variant}" == "static-heap" ]]; then
     domU_check="echo \"${passed}\""
 fi
 
+
+if [[ "${test_variant}" == "static-shared-mem" ]]; then
+    passed="${test_variant} test passed"
+    SHARED_MEM_HOST="50000000"
+    SHARED_MEM_GUEST="4000000"
+    SHARED_MEM_SIZE="10000000"
+    SHARED_MEM_ID="my-shared-mem-0"
+
+    domU_check="
+current_id=\$(cat /proc/device-tree/reserved-memory/xen-shmem@4000000/xen,id 2>/dev/null)
+expected_id=\"\$(echo ${SHARED_MEM_ID})\"
+current_reg=\$(hexdump -e '16/1 \"%02x\"' /proc/device-tree/reserved-memory/xen-shmem@4000000/reg 2>/dev/null)
+expected_reg=$(printf \"%016x%016x\" 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE})
+if [[ \"\${expected_reg}\" == \"\${current_reg}\" && \"\${current_id}\" == \"\${expected_id}\" ]]; then
+    echo \"${passed}\"
+fi
+    "
+fi
+
 if [[ "${test_variant}" == "boot-cpupools" ]]; then
     # Check if domU0 (id=1) is assigned to Pool-1 with null scheduler
     passed="${test_variant} test passed"
@@ -124,6 +143,9 @@ NUM_DOMUS=1
 DOMU_KERNEL[0]="Image"
 DOMU_RAMDISK[0]="initrd"
 DOMU_MEM[0]="256"
+DOMU_KERNEL[1]="Image"
+DOMU_RAMDISK[1]="initrd"
+DOMU_MEM[1]="256"
 
 LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
@@ -133,6 +155,13 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
 fi
 
+if [[ "${test_variant}" == "static-shared-mem" ]]; then
+echo "
+NUM_DOMUS=2
+DOMU_SHARED_MEM[0]=\"${SHARED_MEM_ID} 0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}\"
+DOMU_SHARED_MEM[1]=\"${SHARED_MEM_ID} 0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}\"" >> binaries/config
+fi
+
 if [[ "${test_variant}" == "static-heap" ]]; then
     # ImageBuilder uses the config file to create the uboot script. Devicetree
     # will be set via the generated uboot script.
-- 
2.25.1



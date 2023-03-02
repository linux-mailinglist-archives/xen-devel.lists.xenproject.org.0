Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAC6A7A97
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504306.776950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaow-0004wm-5p; Thu, 02 Mar 2023 04:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504306.776950; Thu, 02 Mar 2023 04:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaow-0004tn-1J; Thu, 02 Mar 2023 04:45:34 +0000
Received: by outflank-mailman (input) for mailman id 504306;
 Thu, 02 Mar 2023 04:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXaov-0004AQ-66
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:45:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0f9f7499-b8b5-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 05:45:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB24A1FB;
 Wed,  1 Mar 2023 20:46:13 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BD653F99C;
 Wed,  1 Mar 2023 20:45:28 -0800 (PST)
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
X-Inumbo-ID: 0f9f7499-b8b5-11ed-a550-8520e6686977
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/2] automation: arm64: Create a test job for testing static shared memory on qemu
Date: Thu,  2 Mar 2023 04:44:21 +0000
Message-Id: <20230302044421.136068-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302044421.136068-1-jiamei.xie@arm.com>
References: <20230302044421.136068-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new test job, called qemu-smoke-dom0less-arm64-gcc-static-shared-mem.

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
index 5a9b88477a..f4d36babda 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -149,6 +149,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
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
index 4e73857199..fe3a282726 100755
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
@@ -133,6 +152,16 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     echo -e "\nDOMU_STATIC_MEM[0]=\"${domu_base} ${domu_size}\"" >> binaries/config
 fi
 
+if [[ "${test_variant}" == "static-shared-mem" ]]; then
+echo "NUM_DOMUS=2
+DOMU_SHARED_MEM[0]=\""0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}"\"
+DOMU_SHARED_MEM_ID[0]="${SHARED_MEM_ID}"
+DOMU_KERNEL[1]=\"Image\"
+DOMU_RAMDISK[1]=\"initrd\"
+DOMU_SHARED_MEM[1]=\"0x${SHARED_MEM_HOST} 0x${SHARED_MEM_GUEST} 0x${SHARED_MEM_SIZE}\"
+DOMU_SHARED_MEM_ID[1]=\"${SHARED_MEM_ID}\"" >> binaries/config
+fi
+
 if [[ "${test_variant}" == "static-heap" ]]; then
     # ImageBuilder uses the config file to create the uboot script. Devicetree
     # will be set via the generated uboot script.
-- 
2.25.1



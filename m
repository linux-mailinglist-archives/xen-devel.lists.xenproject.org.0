Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB946C0A99
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 07:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511725.790913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe907-0001my-B0; Mon, 20 Mar 2023 06:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511725.790913; Mon, 20 Mar 2023 06:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe907-0001kl-79; Mon, 20 Mar 2023 06:28:11 +0000
Received: by outflank-mailman (input) for mailman id 511725;
 Mon, 20 Mar 2023 06:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbMo=7M=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pe906-0001AC-1G
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 06:28:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 616a0e87-c6e8-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 07:28:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 713D6FEC;
 Sun, 19 Mar 2023 23:28:52 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E51573F885;
 Sun, 19 Mar 2023 23:28:06 -0700 (PDT)
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
X-Inumbo-ID: 616a0e87-c6e8-11ed-87f5-c1b5be75604c
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH v3 2/2] uboot-script-gen: add support for static shared memory
Date: Mon, 20 Mar 2023 06:27:18 +0000
Message-Id: <20230320062718.365896-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320062718.365896-1-jiamei.xie@arm.com>
References: <20230320062718.365896-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for creating shared-mem node for dom0less domUs in
the device tree. Add the following option:
- DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
  if specified, indicate the unique identifier of the shared memory
  region is SHM-ID, the host physical address HPA will get mapped at
  guest address GPA in domU and the memory of size will be reserved to
  be shared memory.

The static shared memory is used between two dom0less domUs.

Below is an example:
NUM_DOMUS=2
DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
DOMU_SHARED_MEM[1]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"

This static shared memory region is identified as "my-shared-mem-0",
host physical address starting at 0x50000000 of 256MB will be reserved
to be shared between two domUs. It will get mapped at 0x6000000 in both
guest physical address space. Both DomUs are the borrower domain, the
owner domain is the default owner domain DOMID_IO.

Signed-off-by: jiamei.xie <jiamei.xie@arm.com>
---
Changes from v2:
 - Remove "domid" parameter
 - Use lower capital letters for local variables
Changes from v1:
 - Rather than two separate properties and just use one like follows:
   Change
     DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
     DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
   to
     DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
 - Use split_value function instead of opencoding it.
---
 README.md                | 17 +++++++++++++++++
 scripts/uboot-script-gen | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/README.md b/README.md
index 78b83f1..fe5d205 100644
--- a/README.md
+++ b/README.md
@@ -196,6 +196,23 @@ Where:
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
 
+- DOMU_SHARED_MEM[number]="SHM-ID HPA GPA size"
+  if specified, indicate SHM-ID represents the unique identifier of the shared
+  memory region, the host physical address HPA will get mapped at guest
+  address GPA in domU and the memory of size will be reserved to be shared
+  memory. The shared memory is used between two dom0less domUs.
+
+  Below is an example:
+  NUM_DOMUS=2
+  DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
+  DOMU_SHARED_MEM[1]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
+
+  This static shared memory region is identified as "my-shared-mem-0", host
+  physical address starting at 0x50000000 of 256MB will be reserved to be
+  shared between two domUs. It will get mapped at 0x6000000 in both guest
+  physical address space. Both DomUs are the borrower domain, the owner
+  domain is the default owner domain DOMID_IO.
+
 - DOMU_DIRECT_MAP[number] can be set to 1 or 0.
   If set to 1, the VM is direct mapped. The default is 1.
   This is only applicable when DOMU_STATIC_MEM is specified.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index cca3e59..9656a45 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -204,6 +204,27 @@ function add_device_tree_xen_static_heap()
     dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
 }
 
+function add_device_tree_static_shared_mem()
+{
+    local path=$1
+    local shared_mem=$2
+    local shared_mem_id=${shared_mem%% *}
+    local regions="${shared_mem#* }"
+    local cells=()
+    local shared_mem_host=${regions%% *}
+
+    dt_mknode "${path}" "shared-mem@${shared_mem_host}"
+
+    for val in ${regions[@]}
+    do
+        cells+=("$(split_value $val)")
+    done
+
+    dt_set "${path}/shared-mem@${shared_mem_host}" "compatible" "str" "xen,domain-shared-memory-v1"
+    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shm-id" "str" "${shared_mem_id}"
+    dt_set "${path}/shared-mem@${shared_mem_host}" "xen,shared-mem" "hex" "${cells[*]}"
+}
+
 function add_device_tree_cpupools()
 {
     local cpu
@@ -329,6 +350,11 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
         fi
 
+        if test -n "${DOMU_SHARED_MEM[i]}"
+        then
+            add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_SHARED_MEM[i]}"
+        fi
+
         if test "${DOMU_COLORS[$i]}"
         then
             local startcolor=$(echo "${DOMU_COLORS[$i]}"  | cut -d "-" -f 1)
-- 
2.25.1



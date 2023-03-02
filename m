Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA86A7A9E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504331.776980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaqP-0006pn-3e; Thu, 02 Mar 2023 04:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504331.776980; Thu, 02 Mar 2023 04:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaqP-0006mt-02; Thu, 02 Mar 2023 04:47:05 +0000
Received: by outflank-mailman (input) for mailman id 504331;
 Thu, 02 Mar 2023 04:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXaqN-0006L7-TG
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:47:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 45ab1e52-b8b5-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 05:47:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A4E31FB;
 Wed,  1 Mar 2023 20:47:44 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D2303F99C;
 Wed,  1 Mar 2023 20:46:59 -0800 (PST)
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
X-Inumbo-ID: 45ab1e52-b8b5-11ed-a550-8520e6686977
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH 2/2] uboot-script-gen: Add support for static shared memory
Date: Thu,  2 Mar 2023 04:46:06 +0000
Message-Id: <20230302044606.136130-3-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302044606.136130-1-jiamei.xie@arm.com>
References: <20230302044606.136130-1-jiamei.xie@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for creating shared-mem node for dom0less domUs in
the device tree. Add the following options:
- DOMU_SHARED_MEM[number]="HPA GPA size"
  if specified, indicates the host physical address HPA will get mapped
  at guest address GPA in domU and the memory of size will be reserved
  to be shared memory.
- DOMU_SHARED_MEM_ID[number]
  An arbitrary string that represents the unique identifier of the shared
  memory region, with a strict limit on the number of characters(\0
  included)

The static shared memory is used between two dom0less domUs.

Below is an example:
NUM_DOMUS=2
DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
DOMU_SHARED_MEM[1]="0x50000000 0x6000000 0x10000000"
DOMU_SHARED_MEM_ID[1]="my-shared-mem-0"

This static shared memory region is identified as "my-shared-mem-0", host
physical address starting at 0x50000000 of 256MB will be reserved to be
shared between two domUs. It will get mapped at 0x6000000 in both guest
physical address space. Both DomUs are the borrower domain, the owner
domain is the default owner domain DOMID_IO.

Signed-off-by: jiamei.xie <jiamei.xie@arm.com>
---
 README.md                | 18 ++++++++++++++++++
 scripts/uboot-script-gen | 26 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/README.md b/README.md
index 787f413..48044ee 100644
--- a/README.md
+++ b/README.md
@@ -192,6 +192,24 @@ Where:
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
 
+- DOMU_SHARED_MEM[number]="HPA GPA size" and DOMU_SHARED_MEM_ID[number]
+  if specified, indicate the host physical address HPA will get mapped at
+  guest address GPA in domU and the memory of size will be reserved to be
+  shared memory. The shared memory is used between two dom0less domUs.
+
+  Below is an example:
+  NUM_DOMUS=2
+  DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
+  DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
+  DOMU_SHARED_MEM[1]="0x50000000 0x6000000 0x10000000"
+  DOMU_SHARED_MEM_ID[1]="my-shared-mem-0"
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
index 4775293..46215c8 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -204,6 +204,27 @@ function add_device_tree_static_heap()
     dt_set "$path" "xen,static-heap" "hex" "${cells[*]}"
 }
 
+function add_device_tree_static_shared_mem()
+{
+    local path=$1
+    local domid=$2
+    local regions=$3
+    local SHARED_MEM_ID=$4
+    local cells=()
+    local SHARED_MEM_HOST=${regions%% *}
+
+    dt_mknode "${path}" "domU${domid}-shared-mem@${SHARED_MEM_HOST}"
+
+    for val in ${regions[@]}
+    do
+        cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
+    done
+
+    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "compatible" "str" "xen,domain-shared-memory-v1"
+    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "xen,shm-id" "str" "${SHARED_MEM_ID}"
+    dt_set "${path}/domU${domid}-shared-mem@${SHARED_MEM_HOST}" "xen,shared-mem" "hex" "${cells[*]}"
+}
+
 function add_device_tree_cpupools()
 {
     local cpu
@@ -329,6 +350,11 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
         fi
 
+        if test -n "${DOMU_SHARED_MEM[i]}" -a -n "${DOMU_SHARED_MEM_ID[i]}"
+        then
+                add_device_tree_static_shared_mem "/chosen/domU${i}" "${i}" "${DOMU_SHARED_MEM[i]}" "${DOMU_SHARED_MEM_ID[i]}"
+        fi
+
         if test "${DOMU_COLORS[$i]}"
         then
             local startcolor=$(echo "${DOMU_COLORS[$i]}"  | cut -d "-" -f 1)
-- 
2.25.1



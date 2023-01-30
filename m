Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C86804BE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486483.753821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLQa-0004Bz-2w; Mon, 30 Jan 2023 04:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486483.753821; Mon, 30 Jan 2023 04:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLQZ-00048W-Vz; Mon, 30 Jan 2023 04:05:55 +0000
Received: by outflank-mailman (input) for mailman id 486483;
 Mon, 30 Jan 2023 04:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLQY-000485-MR
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:05:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 62d8f450-a053-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 05:05:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DAAE2F4;
 Sun, 29 Jan 2023 20:06:33 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14DDE3F64C;
 Sun, 29 Jan 2023 20:05:48 -0800 (PST)
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
X-Inumbo-ID: 62d8f450-a053-11ed-b8d1-410ff93cb8f0
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/3] xen/arm: Add memory overlap check for bootinfo.reserved_mem
Date: Mon, 30 Jan 2023 12:05:33 +0800
Message-Id: <20230130040535.188236-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040535.188236-1-Henry.Wang@arm.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we are having more and more types of static region, and all of
these static regions are defined in bootinfo.reserved_mem, it is
necessary to add the overlap check of reserved memory regions in Xen,
because such check will help user to identify the misconfiguration in
the device tree at the early stage of boot time.

Currently we have 3 types of static region, namely
(1) static memory
(2) static heap
(3) static shared memory

(1) and (2) are parsed by the function `device_tree_get_meminfo()` and
(3) is parsed using its own logic. All of parsed information of these
types will be stored in `struct meminfo`.

Therefore, to unify the overlap checking logic for all of these types,
this commit firstly introduces a helper `meminfo_overlap_check()` and
a function `check_reserved_regions_overlap()` to check if an input
physical address range is overlapping with the existing memory regions
defined in bootinfo. After that, use `check_reserved_regions_overlap()`
in `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
and replace the original overlap check of (3) with
`check_reserved_regions_overlap()`.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
1. Use "[start, end]" format in printk error message.
2. Change the return type of helper functions to bool.
3. Use 'start' and 'size' in helper functions to describe a region.
v1 -> v2:
1. Split original `overlap_check()` to `meminfo_overlap_check()`.
2. Rework commit message.
---
 xen/arch/arm/bootfdt.c           | 13 +++++-----
 xen/arch/arm/include/asm/setup.h |  2 ++
 xen/arch/arm/setup.c             | 41 ++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..e2f6c7324b 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -88,6 +88,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        if ( mem == &bootinfo.reserved_mem &&
+             check_reserved_regions_overlap(start, size) )
+            return -EINVAL;
         /* Some DT may describe empty bank, ignore them */
         if ( !size )
             continue;
@@ -482,7 +485,9 @@ static int __init process_shm_node(const void *fdt, int node,
                 return -EINVAL;
             }
 
-            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
+            if ( check_reserved_regions_overlap(paddr, size) )
+                return -EINVAL;
+            else
             {
                 if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
                     continue;
@@ -493,12 +498,6 @@ static int __init process_shm_node(const void *fdt, int node,
                     return -EINVAL;
                 }
             }
-            else
-            {
-                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
-                        mem->bank[i].start, bank_end);
-                return -EINVAL;
-            }
         }
     }
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index a926f30a2b..f0592370ea 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
 const char *boot_fdt_cmdline(const void *fdt);
 
+bool check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
+
 struct bootmodule *add_boot_module(bootmodule_kind kind,
                                    paddr_t start, paddr_t size, bool domU);
 struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 1f26f67b90..636604aafa 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -261,6 +261,32 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     cb(s, e);
 }
 
+static bool __init meminfo_overlap_check(struct meminfo *meminfo,
+                                         paddr_t region_start,
+                                         paddr_t region_size)
+{
+    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, bank_num = meminfo->nr_banks;
+
+    for ( i = 0; i < bank_num; i++ )
+    {
+        bank_start = meminfo->bank[i].start;
+        bank_end = bank_start + meminfo->bank[i].size;
+
+        if ( region_end <= bank_start || region_start >= bank_end )
+            continue;
+        else
+        {
+            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",
+                   region_start, region_end, i, bank_start, bank_end);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
                                   void (*cb)(paddr_t, paddr_t),
                                   unsigned int first)
@@ -271,7 +297,22 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
         cb(s, e);
 }
 
+/*
+ * Given an input physical address range, check if this range is overlapping
+ * with the existing reserved memory regions defined in bootinfo.
+ * Return true if the input physical address range is overlapping with any
+ * existing reserved memory regions, otherwise false.
+ */
+bool __init check_reserved_regions_overlap(paddr_t region_start,
+                                           paddr_t region_size)
+{
+    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
+    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
+                               region_start, region_size) )
+        return true;
 
+    return false;
+}
 
 struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                                           paddr_t start, paddr_t size,
-- 
2.25.1



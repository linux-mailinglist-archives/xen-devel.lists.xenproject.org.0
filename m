Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA36421BA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 03:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453111.710774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gL-0000Eg-HV; Mon, 05 Dec 2022 02:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453111.710774; Mon, 05 Dec 2022 02:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gL-0000Ci-Cf; Mon, 05 Dec 2022 02:58:13 +0000
Received: by outflank-mailman (input) for mailman id 453111;
 Mon, 05 Dec 2022 02:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p21gK-0000CU-Bq
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 02:58:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a5f7033c-7448-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 03:58:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48CFFD6E;
 Sun,  4 Dec 2022 18:58:15 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 806B53F73D;
 Sun,  4 Dec 2022 18:58:06 -0800 (PST)
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
X-Inumbo-ID: a5f7033c-7448-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: Add memory overlap check for bootinfo.reserved_mem
Date: Mon,  5 Dec 2022 10:57:51 +0800
Message-Id: <20221205025753.2178965-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205025753.2178965-1-Henry.Wang@arm.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we are having more and more types of static region, and all of
these static regions are defined in bootinfo.reserved_mem, it is
necessary to add the overlap check of reserved memory regions in Xen,
because such check will help user to identify the misconfiguration in
the device tree at the early stage of boot time.

Currently we have 3 types of static region, namely (1) static memory,
(2) static heap, (3) static shared memory. (1) and (2) are parsed by
the function `device_tree_get_meminfo()` and (3) is parsed using its
own logic. Therefore, to unify the checking logic for all of these
types of static region, this commit firstly introduces a helper
`check_reserved_regions_overlap()` to check if an input physical
address range is overlapping with the existing reserved memory regions
defined in bootinfo. After that, use this helper in
`device_tree_get_meminfo()` to do the overlap check of (1) and (2)
and replace the original overlap check of (3) with this new helper.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/bootfdt.c           | 13 ++++----
 xen/arch/arm/include/asm/setup.h |  2 ++
 xen/arch/arm/setup.c             | 52 ++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6014c0f852..b31379b9ac 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -91,6 +91,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        if ( mem == &bootinfo.reserved_mem &&
+             check_reserved_regions_overlap(start, size) )
+            return -EINVAL;
         /* Some DT may describe empty bank, ignore them */
         if ( !size )
             continue;
@@ -485,7 +488,9 @@ static int __init process_shm_node(const void *fdt, int node,
                 return -EINVAL;
             }
 
-            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
+            if ( check_reserved_regions_overlap(paddr, size) )
+                return -EINVAL;
+            else
             {
                 if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
                     continue;
@@ -496,12 +501,6 @@ static int __init process_shm_node(const void *fdt, int node,
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
index fdbf68aadc..6a9f88ecbb 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
 const char *boot_fdt_cmdline(const void *fdt);
 
+int check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
+
 struct bootmodule *add_boot_module(bootmodule_kind kind,
                                    paddr_t start, paddr_t size, bool domU);
 struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 4395640019..94d232605e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -270,6 +270,42 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     cb(s, e);
 }
 
+static int __init overlap_check(void *bootinfo_type,
+                                paddr_t region_start, paddr_t region_end)
+{
+    unsigned int i, num = 0;
+    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
+    char *type_str = "NONAME";
+
+    if ( bootinfo_type == &bootinfo.reserved_mem )
+    {
+        num = bootinfo.reserved_mem.nr_banks;
+        type_str = "reserved_mem";
+    }
+    else
+        panic("Invalid bootinfo type passed to overlap check\n");
+
+    for ( i = 0; i < num; i++ )
+    {
+        if ( bootinfo_type == &bootinfo.reserved_mem )
+        {
+            bank_start = bootinfo.reserved_mem.bank[i].start;
+            bank_end = bank_start + bootinfo.reserved_mem.bank[i].size;
+        }
+
+        if ( region_end <= bank_start || region_start >= bank_end )
+            continue;
+        else
+        {
+            printk("%s: Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
+                   type_str, region_start, region_end, i, bank_start, bank_end);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
                                   void (*cb)(paddr_t, paddr_t),
                                   unsigned int first)
@@ -280,7 +316,23 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
         cb(s, e);
 }
 
+/*
+ * Given an input physical address range, check if this range is overlapping
+ * with the existing reserved memory regions defined in bootinfo.
+ * Return 0 if the input physical address range is not overlapping with any
+ * existing reserved memory regions, otherwise -EINVAL.
+ */
+int __init check_reserved_regions_overlap(paddr_t region_start,
+                                          paddr_t region_size)
+{
+    paddr_t region_end = region_start + region_size;
 
+    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
+    if ( overlap_check(&bootinfo.reserved_mem, region_start, region_end) )
+        return -EINVAL;
+
+    return 0;
+}
 
 struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                                           paddr_t start, paddr_t size,
-- 
2.25.1



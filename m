Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071994C20F5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 02:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277854.474718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xr-0006Vm-Hu; Thu, 24 Feb 2022 01:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277854.474718; Thu, 24 Feb 2022 01:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN2xr-0006T7-DZ; Thu, 24 Feb 2022 01:30:39 +0000
Received: by outflank-mailman (input) for mailman id 277854;
 Thu, 24 Feb 2022 01:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85Ek=TH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nN2xq-0005xm-9N
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 01:30:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5e47312f-9511-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 02:30:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9318E1063;
 Wed, 23 Feb 2022 17:30:36 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FF063F5A1;
 Wed, 23 Feb 2022 17:30:34 -0800 (PST)
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
X-Inumbo-ID: 5e47312f-9511-11ec-8539-5f4723681683
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	julien@xen.org
Cc: Bertrand.Marquis@arm.com,
	wei.chen@arm.com,
	penny.zheng@arm.com,
	Henry.Wang@arm.com
Subject: [RFC PATCH 2/2] xen/arm: Handle reserved Xenheap pages in boot/heap allocator
Date: Thu, 24 Feb 2022 01:30:23 +0000
Message-Id: <20220224013023.50920-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224013023.50920-1-Henry.Wang@arm.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>

This commit firstly adds a global variable `reserved_heap`.
This newly introduced global variable is set at the device tree
parsing time if the reserved Xenheap ranges are defined in the
device tree chosen node.

In `setup_mm`, If the reserved Xenheap is enabled and used, we
make sure that these reserved Xenheap pages are added to the boot
allocator. Otherwise there would be a case that if all available
memory is used for the reserved Xenheap, the boot allocator will
contain zero page at boot time and eventually cause failures.

These reserved Xenheap pages in the boot allocator are added to the
heap allocator at `end_boot_allocator()`.

If the reserved Xenheap is disabled, we stick to the current page
allocation strategy at boot time.

Also, this commit removes some unneeded brackets in `setup_mm`
following the Xen coding style.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/bootfdt.c           |  2 ++
 xen/arch/arm/include/asm/setup.h |  2 ++
 xen/arch/arm/setup.c             | 52 +++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index cc360cfd07..588f1e3aeb 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -328,6 +328,8 @@ static int __init process_chosen_node(const void *fdt, int node,
                                      true);
         if ( rc )
             return rc;
+
+        reserved_heap = true;
     }
 
     printk("Checking for initrd in /chosen\n");
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 188a85c51c..fef9d0f378 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -92,6 +92,8 @@ extern struct bootinfo bootinfo;
 
 extern domid_t max_init_domid;
 
+extern bool reserved_heap;
+
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..2bb20deac5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
 
 domid_t __read_mostly max_init_domid;
 
+bool reserved_heap;
+
 static __used void init_done(void)
 {
     /* Must be done past setting system_state. */
@@ -772,41 +774,61 @@ static void __init setup_mm(void)
     paddr_t ram_start = ~0;
     paddr_t ram_end = 0;
     paddr_t ram_size = 0;
+    paddr_t bank_start = ~0;
+    paddr_t bank_size = 0;
+    paddr_t bank_end = 0;
     int bank;
 
     init_pdx();
 
+    if ( reserved_heap )
+    {
+        for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+        {
+            if ( bootinfo.reserved_mem.bank[bank].xen_heap )
+            {
+                bank_start = bootinfo.reserved_mem.bank[bank].start;
+                bank_size = bootinfo.reserved_mem.bank[bank].size;
+                bank_end = bank_start + bank_size;
+
+                init_boot_pages(bank_start, bank_end);
+            }
+        }
+    }
+
     total_pages = 0;
     for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
     {
-        paddr_t bank_start = bootinfo.mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.mem.bank[bank].size;
-        paddr_t bank_end = bank_start + bank_size;
         paddr_t s, e;
 
+        bank_start = bootinfo.mem.bank[bank].start;
+        bank_size = bootinfo.mem.bank[bank].size;
+        bank_end = bank_start + bank_size;
+
         ram_size = ram_size + bank_size;
         ram_start = min(ram_start,bank_start);
         ram_end = max(ram_end,bank_end);
 
         setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
 
-        s = bank_start;
-        while ( s < bank_end )
+        if ( !reserved_heap )
         {
-            paddr_t n = bank_end;
+            s = bank_start;
+            while ( s < bank_end )
+            {
+                paddr_t n = bank_end;
 
-            e = next_module(s, &n);
+                e = next_module(s, &n);
 
-            if ( e == ~(paddr_t)0 )
-            {
-                e = n = bank_end;
-            }
+                if ( e == ~(paddr_t)0 )
+                    e = n = bank_end;
 
-            if ( e > bank_end )
-                e = bank_end;
+                if ( e > bank_end )
+                    e = bank_end;
 
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
-            s = n;
+                fw_unreserved_regions(s, e, init_boot_pages, 0);
+                s = n;
+            }
         }
     }
 
-- 
2.17.1



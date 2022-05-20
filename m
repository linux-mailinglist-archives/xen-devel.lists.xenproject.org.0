Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122752EBB9
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333989.557955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wo-0003kU-2e; Fri, 20 May 2022 12:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333989.557955; Fri, 20 May 2022 12:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wn-0003c3-OA; Fri, 20 May 2022 12:14:45 +0000
Received: by outflank-mailman (input) for mailman id 333989;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003NU-S7
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005wY-NE; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sp-0001lI-V2; Fri, 20 May 2022 12:10:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=/p4UF49sOqtR4ILsBBu0AgkjXqEpW9beFbXzPB2vh14=; b=RqVcFZF6NOBVK1/WkZJeoI26DI
	KjGigIBdadzMlNjOeFHlUxYSOA4GqqHVuYh4RYON/Zew2s28W4WPqgZFlbArO5ZqEvhFrfZv1QEK/
	dIJGEL6krsspXyYMhrNhKLKfPpfI2gg26QDRiumPAdCX567ojsYK1djN0jqTD/itkY1k=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 14/16] xen/arm64: mm: Add memory to the boot allocator first
Date: Fri, 20 May 2022 13:09:35 +0100
Message-Id: <20220520120937.28925-15-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, memory is added to the boot allocator after the xenheap
mappings are done. This will break if the first mapping is more than
512GB of RAM.

In addition to that, a follow-up patch will rework setup_xenheap_mappings()
to use smaller mappings (e.g. 2MB, 4KB). So it will be necessary to have
memory in the boot allocator earlier.

Only free memory (e.g. not reserved or modules) can be added to the boot
allocator. It might be possible that some regions (including the first
one) will have no free memory.

So we need to add all the free memory to the boot allocator first
and then add do the mappings.

Populating the boot allocator is nearly the same between arm32 and
arm64. The only difference is on the former we need to exclude the
xenheap for the boot allocator. Gate the difference with CONFIG_ARM_32
so the code be re-used on arm64.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v4:
        - The implementation of populate_boot_allocator() has been
          moved in a separate patch.
        - Fix typo

    Changes in v3:
        - Patch added
---
 xen/arch/arm/setup.c | 55 +++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3d5a2283d4ef..db1768c03f03 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -636,13 +636,12 @@ static void __init init_staticmem_pages(void)
 #endif
 }
 
-#ifdef CONFIG_ARM_32
 /*
  * Populate the boot allocator. All the RAM but the following regions
  * will be added:
  *  - Modules (e.g., Xen, Kernel)
  *  - Reserved regions
- *  - Xenheap
+ *  - Xenheap (arm32 only)
  */
 static void __init populate_boot_allocator(void)
 {
@@ -672,6 +671,7 @@ static void __init populate_boot_allocator(void)
             if ( e > bank_end )
                 e = bank_end;
 
+#ifdef CONFIG_ARM_32
             /* Avoid the xenheap */
             if ( s < mfn_to_maddr(xenheap_mfn_end) &&
                  mfn_to_maddr(xenheap_mfn_start) < e )
@@ -679,6 +679,7 @@ static void __init populate_boot_allocator(void)
                 e = mfn_to_maddr(xenheap_mfn_start);
                 n = mfn_to_maddr(xenheap_mfn_end);
             }
+#endif
 
             fw_unreserved_regions(s, e, init_boot_pages, 0);
             s = n;
@@ -686,6 +687,7 @@ static void __init populate_boot_allocator(void)
     }
 }
 
+#ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
     paddr_t ram_start, ram_end, ram_size, e;
@@ -781,45 +783,36 @@ static void __init setup_mm(void)
 #else /* CONFIG_ARM_64 */
 static void __init setup_mm(void)
 {
+    const struct meminfo *banks = &bootinfo.mem;
     paddr_t ram_start = ~0;
     paddr_t ram_end = 0;
     paddr_t ram_size = 0;
-    int bank;
+    unsigned int i;
 
     init_pdx();
 
-    total_pages = 0;
-    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
-    {
-        paddr_t bank_start = bootinfo.mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.mem.bank[bank].size;
-        paddr_t bank_end = bank_start + bank_size;
-        paddr_t s, e;
-
-        ram_size = ram_size + bank_size;
-        ram_start = min(ram_start,bank_start);
-        ram_end = max(ram_end,bank_end);
-
-        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
-
-        s = bank_start;
-        while ( s < bank_end )
-        {
-            paddr_t n = bank_end;
+    /*
+     * We need some memory to allocate the page-tables used for the xenheap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplicity, add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
 
-            e = next_module(s, &n);
+    total_pages = 0;
 
-            if ( e == ~(paddr_t)0 )
-            {
-                e = n = bank_end;
-            }
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_end = bank->start + bank->size;
 
-            if ( e > bank_end )
-                e = bank_end;
+        ram_size = ram_size + bank->size;
+        ram_start = min(ram_start, bank->start);
+        ram_end = max(ram_end, bank_end);
 
-            fw_unreserved_regions(s, e, init_boot_pages, 0);
-            s = n;
-        }
+        setup_xenheap_mappings(PFN_DOWN(bank->start),
+                               PFN_DOWN(bank->size));
     }
 
     total_pages += ram_size >> PAGE_SHIFT;
-- 
2.32.0



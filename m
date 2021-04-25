Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994D36A934
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117361.223271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQP-0004Uy-Ii; Sun, 25 Apr 2021 20:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117361.223271; Sun, 25 Apr 2021 20:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQP-0004U0-1Y; Sun, 25 Apr 2021 20:32:17 +0000
Received: by outflank-mailman (input) for mailman id 117361;
 Sun, 25 Apr 2021 20:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalQL-0004RN-TQ
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalQL-0001A1-FU; Sun, 25 Apr 2021 20:32:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8S-0005m7-I0; Sun, 25 Apr 2021 20:13:44 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=kWwF6/XiImdq/NMXQrU9YONcKwipFpia2KSsKJxknoU=; b=fuqgFWg/KYT7rBgGpcjFUhEDq
	wF64yv2LQnpsv33Z7VtoKGU67NQb+prKwQkNbVylwDYBIAChrckdb3+aPe9pjsdONt7cI9jsj3m5/
	+KpYjEY0MTcKXzpJf2BI1nEDzCn0NunKJphZQU5WK/1shoDKv3v20HUzbRhtzhXKpJy7I=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH RFCv2 14/15] xen/arm: mm: Rework setup_xenheap_mappings()
Date: Sun, 25 Apr 2021 21:13:17 +0100
Message-Id: <20210425201318.15447-15-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

A few issues have been reported with setup_xenheap_mappings() over the
last couple of years. The main ones are:
    - It will break on platform supporting more than 512GB of RAM
      because the memory allocated by the boot allocator is not yet
      mapped.
    - Aligning all the regions to 1GB may lead to unexpected result
      because we may alias non-cacheable region (such as device or reserved
      regions).

map_pages_to_xen() was recently reworked to allow superpage mappings and
deal with the use of page-tables before they are mapped.

Most of the code in setup_xenheap_mappings() is now replaced with a
single call to map_pages_to_xen().

This also require to re-order the steps setup_mm() so the regions are
given to the boot allocator first and then we setup the xenheap
mappings.

Note that the 1GB alignment is not yet removed.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch

    TODO:
        - Remove the 1GB alignment
        - Add support for setting the contiguous bit
---
 xen/arch/arm/mm.c    | 60 ++++----------------------------------------
 xen/arch/arm/setup.c | 10 ++++++--
 2 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index f5768f2d4a81..c49403b687f5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -143,17 +143,6 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
 static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
 #endif
 
-#ifdef CONFIG_ARM_64
-/* The first page of the first level mapping of the xenheap. The
- * subsequent xenheap first level pages are dynamically allocated, but
- * we need this one to bootstrap ourselves. */
-static DEFINE_PAGE_TABLE(xenheap_first_first);
-/* The zeroeth level slot which uses xenheap_first_first. Used because
- * setup_xenheap_mappings otherwise relies on mfn_to_virt which isn't
- * valid for a non-xenheap mapping. */
-static __initdata int xenheap_first_first_slot = -1;
-#endif
-
 /* Common pagetable leaves */
 /* Second level page tables.
  *
@@ -818,9 +807,9 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
 void __init setup_xenheap_mappings(unsigned long base_mfn,
                                    unsigned long nr_mfns)
 {
-    lpae_t *first, pte;
     unsigned long mfn, end_mfn;
     vaddr_t vaddr;
+    int rc;
 
     /* Align to previous 1GB boundary */
     mfn = base_mfn & ~((FIRST_SIZE>>PAGE_SHIFT)-1);
@@ -846,49 +835,10 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
      */
     vaddr = (vaddr_t)__mfn_to_virt(base_mfn) & FIRST_MASK;
 
-    while ( mfn < end_mfn )
-    {
-        int slot = zeroeth_table_offset(vaddr);
-        lpae_t *p = &xen_pgtable[slot];
-
-        if ( p->pt.valid )
-        {
-            /* mfn_to_virt is not valid on the 1st 1st mfn, since it
-             * is not within the xenheap. */
-            first = slot == xenheap_first_first_slot ?
-                xenheap_first_first : mfn_to_virt(lpae_get_mfn(*p));
-        }
-        else if ( xenheap_first_first_slot == -1)
-        {
-            /* Use xenheap_first_first to bootstrap the mappings */
-            first = xenheap_first_first;
-
-            pte = pte_of_xenaddr((vaddr_t)xenheap_first_first);
-            pte.pt.table = 1;
-            write_pte(p, pte);
-
-            xenheap_first_first_slot = slot;
-        }
-        else
-        {
-            mfn_t first_mfn = alloc_boot_pages(1, 1);
-
-            clear_page(mfn_to_virt(first_mfn));
-            pte = mfn_to_xen_entry(first_mfn, MT_NORMAL);
-            pte.pt.table = 1;
-            write_pte(p, pte);
-            first = mfn_to_virt(first_mfn);
-        }
-
-        pte = mfn_to_xen_entry(_mfn(mfn), MT_NORMAL);
-        /* TODO: Set pte.pt.contig when appropriate. */
-        write_pte(&first[first_table_offset(vaddr)], pte);
-
-        mfn += FIRST_SIZE>>PAGE_SHIFT;
-        vaddr += FIRST_SIZE;
-    }
-
-    flush_xen_tlb_local();
+    rc = map_pages_to_xen(vaddr, _mfn(mfn), end_mfn - mfn,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the xenheap mappings.\n");
 }
 #endif
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 00aad1c194b9..0993a4bb52d4 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -761,8 +761,11 @@ static void __init setup_mm(void)
         ram_start = min(ram_start,bank_start);
         ram_end = max(ram_end,bank_end);
 
-        setup_xenheap_mappings(bank_start>>PAGE_SHIFT, bank_size>>PAGE_SHIFT);
-
+        /*
+         * Add the region to the boot allocator first, so we can use
+         * some to allocate page-tables for setting up the xenheap
+         * mappings.
+         */
         s = bank_start;
         while ( s < bank_end )
         {
@@ -781,6 +784,9 @@ static void __init setup_mm(void)
             fw_unreserved_regions(s, e, init_boot_pages, 0);
             s = n;
         }
+
+        setup_xenheap_mappings(bank_start >> PAGE_SHIFT,
+                               bank_size >> PAGE_SHIFT);
     }
 
     total_pages += ram_size >> PAGE_SHIFT;
-- 
2.17.1



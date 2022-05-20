Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E952EBBB
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333991.557975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wp-00047Q-Aj; Fri, 20 May 2022 12:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333991.557975; Fri, 20 May 2022 12:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wo-0003vf-S0; Fri, 20 May 2022 12:14:46 +0000
Received: by outflank-mailman (input) for mailman id 333991;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003Nd-Tk
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005we-Oq; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sr-0001lI-38; Fri, 20 May 2022 12:10:41 +0000
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
	bh=41WjXhbveDV5dmNCQg1PHVgqE6S+lfA5Dgi2tBRYmT0=; b=sZoYCpyBcFzHWZlYss8ssgcJBg
	ZCC9jzSuNV0zXOmMwhY6dEB7lqRhdIJuoWSebGFUDYQGwbVbq1NKe0tpccxEASdhs/B7XKNDv5d26
	1PJsLbQ+CVjSrKVjX54SZdXZe5AyZ6LUcfJeXIXviwddedkf4qOKLwAKdRQZLlIStO7A=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 15/16] xen/arm: mm: Rework setup_xenheap_mappings()
Date: Fri, 20 May 2022 13:09:36 +0100
Message-Id: <20220520120937.28925-16-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

The current implementation of setup_xenheap_mappings() is using 1GB
mappings. This can lead to unexpected result because the mapping
may alias a non-cachable region (such as device or reserved regions).
For more details see B2.8 in ARM DDI 0487H.a.

map_pages_to_xen() was recently reworked to allow superpage mappings,
support contiguous mapping and deal with the use of page-tables before
they are mapped.

Most of the code in setup_xenheap_mappings() is now replaced with a
single call to map_pages_to_xen().

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v4:
        - Fix typo
        - Add Stefano's reviewed-by

    Changes in v3:
        - Don't use 1GB mapping
        - Re-order code in setup_mm() in a separate patch

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 87 ++++++++++-------------------------------------
 1 file changed, 18 insertions(+), 69 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b019e4b35b55..65af44f42232 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -138,17 +138,6 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
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
@@ -831,77 +820,37 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
 void __init setup_xenheap_mappings(unsigned long base_mfn,
                                    unsigned long nr_mfns)
 {
-    lpae_t *first, pte;
-    unsigned long mfn, end_mfn;
-    vaddr_t vaddr;
-
-    /* Align to previous 1GB boundary */
-    mfn = base_mfn & ~((FIRST_SIZE>>PAGE_SHIFT)-1);
+    int rc;
 
     /* First call sets the xenheap physical and virtual offset. */
     if ( mfn_eq(xenheap_mfn_start, INVALID_MFN) )
     {
+        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
+
         xenheap_mfn_start = _mfn(base_mfn);
         xenheap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
+        /*
+         * The base address may not be aligned to the first level
+         * size (e.g. 1GB when using 4KB pages). This would prevent
+         * superpage mappings for all the regions because the virtual
+         * address and machine address should both be suitably aligned.
+         *
+         * Prevent that by offsetting the start of the xenheap virtual
+         * address.
+         */
         xenheap_virt_start = DIRECTMAP_VIRT_START +
-            (base_mfn - mfn) * PAGE_SIZE;
+            (base_mfn - mfn_gb) * PAGE_SIZE;
     }
 
     if ( base_mfn < mfn_x(xenheap_mfn_start) )
         panic("cannot add xenheap mapping at %lx below heap start %lx\n",
               base_mfn, mfn_x(xenheap_mfn_start));
 
-    end_mfn = base_mfn + nr_mfns;
-
-    /*
-     * Virtual address aligned to previous 1GB to match physical
-     * address alignment done above.
-     */
-    vaddr = (vaddr_t)__mfn_to_virt(base_mfn) & FIRST_MASK;
-
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
+    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
+                          _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the xenheap mappings.\n");
 }
 #endif
 
-- 
2.32.0



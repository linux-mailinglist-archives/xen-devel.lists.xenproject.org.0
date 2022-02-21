Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ED4BD933
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276098.472202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HW-0007YM-VH; Mon, 21 Feb 2022 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276098.472202; Mon, 21 Feb 2022 10:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HW-0007OX-AT; Mon, 21 Feb 2022 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 276098;
 Mon, 21 Feb 2022 10:50:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HS-0006TD-Nq
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lv-Lv; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5q6-00070b-S4; Mon, 21 Feb 2022 10:22:43 +0000
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
	bh=9KLsMofNLy3j5de3pHJ2lPBADdkm64K7Ef3aTBPoXCg=; b=EjhcJAJOyC8rFVXQZJre5dJ2cS
	aBLNvlIDzKRFWDtl4HIrCxCQTl/vj3qIfuMKuwaZS5Zmy1QlE4m/ssrIA0gGmIHre40zkc2DYsiJU
	xPeoJ3octnCgPeYm83iM77GKyhZAIihkiqUTJLd/gO2W0jsEDkprdezTgf6Z22cIHuhA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 19/19] xen/arm: mm: Re-implement setup_frame_table_mappings() with map_pages_to_xen()
Date: Mon, 21 Feb 2022 10:22:18 +0000
Message-Id: <20220221102218.33785-20-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() call by map_pages_to_xen() call.

This has the advantage to remove the differences between 32-bit and
64-bit code.

Lastly remove create_mappings() as there is no more callers.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Fix typo in the commit message
        - Remove the TODO regarding contiguous bit

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 63 ++++-------------------------------------------
 1 file changed, 5 insertions(+), 58 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 4af59375d998..d73f49d5b6fc 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -354,40 +354,6 @@ void clear_fixmap(unsigned map)
     BUG_ON(res != 0);
 }
 
-/* Create Xen's mappings of memory.
- * Mapping_size must be either 2MB or 32MB.
- * Base and virt must be mapping_size aligned.
- * Size must be a multiple of mapping_size.
- * second must be a contiguous set of second level page tables
- * covering the region starting at virt_offset. */
-static void __init create_mappings(lpae_t *second,
-                                   unsigned long virt_offset,
-                                   unsigned long base_mfn,
-                                   unsigned long nr_mfns,
-                                   unsigned int mapping_size)
-{
-    unsigned long i, count;
-    const unsigned long granularity = mapping_size >> PAGE_SHIFT;
-    lpae_t pte, *p;
-
-    ASSERT((mapping_size == MB(2)) || (mapping_size == MB(32)));
-    ASSERT(!((virt_offset >> PAGE_SHIFT) % granularity));
-    ASSERT(!(base_mfn % granularity));
-    ASSERT(!(nr_mfns % granularity));
-
-    count = nr_mfns / XEN_PT_LPAE_ENTRIES;
-    p = second + second_linear_offset(virt_offset);
-    pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
-    if ( granularity == 16 * XEN_PT_LPAE_ENTRIES )
-        pte.pt.contig = 1;  /* These maps are in 16-entry contiguous chunks. */
-    for ( i = 0; i < count; i++ )
-    {
-        write_pte(p + i, pte);
-        pte.pt.base += 1 << XEN_PT_LPAE_SHIFT;
-    }
-    flush_xen_tlb_local();
-}
-
 #ifdef CONFIG_DOMAIN_PAGE
 void *map_domain_page_global(mfn_t mfn)
 {
@@ -846,36 +812,17 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
     mfn_t base_mfn;
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
-#ifdef CONFIG_ARM_64
-    lpae_t *second, pte;
-    unsigned long nr_second;
-    mfn_t second_base;
-    int i;
-#endif
+    int rc;
 
     frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
     /* Round up to 2M or 32M boundary, as appropriate. */
     frametable_size = ROUNDUP(frametable_size, mapping_size);
     base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
 
-#ifdef CONFIG_ARM_64
-    /* Compute the number of second level pages. */
-    nr_second = ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
-    second_base = alloc_boot_pages(nr_second, 1);
-    second = mfn_to_virt(second_base);
-    for ( i = 0; i < nr_second; i++ )
-    {
-        clear_page(mfn_to_virt(mfn_add(second_base, i)));
-        pte = mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
-        pte.pt.table = 1;
-        write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i], pte);
-    }
-    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >> PAGE_SHIFT,
-                    mapping_size);
-#else
-    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
-                    frametable_size >> PAGE_SHIFT, mapping_size);
-#endif
+    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          frametable_size >> PAGE_SHIFT, PAGE_HYPERVISOR_RW);
+    if ( rc )
+        panic("Unable to setup the frametable mappings.\n");
 
     memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
     memset(&frame_table[nr_pdxs], -1,
-- 
2.32.0



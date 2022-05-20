Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3852EBB5
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333986.557935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wm-0003Pl-TM; Fri, 20 May 2022 12:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333986.557935; Fri, 20 May 2022 12:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wm-0003Nx-Pz; Fri, 20 May 2022 12:14:44 +0000
Received: by outflank-mailman (input) for mailman id 333986;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003NF-Od
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005wQ-Gq; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Ss-0001lI-7T; Fri, 20 May 2022 12:10:42 +0000
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
	bh=7kkcUtTj63g7Kwg1pXZqqsSOsowp6Vr0NeH5tERRvKE=; b=Y/a0/6lqiOd+ENWCW26KMos1CT
	IaBH4JCumNkQJzAc5WJwRhRuYudmnr30I+g1PGh1IbPw6S5ql5Jyur0RS7RrTsGnnCCUugQmf58F0
	zp+VjvgR9JrglKY39gKq8IQgbAvetjSL8qW//zW1WX3mjX9E7s3R7x5prKh+NnG5VgLQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 16/16] xen/arm: mm: Re-implement setup_frame_table_mappings() with map_pages_to_xen()
Date: Fri, 20 May 2022 13:09:37 +0100
Message-Id: <20220520120937.28925-17-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
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
    Changes in v4:
        - Add missing _PAGE_BLOCK

    Changes in v3:
        - Fix typo in the commit message
        - Remove the TODO regarding contiguous bit

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 64 +++++------------------------------------------
 1 file changed, 6 insertions(+), 58 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 65af44f42232..be37176a4725 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -369,40 +369,6 @@ void clear_fixmap(unsigned map)
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
@@ -862,36 +828,18 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
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
+                          frametable_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the frametable mappings.\n");
 
     memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
     memset(&frame_table[nr_pdxs], -1,
-- 
2.32.0



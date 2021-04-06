Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5817355189
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105802.202395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXM-0004Jc-FC; Tue, 06 Apr 2021 11:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105802.202395; Tue, 06 Apr 2021 11:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXM-0004J2-A9; Tue, 06 Apr 2021 11:06:24 +0000
Received: by outflank-mailman (input) for mailman id 105802;
 Tue, 06 Apr 2021 11:06:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXK-0004Hr-ST
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXK-00053A-KC; Tue, 06 Apr 2021 11:06:22 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXK-0002qD-2L; Tue, 06 Apr 2021 11:06:22 +0000
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
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=s1xYw5JRA0hX+hVyYpDhdvIQg52C43B8RF1tdty6+gI=; b=q
	rvO47LJf+Qx69S/KtsguvWew2ZpWZu6weBHn63fYk6YFjXcT+Ge+BULkx4s/rtdrm2wSly1NafdKP
	J79mwlq8crEPjt9GOzE4fq8gmJxmwhtonCmBaNt9Z6rnzC5p6pQp/f6IjABwCySb+QiO56TlbrfzV
	qJfq8CmpFC2ba8M8=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 04/13] x86_64/mm: introduce pl2e in paging_init
Date: Tue,  6 Apr 2021 12:05:52 +0100
Message-Id: <836cc0def0609a5f4495491b1c4994fc044cfbef.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

We will soon map and unmap pages in paging_init(). Introduce pl2e so
that we can use l2_ro_mpt to point to the page table itself.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- reword commit message.
---
 xen/arch/x86/x86_64/mm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index bce1561e1a80..c5a47df01bde 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -496,7 +496,7 @@ void __init paging_init(void)
     unsigned long i, mpt_size, va;
     unsigned int n, memflags;
     l3_pgentry_t *l3_ro_mpt;
-    l2_pgentry_t *l2_ro_mpt = NULL;
+    l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
 
     /*
@@ -546,7 +546,7 @@ void __init paging_init(void)
             (L2_PAGETABLE_SHIFT - 3 + PAGE_SHIFT)));
 
         if ( cpu_has_page1gb &&
-             !((unsigned long)l2_ro_mpt & ~PAGE_MASK) &&
+             !((unsigned long)pl2e & ~PAGE_MASK) &&
              (mpt_size >> L3_PAGETABLE_SHIFT) > (i >> PAGETABLE_ORDER) )
         {
             unsigned int k, holes;
@@ -606,7 +606,7 @@ void __init paging_init(void)
             memset((void *)(RDWR_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT)),
                    0xFF, 1UL << L2_PAGETABLE_SHIFT);
         }
-        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
+        if ( !((unsigned long)pl2e & ~PAGE_MASK) )
         {
             if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
                 goto nomem;
@@ -614,13 +614,14 @@ void __init paging_init(void)
             l3e_write(&l3_ro_mpt[l3_table_offset(va)],
                       l3e_from_paddr(__pa(l2_ro_mpt),
                                      __PAGE_HYPERVISOR_RO | _PAGE_USER));
+            pl2e = l2_ro_mpt;
             ASSERT(!l2_table_offset(va));
         }
         /* NB. Cannot be GLOBAL: guest user mode should not see it. */
         if ( l1_pg )
-            l2e_write(l2_ro_mpt, l2e_from_page(
+            l2e_write(pl2e, l2e_from_page(
                 l1_pg, /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
-        l2_ro_mpt++;
+        pl2e++;
     }
 #undef CNT
 #undef MFN
@@ -632,6 +633,7 @@ void __init paging_init(void)
             goto nomem;
         compat_idle_pg_table_l2 = l2_ro_mpt;
         clear_page(l2_ro_mpt);
+        pl2e = l2_ro_mpt;
 
         /* Allocate and map the compatibility mode machine-to-phys table. */
         mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
@@ -649,7 +651,7 @@ void __init paging_init(void)
              sizeof(*compat_machine_to_phys_mapping))
     BUILD_BUG_ON((sizeof(*frame_table) & ~sizeof(*frame_table)) % \
                  sizeof(*compat_machine_to_phys_mapping));
-    for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, l2_ro_mpt++ )
+    for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, pl2e++ )
     {
         memflags = MEMF_node(phys_to_nid(i <<
             (L2_PAGETABLE_SHIFT - 2 + PAGE_SHIFT)));
@@ -671,7 +673,7 @@ void __init paging_init(void)
                         (i << L2_PAGETABLE_SHIFT)),
                0xFF, 1UL << L2_PAGETABLE_SHIFT);
         /* NB. Cannot be GLOBAL as the ptes get copied into per-VM space. */
-        l2e_write(l2_ro_mpt, l2e_from_page(l1_pg, _PAGE_PSE|_PAGE_PRESENT));
+        l2e_write(pl2e, l2e_from_page(l1_pg, _PAGE_PSE|_PAGE_PRESENT));
     }
 #undef CNT
 #undef MFN
-- 
2.23.3



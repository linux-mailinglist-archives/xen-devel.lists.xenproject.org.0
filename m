Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DC4CDC10
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284436.483812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUO-0006Va-UJ; Fri, 04 Mar 2022 18:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284436.483812; Fri, 04 Mar 2022 18:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUM-0005w8-Qf; Fri, 04 Mar 2022 18:17:14 +0000
Received: by outflank-mailman (input) for mailman id 284436;
 Fri, 04 Mar 2022 17:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2E-0005R4-RQ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:10 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4168c134-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:10 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2D-00007P-6W; Fri, 04 Mar 2022 18:48:09 +0100
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
X-Inumbo-ID: 4168c134-9be3-11ec-8eba-a37418f5ba1a
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>,
	Luca Miccio <206497@studenti.unimore.it>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 21/36] xen/common: add colored allocator initialization
Date: Fri,  4 Mar 2022 18:46:46 +0100
Message-Id: <20220304174701.1453977-22-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Initialize colored heap and allocator data structures. It is assumed
that pages are given to the init function is in ascending order. To
ensure that, pages are retrieved from bootmem_regions starting from the
first one. Moreover, this allows quickly insertion of freed pages into
the colored allocator's internal data structures -- sorted lists.
If coloring is disabled, changing the free page order should not affect
both performance and functionalities of the buddy allocator.

Do not allocate Dom0 memory with direct mapping if colored is enabled.

Signed-off-by: Luca Miccio <206497@studenti.unimore.it>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c |  7 +++++-
 xen/common/page_alloc.c     | 43 +++++++++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9630d00066..03a2573d67 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3292,7 +3292,12 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type = kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
+#ifdef CONFIG_COLORING
+    if ( d->max_colors )
+        allocate_memory(d, &kinfo);
+    else
+#endif
+        allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index fffa438029..dea14bc39f 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2154,11 +2154,26 @@ void __init end_boot_allocator(void)
             break;
         }
     }
-    for ( i = nr_bootmem_regions; i-- > 0; )
+
+    for ( i = 0; i < nr_bootmem_regions; i++ )
     {
         struct bootmem_region *r = &bootmem_region_list[i];
-        if ( r->s < r->e )
-            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
+
+        /*
+         * Find the first region that can fill the buddy allocator memory
+         * specified by buddy_required_size.
+         */
+        if ( buddy_required_size && (r->e - r->s) >
+            PFN_DOWN(buddy_required_size) )
+        {
+            init_heap_pages(mfn_to_page(_mfn(r->s)),
+                PFN_DOWN(buddy_required_size));
+
+            r->s += PFN_DOWN(buddy_required_size);
+            buddy_required_size = 0;
+        }
+
+        init_col_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
     }
     nr_bootmem_regions = 0;
 
@@ -2619,9 +2634,12 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+             (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
 
-        page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
+        if ( is_page_colored(pg) )
+            page_list_add(&pg[i], page_to_list(d, &pg[i]));
+        else
+            page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
  out:
@@ -2642,6 +2660,15 @@ struct page_info *alloc_domheap_pages(
     unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
     unsigned int dma_zone;
 
+    /* Only Dom0 and DomUs are supported for coloring */
+    if ( d && d->max_colors > 0 )
+    {
+        /* Colored allocation must be done on 0 order */
+        if (order)
+            return NULL;
+
+        return alloc_col_domheap_page(d, memflags);
+    }
     ASSERT(!in_irq());
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
@@ -2761,8 +2788,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
-    }
+        if ( is_page_colored(pg) )
+            free_col_heap_page(pg);
+        else
+            free_heap_pages(pg, order, scrub);}
 
     if ( drop_dom_ref )
         put_domain(d);
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9864EADB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464436.722897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DC-0005fa-F8; Fri, 16 Dec 2022 11:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464436.722897; Fri, 16 Dec 2022 11:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DC-0005Rw-3G; Fri, 16 Dec 2022 11:49:10 +0000
Received: by outflank-mailman (input) for mailman id 464436;
 Fri, 16 Dec 2022 11:49:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69DA-0005H5-K8
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69DA-0002FH-JS
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:08 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DA-0004sN-CE; Fri, 16 Dec 2022 11:49:08 +0000
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
	bh=I796InQwp8GJ7wl8yn2SnJLasp1DLu8CI/8eIrqjbEo=; b=G3ocwq2f+UdE70Au4tGaHIKKiL
	UnMPqJfwBzJtirFdxcw08AvdAHC3MGXpc/BIoRFsd9HNxPyUXfOY+KR/lP0J0XTcXjmwACt5RlQ8B
	FyOqw5evHPepZDsub1Qd0y8p80o66DUg3nZY2gRwrtyO8L3lFgmUutzzNu334GKoHo1w=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 08/22] x86/pv: rewrite how building PV dom0 handles domheap mappings
Date: Fri, 16 Dec 2022 11:48:39 +0000
Message-Id: <20221216114853.8227-9-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

Building a PV dom0 is allocating from the domheap but uses it like the
xenheap. This is clearly wrong. Fix.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes since Hongyan's version:
        * Rebase
        * Remove spurious newline
---
 xen/arch/x86/pv/dom0_build.c | 56 +++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c837b2d96f89..cd60f259d1b7 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -383,6 +383,10 @@ int __init dom0_construct_pv(struct domain *d,
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
     l1_pgentry_t *l1tab = NULL, *l1start = NULL;
+    mfn_t l4start_mfn = INVALID_MFN;
+    mfn_t l3start_mfn = INVALID_MFN;
+    mfn_t l2start_mfn = INVALID_MFN;
+    mfn_t l1start_mfn = INVALID_MFN;
 
     /*
      * This fully describes the memory layout of the initial domain. All
@@ -711,22 +715,32 @@ int __init dom0_construct_pv(struct domain *d,
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
     }
 
+#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
+do {                                                    \
+    UNMAP_DOMAIN_PAGE(virt_var);                        \
+    mfn_var = maddr_to_mfn(maddr);                      \
+    maddr += PAGE_SIZE;                                 \
+    virt_var = map_domain_page(mfn_var);                \
+} while ( false )
+
     if ( !compat )
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
-        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
+        l4tab = l4start;
         clear_page(l4tab);
-        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
-        v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
+        init_xen_l4_slots(l4tab, l4start_mfn, d, INVALID_MFN, true);
+        v->arch.guest_table = pagetable_from_mfn(l4start_mfn);
     }
     else
     {
         /* Monitor table already created by switch_compat(). */
-        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
+        l4start_mfn = pagetable_get_mfn(v->arch.guest_table);
+        l4start = l4tab = map_domain_page(l4start_mfn);
         /* See public/xen.h on why the following is needed. */
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l3_page_table;
         l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
     }
 
     l4tab += l4_table_offset(v_start);
@@ -736,14 +750,16 @@ int __init dom0_construct_pv(struct domain *d,
         if ( !((unsigned long)l1tab & (PAGE_SIZE-1)) )
         {
             maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l1_page_table;
-            l1start = l1tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+            UNMAP_MAP_AND_ADVANCE(l1start_mfn, l1start, mpt_alloc);
+            l1tab = l1start;
             clear_page(l1tab);
             if ( count == 0 )
                 l1tab += l1_table_offset(v_start);
             if ( !((unsigned long)l2tab & (PAGE_SIZE-1)) )
             {
                 maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
-                l2start = l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
+                l2tab = l2start;
                 clear_page(l2tab);
                 if ( count == 0 )
                     l2tab += l2_table_offset(v_start);
@@ -753,19 +769,19 @@ int __init dom0_construct_pv(struct domain *d,
                     {
                         maddr_to_page(mpt_alloc)->u.inuse.type_info =
                             PGT_l3_page_table;
-                        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+                        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
                     }
                     l3tab = l3start;
                     clear_page(l3tab);
                     if ( count == 0 )
                         l3tab += l3_table_offset(v_start);
-                    *l4tab = l4e_from_paddr(__pa(l3start), L4_PROT);
+                    *l4tab = l4e_from_mfn(l3start_mfn, L4_PROT);
                     l4tab++;
                 }
-                *l3tab = l3e_from_paddr(__pa(l2start), L3_PROT);
+                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
                 l3tab++;
             }
-            *l2tab = l2e_from_paddr(__pa(l1start), L2_PROT);
+            *l2tab = l2e_from_mfn(l1start_mfn, L2_PROT);
             l2tab++;
         }
         if ( count < initrd_pfn || count >= initrd_pfn + PFN_UP(initrd_len) )
@@ -792,9 +808,9 @@ int __init dom0_construct_pv(struct domain *d,
             if ( !l3e_get_intpte(*l3tab) )
             {
                 maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
-                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
-                clear_page(l2tab);
-                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
+                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
+                clear_page(l2start);
+                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
             }
             if ( i == 3 )
                 l3e_get_page(*l3tab)->u.inuse.type_info |= PGT_pae_xen_l2;
@@ -805,9 +821,17 @@ int __init dom0_construct_pv(struct domain *d,
         unmap_domain_page(l2t);
     }
 
+#undef UNMAP_MAP_AND_ADVANCE
+
+    UNMAP_DOMAIN_PAGE(l1start);
+    UNMAP_DOMAIN_PAGE(l2start);
+    UNMAP_DOMAIN_PAGE(l3start);
+
     /* Pages that are part of page tables must be read only. */
     mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
+    UNMAP_DOMAIN_PAGE(l4start);
+
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
         shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
@@ -977,8 +1001,12 @@ int __init dom0_construct_pv(struct domain *d,
      * !CONFIG_VIDEO case so the logic here can be simplified.
      */
     if ( pv_shim )
+    {
+        l4start = map_domain_page(l4start_mfn);
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
+        UNMAP_DOMAIN_PAGE(l4start);
+    }
 
 #ifdef CONFIG_COMPAT
     if ( compat )
-- 
2.38.1



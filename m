Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B535518B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105803.202409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXP-0004O4-1I; Tue, 06 Apr 2021 11:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105803.202409; Tue, 06 Apr 2021 11:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXO-0004Ma-Ke; Tue, 06 Apr 2021 11:06:26 +0000
Received: by outflank-mailman (input) for mailman id 105803;
 Tue, 06 Apr 2021 11:06:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXN-0004LF-1q
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXM-00053H-Sy; Tue, 06 Apr 2021 11:06:24 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXM-0002qD-DN; Tue, 06 Apr 2021 11:06:24 +0000
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
	Date:Subject:Cc:To:From; bh=DhjC1F6SkPBikln4izzyHzb4RHHtmb3wCYV7VN5lv1s=; b=L
	oYPM4nf88I0nCVJj3cm+4fIRf+TGjHZNssBs4sXOnAfcyRegK8KSave6kScWHyYtRwb1ZWi7seoIy
	kRtATa7odCnpyvQDSvy9dvf3Ijv47kh8ih2u1l40KTanMGUmB+AQhPnuwrBzvpF1QOaH6qh8W8/oI
	yDJcV7DTeA3N9wZ0=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 05/13] x86_64/mm: switch to new APIs in paging_init
Date: Tue,  6 Apr 2021 12:05:53 +0100
Message-Id: <fd5ce586f12ed2aec08004a4b7216fc631c3d7dc.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Map and unmap pages instead of relying on the direct map.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v9:
- remove an unnecessary l3mfn variable.

Changed in v8:
- replace l3/2_ro_mpt_mfn with just mfn since their lifetimes do not
  overlap

Changed in v7:
- use the new alloc_map_clear_xen_pt() helper.
- move the unmap of pl3t up a bit.
- remove the unmaps in the nomem path.
---
 xen/arch/x86/x86_64/mm.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index c5a47df01bde..da239f097703 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -498,6 +498,7 @@ void __init paging_init(void)
     l3_pgentry_t *l3_ro_mpt;
     l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
+    mfn_t mfn;
 
     /*
      * We setup the L3s for 1:1 mapping if host support memory hotplug
@@ -510,22 +511,22 @@ void __init paging_init(void)
         if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
               _PAGE_PRESENT) )
         {
-            l3_pgentry_t *pl3t = alloc_xen_pagetable();
+            l3_pgentry_t *pl3t = alloc_map_clear_xen_pt(&mfn);
 
             if ( !pl3t )
                 goto nomem;
-            clear_page(pl3t);
+            UNMAP_DOMAIN_PAGE(pl3t);
             l4e_write(&idle_pg_table[l4_table_offset(va)],
-                      l4e_from_paddr(__pa(pl3t), __PAGE_HYPERVISOR_RW));
+                      l4e_from_mfn(mfn, __PAGE_HYPERVISOR_RW));
         }
     }
 
     /* Create user-accessible L2 directory to map the MPT for guests. */
-    if ( (l3_ro_mpt = alloc_xen_pagetable()) == NULL )
+    l3_ro_mpt = alloc_map_clear_xen_pt(&mfn);
+    if ( !l3_ro_mpt )
         goto nomem;
-    clear_page(l3_ro_mpt);
     l4e_write(&idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)],
-              l4e_from_paddr(__pa(l3_ro_mpt), __PAGE_HYPERVISOR_RO | _PAGE_USER));
+              l4e_from_mfn(mfn, __PAGE_HYPERVISOR_RO | _PAGE_USER));
 
     /*
      * Allocate and map the machine-to-phys table.
@@ -608,12 +609,14 @@ void __init paging_init(void)
         }
         if ( !((unsigned long)pl2e & ~PAGE_MASK) )
         {
-            if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
+            l2_ro_mpt = alloc_map_clear_xen_pt(&mfn);
+            if ( !l2_ro_mpt )
                 goto nomem;
-            clear_page(l2_ro_mpt);
+
             l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                      l3e_from_paddr(__pa(l2_ro_mpt),
-                                     __PAGE_HYPERVISOR_RO | _PAGE_USER));
+                      l3e_from_mfn(mfn, __PAGE_HYPERVISOR_RO | _PAGE_USER));
             pl2e = l2_ro_mpt;
             ASSERT(!l2_table_offset(va));
         }
@@ -625,15 +628,18 @@ void __init paging_init(void)
     }
 #undef CNT
 #undef MFN
+    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
     if ( opt_pv32 )
     {
-        if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+        mfn = alloc_xen_pagetable_new();
+        if ( mfn_eq(mfn, INVALID_MFN) )
             goto nomem;
-        compat_idle_pg_table_l2 = l2_ro_mpt;
-        clear_page(l2_ro_mpt);
-        pl2e = l2_ro_mpt;
+        compat_idle_pg_table_l2 = map_domain_page_global(mfn);
+        clear_page(compat_idle_pg_table_l2);
+        pl2e = compat_idle_pg_table_l2;
 
         /* Allocate and map the compatibility mode machine-to-phys table. */
         mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
-- 
2.23.3



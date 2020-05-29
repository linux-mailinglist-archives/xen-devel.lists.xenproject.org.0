Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384311E7B65
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:12:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecwF-0004wl-So; Fri, 29 May 2020 11:12:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jecwD-0004vK-SU
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:12:33 +0000
X-Inumbo-ID: 448b44e8-a19d-11ea-a898-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 448b44e8-a19d-11ea-a898-12813bfff9fa;
 Fri, 29 May 2020 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d/G4aLlUZF4eW/MxiUCbta356VDjjBDxySOEDoS9lss=; b=BmIA9jbzGLcm/VH3qnha2DW0fR
 zJ0WsvOlkZbxwGiCWiEOwZw3h4zDYX/AUrp/Ft/D4zTfHNRT1fShZLUkLkfRHNkPecM5nsm2Jcr0u
 JgkSwaWKu7EF84gl7PIS0OdE/kxJfxVy8wxSQkWyleNE+IqsZn5rSo7gHiP1n/Ja4zZs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw1-00022M-9w; Fri, 29 May 2020 11:12:21 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw1-0006tM-0n; Fri, 29 May 2020 11:12:21 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 07/15] x86_64/mm: switch to new APIs in paging_init
Date: Fri, 29 May 2020 12:11:51 +0100
Message-Id: <7eb8f68f2202d97062d714d35a8b1d6a972cc623.1590750232.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Map and unmap pages instead of relying on the direct map.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v7:
- use the new alloc_map_clear_xen_pt() helper.
- move the unmap of pl3t up a bit.
- remove the unmaps in the nomem path.
---
 xen/arch/x86/x86_64/mm.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 243014a119..8877ac7bb7 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -481,6 +481,7 @@ void __init paging_init(void)
     l3_pgentry_t *l3_ro_mpt;
     l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
+    mfn_t l3_ro_mpt_mfn, l2_ro_mpt_mfn;
 
     /*
      * We setup the L3s for 1:1 mapping if host support memory hotplug
@@ -493,22 +494,23 @@ void __init paging_init(void)
         if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
               _PAGE_PRESENT) )
         {
-            l3_pgentry_t *pl3t = alloc_xen_pagetable();
+            mfn_t l3mfn;
+            l3_pgentry_t *pl3t = alloc_map_clear_xen_pt(&l3mfn);
 
             if ( !pl3t )
                 goto nomem;
-            clear_page(pl3t);
+            UNMAP_DOMAIN_PAGE(pl3t);
             l4e_write(&idle_pg_table[l4_table_offset(va)],
-                      l4e_from_paddr(__pa(pl3t), __PAGE_HYPERVISOR_RW));
+                      l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR_RW));
         }
     }
 
     /* Create user-accessible L2 directory to map the MPT for guests. */
-    if ( (l3_ro_mpt = alloc_xen_pagetable()) == NULL )
+    l3_ro_mpt = alloc_map_clear_xen_pt(&l3_ro_mpt_mfn);
+    if ( !l3_ro_mpt )
         goto nomem;
-    clear_page(l3_ro_mpt);
     l4e_write(&idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)],
-              l4e_from_paddr(__pa(l3_ro_mpt), __PAGE_HYPERVISOR_RO | _PAGE_USER));
+              l4e_from_mfn(l3_ro_mpt_mfn, __PAGE_HYPERVISOR_RO | _PAGE_USER));
 
     /*
      * Allocate and map the machine-to-phys table.
@@ -591,12 +593,15 @@ void __init paging_init(void)
         }
         if ( !((unsigned long)pl2e & ~PAGE_MASK) )
         {
-            if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
+            l2_ro_mpt = alloc_map_clear_xen_pt(&l2_ro_mpt_mfn);
+            if ( !l2_ro_mpt )
                 goto nomem;
-            clear_page(l2_ro_mpt);
+
             l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                      l3e_from_paddr(__pa(l2_ro_mpt),
-                                     __PAGE_HYPERVISOR_RO | _PAGE_USER));
+                      l3e_from_mfn(l2_ro_mpt_mfn,
+                                   __PAGE_HYPERVISOR_RO | _PAGE_USER));
             pl2e = l2_ro_mpt;
             ASSERT(!l2_table_offset(va));
         }
@@ -608,13 +613,16 @@ void __init paging_init(void)
     }
 #undef CNT
 #undef MFN
+    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+    l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+    if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
         goto nomem;
-    compat_idle_pg_table_l2 = l2_ro_mpt;
-    clear_page(l2_ro_mpt);
-    pl2e = l2_ro_mpt;
+    compat_idle_pg_table_l2 = map_domain_page_global(l2_ro_mpt_mfn);
+    clear_page(compat_idle_pg_table_l2);
+    pl2e = compat_idle_pg_table_l2;
     /* Allocate and map the compatibility mode machine-to-phys table. */
     mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
     if ( mpt_size > RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START )
-- 
2.24.1.AMZN



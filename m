Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717ED1B780F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1K-0002v5-9k; Fri, 24 Apr 2020 14:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1I-0002uC-Eb
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:32 +0000
X-Inumbo-ID: 36be5180-8635-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36be5180-8635-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNeKcQtUM57uOSxhr17X7t4TrlXzvDK3eAw9hbi5PGY=; b=RFo4KtVx84sLcuT1KPnVt7fXiA
 bMcFW8macFJG+R0MrV9ZLOvQoZt18IV5I6U+ngAIq9+lBVvFzO3tTMmtkTwEJYoyR3ILZTZkCMoH6
 Lcxf9h5T1lOZpsIY708/af3w89znPxI7mOI0ZuWfhp+Fi8gdl9F/L/lK9lEwvDpTT6tU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz1F-0001hM-LM; Fri, 24 Apr 2020 14:09:29 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1F-0001fN-BV; Fri, 24 Apr 2020 14:09:29 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 07/15] x86_64/mm: switch to new APIs in paging_init
Date: Fri, 24 Apr 2020 15:08:58 +0100
Message-Id: <0655cc2d3dc27141ef102076c4ad390a37191b37.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
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
 xen/arch/x86/x86_64/mm.c | 43 ++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 35f9de4ad4..3cf699d27b 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -478,9 +478,10 @@ void __init paging_init(void)
 {
     unsigned long i, mpt_size, va;
     unsigned int n, memflags;
-    l3_pgentry_t *l3_ro_mpt;
+    l3_pgentry_t *l3_ro_mpt = NULL;
     l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
+    mfn_t l3_ro_mpt_mfn, l2_ro_mpt_mfn;
 
     /*
      * We setup the L3s for 1:1 mapping if host support memory hotplug
@@ -493,22 +494,28 @@ void __init paging_init(void)
         if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
               _PAGE_PRESENT) )
         {
-            l3_pgentry_t *pl3t = alloc_xen_pagetable();
+            l3_pgentry_t *pl3t;
+            mfn_t l3mfn = alloc_xen_pagetable_new();
 
-            if ( !pl3t )
+            if ( mfn_eq(l3mfn, INVALID_MFN) )
                 goto nomem;
+
+            pl3t = map_domain_page(l3mfn);
             clear_page(pl3t);
             l4e_write(&idle_pg_table[l4_table_offset(va)],
-                      l4e_from_paddr(__pa(pl3t), __PAGE_HYPERVISOR_RW));
+                      l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR_RW));
+            unmap_domain_page(pl3t);
         }
     }
 
     /* Create user-accessible L2 directory to map the MPT for guests. */
-    if ( (l3_ro_mpt = alloc_xen_pagetable()) == NULL )
+    l3_ro_mpt_mfn = alloc_xen_pagetable_new();
+    if ( mfn_eq(l3_ro_mpt_mfn, INVALID_MFN) )
         goto nomem;
+    l3_ro_mpt = map_domain_page(l3_ro_mpt_mfn);
     clear_page(l3_ro_mpt);
     l4e_write(&idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)],
-              l4e_from_paddr(__pa(l3_ro_mpt), __PAGE_HYPERVISOR_RO | _PAGE_USER));
+              l4e_from_mfn(l3_ro_mpt_mfn, __PAGE_HYPERVISOR_RO | _PAGE_USER));
 
     /*
      * Allocate and map the machine-to-phys table.
@@ -591,12 +598,17 @@ void __init paging_init(void)
         }
         if ( !((unsigned long)pl2e & ~PAGE_MASK) )
         {
-            if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
+            l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+            if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
                 goto nomem;
+
+            l2_ro_mpt = map_domain_page(l2_ro_mpt_mfn);
             clear_page(l2_ro_mpt);
             l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                      l3e_from_paddr(__pa(l2_ro_mpt),
-                                     __PAGE_HYPERVISOR_RO | _PAGE_USER));
+                      l3e_from_mfn(l2_ro_mpt_mfn,
+                                   __PAGE_HYPERVISOR_RO | _PAGE_USER));
             pl2e = l2_ro_mpt;
             ASSERT(!l2_table_offset(va));
         }
@@ -608,13 +620,16 @@ void __init paging_init(void)
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
@@ -662,6 +677,8 @@ void __init paging_init(void)
     return;
 
  nomem:
+    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
     panic("Not enough memory for m2p table\n");
 }
 
-- 
2.24.1.AMZN



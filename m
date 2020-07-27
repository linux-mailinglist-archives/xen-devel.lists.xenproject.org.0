Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C6422F032
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041U-0007BE-94; Mon, 27 Jul 2020 14:22:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041S-00075u-Oh
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:34 +0000
X-Inumbo-ID: 96c539ee-d014-11ea-a7d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96c539ee-d014-11ea-a7d9-12813bfff9fa;
 Mon, 27 Jul 2020 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rrvEqUYSNkuezZ5dZTBgKV5PBSNHpJAjMPmahuBCeZs=; b=Unt2X3o3HL7/gE5t6VkgQ38lpd
 pNcOcfD+m8KiwACwOtMGa4rO/kfLMrD5+EkksjJn/2s/Gm/y8cy0kFhcsLNSr3NLxZBzqCI/3MKEc
 cWtkSDCy4DV6bzgsnyJQeumLE49kdhBZbSZHmatvrN40lWhZafSpVti0BDHyBcISqc+M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041H-0001NZ-AF; Mon, 27 Jul 2020 14:22:23 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041H-0002w6-1D; Mon, 27 Jul 2020 14:22:23 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 04/15] x86/mm: switch to new APIs in map_pages_to_xen
Date: Mon, 27 Jul 2020 15:21:54 +0100
Message-Id: <248e86f82ae0d0d6bf661e6a180874437efacca4.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Page tables allocated in that function should be mapped and unmapped
now.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c | 60 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index fd416c0282..edcf164742 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5171,7 +5171,7 @@ int map_pages_to_xen(
                 }
                 else
                 {
-                    l2_pgentry_t *l2t = l3e_to_l2e(ol3e);
+                    l2_pgentry_t *l2t = map_l2t_from_l3e(ol3e);
 
                     for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                     {
@@ -5183,10 +5183,11 @@ int map_pages_to_xen(
                         else
                         {
                             unsigned int j;
-                            const l1_pgentry_t *l1t = l2e_to_l1e(ol2e);
+                            const l1_pgentry_t *l1t = map_l1t_from_l2e(ol2e);
 
                             for ( j = 0; j < L1_PAGETABLE_ENTRIES; j++ )
                                 flush_flags(l1e_get_flags(l1t[j]));
+                            unmap_domain_page(l1t);
                         }
                     }
                     flush_area(virt, flush_flags);
@@ -5195,9 +5196,10 @@ int map_pages_to_xen(
                         ol2e = l2t[i];
                         if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) &&
                              !(l2e_get_flags(ol2e) & _PAGE_PSE) )
-                            free_xen_pagetable(l2e_to_l1e(ol2e));
+                            free_xen_pagetable_new(l2e_get_mfn(ol2e));
                     }
-                    free_xen_pagetable(l2t);
+                    unmap_domain_page(l2t);
+                    free_xen_pagetable_new(l3e_get_mfn(ol3e));
                 }
             }
 
@@ -5214,6 +5216,7 @@ int map_pages_to_xen(
             unsigned int flush_flags =
                 FLUSH_TLB | FLUSH_ORDER(2 * PAGETABLE_ORDER);
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
 
             /* Skip this PTE if there is no change. */
             if ( ((l3e_get_pfn(ol3e) & ~(L2_PAGETABLE_ENTRIES *
@@ -5235,15 +5238,17 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2t = alloc_xen_pagetable();
-            if ( l2t == NULL )
+            l2mfn = alloc_xen_pagetable_new();
+            if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
+            l2t = map_domain_page(l2mfn);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
                           l2e_from_pfn(l3e_get_pfn(ol3e) +
                                        (i << PAGETABLE_ORDER),
                                        l3e_get_flags(ol3e)));
+            UNMAP_DOMAIN_PAGE(l2t);
 
             if ( l3e_get_flags(ol3e) & _PAGE_GLOBAL )
                 flush_flags |= FLUSH_TLB_GLOBAL;
@@ -5253,15 +5258,15 @@ int map_pages_to_xen(
             if ( (l3e_get_flags(*pl3e) & _PAGE_PRESENT) &&
                  (l3e_get_flags(*pl3e) & _PAGE_PSE) )
             {
-                l3e_write_atomic(pl3e, l3e_from_mfn(virt_to_mfn(l2t),
-                                                    __PAGE_HYPERVISOR));
-                l2t = NULL;
+                l3e_write_atomic(pl3e,
+                                 l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
+                l2mfn = INVALID_MFN;
             }
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
-            if ( l2t )
-                free_xen_pagetable(l2t);
+
+            free_xen_pagetable_new(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5289,12 +5294,13 @@ int map_pages_to_xen(
                 }
                 else
                 {
-                    l1_pgentry_t *l1t = l2e_to_l1e(ol2e);
+                    l1_pgentry_t *l1t = map_l1t_from_l2e(ol2e);
 
                     for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
-                    free_xen_pagetable(l1t);
+                    unmap_domain_page(l1t);
+                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5319,6 +5325,7 @@ int map_pages_to_xen(
                 unsigned int flush_flags =
                     FLUSH_TLB | FLUSH_ORDER(PAGETABLE_ORDER);
                 l1_pgentry_t *l1t;
+                mfn_t l1mfn;
 
                 /* Skip this PTE if there is no change. */
                 if ( (((l2e_get_pfn(*pl2e) & ~(L1_PAGETABLE_ENTRIES - 1)) +
@@ -5338,14 +5345,16 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1t = alloc_xen_pagetable();
-                if ( l1t == NULL )
+                l1mfn = alloc_xen_pagetable_new();
+                if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
+                l1t = map_domain_page(l1mfn);
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
                               l1e_from_pfn(l2e_get_pfn(*pl2e) + i,
                                            lNf_to_l1f(l2e_get_flags(*pl2e))));
+                UNMAP_DOMAIN_PAGE(l1t);
 
                 if ( l2e_get_flags(*pl2e) & _PAGE_GLOBAL )
                     flush_flags |= FLUSH_TLB_GLOBAL;
@@ -5355,20 +5364,21 @@ int map_pages_to_xen(
                 if ( (l2e_get_flags(*pl2e) & _PAGE_PRESENT) &&
                      (l2e_get_flags(*pl2e) & _PAGE_PSE) )
                 {
-                    l2e_write_atomic(pl2e, l2e_from_mfn(virt_to_mfn(l1t),
+                    l2e_write_atomic(pl2e, l2e_from_mfn(l1mfn,
                                                         __PAGE_HYPERVISOR));
-                    l1t = NULL;
+                    l1mfn = INVALID_MFN;
                 }
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
-                if ( l1t )
-                    free_xen_pagetable(l1t);
+
+                free_xen_pagetable_new(l1mfn);
             }
 
-            pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);
+            pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
             ol1e  = *pl1e;
             l1e_write_atomic(pl1e, l1e_from_mfn(mfn, flags));
+            UNMAP_DOMAIN_PAGE(pl1e);
             if ( (l1e_get_flags(ol1e) & _PAGE_PRESENT) )
             {
                 unsigned int flush_flags = FLUSH_TLB | FLUSH_ORDER(0);
@@ -5412,12 +5422,13 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1t = l2e_to_l1e(ol2e);
+                l1t = map_l1t_from_l2e(ol2e);
                 base_mfn = l1e_get_pfn(l1t[0]) & ~(L1_PAGETABLE_ENTRIES - 1);
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     if ( (l1e_get_pfn(l1t[i]) != (base_mfn + i)) ||
                          (l1e_get_flags(l1t[i]) != flags) )
                         break;
+                UNMAP_DOMAIN_PAGE(l1t);
                 if ( i == L1_PAGETABLE_ENTRIES )
                 {
                     l2e_write_atomic(pl2e, l2e_from_pfn(base_mfn,
@@ -5427,7 +5438,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable(l2e_to_l1e(ol2e));
+                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5460,7 +5471,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2t = l3e_to_l2e(ol3e);
+            l2t = map_l2t_from_l3e(ol3e);
             base_mfn = l2e_get_pfn(l2t[0]) & ~(L2_PAGETABLE_ENTRIES *
                                               L1_PAGETABLE_ENTRIES - 1);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
@@ -5468,6 +5479,7 @@ int map_pages_to_xen(
                       (base_mfn + (i << PAGETABLE_ORDER))) ||
                      (l2e_get_flags(l2t[i]) != l1f_to_lNf(flags)) )
                     break;
+            UNMAP_DOMAIN_PAGE(l2t);
             if ( i == L2_PAGETABLE_ENTRIES )
             {
                 l3e_write_atomic(pl3e, l3e_from_pfn(base_mfn,
@@ -5477,7 +5489,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable(l3e_to_l2e(ol3e));
+                free_xen_pagetable_new(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
-- 
2.16.6



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C5366DE7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114544.218335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDe0-0007qY-JQ; Wed, 21 Apr 2021 14:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114544.218335; Wed, 21 Apr 2021 14:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDe0-0007pT-DO; Wed, 21 Apr 2021 14:15:56 +0000
Received: by outflank-mailman (input) for mailman id 114544;
 Wed, 21 Apr 2021 14:15:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDdz-0007oj-7q
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:15:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdz-0000xN-0Y; Wed, 21 Apr 2021 14:15:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdy-00045m-FC; Wed, 21 Apr 2021 14:15:54 +0000
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
	Date:Subject:Cc:To:From; bh=M+SUaviRQQzVknlharqZ3Xo7csEXaAzP707OhQVzBUk=; b=O
	++ncezD3CiYyamLzJCFSccjv3HKmeaOXOfHRETtcsK4Tyc/cra5qdCjsnqKm7ChRAhdSzyafPFQBf
	r6kbNfD5UaNE9N/M/SgBrlQt10Nd5z4BgkGgYHh/KDjkaL/DQRW7qpgF8ckI9w0eW4q/z0Ux96ITZ
	twsVpenGJXDroRTw=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 02/13] x86/mm: switch to new APIs in map_pages_to_xen
Date: Wed, 21 Apr 2021 15:15:30 +0100
Message-Id: <f8a422d4da4a93cd9b2f788c4594a1efe82bf389.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Page tables allocated in that function should be mapped and unmapped
now.

Take the opportunity to avoid a potential double map in
map_pages_to_xen() by initialising pl1e to NULL and only map it if it
was not mapped earlier.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v10:
- avoid a potential double map.
- drop RoB due to this change.
---
 xen/arch/x86/mm.c | 64 ++++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5944ef19dc50..8a68da26f45f 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5215,7 +5215,7 @@ int map_pages_to_xen(
                 }
                 else
                 {
-                    l2_pgentry_t *l2t = l3e_to_l2e(ol3e);
+                    l2_pgentry_t *l2t = map_l2t_from_l3e(ol3e);
 
                     for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                     {
@@ -5227,10 +5227,11 @@ int map_pages_to_xen(
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
@@ -5239,9 +5240,10 @@ int map_pages_to_xen(
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
 
@@ -5258,6 +5260,7 @@ int map_pages_to_xen(
             unsigned int flush_flags =
                 FLUSH_TLB | FLUSH_ORDER(2 * PAGETABLE_ORDER);
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
 
             /* Skip this PTE if there is no change. */
             if ( ((l3e_get_pfn(ol3e) & ~(L2_PAGETABLE_ENTRIES *
@@ -5279,15 +5282,17 @@ int map_pages_to_xen(
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
@@ -5297,15 +5302,15 @@ int map_pages_to_xen(
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
@@ -5333,12 +5338,13 @@ int map_pages_to_xen(
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
 
@@ -5349,20 +5355,20 @@ int map_pages_to_xen(
         }
         else
         {
+            pl1e = NULL;
             /* Normal page mapping. */
             if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
             {
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
                     goto out;
-
-                UNMAP_DOMAIN_PAGE(pl1e);
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
                 unsigned int flush_flags =
                     FLUSH_TLB | FLUSH_ORDER(PAGETABLE_ORDER);
                 l1_pgentry_t *l1t;
+                mfn_t l1mfn;
 
                 /* Skip this PTE if there is no change. */
                 if ( (((l2e_get_pfn(*pl2e) & ~(L1_PAGETABLE_ENTRIES - 1)) +
@@ -5382,14 +5388,16 @@ int map_pages_to_xen(
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
@@ -5399,20 +5407,22 @@ int map_pages_to_xen(
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
+            if ( !pl1e )
+                pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
             ol1e  = *pl1e;
             l1e_write_atomic(pl1e, l1e_from_mfn(mfn, flags));
+            UNMAP_DOMAIN_PAGE(pl1e);
             if ( (l1e_get_flags(ol1e) & _PAGE_PRESENT) )
             {
                 unsigned int flush_flags = FLUSH_TLB | FLUSH_ORDER(0);
@@ -5456,12 +5466,13 @@ int map_pages_to_xen(
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
@@ -5471,7 +5482,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable(l2e_to_l1e(ol2e));
+                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5504,7 +5515,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2t = l3e_to_l2e(ol3e);
+            l2t = map_l2t_from_l3e(ol3e);
             base_mfn = l2e_get_pfn(l2t[0]) & ~(L2_PAGETABLE_ENTRIES *
                                               L1_PAGETABLE_ENTRIES - 1);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
@@ -5512,6 +5523,7 @@ int map_pages_to_xen(
                       (base_mfn + (i << PAGETABLE_ORDER))) ||
                      (l2e_get_flags(l2t[i]) != l1f_to_lNf(flags)) )
                     break;
+            UNMAP_DOMAIN_PAGE(l2t);
             if ( i == L2_PAGETABLE_ENTRIES )
             {
                 l3e_write_atomic(pl3e, l3e_from_pfn(base_mfn,
@@ -5521,7 +5533,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable(l3e_to_l2e(ol3e));
+                free_xen_pagetable_new(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
-- 
2.23.4



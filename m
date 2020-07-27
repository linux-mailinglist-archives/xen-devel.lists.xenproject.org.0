Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E7A22F033
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041Z-0007EB-Nh; Mon, 27 Jul 2020 14:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041X-00075u-Oi
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:39 +0000
X-Inumbo-ID: 97b8bd62-d014-11ea-a7d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97b8bd62-d014-11ea-a7d9-12813bfff9fa;
 Mon, 27 Jul 2020 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AzKnclrIuNpwqMYiGGxlH4mfYS6y6TwghSOhmo8lMtw=; b=G79OtY2+doo2xGMiNfvs+QXMm3
 idsuWZkZf8PIsbZnByjOzZIWad+7pdqIgaktWer5y2WBE1l6HE5jazFy+M05I0b1FGjk5ZmMjbaKD
 ieAfsjCGbvRMMGO0OB0IrSD4VRiMFeucNz6FYir+9ncEc/fC1A6JEvUl9+89mdn/q7Cw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041I-0001Nh-Oc; Mon, 27 Jul 2020 14:22:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041I-0002w6-FS; Mon, 27 Jul 2020 14:22:24 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 05/15] x86/mm: switch to new APIs in modify_xen_mappings
Date: Mon, 27 Jul 2020 15:21:55 +0100
Message-Id: <d6e921a4a33b0be1ae8147de268854556b08a3bc.1595857947.git.hongyxia@amazon.com>
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

Note that pl2e now maybe mapped and unmapped in different iterations, so
we need to add clean-ups for that.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- use normal unmap in the error path.
---
 xen/arch/x86/mm.c | 57 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index edcf164742..199940a345 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5527,7 +5527,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
-    l2_pgentry_t *pl2e;
+    l2_pgentry_t *pl2e = NULL;
     l1_pgentry_t *pl1e;
     unsigned int  i;
     unsigned long v = s;
@@ -5543,6 +5543,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     while ( v < e )
     {
         /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
         pl3e = virt_to_xen_l3e(v);
@@ -5560,6 +5561,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
 
             if ( l2_table_offset(v) == 0 &&
                  l1_table_offset(v) == 0 &&
@@ -5576,35 +5578,38 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2t = alloc_xen_pagetable();
-            if ( !l2t )
+            l2mfn = alloc_xen_pagetable_new();
+            if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
+            l2t = map_domain_page(l2mfn);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
                           l2e_from_pfn(l3e_get_pfn(*pl3e) +
                                        (i << PAGETABLE_ORDER),
                                        l3e_get_flags(*pl3e)));
+            UNMAP_DOMAIN_PAGE(l2t);
+
             if ( locking )
                 spin_lock(&map_pgdir_lock);
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
-            if ( l2t )
-                free_xen_pagetable(l2t);
+
+            free_xen_pagetable_new(l2mfn);
         }
 
         /*
          * The L3 entry has been verified to be present, and we've dealt with
          * 1G pages as well, so the L2 table cannot require allocation.
          */
-        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(v);
+        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(v);
 
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
@@ -5632,41 +5637,45 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             else
             {
                 l1_pgentry_t *l1t;
-
                 /* PSE: shatter the superpage and try again. */
-                l1t = alloc_xen_pagetable();
-                if ( !l1t )
+                mfn_t l1mfn = alloc_xen_pagetable_new();
+
+                if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
+                l1t = map_domain_page(l1mfn);
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
                               l1e_from_pfn(l2e_get_pfn(*pl2e) + i,
                                            l2e_get_flags(*pl2e) & ~_PAGE_PSE));
+                UNMAP_DOMAIN_PAGE(l1t);
+
                 if ( locking )
                     spin_lock(&map_pgdir_lock);
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
-                if ( l1t )
-                    free_xen_pagetable(l1t);
+
+                free_xen_pagetable_new(l1mfn);
             }
         }
         else
         {
             l1_pgentry_t nl1e, *l1t;
+            mfn_t l1mfn;
 
             /*
              * Ordinary 4kB mapping: The L2 entry has been verified to be
              * present, and we've dealt with 2M pages as well, so the L1 table
              * cannot require allocation.
              */
-            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(v);
+            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(v);
 
             /* Confirm the caller isn't trying to create new mappings. */
             if ( !(l1e_get_flags(*pl1e) & _PAGE_PRESENT) )
@@ -5677,6 +5686,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                                (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | nf);
 
             l1e_write_atomic(pl1e, nl1e);
+            UNMAP_DOMAIN_PAGE(pl1e);
             v += PAGE_SIZE;
 
             /*
@@ -5706,10 +5716,12 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 continue;
             }
 
-            l1t = l2e_to_l1e(*pl2e);
+            l1mfn = l2e_get_mfn(*pl2e);
+            l1t = map_domain_page(l1mfn);
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                 if ( l1e_get_intpte(l1t[i]) != 0 )
                     break;
+            UNMAP_DOMAIN_PAGE(l1t);
             if ( i == L1_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L2E and free the L1 page. */
@@ -5717,7 +5729,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l1t);
+                free_xen_pagetable_new(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5748,11 +5760,13 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn = l3e_get_mfn(*pl3e);
 
-            l2t = l3e_to_l2e(*pl3e);
+            l2t = map_domain_page(l2mfn);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 if ( l2e_get_intpte(l2t[i]) != 0 )
                     break;
+            UNMAP_DOMAIN_PAGE(l2t);
             if ( i == L2_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L3E and free the L2 page. */
@@ -5760,7 +5774,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l2t);
+                free_xen_pagetable_new(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5773,6 +5787,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     rc = 0;
 
  out:
+    unmap_domain_page(pl2e);
     unmap_domain_page(pl3e);
     return rc;
 }
-- 
2.16.6



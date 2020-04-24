Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90CD1B7810
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1L-0002w7-J8; Fri, 24 Apr 2020 14:09:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1K-0002vb-LV
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:34 +0000
X-Inumbo-ID: 347823c5-8635-11ea-94b0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347823c5-8635-11ea-94b0-12813bfff9fa;
 Fri, 24 Apr 2020 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FRP5OT+p4pAgqXJ05UtHfE6HCl9wkp96YVneT3eOIa0=; b=uL8nkwnXd7QcfXGekCDou49Vil
 qwk/Lpqf50CRF7R4JN7hWqvBzc20bRiwggy4XvydDZfsMEykPhlChcrWAM9NvN1GvFZ+3Y2GOC6mF
 DY8UKpELidiG+g9d6d/g+EFgW1oL7ajCM5uhp2n5kcoyIUMbOfNsuhyr6rHBczpCusnE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz1C-0001h4-JN; Fri, 24 Apr 2020 14:09:26 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1C-0001fN-9b; Fri, 24 Apr 2020 14:09:26 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 05/15] x86/mm: switch to new APIs in modify_xen_mappings
Date: Fri, 24 Apr 2020 15:08:56 +0100
Message-Id: <872b8f71cd391bc78933e9c018baab0b79b34c94.1587735799.git.hongyxia@amazon.com>
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

Page tables allocated in that function should be mapped and unmapped
now.

Note that pl2e now maybe mapped and unmapped in different iterations, so
we need to add clean-ups for that.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/mm.c | 57 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2c14cdd83a..e8c16027d8 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5508,7 +5508,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
-    l2_pgentry_t *pl2e;
+    l2_pgentry_t *pl2e = NULL;
     l1_pgentry_t *pl1e;
     unsigned int  i;
     unsigned long v = s;
@@ -5524,6 +5524,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     while ( v < e )
     {
         /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
         pl3e = virt_to_xen_l3e(v);
@@ -5541,6 +5542,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
 
             if ( l2_table_offset(v) == 0 &&
                  l1_table_offset(v) == 0 &&
@@ -5557,35 +5559,38 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
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
@@ -5613,41 +5618,45 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
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
@@ -5658,6 +5667,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                                (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | nf);
 
             l1e_write_atomic(pl1e, nl1e);
+            UNMAP_DOMAIN_PAGE(pl1e);
             v += PAGE_SIZE;
 
             /*
@@ -5687,10 +5697,12 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
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
@@ -5698,7 +5710,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l1t);
+                free_xen_pagetable_new(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5729,11 +5741,13 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
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
@@ -5741,7 +5755,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l2t);
+                free_xen_pagetable_new(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5754,6 +5768,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     rc = 0;
 
  out:
+    UNMAP_DOMAIN_PAGE(pl2e);
     UNMAP_DOMAIN_PAGE(pl3e);
     return rc;
 }
-- 
2.24.1.AMZN



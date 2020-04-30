Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D11C087C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG3F-0002uu-QC; Thu, 30 Apr 2020 20:44:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG3E-0002uE-EI
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:56 +0000
X-Inumbo-ID: 6e33b0fe-8b23-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e33b0fe-8b23-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9eF+qb5V9Z9xxRC1WCmcjTYdHVKPY6+x95YE0mwwEYA=; b=mGheIJdijdnAzN7nyVUP750uWf
 MJSDx6ufAsJ9VQBVZLr42scaVu1w5KybOeVRGaDszwKaqWl+0SOPu0I7is5xmXlfVs1fS/VyiVEzK
 i2XNeB4bWSsmRjzm+bjMHQ/f+CsD90G0AzYJW56DgbT4jbXMp/DH9Y7PVd8n5msiAWVk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG35-0004Lb-I3; Thu, 30 Apr 2020 20:44:47 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG35-0005wj-8Z; Thu, 30 Apr 2020 20:44:47 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 07/16] x86/pv: rewrite how building PV dom0 handles domheap
 mappings
Date: Thu, 30 Apr 2020 21:44:16 +0100
Message-Id: <f16792ed755f806785cd4c0483e46d9c40d9f82b.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
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

From: Hongyan Xia <hongyxia@amazon.com>

Building a PV dom0 is allocating from the domheap but uses it like the
xenheap. This is clearly wrong. Fix.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/pv/dom0_build.c | 58 ++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index b052f13462..adaa6afda2 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -309,6 +309,10 @@ int __init dom0_construct_pv(struct domain *d,
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
     l1_pgentry_t *l1tab = NULL, *l1start = NULL;
+    mfn_t l4start_mfn = INVALID_MFN;
+    mfn_t l3start_mfn = INVALID_MFN;
+    mfn_t l2start_mfn = INVALID_MFN;
+    mfn_t l1start_mfn = INVALID_MFN;
 
     /*
      * This fully describes the memory layout of the initial domain. All
@@ -535,6 +539,7 @@ int __init dom0_construct_pv(struct domain *d,
             for ( i = 0; i < nr_pages; i++, len -= PAGE_SIZE )
             {
                 void *p = __map_domain_page(page + i);
+
                 memcpy(p, mfn_to_virt(initrd_mfn + i),
                        min(len, (unsigned long)PAGE_SIZE));
                 unmap_domain_page(p);
@@ -610,23 +615,32 @@ int __init dom0_construct_pv(struct domain *d,
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
     /* WARNING: The new domain must have its 'processor' field filled in! */
     if ( !is_pv_32bit_domain(d) )
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
-        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
     }
 
     l4tab += l4_table_offset(v_start);
@@ -636,14 +650,16 @@ int __init dom0_construct_pv(struct domain *d,
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
@@ -653,19 +669,19 @@ int __init dom0_construct_pv(struct domain *d,
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
@@ -692,9 +708,9 @@ int __init dom0_construct_pv(struct domain *d,
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
@@ -705,9 +721,17 @@ int __init dom0_construct_pv(struct domain *d,
         unmap_domain_page(l2t);
     }
 
+#undef UNMAP_MAP_AND_ADVANCE
+
+    UNMAP_DOMAIN_PAGE(l1start);
+    UNMAP_DOMAIN_PAGE(l2start);
+    UNMAP_DOMAIN_PAGE(l3start);
+
     /* Pages that are part of page tables must be read only. */
     mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
 
+    UNMAP_DOMAIN_PAGE(l4start);
+
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
         shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
@@ -869,8 +893,12 @@ int __init dom0_construct_pv(struct domain *d,
      * !CONFIG_VIDEO case so the logic here can be simplified.
      */
     if ( pv_shim )
+    {
+        l4start = map_domain_page(l4start_mfn);
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
+        UNMAP_DOMAIN_PAGE(l4start);
+    }
 
     if ( is_pv_32bit_domain(d) )
         xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU
-- 
2.24.1.AMZN



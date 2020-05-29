Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F381E7BC8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedCg-0007en-Ld; Fri, 29 May 2020 11:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jedCe-0007ed-Hd
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:29:32 +0000
X-Inumbo-ID: aa6b1804-a19f-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa6b1804-a19f-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bP1uKRBWvNfAhTGPUck4uG79xo7OG/LNneHRpiyKC/0=; b=xyaUD2OIffjkLfuO3lRQ14ACFm
 VuaS/eRgCyZdjHnIQouJqgnHCxysLHHw6Yoaknl1isO5T7b43p26YnGSW/nBar98wL6f/4D5ZamlE
 KoR9zAWDj2kf+OITgZaVEqf1UzGFgZdCuqmzYMWliNoyysthvyi3N7qyy+EFbzl8HEE4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jedCd-0002TC-OM; Fri, 29 May 2020 11:29:31 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw7-0006tM-S2; Fri, 29 May 2020 11:12:28 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 12/15] x86/smpboot: switch clone_mapping() to new APIs
Date: Fri, 29 May 2020 12:11:56 +0100
Message-Id: <2c1d26b0c7fc681d291adc50f65f77922f10f9d2.1590750232.git.hongyxia@amazon.com>
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

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v7:
- change patch title
- remove initialiser of pl3e.
- combine the initialisation of pl3e into a single assignment.
- use the new alloc_map_clear() helper.
- use the normal map_domain_page() in the error path.
---
 xen/arch/x86/smpboot.c | 44 ++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 43abf2a332..186211ccc9 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -672,8 +672,8 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     unsigned long linear = (unsigned long)ptr, pfn;
     unsigned int flags;
     l3_pgentry_t *pl3e;
-    l2_pgentry_t *pl2e;
-    l1_pgentry_t *pl1e;
+    l2_pgentry_t *pl2e = NULL;
+    l1_pgentry_t *pl1e = NULL;
     int rc = 0;
 
     /*
@@ -688,7 +688,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
          (linear >= XEN_VIRT_END && linear < DIRECTMAP_VIRT_START) )
         return -EINVAL;
 
-    pl3e = l4e_to_l3e(idle_pg_table[root_table_offset(linear)]) +
+    pl3e = map_l3t_from_l4e(idle_pg_table[root_table_offset(linear)]) +
         l3_table_offset(linear);
 
     flags = l3e_get_flags(*pl3e);
@@ -701,7 +701,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     }
     else
     {
-        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(linear);
+        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(linear);
         flags = l2e_get_flags(*pl2e);
         ASSERT(flags & _PAGE_PRESENT);
         if ( flags & _PAGE_PSE )
@@ -712,7 +712,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
         else
         {
-            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
+            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
                 goto out;
@@ -720,51 +720,58 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
     }
 
+    UNMAP_DOMAIN_PAGE(pl1e);
+    UNMAP_DOMAIN_PAGE(pl2e);
+    UNMAP_DOMAIN_PAGE(pl3e);
+
     if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
     {
-        pl3e = alloc_xen_pagetable();
+        mfn_t l3mfn;
+
+        pl3e = alloc_map_clear_xen_pt(&l3mfn);
         rc = -ENOMEM;
         if ( !pl3e )
             goto out;
-        clear_page(pl3e);
         l4e_write(&rpt[root_table_offset(linear)],
-                  l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
+                  l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR));
     }
     else
-        pl3e = l4e_to_l3e(rpt[root_table_offset(linear)]);
+        pl3e = map_l3t_from_l4e(rpt[root_table_offset(linear)]);
 
     pl3e += l3_table_offset(linear);
 
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
-        pl2e = alloc_xen_pagetable();
+        mfn_t l2mfn;
+
+        pl2e = alloc_map_clear_xen_pt(&l2mfn);
         rc = -ENOMEM;
         if ( !pl2e )
             goto out;
-        clear_page(pl2e);
-        l3e_write(pl3e, l3e_from_paddr(__pa(pl2e), __PAGE_HYPERVISOR));
+        l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
     }
     else
     {
         ASSERT(!(l3e_get_flags(*pl3e) & _PAGE_PSE));
-        pl2e = l3e_to_l2e(*pl3e);
+        pl2e = map_l2t_from_l3e(*pl3e);
     }
 
     pl2e += l2_table_offset(linear);
 
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
-        pl1e = alloc_xen_pagetable();
+        mfn_t l1mfn;
+
+        pl1e = alloc_map_clear_xen_pt(&l1mfn);
         rc = -ENOMEM;
         if ( !pl1e )
             goto out;
-        clear_page(pl1e);
-        l2e_write(pl2e, l2e_from_paddr(__pa(pl1e), __PAGE_HYPERVISOR));
+        l2e_write(pl2e, l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR));
     }
     else
     {
         ASSERT(!(l2e_get_flags(*pl2e) & _PAGE_PSE));
-        pl1e = l2e_to_l1e(*pl2e);
+        pl1e = map_l1t_from_l2e(*pl2e);
     }
 
     pl1e += l1_table_offset(linear);
@@ -780,6 +787,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     rc = 0;
  out:
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
     return rc;
 }
 
-- 
2.24.1.AMZN



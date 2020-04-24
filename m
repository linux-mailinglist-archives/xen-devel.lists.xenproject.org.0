Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CA1B7833
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBc-0005CB-Jb; Fri, 24 Apr 2020 14:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBb-0005C1-7r
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:11 +0000
X-Inumbo-ID: b49af0d0-8636-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b49af0d0-8636-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVqrmVsGdg3zpwD9FEpHmV6lLm/2eKe7Noqaodw3sA0=; b=V8FbMqzOcf8cIbYeZPQzZWj/KA
 p7AYo5DE3aekQCANOc1ZUCpiC/yXyRvfKoPVrse5MTGHE3fyfo6EOVHo/gF1gNh8ppSwVS7s5SZbB
 BKZzSSzyZ76nwv41UdueYbSOX1zieiD5sxgDbGC6I/dT8LPLGBJILeSx3JvvTWgwE/u4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001xD-AC; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1M-0001fN-FH; Fri, 24 Apr 2020 14:09:36 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 12/15] x86/smpboot: switch pl*e to use new APIs in
 clone_mapping
Date: Fri, 24 Apr 2020 15:09:03 +0100
Message-Id: <a1c29e58a5d40748413e8088ad88ba4319a328d4.1587735799.git.hongyxia@amazon.com>
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

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/smpboot.c | 54 +++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 5b0e24f925..0e0ae56c76 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -672,9 +672,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 {
     unsigned long linear = (unsigned long)ptr, pfn;
     unsigned int flags;
-    l3_pgentry_t *pl3e;
-    l2_pgentry_t *pl2e;
-    l1_pgentry_t *pl1e;
+    l3_pgentry_t *pl3e = NULL;
+    l2_pgentry_t *pl2e = NULL;
+    l1_pgentry_t *pl1e = NULL;
     int rc = -ENOMEM;
 
     /*
@@ -689,8 +689,8 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
          (linear >= XEN_VIRT_END && linear < DIRECTMAP_VIRT_START) )
         return -EINVAL;
 
-    pl3e = l4e_to_l3e(idle_pg_table[root_table_offset(linear)]) +
-        l3_table_offset(linear);
+    pl3e = map_l3t_from_l4e(idle_pg_table[root_table_offset(linear)]);
+    pl3e += l3_table_offset(linear);
 
     flags = l3e_get_flags(*pl3e);
     ASSERT(flags & _PAGE_PRESENT);
@@ -702,7 +702,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     }
     else
     {
-        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(linear);
+        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(linear);
         flags = l2e_get_flags(*pl2e);
         ASSERT(flags & _PAGE_PRESENT);
         if ( flags & _PAGE_PSE )
@@ -713,7 +713,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
         else
         {
-            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
+            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
             {
@@ -724,48 +724,61 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
         }
     }
 
+    UNMAP_DOMAIN_PAGE(pl1e);
+    UNMAP_DOMAIN_PAGE(pl2e);
+    UNMAP_DOMAIN_PAGE(pl3e);
+
     if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
     {
-        pl3e = alloc_xen_pagetable();
-        if ( !pl3e )
+        mfn_t l3mfn = alloc_xen_pagetable_new();
+
+        if ( mfn_eq(l3mfn, INVALID_MFN) )
             goto out;
+
+        pl3e = map_domain_page(l3mfn);
         clear_page(pl3e);
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
-        if ( !pl2e )
+        mfn_t l2mfn = alloc_xen_pagetable_new();
+
+        if ( mfn_eq(l2mfn, INVALID_MFN) )
             goto out;
+
+        pl2e = map_domain_page(l2mfn);
         clear_page(pl2e);
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
-        if ( !pl1e )
+        mfn_t l1mfn = alloc_xen_pagetable_new();
+
+        if ( mfn_eq(l1mfn, INVALID_MFN) )
             goto out;
+
+        pl1e = map_domain_page(l1mfn);
         clear_page(pl1e);
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
@@ -781,6 +794,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
 
     rc = 0;
  out:
+    UNMAP_DOMAIN_PAGE(pl1e);
+    UNMAP_DOMAIN_PAGE(pl2e);
+    UNMAP_DOMAIN_PAGE(pl3e);
     return rc;
 }
 
-- 
2.24.1.AMZN



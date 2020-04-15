Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FFD1AB0D7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 20:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOmvQ-0000GT-Lv; Wed, 15 Apr 2020 18:38:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOmvP-0000GC-DS
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 18:38:15 +0000
X-Inumbo-ID: 4099e352-7f48-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4099e352-7f48-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 18:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wtSQHHmgrwnbMvPmliwMYHdNPJs99gEJt0RbRPvDJgc=; b=vduiSzcAUdceT/n7jp+T1bniId
 ZPNFexGiSZu0nll3HunbP2GHiz8v8ANbQ9h0d924b/+mEYpum/bbbZT/xKLduFcUHmv/V2Sp7BSrh
 Z0Bdsadnz0SrGhTLQxqM6K4yj4srTWyHXKtIDA54aYjg0L0IJbzhz3BvzKldlp713yWY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvI-00020s-A7; Wed, 15 Apr 2020 18:38:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvI-0005Md-0h; Wed, 15 Apr 2020 18:38:08 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 4/4] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
Date: Wed, 15 Apr 2020 19:37:52 +0100
Message-Id: <cd077c5592df0ee1c3568bab1c5e5001946981a9.1586975587.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586975587.git.hongyxia@amazon.com>
References: <cover.1586975587.git.hongyxia@amazon.com>
In-Reply-To: <cover.1586975587.git.hongyxia@amazon.com>
References: <cover.1586975587.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
Changed in v4:
- switch to normal unmap_domain_page() for variable right before
  end-of-scope.

Changed in v3:
- rename l2_ro_mpt into pl2e to avoid confusion.

Changed in v2:
- no point in re-mapping l2t because it is exactly the same as
  l2_ro_mpt.
- point l2_ro_mpt to the entry instead of doing l2_table_offset() all
  the time.
---
 xen/arch/x86/x86_64/mm.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index cfaeae84e9..e85ef449f3 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -263,7 +263,8 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
     unsigned long i, va, rwva;
     unsigned long smap = info->spfn, emap = info->epfn;
 
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
+    l3_ro_mpt = map_l3t_from_l4e(
+                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
 
     /*
      * No need to clean m2p structure existing before the hotplug
@@ -271,7 +272,7 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
     for (i = smap; i < emap;)
     {
         unsigned long pt_pfn;
-        l2_pgentry_t *l2_ro_mpt;
+        l2_pgentry_t *pl2e;
 
         va = RO_MPT_VIRT_START + i * sizeof(*machine_to_phys_mapping);
         rwva = RDWR_MPT_VIRT_START + i * sizeof(*machine_to_phys_mapping);
@@ -285,26 +286,30 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
             continue;
         }
 
-        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
-        if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT))
+        pl2e = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]) +
+                    l2_table_offset(va);
+        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
             i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
                     (1UL << (L2_PAGETABLE_SHIFT - 3)) ;
+            UNMAP_DOMAIN_PAGE(pl2e);
             continue;
         }
 
-        pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
+        pt_pfn = l2e_get_pfn(*pl2e);
         if ( hotadd_mem_valid(pt_pfn, info) )
         {
             destroy_xen_mappings(rwva, rwva + (1UL << L2_PAGETABLE_SHIFT));
 
-            l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
-            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_empty());
+            l2e_write(pl2e, l2e_empty());
         }
         i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
               (1UL << (L2_PAGETABLE_SHIFT - 3));
+        unmap_domain_page(pl2e);
     }
 
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
+
     destroy_compat_m2p_mapping(info);
 
     /* Brute-Force flush all TLB */
-- 
2.24.1.AMZN



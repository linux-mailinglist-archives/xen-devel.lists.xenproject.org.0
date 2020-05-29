Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632831E7B63
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecwA-0004sE-4C; Fri, 29 May 2020 11:12:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jecw7-0004qa-T4
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:12:27 +0000
X-Inumbo-ID: 454bad0a-a19d-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 454bad0a-a19d-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjQKyxZLA0QE9GtStVEVXPSECpE1q2ci33MDmy3Zy3Y=; b=XYB7xs7QRSFY1emHQLtBmUwT2x
 XJRzSFS+uc6qdE90IrcfcEilXtm1v46WTFWepVs2pPlZb8ebinjMLLJzCtlB9nQR94F6b+dJt8stz
 my/tWeA2F5GZIzvUgJnh+jE9GH4J/avzOdu2nCTma+REsh+OLGUiCxwEulTBj1DEi4I4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw2-00022S-OW; Fri, 29 May 2020 11:12:22 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecw2-0006tM-F5; Fri, 29 May 2020 11:12:22 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 08/15] x86_64/mm: switch to new APIs in setup_m2p_table
Date: Fri, 29 May 2020 12:11:52 +0100
Message-Id: <14aec5f25e8226a45dbc6b26fcc9981ea5f66a90.1590750232.git.hongyxia@amazon.com>
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

Avoid repetitive mapping of l2_ro_mpt by keeping it across loops, and
only unmap and map it when crossing 1G boundaries.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v7:
- avoid repetitive mapping of l2_ro_mpt.
- edit commit message.
- switch to alloc_map_clear_xen_pt().
---
 xen/arch/x86/x86_64/mm.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8877ac7bb7..cfc3de9091 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -385,7 +385,8 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
     ASSERT(l4e_get_flags(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)])
             & _PAGE_PRESENT);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
+    l3_ro_mpt = map_l3t_from_l4e(
+                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
 
     smap = (info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 3)) -1)));
     emap = ((info->epfn + ((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1 )) &
@@ -403,6 +404,10 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
     i = smap;
     while ( i < emap )
     {
+        if ( (RO_MPT_VIRT_START + i * sizeof(*machine_to_phys_mapping)) &
+             ((1UL << L3_PAGETABLE_SHIFT) - 1) )
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
         switch ( m2p_mapped(i) )
         {
         case M2P_1G_MAPPED:
@@ -438,32 +443,29 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
             ASSERT(!(l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
                   _PAGE_PSE));
-            if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
-              _PAGE_PRESENT )
-                l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]) +
-                  l2_table_offset(va);
-            else
+            if ( (l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
+                  _PAGE_PRESENT) && !l2_ro_mpt)
+                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
+            else if ( !l2_ro_mpt )
             {
-                l2_ro_mpt = alloc_xen_pagetable();
+                mfn_t l2_ro_mpt_mfn;
+
+                l2_ro_mpt = alloc_map_clear_xen_pt(&l2_ro_mpt_mfn);
                 if ( !l2_ro_mpt )
                 {
                     ret = -ENOMEM;
                     goto error;
                 }
 
-                clear_page(l2_ro_mpt);
                 l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                          l3e_from_paddr(__pa(l2_ro_mpt),
-                                         __PAGE_HYPERVISOR_RO | _PAGE_USER));
-                l2_ro_mpt += l2_table_offset(va);
+                          l3e_from_mfn(l2_ro_mpt_mfn,
+                                       __PAGE_HYPERVISOR_RO | _PAGE_USER));
             }
 
             /* NB. Cannot be GLOBAL: guest user mode should not see it. */
-            l2e_write(l2_ro_mpt, l2e_from_mfn(mfn,
+            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_from_mfn(mfn,
                    /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
         }
-        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
-            l2_ro_mpt = NULL;
         i += ( 1UL << (L2_PAGETABLE_SHIFT - 3));
     }
 #undef CNT
@@ -471,6 +473,8 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
     ret = setup_compat_m2p_table(info);
 error:
+    unmap_domain_page(l2_ro_mpt);
+    unmap_domain_page(l3_ro_mpt);
     return ret;
 }
 
-- 
2.24.1.AMZN



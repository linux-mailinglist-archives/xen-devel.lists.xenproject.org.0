Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE51B7811
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1O-0002yZ-Sv; Fri, 24 Apr 2020 14:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1N-0002xq-Eu
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:37 +0000
X-Inumbo-ID: 37a37e36-8635-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37a37e36-8635-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRkSpuClFodnft3WeIOUG75ZUCmfP/WLuHx0luTOIk0=; b=UcF2ZDXTxspxFWqMo8u0pUjDco
 KWijGwEGxYWD5cuD29mhl1j3+gwF7TffeFBF6eB5j529681ajhs1Yz1XXA0sZ6yL7nJsMD1roTDeQ
 I7qO/kbcb708/ZdcGdKOYRc4yvuM9/lQFfD8S1M26YuiI0rMiVnT4aoPnN0is+F/AuMc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz1H-0001hY-77; Fri, 24 Apr 2020 14:09:31 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1G-0001fN-Rd; Fri, 24 Apr 2020 14:09:31 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 08/15] x86_64/mm: switch to new APIs in setup_m2p_table
Date: Fri, 24 Apr 2020 15:08:59 +0100
Message-Id: <a5e7c92fdc538c23f0173bec8e3b026dcf665c11.1587735799.git.hongyxia@amazon.com>
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

Also reduce the scope of l2_ro_mpt as it is only used inside the loop,
and remove two lines of l2_ro_mpt check which serve no purpose.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/x86_64/mm.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 3cf699d27b..12e9dc6eb2 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -379,13 +379,13 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 {
     unsigned long i, va, smap, emap;
     unsigned int n;
-    l2_pgentry_t *l2_ro_mpt = NULL;
     l3_pgentry_t *l3_ro_mpt = NULL;
     int ret = 0;
 
     ASSERT(l4e_get_flags(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)])
             & _PAGE_PRESENT);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
+    l3_ro_mpt = map_l3t_from_l4e(
+                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
 
     smap = (info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 3)) -1)));
     emap = ((info->epfn + ((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1 )) &
@@ -424,6 +424,7 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
                 break;
         if ( n < CNT )
         {
+            l2_pgentry_t *l2_ro_mpt;
             mfn_t mfn = alloc_hotadd_mfn(info);
 
             ret = map_pages_to_xen(
@@ -440,30 +441,30 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
                   _PAGE_PSE));
             if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
               _PAGE_PRESENT )
-                l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]) +
-                  l2_table_offset(va);
+                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
             else
             {
-                l2_ro_mpt = alloc_xen_pagetable();
-                if ( !l2_ro_mpt )
+                mfn_t l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+
+                if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
                 {
                     ret = -ENOMEM;
                     goto error;
                 }
 
+                l2_ro_mpt = map_domain_page(l2_ro_mpt_mfn);
                 clear_page(l2_ro_mpt);
                 l3e_write(&l3_ro_mpt[l3_table_offset(va)],
-                          l3e_from_paddr(__pa(l2_ro_mpt),
-                                         __PAGE_HYPERVISOR_RO | _PAGE_USER));
-                l2_ro_mpt += l2_table_offset(va);
+                          l3e_from_mfn(l2_ro_mpt_mfn,
+                                       __PAGE_HYPERVISOR_RO | _PAGE_USER));
             }
+            l2_ro_mpt += l2_table_offset(va);
 
             /* NB. Cannot be GLOBAL: guest user mode should not see it. */
             l2e_write(l2_ro_mpt, l2e_from_mfn(mfn,
                    /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
+            unmap_domain_page(l2_ro_mpt);
         }
-        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
-            l2_ro_mpt = NULL;
         i += ( 1UL << (L2_PAGETABLE_SHIFT - 3));
     }
 #undef CNT
@@ -471,6 +472,7 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
 
     ret = setup_compat_m2p_table(info);
 error:
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
     return ret;
 }
 
-- 
2.24.1.AMZN



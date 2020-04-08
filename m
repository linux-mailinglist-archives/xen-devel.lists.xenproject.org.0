Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF21A2329
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtY-0007fR-0F; Wed, 08 Apr 2020 13:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAtV-0007eh-Rr
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:29 +0000
X-Inumbo-ID: 0e2f8bb0-799e-11ea-81eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e2f8bb0-799e-11ea-81eb-12813bfff9fa;
 Wed, 08 Apr 2020 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pS3pgi5Klg6x1TQCoaRjBJz3s7LqDZEopgSLc7HSHmg=; b=nOifHnRenAwQ5G2IJdOrbzXvfv
 PljG74G9y0ObU1VAQ14wwi7J1ivQKw8Idf4P4DpJRrGKVWtg9h4n8CL5k0Eio1wUlXaHR9Iz7PzO/
 JU6k7IZjTbCvWR81csZBp6yhmbKej68ZPBCarFgq+GM1CUL4u9ZSXng1W2q+Talmqu2Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtF-000587-JW; Wed, 08 Apr 2020 13:37:13 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtF-0005ee-AA; Wed, 08 Apr 2020 13:37:13 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 5/5] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
Date: Wed,  8 Apr 2020 14:36:55 +0100
Message-Id: <1f6bde6f67ef214a3d4ffa81f0c55c4416c8edd4.1586352238.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586352238.git.hongyxia@amazon.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
In-Reply-To: <cover.1586352238.git.hongyxia@amazon.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
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
Changed in v2:
- no point in re-mapping l2t because it is exactly the same as
  l2_ro_mpt.
- point l2_ro_mpt to the entry instead of doing l2_table_offset() all
  the time.
---
 xen/arch/x86/x86_64/mm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index ae8f4dd0b9..ec5269e7fc 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -268,7 +268,8 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
     unsigned long i, va, rwva;
     unsigned long smap = info->spfn, emap = info->epfn;
 
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
+    l3_ro_mpt = map_l3t_from_l4e(
+                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
 
     /*
      * No need to clean m2p structure existing before the hotplug
@@ -290,26 +291,30 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
             continue;
         }
 
-        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
-        if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT))
+        l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]) +
+                    l2_table_offset(va);
+        if ( !(l2e_get_flags(*l2_ro_mpt) & _PAGE_PRESENT) )
         {
             i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
                     (1UL << (L2_PAGETABLE_SHIFT - 3)) ;
+            UNMAP_DOMAIN_PAGE(l2_ro_mpt);
             continue;
         }
 
-        pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
+        pt_pfn = l2e_get_pfn(*l2_ro_mpt);
         if ( hotadd_mem_valid(pt_pfn, info) )
         {
             destroy_xen_mappings(rwva, rwva + (1UL << L2_PAGETABLE_SHIFT));
 
-            l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
-            l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_empty());
+            l2e_write(l2_ro_mpt, l2e_empty());
         }
         i = ( i & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1)) +
               (1UL << (L2_PAGETABLE_SHIFT - 3));
+        UNMAP_DOMAIN_PAGE(l2_ro_mpt);
     }
 
+    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
+
     destroy_compat_m2p_mapping(info);
 
     /* Brute-Force flush all TLB */
-- 
2.24.1.AMZN



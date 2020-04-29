Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA41BDFCE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnEi-0003bq-Id; Wed, 29 Apr 2020 13:58:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QE4t=6N=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jTnEg-0003bl-HG
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:58:50 +0000
X-Inumbo-ID: 8d461552-8a21-11ea-994e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d461552-8a21-11ea-994e-12813bfff9fa;
 Wed, 29 Apr 2020 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RyoHK9CWiP4cTF2qLMov6hNKsFgTL3Rt8QhUOblogIs=; b=j38OwX+5FgdgsemPpy4hdkCMtS
 8hMDC1URLzSLHwkNZcSvYGQwa6iDA6RRAPI+9+A1Q2uUR/a8JbqVHVWvOg0lMYeyh4gOtnZ1zKe4Z
 Pv5tNL276aIWvXx+M+bEP85wSeT+tS6CBi/wkZxjw/JdsrqX8V4c/OTiv5olbi8uL6+M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jTnEf-0002SL-Fs; Wed, 29 Apr 2020 13:58:49 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jTnEf-0005dg-44; Wed, 29 Apr 2020 13:58:49 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/pv: map and unmap page tables in mark_pv_pt_pages_rdonly
Date: Wed, 29 Apr 2020 14:58:28 +0100
Message-Id: <8e1bf04e22f978e93c3e4e60be4c629dd449b8d5.1588168703.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Also, clean up the initialisation of plXe.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed since last revision:
- lift this patch out since others in the series have been merged.
- remove lXt variables and reuse plXe for unmapping.
- clean up plXe initialisation.
- drop a Reviewed-by.
---
 xen/arch/x86/pv/dom0_build.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index abfbe5f436..3522eb0114 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -49,18 +49,11 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
 {
     unsigned long count;
     struct page_info *page;
-    l4_pgentry_t *pl4e;
-    l3_pgentry_t *pl3e;
-    l2_pgentry_t *pl2e;
-    l1_pgentry_t *pl1e;
-
-    pl4e = l4start + l4_table_offset(vpt_start);
-    pl3e = l4e_to_l3e(*pl4e);
-    pl3e += l3_table_offset(vpt_start);
-    pl2e = l3e_to_l2e(*pl3e);
-    pl2e += l2_table_offset(vpt_start);
-    pl1e = l2e_to_l1e(*pl2e);
-    pl1e += l1_table_offset(vpt_start);
+    l4_pgentry_t *pl4e = l4start + l4_table_offset(vpt_start);
+    l3_pgentry_t *pl3e = map_l3t_from_l4e(*pl4e) + l3_table_offset(vpt_start);
+    l2_pgentry_t *pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(vpt_start);
+    l1_pgentry_t *pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(vpt_start);
+
     for ( count = 0; count < nr_pt_pages; count++ )
     {
         l1e_remove_flags(*pl1e, _PAGE_RW);
@@ -85,12 +78,21 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
             if ( !((unsigned long)++pl2e & (PAGE_SIZE - 1)) )
             {
                 if ( !((unsigned long)++pl3e & (PAGE_SIZE - 1)) )
-                    pl3e = l4e_to_l3e(*++pl4e);
-                pl2e = l3e_to_l2e(*pl3e);
+                {
+                    /* Need to unmap the page before the increment. */
+                    unmap_domain_page(pl3e - 1);
+                    pl3e = map_l3t_from_l4e(*++pl4e);
+                }
+                unmap_domain_page(pl2e - 1);
+                pl2e = map_l2t_from_l3e(*pl3e);
             }
-            pl1e = l2e_to_l1e(*pl2e);
+            unmap_domain_page(pl1e - 1);
+            pl1e = map_l1t_from_l2e(*pl2e);
         }
     }
+    unmap_domain_page(pl1e);
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
 }
 
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
-- 
2.17.1



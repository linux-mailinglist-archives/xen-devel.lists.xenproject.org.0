Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11D1BDC2D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 14:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTlqc-0001eJ-7n; Wed, 29 Apr 2020 12:29:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QE4t=6N=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jTlqb-0001e9-1n
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 12:29:53 +0000
X-Inumbo-ID: 1fb4de8a-8a15-11ea-993d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb4de8a-8a15-11ea-993d-12813bfff9fa;
 Wed, 29 Apr 2020 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzqoS5LBTFFcm6HUrxQtenW6a+6Xm50klkOFRqNlNPg=; b=E+NHz1VRrwfPDDKQLqQ13yObus
 9dcCdcYMLBfukGC6HRBGVKyR0abzNWlj3YS6R7r6XkA2FBsszXmmgMgtaw6fttdDkGFCUbGh2YutD
 GS1r5SPZw/e9bF81UqH2h7ZdJUAudYZHuByfj9kC/BKg276EpoIBCCjkjuBj0I5IBlZg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jTlqZ-0000jO-5C; Wed, 29 Apr 2020 12:29:51 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=s3-prod-r2d2-p7995.iad7.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jTlqY-0007FW-QQ; Wed, 29 Apr 2020 12:29:51 +0000
Message-ID: <40644d63e00a10636943f6322707c0ad6a73e11c.camel@xen.org>
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 29 Apr 2020 13:29:48 +0100
In-Reply-To: <ec318c48-41c3-5cbf-e03e-8838d9f488ba@suse.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
 <9df9c5163fde5d25ceb756b20714c58be93b2c6c.camel@xen.org>
 <c33dcaee9c8796da8816de9168f91ce90de61fc5.camel@xen.org>
 <e18871ea997a304394adbbc92e724ae0ec56d87a.camel@xen.org>
 <ec318c48-41c3-5cbf-e03e-8838d9f488ba@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(Looks like other patches in this series have been merged. Replying to
this one only.)

From: Wei Liu <wei.liu2@citrix.com>
Date: Tue, 5 Feb 2019 16:32:54 +0000
Subject: [PATCH] x86/pv: map and unmap page tables in
mark_pv_pt_pages_rdonly

Also, clean up the initialisation of plXe.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/pv/dom0_build.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c
b/xen/arch/x86/pv/dom0_build.c
index abfbe5f436..3522eb0114 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -49,18 +49,11 @@ static __init void mark_pv_pt_pages_rdonly(struct
domain *d,
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
+    l3_pgentry_t *pl3e = map_l3t_from_l4e(*pl4e) +
l3_table_offset(vpt_start);
+    l2_pgentry_t *pl2e = map_l2t_from_l3e(*pl3e) +
l2_table_offset(vpt_start);
+    l1_pgentry_t *pl1e = map_l1t_from_l2e(*pl2e) +
l1_table_offset(vpt_start);
+
     for ( count = 0; count < nr_pt_pages; count++ )
     {
         l1e_remove_flags(*pl1e, _PAGE_RW);
@@ -85,12 +78,21 @@ static __init void mark_pv_pt_pages_rdonly(struct
domain *d,
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
 
 static __init void setup_pv_physmap(struct domain *d, unsigned long
pgtbl_pfn,
-- 
2.24.1.AMZN



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6071ADA73
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfh-0000Mq-8p; Fri, 17 Apr 2020 09:52:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfg-0000Me-1B
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:28 +0000
X-Inumbo-ID: 241c2132-8091-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 241c2132-8091-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3PKlc7n3xS/jV0u6XuY6+PkL5866S2noi39EkmZJHLk=; b=6Wg/PSgPxch2MIXxZCIZTcAGU2
 e+xUte2YS7ssUZFYv3wFEa/duhWo1Ggen13MRH11jSCORyfcUeRbyKWsDQDL6mNvXVJ1/HexFz1DW
 fygtm8y+pMpFDHAveHIAoqHwbPYOc4iAYVihpCinG71neeIk6++Dvyj3pRxvpxhj1a3U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfc-0002g2-TE; Fri, 17 Apr 2020 09:52:24 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfc-000304-Ju; Fri, 17 Apr 2020 09:52:24 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
Date: Fri, 17 Apr 2020 10:52:07 +0100
Message-Id: <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587116799.git.hongyxia@amazon.com>
References: <cover.1587116799.git.hongyxia@amazon.com>
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
 xen/arch/x86/pv/dom0_build.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5678da782d..28a939b68a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -50,17 +50,17 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
     unsigned long count;
     struct page_info *page;
     l4_pgentry_t *pl4e;
-    l3_pgentry_t *pl3e;
-    l2_pgentry_t *pl2e;
-    l1_pgentry_t *pl1e;
+    l3_pgentry_t *pl3e, *l3t;
+    l2_pgentry_t *pl2e, *l2t;
+    l1_pgentry_t *pl1e, *l1t;
 
     pl4e = l4start + l4_table_offset(vpt_start);
-    pl3e = l4e_to_l3e(*pl4e);
-    pl3e += l3_table_offset(vpt_start);
-    pl2e = l3e_to_l2e(*pl3e);
-    pl2e += l2_table_offset(vpt_start);
-    pl1e = l2e_to_l1e(*pl2e);
-    pl1e += l1_table_offset(vpt_start);
+    l3t = map_l3t_from_l4e(*pl4e);
+    pl3e = l3t + l3_table_offset(vpt_start);
+    l2t = map_l2t_from_l3e(*pl3e);
+    pl2e = l2t + l2_table_offset(vpt_start);
+    l1t = map_l1t_from_l2e(*pl2e);
+    pl1e = l1t + l1_table_offset(vpt_start);
     for ( count = 0; count < nr_pt_pages; count++ )
     {
         l1e_remove_flags(*pl1e, _PAGE_RW);
@@ -85,12 +85,20 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
             if ( !((unsigned long)++pl2e & (PAGE_SIZE - 1)) )
             {
                 if ( !((unsigned long)++pl3e & (PAGE_SIZE - 1)) )
-                    pl3e = l4e_to_l3e(*++pl4e);
-                pl2e = l3e_to_l2e(*pl3e);
+                {
+                    unmap_domain_page(l3t);
+                    pl3e = l3t = map_l3t_from_l4e(*++pl4e);
+                }
+                unmap_domain_page(l2t);
+                pl2e = l2t = map_l2t_from_l3e(*pl3e);
             }
-            pl1e = l2e_to_l1e(*pl2e);
+            unmap_domain_page(l1t);
+            pl1e = l1t = map_l1t_from_l2e(*pl2e);
         }
     }
+    unmap_domain_page(l1t);
+    unmap_domain_page(l2t);
+    unmap_domain_page(l3t);
 }
 
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
-- 
2.24.1.AMZN



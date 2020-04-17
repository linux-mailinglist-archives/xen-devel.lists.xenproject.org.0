Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969391ADA77
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfn-0000Qx-TH; Fri, 17 Apr 2020 09:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfn-0000Qc-18
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:35 +0000
X-Inumbo-ID: 232cfa12-8091-11ea-8c9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 232cfa12-8091-11ea-8c9b-12813bfff9fa;
 Fri, 17 Apr 2020 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TtfDNJhA8tjoCGd8nfl59DQgpyHwzck4uvav7srJyZM=; b=g3HnPNSWrF201Ln96S0X0V/JcW
 wroUnjXehYGLMAV4J6FGf/LZz+Cb5M0eHPm7Uit2Ahbyyp080Cd7ak33v8QUeCSxka8THYJSgwbB7
 hXKpv/5fMSRJbedRVuycqIxJJdh5+Ckl6+oU+foZDHO9fLzjdIRZ6B0GGPM0rRpGRNSk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfb-0002fw-Fo; Fri, 17 Apr 2020 09:52:23 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfb-000304-6P; Fri, 17 Apr 2020 09:52:23 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 4/6] x86/smpboot: map and unmap page tables in
 cleanup_cpu_root_pgt
Date: Fri, 17 Apr 2020 10:52:06 +0100
Message-Id: <bc0ad02ad73ac3f02e063457d69634b1f6b57ddc.1587116799.git.hongyxia@amazon.com>
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
 xen/arch/x86/smpboot.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 09264b02d1..275ce7661d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -858,23 +858,27 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
           r < root_table_offset(HYPERVISOR_VIRT_END); ++r )
     {
         l3_pgentry_t *l3t;
+        mfn_t l3mfn;
         unsigned int i3;
 
         if ( !(root_get_flags(rpt[r]) & _PAGE_PRESENT) )
             continue;
 
-        l3t = l4e_to_l3e(rpt[r]);
+        l3mfn = l4e_get_mfn(rpt[r]);
+        l3t = map_domain_page(l3mfn);
 
         for ( i3 = 0; i3 < L3_PAGETABLE_ENTRIES; ++i3 )
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
             unsigned int i2;
 
             if ( !(l3e_get_flags(l3t[i3]) & _PAGE_PRESENT) )
                 continue;
 
             ASSERT(!(l3e_get_flags(l3t[i3]) & _PAGE_PSE));
-            l2t = l3e_to_l2e(l3t[i3]);
+            l2mfn = l3e_get_mfn(l3t[i3]);
+            l2t = map_domain_page(l2mfn);
 
             for ( i2 = 0; i2 < L2_PAGETABLE_ENTRIES; ++i2 )
             {
@@ -882,13 +886,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
                     continue;
 
                 ASSERT(!(l2e_get_flags(l2t[i2]) & _PAGE_PSE));
-                free_xen_pagetable(l2e_to_l1e(l2t[i2]));
+                free_xen_pagetable_new(l2e_get_mfn(l2t[i2]));
             }
 
-            free_xen_pagetable(l2t);
+            unmap_domain_page(l2t);
+            free_xen_pagetable_new(l2mfn);
         }
 
-        free_xen_pagetable(l3t);
+        unmap_domain_page(l3t);
+        free_xen_pagetable_new(l3mfn);
     }
 
     free_xen_pagetable(rpt);
@@ -896,11 +902,14 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
     /* Also zap the stub mapping for this CPU. */
     if ( stub_linear )
     {
-        l3_pgentry_t *l3t = l4e_to_l3e(common_pgt);
-        l2_pgentry_t *l2t = l3e_to_l2e(l3t[l3_table_offset(stub_linear)]);
-        l1_pgentry_t *l1t = l2e_to_l1e(l2t[l2_table_offset(stub_linear)]);
+        l3_pgentry_t l3e = l3e_from_l4e(common_pgt,
+                                        l3_table_offset(stub_linear));
+        l2_pgentry_t l2e = l2e_from_l3e(l3e, l2_table_offset(stub_linear));
+        l1_pgentry_t *l1t = map_l1t_from_l2e(l2e);
 
         l1t[l1_table_offset(stub_linear)] = l1e_empty();
+
+        unmap_domain_page(l1t);
     }
 }
 
-- 
2.24.1.AMZN



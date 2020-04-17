Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17131ADA78
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNft-0000UJ-CB; Fri, 17 Apr 2020 09:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfs-0000Tf-1F
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:40 +0000
X-Inumbo-ID: 24f1209e-8091-11ea-8c9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24f1209e-8091-11ea-8c9b-12813bfff9fa;
 Fri, 17 Apr 2020 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dfu+OgKnJzFWoXe/gPFe0obtWomHwJiB46S0uhovLc0=; b=D3+GJWuLGIwR19dKVk0QfvNpEP
 cq5z41eQ+J/4T7c2UgY0l1mUsBfDgyPYxRoCHvFEVty/RdmTdnBAeHoDv2QLHpo989tqmXDP8/zq8
 aqAaX/Nm3UKdNTMnSmr4X/cLjNmWJY6ox7HCtSFN9clvlm85ITsPGB8cccDyzXW+xf+w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfe-0002g8-Aj; Fri, 17 Apr 2020 09:52:26 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfe-000304-15; Fri, 17 Apr 2020 09:52:26 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 6/6] x86/pv: map and unmap page table in dom0_construct_pv
Date: Fri, 17 Apr 2020 10:52:08 +0100
Message-Id: <18fda6bdeb4f20bf2272503e45c7c420e51673ac.1587116799.git.hongyxia@amazon.com>
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
 xen/arch/x86/pv/dom0_build.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 28a939b68a..a03f0501ab 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -677,6 +677,8 @@ int __init dom0_construct_pv(struct domain *d,
 
     if ( is_pv_32bit_domain(d) )
     {
+        l2_pgentry_t *l2t;
+
         /* Ensure the first four L3 entries are all populated. */
         for ( i = 0, l3tab = l3start; i < 4; ++i, ++l3tab )
         {
@@ -691,7 +693,9 @@ int __init dom0_construct_pv(struct domain *d,
                 l3e_get_page(*l3tab)->u.inuse.type_info |= PGT_pae_xen_l2;
         }
 
-        init_xen_pae_l2_slots(l3e_to_l2e(l3start[3]), d);
+        l2t = map_l2t_from_l3e(l3start[3]);
+        init_xen_pae_l2_slots(l2t, d);
+        unmap_domain_page(l2t);
     }
 
     /* Pages that are part of page tables must be read only. */
-- 
2.24.1.AMZN



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03201AB0D5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 20:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOmvM-0000Fw-Bd; Wed, 15 Apr 2020 18:38:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOmvK-0000Ff-Cm
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 18:38:10 +0000
X-Inumbo-ID: 3fbf2870-7f48-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fbf2870-7f48-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NjsU0mvN8f3Kkt58hhovqMgTFjoAL4EcJkT/EkRsASw=; b=c7BI++wLiuzUBdO51vXkFZaF1N
 GtK7GzkoHTVf1NNy4tip3XFLBWm8xW1eedEDpZzh0oZxjQKQTB6PF2iZ0GVysGvceERfJGj3zxaMc
 PF5JO63vX/WxoZ972Vo/epj51DNq00Jrh6HF/CiluJlFqboVYeWQ/83f25K8K2mY2YnY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvG-00020l-TD; Wed, 15 Apr 2020 18:38:06 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvG-0005Md-JN; Wed, 15 Apr 2020 18:38:06 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 3/4] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
Date: Wed, 15 Apr 2020 19:37:51 +0100
Message-Id: <3e716bbf183f8ecd162c04e1c3f4c44fd292d082.1586975587.git.hongyxia@amazon.com>
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

Fetch lYe by mapping and unmapping lXe instead of using the direct map,
which is now done via the lYe_from_lXe() helpers.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v2:
- the introduction of the macros is now lifted to a previous patch.
---
 xen/arch/x86/x86_64/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 41755ded26..cfaeae84e9 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -166,14 +166,14 @@ static int share_hotadd_m2p_table(struct mem_hotadd_info *info)
           v += n << PAGE_SHIFT )
     {
         n = L2_PAGETABLE_ENTRIES * L1_PAGETABLE_ENTRIES;
-        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(v)])[
-            l3_table_offset(v)];
+        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(v)],
+                           l3_table_offset(v));
         if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) )
             continue;
         if ( !(l3e_get_flags(l3e) & _PAGE_PSE) )
         {
             n = L1_PAGETABLE_ENTRIES;
-            l2e = l3e_to_l2e(l3e)[l2_table_offset(v)];
+            l2e = l2e_from_l3e(l3e, l2_table_offset(v));
             if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) )
                 continue;
             m2p_start_mfn = l2e_get_mfn(l2e);
@@ -194,11 +194,11 @@ static int share_hotadd_m2p_table(struct mem_hotadd_info *info)
           v != RDWR_COMPAT_MPT_VIRT_END;
           v += 1 << L2_PAGETABLE_SHIFT )
     {
-        l3e = l4e_to_l3e(idle_pg_table[l4_table_offset(v)])[
-            l3_table_offset(v)];
+        l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(v)],
+                           l3_table_offset(v));
         if ( !(l3e_get_flags(l3e) & _PAGE_PRESENT) )
             continue;
-        l2e = l3e_to_l2e(l3e)[l2_table_offset(v)];
+        l2e = l2e_from_l3e(l3e, l2_table_offset(v));
         if ( !(l2e_get_flags(l2e) & _PAGE_PRESENT) )
             continue;
         m2p_start_mfn = l2e_get_mfn(l2e);
-- 
2.24.1.AMZN



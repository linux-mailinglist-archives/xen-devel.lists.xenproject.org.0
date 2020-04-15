Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8E1A9E8E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOgho-0003GJ-LJ; Wed, 15 Apr 2020 11:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOghm-0003FW-5m
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:59:46 +0000
X-Inumbo-ID: 973ca8c6-7f10-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 973ca8c6-7f10-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtlOkdsHjlKFcb39XzK+uw2HvlaIF3cGj21C2XsAUj8=; b=FpVo8693YOPFA2t/1W+vffr5Ws
 3tlJRH5F3gQAuMtWynTMp+WVSXr11rzOZbjUkHl5iMEBCTrPQAtJF53/Q3NaLj2s4ZwysEC24w4rA
 yAnvGCube/J6z8s1HAaSrMBRTieI2+S5xAS6acQQ8UnYjCrzRHRxBE43dGM4NyxRxscg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghh-00027X-Oa; Wed, 15 Apr 2020 11:59:41 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghh-0008L0-Eb; Wed, 15 Apr 2020 11:59:41 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 2/4] x86_64/mm: map and unmap page tables in m2p_mapped
Date: Wed, 15 Apr 2020 12:59:25 +0100
Message-Id: <4e76f1b1ad2f63c460571924632fa910c33a16fd.1586951696.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586951696.git.hongyxia@amazon.com>
References: <cover.1586951696.git.hongyxia@amazon.com>
In-Reply-To: <cover.1586951696.git.hongyxia@amazon.com>
References: <cover.1586951696.git.hongyxia@amazon.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v3:
- rename l3e_ro_mpt and l2e_ro_mpt, just call them l3e and l2e.

Changed in v2:
- avoid adding goto labels, simply get the PTE and unmap quickly.
- code style fixes.
---
 xen/arch/x86/x86_64/mm.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index cee836ec37..41755ded26 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -129,14 +129,13 @@ static mfn_t alloc_hotadd_mfn(struct mem_hotadd_info *info)
 static int m2p_mapped(unsigned long spfn)
 {
     unsigned long va;
-    l3_pgentry_t *l3_ro_mpt;
-    l2_pgentry_t *l2_ro_mpt;
+    l3_pgentry_t l3e;
+    l2_pgentry_t l2e;
 
     va = RO_MPT_VIRT_START + spfn * sizeof(*machine_to_phys_mapping);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
+    l3e = l3e_from_l4e(idle_pg_table[l4_table_offset(va)], l3_table_offset(va));
 
-    switch ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
-             (_PAGE_PRESENT |_PAGE_PSE))
+    switch ( l3e_get_flags(l3e) & (_PAGE_PRESENT | _PAGE_PSE) )
     {
         case _PAGE_PSE|_PAGE_PRESENT:
             return M2P_1G_MAPPED;
@@ -146,9 +145,9 @@ static int m2p_mapped(unsigned long spfn)
         default:
             return M2P_NO_MAPPED;
     }
-    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
+    l2e = l2e_from_l3e(l3e, l2_table_offset(va));
 
-    if (l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT)
+    if ( l2e_get_flags(l2e) & _PAGE_PRESENT )
         return M2P_2M_MAPPED;
 
     return M2P_NO_MAPPED;
-- 
2.24.1.AMZN



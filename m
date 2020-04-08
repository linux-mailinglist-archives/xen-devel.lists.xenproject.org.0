Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A451A2327
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtN-0007b8-E7; Wed, 08 Apr 2020 13:37:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAtL-0007ag-Rd
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:19 +0000
X-Inumbo-ID: 0c80ea34-799e-11ea-81eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c80ea34-799e-11ea-81eb-12813bfff9fa;
 Wed, 08 Apr 2020 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dvAgEAJTUQsFmV9V5FW8EQm/8m/fPeE0c4VRVxGpgO8=; b=YCViXq8NbDg7s2LFuKE1ZbOwSe
 5PWb4xt0x7YgkFUYoxpdrjRQNt7NALBaJ4XcIpn7uWLFWcimvRreF2BMeCtDZmRhDX521dZEpQLoa
 pEeHV8CtcLigIlja5PbRrjZFBtzOsraGOY7jy3nTmTd4fUoecXIZImu3bk2SMNIQukTs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtC-00057r-OY; Wed, 08 Apr 2020 13:37:10 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtC-0005ee-FG; Wed, 08 Apr 2020 13:37:10 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
Date: Wed,  8 Apr 2020 14:36:53 +0100
Message-Id: <9bf2df7cfd65eb783afeab7d27b98b1a99233a3c.1586352238.git.hongyxia@amazon.com>
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

Fetch lYe by mapping and unmapping lXe instead of using the direct map,
which is now done via the lYe_from_lXe() helpers.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v2:
- the introduction of the macros is now lifted to a previous patch.
---
 xen/arch/x86/x86_64/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8e0caa7327..d23c7e4f5b 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -167,14 +167,14 @@ static int share_hotadd_m2p_table(struct mem_hotadd_info *info)
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
@@ -195,11 +195,11 @@ static int share_hotadd_m2p_table(struct mem_hotadd_info *info)
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A81A9E86
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOghn-0003Fc-9t; Wed, 15 Apr 2020 11:59:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOghl-0003FN-7L
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:59:45 +0000
X-Inumbo-ID: 983fd5e0-7f10-11ea-8a3a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 983fd5e0-7f10-11ea-8a3a-12813bfff9fa;
 Wed, 15 Apr 2020 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NjsU0mvN8f3Kkt58hhovqMgTFjoAL4EcJkT/EkRsASw=; b=YRocKqYUdMym1/68P8V3o6gmma
 mAV7pQqwqJ9R1TFAkiQ6tJ6gWhh+ncMYSwHckl/uC3xssDklx5AXNGn/5L8LE9Il09LtghxsftmIc
 Y5MrQ3pt2oguIL/oYpLJ8pO8Fv01Ad5nggAPS+NvKOYTY7AypvphkNKZqwSy6+ZHB8Po=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghj-00027g-7M; Wed, 15 Apr 2020 11:59:43 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOghi-0008L0-TS; Wed, 15 Apr 2020 11:59:43 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 3/4] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
Date: Wed, 15 Apr 2020 12:59:26 +0100
Message-Id: <584d70dfd76de21231b1f39f25a36fe58375e4f0.1586951696.git.hongyxia@amazon.com>
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



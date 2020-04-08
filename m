Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1F1A2328
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtS-0007d3-Mo; Wed, 08 Apr 2020 13:37:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAtQ-0007cS-Rl
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:24 +0000
X-Inumbo-ID: 0cb3f0e7-799e-11ea-81eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cb3f0e7-799e-11ea-81eb-12813bfff9fa;
 Wed, 08 Apr 2020 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yTTvkNyII5BhLnC2cgeRtkKq0z4LVuvF6ZWlS86jsoM=; b=H8F6bWhl6k4TUyEYYh8V1A31Lh
 9MN86iMcWSd/slqnG3BKiB94QqaIaYKInUiyNgbeQAG26SsLuIirq3zhdrmHB6wxTaMoYumTjh3ic
 fPa0CUCwtSTTpE4gr8do7U6VnEMUIxypqY4Uw8a3MUO29pahR5SlbX7i/M60UiYdEXE0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtE-000580-5j; Wed, 08 Apr 2020 13:37:12 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtD-0005ee-SQ; Wed, 08 Apr 2020 13:37:12 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/5] x86_64/mm: map and unmap page tables in
 destroy_compat_m2p_mapping
Date: Wed,  8 Apr 2020 14:36:54 +0100
Message-Id: <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
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
- there is pretty much no point in keeping l3_ro_mpt mapped, just fetch
  the l3e instead, which also cleans up the code.
---
 xen/arch/x86/x86_64/mm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d23c7e4f5b..ae8f4dd0b9 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -220,7 +220,7 @@ static void destroy_compat_m2p_mapping(struct mem_hotadd_info *info)
     unsigned long i, va, rwva, pt_pfn;
     unsigned long smap = info->spfn, emap = info->spfn;
 
-    l3_pgentry_t *l3_ro_mpt;
+    l3_pgentry_t l3e_ro_mpt;
     l2_pgentry_t *l2_ro_mpt;
 
     if ( smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
@@ -229,11 +229,13 @@ static void destroy_compat_m2p_mapping(struct mem_hotadd_info *info)
     if ( emap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
         emap = (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2;
 
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(HIRO_COMPAT_MPT_VIRT_START)]);
+    l3e_ro_mpt = l3e_from_l4e(idle_pg_table[
+                                  l4_table_offset(HIRO_COMPAT_MPT_VIRT_START)],
+                              l3_table_offset(HIRO_COMPAT_MPT_VIRT_START));
 
-    ASSERT(l3e_get_flags(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)]) & _PAGE_PRESENT);
+    ASSERT(l3e_get_flags(l3e_ro_mpt) & _PAGE_PRESENT);
 
-    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)]);
+    l2_ro_mpt = map_l2t_from_l3e(l3e_ro_mpt);
 
     for ( i = smap; i < emap; )
     {
@@ -255,6 +257,8 @@ static void destroy_compat_m2p_mapping(struct mem_hotadd_info *info)
         i += 1UL << (L2_PAGETABLE_SHIFT - 2);
     }
 
+    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
+
     return;
 }
 
-- 
2.24.1.AMZN



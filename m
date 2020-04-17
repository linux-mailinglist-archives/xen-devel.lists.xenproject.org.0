Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2341ADA72
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfj-0000Nv-ID; Fri, 17 Apr 2020 09:52:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfi-0000NQ-0x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:30 +0000
X-Inumbo-ID: 21d23984-8091-11ea-8c9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21d23984-8091-11ea-8c9b-12813bfff9fa;
 Fri, 17 Apr 2020 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEeVOsGMSDjBCM+osSPHmTi/618O72vOFb/JLOuqfjw=; b=FPk6Z1cKcufcm78XCUmuoAsxxg
 NB3bUWLYiTVSS/9IGOxLLksT8xkRnHri/hH9X25+ldy7DqY3dAxpaUOvJy/7srSgxcNkRUC8X6CIT
 qf0PaoDxzvVgRwDGesPf3H/FRcBDOLUa/0Pm4j8vLlNFK0NeMdi+zzvlyjh2PVzilojw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfY-0002fk-Lb; Fri, 17 Apr 2020 09:52:20 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfY-000304-B3; Fri, 17 Apr 2020 09:52:20 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/6] x86_64/mm: map and unmap page tables in
 subarch_init_memory
Date: Fri, 17 Apr 2020 10:52:04 +0100
Message-Id: <0e14533f516ee5ce410e2cd8050f085aec4b4961.1587116799.git.hongyxia@amazon.com>
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
 xen/arch/x86/x86_64/mm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 18210405f4..5714e5ba62 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -852,14 +852,14 @@ void __init subarch_init_memory(void)
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
             m2p_start_mfn = l2e_get_pfn(l2e);
@@ -878,11 +878,11 @@ void __init subarch_init_memory(void)
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
         m2p_start_mfn = l2e_get_pfn(l2e);
-- 
2.24.1.AMZN



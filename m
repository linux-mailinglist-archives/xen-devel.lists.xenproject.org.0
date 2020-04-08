Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70A1A2325
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtI-0007Z5-59; Wed, 08 Apr 2020 13:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAtG-0007Yh-RP
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:14 +0000
X-Inumbo-ID: 0ad08a5b-799e-11ea-81eb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ad08a5b-799e-11ea-81eb-12813bfff9fa;
 Wed, 08 Apr 2020 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+zFaUj7bu8w84ctYQkaYIoA6o69FZPkcrEvCQXkz0lM=; b=Y+JTz/pMmTycAmcsfr7cfN7XPO
 +rXB2rfXPGUQKdoHhd/+GNTecVhz1eVrBj+iS7YcVGRRUnyXDh7IknmC3nhqgSp9bHm1W8qimR9JT
 5uI+TZOACxCUs3cRG0JMxxln5Yl99LbITO2oEPri/MYfjag7nC6NZHHy0j3u/XYetsg0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtB-00057k-Ba; Wed, 08 Apr 2020 13:37:09 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAtB-0005ee-1u; Wed, 08 Apr 2020 13:37:09 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/5] x86_64/mm: map and unmap page tables in m2p_mapped
Date: Wed,  8 Apr 2020 14:36:52 +0100
Message-Id: <e8a945defb5a4209d1f10b5f98b16a854a911c5c.1586352238.git.hongyxia@amazon.com>
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
- avoid adding goto labels, simply get the PTE and unmap quickly.
- code style fixes.
---
 xen/arch/x86/x86_64/mm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index cee836ec37..8e0caa7327 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -129,14 +129,14 @@ static mfn_t alloc_hotadd_mfn(struct mem_hotadd_info *info)
 static int m2p_mapped(unsigned long spfn)
 {
     unsigned long va;
-    l3_pgentry_t *l3_ro_mpt;
-    l2_pgentry_t *l2_ro_mpt;
+    l3_pgentry_t l3e_ro_mpt;
+    l2_pgentry_t l2e_ro_mpt;
 
     va = RO_MPT_VIRT_START + spfn * sizeof(*machine_to_phys_mapping);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
+    l3e_ro_mpt = l3e_from_l4e(idle_pg_table[l4_table_offset(va)],
+                              l3_table_offset(va));
 
-    switch ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
-             (_PAGE_PRESENT |_PAGE_PSE))
+    switch ( l3e_get_flags(l3e_ro_mpt) & (_PAGE_PRESENT | _PAGE_PSE) )
     {
         case _PAGE_PSE|_PAGE_PRESENT:
             return M2P_1G_MAPPED;
@@ -146,9 +146,9 @@ static int m2p_mapped(unsigned long spfn)
         default:
             return M2P_NO_MAPPED;
     }
-    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
+    l2e_ro_mpt = l2e_from_l3e(l3e_ro_mpt, l2_table_offset(va));
 
-    if (l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT)
+    if ( l2e_get_flags(l2e_ro_mpt) & _PAGE_PRESENT )
         return M2P_2M_MAPPED;
 
     return M2P_NO_MAPPED;
-- 
2.24.1.AMZN



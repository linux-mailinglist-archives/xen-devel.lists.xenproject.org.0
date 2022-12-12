Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C5649BDE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459400.717159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsT-0007Hg-7p; Mon, 12 Dec 2022 10:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459400.717159; Mon, 12 Dec 2022 10:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsS-000797-Ua; Mon, 12 Dec 2022 10:17:40 +0000
Received: by outflank-mailman (input) for mailman id 459400;
 Mon, 12 Dec 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsP-0006gL-UR
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CT-Iw; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX9-0001lz-Ag; Mon, 12 Dec 2022 09:55:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=PT5WPm2NE5wT0NyCnF+h0ITkG97YNTqNChrNhLvYYIs=; b=bZcBHJpO8cHTaWFe24T4aaKYmy
	4TQnxgfwq/Hxd6SBUWi5kLSj07sCXM4MSK+Hn6owK01DX4pV4r7QB8de07qJCGNNNoo4NlgMhtG02
	ncVAKBVSXO1+aKkRQmXCB7CucMjYMa6UBpdxHJNhLM58xg8pG90Puni34XmR5Ax3FLqQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 11/18] xen/arm: Enable use of dump_pt_walk() early during boot
Date: Mon, 12 Dec 2022 09:55:16 +0000
Message-Id: <20221212095523.52683-12-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, dump_pt_walk() is using map_domain_page() to map
the page tables.

map_domain_page() is only usuable after init_domheap_mappings() is called
(arm32) or the xenheap has been initialized (arm64).

This means it can be hard to diagnose incorrect page-tables during
early boot. So update dump_pt_walk() to xen_{, un}map_table() instead.

Note that the two helpers are moved earlier to avoid forward declaring
them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 56 +++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 1315a2c87db7..d0b1cf55f550 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -191,6 +191,30 @@ static void __init __maybe_unused build_assertions(void)
 #undef CHECK_DIFFERENT_SLOT
 }
 
+static lpae_t *xen_map_table(mfn_t mfn)
+{
+    /*
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        return pmap_map(mfn);
+
+    return map_domain_page(mfn);
+}
+
+static void xen_unmap_table(const lpae_t *table)
+{
+    /*
+     * During early boot, xen_map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
 void dump_pt_walk(paddr_t ttbr, paddr_t addr,
                   unsigned int root_level,
                   unsigned int nr_root_tables)
@@ -230,7 +254,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
     else
         root_table = 0;
 
-    mapping = map_domain_page(mfn_add(root_mfn, root_table));
+    mapping = xen_map_table(mfn_add(root_mfn, root_table));
 
     for ( level = root_level; ; level++ )
     {
@@ -246,11 +270,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
             break;
 
         /* For next iteration */
-        unmap_domain_page(mapping);
-        mapping = map_domain_page(lpae_get_mfn(pte));
+        xen_unmap_table(mapping);
+        mapping = xen_map_table(lpae_get_mfn(pte));
     }
 
-    unmap_domain_page(mapping);
+    xen_unmap_table(mapping);
 }
 
 void dump_hyp_walk(vaddr_t addr)
@@ -713,30 +737,6 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static lpae_t *xen_map_table(mfn_t mfn)
-{
-    /*
-     * During early boot, map_domain_page() may be unusable. Use the
-     * PMAP to map temporarily a page-table.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        return pmap_map(mfn);
-
-    return map_domain_page(mfn);
-}
-
-static void xen_unmap_table(const lpae_t *table)
-{
-    /*
-     * During early boot, xen_map_table() will not use map_domain_page()
-     * but the PMAP.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        pmap_unmap(table);
-    else
-        unmap_domain_page(table);
-}
-
 static int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
-- 
2.38.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0D608DD0
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428304.678367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG3C-00071f-5L; Sat, 22 Oct 2022 15:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428304.678367; Sat, 22 Oct 2022 15:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG3B-0006tk-SU; Sat, 22 Oct 2022 15:04:37 +0000
Received: by outflank-mailman (input) for mailman id 428304;
 Sat, 22 Oct 2022 15:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omG3A-0006nJ-HK
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG3A-0005Fw-4X; Sat, 22 Oct 2022 15:04:36 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG39-00023n-St; Sat, 22 Oct 2022 15:04:36 +0000
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
	bh=8XRbJOwi2jcZkrnNl+I4D+X7AdFfSZzKWbgWtXj+qTs=; b=UKYz+4aJuQvus7mvCVGx9PT7rC
	AJ399U6sxnXab7b2gduyVC240QlG+h6PGvBK3OFy9ftrECkIS4dNxoBDKMQSRyS5UCgOobqiHaISe
	lP22AtQCYiz7v5vFXHlIvwvGdj69OFoz3G2LIeBxy3xzy7KUa9S6hEk8rwXvUM0Ems50=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC v2 06/12] xen/arm: Enable use of dump_pt_walk() early during boot
Date: Sat, 22 Oct 2022 16:04:16 +0100
Message-Id: <20221022150422.17707-7-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221022150422.17707-1-julien@xen.org>
References: <20221022150422.17707-1-julien@xen.org>
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
index 726211c77917..306507d7bced 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -200,6 +200,30 @@ static void __init __maybe_unused build_assertions(void)
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
@@ -239,7 +263,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
     else
         root_table = 0;
 
-    mapping = map_domain_page(mfn_add(root_mfn, root_table));
+    mapping = xen_map_table(mfn_add(root_mfn, root_table));
 
     for ( level = root_level; ; level++ )
     {
@@ -255,11 +279,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
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
@@ -722,30 +746,6 @@ void *ioremap(paddr_t pa, size_t len)
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
2.37.1



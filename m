Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5694BD938
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276095.472186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HV-0007Du-J6; Mon, 21 Feb 2022 10:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276095.472186; Mon, 21 Feb 2022 10:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HV-00073Q-3f; Mon, 21 Feb 2022 10:51:01 +0000
Received: by outflank-mailman (input) for mailman id 276095;
 Mon, 21 Feb 2022 10:50:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HS-0006QN-CA
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lY-C0; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5px-00070b-P2; Mon, 21 Feb 2022 10:22:33 +0000
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
	bh=hWjfevoUxZaDKcehRUZH+C4jM8zdEI8w51IWDQgtbOY=; b=RuUM164HznDXh6/dLShCUL7Lum
	EgpxRX1vKp5TmYi/aA/2lysuQY0Qdha+xIARUS7HqNl8nQjr9/2Nf1+AV/5IB7+NQMaTd0ueMU/Sj
	NV1g+ENGfjBa69WssNjj2ehEeY9/yty7yDBH+2WREYgwIIcfvU7MxEf4gKZMBEiLDmGo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 11/19] xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
Date: Mon, 21 Feb 2022 10:22:10 +0000
Message-Id: <20220221102218.33785-12-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

xen_{un,}map_table() already uses the helper to map/unmap pages
on-demand (note this is currently a NOP on arm64). So switching to
domheap don't have any disavantage.

But this as the benefit:
    - to keep the page tables unmapped if an arch decided to do so
    - reduce xenheap use on arm32 which can be pretty small

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v3:
        - Add Stefano's acked-by

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 1e5c2c45dcf9..58364bb6c820 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -972,21 +972,6 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static int create_xen_table(lpae_t *entry)
-{
-    void *p;
-    lpae_t pte;
-
-    p = alloc_xenheap_page();
-    if ( p == NULL )
-        return -ENOMEM;
-    clear_page(p);
-    pte = mfn_to_xen_entry(virt_to_mfn(p), MT_NORMAL);
-    pte.pt.table = 1;
-    write_pte(entry, pte);
-    return 0;
-}
-
 static lpae_t *xen_map_table(mfn_t mfn)
 {
     /*
@@ -1027,6 +1012,27 @@ static void xen_unmap_table(const lpae_t *table)
     unmap_domain_page(table);
 }
 
+static int create_xen_table(lpae_t *entry)
+{
+    struct page_info *pg;
+    void *p;
+    lpae_t pte;
+
+    pg = alloc_domheap_page(NULL, 0);
+    if ( pg == NULL )
+        return -ENOMEM;
+
+    p = xen_map_table(page_to_mfn(pg));
+    clear_page(p);
+    xen_unmap_table(p);
+
+    pte = mfn_to_xen_entry(page_to_mfn(pg), MT_NORMAL);
+    pte.pt.table = 1;
+    write_pte(entry, pte);
+
+    return 0;
+}
+
 #define XEN_TABLE_MAP_FAILED 0
 #define XEN_TABLE_SUPER_PAGE 1
 #define XEN_TABLE_NORMAL_PAGE 2
-- 
2.32.0



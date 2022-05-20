Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BC52EB9F
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333904.557886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sj-0006wP-LK; Fri, 20 May 2022 12:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333904.557886; Fri, 20 May 2022 12:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sj-0006sQ-8x; Fri, 20 May 2022 12:10:33 +0000
Received: by outflank-mailman (input) for mailman id 333904;
 Fri, 20 May 2022 12:10:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Sh-0006dX-SG
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:10:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sh-0005pF-L3; Fri, 20 May 2022 12:10:31 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sh-0001lI-DD; Fri, 20 May 2022 12:10:31 +0000
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
	bh=P+NWrrFhs3KxS6dDexgzIQNemrzeLTVuO4hodlzBMxc=; b=zpjOljw9eKfhAEkzKFoZ951lxC
	Lsinhm3LjaJqyo4Goz9AVjTRs64vMfo4jrGxslDEQIJxWNutHUQyzjHDO3hV09Ngp0NhBITbRafrt
	TiyAFlXDMbz93Yx3biv7GJXzfYXus1p+7GYdgi31lWg5fZilsgWfirwNXOk3sWsJ6fzY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 07/16] xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
Date: Fri, 20 May 2022 13:09:28 +0100
Message-Id: <20220520120937.28925-8-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
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
index 47c2111c36a4..252114d67df5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -988,21 +988,6 @@ void *ioremap(paddr_t pa, size_t len)
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
@@ -1043,6 +1028,27 @@ static void xen_unmap_table(const lpae_t *table)
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



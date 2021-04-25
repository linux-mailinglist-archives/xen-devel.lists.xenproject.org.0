Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FA36A932
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117357.223231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQN-0004Rw-Sq; Sun, 25 Apr 2021 20:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117357.223231; Sun, 25 Apr 2021 20:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQN-0004RX-Pi; Sun, 25 Apr 2021 20:32:15 +0000
Received: by outflank-mailman (input) for mailman id 117357;
 Sun, 25 Apr 2021 20:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalQL-0004R3-KB
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalQL-00019r-2B; Sun, 25 Apr 2021 20:32:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8L-0005m7-GV; Sun, 25 Apr 2021 20:13:37 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=MTKf2MkfWHAQW1rNB3O16F5z9jItgd6Wm5yHl60rcz0=; b=G4cjzDdnao/cYiBL47XbuXs7H
	jcxnQhIHE7VNkYj+iwSl9M8ppJlJlms/56Y8BuWXUNIKuS4swrS8gfymRWyh7URLqVBIPPRmOKRrq
	3kvfWWmum3NoGMd6aslV38Tmoj7VYoOOAnEaAlzcTsOPbL/KQJSqIVINt6GZUrLEgE7qE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 10/15] xen/arm: mm: Allocate xen page tables in domheap rather than xenheap
Date: Sun, 25 Apr 2021 21:13:13 +0100
Message-Id: <20210425201318.15447-11-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

xen_{un,}map_table() already uses the helper to map/unmap pages
on-demand (note this is currently a NOP on arm64). So switching to
domheap don't have any disavantage.

But this as the benefit:
    - to keep the page tables unmapped if an arch decided to do so
    - reduce xenheap use on arm32 which can be pretty small

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 19ecf73542ce..ae5a07ea956b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -969,21 +969,6 @@ void *ioremap(paddr_t pa, size_t len)
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
@@ -1024,6 +1009,27 @@ static void xen_unmap_table(const lpae_t *table)
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
2.17.1



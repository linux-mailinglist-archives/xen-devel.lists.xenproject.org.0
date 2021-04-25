Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B4C36A933
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117359.223253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQO-0004TL-NQ; Sun, 25 Apr 2021 20:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117359.223253; Sun, 25 Apr 2021 20:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQO-0004ST-Bi; Sun, 25 Apr 2021 20:32:16 +0000
Received: by outflank-mailman (input) for mailman id 117359;
 Sun, 25 Apr 2021 20:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalQL-0004RD-NI
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalQL-00019v-8G; Sun, 25 Apr 2021 20:32:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8N-0005m7-4G; Sun, 25 Apr 2021 20:13:39 +0000
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
	 bh=kyXJNvfLj/1Qpk3hX2ctxX4bb1KB1kLqdFkNoEVhegI=; b=DMPjMKHaz0psSHPwnrQmyg1DL
	5KZAnETEyRoMzMfgNqCyiOVcqcKu1W0hkOR3+LKUZ+oLcbcewEYQEtAqwwO50IMuRjtPur0d88H8y
	NL+elfsaML0BFMmROqtyeTC1Lp8vamrPgfUlhv+xqULeHNNcCEWErnA/oq7g15AaS6YZM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH RFCv2 11/15] xen/arm: mm: Allow page-table allocation from the boot allocator
Date: Sun, 25 Apr 2021 21:13:14 +0100
Message-Id: <20210425201318.15447-12-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment, page-table can only be allocated from domheap. This means
it is not possible to create mapping in the page-tables via
map_pages_to_xen() if page-table needs to be allocated.

In order to avoid open-coding page-tables update in early boot, we need
to be able to allocate page-tables much earlier. Thankfully, we have the
boot allocator for those cases.

create_xen_table() is updated to cater early boot allocation by using
alloc_boot_pages().

Note, this is not sufficient to bootstrap the page-tables (i.e mapping
before any memory is actually mapped). This will be addressed
separately.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index ae5a07ea956b..d090fdfd5994 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1011,19 +1011,27 @@ static void xen_unmap_table(const lpae_t *table)
 
 static int create_xen_table(lpae_t *entry)
 {
-    struct page_info *pg;
+    mfn_t mfn;
     void *p;
     lpae_t pte;
 
-    pg = alloc_domheap_page(NULL, 0);
-    if ( pg == NULL )
-        return -ENOMEM;
+    if ( system_state != SYS_STATE_early_boot )
+    {
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        if ( pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
 
-    p = xen_map_table(page_to_mfn(pg));
+    p = xen_map_table(mfn);
     clear_page(p);
     xen_unmap_table(p);
 
-    pte = mfn_to_xen_entry(page_to_mfn(pg), MT_NORMAL);
+    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
     pte.pt.table = 1;
     write_pte(entry, pte);
 
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A464BD934
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276091.472152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HT-0006VL-8M; Mon, 21 Feb 2022 10:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276091.472152; Mon, 21 Feb 2022 10:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HS-0006RM-S8; Mon, 21 Feb 2022 10:50:58 +0000
Received: by outflank-mailman (input) for mailman id 276091;
 Mon, 21 Feb 2022 10:50:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HR-0006Po-Hh
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lU-8Y; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5py-00070b-R6; Mon, 21 Feb 2022 10:22:35 +0000
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
	bh=f03/3Vf/UCt5JQLkCjdrbloKJVprsUR48KaiuBmSgTo=; b=hiMhKzUPL64NsMAqmJd0Lk1PkD
	DJSjYDBI5vU5yLcg4P1nWPCTuyPHBADK9kZ/irp1z9TFfuVQgpyvmiU9PsIxJkOpo9UcAkQPeWN90
	rr7vUIZAReVu/w4TKR92qz3FYyhvV8vcFgR1Q+m6BeyNaEEiM8b53E2fx65jka4DY1dQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 12/19] xen/arm: mm: Allow page-table allocation from the boot allocator
Date: Mon, 21 Feb 2022 10:22:11 +0000
Message-Id: <20220221102218.33785-13-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 58364bb6c820..f70b8cc7ce87 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1014,19 +1014,27 @@ static void xen_unmap_table(const lpae_t *table)
 
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
2.32.0



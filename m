Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992252EB9B
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333905.557900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sl-0007Om-4D; Fri, 20 May 2022 12:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333905.557900; Fri, 20 May 2022 12:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sk-0007Hy-Rq; Fri, 20 May 2022 12:10:34 +0000
Received: by outflank-mailman (input) for mailman id 333905;
 Fri, 20 May 2022 12:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Si-0006rd-Vd
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:10:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Si-0005pW-PB; Fri, 20 May 2022 12:10:32 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Si-0001lI-HX; Fri, 20 May 2022 12:10:32 +0000
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
	bh=gimEip3VkLJRKnHAXm3TnqTrnKrLjfGvOIOXBXVQdRQ=; b=0Z94Mp5HwfpHEQTToAgWAdkw0B
	dl3gC1Pt7J4lRQn0guwGshH858PED22AWw97r9tRaPTJfwE71z0V3E2AIYSKwZx8dEhCkSBbwlEeW
	JVZ1usC0K8n8o8kgTOd0QR51IWhSsa3Ut81N1erIFaf7IVvvfSoydJkiKrfnkp8yy6IU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 08/16] xen/arm: mm: Allow page-table allocation from the boot allocator
Date: Fri, 20 May 2022 13:09:29 +0100
Message-Id: <20220520120937.28925-9-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
    Changes in v4:
        - Add Stefano's reviewed-by

    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 252114d67df5..6b7b72de27fe 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1030,19 +1030,27 @@ static void xen_unmap_table(const lpae_t *table)
 
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



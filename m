Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7F64EB43
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464570.723047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eo-0008QO-T5; Fri, 16 Dec 2022 12:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464570.723047; Fri, 16 Dec 2022 12:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69eo-0008Ha-Is; Fri, 16 Dec 2022 12:17:42 +0000
Received: by outflank-mailman (input) for mailman id 464570;
 Fri, 16 Dec 2022 12:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007Ld-W0
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00034R-RI; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DN-0004sN-W7; Fri, 16 Dec 2022 11:49:22 +0000
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
	bh=NkfwiZGHGUT9aDZPQ52XaRpLx0pc2E+yXE3Z0GACfGA=; b=tL1r1SSswrEWuqPOR8MX6COqIE
	aQZQIFzsUy4F/Gqk6/uu6XGHjPee0wjsy6yrgb+G+9EPS5xeXh9aZlTksVJX7NXw5KDlr8C3lq5jW
	spLEzj5WxpO3H+RBDjdqcWGJQImjavd0tGHBgzfadMFnTThQ644wQUFsXx2ZZF5Q1MwE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 19/22] xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
Date: Fri, 16 Dec 2022 11:48:50 +0000
Message-Id: <20221216114853.8227-20-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The arm32 version of init_secondary_pagetables() will soon be re-used
for arm64 as well where the root table start at level 0 rather than level 1.

So rename 'first' to 'root'.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992dd1..4e208f7d20c8 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -571,32 +571,30 @@ int init_secondary_pagetables(int cpu)
 #else
 int init_secondary_pagetables(int cpu)
 {
-    lpae_t *first;
+    lpae_t *root = alloc_xenheap_page();
 
-    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
-
-    if ( !first )
+    if ( !root )
     {
-        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
+        printk("CPU%u: Unable to allocate the root page-table\n", cpu);
         return -ENOMEM;
     }
 
     /* Initialise root pagetable from root of boot tables */
-    memcpy(first, cpu0_pgtable, PAGE_SIZE);
-    per_cpu(xen_pgtable, cpu) = first;
+    memcpy(root, cpu0_pgtable, PAGE_SIZE);
+    per_cpu(xen_pgtable, cpu) = root;
 
     if ( !init_domheap_mappings(cpu) )
     {
         printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
         per_cpu(xen_pgtable, cpu) = NULL;
-        free_xenheap_page(first);
+        free_xenheap_page(root);
         return -ENOMEM;
     }
 
     clear_boot_pagetables();
 
     /* Set init_ttbr for this CPU coming up */
-    init_ttbr = __pa(first);
+    init_ttbr = __pa(root);
     clean_dcache(init_ttbr);
 
     return 0;
-- 
2.38.1



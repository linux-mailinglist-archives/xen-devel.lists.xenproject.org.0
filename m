Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B24BD930
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276092.472159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HT-0006dM-I0; Mon, 21 Feb 2022 10:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276092.472159; Mon, 21 Feb 2022 10:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HT-0006VG-A8; Mon, 21 Feb 2022 10:50:59 +0000
Received: by outflank-mailman (input) for mailman id 276092;
 Mon, 21 Feb 2022 10:50:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HR-0006Pp-JL
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lW-AS; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5q3-00070b-Ox; Mon, 21 Feb 2022 10:22:39 +0000
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
	bh=WOeJ/LVD52L5YzIcVNL+IXQBycQP2W2GDSj+IqdQKo0=; b=x+HtDP7Wbuvk3vQTsEi+QK12Li
	yB+qv9oUO2OZ/C4B90il6KJSWmgKDLSYR6JqRakY7/h4RIZebuwkJiU+P9LtaJdF0feLie1xCPF5D
	/eoMlp7ZPl9eqyXZBaRfbtlGAruV/du5M6f2hjQyoe3xZ8hFu4/fk8yVutc4na/H1AzI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 16/19] xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
Date: Mon, 21 Feb 2022 10:22:15 +0000
Message-Id: <20220221102218.33785-17-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

During early boot, it is not possible to use xen_{,un}map_table()
if the page tables are not residing the Xen binary.

This is a blocker to switch some of the helpers to use xen_pt_update()
as we may need to allocate extra page tables and access them before
the domheap has been initialized (see setup_xenheap_mappings()).

xen_{,un}map_table() are now updated to use the PMAP helpers for early
boot map/unmap. Note that the special case for page-tables residing
in Xen binary has been dropped because it is "complex" and was
only added as a workaround in 8d4f1b8878e0 ("xen/arm: mm: Allow
generic xen page-tables helpers to be called early").

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 659bdf25e0ff..11b6b60a2bc1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -25,6 +25,7 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
+#include <xen/pmap.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
@@ -964,27 +965,11 @@ void *ioremap(paddr_t pa, size_t len)
 static lpae_t *xen_map_table(mfn_t mfn)
 {
     /*
-     * We may require to map the page table before map_domain_page() is
-     * useable. The requirements here is it must be useable as soon as
-     * page-tables are allocated dynamically via alloc_boot_pages().
-     *
-     * We need to do the check on physical address rather than virtual
-     * address to avoid truncation on Arm32. Therefore is_kernel() cannot
-     * be used.
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
      */
     if ( system_state == SYS_STATE_early_boot )
-    {
-        if ( is_xen_fixed_mfn(mfn) )
-        {
-            /*
-             * It is fine to demote the type because the size of Xen
-             * will always fit in vaddr_t.
-             */
-            vaddr_t offset = mfn_to_maddr(mfn) - virt_to_maddr(&_start);
-
-            return (lpae_t *)(XEN_VIRT_START + offset);
-        }
-    }
+        return pmap_map(mfn);
 
     return map_domain_page(mfn);
 }
@@ -993,12 +978,12 @@ static void xen_unmap_table(const lpae_t *table)
 {
     /*
      * During early boot, xen_map_table() will not use map_domain_page()
-     * for page-tables residing in Xen binary. So skip the unmap part.
+     * but the PMAP.
      */
-    if ( system_state == SYS_STATE_early_boot && is_kernel(table) )
-        return;
-
-    unmap_domain_page(table);
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
 }
 
 static int create_xen_table(lpae_t *entry)
-- 
2.32.0



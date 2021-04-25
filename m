Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E233236A937
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117360.223261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQP-0004U6-6K; Sun, 25 Apr 2021 20:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117360.223261; Sun, 25 Apr 2021 20:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQO-0004TE-Mc; Sun, 25 Apr 2021 20:32:16 +0000
Received: by outflank-mailman (input) for mailman id 117360;
 Sun, 25 Apr 2021 20:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalQL-0004RI-Nv
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalQL-00019z-Ce; Sun, 25 Apr 2021 20:32:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8Q-0005m7-UI; Sun, 25 Apr 2021 20:13:43 +0000
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
	 bh=ifKF5vlWlY6l4PDeK/yzMglzvzJIHrIdX0+DxnqU6gM=; b=aDVnd/t+JJAmjS00rJXk2q4jN
	NB5fjWXRYRB+MKeBuWXa+51DmJcKGs1okA0zWazHweIwAGmQuQ690dWiAfxlOETAZcE/HXrdIpYiR
	9ITanj2BNk+LUga8ozVtM/xy09nsQjKU+H7TSQvg2ECM433eSsnRQ4dJR1QbD5ssqU8Gw=;
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
Subject: [PATCH RFCv2 13/15] xen/arm: mm: Use the PMAP helpers in xen_{,un}map_table()
Date: Sun, 25 Apr 2021 21:13:16 +0100
Message-Id: <20210425201318.15447-14-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

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
index 5e713b599611..f5768f2d4a81 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -41,6 +41,7 @@
 #include <xen/sizes.h>
 #include <xen/libfdt/libfdt.h>
 
+#include <asm/pmap.h>
 #include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -967,27 +968,11 @@ void *ioremap(paddr_t pa, size_t len)
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
@@ -996,12 +981,12 @@ static void xen_unmap_table(const lpae_t *table)
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
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170C17E39D6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628728.980512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JPA-0005An-7w; Tue, 07 Nov 2023 10:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628728.980512; Tue, 07 Nov 2023 10:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JPA-00056K-3U; Tue, 07 Nov 2023 10:33:56 +0000
Received: by outflank-mailman (input) for mailman id 628728;
 Tue, 07 Nov 2023 10:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JP8-0004jI-Uu
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:33:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2597cef2-7d59-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 11:33:53 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 626564EE0C8A;
 Tue,  7 Nov 2023 11:33:52 +0100 (CET)
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
X-Inumbo-ID: 2597cef2-7d59-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 3/4] xen/arm: GICv3: address MISRA C:2012 Rule 15.2
Date: Tue,  7 Nov 2023 11:33:44 +0100
Message-Id: <135227bde7bc41f44e9c3ae264dae8efc71ef8f0.1699295113.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backwards jump due to the "goto retry;" statement
can be transformed into a loop, without losing much in terms
of readability.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This specific patch was provided by Stefano, I just added the
commit message.
---
 xen/arch/arm/gic-v3-its.c | 81 ++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 8afcd9783bc8..4ba3f869ddf2 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -341,6 +341,7 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
     unsigned int pagesz = 2;    /* try 64K pages first, then go down. */
     unsigned int table_size;
     void *buffer;
+    bool retry = false;
 
     attr  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
     attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
@@ -351,55 +352,57 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
      * it back and see what sticks (page size, cacheability and shareability
      * attributes), retrying if necessary.
      */
-retry:
-    table_size = ROUNDUP(nr_items * entry_size,
-                         BIT(BASER_PAGE_BITS(pagesz), UL));
-    /* The BASE registers support at most 256 pages. */
-    table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
+    while ( retry )
+    {
+        table_size = ROUNDUP(nr_items * entry_size,
+                BIT(BASER_PAGE_BITS(pagesz), UL));
+        /* The BASE registers support at most 256 pages. */
+        table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
 
-    buffer = _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
-    if ( !buffer )
-        return -ENOMEM;
+        buffer = _xzalloc(table_size, BIT(BASER_PAGE_BITS(pagesz), UL));
+        if ( !buffer )
+            return -ENOMEM;
 
-    if ( !check_baser_phys_addr(buffer, BASER_PAGE_BITS(pagesz)) )
-    {
-        xfree(buffer);
-        return -ERANGE;
-    }
+        if ( !check_baser_phys_addr(buffer, BASER_PAGE_BITS(pagesz)) )
+        {
+            xfree(buffer);
+            return -ERANGE;
+        }
 
-    reg  = attr;
-    reg |= (pagesz << GITS_BASER_PAGE_SIZE_SHIFT);
-    reg |= (table_size >> BASER_PAGE_BITS(pagesz)) - 1;
-    reg |= regc & BASER_RO_MASK;
-    reg |= GITS_VALID_BIT;
-    reg |= encode_baser_phys_addr(virt_to_maddr(buffer),
-                                  BASER_PAGE_BITS(pagesz));
+        reg  = attr;
+        reg |= (pagesz << GITS_BASER_PAGE_SIZE_SHIFT);
+        reg |= (table_size >> BASER_PAGE_BITS(pagesz)) - 1;
+        reg |= regc & BASER_RO_MASK;
+        reg |= GITS_VALID_BIT;
+        reg |= encode_baser_phys_addr(virt_to_maddr(buffer),
+                BASER_PAGE_BITS(pagesz));
 
-    writeq_relaxed(reg, basereg);
-    regc = readq_relaxed(basereg);
+        writeq_relaxed(reg, basereg);
+        regc = readq_relaxed(basereg);
 
-    /* The host didn't like our attributes, just use what it returned. */
-    if ( (regc & BASER_ATTR_MASK) != attr )
-    {
-        /* If we can't map it shareable, drop cacheability as well. */
-        if ( (regc & GITS_BASER_SHAREABILITY_MASK) == GIC_BASER_NonShareable )
+        /* The host didn't like our attributes, just use what it returned. */
+        if ( (regc & BASER_ATTR_MASK) != attr )
         {
-            regc &= ~GITS_BASER_INNER_CACHEABILITY_MASK;
-            writeq_relaxed(regc, basereg);
+            /* If we can't map it shareable, drop cacheability as well. */
+            if ( (regc & GITS_BASER_SHAREABILITY_MASK) == GIC_BASER_NonShareable )
+            {
+                regc &= ~GITS_BASER_INNER_CACHEABILITY_MASK;
+                writeq_relaxed(regc, basereg);
+            }
+            attr = regc & BASER_ATTR_MASK;
         }
-        attr = regc & BASER_ATTR_MASK;
-    }
-    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
-        clean_and_invalidate_dcache_va_range(buffer, table_size);
+        if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+            clean_and_invalidate_dcache_va_range(buffer, table_size);
 
-    /* If the host accepted our page size, we are done. */
-    if ( ((regc >> GITS_BASER_PAGE_SIZE_SHIFT) & 0x3UL) == pagesz )
-        return 0;
+        /* If the host accepted our page size, we are done. */
+        if ( ((regc >> GITS_BASER_PAGE_SIZE_SHIFT) & 0x3UL) == pagesz )
+            return 0;
 
-    xfree(buffer);
+        xfree(buffer);
 
-    if ( pagesz-- > 0 )
-        goto retry;
+        if ( pagesz-- > 0 )
+            retry = true;
+    }
 
     /* None of the page sizes was accepted, give up */
     return -EINVAL;
-- 
2.34.1



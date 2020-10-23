Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16084297295
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11095.29452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCu-0002Bu-Sb; Fri, 23 Oct 2020 15:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11095.29452; Fri, 23 Oct 2020 15:42:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCu-0002B0-OB; Fri, 23 Oct 2020 15:42:20 +0000
Received: by outflank-mailman (input) for mailman id 11095;
 Fri, 23 Oct 2020 15:42:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCt-0001sI-10
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cead6ae4-bffe-432e-bbd1-a6f115e21901;
 Fri, 23 Oct 2020 15:42:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCf-0006qX-Qv; Fri, 23 Oct 2020 15:42:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCf-0007wb-Gq; Fri, 23 Oct 2020 15:42:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCt-0001sI-10
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:19 +0000
X-Inumbo-ID: cead6ae4-bffe-432e-bbd1-a6f115e21901
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cead6ae4-bffe-432e-bbd1-a6f115e21901;
	Fri, 23 Oct 2020 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=HcZbTU8t/M6Ruiq9fikm3iT8lCruTeZsHeQARUWgYFE=; b=P3FpaibtAFbVLFIK8KEi1gfn0
	RcJXK5ewmuL4+2tSJdS5DM8VCfs+VJw6wpYnxV81k1ZDcundBuos/SFQiEThSIljnvdY2me8xoo8j
	YY7YZqqQGYWkAWdKpubEnvW/lq9g3PxizhH8Gu+vu9owG5F2nrgGh6FKjsI0Y1eWk67lA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCf-0006qX-Qv; Fri, 23 Oct 2020 15:42:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCf-0007wb-Gq; Fri, 23 Oct 2020 15:42:05 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be cleared during failure/unmap
Date: Fri, 23 Oct 2020 16:41:51 +0100
Message-Id: <20201023154156.6593-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Commit 022387ee1ad3 "xen/arm: mm: Don't open-code Xen PT update in
{set, clear}_fixmap()" enforced that each set_fixmap() should be
paired with a clear_fixmap(). Any failure to follow the model would
result to a platform crash.

Unfortunately, the use of fixmap in the ACPI code was overlooked as it
is calling set_fixmap() but not clear_fixmap().

The function __acpi_os_map_table() is reworked so:
    - We know before the mapping whether the fixmap region is big
    enough for the mapping.
    - It will fail if the fixmap is already in use. This is not a
    change of behavior but clarifying the current expectation to avoid
    hitting a BUG().

The function __acpi_os_unmap_table() will now call clear_fixmap().

Reported-by: Wei Xu <xuwei5@hisilicon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

The discussion on the original thread [1] suggested to also zap it on
x86. This is technically not necessary today, so it is left alone for
now.

I looked at making the fixmap code common but the index are inverted
between Arm and x86.

    Changes in v2:
        - Clarify the commit message
        - Fix the size computation in __acpi_unmap_table()

[1] https://lore.kernel.org/xen-devel/5E26C935.9080107@hisilicon.com/
---
 xen/arch/arm/acpi/lib.c | 73 +++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index fcc186b03399..b755620e67b5 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -25,40 +25,79 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 
+static bool fixmap_inuse;
+
 char *__acpi_map_table(paddr_t phys, unsigned long size)
 {
-    unsigned long base, offset, mapped_size;
-    int idx;
+    unsigned long base, offset;
+    mfn_t mfn;
+    unsigned int idx;
 
     /* No arch specific implementation after early boot */
     if ( system_state >= SYS_STATE_boot )
         return NULL;
 
     offset = phys & (PAGE_SIZE - 1);
-    mapped_size = PAGE_SIZE - offset;
-    set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
-    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
+    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) + offset;
+
+    /* Check the fixmap is big enough to map the region */
+    if ( (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - base) < size )
+        return NULL;
+
+    /* With the fixmap, we can only map one region at the time */
+    if ( fixmap_inuse )
+        return NULL;
 
-    /* Most cases can be covered by the below. */
+    fixmap_inuse = true;
+
+    size += offset;
+    mfn = maddr_to_mfn(phys);
     idx = FIXMAP_ACPI_BEGIN;
-    while ( mapped_size < size )
-    {
-        if ( ++idx > FIXMAP_ACPI_END )
-            return NULL;    /* cannot handle this */
-        phys += PAGE_SIZE;
-        set_fixmap(idx, maddr_to_mfn(phys), PAGE_HYPERVISOR);
-        mapped_size += PAGE_SIZE;
-    }
 
-    return ((char *) base + offset);
+    do {
+        set_fixmap(idx, mfn, PAGE_HYPERVISOR);
+        size -= min(size, (unsigned long)PAGE_SIZE);
+        mfn = mfn_add(mfn, 1);
+        idx++;
+    } while ( size > 0 );
+
+    return (char *)base;
 }
 
 bool __acpi_unmap_table(const void *ptr, unsigned long size)
 {
     vaddr_t vaddr = (vaddr_t)ptr;
+    unsigned int idx;
+
+    /* We are only handling fixmap address in the arch code */
+    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
+         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )
+        return false;
+
+    /*
+     * __acpi_map_table() will always return a pointer in the first page
+     * for the ACPI fixmap region. The caller is expected to free with
+     * the same address.
+     */
+    ASSERT((vaddr & PAGE_MASK) == FIXMAP_ADDR(FIXMAP_ACPI_BEGIN));
+
+    /* The region allocated fit in the ACPI fixmap region. */
+    ASSERT(size < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - vaddr));
+    ASSERT(fixmap_inuse);
+
+    fixmap_inuse = false;
+
+    size += vaddr - FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
+    idx = FIXMAP_ACPI_BEGIN;
+
+    do
+    {
+        clear_fixmap(idx);
+        size -= min(size, (unsigned long)PAGE_SIZE);
+        idx++;
+    } while ( size > 0 );
 
-    return ((vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) &&
-            (vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE)));
+    return true;
 }
 
 /* True to indicate PSCI 0.2+ is implemented */
-- 
2.17.1



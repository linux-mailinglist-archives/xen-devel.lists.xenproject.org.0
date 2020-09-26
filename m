Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0586D279C81
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 22:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMHEy-0003ky-FP; Sat, 26 Sep 2020 20:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMHEx-0003jG-1M
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 20:56:19 +0000
X-Inumbo-ID: ef8786d4-b800-44f6-b276-ef25a066fe34
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef8786d4-b800-44f6-b276-ef25a066fe34;
 Sat, 26 Sep 2020 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=NUzIF6jd0VTOPVLuT+sNzYSm2gJRa4g7nKnovFDCX/4=; b=LTV2p20sIv7akePa3vPAhyBsX
 6m1ks6BSd9/ovS4zKP1LFTtQEVcidvgjUs6GPfnq/4ugmsbWZEAR6JM5+bhyZwu3bDry6kMJtc5yt
 T9Zlm87OqBIeeZpqXwIUfTSzm1ZglFmh4YKYTsxrJ9yrt7J4Vi7UotexGCPPFRZkw8jgM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEj-0000CR-M8; Sat, 26 Sep 2020 20:56:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEj-0004I0-Cz; Sat, 26 Sep 2020 20:56:05 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 2/4] xen/arm: acpi: The fixmap area should always be cleared
 during failure/unmap
Date: Sat, 26 Sep 2020 21:55:40 +0100
Message-Id: <20200926205542.9261-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926205542.9261-1-julien@xen.org>
References: <20200926205542.9261-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
    - It will fail if the fixmap is always inuse.

The function __acpi_os_unmap_table() will now call clear_fixmap().

Reported-by: Wei Xu <xuwei5@hisilicon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

The discussion on the original thread [1] suggested to also zap it on
x86. This is technically not necessary today, so it is left alone for
now.

I looked at making the fixmap code common but the index are inverted
between Arm and x86.

[1] https://lore.kernel.org/xen-devel/5E26C935.9080107@hisilicon.com/
---
 xen/arch/arm/acpi/lib.c | 75 +++++++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
index 2192a5519171..eebaca695562 100644
--- a/xen/arch/arm/acpi/lib.c
+++ b/xen/arch/arm/acpi/lib.c
@@ -25,38 +25,79 @@
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
 
 bool __acpi_unmap_table(void *ptr, unsigned long size)
 {
-    return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
-             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
+    vaddr_t vaddr = (vaddr_t)ptr;
+    unsigned int idx;
+
+    /* We are only handling fixmap address in the arch code */
+    if ( vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) ||
+         vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) )
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
+    size += FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) - vaddr;
+    idx = FIXMAP_ACPI_BEGIN;
+
+    do
+    {
+        clear_fixmap(idx);
+        size -= min(size, (unsigned long)PAGE_SIZE);
+        idx++;
+    } while ( size > 0 );
+
+    return true;
 }
 
 /* True to indicate PSCI 0.2+ is implemented */
-- 
2.17.1



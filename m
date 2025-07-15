Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A2B05392
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043603.1413620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMT-0003z7-TB; Tue, 15 Jul 2025 07:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043603.1413620; Tue, 15 Jul 2025 07:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMT-0003uF-Mj; Tue, 15 Jul 2025 07:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1043603;
 Tue, 15 Jul 2025 07:46:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMS-0002PZ-3X
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:46:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bf7be15d-614f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:45:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAF9612FC;
 Tue, 15 Jul 2025 00:45:49 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73C4B3F66E;
 Tue, 15 Jul 2025 00:45:57 -0700 (PDT)
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
X-Inumbo-ID: bf7be15d-614f-11f0-a319-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU systems
Date: Tue, 15 Jul 2025 08:45:27 +0100
Message-ID: <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1752565274.git.hari.limaye@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement the function early_fdt_map(), which is responsible for mapping
the Device Tree Blob in the early stages of the boot process, for MPU
systems.

We make use of the map_pages_to_xen() and destroy_xen_mappings() APIs.
In particular the latter function is necessary in the case that the
initial mapping of the fdt_header is insufficient to cover the entire
DTB, as we must destroy and then remap the region due to the APIs no
providing support for extending the size of an existing region.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1:
- Add Ayan's R-b

Changes from v2:
- Rename mapped_fdt_paddr -> mapped_fdt_base
- Remove full stops
- Add sanity check for MAX_FDT_SIZE
- Improve comment regarding early return when DTB already mapped
---
 xen/arch/arm/mpu/setup.c | 83 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index b4da77003f..a8cea0d9af 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -1,17 +1,96 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
+#include <xen/pfn.h>
 #include <xen/types.h>
+#include <xen/sizes.h>
 #include <asm/setup.h>
 
+static paddr_t __initdata mapped_fdt_base = INVALID_PADDR;
+static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
+
 void __init setup_pagetables(void) {}
 
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    /* Map at least a page containing the DTB address, exclusive range */
+    paddr_t base = round_pgdown(fdt_paddr);
+    paddr_t limit = round_pgup(fdt_paddr + sizeof(struct fdt_header));
+    unsigned int flags = PAGE_HYPERVISOR_RO;
+    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
+    int rc;
+    uint32_t size;
+    unsigned long nr_mfns;
+
+    /*
+     * Check whether the physical FDT address is set and meets the minimum
+     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
+     * least 8 bytes so that we always access the magic and size fields
+     * of the FDT header after mapping the first chunk, double check if
+     * that is indeed the case.
+     */
+    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
+    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
+        return NULL;
+
+    /*
+     * DTB at this address has already been mapped.`start_xen` calls this twice,
+     * before and after `setup_page_tables`, which is a no-op on MPU.
+     */
+    if ( mapped_fdt_base == fdt_paddr )
+        return fdt_virt;
+
+    /*
+     * DTB starting at a different address has been mapped, so destroy this
+     * before continuing.
+     */
+    if ( mapped_fdt_base != INVALID_PADDR )
+    {
+        rc = destroy_xen_mappings(round_pgdown(mapped_fdt_base),
+                                  mapped_fdt_limit);
+        if ( rc )
+            panic("Unable to unmap existing device-tree\n");
+    }
+
+    nr_mfns = (limit - base) >> PAGE_SHIFT;
+
+    rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
+    if ( rc )
+        panic("Unable to map the device-tree\n");
+
+    mapped_fdt_base = fdt_paddr;
+    mapped_fdt_limit = limit;
+
+    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
+        return NULL;
+
+    size = fdt_totalsize(fdt_virt);
+    if ( size > MAX_FDT_SIZE )
+        return NULL;
+
+    limit = round_pgup(fdt_paddr + size);
+
+    /* If the mapped range is not enough, map the rest of the DTB. */
+    if ( limit > mapped_fdt_limit )
+    {
+        rc = destroy_xen_mappings(base, mapped_fdt_limit);
+        if ( rc )
+            panic("Unable to unmap the device-tree header\n");
+
+        nr_mfns = (limit - base) >> PAGE_SHIFT;
+
+        rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+
+        mapped_fdt_limit = limit;
+    }
+
+    return fdt_virt;
 }
 
 /*
-- 
2.34.1



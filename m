Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799929E183B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847714.1262820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPWE-0001yo-AK; Tue, 03 Dec 2024 09:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847714.1262820; Tue, 03 Dec 2024 09:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPWE-0001wB-5y; Tue, 03 Dec 2024 09:48:34 +0000
Received: by outflank-mailman (input) for mailman id 847714;
 Tue, 03 Dec 2024 09:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tIPWB-0000ZC-MD
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:48:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c027a98b-b15b-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:48:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7976A1DB5;
 Tue,  3 Dec 2024 01:48:57 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 503E83F58B;
 Tue,  3 Dec 2024 01:48:28 -0800 (PST)
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
X-Inumbo-ID: c027a98b-b15b-11ef-99a3-01e77a169b0f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 5/5] xen/arm: Move setup_frametable_mappings to arm/mmu
Date: Tue,  3 Dec 2024 09:48:10 +0000
Message-Id: <20241203094811.427076-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203094811.427076-1-luca.fancellu@arm.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the current setup_frametable_mappings implementation to
arm/mmu under a new file mm.c, this implementation depends on
virtual memory and won't be used as it is for MPU systems.

Take the occasion to fix code style issues related to the line
length.

Moved also frametable_virt_end since it is used only on MMU
systems.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes to v3:
 - changed SPDX to reflect original file
Changes to v2:
 - New patch
---
---
 xen/arch/arm/mm.c         | 40 -------------------------
 xen/arch/arm/mmu/Makefile |  1 +
 xen/arch/arm/mmu/mm.c     | 61 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/arm/mmu/mm.c

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index def939172cc5..a56e20ba2bdc 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -22,7 +22,6 @@
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
 unsigned long frametable_base_pdx __read_mostly;
-unsigned long frametable_virt_end __read_mostly;
 
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
@@ -43,45 +42,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
-/* Map a frame table to cover physical addresses ps through pe */
-void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
-{
-    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
-                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
-    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
-    mfn_t base_mfn;
-    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
-    int rc;
-
-    /*
-     * The size of paddr_t should be sufficient for the complete range of
-     * physical address.
-     */
-    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
-    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
-
-    if ( frametable_size > FRAMETABLE_SIZE )
-        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
-              ps, pe);
-
-    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
-    /* Round up to 2M or 32M boundary, as appropriate. */
-    frametable_size = ROUNDUP(frametable_size, mapping_size);
-    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
-
-    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
-                          frametable_size >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the frametable mappings.\n");
-
-    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
-    memset(&frame_table[nr_pdxs], -1,
-           frametable_size - (nr_pdxs * sizeof(struct page_info)));
-
-    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
-}
-
 int steal_page(
     struct domain *d, struct page_info *page, unsigned int memflags)
 {
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
index 2cb44b857dd2..1c89602947de 100644
--- a/xen/arch/arm/mmu/Makefile
+++ b/xen/arch/arm/mmu/Makefile
@@ -1,3 +1,4 @@
+obj-y += mm.o
 obj-y += p2m.o
 obj-y += pt.o
 obj-y += setup.o
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
new file mode 100644
index 000000000000..9c50479c6373
--- /dev/null
+++ b/xen/arch/arm/mmu/mm.c
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/macros.h>
+#include <xen/mm.h>
+#include <xen/mm-frame.h>
+#include <xen/pdx.h>
+#include <xen/string.h>
+
+unsigned long frametable_virt_end __read_mostly;
+
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+    mfn_t base_mfn;
+    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
+                                                                : MB(32);
+    int rc;
+
+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
+    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              ps, pe);
+
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
+    /* Round up to 2M or 32M boundary, as appropriate. */
+    frametable_size = ROUNDUP(frametable_size, mapping_size);
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
+
+    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          frametable_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the frametable mappings.\n");
+
+    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
+    memset(&frame_table[nr_pdxs], -1,
+           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+
+    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs *
+                                                   sizeof(struct page_info));
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1



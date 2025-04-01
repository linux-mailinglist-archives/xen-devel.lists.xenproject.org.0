Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48921A77715
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933687.1335619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSt-0004JX-2v; Tue, 01 Apr 2025 08:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933687.1335619; Tue, 01 Apr 2025 08:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSs-0004EL-Te; Tue, 01 Apr 2025 08:59:22 +0000
Received: by outflank-mailman (input) for mailman id 933687;
 Tue, 01 Apr 2025 08:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heJ8=WT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tzXSr-0003bM-UG
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:59:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 990b0e36-0ed7-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 10:59:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C12B3150C;
 Tue,  1 Apr 2025 01:59:22 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4582E3F694;
 Tue,  1 Apr 2025 01:59:18 -0700 (PDT)
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
X-Inumbo-ID: 990b0e36-0ed7-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 7/7] arm/mpu: Create the skeleton for MPU compilation
Date: Tue,  1 Apr 2025 09:58:58 +0100
Message-Id: <20250401085858.2228991-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401085858.2228991-1-luca.fancellu@arm.com>
References: <20250401085858.2228991-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces the skeleton for the MPU memory management
subsystem that allows the compilation on Arm64.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
The implementation of setup_virt_paging() is under arm64/mpu
because it will have a different implementation from arm32.
v4 changes:
 - Add Michal R-by
v3 changes:
 - rebase changes
v2 changes:
 - p2m_teardown{_allocation} stubs are now part of this patch
 - included missing headers
 - rename vmap-mpu.c to vmap.c
 - remove comment "Not used on MPU system" on implemented stubs
---
---
 xen/arch/arm/arm64/mpu/Makefile    |  2 +
 xen/arch/arm/arm64/mpu/p2m.c       | 19 +++++++
 xen/arch/arm/arm64/mpu/smpboot.c   | 26 +++++++++
 xen/arch/arm/include/asm/mpu/p2m.h | 21 ++++++++
 xen/arch/arm/include/asm/p2m.h     |  2 +-
 xen/arch/arm/mpu/Makefile          |  3 ++
 xen/arch/arm/mpu/mm.c              | 25 +++++++++
 xen/arch/arm/mpu/p2m.c             | 84 ++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/setup.c           | 40 ++++++++++++++
 xen/arch/arm/mpu/vmap.c            | 26 +++++++++
 10 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm64/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
 create mode 100644 xen/arch/arm/mpu/p2m.c
 create mode 100644 xen/arch/arm/mpu/setup.c
 create mode 100644 xen/arch/arm/mpu/vmap.c

diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
index 3340058c08c6..cf0540aecc84 100644
--- a/xen/arch/arm/arm64/mpu/Makefile
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -1 +1,3 @@
 obj-y += head.o
+obj-y += p2m.o
+obj-y += smpboot.o
diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
new file mode 100644
index 000000000000..b6d8b2777b58
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <asm/p2m.h>
+
+void __init setup_virt_paging(void)
+{
+    BUG_ON("unimplemented");
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
diff --git a/xen/arch/arm/arm64/mpu/smpboot.c b/xen/arch/arm/arm64/mpu/smpboot.c
new file mode 100644
index 000000000000..5090f443f577
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/smpboot.c
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/stdbool.h>
+
+int prepare_secondary_mm(int cpu)
+{
+    BUG_ON("unimplemented");
+    return -EINVAL;
+}
+
+void update_boot_mapping(bool enable)
+{
+    BUG_ON("unimplemented");
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
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
new file mode 100644
index 000000000000..e46d9e757a1d
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_P2M_H__
+#define __ARM_MPU_P2M_H__
+
+struct p2m_domain;
+
+static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
+
+static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
+
+#endif /* __ARM_MPU_P2M_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 594dc4004138..2d53bf9b6177 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -168,7 +168,7 @@ typedef enum {
 #if defined(CONFIG_MMU)
 # include <asm/mmu/p2m.h>
 #else
-# error "Unknown memory management layout"
+# include <asm/mpu/p2m.h>
 #endif
 
 static inline bool arch_acquire_resource_check(struct domain *d)
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index b18cec483671..21bbc517b51a 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1 +1,4 @@
 obj-y += mm.o
+obj-y += p2m.o
+obj-y += setup.init.o
+obj-y += vmap.o
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 4e9a2405d8c5..07c8959f4ee9 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -1,9 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sizes.h>
+#include <xen/types.h>
 
 struct page_info *frame_table;
 
@@ -17,6 +20,28 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
+void __init setup_mm(void)
+{
+    BUG_ON("unimplemented");
+}
+
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+{
+    BUG_ON("unimplemented");
+    return -EINVAL;
+}
+
+void dump_hyp_walk(vaddr_t addr)
+{
+    BUG_ON("unimplemented");
+}
+
+/* Release all __init and __initdata ranges to be reused */
+void free_init_memory(void)
+{
+    BUG_ON("unimplemented");
+}
+
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
new file mode 100644
index 000000000000..f7fb58ab6aa8
--- /dev/null
+++ b/xen/arch/arm/mpu/p2m.c
@@ -0,0 +1,84 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/mm-frame.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <asm/p2m.h>
+
+int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
+                  mfn_t smfn, p2m_type_t t, p2m_access_t a)
+{
+    BUG_ON("unimplemented");
+    return -EINVAL;
+}
+
+mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
+                    p2m_access_t *a, unsigned int *page_order, bool *valid)
+{
+    BUG_ON("unimplemented");
+    return INVALID_MFN;
+}
+
+void p2m_dump_info(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+int p2m_init(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return -EINVAL;
+}
+
+void p2m_save_state(struct vcpu *p)
+{
+    BUG_ON("unimplemented");
+}
+
+void p2m_restore_state(struct vcpu *n)
+{
+    BUG_ON("unimplemented");
+}
+
+void p2m_final_teardown(struct domain *d)
+{
+    BUG_ON("unimplemented");
+}
+
+bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
+{
+    BUG_ON("unimplemented");
+    return false;
+}
+
+void p2m_flush_vm(struct vcpu *v) {}
+
+int relinquish_p2m_mapping(struct domain *d)
+{
+    return 0;
+}
+
+void p2m_domain_creation_finished(struct domain *d) {}
+
+int p2m_teardown(struct domain *d)
+{
+    return 0;
+}
+
+int p2m_teardown_allocation(struct domain *d)
+{
+    return 0;
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
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
new file mode 100644
index 000000000000..b4da77003f47
--- /dev/null
+++ b/xen/arch/arm/mpu/setup.c
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/types.h>
+#include <asm/setup.h>
+
+void __init setup_pagetables(void) {}
+
+void * __init early_fdt_map(paddr_t fdt_paddr)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+/*
+ * copy_from_paddr - copy data from a physical address
+ * @dst: destination virtual address
+ * @paddr: source physical address
+ * @len: length to copy
+ */
+void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+{
+    BUG_ON("unimplemented");
+}
+
+void __init remove_early_mappings(void)
+{
+    BUG_ON("unimplemented");
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
diff --git a/xen/arch/arm/mpu/vmap.c b/xen/arch/arm/mpu/vmap.c
new file mode 100644
index 000000000000..f977b79cd436
--- /dev/null
+++ b/xen/arch/arm/mpu/vmap.c
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/mm-frame.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
+void *vmap_contig(mfn_t mfn, unsigned int nr)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+void vunmap(const void *va)
+{
+    BUG_ON("unimplemented");
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



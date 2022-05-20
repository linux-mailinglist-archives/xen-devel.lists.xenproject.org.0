Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFC52EBB8
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333990.557963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wo-0003uy-Ig; Fri, 20 May 2022 12:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333990.557963; Fri, 20 May 2022 12:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wo-0003ji-7n; Fri, 20 May 2022 12:14:46 +0000
Received: by outflank-mailman (input) for mailman id 333990;
 Fri, 20 May 2022 12:14:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Wl-0003NV-SG
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Wl-0005wS-IR; Fri, 20 May 2022 12:14:43 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Sl-0001lI-Nm; Fri, 20 May 2022 12:10:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=xXyiaAqaXOE8UjksPYWndQvCCsS0jnjjnrlX2Gok8p4=; b=xkgAUx/nd4GGJbbvcAtEElB/+V
	ZOrrVNlIN7mSVaB1/vbRHaovXTkHyRSNQKsmcT+4u9Y1HcZ3KxKZwkDsnkHe5l4l4MYYzXX7cfL5e
	7tC996Az2c/Dw7GUKuajB29F3rPAwQSOEXcB+gJWDbrI4awHqt+jBXC7iESLGFQ50/bM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Wei Liu <wei.liu2@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/16] xen/arm: add Persistent Map (PMAP) infrastructure
Date: Fri, 20 May 2022 13:09:31 +0100
Message-Id: <20220520120937.28925-11-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

The basic idea is like Persistent Kernel Map (PKMAP) in Linux. We
pre-populate all the relevant page tables before the system is fully
set up.

We will need it on Arm in order to rework the arm64 version of
xenheap_setup_mappings() as we may need to use pages allocated from
the boot allocator before they are effectively mapped.

This infrastructure is not lock-protected therefore can only be used
before smpboot. After smpboot, map_domain_page() has to be used.

This is based on the x86 version [1] that was originally implemented
by Wei Liu.

The PMAP infrastructure is implemented in common code with some
arch helpers to set/clear the page-table entries and convertion
between a fixmap slot to a virtual address...

As mfn_to_xen_entry() now needs to be exported, take the opportunity
to swich the parameter attr from unsigned to unsigned int.

[1] <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
[julien: Adapted for Arm]
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v4:
        - Move xen_fixmap in fixmap.h and add a comment about its usage.
        - Update comments
        - Use DECLARE_BITMAP()
        - Replace local_irq_{enable, disable} with an ASSERT() as there
          should be no user of pmap() in interrupt context.

    Changes in v3:
        - s/BITS_PER_LONG/BITS_PER_BYTE/
        - Move pmap to common code

    Changes in v2:
        - New patch

Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/include/asm/fixmap.h | 24 +++++++++++
 xen/arch/arm/include/asm/lpae.h   |  8 ++++
 xen/arch/arm/include/asm/pmap.h   | 32 ++++++++++++++
 xen/arch/arm/mm.c                 |  7 +--
 xen/common/Kconfig                |  3 ++
 xen/common/Makefile               |  1 +
 xen/common/pmap.c                 | 72 +++++++++++++++++++++++++++++++
 xen/include/xen/pmap.h            | 16 +++++++
 9 files changed, 158 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/pmap.h
 create mode 100644 xen/common/pmap.c
 create mode 100644 xen/include/xen/pmap.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4d3..a89a67802aa9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
+	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 1cee51e52ab9..365a2385a087 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -5,20 +5,44 @@
 #define __ASM_FIXMAP_H
 
 #include <xen/acpi.h>
+#include <xen/pmap.h>
 
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
 #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
 #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
+#define FIXMAP_PMAP_BEGIN (FIXMAP_ACPI_END + 1) /* Start of PMAP */
+#define FIXMAP_PMAP_END (FIXMAP_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
+
+#define FIXMAP_LAST FIXMAP_PMAP_END
+
+#define FIXADDR_START FIXMAP_ADDR(0)
+#define FIXADDR_TOP FIXMAP_ADDR(FIXMAP_LAST)
 
 #ifndef __ASSEMBLY__
 
+/*
+ * Direct access to xen_fixmap[] should only happen when {set,
+ * clear}_fixmap() is unusable (e.g. where we would end up to
+ * recursively call the helpers).
+ */
+extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
+
 /* Map a page in a fixmap entry */
 extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
 /* Remove a mapping from a fixmap entry */
 extern void clear_fixmap(unsigned map);
 
+#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
+
+static inline unsigned int virt_to_fix(vaddr_t vaddr)
+{
+    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
+
+    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_FIXMAP_H */
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index aecb320dec45..fc19cbd84772 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -4,6 +4,7 @@
 #ifndef __ASSEMBLY__
 
 #include <xen/page-defs.h>
+#include <xen/mm-frame.h>
 
 /*
  * WARNING!  Unlike the x86 pagetable code, where l1 is the lowest level and
@@ -168,6 +169,13 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
         third_table_offset(addr)            \
     }
 
+/*
+ * Standard entry type that we'll use to build Xen's own pagetables.
+ * We put the same permissions at every level, because they're ignored
+ * by the walker in non-leaf entries.
+ */
+lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
+
 #endif /* __ASSEMBLY__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
new file mode 100644
index 000000000000..74398b4c4fe6
--- /dev/null
+++ b/xen/arch/arm/include/asm/pmap.h
@@ -0,0 +1,32 @@
+#ifndef __ASM_PMAP_H__
+#define __ASM_PMAP_H__
+
+#include <xen/mm.h>
+
+#include <asm/fixmap.h>
+
+static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    lpae_t *entry = &xen_fixmap[slot];
+    lpae_t pte;
+
+    ASSERT(!lpae_is_valid(*entry));
+
+    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
+    pte.pt.table = 1;
+    write_pte(entry, pte);
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    lpae_t pte = {};
+
+    write_pte(&xen_fixmap[slot], pte);
+
+    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
+}
+
+void arch_pmap_map_slot(unsigned int slot, mfn_t mfn);
+void arch_pmap_clear_slot(void *ptr);
+
+#endif /* __ASM_PMAP_H__ */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 52b2a0394047..bd1348a99716 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -305,12 +305,7 @@ void dump_hyp_walk(vaddr_t addr)
     dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
 }
 
-/*
- * Standard entry type that we'll use to build Xen's own pagetables.
- * We put the same permissions at every level, because they're ignored
- * by the walker in non-leaf entries.
- */
-static inline lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned attr)
+lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
 {
     lpae_t e = (lpae_t) {
         .pt = {
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d615e..5b6b2406c028 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -49,6 +49,9 @@ config HAS_KEXEC
 config HAS_PDX
 	bool
 
+config HAS_PMAP
+	bool
+
 config HAS_SCHED_GRANULARITY
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b1e076c30b81..3baf83d527d8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -29,6 +29,7 @@ obj-y += notifier.o
 obj-y += page_alloc.o
 obj-$(CONFIG_HAS_PDX) += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
+obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
 obj-y += random.o
 obj-y += rangeset.o
diff --git a/xen/common/pmap.c b/xen/common/pmap.c
new file mode 100644
index 000000000000..9355cacb7373
--- /dev/null
+++ b/xen/common/pmap.c
@@ -0,0 +1,72 @@
+#include <xen/bitops.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/pmap.h>
+
+#include <asm/pmap.h>
+#include <asm/fixmap.h>
+
+/*
+ * Simple mapping infrastructure to map / unmap pages in fixed map.
+ * This is used to set the page table before the map domain page infrastructure
+ * is initialized.
+ *
+ * This structure is not protected by any locks, so it must not be used after
+ * smp bring-up.
+ */
+
+/* Bitmap to track which slot is used */
+static __initdata DECLARE_BITMAP(inuse, NUM_FIX_PMAP);
+
+void *__init pmap_map(mfn_t mfn)
+{
+    unsigned int idx;
+    unsigned int slot;
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+    ASSERT(!in_irq());
+
+    idx = find_first_zero_bit(inuse, NUM_FIX_PMAP);
+    if ( idx == NUM_FIX_PMAP )
+        panic("Out of PMAP slots\n");
+
+    __set_bit(idx, inuse);
+
+    slot = idx + FIXMAP_PMAP_BEGIN;
+    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+
+    /*
+     * We cannot use set_fixmap() here. We use PMAP when the domain map
+     * page infrastructure is not yet initialized, so map_pages_to_xen() called
+     * by set_fixmap() needs to map pages on demand, which then calls pmap()
+     * again, resulting in a loop. Modify the PTEs directly instead. The same
+     * is true for pmap_unmap().
+     */
+    arch_pmap_map(slot, mfn);
+
+    return fix_to_virt(slot);
+}
+
+void __init pmap_unmap(const void *p)
+{
+    unsigned int idx;
+    unsigned int slot = virt_to_fix((unsigned long)p);
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+    ASSERT(in_irq());
+
+    idx = slot - FIXMAP_PMAP_BEGIN;
+
+    __clear_bit(idx, inuse);
+    arch_pmap_unmap(slot);
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
diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
new file mode 100644
index 000000000000..93e61b10870e
--- /dev/null
+++ b/xen/include/xen/pmap.h
@@ -0,0 +1,16 @@
+#ifndef __XEN_PMAP_H__
+#define __XEN_PMAP_H__
+
+/* Large enough for mapping 5 levels of page tables with some headroom */
+#define NUM_FIX_PMAP 8
+
+#ifndef __ASSEMBLY__
+
+#include <xen/mm-frame.h>
+
+void *pmap_map(mfn_t mfn);
+void pmap_unmap(const void *p);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __XEN_PMAP_H__ */
-- 
2.32.0



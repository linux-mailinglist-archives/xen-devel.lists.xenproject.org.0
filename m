Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F736A936
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117362.223286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQQ-0004Wt-BF; Sun, 25 Apr 2021 20:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117362.223286; Sun, 25 Apr 2021 20:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lalQP-0004Us-OX; Sun, 25 Apr 2021 20:32:17 +0000
Received: by outflank-mailman (input) for mailman id 117362;
 Sun, 25 Apr 2021 20:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lalQL-0004RP-Tj
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lalQL-00019x-B1; Sun, 25 Apr 2021 20:32:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8P-0005m7-E0; Sun, 25 Apr 2021 20:13:41 +0000
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
	bh=d6/VERpOpmisc9IqH4nSo3nCT42W307X8jAJ7pAR9wY=; b=QsI0i3rJK15J/0NratxUSYmB11
	vqx01X+WXK6ipXuw4wnzdoVpmp4I6SyXrpjlZ3uWaXiFaxzBYJ7MROjAr/udNlVZ+j6HoMLC89me/
	U2gp72yg8I8k7DB5XhtWB8QDPNffTJgN7DfyV3HYm8MATdClvH0+Ka/Pd4dTJNRR7cBU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Wei Liu <wei.liu2@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Hongian Xia <hongyax@amazon.com>
Subject: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP) infrastructure
Date: Sun, 25 Apr 2021 21:13:15 +0100
Message-Id: <20210425201318.15447-13-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>
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

Take the opportunity to switch the parameter attr from unsigned to
unsigned int.

[1] <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
[julien: Adapted for Arm]
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch

Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Hongian Xia <hongyax@amazon.com>

This is mostly a copy of the PMAP infrastructure currently discussed
on x86. The only difference is how the page-tables are updated.

I think we want to consider to provide a common infrastructure. But
I haven't done it yet to gather feedback on the overall series
first.
---
 xen/arch/arm/Makefile        |   1 +
 xen/arch/arm/mm.c            |   7 +--
 xen/arch/arm/pmap.c          | 101 +++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/config.h |   2 +
 xen/include/asm-arm/lpae.h   |   8 +++
 xen/include/asm-arm/pmap.h   |  10 ++++
 6 files changed, 123 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/pmap.c
 create mode 100644 xen/include/asm-arm/pmap.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ca75f1040dcc..2196ada24941 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -40,6 +40,7 @@ obj-y += percpu.o
 obj-y += platform.o
 obj-y += platform_hypercall.o
 obj-y += physdev.o
+obj-y += pmap.init.o
 obj-y += processor.o
 obj-y += psci.o
 obj-y += setup.o
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index d090fdfd5994..5e713b599611 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -288,12 +288,7 @@ void dump_hyp_walk(vaddr_t addr)
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
diff --git a/xen/arch/arm/pmap.c b/xen/arch/arm/pmap.c
new file mode 100644
index 000000000000..702b1bde982d
--- /dev/null
+++ b/xen/arch/arm/pmap.c
@@ -0,0 +1,101 @@
+#include <xen/init.h>
+#include <xen/mm.h>
+
+#include <asm/bitops.h>
+#include <asm/flushtlb.h>
+#include <asm/pmap.h>
+
+/*
+ * To be able to use FIXMAP_PMAP_BEGIN.
+ * XXX: move fixmap definition in a separate header
+ */
+#include <xen/acpi.h>
+
+/*
+ * Simple mapping infrastructure to map / unmap pages in fixed map.
+ * This is used to set up the page table for mapcache, which is used
+ * by map domain page infrastructure.
+ *
+ * This structure is not protected by any locks, so it must not be used after
+ * smp bring-up.
+ */
+
+/* Bitmap to track which slot is used */
+static unsigned long __initdata inuse;
+
+/* XXX: Find an header to declare it */
+extern lpae_t xen_fixmap[LPAE_ENTRIES];
+
+void *__init pmap_map(mfn_t mfn)
+{
+    unsigned long flags;
+    unsigned int idx;
+    vaddr_t linear;
+    unsigned int slot;
+    lpae_t *entry, pte;
+
+    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_LONG < NUM_FIX_PMAP);
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+
+    local_irq_save(flags);
+
+    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);
+    if ( idx == NUM_FIX_PMAP )
+        panic("Out of PMAP slots\n");
+
+    __set_bit(idx, &inuse);
+
+    slot = idx + FIXMAP_PMAP_BEGIN;
+    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+
+    linear = FIXMAP_ADDR(slot);
+    /*
+     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
+     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
+     * demand, which then calls pmap() again, resulting in a loop. Modify the
+     * PTEs directly instead. The same is true for pmap_unmap().
+     */
+    entry = &xen_fixmap[third_table_offset(linear)];
+
+    ASSERT(!lpae_is_valid(*entry));
+
+    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
+    pte.pt.table = 1;
+    write_pte(entry, pte);
+
+    local_irq_restore(flags);
+
+    return (void *)linear;
+}
+
+void __init pmap_unmap(const void *p)
+{
+    unsigned long flags;
+    unsigned int idx;
+    lpae_t *entry;
+    lpae_t pte = { 0 };
+    unsigned int slot = third_table_offset((vaddr_t)p);
+
+    ASSERT(system_state < SYS_STATE_smp_boot);
+    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
+
+    idx = slot - FIXMAP_PMAP_BEGIN;
+    local_irq_save(flags);
+
+    __clear_bit(idx, &inuse);
+    entry = &xen_fixmap[third_table_offset((vaddr_t)p)];
+    write_pte(entry, pte);
+    flush_xen_tlb_range_va_local((vaddr_t)p, PAGE_SIZE);
+
+    local_irq_restore(flags);
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
diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
index 85d4a510ce8a..35050855b6e1 100644
--- a/xen/include/asm-arm/config.h
+++ b/xen/include/asm-arm/config.h
@@ -180,6 +180,8 @@
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
 #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
 #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
+#define FIXMAP_PMAP_BEGIN (FIXMAP_ACPI_END + 1)
+#define FIXMAP_PMAP_END (FIXMAP_PMAP_BEGIN + NUM_FIX_PMAP - 1)
 
 #define NR_hypercalls 64
 
diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
index 310f5225e056..81fd482ab2ce 100644
--- a/xen/include/asm-arm/lpae.h
+++ b/xen/include/asm-arm/lpae.h
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
diff --git a/xen/include/asm-arm/pmap.h b/xen/include/asm-arm/pmap.h
new file mode 100644
index 000000000000..8e1dce93f8e4
--- /dev/null
+++ b/xen/include/asm-arm/pmap.h
@@ -0,0 +1,10 @@
+#ifndef __ASM_PMAP_H__
+#define __ARM_PMAP_H__
+
+/* Large enough for mapping 5 levels of page tables with some headroom */
+#define NUM_FIX_PMAP 8
+
+void *pmap_map(mfn_t mfn);
+void pmap_unmap(const void *p);
+
+#endif	/* __ASM_PMAP_H__ */
-- 
2.17.1



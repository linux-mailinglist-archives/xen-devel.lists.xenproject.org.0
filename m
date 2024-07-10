Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E092CE4D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756662.1165366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlZ-0004Ef-3e; Wed, 10 Jul 2024 09:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756662.1165366; Wed, 10 Jul 2024 09:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTlZ-0004D9-0k; Wed, 10 Jul 2024 09:37:37 +0000
Received: by outflank-mailman (input) for mailman id 756662;
 Wed, 10 Jul 2024 09:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sRTlX-0003ZP-Lo
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:37:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 093e37f6-3ea0-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 11:37:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08F9E21BB7;
 Wed, 10 Jul 2024 09:37:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B445137D2;
 Wed, 10 Jul 2024 09:37:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nvZiJF1WjmanWwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 10 Jul 2024 09:37:33 +0000
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
X-Inumbo-ID: 093e37f6-3ea0-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720604254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+HykxxQ5Ex73mNnrONMwaT76JhSipo1EPy0jxTFYc8=;
	b=OEz9xvgNl1dKu7zT6xepNByeSGWlDteYDDlg5yBwcd1XV0Is9E6n0BwhwhfQDZy7fdmeAk
	D4DzwN2VNWZs/JVFevwffqj0SEPKHtOzQlb5LKGtDR37TWc/qa1Jum1ZV27w7xU5odgu95
	MJHVkzyy23eyGoBKer6u59o+6d0PQv8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720604254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+HykxxQ5Ex73mNnrONMwaT76JhSipo1EPy0jxTFYc8=;
	b=OEz9xvgNl1dKu7zT6xepNByeSGWlDteYDDlg5yBwcd1XV0Is9E6n0BwhwhfQDZy7fdmeAk
	D4DzwN2VNWZs/JVFevwffqj0SEPKHtOzQlb5LKGtDR37TWc/qa1Jum1ZV27w7xU5odgu95
	MJHVkzyy23eyGoBKer6u59o+6d0PQv8=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] x86/xen: eliminate some private header files
Date: Wed, 10 Jul 2024 11:37:18 +0200
Message-ID: <20240710093718.14552-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710093718.14552-1-jgross@suse.com>
References: <20240710093718.14552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 

Under arch/x86/xen there is one large private header file xen-ops.h
containing most of the Xen-private x86 related declarations, and then
there are several small headers with a handful of declarations each.

Merge the small headers into xen-ops.h.

While doing that, move the declaration of xen_fifo_events from
xen-ops.h into include/xen/events.h where it should have been from the
beginning.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/apic.c          |   2 -
 arch/x86/xen/debugfs.c       |   2 +-
 arch/x86/xen/debugfs.h       |   7 --
 arch/x86/xen/enlighten.c     |   2 -
 arch/x86/xen/enlighten_hvm.c |   2 -
 arch/x86/xen/enlighten_pv.c  |   4 -
 arch/x86/xen/mmu.c           |   3 +-
 arch/x86/xen/mmu.h           |  24 ------
 arch/x86/xen/mmu_hvm.c       |   2 +-
 arch/x86/xen/mmu_pv.c        |   4 +-
 arch/x86/xen/multicalls.c    |   3 +-
 arch/x86/xen/multicalls.h    |  69 ----------------
 arch/x86/xen/p2m.c           |   2 -
 arch/x86/xen/pmu.c           |   1 -
 arch/x86/xen/pmu.h           |  22 ------
 arch/x86/xen/setup.c         |   1 -
 arch/x86/xen/smp.c           |   1 -
 arch/x86/xen/smp.h           |  51 ------------
 arch/x86/xen/smp_hvm.c       |   2 -
 arch/x86/xen/smp_pv.c        |   3 -
 arch/x86/xen/suspend.c       |   2 -
 arch/x86/xen/xen-ops.h       | 147 ++++++++++++++++++++++++++++++++++-
 include/xen/events.h         |   2 +
 23 files changed, 152 insertions(+), 206 deletions(-)
 delete mode 100644 arch/x86/xen/debugfs.h
 delete mode 100644 arch/x86/xen/mmu.h
 delete mode 100644 arch/x86/xen/multicalls.h
 delete mode 100644 arch/x86/xen/pmu.h
 delete mode 100644 arch/x86/xen/smp.h

diff --git a/arch/x86/xen/apic.c b/arch/x86/xen/apic.c
index 8b045dd25196..bb0f3f368446 100644
--- a/arch/x86/xen/apic.c
+++ b/arch/x86/xen/apic.c
@@ -10,8 +10,6 @@
 #include <xen/xen.h>
 #include <xen/interface/physdev.h>
 #include "xen-ops.h"
-#include "pmu.h"
-#include "smp.h"
 
 static unsigned int xen_io_apic_read(unsigned apic, unsigned reg)
 {
diff --git a/arch/x86/xen/debugfs.c b/arch/x86/xen/debugfs.c
index 532410998684..b8c9f2a7d9b6 100644
--- a/arch/x86/xen/debugfs.c
+++ b/arch/x86/xen/debugfs.c
@@ -3,7 +3,7 @@
 #include <linux/debugfs.h>
 #include <linux/slab.h>
 
-#include "debugfs.h"
+#include "xen-ops.h"
 
 static struct dentry *d_xen_debug;
 
diff --git a/arch/x86/xen/debugfs.h b/arch/x86/xen/debugfs.h
deleted file mode 100644
index 6b813ad1091c..000000000000
--- a/arch/x86/xen/debugfs.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_DEBUGFS_H
-#define _XEN_DEBUGFS_H
-
-struct dentry * __init xen_init_debugfs(void);
-
-#endif /* _XEN_DEBUGFS_H */
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 0305485edcd3..84e5adbd0925 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -20,8 +20,6 @@
 #include <asm/setup.h>
 
 #include "xen-ops.h"
-#include "smp.h"
-#include "pmu.h"
 
 EXPORT_SYMBOL_GPL(hypercall_page);
 
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index c001a2296582..24d2957a4726 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -28,8 +28,6 @@
 #include <asm/xen/page.h>
 
 #include "xen-ops.h"
-#include "mmu.h"
-#include "smp.h"
 
 static unsigned long shared_info_pfn;
 
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9ba53814ed6a..2c12ae42dc8b 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -85,10 +85,6 @@
 #endif
 
 #include "xen-ops.h"
-#include "mmu.h"
-#include "smp.h"
-#include "multicalls.h"
-#include "pmu.h"
 
 #include "../kernel/cpu/cpu.h" /* get_cpu_cap() */
 
diff --git a/arch/x86/xen/mmu.c b/arch/x86/xen/mmu.c
index 60e9c37fd79f..c4c479373249 100644
--- a/arch/x86/xen/mmu.c
+++ b/arch/x86/xen/mmu.c
@@ -5,8 +5,7 @@
 #include <asm/xen/hypercall.h>
 #include <xen/interface/memory.h>
 
-#include "multicalls.h"
-#include "mmu.h"
+#include "xen-ops.h"
 
 unsigned long arbitrary_virt_to_mfn(void *vaddr)
 {
diff --git a/arch/x86/xen/mmu.h b/arch/x86/xen/mmu.h
deleted file mode 100644
index 11fa577af6b4..000000000000
--- a/arch/x86/xen/mmu.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_MMU_H
-
-#include <linux/linkage.h>
-#include <asm/page.h>
-
-enum pt_level {
-	PT_PGD,
-	PT_P4D,
-	PT_PUD,
-	PT_PMD,
-	PT_PTE
-};
-
-
-bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
-
-void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
-
-unsigned long xen_read_cr2_direct(void);
-
-extern void xen_init_mmu_ops(void);
-extern void xen_hvm_init_mmu_ops(void);
-#endif	/* _XEN_MMU_H */
diff --git a/arch/x86/xen/mmu_hvm.c b/arch/x86/xen/mmu_hvm.c
index 509bdee3ab90..337955652202 100644
--- a/arch/x86/xen/mmu_hvm.c
+++ b/arch/x86/xen/mmu_hvm.c
@@ -5,7 +5,7 @@
 #include <xen/interface/xen.h>
 #include <xen/hvm.h>
 
-#include "mmu.h"
+#include "xen-ops.h"
 
 #ifdef CONFIG_PROC_VMCORE
 /*
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 8924129e284c..f1ce39d6d32c 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -82,9 +82,7 @@
 #include <xen/hvc-console.h>
 #include <xen/swiotlb-xen.h>
 
-#include "multicalls.h"
-#include "mmu.h"
-#include "debugfs.h"
+#include "xen-ops.h"
 
 /*
  * Prototypes for functions called via PV_CALLEE_SAVE_REGS_THUNK() in order
diff --git a/arch/x86/xen/multicalls.c b/arch/x86/xen/multicalls.c
index a8d699687d5c..d4cefd8a9af4 100644
--- a/arch/x86/xen/multicalls.c
+++ b/arch/x86/xen/multicalls.c
@@ -28,8 +28,7 @@
 
 #include <asm/xen/hypercall.h>
 
-#include "multicalls.h"
-#include "debugfs.h"
+#include "xen-ops.h"
 
 #define MC_BATCH	32
 
diff --git a/arch/x86/xen/multicalls.h b/arch/x86/xen/multicalls.h
deleted file mode 100644
index c3867b585e0d..000000000000
--- a/arch/x86/xen/multicalls.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_MULTICALLS_H
-#define _XEN_MULTICALLS_H
-
-#include <trace/events/xen.h>
-
-#include "xen-ops.h"
-
-/* Multicalls */
-struct multicall_space
-{
-	struct multicall_entry *mc;
-	void *args;
-};
-
-/* Allocate room for a multicall and its args */
-struct multicall_space __xen_mc_entry(size_t args);
-
-DECLARE_PER_CPU(unsigned long, xen_mc_irq_flags);
-
-/* Call to start a batch of multiple __xen_mc_entry()s.  Must be
-   paired with xen_mc_issue() */
-static inline void xen_mc_batch(void)
-{
-	unsigned long flags;
-
-	/* need to disable interrupts until this entry is complete */
-	local_irq_save(flags);
-	trace_xen_mc_batch(xen_get_lazy_mode());
-	__this_cpu_write(xen_mc_irq_flags, flags);
-}
-
-static inline struct multicall_space xen_mc_entry(size_t args)
-{
-	xen_mc_batch();
-	return __xen_mc_entry(args);
-}
-
-/* Flush all pending multicalls */
-void xen_mc_flush(void);
-
-/* Issue a multicall if we're not in a lazy mode */
-static inline void xen_mc_issue(unsigned mode)
-{
-	trace_xen_mc_issue(mode);
-
-	if ((xen_get_lazy_mode() & mode) == 0)
-		xen_mc_flush();
-
-	/* restore flags saved in xen_mc_batch */
-	local_irq_restore(this_cpu_read(xen_mc_irq_flags));
-}
-
-/* Set up a callback to be called when the current batch is flushed */
-void xen_mc_callback(void (*fn)(void *), void *data);
-
-/*
- * Try to extend the arguments of the previous multicall command.  The
- * previous command's op must match.  If it does, then it attempts to
- * extend the argument space allocated to the multicall entry by
- * arg_size bytes.
- *
- * The returned multicall_space will return with mc pointing to the
- * command on success, or NULL on failure, and args pointing to the
- * newly allocated space.
- */
-struct multicall_space xen_mc_extend_args(unsigned long op, size_t arg_size);
-
-#endif /* _XEN_MULTICALLS_H */
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 99918beccd80..3c4c20db7e39 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -81,7 +81,6 @@
 #include <xen/balloon.h>
 #include <xen/grant_table.h>
 
-#include "multicalls.h"
 #include "xen-ops.h"
 
 #define P2M_MID_PER_PAGE	(PAGE_SIZE / sizeof(unsigned long *))
@@ -795,7 +794,6 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 
 #ifdef CONFIG_XEN_DEBUG_FS
 #include <linux/debugfs.h>
-#include "debugfs.h"
 static int p2m_dump_show(struct seq_file *m, void *v)
 {
 	static const char * const type_name[] = {
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 246d67dab510..f06987b0efc3 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -10,7 +10,6 @@
 #include <xen/interface/xenpmu.h>
 
 #include "xen-ops.h"
-#include "pmu.h"
 
 /* x86_pmu.handle_irq definition */
 #include "../events/perf_event.h"
diff --git a/arch/x86/xen/pmu.h b/arch/x86/xen/pmu.h
deleted file mode 100644
index 65c58894fc79..000000000000
--- a/arch/x86/xen/pmu.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __XEN_PMU_H
-#define __XEN_PMU_H
-
-#include <xen/interface/xenpmu.h>
-
-extern bool is_xen_pmu;
-
-irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
-#ifdef CONFIG_XEN_HAVE_VPMU
-void xen_pmu_init(int cpu);
-void xen_pmu_finish(int cpu);
-#else
-static inline void xen_pmu_init(int cpu) {}
-static inline void xen_pmu_finish(int cpu) {}
-#endif
-bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
-bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
-int pmu_apic_update(uint32_t reg);
-unsigned long long xen_read_pmc(int counter);
-
-#endif /* __XEN_PMU_H */
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 380591028cb8..a0c3e77e3d5b 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -34,7 +34,6 @@
 #include <xen/features.h>
 #include <xen/hvc-console.h>
 #include "xen-ops.h"
-#include "mmu.h"
 
 #define GB(x) ((uint64_t)(x) * 1024 * 1024 * 1024)
 
diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index 935771726f9c..05f92c812ac8 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -9,7 +9,6 @@
 
 #include <xen/hvc-console.h>
 #include "xen-ops.h"
-#include "smp.h"
 
 static DEFINE_PER_CPU(struct xen_common_irq, xen_resched_irq) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_callfunc_irq) = { .irq = -1 };
diff --git a/arch/x86/xen/smp.h b/arch/x86/xen/smp.h
deleted file mode 100644
index b8efdbc693f7..000000000000
--- a/arch/x86/xen/smp.h
+++ /dev/null
@@ -1,51 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _XEN_SMP_H
-
-#ifdef CONFIG_SMP
-
-void asm_cpu_bringup_and_idle(void);
-asmlinkage void cpu_bringup_and_idle(void);
-
-extern void xen_send_IPI_mask(const struct cpumask *mask,
-			      int vector);
-extern void xen_send_IPI_mask_allbutself(const struct cpumask *mask,
-				int vector);
-extern void xen_send_IPI_allbutself(int vector);
-extern void xen_send_IPI_all(int vector);
-extern void xen_send_IPI_self(int vector);
-
-extern int xen_smp_intr_init(unsigned int cpu);
-extern void xen_smp_intr_free(unsigned int cpu);
-int xen_smp_intr_init_pv(unsigned int cpu);
-void xen_smp_intr_free_pv(unsigned int cpu);
-
-void xen_smp_count_cpus(void);
-void xen_smp_cpus_done(unsigned int max_cpus);
-
-void xen_smp_send_reschedule(int cpu);
-void xen_smp_send_call_function_ipi(const struct cpumask *mask);
-void xen_smp_send_call_function_single_ipi(int cpu);
-
-void __noreturn xen_cpu_bringup_again(unsigned long stack);
-
-struct xen_common_irq {
-	int irq;
-	char *name;
-};
-#else /* CONFIG_SMP */
-
-static inline int xen_smp_intr_init(unsigned int cpu)
-{
-	return 0;
-}
-static inline void xen_smp_intr_free(unsigned int cpu) {}
-
-static inline int xen_smp_intr_init_pv(unsigned int cpu)
-{
-	return 0;
-}
-static inline void xen_smp_intr_free_pv(unsigned int cpu) {}
-static inline void xen_smp_count_cpus(void) { }
-#endif /* CONFIG_SMP */
-
-#endif
diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index ac95d1981cc0..485c1d8804f7 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -5,8 +5,6 @@
 #include <xen/events.h>
 
 #include "xen-ops.h"
-#include "smp.h"
-
 
 static void __init xen_hvm_smp_prepare_boot_cpu(void)
 {
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index ac41d83b38d3..7ea57f728b89 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -46,9 +46,6 @@
 
 #include <xen/hvc-console.h>
 #include "xen-ops.h"
-#include "mmu.h"
-#include "smp.h"
-#include "pmu.h"
 
 cpumask_var_t xen_cpu_initialized_map;
 
diff --git a/arch/x86/xen/suspend.c b/arch/x86/xen/suspend.c
index 1d83152c761b..77a6ea1c60e4 100644
--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -15,8 +15,6 @@
 #include <asm/fixmap.h>
 
 #include "xen-ops.h"
-#include "mmu.h"
-#include "pmu.h"
 
 static DEFINE_PER_CPU(u64, spec_ctrl);
 
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 9f29229e25b8..e7775dff9452 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -5,8 +5,15 @@
 #include <linux/init.h>
 #include <linux/clocksource.h>
 #include <linux/irqreturn.h>
+#include <linux/linkage.h>
+
+#include <xen/interface/xenpmu.h>
 #include <xen/xen-ops.h>
 
+#include <asm/page.h>
+
+#include <trace/events/xen.h>
+
 /* These are code, but not functions.  Defined in entry.S */
 extern const char xen_failsafe_callback[];
 
@@ -28,8 +35,6 @@ extern struct start_info *xen_start_info;
 extern struct shared_info xen_dummy_shared_info;
 extern struct shared_info *HYPERVISOR_shared_info;
 
-extern bool xen_fifo_events;
-
 void xen_setup_mfn_list_list(void);
 void xen_build_mfn_list_list(void);
 void xen_setup_machphys_mapping(void);
@@ -176,4 +181,142 @@ static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
 
 void xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns);
 
+struct dentry * __init xen_init_debugfs(void);
+
+enum pt_level {
+	PT_PGD,
+	PT_P4D,
+	PT_PUD,
+	PT_PMD,
+	PT_PTE
+};
+
+bool __set_phys_to_machine(unsigned long pfn, unsigned long mfn);
+void set_pte_mfn(unsigned long vaddr, unsigned long pfn, pgprot_t flags);
+unsigned long xen_read_cr2_direct(void);
+void xen_init_mmu_ops(void);
+void xen_hvm_init_mmu_ops(void);
+
+/* Multicalls */
+struct multicall_space
+{
+	struct multicall_entry *mc;
+	void *args;
+};
+
+/* Allocate room for a multicall and its args */
+struct multicall_space __xen_mc_entry(size_t args);
+
+DECLARE_PER_CPU(unsigned long, xen_mc_irq_flags);
+
+/* Call to start a batch of multiple __xen_mc_entry()s.  Must be
+   paired with xen_mc_issue() */
+static inline void xen_mc_batch(void)
+{
+	unsigned long flags;
+
+	/* need to disable interrupts until this entry is complete */
+	local_irq_save(flags);
+	trace_xen_mc_batch(xen_get_lazy_mode());
+	__this_cpu_write(xen_mc_irq_flags, flags);
+}
+
+static inline struct multicall_space xen_mc_entry(size_t args)
+{
+	xen_mc_batch();
+	return __xen_mc_entry(args);
+}
+
+/* Flush all pending multicalls */
+void xen_mc_flush(void);
+
+/* Issue a multicall if we're not in a lazy mode */
+static inline void xen_mc_issue(unsigned mode)
+{
+	trace_xen_mc_issue(mode);
+
+	if ((xen_get_lazy_mode() & mode) == 0)
+		xen_mc_flush();
+
+	/* restore flags saved in xen_mc_batch */
+	local_irq_restore(this_cpu_read(xen_mc_irq_flags));
+}
+
+/* Set up a callback to be called when the current batch is flushed */
+void xen_mc_callback(void (*fn)(void *), void *data);
+
+/*
+ * Try to extend the arguments of the previous multicall command.  The
+ * previous command's op must match.  If it does, then it attempts to
+ * extend the argument space allocated to the multicall entry by
+ * arg_size bytes.
+ *
+ * The returned multicall_space will return with mc pointing to the
+ * command on success, or NULL on failure, and args pointing to the
+ * newly allocated space.
+ */
+struct multicall_space xen_mc_extend_args(unsigned long op, size_t arg_size);
+
+extern bool is_xen_pmu;
+
+irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id);
+#ifdef CONFIG_XEN_HAVE_VPMU
+void xen_pmu_init(int cpu);
+void xen_pmu_finish(int cpu);
+#else
+static inline void xen_pmu_init(int cpu) {}
+static inline void xen_pmu_finish(int cpu) {}
+#endif
+bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
+bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
+int pmu_apic_update(uint32_t reg);
+unsigned long long xen_read_pmc(int counter);
+
+#ifdef CONFIG_SMP
+
+void asm_cpu_bringup_and_idle(void);
+asmlinkage void cpu_bringup_and_idle(void);
+
+extern void xen_send_IPI_mask(const struct cpumask *mask,
+			      int vector);
+extern void xen_send_IPI_mask_allbutself(const struct cpumask *mask,
+				int vector);
+extern void xen_send_IPI_allbutself(int vector);
+extern void xen_send_IPI_all(int vector);
+extern void xen_send_IPI_self(int vector);
+
+extern int xen_smp_intr_init(unsigned int cpu);
+extern void xen_smp_intr_free(unsigned int cpu);
+int xen_smp_intr_init_pv(unsigned int cpu);
+void xen_smp_intr_free_pv(unsigned int cpu);
+
+void xen_smp_count_cpus(void);
+void xen_smp_cpus_done(unsigned int max_cpus);
+
+void xen_smp_send_reschedule(int cpu);
+void xen_smp_send_call_function_ipi(const struct cpumask *mask);
+void xen_smp_send_call_function_single_ipi(int cpu);
+
+void __noreturn xen_cpu_bringup_again(unsigned long stack);
+
+struct xen_common_irq {
+	int irq;
+	char *name;
+};
+#else /* CONFIG_SMP */
+
+static inline int xen_smp_intr_init(unsigned int cpu)
+{
+	return 0;
+}
+static inline void xen_smp_intr_free(unsigned int cpu) {}
+
+static inline int xen_smp_intr_init_pv(unsigned int cpu)
+{
+	return 0;
+}
+static inline void xen_smp_intr_free_pv(unsigned int cpu) {}
+static inline void xen_smp_count_cpus(void) { }
+#endif /* CONFIG_SMP */
+
 #endif /* XEN_OPS_H */
diff --git a/include/xen/events.h b/include/xen/events.h
index 3b07409f8032..de5da58a0205 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -144,4 +144,6 @@ static inline void xen_evtchn_close(evtchn_port_t port)
 		BUG();
 }
 
+extern bool xen_fifo_events;
+
 #endif	/* _XEN_EVENTS_H */
-- 
2.43.0



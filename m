Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA770930B
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536846.835544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwQT-0001oJ-Fx; Fri, 19 May 2023 09:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536846.835544; Fri, 19 May 2023 09:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwQT-0001mM-Cx; Fri, 19 May 2023 09:29:29 +0000
Received: by outflank-mailman (input) for mailman id 536846;
 Fri, 19 May 2023 09:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FzOY=BI=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pzwQR-0001mG-7J
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:29:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b0c3bb-f627-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 11:29:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AC7361040;
 Fri, 19 May 2023 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95151C433D2;
 Fri, 19 May 2023 09:29:20 +0000 (UTC)
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
X-Inumbo-ID: a4b0c3bb-f627-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684488563;
	bh=XoazJ8+NY/zUkaU8NzggrB/ghI/4odceV/1JnUi+Dmc=;
	h=From:To:Cc:Subject:Date:From;
	b=F8lhzdDq6FFa/B9xQpGC3UMBhg06/S8aUAed0Bx6y3p7D8C0KePzwA28eJ6MwOWnB
	 HCzOB9mw0ArwodrqG93+d2iUANl2qG2+g6/eoIrKQBPQYczyF3XxlvWCzbTErhUzlC
	 GPiDfT2Ni/svQaioieFFywhgVN8es8lASKkH163niPjsMEAF2S/hhKx9UEKU4f68gh
	 UvhCYp96WcUev936+h1S2Dg7pP5GOWLVnlJntnTlGVEu43C36hqbCfHb/tZP+ZWYm/
	 n9+do87UuZ1KvZwRdyJAhg/zhegv053Vq3jEgxkSNlSa7IaD1Jje2B00yvYt9tcKx/
	 nDRHkSehZEcng==
From: Arnd Bergmann <arnd@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] x86: xen: add missing prototypes
Date: Fri, 19 May 2023 11:28:40 +0200
Message-Id: <20230519092905.3828633-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These function are all called from assembler files, or from inline assembler,
so there is no immediate need for a prototype in a header, but if -Wmissing-prototypes
is enabled, the compiler warns about them:

arch/x86/xen/efi.c:130:13: error: no previous prototype for 'xen_efi_init' [-Werror=missing-prototypes]
arch/x86/platform/pvh/enlighten.c:120:13: error: no previous prototype for 'xen_prepare_pvh' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:358:20: error: no previous prototype for 'xen_pte_val' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:366:20: error: no previous prototype for 'xen_pgd_val' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:372:17: error: no previous prototype for 'xen_make_pte' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:380:17: error: no previous prototype for 'xen_make_pgd' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:387:20: error: no previous prototype for 'xen_pmd_val' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:425:17: error: no previous prototype for 'xen_make_pmd' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:432:20: error: no previous prototype for 'xen_pud_val' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:438:17: error: no previous prototype for 'xen_make_pud' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:522:20: error: no previous prototype for 'xen_p4d_val' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:528:17: error: no previous prototype for 'xen_make_p4d' [-Werror=missing-prototypes]
arch/x86/xen/mmu_pv.c:1442:17: error: no previous prototype for 'xen_make_pte_init' [-Werror=missing-prototypes]
arch/x86/xen/enlighten_pv.c:1233:34: error: no previous prototype for 'xen_start_kernel' [-Werror=missing-prototypes]
arch/x86/xen/irq.c:22:14: error: no previous prototype for 'xen_force_evtchn_callback' [-Werror=missing-prototypes]
arch/x86/entry/common.c:302:24: error: no previous prototype for 'xen_pv_evtchn_do_upcall' [-Werror=missing-prototypes]

Declare all of them in an appropriate header file to avoid the warnings.
For consistency, also move the asm_cpu_bringup_and_idle() declaration out of
smp_pv.c.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix up changelog
---
 arch/x86/xen/efi.c     |  2 ++
 arch/x86/xen/smp.h     |  4 ++++
 arch/x86/xen/smp_pv.c  |  1 -
 arch/x86/xen/xen-ops.h | 14 ++++++++++++++
 include/xen/xen.h      |  3 +++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 7d7ffb9c826a..863d0d6b3edc 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -16,6 +16,8 @@
 #include <asm/setup.h>
 #include <asm/xen/hypercall.h>
 
+#include "xen-ops.h"
+
 static efi_char16_t vendor[100] __initdata;
 
 static efi_system_table_t efi_systab_xen __initdata = {
diff --git a/arch/x86/xen/smp.h b/arch/x86/xen/smp.h
index 22fb982ff971..81a7821dd07f 100644
--- a/arch/x86/xen/smp.h
+++ b/arch/x86/xen/smp.h
@@ -1,7 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _XEN_SMP_H
 
+void asm_cpu_bringup_and_idle(void);
+asmlinkage void cpu_bringup_and_idle(void);
+
 #ifdef CONFIG_SMP
+
 extern void xen_send_IPI_mask(const struct cpumask *mask,
 			      int vector);
 extern void xen_send_IPI_mask_allbutself(const struct cpumask *mask,
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index a92e8002b5cf..d5ae5de2daa2 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -55,7 +55,6 @@ static DEFINE_PER_CPU(struct xen_common_irq, xen_irq_work) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_pmu_irq) = { .irq = -1 };
 
 static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id);
-void asm_cpu_bringup_and_idle(void);
 
 static void cpu_bringup(void)
 {
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 6d7f6318fc07..0f71ee3fe86b 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -160,4 +160,18 @@ void xen_hvm_post_suspend(int suspend_cancelled);
 static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
 #endif
 
+void xen_force_evtchn_callback(void);
+pteval_t xen_pte_val(pte_t pte);
+pgdval_t xen_pgd_val(pgd_t pgd);
+pte_t xen_make_pte(pteval_t pte);
+pgd_t xen_make_pgd(pgdval_t pgd);
+pmdval_t xen_pmd_val(pmd_t pmd);
+pmd_t xen_make_pmd(pmdval_t pmd);
+pudval_t xen_pud_val(pud_t pud);
+pud_t xen_make_pud(pudval_t pud);
+p4dval_t xen_p4d_val(p4d_t p4d);
+p4d_t xen_make_p4d(p4dval_t p4d);
+pte_t xen_make_pte_init(pteval_t pte);
+void xen_start_kernel(struct start_info *si);
+
 #endif /* XEN_OPS_H */
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0efeb652f9b8..f989162983c3 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -31,6 +31,9 @@ extern uint32_t xen_start_flags;
 
 #include <xen/interface/hvm/start_info.h>
 extern struct hvm_start_info pvh_start_info;
+void xen_prepare_pvh(void);
+struct pt_regs;
+void xen_pv_evtchn_do_upcall(struct pt_regs *regs);
 
 #ifdef CONFIG_XEN_DOM0
 #include <xen/interface/xen.h>
-- 
2.39.2



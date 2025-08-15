Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF753B27680
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 05:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082690.1442462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umkmV-0005er-G5; Fri, 15 Aug 2025 03:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082690.1442462; Fri, 15 Aug 2025 03:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umkmV-0005VT-8D; Fri, 15 Aug 2025 03:07:03 +0000
Received: by outflank-mailman (input) for mailman id 1082690;
 Fri, 15 Aug 2025 03:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxBA=23=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1umkmT-00052A-BB
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 03:07:01 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e564f5f0-7984-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 05:06:56 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c36SK23xyztTHr;
 Fri, 15 Aug 2025 11:05:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 2BD491400C8;
 Fri, 15 Aug 2025 11:06:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 Aug
 2025 11:06:51 +0800
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
X-Inumbo-ID: e564f5f0-7984-11f0-b898-0df219b8e170
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<mbenes@suse.cz>, <broonie@kernel.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>, <liaochang1@huawei.com>,
	<kristina.martsenko@arm.com>, <leitao@debian.org>, <ardb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 8/8] arm64: entry: Switch to generic IRQ entry
Date: Fri, 15 Aug 2025 11:06:33 +0800
Message-ID: <20250815030633.448613-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Currently, x86, Riscv and Loongarch use the generic entry code, which
makes maintainer's work easier and code more elegant. Start converting
arm64 to use the generic entry infrastructure from kernel/entry/* by
switching it to generic IRQ entry, which removes 100+ lines of duplicate
code. arm64 will completely switch to generic entry in a later series.

The changes are below:
 - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
   irqentry_enter/exit() as their code and functionality are almost
   identical.

 - Define ARCH_EXIT_TO_USER_MODE_WORK and implement
   arch_exit_to_user_mode_work() to check arm64-specific thread flags
   "_TIF_MTE_ASYNC_FAULT" and "_TIF_FOREIGN_FPSTATE".
   So also remove *enter_from/exit_to_user_mode(), and wrap with
   generic enter_from/exit_to_user_mode() because they are
   exactly the same.

 - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
   because they're exactly the same, so the temporary arm64 version
   irqentry_state can also be removed.

 - Remove PREEMPT_DYNAMIC code, as generic irqentry_exit_cond_resched()
   has the same functionality.

 - Implement arch_irqentry_exit_need_resched() with
   arm64_preempt_schedule_irq() for arm64 which will allow arm64 to do
   its architecture specific checks.

Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Suggested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig                    |   1 +
 arch/arm64/include/asm/entry-common.h |  57 ++++
 arch/arm64/include/asm/exception.h    |   1 -
 arch/arm64/include/asm/preempt.h      |   8 -
 arch/arm64/kernel/entry-common.c      | 378 +++++++-------------------
 arch/arm64/kernel/signal.c            |   3 +-
 6 files changed, 156 insertions(+), 292 deletions(-)
 create mode 100644 arch/arm64/include/asm/entry-common.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..6bb60a0620ec 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -151,6 +151,7 @@ config ARM64
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IRQ_IPI
 	select GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
new file mode 100644
index 000000000000..cab8cd78f693
--- /dev/null
+++ b/arch/arm64/include/asm/entry-common.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_ARM64_ENTRY_COMMON_H
+#define _ASM_ARM64_ENTRY_COMMON_H
+
+#include <linux/thread_info.h>
+
+#include <asm/cpufeature.h>
+#include <asm/daifflags.h>
+#include <asm/fpsimd.h>
+#include <asm/mte.h>
+#include <asm/stacktrace.h>
+
+#define ARCH_EXIT_TO_USER_MODE_WORK (_TIF_MTE_ASYNC_FAULT | _TIF_FOREIGN_FPSTATE)
+
+static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
+							unsigned long ti_work)
+{
+	if (ti_work & _TIF_MTE_ASYNC_FAULT) {
+		clear_thread_flag(TIF_MTE_ASYNC_FAULT);
+		send_sig_fault(SIGSEGV, SEGV_MTEAERR, (void __user *)NULL, current);
+	}
+
+	if (ti_work & _TIF_FOREIGN_FPSTATE)
+		fpsimd_restore_current_state();
+}
+
+#define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
+
+static inline bool arch_irqentry_exit_need_resched(void)
+{
+	/*
+	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * DAIF we must have handled an NMI, so skip preemption.
+	 */
+	if (system_uses_irq_prio_masking() && read_sysreg(daif))
+		return false;
+
+	/*
+	 * Preempting a task from an IRQ means we leave copies of PSTATE
+	 * on the stack. cpufeature's enable calls may modify PSTATE, but
+	 * resuming one of these preempted tasks would undo those changes.
+	 *
+	 * Only allow a task to be preempted once cpufeatures have been
+	 * enabled.
+	 */
+	if (!system_capabilities_finalized())
+		return false;
+
+	return true;
+}
+
+#define arch_irqentry_exit_need_resched arch_irqentry_exit_need_resched
+
+#endif /* _ASM_ARM64_ENTRY_COMMON_H */
diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index e3874c4fc399..a2da3cb21c24 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -89,7 +89,6 @@ void do_el1_fpac(struct pt_regs *regs, unsigned long esr);
 void do_el0_mops(struct pt_regs *regs, unsigned long esr);
 void do_el1_mops(struct pt_regs *regs, unsigned long esr);
 void do_serror(struct pt_regs *regs, unsigned long esr);
-void do_signal(struct pt_regs *regs);
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far);
 #endif	/* __ASM_EXCEPTION_H */
diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index c2437ea0790f..932ea4b62042 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -2,7 +2,6 @@
 #ifndef __ASM_PREEMPT_H
 #define __ASM_PREEMPT_H
 
-#include <linux/jump_label.h>
 #include <linux/thread_info.h>
 
 #define PREEMPT_NEED_RESCHED	BIT(32)
@@ -85,26 +84,19 @@ static inline bool should_resched(int preempt_offset)
 void preempt_schedule(void);
 void preempt_schedule_notrace(void);
 
-void raw_irqentry_exit_cond_resched(void);
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 void dynamic_preempt_schedule(void);
 #define __preempt_schedule()		dynamic_preempt_schedule()
 void dynamic_preempt_schedule_notrace(void);
 #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
 
 #else /* CONFIG_PREEMPT_DYNAMIC */
 
 #define __preempt_schedule()		preempt_schedule()
 #define __preempt_schedule_notrace()	preempt_schedule_notrace()
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
 
 #endif /* CONFIG_PREEMPT_DYNAMIC */
-#else /* CONFIG_PREEMPTION */
-#define irqentry_exit_cond_resched()	{}
 #endif /* CONFIG_PREEMPTION */
 
 #endif /* __ASM_PREEMPT_H */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index f52067d17baf..f546a914f041 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/context_tracking.h>
+#include <linux/irq-entry-common.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
 #include <linux/livepatch.h>
@@ -29,13 +30,6 @@
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
 
-typedef struct irqentry_state {
-	union {
-		bool	exit_rcu;
-		bool	lockdep;
-	};
-} arm64_irqentry_state_t;
-
 /*
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -44,31 +38,14 @@ typedef struct irqentry_state {
  * This is intended to match the logic in irqentry_enter(), handling the kernel
  * mode transitions only.
  */
-static __always_inline arm64_irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
+static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
 {
-	arm64_irqentry_state_t state = {
-		.exit_rcu = false,
-	};
-
-	if (!IS_ENABLED(CONFIG_TINY_RCU) && is_idle_task(current)) {
-		lockdep_hardirqs_off(CALLER_ADDR0);
-		ct_irq_enter();
-		trace_hardirqs_off_finish();
-
-		state.exit_rcu = true;
-		return state;
-	}
-
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	rcu_irq_enter_check_tick();
-	trace_hardirqs_off_finish();
-
-	return state;
+	return irqentry_enter(regs);
 }
 
-static noinstr arm64_irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
+static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = __enter_from_kernel_mode(regs);
 	mte_check_tfsr_entry();
@@ -77,51 +54,6 @@ static noinstr arm64_irqentry_state_t enter_from_kernel_mode(struct pt_regs *reg
 	return state;
 }
 
-static inline bool arm64_preempt_schedule_irq(void)
-{
-	/*
-	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-	 * DAIF we must have handled an NMI, so skip preemption.
-	 */
-	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return false;
-
-	/*
-	 * Preempting a task from an IRQ means we leave copies of PSTATE
-	 * on the stack. cpufeature's enable calls may modify PSTATE, but
-	 * resuming one of these preempted tasks would undo those changes.
-	 *
-	 * Only allow a task to be preempted once cpufeatures have been
-	 * enabled.
-	 */
-	if (!system_capabilities_finalized())
-		return false;
-
-	return true;
-}
-
-#ifdef CONFIG_PREEMPTION
-void raw_irqentry_exit_cond_resched(void)
-{
-	if (!preempt_count()) {
-		if (need_resched() && arm64_preempt_schedule_irq())
-			preempt_schedule_irq();
-	}
-}
-#endif
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-		return;
-	raw_irqentry_exit_cond_resched();
-}
-#endif
-
 /*
  * Handle IRQ/context state management when exiting to kernel mode.
  * After this function returns it is not safe to call regular kernel code,
@@ -131,31 +63,13 @@ void dynamic_irqentry_exit_cond_resched(void)
  * mode transitions only, and with preemption handled elsewhere.
  */
 static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
-						  arm64_irqentry_state_t state)
-{
-	lockdep_assert_irqs_disabled();
-
-	if (!regs_irqs_disabled(regs)) {
-		if (state.exit_rcu) {
-			trace_hardirqs_on_prepare();
-			lockdep_hardirqs_on_prepare();
-			ct_irq_exit();
-			lockdep_hardirqs_on(CALLER_ADDR0);
-			return;
-		}
-
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			irqentry_exit_cond_resched();
-
-		trace_hardirqs_on();
-	} else {
-		if (state.exit_rcu)
-			ct_irq_exit();
-	}
+						  irqentry_state_t state)
+{
+	irqentry_exit(regs, state);
 }
 
 static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
-					arm64_irqentry_state_t state)
+					irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
 	__exit_to_kernel_mode(regs, state);
@@ -166,18 +80,15 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void __enter_from_user_mode(void)
+static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
 {
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	CT_WARN_ON(ct_state() != CT_STATE_USER);
-	user_exit_irqoff();
-	trace_hardirqs_off_finish();
+	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
 }
 
-static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
-	__enter_from_user_mode();
+	__enter_from_user_mode(regs);
 }
 
 /*
@@ -185,116 +96,19 @@ static __always_inline void enter_from_user_mode(struct pt_regs *regs)
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void __exit_to_user_mode(void)
-{
-	trace_hardirqs_on_prepare();
-	lockdep_hardirqs_on_prepare();
-	user_enter_irqoff();
-	lockdep_hardirqs_on(CALLER_ADDR0);
-}
 
-static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
+static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 {
-	do {
-		local_irq_enable();
-
-		if (thread_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
-			schedule();
-
-		if (thread_flags & _TIF_UPROBE)
-			uprobe_notify_resume(regs);
-
-		if (thread_flags & _TIF_MTE_ASYNC_FAULT) {
-			clear_thread_flag(TIF_MTE_ASYNC_FAULT);
-			send_sig_fault(SIGSEGV, SEGV_MTEAERR,
-				       (void __user *)NULL, current);
-		}
-
-		if (thread_flags & _TIF_PATCH_PENDING)
-			klp_update_patch_state(current);
-
-		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-			do_signal(regs);
-
-		if (thread_flags & _TIF_NOTIFY_RESUME)
-			resume_user_mode_work(regs);
-
-		if (thread_flags & _TIF_FOREIGN_FPSTATE)
-			fpsimd_restore_current_state();
-
-		local_irq_disable();
-		thread_flags = read_thread_flags();
-	} while (thread_flags & _TIF_WORK_MASK);
-}
-
-static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long flags;
-
 	local_irq_disable();
-
-	flags = read_thread_flags();
-	if (unlikely(flags & _TIF_WORK_MASK))
-		do_notify_resume(regs, flags);
-
-	local_daif_mask();
-
-	lockdep_sys_exit();
-}
-
-static __always_inline void exit_to_user_mode(struct pt_regs *regs)
-{
 	exit_to_user_mode_prepare(regs);
+	local_daif_mask();
 	mte_check_tfsr_exit();
-	__exit_to_user_mode();
+	exit_to_user_mode();
 }
 
 asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
 {
-	exit_to_user_mode(regs);
-}
-
-/*
- * Handle IRQ/context state management when entering an NMI from user/kernel
- * mode. Before this function is called it is not safe to call regular kernel
- * code, instrumentable code, or any code which may trigger an exception.
- */
-static noinstr arm64_irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
-{
-	arm64_irqentry_state_t state;
-
-	state.lockdep = lockdep_hardirqs_enabled();
-
-	__nmi_enter();
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	lockdep_hardirq_enter();
-	ct_nmi_enter();
-
-	trace_hardirqs_off_finish();
-	ftrace_nmi_enter();
-
-	return state;
-}
-
-/*
- * Handle IRQ/context state management when exiting an NMI from user/kernel
- * mode. After this function returns it is not safe to call regular kernel
- * code, instrumentable code, or any code which may trigger an exception.
- */
-static void noinstr arm64_exit_nmi(struct pt_regs *regs,
-				   arm64_irqentry_state_t state)
-{
-	ftrace_nmi_exit();
-	if (state.lockdep) {
-		trace_hardirqs_on_prepare();
-		lockdep_hardirqs_on_prepare();
-	}
-
-	ct_nmi_exit();
-	lockdep_hardirq_exit();
-	if (state.lockdep)
-		lockdep_hardirqs_on(CALLER_ADDR0);
-	__nmi_exit();
+	arm64_exit_to_user_mode(regs);
 }
 
 /*
@@ -302,9 +116,9 @@ static void noinstr arm64_exit_nmi(struct pt_regs *regs,
  * kernel mode. Before this function is called it is not safe to call regular
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
-static noinstr arm64_irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
+static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state.lockdep = lockdep_hardirqs_enabled();
 
@@ -322,7 +136,7 @@ static noinstr arm64_irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
 static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
-				       arm64_irqentry_state_t state)
+				       irqentry_state_t state)
 {
 	if (state.lockdep) {
 		trace_hardirqs_on_prepare();
@@ -353,7 +167,7 @@ extern void (*handle_arch_fiq)(struct pt_regs *);
 static void noinstr __panic_unhandled(struct pt_regs *regs, const char *vector,
 				      unsigned long esr)
 {
-	arm64_enter_nmi(regs);
+	irqentry_nmi_enter(regs);
 
 	console_verbose();
 
@@ -504,7 +318,7 @@ UNHANDLED(el1t, 64, error)
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -516,7 +330,7 @@ static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -527,7 +341,7 @@ static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -538,7 +352,7 @@ static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -549,7 +363,7 @@ static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -560,7 +374,7 @@ static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -571,7 +385,7 @@ static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
@@ -582,7 +396,7 @@ static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = arm64_enter_el1_dbg(regs);
 	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
@@ -604,7 +418,7 @@ static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 {
 	/* Watchpoints are the only debug exception to write FAR_EL1 */
 	unsigned long far = read_sysreg(far_el1);
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
@@ -615,7 +429,7 @@ static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
@@ -626,7 +440,7 @@ static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
@@ -687,17 +501,17 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
 				       void (*handler)(struct pt_regs *))
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
-	state = arm64_enter_nmi(regs);
+	state = irqentry_nmi_enter(regs);
 	do_interrupt_handler(regs, handler);
-	arm64_exit_nmi(regs, state);
+	irqentry_nmi_exit(regs, state);
 }
 
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	state = enter_from_kernel_mode(regs);
 
@@ -731,22 +545,22 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
 	local_daif_restore(DAIF_ERRCTX);
-	state = arm64_enter_nmi(regs);
+	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
-	arm64_exit_nmi(regs, state);
+	irqentry_nmi_exit(regs, state);
 }
 
 static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_mem_abort(far, esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
@@ -761,50 +575,50 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
 	if (!is_ttbr0_addr(far))
 		arm64_apply_bp_hardening();
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_mem_abort(far, esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_fpsimd_acc(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_fpsimd_acc(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_sve_acc(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_sve_acc(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_sme_acc(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_sme_acc(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_fpsimd_exc(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_fpsimd_exc(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_sys(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_sys(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
@@ -814,58 +628,58 @@ static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
 	if (!is_ttbr0_addr(instruction_pointer(regs)))
 		arm64_apply_bp_hardening();
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_sp_pc_abort(far, esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_sp(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_sp_pc_abort(regs->sp, esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_undef(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_undef(regs, esr);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_bti(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_bti(regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_mops(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_mops(regs, esr);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_gcs(regs, esr);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_inv(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	bad_el0_sync(regs, 0, esr);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
@@ -873,12 +687,12 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 	if (!is_ttbr0_addr(regs->pc))
 		arm64_apply_bp_hardening();
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	debug_exception_enter(regs);
 	do_breakpoint(esr, regs);
 	debug_exception_exit(regs);
 	local_daif_restore(DAIF_PROCCTX);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
@@ -886,7 +700,7 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	if (!is_ttbr0_addr(regs->pc))
 		arm64_apply_bp_hardening();
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	/*
 	 * After handling a breakpoint, we suspend the breakpoint
 	 * and use single-step to move to the next instruction.
@@ -897,7 +711,7 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 		local_daif_restore(DAIF_PROCCTX);
 		do_el0_softstep(esr, regs);
 	}
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
@@ -905,39 +719,39 @@ static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
 	/* Watchpoints are the only debug exception to write FAR_EL1 */
 	unsigned long far = read_sysreg(far_el1);
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	debug_exception_enter(regs);
 	do_watchpoint(far, esr, regs);
 	debug_exception_exit(regs);
 	local_daif_restore(DAIF_PROCCTX);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_brk64(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc(regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 	fpsimd_syscall_exit();
 }
 
 static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_fpac(regs, esr);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
@@ -1011,7 +825,7 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
@@ -1022,7 +836,7 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr __el0_irq_handler_common(struct pt_regs *regs)
@@ -1048,15 +862,15 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_ERRCTX);
-	state = arm64_enter_nmi(regs);
+	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
-	arm64_exit_nmi(regs, state);
+	irqentry_nmi_exit(regs, state);
 	local_daif_restore(DAIF_PROCCTX);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
@@ -1067,27 +881,27 @@ asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
 #ifdef CONFIG_COMPAT
 static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_cp15(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc_compat(regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	local_daif_restore(DAIF_PROCCTX);
 	do_bkpt32(esr, regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
@@ -1166,7 +980,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 	unsigned long esr = read_sysreg(esr_el1);
 	unsigned long far = read_sysreg(far_el1);
 
-	arm64_enter_nmi(regs);
+	irqentry_nmi_enter(regs);
 	panic_bad_stack(regs, esr, far);
 }
 
@@ -1174,7 +988,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 asmlinkage noinstr unsigned long
 __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 {
-	arm64_irqentry_state_t state;
+	irqentry_state_t state;
 	unsigned long ret;
 
 	/*
@@ -1199,9 +1013,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	else if (cpu_has_pan())
 		set_pstate_pan(0);
 
-	state = arm64_enter_nmi(regs);
+	state = irqentry_nmi_enter(regs);
 	ret = do_sdei_event(regs, arg);
-	arm64_exit_nmi(regs, state);
+	irqentry_nmi_exit(regs, state);
 
 	return ret;
 }
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index db3f972f8cd9..1110eeb21f57 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -9,6 +9,7 @@
 #include <linux/cache.h>
 #include <linux/compat.h>
 #include <linux/errno.h>
+#include <linux/irq-entry-common.h>
 #include <linux/kernel.h>
 #include <linux/signal.h>
 #include <linux/freezer.h>
@@ -1576,7 +1577,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
  * the kernel can handle, and then we build all the user-level signal handling
  * stack-frames in one go after that.
  */
-void do_signal(struct pt_regs *regs)
+void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned long continue_addr = 0, restart_addr = 0;
 	int retval = 0;
-- 
2.34.1



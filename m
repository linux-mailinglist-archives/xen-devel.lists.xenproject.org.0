Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27969AFFDB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825929.1240344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HO8-0005hc-64; Fri, 25 Oct 2024 10:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825929.1240344; Fri, 25 Oct 2024 10:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HO8-0005fU-3S; Fri, 25 Oct 2024 10:17:48 +0000
Received: by outflank-mailman (input) for mailman id 825929;
 Fri, 25 Oct 2024 10:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFg-0000tn-Bu
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:09:04 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25deb8f1-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:09:01 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XZdjC6xFvzdkNq;
 Fri, 25 Oct 2024 18:06:23 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 2F0251800A5;
 Fri, 25 Oct 2024 18:08:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:53 +0800
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
X-Inumbo-ID: 25deb8f1-92b9-11ef-99a3-01e77a169b0f
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<mark.rutland@arm.com>, <catalin.marinas@arm.com>, <sstabellini@kernel.org>,
	<maz@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>, <arnd@arndb.de>,
	<ojeda@kernel.org>, <rppt@kernel.org>, <hca@linux.ibm.com>,
	<aliceryhl@google.com>, <samuel.holland@sifive.com>, <paulmck@kernel.org>,
	<aquini@redhat.com>, <petr.pavlu@suse.com>, <ruanjinjie@huawei.com>,
	<viro@zeniv.linux.org.uk>, <rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>,
	<linus.walleij@linaro.org>, <yangyj.ee@gmail.com>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>,
	<Jonathan.Cameron@huawei.com>, <prarit@redhat.com>, <liuwei09@cestc.cn>,
	<dwmw@amazon.co.uk>, <oliver.upton@linux.dev>, <kristina.martsenko@arm.com>,
	<ptosi@google.com>, <frederic@kernel.org>, <vschneid@redhat.com>,
	<thiago.bauermann@linaro.org>, <joey.gouly@arm.com>,
	<liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH -next v4 16/19] arm64: entry: Switch to generic IRQ entry
Date: Fri, 25 Oct 2024 18:06:57 +0800
Message-ID: <20241025100700.3714552-17-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
to use the generic entry infrastructure from kernel/entry/*.
The generic entry makes maintainers' work easier and codes
more elegant.

Switch arm64 to generic IRQ entry first, which removed duplicate 100+ LOC,
the next patch will switch arm64 to generic entry completely. Switch to
generic entry in two steps according to Mark's suggestion will make it
easier to review.

The changes are below:
 - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
   irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
   and wrap with generic enter_from/exit_to_user_mode(). The front
   patch 1 ~ 5 try to make it easier to make this switch. And the patch
   14 split the generic irq entry and generic syscall to make this patch
   more single and concentrated in switching to generic IRQ entry.

 - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit().

 - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
   if arm64 implement arch_irqentry_exit_need_resched(). The front patch
   6 ~ 13 and patch 15 try to make it closer to the generic implementation.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig                    |   1 +
 arch/arm64/include/asm/entry-common.h |  64 ++++++
 arch/arm64/include/asm/preempt.h      |   6 -
 arch/arm64/include/asm/ptrace.h       |   7 -
 arch/arm64/kernel/entry-common.c      | 303 ++++++--------------------
 arch/arm64/kernel/signal.c            |   3 +-
 6 files changed, 130 insertions(+), 254 deletions(-)
 create mode 100644 arch/arm64/include/asm/entry-common.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 232dcade2783..4545017cfd01 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -146,6 +146,7 @@ config ARM64
 	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
 	select GENERIC_IRQ_IPI
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
new file mode 100644
index 000000000000..1cc9d966a6c3
--- /dev/null
+++ b/arch/arm64/include/asm/entry-common.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_ARM64_ENTRY_COMMON_H
+#define _ASM_ARM64_ENTRY_COMMON_H
+
+#include <linux/thread_info.h>
+
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
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+	local_daif_mask();
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
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
diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0f0ba250efe8..932ea4b62042 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -2,7 +2,6 @@
 #ifndef __ASM_PREEMPT_H
 #define __ASM_PREEMPT_H
 
-#include <linux/jump_label.h>
 #include <linux/thread_info.h>
 
 #define PREEMPT_NEED_RESCHED	BIT(32)
@@ -85,22 +84,17 @@ static inline bool should_resched(int preempt_offset)
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
 #endif /* CONFIG_PREEMPTION */
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 5156c0d5fa20..f14c2adc239a 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -149,13 +149,6 @@ static inline unsigned long pstate_to_compat_psr(const unsigned long pstate)
 	return psr;
 }
 
-typedef struct irqentry_state {
-	union {
-		bool	exit_rcu;
-		bool	lockdep;
-	};
-} irqentry_state_t;
-
 /*
  * This struct defines the way the registers are stored on the stack during an
  * exception. struct user_pt_regs must form a prefix of struct pt_regs.
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 152216201f84..55fee0960fca 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/context_tracking.h>
+#include <linux/irq-entry-common.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
 #include <linux/lockdep.h>
@@ -38,71 +39,13 @@
  */
 static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
-	irqentry_state_t ret = {
-		.exit_rcu = false,
-	};
-
-	if (!IS_ENABLED(CONFIG_TINY_RCU) && is_idle_task(current)) {
-		lockdep_hardirqs_off(CALLER_ADDR0);
-		ct_irq_enter();
-		trace_hardirqs_off_finish();
-
-		ret.exit_rcu = true;
-		return ret;
-	}
-
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	rcu_irq_enter_check_tick();
-	trace_hardirqs_off_finish();
+	irqentry_state_t state = irqentry_enter(regs);
 
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
 
-	return ret;
-}
-
-static inline bool arm64_irqentry_exit_need_resched(void)
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
-void raw_irqentry_exit_cond_resched(void)
-{
-	if (!preempt_count()) {
-		if (need_resched() && arm64_irqentry_exit_need_resched())
-			preempt_schedule_irq();
-	}
-}
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-		return;
-	raw_irqentry_exit_cond_resched();
+	return state;
 }
-#endif
 
 /*
  * Handle IRQ/context state management when exiting to kernel mode.
@@ -116,26 +59,7 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 					irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-
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
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -143,127 +67,26 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	CT_WARN_ON(ct_state() != CT_STATE_USER);
-	user_exit_irqoff();
-	trace_hardirqs_off_finish();
+	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
 }
 
-/*
- * Handle IRQ/context state management when exiting to user mode.
- * After this function returns it is not safe to call regular kernel code,
- * instrumentable code, or any code which may trigger an exception.
- */
-static __always_inline void __exit_to_user_mode(void)
-{
-	trace_hardirqs_on_prepare();
-	lockdep_hardirqs_on_prepare();
-	user_enter_irqoff();
-	lockdep_hardirqs_on(CALLER_ADDR0);
-}
-
-static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
+static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 {
-	do {
-		local_irq_enable();
-
-		if (thread_flags & _TIF_NEED_RESCHED)
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
+	instrumentation_begin();
 	exit_to_user_mode_prepare(regs);
+	instrumentation_end();
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
-static noinstr irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
-{
-	irqentry_state_t irq_state;
-
-	irq_state.lockdep = lockdep_hardirqs_enabled();
-
-	__nmi_enter();
-	lockdep_hardirqs_off(CALLER_ADDR0);
-	lockdep_hardirq_enter();
-	ct_nmi_enter();
-
-	trace_hardirqs_off_finish();
-	ftrace_nmi_enter();
-
-	return irq_state;
-}
-
-/*
- * Handle IRQ/context state management when exiting an NMI from user/kernel
- * mode. After this function returns it is not safe to call regular kernel
- * code, instrumentable code, or any code which may trigger an exception.
- */
-static void noinstr arm64_exit_nmi(struct pt_regs *regs,
-				   irqentry_state_t irq_state)
-{
-	ftrace_nmi_exit();
-	if (irq_state.lockdep) {
-		trace_hardirqs_on_prepare();
-		lockdep_hardirqs_on_prepare();
-	}
-
-	ct_nmi_exit();
-	lockdep_hardirq_exit();
-	if (irq_state.lockdep)
-		lockdep_hardirqs_on(CALLER_ADDR0);
-	__nmi_exit();
+	arm64_exit_to_user_mode(regs);
 }
 
 /*
@@ -322,7 +145,7 @@ extern void (*handle_arch_fiq)(struct pt_regs *);
 static void noinstr __panic_unhandled(struct pt_regs *regs, const char *vector,
 				      unsigned long esr)
 {
-	arm64_enter_nmi(regs);
+	irqentry_nmi_enter(regs);
 
 	console_verbose();
 
@@ -556,10 +379,10 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
 				       void (*handler)(struct pt_regs *))
 {
-	irqentry_state_t state = arm64_enter_nmi(regs);
+	irqentry_state_t state = irqentry_nmi_enter(regs);
 
 	do_interrupt_handler(regs, handler);
-	arm64_exit_nmi(regs, state);
+	irqentry_nmi_exit(regs, state);
 }
 
 static __always_inline void __el1_irq(struct pt_regs *regs,
@@ -600,19 +423,19 @@ asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 	irqentry_state_t state;
 
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
@@ -627,50 +450,50 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
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
@@ -680,58 +503,58 @@ static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
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
 
 static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
@@ -739,28 +562,28 @@ static void noinstr el0_dbg(struct pt_regs *regs, unsigned long esr)
 	/* Only watchpoints write FAR_EL1, otherwise its UNKNOWN */
 	unsigned long far = read_sysreg(far_el1);
 
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	do_debug_exception(far, esr, regs);
 	local_daif_restore(DAIF_PROCCTX);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_svc(struct pt_regs *regs)
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fp_user_discard();
 	local_daif_restore(DAIF_PROCCTX);
 	do_el0_svc(regs);
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
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
@@ -828,7 +651,7 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	enter_from_user_mode(regs);
+	arm64_enter_from_user_mode(regs);
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
@@ -839,7 +662,7 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	exit_to_user_mode(regs);
+	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr __el0_irq_handler_common(struct pt_regs *regs)
@@ -867,13 +690,13 @@ static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 	unsigned long esr = read_sysreg(esr_el1);
 	irqentry_state_t state;
 
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
@@ -884,19 +707,19 @@ asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
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
 
 asmlinkage void noinstr el0t_32_sync_handler(struct pt_regs *regs)
@@ -970,7 +793,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 	unsigned long esr = read_sysreg(esr_el1);
 	unsigned long far = read_sysreg(far_el1);
 
-	arm64_enter_nmi(regs);
+	irqentry_nmi_enter(regs);
 	panic_bad_stack(regs, esr, far);
 }
 #endif /* CONFIG_VMAP_STACK */
@@ -1004,9 +827,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
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
index 2eb2e97a934f..04b20c2f6cda 100644
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
@@ -1540,7 +1541,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
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



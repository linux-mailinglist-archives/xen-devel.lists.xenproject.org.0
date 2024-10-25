Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D99AFFE8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825950.1240356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HQ1-0007EZ-Lw; Fri, 25 Oct 2024 10:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825950.1240356; Fri, 25 Oct 2024 10:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HQ1-0007BL-IO; Fri, 25 Oct 2024 10:19:45 +0000
Received: by outflank-mailman (input) for mailman id 825950;
 Fri, 25 Oct 2024 10:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFo-0000tn-1s
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:09:12 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2391d488-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:57 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XZdl229wbzQsFJ;
 Fri, 25 Oct 2024 18:07:58 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 5BF2B1800A5;
 Fri, 25 Oct 2024 18:08:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:50 +0800
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
X-Inumbo-ID: 2391d488-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 14/19] entry: Split into irq entry and syscall
Date: Fri, 25 Oct 2024 18:06:55 +0800
Message-ID: <20241025100700.3714552-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

As Mark pointed out, do not try to switch to *all* the
generic entry code in one go. The regular entry state management
(e.g. enter_from_user_mode() and exit_to_user_mode()) is largely
separate from the syscall state management. Move arm64 over to
enter_from_user_mode() and exit_to_user_mode() without needing to use
any of the generic syscall logic. Doing that first, *then* moving over
to the generic syscall handling would be much easier to
review/test/bisect, and if there are any ABI issues with the syscall
handling in particular, it will be easier to handle those in isolation.

So split generic entry into irq entry and syscall code, which will
make review work easier and switch to generic entry clear.

Introdue two configs called GENERIC_SYSCALL and GENERIC_IRQ_ENTRY,
which control the irq entry and syscall parts of the generic code
respectively. And split the header file irq-entry-common.h from
entry-common.h for GENERIC_IRQ_ENTRY.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 MAINTAINERS                      |   1 +
 arch/Kconfig                     |   8 +
 include/linux/entry-common.h     | 376 +----------------------------
 include/linux/irq-entry-common.h | 393 +++++++++++++++++++++++++++++++
 kernel/entry/Makefile            |   3 +-
 kernel/entry/common.c            | 159 +------------
 kernel/entry/syscall-common.c    | 159 +++++++++++++
 7 files changed, 565 insertions(+), 534 deletions(-)
 create mode 100644 include/linux/irq-entry-common.h
 create mode 100644 kernel/entry/syscall-common.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 72dce03be648..468d6e1a3228 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9531,6 +9531,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
 F:	include/linux/entry-common.h
 F:	include/linux/entry-kvm.h
+F:	include/linux/irq-entry-common.h
 F:	kernel/entry/
 
 GENERIC GPIO I2C DRIVER
diff --git a/arch/Kconfig b/arch/Kconfig
index feb50cfc4bdb..8e9c6f85960e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -64,8 +64,16 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config GENERIC_IRQ_ENTRY
+	bool
+
+config GENERIC_SYSCALL
+	bool
+
 config GENERIC_ENTRY
 	bool
+	select GENERIC_IRQ_ENTRY
+	select GENERIC_SYSCALL
 
 config KPROBES
 	bool "Kprobes"
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 1e50cdb83ae5..1ae3143d4b12 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_ENTRYCOMMON_H
 #define __LINUX_ENTRYCOMMON_H
 
+#include <linux/irq-entry-common.h>
 #include <linux/static_call_types.h>
 #include <linux/ptrace.h>
 #include <linux/syscalls.h>
@@ -15,14 +16,6 @@
 
 #include <asm/entry-common.h>
 
-/*
- * Define dummy _TIF work flags if not defined by the architecture or for
- * disabled functionality.
- */
-#ifndef _TIF_PATCH_PENDING
-# define _TIF_PATCH_PENDING		(0)
-#endif
-
 #ifndef _TIF_UPROBE
 # define _TIF_UPROBE			(0)
 #endif
@@ -55,68 +48,6 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
-/*
- * TIF flags handled in exit_to_user_mode_loop()
- */
-#ifndef ARCH_EXIT_TO_USER_MODE_WORK
-# define ARCH_EXIT_TO_USER_MODE_WORK		(0)
-#endif
-
-#define EXIT_TO_USER_MODE_WORK						\
-	(_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_UPROBE |		\
-	 _TIF_NEED_RESCHED | _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL |	\
-	 ARCH_EXIT_TO_USER_MODE_WORK)
-
-/**
- * arch_enter_from_user_mode - Architecture specific sanity check for user mode regs
- * @regs:	Pointer to currents pt_regs
- *
- * Defaults to an empty implementation. Can be replaced by architecture
- * specific code.
- *
- * Invoked from syscall_enter_from_user_mode() in the non-instrumentable
- * section. Use __always_inline so the compiler cannot push it out of line
- * and make it instrumentable.
- */
-static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs);
-
-#ifndef arch_enter_from_user_mode
-static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs) {}
-#endif
-
-/**
- * enter_from_user_mode - Establish state when coming from user mode
- *
- * Syscall/interrupt entry disables interrupts, but user mode is traced as
- * interrupts enabled. Also with NO_HZ_FULL RCU might be idle.
- *
- * 1) Tell lockdep that interrupts are disabled
- * 2) Invoke context tracking if enabled to reactivate RCU
- * 3) Trace interrupts off state
- *
- * Invoked from architecture specific syscall entry code with interrupts
- * disabled. The calling code has to be non-instrumentable. When the
- * function returns all state is correct and interrupts are still
- * disabled. The subsequent functions can be instrumented.
- *
- * This is invoked when there is architecture specific functionality to be
- * done between establishing state and enabling interrupts. The caller must
- * enable interrupts before invoking syscall_enter_from_user_mode_work().
- */
-static __always_inline void enter_from_user_mode(struct pt_regs *regs)
-{
-	arch_enter_from_user_mode(regs);
-	lockdep_hardirqs_off(CALLER_ADDR0);
-
-	CT_WARN_ON(__ct_state() != CT_STATE_USER);
-	user_exit_irqoff();
-
-	instrumentation_begin();
-	kmsan_unpoison_entry_regs(regs);
-	trace_hardirqs_off_finish();
-	instrumentation_end();
-}
-
 /**
  * syscall_enter_from_user_mode_prepare - Establish state and enable interrupts
  * @regs:	Pointer to currents pt_regs
@@ -201,170 +132,6 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
 	return ret;
 }
 
-/**
- * local_irq_enable_exit_to_user - Exit to user variant of local_irq_enable()
- * @ti_work:	Cached TIF flags gathered with interrupts disabled
- *
- * Defaults to local_irq_enable(). Can be supplied by architecture specific
- * code.
- */
-static inline void local_irq_enable_exit_to_user(unsigned long ti_work);
-
-#ifndef local_irq_enable_exit_to_user
-static inline void local_irq_enable_exit_to_user(unsigned long ti_work)
-{
-	local_irq_enable();
-}
-#endif
-
-/**
- * local_irq_disable_exit_to_user - Exit to user variant of local_irq_disable()
- *
- * Defaults to local_irq_disable(). Can be supplied by architecture specific
- * code.
- */
-static inline void local_irq_disable_exit_to_user(void);
-
-#ifndef local_irq_disable_exit_to_user
-static inline void local_irq_disable_exit_to_user(void)
-{
-	local_irq_disable();
-}
-#endif
-
-/**
- * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
- *				 to user mode.
- * @regs:	Pointer to currents pt_regs
- * @ti_work:	Cached TIF flags gathered with interrupts disabled
- *
- * Invoked from exit_to_user_mode_loop() with interrupt enabled
- *
- * Defaults to NOOP. Can be supplied by architecture specific code.
- */
-static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
-					       unsigned long ti_work);
-
-#ifndef arch_exit_to_user_mode_work
-static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
-					       unsigned long ti_work)
-{
-}
-#endif
-
-/**
- * arch_exit_to_user_mode_prepare - Architecture specific preparation for
- *				    exit to user mode.
- * @regs:	Pointer to currents pt_regs
- * @ti_work:	Cached TIF flags gathered with interrupts disabled
- *
- * Invoked from exit_to_user_mode_prepare() with interrupt disabled as the last
- * function before return. Defaults to NOOP.
- */
-static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
-						  unsigned long ti_work);
-
-#ifndef arch_exit_to_user_mode_prepare
-static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
-						  unsigned long ti_work)
-{
-}
-#endif
-
-/**
- * arch_exit_to_user_mode - Architecture specific final work before
- *			    exit to user mode.
- *
- * Invoked from exit_to_user_mode() with interrupt disabled as the last
- * function before return. Defaults to NOOP.
- *
- * This needs to be __always_inline because it is non-instrumentable code
- * invoked after context tracking switched to user mode.
- *
- * An architecture implementation must not do anything complex, no locking
- * etc. The main purpose is for speculation mitigations.
- */
-static __always_inline void arch_exit_to_user_mode(void);
-
-#ifndef arch_exit_to_user_mode
-static __always_inline void arch_exit_to_user_mode(void) { }
-#endif
-
-/**
- * arch_do_signal_or_restart -  Architecture specific signal delivery function
- * @regs:	Pointer to currents pt_regs
- *
- * Invoked from exit_to_user_mode_loop().
- */
-void arch_do_signal_or_restart(struct pt_regs *regs);
-
-/**
- * exit_to_user_mode_loop - do any pending work before leaving to user space
- */
-unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
-				     unsigned long ti_work);
-
-/**
- * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
- * @regs:	Pointer to pt_regs on entry stack
- *
- * 1) check that interrupts are disabled
- * 2) call tick_nohz_user_enter_prepare()
- * 3) call exit_to_user_mode_loop() if any flags from
- *    EXIT_TO_USER_MODE_WORK are set
- * 4) check that interrupts are still disabled
- */
-static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long ti_work;
-
-	lockdep_assert_irqs_disabled();
-
-	/* Flush pending rcuog wakeup before the last need_resched() check */
-	tick_nohz_user_enter_prepare();
-
-	ti_work = read_thread_flags();
-	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
-		ti_work = exit_to_user_mode_loop(regs, ti_work);
-
-	arch_exit_to_user_mode_prepare(regs, ti_work);
-
-	/* Ensure that kernel state is sane for a return to userspace */
-	kmap_assert_nomap();
-	lockdep_assert_irqs_disabled();
-	lockdep_sys_exit();
-}
-
-/**
- * exit_to_user_mode - Fixup state when exiting to user mode
- *
- * Syscall/interrupt exit enables interrupts, but the kernel state is
- * interrupts disabled when this is invoked. Also tell RCU about it.
- *
- * 1) Trace interrupts on state
- * 2) Invoke context tracking if enabled to adjust RCU state
- * 3) Invoke architecture specific last minute exit code, e.g. speculation
- *    mitigations, etc.: arch_exit_to_user_mode()
- * 4) Tell lockdep that interrupts are enabled
- *
- * Invoked from architecture specific code when syscall_exit_to_user_mode()
- * is not suitable as the last step before returning to userspace. Must be
- * invoked with interrupts disabled and the caller must be
- * non-instrumentable.
- * The caller has to invoke syscall_exit_to_user_mode_work() before this.
- */
-static __always_inline void exit_to_user_mode(void)
-{
-	instrumentation_begin();
-	trace_hardirqs_on_prepare();
-	lockdep_hardirqs_on_prepare();
-	instrumentation_end();
-
-	user_enter_irqoff();
-	arch_exit_to_user_mode();
-	lockdep_hardirqs_on(CALLER_ADDR0);
-}
-
 /**
  * syscall_exit_to_user_mode_work - Handle work before returning to user mode
  * @regs:	Pointer to currents pt_regs
@@ -411,145 +178,4 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs);
  */
 void syscall_exit_to_user_mode(struct pt_regs *regs);
 
-/**
- * irqentry_enter_from_user_mode - Establish state before invoking the irq handler
- * @regs:	Pointer to currents pt_regs
- *
- * Invoked from architecture specific entry code with interrupts disabled.
- * Can only be called when the interrupt entry came from user mode. The
- * calling code must be non-instrumentable.  When the function returns all
- * state is correct and the subsequent functions can be instrumented.
- *
- * The function establishes state (lockdep, RCU (context tracking), tracing)
- */
-void irqentry_enter_from_user_mode(struct pt_regs *regs);
-
-/**
- * irqentry_exit_to_user_mode - Interrupt exit work
- * @regs:	Pointer to current's pt_regs
- *
- * Invoked with interrupts disabled and fully valid regs. Returns with all
- * work handled, interrupts disabled such that the caller can immediately
- * switch to user mode. Called from architecture specific interrupt
- * handling code.
- *
- * The call order is #2 and #3 as described in syscall_exit_to_user_mode().
- * Interrupt exit is not invoking #1 which is the syscall specific one time
- * work.
- */
-void irqentry_exit_to_user_mode(struct pt_regs *regs);
-
-#ifndef irqentry_state
-/**
- * struct irqentry_state - Opaque object for exception state storage
- * @exit_rcu: Used exclusively in the irqentry_*() calls; signals whether the
- *            exit path has to invoke ct_irq_exit().
- * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
- *           lockdep state is restored correctly on exit from nmi.
- *
- * This opaque object is filled in by the irqentry_*_enter() functions and
- * must be passed back into the corresponding irqentry_*_exit() functions
- * when the exception is complete.
- *
- * Callers of irqentry_*_[enter|exit]() must consider this structure opaque
- * and all members private.  Descriptions of the members are provided to aid in
- * the maintenance of the irqentry_*() functions.
- */
-typedef struct irqentry_state {
-	union {
-		bool	exit_rcu;
-		bool	lockdep;
-	};
-} irqentry_state_t;
-#endif
-
-/**
- * irqentry_enter - Handle state tracking on ordinary interrupt entries
- * @regs:	Pointer to pt_regs of interrupted context
- *
- * Invokes:
- *  - lockdep irqflag state tracking as low level ASM entry disabled
- *    interrupts.
- *
- *  - Context tracking if the exception hit user mode.
- *
- *  - The hardirq tracer to keep the state consistent as low level ASM
- *    entry disabled interrupts.
- *
- * As a precondition, this requires that the entry came from user mode,
- * idle, or a kernel context in which RCU is watching.
- *
- * For kernel mode entries RCU handling is done conditional. If RCU is
- * watching then the only RCU requirement is to check whether the tick has
- * to be restarted. If RCU is not watching then ct_irq_enter() has to be
- * invoked on entry and ct_irq_exit() on exit.
- *
- * Avoiding the ct_irq_enter/exit() calls is an optimization but also
- * solves the problem of kernel mode pagefaults which can schedule, which
- * is not possible after invoking ct_irq_enter() without undoing it.
- *
- * For user mode entries irqentry_enter_from_user_mode() is invoked to
- * establish the proper context for NOHZ_FULL. Otherwise scheduling on exit
- * would not be possible.
- *
- * Returns: An opaque object that must be passed to idtentry_exit()
- */
-irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
-
-/**
- * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
- *
- * Conditional reschedule with additional sanity checks.
- */
-void raw_irqentry_exit_cond_resched(void);
-#ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
-#define irqentry_exit_cond_resched_dynamic_disabled	NULL
-DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
-#endif
-#else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
-#endif /* CONFIG_PREEMPT_DYNAMIC */
-
-/**
- * irqentry_exit - Handle return from exception that used irqentry_enter()
- * @regs:	Pointer to pt_regs (exception entry regs)
- * @state:	Return value from matching call to irqentry_enter()
- *
- * Depending on the return target (kernel/user) this runs the necessary
- * preemption and work checks if possible and required and returns to
- * the caller with interrupts disabled and no further work pending.
- *
- * This is the last action before returning to the low level ASM code which
- * just needs to return to the appropriate context.
- *
- * Counterpart to irqentry_enter().
- */
-void noinstr irqentry_exit(struct pt_regs *regs, irqentry_state_t state);
-
-/**
- * irqentry_nmi_enter - Handle NMI entry
- * @regs:	Pointer to currents pt_regs
- *
- * Similar to irqentry_enter() but taking care of the NMI constraints.
- */
-irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs);
-
-/**
- * irqentry_nmi_exit - Handle return from NMI handling
- * @regs:	Pointer to pt_regs (NMI entry regs)
- * @irq_state:	Return value from matching call to irqentry_nmi_enter()
- *
- * Last action before returning to the low level assembly code.
- *
- * Counterpart to irqentry_nmi_enter().
- */
-void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t irq_state);
-
 #endif
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
new file mode 100644
index 000000000000..b7d60a18f1a2
--- /dev/null
+++ b/include/linux/irq-entry-common.h
@@ -0,0 +1,393 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_IRQENTRYCOMMON_H
+#define __LINUX_IRQENTRYCOMMON_H
+
+#include <linux/static_call_types.h>
+#include <linux/ptrace.h>
+#include <linux/syscalls.h>
+#include <linux/seccomp.h>
+#include <linux/sched.h>
+#include <linux/context_tracking.h>
+#include <linux/livepatch.h>
+#include <linux/resume_user_mode.h>
+#include <linux/tick.h>
+#include <linux/kmsan.h>
+
+#include <asm/entry-common.h>
+
+/*
+ * Define dummy _TIF work flags if not defined by the architecture or for
+ * disabled functionality.
+ */
+#ifndef _TIF_PATCH_PENDING
+# define _TIF_PATCH_PENDING		(0)
+#endif
+
+/*
+ * TIF flags handled in exit_to_user_mode_loop()
+ */
+#ifndef ARCH_EXIT_TO_USER_MODE_WORK
+# define ARCH_EXIT_TO_USER_MODE_WORK		(0)
+#endif
+
+#define EXIT_TO_USER_MODE_WORK						\
+	(_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_UPROBE |		\
+	 _TIF_NEED_RESCHED | _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL |	\
+	 ARCH_EXIT_TO_USER_MODE_WORK)
+
+/**
+ * arch_enter_from_user_mode - Architecture specific sanity check for user mode regs
+ * @regs:	Pointer to currents pt_regs
+ *
+ * Defaults to an empty implementation. Can be replaced by architecture
+ * specific code.
+ *
+ * Invoked from syscall_enter_from_user_mode() in the non-instrumentable
+ * section. Use __always_inline so the compiler cannot push it out of line
+ * and make it instrumentable.
+ */
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs);
+
+#ifndef arch_enter_from_user_mode
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs) {}
+#endif
+
+/**
+ * enter_from_user_mode - Establish state when coming from user mode
+ *
+ * Syscall/interrupt entry disables interrupts, but user mode is traced as
+ * interrupts enabled. Also with NO_HZ_FULL RCU might be idle.
+ *
+ * 1) Tell lockdep that interrupts are disabled
+ * 2) Invoke context tracking if enabled to reactivate RCU
+ * 3) Trace interrupts off state
+ *
+ * Invoked from architecture specific syscall entry code with interrupts
+ * disabled. The calling code has to be non-instrumentable. When the
+ * function returns all state is correct and interrupts are still
+ * disabled. The subsequent functions can be instrumented.
+ *
+ * This is invoked when there is architecture specific functionality to be
+ * done between establishing state and enabling interrupts. The caller must
+ * enable interrupts before invoking syscall_enter_from_user_mode_work().
+ */
+static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+{
+	arch_enter_from_user_mode(regs);
+	lockdep_hardirqs_off(CALLER_ADDR0);
+
+	CT_WARN_ON(__ct_state() != CT_STATE_USER);
+	user_exit_irqoff();
+
+	instrumentation_begin();
+	kmsan_unpoison_entry_regs(regs);
+	trace_hardirqs_off_finish();
+	instrumentation_end();
+}
+
+/**
+ * local_irq_enable_exit_to_user - Exit to user variant of local_irq_enable()
+ * @ti_work:	Cached TIF flags gathered with interrupts disabled
+ *
+ * Defaults to local_irq_enable(). Can be supplied by architecture specific
+ * code.
+ */
+static inline void local_irq_enable_exit_to_user(unsigned long ti_work);
+
+#ifndef local_irq_enable_exit_to_user
+static inline void local_irq_enable_exit_to_user(unsigned long ti_work)
+{
+	local_irq_enable();
+}
+#endif
+
+/**
+ * local_irq_disable_exit_to_user - Exit to user variant of local_irq_disable()
+ *
+ * Defaults to local_irq_disable(). Can be supplied by architecture specific
+ * code.
+ */
+static inline void local_irq_disable_exit_to_user(void);
+
+#ifndef local_irq_disable_exit_to_user
+static inline void local_irq_disable_exit_to_user(void)
+{
+	local_irq_disable();
+}
+#endif
+
+/**
+ * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
+ *				 to user mode.
+ * @regs:	Pointer to currents pt_regs
+ * @ti_work:	Cached TIF flags gathered with interrupts disabled
+ *
+ * Invoked from exit_to_user_mode_loop() with interrupt enabled
+ *
+ * Defaults to NOOP. Can be supplied by architecture specific code.
+ */
+static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
+					       unsigned long ti_work);
+
+#ifndef arch_exit_to_user_mode_work
+static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
+					       unsigned long ti_work)
+{
+}
+#endif
+
+/**
+ * arch_exit_to_user_mode_prepare - Architecture specific preparation for
+ *				    exit to user mode.
+ * @regs:	Pointer to currents pt_regs
+ * @ti_work:	Cached TIF flags gathered with interrupts disabled
+ *
+ * Invoked from exit_to_user_mode_prepare() with interrupt disabled as the last
+ * function before return. Defaults to NOOP.
+ */
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work);
+
+#ifndef arch_exit_to_user_mode_prepare
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+}
+#endif
+
+/**
+ * arch_exit_to_user_mode - Architecture specific final work before
+ *			    exit to user mode.
+ *
+ * Invoked from exit_to_user_mode() with interrupt disabled as the last
+ * function before return. Defaults to NOOP.
+ *
+ * This needs to be __always_inline because it is non-instrumentable code
+ * invoked after context tracking switched to user mode.
+ *
+ * An architecture implementation must not do anything complex, no locking
+ * etc. The main purpose is for speculation mitigations.
+ */
+static __always_inline void arch_exit_to_user_mode(void);
+
+#ifndef arch_exit_to_user_mode
+static __always_inline void arch_exit_to_user_mode(void) { }
+#endif
+
+/**
+ * arch_do_signal_or_restart -  Architecture specific signal delivery function
+ * @regs:	Pointer to currents pt_regs
+ *
+ * Invoked from exit_to_user_mode_loop().
+ */
+void arch_do_signal_or_restart(struct pt_regs *regs);
+
+/**
+ * exit_to_user_mode_loop - do any pending work before leaving to user space
+ */
+unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
+				     unsigned long ti_work);
+
+/**
+ * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
+ * @regs:	Pointer to pt_regs on entry stack
+ *
+ * 1) check that interrupts are disabled
+ * 2) call tick_nohz_user_enter_prepare()
+ * 3) call exit_to_user_mode_loop() if any flags from
+ *    EXIT_TO_USER_MODE_WORK are set
+ * 4) check that interrupts are still disabled
+ */
+static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
+{
+	unsigned long ti_work;
+
+	lockdep_assert_irqs_disabled();
+
+	/* Flush pending rcuog wakeup before the last need_resched() check */
+	tick_nohz_user_enter_prepare();
+
+	ti_work = read_thread_flags();
+	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
+		ti_work = exit_to_user_mode_loop(regs, ti_work);
+
+	arch_exit_to_user_mode_prepare(regs, ti_work);
+
+	/* Ensure that kernel state is sane for a return to userspace */
+	kmap_assert_nomap();
+	lockdep_assert_irqs_disabled();
+	lockdep_sys_exit();
+}
+
+/**
+ * exit_to_user_mode - Fixup state when exiting to user mode
+ *
+ * Syscall/interrupt exit enables interrupts, but the kernel state is
+ * interrupts disabled when this is invoked. Also tell RCU about it.
+ *
+ * 1) Trace interrupts on state
+ * 2) Invoke context tracking if enabled to adjust RCU state
+ * 3) Invoke architecture specific last minute exit code, e.g. speculation
+ *    mitigations, etc.: arch_exit_to_user_mode()
+ * 4) Tell lockdep that interrupts are enabled
+ *
+ * Invoked from architecture specific code when syscall_exit_to_user_mode()
+ * is not suitable as the last step before returning to userspace. Must be
+ * invoked with interrupts disabled and the caller must be
+ * non-instrumentable.
+ * The caller has to invoke syscall_exit_to_user_mode_work() before this.
+ */
+static __always_inline void exit_to_user_mode(void)
+{
+	instrumentation_begin();
+	trace_hardirqs_on_prepare();
+	lockdep_hardirqs_on_prepare();
+	instrumentation_end();
+
+	user_enter_irqoff();
+	arch_exit_to_user_mode();
+	lockdep_hardirqs_on(CALLER_ADDR0);
+}
+
+/**
+ * irqentry_enter_from_user_mode - Establish state before invoking the irq handler
+ * @regs:	Pointer to currents pt_regs
+ *
+ * Invoked from architecture specific entry code with interrupts disabled.
+ * Can only be called when the interrupt entry came from user mode. The
+ * calling code must be non-instrumentable.  When the function returns all
+ * state is correct and the subsequent functions can be instrumented.
+ *
+ * The function establishes state (lockdep, RCU (context tracking), tracing)
+ */
+void irqentry_enter_from_user_mode(struct pt_regs *regs);
+
+/**
+ * irqentry_exit_to_user_mode - Interrupt exit work
+ * @regs:	Pointer to current's pt_regs
+ *
+ * Invoked with interrupts disabled and fully valid regs. Returns with all
+ * work handled, interrupts disabled such that the caller can immediately
+ * switch to user mode. Called from architecture specific interrupt
+ * handling code.
+ *
+ * The call order is #2 and #3 as described in syscall_exit_to_user_mode().
+ * Interrupt exit is not invoking #1 which is the syscall specific one time
+ * work.
+ */
+void irqentry_exit_to_user_mode(struct pt_regs *regs);
+
+#ifndef irqentry_state
+/**
+ * struct irqentry_state - Opaque object for exception state storage
+ * @exit_rcu: Used exclusively in the irqentry_*() calls; signals whether the
+ *            exit path has to invoke ct_irq_exit().
+ * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
+ *           lockdep state is restored correctly on exit from nmi.
+ *
+ * This opaque object is filled in by the irqentry_*_enter() functions and
+ * must be passed back into the corresponding irqentry_*_exit() functions
+ * when the exception is complete.
+ *
+ * Callers of irqentry_*_[enter|exit]() must consider this structure opaque
+ * and all members private.  Descriptions of the members are provided to aid in
+ * the maintenance of the irqentry_*() functions.
+ */
+typedef struct irqentry_state {
+	union {
+		bool	exit_rcu;
+		bool	lockdep;
+	};
+} irqentry_state_t;
+#endif
+
+/**
+ * irqentry_enter - Handle state tracking on ordinary interrupt entries
+ * @regs:	Pointer to pt_regs of interrupted context
+ *
+ * Invokes:
+ *  - lockdep irqflag state tracking as low level ASM entry disabled
+ *    interrupts.
+ *
+ *  - Context tracking if the exception hit user mode.
+ *
+ *  - The hardirq tracer to keep the state consistent as low level ASM
+ *    entry disabled interrupts.
+ *
+ * As a precondition, this requires that the entry came from user mode,
+ * idle, or a kernel context in which RCU is watching.
+ *
+ * For kernel mode entries RCU handling is done conditional. If RCU is
+ * watching then the only RCU requirement is to check whether the tick has
+ * to be restarted. If RCU is not watching then ct_irq_enter() has to be
+ * invoked on entry and ct_irq_exit() on exit.
+ *
+ * Avoiding the ct_irq_enter/exit() calls is an optimization but also
+ * solves the problem of kernel mode pagefaults which can schedule, which
+ * is not possible after invoking ct_irq_enter() without undoing it.
+ *
+ * For user mode entries irqentry_enter_from_user_mode() is invoked to
+ * establish the proper context for NOHZ_FULL. Otherwise scheduling on exit
+ * would not be possible.
+ *
+ * Returns: An opaque object that must be passed to idtentry_exit()
+ */
+irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
+
+/**
+ * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
+ *
+ * Conditional reschedule with additional sanity checks.
+ */
+void raw_irqentry_exit_cond_resched(void);
+#ifdef CONFIG_PREEMPT_DYNAMIC
+#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
+#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
+#define irqentry_exit_cond_resched_dynamic_disabled	NULL
+DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
+#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+void dynamic_irqentry_exit_cond_resched(void);
+#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+#endif
+#else /* CONFIG_PREEMPT_DYNAMIC */
+#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#endif /* CONFIG_PREEMPT_DYNAMIC */
+
+/**
+ * irqentry_exit - Handle return from exception that used irqentry_enter()
+ * @regs:	Pointer to pt_regs (exception entry regs)
+ * @state:	Return value from matching call to irqentry_enter()
+ *
+ * Depending on the return target (kernel/user) this runs the necessary
+ * preemption and work checks if possible and required and returns to
+ * the caller with interrupts disabled and no further work pending.
+ *
+ * This is the last action before returning to the low level ASM code which
+ * just needs to return to the appropriate context.
+ *
+ * Counterpart to irqentry_enter().
+ */
+void noinstr irqentry_exit(struct pt_regs *regs, irqentry_state_t state);
+
+/**
+ * irqentry_nmi_enter - Handle NMI entry
+ * @regs:	Pointer to currents pt_regs
+ *
+ * Similar to irqentry_enter() but taking care of the NMI constraints.
+ */
+irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs);
+
+/**
+ * irqentry_nmi_exit - Handle return from NMI handling
+ * @regs:	Pointer to pt_regs (NMI entry regs)
+ * @irq_state:	Return value from matching call to irqentry_nmi_enter()
+ *
+ * Last action before returning to the low level assembly code.
+ *
+ * Counterpart to irqentry_nmi_enter().
+ */
+void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t irq_state);
+
+#endif
diff --git a/kernel/entry/Makefile b/kernel/entry/Makefile
index 095c775e001e..d38f3a7e7396 100644
--- a/kernel/entry/Makefile
+++ b/kernel/entry/Makefile
@@ -9,5 +9,6 @@ KCOV_INSTRUMENT := n
 CFLAGS_REMOVE_common.o	 = -fstack-protector -fstack-protector-strong
 CFLAGS_common.o		+= -fno-stack-protector
 
-obj-$(CONFIG_GENERIC_ENTRY) 		+= common.o syscall_user_dispatch.o
+obj-$(CONFIG_GENERIC_IRQ_ENTRY) 	+= common.o
+obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o syscall_user_dispatch.o
 obj-$(CONFIG_KVM_XFER_TO_GUEST_WORK)	+= kvm.o
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 5b6934e23c21..2ad132c7be05 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -1,84 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/context_tracking.h>
-#include <linux/entry-common.h>
+#include <linux/irq-entry-common.h>
 #include <linux/resume_user_mode.h>
 #include <linux/highmem.h>
 #include <linux/jump_label.h>
 #include <linux/kmsan.h>
 #include <linux/livepatch.h>
-#include <linux/audit.h>
 #include <linux/tick.h>
 
-#include "common.h"
-
-#define CREATE_TRACE_POINTS
-#include <trace/events/syscalls.h>
-
-static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
-{
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
-
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
-}
-
-long syscall_trace_enter(struct pt_regs *regs, long syscall,
-				unsigned long work)
-{
-	long ret = 0;
-
-	/*
-	 * Handle Syscall User Dispatch.  This must comes first, since
-	 * the ABI here can be something that doesn't make sense for
-	 * other syscall_work features.
-	 */
-	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
-		if (syscall_user_dispatch(regs))
-			return -1L;
-	}
-
-	/* Handle ptrace */
-	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
-		ret = ptrace_report_syscall_entry(regs);
-		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
-			return -1L;
-	}
-
-	/* Do seccomp after ptrace, to catch any tracer changes. */
-	if (work & SYSCALL_WORK_SECCOMP) {
-		ret = __secure_computing(NULL);
-		if (ret == -1L)
-			return ret;
-	}
-
-	/* Either of the above might have changed the syscall number */
-	syscall = syscall_get_nr(current, regs);
-
-	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
-		trace_sys_enter(regs, syscall);
-		/*
-		 * Probes or BPF hooks in the tracepoint may have changed the
-		 * system call number as well.
-		 */
-		syscall = syscall_get_nr(current, regs);
-	}
-
-	syscall_enter_audit(regs, syscall);
-
-	return ret ? : syscall;
-}
-
-noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
-{
-	enter_from_user_mode(regs);
-	instrumentation_begin();
-	local_irq_enable();
-	instrumentation_end();
-}
-
 /* Workaround to allow gradual conversion of architecture code */
 void __weak arch_do_signal_or_restart(struct pt_regs *regs) { }
 
@@ -133,93 +63,6 @@ __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 	return ti_work;
 }
 
-/*
- * If SYSCALL_EMU is set, then the only reason to report is when
- * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
- * instruction has been already reported in syscall_enter_from_user_mode().
- */
-static inline bool report_single_step(unsigned long work)
-{
-	if (work & SYSCALL_WORK_SYSCALL_EMU)
-		return false;
-
-	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
-}
-
-static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
-{
-	bool step;
-
-	/*
-	 * If the syscall was rolled back due to syscall user dispatching,
-	 * then the tracers below are not invoked for the same reason as
-	 * the entry side was not invoked in syscall_trace_enter(): The ABI
-	 * of these syscalls is unknown.
-	 */
-	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
-		if (unlikely(current->syscall_dispatch.on_dispatch)) {
-			current->syscall_dispatch.on_dispatch = false;
-			return;
-		}
-	}
-
-	audit_syscall_exit(regs);
-
-	if (work & SYSCALL_WORK_SYSCALL_TRACEPOINT)
-		trace_sys_exit(regs, syscall_get_return_value(current, regs));
-
-	step = report_single_step(work);
-	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
-		ptrace_report_syscall_exit(regs, step);
-}
-
-/*
- * Syscall specific exit to user mode preparation. Runs with interrupts
- * enabled.
- */
-static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
-{
-	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
-	unsigned long nr = syscall_get_nr(current, regs);
-
-	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
-
-	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
-		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
-			local_irq_enable();
-	}
-
-	rseq_syscall(regs);
-
-	/*
-	 * Do one-time syscall specific work. If these work items are
-	 * enabled, we want to run them exactly once per syscall exit with
-	 * interrupts enabled.
-	 */
-	if (unlikely(work & SYSCALL_WORK_EXIT))
-		syscall_exit_work(regs, work);
-}
-
-static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	syscall_exit_to_user_mode_prepare(regs);
-	local_irq_disable_exit_to_user();
-	exit_to_user_mode_prepare(regs);
-}
-
-void syscall_exit_to_user_mode_work(struct pt_regs *regs)
-{
-	__syscall_exit_to_user_mode_work(regs);
-}
-
-__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
-{
-	instrumentation_begin();
-	__syscall_exit_to_user_mode_work(regs);
-	instrumentation_end();
-	exit_to_user_mode();
-}
-
 noinstr void irqentry_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
new file mode 100644
index 000000000000..0eb036986ad4
--- /dev/null
+++ b/kernel/entry/syscall-common.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/audit.h>
+#include <linux/entry-common.h>
+#include "common.h"
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/syscalls.h>
+
+static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
+{
+	if (unlikely(audit_context())) {
+		unsigned long args[6];
+
+		syscall_get_arguments(current, regs, args);
+		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+	}
+}
+
+long syscall_trace_enter(struct pt_regs *regs, long syscall,
+				unsigned long work)
+{
+	long ret = 0;
+
+	/*
+	 * Handle Syscall User Dispatch.  This must comes first, since
+	 * the ABI here can be something that doesn't make sense for
+	 * other syscall_work features.
+	 */
+	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
+		if (syscall_user_dispatch(regs))
+			return -1L;
+	}
+
+	/* Handle ptrace */
+	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
+		ret = ptrace_report_syscall_entry(regs);
+		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
+			return -1L;
+	}
+
+	/* Do seccomp after ptrace, to catch any tracer changes. */
+	if (work & SYSCALL_WORK_SECCOMP) {
+		ret = __secure_computing(NULL);
+		if (ret == -1L)
+			return ret;
+	}
+
+	/* Either of the above might have changed the syscall number */
+	syscall = syscall_get_nr(current, regs);
+
+	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
+		trace_sys_enter(regs, syscall);
+		/*
+		 * Probes or BPF hooks in the tracepoint may have changed the
+		 * system call number as well.
+		 */
+		syscall = syscall_get_nr(current, regs);
+	}
+
+	syscall_enter_audit(regs, syscall);
+
+	return ret ? : syscall;
+}
+
+noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
+{
+	enter_from_user_mode(regs);
+	instrumentation_begin();
+	local_irq_enable();
+	instrumentation_end();
+}
+
+/*
+ * If SYSCALL_EMU is set, then the only reason to report is when
+ * SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).  This syscall
+ * instruction has been already reported in syscall_enter_from_user_mode().
+ */
+static inline bool report_single_step(unsigned long work)
+{
+	if (work & SYSCALL_WORK_SYSCALL_EMU)
+		return false;
+
+	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
+}
+
+static void syscall_exit_work(struct pt_regs *regs, unsigned long work)
+{
+	bool step;
+
+	/*
+	 * If the syscall was rolled back due to syscall user dispatching,
+	 * then the tracers below are not invoked for the same reason as
+	 * the entry side was not invoked in syscall_trace_enter(): The ABI
+	 * of these syscalls is unknown.
+	 */
+	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
+		if (unlikely(current->syscall_dispatch.on_dispatch)) {
+			current->syscall_dispatch.on_dispatch = false;
+			return;
+		}
+	}
+
+	audit_syscall_exit(regs);
+
+	if (work & SYSCALL_WORK_SYSCALL_TRACEPOINT)
+		trace_sys_exit(regs, syscall_get_return_value(current, regs));
+
+	step = report_single_step(work);
+	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
+		ptrace_report_syscall_exit(regs, step);
+}
+
+/*
+ * Syscall specific exit to user mode preparation. Runs with interrupts
+ * enabled.
+ */
+static void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
+{
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
+	unsigned long nr = syscall_get_nr(current, regs);
+
+	CT_WARN_ON(ct_state() != CT_STATE_KERNEL);
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
+			local_irq_enable();
+	}
+
+	rseq_syscall(regs);
+
+	/*
+	 * Do one-time syscall specific work. If these work items are
+	 * enabled, we want to run them exactly once per syscall exit with
+	 * interrupts enabled.
+	 */
+	if (unlikely(work & SYSCALL_WORK_EXIT))
+		syscall_exit_work(regs, work);
+}
+
+static __always_inline void __syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode_prepare(regs);
+	local_irq_disable_exit_to_user();
+	exit_to_user_mode_prepare(regs);
+}
+
+void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	__syscall_exit_to_user_mode_work(regs);
+}
+
+__visible noinstr void syscall_exit_to_user_mode(struct pt_regs *regs)
+{
+	instrumentation_begin();
+	__syscall_exit_to_user_mode_work(regs);
+	instrumentation_end();
+	exit_to_user_mode();
+}
-- 
2.34.1



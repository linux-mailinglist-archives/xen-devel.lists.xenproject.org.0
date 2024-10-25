Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CD9AFF92
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825842.1240189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFT-0001kS-6A; Fri, 25 Oct 2024 10:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825842.1240189; Fri, 25 Oct 2024 10:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4HFT-0001ea-0Z; Fri, 25 Oct 2024 10:08:51 +0000
Received: by outflank-mailman (input) for mailman id 825842;
 Fri, 25 Oct 2024 10:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5hx=RV=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t4HFQ-0000tn-FM
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:08:48 +0000
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19c37b21-92b9-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:08:45 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XZdk639hWz1jvxH;
 Fri, 25 Oct 2024 18:07:10 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id DC0FB1401F1;
 Fri, 25 Oct 2024 18:08:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 25 Oct
 2024 18:08:34 +0800
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
X-Inumbo-ID: 19c37b21-92b9-11ef-99a3-01e77a169b0f
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
Subject: [PATCH -next v4 02/19] arm64: entry: Refactor the entry and exit for exceptions from EL1
Date: Fri, 25 Oct 2024 18:06:43 +0800
Message-ID: <20241025100700.3714552-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025100700.3714552-1-ruanjinjie@huawei.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)

These changes refactor the entry and exit routines for the exceptions
from EL1. They store the RCU and lockdep state in a struct
irqentry_state variable on the stack, rather than recording them
in the fields of pt_regs, since it is safe enough for these context.

Before:
	struct pt_regs {
		...
		u64 lockdep_hardirqs;
		u64 exit_rcu;
	}

	enter_from_kernel_mode(regs);
	...
	exit_to_kernel_mode(regs);

After:
	typedef struct irqentry_state {
		union {
			bool    exit_rcu;
			bool    lockdep;
		};
	} irqentry_state_t;

	irqentry_state_t state = enter_from_kernel_mode(regs);
	...
	exit_to_kernel_mode(regs, state);

No functional changes.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h  |  11 ++-
 arch/arm64/kernel/entry-common.c | 129 +++++++++++++++++++------------
 2 files changed, 85 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 3e5372a98da4..5156c0d5fa20 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -149,6 +149,13 @@ static inline unsigned long pstate_to_compat_psr(const unsigned long pstate)
 	return psr;
 }
 
+typedef struct irqentry_state {
+	union {
+		bool	exit_rcu;
+		bool	lockdep;
+	};
+} irqentry_state_t;
+
 /*
  * This struct defines the way the registers are stored on the stack during an
  * exception. struct user_pt_regs must form a prefix of struct pt_regs.
@@ -169,10 +176,6 @@ struct pt_regs {
 
 	u64 sdei_ttbr1;
 	struct frame_record_meta stackframe;
-
-	/* Only valid for some EL1 exceptions. */
-	u64 lockdep_hardirqs;
-	u64 exit_rcu;
 };
 
 /* For correct stack alignment, pt_regs has to be a multiple of 16 bytes. */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index c547e70428d3..68a9aecacdb9 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -36,29 +36,36 @@
  * This is intended to match the logic in irqentry_enter(), handling the kernel
  * mode transitions only.
  */
-static __always_inline void __enter_from_kernel_mode(struct pt_regs *regs)
+static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
 {
-	regs->exit_rcu = false;
+	irqentry_state_t ret = {
+		.exit_rcu = false,
+	};
 
 	if (!IS_ENABLED(CONFIG_TINY_RCU) && is_idle_task(current)) {
 		lockdep_hardirqs_off(CALLER_ADDR0);
 		ct_irq_enter();
 		trace_hardirqs_off_finish();
 
-		regs->exit_rcu = true;
-		return;
+		ret.exit_rcu = true;
+		return ret;
 	}
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	rcu_irq_enter_check_tick();
 	trace_hardirqs_off_finish();
+
+	return ret;
 }
 
-static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
+static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
-	__enter_from_kernel_mode(regs);
+	irqentry_state_t ret = __enter_from_kernel_mode(regs);
+
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
+
+	return ret;
 }
 
 /*
@@ -69,12 +76,13 @@ static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
  * This is intended to match the logic in irqentry_exit(), handling the kernel
  * mode transitions only, and with preemption handled elsewhere.
  */
-static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
+static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
+						  irqentry_state_t state)
 {
 	lockdep_assert_irqs_disabled();
 
 	if (!regs_irqs_disabled(regs)) {
-		if (regs->exit_rcu) {
+		if (state.exit_rcu) {
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
 			ct_irq_exit();
@@ -84,15 +92,16 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
 
 		trace_hardirqs_on();
 	} else {
-		if (regs->exit_rcu)
+		if (state.exit_rcu)
 			ct_irq_exit();
 	}
 }
 
-static void noinstr exit_to_kernel_mode(struct pt_regs *regs)
+static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
+					irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-	__exit_to_kernel_mode(regs);
+	__exit_to_kernel_mode(regs, state);
 }
 
 /*
@@ -190,9 +199,11 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
  * mode. Before this function is called it is not safe to call regular kernel
  * code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_enter_nmi(struct pt_regs *regs)
+static noinstr irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
 {
-	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
+	irqentry_state_t irq_state;
+
+	irq_state.lockdep = lockdep_hardirqs_enabled();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
@@ -201,6 +212,8 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
 
 	trace_hardirqs_off_finish();
 	ftrace_nmi_enter();
+
+	return irq_state;
 }
 
 /*
@@ -208,19 +221,18 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
  * mode. After this function returns it is not safe to call regular kernel
  * code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_exit_nmi(struct pt_regs *regs)
+static void noinstr arm64_exit_nmi(struct pt_regs *regs,
+				   irqentry_state_t irq_state)
 {
-	bool restore = regs->lockdep_hardirqs;
-
 	ftrace_nmi_exit();
-	if (restore) {
+	if (irq_state.lockdep) {
 		trace_hardirqs_on_prepare();
 		lockdep_hardirqs_on_prepare();
 	}
 
 	ct_nmi_exit();
 	lockdep_hardirq_exit();
-	if (restore)
+	if (irq_state.lockdep)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 	__nmi_exit();
 }
@@ -230,14 +242,18 @@ static void noinstr arm64_exit_nmi(struct pt_regs *regs)
  * kernel mode. Before this function is called it is not safe to call regular
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
+static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
+	irqentry_state_t state;
+
+	state.lockdep = lockdep_hardirqs_enabled();
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
 
 	trace_hardirqs_off_finish();
+
+	return state;
 }
 
 /*
@@ -245,17 +261,16 @@ static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
  * kernel mode. After this function returns it is not safe to call regular
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
+static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
+				       irqentry_state_t state)
 {
-	bool restore = regs->lockdep_hardirqs;
-
-	if (restore) {
+	if (state.lockdep) {
 		trace_hardirqs_on_prepare();
 		lockdep_hardirqs_on_prepare();
 	}
 
 	ct_nmi_exit();
-	if (restore)
+	if (state.lockdep)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
@@ -426,78 +441,86 @@ UNHANDLED(el1t, 64, error)
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	irqentry_state_t state;
 
-	enter_from_kernel_mode(regs);
+	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_mem_abort(far, esr, regs);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	irqentry_state_t state;
 
-	enter_from_kernel_mode(regs);
+	state = enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_sp_pc_abort(far, esr, regs);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_undef(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_bti(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_gcs(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_mops(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	irqentry_state_t state;
 
-	arm64_enter_el1_dbg(regs);
+	state = arm64_enter_el1_dbg(regs);
 	if (!cortex_a76_erratum_1463225_debug_handler(regs))
 		do_debug_exception(far, esr, regs);
-	arm64_exit_el1_dbg(regs);
+	arm64_exit_el1_dbg(regs, state);
 }
 
 static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_fpac(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
@@ -546,15 +569,16 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
 				       void (*handler)(struct pt_regs *))
 {
-	arm64_enter_nmi(regs);
+	irqentry_state_t state = arm64_enter_nmi(regs);
+
 	do_interrupt_handler(regs, handler);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 }
 
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
-	enter_from_kernel_mode(regs);
+	irqentry_state_t state = enter_from_kernel_mode(regs);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
@@ -562,7 +586,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 
 	arm64_preempt_schedule_irq();
 
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
@@ -588,11 +612,12 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	irqentry_state_t state;
 
 	local_daif_restore(DAIF_ERRCTX);
-	arm64_enter_nmi(regs);
+	state = arm64_enter_nmi(regs);
 	do_serror(regs, esr);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 }
 
 static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
@@ -855,12 +880,13 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	irqentry_state_t state;
 
 	enter_from_user_mode(regs);
 	local_daif_restore(DAIF_ERRCTX);
-	arm64_enter_nmi(regs);
+	state = arm64_enter_nmi(regs);
 	do_serror(regs, esr);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 	local_daif_restore(DAIF_PROCCTX);
 	exit_to_user_mode(regs);
 }
@@ -968,6 +994,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 asmlinkage noinstr unsigned long
 __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 {
+	irqentry_state_t state;
 	unsigned long ret;
 
 	/*
@@ -992,9 +1019,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 	else if (cpu_has_pan())
 		set_pstate_pan(0);
 
-	arm64_enter_nmi(regs);
+	state = arm64_enter_nmi(regs);
 	ret = do_sdei_event(regs, arg);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 
 	return ret;
 }
-- 
2.34.1



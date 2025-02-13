Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CEA33FBB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887449.1296947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYqe-0001Rl-Fd; Thu, 13 Feb 2025 13:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887449.1296947; Thu, 13 Feb 2025 13:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYqe-0001OU-BK; Thu, 13 Feb 2025 13:01:44 +0000
Received: by outflank-mailman (input) for mailman id 887449;
 Thu, 13 Feb 2025 13:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLs0=VE=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1tiYqc-0000vx-Al
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:01:42 +0000
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e55a6a-ea0a-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 14:01:40 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YtwGq42Jdz22mjb;
 Thu, 13 Feb 2025 20:58:43 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 8F0ED180042;
 Thu, 13 Feb 2025 21:01:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Feb
 2025 21:01:36 +0800
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
X-Inumbo-ID: a9e55a6a-ea0a-11ef-a075-877d107080fb
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <aliceryhl@google.com>,
	<ojeda@kernel.org>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mark.rutland@arm.com>, <puranjay@kernel.org>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <sudeep.holla@arm.com>, <guohanjun@huawei.com>,
	<prarit@redhat.com>, <liuwei09@cestc.cn>, <Jonathan.Cameron@huawei.com>,
	<dwmw@amazon.co.uk>, <kristina.martsenko@arm.com>, <liaochang1@huawei.com>,
	<ptosi@google.com>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<Dave.Martin@arm.com>, <joey.gouly@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 3/8] arm64: entry: Refactor the entry and exit for exceptions from EL1
Date: Thu, 13 Feb 2025 21:00:02 +0800
Message-ID: <20250213130007.1418890-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)

The generic entry code uses irqentry_state_t to track lockdep and RCU
state across exception entry and return. For historical reasons, arm64
embeds similar fields within its pt_regs structure.

In preparation for moving arm64 over to the generic entry code, pull
these fields out of arm64's pt_regs, and use a separate structure,
matching the style of the generic entry code.

No functional changes.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- irqentry_state_t -> arm64_irqentry_state_t.
---
 arch/arm64/include/asm/ptrace.h  |   4 -
 arch/arm64/kernel/entry-common.c | 136 +++++++++++++++++++------------
 2 files changed, 85 insertions(+), 55 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 8b915d4a9d4b..65b053a24d82 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -169,10 +169,6 @@ struct pt_regs {
 
 	u64 sdei_ttbr1;
 	struct frame_record_meta stackframe;
-
-	/* Only valid for some EL1 exceptions. */
-	u64 lockdep_hardirqs;
-	u64 exit_rcu;
 };
 
 /* For correct stack alignment, pt_regs has to be a multiple of 16 bytes. */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index c547e70428d3..8e597d32433d 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -28,6 +28,13 @@
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
 
+typedef struct irqentry_state {
+	union {
+		bool	exit_rcu;
+		bool	lockdep;
+	};
+} arm64_irqentry_state_t;
+
 /*
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel code,
@@ -36,29 +43,36 @@
  * This is intended to match the logic in irqentry_enter(), handling the kernel
  * mode transitions only.
  */
-static __always_inline void __enter_from_kernel_mode(struct pt_regs *regs)
+static __always_inline arm64_irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
 {
-	regs->exit_rcu = false;
+	arm64_irqentry_state_t state = {
+		.exit_rcu = false,
+	};
 
 	if (!IS_ENABLED(CONFIG_TINY_RCU) && is_idle_task(current)) {
 		lockdep_hardirqs_off(CALLER_ADDR0);
 		ct_irq_enter();
 		trace_hardirqs_off_finish();
 
-		regs->exit_rcu = true;
-		return;
+		state.exit_rcu = true;
+		return state;
 	}
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	rcu_irq_enter_check_tick();
 	trace_hardirqs_off_finish();
+
+	return state;
 }
 
-static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
+static noinstr arm64_irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
-	__enter_from_kernel_mode(regs);
+	arm64_irqentry_state_t state = __enter_from_kernel_mode(regs);
+
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
+
+	return state;
 }
 
 /*
@@ -69,12 +83,13 @@ static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
  * This is intended to match the logic in irqentry_exit(), handling the kernel
  * mode transitions only, and with preemption handled elsewhere.
  */
-static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
+static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
+						  arm64_irqentry_state_t state)
 {
 	lockdep_assert_irqs_disabled();
 
 	if (!regs_irqs_disabled(regs)) {
-		if (regs->exit_rcu) {
+		if (state.exit_rcu) {
 			trace_hardirqs_on_prepare();
 			lockdep_hardirqs_on_prepare();
 			ct_irq_exit();
@@ -84,15 +99,16 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
 
 		trace_hardirqs_on();
 	} else {
-		if (regs->exit_rcu)
+		if (state.exit_rcu)
 			ct_irq_exit();
 	}
 }
 
-static void noinstr exit_to_kernel_mode(struct pt_regs *regs)
+static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
+					arm64_irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-	__exit_to_kernel_mode(regs);
+	__exit_to_kernel_mode(regs, state);
 }
 
 /*
@@ -190,9 +206,11 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
  * mode. Before this function is called it is not safe to call regular kernel
  * code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_enter_nmi(struct pt_regs *regs)
+static noinstr arm64_irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
 {
-	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
+	arm64_irqentry_state_t state;
+
+	state.lockdep = lockdep_hardirqs_enabled();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
@@ -201,6 +219,8 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
 
 	trace_hardirqs_off_finish();
 	ftrace_nmi_enter();
+
+	return state;
 }
 
 /*
@@ -208,19 +228,18 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
  * mode. After this function returns it is not safe to call regular kernel
  * code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_exit_nmi(struct pt_regs *regs)
+static void noinstr arm64_exit_nmi(struct pt_regs *regs,
+				   arm64_irqentry_state_t state)
 {
-	bool restore = regs->lockdep_hardirqs;
-
 	ftrace_nmi_exit();
-	if (restore) {
+	if (state.lockdep) {
 		trace_hardirqs_on_prepare();
 		lockdep_hardirqs_on_prepare();
 	}
 
 	ct_nmi_exit();
 	lockdep_hardirq_exit();
-	if (restore)
+	if (state.lockdep)
 		lockdep_hardirqs_on(CALLER_ADDR0);
 	__nmi_exit();
 }
@@ -230,14 +249,18 @@ static void noinstr arm64_exit_nmi(struct pt_regs *regs)
  * kernel mode. Before this function is called it is not safe to call regular
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
+static noinstr arm64_irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
+	arm64_irqentry_state_t state;
+
+	state.lockdep = lockdep_hardirqs_enabled();
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
 
 	trace_hardirqs_off_finish();
+
+	return state;
 }
 
 /*
@@ -245,17 +268,16 @@ static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
  * kernel mode. After this function returns it is not safe to call regular
  * kernel code, instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
+static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
+				       arm64_irqentry_state_t state)
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
 
@@ -426,78 +448,86 @@ UNHANDLED(el1t, 64, error)
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	arm64_irqentry_state_t state;
 
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
+	arm64_irqentry_state_t state;
 
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
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
+	arm64_irqentry_state_t state;
 
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
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
+
 	local_daif_inherit(regs);
 	do_el1_fpac(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
@@ -546,15 +576,16 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
 				       void (*handler)(struct pt_regs *))
 {
-	arm64_enter_nmi(regs);
+	arm64_irqentry_state_t state = arm64_enter_nmi(regs);
+
 	do_interrupt_handler(regs, handler);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 }
 
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
-	enter_from_kernel_mode(regs);
+	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
@@ -562,7 +593,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 
 	arm64_preempt_schedule_irq();
 
-	exit_to_kernel_mode(regs);
+	exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
@@ -588,11 +619,12 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	arm64_irqentry_state_t state;
 
 	local_daif_restore(DAIF_ERRCTX);
-	arm64_enter_nmi(regs);
+	state = arm64_enter_nmi(regs);
 	do_serror(regs, esr);
-	arm64_exit_nmi(regs);
+	arm64_exit_nmi(regs, state);
 }
 
 static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
@@ -855,12 +887,13 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
 static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	arm64_irqentry_state_t state;
 
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
@@ -968,6 +1001,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 asmlinkage noinstr unsigned long
 __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
 {
+	arm64_irqentry_state_t state;
 	unsigned long ret;
 
 	/*
@@ -992,9 +1026,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
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



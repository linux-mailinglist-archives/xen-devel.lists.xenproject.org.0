Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458FA2EAA5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884742.1294485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thReb-0005wG-2A; Mon, 10 Feb 2025 11:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884742.1294485; Mon, 10 Feb 2025 11:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRea-0005u6-Vr; Mon, 10 Feb 2025 11:08:40 +0000
Received: by outflank-mailman (input) for mailman id 884742;
 Mon, 10 Feb 2025 11:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thReZ-0005u0-Vv
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:08:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5e4e2efd-e79f-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 12:08:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62CDA1BC0;
 Mon, 10 Feb 2025 03:08:55 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5D913F5A1;
 Mon, 10 Feb 2025 03:08:26 -0800 (PST)
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
X-Inumbo-ID: 5e4e2efd-e79f-11ef-b3ef-695165c68f79
Date: Mon, 10 Feb 2025 11:08:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 02/22] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
Message-ID: <Z6neKBGCcVmPBBQH@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-3-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:24PM +0800, Jinjie Ruan wrote:
> The generic entry code uses irqentry_state_t to track lockdep and RCU
> state across exception entry and return. For historical reasons, arm64
> embeds similar fields within its pt_regs structure.
> 
> In preparation for moving arm64 over to the generic entry code, pull
> these fields out of arm64's pt_regs, and use a separate structure,
> matching the style of the generic entry code.
> 
> No functional changes.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/ptrace.h  |   4 -
>  arch/arm64/kernel/entry-common.c | 136 +++++++++++++++++++------------
>  2 files changed, 85 insertions(+), 55 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index bcfa96880377..e90dfc9982aa 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -169,10 +169,6 @@ struct pt_regs {
>  
>  	u64 sdei_ttbr1;
>  	struct frame_record_meta stackframe;
> -
> -	/* Only valid for some EL1 exceptions. */
> -	u64 lockdep_hardirqs;
> -	u64 exit_rcu;
>  };
>  
>  /* For correct stack alignment, pt_regs has to be a multiple of 16 bytes. */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index c547e70428d3..1687627b2ecf 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -28,6 +28,13 @@
>  #include <asm/sysreg.h>
>  #include <asm/system_misc.h>
>  
> +typedef struct irqentry_state {
> +	union {
> +		bool	exit_rcu;
> +		bool	lockdep;
> +	};
> +} irqentry_state_t;

I think we should add an arm64_ prefix here, to avoid the possiblity of
build errors if we somehow get this and the common definition included
at the same time.

That'll require some simple changes when we switch over, but it should
be relatively obvious and simple.

Otherwise, the structural changes look good to me.

Mark.

> +
>  /*
>   * Handle IRQ/context state management when entering from kernel mode.
>   * Before this function is called it is not safe to call regular kernel code,
> @@ -36,29 +43,36 @@
>   * This is intended to match the logic in irqentry_enter(), handling the kernel
>   * mode transitions only.
>   */
> -static __always_inline void __enter_from_kernel_mode(struct pt_regs *regs)
> +static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
>  {
> -	regs->exit_rcu = false;
> +	irqentry_state_t state = {
> +		.exit_rcu = false,
> +	};
>  
>  	if (!IS_ENABLED(CONFIG_TINY_RCU) && is_idle_task(current)) {
>  		lockdep_hardirqs_off(CALLER_ADDR0);
>  		ct_irq_enter();
>  		trace_hardirqs_off_finish();
>  
> -		regs->exit_rcu = true;
> -		return;
> +		state.exit_rcu = true;
> +		return state;
>  	}
>  
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  	rcu_irq_enter_check_tick();
>  	trace_hardirqs_off_finish();
> +
> +	return state;
>  }
>  
> -static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
> +static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  {
> -	__enter_from_kernel_mode(regs);
> +	irqentry_state_t state = __enter_from_kernel_mode(regs);
> +
>  	mte_check_tfsr_entry();
>  	mte_disable_tco_entry(current);
> +
> +	return state;
>  }
>  
>  /*
> @@ -69,12 +83,13 @@ static void noinstr enter_from_kernel_mode(struct pt_regs *regs)
>   * This is intended to match the logic in irqentry_exit(), handling the kernel
>   * mode transitions only, and with preemption handled elsewhere.
>   */
> -static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
> +static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
> +						  irqentry_state_t state)
>  {
>  	lockdep_assert_irqs_disabled();
>  
>  	if (!regs_irqs_disabled(regs)) {
> -		if (regs->exit_rcu) {
> +		if (state.exit_rcu) {
>  			trace_hardirqs_on_prepare();
>  			lockdep_hardirqs_on_prepare();
>  			ct_irq_exit();
> @@ -84,15 +99,16 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
>  
>  		trace_hardirqs_on();
>  	} else {
> -		if (regs->exit_rcu)
> +		if (state.exit_rcu)
>  			ct_irq_exit();
>  	}
>  }
>  
> -static void noinstr exit_to_kernel_mode(struct pt_regs *regs)
> +static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
> +					irqentry_state_t state)
>  {
>  	mte_check_tfsr_exit();
> -	__exit_to_kernel_mode(regs);
> +	__exit_to_kernel_mode(regs, state);
>  }
>  
>  /*
> @@ -190,9 +206,11 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>   * mode. Before this function is called it is not safe to call regular kernel
>   * code, instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_enter_nmi(struct pt_regs *regs)
> +static noinstr irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
>  {
> -	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
> +	irqentry_state_t state;
> +
> +	state.lockdep = lockdep_hardirqs_enabled();
>  
>  	__nmi_enter();
>  	lockdep_hardirqs_off(CALLER_ADDR0);
> @@ -201,6 +219,8 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
>  
>  	trace_hardirqs_off_finish();
>  	ftrace_nmi_enter();
> +
> +	return state;
>  }
>  
>  /*
> @@ -208,19 +228,18 @@ static void noinstr arm64_enter_nmi(struct pt_regs *regs)
>   * mode. After this function returns it is not safe to call regular kernel
>   * code, instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_exit_nmi(struct pt_regs *regs)
> +static void noinstr arm64_exit_nmi(struct pt_regs *regs,
> +				   irqentry_state_t state)
>  {
> -	bool restore = regs->lockdep_hardirqs;
> -
>  	ftrace_nmi_exit();
> -	if (restore) {
> +	if (state.lockdep) {
>  		trace_hardirqs_on_prepare();
>  		lockdep_hardirqs_on_prepare();
>  	}
>  
>  	ct_nmi_exit();
>  	lockdep_hardirq_exit();
> -	if (restore)
> +	if (state.lockdep)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  	__nmi_exit();
>  }
> @@ -230,14 +249,18 @@ static void noinstr arm64_exit_nmi(struct pt_regs *regs)
>   * kernel mode. Before this function is called it is not safe to call regular
>   * kernel code, instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
> +static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
>  {
> -	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
> +	irqentry_state_t state;
> +
> +	state.lockdep = lockdep_hardirqs_enabled();
>  
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  	ct_nmi_enter();
>  
>  	trace_hardirqs_off_finish();
> +
> +	return state;
>  }
>  
>  /*
> @@ -245,17 +268,16 @@ static void noinstr arm64_enter_el1_dbg(struct pt_regs *regs)
>   * kernel mode. After this function returns it is not safe to call regular
>   * kernel code, instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
> +static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
> +				       irqentry_state_t state)
>  {
> -	bool restore = regs->lockdep_hardirqs;
> -
> -	if (restore) {
> +	if (state.lockdep) {
>  		trace_hardirqs_on_prepare();
>  		lockdep_hardirqs_on_prepare();
>  	}
>  
>  	ct_nmi_exit();
> -	if (restore)
> +	if (state.lockdep)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  }
>  
> @@ -426,78 +448,86 @@ UNHANDLED(el1t, 64, error)
>  static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long far = read_sysreg(far_el1);
> +	irqentry_state_t state;
>  
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_mem_abort(far, esr, regs);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long far = read_sysreg(far_el1);
> +	irqentry_state_t state;
>  
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_sp_pc_abort(far, esr, regs);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_undef(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_bti(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_gcs(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_mops(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long far = read_sysreg(far_el1);
> +	irqentry_state_t state;
>  
> -	arm64_enter_el1_dbg(regs);
> +	state = arm64_enter_el1_dbg(regs);
>  	if (!cortex_a76_erratum_1463225_debug_handler(regs))
>  		do_debug_exception(far, esr, regs);
> -	arm64_exit_el1_dbg(regs);
> +	arm64_exit_el1_dbg(regs, state);
>  }
>  
>  static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_fpac(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
> @@ -546,15 +576,16 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  static __always_inline void __el1_pnmi(struct pt_regs *regs,
>  				       void (*handler)(struct pt_regs *))
>  {
> -	arm64_enter_nmi(regs);
> +	irqentry_state_t state = arm64_enter_nmi(regs);
> +
>  	do_interrupt_handler(regs, handler);
> -	arm64_exit_nmi(regs);
> +	arm64_exit_nmi(regs, state);
>  }
>  
>  static __always_inline void __el1_irq(struct pt_regs *regs,
>  				      void (*handler)(struct pt_regs *))
>  {
> -	enter_from_kernel_mode(regs);
> +	irqentry_state_t state = enter_from_kernel_mode(regs);
>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
> @@ -562,7 +593,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  
>  	arm64_preempt_schedule_irq();
>  
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
> @@ -588,11 +619,12 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
>  asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>  {
>  	unsigned long esr = read_sysreg(esr_el1);
> +	irqentry_state_t state;
>  
>  	local_daif_restore(DAIF_ERRCTX);
> -	arm64_enter_nmi(regs);
> +	state = arm64_enter_nmi(regs);
>  	do_serror(regs, esr);
> -	arm64_exit_nmi(regs);
> +	arm64_exit_nmi(regs, state);
>  }
>  
>  static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
> @@ -855,12 +887,13 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
>  static void noinstr __el0_error_handler_common(struct pt_regs *regs)
>  {
>  	unsigned long esr = read_sysreg(esr_el1);
> +	irqentry_state_t state;
>  
>  	enter_from_user_mode(regs);
>  	local_daif_restore(DAIF_ERRCTX);
> -	arm64_enter_nmi(regs);
> +	state = arm64_enter_nmi(regs);
>  	do_serror(regs, esr);
> -	arm64_exit_nmi(regs);
> +	arm64_exit_nmi(regs, state);
>  	local_daif_restore(DAIF_PROCCTX);
>  	exit_to_user_mode(regs);
>  }
> @@ -968,6 +1001,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
>  asmlinkage noinstr unsigned long
>  __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  {
> +	irqentry_state_t state;
>  	unsigned long ret;
>  
>  	/*
> @@ -992,9 +1026,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  	else if (cpu_has_pan())
>  		set_pstate_pan(0);
>  
> -	arm64_enter_nmi(regs);
> +	state = arm64_enter_nmi(regs);
>  	ret = do_sdei_event(regs, arg);
> -	arm64_exit_nmi(regs);
> +	arm64_exit_nmi(regs, state);
>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 


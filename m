Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C507B22525
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078628.1439652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulml8-0003hw-Tk; Tue, 12 Aug 2025 11:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078628.1439652; Tue, 12 Aug 2025 11:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulml8-0003fe-R9; Tue, 12 Aug 2025 11:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1078628;
 Tue, 12 Aug 2025 11:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UlY3=2Y=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1ulml6-0003fY-SD
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:01:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b61a3e4b-776b-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 13:01:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 488E525E1;
 Tue, 12 Aug 2025 04:01:26 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6A743F63F;
 Tue, 12 Aug 2025 04:01:30 -0700 (PDT)
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
X-Inumbo-ID: b61a3e4b-776b-11f0-a327-13f23c93f187
Date: Tue, 12 Aug 2025 12:01:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, puranjay@kernel.org, broonie@kernel.org,
	mbenes@suse.cz, ryan.roberts@arm.com, akpm@linux-foundation.org,
	chenl311@chinatelecom.cn, ada.coupriediaz@arm.com,
	anshuman.khandual@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, ardb@kernel.org, leitao@debian.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
Message-ID: <aJsfB3DJCduz6lzx@J2N7QTR9R3>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729015456.3411143-3-ruanjinjie@huawei.com>

Hi Jinjie,

On Tue, Jul 29, 2025 at 09:54:51AM +0800, Jinjie Ruan wrote:
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

One minor formatting nit below, but with aside from that this looks
great, and with that fixed up:

Acked-by: Mark Rutland <mark.rutland@arm.com>

[...]

> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>  static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  {
>  	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
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
> +	arm64_irqentry_state_t state;
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
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_undef(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }

I'd prefer if we consistently defined 'state' on a separate line, before
the main block consisting of:

	state = enter_from_kernel_mode(regs);
	local_daif_inherit(regs);
	do_el1_undef(regs, esr);
	local_daif_mask();
	exit_to_kernel_mode(regs, state);

... since that way the enter/exit functions clearly enclose the whole
block, which isn't as clear when there's a line gap between
enter_from_kernel_mode() and the rest of the block.

That would also be more consistent with what we do for functions that
need to read other registers (e.g. el1_abort() and el1_pc() above).

If that could be applied consistently here and below, that'd be great.

Mark.

>  static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
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
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_mops(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
>  {
> -	arm64_enter_el1_dbg(regs);
> +	arm64_irqentry_state_t state = arm64_enter_el1_dbg(regs);
> +
>  	debug_exception_enter(regs);
>  	do_breakpoint(esr, regs);
>  	debug_exception_exit(regs);
> -	arm64_exit_el1_dbg(regs);
> +	arm64_exit_el1_dbg(regs, state);
>  }
>  
>  static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  {
> -	arm64_enter_el1_dbg(regs);
> +	arm64_irqentry_state_t state = arm64_enter_el1_dbg(regs);
> +
>  	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
>  		debug_exception_enter(regs);
>  		/*
> @@ -554,37 +584,40 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
>  			do_el1_softstep(esr, regs);
>  		debug_exception_exit(regs);
>  	}
> -	arm64_exit_el1_dbg(regs);
> +	arm64_exit_el1_dbg(regs, state);
>  }
>  
>  static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
>  {
>  	/* Watchpoints are the only debug exception to write FAR_EL1 */
>  	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
>  
> -	arm64_enter_el1_dbg(regs);
> +	state = arm64_enter_el1_dbg(regs);
>  	debug_exception_enter(regs);
>  	do_watchpoint(far, esr, regs);
>  	debug_exception_exit(regs);
> -	arm64_exit_el1_dbg(regs);
> +	arm64_exit_el1_dbg(regs, state);
>  }
>  
>  static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
>  {
> -	arm64_enter_el1_dbg(regs);
> +	arm64_irqentry_state_t state = arm64_enter_el1_dbg(regs);
> +
>  	debug_exception_enter(regs);
>  	do_el1_brk64(esr, regs);
>  	debug_exception_exit(regs);
> -	arm64_exit_el1_dbg(regs);
> +	arm64_exit_el1_dbg(regs, state);
>  }
>  
>  static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
>  {
> -	enter_from_kernel_mode(regs);
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>  	local_daif_inherit(regs);
>  	do_el1_fpac(regs, esr);
>  	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  
>  asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
> @@ -639,15 +672,16 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
>  static __always_inline void __el1_pnmi(struct pt_regs *regs,
>  				       void (*handler)(struct pt_regs *))
>  {
> -	arm64_enter_nmi(regs);
> +	arm64_irqentry_state_t state = arm64_enter_nmi(regs);
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
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
>  
>  	irq_enter_rcu();
>  	do_interrupt_handler(regs, handler);
> @@ -655,7 +689,7 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  
>  	arm64_preempt_schedule_irq();
>  
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
>  				  void (*handler)(struct pt_regs *))
> @@ -681,11 +715,12 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
>  asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
>  {
>  	unsigned long esr = read_sysreg(esr_el1);
> +	arm64_irqentry_state_t state;
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
> @@ -997,12 +1032,13 @@ asmlinkage void noinstr el0t_64_fiq_handler(struct pt_regs *regs)
>  static void noinstr __el0_error_handler_common(struct pt_regs *regs)
>  {
>  	unsigned long esr = read_sysreg(esr_el1);
> +	arm64_irqentry_state_t state;
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
> @@ -1122,6 +1158,7 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
>  asmlinkage noinstr unsigned long
>  __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
>  {
> +	arm64_irqentry_state_t state;
>  	unsigned long ret;
>  
>  	/*
> @@ -1146,9 +1183,9 @@ __sdei_handler(struct pt_regs *regs, struct sdei_registered_event *arg)
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


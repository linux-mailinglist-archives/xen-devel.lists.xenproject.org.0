Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF1A2EA76
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884726.1294475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRaZ-000518-Dc; Mon, 10 Feb 2025 11:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884726.1294475; Mon, 10 Feb 2025 11:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRaZ-0004zF-Ah; Mon, 10 Feb 2025 11:04:31 +0000
Received: by outflank-mailman (input) for mailman id 884726;
 Mon, 10 Feb 2025 11:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thRaX-0004ZC-T1
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:04:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cbda6f78-e79e-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:04:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58111007;
 Mon, 10 Feb 2025 03:04:49 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347353F5A1;
 Mon, 10 Feb 2025 03:04:21 -0800 (PST)
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
X-Inumbo-ID: cbda6f78-e79e-11ef-a075-877d107080fb
Date: Mon, 10 Feb 2025 11:04:15 +0000
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
Subject: Re: [PATCH -next v5 01/22] arm64: ptrace: Replace
 interrupts_enabled() with regs_irqs_disabled()
Message-ID: <Z6nc_itA5KT1Gk2i@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-2-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:23PM +0800, Jinjie Ruan wrote:
> The generic entry code expects architecture code to provide
> regs_irqs_disabled(regs) function, but arm64 does not have this and
> provides inerrupts_enabled(regs), which has the opposite polarity.
> 
> In preparation for moving arm64 over to the generic entry code,
> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
> update its callers under arch/arm64.
> 
> For the moment, a definition of interrupts_enabled() is provided for
> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
> can be removed.
> 
> No functional changes.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/daifflags.h  | 2 +-
>  arch/arm64/include/asm/ptrace.h     | 7 +++++++
>  arch/arm64/include/asm/xen/events.h | 2 +-
>  arch/arm64/kernel/acpi.c            | 2 +-
>  arch/arm64/kernel/debug-monitors.c  | 2 +-
>  arch/arm64/kernel/entry-common.c    | 4 ++--
>  arch/arm64/kernel/sdei.c            | 2 +-
>  7 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> index fbb5c99eb2f9..5fca48009043 100644
> --- a/arch/arm64/include/asm/daifflags.h
> +++ b/arch/arm64/include/asm/daifflags.h
> @@ -128,7 +128,7 @@ static inline void local_daif_inherit(struct pt_regs *regs)
>  {
>  	unsigned long flags = regs->pstate & DAIF_MASK;
>  
> -	if (interrupts_enabled(regs))
> +	if (!regs_irqs_disabled(regs))
>  		trace_hardirqs_on();
>  
>  	if (system_uses_irq_prio_masking())
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 47ff8654c5ec..bcfa96880377 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -214,9 +214,16 @@ static inline void forget_syscall(struct pt_regs *regs)
>  		(regs)->pmr == GIC_PRIO_IRQON :				\
>  		true)
>  
> +/*
> + * Used by the GICv3 driver, can be removed once arch/arm implements
> + * regs_irqs_disabled() directly.
> + */
>  #define interrupts_enabled(regs)			\
>  	(!((regs)->pstate & PSR_I_BIT) && irqs_priority_unmasked(regs))
>  
> +#define regs_irqs_disabled(regs)			\
> +	(((regs)->pstate & PSR_I_BIT) || (!irqs_priority_unmasked(regs)))

Please make this:

| static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
| {
| 	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
| }
| 
| #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))

That way this matches the style of x86 and s390, and with
interrupts_enabled() defined in terms of regs_irqs_disabled(), the two
cannot accidentaly diverge.

>  #define fast_interrupts_enabled(regs) \
>  	(!((regs)->pstate & PSR_F_BIT))

We should probably delete this at the same time; it's unused and we
don't want any new users to show up.

With those changes:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

>  
> diff --git a/arch/arm64/include/asm/xen/events.h b/arch/arm64/include/asm/xen/events.h
> index 2788e95d0ff0..2977b5fe068d 100644
> --- a/arch/arm64/include/asm/xen/events.h
> +++ b/arch/arm64/include/asm/xen/events.h
> @@ -14,7 +14,7 @@ enum ipi_vector {
>  
>  static inline int xen_irqs_disabled(struct pt_regs *regs)
>  {
> -	return !interrupts_enabled(regs);
> +	return regs_irqs_disabled(regs);
>  }
>  
>  #define xchg_xen_ulong(ptr, val) xchg((ptr), (val))
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index e6f66491fbe9..732f89daae23 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -403,7 +403,7 @@ int apei_claim_sea(struct pt_regs *regs)
>  	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
>  
>  	if (regs)
> -		return_to_irqs_enabled = interrupts_enabled(regs);
> +		return_to_irqs_enabled = !regs_irqs_disabled(regs);
>  
>  	/*
>  	 * SEA can interrupt SError, mask it and describe this as an NMI so
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..460c09d03a73 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -231,7 +231,7 @@ static void send_user_sigtrap(int si_code)
>  	if (WARN_ON(!user_mode(regs)))
>  		return;
>  
> -	if (interrupts_enabled(regs))
> +	if (!regs_irqs_disabled(regs))
>  		local_irq_enable();
>  
>  	arm64_force_sig_fault(SIGTRAP, si_code, instruction_pointer(regs),
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..c547e70428d3 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -73,7 +73,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
>  {
>  	lockdep_assert_irqs_disabled();
>  
> -	if (interrupts_enabled(regs)) {
> +	if (!regs_irqs_disabled(regs)) {
>  		if (regs->exit_rcu) {
>  			trace_hardirqs_on_prepare();
>  			lockdep_hardirqs_on_prepare();
> @@ -569,7 +569,7 @@ static void noinstr el1_interrupt(struct pt_regs *regs,
>  {
>  	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
>  
> -	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && !interrupts_enabled(regs))
> +	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
>  		__el1_pnmi(regs, handler);
>  	else
>  		__el1_irq(regs, handler);
> diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
> index 255d12f881c2..27a17da635d8 100644
> --- a/arch/arm64/kernel/sdei.c
> +++ b/arch/arm64/kernel/sdei.c
> @@ -247,7 +247,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
>  	 * If we interrupted the kernel with interrupts masked, we always go
>  	 * back to wherever we came from.
>  	 */
> -	if (mode == kernel_mode && !interrupts_enabled(regs))
> +	if (mode == kernel_mode && regs_irqs_disabled(regs))
>  		return SDEI_EV_HANDLED;
>  
>  	/*
> -- 
> 2.34.1
> 


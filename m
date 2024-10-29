Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF49B4CA2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827488.1242114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5naI-0006hE-4I; Tue, 29 Oct 2024 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827488.1242114; Tue, 29 Oct 2024 14:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5naI-0006eJ-1C; Tue, 29 Oct 2024 14:52:38 +0000
Received: by outflank-mailman (input) for mailman id 827488;
 Tue, 29 Oct 2024 14:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fT=RZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1t5naG-0006eD-QF
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:52:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6d774089-9605-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 15:52:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD17113E;
 Tue, 29 Oct 2024 07:53:02 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BB213F73B;
 Tue, 29 Oct 2024 07:52:24 -0700 (PDT)
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
X-Inumbo-ID: 6d774089-9605-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjZkNzc0MDg5LTk2MDUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjEzNTUzLjI5ODg1NSwic2VuZGVyIjoibWFyay5ydXRsYW5kQGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
Date: Tue, 29 Oct 2024 14:52:22 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, linux@armlinux.org.uk, will@kernel.org,
	catalin.marinas@arm.com, sstabellini@kernel.org, maz@kernel.org,
	tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
	kees@kernel.org, wad@chromium.org, akpm@linux-foundation.org,
	samitolvanen@google.com, arnd@arndb.de, ojeda@kernel.org,
	rppt@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	samuel.holland@sifive.com, paulmck@kernel.org, aquini@redhat.com,
	petr.pavlu@suse.com, viro@zeniv.linux.org.uk,
	rmk+kernel@armlinux.org.uk, ardb@kernel.org,
	wangkefeng.wang@huawei.com, surenb@google.com,
	linus.walleij@linaro.org, yangyj.ee@gmail.com, broonie@kernel.org,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	Jonathan.Cameron@huawei.com, prarit@redhat.com, liuwei09@cestc.cn,
	dwmw@amazon.co.uk, oliver.upton@linux.dev,
	kristina.martsenko@arm.com, ptosi@google.com, frederic@kernel.org,
	vschneid@redhat.com, thiago.bauermann@linaro.org,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v4 06/19] arm64: entry: Move
 arm64_preempt_schedule_irq() into exit_to_kernel_mode()
Message-ID: <ZyD2pk285YeVmZTm@J2N7QTR9R3.cambridge.arm.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-7-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-7-ruanjinjie@huawei.com>

On Fri, Oct 25, 2024 at 06:06:47PM +0800, Jinjie Ruan wrote:
> Move arm64_preempt_schedule_irq() into exit_to_kernel_mode(), so not
> only __el1_irq() but also every time when kernel mode irq return,
> there is a chance to reschedule.

We use exit_to_kernel_mode() for every non-NMI exception return to the
kernel, not just IRQ returns.

> As Mark pointed out, this change will have the following key impact:
> 
>     "We'll preempt even without taking a "real" interrupt. That
>     shouldn't result in preemption that wasn't possible before,
>     but it does change the probability of preempting at certain points,
>     and might have a performance impact, so probably warrants a
>     benchmark."

For anyone following along at home, I said that at:

  https://lore.kernel.org/linux-arm-kernel/ZxejvAmccYMTa4P1@J2N7QTR9R3/

... and there I specifically said:

> I's suggest you first write a patch to align arm64's entry code with the
> generic code, by removing the call to arm64_preempt_schedule_irq() from
> __el1_irq(), and adding a call to arm64_preempt_schedule_irq() in
> __exit_to_kernel_mode(), e.g.
> 
> | static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs)
> | {
> | 	...
> | 	if (interrupts_enabled(regs)) {
> | 		...
> | 		if (regs->exit_rcu) {
> | 			...
> | 		}
> | 		...
> | 		arm64_preempt_schedule_irq();
> | 		...
> | 	} else {
> | 		...
> | 	}
> | }

[...]

> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#define need_irq_preemption() \
> +	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +#else
> +#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
> +#endif
> +
> +static void __sched arm64_preempt_schedule_irq(void)
> +{
> +	if (!need_irq_preemption())
> +		return;
> +
> +	/*
> +	 * Note: thread_info::preempt_count includes both thread_info::count
> +	 * and thread_info::need_resched, and is not equivalent to
> +	 * preempt_count().
> +	 */
> +	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> +		return;
> +
> +	/*
> +	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> +	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> +	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> +	 * DAIF we must have handled an NMI, so skip preemption.
> +	 */
> +	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> +		return;
> +
> +	/*
> +	 * Preempting a task from an IRQ means we leave copies of PSTATE
> +	 * on the stack. cpufeature's enable calls may modify PSTATE, but
> +	 * resuming one of these preempted tasks would undo those changes.
> +	 *
> +	 * Only allow a task to be preempted once cpufeatures have been
> +	 * enabled.
> +	 */
> +	if (system_capabilities_finalized())
> +		preempt_schedule_irq();
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -72,6 +114,8 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>  					irqentry_state_t state)
>  {
> +	arm64_preempt_schedule_irq();

This is broken; exit_to_kernel_mode() is called for any non-NMI return
excpetion return to the kernel, and this doesn't check that interrupts
were enabled in the context the exception was taken from.

This will preempt in cases where we should not, e.g. if we WARN() in a section with
IRQs disabled.

Mark.


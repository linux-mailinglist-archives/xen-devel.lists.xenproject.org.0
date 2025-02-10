Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360CA2EB2F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884779.1294526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thS2S-0005J2-Lm; Mon, 10 Feb 2025 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884779.1294526; Mon, 10 Feb 2025 11:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thS2S-0005GH-Ie; Mon, 10 Feb 2025 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 884779;
 Mon, 10 Feb 2025 11:33:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thS2R-0005GB-Qw
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:33:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d270d2a4-e7a2-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 12:33:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95BD41007;
 Mon, 10 Feb 2025 03:33:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DC243F5A1;
 Mon, 10 Feb 2025 03:33:09 -0800 (PST)
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
X-Inumbo-ID: d270d2a4-e7a2-11ef-b3ef-695165c68f79
Date: Mon, 10 Feb 2025 11:33:07 +0000
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
Subject: Re: [PATCH -next v5 04/22] arm64: entry: Rework
 arm64_preempt_schedule_irq()
Message-ID: <Z6nj81GG_dLOzozI@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-5-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:26PM +0800, Jinjie Ruan wrote:
> The generic entry do preempt_schedule_irq() by checking if need_resched()
> satisfied, but arm64 has some of its own additional checks such as
> GIC priority masking.
> 
> In preparation for moving arm64 over to the generic entry code, rework
> arm64_preempt_schedule_irq() to check whether it need resched in a check
> function called arm64_need_resched().

I think what this is saying is that the generic entry code has the form:

| raw_irqentry_exit_cond_resched()
| {
| 	if (!preempt_count()) {
| 		...
| 		if (need_resched())
| 			preempt_schedule_irq();
| 	}
| }

... but it's not obvious why it's better to have and
arm64_need_resched() rather than a arm64_preempt_schedule_irq().

Having some idea of the change you intend to make to the generic code
would be helpful, and/or that generic change should be made earlier as a
preparatory patch.

Mark.

> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7a588515ee07..da68c089b74b 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -83,10 +83,10 @@ DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  #define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
>  
> -static void __sched arm64_preempt_schedule_irq(void)
> +static inline bool arm64_need_resched(void)
>  {
>  	if (!need_irq_preemption())
> -		return;
> +		return false;
>  
>  	/*
>  	 * Note: thread_info::preempt_count includes both thread_info::count
> @@ -94,7 +94,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * preempt_count().
>  	 */
>  	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return;
> +		return false;
>  
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> @@ -103,7 +103,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * DAIF we must have handled an NMI, so skip preemption.
>  	 */
>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> -		return;
> +		return false;
>  
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
> @@ -113,8 +113,10 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * Only allow a task to be preempted once cpufeatures have been
>  	 * enabled.
>  	 */
> -	if (system_capabilities_finalized())
> -		preempt_schedule_irq();
> +	if (!system_capabilities_finalized())
> +		return false;
> +
> +	return true;
>  }
>  
>  /*
> @@ -139,7 +141,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		arm64_preempt_schedule_irq();
> +		if (arm64_need_resched())
> +			preempt_schedule_irq();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 


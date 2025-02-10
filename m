Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35693A2EBF2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884824.1294576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSN8-0002ha-AB; Mon, 10 Feb 2025 11:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884824.1294576; Mon, 10 Feb 2025 11:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSN8-0002fY-7O; Mon, 10 Feb 2025 11:54:42 +0000
Received: by outflank-mailman (input) for mailman id 884824;
 Mon, 10 Feb 2025 11:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thSN7-0002fS-DH
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:54:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ce35e507-e7a5-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 12:54:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102F0113E;
 Mon, 10 Feb 2025 03:55:00 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921673F5A1;
 Mon, 10 Feb 2025 03:54:31 -0800 (PST)
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
X-Inumbo-ID: ce35e507-e7a5-11ef-b3ef-695165c68f79
Date: Mon, 10 Feb 2025 11:54:29 +0000
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
Subject: Re: [PATCH -next v5 08/22] arm64: entry: Use different helpers to
 check resched for PREEMPT_DYNAMIC
Message-ID: <Z6no9e7nBORuEWIK@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-9-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-9-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:30PM +0800, Jinjie Ruan wrote:
> In generic entry, when PREEMPT_DYNAMIC is enabled or disabled, two
> different helpers are used to check whether resched is required
> and some common code is reused.
> 
> In preparation for moving arm64 over to the generic entry code,
> use new helper to check resched when PREEMPT_DYNAMIC enabled and
> reuse common code for the disabled case.
> 
> No functional changes.

Please fold this together with the last two patches; it's undoing
changes you made in patch 6, and it'd be far clearer to see that all at
once.

Mark.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/preempt.h |  3 +++
>  arch/arm64/kernel/entry-common.c | 21 +++++++++++----------
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index d0f93385bd85..0f0ba250efe8 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -93,11 +93,14 @@ void dynamic_preempt_schedule(void);
>  #define __preempt_schedule()		dynamic_preempt_schedule()
>  void dynamic_preempt_schedule_notrace(void);
>  #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
> +void dynamic_irqentry_exit_cond_resched(void);
> +#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>  
>  #else /* CONFIG_PREEMPT_DYNAMIC */
>  
>  #define __preempt_schedule()		preempt_schedule()
>  #define __preempt_schedule_notrace()	preempt_schedule_notrace()
> +#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
>  
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
>  #endif /* CONFIG_PREEMPTION */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 029f8bd72f8a..015a65d19b52 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -75,10 +75,6 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  	return state;
>  }
>  
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#endif
> -
>  static inline bool arm64_need_resched(void)
>  {
>  	/*
> @@ -106,17 +102,22 @@ static inline bool arm64_need_resched(void)
>  
>  void raw_irqentry_exit_cond_resched(void)
>  {
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -		return;
> -#endif
> -
>  	if (!preempt_count()) {
>  		if (need_resched() && arm64_need_resched())
>  			preempt_schedule_irq();
>  	}
>  }
>  
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +void dynamic_irqentry_exit_cond_resched(void)
> +{
> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +		return;
> +	raw_irqentry_exit_cond_resched();
> +}
> +#endif
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -140,7 +141,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  		}
>  
>  		if (IS_ENABLED(CONFIG_PREEMPTION))
> -			raw_irqentry_exit_cond_resched();
> +			irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 


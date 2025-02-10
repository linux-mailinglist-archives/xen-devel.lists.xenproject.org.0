Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C23A2EBE2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884816.1294566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSKq-00026R-Vn; Mon, 10 Feb 2025 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884816.1294566; Mon, 10 Feb 2025 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSKq-00023h-SL; Mon, 10 Feb 2025 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 884816;
 Mon, 10 Feb 2025 11:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thSKq-00023b-AO
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:52:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7af6ecba-e7a5-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:52:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AAF1424;
 Mon, 10 Feb 2025 03:52:40 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19BC3F5A1;
 Mon, 10 Feb 2025 03:52:11 -0800 (PST)
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
X-Inumbo-ID: 7af6ecba-e7a5-11ef-a075-877d107080fb
Date: Mon, 10 Feb 2025 11:52:09 +0000
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
Subject: Re: [PATCH -next v5 07/22] arm64: entry: preempt_schedule_irq() only
 if PREEMPTION enabled
Message-ID: <Z6noaWUwn4uCeNN3@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-8-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-8-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:29PM +0800, Jinjie Ruan wrote:
> The generic entry check PREEMPTION for both PREEMPT_DYNAMIC
> enabled and PREEMPT_DYNAMIC disabled.
> 
> Whether PREEMPT_DYNAMIC enabled or not, PREEMPTION should
> be enabled to allow reschedule before EL1 exception return, so
> move PREEMPTION check ahead in preparation for moving arm64 over
> to the generic entry code.

This is just moving the IS_ENABLED() check. It'd be clearer to say
something like "hoist the IS_ENABLED() check earlier", but equally we
could do that earleir in the series by folding this into the prior
patch.

Mark.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 80b47ca02db2..029f8bd72f8a 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -109,9 +109,6 @@ void raw_irqentry_exit_cond_resched(void)
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>  		return;
> -#else
> -	if (!IS_ENABLED(CONFIG_PREEMPTION))
> -		return;
>  #endif
>  
>  	if (!preempt_count()) {
> @@ -142,7 +139,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		raw_irqentry_exit_cond_resched();
> +		if (IS_ENABLED(CONFIG_PREEMPTION))
> +			raw_irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E8A2EB7C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:40:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884787.1294537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thS9A-0006qZ-Bc; Mon, 10 Feb 2025 11:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884787.1294537; Mon, 10 Feb 2025 11:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thS9A-0006nT-88; Mon, 10 Feb 2025 11:40:16 +0000
Received: by outflank-mailman (input) for mailman id 884787;
 Mon, 10 Feb 2025 11:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thS98-0006nN-Oa
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:40:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ca3cf92d-e7a3-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:40:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5354F1424;
 Mon, 10 Feb 2025 03:40:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C3A3F5A1;
 Mon, 10 Feb 2025 03:40:05 -0800 (PST)
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
X-Inumbo-ID: ca3cf92d-e7a3-11ef-a075-877d107080fb
Date: Mon, 10 Feb 2025 11:40:03 +0000
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
Subject: Re: [PATCH -next v5 05/22] arm64: entry: Use preempt_count() and
 need_resched() helper
Message-ID: <Z6nlkyxAZEtY_M7T@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-6-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:27PM +0800, Jinjie Ruan wrote:
> The generic entry code uses preempt_count() and need_resched() helpers to
> check if it is time to resched. Currently, arm64 use its own check logic,
> that is "READ_ONCE(current_thread_info()->preempt_count == 0", which is
> equivalent to "preempt_count() == 0 && need_resched()".

Hmm. The existing code relies upon preempt_fold_need_resched() to work
correctly. If we want to move from:

	READ_ONCE(current_thread_info()->preempt_count) == 0

... to:

	!preempt_count() && need_resched()

... then that change should be made *before* we change the preemption
logic to preempt non-IRQ exceptions in patch 3. Otherwise, that logic is
consuming stale data most of the time.

Mark.

> In preparation for moving arm64 over to the generic entry code, use
> these helpers to replace arm64's own code and move it ahead.
> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index da68c089b74b..efd1a990d138 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -88,14 +88,6 @@ static inline bool arm64_need_resched(void)
>  	if (!need_irq_preemption())
>  		return false;
>  
> -	/*
> -	 * Note: thread_info::preempt_count includes both thread_info::count
> -	 * and thread_info::need_resched, and is not equivalent to
> -	 * preempt_count().
> -	 */
> -	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -141,8 +133,10 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		if (arm64_need_resched())
> -			preempt_schedule_irq();
> +		if (!preempt_count() && need_resched()) {
> +			if (arm64_need_resched())
> +				preempt_schedule_irq();
> +		}
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 


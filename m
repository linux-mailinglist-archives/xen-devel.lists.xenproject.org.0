Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818129B4CAD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827497.1242134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nd0-0007o1-OC; Tue, 29 Oct 2024 14:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827497.1242134; Tue, 29 Oct 2024 14:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nd0-0007mX-KE; Tue, 29 Oct 2024 14:55:26 +0000
Received: by outflank-mailman (input) for mailman id 827497;
 Tue, 29 Oct 2024 14:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fT=RZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1t5ncy-0007m8-O8
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:55:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d1ff574c-9605-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 15:55:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86B7113E;
 Tue, 29 Oct 2024 07:55:50 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B12463F73B;
 Tue, 29 Oct 2024 07:55:12 -0700 (PDT)
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
X-Inumbo-ID: d1ff574c-9605-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQxZmY1NzRjLTk2MDUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjEzNzIxLjg2NjYxMywic2VuZGVyIjoibWFyay5ydXRsYW5kQGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
Date: Tue, 29 Oct 2024 14:55:10 +0000
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
Subject: Re: [PATCH -next v4 07/19] arm64: entry: Call
 arm64_preempt_schedule_irq() only if irqs enabled
Message-ID: <ZyD3TiU1Dk_zYsXE@J2N7QTR9R3.cambridge.arm.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-8-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-8-ruanjinjie@huawei.com>

On Fri, Oct 25, 2024 at 06:06:48PM +0800, Jinjie Ruan wrote:
> Only if irqs are enabled when the interrupt trapped, there may be
> a chance to reschedule after the interrupt has been handled, so move
> arm64_preempt_schedule_irq() into regs_irqs_disabled() check false
> if block.
> 
> As Mark pointed out, this change will have the following key impact:
> 
>     "We will not preempt when taking interrupts from a region of kernel
>     code where IRQs are enabled but RCU is not watching, matching the
>     behaviour of the generic entry code.
> 
>     This has the potential to introduce livelock if we can ever have a
>     screaming interrupt in such a region, so we'll need to go figure out
>     whether that's actually a problem.
> 
>     Having this as a separate patch will make it easier to test/bisect
>     for that specifically."
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This should be folded into the prior patch.

Mark.

> ---
>  arch/arm64/kernel/entry-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index e0380812d71e..b57f6dc66115 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -114,8 +114,6 @@ static void __sched arm64_preempt_schedule_irq(void)
>  static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>  					irqentry_state_t state)
>  {
> -	arm64_preempt_schedule_irq();
> -
>  	mte_check_tfsr_exit();
>  
>  	lockdep_assert_irqs_disabled();
> @@ -129,6 +127,8 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> +		arm64_preempt_schedule_irq();
> +
>  		trace_hardirqs_on();
>  	} else {
>  		if (state.exit_rcu)
> -- 
> 2.34.1
> 


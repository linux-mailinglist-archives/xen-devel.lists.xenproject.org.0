Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A99B4C21
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827463.1242074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nII-0001fI-U0; Tue, 29 Oct 2024 14:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827463.1242074; Tue, 29 Oct 2024 14:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nII-0001cr-RB; Tue, 29 Oct 2024 14:34:02 +0000
Received: by outflank-mailman (input) for mailman id 827463;
 Tue, 29 Oct 2024 14:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fT=RZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1t5nIH-0001bd-M7
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:34:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d4c62f9a-9602-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 15:33:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C456E113E;
 Tue, 29 Oct 2024 07:34:26 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD8433F528;
 Tue, 29 Oct 2024 07:33:49 -0700 (PDT)
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
X-Inumbo-ID: d4c62f9a-9602-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ0YzYyZjlhLTk2MDItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjEyNDM4LjEzMjQzNywic2VuZGVyIjoibWFyay5ydXRsYW5kQGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
Date: Tue, 29 Oct 2024 14:33:47 +0000
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
Subject: Re: [PATCH -next v4 02/19] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
Message-ID: <ZyDyS4TT6xgRIN1w@J2N7QTR9R3.cambridge.arm.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-3-ruanjinjie@huawei.com>

On Fri, Oct 25, 2024 at 06:06:43PM +0800, Jinjie Ruan wrote:
> These changes refactor the entry and exit routines for the exceptions
> from EL1. They store the RCU and lockdep state in a struct
> irqentry_state variable on the stack, rather than recording them
> in the fields of pt_regs, since it is safe enough for these context.

In general, please descirbe *why* we want to make the change first, e.g.

| The generic entry code uses irqentry_state_t to track lockdep and RCU
| state across exception entry and return. For historical reasons, arm64
| embeds similar fields within its pt_regs structure.
|
| In preparation for moving arm64 over to the generic entry code, pull
| these fields out of arm64's pt_regs, and use a seperate structure,
| matching the style of the generic entry code.

> Before:
> 	struct pt_regs {
> 		...
> 		u64 lockdep_hardirqs;
> 		u64 exit_rcu;
> 	}
> 
> 	enter_from_kernel_mode(regs);
> 	...
> 	exit_to_kernel_mode(regs);
> 
> After:
> 	typedef struct irqentry_state {
> 		union {
> 			bool    exit_rcu;
> 			bool    lockdep;
> 		};
> 	} irqentry_state_t;
> 
> 	irqentry_state_t state = enter_from_kernel_mode(regs);
> 	...
> 	exit_to_kernel_mode(regs, state);

I don't think this part is necessary.

> 
> No functional changes.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/ptrace.h  |  11 ++-
>  arch/arm64/kernel/entry-common.c | 129 +++++++++++++++++++------------
>  2 files changed, 85 insertions(+), 55 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 3e5372a98da4..5156c0d5fa20 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -149,6 +149,13 @@ static inline unsigned long pstate_to_compat_psr(const unsigned long pstate)
>  	return psr;
>  }
>  
> +typedef struct irqentry_state {
> +	union {
> +		bool	exit_rcu;
> +		bool	lockdep;
> +	};
> +} irqentry_state_t;

AFAICT this can be moved directly into arch/arm64/kernel/entry-common.c.

> +
>  /*
>   * This struct defines the way the registers are stored on the stack during an
>   * exception. struct user_pt_regs must form a prefix of struct pt_regs.
> @@ -169,10 +176,6 @@ struct pt_regs {
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
> index c547e70428d3..68a9aecacdb9 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -36,29 +36,36 @@
>   * This is intended to match the logic in irqentry_enter(), handling the kernel
>   * mode transitions only.
>   */
> -static __always_inline void __enter_from_kernel_mode(struct pt_regs *regs)
> +static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
>  {
> -	regs->exit_rcu = false;
> +	irqentry_state_t ret = {
> +		.exit_rcu = false,
> +	};

I realise that the generic entry code calls this 'ret' in
irqentry_enter() and similar, but could we please use 'state'
consistently in the arm64 code?

[...]

>  /*
> @@ -190,9 +199,11 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>   * mode. Before this function is called it is not safe to call regular kernel
>   * code, instrumentable code, or any code which may trigger an exception.
>   */
> -static void noinstr arm64_enter_nmi(struct pt_regs *regs)
> +static noinstr irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
>  {
> -	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
> +	irqentry_state_t irq_state;

Likewise, please use 'state' rather than 'irq_state'.

In future we should probably have a separate structure for the NMI
paths, and get rid of the union, which would avoid the possiblity of
using mismatched helpers.

Mark.


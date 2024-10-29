Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5729B4C5E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827477.1242093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nQl-0004Dg-WC; Tue, 29 Oct 2024 14:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827477.1242093; Tue, 29 Oct 2024 14:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nQl-0004B9-TW; Tue, 29 Oct 2024 14:42:47 +0000
Received: by outflank-mailman (input) for mailman id 827477;
 Tue, 29 Oct 2024 14:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fT=RZ=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1t5nQk-0004B3-At
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:42:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0d7fcd24-9604-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 15:42:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 896ED113E;
 Tue, 29 Oct 2024 07:43:11 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 998843F528;
 Tue, 29 Oct 2024 07:42:34 -0700 (PDT)
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
X-Inumbo-ID: 0d7fcd24-9604-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjBkN2ZjZDI0LTk2MDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjEyOTYyLjY2NDQ3LCJzZW5kZXIiOiJtYXJrLnJ1dGxhbmRAYXJtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
Date: Tue, 29 Oct 2024 14:42:32 +0000
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
Subject: Re: [PATCH -next v4 03/19] arm64: entry: Remove
 __enter_from_user_mode()
Message-ID: <ZyD0WJeAhESLIBJp@J2N7QTR9R3.cambridge.arm.com>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-4-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025100700.3714552-4-ruanjinjie@huawei.com>

On Fri, Oct 25, 2024 at 06:06:44PM +0800, Jinjie Ruan wrote:
> The __enter_from_user_mode() is only called by enter_from_user_mode(),
> so replaced it with enter_from_user_mode().

As with the next two patches, all the __enter_from_*() and __exit_to_*()
are supposed to handle the raw entry, closely matching the generic code,
and the non-underscored enter_from_*() and exit_to_*() functions are
supposed to be wrappers that handle (possibly instrumentable)
arm64-specific post-entry and pre-exit logic.

I would prefer to keep that split, even though enter_from_user_mode() is
a trivial wrapper.

Am I missing some reason we must remove the wrappers?

Mark.

> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 68a9aecacdb9..ccf59b44464d 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -109,7 +109,7 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>   * Before this function is called it is not safe to call regular kernel code,
>   * instrumentable code, or any code which may trigger an exception.
>   */
> -static __always_inline void __enter_from_user_mode(void)
> +static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>  {
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  	CT_WARN_ON(ct_state() != CT_STATE_USER);
> @@ -118,11 +118,6 @@ static __always_inline void __enter_from_user_mode(void)
>  	mte_disable_tco_entry(current);
>  }
>  
> -static __always_inline void enter_from_user_mode(struct pt_regs *regs)
> -{
> -	__enter_from_user_mode();
> -}
> -
>  /*
>   * Handle IRQ/context state management when exiting to user mode.
>   * After this function returns it is not safe to call regular kernel code,
> -- 
> 2.34.1
> 


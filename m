Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97560A2EC6A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 13:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884861.1294611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSq7-0000YU-8y; Mon, 10 Feb 2025 12:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884861.1294611; Mon, 10 Feb 2025 12:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSq7-0000WX-5P; Mon, 10 Feb 2025 12:24:39 +0000
Received: by outflank-mailman (input) for mailman id 884861;
 Mon, 10 Feb 2025 12:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3uS=VB=arm.com=mark.rutland@srs-se1.protection.inumbo.net>)
 id 1thSq4-0000WR-RA
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 12:24:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fc44b353-e7a9-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 13:24:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458241BA8;
 Mon, 10 Feb 2025 04:24:55 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C70A93F5A1;
 Mon, 10 Feb 2025 04:24:26 -0800 (PST)
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
X-Inumbo-ID: fc44b353-e7a9-11ef-b3ef-695165c68f79
Date: Mon, 10 Feb 2025 12:24:21 +0000
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
Subject: Re: [PATCH -next v5 11/22] arm64: entry: Switch to generic IRQ entry
Message-ID: <Z6nv9SLi0za8tE69@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-12-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-12-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:33PM +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*.
> The generic entry makes maintainers' work easier and codes
> more elegant.
> 
> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> LOC, and it will switch to generic entry completely later. Switch to
> generic entry in two steps according to Mark's suggestion will make
> it easier to review.
> 
> The changes are below:
>  - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>    irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>    and wrap with generic enter_from/exit_to_user_mode() because they
>    are exactly the same so far.
> 
>  - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>    because they're exactly the same, so the temporary arm64 version
>    irqentry_state can also be removed.
> 
>  - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>    if arm64 implement arch_irqentry_exit_need_resched().
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/include/asm/entry-common.h |  64 ++++++
>  arch/arm64/include/asm/preempt.h      |   6 -
>  arch/arm64/kernel/entry-common.c      | 307 ++++++--------------------
>  arch/arm64/kernel/signal.c            |   3 +-
>  5 files changed, 129 insertions(+), 252 deletions(-)
>  create mode 100644 arch/arm64/include/asm/entry-common.h

Superficially this looks nice, but to be clear I have *not* looked at
this in great detail; minor comments below.

[...]

> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> +						  unsigned long ti_work)
> +{
> +	local_daif_mask();
> +}
> +
> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare

I'm a little worried that this may be fragile having been hidden in the
common code, as it's not clear exactly when this will occur during the
return sequence, and the ordering requirements could easily be broken by
refactoring there.

I suspect we'll want to pull this later in the arm64 exit sequence so
that we can have it explicit in entry-common.c.

[...]

> index 14ac6fdb872b..84b6628647c7 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -9,6 +9,7 @@
>  #include <linux/cache.h>
>  #include <linux/compat.h>
>  #include <linux/errno.h>
> +#include <linux/irq-entry-common.h>
>  #include <linux/kernel.h>
>  #include <linux/signal.h>
>  #include <linux/freezer.h>
> @@ -1603,7 +1604,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>   * the kernel can handle, and then we build all the user-level signal handling
>   * stack-frames in one go after that.
>   */
> -void do_signal(struct pt_regs *regs)
> +void arch_do_signal_or_restart(struct pt_regs *regs)
>  {
>  	unsigned long continue_addr = 0, restart_addr = 0;
>  	int retval = 0;

Is the expected semantic the same here, or is those more than just a
name change?

Mark.


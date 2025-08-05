Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04846B1B767
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070595.1434222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSh-0001f8-OS; Tue, 05 Aug 2025 15:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070595.1434222; Tue, 05 Aug 2025 15:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSh-0001ZB-BH; Tue, 05 Aug 2025 15:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1070595;
 Tue, 05 Aug 2025 15:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJFq-0007Kl-4q
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:07:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d9080db7-720d-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 17:07:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E4C2BCE;
 Tue,  5 Aug 2025 08:06:56 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423853F673;
 Tue,  5 Aug 2025 08:07:00 -0700 (PDT)
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
X-Inumbo-ID: d9080db7-720d-11f0-a321-13f23c93f187
Message-ID: <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
Date: Tue, 5 Aug 2025 16:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 mark.rutland@arm.com, puranjay@kernel.org, broonie@kernel.org,
 mbenes@suse.cz, ryan.roberts@arm.com, akpm@linux-foundation.org,
 chenl311@chinatelecom.cn, anshuman.khandual@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ardb@kernel.org,
 leitao@debian.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 29/07/2025 02:54, Jinjie Ruan wrote:
> ARM64 requires an additional check whether to reschedule on return
> from interrupt. So add arch_irqentry_exit_need_resched() as the default
> NOP implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
> the architecture specific version for switching over to
> the generic entry code.
I was a bit confused by this, as I didn't see the link with the generic 
entry
given you implement `raw_irqentry_exit_cond_resched()` in arch/arm64
as well in this patch : I expected the arm64 implementation to be added.
I share more thoughts below.

What do you think about something along those lines ?

	Compared to the generic entry code, arm64 does additional checks
	when deciding to reschedule on return from an interrupt.
	Introduce arch_irqentry_exit_need_resched() in the need_resched() condition
	of the generic raw_irqentry_exit_cond_resched(), with a NOP default.
	This will allow arm64 to implement its architecture specific checks when
	switching over to the generic entry code.

> [...]
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b82032777310..4aa9656fa1b4 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>   	return ret;
>   }
>   
> +/**
> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
> + *
> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
Very nit : "to check if resched is needed." ?
> + * Defaults return true.
> + *
> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
If feel that "to avoid preemption of a task" instead of "to skip preempt 
a task"
would make this much clearer, what do you think ?
> + */
> +static inline bool arch_irqentry_exit_need_resched(void);
> +
> +#ifndef arch_irqentry_exit_need_resched
> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
> +#endif
> +

I've had some trouble reviewing this patch : on the one hand because
I didn't notice `arch_irqentry_exit_need_resched()` was added in
the common entry code, which is on me !
On the other hand, I felt that the patch itself was a bit disconnected :
we add `arch_irqentry_exit_need_resched()` in the common entry code,
with a default NOP, but in the same function we add to arm64,
while mentioning that this is for arm64's additional checks,
which we only implement in patch 7.

Would it make sense to move the `arch_irqentry_exit_need_resched()`
part of the patch to patch 7, so that the introduction and
arch-specific implementation appear together ?
To me it seems easier to wrap my head around, as it would look like
"Move arm64 to generic entry, but it does additional checks : add a new
arch-specific function controlling re-scheduling, defaulting to true,
and implement it for arm64". I feel it could help making patch 7's
commit message clearer as well.

 From what I gathered on the archive `arch_irqentry_exit_need_resched()`
being added here was suggested previously, so others might not have the
same opinion.

Maybe improving the commit message and comment for this would be enough
as well, as per my suggestions above.


Otherwise the changes make sense and I don't see any functional issues !

Thanks,
Ada



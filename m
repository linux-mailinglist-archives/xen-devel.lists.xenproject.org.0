Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F5B1C08C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071236.1434730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXoW-0007Ss-Sm; Wed, 06 Aug 2025 06:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071236.1434730; Wed, 06 Aug 2025 06:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXoW-0007QB-Ps; Wed, 06 Aug 2025 06:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1071236;
 Wed, 06 Aug 2025 06:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oS3N=2S=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1ujXoV-0007Q5-TT
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:39:51 +0000
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224797ed-7290-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:39:48 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bxgfJ29swz27g4j;
 Wed,  6 Aug 2025 14:40:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 8B11A140119;
 Wed,  6 Aug 2025 14:39:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 14:39:36 +0800
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
X-Inumbo-ID: 224797ed-7290-11f0-b898-0df219b8e170
Message-ID: <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
Date: Wed, 6 Aug 2025 14:39:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/5 23:06, Ada Couprie Diaz wrote:
> Hi Jinjie,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
>> ARM64 requires an additional check whether to reschedule on return
>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>> NOP implementation and hook it up into the need_resched() condition in
>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>> the architecture specific version for switching over to
>> the generic entry code.
> I was a bit confused by this, as I didn't see the link with the generic
> entry
> given you implement `raw_irqentry_exit_cond_resched()` in arch/arm64
> as well in this patch : I expected the arm64 implementation to be added.
> I share more thoughts below.
> 
> What do you think about something along those lines ?
> 
>     Compared to the generic entry code, arm64 does additional checks
>     when deciding to reschedule on return from an interrupt.
>     Introduce arch_irqentry_exit_need_resched() in the need_resched()
> condition
>     of the generic raw_irqentry_exit_cond_resched(), with a NOP default.
>     This will allow arm64 to implement its architecture specific checks
> when
>     switching over to the generic entry code.
> 
>> [...]
>> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
>> index b82032777310..4aa9656fa1b4 100644
>> --- a/kernel/entry/common.c
>> +++ b/kernel/entry/common.c
>> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct
>> pt_regs *regs)
>>       return ret;
>>   }
>>   +/**
>> + * arch_irqentry_exit_need_resched - Architecture specific need
>> resched function
>> + *
>> + * Invoked from raw_irqentry_exit_cond_resched() to check if need
>> resched.
> Very nit : "to check if resched is needed." ?
>> + * Defaults return true.
>> + *
>> + * The main purpose is to permit arch to skip preempt a task from an
>> IRQ.
> If feel that "to avoid preemption of a task" instead of "to skip preempt
> a task"
> would make this much clearer, what do you think ?
>> + */
>> +static inline bool arch_irqentry_exit_need_resched(void);
>> +
>> +#ifndef arch_irqentry_exit_need_resched
>> +static inline bool arch_irqentry_exit_need_resched(void) { return
>> true; }
>> +#endif
>> +
> 
> I've had some trouble reviewing this patch : on the one hand because
> I didn't notice `arch_irqentry_exit_need_resched()` was added in
> the common entry code, which is on me !
> On the other hand, I felt that the patch itself was a bit disconnected :
> we add `arch_irqentry_exit_need_resched()` in the common entry code,
> with a default NOP, but in the same function we add to arm64,
> while mentioning that this is for arm64's additional checks,
> which we only implement in patch 7.

Yes, it does.

> 
> Would it make sense to move the `arch_irqentry_exit_need_resched()`
> part of the patch to patch 7, so that the introduction and
> arch-specific implementation appear together ?
> To me it seems easier to wrap my head around, as it would look like
> "Move arm64 to generic entry, but it does additional checks : add a new
> arch-specific function controlling re-scheduling, defaulting to true,
> and implement it for arm64". I feel it could help making patch 7's
> commit message clearer as well.
> 
> From what I gathered on the archive `arch_irqentry_exit_need_resched()`
> being added here was suggested previously, so others might not have the
> same opinion.

Yes, introduce `arch_irqentry_exit_need_resched()` here may help
understand the patch's refactoring purpose.

> 
> Maybe improving the commit message and comment for this would be enough
> as well, as per my suggestions above.

Thank you! I'll improve the commit message and comment.

> 
> 
> Otherwise the changes make sense and I don't see any functional issues !
> 
> Thanks,
> Ada
> 
> 


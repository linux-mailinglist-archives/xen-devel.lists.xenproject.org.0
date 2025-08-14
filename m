Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4CB25F7D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081104.1441227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTe8-0003N7-S2; Thu, 14 Aug 2025 08:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081104.1441227; Thu, 14 Aug 2025 08:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTe8-0003LV-PB; Thu, 14 Aug 2025 08:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1081104;
 Thu, 14 Aug 2025 08:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVY3=22=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1umTe7-0003LP-Mb
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:49:15 +0000
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5e3571-78eb-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:49:10 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c2f3W63Rsz2gKx8;
 Thu, 14 Aug 2025 16:46:15 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 3C74C1A0188;
 Thu, 14 Aug 2025 16:49:06 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 16:49:04 +0800
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
X-Inumbo-ID: 8a5e3571-78eb-11f0-a328-13f23c93f187
Message-ID: <afb0fb39-c221-c4c0-08cb-c6941d3ff801@huawei.com>
Date: Thu, 14 Aug 2025 16:49:03 +0800
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
 <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4242ef37-efeb-446f-abbc-0104b805ad12@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/12 0:02, Ada Couprie Diaz wrote:
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> ARM64 requires an additional check whether to reschedule on return
>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>> NOP implementation and hook it up into the need_resched() condition in
>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>> the architecture specific version for switching over to
>> the generic entry code.
>>
>> To align the structure of the code with irqentry_exit_cond_resched()
>> from the generic entry code, hoist the need_irq_preemption()
>> and IS_ENABLED() check earlier. And different preemption check functions
>> are defined based on whether dynamic preemption is enabled.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> Unrelated to the other thread : I noticed that compiling this patch
> with `allnoconfig` would fail :
> - `raw_irqentry_exit_cond_resched` has no previous prototype,
>   as it is defined within `#ifdef CONFIG_PREEMPTION`
> - `irqentry_exit_cond_resched()` is not declared, as it is also within
>   `#ifdef CONFIG_PREEMPTION`

You are right, thank you! I'll fix it.

> 
> The patch below fixes the issue, but introduces merge conflicts in
> patches 6 and 7, plus the `#ifdef` needs to be moved accordingly
> in patch 6 and the empty "without preemption" `irq_exit_cond_resched()`
> needs to be removed in patch 7.
> 
> I hope this can be useful,
> Ada
> 
> ---
> diff --git a/arch/arm64/include/asm/preempt.h
> b/arch/arm64/include/asm/preempt.h
> index 0f0ba250efe8..d9aba8b1e466 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -103,6 +103,8 @@ void dynamic_irqentry_exit_cond_resched(void);
>  #define irqentry_exit_cond_resched() raw_irqentry_exit_cond_resched()
> 
>  #endif /* CONFIG_PREEMPT_DYNAMIC */
> +#else /* CONFIG_PREEMPTION */
> +#define irqentry_exit_cond_resched() {}
>  #endif /* CONFIG_PREEMPTION */
> 
>  #endif /* __ASM_PREEMPT_H */
> diff --git a/arch/arm64/kernel/entry-common.c
> b/arch/arm64/kernel/entry-common.c
> index 4f92664fd46c..abd7a315145e 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -661,6 +661,7 @@ static __always_inline void __el1_pnmi(struct
> pt_regs *regs,
>         arm64_exit_nmi(regs, state);
>  }
> 
> +#ifdef CONFIG_PREEMPTION
>  void raw_irqentry_exit_cond_resched(void)
>  {
>         if (!preempt_count()) {
> @@ -668,6 +669,7 @@ void raw_irqentry_exit_cond_resched(void)
>                         preempt_schedule_irq();
>         }
>  }
> +#endif
> 
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> 
> 


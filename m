Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDEE9B7311
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 04:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828434.1243311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6LyI-0004nb-ID; Thu, 31 Oct 2024 03:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828434.1243311; Thu, 31 Oct 2024 03:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6LyI-0004ku-FA; Thu, 31 Oct 2024 03:35:42 +0000
Received: by outflank-mailman (input) for mailman id 828434;
 Thu, 31 Oct 2024 03:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwVf=R3=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t6LyH-0004jo-Gv
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 03:35:41 +0000
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e888b49-9739-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 04:35:35 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xf8kG6rGLz20qff;
 Thu, 31 Oct 2024 11:34:30 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 0C6891401F3;
 Thu, 31 Oct 2024 11:35:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 31 Oct 2024 11:35:28 +0800
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
X-Inumbo-ID: 2e888b49-9739-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjQ1LjI0OS4yMTIuMTkwIiwiaGVsbyI6InN6eGdhMDQtaW4uaHVhd2VpLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJlODg4YjQ5LTk3MzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzQ1NzM3LjIwNjQ1MSwic2VuZGVyIjoicnVhbmppbmppZUBodWF3ZWkuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
Message-ID: <69389d62-a520-fb1a-2c73-fecc9bc8a71f@huawei.com>
Date: Thu, 31 Oct 2024 11:35:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v4 02/19] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
CC: <oleg@redhat.com>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <sstabellini@kernel.org>, <maz@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <akpm@linux-foundation.org>,
	<samitolvanen@google.com>, <arnd@arndb.de>, <ojeda@kernel.org>,
	<rppt@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<samuel.holland@sifive.com>, <paulmck@kernel.org>, <aquini@redhat.com>,
	<petr.pavlu@suse.com>, <viro@zeniv.linux.org.uk>,
	<rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>,
	<linus.walleij@linaro.org>, <yangyj.ee@gmail.com>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>,
	<guohanjun@huawei.com>, <sudeep.holla@arm.com>,
	<Jonathan.Cameron@huawei.com>, <prarit@redhat.com>, <liuwei09@cestc.cn>,
	<dwmw@amazon.co.uk>, <oliver.upton@linux.dev>, <kristina.martsenko@arm.com>,
	<ptosi@google.com>, <frederic@kernel.org>, <vschneid@redhat.com>,
	<thiago.bauermann@linaro.org>, <joey.gouly@arm.com>,
	<liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241025100700.3714552-1-ruanjinjie@huawei.com>
 <20241025100700.3714552-3-ruanjinjie@huawei.com>
 <ZyDyS4TT6xgRIN1w@J2N7QTR9R3.cambridge.arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZyDyS4TT6xgRIN1w@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2024/10/29 22:33, Mark Rutland wrote:
> On Fri, Oct 25, 2024 at 06:06:43PM +0800, Jinjie Ruan wrote:
>> These changes refactor the entry and exit routines for the exceptions
>> from EL1. They store the RCU and lockdep state in a struct
>> irqentry_state variable on the stack, rather than recording them
>> in the fields of pt_regs, since it is safe enough for these context.
> 
> In general, please descirbe *why* we want to make the change first, e.g.
> 
> | The generic entry code uses irqentry_state_t to track lockdep and RCU
> | state across exception entry and return. For historical reasons, arm64
> | embeds similar fields within its pt_regs structure.
> |
> | In preparation for moving arm64 over to the generic entry code, pull
> | these fields out of arm64's pt_regs, and use a seperate structure,
> | matching the style of the generic entry code.
> 
>> Before:
>> 	struct pt_regs {
>> 		...
>> 		u64 lockdep_hardirqs;
>> 		u64 exit_rcu;
>> 	}
>>
>> 	enter_from_kernel_mode(regs);
>> 	...
>> 	exit_to_kernel_mode(regs);
>>
>> After:
>> 	typedef struct irqentry_state {
>> 		union {
>> 			bool    exit_rcu;
>> 			bool    lockdep;
>> 		};
>> 	} irqentry_state_t;
>>
>> 	irqentry_state_t state = enter_from_kernel_mode(regs);
>> 	...
>> 	exit_to_kernel_mode(regs, state);
> 
> I don't think this part is necessary.

Thank you, will remove it and explain why.

> 
>>
>> No functional changes.
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/ptrace.h  |  11 ++-
>>  arch/arm64/kernel/entry-common.c | 129 +++++++++++++++++++------------
>>  2 files changed, 85 insertions(+), 55 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>> index 3e5372a98da4..5156c0d5fa20 100644
>> --- a/arch/arm64/include/asm/ptrace.h
>> +++ b/arch/arm64/include/asm/ptrace.h
>> @@ -149,6 +149,13 @@ static inline unsigned long pstate_to_compat_psr(const unsigned long pstate)
>>  	return psr;
>>  }
>>  
>> +typedef struct irqentry_state {
>> +	union {
>> +		bool	exit_rcu;
>> +		bool	lockdep;
>> +	};
>> +} irqentry_state_t;
> 
> AFAICT this can be moved directly into arch/arm64/kernel/entry-common.c.
> 
>> +
>>  /*
>>   * This struct defines the way the registers are stored on the stack during an
>>   * exception. struct user_pt_regs must form a prefix of struct pt_regs.
>> @@ -169,10 +176,6 @@ struct pt_regs {
>>  
>>  	u64 sdei_ttbr1;
>>  	struct frame_record_meta stackframe;
>> -
>> -	/* Only valid for some EL1 exceptions. */
>> -	u64 lockdep_hardirqs;
>> -	u64 exit_rcu;
>>  };
>>  
>>  /* For correct stack alignment, pt_regs has to be a multiple of 16 bytes. */
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index c547e70428d3..68a9aecacdb9 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -36,29 +36,36 @@
>>   * This is intended to match the logic in irqentry_enter(), handling the kernel
>>   * mode transitions only.
>>   */
>> -static __always_inline void __enter_from_kernel_mode(struct pt_regs *regs)
>> +static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
>>  {
>> -	regs->exit_rcu = false;
>> +	irqentry_state_t ret = {
>> +		.exit_rcu = false,
>> +	};
> 
> I realise that the generic entry code calls this 'ret' in
> irqentry_enter() and similar, but could we please use 'state'
> consistently in the arm64 code?
> 
> [...]
> 
>>  /*
>> @@ -190,9 +199,11 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
>>   * mode. Before this function is called it is not safe to call regular kernel
>>   * code, instrumentable code, or any code which may trigger an exception.
>>   */
>> -static void noinstr arm64_enter_nmi(struct pt_regs *regs)
>> +static noinstr irqentry_state_t arm64_enter_nmi(struct pt_regs *regs)
>>  {
>> -	regs->lockdep_hardirqs = lockdep_hardirqs_enabled();
>> +	irqentry_state_t irq_state;
> 
> Likewise, please use 'state' rather than 'irq_state'.
> 
> In future we should probably have a separate structure for the NMI
> paths, and get rid of the union, which would avoid the possiblity of
> using mismatched helpers.
> 
> Mark.
> 
> 


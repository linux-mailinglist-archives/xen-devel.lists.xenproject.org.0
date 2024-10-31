Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF709B7310
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 04:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828431.1243301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6LxI-0004Ir-AE; Thu, 31 Oct 2024 03:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828431.1243301; Thu, 31 Oct 2024 03:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6LxI-0004H1-5y; Thu, 31 Oct 2024 03:34:40 +0000
Received: by outflank-mailman (input) for mailman id 828431;
 Thu, 31 Oct 2024 03:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwVf=R3=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t6LxH-0004Gv-Cp
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 03:34:39 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07376621-9739-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 04:34:31 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xf8gw2BpVzpXgN;
 Thu, 31 Oct 2024 11:32:28 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id AA015180115;
 Thu, 31 Oct 2024 11:34:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 31 Oct 2024 11:34:21 +0800
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
X-Inumbo-ID: 07376621-9739-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjQ1LjI0OS4yMTIuMTg4IiwiaGVsbyI6InN6eGdhMDItaW4uaHVhd2VpLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA3Mzc2NjIxLTk3MzktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzQ1NjcyLjAzNDMzMSwic2VuZGVyIjoicnVhbmppbmppZUBodWF3ZWkuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
Message-ID: <d1293fb3-6516-8680-d676-a68d648b904b@huawei.com>
Date: Thu, 31 Oct 2024 11:34:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v4 01/19] arm64: ptrace: Replace
 interrupts_enabled() with regs_irqs_disabled()
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
 <20241025100700.3714552-2-ruanjinjie@huawei.com>
 <ZyDu9XHNmxMHBMSI@J2N7QTR9R3.cambridge.arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZyDu9XHNmxMHBMSI@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2024/10/29 22:19, Mark Rutland wrote:
> On Fri, Oct 25, 2024 at 06:06:42PM +0800, Jinjie Ruan wrote:
>> Implement regs_irqs_disabled(), and replace interrupts_enabled() macro
>> with regs_irqs_disabled() all over the place.
>>
>> No functional changes.
>>
> 
> Please say why, e.g.
> 
> | The generic entry code expects architecture code to provide
> | regs_irqs_disabled(regs), but arm64 does not have this and provides
> | interrupts_enabled(regs), which has the opposite polarity.
> | 
> | In preparation for moving arm64 over to the generic entry code,
> | replace arm64's interrupts_enabled() with regs_irqs_disabled() and
> | update its callers under arch/arm64.
> |
> | For the moment, a definition of interrupts_enabled() is provided for
> | the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
> | can be removed.
> 

Thank you！ Will expand the commit message and describe the cause of the
patch also for other patches.

>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> 
> [...]
> 
>>  arch/arm/include/asm/ptrace.h       | 4 ++--
>>  arch/arm/kernel/hw_breakpoint.c     | 2 +-
>>  arch/arm/kernel/process.c           | 2 +-
>>  arch/arm/mm/alignment.c             | 2 +-
>>  arch/arm/mm/fault.c                 | 2 +-
> 
>>  drivers/irqchip/irq-gic-v3.c        | 2 +-
> 
> I hadn't realised that the GICv3 driver was using this and hence we'd
> need to update a few places in arch/arm at the same time. Please update
> just the arch/arm64 bits, and add:
> 
> | /* 
> |  * Used by the GICv3 driver, can be removed once arch/arm implements
> |  * regs_irqs_disabled() directly.
> |  */
> | #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
> 
> ... and then once 32-bit arm implements this we can update the GIC
> driver and remove the architecture definitions.
> 
> That way we avoid the risk of conflicts with 32-bit arm.
> 
> Mark.
> 


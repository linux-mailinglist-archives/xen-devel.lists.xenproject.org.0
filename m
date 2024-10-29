Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F649B407C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 03:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827044.1241521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5c3d-0006B1-GN; Tue, 29 Oct 2024 02:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827044.1241521; Tue, 29 Oct 2024 02:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5c3d-00067w-DH; Tue, 29 Oct 2024 02:34:09 +0000
Received: by outflank-mailman (input) for mailman id 827044;
 Tue, 29 Oct 2024 02:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYEM=RZ=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t5c3b-00067q-VG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 02:34:07 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 427ede9a-959e-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 03:34:05 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XcvQQ6V28zfdZx;
 Tue, 29 Oct 2024 10:31:26 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id D8120180064;
 Tue, 29 Oct 2024 10:33:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 10:33:57 +0800
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
X-Inumbo-ID: 427ede9a-959e-11ef-a0c3-8be0dac302b0
Message-ID: <264f092c-dbaa-b475-831f-f50f4471de2f@huawei.com>
Date: Tue, 29 Oct 2024 10:33:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v4 15/19] entry: Add arch
 irqentry_exit_need_resched() for arm64
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, <oleg@redhat.com>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<catalin.marinas@arm.com>, <sstabellini@kernel.org>, <maz@kernel.org>,
	<peterz@infradead.org>, <luto@kernel.org>, <kees@kernel.org>,
	<wad@chromium.org>, <akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<arnd@arndb.de>, <ojeda@kernel.org>, <rppt@kernel.org>, <hca@linux.ibm.com>,
	<aliceryhl@google.com>, <samuel.holland@sifive.com>, <paulmck@kernel.org>,
	<aquini@redhat.com>, <petr.pavlu@suse.com>, <viro@zeniv.linux.org.uk>,
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
 <20241025100700.3714552-16-ruanjinjie@huawei.com> <878qu82je2.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <878qu82je2.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2024/10/29 2:05, Thomas Gleixner wrote:
> On Fri, Oct 25 2024 at 18:06, Jinjie Ruan wrote:
> 
>> As the front patch 6 ~ 13 did, the arm64_preempt_schedule_irq() is
> 
> Once this series is applied nobody knows what 'front patch 6 ~ 13' did.

Yes, if some of the previous patches are applied, the description will
immediately become difficult to understand, the other patch's similar
commit message will be updated too.

> 
>> same with the irq preempt schedule code of generic entry besides those
>> architecture-related logic called arm64_irqentry_exit_need_resched().
>>
>> So add arch irqentry_exit_need_resched() to support architecture-related
>> need_resched() check logic, which do not affect existing architectures
>> that use generic entry, but support arm64 to use generic irq entry.
> 
> Simply say:
> 
>  ARM64 requires an additional whether to reschedule on return from
>  interrupt.
> 
>  Add arch_irqentry_exit_need_resched() as the default NOOP
>  implementation and hook it up into the need_resched() condition in
>  raw_irqentry_exit_cond_resched().
> 
>  This allows ARM64 to implement the architecture specific version for
>  switchting over to the generic entry code.
> 
> That explains things completely independently. Hmm?

Of course, this is clearer and not as coupled as other patches and
describes how to implement it.
> 
> Thanks,
> 
>         tglx
> 


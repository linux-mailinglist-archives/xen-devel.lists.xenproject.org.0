Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD19B731D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 04:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828446.1243321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6M3N-0006ZG-7a; Thu, 31 Oct 2024 03:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828446.1243321; Thu, 31 Oct 2024 03:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6M3N-0006X6-4u; Thu, 31 Oct 2024 03:40:57 +0000
Received: by outflank-mailman (input) for mailman id 828446;
 Thu, 31 Oct 2024 03:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwVf=R3=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1t6M3M-0006X0-4f
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 03:40:56 +0000
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea2cff12-9739-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 04:40:50 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xf8pw1JPKz1T9TY;
 Thu, 31 Oct 2024 11:38:32 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id E13B4180103;
 Thu, 31 Oct 2024 11:40:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 31 Oct 2024 11:40:41 +0800
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
X-Inumbo-ID: ea2cff12-9739-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjQ1LjI0OS4yMTIuMjU1IiwiaGVsbyI6InN6eGdhMDgtaW4uaHVhd2VpLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImVhMmNmZjEyLTk3MzktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzQ2MDUyLjQyMDc1Mywic2VuZGVyIjoicnVhbmppbmppZUBodWF3ZWkuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
Message-ID: <bcce44bc-5047-18d9-6cb3-4e664d99a129@huawei.com>
Date: Thu, 31 Oct 2024 11:40:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v4 03/19] arm64: entry: Remove
 __enter_from_user_mode()
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
 <20241025100700.3714552-4-ruanjinjie@huawei.com>
 <ZyD0WJeAhESLIBJp@J2N7QTR9R3.cambridge.arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ZyD0WJeAhESLIBJp@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2024/10/29 22:42, Mark Rutland wrote:
> On Fri, Oct 25, 2024 at 06:06:44PM +0800, Jinjie Ruan wrote:
>> The __enter_from_user_mode() is only called by enter_from_user_mode(),
>> so replaced it with enter_from_user_mode().
> 
> As with the next two patches, all the __enter_from_*() and __exit_to_*()
> are supposed to handle the raw entry, closely matching the generic code,
> and the non-underscored enter_from_*() and exit_to_*() functions are
> supposed to be wrappers that handle (possibly instrumentable)

Sure, the __enter_from_*() and __exit_to_*() is all about the generic
code, and the enter_from_*() and exit_to_*() includes arm64-specific MTE
  check.

> arm64-specific post-entry and pre-exit logic.
> 
> I would prefer to keep that split, even though enter_from_user_mode() is
> a trivial wrapper.
> 
> Am I missing some reason we must remove the wrappers?

It is not necessary to remove these functions, just found it by chance
and cleanup them by the way, originally I thought that removing the
underline function might make the relative order of the MTE functions
look clearer.

> 
> Mark.
> 
>>
>> No functional changes.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/entry-common.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 68a9aecacdb9..ccf59b44464d 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -109,7 +109,7 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
>>   * Before this function is called it is not safe to call regular kernel code,
>>   * instrumentable code, or any code which may trigger an exception.
>>   */
>> -static __always_inline void __enter_from_user_mode(void)
>> +static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>>  {
>>  	lockdep_hardirqs_off(CALLER_ADDR0);
>>  	CT_WARN_ON(ct_state() != CT_STATE_USER);
>> @@ -118,11 +118,6 @@ static __always_inline void __enter_from_user_mode(void)
>>  	mte_disable_tco_entry(current);
>>  }
>>  
>> -static __always_inline void enter_from_user_mode(struct pt_regs *regs)
>> -{
>> -	__enter_from_user_mode();
>> -}
>> -
>>  /*
>>   * Handle IRQ/context state management when exiting to user mode.
>>   * After this function returns it is not safe to call regular kernel code,
>> -- 
>> 2.34.1
>>
> 


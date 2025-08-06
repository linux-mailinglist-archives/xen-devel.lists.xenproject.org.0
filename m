Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE167B1BEE3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 04:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071082.1434624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUDk-00088q-1m; Wed, 06 Aug 2025 02:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071082.1434624; Wed, 06 Aug 2025 02:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUDj-00086i-VP; Wed, 06 Aug 2025 02:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1071082;
 Wed, 06 Aug 2025 02:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oS3N=2S=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1ujUDj-00086c-6I
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 02:49:39 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74b368c-726f-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 04:49:32 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bxZQV4lLmz14MLW;
 Wed,  6 Aug 2025 10:45:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
 by mail.maildlp.com (Postfix) with ESMTPS id 3E366180B54;
 Wed,  6 Aug 2025 10:49:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 10:49:21 +0800
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
X-Inumbo-ID: f74b368c-726f-11f0-b898-0df219b8e170
Message-ID: <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
Date: Wed, 6 Aug 2025 10:49:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
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
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
 <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2025/8/5 23:06, Ada Couprie Diaz wrote:
> Hi,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> The generic entry code uses irqentry_state_t to track lockdep and RCU
>> state across exception entry and return. For historical reasons, arm64
>> embeds similar fields within its pt_regs structure.
>>
>> In preparation for moving arm64 over to the generic entry code, pull
>> these fields out of arm64's pt_regs, and use a separate structure,
>> matching the style of the generic entry code.
>>
>> No functional changes.
> As far as I understand and checked, we used the two fields
> in an exclusive fashion, so there is indeed no functional change.
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/kernel/entry-common.c
>> b/arch/arm64/kernel/entry-common.c
>> index 8e798f46ad28..97e0741abde1 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> [...]
>> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>>   static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>>   {
>>       unsigned long far = read_sysreg(far_el1);
>> +    arm64_irqentry_state_t state;
>>   -    enter_from_kernel_mode(regs);
>> +    state = enter_from_kernel_mode(regs);
> Nit: There is some inconsistencies with some functions splitting state's
> definition
> and declaration (like el1_abort here), while some others do it on the
> same line
> (el1_undef() below for example).
> In some cases it is welcome as the entry function is called after some
> other work,
> but here for example it doesn't seem to be beneficial ?

Both methods can keep the modifications to `enter_from_kernel_mode()` on
the same line as the original code, which will facilitate code review.

I think it is also fine to do it on the same line here, which can reduce
one line code, which method is better may be a matter of personal opinion.

>>       local_daif_inherit(regs);
>>       do_mem_abort(far, esr, regs);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>     static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>>   {
>>       unsigned long far = read_sysreg(far_el1);
>> +    arm64_irqentry_state_t state;
>>   -    enter_from_kernel_mode(regs);
>> +    state = enter_from_kernel_mode(regs);
>>       local_daif_inherit(regs);
>>       do_sp_pc_abort(far, esr, regs);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>     static void noinstr el1_undef(struct pt_regs *regs, unsigned long
>> esr)
>>   {
>> -    enter_from_kernel_mode(regs);
>> +    arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
>> +
>>       local_daif_inherit(regs);
>>       do_el1_undef(regs, esr);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>
>> [...]
> Other than the small nit:
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4EB210B2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 18:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077803.1438825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUyT-0000HH-4o; Mon, 11 Aug 2025 16:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077803.1438825; Mon, 11 Aug 2025 16:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUyT-0000Ei-1u; Mon, 11 Aug 2025 16:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1077803;
 Mon, 11 Aug 2025 16:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhKo=2X=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ulUyR-0000Eb-Kg
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 16:02:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 889b3ed6-76cc-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 18:02:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC66266C;
 Mon, 11 Aug 2025 09:01:59 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0D163F738;
 Mon, 11 Aug 2025 09:02:03 -0700 (PDT)
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
X-Inumbo-ID: 889b3ed6-76cc-11f0-a325-13f23c93f187
Message-ID: <4b18c96b-116b-417d-ab98-eb81b80c9897@arm.com>
Date: Mon, 11 Aug 2025 17:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 sstabellini@kernel.org, mark.rutland@arm.com, puranjay@kernel.org,
 broonie@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 akpm@linux-foundation.org, chenl311@chinatelecom.cn,
 anshuman.khandual@arm.com, kristina.martsenko@arm.com,
 liaochang1@huawei.com, ardb@kernel.org, leitao@debian.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
 <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
 <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/08/2025 03:49, Jinjie Ruan wrote:

> On 2025/8/5 23:06, Ada Couprie Diaz wrote:
>> Hi,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>
>>> [...]
>>> diff --git a/arch/arm64/kernel/entry-common.c
>>> b/arch/arm64/kernel/entry-common.c
>>> index 8e798f46ad28..97e0741abde1 100644
>>> --- a/arch/arm64/kernel/entry-common.c
>>> +++ b/arch/arm64/kernel/entry-common.c
>>> [...]
>>> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>>>    static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>>>    {
>>>        unsigned long far = read_sysreg(far_el1);
>>> +    arm64_irqentry_state_t state;
>>>    -    enter_from_kernel_mode(regs);
>>> +    state = enter_from_kernel_mode(regs);
>> Nit: There is some inconsistencies with some functions splitting state's
>> definition
>> and declaration (like el1_abort here), while some others do it on the
>> same line
>> (el1_undef() below for example).
>> In some cases it is welcome as the entry function is called after some
>> other work,
>> but here for example it doesn't seem to be beneficial ?
> Both methods can keep the modifications to `enter_from_kernel_mode()` on
> the same line as the original code, which will facilitate code review.
>
> I think it is also fine to do it on the same line here, which can reduce
> one line code, which method is better may be a matter of personal opinion.
Fair point !
Then, as mentioned previously, I'm happy to leave my Reviewed-By.
>>>        local_daif_inherit(regs);
>>>        do_mem_abort(far, esr, regs);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>      static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>>>    {
>>>        unsigned long far = read_sysreg(far_el1);
>>> +    arm64_irqentry_state_t state;
>>>    -    enter_from_kernel_mode(regs);
>>> +    state = enter_from_kernel_mode(regs);
>>>        local_daif_inherit(regs);
>>>        do_sp_pc_abort(far, esr, regs);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>      static void noinstr el1_undef(struct pt_regs *regs, unsigned long
>>> esr)
>>>    {
>>> -    enter_from_kernel_mode(regs);
>>> +    arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
>>> +
>>>        local_daif_inherit(regs);
>>>        do_el1_undef(regs, esr);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>
>>> [...]
>> Other than the small nit:
>> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


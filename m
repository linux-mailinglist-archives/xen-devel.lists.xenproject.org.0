Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83B77DE0A6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 13:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626457.976690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy9yE-0005vc-Vf; Wed, 01 Nov 2023 12:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626457.976690; Wed, 01 Nov 2023 12:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy9yE-0005tI-Sq; Wed, 01 Nov 2023 12:05:14 +0000
Received: by outflank-mailman (input) for mailman id 626457;
 Wed, 01 Nov 2023 12:05:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qy9yD-0005tA-1z
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 12:05:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy9yC-0008DZ-Jl; Wed, 01 Nov 2023 12:05:12 +0000
Received: from [15.248.3.7] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy9yC-0005au-8f; Wed, 01 Nov 2023 12:05:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=f6g434O77Z8NSfHjUTHsCiU7j0j7mcriyxHF8NrWbUI=; b=JS/zZCE6vmI2Zf3qSM8JDTqrqJ
	aOb3Bvb313ccbJzI8Ir/mvEmIQBLxx0wlqjfxYMykTKltxtCFkxQLaO5ob4d+Myx/RcDpM5s210ef
	R19tMEaFTmUYt4YLTkSS3wKvCyUAUJnMh8rTIj4RFfssn/QBBzucDk8x75c55nO6mqLg=;
Message-ID: <8ce56c46-b68d-4ff8-b047-3e2d3e3cb3aa@xen.org>
Date: Wed, 1 Nov 2023 12:05:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-4-Henry.Wang@arm.com>
 <f098a07d-fa19-4b40-bfac-7b121524382a@xen.org>
 <D25CD22C-F529-41F7-93AB-43BEB7157B8C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D25CD22C-F529-41F7-93AB-43BEB7157B8C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/11/2023 01:58, Henry Wang wrote:
> Hi Julien,

Hi,

>> On Nov 1, 2023, at 02:29, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Henry,
>>
>> +Ayan
>>
>> On 23/10/2023 03:13, Henry Wang wrote:
>>> Currently mmu_init_secondary_cpu() only enforces the page table
>>> should not contain mapping that are both Writable and eXecutables
>>> after boot. To ease the arch/arm/mm.c split work, fold this function
>>> to head.S.
>>> For arm32, introduce an assembly macro pt_enforce_wxn. The macro is
>>> called before secondary CPUs jumping into the C world.
>>> For arm64, set the SCTLR_Axx_ELx_WXN flag right when the MMU is
>>> enabled. This would avoid the extra TLB flush and SCTLR dance.
>>
>> For a random reader, it is not clear why you can't set WnX early for arm32 as well. I think it would helpful to explain the difference. I.e. at the point the MMU is enabled, the page-tables may still contain mapping which are writable and executable.
> 
> Sounds good, I will add the suggested sentence.
> 
>>>   .endm
>>>   +/*
>>> + * Enforce Xen page-tables do not contain mapping that are both
>>> + * Writable and eXecutables.
>>> + *
>>> + * This should be called on each secondary CPU.
>>> + */
>>> +.macro pt_enforce_wxn tmp
>>> +        mrc   CP32(\tmp, HSCTLR)
>>> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>>> +        dsb
>>> +        mcr   CP32(\tmp, HSCTLR)
>>> +        /*
>>> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
>>> +         * before flushing the TLBs.
>>> +         */
>>> +        isb
>>> +        flush_xen_tlb_local \tmp
>>> +.endm
>>> +
>>>   /*
>>>    * Common register usage in this file:
>>>    *   r0  -
>>> @@ -254,6 +273,7 @@ secondary_switched:
>>>           /* Use a virtual address to access the UART. */
>>>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>>>   #endif
>>> +        pt_enforce_wxn r0
>>
>>  From recent discussion on IRC, Ayan reminded me this patch [1]. Ideally, I would want to print a message just before to indicate that the bit is set. But I understand that this would need to be droppped in Ayan rework as we don't yet support early printk in enable_mmu().
>>
>> While debugging an MMU issue on Arm32, I wrote a patch to sprinkle prints in the enable_mmu() code. I will clean-up the patch and send it.
> 
> Just to make sure, your patch is for both Arm32 and Arm64, is my understanding correct?

No it is only for arm32.

> If it is only for Arm32, do you need me adding the print for Arm64 as well in this patch?

No need. For arm64, we will enable WnX at the same time as the MMU. So 
we are already covered by the other prints.

> 
>> I will add a print at that point. Meanwhile, I would move the call a few lines above? This will allow Ayan to drop [1].
> 
> Yeah I will include Ayan’s change in this patch and add his sign-off.
> 
>>>           PRINT("- Ready -\r\n")
>>>           /* Jump to C world */
>>>           mov_w r2, start_secondary
>>> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
>>> index 88075ef083..df06cefbbe 100644
>>> --- a/xen/arch/arm/arm64/mmu/head.S
>>> +++ b/xen/arch/arm/arm64/mmu/head.S
>>> @@ -264,10 +264,11 @@ ENDPROC(create_page_tables)
>>>    * Inputs:
>>>    *   x0 : Physical address of the page tables.
>>
>> The inputs list should be updated to mention what x1 means.
> 
> I will use “x1: Extra flags of the SCTLR.” if this looks good to you.

I am fine with that.

Cheers,


-- 
Julien Grall


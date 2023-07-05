Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0374823C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559044.873718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzrU-0005hG-Vv; Wed, 05 Jul 2023 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559044.873718; Wed, 05 Jul 2023 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzrU-0005ea-T9; Wed, 05 Jul 2023 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 559044;
 Wed, 05 Jul 2023 10:35:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGzrT-0005eU-JJ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:35:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzrT-0004p4-8k; Wed, 05 Jul 2023 10:35:51 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzrT-0000ha-2q; Wed, 05 Jul 2023 10:35:51 +0000
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
	bh=n4uxSm5vcoYhxj5k7kJ/YEQPQFQ+phIt8SvxSoImtfw=; b=yld9CDXlAofDQCSiZT68qEsdGq
	DO/+1vkuRhNUppWMgZSPjT4XpNO99jf5vevihlXXXkTy//rjG85tRgZTYbdHCOv3RJ6K0ZthRlXXO
	CAggVrCuk3AiQ/aL2BNbMsi6VtyiI+FRvCJjqJT26EB5mV+prqjxJ5GQuaBK9wxVlqL8=;
Message-ID: <1c0a7397-0129-d0d5-2941-3ef1fddef61b@xen.org>
Date: Wed, 5 Jul 2023 11:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/52] xen/mmu: extract early uart mapping from
 setup_fixmap
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-13-Penny.Zheng@arm.com>
 <78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org>
 <02df8ce2-fa68-614b-87ce-82bb5b60d2a1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <02df8ce2-fa68-614b-87ce-82bb5b60d2a1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 05/07/2023 10:03, Penny Zheng wrote:
> On 2023/7/5 06:25, Julien Grall wrote:
>> Hi Penny,
>>
>> Title: You want to clarify that this change is arm64 only. So:
>>
>> xen/arm64: mmu: ...
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> Original setup_fixmap is actually doing two seperate tasks, one is 
>>> enabling
>>> the early UART when earlyprintk on, and the other is to set up the 
>>> fixmap
>>> even when earlyprintk is not configured.
>>>
>>> To be more dedicated and precise, the old function shall be split 
>>> into two
>>> functions, setup_early_uart and new setup_fixmap.
>> While some of the split before would be warrant even without the MPU 
>> support. This one is not because there is limited point to have 3 
>> lines function. So I think you want to justify based on what you plan 
>> to do with the MPU code.
>>
>> That said, I don't think we need to introduce setup_fixmap. See below.
>>
>>
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - new patch
>>> ---
>>>   xen/arch/arm/arm64/head.S     |  3 +++
>>>   xen/arch/arm/arm64/mmu/head.S | 24 +++++++++++++++++-------
>>>   2 files changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index e63886b037..55a4cfe69e 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -258,7 +258,10 @@ real_start_efi:
>>>           b     enable_boot_mm
>>>   primary_switched:
>>> +        bl    setup_early_uart
>>> +#ifdef CONFIG_HAS_FIXMAP
>>>           bl    setup_fixmap
>>> +#endif
>>>   #ifdef CONFIG_EARLY_PRINTK
>>>           /* Use a virtual address to access the UART. */
>>>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
>>> diff --git a/xen/arch/arm/arm64/mmu/head.S 
>>> b/xen/arch/arm/arm64/mmu/head.S
>>> index 2b209fc3ce..295596aca1 100644
>>> --- a/xen/arch/arm/arm64/mmu/head.S
>>> +++ b/xen/arch/arm/arm64/mmu/head.S
>>> @@ -367,24 +367,34 @@ identity_mapping_removed:
>>>   ENDPROC(remove_identity_mapping)
>>>   /*
>>> - * Map the UART in the fixmap (when earlyprintk is used) and hook the
>>> - * fixmap table in the page tables.
>>> - *
>>> - * The fixmap cannot be mapped in create_page_tables because it may
>>> - * clash with the 1:1 mapping.
>>
>> Since commit 9d267c049d92 ("xen/arm64: Rework the memory layout"), 
>> there is no chance that the fixmap will clash with the 1:1 mapping. So 
>> rather than introducing a new function, I would move the creation of 
>> the fixmap in create_pagetables().
>>
> 
> Understood. I'll move the creation of the fixmap in create_pagetables().
> 
>> This would avoid the #ifdef CONFIG_HAS_FIXMAP in head.S.
>>
>>> + * Map the UART in the fixmap (when earlyprintk is used)
>>>    *
>>>    * Inputs:
>>> - *   x20: Physical offset
>>>    *   x23: Early UART base physical address
>>>    *
>>>    * Clobbers x0 - x3
>>>    */
>>> -ENTRY(setup_fixmap)
>>> +ENTRY(setup_early_uart)
>>>   #ifdef CONFIG_EARLY_PRINTK
>>>           /* Add UART to the fixmap table */
>>>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
>>>           create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, 
>>> type=PT_DEV_L3
>>> +        /* Ensure any page table updates made above have occurred. */
>>> +        dsb   nshst
>>> +
>>> +        ret
>>
>> The 'ret' needs to be outside of the '#ifdef' block. But, in this 
>> case, I would prefer if we don't call setup_early_uart() when 
>> !CONFIG_EARLY_PRINTK in head.S
>>
> 
> okay. I'll move the #ifdef to the caller in head.S.

Thinking about this again. I think you can actually move the mapping of 
the UART in create_pagetables() because it will also not clash with the 1:1.

For the MPU, the mapping could then be moved in prepare_early_mappings().

This would reduce the number of functions exposed.

Cheers,

-- 
Julien Grall


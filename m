Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4534E3F69
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 14:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293461.498546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWeSd-0004vN-Ax; Tue, 22 Mar 2022 13:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293461.498546; Tue, 22 Mar 2022 13:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWeSd-0004sx-7t; Tue, 22 Mar 2022 13:22:07 +0000
Received: by outflank-mailman (input) for mailman id 293461;
 Tue, 22 Mar 2022 13:22:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWeSb-0004sr-LJ
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 13:22:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWeSb-0006Or-2e; Tue, 22 Mar 2022 13:22:05 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWeSa-0006iY-Rw; Tue, 22 Mar 2022 13:22:04 +0000
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
	bh=F9D4ruYVnonPUnBSyHtOpG+kC+VvocBaqPqt0btQ94s=; b=MKCT+EqM5GAEa9QW3UFD9TbLF3
	xOromOJ2GaiaqLuanjKZMMqlV3dWKXvqWBIOkqF1mBnodqGC72O2pkwBUxTVeTU71ypD8MaFWPuGH
	WlCsMnDLVPjt6Tw3NEY1+yvblRXl/YIZZswwlLEQmVVYaj0oi7E3E9lEaulhnbuNT8/g=;
Message-ID: <c7296ea0-5236-1a10-8ef1-74ec83456ce5@xen.org>
Date: Tue, 22 Mar 2022 13:22:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
 <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
 <a6d6aa6f-7dcf-fbed-6400-bb5d028e045e@xilinx.com>
 <9bcab961-8ae1-9e9a-c6da-682aecf2a138@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9bcab961-8ae1-9e9a-c6da-682aecf2a138@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 22/03/2022 12:38, Ayan Kumar Halder wrote:
> 
> On 22/03/2022 12:06, Ayan Kumar Halder wrote:
>>
>> On 18/03/2022 18:26, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 17/03/2022 14:00, Ayan Kumar Halder wrote:
>>>> diff --git a/xen/arch/arm/include/asm/mmio.h 
>>>> b/xen/arch/arm/include/asm/mmio.h
>>>> index ca259a79c2..79e64d9af8 100644
>>>> --- a/xen/arch/arm/include/asm/mmio.h
>>>> +++ b/xen/arch/arm/include/asm/mmio.h
>>>> @@ -35,6 +35,7 @@ enum instr_decode_state
>>>>        * instruction.
>>>>        */
>>>>       INSTR_LDR_STR_POSTINDEXING,
>>>> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>>>>   };
>>>>     typedef struct
>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>> index 6f458ee7fd..26c716b4a5 100644
>>>> --- a/xen/arch/arm/io.c
>>>> +++ b/xen/arch/arm/io.c
>>>> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct 
>>>> cpu_user_regs *regs,
>>>>           return;
>>>>       }
>>>>   +    /*
>>>> +     * When the data abort is caused due to cache maintenance, Xen 
>>>> should check
>>>> +     * if the address belongs to an emulated MMIO region or not. 
>>>> The behavior
>>>> +     * will differ accordingly.
>>>> +     */
>>>> +    if ( info->dabt.cache )
>>>> +    {
>>>> +        info->dabt_instr.state = INSTR_CACHE;
>>>> +        return;
>>>> +    }
>>>> +
>>>>       /*
>>>>        * Armv8 processor does not provide a valid syndrome for 
>>>> decoding some
>>>>        * instructions. So in order to process these instructions, 
>>>> Xen must
>>>> @@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct 
>>>> cpu_user_regs *regs,
>>>>           return rc;
>>>>       }
>>>>   +    /*
>>>> +     * When the data abort is caused due to cache maintenance and 
>>>> the address
>>>> +     * belongs to an emulated region, Xen should ignore this 
>>>> instruction.
>>>> +     */
>>>> +    if ( info->dabt_instr.state == INSTR_CACHE )
>>>
>>> Reading the Arm Arm, the ISS should be invalid for cache 
>>> instructions. So, I think the check at the beginning of 
>>> try_handle_mmio() would prevent us to reach this check.
>>>
>>> Can you check that cache instructions on emulated region will 
>>> effectively be ignored?
>>
>> Yes, you are correct.
>>
>> I tested with the following (dis)assembly snippet :-
>>
>> 0x3001000 is the base address of GIC Distributor base.
>>
>>     __asm__ __volatile__("ldr x1, =0x3001000");
>>     40000ca8:   58000301    ldr x1, 40000d08 <main+0x70>
>>     __asm __volatile__("DC CVAU, x1");
>>     40000cac:   d50b7b21    dc  cvau, x1
>>
>> This resulting in hitting the assertion :-
>>
>> (XEN) Assertion 'unreachable' failed at arch/arm/io.c:178
>>
>> I dumped the registers as follows, to determine that the fault is 
>> caused by the instruction at 40000cac.
>>
>> HSR=0x00000092000147  regs->pc = 0x40000cac info.gpa = 0x3001000
>>
>>
>> So, my patch needs to be modified as follows:-
>>
>> @@ -172,7 +173,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs 
>> *regs,
>>
>>      ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>
>> -    if ( !info->dabt.valid )
>> +    if ( !(info->dabt.valid || (info->dabt_instr.state == 
>> INSTR_CACHE)) )
> 
> Actually this is not needed.
> 
> The following change is sufficient :-
> 
> @@ -146,7 +146,9 @@ void try_decode_instruction(const struct 
> cpu_user_regs *regs,
>        */
>       if ( info->dabt.cache )
>       {
>           info->dabt_instr.state = INSTR_CACHE;
> +        info->dabt.valid = 1;

To me, 'info->dabt.valid' indicates whether the syndrome is valid. We 
set to 1 for emulated instruction because the syndrome will be updated.

But this is not the case for the cache instructions. So I would prefer 
if it is kept as 0 and use your previous suggestion.

Furthermore, I think try_fwd_ioserv() need to be adapted because the 
function will use the fields SAS and SRT. From the Arm Arm they are 
RES0, so while they are 0 today, we should not rely on this.

Therefore, to be fully compliant with the Arm, we want to reorder a bit 
the code:

  * The field data could be set past ioreq_select_server().
  * The field size should be set to the cache line size.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF245A35F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 13:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229571.396984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVNc-0007w4-CU; Tue, 23 Nov 2021 12:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229571.396984; Tue, 23 Nov 2021 12:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVNc-0007tH-9b; Tue, 23 Nov 2021 12:58:36 +0000
Received: by outflank-mailman (input) for mailman id 229571;
 Tue, 23 Nov 2021 12:58:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpVNa-0007tB-PA
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 12:58:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpVNa-0003OT-71; Tue, 23 Nov 2021 12:58:34 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpVNa-000181-0H; Tue, 23 Nov 2021 12:58:34 +0000
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
	bh=koEqnxBikLAKnsC7JPZwZQ+fiif860KFdH4w2SGyVCU=; b=zUR9M0ZgKVm0UmWvnYexeZMUCZ
	gIrbubGZMFyJKCX0e+tpoQr7SjyKUnX/YvS3pWqo85Gb+o97rmn3UmLee9ypNoZM0BS6aSnobzwXe
	3ndwVv01z1dh4BrMYMjlSkpRtR3lVbjlFh54FbPMTanxDajfbl9A0U/o31KQe5WV3sm4=;
Message-ID: <dd437d5f-05b5-1809-6803-20c1ddb82e52@xen.org>
Date: Tue, 23 Nov 2021 12:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, wei.chen@arm.com,
 stefano.stabellini@xilinx.com, sstabellini@kernel.org, jbeulich@suse.com
Cc: Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
 <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/11/2021 14:19, Ayan Kumar Halder wrote:
> Hi Julien/Stefano/Wei/Jan,

Hi,

> As some of the comments were inter-related, I have consolidated my 
> response to all the comments below.
> 
> On 19/11/2021 17:26, Julien Grall wrote:
>> Hi Ayan,
>>
>> On 19/11/2021 16:52, Ayan Kumar Halder wrote:
>>> At present, post indexing instructions are not emulated by Xen.
>>
>> Can you explain in the commit message why this is a problem?
> 
> Yes, I will update the message as below :-
> Armv8 hardware does not provide the correct syndrome for decoding post 
> indexing ldr/str instructions. 

This statement implies that the issue happens on both AArch32 and 
AArch64 state. I am OK if we only handle the latter for now. But I would 
clarify it in the commit message.

> Thus any post indexing ldr/str 
> instruction at EL1 results in a data abort with ISV=0. 

Instruction from EL0 may also trap in Xen. So I would prefer if you just 
say "instruction executed by a domain results ...".

> As a result, Xen 
> needs to decode the instruction.

Can you give some information on the domain used. Something like:

"this was discovered with XXX which let the compiler deciding which 
instruction to use."

> 
> Thus, DomU will be able to read/write to ioreg space with post indexing 

I would say "domain" rather "domU" because all the domains are affected.

> instructions for 32 bit.

How about the following commit message:

"
xen/arm64: io: Decode 32-bit ldr/str post-indexing instructions

At the moment, Xen is only handling data abort with valid syndrome (i.e.
ISV=0). Unfortunately, this doesn't cover all the instructions a domain
could use to access MMIO regions.

For instance, Xilinx baremetal OS will use:

         volatile u32 *LocalAddr = (volatile u32 *)Addr;
         *LocalAddr = Value;

This leave the compiler to decide which store instructions to use. This
may be a post-index store instruction where the HW will not provide a
valid syndrome.

In order to handle post-indexing store/load instructions,
Xen will need to fetch and decode the instruction.

This patch only cover post-index store/load instructions from AArch64 
mode. For now, this is left unimplemented for trap from AArch32 mode.
"

>>> +{
>>> +    int32_t ret;
>>> +
>>> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
>>> +        return -EINVAL;
>>> +
>>> +    ret = (value >> start) & (~0U >> (32 - length));
>>
>> This would be easier to read if you use GENMASK().
> 
> I see that GENMASK returns a register mask. In my scenario, I wish to 
> compare the offsets 10, 21, 24 and 27 to some fixed value.
> 
> So, instead of using GENMASK four times, I can try the following
> instr & MASK_for_10_21_24_27 == VALID_for_10_21_24_27 (Wei Chen's 
> suggestion)

That would be OK with me. Alternatively, you could use the union 
approach suggested by Bertrand.

> 
> 
> Also for size, v and opc, I can defined another bitmask to compare with 
> VALID_for_32bit_LDR | VALID_for_32bit_STR.
> 
> Wei Chen, You had suggested using vreg_regx_extract(). However, I see 
> that it is used to extract the complete u64 register value. In this 
> case, I wish to compare certain offsets within a 32 bit register to some 
> expected values. So, vreg_regx_extract() might not be appropriate and we 
> can use the method mentioned before.

vreg_reg*_extract() are meant to work on a register. So I think they are 
not appropriate here as you don't deal with registers.

[...]

>>> +
>>> +    /* At the moment, we support STR(immediate) - 32 bit variant and
>>> +     * LDR(immediate) - 32 bit variant only.
>>> +     */
>>
>> Coding style.
> Ack
> 
>>
>>> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
>>>
>>
>> The coding style for this should be:
>>
>> if ( !(( size == 2 ) && ( ... ) ... ) )
> Ack
> 
>>
>>   +        goto bad_64bit_loadstore;
>>> +
>>> +    rt = extract32(instr, 0, 5);
>>> +    imm9 = extract32(instr, 12, 9);
>>> +
>>> +    if ( imm9 < 0 )
>>> +        update_dabt(dabt, rt, size, true);
>>> +    else
>>> +        update_dabt(dabt, rt, size, false);
>>
>> This could be simplified with:
>>
>> update_dabt(dabt, rt, size, imm9 < 0);
> Ack
> 
>>
>>> +
>>> +    dabt->valid = 1;
>>> +
>>> +
>>> +    return 0;
>>> +bad_64bit_loadstore:
>>> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
>>> +    return 1;
>>> +}
>>> +
>>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>>   {
>>>       uint16_t instr;
>>> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs 
>>> *regs, struct hsr_dabt *dabt)
>>>       if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>>>           return decode_thumb(regs->pc, dabt);
>>> +    if ( is_64bit_domain(current->domain) )
>>
>> You can still run 32-bit code in 64-bit domain. So I think you want to 
>> check the SPSR mode.
> 
> Do you mean the following check :-
> if ( (is_64bit_domain(current->domain) && (!(regs->spsr & PSR_MODE_BIT)) )

This should work, but I think you can simplify to use:

!psr_mode_is_32bit()

>>> +         */
>>> +        rc = decode_instruction(regs, &info.dabt);
>>
>> I actually expect this to also be useful when forwarding the I/O to 
>> device-model. So I would move the decoding earlier in the code and the 
>> check of dabt.valid earlier.
> 
> You mean I will move decode_instruction() before find_mmio_handler() ?

Yes.

Cheers,

--
Julien Grall


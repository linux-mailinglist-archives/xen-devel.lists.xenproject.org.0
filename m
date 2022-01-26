Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDD49CA03
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260881.451079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChiN-0007fB-NK; Wed, 26 Jan 2022 12:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260881.451079; Wed, 26 Jan 2022 12:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChiN-0007cH-J0; Wed, 26 Jan 2022 12:47:55 +0000
Received: by outflank-mailman (input) for mailman id 260881;
 Wed, 26 Jan 2022 12:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nChiL-0007bx-Ry
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:47:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nChiL-00027H-C7; Wed, 26 Jan 2022 12:47:53 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nChiL-0005b7-5P; Wed, 26 Jan 2022 12:47:53 +0000
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
	bh=FE/oexUuL9In/NBh09bhWlKSau1kwHnncFfywh7oDEo=; b=dwCXqwAltP5gOYYvMZZGFsVzkW
	DFRqImpq1TnUp2XJC5pCPz8vDbUaFcekHzRNXSxDmz4n9/KnWJBdmJKwwGpbujKP83BFVN6f1H8sU
	KaoAqienzHHE52d0YejefVgr8i275h+ype46oXAhhbvYlV5EifirMlLTvX2K/0xXo8b0=;
Message-ID: <b3416dc8-f6a0-bb20-7479-8da1c0bb14df@xen.org>
Date: Wed, 26 Jan 2022 12:47:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, jbeulich@suse.com,
 wei.chen@arm.com
References: <20220125211808.23810-1-ayankuma@xilinx.com>
 <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
 <eebecd4f-1656-7488-b35c-d4778e9788c5@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eebecd4f-1656-7488-b35c-d4778e9788c5@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/01/2022 12:21, Ayan Kumar Halder wrote:
> Hi Julien/Stefano,

Hi,

> On 25/01/2022 23:02, Julien Grall wrote:
>>> +    }
>>> +
>>> +    /*
>>> +     * Handle when rn = SP
>>> +     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer 
>>> register selection"
>>> +     * As we are interested in handling exceptions only from EL1 in 
>>> AArch64 state,
>>> +     * thus M[3:0] == EL1h (Page - C5-480 "When exception taken from 
>>> AArch64 state:")
>>
>> I read the last sentence as "We only support decoding from instruction 
>> run at EL1". But I can't find a check guarantee that.
> Sorry, the check below does that but is used only for rn == 31. I should 
> move ((regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h) ) into a separate 
> check of its own.

The question is why do we want to limit instruction decoding to EL1?

>>
>>> +     */
>>> +    if ( (instr->code.rn == 31) && ((regs->cpsr & PSR_MODE_MASK) != 
>>> PSR_MODE_EL1h) )
>>> +    {
>>> +        gprintk(XENLOG_ERR, "SP is valid only for EL1h\n");
>>> +        goto bad_loadstore;
>>> +    }
>>> +
>>> +    if ( instr->code.v != 0 )
>>> +    {
>>> +        gprintk(XENLOG_ERR,
>>> +            "ldr/str post indexing for vector types are not 
>>> supported\n");
>>> +        goto bad_loadstore;
>>> +    }
>>> +
>>> +    /* Check for STR (immediate) */
>>> +    if ( instr->code.opc == 0 )
>>> +    {
>>> +        dabt->write = 1;
>>> +    }
>>
>> Coding style: We don't use {} for single line. In this case, it would 
>> also result to have a more readable code.
>>
>>> +    /* Check for LDR (immediate) */
>>> +    else if ( instr->code.opc == 1 )
>>> +    {
>>> +        dabt->write = 0;
>>> +    }
>>
>> Same.
>>
>>> +    else
>>> +    {
>>> +        gprintk(XENLOG_ERR,
>>> +            "Decoding ldr/str post indexing is not supported for 
>>> this variant\n");
>>
>> The indentation looks wrong here.
>>
>>> +        goto bad_loadstore;
>>> +    }
>>> +
>>> +    gprintk(XENLOG_INFO,
>>> +        "instr->code.rt = 0x%x, instr->code.size = 0x%x, 
>>> instr->code.imm9 = %d\n",
>>> +        instr->code.rt, instr->code.size, instr->code.imm9);
>>
>> The indentation looks wrong here.
>>
>>> +
>>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
>>> +    dabt->valid = 1;
>>> +
>>> +    return 0;
>>> +
>>> + bad_loadstore:
>>> +    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", 
>>> instr->value);
>>> +    return 1;
>>> +}
>>> +
>>>   static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>>>   {
>>>       uint16_t instr;
>>> @@ -150,17 +245,44 @@ bad_thumb:
>>>       return 1;
>>>   }
>>>   -int decode_instruction(const struct cpu_user_regs *regs, struct 
>>> hsr_dabt *dabt)
>>> +int decode_instruction(const struct cpu_user_regs *regs, struct 
>>> hsr_dabt *dabt,
>>> +                       union ldr_str_instr_class *instr)
>>
>> I would like to avoid make the assumption that the instr we decode 
>> will always be a store/load. So please rename it to something more 
>> generic.
> 
> A difference of thought. Should we not name it as per the current usage 
> ? This will avoid any ambiguity.

What ambiguity? The caller should be completely agnostic to what 
instruction we decode.

> Later, if this gets extended, then it 
> can be named more appropriately depending on the usage.

Renaming afterwards is exactly what I want to avoid.

> 
> Also, the bit-pattern in "union ldr_str_instr_class" is very much 
> specific to ldr/str.

I agree that the bit-pattern is specific to load/store. But that's just 
one way to interpret the 32-bit value. It would be easy to add another 
way to interpret it. I.e:

union
{
    value;
    struct {
    } str_ldr;
    struct {
    } brk;
}

>> I think moving if ( !dabt.valid ) earlier should be part of a 
>> pre-patch. This would allows us to backport it as we don't want to 
>> forward the I/O to an IOREQ server if ISV=0.
> I would say that in the pre-patch, we should move "if ( !dabt.valid )" 
> before "find_mmio_handler()". The reason being if the intruction was not 
> decoded successfully (ie ISV=0), then there is no need to find the mmio 
> handler corresponding to the gpa. Please let me know your thoughts and I 
> can send the pre-patch.

Sounds good to me.

>>
>>>       /*
>>>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>>>        * not have correct HSR Rt value.
>>> @@ -134,7 +145,7 @@ enum io_state try_handle_mmio(struct 
>>> cpu_user_regs *regs,
>>>       {
>>>           int rc;
>>>   -        rc = decode_instruction(regs, &info.dabt);
>>> +        rc = decode_instruction(regs, &info.dabt, NULL);
>>
>> Could we combine the two decode_instruction()?
> 
> Do you mean something like this :-

Yes. But...

> 
> if ( (!info.dabt.valid ) || (( check_workaround_766422() && (regs->cpsr 
> & PSR_THUMB) &&
>           dabt.write) )
> 
> {
> 
>          rc = decode_instruction(regs, &info.dabt, &instr); // We know 
> that for PSR_THUMB, instr is ignored.

... without this comment. Also see my reply to Stefano's email.

[...]

> So you mean something like this (in traps.c):-
> 
> #if CONFIG_ARM_64
> 
> void post_increment_register(union ldr_str_instr_class *instr)
> 
> {
> 
>      // handle the post increment
> 
> }
> 
> #else
> 
> void post_increment_register(union ldr_str_instr_class *instr)
> 
> {
> 
>      ASSERT_UNREACHABLE();
> 
> }
> 
> #endif
> 
> If so, I am fine with this.

Yes.

Cheers,

-- 
Julien Grall


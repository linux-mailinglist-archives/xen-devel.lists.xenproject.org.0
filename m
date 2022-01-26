Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4549C6C2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 10:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260754.450789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCer5-0003Fq-WD; Wed, 26 Jan 2022 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260754.450789; Wed, 26 Jan 2022 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCer5-0003DK-T5; Wed, 26 Jan 2022 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 260754;
 Wed, 26 Jan 2022 09:44:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCer4-0003DE-Hn
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 09:44:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCer4-00074r-2u; Wed, 26 Jan 2022 09:44:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCer3-0007lR-T9; Wed, 26 Jan 2022 09:44:42 +0000
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
	bh=/1k0ls0duDmH7JNtDh/Pp5kADAmxetgGMMjYePbknc4=; b=b6GeXGnZl9xJ4jiH6LnlG4vYw5
	Sn7amNhAz9iaxQahd7+XqWaD2GfJmGkj/RR8jkX+98Jvn4o3Jb8EyVJlDjYKVSBSB4NAneTUjC/WA
	tF1GFMao8S0F3d8I7rPs5AriBscxbhsSAEwyXeEaJixhRynPkH7THPoc5TyBHTRjnGQI=;
Message-ID: <b28ca89c-290d-2c56-1bf7-a5be3dacc55a@xen.org>
Date: Wed, 26 Jan 2022 09:44:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, stefanos@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, jbeulich@suse.com, wei.chen@arm.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220125211808.23810-1-ayankuma@xilinx.com>
 <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
 <alpine.DEB.2.22.394.2201251519120.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201251519120.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/01/2022 01:45, Stefano Stabellini wrote:
> On Tue, 25 Jan 2022, Julien Grall wrote:
>>> +
>>>        /* TODO: Handle ARM instruction */
>>>        gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>>>          return 1;
>>>    }
>>>    +#if CONFIG_ARM_64
>>> +void post_increment_register(union ldr_str_instr_class *instr)
>>
>> instr should not be modified, so please use const. Also, it would be
>> preferrable to pass the regs in parameter. So the none of the decoding code
>> relies on the current regs.
>>
>> Furthermore, decode.c should only contain code to update the syndrome and in
>> theory Arm could decide to provide an valid syndrome in future revision. So I
>> would move this code in io.c (or maybe traps.c).
> 
> I was the one to suggest moving it to decode.c to keep it closer to the
> decoding function it is related to, and also because it felt a bit out
> of place in io.c.

How about traps.c? This is where we also take care of incrementing pc 
after we handle a MMIO trap.

>>> +{
>>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>>> +    register_t val;
>>> +
>>> +    /* handle when rn = SP */
>>> +    if ( instr->code.rn == 31 )
>>> +        val = regs->sp_el1;
>>> +    else
>>> +        val = get_user_reg(regs, instr->code.rn);
>>> +
>>> +    val += instr->code.imm9;
>>> +
>>> +    if ( instr->code.rn == 31 )
>>> +        regs->sp_el1 = val;
>>> +    else
>>> +        set_user_reg(regs, instr->code.rn, val);
>>> +}
>>> +#endif
>>> +
>>>    /*
>>>     * Local variables:
>>>     * mode: C
>>> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
>>> index 4613763bdb..511cd4a05f 100644
>>> --- a/xen/arch/arm/decode.h
>>> +++ b/xen/arch/arm/decode.h
>>> @@ -23,6 +23,35 @@
>>>    #include <asm/regs.h>
>>>    #include <asm/processor.h>
>>>    +/*
>>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
>>> + * Page 318 specifies the following bit pattern for
>>> + * "load/store register (immediate post-indexed)".
>>> + *
>>> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
>>> + * ___________________________________________________________________
>>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
>>> + * |____|______|__|____|____|__|_______________|____|_________|_______|
>>> + */
>>> +union ldr_str_instr_class {
>>> +    uint32_t value;
>>> +    struct ldr_str {

No need to name the struct here.

>>> +        unsigned int rt:5;     /* Rt register */
>>> +        unsigned int rn:5;     /* Rn register */
>>> +        unsigned int fixed1:2; /* value == 01b */
>>> +        signed int imm9:9;            /* imm9 */
>>> +        unsigned int fixed2:1; /* value == 0b */
>>> +        unsigned int opc:2;    /* opc */
>>> +        unsigned int fixed3:2; /* value == 00b */
>>> +        unsigned int v:1;      /* vector */
>>> +        unsigned int fixed4:3; /* value == 111b */
>>> +        unsigned int size:2;   /* size */
>>> +    } code;

It would be best to name it ldr_str so this can be easily extended (e.g. 
no renaming) for other instructions in the future.

>>> +};
>>
>> Looking at the code, post_increment_register() only care about 'rn' and
>> 'imm9'. So rather than exposing the full instruction, could we instead provide
>> the strict minimum? I.e something like:
>>
>> struct
>> {
>>       enum instr_type; /* Unknown, ldr/str post increment */
>>       union
>>       {
>>           struct
>>           {
>>             register; /* Register to increment */
>>             imm;      /* Immediate to add */
>>           } ldr_str;
>>       }
>>       uint64_t register;
>> }
>   
> The full description helped a lot during review. I would prefer to keep
> it if you don't feel strongly about it.

I haven't suggested to drop the union. Instead, I am suggesting to keep 
it internally to decode.c and expose something different to the external 
the user. The idea is the caller doesn't care about the full 
instruction, it only cares about what action to do.

Basically, what I am asking is an augmented dabt. So all the information 
are in one place rather than having to carry two structure (struct 
hsr_dabt and union ldr_str_instr_class) which contain mostly redundant 
information.

Cheers,

-- 
Julien Grall


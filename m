Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F04BE3E3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276389.472528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMCw7-0006jz-0I; Mon, 21 Feb 2022 17:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276389.472528; Mon, 21 Feb 2022 17:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMCw6-0006i9-TS; Mon, 21 Feb 2022 17:57:22 +0000
Received: by outflank-mailman (input) for mailman id 276389;
 Mon, 21 Feb 2022 17:57:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMCw6-0006i3-2e
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 17:57:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMCw5-0003CZ-PV; Mon, 21 Feb 2022 17:57:21 +0000
Received: from [54.239.6.189] (helo=[192.168.5.64])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMCw5-0007tb-J0; Mon, 21 Feb 2022 17:57:21 +0000
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
	bh=eB18/8J0cqV/Svq+HKVvvHntT2R2n2FcQK/gpo/qTIs=; b=AawMLZXwnOhGYhdGUddf9+mZCS
	pQGvooMQbJF005zDxGX5wMdkM+MuI24LZzV81nCBfxde3cnA1qDNA8kHxjjGYTgbnBt33ft/fTV5L
	w+E7fV04OeXuX1twxdRqSQZlHBQzJtgkAfN0uffcLK0wYgFtjNF+X87Q3RIJZZ1q3yMY=;
Message-ID: <576cf522-f002-afac-36b6-b31f87724dca@xen.org>
Date: Mon, 21 Feb 2022 17:57:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v8 2/2] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220212233433.46018-1-ayankuma@xilinx.com>
 <20220212233433.46018-3-ayankuma@xilinx.com>
 <1599e2f3-0a34-020a-dd42-5ba87dad555d@xen.org>
 <10cf253b-fc58-1afc-66ec-33ac3008bb0f@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <10cf253b-fc58-1afc-66ec-33ac3008bb0f@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/02/2022 17:05, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> On 13/02/2022 12:19, Julien Grall wrote:
>>>   }
>>>     void register_mmio_handler(struct domain *d,
>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>> index 308650b400..3c0a935ccf 100644
>>> --- a/xen/arch/arm/ioreq.c
>>> +++ b/xen/arch/arm/ioreq.c
>>> @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>> *regs,
>>>                                struct vcpu *v, mmio_info_t *info)
>>>   {
>>>       struct vcpu_io *vio = &v->io;
>>> +    struct dabt_instr instr = info->dabt_instr;
>>>       ioreq_t p = {
>>>           .type = IOREQ_TYPE_COPY,
>>>           .addr = info->gpa,
>>> @@ -76,10 +77,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>> *regs,
>>>       if ( !s )
>>>           return IO_UNHANDLED;
>>>   -    if ( !info->dabt.valid )
>>> -        return IO_ABORT;
>>> -
>>
>> For this one, I would switch to ASSERT(dabt.valid);
> I see that try_fwd_ioserv() is invoked from try_handle_mmio() only. 
> Thus, if I follow your suggestion of adding a check for dabt.valid at 
> the beginning of try_handle_mmio(), then this ASSERT() is not required.

I agree that try_handle_mmio() is the only caller today. But we don't 
know how this is going to be used tomorrow.

The goal of this ASSERT() is to catch those new users that would call it 
wrongly.

[...]

>> ... this will inject a data abort to the guest when we can't decode. 
>> This is not what we want. We should check whether this is a P2M 
>> translation fault or we need to map an MMIO region.
>>
>> In pseudo-code, this would look like:
>>
>> if ( !is_data || hsr.dabt.valid )
> 
> I think you mean if ( !is_data || !hsr.dabt.valid )

You are right.

> 
> The reason being if there is an instruction abort or a data abort (with 
> ISV == 0), then it should try to configure the page tables.
> 
>> {
>>     if ( check_p2m() )
>>       return;
>>
>>
>>     if ( !is_data )
>>        goto inject_dabt;
>>
>>     decode_instruction();
>>     if ( !dabt.invalid )
>>       goto inject_dabt;
>> }
>>
>> try_handle_mmio();
>>
>> if ( instruction was not decoded )
>>   check_p2m();
> 
> If the instruction was not decoded, then there is no need to configure 
> the page tables again. We have already done this before.

Hmmmm... I think there are confusing about which sort of decoding I was 
referring to. In this case, I mean if we didn't decode the instruction 
manully, then it is not necessary to call check_p2m().

Do you agree with that?

> So my understanding is as follows :-
> 
>          /* Check that it is instruction abort or ISS is invalid. */

I have had a remark on this line before. Please have a look and address it.

>          if ( !is_data || !info.dabt.valid )
>          {
>              /*
>               * If the instruction was trapped due to access to stage 1 
> translation
>               * then Xen should try to resolve the page table entry for 
> the stage 1
>               * translation table with the assumption that the page 
> tables are
>               * present in the non MMIO region. If it is successful, 
> then it should
>               * ask the guest to retry the instruction.
>               */

I agree that we want to skip the MMIO mapping when s1ptw == 1. However, 
I am not sure this belongs to this patch because this is technically 
already a bug.

>              if ( is_data && info.dabt.s1ptw )
>              {
>                  info.dabt_instr.state = INSTR_RETRY;
>                  /* The translation tables are assumed to be in non MMIO 
> region. */
>                  is_data = false;

is_data is also used to decide which sort of abort we want to send to 
the guest (see after inject_dabt). So I don't think we could force set 
is_data here.

Instead, I would define a new local variable (maybe mmio_access_allowed) 
that will be set for instruction abort or when s1ptw is 1.

>              }
> 
>              /*
>               * Assumption :- Most of the times when we get a 
> translation fault
>               * and the ISS is invalid, the underlying cause is that the 
> page
>               * tables have not been set up correctly.
>               */

I think this comment make more sense on top of "if !is_data || 
!info.dabt.valid".

>              if ( check_p2m(is_data, gpa) )
>                  return;
> 
>              /*
>               * If the instruction abort or the data abort due to access 
> to stage 1
>               * translation tables could not be resolved by setting the 
> appropriate
>               * bits in the translation table, then Xen should abort the 
> guest.

IHMO, "abort the guest" means we are going to crash the guest. However, 
this not the case here. We are telling the guest that we couldn't handle 
the data/instruction request. It is up to the guest to decide whether it 
should panic or handle gracefully the error.

We should also avoid the term guest because it usually only refers to 
any domain but dom0.

Therefore, I would reword it to something like "Xen will forward the 
data/instruction abort to the domain".

>               */
>              if ( !is_data || (info.dabt_instr.state == INSTR_RETRY) )

The second part looks unnecessary.

>                  goto inject_abt;
> 
>              try_decode_instruction(regs, &info);
> 
>              /* Instruction could not be decoded, then abort the guest */
> 
>              if ( info.dabt_instr.state == INSTR_ERROR)
>                  goto inject_abt;
>          }
> 
>          state = try_handle_mmio(regs, &info);
> 
>          switch ( state )
>          {
>              case IO_ABORT:
>                  goto inject_abt;
>              case IO_HANDLED:
>                  /*
>                   * If the instruction was decoded and has executed 
> successfully
>                   * on the MMIO region, then Xen should execute the next 
> part of
>                   * the instruction. (for eg increment the rn if it is a
>                   * post-indexing instruction.
>                   */
>                  post_increment_register(&info.dabt_instr);
>                  advance_pc(regs, hsr);
>                  return;
>              case IO_RETRY:
>                  /* finish later */
>                  return;
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
>          }
> 
>          if ( check_p2m(is_data, gpa) )

It is unnecessary to call check_p2M() if we manually decoded the 
instruction (see above why).

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD74A77C8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 19:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264403.457500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFKG2-0004R6-1J; Wed, 02 Feb 2022 18:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264403.457500; Wed, 02 Feb 2022 18:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFKG1-0004OT-UN; Wed, 02 Feb 2022 18:21:29 +0000
Received: by outflank-mailman (input) for mailman id 264403;
 Wed, 02 Feb 2022 18:21:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nFKG0-0004ON-Gz
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 18:21:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFKFz-000881-VK; Wed, 02 Feb 2022 18:21:27 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.2.82])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nFKFz-0000kU-Mv; Wed, 02 Feb 2022 18:21:27 +0000
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
	bh=uapE0SCN1j90Ug6oJSnZZdAlP8j3B77iTnpSFf4PEtY=; b=xNbJ41pWafJjEc1lKYapUHiynn
	7YOCLieSYJdpo/X/RJmucD1rR22qNai3VItx5X+AR4ctPloTkkcQZg5gFe0tdeGTuAOm3edfhBxhK
	Hy4S/2sAKP8hbFqfeaG+APdIDuy4aLHpdVTh97SoIiSc5K6RGuXZjGh3R2P4S1gs+xKk=;
Message-ID: <e0b3cf63-360e-9625-a74e-b728e3de5c55@xen.org>
Date: Wed, 2 Feb 2022 18:21:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v5] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220131193728.2980-1-ayankuma@xilinx.com>
 <e07068aa-91b8-ebdf-db17-7173f417ad33@xen.org>
 <453fa8d1-6d12-ea23-6b35-e556f72fe0cf@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <453fa8d1-6d12-ea23-6b35-e556f72fe0cf@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/02/2022 13:05, Ayan Kumar Halder wrote:
> On 31/01/2022 19:37, Ayan Kumar Halder wrote:
>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>> index 308650b400..f19fb46f72 100644
>>> --- a/xen/arch/arm/ioreq.c
>>> +++ b/xen/arch/arm/ioreq.c
>>> @@ -23,16 +23,35 @@
>>>     #include <public/hvm/ioreq.h>
>>>   +#include "decode.h"
>>> +
>>>   enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu 
>>> *v)
>>>   {
>>>       const union hsr hsr = { .bits = regs->hsr };
>>> -    const struct hsr_dabt dabt = hsr.dabt;
>>> +    struct hsr_dabt dabt = hsr.dabt;
>>> +
>>>       /* Code is similar to handle_read */
>>>       register_t r = v->io.req.data;
>>>         /* We are done with the IO */
>>>       v->io.req.state = STATE_IOREQ_NONE;
>>>   +    /*
>>> +     * Note that we have already decoded the instruction in 
>>> try_fwd_ioserv().
>>> +     * We decode the instruction again to obtain rn and imm9. This 
>>> will be used
>>> +     * to do the post increment.
>>> +     * Also there is no need to check whether the instruction can be 
>>> decoded or
>>> +     * was successfully decoded. The reason being if there was an 
>>> error, then
>>> +     * try_fwd_ioserv() would have returned error and this function 
>>> would not
>>> +     * have been called. Thus, there is an assumption that 
>>> handle_iosev() is
>>> +     * invoked when try_fwd_ioserv() has returned successfully.
>>
>> I am afraid this is not a correct assumption. Another vCPU can modify 
>> the instruction between the two decoding. So the right solution is to 
>> stash the information for latter consumption.
>>
>>> +     */
>>> +    if ( !dabt.valid )
>>> +    {
>>> +        decode_instruction(regs, &dabt);
>>> +        post_increment_register(&dabt.dabt_instr);
>>> +    }
>>> +
>>>       if ( dabt.write )
>>>           return IO_HANDLED;
>>>   @@ -65,6 +84,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>> *regs,
>>>       };
>>>       struct ioreq_server *s = NULL;
>>>       enum io_state rc;
>>> +    bool instr_decoded = false;
>>> +    const union hsr hsr = { .bits = regs->hsr };
>>>         if ( vio->req.state != STATE_IOREQ_NONE )
>>>       {
>>> @@ -76,8 +97,18 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs 
>>> *regs,
>>>       if ( !s )
>>>           return IO_UNHANDLED;
>>>   +    /*
>>> +     * Armv8 processor does not provide a valid syndrome for 
>>> decoding some
>>> +     * instructions (for eg post-indexing ldr/str instructions). So 
>>> in order to
>>> +     * process these instructions, Xen must decode them.
>>> +     */
>>>       if ( !info->dabt.valid )
>>> -        return IO_ABORT;
>>> +    {
>>> +        rc = try_decode_instruction_invalid_iss(regs, &info->dabt);
>>> +
>>> +        if ( rc != IO_HANDLED)
>>> +            return rc;
>>> +    }
>>
>> As you pointed out previously, the field SAS (Syndrome Access Size) is 
>> invalid when the ISV=0. So the decoding needs to be done *before* we 
>> select the IOREQ server.
>>
>> But as I said, this would result to decode the instruciton when this 
>> is not necessary. This is where Stefano's suggestion in [1] is useful.
>>
>> For ISV=0, it will be a lot more common to trap because of a P2M 
>> translation fault (of the MMIO is not mapped). So we should call that 
>> first and then, if it still not resolved, try to decode the instruction.
>>
>> With that in place, you are avoiding the issue in try_fwd_ioserv().
>>
>> Can you please coordinate with Stefano?
> 
> I am a bit confused regarding where we need to handle to post increment 
> of Rn in case of ioreq.
> 
> I can see the following two places where PC gets incremented :-
> 
> 1. handle_ioserv() returns IO_HANDLED via try_handle_mmio(). And then in 
> "case IO_HANDLED:", PC is incremented.
> 
> 2. leave_hypervisor_to_guest() ---> check_for_vcpu_work() --> 
> vcpu_ioreq_handle_completion() --> arch_ioreq_complete_mmio(). Here PC 
> is incremented as well.
> 
> So, do I need to update Rn in both the above places.
> 
> And if I understood your previous comment "Another vCPU can modify the 
> instruction between the two decoding....", you are suggesting to save 
> the instruction opcode (from PC) before invoking try_fwd_ioserv(). So, 
> that it can be decoded again in arch_ioreq_complete_mmio() without 
> reading PC.
We should not need to decode the instruction twice. Instead, we could 
add the instruction details in vcpu_io as there can only be one I/O 
inflight per vCPU.

Note that vcpu_io is an arch-agnostic structure. So you would want to 
embedded an arch specific structure (e.g. arch_vcpu_io) that would 
defined in arch/arm/include/asm/ioreq.h.

For x86, you could define a dummy structure in arch/x86/include/asm/ioreq.h.

Cheers,

-- 
Julien Grall


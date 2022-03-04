Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E84CD46F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 13:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284268.483475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ7J9-0003vc-Jm; Fri, 04 Mar 2022 12:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284268.483475; Fri, 04 Mar 2022 12:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ7J9-0003t8-Fq; Fri, 04 Mar 2022 12:45:19 +0000
Received: by outflank-mailman (input) for mailman id 284268;
 Fri, 04 Mar 2022 12:45:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ7J8-0003t2-HY
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 12:45:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ7J7-0001jq-T2; Fri, 04 Mar 2022 12:45:17 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ7J7-0006hh-M1; Fri, 04 Mar 2022 12:45:17 +0000
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
	bh=4ORg51VQcbeoJRtDmWuHU8qi2+q7pSAtFjmJOldN+6E=; b=DAXCA1dH0ndi0sXZABmhGVz2p2
	AUvNNFHdcliD79ZI1nmuXZdnWWJl4eWHJoEH9c+7zgfsDA1nc3C7BX6Fqxd+tl2GHIdy1MhRns81Y
	eYYvm6uHkDt4WhN5o4eyLrH3cRjfKmIAQ7Pr4z4d4MOAO2rU2JDZ/o95HzzCa6GlZ+us=;
Message-ID: <b2e5d9ae-5ed0-f1ad-cf82-b66528577456@xen.org>
Date: Fri, 4 Mar 2022 12:45:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-3-ayankuma@xilinx.com>
 <d41241f9-de9d-e681-2768-d44531722069@xen.org>
 <e4cb625d-5f2a-7e93-85ad-701e01e95e7f@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e4cb625d-5f2a-7e93-85ad-701e01e95e7f@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/03/2022 11:27, Ayan Kumar Halder wrote:
>>
>>> +        {
>>> +            rc = decode_instruction(regs, info);
>>> +            if ( rc )
>>> +            {
>>> +                gprintk(XENLOG_DEBUG, "Unable to decode 
>>> instruction\n");
>>> +                info->dabt_instr.state = INSTR_ERROR;
>>> +        }
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Armv8 processor does not provide a valid syndrome for 
>>> decoding some
>>> +     * instructions. So in order to process these instructions, Xen 
>>> must
>>> +     * decode them.
>>> +     */
>>> +    rc = decode_instruction(regs, info);
>>> +    if ( rc )
>>> +    {
>>> +        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
>>> +        info->dabt_instr.state = INSTR_ERROR;
>>> +    }
>>> +}
>>> +
>>>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>> -                              const union hsr hsr,
>>> -                              paddr_t gpa)
>>> +                              mmio_info_t *info)
>>>   {
>>>       struct vcpu *v = current;
>>>       const struct mmio_handler *handler = NULL;
>>> -    const struct hsr_dabt dabt = hsr.dabt;
>>> -    mmio_info_t info = {
>>> -        .gpa = gpa,
>>> -        .dabt = dabt
>>> -    };
>>> +    int rc;
>>>   -    ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>> +    ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>>>   -    handler = find_mmio_handler(v->domain, info.gpa);
>>> -    if ( !handler )
>>> +    if ( !((info->dabt_instr.state == INSTR_VALID) || 
>>> (info->dabt_instr.state == INSTR_LDR_STR_POSTINDEXING)) )
>>
>> This check will become quite large if we decode more class. I would 
>> instead set the dabt.valid bit whenever we successfully decoded the 
>> instruction and check that if dabt.valid here.
> 
> Actually the main reason to introduce INSTR_LDR_STR_POSTINDEXING is to 
> distinguish the scenario where the ISS was valid vs when instruction was 
> decoded manually.
> 
> In the later scenario, one would need to do the post increment of the rn.
> 
> It makes sense to me to have a unque 'info->dabt_instr.state' for each 
> type of instruction decoded as the post processing will vary. In this 
> case, the post processing logic checks that the instruction is 
> ldr_str_postindexing.

So I agree we want to have a unique state for type of instruction. I 
wasn't suggesting to remove it. Instead, I was suggesting to use 
dabt.valid as "This is a valid instruction for accessing an emulated MMIO".

> 
> However your concern that the check will become large is valid. I would 
> introduce a function as follows :-
> 
> bool check_instr_is_valid(enum instr_decode_state state)
> 
> {
> 
>      if (state == INSTR_VALID) || (state == INSTR_LDR_STR_POSTINDEXING) 
> || ...)
> 
>          return true;
> 
>      else
> 
>          return false;
> 
> }
> 
> And then in
> 
> enum io_state try_handle_mmio(struct cpu_user_regs *regs, ...)
> 
> {
> 
> ...
> 
>      if ( !check_instr_is_valid(info->dabt_instr.state) )
> 
>      {
> 
>          ASSERT_UNREACHABLE();
>          return IO_ABORT;
> 
>      }
> 
> ...
> 
> }
> 
> Please let me know your thoughts,

This is only moving the check to a separate function. It doesn't help 
with the fact that the check in check_instr_is_valid() is going to grow.

I can see two options:
   * Using dabt.valid as "The instruction was fully decoded".
   * Check that the state is not INSTR_ERROR

Above, I was suggesting the former. But I am open to use latter.

Cheers,

-- 
Julien Grall


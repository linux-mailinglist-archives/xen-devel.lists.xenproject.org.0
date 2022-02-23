Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C44C1C06
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277762.474586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxAV-0005XD-Bx; Wed, 23 Feb 2022 19:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277762.474586; Wed, 23 Feb 2022 19:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMxAV-0005VC-8T; Wed, 23 Feb 2022 19:19:19 +0000
Received: by outflank-mailman (input) for mailman id 277762;
 Wed, 23 Feb 2022 19:19:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMxAT-0005V6-3d
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:19:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMxAS-0000DD-Nz; Wed, 23 Feb 2022 19:19:16 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.122.138]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMxAS-0003VF-Hd; Wed, 23 Feb 2022 19:19:16 +0000
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
	bh=JUjFZTkHyv0ldXPReND+ZBWvggKmkNWUS9Mifmc1krQ=; b=PoSeKBuTc83daU/Fn4xjCqNJb/
	TPJA5cgOBUPCqAbWg+W7P4LgsOBekaaJ+bHN8/Dl+0zzGfc6PyyICrzWLBA4VkL4puOAIpChE38WY
	UpN8FHU1OZZ73eJP6rGTz8/czzapgcEfrtqTfHBRO5/zlmTLW9AH3PCKi796qnjFNjlQ=;
Message-ID: <252bc55a-8975-72c9-95f1-abeb6ab607c2@xen.org>
Date: Wed, 23 Feb 2022 19:19:14 +0000
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
 <576cf522-f002-afac-36b6-b31f87724dca@xen.org>
 <e53b1407-4701-f0f1-5f49-5bd8cbb6eb41@xilinx.com>
 <96610d30-0de2-96e9-e838-504acf83a8d8@xen.org>
 <8c45a34c-9e54-1a9b-d894-f05f41412657@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c45a34c-9e54-1a9b-d894-f05f41412657@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 21/02/2022 21:10, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> 
> On 21/02/2022 19:13, Julien Grall wrote:
>>
>>
>> On 21/02/2022 19:05, Ayan Kumar Halder wrote:
>>> If we (ie Xen) didn't decode the instruction manually, then 
>>> check_p2m() has not been invoked yet.  This is because of the 
>>> following (info.dabt.valid == True) :-
>>>
>>>          if ( !is_data || !info.dabt.valid )
>>>          {
>>>
>>>                  ...
>>>
>>>                  if ( check_p2m(is_data, gpa) )
>>>                      return;
>>>
>>>                  ...
>>>
>>>          }
>>>
>>> So, in this scenario ( !info.dabt.valid), it would not be necessary 
>>> to invoke check_p2m() after try_handle_mmio().
>>>
>>> However, if we havenot decoded the instruction manually (ie 
>>> info.dabt.valid == True), and try_handle_mmio() returns IO_UNHANDLED, 
>>> then it will be necessary to invoke "check_p2m(is_data, gpa)"
>>
>> Hmmm you are right. But this doesn't seem to match the code you wrote 
>> below. What did I miss?
> 
> My code was not correct.  I have rectified it as below. Please let me 
> know if it looks sane.

This looks good to me with one remark below.

> 
> <snip>
> 
>      case FSC_FLT_TRANS:
>      {
>          info.gpa = gpa;
>          info.dabt = hsr.dabt;
> 
>          /*
>           * Assumption :- Most of the times when we get a data abort and 
> the ISS
>           * is invalid or an instruction abort, the underlying cause is 
> that the
>           * page tables have not been set up correctly.
>           */
>          if ( !is_data || !info.dabt.valid )
>          {
>              if ( check_p2m(is_data, gpa) )
>                  return;
> 
>              /*
>               * If the instruction abort could not be resolved by 
> setting the
>               * appropriate bits in the translation table, then Xen should
>               * forward the abort to the guest.
>               */
>              if ( !is_data )
>                  goto inject_abt;
> 
>              try_decode_instruction(regs, &info);
> 
>              /*
>               * If Xen could not decode the instruction or encountered 
> an error
>               * while decoding, then it should forward the abort to the 
> guest.
>               */
>              if ( info.dabt_instr.state == INSTR_ERROR )
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
>          /*
>           * If the instruction was valid but Xen could not emulate the 
> instruction
>           * then it should configure the page tables to set the correct 
> page table
>           * entry corresponding to the faulting address. If it was 
> successful, it
>           * should return to the guest to retry the instruction (hoping 
> that the
>           * instruction will not be trapped to Xen again).
>           * However, if Xen was not successful in setting the page 
> tables, then
>           * it should forward the abort to the guest.
>           */

I would shorten to:

If the instruction syndrome was invalid, then we already checked if this 
was due to a P2M fault. So no point to check again as the result will be 
the same.

Cheers,

-- 
Julien Grall


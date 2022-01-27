Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9D949EC7A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 21:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261741.453446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDBMl-0007c7-Cq; Thu, 27 Jan 2022 20:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261741.453446; Thu, 27 Jan 2022 20:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDBMl-0007Z2-8y; Thu, 27 Jan 2022 20:27:35 +0000
Received: by outflank-mailman (input) for mailman id 261741;
 Thu, 27 Jan 2022 20:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDBMj-0007Yw-Pz
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 20:27:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDBMj-0000ZL-Bq; Thu, 27 Jan 2022 20:27:33 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDBMj-0000gK-5J; Thu, 27 Jan 2022 20:27:33 +0000
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
	bh=or0l77o6KKBH8TWZ0VlBt47TJfw/x1KjgGi+zgJPUqs=; b=ngwodQfADA14+xNblM8QA6MiDE
	TgvnWSiHO/E9oXkQKYh/UUu98JXYRFvbHGntGgaKL/mleTTw5XGFvANl+YAIpFNGgDWeS+bLFmXY5
	UNGQ+CfSl3S6YFDFNCJsgYmh8jxJMt/5OUJ+Mq8s7TGbThfBoQwj7NVTsgiCayZXzHzI=;
Message-ID: <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
Date: Thu, 27 Jan 2022 20:27:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220126165827.61168-1-ayankuma@xilinx.com>
 <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
 <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com>
 <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
 <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/01/2022 15:48, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> On 27/01/2022 13:57, Julien Grall wrote:
>>
>>
>> On 27/01/2022 13:20, Ayan Kumar Halder wrote:
>>> Hi,
>>>
>>> Asking here as well (might not have been clear on irc).
>>>
>>> On 27/01/2022 00:10, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On Wed, 26 Jan 2022, 17:56 Ayan Kumar Halder, 
>>>> <ayan.kumar.halder@xilinx.com> wrote:
>>>>
>>>>     Hi Julien,
>>>>
>>>>     On 26/01/2022 17:22, Julien Grall wrote:
>>>>>     Hi,
>>>>>
>>>>>     On Wed, 26 Jan 2022, 16:58 Ayan Kumar Halder,
>>>>>     <ayan.kumar.halder@xilinx.com> wrote:
>>>>>
>>>>>         Refer to Armv8 ARM DDI 0487G.b, Page D13-3219 "ISS encoding
>>>>>         for an exception
>>>>>         from a Data Abort" :-
>>>>>         ISV - ISS[23:14] holds a valid instruction syndrome
>>>>>
>>>>>         When the ISV is 0, the instruction could not be decoded by
>>>>>         the hardware (ie ISS
>>>>>         is invalid). One should immediately return an error to the
>>>>>         caller with an
>>>>>         appropriate error message.
>>>>>
>>>>>     That's going to be very spammy because we have use-case where it
>>>>>     could trap without a valid ISV (e.g. when break-before-make
>>>>>     happens). So please don't had a message.
>>>>
>>>>     There is already a logging statement in traps.c :-
>>>>
>>>>     inject_abt:
>>>>         gdprintk(XENLOG_DEBUG,
>>>>                  "HSR=%#"PRIregister" pc=%#"PRIregister"
>>>>     gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
>>>>                  hsr.bits, regs->pc, gva, gpa);
>>>>
>>>>     The reason for the error is to give the user some hint that an IO
>>>>     abort is triggered by Xen.
>>>>
>>>> The main difference here is inject_dabt should only be reached when 
>>>> we exhausted all the possibility in I/O handling.
>>>>
>>>> In your case, if we can't handle as an MMIO then we should 
>>>> fallthrough the other method (see do_trap_stage2_abort_guest()).
>>>>
>>>> In fact, moving the check early and doing the decoding before 
>>>> find_mmio() or try_fwd_io() is actually wrong. Sorry I should 
>>>> realized that earlier.
>>>
>>> Why should we care about MMIO when ISS is invalid ?
>>
>> Because a translation fault doesn't mean this is emulated MMIO. This 
>> may be actual RAM but with the stage-2 entry marked as invalid for 
>> tracking purpose (or else).
>>
>>> Should we not check first if the ISS is valid or not as it will 
>>> trigger IO_abort regardless of the MMIO.
>>
>> No. Imagine the guest decides to use a store exclusive on a RAM region 
>> that was temporally marked as invalid in the stage-2 page-table.
>>
>> This will generate a data abort in Xen with ISV=0. We want to try to 
>> resolve the fault first and retry the instruction.
>>
>>>
>>> I am assuming that once Xen resolves the MMIO 
>>> (p2m_resolve_translation_fault()), the guest will again try to run 
>>> the same instruction on MMIO region. This will be trapped in Xen 
>>> which will return IO abort as the post-indexing instruction could not 
>>> be decoded.
>>
>> The access will not trap again in Xen if the fault was resolved.
> 
> I think your words makes sense.
> 
> However, I am still concerned that we might not be doing the correct 
> thing in try_fwd_ioserv().
> 
> See this :-
> 
>      ioreq_t p = {
>          .type = IOREQ_TYPE_COPY,
>          .addr = info->gpa,
>          .size = 1 << info->dabt.size,
>          .count = 1,
>          .dir = !info->dabt.write,
>          /*
>           * On x86, df is used by 'rep' instruction to tell the direction
>           * to iterate (forward or backward).
>           * On Arm, all the accesses to MMIO region will do a single
>           * memory access. So for now, we can safely always set to 0.
>           */
>          .df = 0,
>          .data = get_user_reg(regs, info->dabt.reg),
>          .state = STATE_IOREQ_READY,
>      };
> If info->dabt.valid = 0, then '.size', '.dir' and '.data' fields are 
> invalid.

Sort of. ISV=0 means that bits [23:14] are RES0. So this doesn't cover 
the field WnR. The validity of WnR will depend on DFSC. In our case, we 
will always reach this code with a translation fault. So WnR should 
always be valid.

That said, the rest will not be valid.

> 
> '.size' gets used in ioreq_server_select() to obtain the end address. It 
> seems incorrect to me.
> 
> I suppose "if ( !info->dabt.valid )" needs to be checked before "s = 
> ioreq_server_select(v->domain, &p);".

The trouble is we would need to return IO_UNHANDLED (so the rest of the 
code can pick it up) which I think is incorrect here.

The approach I can think of is to call ioreq_server_select() with size = 
0 (i.e. byte access). Then decode the size (if needed) and then check 
the access is correct.

This is not very nice. But that at the same time, I would like to avoid 
dealing emulated I/O in Xen or outside differently. Stefano?

Cheers,

-- 
Julien Grall


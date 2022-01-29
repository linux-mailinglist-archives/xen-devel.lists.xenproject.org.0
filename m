Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E894A310A
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 18:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262272.454441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDrep-0003wE-MH; Sat, 29 Jan 2022 17:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262272.454441; Sat, 29 Jan 2022 17:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDrep-0003uN-J0; Sat, 29 Jan 2022 17:37:03 +0000
Received: by outflank-mailman (input) for mailman id 262272;
 Sat, 29 Jan 2022 17:37:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDreo-0003uH-4V
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 17:37:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDren-0006jD-8N; Sat, 29 Jan 2022 17:37:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.0.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDren-0002Y7-1g; Sat, 29 Jan 2022 17:37:01 +0000
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
	bh=Lnohd4nu+07cILn+cE/7myPa56E9enuFd8VnX9pSXJ4=; b=hGH+YiND/x2w50Lf1dWMWaMu42
	pAdVUEaQYbHTG93RclHh6EEPk6UCO5mxHsQEejoSUMjECqreafU7i42ev6vczFBGBlSjca03w6img
	iY5LZCqvX1M3Hopv01ete6cyrVaDqpCG2F4a+zPrI3OLnX0SKtaa4pKv/U7Kq3hndq/A=;
Message-ID: <9220cff6-021d-3ac1-6e65-7ac34e4bbbdf@xen.org>
Date: Sat, 29 Jan 2022 17:36:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220126165827.61168-1-ayankuma@xilinx.com>
 <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com>
 <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com>
 <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
 <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com>
 <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
 <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com>
 <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop>
 <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
 <95944225-6642-b41c-c496-d735826e3c93@xilinx.com>
 <alpine.DEB.2.22.394.2201281224230.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201281224230.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Replying to Ayan's e-mail at the same time.

On 28/01/2022 20:30, Stefano Stabellini wrote:
> On Fri, 28 Jan 2022, Ayan Kumar Halder wrote:
>> Hi Julien/Stefano,
>>
>> Good discussion to learn about Xen (from a newbie's perspective). :)
>>
>> I am trying to clarify my understanding. Some queries as below :-
>>
>> On 28/01/2022 09:46, Julien Grall wrote:
>>>
>>>
>>> On 28/01/2022 01:20, Stefano Stabellini wrote:
>>>> On Thu, 27 Jan 2022, Julien Grall wrote:
>>>>> On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com>
>>>>> wrote:
>>>>>>
>>>>>> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini
>>>>>> <sstabellini@kernel.org> wrote:
>>>>>>> I am with you on both points.
>>>>>>>
>>>>>>> One thing I noticed is that the code today is not able to deal with
>>>>>>> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
>>>>>>> emulator handlers. p2m_resolve_translation_fault and try_map_mmio
>>>>>>> are
>>>>>>> called after try_handle_mmio returns IO_UNHANDLED but
>>>>>>> try_handle_mmio is
>>>>>>> not called a second time (or am I mistaken?)
>>>>>>
>>>>>> Why would you need it? If try_mmio_fault() doesn't work the first
>>>>>> time, then
>>>>>
>>>>> Sorry I meant try_handle_mmio().
>>>>>
>>>>>> it will not work the second it.
>>>>
>>>> I think I explained myself badly, I'll try again below.
>>>>
>>>>
>>>>>>> Another thing I noticed is that currently find_mmio_handler and
>>>>>>> try_fwd_ioserv expect dabt to be already populated and valid so it
>>>>>>> would
>>>>>>> be better if we could get there only when dabt.valid.
>>>>>>>
>>>>>>> With these two things in mind, I think maybe the best thing to do is
>>>>>>> to
>>>>>>> change the code in do_trap_stage2_abort_guest slightly so that
>>>>>>> p2m_resolve_translation_fault and try_map_mmio are called first when
>>>>>>> !dabt.valid.
>>>>>>
>>>>>> An abort will mostly likely happen because of emulated I/O. If we call
>>>>>> p2m_resolve_translation_fault() and try_map_mmio() first, then it
>>>>>> means
>>>>>> the processing will take longer than necessary for the common case.
>>>>>>
>>>>>> So I think we want to keep the order as it is. I.e first trying the
>>>>>> MMIO
>>>>>> and then falling back to the less likely reason for a trap.
>>>>
>>>> Yeah I thought about it as well. The idea would be that if dabt.valid is
>>>> set then we leave things as they are (we call try_handle_mmio first) but
>>>> if dabt.valid is not set (it is not valid) then we skip the
>>>> try_handle_mmio() call because it wouldn't succeed anyway and go
>>>> directly to p2m_resolve_translation_fault() and try_map_mmio().
>>>>
>>>> If either of them work (also reading what you wrote about it) then we
>>>> return immediately.
>>>
>>> Ok. So the assumption is data abort with invalid syndrome would mostly
>>> likely be because of a fault handled by p2m_resolve_translation_fault().
>>>
>>> I think this makes sense. However, I am not convinced we can currently
>>> safely call try_map_mmio() before try_handle_mmio(). This is because the
>>> logic in try_map_mmio() is quite fragile and we may mistakenly map an
>>> emulated region.
>>
>> By emulated region, you mean vgic.dbase (Refer
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic-v2.c;h=589c033eda8f5e11af33c868eae2c159f985eac9;hb=0bdc43c8dec993258e930b34855853c22b917519#l702,
>> which has not been mapped to the guest) and thus requires an MMIO handler.
>>
>> Is my understanding correcr ?
>   
> I'll try to answer for Julien but yes.
> 
> 
>> If so, can Xen mantain a table of such emulated regions ? I am guessing that
>> all emulated regions will have a mmio_handler. Then, before invoking
>> try_map_mmio(), it can check the table.
> 
> Today we keep those as a list, see find_mmio_handler (for regions
> emulated in Xen) and also ioreq_server_select (for regions emulated by
> QEMU or other external emulators.)
> 
> But I think there might be a simpler way: if you look at try_map_mmio,
> you'll notice that there is iomem_access_permitted check. I don't think
> that check can succeed for an emulated region. 

It can. iomem_access_permitted() is telling which host physical frame is 
accessible by the domain. This is different to which guest physical 
address is emulated.

It happens that most (all?) of them are the same today for the hardware 
domain. But that's not something we should rely on.

So I think we want to check that the region will be used for emulated I/O.

You could use find_mmio() but I think ioreq_server_select() is not 
directly suitable to us because we want to check that the full page is 
not emulated (You could technically only emulate part of it).

>>> Similarly, we can't call try_map_mmio() before
>>> p2m_resolve_translation_fault() because a transient fault may be
>>> misinterpreted.
>>>
>>> I think we may be able to harden try_map_mmio() by checking if the I/O
>>> region is emulated. But this will need to be fully thought through first.
>>>
>>>>
>>>> If not, then we call decode_instruction from do_trap_stage2_abort_guest
>>>> and try again. The second time dabt.valid is set so we end up calling
>>>> try_handle_mmio() as usual.
>>>
>>> With the approach below, you will also end up to call
>>> p2m_resolve_translation_fault() and try_map_mmio() a second time if
>>> try_handle_mmio() fails.
>>>
>>>>
>>>> Just for clarity let me copy/paste the relevant code, apologies if it
>>>> was already obvious to you -- I got the impression my suggestion wasn't
>>>> very clear.
>>>>
>>>>
>>>>
>>>> +again:
>>>> +        if ( is_data && hsr.dabt.valid )
>>>>           {
>>>>               enum io_state state = try_handle_mmio(regs, hsr, gpa);
>>>>
>>>>               switch ( state )
>>>>               {
>>>>               case IO_ABORT:
>>>>                   goto inject_abt;
>>>>               case IO_HANDLED:
>>>>                   advance_pc(regs, hsr);
>>>>                   return;
>>>>               case IO_RETRY:
>>>>                   /* finish later */
>>>>                   return;
>>>>               case IO_UNHANDLED:
>>>>                   /* IO unhandled, try another way to handle it. */
>>>>                   break;
>>>>               }
>>>>           }
>>>>
>>>>           /*
>>>>            * First check if the translation fault can be resolved by the
>>>>            * P2M subsystem. If that's the case nothing else to do.
>>>>            */
>>>>           if ( p2m_resolve_translation_fault(current->domain,
>>>>                                              gaddr_to_gfn(gpa)) )
>>>>               return;
>>>>
>>>>           if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
>>>>               return;
>>>>
>>>> +        if ( !hsr.dabt.valid )
>>> One more thing I noticed, a stage 2 fault can also happen on an access made
>>> for a stage 1 translation walk. In this case, I think we don't want to
>>> decode the instruction.
>>>
>>> So this would need to be !hsr.dabt.valid && !hsr.dabt.s1ptw. Depending on
>>> which patch we go with, this would also need to be adjusted in the other one
>>> as well.
>>
>> This triggered me to check for the remaining bits as well. Refer DDI 0487G.b
>> Armv8 Arm, "ISS encoding for an exception from a Data Abort", Page D13-3219
>>
>> I guess we need to check the following :-
>>
>> 1. !hsr.dabt.valid
>>
>> 2. !hsr.dabt.s1ptw - Abort may be due to stage 1 translation table walk
>>
>> 3. !hsr.dabt.cache - Abort is due to cache maintenance or address translation
>> instructions. We do not decode these instructions.

I agree that we want to check hsr.dabt.cache. But they need to be 
ignored rather than sending a data abort to the guest (That's 
technically already an issue today).

>>
>> 4. !hsr.dabt.eat - Abort is external

Reading the description, this bit doesn't tell whether this is an 
external abort. Instead, it seems to provide an implementation defined 
way to categorize an external abort.

In any case, I don't think it is useful to check it because that bit is 
guaranteed to be 0 for non-external abort fault. The DFSC already tells 
you that.

> 
> Yes, makes sense to me
> 
>   
>> There is no need to check the following due to the reasons mentioned :-
>>
>> 1. hsr.dabt.dfsc - no need as we have already determined that it is a
>> translation fault from EL0/EL1.
>>
>> 2. hsr.dabt.write - no need as the fault can be caused due to both read or
>> write
>>
>> 3. hsr.dabt.fnv - no use for this in instruction decoding
> 
> These also makes sense to me
> 
> 
>> 4. hsr.dabt.sbzp0 - Bits[12:11] - We know that DFSC cannot be 0b010000
>> (FEAT_RAS), We may not check for FEAT_LS64 as from the instruction opcode, we
>> can make out that it is not ST64BV, LD64B, ST64B or ST64BV0
>>
>>                           Bit[13] - VCNR - The instruction opcode will tell us
>> that it is not MRS/MSR instruction.

The key point of bit[13] is we don't support nested virt on Xen on Arm.

> 
> Yeah this check could be useful in the future but it would be redundant
> at the moment. I am fine either way, I'll let other comment.

Cheers,

-- 
Julien Grall


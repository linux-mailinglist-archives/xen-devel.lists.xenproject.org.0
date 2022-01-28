Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EA49F69C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261919.453791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNqT-0005t2-Qo; Fri, 28 Jan 2022 09:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261919.453791; Fri, 28 Jan 2022 09:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNqT-0005q8-N5; Fri, 28 Jan 2022 09:47:05 +0000
Received: by outflank-mailman (input) for mailman id 261919;
 Fri, 28 Jan 2022 09:47:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDNqR-0005q0-Ik
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 09:47:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDNqQ-0001ZL-8R; Fri, 28 Jan 2022 09:47:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.40.172])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDNqQ-0002dm-1v; Fri, 28 Jan 2022 09:47:02 +0000
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
	bh=IghY+6njR2OlWa7nH45RTM65V9UCpY5tSlOOv/KqYPc=; b=fvApcyW0kjsGA7S9Sq0FoFrjsp
	vutOTwU6kTD/1TwQO+zEqP1z5GlbIH31pJqAlVSDMRcGFS46CzSYNmCULrIYVd5IsWCW7W8cPi3Db
	sbh8s78DqCp+YWt8u6Qy1ako1nndtjQCzazggxcakmuZxmJM2Xuakr+T1MuWZjb0xaUo=;
Message-ID: <9880cf7c-962f-8a32-483c-2bf5889d3273@xen.org>
Date: Fri, 28 Jan 2022 09:46:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201271513330.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/01/2022 01:20, Stefano Stabellini wrote:
> On Thu, 27 Jan 2022, Julien Grall wrote:
>> On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>
>>> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> I am with you on both points.
>>>>
>>>> One thing I noticed is that the code today is not able to deal with
>>>> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
>>>> emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
>>>> called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio is
>>>> not called a second time (or am I mistaken?)
>>>
>>> Why would you need it? If try_mmio_fault() doesn't work the first time, then
>>
>> Sorry I meant try_handle_mmio().
>>
>>> it will not work the second it.
> 
> I think I explained myself badly, I'll try again below.
> 
> 
>>>> Another thing I noticed is that currently find_mmio_handler and
>>>> try_fwd_ioserv expect dabt to be already populated and valid so it would
>>>> be better if we could get there only when dabt.valid.
>>>>
>>>> With these two things in mind, I think maybe the best thing to do is to
>>>> change the code in do_trap_stage2_abort_guest slightly so that
>>>> p2m_resolve_translation_fault and try_map_mmio are called first when
>>>> !dabt.valid.
>>>
>>> An abort will mostly likely happen because of emulated I/O. If we call
>>> p2m_resolve_translation_fault() and try_map_mmio() first, then it means
>>> the processing will take longer than necessary for the common case.
>>>
>>> So I think we want to keep the order as it is. I.e first trying the MMIO
>>> and then falling back to the less likely reason for a trap.
> 
> Yeah I thought about it as well. The idea would be that if dabt.valid is
> set then we leave things as they are (we call try_handle_mmio first) but
> if dabt.valid is not set (it is not valid) then we skip the
> try_handle_mmio() call because it wouldn't succeed anyway and go
> directly to p2m_resolve_translation_fault() and try_map_mmio().
> 
> If either of them work (also reading what you wrote about it) then we
> return immediately.

Ok. So the assumption is data abort with invalid syndrome would mostly 
likely be because of a fault handled by p2m_resolve_translation_fault().

I think this makes sense. However, I am not convinced we can currently 
safely call try_map_mmio() before try_handle_mmio(). This is because the 
logic in try_map_mmio() is quite fragile and we may mistakenly map an 
emulated region.

Similarly, we can't call try_map_mmio() before 
p2m_resolve_translation_fault() because a transient fault may be
misinterpreted.

I think we may be able to harden try_map_mmio() by checking if the I/O 
region is emulated. But this will need to be fully thought through first.

> 
> If not, then we call decode_instruction from do_trap_stage2_abort_guest
> and try again. The second time dabt.valid is set so we end up calling
> try_handle_mmio() as usual.

With the approach below, you will also end up to call 
p2m_resolve_translation_fault() and try_map_mmio() a second time if 
try_handle_mmio() fails.

> 
> Just for clarity let me copy/paste the relevant code, apologies if it
> was already obvious to you -- I got the impression my suggestion wasn't
> very clear.
> 
> 
> 
> +again:
> +        if ( is_data && hsr.dabt.valid )
>          {
>              enum io_state state = try_handle_mmio(regs, hsr, gpa);
> 
>              switch ( state )
>              {
>              case IO_ABORT:
>                  goto inject_abt;
>              case IO_HANDLED:
>                  advance_pc(regs, hsr);
>                  return;
>              case IO_RETRY:
>                  /* finish later */
>                  return;
>              case IO_UNHANDLED:
>                  /* IO unhandled, try another way to handle it. */
>                  break;
>              }
>          }
> 
>          /*
>           * First check if the translation fault can be resolved by the
>           * P2M subsystem. If that's the case nothing else to do.
>           */
>          if ( p2m_resolve_translation_fault(current->domain,
>                                             gaddr_to_gfn(gpa)) )
>              return;
> 
>          if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
>              return;
> 
> +        if ( !hsr.dabt.valid )
One more thing I noticed, a stage 2 fault can also happen on an access 
made for a stage 1 translation walk. In this case, I think we don't want 
to decode the instruction.

So this would need to be !hsr.dabt.valid && !hsr.dabt.s1ptw. Depending 
on which patch we go with, this would also need to be adjusted in the 
other one as well.

Cheers,

-- 
Julien Grall


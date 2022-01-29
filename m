Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D154A310E
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 18:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262277.454451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDri0-0005Hj-54; Sat, 29 Jan 2022 17:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262277.454451; Sat, 29 Jan 2022 17:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDri0-0005Fv-1k; Sat, 29 Jan 2022 17:40:20 +0000
Received: by outflank-mailman (input) for mailman id 262277;
 Sat, 29 Jan 2022 17:40:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDrhy-0005Fp-FC
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 17:40:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDrhx-0006mE-NG; Sat, 29 Jan 2022 17:40:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.0.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDrhx-0002lU-Hg; Sat, 29 Jan 2022 17:40:17 +0000
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
	bh=bvTsnuIhSNjvzKAVxRTIZ7LGs3OGHfDa4vBzFFj34wU=; b=BzkZby8lDIWvc4jfyV/e3p56SC
	/0cdA9zFabcJ1iEtXSwUjadMzoJub3D+urHZu/K9k5b5ZfFJtJKcdLNjhKO8hLMcZ3s12Vn6hbH50
	ByNf6VzmCQE7Ja3duumayVJWWMFrpfRbA38QDz3iKQhQhcHBbLqQcecy2f6m9Js95ubU=;
Message-ID: <4d5a9e02-47ee-ef04-5c8f-602ad4bb9e81@xen.org>
Date: Sat, 29 Jan 2022 17:40:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
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
 <alpine.DEB.2.22.394.2201281216130.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201281216130.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/01/2022 20:23, Stefano Stabellini wrote:
> On Fri, 28 Jan 2022, Julien Grall wrote:
>> On 28/01/2022 01:20, Stefano Stabellini wrote:
>>> On Thu, 27 Jan 2022, Julien Grall wrote:
>>>> On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com>
>>>> wrote:
>>>>>
>>>>> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini
>>>>> <sstabellini@kernel.org> wrote:
>>>>>> I am with you on both points.
>>>>>>
>>>>>> One thing I noticed is that the code today is not able to deal with
>>>>>> IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
>>>>>> emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
>>>>>> called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio
>>>>>> is
>>>>>> not called a second time (or am I mistaken?)
>>>>>
>>>>> Why would you need it? If try_mmio_fault() doesn't work the first time,
>>>>> then
>>>>
>>>> Sorry I meant try_handle_mmio().
>>>>
>>>>> it will not work the second it.
>>>
>>> I think I explained myself badly, I'll try again below.
>>>
>>>
>>>>>> Another thing I noticed is that currently find_mmio_handler and
>>>>>> try_fwd_ioserv expect dabt to be already populated and valid so it
>>>>>> would
>>>>>> be better if we could get there only when dabt.valid.
>>>>>>
>>>>>> With these two things in mind, I think maybe the best thing to do is
>>>>>> to
>>>>>> change the code in do_trap_stage2_abort_guest slightly so that
>>>>>> p2m_resolve_translation_fault and try_map_mmio are called first when
>>>>>> !dabt.valid.
>>>>>
>>>>> An abort will mostly likely happen because of emulated I/O. If we call
>>>>> p2m_resolve_translation_fault() and try_map_mmio() first, then it means
>>>>> the processing will take longer than necessary for the common case.
>>>>>
>>>>> So I think we want to keep the order as it is. I.e first trying the MMIO
>>>>> and then falling back to the less likely reason for a trap.
>>>
>>> Yeah I thought about it as well. The idea would be that if dabt.valid is
>>> set then we leave things as they are (we call try_handle_mmio first) but
>>> if dabt.valid is not set (it is not valid) then we skip the
>>> try_handle_mmio() call because it wouldn't succeed anyway and go
>>> directly to p2m_resolve_translation_fault() and try_map_mmio().
>>>
>>> If either of them work (also reading what you wrote about it) then we
>>> return immediately.
>>
>> Ok. So the assumption is data abort with invalid syndrome would mostly likely
>> be because of a fault handled by p2m_resolve_translation_fault().
>>
>> I think this makes sense. However, I am not convinced we can currently safely
>> call try_map_mmio() before try_handle_mmio(). This is because the logic in
>> try_map_mmio() is quite fragile and we may mistakenly map an emulated region.
>>
>> Similarly, we can't call try_map_mmio() before p2m_resolve_translation_fault()
>> because a transient fault may be
>> misinterpreted.
>>
>> I think we may be able to harden try_map_mmio() by checking if the I/O region
>> is emulated. But this will need to be fully thought through first.
> 
> That's a good point. I wonder if it could be as simple as making sure
> that iomem_access_permitted returns false for all emulated regions?

I have replied to that in the other thread. The short answer is no and...

> Looking at the code, it looks like it is already the case today. Is that
> right?

not 100%. The thing is iomem_access_permitted() is telling you which 
*host* physical address is accessible. Not which *guest* physical 
address is emulated.

We could possibly take some short cut at the risk of bitting back in the 
future if we end up to emulate non-existing region in the host physical 
address.

Cheers,

-- 
Julien Grall


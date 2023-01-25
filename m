Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76D67B3B1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 14:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484328.750889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKgB6-0001OO-Hp; Wed, 25 Jan 2023 13:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484328.750889; Wed, 25 Jan 2023 13:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKgB6-0001LW-Ek; Wed, 25 Jan 2023 13:51:04 +0000
Received: by outflank-mailman (input) for mailman id 484328;
 Wed, 25 Jan 2023 13:51:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKgB4-0001LQ-UP
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 13:51:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKgB4-0003Cd-95; Wed, 25 Jan 2023 13:51:02 +0000
Received: from [54.239.6.189] (helo=[192.168.17.90])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKgB4-0007bj-2R; Wed, 25 Jan 2023 13:51:02 +0000
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
	bh=wiP8CMMp3FpxQblRKq04jMFfYF1wWspDeZNaHMMxxdU=; b=3C4dYN68cWP2rPtxYNKZOaRlcH
	GBjBzXaldWQWYexuhkE5ig1+r/GfLHqHFT9K0TlTORurFgkcHrv4+W4ywHkdfNHEyYGgpyWF0tnRW
	P2wAPiSF6u+WrfR4PZb9fLxajqSzYggPuTo6spsPryjA1lMcD0PbdL4rN2I5L0OBr7i0=;
Message-ID: <c8ef3347-2756-51b6-d474-268963abbef5@xen.org>
Date: Wed, 25 Jan 2023 13:50:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/8] SVE feature for arm guests
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <3e4ce6c0-9949-1312-f492-913b7dd2cf18@xen.org>
 <EB12FEDD-F3EC-401A-9648-77D7B28F6750@arm.com>
 <f8823ca1-450f-7522-d5db-41f124195ab3@xen.org>
 <B81C0C5E-6FEC-4B71-B740-8418EC1BBA06@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <B81C0C5E-6FEC-4B71-B740-8418EC1BBA06@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 25/01/2023 13:21, Bertrand Marquis wrote:
>> On 13 Jan 2023, at 09:44, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 12/01/2023 11:58, Luca Fancellu wrote:
>>>> On 11 Jan 2023, at 16:59, Julien Grall <julien@xen.org> wrote:
>>>> On 11/01/2023 14:38, Luca Fancellu wrote:
>>>>> This serie is introducing the possibility for Dom0 and DomU guests to use
>>>>> sve/sve2 instructions.
>>>>> SVE feature introduces new instruction and registers to improve performances on
>>>>> floating point operations.
>>>>> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE field, and
>>>>> when available the ID_AA64ZFR0_EL1 register provides additional information
>>>>> about the implemented version and other SVE feature.
>>>>> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.
>>>>> Z0-Z31 are scalable vector register whose size is implementation defined and
>>>>> goes from 128 bits to maximum 2048, the term vector length will be used to refer
>>>>> to this quantity.
>>>>> P0-P15 are predicate registers and the size is the vector length divided by 8,
>>>>> same size is the FFR (First Fault Register).
>>>>> ZCR_ELx is a register that can control and restrict the maximum vector length
>>>>> used by the <x> exception level and all the lower exception levels, so for
>>>>> example EL3 can restrict the vector length usable by EL3,2,1,0.
>>>>> The platform has a maximum implemented vector length, so for every value
>>>>> written in ZCR register, if this value is above the implemented length, then the
>>>>> lower value will be used. The RDVL instruction can be used to check what vector
>>>>> length is the HW using after setting ZCR.
>>>>> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there is no
>>>>> need to save them separately, saving Z0-Z31 will save implicitly also V0-V31.
>>>>> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie the
>>>>> register is added to the domain state, to be able to trap only the guests that
>>>>> are not allowed to use SVE.
>>>>> This serie is introducing a command line parameter to enable Dom0 to use SVE and
>>>>> to set its maximum vector length that by default is 0 which means the guest is
>>>>> not allowed to use SVE. Values from 128 to 2048 mean the guest can use SVE with
>>>>> the selected value used as maximum allowed vector length (which could be lower
>>>>> if the implemented one is lower).
>>>>> For DomUs, an XL parameter with the same way of use is introduced and a dom0less
>>>>> DTB binding is created.
>>>>> The context switch is the most critical part because there can be big registers
>>>>> to be saved, in this serie an easy approach is used and the context is
>>>>> saved/restored every time for the guests that are allowed to use SVE.
>>>>
>>>> This would be OK for an initial approach. But I would be worry to officially support SVE because of the potential large impact on other users.
>>>>
>>>> What's the long term plan?
>>> Hi Julien,
>>> For the future we can plan some work and decide together how to handle the context switch,
>>> we might need some suggestions from you (arm maintainers) to design that part in the best
>>> way for functional and security perspective.
>> I think SVE will need to be lazily saved/restored. So on context switch, we would tell that the context belongs to the a previous domain. The first time after the current domain tries to access SVE, then we would load it.
> 
> We should try to prevent those kind of things because it makes the real time analysis a lot more complex.

The choice of SVE (including the vector length) is per-domain. If all 
the VMs are using the same vector length. Then the delay would indeed be 
fixed. Otherwise, the delay will vary depending on the scheduling choice.

It is not clear to me how this is better for real time analysis.

> The only use case where this would make the system a lot faster is if there is only one guest using SVE (which might be a use case), other than that case this will just create delays when someone else is trying to use SVE instead of having a fix delay at context swit
Even in the case you mention, I think it will highly depend on the cost 
of context switching SVE. I have been told this is quite large, and one 
surely don't want to spend an extra thousand cycles when receiving an 
interrupt (I don't expect handler to use SVE).

I think we need to understand the workload (and cost) in order to decide 
whether it should be eager/lazy.

At least, I know that in Linux, only the part common with VFP are 
guaranteed to be preserved (see [1]). So the expectation seems that SVE 
use will be short-lived.

> 
>>
>>> For now we might flag the feature as unsupported, explaining in the Kconfig help that switching
>>> between SVE and non-SVE guests, or between SVE guests, might add latency compared to
>>> switching between non-SVE guests.
>>
>> I am OK with that. I actually like the idea to spell it out because that helps us to remember what are the gaps in the code :).
> 
> I like this solution to.
> 
> Cheers
> Bertrand
> 
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
> 

[1] https://www.kernel.org/doc/Documentation/arm64/sve.txt

-- 
Julien Grall


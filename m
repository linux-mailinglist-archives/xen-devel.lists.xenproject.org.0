Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83D8050E3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647536.1010763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAStI-0008JJ-3o; Tue, 05 Dec 2023 10:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647536.1010763; Tue, 05 Dec 2023 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAStI-0008Gb-11; Tue, 05 Dec 2023 10:43:00 +0000
Received: by outflank-mailman (input) for mailman id 647536;
 Tue, 05 Dec 2023 10:42:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAStG-0008GV-Hw
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:42:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAStD-0002Ou-29; Tue, 05 Dec 2023 10:42:55 +0000
Received: from [15.248.3.117] (helo=[10.24.67.37])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAStC-00055O-Ru; Tue, 05 Dec 2023 10:42:54 +0000
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
	bh=JaKj1PhGM0I/nj2UrDftTlh8X0T3GOVz2sKirH0wEmc=; b=EJEbdvQmW3x5M5++8LGndJaG0/
	hKhDNgK8Sm5UYDgFi4XwI6awvcLdcwB0KUZpd1GJFzRv4lCsb167VkFPPSuFuR+TYrS0fMH1sxSpT
	FgVdkDYasoKDgezPYOc+MZhFcg/hCVe63PKTuXjmilV2aC3qUI0v8T99KNAeOWf31SJY=;
Message-ID: <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
Date: Tue, 5 Dec 2023 10:42:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 sstabellini@kernel.org, stefano.stabellini@amd.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2023 10:30, Michal Orzel wrote:
> 
> 
> On 05/12/2023 11:01, Julien Grall wrote:
>>
>>
>> On 05/12/2023 09:28, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 04/12/2023 20:55, Julien Grall wrote:
>>>>
>>>>
>>>> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>>>>
>>>>> On 04/12/2023 10:31, Julien Grall wrote:
>>>>>> Hi Ayan,
>>>>> Hi Julien,
>>>>>>
>>>>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>>>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>>>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>>>>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>>>>>> an undefined exception to the guest. And Linux crashes.
>>>>>>
>>>>>> I am missing some data points here to be able to say whether I would
>>>>>> be ok with emulating the registers. So some questions:
>>>>>>     * As you wrote below, HVC_DCC will return -ENODEV after this
>>>>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>>>>> there a distro turning this on?)
>>>>>
>>>>> I am not aware of any distro using (or not using) this feature. This
>>>>> issue came to light during our internal testing, when HVC_DCC was
>>>>> enabled to use the debug console. When Linux runs without Xen, then we
>>>>> could observe the logs on the debug console. When Linux was running as a
>>>>> VM, it crashed.
>>>>>
>>>>> My intention here was to do the bare minimum emulation so that the crash
>>>>> could be avoided.
>>>> This reminds me a bit the discussion around "xen/arm64: Decode ldr/str
>>>> post increment operations". I don't want Xen to contain half-backed
>>>> emulation just to please an OS in certain configuration that doesn't
>>>> seem to be often used.
>>>>
>>>> Also, AFAICT, KVM is in the same situation...
>>> Well, KVM is not in the same situation. It emulates all DCC regs as RAZ/WI, so there
>>> will be no fault on an attempt to access the DCC.
>>
>> Does this mean a guest will think the JTAG is availabe?
> Yes, it will believe the DCC is available which is not a totally bad idea. Yes, it will not have
> any effect but at least covers the polling loop. The solution proposed here sounds better but does not take
> into account the busy while loop when sending the char. Linux DCC earlycon does not make an initial check that runtime
> driver does and will keep waiting in the loop if TXfull is set. Emulating everything as RAZ/WI solves that.
> As you can see, each solution has its flaws and depends on the OS implementation.

Right, which prove my earlier point. You are providing an emulation just 
to please a specific driver in Linux (not even the whole Linux). This is 
what I was the most concern of.

So ...

>>> In general, I think that if a register is not optional and does not depend on other register
>>> to be checked first (e.g. a feature/control register we emulate), which implies that it is fully ok for a guest to
>>> access it directly - we should at least try to do something not to crash a guest.
>>
>> This is where we have opposing opinion. I view crashing a guest better
>> than providing a wrong emulation because it gives a clear signal that
>> the register they are trying to access will not function properly.
>>
>> We had this exact same discussion a few years ago when Linux started to
>> access GIC*_ACTIVER registers. I know that Stefano was for emulating
>> them as RAZ but this had consequences on the domain side (Linux
>> sometimes need to read them). We settled on printing a warning which is
>> not great but better than claiming we properly emulate the register.
>>
>>>
>>> I agree that this feature is not widely used. In fact I can only find it implemented in Linux and U-BOOT
>>> and the issue I found in DBGDSCRINT (no access from EL0, even though we emulate REXT.UDCCdis as 0) only
>>> proves that. At the same time, it does not cost us much to add this trivial support.
>>
>> See above. If we provide an (even basic) emulation, we need to make sure
>> it is correct and doesn't have a side effect on the guest. If we can't
>> guarantee that (e.g. like for set/way when a device is assigned), then
>> the best course of action is to crash the domain.
>>
>> AFAICT, the proposed emulation would be ok.

... I will need to revise this statement. I am now against this patch.

Cheers,

-- 
Julien Grall


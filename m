Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6080563C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647880.1011562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVfX-0000Vy-2c; Tue, 05 Dec 2023 13:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647880.1011562; Tue, 05 Dec 2023 13:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVfW-0000Tr-VQ; Tue, 05 Dec 2023 13:40:58 +0000
Received: by outflank-mailman (input) for mailman id 647880;
 Tue, 05 Dec 2023 13:40:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAVfV-0000SM-7T
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:40:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVfQ-0006Pe-Rk; Tue, 05 Dec 2023 13:40:52 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVfQ-0005O7-La; Tue, 05 Dec 2023 13:40:52 +0000
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
	bh=HGDL+6rdyIdXPQvbpfLq6DgcwKNZTS8E9v2K729BorM=; b=MturlTrZUVLw+1UfcZQcR7/2eC
	a2Ma2Sd1N/7fbvletb1Yc/UQZhJhuk/tXl8rLJqx4pL9mD9Ov5WqyyzUd/e2e1ag5zqI7yoP+1OtI
	5AuuOn0jqyH0jpGppad7IlNX3aKgqkwIF0EgeDDOuiKHBD8uzEHhp1T6uvemY7FpVMRM=;
Message-ID: <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org>
Date: Tue, 5 Dec 2023 13:40:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
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
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
 <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
 <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 05/12/2023 12:50, Ayan Kumar Halder wrote:
> Hi Julien/All,
> 
> On 05/12/2023 11:02, Michal Orzel wrote:
>>
>> On 05/12/2023 11:42, Julien Grall wrote:
>>>
>>> On 05/12/2023 10:30, Michal Orzel wrote:
>>>>
>>>> On 05/12/2023 11:01, Julien Grall wrote:
>>>>>
>>>>> On 05/12/2023 09:28, Michal Orzel wrote:
>>>>>> Hi Julien,
>>>>>>
>>>>>> On 04/12/2023 20:55, Julien Grall wrote:
>>>>>>>
>>>>>>> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>>>>>>> On 04/12/2023 10:31, Julien Grall wrote:
>>>>>>>>> Hi Ayan,
>>>>>>>> Hi Julien,
>>>>>>>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>>>>>>>> Currently if user enables HVC_DCC config option in Linux, it 
>>>>>>>>>> invokes
>>>>>>>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on 
>>>>>>>>>> arm64,
>>>>>>>>>> DBGDTRTXINT on arm32). As these registers are not emulated, 
>>>>>>>>>> Xen injects
>>>>>>>>>> an undefined exception to the guest. And Linux crashes.
>>>>>>>>> I am missing some data points here to be able to say whether I 
>>>>>>>>> would
>>>>>>>>> be ok with emulating the registers. So some questions:
>>>>>>>>>      * As you wrote below, HVC_DCC will return -ENODEV after this
>>>>>>>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>>>>>>>> there a distro turning this on?)
>>>>>>>> I am not aware of any distro using (or not using) this feature. 
>>>>>>>> This
>>>>>>>> issue came to light during our internal testing, when HVC_DCC was
>>>>>>>> enabled to use the debug console. When Linux runs without Xen, 
>>>>>>>> then we
>>>>>>>> could observe the logs on the debug console. When Linux was 
>>>>>>>> running as a
>>>>>>>> VM, it crashed.
>>>>>>>>
>>>>>>>> My intention here was to do the bare minimum emulation so that 
>>>>>>>> the crash
>>>>>>>> could be avoided.
>>>>>>> This reminds me a bit the discussion around "xen/arm64: Decode 
>>>>>>> ldr/str
>>>>>>> post increment operations". I don't want Xen to contain half-backed
>>>>>>> emulation just to please an OS in certain configuration that doesn't
>>>>>>> seem to be often used.
>>>>>>>
>>>>>>> Also, AFAICT, KVM is in the same situation...
>>>>>> Well, KVM is not in the same situation. It emulates all DCC regs 
>>>>>> as RAZ/WI, so there
>>>>>> will be no fault on an attempt to access the DCC.
>>>>> Does this mean a guest will think the JTAG is availabe?
>>>> Yes, it will believe the DCC is available which is not a totally bad 
>>>> idea. Yes, it will not have
>>>> any effect but at least covers the polling loop. The solution 
>>>> proposed here sounds better but does not take
>>>> into account the busy while loop when sending the char. Linux DCC 
>>>> earlycon does not make an initial check that runtime
>>>> driver does and will keep waiting in the loop if TXfull is set. 
>>>> Emulating everything as RAZ/WI solves that.
>>>> As you can see, each solution has its flaws and depends on the OS 
>>>> implementation.
>>> Right, which prove my earlier point. You are providing an emulation just
>>> to please a specific driver in Linux (not even the whole Linux). This is
>>> what I was the most concern of.
> I have sent out a patch ("[PATCH] tty: hvc: dcc: Check for TXfull 
> condition while setting up early console") to fix this.
>>>
>>> So ...
>>>
>>>>>> In general, I think that if a register is not optional and does 
>>>>>> not depend on other register
>>>>>> to be checked first (e.g. a feature/control register we emulate), 
>>>>>> which implies that it is fully ok for a guest to
>>>>>> access it directly - we should at least try to do something not to 
>>>>>> crash a guest.
>>>>> This is where we have opposing opinion. I view crashing a guest better
>>>>> than providing a wrong emulation because it gives a clear signal that
>>>>> the register they are trying to access will not function properly.
>>>>>
>>>>> We had this exact same discussion a few years ago when Linux 
>>>>> started to
>>>>> access GIC*_ACTIVER registers. I know that Stefano was for emulating
>>>>> them as RAZ but this had consequences on the domain side (Linux
>>>>> sometimes need to read them). We settled on printing a warning 
>>>>> which is
>>>>> not great but better than claiming we properly emulate the register.
>>>>>
>>>>>> I agree that this feature is not widely used. In fact I can only 
>>>>>> find it implemented in Linux and U-BOOT
>>>>>> and the issue I found in DBGDSCRINT (no access from EL0, even 
>>>>>> though we emulate REXT.UDCCdis as 0) only
>>>>>> proves that. At the same time, it does not cost us much to add 
>>>>>> this trivial support.
>>>>> See above. If we provide an (even basic) emulation, we need to make 
>>>>> sure
>>>>> it is correct and doesn't have a side effect on the guest. If we can't
>>>>> guarantee that (e.g. like for set/way when a device is assigned), then
>>>>> the best course of action is to crash the domain.
>>>>>
>>>>> AFAICT, the proposed emulation would be ok.
>>> ... I will need to revise this statement. I am now against this patch.
>> Yes, the problem was tricky from the very beginning and I somewhat 
>> agree. I prepared a POC with one solution
>> that Ayan extended and sent to gather feedback (hence RFC). I think we 
>> should still wait for others
>> opinion (@Stefano, @Bertrand). I think the thread contains all the 
>> necessary information
>> to decide what to do:
>> - do nothing* (guest crashes)
>> - emulate DCC the same way as KVM i.e. RAZ/WI (no crash, no busy loop, 
>> guest keeps using DCC with no effect)
>> - emulate DCC with TXfull set to 1 (no crash, runtime DCC in Linux 
>> returns -ENODEV, earlycon busy loop issue)
>>
>> * I still think we should fix DBGDSCRINT but I can send a separate 
>> patch (not really related to the DCC problem)
> 
> Regardless if the linux hvc earlycon is fixed or not
> 
> @Julien , would you be ok with option 2 or 3 with a suitable warning ?

I am afraid the answer is no.

> Also will wait for Stefano's and Bertrand's opinions.
> 
> Crashing the guest would seem quite severe imo if there can be a better 
> way (option 2 or 3) to tell that DCC is not available.

Well in option 2, you don't tell the DCC is not available. You just lie 
to it claiming there is one but it is not behaving properly.

I agree that crashing a guest is bad, but is lying to the domain really 
better? The consequence here is not that bad and hopefully it would be 
fairly easy to find. But this is not always the case. So I definitely 
would place a half-backed emulation more severe than a guest crash.

Cheers,

-- 
Julien Grall


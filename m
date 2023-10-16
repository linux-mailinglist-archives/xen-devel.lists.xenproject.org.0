Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24377CAF12
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617862.960928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQN3-000794-3s; Mon, 16 Oct 2023 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617862.960928; Mon, 16 Oct 2023 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQN3-00076z-16; Mon, 16 Oct 2023 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 617862;
 Mon, 16 Oct 2023 16:23:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsQN1-00076a-NV
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:23:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsQN0-0007nC-JS; Mon, 16 Oct 2023 16:23:06 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsQN0-000794-At; Mon, 16 Oct 2023 16:23:06 +0000
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
	bh=cPp0j4hD4ZQAkeb330gMs/tZVDgrYE61d8i4CM5Id0o=; b=5LLcfTJWG2UunjF6ac0fiEc0zB
	ayqKi85xfYnbkStU+VGlUlK3CRNUmbGqASPaiiiQtfpN3xm3VwATaOTwEJaFSQQ42yS7cntcYDEMZ
	QxzbJnqNndiv3d2dnFhZb/eldaDqQQakRJxPCvT4hYFsGKi4WgQORINff//WNSUb6Nkk=;
Message-ID: <3bdf8745-ee34-4deb-be5e-5493fc202ade@xen.org>
Date: Mon, 16 Oct 2023 17:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 "leo.yan@linaro.org" <leo.yan@linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <E9128690-2C1E-47D8-AD94-682C4318E082@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E9128690-2C1E-47D8-AD94-682C4318E082@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/10/2023 16:39, Bertrand Marquis wrote:
> 
> 
>> On 16 Oct 2023, at 17:31, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 16/10/2023 16:07, Bertrand Marquis wrote:
>>> Hi,
>>>> On 16 Oct 2023, at 16:46, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> CC Henry
>>>>
>>>> Hi Alexey,
>>>>
>>>> On 16/10/2023 15:24, Alexey Klimov wrote:
>>>>> On Mon, 16 Oct 2023 at 15:13, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>>> On 16 Oct 2023, at 15:00, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>>>>>>
>>>>>>> Hi
>>>>>>>
>>>>>>> +Luca and Rahul
>>>>>>>
>>>>>>>> On 16 Oct 2023, at 15:54, Julien Grall <julien@xen.org> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 16/10/2023 09:44, Michal Orzel wrote:
>>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> On 13/10/2023 14:26, Leo Yan wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
>>>>>>>>>> the physical memory regions are:
>>>>>>>>>>
>>>>>>>>>>   DRAM memory regions:
>>>>>>>>>>     Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>>>>>>>>>>     Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>>>>>>>>>>     Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
>>>>>>>>>>
>>>>>>>>>> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
>>>>>>>>>> and ramdisk images are loaded into the low memory space:
>>>>>>>>>>
>>>>>>>>>>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>>>>>>>>>>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>>>>>>>>>>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>>>>>>>>>>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>>>>>>>>>>
>>>>>>>>>> In this case, the Xen binary is loaded above 8TB, which exceeds the
>>>>>>>>>> maximum supported identity map space of 2TB in Xen. Consequently, the
>>>>>>>>>> system fails to boot.
>>>>>>>>>>
>>>>>>>>>> This patch enlarges identity map space to 10TB, allowing module loading
>>>>>>>>>> within the range of [0x0 .. 0x000009ff_ffff_ffff].
>>>>>>>>>>
>>>>>>>>>> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
>>>>>>>>> I don't think a fixes tag applies here given that 2TB was just a number we believed is enough
>>>>>>>>> and all of this is platform dependent.
>>>>>>>>> This can be dropped on commit if committer agrees
>>>>>>>> Xen may have booted on that platform before hand. So this would be considered a regression and therefore a tag would be warrant.
>>>>>>>>
>>>>>>>> AFAICT, the commit is only present on the upcoming 4.18. So the question is whether Xen 4.17 booted out-of-the-box on ADLink? If the answer is yes, then we need to add a Fixes tag. But the correct one would be
>>>>>>>>
>>>>>>>
>>>>>>> @Rahul or Luca: could you give an answer here ?
>>>>>>> I know you used Xen on an AVA platform but was it booting out of the box ?
>>>>>>
>>>>>> I can’t say for Xen 4.17, but our nightly job has run successfully on AVA for the commit 730406ab81094115d9fb5ca00ba8d53cec1279b3
>>>>>> (docs/misra: add deviations.rst to document additional deviations.)
>>>>>>
>>>>>> We are not applying any patch for it to run on AVA.
>>>>> Most likely it is because your UEFI/BIOS firmware is 2.x, for instance
>>>>> 2.04.100.07.
>>>>> This fix if for AVA machine with older UEFI firmware 1.07.300.03.
>>>>
>>>> OOI, why not updating your firmware? I was expecting that it would also contain other critical fixes.
>>>>
>>>> With this in mind, I am now more in two mind to ask to merge this patch in Xen 4.18. On one hand, I understand it will help to boot on AVA machine with an older firmware. But on the other hand this is changing the memory layout quite late in the release. The risk seems limited because Xen is not loaded at the top of the virtual address space (there is the directmap afterwards).
>>>>
>>>> Henry (as the release manager) and others, any opinions?
>>> With the new information, I think it should be stated that it is fixing an issue on AVA platforms using an old firmware and platforms with and up-to-date firmware are not impacted.
>>> It is an important information to keep in mind that this is not a fix to be backported for example (and for me the fixes tag should not be kept).
>>
>> IMHO, the fixes tag should not be based solely on the AVA platform. It should be based on whether this could sensibly affect others. Right now, there is nothing that would indicate either way.
>>
>> And therefore a Fixes tag is sensible. This doesn't mean I would want to backport it right now (note that only 4.18 is affected). But this could change in the future if we get another report (post-4.18) on a platform where there are no other workaround.
>>
>> Stefano any opinions?
>>
>>> On whether or not it should go in the release, I am not quite sure that making a change in the layout at that stage is a good idea unless it is fixing a critical issue (which is not the case here).
>>> So i would vote no but not go against if someone argue to have it in.
>>
>> I agree with your statement with the information we have today. But it could become a critical issue if another platform is hit by the same issue and have no other workaround.
> 
> I am more seeing this as adding support for platforms with a topology that was not supported until now (because it was not encountered) rather than fixing a bug which is why i find it a bit odd to say that it is fixing some issue. But definitely this is an opinion and nothing that i could argue on :-)

This is a valid point. The problem is SUPPORT.md doesn't say anything 
about new HW. So in theory, if it works out-of-the-box on Xen 4.17, then 
one could expect that it should work on 4.18.

I can see why the owner of the platform may consider it critical. But I 
can see why the community may say it is not important.

This is not an easy one to solve because we don't exactly know all the 
use-cases where Xen is used. We only know the public ones.

Cheers,

-- 
Julien Grall


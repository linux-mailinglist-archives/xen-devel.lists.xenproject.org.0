Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58A7CABE3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617676.960508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOrR-0005C7-3f; Mon, 16 Oct 2023 14:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617676.960508; Mon, 16 Oct 2023 14:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOrR-00059g-0z; Mon, 16 Oct 2023 14:46:25 +0000
Received: by outflank-mailman (input) for mailman id 617676;
 Mon, 16 Oct 2023 14:46:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsOrQ-00059a-D5
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:46:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsOrP-0004oM-BB; Mon, 16 Oct 2023 14:46:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsOrP-000355-14; Mon, 16 Oct 2023 14:46:23 +0000
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
	bh=JalChIrOFfx6zfcfT37QRxPZmZAbdEye2KQLrCuknfM=; b=tjOLUWCqEG59ugdGQpbWPAKtyw
	D+Oun5fG3rNZ353qZ8gambzeiBSZ6GHC/Sio9lJVP2IsU58eFSpJ9bvxbUV1kZ/WLXrA0OkI6/uEd
	U93LXgLHNv/DIO3CE3xv88T5FTlH9EMjRS+MICboePpHNVoJ0uLnu2KMScLadk2OWk4c=;
Message-ID: <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
Date: Mon, 16 Oct 2023 15:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, "leo.yan@linaro.org"
 <leo.yan@linaro.org>, Xen-devel <xen-devel@lists.xenproject.org>,
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

CC Henry

Hi Alexey,

On 16/10/2023 15:24, Alexey Klimov wrote:
> On Mon, 16 Oct 2023 at 15:13, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>>
>>
>>> On 16 Oct 2023, at 15:00, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>>
>>> Hi
>>>
>>> +Luca and Rahul
>>>
>>>> On 16 Oct 2023, at 15:54, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>
>>>>
>>>> On 16/10/2023 09:44, Michal Orzel wrote:
>>>>> Hi,
>>>>
>>>> Hi,
>>>>
>>>>> On 13/10/2023 14:26, Leo Yan wrote:
>>>>>>
>>>>>>
>>>>>> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
>>>>>> the physical memory regions are:
>>>>>>
>>>>>>   DRAM memory regions:
>>>>>>     Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>>>>>>     Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>>>>>>     Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
>>>>>>
>>>>>> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
>>>>>> and ramdisk images are loaded into the low memory space:
>>>>>>
>>>>>>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>>>>>>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>>>>>>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>>>>>>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>>>>>>
>>>>>> In this case, the Xen binary is loaded above 8TB, which exceeds the
>>>>>> maximum supported identity map space of 2TB in Xen. Consequently, the
>>>>>> system fails to boot.
>>>>>>
>>>>>> This patch enlarges identity map space to 10TB, allowing module loading
>>>>>> within the range of [0x0 .. 0x000009ff_ffff_ffff].
>>>>>>
>>>>>> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
>>>>> I don't think a fixes tag applies here given that 2TB was just a number we believed is enough
>>>>> and all of this is platform dependent.
>>>>> This can be dropped on commit if committer agrees
>>>> Xen may have booted on that platform before hand. So this would be considered a regression and therefore a tag would be warrant.
>>>>
>>>> AFAICT, the commit is only present on the upcoming 4.18. So the question is whether Xen 4.17 booted out-of-the-box on ADLink? If the answer is yes, then we need to add a Fixes tag. But the correct one would be
>>>>
>>>
>>> @Rahul or Luca: could you give an answer here ?
>>> I know you used Xen on an AVA platform but was it booting out of the box ?
>>
>> I can’t say for Xen 4.17, but our nightly job has run successfully on AVA for the commit 730406ab81094115d9fb5ca00ba8d53cec1279b3
>> (docs/misra: add deviations.rst to document additional deviations.)
>>
>> We are not applying any patch for it to run on AVA.
> 
> Most likely it is because your UEFI/BIOS firmware is 2.x, for instance
> 2.04.100.07.
> This fix if for AVA machine with older UEFI firmware 1.07.300.03.

OOI, why not updating your firmware? I was expecting that it would also 
contain other critical fixes.

With this in mind, I am now more in two mind to ask to merge this patch 
in Xen 4.18. On one hand, I understand it will help to boot on AVA 
machine with an older firmware. But on the other hand this is changing 
the memory layout quite late in the release. The risk seems limited 
because Xen is not loaded at the top of the virtual address space (there 
is the directmap afterwards).

Henry (as the release manager) and others, any opinions?

Cheers,

-- 
Julien Grall


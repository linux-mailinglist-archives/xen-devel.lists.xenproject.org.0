Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379609972F4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815024.1228749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaMq-0003pG-Ds; Wed, 09 Oct 2024 17:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815024.1228749; Wed, 09 Oct 2024 17:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaMq-0003mq-BD; Wed, 09 Oct 2024 17:20:56 +0000
Received: by outflank-mailman (input) for mailman id 815024;
 Wed, 09 Oct 2024 17:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1syaMo-0003I3-EL
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:20:54 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d673fe16-8662-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 19:20:53 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5398c1bd0b8so1124957e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 10:20:53 -0700 (PDT)
Received: from [10.17.77.207] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff23d89sm1547430e87.236.2024.10.09.10.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 10:20:51 -0700 (PDT)
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
X-Inumbo-ID: d673fe16-8662-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728494453; x=1729099253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzG2aC8Lq8vYVnroi4ESGfdhODW0tDLiVlpGC/FMC48=;
        b=SbSbLgvtP788MJ3+J24iBsqDE93HXzAkNPwapyq7pLkeozEbBLs2loSkJirjUzuBfA
         iIK+8GSa077/JU0N6QD8w6Scl1dkO+78d9mRMIfBYacU0i3/btNhYo5IM+usC8SRbKRP
         4lX0957xwZKeLuRqHYLOoSXVyFQaQ/xF5hbuT+oHxr0MbiTwFU5dglTYIfmRjVGmRR9o
         T7BW0XNeJo4FKCl40xmU3zE+flgoIkchbO+NqQfFzO/X2YYlsweYREiMkv9IGmuJLIJ+
         jaufo5gpjeRyChIJo7ft5lW5/SWLBsbtW9v01lHev0pIJBoaam5CYTsM0/B5jBKe45PQ
         QO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494453; x=1729099253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzG2aC8Lq8vYVnroi4ESGfdhODW0tDLiVlpGC/FMC48=;
        b=ptRvrvvx7TEd3FpGV4v09Q97cmutKUXcPMXEGrerPAUlwGKV3E8tosjGyvLmRi5xey
         cMVN1R0OekjzaBaxk1JIkVzlvvkWsNn5UXp8ZD6IS0bLtzk74a60gkcPAVz0RRBerM07
         ruuhrpRCh+gFcn2Hlxie0JMiO3Q4bq+0pmoOM0O5y7lK45hudsfpBCbefErSdC5zE7Xi
         BoyvZcAiI/QYciYRsHf3sWC37/TtEFjiLZqLnNVWX0DNa8DrqdIZ/j0MbpfUybl1o1/B
         3LhhORolvs92QBuLbA8MqM682H3vVCfRkGOygN1i9x/kNXCncpFMRyvmT+m9HhtxPxkr
         KdAQ==
X-Gm-Message-State: AOJu0YyX0114J8bgpH+zYh8J1TU3Zeq8ZFDPbF1IU4qTDxcGiINUK++x
	h62GcHQIem8j72/ZXvdjD4tP3Z1qNK/igKCZ7lDUXEYBlo1XGeTFcXNSjw==
X-Google-Smtp-Source: AGHT+IEx4p7yM0WWi80Q1Ny3uDhOhVk12t0jtCIcQUdmCUCH+02gYM4SuNQqFE++hWTXxCXWyOW7tA==
X-Received: by 2002:a05:6512:3c98:b0:52f:27e:a82e with SMTP id 2adb3069b0e04-539c988d2fbmr125749e87.21.1728494452528;
        Wed, 09 Oct 2024 10:20:52 -0700 (PDT)
Message-ID: <e180d843-fe44-42fb-b3ae-c75f0f675aab@gmail.com>
Date: Wed, 9 Oct 2024 20:20:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <9C3AD765-C165-4B46-AEEB-8C5F87861947@arm.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <9C3AD765-C165-4B46-AEEB-8C5F87861947@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09.10.24 09:36, Bertrand Marquis wrote:
> Hi Oleksandr,

Hello Bertrand


> 
>> On 8 Oct 2024, at 20:53, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>
>>
>>
>> On 08.10.24 09:17, Bertrand Marquis wrote:
>>> Hi,
>>
>> Hello Bertrand
>>
>>
>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>>>
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Add common requirements for a physical device assignment to Arm64
>>>> and AMD64 PVH domains.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> ---
>>>> Based on:
>>>> [PATCH] docs: fusa: Replace VM with domain
>>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
>>>> ---
>>>> ---
>>>> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>>>> docs/fusa/reqs/index.rst                      |   1 +
>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>>> 4 files changed, 428 insertions(+)
>>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>>
>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> new file mode 100644
>>>> index 0000000000..a1d6676f65
>>>> --- /dev/null
>>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> @@ -0,0 +1,365 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +Device Passthrough
>>>> +==================
>>>> +
>>>> +The following are the requirements related to a physical device assignment
>>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>>> +
>>>> +Requirements for both Arm64 and AMD64 PVH
>>>> +=========================================
>>>> +
>>>> +Hide IOMMU from a domain
>>>> +------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>>> +
>>>> +Description:
>>>> +Xen shall not expose the IOMMU device to the domain even if I/O virtualization
>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>> +
>>>> +Rationale:
>>> I think there should be a rationale here to explain why we do not want the IOMMU
>>> in particular to be assigned to a domain.
>>
>>
>> ok, will add. I propose the following text:
>>
>> Xen having the whole picture of the host resources and device assignment unlike the individual domain makes use of the IOMMU to:
>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also known as stage-2 (or 2nd stage) address translations for DMA devices passed through to domains and Interrupt Remapping on AMD64 platforms.
> remove arm64 or amd64, this is always true >
>> - provide access protection functionalities to prevent malicious or buggy DMA devices from accessing arbitrary memory ranges (e.g. memory allocated to other domains) or from generating interrupts that could affect other domains.
> 
> I would turn this in positive: restrict DMA devices to only have access to the memory of the Domain there are assigned to or no memory at all if not assigned (maybe 2 reqs here).


ok to both. However, I am a bit lost ...



> 
>>
>>
>>> Added to that, I am not completely sure that there is a clear way to test this one
>>> as for example one could assign registers not known by Xen.
>>
>> I am afraid you are right, valid point. For example, on Arm64, if there is no corresponding driver in use, we will end up exposing IOMMU dt node to Dom0.
>>
>>
>>> Shouldn't this requirement in fact be an assumption of use ?
>>
>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
> 
> As was suggested by stefano, i agree with him on turning it differently. Please see his answer.


  ... yes, I saw his answer and completely agree with him as well, my 
question is what I should do with the rationale?

The rationale I proposed above explains why we do not want the IOMMU
in particular to be assigned to a domain. But, it belongs to the initial 
"Hide IOMMU from a domain" requirement. Now, with turning it into "Xen 
shall configure the IOMMU at boot according to the stage 2 translation
tables" requirement should the rationale still be present?


> 
>>
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Discover PCI devices from hardware domain
>>>> +-----------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
>>>> +
>>>> +Description:
>>>> +The hardware domain shall enumerate and discover PCI devices and inform Xen
>>>> +about their appearance and disappearance.
>>> Again this is a design requirement telling what should be done by a domain.
>>> This is an interface or an assumption of use but not a Xen design req.
>>
>> I agree, will convert to Assumption of use on domain.
>>
>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Discover PCI devices from Xen
>>>> +-----------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
>>>> +
>>>> +Description:
>>>> +Xen shall discover PCI devices (enumerated by the firmware beforehand) during
>>>> +boot if the hardware domain is not present.
>>> I am a bit wondering here why we would not want Xen to always do it if we have
>>> the code to do it in Xen anyway.
>>
>> Makes sense, will drop "if the hardware domain is not present".
>>
>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Assign PCI device to domain (with IOMMU)
>>>> +----------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a specified PCI device (always implied as DMA-capable) to
>>>> +a domain during its creation using passthrough (partial) device tree on Arm64
>>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be assigned is
>>>> +protected by the IOMMU.
>>> This is a very long and complex requirement.
>>> I would suggest to split it in 3:
>>> - generic: Xen shall support assign PCI devices to domains.
>>> - arm64 one: Xen shall assign PCI devices based on device tree (explain how this is configured in dts)
>>> - amd: xxxx based on hyperlaunch
>>
>> I agree, will split, but ...
>>
>>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI device assigned to a domain to be restricted to the memory of the given domain.
>>
>>
>> ... does this need to be a separate 4th requirement here (and for the similar requirement for the platform device down the document) or this sentence is meant to be added to all resulting generic/arm64/amd requirements?
>>
>> I would like to clarify, there are two groups of requirements to cover DMA-capable devices in this document:
>> - for devices that are behind the IOMMU and IOMMU can be used for them, those requirements description explicitly mention "device xxx is protected by the IOMMU" in addition to "(with IOMMU)" in the subject.
>> - for devices that are not behind the IOMMU or IOMMU cannot be used for them, those requirements description explicitly mention "device xxx is not protected by the IOMMU" in addition to "(without IOMMU)" in the subject.
> 
> I think you need to be more generic and any DMA engine that is not protected by an IOMMU shall not be assigned to a non trusted domain.
> This is in fact a requirement on the integrator, Xen cannot do much about this.

yes, I agree


> 
>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Deassign PCI device from domain (with IOMMU)
>>>> +--------------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
>>>> +
>>>> +Description:
>>>> +Xen shall deassign a specified PCI device from a domain during its destruction.
>>>> +The physical device to be deassigned is protected by the IOMMU.
>>> Remove second sentence or turn it into a req to say that the PCI device shall not be allowed to do DMA anymore somehow.
>>
>>
>> I would like to clarify, the second sentence here is just to indicate what type of device (in the context of IOMMU involvement) the requirement is talking about, not about special care for denying any DMA from it after deassigning.
>>
>> If you still think that we need a new requirement to explicitly highlight that, I will be ok to create, in that case, I assume, the platform device will want to gain the similar requirement. Please let me know your preference.
> 
> As said in the mail to stefano, i think we should try to generalise more.
> So i would say we should handle:
> - register assignments
> - DMA engine handling
> - interrupt handling
> 
> A device is a just a logical construct which may or may not contain or use several of those elements.


I agree regarding DMA engine handling. As for register assignments and 
interrupt handling I am not quite sure. I am afraid we will need to 
differentiate between platform and PCI devices.


> 
>>
>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Forbid the same PCI device assignment to multiple domains
>>>> +---------------------------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
>>>> +
>>>> +Description:
>>>> +Xen shall not assign the same PCI device to multiple domains by failing to
>>>> +create a new domain if the device to be passed through is already assigned
>>>> +to the existing domain. Also different PCI devices which share some resources
>>>> +(interrupts, IOMMU connections) can be assigned only to the same domain.
>>> Please split and simplify
>>> - Xen shall assign a single device to a single domain
>>> - Xen shall assign PCI devices sharing resources to the same domain.
>>
>> Good point, will split.
>>
>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~device_passthrough~1`
>>>> +
>>>> +Requirements for Arm64 only
>>>> +===========================
>>>> +
>>>> +Assign interrupt-less platform device to domain
>>>> +-----------------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a specified platform device that has only a MMIO region
>>>> +(does not have any interrupts) to a domain during its creation using passthrough
>>>> +device tree.
>>>> +The example of interrupt-less device is PWM or clock controller.
>>> I am a bit puzzled by this req. Why making a specific case for interrupt less ?
>>
>>
>> Those devices exist and can be assigned to a domain, they are configured slightly differently in comparison with devices with interrupts ("xen,path" is not needed for the former), other code paths are executed in Xen.
>>
>> More technical details:
>> The allowance of the platform device assignment which is not behind an IOMMU (for both non-DMA-capable and DMA-capable devices) is specified using device tree property ("xen,force-assign-without-iommu") in the device node described in the passthrough device tree. The said property also allows the interrupt-less platform device assignment (a device that has only a MMIO region) without specifying the corresponding node in the host device via device tree property ("xen,path").
> 
> Please see upper.

Yes, what I got from the text above is that we won't need a separate set 
of requirements for interrupt-less device, I will drop them. The same 
goes for "Assign/Deassign *non-DMA-capable* platform device to domain". 
Please let me know if I got this wrong.


[snip]


>>>> +
>>>> +Assign DMA-capable platform device to domain (without IOMMU)
>>>> +------------------------------------------------------------
>>>> +
>>>> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a specified DMA-capable platform device to a domain during
>>>> +its creation using passthrough device tree. The physical device to be assigned
>>>> +is not protected by the IOMMU.
>>>> +The DMA-capable device assignment which is not behind an IOMMU is allowed for
>>>> +the direct mapped domains only. The direct mapped domain must be either safe or
>>>> +additional security mechanisms for protecting against possible malicious or
>>>> +buggy DMA devices must be in place, e.g. Xilinx memory protection unit (XMPU)
>>>> +and Xilinx peripheral protection unit (XPPU).
>>> Please split in several reqs.
>>
>>
>> I agree, will do. I feel it should be split into the following requirements:
>> - Assign DMA-capable platform device to domain (without IOMMU)
>> - Create direct mapped domain
>> - Enable additional security mechanisms in direct mapped domain
>>
>> To be honest, I'm not quite sure whether it is worth creating the last requirement ...
> 
> I do not think the last one is needed here.
> It could be an integrator guidance at best.

ok, thanks for the clarification.


> 
> Cheers
> Bertrand
> 
>>
>>
>>> Stopping here my review for now
>>
>> Thanks for the review.
>>
>>
>>> Cheers
>>> Bertrand
>>
>> [snip]
> 
> 


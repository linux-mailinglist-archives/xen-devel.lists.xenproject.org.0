Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3E996E66
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814666.1228283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXtf-000771-Vd; Wed, 09 Oct 2024 14:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814666.1228283; Wed, 09 Oct 2024 14:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXtf-000753-Sh; Wed, 09 Oct 2024 14:42:39 +0000
Received: by outflank-mailman (input) for mailman id 814666;
 Wed, 09 Oct 2024 14:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gYK=RF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1syXte-00074J-Jl
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:42:38 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d9bfd9-864c-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:42:36 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539908f238fso8007967e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:42:36 -0700 (PDT)
Received: from [10.17.77.207] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec849dsm1515317e87.101.2024.10.09.07.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:42:33 -0700 (PDT)
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
X-Inumbo-ID: b9d9bfd9-864c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728484956; x=1729089756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18hRGmFxt3xBaAqVK/WnmVYHLpaZI0ST+KXeJf4d5oY=;
        b=leYcVsTzRLIhSYzpHs1wqII3l46h1KLprsQy18QfeHDY2JnmZ3Q857ht/Lqkbb97rI
         Pq/AG3e/8ClPhBVHQJOsQ3zKChULrSZKk3rnbAIcVNjSpaGxatiK9+fAR9KXxduCU77f
         8W7ViB+L7Tm4FRn/1nbDgf2zUKKFmoaE60UbWQ/LSfaiHx7csIVhlXA51mKkpYoO+h4+
         WPEEr5TzxJmyhpFYqh8Wrw+cMPw4dAL1xZfulU2yArGfF0YT3TqRNFw13WIGKVAPRSWu
         JbYDv/QmyCdJYlVBS4Mdlb8WsVhgkTO76VDFAeN+aRIsTcdhznCrGf6xu15K5xGhGW5z
         PqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484956; x=1729089756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18hRGmFxt3xBaAqVK/WnmVYHLpaZI0ST+KXeJf4d5oY=;
        b=mzVk3xqHGBgL9eRH9N83f6q2e9DMO+eNEShsyWh+R3gmX5MHVQIEG13j5Xp4oTCXow
         Gu9sSbr/cGo/RFvxSXvwhVMywyF/r/tFDvwCP6DUd7nNSw9g61NhakdgxibgOwZO30Mu
         5UNidbKWgEeRjueXStbtXbd/+UboxnWOX/OmufU/+LT8Wn8jlVCbVcEdXikn3T+RUbds
         LS9wWDa4Vmb3OC76pmD+IBZGnB+WgaBe1DplodPGaVf0O8xU+JXqRkPoS/nbykgFYgD1
         JLD4xsEjhxWJFkdiCFz85737F0so8v6FftUKtOe0tQscCyWNud+0rLZHEl1xqBj1ouF9
         MTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZA+jYnyGFMf2UZrMmt4ZFigpUe2hiL8GBY6/5b9aI36jqgNY5KczEsshE4cmPgU8m/qN9/VZVme0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPLsmq7u5n9elMFaknJ9fSTJQNC7UR00XzZybsSoss7fWwGnAk
	56XVKgrKUyQMG6SuoNBh62YfnrFW4M3VMQnFfrwizWpkTw1wbd1l
X-Google-Smtp-Source: AGHT+IF40vr1CHz8xdQ6oCkhhNlwHbD9gTkoDh1iFQiiUNp1H/8hwpUHzcLfiZtdWo1SNTIKQjZN8g==
X-Received: by 2002:a05:6512:3b09:b0:535:d4e9:28bf with SMTP id 2adb3069b0e04-539c494ed81mr1799643e87.46.1728484955338;
        Wed, 09 Oct 2024 07:42:35 -0700 (PDT)
Message-ID: <24b503c4-c9bc-407a-bd78-031f947afa65@gmail.com>
Date: Wed, 9 Oct 2024 17:42:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09.10.24 01:46, Stefano Stabellini wrote:


Hello Stefano

> On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
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
>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>> b/docs/fusa/reqs/design-reqs/common/passthrough.rst
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
>>>> +The following are the requirements related to a physical device
>>>> assignment
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
>>>> +Xen shall not expose the IOMMU device to the domain even if I/O
>>>> virtualization
>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>> +
>>>> +Rationale:
>>>
>>> I think there should be a rationale here to explain why we do not want the
>>> IOMMU
>>> in particular to be assigned to a domain.
>>
>>
>> ok, will add. I propose the following text:
>>
>> Xen having the whole picture of the host resources and device assignment
>> unlike the individual domain makes use of the IOMMU to:
>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also known as
>> stage-2 (or 2nd stage) address translations for DMA devices passed through to
>> domains and Interrupt Remapping on AMD64 platforms.
>> - provide access protection functionalities to prevent malicious or buggy DMA
>> devices from accessing arbitrary memory ranges (e.g. memory allocated to other
>> domains) or from generating interrupts that could affect other domains.
>>
>>
>>>
>>> Added to that, I am not completely sure that there is a clear way to test
>>> this one
>>> as for example one could assign registers not known by Xen.
>>
>> I am afraid you are right, valid point. For example, on Arm64, if there is no
>> corresponding driver in use, we will end up exposing IOMMU dt node to Dom0.
>>
>>
>>>
>>> Shouldn't this requirement in fact be an assumption of use ?
>>
>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
> 
> In my view, this does not qualify as an Assumption of Use, as it does
> not align with the definition we have used so far. If we were to
> categorize this as an Assumption of Use, we would need to change the
> definition.

Right, what I meant was new Assumption of use *on Xen* that would 
require updating docs/fusa/reqs/intro.rst.


> 
> We have defined an Assumption of Use as something Xen expects from the
> rest of the system for it to function correctly, such as being loaded at
> EL2. On the other hand, 'Requirements' refer to behaviors we expect Xen
> to exhibit.
> 
> Our goal is for Xen to configure the IOMMU at boot using the stage 2
> translation, and to ensure that Xen prevents domains from altering the
> IOMMU configuration. These are specific expectations of Xen's behavior,
> so I believe they fall under Requirements and should be validated in
> some way.
> 
> However, we could adjust the wording. For example, we might replace the
> negative phrasing with a positive requirement, such as: 'Xen shall
> configure the IOMMU at boot according to the stage 2 translation
> tables.' There is no need to explicitly state that the IOMMU is not
> exposed to guests, as nothing is exposed unless explicitly allowed or
> mentioned. We could, however, include a brief note about it for clarity.

I agree, good explanation! Just maybe "Xen shall
configure the IOMMU *at domain creation time* according to the stage 2 
translation tables" since the IOMMU context is created at that time. 
Although, if we are going to deal with boot time domains only, *at boot* 
also sounds ok, I think.


> 
> 
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
>>>> +The hardware domain shall enumerate and discover PCI devices and inform
>>>> Xen
>>>> +about their appearance and disappearance.
>>>
>>> Again this is a design requirement telling what should be done by a domain.
>>> This is an interface or an assumption of use but not a Xen design req.
>>
>> I agree, will convert to Assumption of use on domain.
> 
> This example better aligns with our definition of Assumption of Use so
> far: we expect the hardware domain to enumerate and discover PCI
> devices, then notify Xen about their appearance or removal. This is an
> expectation placed on the hardware domain, not on Xen itself. I agree
> with Bertrand that, as written, it is more of an Assumption of Use than
> a Requirement.
> 
> However, rather than converting it into an Assumption of Use, I think we
> should rewrite it as a requirement focused on Xen's interfaces for
> enumeration. For instance:
> 
> "Xen shall provide hypercalls to allow the hardware domain to inform Xen
> about the presence of PCI devices."

I agree, will rewrite.


> 
> 
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
>>>> +Xen shall discover PCI devices (enumerated by the firmware beforehand)
>>>> during
>>>> +boot if the hardware domain is not present.
>>>
>>> I am a bit wondering here why we would not want Xen to always do it if we
>>> have
>>> the code to do it in Xen anyway.
>>
>> Makes sense, will drop "if the hardware domain is not present".
> 
> +1
> 
>   
>>>
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
>>>> +Xen shall assign a specified PCI device (always implied as DMA-capable)
>>>> to
>>>> +a domain during its creation using passthrough (partial) device tree on
>>>> Arm64
>>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be
>>>> assigned is
>>>> +protected by the IOMMU.
>>>
>>> This is a very long and complex requirement.
>>> I would suggest to split it in 3:
>>> - generic: Xen shall support assign PCI devices to domains.
>>> - arm64 one: Xen shall assign PCI devices based on device tree (explain how
>>> this is configured in dts)
>>> - amd: xxxx based on hyperlaunch
>>
>> I agree, will split, but ...
>>
>>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI device
>>> assigned to a domain to be restricted to the memory of the given domain.
>>
>>
>>   ... does this need to be a separate 4th requirement here (and for the similar
>> requirement for the platform device down the document) or this sentence is
>> meant to be added to all resulting generic/arm64/amd requirements?
> 
> This is not specific to PCI, though? The generic requirement is "Xen
> shall use the IOMMU to enforce DMA operations done by a DMA-capable
> device assigned to a domain to be restricted to the memory of the given
> domain".

Makes sense.


> 
> I think it is also OK to both have a PCI-specific and a
> non-PCI-specific requirement for that, I just wanted to mention that it
> doesn't look like something to PCI-specific.


ok, let's have a single requirement with generic subject, in description 
I can add the following:

The DMA-capable device can be either PCI or platform device.




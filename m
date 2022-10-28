Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65849611559
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 17:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432128.684870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQrC-0001bh-3g; Fri, 28 Oct 2022 15:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432128.684870; Fri, 28 Oct 2022 15:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQrC-0001Yw-0P; Fri, 28 Oct 2022 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 432128;
 Fri, 28 Oct 2022 15:01:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooQrA-0001Yq-DM
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 15:01:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQr9-0005Df-O8; Fri, 28 Oct 2022 15:01:11 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooQr9-00038I-F7; Fri, 28 Oct 2022 15:01:11 +0000
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
	bh=qSbtmEmc5nChW8eJHwZXZt6FJsJmhdkALKXw+AkCq5M=; b=zo0NufyNn+inrn2/DMxHAaydnC
	ZJlBKQg/Td95/3MiULZznQV8HLaFtfVq6BwP59FtkuwTRBfleXuZd3g/26p/GCEbV1xl7gAxS+1FB
	5wJxDvc9vfc5kId3QE3ixoLE7CMXCaYwO+Sz+OHEDr0BKgAp3DhJAchcYHafd9eHzebE=;
Message-ID: <affc51c9-0f8b-b76a-6f23-ec161c967580@xen.org>
Date: Fri, 28 Oct 2022 16:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <2981F6DC-444B-49DE-9D01-C0093A32E68F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2981F6DC-444B-49DE-9D01-C0093A32E68F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/10/2022 15:37, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 28 Oct 2022, at 14:27, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 28/10/2022 14:13, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Rahul,
>>>>
>>>> On 28/10/2022 13:54, Rahul Singh wrote:
>>>>>>>>>> For ACPI, I would have expected the information to be found in the IOREQ.
>>>>>>>>>>
>>>>>>>>>> So can you add more context why this is necessary for everyone?
>>>>>>>>> We have information for IOMMU and Master-ID but we don’t have information for linking vMaster-ID to pMaster-ID.
>>>>>>>>
>>>>>>>> I am confused. Below, you are making the virtual master ID optional. So shouldn't this be mandatory if you really need the mapping with the virtual ID?
>>>>>>> vMasterID is optional if user knows pMasterID is unique on the system. But if pMasterId is not unique then user needs to provide the vMasterID.
>>>>>>
>>>>>> So the expectation is the user will be able to know that the pMasterID is uniq. This may be easy with a couple of SMMUs, but if you have 50+ (as suggested above). This will become a pain on larger system.
>>>>>>
>>>>>> IHMO, it would be much better if we can detect that in libxl (see below).
>>>>> We can make the vMasterID compulsory to avoid complexity in libxl to solve this
>>>>
>>>> In general, complexity in libxl is not too much of problem.
>>> I am a bit unsure about this strategy.
>>> Currently xl has one configuration file where you put all Xen parameters. The device tree is only needed by some guests to have a description of the system they run on.
>>> If we change the model and say that Xen configuration parameters are both in the configuration and the device tree, we somehow enforce to have a device tree even though some guests do not need it at all (for example Zephyr).
>>
>> I think my approach was misunderstood because there is no change in the existing model.
>>
>> What I am suggesting is to not introduce iommu_devid_map but instead let libxl allocate the virtual Master-ID and create the mapping with the physical Master-ID.
>>
>> Libxl would then update the property "iommus" in the device-tree with the allocated virtual Master-ID.
> 
> Ok I understand now.
> 
>>
>> Each node in the partial device-tree would need to have a property
>> to refer to the physical device just so we know how to update the "iommus". The list of device passthrough will still be specified in the configuration file. IOW, the partial device-tree is not directly involved in the configuration of the guest.
> 
> But we will generate it. How would something like Zephyr guest work ? Zephyr is not using the device tree we pass, it has an embedded one.

In general, guest that don't use the device-tree/ACPI table to detect 
the layout are already in a bad situation because we don't guarantee 
that the layout (memory, interrupt...) will be stable across Xen 
version. Although, there are a implicit agreement that the layout will 
not change for minor release (i.e. 4.14.x).

But see below for some suggestions how this could be handled.

> 
>>
>> So far, I don't see a particular issue with this approach because the vMaster ID algorithm allocation should be generic. But please let me know if you think there are bits I am missing.
> 
> I am a bit afraid of things that are “automatic”.
> 
> For everything else we let the user in control (IPA for mapping, virtual interrupt number) and in this case we switch to a model where we automatically generated a vMaster ID.

We only let the user control where the device is mapped. But this is 
quite fragile... I think this should be generated at runtime.

> With this model, guest not using the device tree will have to guess the vMaster ID or somehow know how the tools are generating it to use the right one.

To be honest, this is already the case today because the layout exposed 
to the guest is technically not fixed. Yes, so far, we haven't changed 
it too much. But sooner or later, this is going to bite because we made 
clear that the layout is not stable.

Now, if those projects are willing to rebuild for each version, then we 
could use the following approach:
   1) Write the xl.cfg
   2) Ask libxl to generate the device-tree
   3) Build Zephyr
   4) Create the domain

The expectation is for a given Xen version (and compatible), libxl will 
always generate the same Device-Tree.

Cheers,

-- 
Julien Grall


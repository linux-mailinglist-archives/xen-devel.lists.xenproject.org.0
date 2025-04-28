Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5ECA9F846
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 20:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970969.1359487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9T1I-0000Ho-Vl; Mon, 28 Apr 2025 18:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970969.1359487; Mon, 28 Apr 2025 18:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9T1I-0000FA-Ri; Mon, 28 Apr 2025 18:15:56 +0000
Received: by outflank-mailman (input) for mailman id 970969;
 Mon, 28 Apr 2025 18:15:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u9T1I-0000F4-6A
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 18:15:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9T1H-00Aevw-1P;
 Mon, 28 Apr 2025 18:15:55 +0000
Received: from [2a02:8012:3a1:0:8834:9d13:966f:8422]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u9T0z-009HEx-1S;
 Mon, 28 Apr 2025 18:15:37 +0000
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
	bh=CGsjptbbwc60DbYw4GwHm0zOz8DnBV1eXKDU05rOr+0=; b=IzDlst2Lb9ZgZRFU3Kf9mqzS38
	ypovxfOcrBTTdvRlgjuVE37qxdgeMBZ/Xcv0nMjLTEPbFwtHZ/pDar81FdIo/2fZPQSLbPuBZ4sAa
	YYMauY9ve7IT4J5zMe+XL07l8dKtqzAiD1WLz/B+eMgmPcmPNCJZDAJbm2z6noHpzGvg=;
Message-ID: <ac7fe0d4-dc3b-4322-9df6-01adac02de4a@xen.org>
Date: Mon, 28 Apr 2025 19:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
 <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
 <a1715315-f4c8-4062-89db-e2df7b22865b@xen.org>
 <c61acb06-4770-434d-8158-d7e0b4b32f04@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c61acb06-4770-434d-8158-d7e0b4b32f04@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 28/04/2025 15:28, Mykyta Poturai wrote:
> On 28.04.25 15:55, Julien Grall wrote:
>> Hi,
>>
>> On 28/04/2025 13:31, Mykyta Poturai wrote:
>>> On 28.04.25 11:54, Julien Grall wrote:
>>>> Hi Mykyta,
>>>>
>>>> On 14/03/2025 13:34, Mykyta Poturai wrote:
>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>
>>>>> Enable the use of IOMMU + PCI in dom0 without having to specify
>>>>> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
>>>>> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.
>>>>
>>>> It would be good to explain why Xen cannot initialize the PCI
>>>> controller. Asking, because the reason is the PCI controller is too
>>>> complex, then you will likely need the same approach for PCI
>>>> passthrough...
>>>
>>> I think the main reason for this is complexity and the possibility of
>>> additional dependencies: there could be external clocks or reset pins
>>> that the PCI host depends on for working correctly. I will add this to
>>> the commit message. Regarding PCI passthrough, it is already using the
>>> same approach (at least on Arm). There are patches for enabling Xen on
>>> Arm to perform bus enumeration by itself by Luca Fancellu, but I haven't
>>> yet got to test them in a meaningful way.
>>
>> Can you provide a link to the series? I would like to make sure we have
>> a coherent approach. In particular, it is not clear to me how Dom0 and
>> Xen will be able to coordinate the access to the PCI controller. Are we
>> going to have a mediator?
>>
> 
> Here is a link to my WIP branch
> https://github.com/Deedone/xen/tree/pci_passthrough_wip
> Although it is slightly outdated due to recent review activity, I will
> updated it soon with all of the recent changes.
> 
> Luca's commits begin from c68a5cbb1a7d17907551159c99ab5c87ce0dedf9
> 
> I wasn't able to find them sent to any mailing lists, but I plan to also
> send them after the base case with Dom0 enumeration stabilizes.

I don't think you can stabilize one without the other. I am worry the 
interface may not work properly for PCI passthrough. So until then, I 
would say this should be marked as unsupported (maybe protected by 
CONFIG_UNSUPPORTED).

> 
> There is no mediator, Dom0 configures the host controller, enumerates
> child devices, and then gives complete access to some of them to Xen.
> Xen only does "logical" operations with child devices and does not
> change any of the host controller base settings.

I am not sure I fully understanding this. Both dom0 will need to access 
the configuration space. So you would need to ensure there is only one 
accessing the configuration space at a give time.

> To ensure that Dom0
> will not mess with the child devices, tools bind them to the stub
> driver. Theoretically, Dom0 can bind to those devices again and break
> something, but it can also do a lot of other breaking stuff so I don't
> think there is a good reason to invent some forms of protection from it.

We should not trust dom0 to do the right thing. But reading ...

> 
> After some time with pci-scan changes merged it should become possible
> to make Xen do the enumeration, and only give Dom0 the virtual PCI bus,
> which would prevent it from accessing non-owned devices.

... this it sounds like this would be temporary. Do you have patches 
already on the mailing list?

Cheers,

-- 
Julien Grall



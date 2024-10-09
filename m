Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874519960E9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 09:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813781.1226806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syR9w-0004tF-D0; Wed, 09 Oct 2024 07:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813781.1226806; Wed, 09 Oct 2024 07:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syR9w-0004rj-9L; Wed, 09 Oct 2024 07:31:00 +0000
Received: by outflank-mailman (input) for mailman id 813781;
 Wed, 09 Oct 2024 07:30:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1syR9u-0004rd-Ue
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 07:30:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syR9s-0002iD-EL; Wed, 09 Oct 2024 07:30:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syR9s-0007Ql-8a; Wed, 09 Oct 2024 07:30:56 +0000
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
	bh=KCds8fb9VBnrfQfPYtElZuRg0mBMNkzJF4od8SkPqx8=; b=d3H8jKbFiXKb50ZceKus4YRz6L
	YTuAKVadsINoDFjMRVKMbgS4jkj9Z0UlUpVMfOJKNPb4jvGnzAT1mKYCnkbTFJlXok7x7Omg0Z9AR
	lQBO0UgUULTcRmrJdBEFs87XRDNr/DVOq5dtshmCkwXSRPPxtI9+7qXH19yTzQyMxqJA=;
Message-ID: <10b3e5ae-1845-4bca-ad13-da0da2ec66bc@xen.org>
Date: Wed, 9 Oct 2024 08:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
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
 <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 09/10/2024 07:30, Bertrand Marquis wrote:
> Hi Stefano,
> 
>> On 9 Oct 2024, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Tue, 8 Oct 2024, Oleksandr Tyshchenko wrote:
>>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote:
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Assign PCI device to domain (with IOMMU)
>>>>> +----------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a specified PCI device (always implied as DMA-capable)
>>>>> to
>>>>> +a domain during its creation using passthrough (partial) device tree on
>>>>> Arm64
>>>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be
>>>>> assigned is
>>>>> +protected by the IOMMU.
>>>>
>>>> This is a very long and complex requirement.
>>>> I would suggest to split it in 3:
>>>> - generic: Xen shall support assign PCI devices to domains.
>>>> - arm64 one: Xen shall assign PCI devices based on device tree (explain how
>>>> this is configured in dts)
>>>> - amd: xxxx based on hyperlaunch
>>>
>>> I agree, will split, but ...
>>>
>>>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI device
>>>> assigned to a domain to be restricted to the memory of the given domain.
>>>
>>>
>>> ... does this need to be a separate 4th requirement here (and for the similar
>>> requirement for the platform device down the document) or this sentence is
>>> meant to be added to all resulting generic/arm64/amd requirements?
>>
>> This is not specific to PCI, though? The generic requirement is "Xen
>> shall use the IOMMU to enforce DMA operations done by a DMA-capable
>> device assigned to a domain to be restricted to the memory of the given
>> domain".
>>
>> I think it is also OK to both have a PCI-specific and a
>> non-PCI-specific requirement for that, I just wanted to mention that it
>> doesn't look like something to PCI-specific.
> 
> I think we should completely abstract out the DMA engine problem as it
> is not specific to a PCI or not device but to any DMA capable stuff.

+1

> 
> Maybe the same also goes for interrupts and how those are assigned or
> forwarded or not to a domain (attached or not to a device).

I am not sure we can abstract this one because:
  * For platform devices, we should be able to support SPIs and MSI(-x) 
(only the former is so far).
  * For PCI devices, at least on Arm, AFAIR, we only intend to support 
MSI(-x).

Cheers,

-- 
Julien Grall


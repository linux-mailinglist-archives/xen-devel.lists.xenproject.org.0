Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821E35F011
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 10:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110379.210674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbDX-0006E4-B4; Wed, 14 Apr 2021 08:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110379.210674; Wed, 14 Apr 2021 08:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWbDX-0006Df-7Q; Wed, 14 Apr 2021 08:49:47 +0000
Received: by outflank-mailman (input) for mailman id 110379;
 Wed, 14 Apr 2021 08:49:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWbDV-0006Da-TJ
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 08:49:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWbDQ-0005yL-3L; Wed, 14 Apr 2021 08:49:40 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWbDP-0007Bp-Qn; Wed, 14 Apr 2021 08:49:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=BJ/mrWa1vDI4MEX+z4BXgXxOBIj3SU4Xpw3gXYq0KgU=; b=4cQeyOMFNAFUdfW/CYS4YCzmap
	KwvVvAPqSVFOkXlZUhpx/tKP6GGOOgdmsVKMyStmUFzsv2b9fdmHk7LkYhMiomGeVIkCP7iR50pjM
	E9N18QcDRsLV10CQ18bfdJI8btv0HEloX0YQAmnJ58arY9vABjBBvwDJZpsDcNSTqtEA=;
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
Date: Wed, 14 Apr 2021 09:49:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHaiW4xX0p6ov2Z9@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 14/04/2021 09:05, Roger Pau Monné wrote:
> On Tue, Apr 13, 2021 at 06:12:10PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 12/04/2021 11:49, Roger Pau Monné wrote:
>>> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>>> index 705137f8be..1b473502a1 100644
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
>>>>    }
>>>>    __initcall(setup_dump_pcidevs);
>>>> +
>>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>>    int iommu_update_ire_from_msi(
>>>>        struct msi_desc *msi_desc, struct msi_msg *msg)
>>>>    {
>>>>        return iommu_intremap
>>>>               ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>>>    }
>>>> +#endif
>>>
>>> This is not exactly related to MSI intercepts, the IOMMU interrupt
>>> remapping table will also be used for interrupt entries for devices
>>> being used by Xen directly, where no intercept is required.
>>
>> On Arm, this is not tie to the IOMMU. Instead, this handled is a separate
>> MSI controller (such as the ITS).
>>
>>>
>>> And then you also want to gate the hook from iommu_ops itself with
>>> CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.
>>
>>
>> All the callers are in the x86 code. So how about moving the function in an
>> x86 specific file?
> 
> Yes, that seems fine. Just place it in asm-x86/iommu.h. I wonder why
> update_ire_from_msi wasn't moved when the rest of the x86 specific
> functions where moved there.

I am guessing it is because the function was protected by CONFIG_HAS_PCI 
rather than CONFIG_X86. So it was deferred until another arch enables 
CONFIG_HAS_PCI (it is easier to know what code should be moved).

> Was there an aim to use that in other
> arches?

In the future we may need to use MSIs in Xen (IIRC some SMMUs only 
support MSI interrupt). But I think the naming would be misleading as 
the IOMMU will not be used for the remapping.

So most likely, we would want a more generic name (maybe 
"arch_register_msi()"). This could call iommu_update_ire_from_msi() on 
x86 and the ITS on Arm.

I don't know how RISCv and PowerPC remap the interrupt. But if they are 
using the IOMMU then we could provide a generic helper protected by 
CONFIG_HAS_IOMMU_INTERRUPT_REMAP (or a similar name).

> 
> The hook in iommu_ops also need to be moved inside the x86 region.
> Please do this iommu change in a separate patch.

+1

Cheers,

-- 
Julien Grall


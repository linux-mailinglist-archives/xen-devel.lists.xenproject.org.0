Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EB6FF380
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533400.830033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6pt-0004Z1-6V; Thu, 11 May 2023 14:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533400.830033; Thu, 11 May 2023 14:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6pt-0004XA-3i; Thu, 11 May 2023 14:00:01 +0000
Received: by outflank-mailman (input) for mailman id 533400;
 Thu, 11 May 2023 14:00:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1px6ps-0004X4-4r
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:00:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px6pp-0004bJ-O4; Thu, 11 May 2023 13:59:57 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px6pp-00065i-1E; Thu, 11 May 2023 13:59:57 +0000
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
	bh=w0U2ROCuByYabEe51ltdyQZ0BmIHcwVWCroGR66TcbM=; b=rfgWtkjdcFgE/9ws/IvDh9omFU
	l1+6yRqdwkkLuPDJiVK0eIyZ6T8I5dOq7W0IQUagLrE1iYy4MsxgT4cNupxkR0zj+WDuDPHpdQC+d
	ur5gJgOSb6WKpoO0Ldux3zadY8xDGsmMjcWVaZ1umzi1kJV5SNU0ZljGgqOgeHOY7Quo=;
Message-ID: <f07ceaef-d525-faa8-8911-77c588e85102@xen.org>
Date: Thu, 11 May 2023 14:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of
 arch hook
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
 <20230501200305.168058-5-stewart.hildebrand@amd.com>
 <ced11c6e-caf7-3a19-92c8-5c11b18952b6@suse.com>
 <8591236e-5dc2-7da7-fe3a-7cb2ae1ed7d0@amd.com>
 <462657d4-72e7-6266-6ea5-2b9e443f9813@suse.com>
 <03fa79ed-2b24-8329-36fd-dd8edc14fa72@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <03fa79ed-2b24-8329-36fd-dd8edc14fa72@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Can you make sure to CC the Arm/SMMU maintainers as I feel it is 
important for them to also review the generic changes.

On 11/05/2023 14:49, Stewart Hildebrand wrote:
> On 5/8/23 10:51, Jan Beulich wrote:
>> On 08.05.2023 16:16, Stewart Hildebrand wrote:
>>> On 5/2/23 03:50, Jan Beulich wrote:
>>>> On 01.05.2023 22:03, Stewart Hildebrand wrote:
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
>>>>>
>>>>>   static int iommu_add_device(struct pci_dev *pdev)
>>>>>   {
>>>>> -    const struct domain_iommu *hd;
>>>>> +    const struct domain_iommu *hd __maybe_unused;
>>>>>       int rc;
>>>>>       unsigned int devfn = pdev->devfn;
>>>>>
>>>>> @@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
>>>>>       if ( !is_iommu_enabled(pdev->domain) )
>>>>>           return 0;
>>>>>
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +    rc = iommu_add_dt_pci_device(devfn, pdev);
>>>>> +#else
>>>>>       rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>>> -    if ( rc || !pdev->phantom_stride )
>>>>> +#endif
>>>>> +    if ( rc < 0 || !pdev->phantom_stride )
>>>>> +    {
>>>>> +        if ( rc < 0 )
>>>>> +            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>>> +                   &pdev->sbdf, rc);
>>>>>           return rc;
>>>>> +    }
>>>>>
>>>>>       for ( ; ; )
>>>>>       {
>>>>>           devfn += pdev->phantom_stride;
>>>>>           if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
>>>>>               return 0;
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +        rc = iommu_add_dt_pci_device(devfn, pdev);
>>>>> +#else
>>>>>           rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>>> -        if ( rc )
>>>>> +#endif
>>>>> +        if ( rc < 0 )
>>>>>               printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
>>>>>                      &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
>>>>>       }
>>>>
>>>> Such #ifdef-ary may be okay at the call site(s), but replacing a per-
>>>> IOMMU hook with a system-wide DT function here looks wrong to me.
>>>
>>> Perhaps a better approach would be to rely on the existing iommu add_device call.
>>>
>>> This might look something like:
>>>
>>> #ifdef CONFIG_HAS_DEVICE_TREE
>>>      rc = iommu_add_dt_pci_device(pdev);
>>>      if ( !rc ) /* or rc >= 0, or something... */
>>> #endif
>>>          rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
>>>
>>> There would be no need to call iommu_add_dt_pci_device() in the loop iterating over phantom functions, as I will handle those inside iommu_add_dt_pci_device() in v2.
>>
>> But that still leaves #ifdef-ary inside the function. If for whatever reason
>> the hd->platform_ops hook isn't suitable (which I still don't understand),
> 
> There's nothing wrong with the existing hd->platform_ops hook. We just need to ensure we've translated RID to AXI stream ID sometime before it.
> 
>> then - as said - I'd view such #ifdef as possibly okay at the call site of
>> iommu_add_device(), but not inside.
> 
> I'll move the #ifdef-ary.

I am not sure what #ifdef-ary you will have. However, at some point, we 
will also want to support ACPI on Arm. Both DT and ACPI co-exist and 
this would not work properly with the code you wrote.

If we need some DT specific call, then I think the call should happen 
with hd->platform_ops rather than in the generic infrastructure.

Cheers,

-- 
Julien Grall


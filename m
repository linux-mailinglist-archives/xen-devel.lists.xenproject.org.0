Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A55360A86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111153.212532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX25f-0001AD-S6; Thu, 15 Apr 2021 13:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111153.212532; Thu, 15 Apr 2021 13:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX25f-00019o-OV; Thu, 15 Apr 2021 13:31:27 +0000
Received: by outflank-mailman (input) for mailman id 111153;
 Thu, 15 Apr 2021 13:31:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX25f-00019j-29
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 13:31:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX25Y-0000SY-3p; Thu, 15 Apr 2021 13:31:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX25X-0001sx-ID; Thu, 15 Apr 2021 13:31:19 +0000
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
	bh=DqsX+LfO2Qc+1KbTD1msTfiRaFiBnsHRKFpXG1msmPU=; b=RQX6RiWZhuM/944bC8Vjs9znQy
	0AcJ5vvOGm7F3t1vm1d6weF2yy5RbUHqcK93nKCRbc8qcCiAgzrraWgmDlMyGniQ61JlIRrpA1UIM
	NJ4kbVpYClCwzEmVnS1jcU37E1kp2spdKvL1c2FtWQj/zh4WQFA6wbSzqskMBp2YfrVs=;
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
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
Date: Thu, 15 Apr 2021 14:31:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHg+6rLN0rBWXcTs@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 15/04/2021 14:26, Roger Pau Monné wrote:
> On Wed, Apr 14, 2021 at 09:49:37AM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 14/04/2021 09:05, Roger Pau Monné wrote:
>>> On Tue, Apr 13, 2021 at 06:12:10PM +0100, Julien Grall wrote:
>>>> Hi Roger,
>>>>
>>>> On 12/04/2021 11:49, Roger Pau Monné wrote:
>>>>> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>>>>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>>>>> index 705137f8be..1b473502a1 100644
>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>> @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
>>>>>>     }
>>>>>>     __initcall(setup_dump_pcidevs);
>>>>>> +
>>>>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>>>>     int iommu_update_ire_from_msi(
>>>>>>         struct msi_desc *msi_desc, struct msi_msg *msg)
>>>>>>     {
>>>>>>         return iommu_intremap
>>>>>>                ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>>>>>     }
>>>>>> +#endif
>>>>>
>>>>> This is not exactly related to MSI intercepts, the IOMMU interrupt
>>>>> remapping table will also be used for interrupt entries for devices
>>>>> being used by Xen directly, where no intercept is required.
>>>>
>>>> On Arm, this is not tie to the IOMMU. Instead, this handled is a separate
>>>> MSI controller (such as the ITS).
>>>>
>>>>>
>>>>> And then you also want to gate the hook from iommu_ops itself with
>>>>> CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.
>>>>
>>>>
>>>> All the callers are in the x86 code. So how about moving the function in an
>>>> x86 specific file?
>>>
>>> Yes, that seems fine. Just place it in asm-x86/iommu.h. I wonder why
>>> update_ire_from_msi wasn't moved when the rest of the x86 specific
>>> functions where moved there.
>>
>> I am guessing it is because the function was protected by CONFIG_HAS_PCI
>> rather than CONFIG_X86. So it was deferred until another arch enables
>> CONFIG_HAS_PCI (it is easier to know what code should be moved).
>>
>>> Was there an aim to use that in other
>>> arches?
>>
>> In the future we may need to use MSIs in Xen (IIRC some SMMUs only support
>> MSI interrupt).
> 
> Then I think some of the bits that are moved from
> xen/drivers/passthrough/pci.c (alloc_pci_msi, free_pci_msi and
> dump_pci_msi) need to be protected by a Kconfig option different than
> CONFIG_PCI_MSI_INTERCEPT, as those are not related to MSI interception,
> but to MSI handling in general (ie: Xen devices using MSI need
> those).

Well... x86-specific devices yes. We don't know in what form MSI will be 
added on for other arch-specific devices.

  The same with the msi_list and msix fields of pci_dev, those
> are not only used for MSI interception.
> 
> Or at least might be worth mentioning that the functions will be
> needed for Xen to be able to use MSI interrupts itself, even if not
> for interception purposes.

My preference would be to comment in the commit message (although, there 
is no promise they will ever get re-used). We can then modify the #ifdef 
once we introduce any use.

Cheers,

-- 
Julien Grall


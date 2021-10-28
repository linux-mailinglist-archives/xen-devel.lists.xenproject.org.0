Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FF43DFCC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217890.378108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3MC-0000Jc-4Y; Thu, 28 Oct 2021 11:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217890.378108; Thu, 28 Oct 2021 11:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3MC-0000Gq-0X; Thu, 28 Oct 2021 11:14:04 +0000
Received: by outflank-mailman (input) for mailman id 217890;
 Thu, 28 Oct 2021 11:14:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg3MB-0000Gk-Cz
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:14:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg3MB-0005tN-0K; Thu, 28 Oct 2021 11:14:03 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg3MA-00027e-QT; Thu, 28 Oct 2021 11:14:02 +0000
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
	bh=Hw4hI0gE4QgJ8ZpOe253Zwh1AWcsryjSDOXILm7Ye7M=; b=u8R0SF20gfLKfRWNBr5KOdAsgc
	SfMTTYs5ENNWj8ttH7trDn/IE2laOZyG65Nczab210lDHe+gHUOAbZS03j8UM0vLT6usbCUv+9sLS
	uuxKMJh4g1vJXxPpeU7c4ns8HXZccBJGn3PwydbOD/RlOwV99+UhhyMAgBLlgwnn5e6Y=;
Message-ID: <4e862e54-9cbb-ae91-6284-cfcb684dcf09@xen.org>
Date: Thu, 28 Oct 2021 12:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v5 09/10] xen/arm: Do not map PCI ECAM and MMIO space to
 Domain-0's p2m
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-10-andr2000@gmail.com>
 <f5767857-a80a-fcc2-e70e-ce59ce19c8c9@xen.org>
 <121f1c81-4385-ae12-fefc-dfa638bf1f81@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <121f1c81-4385-ae12-fefc-dfa638bf1f81@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/10/2021 12:37, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi Oleksandr,

> On 13.10.21 19:17, Julien Grall wrote:
>> On 08/10/2021 06:55, Oleksandr Andrushchenko wrote:
>>> +    };
>>>          naddr = dt_number_of_address(dev);
>>>    @@ -1884,7 +1889,6 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>>>        /* Give permission and map MMIOs */
>>>        for ( i = 0; i < naddr; i++ )
>>>        {
>>> -        struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
>>>            res = dt_device_get_address(dev, i, &addr, &size);
>>>            if ( res )
>>>            {
>>> @@ -1898,7 +1902,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>>>                return res;
>>>        }
>>>    -    res = map_device_children(d, dev, p2mt);
>>> +    res = map_device_children(dev, &mr_data);
>>>        if ( res )
>>>            return res;
>>>    @@ -3056,7 +3060,14 @@ static int __init construct_dom0(struct domain *d)
>>>            return rc;
>>>          if ( acpi_disabled )
>>> +    {
>>>            rc = prepare_dtb_hwdom(d, &kinfo);
>>> +        if ( rc < 0 )
>>> +            return rc;
>>> +#ifdef CONFIG_HAS_PCI
>>> +        rc = pci_host_bridge_mappings(d, p2m_mmio_direct_c);
>>
>> It is not clear to me why you are passing p2m_mmio_direct_c and not p2mt here?
> There is no p2mt in the caller function, e.g. construct_dom0
>> If you really want to force a type, then I think it should be p2m_mmio_direct.
> I just followed the defaults found in:
> static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
> {
>       const p2m_type_t default_p2mt = p2m_mmio_direct_c;
> which is also called from construct_dom0

We use "p2m_mmio_direct_c" (cacheable mapping) by default because we 
don't know what how the region will be accessed  (e.g. this may be an 
SRAM). With this type, there is no restriction and dom0 is responsible 
to set to proper attribute in the stage-1 page-tables.

In this hostbridge cases, I see limited reasons at the moment for 
someone to map the non-BAR regions with cacheable attributes. So I think 
it is better to chose the most restricting attribute in the stage-2 
page-table.

>>
>> But then why is it a parameter of pci_host_bridge_mappings? Do you expect someone else to modify it?
> No, I don't expect to modify that, I just don't want PCI code to make decisions on that.
> So, I feel more comfortable if that decision is taken in construct_dom0.
Only the hostbridge driver is really aware of how the region will be 
accessed. So I think it is better to let...

> 
> So, what do we want here? Pass as parameter (then p2m_mmio_direct I guess, not p2m_mmio_direct_c)?
> Or let PCI code use p2m_mmio_direct inside pci_host_bridge_mappings?

... pci_host_bridge_mappings() decide the attribute. This can 
potentially allow us to have a per-hostbridge type if needed in the future.

[...]

>>
>> This is also exported but not used. I would prefer if we only exposed when the first external user will be introduced.
> ZynqMP is the first user yet in this patch. More to come probably later on when we add other host bridges.

Ah, sorry I didn't spot the use.

Cheers,

-- 
Julien Grall


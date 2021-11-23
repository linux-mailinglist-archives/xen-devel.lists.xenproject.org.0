Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A645A749
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229704.397204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYOv-0004Bv-Cq; Tue, 23 Nov 2021 16:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229704.397204; Tue, 23 Nov 2021 16:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYOv-00049i-9v; Tue, 23 Nov 2021 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 229704;
 Tue, 23 Nov 2021 16:12:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpYOt-00049c-J9
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:12:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpYOt-0007IW-28; Tue, 23 Nov 2021 16:12:07 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpYOs-0005WD-S9; Tue, 23 Nov 2021 16:12:07 +0000
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
	bh=/ovm3QopKui8465+wSHBv0vWMc0nPMpTN3/YflDPBpU=; b=1u4vHZbCP7yFWvP2Pbe9eGWhWP
	UNTKg4KqibYk4LLRJxYun+PNOZWV3qPeUvOIZgrbHHqiX/NKEWtqnIPPiOhyvQmKmCa8bryjwu5ZE
	5/tnRAPTzwyg29LU6GOSYgXqdfC3zqZaB/P+vzUwUh5GK4X+XhEOF28Mdx3LU05QG2fw=;
Message-ID: <ef17fbe6-9768-9978-fa8f-6be757034234@xen.org>
Date: Tue, 23 Nov 2021 16:12:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
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
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
 <2eb6b4e8-95e1-9566-3209-c28964b0d643@xen.org>
 <2f414e8f-67d5-d513-74d4-cc21a3a9ed28@epam.com>
 <9f712f79-9660-865a-3002-713950518819@epam.com>
 <117a57d1-aa4f-8153-8bba-2db47c234b81@xen.org>
 <c6232073-b59a-609f-3852-ddcac0859c2c@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c6232073-b59a-609f-3852-ddcac0859c2c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/11/2021 06:58, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi Oleksandr,

> On 22.11.21 19:36, Julien Grall wrote:
>> On 18/11/2021 10:46, Oleksandr Andrushchenko wrote:
>>> On 18.11.21 09:27, Oleksandr Andrushchenko wrote:
>>>>>> +    unsigned int count;
>>>>>> +
>>>>>> +    if ( is_hardware_domain(d) )
>>>>>> +        /* For each PCI host bridge's configuration space. */
>>>>>> +        count = pci_host_get_num_bridges();
>>>>> This first part makes sense to me. But...
>>>>>
>>>>>> +    else
>>>>> ... I don't understand how the else is related to this commit. Can you clarify it?
>>>>>
>>>>>> +        /*
>>>>>> +         * There's a single MSI-X MMIO handler that deals with both PBA
>>>>>> +         * and MSI-X tables per each PCI device being passed through.
>>>>>> +         * Maximum number of supported devices is 32 as virtual bus
>>>>>> +         * topology emulates the devices as embedded endpoints.
>>>>>> +         * +1 for a single emulated host bridge's configuration space.
>>>>>> +         */
>>>>>> +        count = 1;
>>>>>> +#ifdef CONFIG_HAS_PCI_MSI
>>>>>> +        count += 32;
>>>>> Surely, this is a decision that is based on other factor in the vPCI code. So can use a define and avoid hardcoding the number?
>>>> Well, in the later series [1] this is defined via PCI_SLOT(~0) + 1 and there is no dedicated
>>>> constant for that. I can use the same here, e.g. s/32/PCI_SLOT(~0) + 1
>>
>> I would prefer if we introduce a new constant for that. This makes easier to update the code if we decide to increase the number of virtual devices.
>>
>> However, I am still not sure how the 'else' part is related to this commit. Can you please clarify it?
> Well, yes, this is too early for this patch to introduce some future knowledge, so I'll instead have:
> 
> unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
> {
>       if ( !has_vpci(d) )
>           return 0;
> 
>       if ( is_hardware_domain(d) )
>       {
>           int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
> 
>           return ret < 0 ? 0 : ret;
>       }
> 
>       /*
>        * This is a guest domain:
>        *
>        * 1 for a single emulated host bridge's configuration space.
>        */
>       return 1;

I am afraid that my question stands even with this approach. This patch 
is only meant to handle the hardware domain, therefore the change seems 
to be out of context.

I would prefer if this change is done separately.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2897454F63
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 22:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227001.392474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSYw-0006Xb-Tl; Wed, 17 Nov 2021 21:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227001.392474; Wed, 17 Nov 2021 21:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnSYw-0006VM-Qa; Wed, 17 Nov 2021 21:33:50 +0000
Received: by outflank-mailman (input) for mailman id 227001;
 Wed, 17 Nov 2021 21:33:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnSYv-0006VG-CU
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 21:33:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSYu-0001ET-Li; Wed, 17 Nov 2021 21:33:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.25.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnSYu-0000Bn-FK; Wed, 17 Nov 2021 21:33:48 +0000
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
	bh=4xzMYiQsssrDbPr0SJyETYgvVubbl95/rxE64CtG+vs=; b=5W5gEQfsfTPzUfV3NNkiuCQ53u
	HNl6TG3i6AYtn6ulk95Hos5einNj8LcR6w0ygWHsdV4VynBw811FJ6XMWjAniGfwgXk7ClBxmrbmo
	R3Wgii30eKwGbuzhVVGasR1+UDftvFoIga879apcZlY5A1iqzemXsJ2nPPCA/4T/VqEk=;
Message-ID: <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
Date: Wed, 17 Nov 2021 21:33:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
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
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 17/11/2021 06:56, Oleksandr Andrushchenko wrote:
> Hi, Julien!
> 
> On 16.11.21 20:48, Julien Grall wrote:
>> Hi Oleksander,
>>
>> On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> If a PCI host bridge device is present in the device tree, but is
>>> disabled, then its PCI host bridge driver was not instantiated.
>>> This results in the failure of the pci_get_host_bridge_segment()
>>> and the following panic during Xen start:
>>>
>>> (XEN) Device tree generation failed (-22).
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Could not set up DOM0 guest OS
>>> (XEN) ****************************************
>>>
>>> Fix this by adding "linux,pci-domain" property for all device tree nodes
>>> which have "pci" device type, so we know which segments will be used by
>>> the guest for which bridges.
>>>
>>> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> ---
>>> New in v6
>>> ---
>>>    xen/arch/arm/domain_build.c        | 15 ++++++++++++++-
>>>    xen/arch/arm/pci/pci-host-common.c |  2 +-
>>>    xen/include/asm-arm/pci.h          |  8 ++++++++
>>>    3 files changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 491f5e2c316e..f7fcb1400c19 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -753,9 +753,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>>            {
>>>                uint16_t segment;
>>>    +            /*
>>> +             * The node doesn't have "linux,pci-domain" property and it is
>>> +             * possible that:
>>> +             *  - Xen only has drivers for a part of the host bridges
>>> +             *  - some host bridges are disabled
>>> +             * Make sure we insert the correct "linux,pci-domain" property
>>> +             * in any case, so we know which segments will be used
>>> +             * by Linux for which bridges.
>>
>> The check above will check the node type is "pci". AFAICT, this would also cover PCI devices. I am not aware of any issue to add "linux,pci-domain" for them. However, this feels a bit odd.
>>
>>  From my understanding, a PCI device would always be described as a child of the hostbridges. So I would rework the 'if' to also check if the parent type is not "pci".
>>
> We may have "bridge -> bridge -> device" topology as well.

Do you have an example of Device-Tree?

> So, I prefer to have the check as it is.

I don't really like the idea to spuriously add "linux,pci-domain" to PCI 
DT node. But if there are no other solution, then this should at least 
be mentionned in the commit message and code.

[...]

> Yes, this sounds reasonable, I will add this change and print an error message so it is
> easier to understand what Xen doesn't like (it took me a while to debug and understand
> why I have "(XEN) Device tree generation failed (-22).")


Sounds good to me. The current error is indeed confusing.

Cheers,

-- 
Julien Grall


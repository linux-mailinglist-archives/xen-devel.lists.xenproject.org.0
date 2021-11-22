Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354D459169
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 16:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228982.396282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBGb-0000T0-Mi; Mon, 22 Nov 2021 15:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228982.396282; Mon, 22 Nov 2021 15:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpBGb-0000QU-J9; Mon, 22 Nov 2021 15:30:01 +0000
Received: by outflank-mailman (input) for mailman id 228982;
 Mon, 22 Nov 2021 15:30:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpBGZ-0000NE-VT
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 15:29:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpBGZ-0002Bh-B6; Mon, 22 Nov 2021 15:29:59 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.28.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpBGZ-00074F-4e; Mon, 22 Nov 2021 15:29:59 +0000
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
	bh=IZf0stmIYv1jBexNNIJeDoDLkuE0ac+nl1hytrsodRQ=; b=ar0lif1u+Ih2PU2hOF+cjY+AGS
	9u7vbbP+gB91xQ21GXnZQR9kbj2e/p+QPqB87cmLVHnulzr5TcqM7oJBAwLVAuP25/cxCJnN1fM/6
	XzlmK+aYCOtHdHaLQjuaP2id/ZxuheLg37TAuJujcbUZU0BZCr4E8eL/RCRS0fClKhW4=;
Message-ID: <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
Date: Mon, 22 Nov 2021 15:29:56 +0000
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
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/11/2021 07:13, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi Oleksandr,

> On 17.11.21 23:33, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 17/11/2021 06:56, Oleksandr Andrushchenko wrote:
>>> Hi, Julien!
>>>
>>> On 16.11.21 20:48, Julien Grall wrote:
>>>> Hi Oleksander,
>>>>
>>>> On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> If a PCI host bridge device is present in the device tree, but is
>>>>> disabled, then its PCI host bridge driver was not instantiated.
>>>>> This results in the failure of the pci_get_host_bridge_segment()
>>>>> and the following panic during Xen start:
>>>>>
>>>>> (XEN) Device tree generation failed (-22).
>>>>> (XEN)
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) Could not set up DOM0 guest OS
>>>>> (XEN) ****************************************
>>>>>
>>>>> Fix this by adding "linux,pci-domain" property for all device tree nodes
>>>>> which have "pci" device type, so we know which segments will be used by
>>>>> the guest for which bridges.
>>>>>
>>>>> Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")
>>>>>
>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> ---
>>>>> New in v6
>>>>> ---
>>>>>     xen/arch/arm/domain_build.c        | 15 ++++++++++++++-
>>>>>     xen/arch/arm/pci/pci-host-common.c |  2 +-
>>>>>     xen/include/asm-arm/pci.h          |  8 ++++++++
>>>>>     3 files changed, 23 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>> index 491f5e2c316e..f7fcb1400c19 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -753,9 +753,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>>>>>             {
>>>>>                 uint16_t segment;
>>>>>     +            /*
>>>>> +             * The node doesn't have "linux,pci-domain" property and it is
>>>>> +             * possible that:
>>>>> +             *  - Xen only has drivers for a part of the host bridges
>>>>> +             *  - some host bridges are disabled
>>>>> +             * Make sure we insert the correct "linux,pci-domain" property
>>>>> +             * in any case, so we know which segments will be used
>>>>> +             * by Linux for which bridges.
>>>>
>>>> The check above will check the node type is "pci". AFAICT, this would also cover PCI devices. I am not aware of any issue to add "linux,pci-domain" for them. However, this feels a bit odd.
>>>>
>>>>   From my understanding, a PCI device would always be described as a child of the hostbridges. So I would rework the 'if' to also check if the parent type is not "pci".
>>>>
>>> We may have "bridge -> bridge -> device" topology as well.
>>
>> Do you have an example of Device-Tree?
> No, I don't have at hand, but I can imagine this can relatively easy be done with QEMU > Even if not, do you assume this topology can never happen?

I think it is not possible to describe them in the Device-Tree because 
you wouldn't be able to translate the "regs" of the nested hostbridge to 
an actual MMIO address.

In fact, looking at dt_device_get_address(), I think Xen would reject 
such DT.

>>
>>> So, I prefer to have the check as it is.
>>
>> I don't really like the idea to spuriously add "linux,pci-domain" to PCI DT node. But if there are no other solution, then this should at least be mentionned in the commit message and code.
> I am fine with any solution here, I just want that to be defined and implemented.
> Please let me know the final decision on this and how we proceed

I would prefer to go with my way. This can be refined in the future if 
we find Device-Tree that matches what you wrote.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6542F6DF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210816.367821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOyY-0005Pj-7Y; Fri, 15 Oct 2021 15:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210816.367821; Fri, 15 Oct 2021 15:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOyY-0005MU-46; Fri, 15 Oct 2021 15:18:26 +0000
Received: by outflank-mailman (input) for mailman id 210816;
 Fri, 15 Oct 2021 15:18:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mbOyW-0005MO-Cx
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:18:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOyU-0007Eq-Uc; Fri, 15 Oct 2021 15:18:22 +0000
Received: from [54.239.6.185] (helo=[192.168.0.140])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mbOyU-0007C9-NP; Fri, 15 Oct 2021 15:18:22 +0000
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
	bh=GM2v2tNpKGMkFIEekC/2+T1oszNEFZ3uynNX7Zfh8VU=; b=TwE94Jm2VaC0Ks0zWJX/qHl7Li
	TAQFmQd5je4OuG0r45B4aTxqBGRZ2YNik+PhYMsERHLiWrwhDx6I+SGa9UCfGhBbxeCwbI7RJv7Fp
	5CmLBDGvdsrLYnkO++NK0n6R3g/nmIW0PvIILElnG6TKC0gCQ6K3Op6ZTDsTNrwlvf4Y=;
Message-ID: <406fbce4-9e5a-a661-bd6a-a65956886f26@xen.org>
Date: Fri, 15 Oct 2021 16:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Rahul Singh
 <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
 <YWmQa4uMA8usiHcu@MacBook-Air-de-Roger.local>
 <801F3B48-BAA0-4520-8B41-E83627AA845C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <801F3B48-BAA0-4520-8B41-E83627AA845C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 15/10/2021 16:06, Bertrand Marquis wrote:
>> On 15 Oct 2021, at 15:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Fri, Oct 15, 2021 at 02:59:19PM +0100, Bertrand Marquis wrote:
>>> From: Rahul Singh <rahul.singh@arm.com>
>>>
>>> The existing VPCI support available for X86 is adapted for Arm.
>>> When the device is added to XEN via the hyper call
>>> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
>>> access is added to the Xen to emulate the PCI devices config space.
>>>
>>> A MMIO trap handler for the PCI ECAM space is registered in XEN
>>> so that when guest is trying to access the PCI config space,XEN
>>> will trap the access and emulate read/write using the VPCI and
>>> not the real PCI hardware.
>>>
>>> For Dom0less systems scan_pci_devices() would be used to discover the
>>> PCI device in XEN and VPCI handler will be added during XEN boots.
>>>
>>> This patch is also doing some small fixes to fix compilation errors on
>>> arm32 of vpci and prevent 64bit accesses on 32bit:
>>> - use %zu instead of lu in header.c for print
>>> - prevent 64bit accesses in vpci_access_allowed
>>> - ifdef out using CONFIG_64BIT handling of len 8 in
>>> vpci_ecam_{read/write}
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> The vpci bits looks fine to me, so:
>>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks
> 
>>
>> I have one question however related to the placement of the vpci setup
>> call in pci_add_device.
>>
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>> index 3aa8c3175f..082892c8a2 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>>>      }
>>>      else
>>> +    {
>>> +#ifdef CONFIG_ARM
>>> +        /*
>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>> +         */
>>> +        ret = vpci_add_handlers(pdev);
>>> +        if ( ret )
>>> +        {
>>> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>> +            goto out;
>>> +        }
>>
>> I'm likely lost here, but shouldn't this also be done for devices that
>> belong to the hardware domain and are assigned to it in the first
>> branch of this conditional?
>>
>> Or else you will end up with devices assigned to the hardware domain
>> that don't have vPCI setup for them.
> 
> I might be wrong but when the hardware domain is declaring the devices they are added to him.
> Then later when those device are assigned to a guest, they are removed from the hardware domain.

 From my understanding, when the device is initially registered we would 
go through the first branch because pdev->domain is not yet set.

The else would be taken only with subsequent call of 
PHYSDEVOP_manage_pci_add & co.

For the device assignment, a different path would be taken. This would 
go through the domctl XEN_DOMCTL_assign_device.

Therefore, I think Roger is right and the call belongs to the first 
branch. Otherwise, we would miss out the vpci handlers in some cases.

Cheers,

-- 
Julien Grall


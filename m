Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA622C08B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 10:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jysvT-0000Ts-Ik; Fri, 24 Jul 2020 08:19:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jysvS-0000Tn-Oe
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:19:30 +0000
X-Inumbo-ID: 65961266-cd86-11ea-a385-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65961266-cd86-11ea-a385-12813bfff9fa;
 Fri, 24 Jul 2020 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FD2SS3S2FDkaZ6K3eYR6kq0HNXGyx8F4P+Y2NNCtnSc=; b=12axmA7CygjE1kLIFcRx9baOqV
 sUIlfwcE8BPR/6UH+6ERxEFlyk3G0MNIyA2mXQ9+jzCokrGhhlFEEbwPHd/rGgE8iEmaU7NhNBu4v
 OKHfd+VM6yDbVhXW6s2GRsBHLu6B5Wu6bB6+i33UaRiYAf+5dXzI795glc/lUvL87PZs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysvR-0002BN-DX; Fri, 24 Jul 2020 08:19:29 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jysvR-0004xX-4B; Fri, 24 Jul 2020 08:19:29 +0000
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
 <81cad0cd-731d-e1d5-cacd-d64f2c0781b6@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fb602a20-c7c8-d009-0f8c-d9730a6e4ddc@xen.org>
Date: Fri, 24 Jul 2020 09:19:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81cad0cd-731d-e1d5-cacd-d64f2c0781b6@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "nd@arm.com" <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 24/07/2020 08:14, Oleksandr Andrushchenko wrote:
> 
> On 7/23/20 11:44 PM, Stefano Stabellini wrote:
>> On Thu, 23 Jul 2020, Rahul Singh wrote:
>>> Hardware domain is in charge of doing the PCI enumeration and will
>>> discover the PCI devices and then will communicate to XEN via hyper
>>> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
>>>
>>> Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac
>> Same question about Change-Id
>>
>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>>    xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
>>>    1 file changed, 39 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>>> index e91355fe22..274720f98a 100644
>>> --- a/xen/arch/arm/physdev.c
>>> +++ b/xen/arch/arm/physdev.c
>>> @@ -9,12 +9,48 @@
>>>    #include <xen/errno.h>
>>>    #include <xen/sched.h>
>>>    #include <asm/hypercall.h>
>>> -
>>> +#include <xen/guest_access.h>
>>> +#include <xsm/xsm.h>
>>>    
>>>    int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>    {
>>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
>>> -    return -ENOSYS;
>>> +    int ret = 0;
>>> +
>>> +    switch ( cmd )
>>> +    {
>>> +#ifdef CONFIG_HAS_PCI
> 
> In the cover letter you were saying "we are not enabling the HAS_PCI and HAS_VPCI flags for ARM".
> 
> Is this still valid?
> 
>>> +        case PHYSDEVOP_pci_device_add:
>>> +            {
>>> +                struct physdev_pci_device_add add;
>>> +                struct pci_dev_info pdev_info;
>>> +                nodeid_t node = NUMA_NO_NODE;
>>> +
>>> +                ret = -EFAULT;
>>> +                if ( copy_from_guest(&add, arg, 1) != 0 )
>>> +                    break;
>>> +
>>> +                pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
>>> +                if ( add.flags & XEN_PCI_DEV_VIRTFN )
>>> +                {
>>> +                    pdev_info.is_virtfn = 1;
>>> +                    pdev_info.physfn.bus = add.physfn.bus;
>>> +                    pdev_info.physfn.devfn = add.physfn.devfn;
>>> +                }
>>> +                else
>>> +                    pdev_info.is_virtfn = 0;
>>> +
>>> +                ret = pci_add_device(add.seg, add.bus, add.devfn,
>>> +                                &pdev_info, node);
>>> +
>>> +                break;
>>> +            }
>>> +#endif
>>> +        default:
>>> +            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
>>> +            ret = -ENOSYS;
>>> +    }
>> I think we should make the implementation common between arm and x86 by
>> creating xen/common/physdev.c:do_physdev_op as a shared entry point for
>> PHYSDEVOP hypercalls implementations. See for instance:
>>
>> xen/common/sysctl.c:do_sysctl
>>
>> and
>>
>> xen/arch/arm/sysctl.c:arch_do_sysctl
>> xen/arch/x86/sysctl.c:arch_do_sysctl
>>
>>
>> Jan, Andrew, Roger, any opinions?
>>
>>
> I think we can also have a look at [1] by Julien. That implementation,
> 
> IMO, had some thoughts on making Arm/x86 code common where possible

There are some ideas on how I would like to see the split, although they 
need some cleanup. :)

In particular, I was expecting some preparatory work to get the existing 
PCI code non-x86 specific.

Regarding the hypercall Stefano mentionned, I think it should be 
possible to make it common if we abstract the NUMA node lookup part.

Cheers,

> 
> 
> [1] https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/dev-pci
> 

-- 
Julien Grall


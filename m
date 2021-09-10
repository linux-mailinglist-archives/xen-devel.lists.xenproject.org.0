Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F22406CC6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184375.332989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgQ7-0003EP-OU; Fri, 10 Sep 2021 13:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184375.332989; Fri, 10 Sep 2021 13:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgQ7-0003CG-LI; Fri, 10 Sep 2021 13:18:19 +0000
Received: by outflank-mailman (input) for mailman id 184375;
 Fri, 10 Sep 2021 13:18:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOgQ5-0003CA-TX
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:18:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOgQ3-0007QG-TB; Fri, 10 Sep 2021 13:18:15 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOgQ3-0003ue-Mj; Fri, 10 Sep 2021 13:18:15 +0000
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
	bh=ReZTkjPctmI/lwgTipBy5OFGmkW2i3Wiy8e3pxjxuBw=; b=kZXiRJ/XZK6EJDUWZi2VYzT95P
	mhwsFhxYAbWDPUTypgo7oMvY3D2biIiw19oqw8i7zSz574pXJiKEBtTEoAoc5CwWD20/zAGBGPJVY
	PpSvkydROmGbtZeA5F1M7IWVex28lUjvKhvy2pnm2iymlNYI6FZNjZ3ZvLfmM1fQ4XpU=;
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
Date: Fri, 10 Sep 2021 14:18:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/09/2021 13:37, Oleksandr Andrushchenko wrote:
> Hi, Julien!

Hi Oleksandr,

> On 09.09.21 20:58, Julien Grall wrote:
>> On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Host bridge controller's ECAM space is mapped into Domain-0's p2m,
>>> thus it is not possible to trap the same for vPCI via MMIO handlers.
>>> For this to work we need to not map those while constructing the domain.
>>>
>>> Note, that during Domain-0 creation there is no pci_dev yet allocated for
>>> host bridges, thus we cannot match PCI host and its associated
>>> bridge by SBDF. Use dt_device_node field for checks instead.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>>    xen/arch/arm/domain_build.c        |  3 +++
>>>    xen/arch/arm/pci/ecam.c            | 17 +++++++++++++++++
>>>    xen/arch/arm/pci/pci-host-common.c | 22 ++++++++++++++++++++++
>>>    xen/include/asm-arm/pci.h          | 12 ++++++++++++
>>>    4 files changed, 54 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index da427f399711..76f5b513280c 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1257,6 +1257,9 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>>>            }
>>>        }
>>>    +    if ( need_mapping && (device_get_class(dev) == DEVICE_PCI) ) > +        need_mapping = pci_host_bridge_need_p2m_mapping(d, dev,
>> addr, len);
>>
>> AFAICT, with device_get_class(dev), you know whether the hostbridge is used by Xen. Therefore, I would expect that we don't want to map all the regions of the hostbridges in dom0 (including the BARs).
>>
>> Can you clarify it?
> We only want to trap ECAM, not MMIOs and any other memory regions as the bridge is
> 
> initialized and used by Domain-0 completely. 

What do you mean by "used by Domain-0 completely"? The hostbridge is 
owned by Xen so I don't think we can let dom0 access any MMIO regions by
default.

In particular, we may want to hide a device from dom0 for security 
reasons. This is not going to be possible if you map by default 
everything to dom0.

Instead, the BARs should be mapped on demand when dom0 when we trap 
access to the configuration space.

For other regions, could you provide an example of what you are 
referring too?

>>> +
>>> +    /*
>>> +     * We do not want ECAM address space to be mapped in domain's p2m,
>>> +     * so we can trap access to it.
>>> +     */
>>> +    return cfg->phys_addr != addr;
>>> +}
>>> +
>>>    /* ECAM ops */
>>>    const struct pci_ecam_ops pci_generic_ecam_ops = {
>>>        .bus_shift  = 20,
>>> @@ -60,6 +76,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>>>            .read                   = pci_generic_config_read,
>>>            .write                  = pci_generic_config_write,
>>>            .register_mmio_handler  = pci_ecam_register_mmio_handler,
>>> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
>>>        }
>>>    };
>>>    diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
>>> index a89112bfbb7c..c04be636452d 100644
>>> --- a/xen/arch/arm/pci/pci-host-common.c
>>> +++ b/xen/arch/arm/pci/pci-host-common.c
>>> @@ -334,6 +334,28 @@ int pci_host_iterate_bridges(struct domain *d,
>>>        }
>>>        return 0;
>>>    }
>>> +
>>> +bool pci_host_bridge_need_p2m_mapping(struct domain *d,
>>> +                                      const struct dt_device_node *node,
>>> +                                      uint64_t addr, uint64_t len)
>>> +{
>>> +    struct pci_host_bridge *bridge;
>>> +
>>> +    list_for_each_entry( bridge, &pci_host_bridges, node )
>>> +    {
>>> +        if ( bridge->dt_node != node )
>>> +            continue;
>>> +
>>> +        if ( !bridge->ops->need_p2m_mapping )
>>> +            return true;
>>> +
>>> +        return bridge->ops->need_p2m_mapping(d, bridge, addr, len);
>>> +    }
>>> +    printk(XENLOG_ERR "Unable to find PCI bridge for %s segment %d, addr %lx\n",
>>> +           node->full_name, bridge->segment, addr);
>>> +    return true;
>>> +}
>>
>> If you really need to map the hostbridges, then I would suggest to defer the P2M mappings for all of them and then walk all the bridge in one go to do the mappings.
>>
>> This would avoid going through the bridges every time during setup.
> 
> Well, this can be done, but: my implementation prevents mappings and what
> 
> you suggest will require unmapping. So, the cost in my solution is we need
> 
> to go over all the bridges (until we find the one we need) and in what you
> 
> suggest we'll need to unmap what we have just mapped.
> 
> I think preventing unneeded mappings is cheaper than unmapping afterwards.

I think you misundertood what I am suggesting. What I said is you could 
defer the mappings (IOW not do the mapping) until later for the 
hostbridges. And then you can walk all the hostbridges to decide how to 
map them.

The regions will only mapped once and never be unmapped.

Cheers,

-- 
Julien Grall


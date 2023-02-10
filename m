Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E96925F0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 20:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493605.763608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYdC-0000Dt-HC; Fri, 10 Feb 2023 19:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493605.763608; Fri, 10 Feb 2023 19:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYdC-0000AS-Cs; Fri, 10 Feb 2023 19:00:22 +0000
Received: by outflank-mailman (input) for mailman id 493605;
 Fri, 10 Feb 2023 19:00:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQYdA-0000AJ-UJ
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 19:00:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYdA-00076j-Io; Fri, 10 Feb 2023 19:00:20 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYdA-0000XJ-8t; Fri, 10 Feb 2023 19:00:20 +0000
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
	bh=EY9fHXcQZYvbrmgDb4sBFvGy/e2Hl5KlxymnmKUHS8k=; b=RnTRmOtwsGnjMOnlkn30Bsm0xV
	ihBwJEzMrYL138hI2em2Qy7E8C9/pQCaJ1N4gukFoahry/gbnqIUwPdqfuG8dYdSivgyFt1edd0so
	wgJuSsTauIX6MN6oygOyzar81N8ggFg+S4+6dmvKje5zHazFmr0DChYovmhSdDykB9mM=;
Message-ID: <8cc8c4a2-dc6b-6302-5ce6-7bdbb21772dc@xen.org>
Date: Fri, 10 Feb 2023 19:00:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN][RFC PATCH v4 01/16] xen/arm/device: Remove __init from
 function type
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-2-vikram.garhwal@amd.com>
 <1be7ea27-aec5-e2ae-48c1-fe0c1f099181@amd.com>
 <7a1d10b9-083c-a8f5-0315-c9f77ad04239@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7a1d10b9-083c-a8f5-0315-c9f77ad04239@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/02/2023 20:11, Vikram Garhwal wrote:
> Hi Michal,
> 
> Thanks for reviewing this. Please see my comments below.
> 
> On 1/20/23 4:39 AM, Michal Orzel wrote:
>> Hi Vikram,
>>
>> On 07/12/2022 07:15, Vikram Garhwal wrote:
>>>
>>> Change function type of following function to access during runtime:
>>>      1. map_irq_to_domain()
>>>      2. handle_device_interrupt()
>>>      3. map_range_to_domain()
>>>      4. unflatten_dt_node()
>>>      5. unflatten_device_tree()
>> If you do not want to do this at first use, then this should be a 
>> separate patch.
>>> Move map_irq_to_domain(), handle_device_interrupt() and 
>>> map_range_to_domain() to
>>> device.c.
>> This should be a separate patch (without removing __init) to make the 
>> comparison easier.
> Okay
>>
>>> unflatten_device_tree(): Add handling of memory allocation failure.
>> Apart from that you also renamed __unflatten_device_tree to 
>> unflatten_device_tree
>> and you did not mention it.
> I will add this in commit.
>>
>>> These changes are done to support the dynamic programming of a nodes 
>>> where an
>>> overlay node will be added to fdt and unflattened node will be added 
>>> to dt_host.
>>> Furthermore, IRQ and mmio mapping will be done for the added node.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> ---
>>>   xen/arch/arm/device.c            | 145 +++++++++++++++++++++++++++++++
>>>   xen/arch/arm/domain_build.c      | 142 ------------------------------
>>>   xen/arch/arm/include/asm/setup.h |   3 +
>>>   xen/common/device_tree.c         |  27 +++---
>>>   xen/include/xen/device_tree.h    |   5 ++
>>>   5 files changed, 170 insertions(+), 152 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>>> index 70cd6c1a19..d299c04e62 100644
>>> --- a/xen/arch/arm/device.c
>>> +++ b/xen/arch/arm/device.c
>>> @@ -21,6 +21,9 @@
>>>   #include <xen/errno.h>
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>> +#include <xen/iocap.h>
>>> +#include <asm/domain_build.h>
>>> +#include <asm/setup.h>
>>>
>>>   extern const struct device_desc _sdevice[], _edevice[];
>>>   extern const struct acpi_device_desc _asdevice[], _aedevice[];
>>> @@ -84,6 +87,148 @@ enum device_class device_get_class(const struct 
>>> dt_device_node *dev)
>>>       return DEVICE_UNKNOWN;
>>>   }
>>>
>>> +int map_irq_to_domain(struct domain *d, unsigned int irq,
>>> +                      bool need_mapping, const char *devname)
>>> +{
>>> +    int res;
>>> +
>>> +    res = irq_permit_access(d, irq);
>>> +    if ( res )
>>> +    {
>>> +        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ 
>>> %u\n",
>>> +               d->domain_id, irq);
>>> +        return res;
>>> +    }
>>> +
>>> +    if ( need_mapping )
>>> +    {
>>> +        /*
>>> +         * Checking the return of vgic_reserve_virq is not
>>> +         * necessary. It should not fail except when we try to map
>>> +         * the IRQ twice. This can legitimately happen if the IRQ is 
>>> shared
>>> +         */
>>> +        vgic_reserve_virq(d, irq);
>>> +
>>> +        res = route_irq_to_guest(d, irq, irq, devname);
>>> +        if ( res < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
>>> +                   irq, d->domain_id);
>>> +            return res;
>>> +        }
>>> +    }
>>> +
>>> +    dt_dprintk("  - IRQ: %u\n", irq);
>>> +    return 0;
>>> +}
>>> +
>>> +int map_range_to_domain(const struct dt_device_node *dev,
>>> +                        u64 addr, u64 len, void *data)
>>> +{
>>> +    struct map_range_data *mr_data = data;
>>> +    struct domain *d = mr_data->d;
>>> +    int res;
>>> +
>>> +    /*
>>> +     * reserved-memory regions are RAM carved out for a special 
>>> purpose.
>>> +     * They are not MMIO and therefore a domain should not be able to
>>> +     * manage them via the IOMEM interface.
>>> +     */
>>> +    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
>>> +                     strlen("/reserved-memory/")) != 0 )
>>> +    {
>>> +        res = iomem_permit_access(d, paddr_to_pfn(addr),
>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>>> +        if ( res )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>>> +                   d->domain_id,
>>> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
>>> +            return res;
>>> +        }
>>> +    }
>>> +
>>> +    if ( !mr_data->skip_mapping )
>>> +    {
>>> +        res = map_regions_p2mt(d,
>>> +                               gaddr_to_gfn(addr),
>>> +                               PFN_UP(len),
>>> +                               maddr_to_mfn(addr),
>>> +                               mr_data->p2mt);
>>> +
>>> +        if ( res < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
>>> +                   " - 0x%"PRIx64" in domain %d\n",
>>> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
>>> +                   d->domain_id);
>>> +            return res;
>>> +        }
>>> +    }
>>> +
>>> +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>>> +               addr, addr + len, mr_data->p2mt);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * handle_device_interrupts retrieves the interrupts configuration from
>>> + * a device tree node and maps those interrupts to the target domain.
>>> + *
>>> + * Returns:
>>> + *   < 0 error
>>> + *   0   success
>>> + */
>>> +int handle_device_interrupts(struct domain *d,
>>> +                             struct dt_device_node *dev,
>>> +                             bool need_mapping)
>>> +{
>>> +    unsigned int i, nirq;
>>> +    int res;
>>> +    struct dt_raw_irq rirq;
>>> +
>>> +    nirq = dt_number_of_irq(dev);
>>> +
>>> +    /* Give permission and map IRQs */
>>> +    for ( i = 0; i < nirq; i++ )
>>> +    {
>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>> +        if ( res )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>> +                   i, dt_node_full_name(dev));
>>> +            return res;
>>> +        }
>>> +
>>> +        /*
>>> +         * Don't map IRQ that have no physical meaning
>>> +         * ie: IRQ whose controller is not the GIC
>>> +         */
>>> +        if ( rirq.controller != dt_interrupt_controller )
>>> +        {
>>> +            dt_dprintk("irq %u not connected to primary controller. 
>>> Connected to %s\n",
>>> +                       i, dt_node_full_name(rirq.controller));
>>> +            continue;
>>> +        }
>>> +
>>> +        res = platform_get_irq(dev, i);
>>> +        if ( res < 0 )
>>> +        {
>>> +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
>>> +                   i, dt_node_full_name(dev));
>>> +            return res;
>>> +        }
>>> +
>>> +        res = map_irq_to_domain(d, res, need_mapping, 
>>> dt_node_name(dev));
>>> +        if ( res )
>>> +            return res;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Local variables:
>>>    * mode: C
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 4fb5c20b13..acde8e714e 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2229,41 +2229,6 @@ int __init make_chosen_node(const struct 
>>> kernel_info *kinfo)
>>>       return res;
>>>   }
>>>
>>> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>>> -                             bool need_mapping, const char *devname)
>>> -{
>>> -    int res;
>>> -
>>> -    res = irq_permit_access(d, irq);
>>> -    if ( res )
>>> -    {
>>> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ 
>>> %u\n",
>>> -               d->domain_id, irq);
>>> -        return res;
>>> -    }
>>> -
>>> -    if ( need_mapping )
>>> -    {
>>> -        /*
>>> -         * Checking the return of vgic_reserve_virq is not
>>> -         * necessary. It should not fail except when we try to map
>>> -         * the IRQ twice. This can legitimately happen if the IRQ is 
>>> shared
>>> -         */
>>> -        vgic_reserve_virq(d, irq);
>>> -
>>> -        res = route_irq_to_guest(d, irq, irq, devname);
>>> -        if ( res < 0 )
>>> -        {
>>> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
>>> -                   irq, d->domain_id);
>>> -            return res;
>>> -        }
>>> -    }
>>> -
>>> -    dt_dprintk("  - IRQ: %u\n", irq);
>>> -    return 0;
>>> -}
>> If you move map_irq_to_domain from domain_build.c to device.c, then 
>> the prototype needs to also
>> be moved from domain_build.h to setup.h
>>
>>> -
>>>   static int __init map_dt_irq_to_domain(const struct dt_device_node 
>>> *dev,
>>>                                          const struct dt_irq *dt_irq,
>>>                                          void *data)
>>> @@ -2295,57 +2260,6 @@ static int __init map_dt_irq_to_domain(const 
>>> struct dt_device_node *dev,
>>>       return 0;
>>>   }
>>>
>>> -int __init map_range_to_domain(const struct dt_device_node *dev,
>>> -                               u64 addr, u64 len, void *data)
>>> -{
>>> -    struct map_range_data *mr_data = data;
>>> -    struct domain *d = mr_data->d;
>>> -    int res;
>>> -
>>> -    /*
>>> -     * reserved-memory regions are RAM carved out for a special 
>>> purpose.
>>> -     * They are not MMIO and therefore a domain should not be able to
>>> -     * manage them via the IOMEM interface.
>>> -     */
>>> -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
>>> -                     strlen("/reserved-memory/")) != 0 )
>>> -    {
>>> -        res = iomem_permit_access(d, paddr_to_pfn(addr),
>>> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>> -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
>>> -                    d->domain_id,
>>> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
>>> -            return res;
>>> -        }
>>> -    }
>>> -
>>> -    if ( !mr_data->skip_mapping )
>>> -    {
>>> -        res = map_regions_p2mt(d,
>>> -                               gaddr_to_gfn(addr),
>>> -                               PFN_UP(len),
>>> -                               maddr_to_mfn(addr),
>>> -                               mr_data->p2mt);
>>> -
>>> -        if ( res < 0 )
>>> -        {
>>> -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
>>> -                   " - 0x%"PRIx64" in domain %d\n",
>>> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
>>> -                   d->domain_id);
>>> -            return res;
>>> -        }
>>> -    }
>>> -
>>> -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>>> -               addr, addr + len, mr_data->p2mt);
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>   /*
>>>    * For a node which describes a discoverable bus (such as a PCI bus)
>>>    * then we may need to perform additional mappings in order to make
>>> @@ -2373,62 +2287,6 @@ static int __init map_device_children(const 
>>> struct dt_device_node *dev,
>>>       return 0;
>>>   }
>>>
>>> -/*
>>> - * handle_device_interrupts retrieves the interrupts configuration from
>>> - * a device tree node and maps those interrupts to the target domain.
>>> - *
>>> - * Returns:
>>> - *   < 0 error
>>> - *   0   success
>>> - */
>>> -static int __init handle_device_interrupts(struct domain *d,
>>> -                                           struct dt_device_node *dev,
>>> -                                           bool need_mapping)
>>> -{
>>> -    unsigned int i, nirq;
>>> -    int res;
>>> -    struct dt_raw_irq rirq;
>>> -
>>> -    nirq = dt_number_of_irq(dev);
>>> -
>>> -    /* Give permission and map IRQs */
>>> -    for ( i = 0; i < nirq; i++ )
>>> -    {
>>> -        res = dt_device_get_raw_irq(dev, i, &rirq);
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>> -                   i, dt_node_full_name(dev));
>>> -            return res;
>>> -        }
>>> -
>>> -        /*
>>> -         * Don't map IRQ that have no physical meaning
>>> -         * ie: IRQ whose controller is not the GIC
>>> -         */
>>> -        if ( rirq.controller != dt_interrupt_controller )
>>> -        {
>>> -            dt_dprintk("irq %u not connected to primary controller. 
>>> Connected to %s\n",
>>> -                      i, dt_node_full_name(rirq.controller));
>>> -            continue;
>>> -        }
>>> -
>>> -        res = platform_get_irq(dev, i);
>>> -        if ( res < 0 )
>>> -        {
>>> -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
>>> -                   i, dt_node_full_name(dev));
>>> -            return res;
>>> -        }
>>> -
>>> -        res = map_irq_to_domain(d, res, need_mapping, 
>>> dt_node_name(dev));
>>> -        if ( res )
>>> -            return res;
>>> -    }
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>   /*
>>>    * For a given device node:
>>>    *  - Give permission to the guest to manage IRQ and MMIO range
>>> diff --git a/xen/arch/arm/include/asm/setup.h 
>>> b/xen/arch/arm/include/asm/setup.h
>>> index fdbf68aadc..ec050848aa 100644
>>> --- a/xen/arch/arm/include/asm/setup.h
>>> +++ b/xen/arch/arm/include/asm/setup.h
>>> @@ -163,6 +163,9 @@ void device_tree_get_reg(const __be32 **cell, u32 
>>> address_cells,
>>>   u32 device_tree_get_u32(const void *fdt, int node,
>>>                           const char *prop_name, u32 dflt);
>>>
>>> +int handle_device_interrupts(struct domain *d, struct dt_device_node 
>>> *dev,
>>> +                             bool need_mapping);
>>> +
>>>   int map_range_to_domain(const struct dt_device_node *dev,
>>>                           u64 addr, u64 len, void *data);
>>>
>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>> index 6c9712ab7b..6518eff9b0 100644
>>> --- a/xen/common/device_tree.c
>>> +++ b/xen/common/device_tree.c
>>> @@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct 
>>> dt_device_node *np,
>>>    * @allnextpp: pointer to ->allnext from last allocated device_node
>>>    * @fpsize: Size of the node path up at the current depth.
>>>    */
>>> -static unsigned long __init unflatten_dt_node(const void *fdt,
>>> -                                              unsigned long mem,
>>> -                                              unsigned long *p,
>>> -                                              struct dt_device_node 
>>> *dad,
>>> -                                              struct dt_device_node 
>>> ***allnextpp,
>>> -                                              unsigned long fpsize)
>>> +static unsigned long unflatten_dt_node(const void *fdt,
>>> +                                       unsigned long mem,
>>> +                                       unsigned long *p,
>>> +                                       struct dt_device_node *dad,
>>> +                                       struct dt_device_node 
>>> ***allnextpp,
>>> +                                       unsigned long fpsize)
>>>   {
>>>       struct dt_device_node *np;
>>>       struct dt_property *pp, **prev_pp = NULL;
>>> @@ -2047,7 +2047,7 @@ static unsigned long __init 
>>> unflatten_dt_node(const void *fdt,
>>>   }
>>>
>>>   /**
>>> - * __unflatten_device_tree - create tree of device_nodes from flat blob
>>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>>    *
>>>    * unflattens a device-tree, creating the
>>>    * tree of struct device_node. It also fills the "name" and "type"
>>> @@ -2056,8 +2056,7 @@ static unsigned long __init 
>>> unflatten_dt_node(const void *fdt,
>>>    * @fdt: The fdt to expand
>>>    * @mynodes: The device_node tree created by the call
>>>    */
>>> -static void __init __unflatten_device_tree(const void *fdt,
>>> -                                           struct dt_device_node 
>>> **mynodes)
>>> +int unflatten_device_tree(const void *fdt, struct dt_device_node 
>>> **mynodes)
>>>   {
>>>       unsigned long start, mem, size;
>>>       struct dt_device_node **allnextp = mynodes;
>>> @@ -2079,6 +2078,12 @@ static void __init 
>>> __unflatten_device_tree(const void *fdt,
>>>       /* Allocate memory for the expanded device tree */
>>>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct 
>>> dt_device_node));
>>>
>>> +    if ( mem == 0 )
>> NIT: !mem would be preffered.
>>
>>> +    {
>>> +        printk(XENLOG_ERR "Cannot allocate memory for unflatten 
>>> device tree\n");
>>> +        return -ENOMEM;
>> What is the point of modifying the function to return a value if ...
>>> +    }
>>> +
>>>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>>>
>>>       dt_dprintk("  unflattening %lx...\n", mem);
>>> @@ -2095,6 +2100,8 @@ static void __init 
>>> __unflatten_device_tree(const void *fdt,
>>>       *allnextp = NULL;
>>>
>>>       dt_dprintk(" <- unflatten_device_tree()\n");
>>> +
>>> +    return 0;
>>>   }
>>>
>>>   static void dt_alias_add(struct dt_alias_prop *ap,
>>> @@ -2179,7 +2186,7 @@ dt_find_interrupt_controller(const struct 
>>> dt_device_match *matches)
>>>
>>>   void __init dt_unflatten_host_device_tree(void)
>>>   {
>>> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
>>> +    unflatten_device_tree(device_tree_flattened, &dt_host);
>> ... you do not check it anyway?
> So, here we kept it same but unflatten_device_tree() return is checked 
> in dt_overlay.c. Return of this function will be useful in dt_overlay as 
> we can run out of mem during runtime. Perhaps I will add another comment 
> about the reasoning for adding this.

It is a good practice to check the error return. In this case, I would 
call panic() when there is an error.

With that said, the hardening of __unflatten_device_tree() deserve its 
own patch.

Cheers,

-- 
Julien Grall


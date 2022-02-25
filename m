Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D24C4F1B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 20:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279573.477316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgXY-0003tO-89; Fri, 25 Feb 2022 19:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279573.477316; Fri, 25 Feb 2022 19:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNgXY-0003qs-4x; Fri, 25 Feb 2022 19:46:08 +0000
Received: by outflank-mailman (input) for mailman id 279573;
 Fri, 25 Feb 2022 19:46:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNgXW-0003qm-Nb
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 19:46:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgXW-0000yZ-DD; Fri, 25 Feb 2022 19:46:06 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNgXW-0005BY-71; Fri, 25 Feb 2022 19:46:06 +0000
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
	bh=0rbHA/d4QWgKXz6b7JpM1lpw/W7gSC4xYbg31Hk0nSY=; b=zIVjR8tA6OA6SGm3MzNgqLpCJ0
	6JK0V48siXgTMNLAORr8kh17mzpZQ7okl8iLhVt8xglt0KPkQQfWfbambczbw5Dfj0nQXmOjs9yxM
	2HOb9yDnddTo+tz8bLfFOQuP+bAFe4ucDQ+Or0aSUZ1fUpzdyiSVG0ShDEDczzI5o5o4=;
Message-ID: <dbe2395b-c533-c7f1-bec1-70f4399b430a@xen.org>
Date: Fri, 25 Feb 2022 19:46:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] xen/arm: vpci: remove PCI I/O ranges property value
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <8ea25f00c8641bfd95a4d8444b82ca2ac3ee5ce0.1644939115.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8ea25f00c8641bfd95a4d8444b82ca2ac3ee5ce0.1644939115.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 15/02/2022 15:36, Rahul Singh wrote:
> PCI I/O space are not mapped to dom0 when PCI passthrough is enabled,
> also there is no vpci trap handler register for IO bar.
> 
> Remove PCI I/O ranges property value from dom0 device tree node so that
> dom0 linux will not allocate I/O space for PCI devices if
> pci-passthrough is enabled.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/domain_build.c   | 29 +++++++++++++++
>   xen/common/device_tree.c      | 69 +++++++++++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h | 10 +++++
>   3 files changed, 108 insertions(+)

For future version, please add a changelog. This helps to figure out 
what changed more easily.

> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..7cfe64fe97 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -648,6 +648,31 @@ static void __init allocate_static_memory(struct domain *d,
>   }
>   #endif
>   
> +/*
> + * PCI IO bar are not mapped to dom0 when PCI passthrough is enabled, also
> + * there is no trap handler registered for IO bar, therefore remove the IO
> + * range property from the device tree node for dom0.
> + */
> +static int handle_linux_pci_io_ranges(struct kernel_info *kinfo,
> +                                      const struct dt_device_node *node)
> +{
> +    if ( !is_pci_passthrough_enabled() )
> +        return 0;
> +
> +    if ( !dt_device_type_is_equal(node, "pci") )
> +        return 0;
> +
> +    /*
> +     * The current heuristic assumes that a device is a host bridge
> +     * if the type is "pci" and then parent type is not "pci".
> +     */
> +    if ( node->parent && dt_device_type_is_equal(node->parent, "pci") )
> +        return 0;


The logic above is exactly the same as in handle_linux_pci_domain(). Can 
we create an helper that could be used by both functions? This would 
help to keep the logic synchronized.

> +
> +    return dt_pci_remove_io_ranges(kinfo->fdt, node);
> +}
> +
> +
>   /*
>    * When PCI passthrough is available we want to keep the
>    * "linux,pci-domain" in sync for every host bridge.
> @@ -723,6 +748,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>       if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
>           iommu_node = NULL;
>   
> +    res = handle_linux_pci_io_ranges(kinfo, node);
> +    if ( res )
> +        return res;
> +
>       dt_for_each_property_node (node, prop)
>       {
>           const void *prop_data = prop->value;
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..55a883e0f6 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c

If I am not mistaken, the file common/device_tree.c is so far only 
containing code to parse the host device-tree. But now...

> @@ -2195,6 +2195,75 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
>       return (u16)domain;
>   }
>   
> +int dt_pci_remove_io_ranges(void *fdt, const struct dt_device_node *dev)

you are introducing code to write the domain device-tree. I understand 
this is because dt_match_bus() is internal. However, I would rather 
prefer if we export dt_match_bus() & co and move this code to under 
arch/arm/pci/. Maybe we should introduce a file domain_build.c.

Furthermore, the name of the function doesn't really match what the 
function does. It will generate "ranges" for the hostbridge and remove 
the I/O. We may want to perform other modifications on the range. So I 
would name the function something like:

domain_build_generate_hostbridge_range()

> +    const struct dt_device_node *parent = NULL;
> +    const struct dt_bus *bus, *pbus;
> +    unsigned int rlen;
> +    int na, ns, pna, pns, rone;
> +    const __be32 *ranges;
> +    __be32 regs[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1)

GUEST_ROOT_*_CELLS are only valid for domU. In theory, there are no 
guarantee this will be bigger that what the host device-tree supports.

So you want to use DT_MAX_ADDR_CELLS here.

> +               * 2];
Looking at the code below. I couldn't find any check guaranteing the 
static array will be big enough to store the ranges provided by the host DT.

> +    __be32 *addr = &regs[0];
> +
> +    bus = dt_match_bus(dev);
> +    if ( !bus )
> +        return 0; /* device is not a bus */
> +
> +    parent = dt_get_parent(dev);
> +    if ( !parent )
> +        return -EINVAL;
> +
> +    ranges = dt_get_property(dev, "ranges", &rlen);
> +    if ( !ranges )
> +    {
> +        printk(XENLOG_ERR "DT: no ranges; cannot enumerate %s\n",
> +               dev->full_name);
> +        return -EINVAL;
> +    }
> +    if ( !rlen ) /* Nothing to do */
> +        return 0;
> +
> +    bus->count_cells(dev, &na, &ns);
> +    if ( !DT_CHECK_COUNTS(na, ns) )
> +    {
> +        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
> +               dev->full_name);
> +        return -EINVAL;
> +    }
> +
> +    pbus = dt_match_bus(parent);
> +    if ( !pbus )
> +    {
> +        printk(XENLOG_ERR "DT: %s is not a valid bus\n", parent->full_name);
> +        return -EINVAL;
> +    }
> +
> +    pbus->count_cells(dev, &pna, &pns);
> +    if ( !DT_CHECK_COUNTS(pna, pns) )
> +    {
> +        printk(XENLOG_ERR "dt_parse: Bad cell count for parent %s\n",
> +               dev->full_name);
> +        return -EINVAL;
> +    }
> +
> +    /* Now walk through the ranges */
> +    rlen /= 4;
> +    rone = na + pna + ns;
> +    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
> +    {

Most of the code in this function is the same as dt_for_each_range(). 
Can we refactor it to avoid code duplication?

> +        unsigned int flags = bus->get_flags(ranges);
> +        if ( flags & IORESOURCE_IO )
> +            continue;
> +
> +        memcpy(addr, ranges, 4 * rone);
> +
> +        addr += rone;
> +    }
> +
> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index fd6cd00b43..580231f872 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -849,6 +849,16 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>    */
>   int dt_get_pci_domain_nr(struct dt_device_node *node);
>   
> +/**
> + * dt_pci_remove_io_range - Remove the PCI I/O range property value.
> + * @fdt: Pointer to the file descriptor tree.
> + * @node: Device tree node.
> + *
> + * This function will remove the PCI IO range property from the PCI device tree
> + * node.
> + */
> +int dt_pci_remove_io_ranges(void *fdt, const struct dt_device_node *node);
> +
>   struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>   
>   #ifdef CONFIG_DEVICE_TREE_DEBUG

Cheers,

-- 
Julien Grall


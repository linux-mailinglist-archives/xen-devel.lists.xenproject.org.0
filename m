Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DB4789E5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 12:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248560.428730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBQ0-0004zR-1w; Fri, 17 Dec 2021 11:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248560.428730; Fri, 17 Dec 2021 11:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBPz-0004x0-V6; Fri, 17 Dec 2021 11:28:55 +0000
Received: by outflank-mailman (input) for mailman id 248560;
 Fri, 17 Dec 2021 11:28:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myBPz-0004wu-BV
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 11:28:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myBPz-0001b7-2f; Fri, 17 Dec 2021 11:28:55 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myBPy-0002wM-Rx; Fri, 17 Dec 2021 11:28:55 +0000
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
	bh=em4RYBL4Lxqd+uULuXokpAIN3CGatXGSAgyNydl6u/E=; b=D6X7VDVIwPTVX0FnX4ATI60++J
	VYzE5PvNIrIBX9FKX2XMyI/ZmVfxWdBZT1biAmb+p/IMfXQ6LUZCLnpuNiE57mivJckNA5vxtz+v1
	gyGmhl3RAVVzvOn6+cVV23+48InG+4snElWiC8AB5kQWQu0GUqeJw6R64yyQ3aSX0VnE=;
Message-ID: <417bacad-0600-f566-3110-faca8f18b3ea@xen.org>
Date: Fri, 17 Dec 2021 11:28:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

I have a few comments on top of what Stefano already wrote.

On 14/12/2021 10:45, Rahul Singh wrote:
> IO ports on ARM don't exist so all IO ports related hypercalls are going
> to fail on ARM when we passthrough a PCI device.

Well. Arm doesn't have specific instructions to access I/O port. But 
they still exists because they are mapped in the memory address space.

It is quite likely we would need the xc_domain_ioport_permission() & co 
to work on Arm once we decide to expose the I/O region to the guest.

> Failure of xc_domain_ioport_permission(..) would turn into a critical
> failure at domain creation. We need to avoid this outcome, instead we
> want to continue with domain creation as normal even if
> xc_domain_ioport_permission(..) fails. XEN_DOMCTL_ioport_permission
> is not implemented on ARM so it would return -ENOSYS.
> 
> To solve above issue remove PCI I/O ranges property value from dom0
> device tree node so that dom0 linux will not allocate I/O space for PCI
> devices if pci-passthrough is enabled.
> 
> Another valid reason to remove I/O ranges is that PCI I/O space are not
> mapped to dom0 when PCI passthrough is enabled, also there is no vpci
> trap handler register for IO bar.

TBH, this should be the main reason of this change. We should not expose 
the PCI I/O space because the vPCI is not supporting it.

The rest is just an implementation details to avoid major refactoring 
that may need some revert in the future.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/domain_build.c   | 14 +++++++
>   xen/common/device_tree.c      | 72 +++++++++++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h | 10 +++++
>   3 files changed, 96 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d02bacbcd1..60f6b2c73b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -749,6 +749,11 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                   continue;
>           }
>   
> +        if ( is_pci_passthrough_enabled() &&
> +                dt_device_type_is_equal(node, "pci") )

This check is not going to change for a given node. So I think this 
wants to be moved outside of the loop to avoid expensive check.

In addition to that, this may also cover PCI devices. I think we want to 
use the same heuristic as in handle_linux_pci_domain(). So I would move 
the logic in a separate helper.

> +            if ( dt_property_name_is_equal(prop, "ranges") )
> +                continue;
> +
>           res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
>   
>           if ( res )
> @@ -769,6 +774,15 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>               if ( res )
>                   return res;
>           }
> +
> +        /*
> +         * PCI IO bar are not mapped to dom0 when PCI passthrough is enabled,
> +         * also there is no trap handler registered for IO bar therefor remove

Typo: s/therefor/therefore/

> +         * the IO range property from the device tree node for dom0.
> +         */
> +        res = dt_pci_remove_io_ranges(kinfo->fdt, node);

This is called unconditionally. Couldn't this potentially misinterpret 
some node?

> +        if ( res )
> +            return res;
>       }
>   
>       /*
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..9fa25f6723 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2195,6 +2195,78 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
>       return (u16)domain;
>   }
>   
> +int dt_pci_remove_io_ranges(void *fdt, const struct dt_device_node *dev)
> +{
> +    const struct dt_device_node *parent = NULL;
> +    const struct dt_bus *bus, *pbus;
> +    unsigned int rlen;
> +    int na, ns, pna, pns, rone, ret;
> +    const __be32 *ranges;
> +    __be32 regs[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1)
> +               * 2];
> +    __be32 *addr = &regs[0];
> +
> +    bus = dt_match_bus(dev);
> +    if ( !bus )

NIT: I don't particularly care whether we use !bus or bus == 0 but it 
would be nice to stay consistent at least within a function (below you 
use rlen == 0).

> +        return 0; /* device is not a bus */
> +
> +    parent = dt_get_parent(dev);
> +    if ( parent == NULL )
> +        return -EINVAL;
> +
> +    ranges = dt_get_property(dev, "ranges", &rlen);
> +    if ( ranges == NULL )
> +    {
> +        printk(XENLOG_ERR "DT: no ranges; cannot enumerate %s\n",
> +               dev->full_name);
> +        return -EINVAL;
> +    }
> +    if ( rlen == 0 ) /* Nothing to do */
> +        return 0;
> +
> +    bus->count_cells(dev, &na, &ns);
> +    if ( !DT_CHECK_COUNTS(na, ns) )
> +    {
> +        printk(XENLOG_ERR "dt_parse: Bad cell count for device %s\n",
> +                  dev->full_name);
> +        return -EINVAL;
> +    }
> +    pbus = dt_match_bus(parent);
> +    if ( pbus == NULL )
> +    {
> +        printk("DT: %s is not a valid bus\n", parent->full_name);
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
> +    /* Now walk through the ranges */
> +    rlen /= 4;
> +    rone = na + pna + ns;
> +
> +    for ( ; rlen >= rone; rlen -= rone, ranges += rone )
> +    {
> +        unsigned int flags = bus->get_flags(ranges);
> +        if ( flags & IORESOURCE_IO )
> +            continue;
> +
> +        memcpy(addr, ranges, 4 * rone);
> +
> +        addr += rone;
> +    }
> +
> +    ret = fdt_property(fdt, "ranges", regs, sizeof(regs));
> +    if ( ret )
> +        return ret;
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index fd6cd00b43..ad2e905595 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -849,6 +849,16 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>    */
>   int dt_get_pci_domain_nr(struct dt_device_node *node);
>   
> +/**
> + * dt_get_remove_io_range - Remove the PCI I/O range property value.
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


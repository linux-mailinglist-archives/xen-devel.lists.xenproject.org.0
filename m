Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3F476824
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 03:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247691.427105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxgah-0006ls-Vn; Thu, 16 Dec 2021 02:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247691.427105; Thu, 16 Dec 2021 02:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxgah-0006jz-Rh; Thu, 16 Dec 2021 02:33:55 +0000
Received: by outflank-mailman (input) for mailman id 247691;
 Thu, 16 Dec 2021 02:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxgag-0006jt-O8
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 02:33:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b147d60-5e18-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 03:33:52 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9CEC61BA6;
 Thu, 16 Dec 2021 02:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AC7C36AE0;
 Thu, 16 Dec 2021 02:33:49 +0000 (UTC)
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
X-Inumbo-ID: 9b147d60-5e18-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639622030;
	bh=t1dWWSlrI6fTqyle3hnf4XwkyWVvbdivW135Nv5Dkyk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NuN/Nf+8Wa65Kpxo2xkFVWZLZoiHymEmkG0FoRzRHKhbT0hnHY5s3bDCcVu4sHmo1
	 oW+4+lqphoct6XDKiJwsAbomkG5VOKBOJ7J2869OmiDtjWIRHFJM/ouKodBem4okAL
	 CTpTyI3KZ0nwtSOUIjZaz4c3tY1o8vL5hoXJDJ3cdPX+gvxbHMeO8RANhpjdppnzWp
	 STMQ2+7HK5IFzrJdNvaGW2X4w6F2SbRFt2M1Bwy8BVaqA+1cLSkdRBMAG9ONnIO7Zm
	 VyRLz6YR5K2EqEdCiZqzt48ekx6upV6gdewymKaC0WNce3iqONjBNnX+paaF3MVY1f
	 nMopGdHY591ag==
Date: Wed, 15 Dec 2021 18:33:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
In-Reply-To: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2112151817190.3376@ubuntu-linux-20-04-desktop>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Dec 2021, Rahul Singh wrote:
> IO ports on ARM don't exist so all IO ports related hypercalls are going
> to fail on ARM when we passthrough a PCI device.
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
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/domain_build.c   | 14 +++++++
>  xen/common/device_tree.c      | 72 +++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h | 10 +++++
>  3 files changed, 96 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d02bacbcd1..60f6b2c73b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -749,6 +749,11 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                  continue;
>          }
>  
> +        if ( is_pci_passthrough_enabled() &&
> +                dt_device_type_is_equal(node, "pci") )
> +            if ( dt_property_name_is_equal(prop, "ranges") )
> +                continue;

It looks like we are skipping the "ranges" property entirely for the PCI
node, is that right? Wouldn't that also remove the other (not ioports)
address ranges?


>          res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
>  
>          if ( res )
> @@ -769,6 +774,15 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>              if ( res )
>                  return res;
>          }
> +
> +        /*
> +         * PCI IO bar are not mapped to dom0 when PCI passthrough is enabled,
> +         * also there is no trap handler registered for IO bar therefor remove
> +         * the IO range property from the device tree node for dom0.
> +         */
> +        res = dt_pci_remove_io_ranges(kinfo->fdt, node);
> +        if ( res )
> +            return res;

I tried to apply this patch to staging to make it easier to review but I
think this chuck got applied wrongly: I can see
dt_pci_remove_io_ranges() added to the function "handle_prop_pfdt" which
is for guest partial DTBs and not for dom0.

Is dt_pci_remove_io_ranges() meant to be called from write_properties
instead? It looks like it would be best to call it from
write_properties, maybe it could be combined with the other new check
just above in this patch?


>      /*
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..9fa25f6723 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2195,6 +2195,78 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
>      return (u16)domain;
>  }
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
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index fd6cd00b43..ad2e905595 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -849,6 +849,16 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>   */
>  int dt_get_pci_domain_nr(struct dt_device_node *node);
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
>  struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>  
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
> -- 
> 2.25.1
> 


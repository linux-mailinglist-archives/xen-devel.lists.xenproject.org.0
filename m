Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6D407257
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 22:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184773.333510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOmt5-0004cm-Ma; Fri, 10 Sep 2021 20:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184773.333510; Fri, 10 Sep 2021 20:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOmt5-0004aL-IJ; Fri, 10 Sep 2021 20:12:39 +0000
Received: by outflank-mailman (input) for mailman id 184773;
 Fri, 10 Sep 2021 20:12:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOmt4-0004aF-32
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 20:12:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70cd74a2-1273-11ec-b284-12813bfff9fa;
 Fri, 10 Sep 2021 20:12:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDD4360F5D;
 Fri, 10 Sep 2021 20:12:35 +0000 (UTC)
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
X-Inumbo-ID: 70cd74a2-1273-11ec-b284-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631304756;
	bh=tIrimlsj88EoS8APLqnSckCT6jioW5gAK0ZIE3Kgbqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ch0BCizF3TFysMGqZDLCVbgWDvB1JGhNhpBj7z+PtHgcRHXa6cW7t9A6tITq5VL1X
	 YzL0MU2SW1kkpOEoWDuWBcbgE8pEwE+mhdGmJ+s7ro9UGNajiUpmFTp7ide3akkatr
	 eTOdSEDjcjaA15AJP1UXKubnTdk9DhSRqxtNJqLkDSBqCWxJjIJJcMKpeE3F+vcSJI
	 MbhO50A3JkepoTPBriNLZqMKBeugogPAj9NupZQJIjJ4RUMZII9kFKEPCQNn+fDG8u
	 r32dANhKEdaWRo+hHmW45WCGobzY1mUWUfsZGxs+D+5YNQoofOEFm0HUrVnnWbt5QN
	 GqwC+ompL4CTA==
Date: Fri, 10 Sep 2021 13:12:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for hardware
 domain
In-Reply-To: <20210903083347.131786-10-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-10-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order vPCI to work it needs all access to PCI configuration space
> (ECAM) to be synchronized among all entities, e.g. hardware domain and
> guests. For that implement PCI host bridge specific callbacks to
> properly setup those ranges depending on particular host bridge
> implementation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/arch/arm/pci/ecam.c            | 11 +++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 16 ++++++++++++++++
>  xen/arch/arm/vpci.c                | 13 +++++++++++++
>  xen/include/asm-arm/pci.h          |  8 ++++++++
>  4 files changed, 48 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 91c691b41fdf..92ecb2e0762b 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -42,6 +42,16 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>      return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
>  }
>  
> +static int pci_ecam_register_mmio_handler(struct domain *d,
> +                                          struct pci_host_bridge *bridge,
> +                                          const struct mmio_handler_ops *ops)
> +{
> +    struct pci_config_window *cfg = bridge->sysdata;
> +
> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
> +    return 0;
> +}

Given that struct pci_config_window is generic (it is not specific to
one bridge), I wonder if we even need the .register_mmio_handler
callback here.

In fact, pci_host_bridge->sysdata doesn't even need to be a void*, it
could be a struct pci_config_window*, right?

We could simply call:

register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);

for each bridge directly from domain_vpci_init ?




>  /* ECAM ops */
>  const struct pci_ecam_ops pci_generic_ecam_ops = {
>      .bus_shift  = 20,
> @@ -49,6 +59,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>          .map_bus                = pci_ecam_map_bus,
>          .read                   = pci_generic_config_read,
>          .write                  = pci_generic_config_write,
> +        .register_mmio_handler  = pci_ecam_register_mmio_handler,
>      }
>  };
>  
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index d2fef5476b8e..a89112bfbb7c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -318,6 +318,22 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
>      }
>      return bridge->dt_node;
>  }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err = clb(d, bridge);
> +        if ( err )
> +            return err;
> +    }
> +    return 0;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index da8b1ca13c07..258134292458 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -74,11 +74,24 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>      .write = vpci_mmio_write,
>  };
>  
> +static int vpci_setup_mmio_handler(struct domain *d,
> +                                   struct pci_host_bridge *bridge)
> +{
> +    if ( bridge->ops->register_mmio_handler )
> +        return bridge->ops->register_mmio_handler(d, bridge,
> +                                                  &vpci_mmio_handler);
> +    return 0;
> +}
> +
>  int domain_vpci_init(struct domain *d)
>  {
>      if ( !has_vpci(d) )
>          return 0;
>  
> +    if ( is_hardware_domain(d) )
> +        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> +
> +    /* Guest domains use what is programmed in their device tree. */
>      register_mmio_handler(d, &vpci_mmio_handler,
>                            GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
>  
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7dc4c8dc9026..2c7c7649e00f 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -17,6 +17,8 @@
>  #ifndef __ARM_PCI_H__
>  #define __ARM_PCI_H__
>  
> +#include <asm/mmio.h>
> +
>  #ifdef CONFIG_HAS_PCI
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> @@ -77,6 +79,9 @@ struct pci_ops {
>                  uint32_t reg, uint32_t len, uint32_t *value);
>      int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
>                   uint32_t reg, uint32_t len, uint32_t value);
> +    int (*register_mmio_handler)(struct domain *d,
> +                                 struct pci_host_bridge *bridge,
> +                                 const struct mmio_handler_ops *ops);
>  };
>  
>  /*
> @@ -107,6 +112,9 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                  uint16_t *segment);
>  struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
>  
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge));
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> -- 
> 2.25.1
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BE417E95
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 02:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195753.348602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvOm-0005DX-0R; Sat, 25 Sep 2021 00:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195753.348602; Sat, 25 Sep 2021 00:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvOl-0005Bk-Te; Sat, 25 Sep 2021 00:18:35 +0000
Received: by outflank-mailman (input) for mailman id 195753;
 Sat, 25 Sep 2021 00:18:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTvOk-0005Be-5v
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 00:18:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dcb2564-1d96-11ec-bb2c-12813bfff9fa;
 Sat, 25 Sep 2021 00:18:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D512610C9;
 Sat, 25 Sep 2021 00:18:31 +0000 (UTC)
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
X-Inumbo-ID: 1dcb2564-1d96-11ec-bb2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632529112;
	bh=9Dcp95dj4NZN6nzRAgoBLdmQxsw4wAIBVUfXvr5Deec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HSKJAY90h6Lo1QG5Oi2y7syJoaWiTAAOMLB1Xj+gaYeMxyh+iQdiq9cAPpgHj6QP0
	 FmwEKJmJSE2ht4ESOa1nfiCsXUkyAHuouogQZahBfAfDs/m/BNcbDNlF+Wh6SYM0dI
	 zTYKcM0uYLiA2tHaNZWXiHQMM9qPjV9CMy4EQxTUkMxVhMe6WV7E5d8ZXXo19DVok0
	 UfdKF0YrX5yKmXsP18t7i65JjPZaaFo5W3kAYft/SzY1L04NQY0ymyobsOaw2bXR6m
	 SVpGCSoFWcCJXX9GXBl9uU0+ViPXvNj85yKOFkzlIrg/k3s+PlLMGsHK7AX1aaelK8
	 9jqGr+zRq9Bvw==
Date: Fri, 24 Sep 2021 17:18:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
In-Reply-To: <20210923125438.234162-10-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241713160.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-10-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order for vPCI to work it needs to maintain guest and hardware
> domain's views on the configuration space. For example, BARs and
                 ^ of

> COMMAND registers require emulation for guests and the guest view
> on the registers needs to be in sync with the real contents of the
  ^ of

> relevant registers. For that ECAM address space needs to also be
> trapped for the hardware domain, so we need to implement PCI host
> bridge specific callbacks to properly setup MMIO handlers for those
> ranges depending on particular host bridge implementation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

The patch looks pretty good, only a couple of minor comments below


> ---
> Since v1:
>  - Dynamically calculate the number of MMIO handlers required for vPCI
>    and update the total number accordingly
>  - s/clb/cb
>  - Do not introduce a new callback for MMIO handler setup
> ---
>  xen/arch/arm/domain.c              |  2 ++
>  xen/arch/arm/pci/pci-host-common.c | 28 +++++++++++++++++++++++++
>  xen/arch/arm/vpci.c                | 33 ++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h                |  6 ++++++
>  xen/include/asm-arm/pci.h          |  7 +++++++
>  5 files changed, 76 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 854e8fed0393..c7b25bc70439 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -733,6 +733,8 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = domain_vgic_register(d, &count)) != 0 )
>          goto fail;
>  
> +    count += domain_vpci_get_num_mmio_handlers(d);
> +
>      if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
>          goto fail;
>  
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 1567b6e2956c..155f2a2743af 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -300,6 +300,34 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
>      }
>      return bridge->dt_node;
>  }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*cb)(struct domain *d,
> +                                       struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err = cb(d, bridge);
> +        if ( err )
> +            return err;
> +    }
> +    return 0;
> +}
> +
> +int pci_host_get_num_bridges(void)
> +{
> +    struct pci_host_bridge *bridge;
> +    int count = 0;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +        count++;
> +
> +    return count;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 76c12b92814f..14947e975d69 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -80,17 +80,50 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>      .write = vpci_mmio_write,
>  };
>  
> +static int vpci_setup_mmio_handler(struct domain *d,
> +                                   struct pci_host_bridge *bridge)
> +{
> +    struct pci_config_window *cfg = bridge->cfg;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          cfg->phys_addr, cfg->size, NULL);
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
>      return 0;
>  }
>  
> +int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    int count = 0;
> +
> +    if ( is_hardware_domain(d) )
> +        /* For each PCI host bridge's configuration space. */
> +        count += pci_host_get_num_bridges();

NIT: why += instead of = ?


> +    else
> +        /*
> +         * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI device
> +         * being passed through. Maximum number of supported devices
> +         * is 32 as virtual bus topology emulates the devices as embedded
> +         * endpoints.
> +         * +1 for a single emulated host bridge's configuration space. */
> +        count = VPCI_MSIX_MEM_NUM * 32 + 1;
> +
> +    return count;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> index d8a7b0e3e802..27a2b069abd2 100644
> --- a/xen/arch/arm/vpci.h
> +++ b/xen/arch/arm/vpci.h
> @@ -17,11 +17,17 @@
>  
>  #ifdef CONFIG_HAS_VPCI
>  int domain_vpci_init(struct domain *d);
> +int domain_vpci_get_num_mmio_handlers(struct domain *d);
>  #else
>  static inline int domain_vpci_init(struct domain *d)
>  {
>      return 0;
>  }
> +
> +static inline int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    return 0;
> +}
>  #endif
>  
>  #endif /* __ARCH_ARM_VPCI_H__ */
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 5b100556225e..7618f0b6725b 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -15,6 +15,8 @@
>  #ifndef __ARM_PCI_H__
>  #define __ARM_PCI_H__
>  
> +#include <asm/mmio.h>

This should be no longer required.


>  #ifdef CONFIG_HAS_PCI
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> @@ -109,6 +111,11 @@ static always_inline bool is_pci_passthrough_enabled(void)
>  {
>      return !!pci_passthrough_enabled;
>  }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge));
> +int pci_host_get_num_bridges(void);
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  #define pci_passthrough_enabled (false)



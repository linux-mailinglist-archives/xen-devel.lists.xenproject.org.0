Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935F41E59C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200340.354843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6gD-0003kH-FA; Fri, 01 Oct 2021 00:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200340.354843; Fri, 01 Oct 2021 00:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6gD-0003hl-B7; Fri, 01 Oct 2021 00:45:37 +0000
Received: by outflank-mailman (input) for mailman id 200340;
 Fri, 01 Oct 2021 00:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6gB-0003hf-TX
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:45:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ada8c754-4718-41bf-8074-2189646f23c4;
 Fri, 01 Oct 2021 00:45:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B493D61A52;
 Fri,  1 Oct 2021 00:45:33 +0000 (UTC)
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
X-Inumbo-ID: ada8c754-4718-41bf-8074-2189646f23c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633049134;
	bh=8EjGWH9okjcA9+Y1aqHRf0E4FpSc5FABVCAjGTZllqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A5XmxzVqrOy+ji81JitKUKUqueLhVK/iW7A3WgkX0eYWILP1Jz9EyayO26WY8fP5N
	 5SBp1P5Jmo6WO3piqaedgrUTHqVsjAwbnWf/UXz2/u/klvVKL6k1UENGwtRid1FpSd
	 jPhEae+gtAgurKBGBkJgX6SaX57/gr+itMmi6061VU59JFL8j9HEYCFm8ebMYNqpa7
	 1Yp4EuM6Q/sRe09gY5otSM9k5Fl125+kdUeZuByDsEQvOPE/7+TbzA2dx1gWdYtyht
	 X5iajOjCWxPq/d3gWlDHAO2y9BayTczo51/LlLKarxSWhP+5VTMdQF2J5EkE2XAPLP
	 OTPOjoUM5YX+Q==
Date: Thu, 30 Sep 2021 17:45:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
In-Reply-To: <20210930071326.857390-10-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301742300.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-10-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order for vPCI to work it needs to maintain guest and hardware
> domain's views of the configuration space. For example, BARs and
> COMMAND registers require emulation for guests and the guest view
> of the registers needs to be in sync with the real contents of the
> relevant registers. For that ECAM address space needs to also be
> trapped for the hardware domain, so we need to implement PCI host
> bridge specific callbacks to properly setup MMIO handlers for those
> ranges depending on particular host bridge implementation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
> - removed unneeded assignment (count = 0)
> - removed unneeded header inclusion
> - update commit message
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
>  xen/include/asm-arm/pci.h          |  5 +++++
>  5 files changed, 74 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79012bf77757..fa6fcc5e467c 100644
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
> index 592c01aae5bb..1eb4daa87365 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -292,6 +292,34 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
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
> index 76c12b92814f..5d6c29c8dcd9 100644
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
> +    int count;
> +
> +    if ( is_hardware_domain(d) )
> +        /* For each PCI host bridge's configuration space. */
> +        count = pci_host_get_num_bridges();
> +    else
> +        /*
> +         * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI device
> +         * being passed through. Maximum number of supported devices
> +         * is 32 as virtual bus topology emulates the devices as embedded
> +         * endpoints.
> +         * +1 for a single emulated host bridge's configuration space. */

Code style: Xen multiline comments are like this:

/*
 * comment
 * more comment
 */

Aside from this minor comment:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
> index 566a9436a18e..0d0266b13cba 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -108,6 +108,11 @@ static always_inline bool is_pci_passthrough_enabled(void)
>  
>  void arch_pci_init_pdev(struct pci_dev *pdev);
>  
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge));
> +int pci_host_get_num_bridges(void);
> +
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> -- 
> 2.25.1
> 


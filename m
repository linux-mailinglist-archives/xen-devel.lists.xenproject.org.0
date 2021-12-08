Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904946D8D6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 17:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242506.419416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv078-0004Jh-Ft; Wed, 08 Dec 2021 16:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242506.419416; Wed, 08 Dec 2021 16:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mv078-0004GX-BV; Wed, 08 Dec 2021 16:48:18 +0000
Received: by outflank-mailman (input) for mailman id 242506;
 Wed, 08 Dec 2021 16:48:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mv077-0004GR-8d
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 16:48:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv076-0001jE-9U; Wed, 08 Dec 2021 16:48:16 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mv076-0001lh-2L; Wed, 08 Dec 2021 16:48:16 +0000
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
	bh=MUFj/aqzThJkfEnYTwDxe07529fFF6HYotU0W7JpW7o=; b=ITfa45j/f3i/mCZ+baaY++5iVu
	aQU9Pu8fctwfMJ/O3rf1LZQDbWcunTvbXsmnB5mQYrfXrfxMZeMeRiOK2TXq9Fs9nnRE8ukwyp1Fh
	g7el3o+9A/Oip5qywfywAwf8kEDjXeUgiyYt95qHzvmK7FltUS5mOvlfwr1UhdLBQKUA=;
Message-ID: <e5a2ca97-8983-9159-6776-5afdeab398a0@xen.org>
Date: Wed, 8 Dec 2021 16:48:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v7 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-4-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211124075942.2645445-4-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24/11/2021 07:59, Oleksandr Andrushchenko wrote:
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
> ---
> Since v6:
> - eliminate pci_host_get_num_bridges and make pci_host_iterate_bridges
>    return the count
> - extend comment in domain_vpci_init
> - remove not yet relevant code for num MMIOs and virtual bus topology
> - add extra check for has_vpci in domain_vpci_get_num_mmio_handlers
> - remove code that fixes num MMIOs for guest domain as it doesn't belong
>    to this patch
> Since v5:
> - add vpci_sbdf_from_gpa helper for gpa to SBDF translation
> - take bridge's bus start into account while calculating SBDF
> Since v4:
> - unsigned int for functions working with count
> - gate number of MMIO handlers needed for CONFIG_HAS_PCI_MSI
>    and fix their number, e.g. single handler for PBA and
>    MSI-X tables (Roger)
> - re-work code for assigning MMIO handlers to be simpler
>    and account on the fact that there could multiple host bridges
>    exist for the hwdom
> Since v3:
> - fixed comment formatting
> Since v2:
> - removed unneeded assignment (count = 0)
> - removed unneeded header inclusion
> - update commit message
> Since v1:
>   - Dynamically calculate the number of MMIO handlers required for vPCI
>     and update the total number accordingly
>   - s/clb/cb
>   - Do not introduce a new callback for MMIO handler setup
> ---
>   xen/arch/arm/domain.c              |  2 +
>   xen/arch/arm/pci/pci-host-common.c | 17 +++++++
>   xen/arch/arm/vpci.c                | 79 +++++++++++++++++++++++++++---
>   xen/arch/arm/vpci.h                |  6 +++
>   xen/include/asm-arm/pci.h          |  4 ++
>   5 files changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 96e1b235501d..92a6c509e5c5 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -739,6 +739,8 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
>           goto fail;
>   
> +    count += domain_vpci_get_num_mmio_handlers(d);
> +
>       if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
>           goto fail;
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 9653b92b5b2e..18b09d5e6f10 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -296,6 +296,23 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
>       return -EINVAL;
>   }
>   
> +int pci_host_iterate_bridges_and_count(struct domain *d,
> +                                       int (*cb)(struct domain *d,
> +                                                 struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err, count = 0;

NIT: err is only used within the loop, so I would suggest to move the 
declartion variable inside the loop.

> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err = cb(d, bridge);
> +        if ( err )
> +            return err;
> +        count += err;

Something looks wrong here. You check that err is non-zero and bail out. 
So err would be 0 and by extend you would always return 0 in success?

> +    }
> +    return count;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 23f45386f4b3..ccd998d8dba2 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -16,16 +16,31 @@
>   
>   #include <asm/mmio.h>
>   
> +static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> +                                     paddr_t gpa)
> +{
> +    pci_sbdf_t sbdf;
> +
> +    if ( bridge )
> +    {
> +        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> +        sbdf.seg = bridge->segment;
> +        sbdf.bus += bridge->cfg->busn_start;
> +    }
> +    else
> +        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> +
> +    return sbdf;
> +}
> +
>   static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>                             register_t *r, void *p)
>   {
> -    pci_sbdf_t sbdf;
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>       /* data is needed to prevent a pointer cast on 32bit */
>       unsigned long data;
>   
> -    /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
> -
>       if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                           1U << info->dabt.size, &data) )
>       {
> @@ -41,10 +56,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>   static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>                              register_t r, void *p)
>   {
> -    pci_sbdf_t sbdf;
> -
> -    /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>   
>       return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                              1U << info->dabt.size, r);
> @@ -55,17 +68,67 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>       .write = vpci_mmio_write,
>   };
>   
> +static int vpci_setup_mmio_handler_cb(struct domain *d,
> +                                      struct pci_host_bridge *bridge)
> +{
> +    struct pci_config_window *cfg = bridge->cfg;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          cfg->phys_addr, cfg->size, bridge);
> +
> +    /* We have registered a single MMIO handler. */
> +    return 1;
> +}
> +
>   int domain_vpci_init(struct domain *d)
>   {
>       if ( !has_vpci(d) )
>           return 0;
>   
> +    /*
> +     * The hardware domain gets as many MMIOs as required by the
> +     * physical host bridge.
> +     * Guests get the virtual platform layout: one virtual host bridge for now.
> +     */
> +    if ( is_hardware_domain(d) )
> +    {
> +        int count;
> +
> +        count = pci_host_iterate_bridges_and_count(d, vpci_setup_mmio_handler_cb);
> +        if ( count < 0 )
> +            return count;
> +
> +        return 0;

This could be simplified to "return (count < 0) ? count : 0;". Although 
my preference would be to move the guest part in an else.

> +    }
> +
>       register_mmio_handler(d, &vpci_mmio_handler,
>                             GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
>   
>       return 0;
>   }
>   
> +static int vpci_get_num_handlers_cb(struct domain *d,
> +                                    struct pci_host_bridge *bridge)
> +{
> +    /* Each bridge has a single MMIO handler for the configuration space. */
> +    return 1;
> +}
> +
> +unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        int ret = pci_host_iterate_bridges_and_count(d, vpci_get_num_handlers_cb);
> +
> +        return ret < 0 ? 0 : ret;
> +    }
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> index d8a7b0e3e802..3c713f3fcdb5 100644
> --- a/xen/arch/arm/vpci.h
> +++ b/xen/arch/arm/vpci.h
> @@ -17,11 +17,17 @@
>   
>   #ifdef CONFIG_HAS_VPCI
>   int domain_vpci_init(struct domain *d);
> +unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
>   #else
>   static inline int domain_vpci_init(struct domain *d)
>   {
>       return 0;
>   }
> +
> +static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
> +{
> +    return 0;
> +}
>   #endif
>   
>   #endif /* __ARCH_ARM_VPCI_H__ */
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index c20eba643d86..4278d66e5eb9 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -110,6 +110,10 @@ void arch_pci_init_pdev(struct pci_dev *pdev);
>   
>   int pci_get_new_domain_nr(void);
>   
> +int pci_host_iterate_bridges_and_count(struct domain *d,
> +                                       int (*cb)(struct domain *d,
> +                                                 struct pci_host_bridge *bridge));
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> 

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A14539E8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 20:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226541.391493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn3sc-0000SL-CB; Tue, 16 Nov 2021 19:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226541.391493; Tue, 16 Nov 2021 19:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn3sc-0000Q4-8j; Tue, 16 Nov 2021 19:12:30 +0000
Received: by outflank-mailman (input) for mailman id 226541;
 Tue, 16 Nov 2021 19:12:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mn3sa-0000Py-9f
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 19:12:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn3sZ-0002Yv-7s; Tue, 16 Nov 2021 19:12:27 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.85.43.125])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mn3sZ-0006zH-0w; Tue, 16 Nov 2021 19:12:27 +0000
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
	bh=qfp1xha3qzpO+qSYNLGF6M0gi2M5YQs4YyajYbYiIH8=; b=IZrhp9SWC3RM2ZDx3uV5dOCvdt
	lqDKbD/LcKWJIKVOW0I9FbgOL6fgCXjzOFEWYanE/VKZTQPim08zb9h0PLFSHN74SxT006qC0YTng
	JE6feA759eC+MXdcrasayBujXNoJ47DUtfrQ7XIQb/+51iSs7xyoC/7c+wV0dAlMTQpI=;
Message-ID: <2eb6b4e8-95e1-9566-3209-c28964b0d643@xen.org>
Date: Tue, 16 Nov 2021 19:12:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211105063326.939843-4-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
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
>   xen/arch/arm/pci/pci-host-common.c | 27 ++++++++++++
>   xen/arch/arm/vpci.c                | 66 ++++++++++++++++++++++++++----
>   xen/arch/arm/vpci.h                |  6 +++
>   xen/include/asm-arm/pci.h          |  5 +++
>   5 files changed, 98 insertions(+), 8 deletions(-)
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
> index 47104b22b221..0d271a6e8881 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -289,6 +289,33 @@ int pci_get_host_bridge_segment(const struct dt_device_node *node,
>       return -EINVAL;
>   }
>   
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
> +unsigned int pci_host_get_num_bridges(void)
> +{
> +    struct pci_host_bridge *bridge;
> +    unsigned int count = 0;

How about making this static and...

> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +        count++;

... only call list_for_each_entry() when count is -1? So we would only 
go through the list once.

This should be fine given hostbridge can only be added during boot (we 
would need to protect pci_host_bridges with a lock otherwise).

> +
> +    return count;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 23f45386f4b3..5a6ebd8b9868 100644
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
> @@ -55,17 +68,54 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
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
> +    return 0;
> +}
> +
>   int domain_vpci_init(struct domain *d)
>   {
>       if ( !has_vpci(d) )
>           return 0;
>   
> +    if ( is_hardware_domain(d) )
> +        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler_cb);
> +
> +    /* Guest domains use what is programmed in their device tree. */

I would rather not make the assumption that the guest is using a 
Device-Tree. So how about:

/*
  * The hardware domain gets one virtual hostbridge by "real"
  * hostbridges.
  * Guests get the virtual platform layout (one virtual host bridge for
  * now).
  */

The comment would have to be moved before if ( is_hardware_domain(d) ).

>       register_mmio_handler(d, &vpci_mmio_handler,
>                             GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
>   
>       return 0;
>   }
>   
> +unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)

AFAICT, this function would also be called even if vPCI is not enabled 
for the domain. So we should add:

if ( !has_vpci(d) )
   return 0;

> +{
> +    unsigned int count;
> +
> +    if ( is_hardware_domain(d) )
> +        /* For each PCI host bridge's configuration space. */
> +        count = pci_host_get_num_bridges();

This first part makes sense to me. But...

> +    else

... I don't understand how the else is related to this commit. Can you 
clarify it?

> +        /*
> +         * There's a single MSI-X MMIO handler that deals with both PBA
> +         * and MSI-X tables per each PCI device being passed through.
> +         * Maximum number of supported devices is 32 as virtual bus
> +         * topology emulates the devices as embedded endpoints.
> +         * +1 for a single emulated host bridge's configuration space.
> +         */
> +        count = 1;
> +#ifdef CONFIG_HAS_PCI_MSI
> +        count += 32;

Surely, this is a decision that is based on other factor in the vPCI 
code. So can use a define and avoid hardcoding the number?

> +#endif


> +
> +    return count;
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
> index c20eba643d86..969333043431 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -110,6 +110,11 @@ void arch_pci_init_pdev(struct pci_dev *pdev);
>   
>   int pci_get_new_domain_nr(void);
>   
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,

NIT: This is more common to call a callback 'cb'. In any case, I would 
prefer if the names matches the one used in the implementation.

> +                                        struct pci_host_bridge *bridge));
> +unsigned int pci_host_get_num_bridges(void);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> 

Cheers,

-- 
Julien Grall


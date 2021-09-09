Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACED405C6F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 19:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183458.331655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOOJf-0001CQ-Sj; Thu, 09 Sep 2021 17:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183458.331655; Thu, 09 Sep 2021 17:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOOJf-0001AE-Pm; Thu, 09 Sep 2021 17:58:27 +0000
Received: by outflank-mailman (input) for mailman id 183458;
 Thu, 09 Sep 2021 17:58:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOOJd-0001A8-K0
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 17:58:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOOJa-0003bx-Gs; Thu, 09 Sep 2021 17:58:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOOJa-00032I-A9; Thu, 09 Sep 2021 17:58:22 +0000
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
	bh=Yy4yoOqlTNdTU72q+wjtOFjBk8vaQvOE39O2MrR64RA=; b=pNoIPZWn/oLTsa8jGEQX4iPG1z
	HwqMS3iY3PxPvyHA64R6PQN16PktejzE+VbqG1ExkRS6lac2DKZh+I8Sin3W4sy4tFMlOYkKSdHtW
	qu2TMBg5kb8+zA7PXB4V81HXle1iBAny1uu77t2dGPSWeblbEw1tcbDTp6vr76PFKHxo=;
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
Date: Thu, 9 Sep 2021 18:58:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210903083347.131786-11-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Host bridge controller's ECAM space is mapped into Domain-0's p2m,
> thus it is not possible to trap the same for vPCI via MMIO handlers.
> For this to work we need to not map those while constructing the domain.
> 
> Note, that during Domain-0 creation there is no pci_dev yet allocated for
> host bridges, thus we cannot match PCI host and its associated
> bridge by SBDF. Use dt_device_node field for checks instead.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/arch/arm/domain_build.c        |  3 +++
>   xen/arch/arm/pci/ecam.c            | 17 +++++++++++++++++
>   xen/arch/arm/pci/pci-host-common.c | 22 ++++++++++++++++++++++
>   xen/include/asm-arm/pci.h          | 12 ++++++++++++
>   4 files changed, 54 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index da427f399711..76f5b513280c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1257,6 +1257,9 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
>           }
>       }
>   
> +    if ( need_mapping && (device_get_class(dev) == DEVICE_PCI) ) > +        need_mapping = pci_host_bridge_need_p2m_mapping(d, dev, 
addr, len);

AFAICT, with device_get_class(dev), you know whether the hostbridge is 
used by Xen. Therefore, I would expect that we don't want to map all the 
regions of the hostbridges in dom0 (including the BARs).

Can you clarify it?

> + >       if ( need_mapping )
>       {
>           res = map_regions_p2mt(d,
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 92ecb2e0762b..d32efb7fcbd0 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -52,6 +52,22 @@ static int pci_ecam_register_mmio_handler(struct domain *d,
>       return 0;
>   }
>   
> +static int pci_ecam_need_p2m_mapping(struct domain *d,
> +                                     struct pci_host_bridge *bridge,
> +                                     uint64_t addr, uint64_t len)
> +{
> +    struct pci_config_window *cfg = bridge->sysdata;
> +
> +    if ( !is_hardware_domain(d) )
> +        return true;

I am a bit puzzled with this check. If the ECAM has been initialized by 
Xen, then I believe we cannot expose it to any domain at all.

> +
> +    /*
> +     * We do not want ECAM address space to be mapped in domain's p2m,
> +     * so we can trap access to it.
> +     */
> +    return cfg->phys_addr != addr;
> +}
> +
>   /* ECAM ops */
>   const struct pci_ecam_ops pci_generic_ecam_ops = {
>       .bus_shift  = 20,
> @@ -60,6 +76,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
>           .read                   = pci_generic_config_read,
>           .write                  = pci_generic_config_write,
>           .register_mmio_handler  = pci_ecam_register_mmio_handler,
> +        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
>       }
>   };
>   
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index a89112bfbb7c..c04be636452d 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -334,6 +334,28 @@ int pci_host_iterate_bridges(struct domain *d,
>       }
>       return 0;
>   }
> +
> +bool pci_host_bridge_need_p2m_mapping(struct domain *d,
> +                                      const struct dt_device_node *node,
> +                                      uint64_t addr, uint64_t len)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->dt_node != node )
> +            continue;
> +
> +        if ( !bridge->ops->need_p2m_mapping )
> +            return true;
> +
> +        return bridge->ops->need_p2m_mapping(d, bridge, addr, len);
> +    }
> +    printk(XENLOG_ERR "Unable to find PCI bridge for %s segment %d, addr %lx\n",
> +           node->full_name, bridge->segment, addr);
> +    return true;
> +}

If you really need to map the hostbridges, then I would suggest to defer 
the P2M mappings for all of them and then walk all the bridge in one go 
to do the mappings.

This would avoid going through the bridges every time during setup.

> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 2c7c7649e00f..9c28a4bdc4b7 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -82,6 +82,8 @@ struct pci_ops {
>       int (*register_mmio_handler)(struct domain *d,
>                                    struct pci_host_bridge *bridge,
>                                    const struct mmio_handler_ops *ops);
> +    int (*need_p2m_mapping)(struct domain *d, struct pci_host_bridge *bridge,
> +                            uint64_t addr, uint64_t len);
>   };
>   
>   /*
> @@ -115,9 +117,19 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
>   int pci_host_iterate_bridges(struct domain *d,
>                                int (*clb)(struct domain *d,
>                                           struct pci_host_bridge *bridge));
> +bool pci_host_bridge_need_p2m_mapping(struct domain *d,
> +                                      const struct dt_device_node *node,
> +                                      uint64_t addr, uint64_t len);
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
>   
> +static inline bool
> +pci_host_bridge_need_p2m_mapping(struct domain *d,
> +                                 const struct dt_device_node *node,
> +                                 uint64_t addr, uint64_t len)
> +{
> +    return true;
> +}
>   #endif  /*!CONFIG_HAS_PCI*/
>   #endif /* __ARM_PCI_H__ */
> 

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DB41CA93
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199291.353253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVckr-000878-Kw; Wed, 29 Sep 2021 16:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199291.353253; Wed, 29 Sep 2021 16:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVckr-000850-Hd; Wed, 29 Sep 2021 16:48:25 +0000
Received: by outflank-mailman (input) for mailman id 199291;
 Wed, 29 Sep 2021 16:48:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVckq-00084s-7Z
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:48:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a335ff98-c219-4189-8876-f98992f65417;
 Wed, 29 Sep 2021 16:48:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90B0B6142A;
 Wed, 29 Sep 2021 16:48:22 +0000 (UTC)
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
X-Inumbo-ID: a335ff98-c219-4189-8876-f98992f65417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632934102;
	bh=+ddRhEXcQ9gfIkluZQrMrifayFfgn4cW+gKLN1SNfpg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fu0XWwFBXXODPjBi0vT5VZ0GTa6S5SdcmtdwGcNBTjuSTZ9osRb/XwAosH1NLMWhP
	 ka75RhD17c6/YAzF6OBuNQacSHeKvAkFWGebWCIplT17A45YlW1hZlBcqTjBoenAIr
	 aohaXbjDP1UXsRIntmfE+XXIfifvC/lj2XCoRjZyqbbo3Y9yZ15RXkEwnYAZjqB8qr
	 W03Q/DoUb+5Tdcd8SDlXRJ02WEOgyef30yCUpde2qf6pLxE45ixg5PZyk2MhAmKKx8
	 D1ak5nDLjQX8K7zAQ4KUPERBuXL8k3OzT7vuUSU8wBk8WHXJgi5yEmy83IYkbdqiTH
	 GULWAN870CTNQ==
Date: Wed, 29 Sep 2021 09:48:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/17] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
In-Reply-To: <f290d8e2f9b3780c5a956a8032aba6f35de83a90.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281659170.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <f290d8e2f9b3780c5a956a8032aba6f35de83a90.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> If the property is not present in the device tree node for host bridge,
> XEN while creating the dtb for hwdom will create this property and
> assigns the already allocated segment to the host bridge
> so that XEN and linux will have the same segment for the host bridges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Use is_pci_passthrough_enabled()
> Change in v2:
> - Add linux,pci-domain only when pci-passthrough command line option is enabeld
> ---
>  xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>  xen/include/asm-arm/pci.h          |  9 +++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1731ae2028..026c9e5c6c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -743,6 +743,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>              return res;
>      }
>  
> +    if ( is_pci_passthrough_enabled() && dt_device_type_is_equal(node, "pci") )
> +    {
> +        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
> +        {
> +            uint16_t segment;
> +
> +            res = pci_get_host_bridge_segment(node, &segment);
> +            if ( res < 0 )
> +                return res;
> +
> +            res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
> +            if ( res )
> +                return res;
> +        }
> +    }
> +
>      /*
>       * Override the property "status" to disable the device when it's
>       * marked for passthrough.
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index c5941b10e9..593beeb48c 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -255,6 +255,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
>  
>      return NULL;
>  }
> +
> +/*
> + * This function will lookup an hostbridge based on config space address.
> + */
> +int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                uint16_t *segment)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->dt_node != node )
> +            continue;
> +
> +        *segment = bridge->segment;
> +        return 0;
> +    }
> +
> +    return -EINVAL;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 5532ce3977..7cb2e2f1ed 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -90,6 +90,8 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 pci_sbdf_t sbdf, uint32_t where);
>  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> +int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                uint16_t *segment);
>  
>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
> @@ -104,5 +106,12 @@ static always_inline bool is_pci_passthrough_enabled(void)
>      return false;
>  }
>  
> +static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                              uint16_t *segment)
> +{
> +    ASSERT_UNREACHABLE();
> +    return -EINVAL;
> +}
> +
>  #endif  /*!CONFIG_HAS_PCI*/
>  #endif /* __ARM_PCI_H__ */
> -- 
> 2.17.1
> 


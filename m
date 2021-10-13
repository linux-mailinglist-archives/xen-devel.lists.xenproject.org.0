Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F042CC26
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208867.365127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malGW-0005qv-W5; Wed, 13 Oct 2021 20:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208867.365127; Wed, 13 Oct 2021 20:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1malGW-0005ot-Sa; Wed, 13 Oct 2021 20:54:20 +0000
Received: by outflank-mailman (input) for mailman id 208867;
 Wed, 13 Oct 2021 20:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1malGV-0005oj-P7
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:54:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6314625d-56a7-4e92-b61e-ea5edb7912f1;
 Wed, 13 Oct 2021 20:54:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14D3C61139;
 Wed, 13 Oct 2021 20:54:18 +0000 (UTC)
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
X-Inumbo-ID: 6314625d-56a7-4e92-b61e-ea5edb7912f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634158458;
	bh=DJ5O9xaU3KyiNEtsTusVehr3cdzALi4I2qFO3t2I5Tk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CHsHoBvb/tNH6OALLYNkBB0ZdpYcuF+cJQItIIO7YoESvYseN3CEQxUVVytIEXbjQ
	 gcVytRGdaPIWQVuI8JOWgL5k2qJ3eQfI35f2eeOyGdbZ5+7VRZLEcp6WHV6rU9sxXz
	 MYp5gPOqoDEorj7A6hPWt1E+klkUrRLFp8Ekclp3k993OG68eEl3AAK+U5ehEAqDhD
	 r5ejd8g0fYvgEu1z95ggh9r6mgp0drYrapkuZ+CWKoHAciGVIjDRd/VkdkBYUj/lDn
	 f4AZQg2iguBQEQo1EbVMvFS9+no9hUdStgNenGuInd63nUGUOTUosavfrzf+q9Sn+W
	 q5wLqWctg6Jdw==
Date: Wed, 13 Oct 2021 13:54:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 11/11] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
In-Reply-To: <dcf40709a3397c07c769a4fd0e55bbe3557730ec.1633540842.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2110131354090.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <dcf40709a3397c07c769a4fd0e55bbe3557730ec.1633540842.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Rahul Singh wrote:
> If the property is not present in the device tree node for host bridge,
> XEN while creating the dtb for hwdom will create this property and
> assigns the already allocated segment to the host bridge
> so that XEN and linux will have the same segment for the host bridges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I committed this patch


> ---
> Change in v5: none
> Change in v4:
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> - Added Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Change in v3:
> - Use is_pci_passthrough_enabled()
> Change in v2:
> - Add linux,pci-domain only when pci-passthrough command line option is enabeld
> ---
> ---
>  xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>  xen/include/asm-arm/pci.h          |  9 +++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f4c89bde8c..8739e3285e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -747,6 +747,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
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
> 2.25.1
> 


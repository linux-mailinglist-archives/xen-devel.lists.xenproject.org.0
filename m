Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2C4155A7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193296.344297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEqr-0000kB-Vp; Thu, 23 Sep 2021 02:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193296.344297; Thu, 23 Sep 2021 02:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEqr-0000hl-Sq; Thu, 23 Sep 2021 02:52:45 +0000
Received: by outflank-mailman (input) for mailman id 193296;
 Thu, 23 Sep 2021 02:52:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTEqq-0000hf-NE
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:52:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84bc358e-4583-4aba-8619-22e5f81b14dc;
 Thu, 23 Sep 2021 02:52:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7934600AA;
 Thu, 23 Sep 2021 02:52:42 +0000 (UTC)
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
X-Inumbo-ID: 84bc358e-4583-4aba-8619-22e5f81b14dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632365563;
	bh=wV5ec62jAYRtdlBuwMHsb0HWYZs7rNB59pnUkneMLJU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uoLUGlcP4ow2JTzlEAtu7Z7D22lzH2Xkk5NynPzFI84AvE7Zwr0h1EFQlD+dcAmza
	 yKMEumUi8lyERSLrjBzIrWjsbLEd2JPvgKKZCK/01dBwGO+nH9aqZ5aUJr2BN9ypt0
	 G/XWJt3LJwASnNyXbOynkgXmsvgwhqhQsDi9KLw4K+rcc/5w/oifkEXwapn+Vmj7hL
	 RgYOt4e41AULqzOkWBoHBkLz0CF5KOT89iYnJ82tu9Czpqk5yd28HBe/KCGinfsD5H
	 4jGD9P0eDm8pMBKLMQbQ2o3PbrmsKfLiC63lE+D+VMk1EBqs5q65BqKjLEDHZOVgtX
	 gjmHfyrej/GWA==
Date: Wed, 22 Sep 2021 19:52:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 17/17] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
In-Reply-To: <e1b8d878709dc8e93a3bb340f921a24976cebb57.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221948300.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <e1b8d878709dc8e93a3bb340f921a24976cebb57.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> If the property is not present in the device tree node for host bridge,
> XEN while creating the dtb for hwdom will create this property and
> assigns the already allocated segment to the host bridge
> so that XEN and linux will have the same segment for the host bridges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Add linux,pci-domain only when pci-passthrough command line option is enabeld
> ---
>  xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>  xen/include/asm-arm/pci.h          |  9 +++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 5eb83b12a1..83ab0d52cc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -743,6 +743,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>              return res;
>      }
>  
> +    if ( pci_passthrough_enabled && dt_device_type_is_equal(node, "pci") )

Please use the accessor function is_pci_passthrough_enabled


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
> index 3bdc336268..a88f20175e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -262,6 +262,27 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
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
> index 9327b7488e..9edc6bc5ae 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -94,6 +94,8 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 uint32_t sbdf, uint32_t where);
>  struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
> +int pci_get_host_bridge_segment(const struct dt_device_node *node,
> +                                uint16_t *segment);
>  
>  static always_inline bool is_pci_passthrough_enabled(void)
>  {
> @@ -110,5 +112,12 @@ static always_inline bool is_pci_passthrough_enabled(void)
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


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA87415569
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193283.344274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEOl-0004n2-BY; Thu, 23 Sep 2021 02:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193283.344274; Thu, 23 Sep 2021 02:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEOl-0004kr-8b; Thu, 23 Sep 2021 02:23:43 +0000
Received: by outflank-mailman (input) for mailman id 193283;
 Thu, 23 Sep 2021 02:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTEOk-0004kl-7e
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:23:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d54a80-b764-40b5-9ba2-91756671de3a;
 Thu, 23 Sep 2021 02:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4594D6105A;
 Thu, 23 Sep 2021 02:23:40 +0000 (UTC)
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
X-Inumbo-ID: e2d54a80-b764-40b5-9ba2-91756671de3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632363820;
	bh=hT1JcbC4JuV/bBEFDsCl1PT6WUlMzyXEud51b8zCBD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XZzBIuHHr6eMUB52GSBWzGqDnCIbgGf3Oo756i2nBUk1cN3ZbmWSj8nLN7qi5ML7I
	 I31tb/ZfGN53n/6pxNHvP70gsmYCoMe4yDTH/LM9zwD58I/3DTko8Nbc550K00+Fvx
	 zQga718sUklko0gIblcaOWX7rgDRj/QnHTrlPG6BCh2QBjBWTm4p0OoIZg9IYfQ+Ry
	 lggnWaZ08VeiqwIprJ69BnwY5lo1rBsflLaV9Cxkl10xm5XzimMS+RPvTqN2OuglDZ
	 IFHrV/LdKUQ/s+vplqHXCoIHO8MScwuek6n0mxE0pJBcA8u3ofCRHRrLZB8m8II/cO
	 DOXkp5bV0FcUg==
Date: Wed, 22 Sep 2021 19:23:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
In-Reply-To: <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Subject should have xen/arm


On Wed, 22 Sep 2021, Rahul Singh wrote:
> Implement generic pci access functions to read/write the configuration
> space.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2: Fixed comments 
> ---
>  xen/arch/arm/pci/pci-access.c      | 58 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
>  xen/include/asm-arm/pci.h          |  2 ++
>  3 files changed, 79 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index 04fe9fbf92..45500cec2a 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -16,6 +16,7 @@
>  #include <asm/io.h>
>  
>  #define INVALID_VALUE (~0U)
> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>  
>  int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value)
> @@ -72,6 +73,63 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>      return 0;
>  }
>  
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                                unsigned int len)
> +{
> +    uint32_t val = PCI_ERR_VALUE(len);
> +

No blank line


> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return val;
> +
> +    if ( unlikely(!bridge->ops->read) )
> +        return val;
> +
> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);

The more I look at these casts the less I like them :-D

One idea is to move the definition of pci_sbdf_t somewhere else
entirely, for instance xen/include/xen/types.h, then we can use
pci_sbdf_t everywhere


> +    return val;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +                             unsigned int len, uint32_t val)
> +{
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return;
> +
> +    if ( unlikely(!bridge->ops->write) )
> +        return;
> +
> +    bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type)                            \
> +    void pci_conf_write##size(pci_sbdf_t sbdf,              \
> +                              unsigned int reg, type val)   \
> +{                                                           \
> +    pci_config_write(sbdf, reg, size / 8, val);             \
> +}
> +
> +#define PCI_OP_READ(size, type)                             \
> +    type pci_conf_read##size(pci_sbdf_t sbdf,               \
> +                              unsigned int reg)             \
> +{                                                           \
> +    return pci_config_read(sbdf, reg, size / 8);            \
> +}
> +
> +PCI_OP_READ(8, uint8_t)
> +PCI_OP_READ(16, uint16_t)
> +PCI_OP_READ(32, uint32_t)
> +PCI_OP_WRITE(8, uint8_t)
> +PCI_OP_WRITE(16, uint16_t)
> +PCI_OP_WRITE(32, uint32_t)
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 4beec14f2f..3bdc336268 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -243,6 +243,25 @@ err_exit:
>      return err;
>  }
>  
> +/*
> + * This function will lookup an hostbridge based on the segment and bus
> + * number.
> + */
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->segment != segment )
> +            continue;
> +        if ( (bus < bridge->bus_start) || (bus > bridge->bus_end) )
> +            continue;
> +        return bridge;
> +    }
> +
> +    return NULL;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 4b32c7088a..5406daecda 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -18,6 +18,7 @@
>  #ifdef CONFIG_HAS_PCI
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +#define PRI_pci "%04x:%02x:%02x.%u"

This is added in this patch but it is unused here


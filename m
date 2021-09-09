Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC5406032
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183724.332029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTg3-0007hp-1E; Thu, 09 Sep 2021 23:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183724.332029; Thu, 09 Sep 2021 23:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTg2-0007er-TX; Thu, 09 Sep 2021 23:41:54 +0000
Received: by outflank-mailman (input) for mailman id 183724;
 Thu, 09 Sep 2021 23:41:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOTg1-0007el-3Y
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:41:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66639481-6b48-4419-9e0b-64e51774c742;
 Thu, 09 Sep 2021 23:41:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4966760F13;
 Thu,  9 Sep 2021 23:41:51 +0000 (UTC)
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
X-Inumbo-ID: 66639481-6b48-4419-9e0b-64e51774c742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631230911;
	bh=Y5OqA2Lg6ctGni4k4QvswC173ZoiTboRcsdPJvJl+2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T8g5FENdsSTD46kbj8Ds79AfcTqjlT/RO3OoFsYphkf/8nALjVNLaAfnXBaO5lk+b
	 DZ/O1Ecx8ulUau+ljP/3WjP4adaP9I7NKn5bvuYKho54PPt7EuTbyym6dAbhX5K9+b
	 cndvkp77+hDX1stDeU9EsqmQHrfDz3PpNEQStVcTLr4JO7PqYV8ImS49WSWtICD6md
	 DJMnxTLG4jXjrtlPCEp90GusADpVFMt3PZ3+Ws/w5uhgiDwLzvMetFitL8/xp2iHeJ
	 VbNHs1Isa3fSSZZ0ZOXU3Ues7J4zI2/QoLauvxfU92boaoTpnaIYNYXq2r6ny6tSqq
	 1xnMBsFdl6zog==
Date: Thu, 9 Sep 2021 16:41:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 08/14] xen:arm: Implement pci access functions
In-Reply-To: <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
> Implement generic pci access functions to read/write the configuration
> space.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/pci/pci-access.c      | 31 +++++++++++++++++++++++++++++-
>  xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++++++++++
>  xen/include/asm-arm/pci.h          |  2 ++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index f39f6a3a38..b94de3c3ac 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -72,12 +72,41 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>  static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>                                  unsigned int len)
>  {
> -    return ~0U;
> +    uint32_t val = GENMASK(0, len * 8);

This seems to be another default error value that it would be better to
define with its own macro


> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);

You are not actually printing sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn ?


> +        return val;
> +    }
> +
> +    if ( unlikely(!bridge->ops->read) )
> +        return val;
> +
> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);

Would it make sense to make the interface take a pci_sbdf_t directly
instead of casting to uint32_t and back?


> +    return val;
>  }
>  
>  static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
>                               unsigned int len, uint32_t val)
>  {
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +
> +    if ( unlikely(!bridge) )
> +    {
> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);

same here


> +        return;
> +    }
> +
> +    if ( unlikely(!bridge->ops->write) )
> +        return;
> +
> +    bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);

same here


>  }
>  
>  /*
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index c582527e92..62715b4676 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -261,6 +261,25 @@ err_exit:
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
> index 22866244d2..756f8637ab 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -20,6 +20,7 @@
>  #ifdef CONFIG_HAS_PCI
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +#define PRI_pci "%04x:%02x:%02x.%u"
>  
>  /* Arch pci dev struct */
>  struct arch_pci_dev {
> @@ -86,6 +87,7 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 uint32_t sbdf, uint32_t where);
>  
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus);
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> -- 
> 2.17.1
> 


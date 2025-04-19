Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A4A94093
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 02:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959690.1351986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vw5-0000XM-MA; Sat, 19 Apr 2025 00:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959690.1351986; Sat, 19 Apr 2025 00:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vw5-0000Vu-Hh; Sat, 19 Apr 2025 00:19:57 +0000
Received: by outflank-mailman (input) for mailman id 959690;
 Sat, 19 Apr 2025 00:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5vw3-0000Vo-G6
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 00:19:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0304d004-1cb4-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 02:19:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6B89446C1;
 Sat, 19 Apr 2025 00:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7085C4CEE2;
 Sat, 19 Apr 2025 00:19:49 +0000 (UTC)
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
X-Inumbo-ID: 0304d004-1cb4-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745021991;
	bh=TcqDSfzZHx8nTlLGYf17mV+0TwxQDxg5oLFelYu53nA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DKnK29OMDLGym7DIc1lfG1Nss/z/PKgaCcCznzEYGDDMRB02+9T4+rAU6NtGmGKB7
	 1wUCcBSioDz7qQ7TKTwKPBnj03vt28l9sRlsKMfE4LMVGfB5YgPN/Mcap1SsUE/0Ow
	 3ZSgqYlwwJOgagM6EaZ2vl2nEMx+QhuF1nEii8EW1ciQKRrSJbfoW7E9X0LxYiowLM
	 ufI9q+7OLCkruEkg2sgiTM9zBVUQfji2Uzd6UUIob6ktkCCq24iD6d9bS0567AMTbX
	 N4AyKz46cnnLzRHe84gx2Y0ZOJeJaLENxMTUeQPNmT9iXazAM22P3A2Y2B4Uj8dRu5
	 v9UNUaDXwhDBA==
Date: Fri, 18 Apr 2025 17:19:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/4] xen/arm: add support for PCI child bus
In-Reply-To: <24a9ed02f049d3187a14a0c0ad847ff97d346b79.1744203405.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504181705510.785180@ubuntu-linux-20-04-desktop>
References: <cover.1744203405.git.mykyta_poturai@epam.com> <24a9ed02f049d3187a14a0c0ad847ff97d346b79.1744203405.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges often have different ways to access the root and child
> bus configuration spaces. One of the examples is Designware's host bridge
> and its multiple clones [1].
> 
> Linux kernel implements this by instantiating a child bus when device
> drivers provide not only the usual pci_ops to access ECAM space (this is
> the case for the generic host bridge), but also means to access the child
> bus which has a dedicated configuration space and own implementation for
> accessing the bus, e.g. child_ops.
> 
> For Xen it is not feasible to fully implement PCI bus infrastructure as
> Linux kernel does, but still child bus can be supported.
> 
> Add support for the PCI child bus which includes the following changes:
> - introduce bus mapping functions depending on SBDF
> - assign bus start and end for the child bus and re-configure the same for
>   the parent (root) bus
> - make pci_find_host_bridge be aware of multiple busses behind the same bridge
> - update pci_host_bridge_mappings, so it also doesn't map to guest the memory
>   spaces belonging to the child bus
> - make pci_host_common_probe accept one more pci_ops structure for the child bus
> - install MMIO handlers for the child bus
> - re-work vpci_mmio_{write|read} with parent and child approach in mind
> 
> [1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dwc
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v2->v3:
> * no change
> 
> v1->v2:
> * fixed compilation issues
> ---
>  xen/arch/arm/include/asm/pci.h      | 12 +++-
>  xen/arch/arm/pci/ecam.c             | 17 ++++--
>  xen/arch/arm/pci/pci-access.c       | 37 +++++++++++--
>  xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++++------
>  xen/arch/arm/pci/pci-host-generic.c |  2 +-
>  xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
>  xen/arch/arm/vpci.c                 | 83 ++++++++++++++++++++++------
>  7 files changed, 192 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 3d2ca9b5b0..addec31791 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -67,6 +67,9 @@ struct pci_host_bridge {
>      uint16_t segment;                /* Segment number */
>      struct pci_config_window* cfg;   /* Pointer to the bridge config window */
>      const struct pci_ops *ops;
> +    /* Child bus */
> +    struct pci_config_window *child_cfg;
> +    const struct pci_ops *child_ops;
>      void *priv;                      /* Private data of the bridge. */
>  };
>  
> @@ -96,14 +99,19 @@ struct pci_ecam_ops {
>  /* Default ECAM ops */
>  extern const struct pci_ecam_ops pci_generic_ecam_ops;
>  
> -struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> -                                              const struct pci_ecam_ops *ops);
> +struct pci_host_bridge *
> +pci_host_common_probe(struct dt_device_node *dev,
> +                      const struct pci_ecam_ops *ops,
> +                      const struct pci_ecam_ops *child_ops);
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value);
>  int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t value);
>  void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                 pci_sbdf_t sbdf, uint32_t where);
> +void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg,
> +                                       const struct pci_ecam_ops *ops,
> +                                       pci_sbdf_t sbdf, uint32_t where);
>  bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
>                                       struct pci_host_bridge *bridge,
>                                       uint64_t addr);
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 3987f96b01..ad0b2c35f9 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -20,12 +20,10 @@
>  /*
>   * Function to implement the pci_ops->map_bus method.
>   */
> -void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> -                               pci_sbdf_t sbdf, uint32_t where)
> +void __iomem *pci_ecam_map_bus_generic(const struct pci_config_window *cfg,
> +                                       const struct pci_ecam_ops *ops,
> +                                       pci_sbdf_t sbdf, uint32_t where)
>  {
> -    const struct pci_config_window *cfg = bridge->cfg;
> -    const struct pci_ecam_ops *ops =
> -        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>      unsigned int devfn_shift = ops->bus_shift - 8;
>      void __iomem *base;
>      unsigned int busn = sbdf.bus;
> @@ -39,6 +37,15 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>      return base + (sbdf.devfn << devfn_shift) + where;
>  }
>  
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                               uint32_t where)
> +{
> +    const struct pci_ecam_ops *ops =
> +        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
> +
> +    return pci_ecam_map_bus_generic(bridge->cfg, ops, sbdf, where);
> +}

It doesn't look like this change is necessary? It doesn't seem that
pci_ecam_map_bus_generic is used anywhere?


>  bool __init pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
>                                              struct pci_host_bridge *bridge,
>                                              uint64_t addr)
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index 9f9aac43d7..cc4787f2b5 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -18,10 +18,31 @@
>  #define INVALID_VALUE (~0U)
>  #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>  
> +static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
> +                                     pci_sbdf_t sbdf)
> +{
> +    if ( bridge->child_ops )
> +    {
> +        struct pci_config_window *cfg = bridge->child_cfg;
> +
> +        if ( (sbdf.bus >= cfg->busn_start) && (sbdf.bus <= cfg->busn_end) )
> +            return bridge->child_ops;
> +    }
> +    return bridge->ops;
> +}
> +
> +static void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                             uint32_t reg)

NIT: I would do static inline here


> +{
> +    const struct pci_ops *ops = get_ops(bridge, sbdf);
> +
> +    return ops->map_bus(bridge, sbdf, reg);
> +}
> +
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value)
>  {
> -    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +    void __iomem *addr = map_bus(bridge, sbdf, reg);
>  
>      if ( !addr )
>      {
> @@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>  int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t value)
>  {
> -    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +    void __iomem *addr = map_bus(bridge, sbdf, reg);
>  
>      if ( !addr )
>          return -ENODEV;
> @@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>  {
>      uint32_t val = PCI_ERR_VALUE(len);
>      struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +    const struct pci_ops *ops;
>  
>      if ( unlikely(!bridge) )
>          return val;
>  
> -    if ( unlikely(!bridge->ops->read) )
> +    ops = get_ops(bridge, sbdf);
> +    if ( unlikely(!ops->read) )
>          return val;
>  
> -    bridge->ops->read(bridge, sbdf, reg, len, &val);
> +    ops->read(bridge, sbdf, reg, len, &val);
>  
>      return val;
>  }
> @@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
>                               unsigned int len, uint32_t val)
>  {
>      struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +    const struct pci_ops *ops;
>  
>      if ( unlikely(!bridge) )
>          return;
>  
> -    if ( unlikely(!bridge->ops->write) )
> +    ops = get_ops(bridge, sbdf);
> +    if ( unlikely(!ops->write) )
>          return;
>  
> -    bridge->ops->write(bridge, sbdf, reg, len, val);
> +    ops->write(bridge, sbdf, reg, len, val);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 7ce9675551..2b058b5f5e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg)
>      xfree(cfg);
>  }
>  
> -static struct pci_config_window * __init
> -gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
> +static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
> +                                          struct pci_host_bridge *bridge,
> +                                          struct pci_config_window *cfg)
>  {
> -    int err, cfg_reg_idx;
>      u32 bus_range[2];
> -    paddr_t addr, size;
> -    struct pci_config_window *cfg;
> -
> -    cfg = xzalloc(struct pci_config_window);
> -    if ( !cfg )
> -        return NULL;
> +    int err;
>  
>      err = dt_property_read_u32_array(dev, "bus-range", bus_range,
>                                       ARRAY_SIZE(bus_range));
> @@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
>          if ( cfg->busn_end > cfg->busn_start + 0xff )
>              cfg->busn_end = cfg->busn_start + 0xff;
>      }
> +}
> +
> +static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev,
> +                                                struct pci_host_bridge *bridge,
> +                                                struct pci_config_window *cfg)
> +{
> +    cfg->busn_start = bridge->cfg->busn_start + 1;
> +    cfg->busn_end = bridge->cfg->busn_end;
> +    bridge->cfg->busn_end = bridge->cfg->busn_start;
> +
> +    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
> +           bridge->cfg->busn_start, bridge->cfg->busn_end);
> +}
> +
> +static struct pci_config_window *__init
> +gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
> +             const struct pci_ecam_ops *ops,
> +             void (*init_bus_range)(struct dt_device_node *dev,
> +                                    struct pci_host_bridge *bridge,
> +                                    struct pci_config_window *cfg))
> +{
> +    int err, cfg_reg_idx;
> +    paddr_t addr, size;
> +    struct pci_config_window *cfg;
> +
> +    cfg = xzalloc(struct pci_config_window);
> +    if ( !cfg )
> +        return NULL;
> +
> +    init_bus_range(dev, bridge, cfg);
>  
>      if ( ops->cfg_reg_index )
>      {
> @@ -208,8 +233,10 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> -struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> -                                              const struct pci_ecam_ops *ops)
> +struct pci_host_bridge *
> +pci_host_common_probe(struct dt_device_node *dev,
> +                      const struct pci_ecam_ops *ops,
> +                      const struct pci_ecam_ops *child_ops)
>  {
>      struct pci_host_bridge *bridge;
>      struct pci_config_window *cfg;
> @@ -224,7 +251,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
>          return ERR_PTR(-ENOMEM);
>  
>      /* Parse and map our Configuration Space windows */
> -    cfg = gen_pci_init(dev, ops);
> +    cfg = gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
>      if ( !cfg )
>      {
>          err = -ENOMEM;
> @@ -242,10 +269,29 @@ struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
>          BUG();
>      }
>      bridge->segment = domain;
> +
> +    if ( child_ops )
> +    {
> +        /* Parse and map child's Configuration Space windows */
> +        cfg = gen_pci_init(dev, bridge, child_ops,
> +                           gen_pci_init_bus_range_child);
> +        if ( !cfg )
> +        {
> +            err = -ENOMEM;
> +            goto err_child;
> +        }
> +
> +        bridge->child_cfg = cfg;
> +        bridge->child_ops = &child_ops->pci_ops;
> +    }
> +
>      pci_add_host_bridge(bridge);
>  
>      return bridge;
>  
> +err_child:
> +    xfree(bridge->cfg);
> +
>  err_exit:
>      xfree(bridge);
>  
> @@ -280,9 +326,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
>      {
>          if ( bridge->segment != segment )
>              continue;
> -        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_end) )
> -            continue;
> -        return bridge;
> +        if ( bridge->child_cfg && (bus >= bridge->child_cfg->busn_start) &&
> +             (bus <= bridge->child_cfg->busn_end) )
> +            return bridge;
> +        if ( (bus >= bridge->cfg->busn_start) &&
> +             (bus <= bridge->cfg->busn_end) )
> +            return bridge;
>      }
>  
>      return NULL;
> @@ -348,6 +397,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
>      {
>          const struct dt_device_node *dev = bridge->dt_node;
>          unsigned int i;
> +        bool need_mapping;
>  
>          for ( i = 0; i < dt_number_of_address(dev); i++ )
>          {
> @@ -363,7 +413,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
>                  return err;
>              }
>  
> -            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
> +            need_mapping = bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr);
> +            if ( need_mapping && bridge->child_ops )
> +                need_mapping =
> +                    bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, addr);

Is this because the child bus address range is always a subset of the
parent address range?

If not, we would need to check either of them independently (|| instead
of &&).


> +            if ( need_mapping )
>              {
>                  err = map_range_to_domain(dev, addr, size, &mr_data);
>                  if ( err )
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> index a6ffbda174..47cf144831 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pci_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
> +    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index a38f2e019e..75d1235aaf 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pcie_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
> +    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index b63a356bb4..468aee1db7 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -8,15 +8,17 @@
>  #include <asm/mmio.h>
>  
>  static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> -                                     paddr_t gpa)
> +                                     paddr_t gpa, bool use_root)
>  {
>      pci_sbdf_t sbdf;
>  
>      if ( bridge )
>      {
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> +        const struct pci_config_window *cfg = use_root ? bridge->cfg
> +                                                       : bridge->child_cfg;
> +        sbdf.sbdf = VPCI_ECAM_BDF(gpa - cfg->phys_addr);
>          sbdf.seg = bridge->segment;
> -        sbdf.bus += bridge->cfg->busn_start;
> +        sbdf.bus += cfg->busn_start;
>      }
>      else
>          sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> @@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
>      return sbdf;
>  }
>  
> -static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> -                          register_t *r, void *p)
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                          pci_sbdf_t sbdf)
>  {
> -    struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>      const unsigned int access_size = (1U << info->dabt.size) * 8;
>      const register_t invalid = GENMASK_ULL(access_size - 1, 0);
>      /* data is needed to prevent a pointer cast on 32bit */
> @@ -46,31 +46,78 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      return 0;
>  }
>  
> -static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> -                           register_t r, void *p)
> +static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                               void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, true);
> +
> +    return vpci_mmio_read(v, info, r, sbdf);
> +}
> +
> +static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
> +                                register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, false);
> +
> +    return vpci_mmio_read(v, info, r, sbdf);
> +}
>  
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info, register_t r,
> +                           pci_sbdf_t sbdf)
> +{
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
>  }
>  
> +static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info, register_t r,
> +                                void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, true);
> +
> +    return vpci_mmio_write(v, info, r, sbdf);
> +}
> +
> +static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
> +                                 register_t r, void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, false);
> +
> +    return vpci_mmio_write(v, info, r, sbdf);
> +}
> +
>  static const struct mmio_handler_ops vpci_mmio_handler = {
> -    .read  = vpci_mmio_read,
> -    .write = vpci_mmio_write,
> +    .read = vpci_mmio_read_root,
> +    .write = vpci_mmio_write_root,
> +};
> +
> +static const struct mmio_handler_ops vpci_mmio_handler_child = {
> +    .read = vpci_mmio_read_child,
> +    .write = vpci_mmio_write_child,
>  };
>  
>  static int vpci_setup_mmio_handler_cb(struct domain *d,
>                                        struct pci_host_bridge *bridge)
>  {
>      struct pci_config_window *cfg = bridge->cfg;
> +    int count = 1;
>  
>      register_mmio_handler(d, &vpci_mmio_handler,
>                            cfg->phys_addr, cfg->size, bridge);
>  
> -    /* We have registered a single MMIO handler. */
> -    return 1;
> +    if ( bridge->child_ops )
> +    {
> +        struct pci_config_window *cfg = bridge->child_cfg;
> +
> +        register_mmio_handler(d, &vpci_mmio_handler_child, cfg->phys_addr,
> +                              cfg->size, bridge);
> +        count++;
> +    }
> +
> +    return count;
>  }
>  
>  int domain_vpci_init(struct domain *d)
> @@ -101,8 +148,12 @@ int domain_vpci_init(struct domain *d)
>  static int vpci_get_num_handlers_cb(struct domain *d,
>                                      struct pci_host_bridge *bridge)
>  {
> -    /* Each bridge has a single MMIO handler for the configuration space. */
> -    return 1;
> +    int count = 1;
> +
> +    if ( bridge->child_cfg )
> +        count++;
> +
> +    return count;
>  }
>  
>  unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
> -- 
> 2.34.1
> 


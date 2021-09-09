Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65EF404954
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183009.330921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIHv-0002IU-Ce; Thu, 09 Sep 2021 11:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183009.330921; Thu, 09 Sep 2021 11:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIHv-0002GX-8s; Thu, 09 Sep 2021 11:32:15 +0000
Received: by outflank-mailman (input) for mailman id 183009;
 Thu, 09 Sep 2021 11:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOIHt-0002GJ-Qd
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOIHs-0004Q5-M1; Thu, 09 Sep 2021 11:32:12 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOIHs-0000OZ-FH; Thu, 09 Sep 2021 11:32:12 +0000
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
	bh=XntlN2THUrnynui6bflOC+jkjIzEk7ke1N2vacz9ij0=; b=L7orFDCheURfX+/amdo2gDN6Z+
	4/2X0JnVJQBcgZ09ec1VU3HiQHEltSFKUsKvSgPViw1buhExu4g1lAGkvV+bPPhpH/cM3OYL7XyKj
	CpLGSYtTPb8soFNRKRobDX4vVSOGp2iMILewZgHvJ8X/NtXDbBVdP0D10H8U9GrPRvHY=;
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7da2d5c-fdc0-d72c-789c-c6ba75412f3f@xen.org>
Date: Thu, 9 Sep 2021 12:32:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> Add support for PCI ecam operations to access the PCI
> configuration space.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/pci/Makefile           |  1 +
>   xen/arch/arm/pci/ecam.c             | 63 +++++++++++++++++++++++++++++
>   xen/arch/arm/pci/pci-access.c       | 53 ++++++++++++++++++++++++
>   xen/arch/arm/pci/pci-host-common.c  | 13 +++++-
>   xen/arch/arm/pci/pci-host-generic.c |  8 +++-
>   xen/include/asm-arm/pci.h           | 32 +++++++++++++++
>   6 files changed, 167 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/arm/pci/ecam.c
> 
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index f3d97f859e..6f32fbbe67 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -2,3 +2,4 @@ obj-y += pci.o
>   obj-y += pci-access.o
>   obj-y += pci-host-generic.o
>   obj-y += pci-host-common.o
> +obj-y += ecam.o
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> new file mode 100644
> index 0000000000..91c691b41f
> --- /dev/null
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -0,0 +1,63 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * Based on Linux drivers/pci/ecam.c
> + * Copyright 2016 Broadcom
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/pci.h>
> +#include <xen/sched.h>
> +
> +/*
> + * Function to implement the pci_ops ->map_bus method.
> + */
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                                      uint32_t sbdf, uint32_t where)
> +{
> +    const struct pci_config_window *cfg = bridge->sysdata;
> +    unsigned int devfn_shift = cfg->ops->bus_shift - 8;
> +    void __iomem *base;
> +
> +    pci_sbdf_t sbdf_t = (pci_sbdf_t) sbdf ;

AFAICT, pci_sbdf is an union between a 32-bit and a structure. So please 
don't use the cast and use the 32-bit field to assign the value.

Also, there is an extra space before ';'.

> +    unsigned int busn = sbdf_t.bus;
> +
> +    if ( busn < cfg->busn_start || busn > cfg->busn_end )
> +        return NULL;
> +
> +    busn -= cfg->busn_start;
> +    base = cfg->win + (busn << cfg->ops->bus_shift);
> +
> +    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;

How about using PCI_DEVFN2(sbdf)? This would allow you to drop the use 
of sbdf_t completely (sbdf_t.bus could be replaced with PCI_BUS(sdbf)).

> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops pci_generic_ecam_ops = {
> +    .bus_shift  = 20,
> +    .pci_ops    = {
> +        .map_bus                = pci_ecam_map_bus,
> +        .read                   = pci_generic_config_read,
> +        .write                  = pci_generic_config_write,
> +    }
> +};
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index b938047c03..f39f6a3a38 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -15,6 +15,59 @@
>    */
>   
>   #include <xen/pci.h>
> +#include <asm/io.h>
> +
> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t *value)
> +{
> +    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);

Please add a newline here.

> +    if (!addr) {

You seem to use a mix of Xen and Linux coding style. If the file 
contains mostly Xen code, then we should use the former.

> +        *value = ~0;
> +        return -ENODEV;
> +    }
> +
> +    switch (len)
> +    {
> +    case 1:
> +        *value = readb(addr);
> +        break;
> +    case 2:
> +        *value = readw(addr);
> +        break;
> +    case 4:
> +        *value = readl(addr);
> +        break;
> +    default:
> +        BUG();
> +    }
> +
> +    return 0;
> +}
> +
> +int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t value)
> +{
> +    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +    if (!addr)
> +        return -ENODEV;
> +
> +    switch (len)
> +    {
> +    case 1:
> +        writeb(value, addr);
> +        break;
> +    case 2:
> +        writew(value, addr);
> +        break;
> +    case 4:
> +        writel(value, addr);
> +        break;
> +    default:
> +        BUG();
> +    }
> +
> +    return 0;
> +}
>   
>   static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>                                   unsigned int len)
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 9dd9b02271..c582527e92 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -68,6 +68,7 @@ static void pci_ecam_free(struct pci_config_window *cfg)
>   }
>   
>   static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
> +                                              const struct pci_ecam_ops *ops,
>                                                 int ecam_reg_idx)
>   {
>       int err;
> @@ -96,6 +97,7 @@ static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
>   
>       cfg->phys_addr = addr;
>       cfg->size = size;
> +    cfg->ops = ops;
>   
>       /*
>        * On 64-bit systems, we do a single ioremap for the whole config space
> @@ -111,6 +113,13 @@ static struct pci_config_window *gen_pci_init(struct dt_device_node *dev,
>       printk("ECAM at [mem %lx-%lx] for [bus %x-%x] \n",cfg->phys_addr,
>               cfg->phys_addr + cfg->size - 1, cfg->busn_start, cfg->busn_end);
>   
> +    if ( ops->init )
> +    {
> +        err = ops->init(cfg);
> +        if (err)
> +            goto err_exit;
> +    }
> +
>       return cfg;
>   
>   err_exit_remap:
> @@ -216,6 +225,7 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>   }
>   
>   int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops,
>                             int ecam_reg_idx)
>   {
>       struct pci_host_bridge *bridge;
> @@ -227,7 +237,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
>           return -ENOMEM;
>   
>       /* Parse and map our Configuration Space windows */
> -    cfg = gen_pci_init(dev, ecam_reg_idx);
> +    cfg = gen_pci_init(dev, ops, ecam_reg_idx);
>       if ( !cfg )
>       {
>           err = -ENOMEM;
> @@ -236,6 +246,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
>   
>       bridge->dt_node = dev;
>       bridge->sysdata = cfg;
> +    bridge->ops = &ops->pci_ops;
>       bridge->bus_start = cfg->busn_start;
>       bridge->bus_end = cfg->busn_end;
>   
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> index 13d0f7f999..2d652e8910 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -23,20 +23,24 @@
>   #include <asm/pci.h>
>   
>   static const struct dt_device_match gen_pci_dt_match[] = {
> -    { .compatible = "pci-host-ecam-generic" },
> +    { .compatible = "pci-host-ecam-generic",
> +      .data =       &pci_generic_ecam_ops },
> +
>       { },
>   };
>   
>   static int gen_pci_dt_init(struct dt_device_node *dev, const void *data)
>   {
>       const struct dt_device_match *of_id;
> +    const struct pci_ecam_ops *ops;
>   
>       of_id = dt_match_node(gen_pci_dt_match, dev->dev.of_node);
> +    ops = (struct pci_ecam_ops *) of_id->data;
>   
>       printk(XENLOG_INFO "Found PCI host bridge %s compatible:%s \n",
>              dt_node_full_name(dev), of_id->compatible);
>   
> -    return pci_host_common_probe(dev, 0);
> +    return pci_host_common_probe(dev, ops, 0);
>   }
>   
>   DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 58a51e724e..22866244d2 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -37,6 +37,7 @@ struct pci_config_window {
>       uint8_t         busn_start;
>       uint8_t         busn_end;
>       void __iomem    *win;
> +    const struct    pci_ecam_ops *ops;
>   };
>   
>   /*
> @@ -50,10 +51,41 @@ struct pci_host_bridge {
>       u8 bus_start;                    /* Bus start of this bridge. */
>       u8 bus_end;                      /* Bus end of this bridge. */
>       void *sysdata;                   /* Pointer to the config space window*/
> +    const struct pci_ops *ops;
>   };
>   
> +struct pci_ops {
> +    void __iomem *(*map_bus)(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                             uint32_t offset);
> +    int (*read)(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                uint32_t reg, uint32_t len, uint32_t *value);
> +    int (*write)(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                 uint32_t reg, uint32_t len, uint32_t value);
> +};
> +
> +/*
> + * struct to hold pci ops and bus shift of the config window
> + * for a PCI controller.
> + */
> +struct pci_ecam_ops {
> +    unsigned int            bus_shift;
> +    struct pci_ops          pci_ops;
> +    int (*init)(struct pci_config_window *);
> +};
> +
> +/* Default ECAM ops */
> +extern const struct pci_ecam_ops pci_generic_ecam_ops;
> +
>   int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops,
>                             int ecam_reg_idx);
> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t *value);
> +int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> +                            uint32_t reg, uint32_t len, uint32_t value);
> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
> +                               uint32_t sbdf, uint32_t where);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> 

Cheers,

-- 
Julien Grall


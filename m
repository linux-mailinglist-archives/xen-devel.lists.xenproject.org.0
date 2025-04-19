Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18FA94094
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 02:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959692.1352007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vwJ-00020b-7n; Sat, 19 Apr 2025 00:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959692.1352007; Sat, 19 Apr 2025 00:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vwJ-0001xE-4f; Sat, 19 Apr 2025 00:20:11 +0000
Received: by outflank-mailman (input) for mailman id 959692;
 Sat, 19 Apr 2025 00:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5vwI-0000Vo-60
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 00:20:10 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cd2985e-1cb4-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 02:20:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6FF6446C1;
 Sat, 19 Apr 2025 00:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E751BC4CEE2;
 Sat, 19 Apr 2025 00:20:06 +0000 (UTC)
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
X-Inumbo-ID: 0cd2985e-1cb4-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745022007;
	bh=CF+odxzWcg7zsi28Vur77a/FcO+EiHs3jYiVHS7CUb0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lcezpP5v6CLW0aO9JA5/3y2ZSC8Cm5ZU+TpjLERDTeLBAmv4UmYuEL5+GUI6YANR1
	 6vXzfqqGT+PE+WOKnyMIb2Jm0zxscHotlohV5/mhzPveouRUYO1wWhaTWs9z/Ev6uq
	 2TkfRn7Q32CCTsl4TO9Kx+GGpX//SY+HG4dCkrip9JtctjKht5llFeykEZ4hZ4pC70
	 6Zo3MhsC9B199lnHWDcGKe5WQ30rlSBRiqsu2XXDEBLXMY+DUt8xg0NPx0ZqSDDbej
	 rBS0+Xw2zfdwDvZM4EdRjJ4CG82M0+j7G9HkrTTOTWrujvwaVG//T/QEcM4pDPAxpX
	 smxGv/xuTUMLQ==
Date: Fri, 18 Apr 2025 17:20:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/4] xen/arm: make pci_host_common_probe return the
 bridge
In-Reply-To: <0abee55bcc632ba1be356461e22eca2ceb11dadd.1744203405.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504181649010.785180@ubuntu-linux-20-04-desktop>
References: <cover.1744203405.git.mykyta_poturai@epam.com> <0abee55bcc632ba1be356461e22eca2ceb11dadd.1744203405.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Some of the PCI host bridges require additional processing during the
> probe phase. For that they need to access struct bridge of the probed
> host, so return pointer to the new bridge from pci_host_common_probe.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> ---
>  xen/arch/arm/include/asm/pci.h      |  5 +++--
>  xen/arch/arm/pci/pci-host-common.c  | 10 +++++-----
>  xen/arch/arm/pci/pci-host-generic.c |  2 +-
>  xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
>  4 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index a87672d834..3d2ca9b5b0 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -18,6 +18,7 @@
>  #ifdef CONFIG_HAS_PCI
>  
>  #include <asm/p2m.h>
> +#include <xen/err.h>
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
> @@ -95,8 +96,8 @@ struct pci_ecam_ops {
>  /* Default ECAM ops */
>  extern const struct pci_ecam_ops pci_generic_ecam_ops;
>  
> -int pci_host_common_probe(struct dt_device_node *dev,
> -                          const struct pci_ecam_ops *ops);
> +struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> +                                              const struct pci_ecam_ops *ops);
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value);
>  int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index c0faf0f436..7ce9675551 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -208,8 +208,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> -int pci_host_common_probe(struct dt_device_node *dev,
> -                          const struct pci_ecam_ops *ops)
> +struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> +                                              const struct pci_ecam_ops *ops)
>  {
>      struct pci_host_bridge *bridge;
>      struct pci_config_window *cfg;
> @@ -221,7 +221,7 @@ int pci_host_common_probe(struct dt_device_node *dev,
>  
>      bridge = pci_alloc_host_bridge();
>      if ( !bridge )
> -        return -ENOMEM;
> +        return ERR_PTR(-ENOMEM);

There is a return 0 just above that needs to be changed to return NULL.


>      /* Parse and map our Configuration Space windows */
>      cfg = gen_pci_init(dev, ops);
> @@ -244,12 +244,12 @@ int pci_host_common_probe(struct dt_device_node *dev,
>      bridge->segment = domain;
>      pci_add_host_bridge(bridge);
>  
> -    return 0;
> +    return bridge;
>  
>  err_exit:
>      xfree(bridge);
>  
> -    return err;
> +    return ERR_PTR(err);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> index 46de6e43cc..a6ffbda174 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pci_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
> +    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index 101edb8593..a38f2e019e 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pcie_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return pci_host_common_probe(dev, &nwl_pcie_ops);
> +    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
> -- 
> 2.34.1
> 


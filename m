Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B13941E584
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200298.354777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6PF-0006jI-Lu; Fri, 01 Oct 2021 00:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200298.354777; Fri, 01 Oct 2021 00:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6PF-0006hC-Iv; Fri, 01 Oct 2021 00:28:05 +0000
Received: by outflank-mailman (input) for mailman id 200298;
 Fri, 01 Oct 2021 00:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6PD-0006h6-Jz
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:28:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f68a826-224e-11ec-bd77-12813bfff9fa;
 Fri, 01 Oct 2021 00:28:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B524E61A52;
 Fri,  1 Oct 2021 00:28:00 +0000 (UTC)
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
X-Inumbo-ID: 6f68a826-224e-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048081;
	bh=Gca05auYLtYsux7FG9M8AgPP+KNgsckUybc/bkiYwuk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dRYz4/cCKgU9EwApsJCbyIXKtAWKsYlIWUr8sCnYiVGh3RB7KpCWfRmudDjHxLcrm
	 rebdlciIo2Ki3KL3e/bSf2ajNNEgYgonfZgpEp2j6P0q3bxSEVKhnwPuMOZwlAsCjk
	 FWznVlXau++BHlUoBCZhihQk/GE/joXKXEfb4WIdpERNXHiVU6TIrp1dS+omH4EKA1
	 iEmg0+qQc7XyUlWEy83473S1VUUDkclc33ccgrdv3yf7wql/U6/1WEGizjqRBHtlRY
	 AyjmGh6ra5DgvBkhG5oQ/Wwz9/lloaHXa8//Z+DeRUPjAspXDRybdDMtpgPmhxniNp
	 kyfFe+RnyUyuw==
Date: Thu, 30 Sep 2021 17:27:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 02/11] xen/arm: Add new device type for PCI
In-Reply-To: <20210930071326.857390-3-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301727510.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-3-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add new device type (DEV_PCI) to distinguish PCI devices from platform
> DT devices, so some drivers, like IOMMU, can handle PCI devices
> differently.
> 
> Also add a helper which is when given a struct device returns the
> corresponding struct pci_dev which this device is a part of.
> 
> Because of the header cross-dependencies, e.g. we need both
> struct pci_dev and struct arch_pci_dev at the same time, this cannot be
> done with an inline.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v2:
>  - !! dropped Stefano's r-b because of the changes
>  - simplified dev_to_pci to use a single
>    container_of(dev, struct pci_dev, arch.dev) (Jan)
> Since v1:
>  - Folded new device type (DEV_PCI) into this patch.
> ---
>  xen/arch/arm/pci/pci.c       | 7 +++++++
>  xen/include/asm-arm/device.h | 4 ++--
>  xen/include/asm-arm/pci.h    | 7 +++++++
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 84d8f0d63430..9fc522e566a9 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -27,6 +27,13 @@ int arch_pci_clean_pirqs(struct domain *d)
>      return 0;
>  }
>  
> +struct pci_dev *dev_to_pci(struct device *dev)
> +{
> +    ASSERT(dev->type == DEV_PCI);
> +
> +    return container_of(dev, struct pci_dev, arch.dev);
> +}
> +
>  static int __init dt_pci_init(void)
>  {
>      struct dt_device_node *np;
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ebe84ea853cd..7bf040560363 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -4,6 +4,7 @@
>  enum device_type
>  {
>      DEV_DT,
> +    DEV_PCI,
>  };
>  
>  struct dev_archdata {
> @@ -25,8 +26,7 @@ typedef struct device device_t;
>  
>  #include <xen/device_tree.h>
>  
> -/* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
> -#define dev_is_pci(dev) ((void)(dev), 0)
> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
>  #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
>  
>  enum device_class
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7cb2e2f1edaf..603a1fc072d1 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -26,6 +26,13 @@ struct arch_pci_dev {
>      struct device dev;
>  };
>  
> +/*
> + * Because of the header cross-dependencies, e.g. we need both
> + * struct pci_dev and struct arch_pci_dev at the same time, this cannot be
> + * done with an inline here. Macro can be implemented, but looks scary.
> + */
> +struct pci_dev *dev_to_pci(struct device *dev);
> +
>  /* Arch-specific MSI data for vPCI. */
>  struct vpci_arch_msi {
>  };
> -- 
> 2.25.1
> 


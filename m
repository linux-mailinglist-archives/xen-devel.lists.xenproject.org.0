Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B194417E63
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195700.348514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTusQ-0004Gs-LG; Fri, 24 Sep 2021 23:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195700.348514; Fri, 24 Sep 2021 23:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTusQ-0004Et-I9; Fri, 24 Sep 2021 23:45:10 +0000
Received: by outflank-mailman (input) for mailman id 195700;
 Fri, 24 Sep 2021 23:45:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTusP-0004En-Oo
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:45:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21594702-b5bb-4bde-a12f-01b07b41f5d6;
 Fri, 24 Sep 2021 23:45:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D52D61241;
 Fri, 24 Sep 2021 23:45:07 +0000 (UTC)
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
X-Inumbo-ID: 21594702-b5bb-4bde-a12f-01b07b41f5d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632527108;
	bh=1/4uNqIKIYjFRwLoc6ioYZaaOj/bA3bYP21j38ZPscc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rVXaVb6n4tOgPbXUqRilqePXkwq7ed0IgVVfUm0RmR1+ff95xFGUUQ/EamtYHy1RP
	 JdjEUtO/cAJ6Q/bsoKJKA3KHmfTUwCoq9QKD72/gTBDmCLGJ7eCQSug7VFqDXXqJbi
	 OnYJz+WemUjE1YBfu/F4AslOm6WNBk2J/OvcRLZq1rZYMbrC/6ts7njGVKm6qYA0Xm
	 iLnEUikdaG4JThvTWAxzhhnmtFI0CSjN/E0+8lpjqh2VAnmxJl0GaFGxIZ2lvy3R7Q
	 epBpU5KqR+pMxpIV+WNH6P3d8mBlY7Qk2LZCBbyOhVLDdK/5acEgInGYZ/NQaDA0i5
	 BZf9/NYwfKyyA==
Date: Fri, 24 Sep 2021 16:45:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2 02/11] xen/arm: Add new device type for PCI
In-Reply-To: <20210923125438.234162-3-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241644570.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-3-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
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
> done with an inline. Macro can be implemented, but looks scary:
> 
>  #define dev_to_pci_dev(dev) container_of((container_of((dev), \
>                         struct arch_pci_dev, dev), struct pci_dev, arch)
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v1:
>  - Folded new device type (DEV_PCI) into this patch.
> ---
>  xen/arch/arm/pci/pci.c       | 10 ++++++++++
>  xen/include/asm-arm/device.h |  4 ++--
>  xen/include/asm-arm/pci.h    |  7 +++++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index bb15edbccc90..e0420d0d86c1 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -27,6 +27,16 @@ int arch_pci_clean_pirqs(struct domain *d)
>      return 0;
>  }
>  
> +struct pci_dev *dev_to_pci(struct device *dev)
> +{
> +    struct arch_pci_dev *arch_dev;
> +
> +    ASSERT(dev->type == DEV_PCI);
> +
> +    arch_dev = container_of((dev), struct arch_pci_dev, dev);
> +    return container_of(arch_dev, struct pci_dev, arch);
> +}
> +
>  static int __init dt_pci_init(void)
>  {
>      struct dt_device_node *np;
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index 64aaa2641b7f..12de217b36b9 100644
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
> @@ -27,8 +28,7 @@ typedef struct device device_t;
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
> index d2728a098a11..9e366ae67e83 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -27,6 +27,13 @@ struct arch_pci_dev {
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


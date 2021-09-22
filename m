Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA81415266
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193068.343891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9Sp-00021O-I5; Wed, 22 Sep 2021 21:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193068.343891; Wed, 22 Sep 2021 21:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9Sp-0001zG-Es; Wed, 22 Sep 2021 21:07:35 +0000
Received: by outflank-mailman (input) for mailman id 193068;
 Wed, 22 Sep 2021 21:07:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mT9Sn-0001z8-Lu
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:07:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fa4c250-6a28-44b9-b56b-06bba0762063;
 Wed, 22 Sep 2021 21:07:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6176E61181;
 Wed, 22 Sep 2021 21:07:31 +0000 (UTC)
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
X-Inumbo-ID: 5fa4c250-6a28-44b9-b56b-06bba0762063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632344851;
	bh=eXOu4o+FdOvYQrid4uHWIpYoP9Oa7kdMSkJBRAzCLHU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KrrP4ZbKbpX55zielSusOiQ2amnZFHotkrQlzxiYJMmLa1R2TmGk121wGGiBUnlk7
	 4wMVKG8srp/Rw+7+xtQ9bAHvL7usqNQt1j49medB0nsViPfSZzYGBxXuhEcKiUKtO+
	 8iPYVBS+JW9uUfQVZLv2zTykLGywumGao06c+mddGISdmWYYg7nC4cSuaA0WTXsM1Z
	 EPGTaV4jmau27UyLd36q1Hui5qgg1kKI1AyOdbTp7QeGF9VLg5f1rKkSCTsE8Uia1R
	 PcjBUqtIrFOYr4hQNG2BuR1maJQcv4jQtyuJhvnMoVOaFkxX9P7Ot5CDto8rsBU994
	 PQcer9ja4+4Dg==
Date: Wed, 22 Sep 2021 14:07:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org, 
    sstabellini@kernel.org, jbeulich@suse.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: Re: [PATCH 1/2] xen-pciback: allow compiling on other archs than
 x86
In-Reply-To: <20210922101422.2319240-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109221406560.17979@sstabellini-ThinkPad-T480s>
References: <20210922101422.2319240-1-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
> Re-structure the driver in a way that it can be built for other
> platforms as well.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>

This patch looks good to me but I would prefer if it came after the
other patch, not before.


> ---
> Since v1:
>  - Do not move pci_xen_initial_domain as it is x86 specific
> ---
>  arch/x86/include/asm/xen/pci.h     | 18 +------
>  arch/x86/pci/xen.c                 | 74 +----------------------------
>  drivers/xen/Kconfig                |  2 +-
>  drivers/xen/pci.c                  | 75 ++++++++++++++++++++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c |  3 +-
>  drivers/xen/xen-pciback/xenbus.c   |  2 +-
>  include/xen/pci.h                  | 28 +++++++++++
>  7 files changed, 109 insertions(+), 93 deletions(-)
>  create mode 100644 include/xen/pci.h
> 
> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
> index 3506d8c598c1..2889f091f459 100644
> --- a/arch/x86/include/asm/xen/pci.h
> +++ b/arch/x86/include/asm/xen/pci.h
> @@ -16,26 +16,10 @@ static inline int pci_xen_hvm_init(void)
>  #endif
>  #if defined(CONFIG_XEN_DOM0)
>  int __init pci_xen_initial_domain(void);
> -int xen_find_device_domain_owner(struct pci_dev *dev);
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> -int xen_unregister_device_domain_owner(struct pci_dev *dev);
>  #else
>  static inline int __init pci_xen_initial_domain(void)
>  {
> -	return -1;
> -}
> -static inline int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	return -1;
> -}
> -static inline int xen_register_device_domain_owner(struct pci_dev *dev,
> -						   uint16_t domain)
> -{
> -	return -1;
> -}
> -static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
> -{
> -	return -1;
> +       return -1;
>  }
>  #endif
>  
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 3d41a09c2c14..4a45b0bf9ae4 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -23,6 +23,7 @@
>  
>  #include <xen/features.h>
>  #include <xen/events.h>
> +#include <xen/pci.h>
>  #include <asm/xen/pci.h>
>  #include <asm/xen/cpuid.h>
>  #include <asm/apic.h>
> @@ -583,77 +584,4 @@ int __init pci_xen_initial_domain(void)
>  	}
>  	return 0;
>  }
> -
> -struct xen_device_domain_owner {
> -	domid_t domain;
> -	struct pci_dev *dev;
> -	struct list_head list;
> -};
> -
> -static DEFINE_SPINLOCK(dev_domain_list_spinlock);
> -static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
> -
> -static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	list_for_each_entry(owner, &dev_domain_list, list) {
> -		if (owner->dev == dev)
> -			return owner;
> -	}
> -	return NULL;
> -}
> -
> -int xen_find_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -	int domain = -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner = find_device(dev);
> -	if (owner)
> -		domain = owner->domain;
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return domain;
> -}
> -EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
> -
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
> -	if (!owner)
> -		return -ENODEV;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	if (find_device(dev)) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		kfree(owner);
> -		return -EEXIST;
> -	}
> -	owner->domain = domain;
> -	owner->dev = dev;
> -	list_add_tail(&owner->list, &dev_domain_list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
> -
> -int xen_unregister_device_domain_owner(struct pci_dev *dev)
> -{
> -	struct xen_device_domain_owner *owner;
> -
> -	spin_lock(&dev_domain_list_spinlock);
> -	owner = find_device(dev);
> -	if (!owner) {
> -		spin_unlock(&dev_domain_list_spinlock);
> -		return -ENODEV;
> -	}
> -	list_del(&owner->list);
> -	spin_unlock(&dev_domain_list_spinlock);
> -	kfree(owner);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
>  #endif
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a37eb52fb401..057ddf61ef61 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -182,7 +182,7 @@ config SWIOTLB_XEN
>  
>  config XEN_PCIDEV_BACKEND
>  	tristate "Xen PCI-device backend driver"
> -	depends on PCI && X86 && XEN
> +	depends on PCI && XEN
>  	depends on XEN_BACKEND
>  	default m
>  	help
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 224df03ce42e..fc8c1249d49f 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -254,3 +254,78 @@ static int xen_mcfg_late(void)
>  	return 0;
>  }
>  #endif
> +
> +#ifdef CONFIG_XEN_DOM0
> +struct xen_device_domain_owner {
> +	domid_t domain;
> +	struct pci_dev *dev;
> +	struct list_head list;
> +};
> +
> +static DEFINE_SPINLOCK(dev_domain_list_spinlock);
> +static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
> +
> +static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	list_for_each_entry(owner, &dev_domain_list, list) {
> +		if (owner->dev == dev)
> +			return owner;
> +	}
> +	return NULL;
> +}
> +
> +int xen_find_device_domain_owner(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +	int domain = -ENODEV;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	owner = find_device(dev);
> +	if (owner)
> +		domain = owner->domain;
> +	spin_unlock(&dev_domain_list_spinlock);
> +	return domain;
> +}
> +EXPORT_SYMBOL_GPL(xen_find_device_domain_owner);
> +
> +int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	owner = kzalloc(sizeof(struct xen_device_domain_owner), GFP_KERNEL);
> +	if (!owner)
> +		return -ENODEV;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	if (find_device(dev)) {
> +		spin_unlock(&dev_domain_list_spinlock);
> +		kfree(owner);
> +		return -EEXIST;
> +	}
> +	owner->domain = domain;
> +	owner->dev = dev;
> +	list_add_tail(&owner->list, &dev_domain_list);
> +	spin_unlock(&dev_domain_list_spinlock);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_register_device_domain_owner);
> +
> +int xen_unregister_device_domain_owner(struct pci_dev *dev)
> +{
> +	struct xen_device_domain_owner *owner;
> +
> +	spin_lock(&dev_domain_list_spinlock);
> +	owner = find_device(dev);
> +	if (!owner) {
> +		spin_unlock(&dev_domain_list_spinlock);
> +		return -ENODEV;
> +	}
> +	list_del(&owner->list);
> +	spin_unlock(&dev_domain_list_spinlock);
> +	kfree(owner);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xen_unregister_device_domain_owner);
> +#endif
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index f8e4faa96ad6..bba527620507 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -19,7 +19,8 @@
>  #include <linux/sched.h>
>  #include <linux/atomic.h>
>  #include <xen/events.h>
> -#include <asm/xen/pci.h>
> +#include <xen/pci.h>
> +#include <xen/xen.h>
>  #include <asm/xen/hypervisor.h>
>  #include <xen/interface/physdev.h>
>  #include "pciback.h"
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index c09c7ebd6968..da34ce85dc88 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -14,7 +14,7 @@
>  #include <linux/workqueue.h>
>  #include <xen/xenbus.h>
>  #include <xen/events.h>
> -#include <asm/xen/pci.h>
> +#include <xen/pci.h>
>  #include "pciback.h"
>  
>  #define INVALID_EVTCHN_IRQ  (-1)
> diff --git a/include/xen/pci.h b/include/xen/pci.h
> new file mode 100644
> index 000000000000..b8337cf85fd1
> --- /dev/null
> +++ b/include/xen/pci.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __XEN_PCI_H__
> +#define __XEN_PCI_H__
> +
> +#if defined(CONFIG_XEN_DOM0)
> +int xen_find_device_domain_owner(struct pci_dev *dev);
> +int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> +int xen_unregister_device_domain_owner(struct pci_dev *dev);
> +#else
> +static inline int xen_find_device_domain_owner(struct pci_dev *dev)
> +{
> +	return -1;
> +}
> +
> +static inline int xen_register_device_domain_owner(struct pci_dev *dev,
> +						   uint16_t domain)
> +{
> +	return -1;
> +}
> +
> +static inline int xen_unregister_device_domain_owner(struct pci_dev *dev)
> +{
> +	return -1;
> +}
> +#endif
> +
> +#endif
> -- 
> 2.25.1
> 


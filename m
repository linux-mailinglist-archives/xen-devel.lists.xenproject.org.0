Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2F4100E2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 23:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189722.339580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRLgJ-0008Vx-0y; Fri, 17 Sep 2021 21:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189722.339580; Fri, 17 Sep 2021 21:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRLgI-0008U3-Tu; Fri, 17 Sep 2021 21:46:02 +0000
Received: by outflank-mailman (input) for mailman id 189722;
 Fri, 17 Sep 2021 21:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRLgH-0008Tx-D4
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 21:46:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26aef2be-12a2-4668-b355-21e255aa3902;
 Fri, 17 Sep 2021 21:45:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1A40611C8;
 Fri, 17 Sep 2021 21:45:58 +0000 (UTC)
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
X-Inumbo-ID: 26aef2be-12a2-4668-b355-21e255aa3902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631915159;
	bh=7zTdpYwxjmexKAmPlX9fm8wT3BGL0kUjqkGEgiCkz2A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JYBPmjC1/cm/1ZRV7m+XQZIoo05Pb3QqclDN0TyOw9e2fNEV6IjDlBvOe404d0X8f
	 zM/coSleUt5aSXgI+e2Z98BRDCk1qL6hErbequ4v5gbrYr0ESLz4VjjWFeoZZVyduH
	 7whR6SCh0Ayp27B3YueWVUJEsyhf3kvV3bYyPOXvlVaQZEqTJOd/TS7dpPOOYkA9lB
	 Do+pOaPWQFvmL8tJdsU/f44VoAiTz0GBY4ZRk17EKVqwAe+jPFi7HZ1JvGYg0XliU2
	 lOlbVvNpV9nPsPkO8c3rY3YjeLtIHlDhdLEvW8uCHPjTwFiGpAxVbF8+u6PHxTCN5R
	 8/9+jDzQ9GUIw==
Date: Fri, 17 Sep 2021 14:45:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org, 
    sstabellini@kernel.org, jbeulich@suse.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
In-Reply-To: <20210917130123.1764493-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
References: <20210917130123.1764493-1-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksandr,

Why do you want to enable pciback on ARM? Is it only to "disable" a PCI
device in Dom0 so that it can be safely assigned to a DomU?

I am asking because actually I don't think we want to enable the PV PCI
backend feature of pciback on ARM, right? That would clash with the PCI
assignment work you have been doing in Xen. They couldn't both work at
the same time.

If we only need pciback to "park" a device in Dom0, wouldn't it be
possible and better to use pci-stub instead?


On Fri, 17 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
> Re-structure the driver in a way that it can be built for other
> platforms as well.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> 
> ---
> Tested on Arm and x86.
> ---
>  arch/x86/include/asm/xen/pci.h     | 24 ----------
>  arch/x86/pci/xen.c                 | 74 +----------------------------
>  drivers/xen/Kconfig                |  2 +-
>  drivers/xen/events/events_base.c   |  1 +
>  drivers/xen/pci.c                  | 75 ++++++++++++++++++++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c |  3 +-
>  drivers/xen/xen-pciback/xenbus.c   |  2 +-
>  include/xen/pci.h                  | 34 ++++++++++++++
>  8 files changed, 115 insertions(+), 100 deletions(-)
>  create mode 100644 include/xen/pci.h
> 
> diff --git a/arch/x86/include/asm/xen/pci.h b/arch/x86/include/asm/xen/pci.h
> index 3506d8c598c1..9ff7b49bca08 100644
> --- a/arch/x86/include/asm/xen/pci.h
> +++ b/arch/x86/include/asm/xen/pci.h
> @@ -14,30 +14,6 @@ static inline int pci_xen_hvm_init(void)
>  	return -1;
>  }
>  #endif
> -#if defined(CONFIG_XEN_DOM0)
> -int __init pci_xen_initial_domain(void);
> -int xen_find_device_domain_owner(struct pci_dev *dev);
> -int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> -int xen_unregister_device_domain_owner(struct pci_dev *dev);
> -#else
> -static inline int __init pci_xen_initial_domain(void)
> -{
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
> -}
> -#endif
>  
>  #if defined(CONFIG_PCI_MSI)
>  #if defined(CONFIG_PCI_XEN)
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
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index a78704ae3618..35493ff0d146 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -65,6 +65,7 @@
>  #include <xen/interface/vcpu.h>
>  #include <xen/xenbus.h>
>  #include <asm/hw_irq.h>
> +#include <xen/pci.h>
>  
>  #include "events_internal.h"
>  
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
> index 000000000000..5c988d5ff38f
> --- /dev/null
> +++ b/include/xen/pci.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __XEN_PCI_H__
> +#define __XEN_PCI_H__
> +
> +#if defined(CONFIG_XEN_DOM0)
> +int __init pci_xen_initial_domain(void);
> +int xen_find_device_domain_owner(struct pci_dev *dev);
> +int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
> +int xen_unregister_device_domain_owner(struct pci_dev *dev);
> +#else
> +static inline int __init pci_xen_initial_domain(void)
> +{
> +	return -1;
> +}
> +
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


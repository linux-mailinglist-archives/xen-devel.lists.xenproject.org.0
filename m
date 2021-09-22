Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07A415270
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193076.343902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9Vi-0003Ra-5A; Wed, 22 Sep 2021 21:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193076.343902; Wed, 22 Sep 2021 21:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9Vi-0003Pn-1q; Wed, 22 Sep 2021 21:10:34 +0000
Received: by outflank-mailman (input) for mailman id 193076;
 Wed, 22 Sep 2021 21:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mT9Vf-0003Ph-WF
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:10:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c2ea2dc-cd4e-4967-9087-3b4f1cb357cf;
 Wed, 22 Sep 2021 21:10:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0D62611C6;
 Wed, 22 Sep 2021 21:10:29 +0000 (UTC)
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
X-Inumbo-ID: 4c2ea2dc-cd4e-4967-9087-3b4f1cb357cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632345030;
	bh=d2egW6Jb1yflKGHaZY0ipvwf3m4wUUJPVblhrUTq/nU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FZiXdRggtJpG40FywZhrpqe0wKKqCk740dWaG+e0N+ISF+s6Uh77IHsOjyNMFgTsB
	 i8wP+ItH3SX0UWV4f7RUwNd2PQnjm7sGGE44nwZD407De8e8h2a/tNH0FrP6fWJxtL
	 lMMMHWvxEYvL2ArDssMDxzMKtwHqPdlQc74+Za28CSiXbzcxdg6dU36TF+20PDkNcg
	 NtN6BSk5Cugp20eHcTypIFowdyHknuP8tIaVgSetV7FHY67vgCHZfiMOcXDczVN1r+
	 qoF+fjkYrMdnt7PU+s7M7F519CbYV1l9QAwaSp/cpAFSnz/X1PyIphwP8DI1m01qtu
	 L02QAKfzAcT9w==
Date: Wed, 22 Sep 2021 14:10:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org, 
    sstabellini@kernel.org, jbeulich@suse.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] xen-pciback: prepare for the split for stub and PV
In-Reply-To: <20210922101422.2319240-2-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109221407350.17979@sstabellini-ThinkPad-T480s>
References: <20210922101422.2319240-1-andr2000@gmail.com> <20210922101422.2319240-2-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Currently PCI backend implements multiple functionalities at a time.
> To name a few:
> 1. it is used as a database for assignable PCI devices, e.g. xl
>    pci-assignable-{add|remove|list} manipulates that list. So, whenever
>    the toolstack needs to know which PCI devices can be passed through
>    it reads that from the relevant sysfs entries of the pciback.
> 2. it is used to hold the unbound PCI devices list, e.g. when passing
>    through a PCI device it needs to be unbound from the relevant device
>    driver and bound to pciback (strictly speaking it is not required
>    that the device is bound to pciback, but pciback is again used as a
>    database of the passed through PCI devices, so we can re-bind the
>    devices back to their original drivers when guest domain shuts down)
> 3. device reset for the devices being passed through
> 4. para-virtualized use-cases support
> 
> The para-virtualized part of the driver is not always needed as some
> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> model for PCI device passthrough. For such use-cases make the very
> first step in splitting the xen-pciback driver into two parts: extended
> PCI stub and PCI PV backend drivers. At the moment x86 platform will
> continue using CONFIG_XEN_PCIDEV_BACKEND for the fully featured backend
> driver and new platforms may build a driver with limited functionality
> (no PV) by enabling CONFIG_XEN_PCIDEV_STUB.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Please make this the first patch of the series so that...

> ---
> New in v2
> ---
>  drivers/xen/Kconfig               | 26 +++++++++++++++++++++++++-
>  drivers/xen/Makefile              |  2 +-
>  drivers/xen/xen-pciback/Makefile  |  1 +
>  drivers/xen/xen-pciback/pciback.h |  5 +++++
>  drivers/xen/xen-pciback/xenbus.c  |  6 +++++-
>  5 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 057ddf61ef61..6e92c6be19f1 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -180,10 +180,34 @@ config SWIOTLB_XEN
>  	select DMA_OPS
>  	select SWIOTLB
>  
> +config XEN_PCI_STUB
> +	bool
> +
> +config XEN_PCIDEV_STUB
> +	tristate "Xen PCI-device stub driver"
> +	depends on PCI && !X86 && XEN
> +	depends on XEN_BACKEND
> +	select XEN_PCI_STUB
> +	default m
> +	help
> +	  The PCI device stub driver provides limited version of the PCI
> +	  device backend driver without para-virtualized support for guests.
> +	  If you select this to be a module, you will need to make sure no
> +	  other driver has bound to the device(s) you want to make visible to
> +	  other guests.
> +
> +	  The "hide" parameter (only applicable if backend driver is compiled
> +	  into the kernel) allows you to bind the PCI devices to this module
> +	  from the default device drivers. The argument is the list of PCI BDFs:
> +	  xen-pciback.hide=(03:00.0)(04:00.0)
> +
> +	  If in doubt, say m.
> +
>  config XEN_PCIDEV_BACKEND
>  	tristate "Xen PCI-device backend driver"
> -	depends on PCI && XEN
> +	depends on PCI && X86 && XEN
>  	depends on XEN_BACKEND

...we don't need this


> +	select XEN_PCI_STUB
>  	default m
>  	help
>  	  The PCI device backend driver allows the kernel to export arbitrary
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index 3434593455b2..5aae66e638a7 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -24,7 +24,7 @@ obj-$(CONFIG_XEN_SYS_HYPERVISOR)	+= sys-hypervisor.o
>  obj-$(CONFIG_XEN_PVHVM_GUEST)		+= platform-pci.o
>  obj-$(CONFIG_SWIOTLB_XEN)		+= swiotlb-xen.o
>  obj-$(CONFIG_XEN_MCE_LOG)		+= mcelog.o
> -obj-$(CONFIG_XEN_PCIDEV_BACKEND)	+= xen-pciback/
> +obj-$(CONFIG_XEN_PCI_STUB)	        += xen-pciback/
>  obj-$(CONFIG_XEN_PRIVCMD)		+= xen-privcmd.o
>  obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+= xen-acpi-processor.o
>  obj-$(CONFIG_XEN_EFI)			+= efi.o
> diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pciback/Makefile
> index e8d981d43235..e2cb376444a6 100644
> --- a/drivers/xen/xen-pciback/Makefile
> +++ b/drivers/xen/xen-pciback/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
> +obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
>  
>  xen-pciback-y := pci_stub.o pciback_ops.o xenbus.o
>  xen-pciback-y += conf_space.o conf_space_header.o \
> diff --git a/drivers/xen/xen-pciback/pciback.h b/drivers/xen/xen-pciback/pciback.h
> index 95e28ee48d52..9a64196e831d 100644
> --- a/drivers/xen/xen-pciback/pciback.h
> +++ b/drivers/xen/xen-pciback/pciback.h
> @@ -71,6 +71,11 @@ struct pci_dev *pcistub_get_pci_dev(struct xen_pcibk_device *pdev,
>  				    struct pci_dev *dev);
>  void pcistub_put_pci_dev(struct pci_dev *dev);
>  
> +static inline bool xen_pcibk_pv_support(void)
> +{
> +	return IS_ENABLED(CONFIG_XEN_PCIDEV_BACKEND);
> +}
> +
>  /* Ensure a device is turned off or reset */
>  void xen_pcibk_reset_device(struct pci_dev *pdev);
>  
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index da34ce85dc88..bde63ef677b8 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -743,6 +743,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
>  
>  int __init xen_pcibk_xenbus_register(void)
>  {
> +	if (!xen_pcibk_pv_support())
> +		return 0;

Is this truly enough to stop the PV backend from initializing? Have you
actually tested it to make sure? If it works, amazing! I am quite happy
about this approach :-)




>  	xen_pcibk_backend = &xen_pcibk_vpci_backend;
>  	if (passthrough)
>  		xen_pcibk_backend = &xen_pcibk_passthrough_backend;
> @@ -752,5 +755,6 @@ int __init xen_pcibk_xenbus_register(void)
>  
>  void __exit xen_pcibk_xenbus_unregister(void)
>  {
> -	xenbus_unregister_driver(&xen_pcibk_driver);
> +	if (xen_pcibk_pv_support())
> +		xenbus_unregister_driver(&xen_pcibk_driver);
>  }
> -- 
> 2.25.1
> 


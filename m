Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2941662E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 21:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194553.346599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTUhO-0002Ib-Pl; Thu, 23 Sep 2021 19:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194553.346599; Thu, 23 Sep 2021 19:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTUhO-0002Fg-M6; Thu, 23 Sep 2021 19:48:02 +0000
Received: by outflank-mailman (input) for mailman id 194553;
 Thu, 23 Sep 2021 19:48:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTUhN-0002Fa-9l
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 19:48:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ad8b244-4bd1-41b7-b359-1407ac9800ea;
 Thu, 23 Sep 2021 19:48:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CDF360F6F;
 Thu, 23 Sep 2021 19:47:59 +0000 (UTC)
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
X-Inumbo-ID: 7ad8b244-4bd1-41b7-b359-1407ac9800ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632426479;
	bh=OeWc14n9eipH1NnZQkPVKzOesAfMuGylT40OBED6fnI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RHH6bQOPihZRnwDCQoYpuBzKCTvOYtNwF12A6tTkkaZI+OnweE3Aa0ovbwXkx3ySQ
	 d7Tpn0knfTv8BcroVAStQr/okxA1LL15V4LndkFfAf+tETDLmxycdEkTUEcRqJMaBj
	 XduUuUI7F1nMfBGQ1RUJ9fRBoix+6gXrPiji0dQeI+mokdYTJ8Gn+1iCHGeeyUqwC3
	 IUV1lj5TN2TRH0W9KAESVcUkOn2MbB478Xp5MfDdQnF0tNN2aZIB/P05i7JX8OrHIL
	 vOXmDC6+flu3RqIBKnoOYCs04E868thQhVNWWFzXJDIsusfFytfCx8CbHDPsGqc21x
	 u84HlbqSdXufA==
Date: Thu, 23 Sep 2021 12:47:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    boris.ostrovsky@oracle.com, jgross@suse.com, julien@xen.org, 
    sstabellini@kernel.org, jbeulich@suse.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and
 PV
In-Reply-To: <20210923095345.185489-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109231217050.17979@sstabellini-ThinkPad-T480s>
References: <20210923095345.185489-1-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> Currently PCI backend implements multiple functionalities at a time.
> To name a few:
> 1. It is used as a database for assignable PCI devices, e.g. xl
>    pci-assignable-{add|remove|list} manipulates that list. So, whenever
>    the toolstack needs to know which PCI devices can be passed through
>    it reads that from the relevant sysfs entries of the pciback.
> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>    through a PCI device it needs to be unbound from the relevant device
>    driver and bound to pciback (strictly speaking it is not required
>    that the device is bound to pciback, but pciback is again used as a
>    database of the passed through PCI devices, so we can re-bind the
>    devices back to their original drivers when guest domain shuts down)
> 3. Device reset for the devices being passed through
> 4. Para-virtualized use-cases support
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
>
> ---
> Changes since v2:
>  - swap the patch order
> New in v2
> ---
>  drivers/xen/Kconfig               | 24 ++++++++++++++++++++++++
>  drivers/xen/Makefile              |  2 +-
>  drivers/xen/xen-pciback/Makefile  |  1 +
>  drivers/xen/xen-pciback/pciback.h |  5 +++++
>  drivers/xen/xen-pciback/xenbus.c  |  6 +++++-
>  5 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a37eb52fb401..6e92c6be19f1 100644
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

I get this build error on ARM:

drivers/xen/xen-pciback/pci_stub.c:22:10: fatal error: asm/xen/pci.h: No such file or directory
 #include <asm/xen/pci.h>
          ^~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.build:277: recipe for target 'drivers/xen/xen-pciback/pci_stub.o' failed


I imagine that the second patch is required for the build on ARM. I
suggest to move the definition of XEN_PCIDEV_STUB to the second patch.
(keep XEN_PCI_STUB and xen_pcibk_pv_support here.)

Alternatively, just remove "tristate "Xen PCI-device stub driver"" from
here so that XEN_PCIDEV_STUB becomes non-selectable. You can add the
tristate property in patch #2.



>  config XEN_PCIDEV_BACKEND
>  	tristate "Xen PCI-device backend driver"
>  	depends on PCI && X86 && XEN
>  	depends on XEN_BACKEND
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
> index c09c7ebd6968..f8ba2903a3ff 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -743,6 +743,9 @@ const struct xen_pcibk_backend *__read_mostly xen_pcibk_backend;
>  
>  int __init xen_pcibk_xenbus_register(void)
>  {
> +	if (!xen_pcibk_pv_support())
> +		return 0;
> +
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


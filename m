Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDF922BA3C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 01:39:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jykoF-00009Q-5z; Thu, 23 Jul 2020 23:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jykoD-00009H-KT
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 23:39:29 +0000
X-Inumbo-ID: bfcb75bc-cd3d-11ea-a33b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfcb75bc-cd3d-11ea-a33b-12813bfff9fa;
 Thu, 23 Jul 2020 23:39:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FF6620792;
 Thu, 23 Jul 2020 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595547568;
 bh=cAqQC1Bd1Kq2j6xPZw8MrEA6cv9mnxdr8LxnNeVKD2E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RzMZe1Pv0ch1VNNGnmSLcKbuOpZp2rp9DN4WDwzhD9e6NR9bgf00Z4tsx+myOdS+h
 l3/0+Nmx8ToCRqSr7qLlMZ2tpQ3WSgMkjX7s1N9zeUjQMdlB3Lpj4aXHNljik1pdhy
 MetaJYcLY76yZjZC/XmcLK7/JFSKvVIaOv7kLJ/Q=
Date: Thu, 23 Jul 2020 16:39:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 3/4] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <c719ed8e92720d0b470a130c1264f8296dac32ac.1595511416.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2007231351350.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <c719ed8e92720d0b470a130c1264f8296dac32ac.1595511416.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1315544770-1595537720=:17562"
Content-ID: <alpine.DEB.2.21.2007231440080.17562@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, andrew.cooper3@citrix.com,
 Bertrand.Marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1315544770-1595537720=:17562
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007231440081.17562@sstabellini-ThinkPad-T480s>

On Thu, 23 Jul 2020, Rahul Singh wrote:
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the PCI device to emulate the PCI devices.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> VPCI MSI support is disable for ARM as it is not tested on ARM.
> 
> Change-Id: I5501db2781f8064640403fecce53713091cd9ab4

Same question


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/Makefile         |   1 +
>  xen/arch/arm/domain.c         |   4 ++
>  xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           |  37 ++++++++++++
>  xen/drivers/passthrough/pci.c |   7 +++
>  xen/include/asm-arm/domain.h  |   5 ++
>  xen/include/public/arch-arm.h |   4 ++
>  7 files changed, 160 insertions(+)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 345cb83eed..5a23ec5cc0 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -7,6 +7,7 @@ obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
>  obj-$(CONFIG_ARM_PCI) += pci/
> +obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..23098ffd02 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -39,6 +39,7 @@
>  #include <asm/vtimer.h>
>  
>  #include "vuart.h"
> +#include "vpci.h"
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>  
> @@ -747,6 +748,9 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    if ( (rc = domain_vpci_init(d)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> new file mode 100644
> index 0000000000..49e473ab0d
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,102 @@
> +/*
> + * xen/arch/arm/vpci.c
> + * Copyright (c) 2020 Arm Ltd.
> + *
> + * Based on arch/x86/hvm/io.c
> + * Copyright (c) 2004, Intel Corporation.
> + * Copyright (c) 2005, International Business Machines Corporation.
> + * Copyright (c) 2008, Citrix Systems, Inc.
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/sched.h>
> +#include <asm/mmio.h>
> +
> +/* Do some sanity checks. */
> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> +        return false;
> +
> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )
> +        return false;
> +
> +    return true;
> +}
> +
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +        register_t *r, void *priv)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    uint32_t data = 0;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.bdf = (((info->gpa) & 0x0ffff000) >> 12);
> +    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 1;
> +
> +    data = vpci_read(sbdf, reg, size);
> +
> +    memcpy(r, &data, size);
> +
> +    return 1;
> +}
> +
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +        register_t r, void *priv)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    uint32_t data = r;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.bdf = (((info->gpa) & 0x0ffff000) >> 12);
> +    reg = (((info->gpa) & 0x00000ffc) | (info->gpa & 3));
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 1;
> +
> +    vpci_write(sbdf, reg, size, data);
> +
> +    return 1;
> +}

I wonder if we could share vpci_mmcfg_read/write. Again, it is OK if we
can't, or if it is not worth the effort. just want to make sure we
thought about it :-)


> +static const struct mmio_handler_ops vpci_mmio_handler = {
> +    .read  = vpci_mmio_read,
> +    .write = vpci_mmio_write,
> +};
> +
> +int domain_vpci_init(struct domain *d)
> +{
> +    if ( !has_vpci(d) || is_hardware_domain(d) )
> +        return 0;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +            GUEST_VPCI_ECAM_BASE,GUEST_VPCI_ECAM_SIZE,NULL);
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> new file mode 100644
> index 0000000000..20dce1f4c4
> --- /dev/null
> +++ b/xen/arch/arm/vpci.h
> @@ -0,0 +1,37 @@
> +/*
> + * xen/arch/arm/vpci.h
> + * Copyright (c) 2020 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ARCH_ARM_VPCI_H__
> +#define __ARCH_ARM_VPCI_H__
> +
> +#ifdef CONFIG_HAS_VPCI
> +int domain_vpci_init(struct domain *d);
> +#else
> +static inline int domain_vpci_init(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /* __ARCH_ARM_VPCI_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5846978890..28511eb641 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -804,6 +804,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      else
>          iommu_enable_device(pdev);
>  
> +#ifdef CONFIG_ARM
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret ) {
> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
> +        goto out;
> +    }
> +#endif
>      pci_enable_acs(pdev);
>  
>  out:
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 4e2f582006..ad70610226 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -34,6 +34,11 @@ enum domain_type {
>  /* The hardware domain has always its memory direct mapped. */
>  #define is_domain_direct_mapped(d) ((d) == hardware_domain)
>  
> +/* For X86 VPCI is enabled and tested for PVH DOM0 only but
> + * for ARM we enable support VPCI for guest domain also.
> + */
> +#define has_vpci(d) (true)

As mentioned we could make this configurabled based on the presence of
pci=[] or something similar in device tree for dom0less guests.



>  struct vtimer {
>      struct vcpu *v;
>      int irq;
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c365b1b39e..7364a07362 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -422,6 +422,10 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
>  #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
>  
> +/* VPCI ECAM mappings */
> +#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> +#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)

Is 256MB in size part of the ECAM standard?


>  /*
>   * 16MB == 4096 pages reserved for guest to use as a region to map its
>   * grant table in.
> -- 
> 2.17.1
> 
--8323329-1315544770-1595537720=:17562--


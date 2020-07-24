Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53922C8C9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 17:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyzJ0-0007Cj-6g; Fri, 24 Jul 2020 15:08:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyzIy-0007Ce-G1
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 15:08:12 +0000
X-Inumbo-ID: 7c63bc3b-cdbf-11ea-8838-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c63bc3b-cdbf-11ea-8838-bc764e2007e4;
 Fri, 24 Jul 2020 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595603292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rbtsgmXzdcMKKFPBYyCVlm3fdoFv5piluTNywmXvKpE=;
 b=CchAOKCnMtg7N9vJlDtDIaAkIYDfj9t/S5eAF/PEKUn7cZvbDCK37PFw
 +oPFPk6JT7vDZPHkrj3TazdOD3m/AsmgJY1C9iBakJ5F/QwpmU9uIS7xP
 DBDWu0NPGmuybctKfCHM1IPiWto36bu0cgXON3dlsKcYy6obmaMsiMMWq 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8fO+meb/pv8aapB3tJzFlGIkmC2KKSC4ZHrvLEfgqIgfu+RkcBS6YHbksVdXX1/6ypkScl64b+
 UBbLekqSkuH68vx8HGlNGRoDxBl35mc5uSRiqV1sUHN4aqHqXcr4evVn10JQOr143Iz2linXRF
 8hn5BOZ3RS3mGLgjksanOuiDFQl3uQJuGyiUXigrn5x5cvMDEsCZIe/HXkY+R2c+Cn1j9636zi
 DMnFxqilZPSU13ggBhfy4ABqkeKs3f54EXbnxhhngAkqR/28G9CyNeuMSekf2tn498YxXyK0gL
 CM0=
X-SBRS: 2.7
X-MesageID: 23153294
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23153294"
Date: Fri, 24 Jul 2020 17:08:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 3/4] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <20200724150800.GL7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <c719ed8e92720d0b470a130c1264f8296dac32ac.1595511416.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c719ed8e92720d0b470a130c1264f8296dac32ac.1595511416.git.rahul.singh@arm.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Paul Durrant <paul@xen.org>, Bertrand.Marquis@arm.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 04:40:23PM +0100, Rahul Singh wrote:
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

I'm not seeing anything on this patch that would disable vPCI MSI
support?

> 
> Change-Id: I5501db2781f8064640403fecce53713091cd9ab4
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

This is just a copy of vpci_access_allowed from x86, I think you
should consider moving the function to common vpci code and just share
it between x86 and Arm?

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

Both functions will only return 1 always, so can likely drop the
return value completely?

> +}
> +
> +static const struct mmio_handler_ops vpci_mmio_handler = {
> +    .read  = vpci_mmio_read,
> +    .write = vpci_mmio_write,
> +};
> +
> +int domain_vpci_init(struct domain *d)

FWIW, I think you can drop the domain_ prefix, vPCI is always tied to
a domain.

> +{
> +    if ( !has_vpci(d) || is_hardware_domain(d) )

I wouldn't add a hardware domain exception here, and just make sure
the VPCI flag is not set for the hardware domain on Arm if you don't
want to use it there.

> +        return 0;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +            GUEST_VPCI_ECAM_BASE,GUEST_VPCI_ECAM_SIZE,NULL);

Missing spaces, and proper indentation.

> +
> +    return 0;

Doesn't seem like domain_vpci_init can fail, so you can likely skip
the return value?

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

Don't you need to drop the __hwdom_init from that function? Or else it
might be freed by the time dom0 calls pci_add_device?

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

Urg, that's kind of unconditional, couldn't you pass a flag for
user-space in order to signal whether vPCI should be enabled? There's
no point on enabling it if the domain doesn't support PCI passthrough,
or if there are no PCI devices on the system.

Roger.


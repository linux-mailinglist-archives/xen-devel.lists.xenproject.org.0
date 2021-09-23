Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F96415579
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 04:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193291.344286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEfz-0007Wd-V9; Thu, 23 Sep 2021 02:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193291.344286; Thu, 23 Sep 2021 02:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTEfz-0007TJ-RK; Thu, 23 Sep 2021 02:41:31 +0000
Received: by outflank-mailman (input) for mailman id 193291;
 Thu, 23 Sep 2021 02:41:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTEfy-0007Su-5t
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 02:41:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c72f810-d02f-4b04-9af5-167d89ebe6f2;
 Thu, 23 Sep 2021 02:41:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D91760F70;
 Thu, 23 Sep 2021 02:41:27 +0000 (UTC)
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
X-Inumbo-ID: 6c72f810-d02f-4b04-9af5-167d89ebe6f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632364887;
	bh=IXRhmptxkJbaYtOuw0aSN4IAF1z9IJstey2yZCM3F3k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rn9AFJ6wIyhKP/lnt7bnpJgS+5l60aXDHKT3xPf7GLKiqQX1GTaEJ+oiY8FuJLIcT
	 DsU/DKu9FNO9W7yqoapGIK6FSaYjGR8dVkSRP/qAsmPPPM2xu/8mwDb86gMbfE26W+
	 4yxAiCWBZQssKleeM0h5HlbzRCRCstK4KoY3GslqPcKAV6jj/bJTNbUkzdf3t8e1pa
	 fYFyKyEoJ3znNrMjHywZqq4Mq3LgV1GgJgPaKeX3G47uPXQN/b7XG+pwmPlqYu98mb
	 V02McxDsMqEtd0HwxZEa3FUL5FTR4WsbOOYiz3g/L+Mhjl/D7PkJHi/P1Nz+4BVInN
	 bybRnFkJc86+Q==
Date: Wed, 22 Sep 2021 19:41:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221926410.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1608248556-1632364432=:17979"
Content-ID: <alpine.DEB.2.21.2109221935580.17979@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1608248556-1632364432=:17979
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109221935581.17979@sstabellini-ThinkPad-T480s>

On Wed, 22 Sep 2021, Rahul Singh wrote:
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the Xen to emulate the PCI devices config space.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - Add new XEN_DOMCTL_CDF_vpci flag
> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> - enable vpci support when pci-passthough option is enabled.
> ---
>  xen/arch/arm/Makefile         |   1 +
>  xen/arch/arm/domain.c         |   6 +-
>  xen/arch/arm/domain_build.c   |   3 +
>  xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           |  36 ++++++++++++
>  xen/common/domain.c           |   2 +-
>  xen/drivers/passthrough/pci.c |  12 ++++
>  xen/include/asm-arm/domain.h  |   8 ++-
>  xen/include/asm-x86/pci.h     |   2 -
>  xen/include/public/arch-arm.h |   7 +++
>  xen/include/public/domctl.h   |   4 +-
>  xen/include/xen/pci.h         |   2 +
>  12 files changed, 179 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 44d7cc81fa..fb9c976ea2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..f7ed130023 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -39,6 +39,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vtimer.h>
>  
> +#include "vpci.h"
>  #include "vuart.h"
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> @@ -623,7 +624,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      unsigned int max_vcpus;
>  
>      /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
> +    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci) !=
>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>      {
>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    if ( (rc = domain_vpci_init(d)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d233d634c1..5eb83b12a1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2773,6 +2773,9 @@ void __init create_dom0(void)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> +    if ( pci_passthrough_enabled )

we should use the accessor function instead is_pci_passthrough_enabled


> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
> +
>      dom0 = domain_create(0, &dom0_cfg, true);
>      if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>          panic("Error creating domain 0\n");
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> new file mode 100644
> index 0000000000..76c12b9281
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,102 @@
> +/*
> + * xen/arch/arm/vpci.c
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
> +
> +#include <asm/mmio.h>
> +
> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> +
> +/* Do some sanity checks. */
> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len > 8 )
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
> +                          register_t *r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = ~0UL;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> +    reg = REGISTER_OFFSET(info->gpa);
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 0;
> +
> +    data = vpci_read(sbdf, reg, min(4u, size));
> +    if ( size == 8 )
> +        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +
> +    *r = data;
> +
> +    return 1;
> +}
> +
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                           register_t r, void *p)
> +{
> +    unsigned int reg;
> +    pci_sbdf_t sbdf;
> +    unsigned long data = r;
> +    unsigned int size = 1U << info->dabt.size;
> +
> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> +    reg = REGISTER_OFFSET(info->gpa);
> +
> +    if ( !vpci_mmio_access_allowed(reg, size) )
> +        return 0;
> +
> +    vpci_write(sbdf, reg, min(4u, size), data);
> +    if ( size == 8 )
> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +
> +    return 1;
> +}
> +
> +static const struct mmio_handler_ops vpci_mmio_handler = {
> +    .read  = vpci_mmio_read,
> +    .write = vpci_mmio_write,
> +};
> +
> +int domain_vpci_init(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return 0;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
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
> index 0000000000..d8a7b0e3e8
> --- /dev/null
> +++ b/xen/arch/arm/vpci.h
> @@ -0,0 +1,36 @@
> +/*
> + * xen/arch/arm/vpci.h
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
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6ee5d033b0..40d67ec342 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index d774a6154e..633e89ac13 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -767,6 +767,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      else
>          iommu_enable_device(pdev);
>  
> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */

I take this is not needed on x86 because for vpci is only used by Dom0
PVH?  It would be good to clarify either way.


> +    ret = vpci_add_handlers(pdev);
> +    if ( ret ) {
> +        printk(XENLOG_ERR "setup of vPCI for failed: %d\n",ret);
> +        goto out;
> +    }
> +#endif
> +
>      pci_enable_acs(pdev);
>  
>  out:
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..5fb4e24adf 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -2,6 +2,7 @@
>  #define __ASM_DOMAIN_H__
>  
>  #include <xen/cache.h>
> +#include <xen/nospec.h>
>  #include <xen/timer.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> @@ -262,7 +263,12 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> -#define has_vpci(d)    ({ (void)(d); false; })
> +/*
> + * For X86 VPCI is enabled and tested for PVH DOM0 only but
> + * for ARM we enable support VPCI for guest domain also.
> + */
> +#define has_vpci(d) ((void)(d), IS_ENABLED(CONFIG_HAS_VPCI) && \
> +        evaluate_nospec(d->options & XEN_DOMCTL_CDF_vpci))

With the new options & XEN_DOMCTL_CDF_vpci check in place, do we even
need IS_ENABLED(CONFIG_HAS_VPCI) any longer?


>  #endif /* __ASM_DOMAIN_H__ */
>  
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index 0e160c6d01..a5590557db 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
> -
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
>                          || id == 0x01128086 || id == 0x01228086 \
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 6b5a5f818a..727541a321 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -416,6 +416,13 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>  #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>  
> +/*
> + * 256 MB is reserved for VPCI configuration space based on calculation
> + * 256 buses × 32 devices × 8 functions × 4 KB = 256 MB
> + */
> +#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> +#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> +
>  /* ACPI tables physical address */
>  #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
>  #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..4245da3f45 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +#define _XEN_DOMCTL_CDF_vpci          7
> +#define XEN_DOMCTL_CDF_vpci           (1U << _XEN_DOMCTL_CDF_vpci)
>  
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpci
>  
>      uint32_t flags;
>  
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 8e3d4d9454..2b2dfb6f1b 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -41,6 +41,8 @@
>  #define PCI_SBDF3(s,b,df) \
>      ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>  
> +#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
> +
>  typedef union {
>      uint32_t sbdf;
>      struct {
> -- 
> 2.17.1
> 
--8323329-1608248556-1632364432=:17979--


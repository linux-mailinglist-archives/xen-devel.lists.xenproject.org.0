Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB742E4E4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 01:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209632.366148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbATO-0005gl-TN; Thu, 14 Oct 2021 23:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209632.366148; Thu, 14 Oct 2021 23:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbATO-0005du-Pk; Thu, 14 Oct 2021 23:49:18 +0000
Received: by outflank-mailman (input) for mailman id 209632;
 Thu, 14 Oct 2021 23:49:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbATN-0005dm-57
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 23:49:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56a0a63a-2d49-11ec-8211-12813bfff9fa;
 Thu, 14 Oct 2021 23:49:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B8EA610F9;
 Thu, 14 Oct 2021 23:49:14 +0000 (UTC)
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
X-Inumbo-ID: 56a0a63a-2d49-11ec-8211-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634255354;
	bh=Sj7og8kHDcDF2pFW/YETFtKnbaRmY7+05DrA1J8TffI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TMAPl0yXStn4elAUdxsPuO09qUHGm9jfq8DYRWKCc9N4m8b8pH/05g1tsklxlbH31
	 xnqi83pI7N/jA7ViA02B0yAewWTHlbGPwAkt2DbbBqwI3p/tb3lOLi5ffK/W/+PzCq
	 n7Qtwgibif7j7xrHKJ4Q82wD2nWLreS1WZ2LJn9GugLaCg2YGyQ6E3xeUVlzmJbuNE
	 +hvsTIaQipZwpE7sihYMvF/uUPbB+gMFNvJJinCo+EXLmZWPaJzP7QtgCwsYGxzXzX
	 Be/BJd2cf1YYbD1cXFCPoQyEI6uk8H2kd1orYD8WC09uO5/LQfKgcJVojhm5AJRVSE
	 XT93eZZwCD5sw==
Date: Thu, 14 Oct 2021 16:49:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, 
    Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
In-Reply-To: <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2110141331310.9408@sstabellini-ThinkPad-T480s>
References: <cover.1634221830.git.bertrand.marquis@arm.com> <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-609136478-1634244065=:9408"
Content-ID: <alpine.DEB.2.21.2110141347510.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-609136478-1634244065=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110141347511.9408@sstabellini-ThinkPad-T480s>

On Thu, 14 Oct 2021, Bertrand Marquis wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
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
> This patch is also doing some small fixes to fix compilation errors on
> arm32 of vpci:
> - add a cast to unsigned long in print in header.c
> - add a cast to uint64_t in vpci_ecam_mmio_write

Thank you for these! Strictly speaking they are not required now but
they are welcome. I would also be OK if they were removed from this
patch but it is fine to have them in here.

There is an issues with this patch, see below at the bottom


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> ---
> Changes in v6:
> - Use new vpci_ecam_ helpers for PCI access
> - Do not set XEN_DOMCTL_CDF_vpci for dom0 for now (will be done in a
> future patch once everything is ready)
> - rename REGISTER_OFFSET to ECAM_REG_OFFSET and move it to pci.h
> - remove not needed local variables in vpci_mmio_write, the one in read
> has been kept to ensure proper compilation on arm32
> - move call to vpci_add_handlers before iommu init to simplify exit path
> - move call to pci_cleanup_msi in the out section of pci_add_device if
> pdev is not NULL and on error
> - initialize pdev to NULL to handle properly exit path call of
> pci_cleanup_msi
> - keep has_vpci to return false for now as CFG_vpci has been removed.
> Added a comment on top of the definition.
> - fix compilation errors on arm32 (print in header.c, cast missing in
> mmio_write.
> - local variable was kept in vpci_mmio_read on arm to prevent a cast
> error in arm32.
> Change in v5:
> - Add pci_cleanup_msi(pdev) incleanup part.
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Change in v4:
> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> Change in v3:
> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> Change in v2:
> - Add new XEN_DOMCTL_CDF_vpci flag
> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> - enable vpci support when pci-passthough option is enabled.
> ---
> ---
>  xen/arch/arm/Makefile         |  1 +
>  xen/arch/arm/domain.c         |  4 ++
>  xen/arch/arm/vpci.c           | 74 +++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           | 36 +++++++++++++++++
>  xen/drivers/passthrough/pci.c | 18 ++++++++-
>  xen/drivers/vpci/header.c     |  3 +-
>  xen/drivers/vpci/vpci.c       |  2 +-
>  xen/include/asm-arm/domain.h  |  1 +
>  xen/include/asm-x86/pci.h     |  2 -
>  xen/include/public/arch-arm.h |  7 ++++
>  xen/include/xen/pci.h         |  3 ++
>  11 files changed, 146 insertions(+), 5 deletions(-)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 64518848b2..07f634508e 100644
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
> index eef0661beb..96e1b23550 100644
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
> @@ -773,6 +774,9 @@ int arch_domain_create(struct domain *d,
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
> index 0000000000..7c3552b65d
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,74 @@
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
> +#include <xen/vpci.h>
> +
> +#include <asm/mmio.h>
> +
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                          register_t *r, void *p)
> +{
> +    pci_sbdf_t sbdf;
> +    /* data is needed to prevent a pointer cast on 32bit */
> +    unsigned long data = ~0ul;
> +    int ret;
> +
> +    /* We ignore segment part and always handle segment 0 */
> +    sbdf.sbdf = ECAM_BDF(info->gpa);
> +
> +    ret = vpci_ecam_mmio_read(sbdf, ECAM_REG_OFFSET(info->gpa),
> +                              1U << info->dabt.size, &data);
> +
> +    *r = data;
> +
> +    return ret;
> +}
> +
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                           register_t r, void *p)
> +{
> +    pci_sbdf_t sbdf;
> +
> +    /* We ignore segment part and always handle segment 0 */
> +    sbdf.sbdf = ECAM_BDF(info->gpa);
> +
> +    return vpci_ecam_mmio_write(sbdf, ECAM_REG_OFFSET(info->gpa),
> +                                1U << info->dabt.size, r);
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
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3aa8c3175f..8cc529ecec 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -658,7 +658,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                     const struct pci_dev_info *info, nodeid_t node)
>  {
>      struct pci_seg *pseg;
> -    struct pci_dev *pdev;
> +    struct pci_dev *pdev = NULL;
>      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
>      const char *pdev_type;
>      int ret;
> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  
>      check_pdev(pdev);
>  
> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +        goto out;
> +    }
> +#endif
> +
>      ret = 0;
>      if ( !pdev->domain )
>      {
> @@ -784,6 +797,9 @@ out:
>                     &PCI_SBDF(seg, bus, slot, func));
>          }
>      }
> +    else if ( pdev )
> +        pci_cleanup_msi(pdev);
> +
>      return ret;
>  }
>  
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f8cd55e7c0..c5b025b88b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -374,7 +374,8 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>              gprintk(XENLOG_WARNING,
>                      "%pp: ignored BAR %lu write with memory decoding enabled\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +                    &pdev->sbdf,
> +                    (unsigned long)(bar - pdev->vpci->header.bars + hi));
>          return;
>      }
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index c0853176d7..2bd67fc27a 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -507,7 +507,7 @@ int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  
>      vpci_write(sbdf, reg, min(4u, len), data);
>      if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +        vpci_write(sbdf, reg + 4, 4, (uint64_t)data >> 32);
>  
>      return 1;
>  }
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 14e575288f..9b3647587a 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -263,6 +263,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> +/* vPCI is not available on Arm */
>  #define has_vpci(d)    ({ (void)(d); false; })
>  
>  #endif /* __ASM_DOMAIN_H__ */
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index a0df5c1279..443f25347d 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define ECAM_BDF(addr)   ( ((addr) & 0x0ffff000) >> 12)
> -
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
>                          || id == 0x01128086 || id == 0x01228086 \
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61fca9..44be337dec 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>  #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>  
> +/*
> + * 256 MB is reserved for VPCI configuration space based on calculation
> + * 256 buses × 32 devices × 8 functions × 4 KB = 256 MB
> + */

Somehow 3 non-ascii characters sneaked into this patch. The 'x' are not
'x' but are 0xc3 and cause the following errors in a few gitlab-ci
builds:

python3 mkheader.py arm32 arm32.h.tmp /builds/xen-project/people/sstabellini/xen/tools/include/xen-foreign/../../../xen/include/public/arch-arm.h /builds/xen-project/people/sstabellini/xen/tools/include/xen-foreign/../../../xen/include/public/xen.h
Traceback (most recent call last):
  File "mkheader.py", line 120, in <module>
    input += f.read();
  File "/usr/lib/python3.5/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 14641: ordinal not in range(128)
Makefile:28: recipe for target 'arm32.h' failed
make[2]: *** [arm32.h] Error 1

Full logs here:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/38855078
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/16810108756


Replacing the 3 characters with 'x' solves the problem.
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/388721262


With the three 'x' changed to ascii:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> +#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> +#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> +
>  /* ACPI tables physical address */
>  #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
>  #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 70ac25345c..db18cb7639 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -40,6 +40,9 @@
>  #define PCI_SBDF3(s,b,df) \
>      ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>  
> +#define ECAM_BDF(addr)         ( ((addr) & 0x0ffff000) >> 12)
> +#define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
> +
>  typedef union {
>      uint32_t sbdf;
>      struct {
> -- 
> 2.25.1
> 
--8323329-609136478-1634244065=:9408--


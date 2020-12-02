Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446062CB2F0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 03:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42407.76249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkIFC-0007VQ-2L; Wed, 02 Dec 2020 02:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42407.76249; Wed, 02 Dec 2020 02:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkIFB-0007V1-Ug; Wed, 02 Dec 2020 02:51:49 +0000
Received: by outflank-mailman (input) for mailman id 42407;
 Wed, 02 Dec 2020 02:51:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GudV=FG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkIFA-0007Uw-Te
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 02:51:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d4c442c-6c8b-4b3f-acc4-b6c228b02835;
 Wed, 02 Dec 2020 02:51:47 +0000 (UTC)
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
X-Inumbo-ID: 1d4c442c-6c8b-4b3f-acc4-b6c228b02835
Date: Tue, 1 Dec 2020 18:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606877506;
	bh=AhHQoiIqPJiW830xvz8l+sNzDDmzhfEw5QJsFzXWLak=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Con/JhxRMWuF0VqXIHeAN7Ro2E1qc+AkAoG0Q4u4FKp0uTRpf0KNLHDygwvk/xjnH
	 oJAxBFxCpTYCwOXrAbrKW/TNMZAejGvyPUE78kDXTBgsqBMq/b03iLyWy9tlG089YD
	 l8nBU6cCmJ4tUo7YMx57AzPNzPar30alr2FeR+NI=
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
In-Reply-To: <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Nov 2020, Rahul Singh wrote:
> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
> 
> Major differences with regard to Linux driver are as follows:
> 1. Only Stage-2 translation is supported as compared to the Linux driver
>    that supports both Stage-1 and Stage-2 translations.
> 2. Use P2M  page table instead of creating one as SMMUv3 has the
>    capability to share the page tables with the CPU.
> 3. Tasklets are used in place of threaded IRQ's in Linux for event queue
>    and priority queue IRQ handling.
> 4. Latest version of the Linux SMMUv3 code implements the commands queue
>    access functions based on atomic operations implemented in Linux.
>    Atomic functions used by the commands queue access functions are not
>    implemented in XEN therefore we decided to port the earlier version
>    of the code. Once the proper atomic operations will be available in
>    XEN the driver can be updated.
> 5. Driver is currently supported as Tech Preview.

This patch is big and was difficult to review, nonetheless I tried :-)

That said, the code is self-contained, marked as Tech Preview, and not
at risk of making other things unstable, so it is low risk to accept it.

Comments below.


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  MAINTAINERS                           |   6 +
>  SUPPORT.md                            |   1 +
>  xen/drivers/passthrough/Kconfig       |  10 +
>  xen/drivers/passthrough/arm/Makefile  |   1 +
>  xen/drivers/passthrough/arm/smmu-v3.c | 986 +++++++++++++++++++++-----
>  5 files changed, 814 insertions(+), 190 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dab38a6a14..1d63489eec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,12 @@ F:	xen/include/asm-arm/
>  F:	xen/include/public/arch-arm/
>  F:	xen/include/public/arch-arm.h
>  
> +ARM SMMUv3
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> +M:	Rahul Singh <rahul.singh@arm.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/arm/smmu-v3.c
> +
>  Change Log
>  M:	Paul Durrant <paul@xen.org>
>  R:	Community Manager <community.manager@xenproject.org>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab02aca5f4..e402c7202d 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -68,6 +68,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>      Status, ARM SMMUv1: Supported, not security supported
>      Status, ARM SMMUv2: Supported, not security supported
>      Status, Renesas IPMMU-VMSA: Supported, not security supported
> +    Status, ARM SMMUv3: Tech Preview
>  
>  ### ARM/GICv3 ITS
>  
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 0036007ec4..5b71c59f47 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -13,6 +13,16 @@ config ARM_SMMU
>  	  Say Y here if your SoC includes an IOMMU device implementing the
>  	  ARM SMMU architecture.
>  
> +config ARM_SMMU_V3
> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> +	depends on ARM_64
> +	---help---
> +	 Support for implementations of the ARM System MMU architecture
> +	 version 3.
> +
> +	 Say Y here if your system includes an IOMMU device implementing
> +	 the ARM SMMUv3 architecture.
> +
>  config IPMMU_VMSA
>  	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>  	depends on ARM_64
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index fcd918ea3e..c5fb3b58a5 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>  obj-$(CONFIG_ARM_SMMU) += smmu.o
>  obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
> +obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 55d1cba194..8f2337e7f2 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2,36 +2,280 @@
>  /*
>   * IOMMU API for ARM architected SMMUv3 implementations.
>   *
> - * Copyright (C) 2015 ARM Limited
> + * Based on Linux's SMMUv3 driver:
> + *    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> + *    commit: 951cbbc386ff01b50da4f46387e994e81d9ab431
> + * and Xen's SMMU driver:
> + *    xen/drivers/passthrough/arm/smmu.c
>   *
> - * Author: Will Deacon <will.deacon@arm.com>
> + * Copyright (C) 2015 ARM Limited Will Deacon <will.deacon@arm.com>
>   *
> - * This driver is powered by bad coffee and bombay mix.
> + * Copyright (C) 2020 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/config.h>
> +#include <xen/delay.h>
> +#include <xen/errno.h>
> +#include <xen/err.h>
> +#include <xen/irq.h>
> +#include <xen/lib.h>
> +#include <xen/list.h>
> +#include <xen/mm.h>
> +#include <xen/rbtree.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/vmap.h>
> +#include <asm/atomic.h>
> +#include <asm/device.h>
> +#include <asm/io.h>
> +#include <asm/platform.h>
> +#include <asm/iommu_fwspec.h>
> +
> +/* Linux compatibility functions. */
> +typedef paddr_t dma_addr_t;
> +typedef unsigned int gfp_t;
> +
> +#define platform_device device
> +
> +#define GFP_KERNEL 0
> +
> +/* Alias to Xen device tree helpers */
> +#define device_node dt_device_node
> +#define of_phandle_args dt_phandle_args
> +#define of_device_id dt_device_match
> +#define of_match_node dt_match_node
> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
> +#define of_property_read_bool dt_property_read_bool
> +#define of_parse_phandle_with_args dt_parse_phandle_with_args

Given all the changes to the file by the previous patches we are
basically fully (or almost fully) adapting this code to Xen.

So at that point I wonder if we should just as well make these changes
(e.g. s/of_phandle_args/dt_phandle_args/g) to the code too.

Julien, Rahul, what do you guys think?


> +/* Alias to Xen lock functions */

I think this deserves at least one statement to explain why it is OK.

Also, a similar comment to the one above: maybe we should add a couple
of more preparation patches to s/mutex/spinlock/g and change the time
and allocation functions too.


> +#define mutex spinlock
> +#define mutex_init spin_lock_init
> +#define mutex_lock spin_lock
> +#define mutex_unlock spin_unlock
> +
> +/* Alias to Xen time functions */
> +#define ktime_t s_time_t
> +#define ktime_get()             (NOW())
> +#define ktime_add_us(t,i)       (t + MICROSECS(i))
> +#define ktime_compare(t,i)      (t > (i))
> +
> +/* Alias to Xen allocation helpers */
> +#define kzalloc(size, flags)    _xzalloc(size, sizeof(void *))
> +#define kfree xfree
> +#define devm_kzalloc(dev, size, flags)  _xzalloc(size, sizeof(void *))
> +
> +/* Device logger functions */
> +#define dev_name(dev) dt_node_full_name(dev->of_node)
> +#define dev_dbg(dev, fmt, ...)      \
> +    printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_notice(dev, fmt, ...)   \
> +    printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_warn(dev, fmt, ...)     \
> +    printk(XENLOG_WARNING "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_err(dev, fmt, ...)      \
> +    printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_info(dev, fmt, ...)     \
> +    printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_err_ratelimited(dev, fmt, ...)      \
> +    printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +
> +/*
> + * Periodically poll an address and wait between reads in us until a
> + * condition is met or a timeout occurs.

It would be good to add a statement to point out what the return value
is going to be.


> + */
> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us) \
> +({ \
> +     s_time_t deadline = NOW() + MICROSECS(timeout_us); \
> +     for (;;) { \
> +        (val) = op(addr); \
> +        if (cond) \
> +            break; \
> +        if (NOW() > deadline) { \
> +            (val) = op(addr); \
> +            break; \
> +        } \
> +        udelay(sleep_us); \
> +     } \
> +     (cond) ? 0 : -ETIMEDOUT; \
> +})
> +
> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us) \
> +    readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us)
> +
> +#define FIELD_PREP(_mask, _val)         \
> +    (((typeof(_mask))(_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))

Let's add the definition of ffsll to bitops.h


> +#define FIELD_GET(_mask, _reg)          \
> +    (typeof(_mask))(((_reg) & (_mask)) >> (__builtin_ffsll(_mask) - 1))
> +
> +#define WRITE_ONCE(x, val)                  \
> +do {                                        \
> +    *(volatile typeof(x) *)&(x) = (val);    \
> +} while (0)

maybe we should define this in xen/include/xen/lib.h


> +
> +/* Xen: Stub out DMA domain related functions */
> +#define iommu_get_dma_cookie(dom) 0
> +#define iommu_put_dma_cookie(dom)

Shouldn't we remove any call to iommu_get_dma_cookie and
iommu_put_dma_cookie in one of the previous patches?


> +/*
> + * Helpers for DMA allocation. Just the function name is reused for
> + * porting code, these allocation are not managed allocations
>   */
> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
> +                                 paddr_t *dma_handle, gfp_t gfp)
> +{
> +    void *vaddr;
> +    unsigned long alignment = size;
> +
> +    /*
> +     * _xzalloc requires that the (align & (align -1)) = 0. Most of the
> +     * allocations in SMMU code should send the right value for size. In
> +     * case this is not true print a warning and align to the size of a
> +     * (void *)
> +     */
> +    if ( size & (size - 1) )
> +    {
> +        printk(XENLOG_WARNING "SMMUv3: Fixing alignment for the DMA buffer\n");
> +        alignment = sizeof(void *);
> +    }
> +
> +    vaddr = _xzalloc(size, alignment);
> +    if ( !vaddr )
> +    {
> +        printk(XENLOG_ERR "SMMUv3: DMA allocation failed\n");
> +        return NULL;
> +    }
> +
> +    *dma_handle = virt_to_maddr(vaddr);
> +
> +    return vaddr;
> +}
> +
> +/* Xen: Type definitions for iommu_domain */
> +#define IOMMU_DOMAIN_UNMANAGED 0
> +#define IOMMU_DOMAIN_DMA 1
> +#define IOMMU_DOMAIN_IDENTITY 2
> +
> +/* Xen specific code. */
> +struct iommu_domain {
> +    /* Runtime SMMU configuration for this iommu_domain */
> +    atomic_t ref;
> +    /*
> +     * Used to link iommu_domain contexts for a same domain.
> +     * There is at least one per-SMMU to used by the domain.
> +     */
> +    struct list_head    list;
> +};
> +
> +/* Describes information required for a Xen domain */
> +struct arm_smmu_xen_domain {
> +    spinlock_t      lock;
> +
> +    /* List of iommu domains associated to this domain */
> +    struct list_head    contexts;
> +};
> +
> +/*
> + * Information about each device stored in dev->archdata.iommu
> + * The dev->archdata.iommu stores the iommu_domain (runtime configuration of
> + * the SMMU).
> + */
> +struct arm_smmu_xen_device {
> +    struct iommu_domain *domain;
> +};

Do we need both struct arm_smmu_xen_device and struct iommu_domain?


> +/* Keep a list of devices associated with this driver */
> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
> +static LIST_HEAD(arm_smmu_devices);
> +
> +
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +    return fwspec && fwspec->iommu_priv ? fwspec->iommu_priv : NULL;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +    fwspec->iommu_priv = priv;
> +}
> +
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string)
> +{
> +    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
> +    size_t l;
> +    int i;
> +    const char *p, *end;
> +
> +    if ( !dtprop )
> +        return -EINVAL;
> +
> +    if ( !dtprop->value )
> +        return -ENODATA;
> +
> +    p = dtprop->value;
> +    end = p + dtprop->length;
> +
> +    for ( i = 0; p < end; i++, p += l )
> +    {
> +        l = strnlen(p, end - p) + 1;
> +
> +        if ( p + l > end )
> +            return -EILSEQ;
> +
> +        if ( strcmp(string, p) == 0 )
> +            return i; /* Found it; return index */
> +    }
> +
> +    return -ENODATA;
> +}

I think you should either use dt_property_read_string or move the
implementation of dt_property_match_string to xen/common/device_tree.c
(in which case I suggest to do it in a separate patch.)

I'd just use dt_property_read_string.



> +static int platform_get_irq_byname_optional(struct device *dev,
> +                                            const char *name)
> +{
> +    int index, ret;
> +    struct dt_device_node *np  = dev_to_dt(dev);
> +
> +    if ( unlikely(!name) )
> +        return -EINVAL;
> +
> +    index = dt_property_match_string(np, "interrupt-names", name);
> +    if ( index < 0 )
> +    {
> +        dev_info(dev, "IRQ %s not found\n", name);
> +        return index;
> +    }
>  
> -#include <linux/acpi.h>
> -#include <linux/acpi_iort.h>
> -#include <linux/bitfield.h>
> -#include <linux/bitops.h>
> -#include <linux/crash_dump.h>
> -#include <linux/delay.h>
> -#include <linux/dma-iommu.h>
> -#include <linux/err.h>
> -#include <linux/interrupt.h>
> -#include <linux/io-pgtable.h>
> -#include <linux/iommu.h>
> -#include <linux/iopoll.h>
> -#include <linux/module.h>
> -#include <linux/msi.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_iommu.h>
> -#include <linux/of_platform.h>
> -#include <linux/pci.h>
> -#include <linux/pci-ats.h>
> -#include <linux/platform_device.h>
> -
> -#include <linux/amba/bus.h>
> +    ret = platform_get_irq(np, index);
> +    if ( ret < 0 )
> +    {
> +        dev_err(dev, "failed to get irq index %d\n", index);
> +        return -ENODEV;
> +    }
> +
> +    return ret;
> +}
> +
> +/* Start of Linux SMMUv3 code */
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -507,6 +751,7 @@ struct arm_smmu_s2_cfg {
>  	u16				vmid;
>  	u64				vttbr;
>  	u64				vtcr;
> +	struct domain		*domain;
>  };
>  
>  struct arm_smmu_strtab_cfg {
> @@ -567,8 +812,13 @@ struct arm_smmu_device {
>  
>  	struct arm_smmu_strtab_cfg	strtab_cfg;
>  
> -	/* IOMMU core code handle */
> -	struct iommu_device		iommu;
> +	/* Need to keep a list of SMMU devices */
> +	struct list_head		devices;
> +
> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
> +	struct tasklet		evtq_irq_tasklet;
> +	struct tasklet		priq_irq_tasklet;
> +	struct tasklet		combined_irq_tasklet;
>  };
>  
>  /* SMMU private data for each master */
> @@ -1110,7 +1360,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  }
>  
>  /* IRQ and event handlers */
> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> +static void arm_smmu_evtq_thread(void *dev)

I think we shouldn't call it a thread given that's a tasklet. We should
rename the function or it will be confusing.


>  {
>  	int i;
>  	struct arm_smmu_device *smmu = dev;
> @@ -1140,7 +1390,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  	/* Sync our overflow flag, as we believe we're up to speed */
>  	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>  		    Q_IDX(llq, llq->cons);
> -	return IRQ_HANDLED;
>  }
>  
>  static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
> @@ -1181,7 +1430,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  	}
>  }
>  
> -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> +static void arm_smmu_priq_thread(void *dev)

same here


>  {
>  	struct arm_smmu_device *smmu = dev;
>  	struct arm_smmu_queue *q = &smmu->priq.q;
> @@ -1200,12 +1449,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
>  	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>  		      Q_IDX(llq, llq->cons);
>  	queue_sync_cons_out(q);
> -	return IRQ_HANDLED;
>  }
>  
>  static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>  
> -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> +static void arm_smmu_gerror_handler(int irq, void *dev,
> +				struct cpu_user_regs *regs)
>  {
>  	u32 gerror, gerrorn, active;
>  	struct arm_smmu_device *smmu = dev;
> @@ -1215,7 +1464,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  
>  	active = gerror ^ gerrorn;
>  	if (!(active & GERROR_ERR_MASK))
> -		return IRQ_NONE; /* No errors pending */
> +		return; /* No errors pending */
>  
>  	dev_warn(smmu->dev,
>  		 "unexpected global error reported (0x%08x), this could be serious\n",
> @@ -1248,26 +1497,42 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  		arm_smmu_cmdq_skip_err(smmu);
>  
>  	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> -	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
> +static void arm_smmu_combined_irq_handler(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> +{
> +	struct arm_smmu_device *smmu = (struct arm_smmu_device *)dev;
> +
> +	arm_smmu_gerror_handler(irq, dev, regs);
> +
> +	tasklet_schedule(&(smmu->combined_irq_tasklet));
> +}
> +
> +static void arm_smmu_combined_irq_thread(void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  
> -	arm_smmu_evtq_thread(irq, dev);
> +	arm_smmu_evtq_thread(dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		arm_smmu_priq_thread(irq, dev);
> -
> -	return IRQ_HANDLED;
> +		arm_smmu_priq_thread(dev);
>  }
>  
> -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> -	return IRQ_WAKE_THREAD;
> +	struct arm_smmu_device *smmu = (struct arm_smmu_device *)dev;
> +
> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
>  }
>  
> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> +{
> +	struct arm_smmu_device *smmu = (struct arm_smmu_device *)dev;
> +
> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
> +}
>  
>  /* IO_PGTABLE API */
>  static void arm_smmu_tlb_inv_context(void *cookie)
> @@ -1354,27 +1619,69 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  }
>  
>  static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
> -				       struct arm_smmu_master *master,
> -				       struct io_pgtable_cfg *pgtbl_cfg)
> +				       struct arm_smmu_master *master)
>  {
>  	int vmid;
> +	u64 reg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>  
> +	/* VTCR */
> +	reg = VTCR_RES1 | VTCR_SH0_IS | VTCR_IRGN0_WBWA | VTCR_ORGN0_WBWA;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		reg |= VTCR_TG0_4K;
> +		break;
> +	case SZ_16K:
> +		reg |= VTCR_TG0_16K;
> +		break;
> +	case SZ_64K:
> +		reg |= VTCR_TG0_4K;
> +		break;
> +	}
> +
> +	switch (smmu->oas) {
> +	case 32:
> +		reg |= VTCR_PS(_AC(0x0,ULL));
> +		break;
> +	case 36:
> +		reg |= VTCR_PS(_AC(0x1,ULL));
> +		break;
> +	case 40:
> +		reg |= VTCR_PS(_AC(0x2,ULL));
> +		break;
> +	case 42:
> +		reg |= VTCR_PS(_AC(0x3,ULL));
> +		break;
> +	case 44:
> +		reg |= VTCR_PS(_AC(0x4,ULL));
> +		break;
> +		case 48:
> +		reg |= VTCR_PS(_AC(0x5,ULL));
> +		break;
> +	case 52:
> +		reg |= VTCR_PS(_AC(0x6,ULL));
> +		break;
> +	}
> +
> +	reg |= VTCR_T0SZ(64ULL - smmu->ias);
> +	reg |= VTCR_SL0(0x2);
> +	reg |= VTCR_VS;
> +
> +	cfg->vtcr   = reg;
> +
>  	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>  	if (vmid < 0)
>  		return vmid;
> +	cfg->vmid  = (u16)vmid;
> +
> +	cfg->vttbr  = page_to_maddr(cfg->domain->arch.p2m.root);
> +
> +	printk(XENLOG_DEBUG
> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n",
> +		   cfg->domain->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
>  
> -	vtcr = &pgtbl_cfg->arm_lpae_s2_cfg.vtcr;
> -	cfg->vmid	= (u16)vmid;
> -	cfg->vttbr	= pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> -	cfg->vtcr	= FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, vtcr->tsz) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, vtcr->sl) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, vtcr->irgn) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, vtcr->orgn) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
> -			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
>  	return 0;
>  }
>  
> @@ -1382,28 +1689,12 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  				    struct arm_smmu_master *master)
>  {
>  	int ret;
> -	unsigned long ias, oas;
> -	int (*finalise_stage_fn)(struct arm_smmu_domain *,
> -				 struct arm_smmu_master *,
> -				 struct io_pgtable_cfg *);
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  
>  	/* Restrict the stage to what we can actually support */
>  	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
>  
> -	switch (smmu_domain->stage) {
> -	case ARM_SMMU_DOMAIN_NESTED:
> -	case ARM_SMMU_DOMAIN_S2:
> -		ias = smmu->ias;
> -		oas = smmu->oas;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s2;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	ret = finalise_stage_fn(smmu_domain, master, &pgtbl_cfg);
> +	ret = arm_smmu_domain_finalise_s2(smmu_domain, master);
>  	if (ret < 0) {
>  		return ret;
>  	}
> @@ -1553,7 +1844,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  		return -ENOMEM;
>  	}
>  
> -	if (!WARN_ON(q->base_dma & (qsz - 1))) {
> +	WARN_ON(q->base_dma & (qsz - 1));
> +	if (unlikely(q->base_dma & (qsz - 1))) {
>  		dev_info(smmu->dev, "allocated %u entries for %s\n",
>  			 1 << q->llq.max_n_shift, name);

We don't need both the WARNING and the dev_info. you could turn the
dev_warn / XENLOG_WARNING.


>  	}
> @@ -1758,9 +2050,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	/* Request interrupt lines */
>  	irq = smmu->evtq.q.irq;
>  	if (irq) {
> -		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						arm_smmu_evtq_thread,
> -						IRQF_ONESHOT,
> +		ret = request_irq(irq, 0, arm_smmu_evtq_irq_tasklet,
>  						"arm-smmu-v3-evtq", smmu);
>  		if (ret < 0)
>  			dev_warn(smmu->dev, "failed to enable evtq irq\n");
> @@ -1770,8 +2060,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  
>  	irq = smmu->gerr_irq;
>  	if (irq) {
> -		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> -				       0, "arm-smmu-v3-gerror", smmu);
> +		ret = request_irq(irq, 0, arm_smmu_gerror_handler,
> +						"arm-smmu-v3-gerror", smmu);
>  		if (ret < 0)
>  			dev_warn(smmu->dev, "failed to enable gerror irq\n");
>  	} else {
> @@ -1781,11 +2071,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	if (smmu->features & ARM_SMMU_FEAT_PRI) {
>  		irq = smmu->priq.q.irq;
>  		if (irq) {
> -			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -							arm_smmu_priq_thread,
> -							IRQF_ONESHOT,
> -							"arm-smmu-v3-priq",
> -							smmu);
> +			ret = request_irq(irq, 0, arm_smmu_priq_irq_tasklet,
> +							"arm-smmu-v3-priq", smmu);
>  			if (ret < 0)
>  				dev_warn(smmu->dev,
>  					 "failed to enable priq irq\n");
> @@ -1814,11 +2101,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  		 * Cavium ThunderX2 implementation doesn't support unique irq
>  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
>  		 */
> -		ret = devm_request_threaded_irq(smmu->dev, irq,
> -					arm_smmu_combined_irq_handler,
> -					arm_smmu_combined_irq_thread,
> -					IRQF_ONESHOT,
> -					"arm-smmu-v3-combined-irq", smmu);
> +		ret = request_irq(irq, 0, arm_smmu_combined_irq_handler,
> +						"arm-smmu-v3-combined-irq", smmu);
>  		if (ret < 0)
>  			dev_warn(smmu->dev, "failed to enable combined irq\n");
>  	} else
> @@ -1857,7 +2141,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
>  	if (reg & CR0_SMMUEN) {
>  		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
> +		WARN_ON(!disable_bypass);
>  		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
>  	}
>  
> @@ -1952,8 +2236,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  		return ret;
>  	}
>  
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_thread, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_thread, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_thread,
> +				 smmu);
>  
>  	/* Enable the SMMU interface, or ensure bypass */
>  	if (!bypass || disable_bypass) {
> @@ -2195,7 +2482,7 @@ static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
>  static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  				    struct arm_smmu_device *smmu)
>  {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = pdev;
>  	u32 cells;
>  	int ret = -EINVAL;
>  
> @@ -2219,130 +2506,449 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
>  		return SZ_128K;
>  }
>  
> +/* Start of Xen specific code. */
>  static int arm_smmu_device_probe(struct platform_device *pdev)
>  {
> -	int irq, ret;
> -	struct resource *res;
> -	resource_size_t ioaddr;
> -	struct arm_smmu_device *smmu;
> -	struct device *dev = &pdev->dev;
> -	bool bypass;
> +    int irq, ret;
> +    paddr_t ioaddr, iosize;
> +    struct arm_smmu_device *smmu;
> +    bool bypass;
> +
> +    smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
> +    if ( !smmu )
> +    {
> +        dev_err(pdev, "failed to allocate arm_smmu_device\n");
> +        return -ENOMEM;
> +    }
> +    smmu->dev = pdev;
> +
> +    if ( pdev->of_node )
> +    {
> +        ret = arm_smmu_device_dt_probe(pdev, smmu);
> +    } else
> +    {

coding style


> +        ret = arm_smmu_device_acpi_probe(pdev, smmu);
> +        if ( ret == -ENODEV )
> +            return ret;
> +    }
> +
> +    /* Set bypass mode according to firmware probing result */
> +    bypass = !!ret;
> +
> +    /* Base address */
> +    ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
> +    if( ret )
> +        return -ENODEV;
> +
> +    if ( iosize < arm_smmu_resource_size(smmu) )
> +    {
> +        dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
> +     * the PMCG registers which are reserved by the PMU driver.

Does this apply to Xen too?


> +     */
> +    smmu->base = ioremap_nocache(ioaddr, iosize);
> +    if ( IS_ERR(smmu->base) )
> +        return PTR_ERR(smmu->base);
> +
> +    if ( iosize > SZ_64K )
> +    {
> +        smmu->page1 = ioremap_nocache(ioaddr + SZ_64K, ARM_SMMU_REG_SZ);
> +        if ( IS_ERR(smmu->page1) )
> +            return PTR_ERR(smmu->page1);
> +    }
> +    else
> +    {
> +        smmu->page1 = smmu->base;
> +    }
> +
> +    /* Interrupt lines */
> +
> +    irq = platform_get_irq_byname_optional(pdev, "combined");
> +    if ( irq > 0 )
> +        smmu->combined_irq = irq;
> +    else
> +    {
> +        irq = platform_get_irq_byname_optional(pdev, "eventq");
> +        if ( irq > 0 )
> +            smmu->evtq.q.irq = irq;
> +
> +        irq = platform_get_irq_byname_optional(pdev, "priq");
> +        if ( irq > 0 )
> +            smmu->priq.q.irq = irq;
> +
> +        irq = platform_get_irq_byname_optional(pdev, "gerror");
> +        if ( irq > 0 )
> +            smmu->gerr_irq = irq;
> +    }
> +    /* Probe the h/w */
> +    ret = arm_smmu_device_hw_probe(smmu);
> +    if ( ret )
> +        return ret;
> +
> +    /* Initialise in-memory data structures */
> +    ret = arm_smmu_init_structures(smmu);
> +    if ( ret )
> +        return ret;
> +
> +    /* Reset the device */
> +    ret = arm_smmu_device_reset(smmu, bypass);
> +    if ( ret )
> +        return ret;
> +
> +    /*
> +     * Keep a list of all probed devices. This will be used to query
> +     * the smmu devices based on the fwnode.
> +     */
> +    INIT_LIST_HEAD(&smmu->devices);
> +
> +    spin_lock(&arm_smmu_devices_lock);
> +    list_add(&smmu->devices, &arm_smmu_devices);
> +    spin_unlock(&arm_smmu_devices_lock);
> +
> +    return 0;
> +}


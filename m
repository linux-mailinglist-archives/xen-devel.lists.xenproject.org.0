Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034292D6D84
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 02:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50032.88492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXF1-00065I-KI; Fri, 11 Dec 2020 01:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50032.88492; Fri, 11 Dec 2020 01:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXF1-00064m-Gn; Fri, 11 Dec 2020 01:29:03 +0000
Received: by outflank-mailman (input) for mailman id 50032;
 Fri, 11 Dec 2020 01:29:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXF0-0005re-Eq
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:29:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79eb2f64-6af5-4a20-ad32-8a1024365f92;
 Fri, 11 Dec 2020 01:29:00 +0000 (UTC)
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
X-Inumbo-ID: 79eb2f64-6af5-4a20-ad32-8a1024365f92
Date: Thu, 10 Dec 2020 17:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650139;
	bh=xwcnFGOKiauXIGJuG56zbmg3yEFtQCGsqTFRlEKBMWo=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=hqXJQhrVwJe4GhPK5EgfQJcMurMepdx4qsGoZEQE60/2v1KP9aqcYxmqHmLJkiUBp
	 XcNlFKmEWtA2PP0jMGaUKRBYLb8KCpi2fGt8eXnZurO7MBRjUPUvQ2QoTLCpfBM/bz
	 4owL/057zD3mpeQhPZ588JADMQizwUsKfbFFhTPHSSqLjuBXL6VsvckemA/3M53+8h
	 B2vGq7UN5O3vatW7r7AEpBiXuqEP4kWJ4P+ALpO6hp7luLxqXQYHiLID8Qxjah+tzS
	 PpmqY0ryWdm99pkW8Tl1P7Kja4d9DcczEg1rXCCOLSX2tTXFGokwAq+3807yeHiLnf
	 +A6054VFnyP4A==
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
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
In-Reply-To: <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012101602530.6285@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Rahul Singh wrote:
> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
> 
> Driver is currently supported as Tech Preview.
> 
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>    that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>    capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>    and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>    access functions based on atomic operations implemented in Linux.
>    Atomic functions used by the commands queue access functions are not
>    implemented in XEN therefore we decided to port the earlier version
>    of the code. Atomic operations are introduced to fix the bottleneck
>    of the SMMU command queue insertion operation. A new algorithm for
>    inserting commands into the queue is introduced, which is lock-free
>    on the fast-path.
>    Consequence of reverting the patch is that the command queue
>    insertion will be slow for large systems as spinlock will be used to
>    serializes accesses from all CPUs to the single queue supported by
>    the hardware. Once the proper atomic operations will be available in
>    XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>    SMMU, as there is no blocking locks implementation available in XEN.
>    This might introduce latency in XEN. Need to investigate before
>    driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>    available in XEN to test the functionality. Code is not tested and
>    compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>    XEN to request MSI interrupts. Code is not tested and compiled. Code
>    is guarded by the flag CONFIG_MSI.

This is much better Rahul, great work!


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v3:
> - added return statement for readx_poll_timeout function.
> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
> - remove struct arm_smmu_xen_device as not required.
> - move dt_property_match_string to device_tree.c file.
> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
> - remove bypass keyword to make sure when device-tree probe is failed we
>   are reporting error and not continuing to configure SMMU in bypass
>   mode.
> - fixed minor comments.
> 
> ---
>  MAINTAINERS                           |   6 +
>  SUPPORT.md                            |   1 +
>  xen/drivers/passthrough/Kconfig       |  11 +
>  xen/drivers/passthrough/arm/Makefile  |   1 +
>  xen/drivers/passthrough/arm/smmu-v3.c | 777 ++++++++++++++++++++++----
>  5 files changed, 683 insertions(+), 113 deletions(-)
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
> index ab02aca5f4..5ee3c8651a 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -67,6 +67,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>      Status, Intel VT-d: Supported
>      Status, ARM SMMUv1: Supported, not security supported
>      Status, ARM SMMUv2: Supported, not security supported
> +    Status, ARM SMMUv3: Tech Preview
>      Status, Renesas IPMMU-VMSA: Supported, not security supported
>  
>  ### ARM/GICv3 ITS
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 0036007ec4..341ba92b30 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -13,6 +13,17 @@ config ARM_SMMU
>  	  Say Y here if your SoC includes an IOMMU device implementing the
>  	  ARM SMMU architecture.
>  
> +config ARM_SMMU_V3
> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> +	depends on ARM_64
> +	---help---
> +	 Support for implementations of the ARM System MMU architecture
> +	 version 3. Driver is in experimental stage and should not be used in
> +	 production.
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
> index 2966015e5d..65b3db94ad 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2,37 +2,268 @@
>  /*
>   * IOMMU API for ARM architected SMMUv3 implementations.
>   *
> + * Based on Linux's SMMUv3 driver:
> + *    drivers/iommu/arm-smmu-v3.c
> + *    commit: ab435ce49bd1d02e33dfec24f76955dc1196970b
> + * and Xen's SMMU driver:
> + *    xen/drivers/passthrough/arm/smmu.c
> + *
> + * Major differences with regard to Linux driver are as follows:
> + *  1. Driver is currently supported as Tech Preview.
> + *  2. Only Stage-2 translation is supported as compared to the Linux driver
> + *     that supports both Stage-1 and Stage-2 translations.
> + *  3. Use P2M  page table instead of creating one as SMMUv3 has the
> + *     capability to share the page tables with the CPU.
> + *  4. Tasklets are used in place of threaded IRQ's in Linux for event queue
> + *     and priority queue IRQ handling.
> + *  5. Latest version of the Linux SMMUv3 code implements the commands queue
> + *     access functions based on atomic operations implemented in Linux.
> + *     Atomic functions used by the commands queue access functions are not
> + *     implemented in XEN therefore we decided to port the earlier version
> + *     of the code. Atomic operations are introduced to fix the bottleneck of
> + *     the SMMU command queue insertion operation. A new algorithm for
> + *     inserting commands into the queue is introduced, which is
> + *     lock-free on the fast-path.
> + *     Consequence of reverting the patch is that the command queue insertion
> + *     will be slow for large systems as spinlock will be used to serializes
> + *     accesses from all CPUs to the single queue supported by the hardware.
> + *     Once the proper atomic operations will be available in XEN the driver
> + *     can be updated.
> + *  6. Spin lock is used in place of Mutex when attaching a device to the SMMU,
> + *     as there is no blocking locks implementation available in XEN.This might
> + *     introduce latency in XEN. Need to investigate before driver is out for
> + *     Tech Preview.
> + *  7. PCI ATS functionality is not supported, as there is no support available
> + *     in XEN to test the functionality. Code is not tested and compiled. Code
> + *     is guarded by the flag CONFIG_PCI_ATS.
> + *  8. MSI interrupts are not supported as there is no support available
> + *     in XEN to request MSI interrupts. Code is not tested and compiled. Code
> + *     is guarded by the flag CONFIG_MSI.
> + *
> + * Following functionality should be supported before driver is out for tech
> + * preview
> + *
> + *  1. Investigate the timing analysis of using spin lock in place of mutex
> + *     when attaching a  device to SMMU.
> + *  2. Merged the latest Linux SMMUv3 driver code once atomic operation is
> + *     available in XEN.
> + *  3. PCI ATS and MSI interrupts should be supported.
> + *  4. Investigate side-effect of using tasklet in place of threaded IRQ and
> + *     fix if any.
> + *  5. fallthorugh keyword should be supported.
> + *  6. Implement the ffsll function in bitops.h file.
> + *
>   * Copyright (C) 2015 ARM Limited
>   *
>   * Author: Will Deacon <will.deacon@arm.com>
>   *
> - * This driver is powered by bad coffee and bombay mix.
> + * Copyright (C) 2020 Arm Ltd
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
>   */
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
> +#include <asm/iommu_fwspec.h>
> +#include <asm/platform.h>
> +
> +/* Linux compatibility functions. */
> +typedef paddr_t		dma_addr_t;
> +typedef paddr_t		phys_addr_t;
> +typedef unsigned int		gfp_t;
> +
> +#define platform_device		device
> +
> +#define GFP_KERNEL		0
> +
> +/* Alias to Xen device tree helpers */
> +#define device_node			dt_device_node
> +#define of_phandle_args		dt_phandle_args
> +#define of_device_id		dt_device_match
> +#define of_match_node		dt_match_node
> +#define of_property_read_u32(np, pname, out)	\
> +		(!dt_property_read_u32(np, pname, out))
> +#define of_property_read_bool		dt_property_read_bool
> +#define of_parse_phandle_with_args	dt_parse_phandle_with_args
> +
> +/* Alias to Xen time functions */
> +#define ktime_t s_time_t
> +#define ktime_get()			(NOW())
> +#define ktime_add_us(t, i)		(t + MICROSECS(i))
> +#define ktime_compare(t, i)		(t > (i))
> +
> +/* Alias to Xen allocation helpers */
> +#define kzalloc(size, flags)	_xzalloc(size, sizeof(void *))
> +#define kfree	xfree
> +#define devm_kzalloc(dev, size, flags)	 _xzalloc(size, sizeof(void *))
> +
> +/* Device logger functions */
> +#define dev_name(dev)	dt_node_full_name(dev->of_node)
> +#define dev_dbg(dev, fmt, ...)			\
> +	printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_notice(dev, fmt, ...)		\
> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_warn(dev, fmt, ...)			\
> +	printk(XENLOG_WARNING "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_err(dev, fmt, ...)			\
> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_info(dev, fmt, ...)			\
> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_err_ratelimited(dev, fmt, ...)			\
> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +
> +/*
> + * Periodically poll an address and wait between reads in us until a
> + * condition is met or a timeout occurs.
> + *
> + * @return: 0 when cond met, -ETIMEDOUT upon timeout
> + */
> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
> +({		\
> +	s_time_t deadline = NOW() + MICROSECS(timeout_us);		\
> +	for (;;) {		\
> +		(val) = op(addr);		\
> +		if (cond)		\
> +			break;		\
> +		if (NOW() > deadline) {		\
> +			(val) = op(addr);		\
> +			break;		\
> +		}		\
> +		udelay(sleep_us);		\
> +	}		\
> +	(cond) ? 0 : -ETIMEDOUT;		\
> +})

NIT: alignment of the '\'


> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us)	\
> +	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us)
> +
> +#define FIELD_PREP(_mask, _val)			\
> +	(((typeof(_mask))(_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
> +
> +#define FIELD_GET(_mask, _reg)			\
> +	(typeof(_mask))(((_reg) & (_mask)) >> (__builtin_ffsll(_mask) - 1))

let's add ffsll to bitops.h


> +/*
> + * Helpers for DMA allocation. Just the function name is reused for
> + * porting code, these allocation are not managed allocations
> + */
> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
> +				paddr_t *dma_handle, gfp_t gfp)
> +{
> +	void *vaddr;
> +	unsigned long alignment = size;
> +
> +	/*
> +	 * _xzalloc requires that the (align & (align -1)) = 0. Most of the
> +	 * allocations in SMMU code should send the right value for size. In
> +	 * case this is not true print a warning and align to the size of a
> +	 * (void *)
> +	 */
> +	if (size & (size - 1)) {
> +		printk(XENLOG_WARNING "SMMUv3: Fixing alignment for the DMA buffer\n");
> +		alignment = sizeof(void *);
> +	}
> +
> +	vaddr = _xzalloc(size, alignment);
> +	if (!vaddr) {
> +		printk(XENLOG_ERR "SMMUv3: DMA allocation failed\n");
> +		return NULL;
> +	}
> +
> +	*dma_handle = virt_to_maddr(vaddr);
> +
> +	return vaddr;
> +}
> +
> +
> +/* Xen specific code. */
> +struct iommu_domain {
> +	/* Runtime SMMU configuration for this iommu_domain */
> +	atomic_t		ref;
> +	/*
> +	 * Used to link iommu_domain contexts for a same domain.
> +	 * There is at least one per-SMMU to used by the domain.
> +	 */
> +	struct list_head		list;
> +};
>  
> +/* Describes information required for a Xen domain */
> +struct arm_smmu_xen_domain {
> +	spinlock_t		lock;
> +
> +	/* List of iommu domains associated to this domain */
> +	struct list_head	contexts;
> +};
> +
> +
> +/* Keep a list of devices associated with this driver */
> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
> +static LIST_HEAD(arm_smmu_devices);
> +
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +	return fwspec && fwspec->iommu_priv ? fwspec->iommu_priv : NULL;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +	fwspec->iommu_priv = priv;
> +}
> +
> +static int platform_get_irq_byname_optional(struct device *dev,
> +				const char *name)
> +{
> +	int index, ret;
> +	struct dt_device_node *np  = dev_to_dt(dev);
> +
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	index = dt_property_match_string(np, "interrupt-names", name);
> +	if (index < 0) {
> +		dev_info(dev, "IRQ %s not found\n", name);
> +		return index;
> +	}
> +
> +	ret = platform_get_irq(np, index);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get irq index %d\n", index);
> +		return -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +/* Start of Linux SMMUv3 code */
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
>  #define IDR0_ST_LVL			GENMASK(28, 27)
> @@ -402,6 +633,7 @@ enum pri_resp {
>  	PRI_RESP_SUCC = 2,
>  };
>  
> +#ifdef CONFIF_MSI

CONFIG_MSI


>  enum arm_smmu_msi_index {
>  	EVTQ_MSI_INDEX,
>  	GERROR_MSI_INDEX,
> @@ -426,6 +658,7 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
>  		ARM_SMMU_PRIQ_IRQ_CFG2,
>  	},
>  };
> +#endif
>  
>  struct arm_smmu_cmdq_ent {
>  	/* Common fields */
> @@ -534,6 +767,7 @@ struct arm_smmu_s2_cfg {
>  	u16				vmid;
>  	u64				vttbr;
>  	u64				vtcr;
> +	struct domain		*domain;
>  };

This looks like a strange struct to add a pointer back to *domain. Maybe
struct arm_smmu_domain would be a better place for it?


>  struct arm_smmu_strtab_cfg {
> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>  		u64			padding;
>  	};
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
> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>  
>  struct arm_smmu_domain {
>  	struct arm_smmu_device		*smmu;
> -	struct mutex			init_mutex; /* Protects smmu pointer */
>  
>  	bool				non_strict;
>  	atomic_t			nr_ats_masters;
> @@ -987,6 +1225,7 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>  	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>  }
>  
> +#ifdef CONFIF_MSI

CONFIG_MSI


>  /*
>   * The difference between val and sync_idx is bounded by the maximum size of
>   * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmetic.
> @@ -1030,6 +1269,13 @@ static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
>  
>  	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>  }
> +#else
> +static inline int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MSI */
> +
>  
>  static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>  {
> @@ -1072,7 +1318,7 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
>  	val |= desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>  
>  	/* See comment in arm_smmu_write_ctx_desc() */
> -	WRITE_ONCE(*dst, cpu_to_le64(val));
> +	write_atomic(dst, cpu_to_le64(val));
>  }
>  
>  static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
> @@ -1187,7 +1433,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  						 STRTAB_STE_1_EATS_TRANS));
>  
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
> -	WRITE_ONCE(dst[0], cpu_to_le64(val));
> +	write_atomic(&dst[0], cpu_to_le64(val));
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
>  
>  	/* It's likely that we'll want to use the new STE soon */
> @@ -1234,7 +1480,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  }
>  
>  /* IRQ and event handlers */
> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> +static void arm_smmu_evtq_tasklet(void *dev)
>  {
>  	int i;
>  	struct arm_smmu_device *smmu = dev;
> @@ -1264,7 +1510,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  	/* Sync our overflow flag, as we believe we're up to speed */
>  	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>  		    Q_IDX(llq, llq->cons);
> -	return IRQ_HANDLED;
>  }
>  
>  static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
> @@ -1305,7 +1550,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>  	}
>  }
>  
> -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> +static void arm_smmu_priq_tasklet(void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  	struct arm_smmu_queue *q = &smmu->priq.q;
> @@ -1324,12 +1569,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
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
> @@ -1339,7 +1584,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  
>  	active = gerror ^ gerrorn;
>  	if (!(active & GERROR_ERR_MASK))
> -		return IRQ_NONE; /* No errors pending */
> +		return; /* No errors pending */
>  
>  	dev_warn(smmu->dev,
>  		 "unexpected global error reported (0x%08x), this could be serious\n",
> @@ -1372,26 +1617,44 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
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
> +	struct arm_smmu_device *smmu = dev;
> +
> +	arm_smmu_gerror_handler(irq, dev, regs);
> +
> +	tasklet_schedule(&(smmu->combined_irq_tasklet));
> +}
> +
> +static void arm_smmu_combined_irq_tasklet(void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
>  
> -	arm_smmu_evtq_thread(irq, dev);
> +	arm_smmu_evtq_tasklet(dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		arm_smmu_priq_thread(irq, dev);
> +		arm_smmu_priq_tasklet(dev);
> +}
>  
> -	return IRQ_HANDLED;
> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> +{
> +	struct arm_smmu_device *smmu = dev;
> +
> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
>  }
>  
> -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> -	return IRQ_WAKE_THREAD;
> +	struct arm_smmu_device *smmu = dev;
> +
> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
>  }
>  
> +#ifdef CONFIG_PCI_ATS
>  static void
>  arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  			struct arm_smmu_cmdq_ent *cmd)
> @@ -1498,6 +1761,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  
>  	return ret ? -ETIMEDOUT : 0;
>  }
> +#endif
>  
>  static void arm_smmu_tlb_inv_context(void *cookie)
>  {
> @@ -1532,7 +1796,6 @@ static struct iommu_domain *arm_smmu_domain_alloc(void)
>  	if (!smmu_domain)
>  		return NULL;
>  
> -	mutex_init(&smmu_domain->init_mutex);
>  	INIT_LIST_HEAD(&smmu_domain->devices);
>  	spin_lock_init(&smmu_domain->devices_lock);
>  
> @@ -1578,6 +1841,17 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>  	typeof(&arm_lpae_s2_cfg.vtcr) vtcr = &arm_lpae_s2_cfg.vtcr;
> +	uint64_t reg = READ_SYSREG64(VTCR_EL2);
> +
> +	vtcr->tsz	= FIELD_GET(STRTAB_STE_2_VTCR_S2T0SZ, reg);
> +	vtcr->sl	= FIELD_GET(STRTAB_STE_2_VTCR_S2SL0, reg);
> +	vtcr->irgn	= FIELD_GET(STRTAB_STE_2_VTCR_S2IR0, reg);
> +	vtcr->orgn	= FIELD_GET(STRTAB_STE_2_VTCR_S2OR0, reg);
> +	vtcr->sh	= FIELD_GET(STRTAB_STE_2_VTCR_S2SH0, reg);
> +	vtcr->tg	= FIELD_GET(STRTAB_STE_2_VTCR_S2TG, reg);
> +	vtcr->ps	= FIELD_GET(STRTAB_STE_2_VTCR_S2PS, reg);
> +
> +	arm_lpae_s2_cfg.vttbr  = page_to_maddr(cfg->domain->arch.p2m.root);
>  
>  	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>  	if (vmid < 0)
> @@ -1592,6 +1866,11 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
> +
> +	printk(XENLOG_DEBUG
> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n",
> +		   cfg->domain->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
> +
>  	return 0;
>  }
>  
> @@ -1653,6 +1932,7 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>  	}
>  }
>  
> +#ifdef CONFIG_PCI_ATS
>  static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>  {
>  	struct device *dev = master->dev;
> @@ -1751,6 +2031,23 @@ static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>  
>  	pci_disable_pasid(pdev);
>  }
> +#else
> +static inline bool arm_smmu_ats_supported(struct arm_smmu_master *master)
> +{
> +	return false;
> +}
> +
> +static inline void arm_smmu_enable_ats(struct arm_smmu_master *master) { }
> +
> +static inline void arm_smmu_disable_ats(struct arm_smmu_master *master) { }
> +
> +static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
> +{
> +	return 0;
> +}
> +
> +static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
> +#endif
>  
>  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>  {
> @@ -1788,8 +2085,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  
>  	arm_smmu_detach_dev(master);
>  
> -	mutex_lock(&smmu_domain->init_mutex);
> -
>  	if (!smmu_domain->smmu) {
>  		smmu_domain->smmu = smmu;
>  		ret = arm_smmu_domain_finalise(domain, master);
> @@ -1820,7 +2115,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	arm_smmu_enable_ats(master);
>  
>  out_unlock:
> -	mutex_unlock(&smmu_domain->init_mutex);
>  	return ret;
>  }
>  
> @@ -1833,8 +2127,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  
>  	return sid < limit;
>  }
> +/* Forward declaration */
> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
>  
> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> +static int arm_smmu_add_device(u8 devfn, struct device *dev)
>  {
>  	int i, ret;
>  	struct arm_smmu_device *smmu;
> @@ -1842,14 +2138,15 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  
>  	if (!fwspec)
> -		return ERR_PTR(-ENODEV);
> +		return -ENODEV;
>  
> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
> -		return ERR_PTR(-EBUSY);
> +	smmu = arm_smmu_get_by_dev(fwspec->iommu_dev);
> +	if (!smmu)
> +		return -ENODEV;
>  
>  	master = kzalloc(sizeof(*master), GFP_KERNEL);
>  	if (!master)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>  
>  	master->dev = dev;
>  	master->smmu = smmu;
> @@ -1884,17 +2181,36 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  	 */
>  	arm_smmu_enable_pasid(master);
>  
> -	return &smmu->iommu;
> +	return 0;
>  
>  err_free_master:
>  	kfree(master);
>  	dev_iommu_priv_set(dev, NULL);
> -	return ERR_PTR(ret);
> +	return ret;
>  }
>  
> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
> +static int arm_smmu_dt_xlate(struct device *dev,
> +				const struct dt_phandle_args *args)
>  {
> -	return iommu_fwspec_add_ids(dev, args->args, 1);
> +	int ret;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +	ret = iommu_fwspec_add_ids(dev, args->args, 1);
> +	if (ret)
> +		return ret;
> +
> +	if (dt_device_is_protected(dev_to_dt(dev))) {
> +		dev_err(dev, "Already added to SMMUv3\n");
> +		return -EEXIST;
> +	}
> +
> +	/* Let Xen know that the master device is protected by an IOMMU. */
> +	dt_device_set_protected(dev_to_dt(dev));
> +
> +	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
> +			dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	return 0;
>  }
>  
>  /* Probing and initialisation functions */
> @@ -1923,8 +2239,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  		return -ENOMEM;
>  	}
>  
> -	if (!WARN_ON(q->base_dma & (qsz - 1))) {
> -		dev_info(smmu->dev, "allocated %u entries for %s\n",
> +	if (unlikely(q->base_dma & (qsz - 1))) {
> +		dev_warn(smmu->dev, "allocated %u entries for %s\n",
>  			 1 << q->llq.max_n_shift, name);
>  	}
>  
> @@ -2121,6 +2437,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
>  	return ret;
>  }
>  
> +#ifdef CONFIF_MSI

CONFIG_MSI


>  static void arm_smmu_free_msis(void *data)
>  {
>  	struct device *dev = data;
> @@ -2191,6 +2508,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>  	/* Add callback to free MSIs on teardown */
>  	devm_add_action(dev, arm_smmu_free_msis, dev);
>  }
> +#else
> +static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
> +#endif /* CONFIG_MSI */
>  
>  static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  {
> @@ -2201,9 +2521,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
> @@ -2213,8 +2531,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
> @@ -2224,11 +2542,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
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
> @@ -2257,11 +2572,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
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
> @@ -2290,7 +2602,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> -static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> @@ -2300,7 +2612,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
>  	if (reg & CR0_SMMUEN) {
>  		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
> +		WARN_ON(!disable_bypass);
>  		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
>  	}
>  
> @@ -2404,11 +2716,14 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  		return ret;
>  	}
>  
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
> +				 smmu);
>  
>  	/* Enable the SMMU interface, or ensure bypass */
> -	if (!bypass || disable_bypass) {
> +	if (disable_bypass) {
>  		enables |= CR0_SMMUEN;
>  	} else {
>  		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> @@ -2473,8 +2788,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (reg & IDR0_SEV)
>  		smmu->features |= ARM_SMMU_FEAT_SEV;
>  
> +#ifdef CONFIF_MSI

CONFIG_MSI


>  	if (reg & IDR0_MSI)
>  		smmu->features |= ARM_SMMU_FEAT_MSI;
> +#endif
>  
>  	if (reg & IDR0_HYP)
>  		smmu->features |= ARM_SMMU_FEAT_HYP;
> @@ -2499,7 +2816,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>  
>  	if (!(reg & IDR0_S2P)) {
> -		dev_err(smmu->dev, "no translation support!\n");
> +		dev_err(smmu->dev, "no stage-2 translation support!\n");
>  		return -ENXIO;
>  	}
>  
> @@ -2648,7 +2965,7 @@ static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
>  static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  				    struct arm_smmu_device *smmu)
>  {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = pdev;
>  	u32 cells;
>  	int ret = -EINVAL;
>  
> @@ -2661,7 +2978,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  
>  	parse_driver_options(smmu);
>  
> -	if (of_dma_is_coherent(dev->of_node))
> +	if (dt_get_property(dev->of_node, "dma-coherent", NULL))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
>  	return ret;
> @@ -2675,63 +2992,49 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
>  		return SZ_128K;
>  }
>  
> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
> -				      resource_size_t size)
> -{
> -	struct resource res = {
> -		.flags = IORESOURCE_MEM,
> -		.start = start,
> -		.end = start + size - 1,
> -	};
> -
> -	return devm_ioremap_resource(dev, &res);
> -}
> -
>  static int arm_smmu_device_probe(struct platform_device *pdev)
>  {
>  	int irq, ret;
> -	struct resource *res;
> -	resource_size_t ioaddr;
> +	paddr_t ioaddr, iosize;
>  	struct arm_smmu_device *smmu;
> -	struct device *dev = &pdev->dev;
> -	bool bypass;
>  
> -	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
> +	smmu = devm_kzalloc(pdev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> -		dev_err(dev, "failed to allocate arm_smmu_device\n");
> +		dev_err(pdev, "failed to allocate arm_smmu_device\n");
>  		return -ENOMEM;
>  	}
> -	smmu->dev = dev;
> +	smmu->dev = pdev;
>  
> -	if (dev->of_node) {
> +	if (pdev->of_node) {
>  		ret = arm_smmu_device_dt_probe(pdev, smmu);
> +		if (ret)
> +			return -EINVAL;
>  	} else {
>  		ret = arm_smmu_device_acpi_probe(pdev, smmu);
>  		if (ret == -ENODEV)
>  			return ret;
>  	}
>  
> -	/* Set bypass mode according to firmware probing result */
> -	bypass = !!ret;
> -
>  	/* Base address */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
> -		dev_err(dev, "MMIO region too small (%pr)\n", res);
> +	ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
> +	if (ret)
> +		return -ENODEV;
> +
> +	if (iosize < arm_smmu_resource_size(smmu)) {
> +		dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>  		return -EINVAL;
>  	}
> -	ioaddr = res->start;
>  
>  	/*
>  	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>  	 * the PMCG registers which are reserved by the PMU driver.
>  	 */

Which PMU driver?


> -	smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
> +	smmu->base = ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>  	if (IS_ERR(smmu->base))
>  		return PTR_ERR(smmu->base);
>  
> -	if (arm_smmu_resource_size(smmu) > SZ_64K) {
> -		smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
> +	if (iosize > SZ_64K) {
> +		smmu->page1 = ioremap_nocache(ioaddr + SZ_64K,
>  					       ARM_SMMU_REG_SZ);
>  		if (IS_ERR(smmu->page1))
>  			return PTR_ERR(smmu->page1);
> @@ -2768,14 +3071,262 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	/* Reset the device */
> -	ret = arm_smmu_device_reset(smmu, bypass);
> +	ret = arm_smmu_device_reset(smmu);
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Keep a list of all probed devices. This will be used to query
> +	 * the smmu devices based on the fwnode.
> +	 */
> +	INIT_LIST_HEAD(&smmu->devices);
> +
> +	spin_lock(&arm_smmu_devices_lock);
> +	list_add(&smmu->devices, &arm_smmu_devices);
> +	spin_unlock(&arm_smmu_devices_lock);
> +
>  	return 0;
>  }
>  
> -static const struct of_device_id arm_smmu_of_match[] = {
> +static const struct dt_device_match arm_smmu_of_match[] = {
>  	{ .compatible = "arm,smmu-v3", },
>  	{ },
>  };
> +
> +/* Start of Xen specific code. */
> +static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +	struct iommu_domain *io_domain;
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +		/*
> +		 * Only invalidate the context when SMMU is present.
> +		 * This is because the context initialization is delayed
> +		 * until a master has been added.
> +		 */
> +		if (unlikely(!ACCESS_ONCE(to_smmu_domain(io_domain)->smmu)))
> +			continue;
> +
> +		arm_smmu_tlb_inv_context(to_smmu_domain(io_domain));
> +	}
> +
> +	spin_unlock(&xen_domain->lock);
> +
> +	return 0;
> +}
> +
> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
> +				unsigned long page_count, unsigned int flush_flags)
> +{
> +	return arm_smmu_iotlb_flush_all(d);
> +}
> +
> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
> +{
> +	struct arm_smmu_device *smmu = NULL;
> +
> +	spin_lock(&arm_smmu_devices_lock);
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices) {
> +		if (smmu->dev  == dev) {
> +			spin_unlock(&arm_smmu_devices_lock);
> +			return smmu;
> +		}
> +	}
> +
> +	spin_unlock(&arm_smmu_devices_lock);
> +
> +	return NULL;
> +}
> +
> +static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
> +				struct device *dev)
> +{
> +	struct iommu_domain *io_domain;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +	struct arm_smmu_device *smmu = arm_smmu_get_by_dev(fwspec->iommu_dev);
> +
> +	if (!smmu)
> +		return NULL;
> +
> +	/*
> +	 * Loop through the &xen_domain->contexts to locate a context
> +	 * assigned to this SMMU
> +	 */
> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +		smmu_domain = to_smmu_domain(io_domain);
> +		if (smmu_domain->smmu == smmu)
> +			return io_domain;
> +	}
> +	return NULL;
> +}
> +
> +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *io_domain)
> +{
> +	list_del(&io_domain->list);
> +	arm_smmu_domain_free(io_domain);
> +}
> +
> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
> +		struct device *dev, u32 flag)
> +{
> +	int ret = 0;
> +	struct iommu_domain *io_domain;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	/*
> +	 * Check to see if an iommu_domain already exists for this xen domain
> +	 * under the same SMMU
> +	 */
> +	io_domain = arm_smmu_get_domain(d, dev);
> +	if (!io_domain) {
> +		io_domain = arm_smmu_domain_alloc();
> +		if (!io_domain) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		smmu_domain = to_smmu_domain(io_domain);
> +		smmu_domain->s2_cfg.domain = d;
> +
> +		/* Chain the new context to the domain */
> +		list_add(&io_domain->list, &xen_domain->contexts);
> +	}
> +
> +	ret = arm_smmu_attach_dev(io_domain, dev);
> +	if (ret) {
> +		if (io_domain->ref.counter == 0)
> +			arm_smmu_destroy_iommu_domain(io_domain);
> +	} else {
> +		atomic_inc(&io_domain->ref);
> +	}
> +
> +out:
> +	spin_unlock(&xen_domain->lock);
> +	return ret;
> +}
> +
> +static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
> +{
> +	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +	struct arm_smmu_domain *arm_smmu = to_smmu_domain(io_domain);
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +
> +	if (!arm_smmu || arm_smmu->s2_cfg.domain != d) {
> +		dev_err(dev, " not attached to domain %d\n", d->domain_id);
> +		return -ESRCH;
> +	}
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	arm_smmu_detach_dev(master);
> +	atomic_dec(&io_domain->ref);
> +
> +	if (io_domain->ref.counter == 0)
> +		arm_smmu_destroy_iommu_domain(io_domain);
> +
> +	spin_unlock(&xen_domain->lock);
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
> +				u8 devfn,  struct device *dev)
> +{
> +	int ret = 0;
> +
> +	/* Don't allow remapping on other domain than hwdom */
> +	if (t && t != hardware_domain)
> +		return -EPERM;
> +
> +	if (t == s)
> +		return 0;
> +
> +	ret = arm_smmu_deassign_dev(s, dev);
> +	if (ret)
> +		return ret;
> +
> +	if (t) {
> +		/* No flags are defined for ARM. */
> +		ret = arm_smmu_assign_dev(t, devfn, dev, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain;
> +
> +	xen_domain = xzalloc(struct arm_smmu_xen_domain);
> +	if (!xen_domain)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&xen_domain->lock);
> +	INIT_LIST_HEAD(&xen_domain->contexts);
> +
> +	dom_iommu(d)->arch.priv = xen_domain;
> +	return 0;
> +
> +}
> +
> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> +{
> +}
> +
> +static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +
> +	ASSERT(list_empty(&xen_domain->contexts));
> +	xfree(xen_domain);
> +}
> +
> +static const struct iommu_ops arm_smmu_iommu_ops = {
> +	.init		= arm_smmu_iommu_xen_domain_init,
> +	.hwdom_init		= arm_smmu_iommu_hwdom_init,
> +	.teardown		= arm_smmu_iommu_xen_domain_teardown,
> +	.iotlb_flush		= arm_smmu_iotlb_flush,
> +	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
> +	.assign_device		= arm_smmu_assign_dev,
> +	.reassign_device	= arm_smmu_reassign_dev,
> +	.map_page		= arm_iommu_map_page,
> +	.unmap_page		= arm_iommu_unmap_page,
> +	.dt_xlate		= arm_smmu_dt_xlate,
> +	.add_device		= arm_smmu_add_device,
> +};
> +
> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> +				const void *data)
> +{
> +	int rc;
> +
> +	/*
> +	 * Even if the device can't be initialized, we don't want to
> +	 * give the SMMU device to dom0.
> +	 */
> +	dt_device_set_used_by(dev, DOMID_XEN);
> +
> +	rc = arm_smmu_device_probe(dt_to_dev(dev));
> +	if (rc)
> +		return rc;
> +
> +	iommu_set_ops(&arm_smmu_iommu_ops);
> +
> +	return 0;
> +}
> +
> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
> +.dt_match = arm_smmu_of_match,
> +.init = arm_smmu_dt_init,
> +DT_DEVICE_END
> -- 
> 2.17.1
> 


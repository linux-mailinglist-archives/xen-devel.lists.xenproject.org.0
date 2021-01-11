Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF2F1A7D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 17:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65021.115063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzlK-00010m-NM; Mon, 11 Jan 2021 16:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65021.115063; Mon, 11 Jan 2021 16:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyzlK-00010N-JQ; Mon, 11 Jan 2021 16:09:46 +0000
Received: by outflank-mailman (input) for mailman id 65021;
 Mon, 11 Jan 2021 16:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oy8T=GO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kyzlJ-00010H-NU
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 16:09:45 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e3c264c-2e17-4c37-a5a7-b16d99dfad2c;
 Mon, 11 Jan 2021 16:09:41 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id dk8so316818edb.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 08:09:41 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d4sm145260edq.36.2021.01.11.08.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 08:09:39 -0800 (PST)
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
X-Inumbo-ID: 3e3c264c-2e17-4c37-a5a7-b16d99dfad2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7sXgYQJYWj4V2eCdoZmr28oqQTW2WDSt68IHMqxqHog=;
        b=owis3pm3mUsVPhRddrwU3RduUvLtd9nSmWNtcHTSouGQticz4vBfs5RbRqKlj72+Y4
         hDQYdzcowFo29uJizRaEnsnu0NbGytPXlzJkg7BXm9iHYcv+TMa8Da9NBIkCB5MGa96n
         G1qZwPNErLhhuM2mVRHLPhCkSaAE56G+eobzSvQMuOCTS9lWKz3W8Us68IFyYYuJrd49
         TQyVUXJnuB+KBzpnn59CjY66kfizzmX8PQ7RErO6nNFBImIYWudVl36xZLsiUJSQLreX
         MxCMRWjAnllKMUfv1hLa9USk+lXCa9UXHbNoy/MCoTQsMd3KSrwX9DyTUDtmZbZfeUxm
         LlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7sXgYQJYWj4V2eCdoZmr28oqQTW2WDSt68IHMqxqHog=;
        b=R4PqvVA0rLaWrk2CB3aOnedkO0nFhZDiXsVMsOdAUqy6HosNJhIVos2EhXv3kJBVQJ
         dbFb6fkbmUr3hllTewDqEfgl7+nOfEPXL4m1+MYaT39WcDJsAZYzzpFtkvwVheULb6fE
         cpN4DiC8PZ+U5+CtjuDVmSAK9Hxz/+5u98H7TIQDsr8qobTSoeJ2g9LZItqheDKy8Bzm
         z8DITzFwP7mlNCCD/nOzhmFoNyp43l+LEMRBOUhlTFlXWQbuE08+4X+biuAOIXNx/JlI
         zKlIlCHU6yP3ghE7HdfRBBlbkjN2jmK1W5RdnPHT/gN8FnJE8O0JCi0Uf+os/KwdMn6L
         2x0A==
X-Gm-Message-State: AOAM532Q0zQmb7yT/IN+ivFoPsaA0svwHlwZ+He9xixdlUyTnLygYFuQ
	nMxL9etnzhEoFGTMDPZM5OM=
X-Google-Smtp-Source: ABdhPJyFLm5CXLVubhDBQgE86d9GUMnS1r+pFQvyqKR6LqtwYZEGrj7oMWuO4gOXtaRkV+jAgPTxbQ==
X-Received: by 2002:a50:f604:: with SMTP id c4mr62103edn.307.1610381380135;
        Mon, 11 Jan 2021 08:09:40 -0800 (PST)
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
Date: Mon, 11 Jan 2021 18:09:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 08.01.21 16:46, Rahul Singh wrote:

Hi Rahul

> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
>
> Driver is currently supported as Tech Preview.
>
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>     that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>     capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>     and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>     access functions based on atomic operations implemented in Linux.
>     Atomic functions used by the commands queue access functions are not
>     implemented in XEN therefore we decided to port the earlier version
>     of the code. Atomic operations are introduced to fix the bottleneck
>     of the SMMU command queue insertion operation. A new algorithm for
>     inserting commands into the queue is introduced, which is lock-free
>     on the fast-path.
>     Consequence of reverting the patch is that the command queue
>     insertion will be slow for large systems as spinlock will be used to
>     serializes accesses from all CPUs to the single queue supported by
>     the hardware. Once the proper atomic operations will be available in
>     XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>     SMMU, as there is no blocking locks implementation available in XEN.
>     This might introduce latency in XEN. Need to investigate before
>     driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>     available in XEN to test the functionality. Code is not tested and
>     compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>     XEN to request MSI interrupts. Code is not tested and compiled. Code
>     is guarded by the flag CONFIG_MSI.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V3:
> - added return statement for readx_poll_timeout function.
> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
> - remove struct arm_smmu_xen_device as not required.
> - move dt_property_match_string to device_tree.c file.
> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
> - remove bypass keyword to make sure when device-tree probe is failed we
>    are reporting error and not continuing to configure SMMU in bypass
>    mode.
> - fixed minor comments.
> Changes in V4:
> - Fixed typo for CONFIG_MSI
> - Added back the mutex code
> - Rebase the patch on top of newly added WARN_ON().
> - Remove the direct read of register VTCR_EL2.
> - Fixed minor comments.
> ---
>   MAINTAINERS                           |   6 +
>   SUPPORT.md                            |   1 +
>   xen/drivers/passthrough/Kconfig       |  11 +
>   xen/drivers/passthrough/arm/Makefile  |   1 +
>   xen/drivers/passthrough/arm/smmu-v3.c | 808 ++++++++++++++++++++++----
>   5 files changed, 715 insertions(+), 112 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dbd99aff4..d832e8fd65 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,12 @@ F:	xen/include/asm-arm/
>   F:	xen/include/public/arch-arm/
>   F:	xen/include/public/arch-arm.h
>   
> +ARM SMMUv3
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> +M:	Rahul Singh <rahul.singh@arm.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/arm/smmu-v3.c
> +
>   Change Log
>   M:	Paul Durrant <paul@xen.org>
>   R:	Community Manager <community.manager@xenproject.org>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab02aca5f4..5ee3c8651a 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -67,6 +67,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>       Status, Intel VT-d: Supported
>       Status, ARM SMMUv1: Supported, not security supported
>       Status, ARM SMMUv2: Supported, not security supported
> +    Status, ARM SMMUv3: Tech Preview
>       Status, Renesas IPMMU-VMSA: Supported, not security supported
>   
>   ### ARM/GICv3 ITS
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 0036007ec4..341ba92b30 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -13,6 +13,17 @@ config ARM_SMMU
>   	  Say Y here if your SoC includes an IOMMU device implementing the
>   	  ARM SMMU architecture.
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
>   config IPMMU_VMSA
>   	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>   	depends on ARM_64
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index fcd918ea3e..c5fb3b58a5 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -1,3 +1,4 @@
>   obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>   obj-$(CONFIG_ARM_SMMU) += smmu.o
>   obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
> +obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 2dfadc6a65..e53f9f4c21 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2,37 +2,263 @@
>   /*
>    * IOMMU API for ARM architected SMMUv3 implementations.
>    *
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
> + *     when attaching devices to SMMU.
> + *  2. Merged the latest Linux SMMUv3 driver code once atomic operation is
> + *     available in XEN.
> + *  3. PCI ATS and MSI interrupts should be supported.
> + *  4. Investigate side-effect of using tasklet in place of threaded IRQ and
> + *     fix if any.
> + *
>    * Copyright (C) 2015 ARM Limited
>    *
>    * Author: Will Deacon <will.deacon@arm.com>
>    *
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
> +#include <asm/iommu_fwspec.h>
> +#include <asm/platform.h>
> +
> +
> +#define ARM_SMMU_VTCR_SH_IS		3
> +#define ARM_SMMU_VTCR_RGN_WBWA		1
> +#define ARM_SMMU_VTCR_TG0_4K		0
> +#define ARM_SMMU_VTCR_PS_32_BIT		0x0ULL
> +#define ARM_SMMU_VTCR_PS_36_BIT		0x1ULL
> +#define ARM_SMMU_VTCR_PS_40_BIT		0x2ULL
> +#define ARM_SMMU_VTCR_PS_42_BIT		0x3ULL
> +#define ARM_SMMU_VTCR_PS_44_BIT		0x4ULL
> +#define ARM_SMMU_VTCR_PS_48_BIT		0x5ULL
> +#define ARM_SMMU_VTCR_PS_52_BIT		0x6ULL
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
> +/* Alias to Xen lock functions */
> +#define mutex spinlock
> +#define mutex_init spin_lock_init
> +#define mutex_lock spin_lock
> +#define mutex_unlock spin_unlock
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
> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us) \
> +({ \
> +	s_time_t deadline = NOW() + MICROSECS(timeout_us); \
> +	for (;;) { \
> +		(val) = op(addr); \
> +		if (cond) \
> +			break; \
> +		if (NOW() > deadline) { \
> +			(val) = op(addr); \
> +			break; \
> +		} \
> +		udelay(sleep_us); \
> +	} \
> +	(cond) ? 0 : -ETIMEDOUT; \
> +})
> +
> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us)	\
> +	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us)
> +
> +#define FIELD_PREP(_mask, _val)			\
> +	(((typeof(_mask))(_val) << (ffsll(_mask) - 1)) & (_mask))
> +
> +#define FIELD_GET(_mask, _reg)			\
> +	((typeof(_mask))(((_reg) & (_mask)) >> (ffsll(_mask) - 1)))
> +
> +/*
> + * Helpers for DMA allocation. Just the function name is reused for
> + * porting code, these allocation are not managed allocations
>    */
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
> +/* Describes information required for a Xen domain */
> +struct arm_smmu_xen_domain {
> +	spinlock_t		lock;
>   
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
>   /* MMIO registers */
>   #define ARM_SMMU_IDR0			0x0
>   #define IDR0_ST_LVL			GENMASK(28, 27)
> @@ -402,6 +628,7 @@ enum pri_resp {
>   	PRI_RESP_SUCC = 2,
>   };
>   
> +#ifdef CONFIG_MSI
>   enum arm_smmu_msi_index {
>   	EVTQ_MSI_INDEX,
>   	GERROR_MSI_INDEX,
> @@ -426,6 +653,7 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
>   		ARM_SMMU_PRIQ_IRQ_CFG2,
>   	},
>   };
> +#endif /* CONFIG_MSI */
>   
>   struct arm_smmu_cmdq_ent {
>   	/* Common fields */
> @@ -613,8 +841,13 @@ struct arm_smmu_device {
>   		u64			padding;
>   	};
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
>   };
>   
>   /* SMMU private data for each master */
> @@ -646,6 +879,9 @@ struct arm_smmu_domain {
>   	enum arm_smmu_domain_stage	stage;
>   	struct arm_smmu_s2_cfg	s2_cfg;
>   
> +	/* Xen domain associated with this SMMU domain */
> +	struct domain		*d;
> +
>   	struct iommu_domain		domain;
>   
>   	struct list_head		devices;
> @@ -984,6 +1220,7 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>   	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>   }
>   
> +#ifdef CONFIG_MSI
>   /*
>    * The difference between val and sync_idx is bounded by the maximum size of
>    * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmetic.
> @@ -1027,6 +1264,13 @@ static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
>   
>   	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>   }
> +#else
> +static inline int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MSI */
> +
>   
>   static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>   {
> @@ -1069,7 +1313,7 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
>   	val |= desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>   
>   	/* See comment in arm_smmu_write_ctx_desc() */
> -	WRITE_ONCE(*dst, cpu_to_le64(val));
> +	write_atomic(dst, cpu_to_le64(val));
>   }
>   
>   static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
> @@ -1184,7 +1428,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   						 STRTAB_STE_1_EATS_TRANS));
>   
>   	arm_smmu_sync_ste_for_sid(smmu, sid);
> -	WRITE_ONCE(dst[0], cpu_to_le64(val));
> +	write_atomic(&dst[0], cpu_to_le64(val));
>   	arm_smmu_sync_ste_for_sid(smmu, sid);
>   
>   	/* It's likely that we'll want to use the new STE soon */
> @@ -1231,7 +1475,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>   }
>   
>   /* IRQ and event handlers */
> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> +static void arm_smmu_evtq_tasklet(void *dev)
>   {
>   	int i;
>   	struct arm_smmu_device *smmu = dev;
> @@ -1261,7 +1505,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>   	/* Sync our overflow flag, as we believe we're up to speed */
>   	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>   		    Q_IDX(llq, llq->cons);
> -	return IRQ_HANDLED;
>   }
>   
>   static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
> @@ -1302,7 +1545,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>   	}
>   }
>   
> -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> +static void arm_smmu_priq_tasklet(void *dev)
>   {
>   	struct arm_smmu_device *smmu = dev;
>   	struct arm_smmu_queue *q = &smmu->priq.q;
> @@ -1321,12 +1564,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
>   	llq->cons = Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>   		      Q_IDX(llq, llq->cons);
>   	queue_sync_cons_out(q);
> -	return IRQ_HANDLED;
>   }
>   
>   static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>   
> -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> +static void arm_smmu_gerror_handler(int irq, void *dev,
> +				struct cpu_user_regs *regs)
>   {
>   	u32 gerror, gerrorn, active;
>   	struct arm_smmu_device *smmu = dev;
> @@ -1336,7 +1579,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>   
>   	active = gerror ^ gerrorn;
>   	if (!(active & GERROR_ERR_MASK))
> -		return IRQ_NONE; /* No errors pending */
> +		return; /* No errors pending */
>   
>   	dev_warn(smmu->dev,
>   		 "unexpected global error reported (0x%08x), this could be serious\n",
> @@ -1369,26 +1612,44 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>   		arm_smmu_cmdq_skip_err(smmu);
>   
>   	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> -	return IRQ_HANDLED;
>   }
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
>   {
>   	struct arm_smmu_device *smmu = dev;
>   
> -	arm_smmu_evtq_thread(irq, dev);
> +	arm_smmu_evtq_tasklet(dev);
>   	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		arm_smmu_priq_thread(irq, dev);
> +		arm_smmu_priq_tasklet(dev);
> +}
> +
> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> +{
> +	struct arm_smmu_device *smmu = dev;
>   
> -	return IRQ_HANDLED;
> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
>   }
>   
> -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
>   {
> -	arm_smmu_gerror_handler(irq, dev);
> -	return IRQ_WAKE_THREAD;
> +	struct arm_smmu_device *smmu = dev;
> +
> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
>   }
>   
> +#ifdef CONFIG_PCI_ATS
>   static void
>   arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>   			struct arm_smmu_cmdq_ent *cmd)
> @@ -1495,6 +1756,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>   
>   	return ret ? -ETIMEDOUT : 0;
>   }
> +#endif /* CONFIG_PCI_ATS */
>   
>   static void arm_smmu_tlb_inv_context(void *cookie)
>   {
> @@ -1525,7 +1787,7 @@ static struct iommu_domain *arm_smmu_domain_alloc(void)
>   	 * We can't really do anything meaningful until we've added a
>   	 * master.
>   	 */
> -	smmu_domain = kzalloc(sizeof(*smmu_domain), GFP_KERNEL);
> +	smmu_domain = xzalloc(struct arm_smmu_domain);
>   	if (!smmu_domain)
>   		return NULL;
>   
> @@ -1563,7 +1825,7 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>   	if (cfg->vmid)
>   		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>   
> -	kfree(smmu_domain);
> +	xfree(smmu_domain);
>   }
>   
>   
> @@ -1576,6 +1838,44 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>   	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>   	typeof(&arm_lpae_s2_cfg.vtcr) vtcr = &arm_lpae_s2_cfg.vtcr;
>   
> +	vtcr->sh = ARM_SMMU_VTCR_SH_IS;
> +	vtcr->irgn = ARM_SMMU_VTCR_RGN_WBWA;
> +	vtcr->orgn = ARM_SMMU_VTCR_RGN_WBWA;
> +
> +	BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> +	vtcr->tg = ARM_SMMU_VTCR_TG0_4K;
> +
> +	switch (smmu->oas) {
> +	case 32:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_32_BIT;
> +		break;
> +	case 36:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_36_BIT;
> +		break;
> +	case 40:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_40_BIT;
> +		break;
> +	case 42:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_42_BIT;
> +		break;
> +	case 44:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_44_BIT;
> +		break;
> +	case 48:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_48_BIT;
> +		break;
> +	case 52:
> +		vtcr->ps = ARM_SMMU_VTCR_PS_52_BIT;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vtcr->tsz = 64 - p2m_ipa_bits;
> +	vtcr->sl = 2 - P2M_ROOT_LEVEL;
> +
> +	arm_lpae_s2_cfg.vttbr  = page_to_maddr(smmu_domain->d->arch.p2m.root);
> +
>   	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>   	if (vmid < 0)
>   		return vmid;
> @@ -1589,6 +1889,11 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
> +
> +	printk(XENLOG_DEBUG
> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n",
> +		   smmu_domain->d->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
> +
>   	return 0;
>   }
>   
> @@ -1650,6 +1955,7 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>   	}
>   }
>   
> +#ifdef CONFIG_PCI_ATS
>   static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>   {
>   	struct device *dev = master->dev;
> @@ -1748,6 +2054,23 @@ static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>   
>   	pci_disable_pasid(pdev);
>   }
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
> +#endif /* CONFIG_PCI_ATS */
>   
>   static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>   {
> @@ -1830,8 +2153,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>   
>   	return sid < limit;
>   }
> +/* Forward declaration */
> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
>   
> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> +static int arm_smmu_add_device(u8 devfn, struct device *dev)
>   {
>   	int i, ret;
>   	struct arm_smmu_device *smmu;
> @@ -1839,14 +2164,15 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   
>   	if (!fwspec)
> -		return ERR_PTR(-ENODEV);
> +		return -ENODEV;
>   
> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
> -		return ERR_PTR(-EBUSY);
> +	smmu = arm_smmu_get_by_dev(fwspec->iommu_dev);
> +	if (!smmu)
> +		return -ENODEV;
>   
> -	master = kzalloc(sizeof(*master), GFP_KERNEL);
> +	master = xzalloc(struct arm_smmu_master);
>   	if (!master)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>   
>   	master->dev = dev;
>   	master->smmu = smmu;
> @@ -1881,17 +2207,36 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>   	 */
>   	arm_smmu_enable_pasid(master);
>   
> -	return &smmu->iommu;
> +	return 0;
>   
>   err_free_master:
> -	kfree(master);
> +	xfree(master);
>   	dev_iommu_priv_set(dev, NULL);
> -	return ERR_PTR(ret);
> +	return ret;
>   }
>   
> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
> +static int arm_smmu_dt_xlate(struct device *dev,
> +				const struct dt_phandle_args *args)
>   {
> -	return iommu_fwspec_add_ids(dev, args->args, 1);
> +	int ret;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
Please bear in mind I am not familiar with the SMMU, but don't we need 
to perform a some kind
of sanity check of passed DT IOMMU specifier here?


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
>   }
>   
>   /* Probing and initialisation functions */
> @@ -1972,7 +2317,7 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>   	size_t size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
>   	void *strtab = smmu->strtab_cfg.strtab;
>   
> -	cfg->l1_desc = devm_kzalloc(smmu->dev, size, GFP_KERNEL);
> +	cfg->l1_desc = _xzalloc(size, sizeof(void *));
>   	if (!cfg->l1_desc) {
>   		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
>   		return -ENOMEM;
> @@ -2118,6 +2463,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
>   	return ret;
>   }
>   
> +#ifdef CONFIG_MSI
>   static void arm_smmu_free_msis(void *data)
>   {
>   	struct device *dev = data;
> @@ -2188,6 +2534,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>   	/* Add callback to free MSIs on teardown */
>   	devm_add_action(dev, arm_smmu_free_msis, dev);
>   }
> +#else
> +static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
> +#endif /* CONFIG_MSI */
>   
>   static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>   {
> @@ -2198,9 +2547,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>   	/* Request interrupt lines */
>   	irq = smmu->evtq.q.irq;
>   	if (irq) {
> -		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						arm_smmu_evtq_thread,
> -						IRQF_ONESHOT,
> +		ret = request_irq(irq, 0, arm_smmu_evtq_irq_tasklet,
>   						"arm-smmu-v3-evtq", smmu);
>   		if (ret < 0)
>   			dev_warn(smmu->dev, "failed to enable evtq irq\n");
> @@ -2210,8 +2557,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>   
>   	irq = smmu->gerr_irq;
>   	if (irq) {
> -		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> -				       0, "arm-smmu-v3-gerror", smmu);
> +		ret = request_irq(irq, 0, arm_smmu_gerror_handler,
> +						"arm-smmu-v3-gerror", smmu);
>   		if (ret < 0)
>   			dev_warn(smmu->dev, "failed to enable gerror irq\n");
>   	} else {
> @@ -2221,11 +2568,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>   	if (smmu->features & ARM_SMMU_FEAT_PRI) {
>   		irq = smmu->priq.q.irq;
>   		if (irq) {
> -			ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
> -							arm_smmu_priq_thread,
> -							IRQF_ONESHOT,
> -							"arm-smmu-v3-priq",
> -							smmu);
> +			ret = request_irq(irq, 0, arm_smmu_priq_irq_tasklet,
> +							"arm-smmu-v3-priq", smmu);
>   			if (ret < 0)
>   				dev_warn(smmu->dev,
>   					 "failed to enable priq irq\n");
> @@ -2254,11 +2598,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>   		 * Cavium ThunderX2 implementation doesn't support unique irq
>   		 * lines. Use a single irq line for all the SMMUv3 interrupts.
>   		 */
> -		ret = devm_request_threaded_irq(smmu->dev, irq,
> -					arm_smmu_combined_irq_handler,
> -					arm_smmu_combined_irq_thread,
> -					IRQF_ONESHOT,
> -					"arm-smmu-v3-combined-irq", smmu);
> +		ret = request_irq(irq, 0, arm_smmu_combined_irq_handler,
> +						"arm-smmu-v3-combined-irq", smmu);
>   		if (ret < 0)
>   			dev_warn(smmu->dev, "failed to enable combined irq\n");
>   	} else
> @@ -2287,7 +2628,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
>   	return ret;
>   }
>   
> -static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
>   	u32 reg, enables;
> @@ -2297,7 +2638,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>   	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
>   	if (reg & CR0_SMMUEN) {
>   		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
> +		WARN_ON(!disable_bypass);
>   		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
>   	}
>   
> @@ -2401,11 +2742,14 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>   		return ret;
>   	}
>   
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
> +				 smmu);
>   
>   	/* Enable the SMMU interface, or ensure bypass */
> -	if (!bypass || disable_bypass) {
> +	if (disable_bypass) {
>   		enables |= CR0_SMMUEN;
>   	} else {
>   		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> @@ -2470,8 +2814,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	if (reg & IDR0_SEV)
>   		smmu->features |= ARM_SMMU_FEAT_SEV;
>   
> +#ifdef CONFIG_MSI
>   	if (reg & IDR0_MSI)
>   		smmu->features |= ARM_SMMU_FEAT_MSI;
> +#endif
>   
>   	if (reg & IDR0_HYP)
>   		smmu->features |= ARM_SMMU_FEAT_HYP;
> @@ -2496,7 +2842,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>   
>   	if (!(reg & IDR0_S2P)) {
> -		dev_err(smmu->dev, "no translation support!\n");
> +		dev_err(smmu->dev, "no stage-2 translation support!\n");
>   		return -ENXIO;
>   	}
>   
> @@ -2593,8 +2939,12 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   		smmu->oas = 48;
>   	}
>   
> +	smmu->oas = min_t(unsigned long, PADDR_BITS, smmu->oas);
>   	smmu->ias = max(smmu->ias, smmu->oas);
>   
> +	/* Xen: Set maximum Stage-2 input size supported by the SMMU. */
> +	p2m_restrict_ipa_bits(smmu->ias);
> +
>   	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>   		 smmu->ias, smmu->oas, smmu->features);
>   	return 0;
> @@ -2645,7 +2995,7 @@ static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
>   static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>   				    struct arm_smmu_device *smmu)
>   {
> -	struct device *dev = &pdev->dev;
> +	struct device *dev = pdev;
>   	u32 cells;
>   	int ret = -EINVAL;
>   
> @@ -2658,7 +3008,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>   
>   	parse_driver_options(smmu);
>   
> -	if (of_dma_is_coherent(dev->of_node))
> +	if (dt_get_property(dev->of_node, "dma-coherent", NULL))
>   		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>   
>   	return ret;
> @@ -2672,63 +3022,49 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
>   		return SZ_128K;
>   }
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
>   static int arm_smmu_device_probe(struct platform_device *pdev)
>   {
>   	int irq, ret;
> -	struct resource *res;
> -	resource_size_t ioaddr;
> +	paddr_t ioaddr, iosize;
>   	struct arm_smmu_device *smmu;
> -	struct device *dev = &pdev->dev;
> -	bool bypass;
>   
> -	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
> +	smmu = xzalloc(struct arm_smmu_device);
>   	if (!smmu) {
> -		dev_err(dev, "failed to allocate arm_smmu_device\n");
> +		dev_err(pdev, "failed to allocate arm_smmu_device\n");
>   		return -ENOMEM;
>   	}
> -	smmu->dev = dev;
> +	smmu->dev = pdev;
>   
> -	if (dev->of_node) {
> +	if (pdev->of_node) {
>   		ret = arm_smmu_device_dt_probe(pdev, smmu);
> +		if (ret)
> +			return -EINVAL;
>   	} else {
>   		ret = arm_smmu_device_acpi_probe(pdev, smmu);
>   		if (ret == -ENODEV)
>   			return ret;
>   	}
>   
> -	/* Set bypass mode according to firmware probing result */
> -	bypass = !!ret;
> -
>   	/* Base address */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
> -		dev_err(dev, "MMIO region too small (%pr)\n", res);
> +	ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
> +	if (ret)
> +		return -ENODEV;
> +
> +	if (iosize < arm_smmu_resource_size(smmu)) {
> +		dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>   		return -EINVAL;
>   	}
> -	ioaddr = res->start;
>   
>   	/*
>   	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
> -	 * the PMCG registers which are reserved by the PMU driver.
> +	 * the PMCG registers which are optional and currently not supported.
>   	 */
> -	smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
> +	smmu->base = ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>   	if (IS_ERR(smmu->base))
>   		return PTR_ERR(smmu->base);
>   
> -	if (arm_smmu_resource_size(smmu) > SZ_64K) {
> -		smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
> +	if (iosize > SZ_64K) {
> +		smmu->page1 = ioremap_nocache(ioaddr + SZ_64K,
>   					       ARM_SMMU_REG_SZ);
>   		if (IS_ERR(smmu->page1))
>   			return PTR_ERR(smmu->page1);
> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	/* Reset the device */
> -	ret = arm_smmu_device_reset(smmu, bypass);
> +	ret = arm_smmu_device_reset(smmu);
>   	if (ret)
>   		return ret;
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
>   	return 0;
>   }
>   
> -static const struct of_device_id arm_smmu_of_match[] = {
> +static const struct dt_device_match arm_smmu_of_match[] = {
>   	{ .compatible = "arm,smmu-v3", },
>   	{ },
>   };
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
> +		smmu_domain->d = d;
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
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(io_domain);
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +
> +	if (!smmu_domain || smmu_domain->d != d) {
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

Both SMMUv2 and IPMMU perform some actions here. Any reason we don't 
need to do the same here?

     /* Set to false options not supported on ARM. */
     if ( iommu_hwdom_inclusive )
         printk(XENLOG_WARNING
         "map-inclusive dom0-iommu option is not supported on ARM\n");
     iommu_hwdom_inclusive = false;
     if ( iommu_hwdom_reserved == 1 )
         printk(XENLOG_WARNING
         "map-reserved dom0-iommu option is not supported on ARM\n");
     iommu_hwdom_reserved = 0;

     arch_iommu_hwdom_init(d);


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

-- 
Regards,

Oleksandr Tyshchenko



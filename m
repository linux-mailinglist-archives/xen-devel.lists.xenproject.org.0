Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED963C334
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449452.706206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01yP-0000zV-Ns; Tue, 29 Nov 2022 14:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449452.706206; Tue, 29 Nov 2022 14:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01yP-0000wt-L7; Tue, 29 Nov 2022 14:52:37 +0000
Received: by outflank-mailman (input) for mailman id 449452;
 Tue, 29 Nov 2022 14:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p01yO-0000wn-Jf
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:52:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p01yO-0000Ir-2p; Tue, 29 Nov 2022 14:52:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p01yN-00064Z-Ny; Tue, 29 Nov 2022 14:52:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=5GHRx9MS2VH0b3ZC3JgZuIlyB4uPGMSRWYLxSkzTJao=; b=sS5Y+GxutqygN0XkMrdE8Z6xZ1
	7lFCnV2Du8bOiw1x6xiaCVXSd+xYBbWRHDDA14EG8AcGJihDpZ3uaM3nykLffhnwbgcERGurtJBNb
	JnhFMzgEANn9mCwcvtpwz4bkAugAN5/VUlVoTzRHXEjbmwyrek/gTWIu6rE2S7aQqaAM=;
Message-ID: <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
Date: Tue, 29 Nov 2022 14:52:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/11/2022 14:57, Ayan Kumar Halder wrote:
> Hi All,

Hi,

> I am trying to gather opinions on how to support 32 bit physical 
> addresses to enable Xen running on R52.
> 
> Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
> 
> "...This is because the physical address is always the same as the 
> virtual address...The virtual and physical address can be treated as 
> synonyms for Cortex-R52."
> 
> Thus, I understand that R52 supports 32 bit physical address only. This 
> is a bit different from Armv7 systems which supports Large Physical 
> Address Extension (LPAE) ie 40 bit physical addresses. >
> Please correct me if I misunderstand something. >
> So currently, Xen supports 64 bit physical address for Arm_32 (ie Armv7) 
> based system.

Xen supports *up to* 64-bit physical address. This may be lower in the 
HW (not all the Armv7 HW supports 40-bit address).

> My aim is to enable support for 32 bit physical address.

Technically this is already supported because this is a subset of 
64-bit. I can see a use case (even on non R* HW) where you may want to 
use 32-bit paddr_t to reduce the code size (and registers used).

But I think that's more an optimization that rather than been necessary.

> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 6014c0f852..4f8b5fc4be 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -56,10 +56,10 @@ static bool __init device_tree_node_compatible(const 
> void *fdt, int node,
>   }
> 
>   void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                                u32 size_cells, u64 *start, u64 *size)
> +                                u32 size_cells, paddr_t *start, paddr_t 
> *size)

This needs to stay uint64_t because the Device-Tree may contain 64-bit 
values and you...

>   {
> -    *start = dt_next_cell(address_cells, cell);
> -    *size = dt_next_cell(size_cells, cell);
> +    *start = (paddr_t) dt_next_cell(address_cells, cell);
> +    *size = (paddr_t) dt_next_cell(size_cells, cell);

... don't want to always blindly cast it. That's up to the caller to 
check that the top 32-bit are zeroed and downcast it.

>   }
> 
>   static int __init device_tree_get_meminfo(const void *fdt, int node,
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bd30d3798c..3cbcf8f854 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1314,7 +1314,7 @@ static int __init make_memory_node(const struct 
> domain *d,
>       dt_dprintk("Create memory node\n");
> 
>       /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> +    snprintf(buf, sizeof(buf), "memory@%"PRIpaddr, mem->bank[i].start);
>       res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
> @@ -1665,7 +1665,7 @@ static int __init find_memory_holes(const struct 
> kernel_info *kinfo,
>       dt_for_each_device_node( dt_host, np )
>       {
>           unsigned int naddr;
> -        u64 addr, size;
> +        paddr_t addr, size;
> 
>           naddr = dt_number_of_address(np);
> 
> @@ -2444,7 +2444,7 @@ static int __init handle_device(struct domain *d, 
> struct dt_device_node *dev,
>       unsigned int naddr;
>       unsigned int i;
>       int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
>       bool own_device = !dt_device_for_passthrough(dev);
>       /*
>        * We want to avoid mapping the MMIO in dom0 for the following cases:
> @@ -2718,7 +2718,7 @@ static int __init make_gicv2_domU_node(struct 
> kernel_info *kinfo)
>       /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
>       char buf[38];
> 
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
>                vgic_dist_base(&d->arch.vgic));
>       res = fdt_begin_node(fdt, buf);
>       if ( res )
> @@ -2774,7 +2774,7 @@ static int __init make_gicv3_domU_node(struct 
> kernel_info *kinfo)
>       char buf[38];
>       unsigned int i, len = 0;
> 
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
>                vgic_dist_base(&d->arch.vgic));
> 
>       res = fdt_begin_node(fdt, buf);
> @@ -2860,7 +2860,7 @@ static int __init make_vpl011_uart_node(struct 
> kernel_info *kinfo)
>       /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
>       char buf[27];
> 
> -    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, 
> d->arch.vpl011.base_addr);
> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIpaddr, 
> d->arch.vpl011.base_addr);
>       res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
> @@ -2940,9 +2940,9 @@ static int __init handle_passthrough_prop(struct 
> kernel_info *kinfo,
>           if ( res )
>           {
>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
> -                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",

What's wrong with printing using PRIx64? At least...

>                      kinfo->d->domain_id,
> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
> +                   (paddr_t) (mstart & PAGE_MASK), (paddr_t) 
> (PAGE_ALIGN(mstart + size) - 1));

... this would avoid adding explicit cast which I quite dislike.

>               return res;
>           }
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index ae5bd8e95f..839623c32e 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1058,7 +1058,7 @@ static void __init gicv2_dt_init(void)
>       if ( csize < SZ_8K )
>       {
>           printk(XENLOG_WARNING "GICv2: WARNING: "
> -               "The GICC size is too small: %#"PRIx64" expected %#x\n",
> +               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
>                  csize, SZ_8K);
>           if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
>           {
> @@ -1289,11 +1289,11 @@ static int __init gicv2_init(void)
>           gicv2.map_cbase += aliased_offset;
> 
>           printk(XENLOG_WARNING
> -               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
> +               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
>                  cbase + aliased_offset);
>       } else if ( csize == SZ_128K )
>           printk(XENLOG_WARNING
> -               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
> +               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
>                  csize);
> 
>       gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 3c5b88148c..322ed15e6c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1402,7 +1402,7 @@ static void __init gicv3_dt_init(void)
> 
>       for ( i = 0; i < gicv3.rdist_count; i++ )
>       {
> -        uint64_t rdist_base, rdist_size;
> +        paddr_t rdist_base, rdist_size;
> 
>           res = dt_device_get_address(node, 1 + i, &rdist_base, 
> &rdist_size);
>           if ( res )
> diff --git a/xen/arch/arm/include/asm/setup.h 
> b/xen/arch/arm/include/asm/setup.h
> index fdbf68aadc..ddffffe44c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -158,7 +158,7 @@ extern uint32_t hyp_traps_vector[];
>   void init_traps(void);
> 
>   void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                         u32 size_cells, u64 *start, u64 *size);
> +                         u32 size_cells, paddr_t *start, paddr_t *size);
> 
>   u32 device_tree_get_u32(const void *fdt, int node,
>                           const char *prop_name, u32 dflt);
> diff --git a/xen/arch/arm/include/asm/types.h 
> b/xen/arch/arm/include/asm/types.h
> index 083acbd151..a7466d65c2 100644
> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -37,9 +37,15 @@ typedef signed long long s64;
>   typedef unsigned long long u64;
>   typedef u32 vaddr_t;
>   #define PRIvaddr PRIx32
> +#if defined(CONFIG_ARM_PA_32)
> +typedef u32 paddr_t;
> +#define PRIpaddr PRIx32
> +#define INVALID_PADDR (~0UL)
> +#else
>   typedef u64 paddr_t;
>   #define PRIpaddr 016llx
>   #define INVALID_PADDR (~0ULL)
> +#endif
>   typedef u32 register_t;
>   #define PRIregister "08x"
>   #elif defined (CONFIG_ARM_64)
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7b..0c50b196b5 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -747,7 +747,7 @@ static const struct dt_bus *dt_match_bus(const 
> struct dt_device_node *np)
>   }
> 
>   static const __be32 *dt_get_address(const struct dt_device_node *dev,
> -                                    unsigned int index, u64 *size,
> +                                    unsigned int index, paddr_t *size,

Same as for the other dt helper.

>                                       unsigned int *flags)
>   {
>       const __be32 *prop;
> @@ -781,7 +781,7 @@ static const __be32 *dt_get_address(const struct 
> dt_device_node *dev,
>           if ( i == index )
>           {
>               if ( size )
> -                *size = dt_read_number(prop + na, ns);
> +                *size = (paddr_t) dt_read_number(prop + na, ns);
I strongly dislike adding unnecessary cast in C because they could hide 
away issue. In this case, this raise the question why always ignoring 
the top 32-bit is always fine?

This remark is also valid for all the other changes in device_tree.c.

>               if ( flags )
>                   *flags = bus->get_flags(prop);
>               return prop;
> @@ -935,7 +935,7 @@ bail:
> 
>   /* dt_device_address - Translate device tree address and return it */
>   int dt_device_get_address(const struct dt_device_node *dev, unsigned 
> int index,
> -                          u64 *addr, u64 *size)
> +                          paddr_t *addr, paddr_t *size)
>   {
>       const __be32 *addrp;
>       unsigned int flags;
> @@ -947,7 +947,7 @@ int dt_device_get_address(const struct 
> dt_device_node *dev, unsigned int index,
>       if ( !addr )
>           return -EINVAL;
> 
> -    *addr = __dt_translate_address(dev, addrp, "ranges");
> +    *addr = (paddr_t) __dt_translate_address(dev, addrp, "ranges");
> 
>       if ( *addr == DT_BAD_ADDR )
>           return -EINVAL;
> diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
> index 17584da257..a1e0e154c5 100644
> --- a/xen/common/libfdt/fdt_ro.c
> +++ b/xen/common/libfdt/fdt_ro.c

Please don't change fdt_ro.c. This is a copy of libfdt and should stay 
as is.

> @@ -172,7 +172,7 @@ static const struct fdt_reserve_entry 
> *fdt_mem_rsv(const void *fdt, int n)
>      return fdt_mem_rsv_(fdt, n);
>   }
> 
> -int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t 
> *size)
> +int fdt_get_mem_rsv(const void *fdt, int n, paddr_t *address, paddr_t 
> *size)
>   {
>      const struct fdt_reserve_entry *re;
> 
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index be67242bc0..1f86443136 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -258,7 +258,7 @@ static int __init pl011_dt_uart_init(struct 
> dt_device_node *dev,
>   {
>       const char *config = data;
>       int res;
> -    u64 addr, size;
> +    paddr_t addr, size;
> 
>       if ( strcmp(config, "") )
>       {
> diff --git a/xen/drivers/passthrough/arm/smmu.c 
> b/xen/drivers/passthrough/arm/smmu.c
> index 0a514821b3..59b9a24099 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -73,8 +73,8 @@
>   /* Xen: Helpers to get device MMIO and IRQs */
>   struct resource
>   {
> -   u64 addr;
> -   u64 size;
> +   paddr_t addr;
> +   paddr_t size;
>      unsigned int type;
>   };
> 
> @@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct 
> device *dev,
>      ptr = ioremap_nocache(res->addr, res->size);
>      if (!ptr) {
>          dev_err(dev,
> -           "ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
> +           "ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
>              res->addr, res->size);
>          return ERR_PTR(-ENOMEM);
>      }
> @@ -1179,10 +1179,12 @@ static void arm_smmu_init_context_bank(struct 
> arm_smmu_domain *smmu_domain)
> 
>      reg = (p2maddr & ((1ULL << 32) - 1));
>      writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
> +#if !CONFIG_ARM_PA_32
>      reg = (p2maddr >> 32);
>      if (stage1)
>          reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
>      writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
> +#endif
> 
>      /*
>       * TTBCR
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 1528ced509..20b4462fdd 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -466,8 +466,8 @@ typedef uint64_t xen_callback_t;
>   /* Largest amount of actual RAM, not including holes */
>   #define GUEST_RAM_MAX     (GUEST_RAM0_SIZE + GUEST_RAM1_SIZE)
>   /* Suitable for e.g. const uint64_t ramfoo[] = GUEST_RAM_BANK_FOOS; */
> +#if !CONFIG_ARM_PA_32
CONFIG_ARM_PA_32 is not going to be defined for the tools and I don't 
think we should define it.

If there are any restriction on which bank to use, then this should be 
done in the toolstack.

>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
> +#else
> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
> +#endif
> 
>   /* Current supported guest VCPUs */
>   #define GUEST_MAX_VCPUS 128
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index a28937d12a..7f86af54b6 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -572,7 +572,7 @@ const struct dt_device_node *dt_get_parent(const 
> struct dt_device_node *node);
>    * device-tree node. It returns 0 on success.
>    */
>   int dt_device_get_address(const struct dt_device_node *dev, unsigned 
> int index,
> -                          u64 *addr, u64 *size);
> +                          paddr_t *addr, paddr_t *size);
> 
>   /**
>    * dt_number_of_irq - Get the number of IRQ for a device
> diff --git a/xen/include/xen/libfdt/libfdt.h 
> b/xen/include/xen/libfdt/libfdt.h
> index c71689e2be..fabde78edf 100644
> --- a/xen/include/xen/libfdt/libfdt.h
> +++ b/xen/include/xen/libfdt/libfdt.h
> @@ -444,7 +444,7 @@ int fdt_num_mem_rsv(const void *fdt);
>    *     -FDT_ERR_BADVERSION,
>    *     -FDT_ERR_BADSTATE, standard meanings
>    */
> -int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t 
> *size);
> +int fdt_get_mem_rsv(const void *fdt, int n, paddr_t *address, paddr_t 
> *size);
> 
>   /**
>    * fdt_subnode_offset_namelen - find a subnode based on substring
> 
> 3. I am happy with any other suggestion.
> 
> In linux source code 
> (https://elixir.bootlin.com/linux/v6.1-rc1/source/include/linux/types.h#L152), CONFIG_PHYS_ADDR_T_64BIT <https://elixir.bootlin.com/linux/v6.1-rc1/K/ident/CONFIG_PHYS_ADDR_T_64BIT> is used for distinguish 64/32 bit physical address.
> 
> Kind regards,
> 
> Ayan
> 

-- 
Julien Grall


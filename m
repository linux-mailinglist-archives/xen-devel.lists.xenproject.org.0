Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CB67471A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481361.746191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeCb-00088e-Ey; Thu, 19 Jan 2023 23:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481361.746191; Thu, 19 Jan 2023 23:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeCb-00086C-BV; Thu, 19 Jan 2023 23:20:13 +0000
Received: by outflank-mailman (input) for mailman id 481361;
 Thu, 19 Jan 2023 23:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeCa-000866-H0
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:20:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d148b3fa-984f-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 00:20:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F12C61D9D;
 Thu, 19 Jan 2023 23:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31AAC433EF;
 Thu, 19 Jan 2023 23:20:07 +0000 (UTC)
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
X-Inumbo-ID: d148b3fa-984f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674170408;
	bh=acDBaGiiW35JavUUnI5ml5IinAklQDhI7+IJo/aefno=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TwomfGzypqH37oOcUiJtmeoA/x92opvFgJR8BeBqAV+pdzUTXhT/F2PcsBrBqTaWE
	 tsSr2RVP/YIr4C65eFzRgMQs7YzyY3A+pRHjHpPDGU7Em+Nq1VTXwb6/32YDp9q8Pp
	 FoAzB/GZguI+BpJE6O89VZ654w4lsLpeh33hhhTmp3umYgw0XFhjVC2fQJ6Hxsk0BH
	 9FCbpkDBuPDZ5zyz93gBjQLpo3xDPubfHtR2QoWRHUVfuEYl1Dx1LjEM9D7uDQVI4E
	 NN52510SSZ1tvSgDDD17A3LBXqD6cLIAje6y+dzcPOadz59dXcOKh3Rmwp05O54Cf6
	 +OsUFUl5H2JAg==
Date: Thu, 19 Jan 2023 15:20:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 04/11] xen/arm: Typecast the DT values into paddr_t
In-Reply-To: <20230117174358.15344-5-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191514240.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-5-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> In future, we wish to support 32 bit physical address.
> However, one can only read u64 values from the DT. Thus, we need to
> typecast the values appropriately from u64 to paddr_t.
> 
> device_tree_get_reg() should now be able to return paddr_t. This is
> invoked by various callers to get DT address and size.
> Similarly, dt_read_number() is invoked as well to get DT address and
> size. The return value is typecasted to paddr_t.
> fdt_get_mem_rsv() can only accept u64 values. So, we provide a warpper
> for this called fdt_get_mem_rsv_paddr() which will do the necessary
> typecasting before invoking fdt_get_mem_rsv() and while returning.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

I know we discussed this before and you implemented exactly what we
suggested, but now looking at this patch I think we should do the
following:

- also add a wrapper for dt_read_number, something like
  dt_read_number_paddr that returns paddr
- add a check for the top 32-bit being zero in all the wrappers
  (dt_read_number_paddr, device_tree_get_reg, fdt_get_mem_rsv_paddr)
  when paddr!=uint64_t. In case the top 32-bit are != zero I think we
  should print an error

Julien, I remember you were concerned about BUG_ON/panic/ASSERT and I
agree with you there (especially considering Vikram's device tree
overlay series). So here I am only suggesting to check truncation and
printk a message, not panic. Would you be OK with that?

Last comment, maybe we could add fdt_get_mem_rsv_paddr to setup.h
instead of introducing xen/arch/arm/include/asm/device_tree.h, given
that we already have device tree definitions there
(device_tree_get_reg). I am OK either way.


> ---
> 
> Changes from
> 
> v1 - 1. Dropped "[XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the translation between u64 and paddr_t" and
> "[XEN v1 4/9] xen/arm: Use translate_dt_address_size() to translate between device tree addr/size and paddr_t", instead
> this approach achieves the same purpose.
> 
> 2. No need to check for truncation while converting values from u64 to paddr_t.
> 
>  xen/arch/arm/bootfdt.c                 | 23 +++++++++------
>  xen/arch/arm/domain_build.c            |  2 +-
>  xen/arch/arm/include/asm/device_tree.h | 40 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/setup.h       |  2 +-
>  xen/arch/arm/setup.c                   | 14 ++++-----
>  xen/arch/arm/smpboot.c                 |  2 +-
>  6 files changed, 65 insertions(+), 18 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/device_tree.h
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 0085c28d74..f536a3f3ab 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -11,9 +11,9 @@
>  #include <xen/efi.h>
>  #include <xen/device_tree.h>
>  #include <xen/lib.h>
> -#include <xen/libfdt/libfdt.h>
>  #include <xen/sort.h>
>  #include <xsm/xsm.h>
> +#include <asm/device_tree.h>
>  #include <asm/setup.h>
>  
>  static bool __init device_tree_node_matches(const void *fdt, int node,
> @@ -53,10 +53,15 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>  }
>  
>  void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                                u32 size_cells, u64 *start, u64 *size)
> +                                u32 size_cells, paddr_t *start, paddr_t *size)
>  {
> -    *start = dt_next_cell(address_cells, cell);
> -    *size = dt_next_cell(size_cells, cell);
> +    /*
> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus, one
> +     * needs to cast paddr_t to u32. Note that we do not check for truncation as
> +     * it is user's responsibility to provide the correct values in the DT.
> +     */
> +    *start = (paddr_t) dt_next_cell(address_cells, cell);
> +    *size = (paddr_t) dt_next_cell(size_cells, cell);
>  }
>  
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
> @@ -326,7 +331,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>          printk("linux,initrd-start property has invalid length %d\n", len);
>          return -EINVAL;
>      }
> -    start = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    start = (paddr_t) dt_read_number((void *)&prop->data, dt_size_to_cells(len));
>  
>      prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
>      if ( !prop )
> @@ -339,7 +344,7 @@ static int __init process_chosen_node(const void *fdt, int node,
>          printk("linux,initrd-end property has invalid length %d\n", len);
>          return -EINVAL;
>      }
> -    end = dt_read_number((void *)&prop->data, dt_size_to_cells(len));
> +    end = (paddr_t) dt_read_number((void *)&prop->data, dt_size_to_cells(len));
>  
>      if ( start >= end )
>      {
> @@ -594,9 +599,11 @@ static void __init early_print_info(void)
>      for ( i = 0; i < nr_rsvd; i++ )
>      {
>          paddr_t s, e;
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &s, &e) < 0 )
> +
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
>              continue;
> -        /* fdt_get_mem_rsv returns length */
> +
> +        /* fdt_get_mem_rsv_paddr returns length */
>          e += s;
>          printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
>      }
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f904f12408..72b9afbb4c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -949,7 +949,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>          BUG_ON(!prop);
>          cells = (const __be32 *)prop->value;
>          device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
> -        psize = dt_read_number(cells, size_cells);
> +        psize = (paddr_t) dt_read_number(cells, size_cells);
>          if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
>          {
>              printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
> diff --git a/xen/arch/arm/include/asm/device_tree.h b/xen/arch/arm/include/asm/device_tree.h
> new file mode 100644
> index 0000000000..51e0f0ae20
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/device_tree.h
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * xen/arch/arm/include/asm/device_tree.h
> + * 
> + * Wrapper functions for device tree. This helps to convert dt values
> + * between u64 and paddr_t.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + */
> +
> +#ifndef __ARCH_ARM_DEVICE_TREE__
> +#define __ARCH_ARM_DEVICE_TREE__
> +
> +#include <xen/libfdt/libfdt.h>
> +
> +inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
> +                                 paddr_t *address,
> +                                 paddr_t *size)
> +{
> +    uint64_t dt_addr;
> +    uint64_t dt_size;
> +    int ret = 0;
> +
> +    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
> +
> +    *address = (paddr_t) dt_addr;
> +    *size = (paddr_t) dt_size;
> +
> +    return ret;
> +}
> +
> +#endif /* __ARCH_ARM_DEVICE_TREE__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index a926f30a2b..6105e5cae3 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -158,7 +158,7 @@ extern uint32_t hyp_traps_vector[];
>  void init_traps(void);
>  
>  void device_tree_get_reg(const __be32 **cell, u32 address_cells,
> -                         u32 size_cells, u64 *start, u64 *size);
> +                         u32 size_cells, paddr_t *start, paddr_t *size);
>  
>  u32 device_tree_get_u32(const void *fdt, int node,
>                          const char *prop_name, u32 dflt);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 1f26f67b90..da13439e62 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -29,7 +29,6 @@
>  #include <xen/virtual_region.h>
>  #include <xen/vmap.h>
>  #include <xen/trace.h>
> -#include <xen/libfdt/libfdt.h>
>  #include <xen/acpi.h>
>  #include <xen/warning.h>
>  #include <asm/alternative.h>
> @@ -39,6 +38,7 @@
>  #include <asm/gic.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/device_tree.h>
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/setup.h>
> @@ -222,11 +222,11 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      {
>          paddr_t r_s, r_e;
>  
> -        if ( fdt_get_mem_rsv(device_tree_flattened, i, &r_s, &r_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
>              /* If we can't read it, pretend it doesn't exist... */
>              continue;
>  
> -        r_e += r_s; /* fdt_get_mem_rsv returns length */
> +        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
>  
>          if ( s < r_e && r_s < e )
>          {
> @@ -502,13 +502,13 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
>      {
>          paddr_t mod_s, mod_e;
>  
> -        if ( fdt_get_mem_rsv(device_tree_flattened,
> -                             i - mi->nr_mods,
> -                             &mod_s, &mod_e ) < 0 )
> +        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
> +                                   i - mi->nr_mods,
> +                                   &mod_s, &mod_e ) < 0 )
>              /* If we can't read it, pretend it doesn't exist... */
>              continue;
>  
> -        /* fdt_get_mem_rsv returns length */
> +        /* fdt_get_mem_rsv_paddr returns length */
>          mod_e += mod_s;
>  
>          if ( s < mod_e && mod_s < e )
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 412ae22869..ee59b1d379 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -159,7 +159,7 @@ static void __init dt_smp_init_cpus(void)
>              continue;
>          }
>  
> -        addr = dt_read_number(prop, dt_n_addr_cells(cpu));
> +        addr = (paddr_t) dt_read_number(prop, dt_n_addr_cells(cpu));
>  
>          hwid = addr;
>          if ( hwid != addr )
> -- 
> 2.17.1
> 


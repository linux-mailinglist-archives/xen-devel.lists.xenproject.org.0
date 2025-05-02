Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF73AA7A51
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 21:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975055.1362753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAwBs-0002ZC-Hh; Fri, 02 May 2025 19:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975055.1362753; Fri, 02 May 2025 19:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAwBs-0002X9-F6; Fri, 02 May 2025 19:36:56 +0000
Received: by outflank-mailman (input) for mailman id 975055;
 Fri, 02 May 2025 19:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAwBq-0002X3-N2
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 19:36:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9923acb-278c-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 21:36:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E43375C5A32;
 Fri,  2 May 2025 19:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49801C4CEE4;
 Fri,  2 May 2025 19:36:45 +0000 (UTC)
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
X-Inumbo-ID: c9923acb-278c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746214606;
	bh=bsYX1y6C9aOuK4WlQ4kkvjZoz15/h3IfIOItFweCaoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gp5Fl0V1UL7jIWpNwzdRB0WdW8IjiHsxhdPLtkiZCuHjK1kCv9H6bXZs836PwOdwy
	 F5JohAHVKysh+cojI7reXnXVjBJ4S/B/pvyT9EgWotNFZR6dqseCUEzEFEDY0290iC
	 /QP6Q3QYO/uHNqdBOs4XeJoTTmsIVXcYW2XTYV2ckChcrrNNgQLBl8dH7HnQISEoBs
	 8GjeKUgBtwG3zKJ1jdV+I5stelDQ9enJo11tyJLB0rTe9m8YR/6PHRDYVIJTSHCJ2p
	 dC4icsLhCbgUmOSGz9t8R5N066RuWWAf9iyA/G5aTAEyRDc+7fjDXCmCVNcN8fykhO
	 ksvslVZ4NiB7g==
Date: Fri, 2 May 2025 12:36:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 6/8] xen/common: dom0less: introduce common kernel.c
In-Reply-To: <4f178bd0e46adf3d4c7a91d6cdd4a0910dbef490.1746199009.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505021223030.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com> <4f178bd0e46adf3d4c7a91d6cdd4a0910dbef490.1746199009.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, Oleksii Kurochko wrote:
> The following functions don't have arch specific things so it is moved to
> common:
> - kernel_prboe()
> - kernel_load()
> - output_length()
> 
> Functions necessary for dom0less are only moved.
> 
> The following changes are done:
> - Swap __init and return type of kernel_decompress() function to be
>   consistent with defintions of functions in other files. The same
>   for output_length().
> - Wrap by "ifdef CONFIG_ARM" the call of kernel_uimage_probe() in
>   kernel_probe() as uImage isn't really used nowadays thereby leave
>   kernel_uimage_probe() call here just for compatability with Arm code.
> - Introduce kernel_zimage_probe() to cover the case that arch can have
>   different zimage header.
> - Add ASSERT() for kernel_load() to check that it argument isn't NULL.
> - Make kernel_uimage_probe() non-static in Arm's code as it is used in
>   common/kernel.c.
> 
> Introduce CONFIG_DOMAIN_BUILD_HELPERS to not provide stubs for archs
> which don't provide enough functionality to enable it.
> Select CONFIG_DOMAIN_BUILD_HELPERS for CONFIG_ARM as only Arm supports
> it, at the moment.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Change in v3:
>  - Empty line after license tag for newly introduced files.
> ---
> Change in v2:
>  - Drop inclusion of asm/kernel.h in kernel.c as everything necessary has
>    been moved to xen/fdt-kernel.h.
> ---
>  xen/arch/arm/Kconfig             |   1 +
>  xen/arch/arm/kernel.c            | 221 +---------------------------
>  xen/common/Kconfig               |   9 +-
>  xen/common/device-tree/Makefile  |   1 +
>  xen/common/device-tree/kernel.c  | 242 +++++++++++++++++++++++++++++++
>  xen/include/asm-generic/kernel.h | 141 ++++++++++++++++++
>  xen/include/xen/fdt-kernel.h     |  13 ++
>  7 files changed, 412 insertions(+), 216 deletions(-)
>  create mode 100644 xen/common/device-tree/kernel.c
>  create mode 100644 xen/include/asm-generic/kernel.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index d0e0a7753c..3321d89068 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -11,6 +11,7 @@ config ARM_64
>  
>  config ARM
>  	def_bool y
> +	select DOMAIN_BUILD_HELPERS
>  	select FUNCTION_ALIGNMENT_4B
>  	select GENERIC_UART_INIT
>  	select HAS_ALTERNATIVE if HAS_VMAP
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 5759a3470a..1168c21e97 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -163,105 +163,6 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>      iounmap(kernel);
>  }
>  
> -static __init uint32_t output_length(char *image, unsigned long image_len)
> -{
> -    return *(uint32_t *)&image[image_len - 4];
> -}
> -
> -static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
> -{
> -    char *output, *input;
> -    char magic[2];
> -    int rc;
> -    unsigned int kernel_order_out;
> -    paddr_t output_size;
> -    struct page_info *pages;
> -    mfn_t mfn;
> -    int i;
> -    paddr_t addr = mod->start;
> -    paddr_t size = mod->size;
> -
> -    if ( size < offset )
> -        return -EINVAL;
> -
> -    /*
> -     * It might be that gzip header does not appear at the start address
> -     * (e.g. in case of compressed uImage) so take into account offset to
> -     * gzip header.
> -     */
> -    addr += offset;
> -    size -= offset;
> -
> -    if ( size < 2 )
> -        return -EINVAL;
> -
> -    copy_from_paddr(magic, addr, sizeof(magic));
> -
> -    /* only gzip is supported */
> -    if ( !gzip_check(magic, size) )
> -        return -EINVAL;
> -
> -    input = ioremap_cache(addr, size);
> -    if ( input == NULL )
> -        return -EFAULT;
> -
> -    output_size = output_length(input, size);
> -    kernel_order_out = get_order_from_bytes(output_size);
> -    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
> -    if ( pages == NULL )
> -    {
> -        iounmap(input);
> -        return -ENOMEM;
> -    }
> -    mfn = page_to_mfn(pages);
> -    output = vmap_contig(mfn, 1 << kernel_order_out);
> -
> -    rc = perform_gunzip(output, input, size);
> -    clean_dcache_va_range(output, output_size);
> -    iounmap(input);
> -    vunmap(output);
> -
> -    if ( rc )
> -    {
> -        free_domheap_pages(pages, kernel_order_out);
> -        return rc;
> -    }
> -
> -    mod->start = page_to_maddr(pages);
> -    mod->size = output_size;
> -
> -    /*
> -     * Need to free pages after output_size here because they won't be
> -     * freed by discard_initial_modules
> -     */
> -    i = PFN_UP(output_size);
> -    for ( ; i < (1 << kernel_order_out); i++ )
> -        free_domheap_page(pages + i);
> -
> -    /*
> -     * When using static heap feature, don't give bootmodules memory back to
> -     * the heap allocator
> -     */
> -    if ( using_static_heap )
> -        return 0;
> -
> -    /*
> -     * When freeing the kernel, we need to pass the module start address and
> -     * size as they were before taking an offset to gzip header into account,
> -     * so that the entire region will be freed.
> -     */
> -    addr -= offset;
> -    size += offset;
> -
> -    /*
> -     * Free the original kernel, update the pointers to the
> -     * decompressed kernel
> -     */
> -    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> -
> -    return 0;
> -}
> -
>  /*
>   * Uimage CPU Architecture Codes
>   */
> @@ -274,8 +175,8 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
>  /*
>   * Check if the image is a uImage and setup kernel_info
>   */
> -static int __init kernel_uimage_probe(struct kernel_info *info,
> -                                      struct bootmodule *mod)
> +int __init kernel_uimage_probe(struct kernel_info *info,
> +                               struct bootmodule *mod)
>  {
>      struct {
>          __be32 magic;   /* Image Header Magic Number */
> @@ -505,130 +406,20 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
>      return 0;
>  }
>  
> -int __init kernel_probe(struct kernel_info *info,
> -                        const struct dt_device_node *domain)
> +int __init kernel_zimage_probe(struct kernel_info *info, paddr_t addr,
> +                               paddr_t size)
>  {
> -    struct bootmodule *mod = NULL;
> -    struct bootcmdline *cmd = NULL;
> -    struct dt_device_node *node;
> -    u64 kernel_addr, initrd_addr, dtb_addr, size;
>      int rc;
>  
> -    /*
> -     * We need to initialize start to 0. This field may be populated during
> -     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
> -     * uimage.ep).
> -     * We will use this to determine if the image has a fixed entry point or
> -     * the load address should be used as the start address.
> -     */
> -    info->entry = 0;
> -
> -    /* domain is NULL only for the hardware domain */
> -    if ( domain == NULL )
> -    {
> -        ASSERT(is_hardware_domain(info->d));
> -
> -        mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
> -
> -        info->kernel_bootmodule = mod;
> -        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
> -
> -        cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
> -        if ( cmd )
> -            info->cmdline = &cmd->cmdline[0];
> -    }
> -    else
> -    {
> -        const char *name = NULL;
> -
> -        dt_for_each_child_node(domain, node)
> -        {
> -            if ( dt_device_is_compatible(node, "multiboot,kernel") )
> -            {
> -                u32 len;
> -                const __be32 *val;
> -
> -                val = dt_get_property(node, "reg", &len);
> -                dt_get_range(&val, node, &kernel_addr, &size);
> -                mod = boot_module_find_by_addr_and_kind(
> -                        BOOTMOD_KERNEL, kernel_addr);
> -                info->kernel_bootmodule = mod;
> -            }
> -            else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
> -            {
> -                u32 len;
> -                const __be32 *val;
> -
> -                val = dt_get_property(node, "reg", &len);
> -                dt_get_range(&val, node, &initrd_addr, &size);
> -                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
> -                        BOOTMOD_RAMDISK, initrd_addr);
> -            }
> -            else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
> -            {
> -                uint32_t len;
> -                const __be32 *val;
> -
> -                val = dt_get_property(node, "reg", &len);
> -                if ( val == NULL )
> -                    continue;
> -                dt_get_range(&val, node, &dtb_addr, &size);
> -                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
> -                        BOOTMOD_GUEST_DTB, dtb_addr);
> -            }
> -            else
> -                continue;
> -        }
> -        name = dt_node_name(domain);
> -        cmd = boot_cmdline_find_by_name(name);
> -        if ( cmd )
> -            info->cmdline = &cmd->cmdline[0];
> -    }
> -    if ( !mod || !mod->size )
> -    {
> -        printk(XENLOG_ERR "Missing kernel boot module?\n");
> -        return -ENOENT;
> -    }
> -
> -    printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
> -           info->d, info->kernel_bootmodule->start);
> -    if ( info->initrd_bootmodule )
> -        printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
> -               info->initrd_bootmodule->start);
> -
> -    /*
> -     * uImage header always appears at the top of the image (even compressed),
> -     * so it needs to be probed first. Note that in case of compressed uImage,
> -     * kernel_decompress is called from kernel_uimage_probe making the function
> -     * self-containing (i.e. fall through only in case of a header not found).
> -     */
> -    rc = kernel_uimage_probe(info, mod);
> -    if ( rc != -ENOENT )
> -        return rc;
> -
> -    /*
> -     * If it is a gzip'ed image, 32bit or 64bit, uncompress it.
> -     * At this point, gzip header appears (if at all) at the top of the image,
> -     * so pass 0 as an offset.
> -     */
> -    rc = kernel_decompress(mod, 0);
> -    if ( rc && rc != -EINVAL )
> -        return rc;
> -
>  #ifdef CONFIG_ARM_64
> -    rc = kernel_zimage64_probe(info, mod->start, mod->size);
> +    rc = kernel_zimage64_probe(info, addr, size);
>      if (rc < 0)
>  #endif
> -        rc = kernel_zimage32_probe(info, mod->start, mod->size);
> +        rc = kernel_zimage32_probe(info, addr, size);
>  
>      return rc;
>  }
>  
> -void __init kernel_load(struct kernel_info *info)
> -{
> -    info->load(info);
> -}
> -
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index be38abf9e1..38981f1d11 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -14,13 +14,20 @@ config CORE_PARKING
>  
>  config DOM0LESS_BOOT
>  	bool "Dom0less boot support" if EXPERT
> -	depends on HAS_DOM0LESS
> +	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
>  	default y
>  	help
>  	  Dom0less boot support enables Xen to create and start domU guests during
>  	  Xen boot without the need of a control domain (Dom0), which could be
>  	  present anyway.
>  
> +config DOMAIN_BUILD_HELPERS
> +	bool
> +	help
> +	  Introduce functions necessary for working with domain creation, kernel,
> +	  etc. As an examples, these type of functions are going to be used by
> +	  CONFIG_DOM0LESS_BOOT.

NIT: If possible, I would make this option a silent option that cannot
be manually enabled/disabled. As a choice to the user, I think
DOM0LESS_BOOT is sufficient.


>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index f3dafc9b81..e88a4d5799 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -4,3 +4,4 @@ obj-y += device-tree.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += intc.o
> +obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
> new file mode 100644
> index 0000000000..1bf3bbf64e
> --- /dev/null
> +++ b/xen/common/device-tree/kernel.c
> @@ -0,0 +1,242 @@
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/errno.h>
> +#include <xen/gunzip.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +static uint32_t __init output_length(char *image, unsigned long image_len)
> +{
> +    return *(uint32_t *)&image[image_len - 4];
> +}
> +
> +int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
> +{
> +    char *output, *input;
> +    char magic[2];
> +    int rc;
> +    unsigned int kernel_order_out;
> +    paddr_t output_size;
> +    struct page_info *pages;
> +    mfn_t mfn;
> +    int i;
> +    paddr_t addr = mod->start;
> +    paddr_t size = mod->size;
> +
> +    if ( size < offset )
> +        return -EINVAL;
> +
> +    /*
> +     * It might be that gzip header does not appear at the start address
> +     * (e.g. in case of compressed uImage) so take into account offset to
> +     * gzip header.
> +     */
> +    addr += offset;
> +    size -= offset;
> +
> +    if ( size < 2 )
> +        return -EINVAL;
> +
> +    copy_from_paddr(magic, addr, sizeof(magic));
> +
> +    /* only gzip is supported */
> +    if ( !gzip_check(magic, size) )
> +        return -EINVAL;
> +
> +    input = ioremap_cache(addr, size);
> +    if ( input == NULL )
> +        return -EFAULT;
> +
> +    output_size = output_length(input, size);
> +    kernel_order_out = get_order_from_bytes(output_size);
> +    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
> +    if ( pages == NULL )
> +    {
> +        iounmap(input);
> +        return -ENOMEM;
> +    }
> +    mfn = page_to_mfn(pages);
> +    output = vmap_contig(mfn, 1 << kernel_order_out);
> +
> +    rc = perform_gunzip(output, input, size);
> +    clean_dcache_va_range(output, output_size);
> +    iounmap(input);
> +    vunmap(output);
> +
> +    if ( rc )
> +    {
> +        free_domheap_pages(pages, kernel_order_out);
> +        return rc;
> +    }
> +
> +    mod->start = page_to_maddr(pages);
> +    mod->size = output_size;
> +
> +    /*
> +     * Need to free pages after output_size here because they won't be
> +     * freed by discard_initial_modules
> +     */
> +    i = PFN_UP(output_size);
> +    for ( ; i < (1 << kernel_order_out); i++ )
> +        free_domheap_page(pages + i);
> +
> +    /*
> +     * When using static heap feature, don't give bootmodules memory back to
> +     * the heap allocator
> +     */
> +    if ( using_static_heap )
> +        return 0;
> +
> +    /*
> +     * When freeing the kernel, we need to pass the module start address and
> +     * size as they were before taking an offset to gzip header into account,
> +     * so that the entire region will be freed.
> +     */
> +    addr -= offset;
> +    size += offset;
> +
> +    /*
> +     * Free the original kernel, update the pointers to the
> +     * decompressed kernel
> +     */
> +    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> +
> +    return 0;
> +}
> +
> +int __init kernel_probe(struct kernel_info *info,
> +                        const struct dt_device_node *domain)
> +{
> +    struct bootmodule *mod = NULL;
> +    struct bootcmdline *cmd = NULL;
> +    struct dt_device_node *node;
> +    u64 kernel_addr, initrd_addr, dtb_addr, size;
> +    int rc;
> +
> +    /*
> +     * We need to initialize start to 0. This field may be populated during
> +     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
> +     * uimage.ep).
> +     * We will use this to determine if the image has a fixed entry point or
> +     * the load address should be used as the start address.
> +     */
> +    info->entry = 0;
> +
> +    /* domain is NULL only for the hardware domain */
> +    if ( domain == NULL )
> +    {
> +        ASSERT(is_hardware_domain(info->d));
> +
> +        mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
> +
> +        info->kernel_bootmodule = mod;
> +        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
> +
> +        cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
> +        if ( cmd )
> +            info->cmdline = &cmd->cmdline[0];
> +    }
> +    else
> +    {
> +        const char *name = NULL;
> +
> +        dt_for_each_child_node(domain, node)
> +        {
> +            if ( dt_device_is_compatible(node, "multiboot,kernel") )
> +            {
> +                u32 len;
> +                const __be32 *val;
> +
> +                val = dt_get_property(node, "reg", &len);
> +                dt_get_range(&val, node, &kernel_addr, &size);
> +                mod = boot_module_find_by_addr_and_kind(
> +                        BOOTMOD_KERNEL, kernel_addr);
> +                info->kernel_bootmodule = mod;
> +            }
> +            else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
> +            {
> +                u32 len;
> +                const __be32 *val;
> +
> +                val = dt_get_property(node, "reg", &len);
> +                dt_get_range(&val, node, &initrd_addr, &size);
> +                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
> +                        BOOTMOD_RAMDISK, initrd_addr);
> +            }
> +            else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
> +            {
> +                uint32_t len;
> +                const __be32 *val;
> +
> +                val = dt_get_property(node, "reg", &len);
> +                if ( val == NULL )
> +                    continue;
> +                dt_get_range(&val, node, &dtb_addr, &size);
> +                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
> +                        BOOTMOD_GUEST_DTB, dtb_addr);
> +            }
> +            else
> +                continue;
> +        }
> +        name = dt_node_name(domain);
> +        cmd = boot_cmdline_find_by_name(name);
> +        if ( cmd )
> +            info->cmdline = &cmd->cmdline[0];
> +    }
> +    if ( !mod || !mod->size )
> +    {
> +        printk(XENLOG_ERR "Missing kernel boot module?\n");
> +        return -ENOENT;
> +    }
> +
> +    printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
> +           info->d, info->kernel_bootmodule->start);
> +    if ( info->initrd_bootmodule )
> +        printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
> +               info->initrd_bootmodule->start);
> +
> +    /*
> +     * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
> +     * call here just for compatability with Arm code.
> +     */
> +#ifdef CONFIG_ARM
> +    /*
> +     * uImage header always appears at the top of the image (even compressed),
> +     * so it needs to be probed first. Note that in case of compressed uImage,
> +     * kernel_decompress is called from kernel_uimage_probe making the function
> +     * self-containing (i.e. fall through only in case of a header not found).
> +     */
> +    rc = kernel_uimage_probe(info, mod);
> +    if ( rc != -ENOENT )
> +        return rc;
> +#endif
> +
> +    /*
> +     * If it is a gzip'ed image, 32bit or 64bit, uncompress it.
> +     * At this point, gzip header appears (if at all) at the top of the image,
> +     * so pass 0 as an offset.
> +     */
> +    rc = kernel_decompress(mod, 0);
> +    if ( rc && rc != -EINVAL )
> +        return rc;
> +
> +    rc = kernel_zimage_probe(info, mod->start, mod->size);
> +
> +    return rc;
> +}
> +
> +void __init kernel_load(struct kernel_info *info)
> +{
> +    ASSERT(info && info->load);
> +
> +    info->load(info);
> +}
> diff --git a/xen/include/asm-generic/kernel.h b/xen/include/asm-generic/kernel.h
> new file mode 100644
> index 0000000000..6857fabb34
> --- /dev/null
> +++ b/xen/include/asm-generic/kernel.h

This file seems to be a duplicate of the previously introduced
xen/include/xen/fdt-kernel.h ?

Other than that, I checked the rest of the patch, including all the code
movement, and it looks correct to me.



> @@ -0,0 +1,141 @@
> +/*
> + * Kernel image loading.
> + *
> + * Copyright (C) 2011 Citrix Systems, Inc.
> + */
> +
> +#ifndef __ASM_GENERIC_KERNEL_H__
> +#define __ASM_GENERIC_KERNEL_H__
> +
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +struct kernel_info {
> +    struct domain *d;
> +
> +    void *fdt; /* flat device tree */
> +    paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
> +    struct meminfo mem;
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shm_mem;
> +#endif
> +
> +    /* kernel entry point */
> +    paddr_t entry;
> +
> +    /* grant table region */
> +    paddr_t gnttab_start;
> +    paddr_t gnttab_size;
> +
> +    /* boot blob load addresses */
> +    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
> +    const char* cmdline;
> +    paddr_t dtb_paddr;
> +    paddr_t initrd_paddr;
> +
> +    /* Enable uart emulation */
> +    bool vuart;
> +
> +    /* Enable/Disable PV drivers interfaces */
> +    uint16_t dom0less_feature;
> +
> +    /* Interrupt controller phandle */
> +    uint32_t phandle_intc;
> +
> +    /* loader to use for this kernel */
> +    void (*load)(struct kernel_info *info);
> +
> +    /* loader specific state */
> +    union {
> +        struct {
> +            paddr_t kernel_addr;
> +            paddr_t len;
> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
> +            paddr_t text_offset; /* 64-bit Image only */
> +#endif
> +            paddr_t start; /* Must be 0 for 64-bit Image */
> +        } zimage;
> +    };
> +
> +    struct arch_kernel_info arch;
> +};
> +
> +static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, struct membanks, common);
> +}
> +
> +static inline const struct membanks *
> +kernel_info_get_mem_const(const struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, const struct membanks, common);
> +}
> +
> +#ifndef KERNEL_INFO_SHM_MEM_INIT
> +
> +#ifdef CONFIG_STATIC_SHM
> +#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
> +#else
> +#define KERNEL_INFO_SHM_MEM_INIT
> +#endif
> +
> +#endif /* KERNEL_INFO_SHM_MEM_INIT */
> +
> +#ifndef KERNEL_INFO_INIT
> +
> +#define KERNEL_INFO_INIT                        \
> +{                                               \
> +    .mem.common.max_banks = NR_MEM_BANKS,       \
> +    KERNEL_INFO_SHM_MEM_INIT                    \
> +}
> +
> +#endif /* KERNEL_INFO_INIT */
> +
> +/*
> + * Probe the kernel to detemine its type and select a loader.
> + *
> + * Sets in info:
> + *  ->type
> + *  ->load hook, and sets loader specific variables ->zimage
> + */
> +int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
> +
> +/*
> + * Loads the kernel into guest RAM.
> + *
> + * Expects to be set in info when called:
> + *  ->mem
> + *  ->fdt
> + *
> + * Sets in info:
> + *  ->entry
> + *  ->dtb_paddr
> + *  ->initrd_paddr
> + */
> +void kernel_load(struct kernel_info *info);
> +
> +int kernel_decompress(struct bootmodule *mod, uint32_t offset);
> +
> +int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
> +
> +/*
> + * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
> + * call here just for compatability with Arm code.
> + */
> +#ifdef CONFIG_ARM
> +struct bootmodule;
> +int kernel_uimage_probe(struct kernel_info *info, struct bootmodule *mod);
> +#endif
> +
> +#endif /*__ASM_GENERIC_KERNEL_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index c81e759423..d85324c867 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -121,6 +121,19 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
>   */
>  void kernel_load(struct kernel_info *info);
>  
> +int kernel_decompress(struct bootmodule *mod, uint32_t offset);
> +
> +int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
> +
> +/*
> + * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
> + * call here just for compatability with Arm code.
> + */
> +#ifdef CONFIG_ARM
> +struct bootmodule;
> +int kernel_uimage_probe(struct kernel_info *info, struct bootmodule *mod);
> +#endif
> +
>  #endif /* __XEN_FDT_KERNEL_H__ */
>  
>  /*
> -- 
> 2.49.0
> 


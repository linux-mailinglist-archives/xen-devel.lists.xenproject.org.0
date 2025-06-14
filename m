Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD7AD9928
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 02:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015122.1393058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEyD-0004fa-5Z; Sat, 14 Jun 2025 00:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015122.1393058; Sat, 14 Jun 2025 00:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEyD-0004d4-2N; Sat, 14 Jun 2025 00:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1015122;
 Sat, 14 Jun 2025 00:42:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQEyB-0004cy-8V
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 00:42:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fd257db-48b8-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 02:41:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B499A503DA;
 Sat, 14 Jun 2025 00:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71445C4CEE3;
 Sat, 14 Jun 2025 00:41:54 +0000 (UTC)
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
X-Inumbo-ID: 5fd257db-48b8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749861716;
	bh=ScsbSM0QcZd088S7J/AtVpoB/+Y5ipd/fsKVrRT21Uo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uxFtMPiPHcuaRKa7s6h8Yyz8lT9uVTzkeL0+Rlp5TPvREEypsvoby0bPEZoDVJ6jW
	 05bMS6j3/mGQ1KC2Lr14t3VbQhXlqILS3GNP9f0tEVHM+ngQqeAnpfQsIvY9u7Et7u
	 AaI1kQ1UOM9vUH8MbGw0s1d3hYIucY5vrMe70B+aUN+oTAtfkHF4fuuztKk2ztlZi0
	 E9vhzjvIybGE3r9YFKKlQ9uT4J9gy/cBUQEfIS7hAcjL6/UKpyWEMpUur2DyrWZa8W
	 ydsHdl3sI3znUF/SqzKkotHR4QYCYZEASKyPFK5smWzhZ+TYbmp5RAV/lv4Guza5ti
	 kXqSs15kLwXsw==
Date: Fri, 13 Jun 2025 17:41:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 04/14] xen: Rename bootmodule{,s} to boot_module{,s}
In-Reply-To: <20250613151612.754222-5-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131740470.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-5-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> ... in alignment with the new coding style on word splitting for type
> names.
> 
> This aligns its name with the largely duplicate boot_module struct
> in x86. While there's no equivalent to "struct bootmodules" in x86,
> changing one and not the other is just confusing. Same with various
> comments and function names.
> 
> Rather than making a long subfield name even longer, remove the
> _bootmodule suffix in the kernel, initrd and dtb subfields.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/arm/domain_build.c             |  4 +-
>  xen/arch/arm/efi/efi-boot.h             |  6 +--
>  xen/arch/arm/kernel.c                   |  4 +-
>  xen/arch/arm/llc-coloring.c             |  8 ++--
>  xen/arch/arm/mmu/setup.c                | 10 ++---
>  xen/arch/arm/setup.c                    | 10 ++---
>  xen/common/device-tree/bootfdt.c        |  4 +-
>  xen/common/device-tree/bootinfo.c       | 52 ++++++++++++-------------
>  xen/common/device-tree/dom0less-build.c | 25 ++++++------
>  xen/common/device-tree/domain-build.c   |  2 +-
>  xen/common/device-tree/kernel.c         | 22 +++++------
>  xen/include/xen/bootfdt.h               | 26 ++++++-------
>  xen/include/xen/fdt-kernel.h            |  7 ++--
>  xen/xsm/xsm_policy.c                    |  2 +-
>  14 files changed, 90 insertions(+), 92 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 590f38e520..7096e176ed 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -579,7 +579,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>  
>      if ( dt_node_path_is_equal(node, "/chosen") )
>      {
> -        const struct bootmodule *initrd = kinfo->initrd_bootmodule;
> +        const struct boot_module *initrd = kinfo->initrd;
>  
>          if ( bootargs )
>          {
> @@ -1447,7 +1447,7 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>  {
>      int res;
>      const char *bootargs = NULL;
> -    const struct bootmodule *initrd = kinfo->initrd_bootmodule;
> +    const struct boot_module *initrd = kinfo->initrd;
>      void *fdt = kinfo->fdt;
>  
>      dt_dprintk("Create chosen node\n");
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index d2a09ad3a1..2af8e8ea05 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -20,7 +20,7 @@ typedef struct {
>  } module_info;
>  
>  /*
> - * Binaries will be translated into bootmodules, the maximum number for them is
> + * Binaries will be translated into boot_modules, the maximum number for them is
>   * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
>   */
>  #define MAX_UEFI_MODULES (MAX_MODULES - 2)
> @@ -602,9 +602,9 @@ static void __init efi_arch_handle_module(const struct file *file,
>  
>      /*
>       * modules_available is decremented here because for each dom0 file added
> -     * from the configuration file, there will be an additional bootmodule,
> +     * from the configuration file, there will be an additional boot_module,
>       * so the number of available slots will be decremented because there is a
> -     * maximum amount of bootmodules that can be loaded.
> +     * maximum amount of boot_modules that can be loaded.
>       */
>      modules_available--;
>  }
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index cb1efb19e7..e734ec5c1e 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -46,7 +46,7 @@ static void __init place_modules(struct kernel_info *info,
>                                   paddr_t kernbase, paddr_t kernend)
>  {
>      /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
> -    const struct bootmodule *mod = info->initrd_bootmodule;
> +    const struct boot_module *mod = info->initrd;
>      const struct membanks *mem = kernel_info_get_mem(info);
>      const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
>      const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
> @@ -175,7 +175,7 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>   * Check if the image is a uImage and setup kernel_info
>   */
>  int __init kernel_uimage_probe(struct kernel_info *info,
> -                               struct bootmodule *mod)
> +                               struct boot_module *mod)
>  {
>      struct {
>          __be32 magic;   /* Image Header Magic Number */
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 99ac10b610..6f78817c57 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -123,12 +123,12 @@ static paddr_t __init xen_colored_map_size(void)
>  
>  void __init arch_llc_coloring_init(void)
>  {
> -    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> +    struct boot_module *xen_boot_module = boot_module_find_by_kind(BOOTMOD_XEN);
>  
> -    BUG_ON(!xen_bootmodule);
> +    BUG_ON(!xen_boot_module);
>  
> -    xen_bootmodule->size = xen_colored_map_size();
> -    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
> +    xen_boot_module->size = xen_colored_map_size();
> +    xen_boot_module->start = get_xen_paddr(xen_boot_module->size);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 30afe97781..eb8ed19ca1 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -246,7 +246,7 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
>  #ifdef CONFIG_STATIC_SHM
>      const struct membanks *shmem = bootinfo_get_shmem();
>  #endif
> -    const struct bootmodules *mi = &bootinfo.modules;
> +    const struct boot_modules *mi = &bootinfo.modules;
>      int i;
>      int nr;
>  
> @@ -273,8 +273,8 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
>      }
>  
>      /*
> -     * i is the current bootmodule we are evaluating, across all
> -     * possible kinds of bootmodules.
> +     * i is the current boot_module we are evaluating, across all
> +     * possible kinds of boot_modules.
>       *
>       * When retrieving the corresponding reserved-memory addresses, we
>       * need to index the reserved_mem bank starting from 0, and only counting
> @@ -328,8 +328,8 @@ static void __init create_llc_coloring_mappings(void)
>  {
>      lpae_t pte;
>      unsigned int i;
> -    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> -    mfn_t start_mfn = maddr_to_mfn(xen_bootmodule->start), mfn;
> +    struct boot_module *xen_boot_module = boot_module_find_by_kind(BOOTMOD_XEN);
> +    mfn_t start_mfn = maddr_to_mfn(xen_boot_module->start), mfn;
>  
>      for_each_xen_colored_mfn ( start_mfn, mfn, i )
>      {
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 734e23da44..8b2e65a1a5 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -206,11 +206,11 @@ static void __init processor_id(void)
>  
>  void __init discard_initial_modules(void)
>  {
> -    struct bootmodules *mi = &bootinfo.modules;
> +    struct boot_modules *mi = &bootinfo.modules;
>      int i;
>  
>      /*
> -     * When using static heap feature, don't give bootmodules memory back to
> +     * When using static heap feature, don't give boot_modules memory back to
>       * the heap allocator
>       */
>      if ( using_static_heap )
> @@ -303,7 +303,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>  {
>      size_t fdt_size;
>      const char *cmdline;
> -    struct bootmodule *xen_bootmodule;
> +    struct boot_module *xen_boot_module;
>      struct domain *d;
>      int rc, i;
>  
> @@ -327,10 +327,10 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>                fdt_paddr);
>  
>      /* Register Xen's load address as a boot module. */
> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
> +    xen_boot_module = add_boot_module(BOOTMOD_XEN,
>                               virt_to_maddr(_start),
>                               (paddr_t)(uintptr_t)(_end - _start), false);
> -    BUG_ON(!xen_bootmodule);
> +    BUG_ON(!xen_boot_module);
>  
>      fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
>  
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 9daea06e57..39334d6205 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -314,7 +314,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
>      static int __initdata kind_guess = 0;
>      const struct fdt_property *prop;
>      const __be32 *cell;
> -    bootmodule_kind kind;
> +    boot_module_kind kind;
>      paddr_t start, size;
>      int len;
>      /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
> @@ -518,7 +518,7 @@ static void __init early_print_info(void)
>  {
>      const struct membanks *mi = bootinfo_get_mem();
>      const struct membanks *mem_resv = bootinfo_get_reserved_mem();
> -    struct bootmodules *mods = &bootinfo.modules;
> +    struct boot_modules *mods = &bootinfo.modules;
>      struct bootcmdlines *cmds = &bootinfo.cmdlines;
>      unsigned int i;
>  
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index 717cfa0962..2a27d1318b 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -21,7 +21,7 @@
>  
>  struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
>  
> -const char * __init boot_module_kind_as_string(bootmodule_kind kind)
> +const char * __init boot_module_kind_as_string(boot_module_kind kind)
>  {
>      switch ( kind )
>      {
> @@ -49,7 +49,7 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>      unsigned int i;
>  
>      /*
> -     * i is the current bootmodule we are evaluating across all possible
> +     * i is the current boot_module we are evaluating across all possible
>       * kinds.
>       */
>      for ( i = first; i < reserved_mem->nr_banks; i++ )
> @@ -143,18 +143,18 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>   * TODO: '*_end' could be 0 if the module/region is at the end of the physical
>   * address space. This is for now not handled as it requires more rework.
>   */
> -static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
> -                                             paddr_t region_start,
> -                                             paddr_t region_size)
> +static bool __init boot_modules_overlap_check(struct boot_modules *boot_modules,
> +                                              paddr_t region_start,
> +                                              paddr_t region_size)
>  {
>      paddr_t mod_start = INVALID_PADDR, mod_end = 0;
>      paddr_t region_end = region_start + region_size;
> -    unsigned int i, mod_num = bootmodules->nr_mods;
> +    unsigned int i, mod_num = boot_modules->nr_mods;
>  
>      for ( i = 0; i < mod_num; i++ )
>      {
> -        mod_start = bootmodules->module[i].start;
> -        mod_end = mod_start + bootmodules->module[i].size;
> +        mod_start = boot_modules->module[i].start;
> +        mod_end = mod_start + boot_modules->module[i].size;
>  
>          if ( region_end <= mod_start || region_start >= mod_end )
>              continue;
> @@ -210,20 +210,20 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>                                     allow_memreserve_overlap) )
>              return true;
>  
> -    /* Check if input region is overlapping with bootmodules */
> -    if ( bootmodules_overlap_check(&bootinfo.modules,
> -                                   region_start, region_size) )
> +    /* Check if input region is overlapping with boot_modules */
> +    if ( boot_modules_overlap_check(&bootinfo.modules,
> +                                    region_start, region_size) )
>          return true;
>  
>      return false;
>  }
>  
> -struct bootmodule __init *add_boot_module(bootmodule_kind kind,
> -                                          paddr_t start, paddr_t size,
> -                                          bool domU)
> +struct boot_module __init *add_boot_module(boot_module_kind kind,
> +                                           paddr_t start, paddr_t size,
> +                                           bool domU)
>  {
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> +    struct boot_modules *mods = &bootinfo.modules;
> +    struct boot_module *mod;
>      unsigned int i;
>  
>      if ( mods->nr_mods == MAX_MODULES )
> @@ -266,10 +266,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>   * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
>   * modules.
>   */
> -struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
> +struct boot_module * __init boot_module_find_by_kind(boot_module_kind kind)
>  {
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> +    struct boot_modules *mods = &bootinfo.modules;
> +    struct boot_module *mod;
>      int i;
>      for (i = 0 ; i < mods->nr_mods ; i++ )
>      {
> @@ -281,7 +281,7 @@ struct bootmodule * __init boot_module_find_by_kind(bootmodule_kind kind)
>  }
>  
>  void __init add_boot_cmdline(const char *name, const char *cmdline,
> -                             bootmodule_kind kind, paddr_t start, bool domU)
> +                             boot_module_kind kind, paddr_t start, bool domU)
>  {
>      struct bootcmdlines *cmds = &bootinfo.cmdlines;
>      struct bootcmdline *cmd;
> @@ -310,7 +310,7 @@ void __init add_boot_cmdline(const char *name, const char *cmdline,
>   * XSM, DTB) or Dom0 modules. This is not suitable for looking up guest
>   * modules.
>   */
> -struct bootcmdline * __init boot_cmdline_find_by_kind(bootmodule_kind kind)
> +struct bootcmdline * __init boot_cmdline_find_by_kind(boot_module_kind kind)
>  {
>      struct bootcmdlines *cmds = &bootinfo.cmdlines;
>      struct bootcmdline *cmd;
> @@ -340,11 +340,11 @@ struct bootcmdline * __init boot_cmdline_find_by_name(const char *name)
>      return NULL;
>  }
>  
> -struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> -                                                             paddr_t start)
> +struct boot_module * __init boot_module_find_by_addr_and_kind(
> +    boot_module_kind kind, paddr_t start)
>  {
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> +    struct boot_modules *mods = &bootinfo.modules;
> +    struct boot_module *mod;
>      unsigned int i;
>  
>      for (i = 0 ; i < mods->nr_mods ; i++ )
> @@ -366,7 +366,7 @@ struct bootmodule * __init boot_module_find_by_addr_and_kind(bootmodule_kind kin
>   */
>  static paddr_t __init next_module(paddr_t s, paddr_t *end)
>  {
> -    struct bootmodules *mi = &bootinfo.modules;
> +    struct boot_modules *mi = &bootinfo.modules;
>      paddr_t lowest = ~(paddr_t)0;
>      int i;
>  
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3d503c6973..221b875a2f 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -44,13 +44,13 @@ void __init set_xs_domain(struct domain *d)
>  
>  bool __init is_dom0less_mode(void)
>  {
> -    struct bootmodules *mods = &bootinfo.modules;
> -    struct bootmodule *mod;
> +    struct boot_modules *mods = &bootinfo.modules;
> +    struct boot_module *mod;
>      unsigned int i;
>      bool dom0found = false;
>      bool domUfound = false;
>  
> -    /* Look into the bootmodules */
> +    /* Look into the boot_modules */
>      for ( i = 0 ; i < mods->nr_mods ; i++ )
>      {
>          mod = &mods->module[i];
> @@ -374,18 +374,17 @@ static int __init check_partial_fdt(void *pfdt, size_t size)
>      return 0;
>  }
>  
> -static int __init domain_handle_dtb_bootmodule(struct domain *d,
> -                                               struct kernel_info *kinfo)
> +static int __init domain_handle_dtb_boot_module(struct domain *d,
> +                                                struct kernel_info *kinfo)
>  {
>      void *pfdt;
>      int res, node_next;
>  
> -    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
> -                         kinfo->dtb_bootmodule->size);
> +    pfdt = ioremap_cache(kinfo->dtb->start, kinfo->dtb->size);
>      if ( pfdt == NULL )
>          return -EFAULT;
>  
> -    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
> +    res = check_partial_fdt(pfdt, kinfo->dtb->size);
>      if ( res < 0 )
>          goto out;
>  
> @@ -459,8 +458,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      sizecells = GUEST_ROOT_SIZE_CELLS;
>  
>      /* Account for domU passthrough DT size */
> -    if ( kinfo->dtb_bootmodule )
> -        fdt_size += kinfo->dtb_bootmodule->size;
> +    if ( kinfo->dtb )
> +        fdt_size += kinfo->dtb->size;
>  
>      /* Cap to max DT size if needed */
>      fdt_size = min(fdt_size, SZ_2M);
> @@ -507,13 +506,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>          goto err;
>  
>      /*
> -     * domain_handle_dtb_bootmodule has to be called before the rest of
> +     * domain_handle_dtb_boot_module has to be called before the rest of
>       * the device tree is generated because it depends on the value of
>       * the field phandle_intc.
>       */
> -    if ( kinfo->dtb_bootmodule )
> +    if ( kinfo->dtb )
>      {
> -        ret = domain_handle_dtb_bootmodule(d, kinfo);
> +        ret = domain_handle_dtb_boot_module(d, kinfo);
>          if ( ret )
>              goto err;
>      }
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 6b8b8d7cac..fa4f700597 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -347,7 +347,7 @@ void __init dtb_load(struct kernel_info *kinfo,
>  void __init initrd_load(struct kernel_info *kinfo,
>                          copy_to_guest_phys_cb copy_to_guest)
>  {
> -    const struct bootmodule *mod = kinfo->initrd_bootmodule;
> +    const struct boot_module *mod = kinfo->initrd;
>      paddr_t load_addr = kinfo->initrd_paddr;
>      paddr_t paddr, len;
>      int node;
> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
> index cb04cd9d50..e1b22dc1c7 100644
> --- a/xen/common/device-tree/kernel.c
> +++ b/xen/common/device-tree/kernel.c
> @@ -21,7 +21,7 @@ static uint32_t __init output_length(char *image, unsigned long image_len)
>      return *(uint32_t *)&image[image_len - 4];
>  }
>  
> -int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
> +int __init kernel_decompress(struct boot_module *mod, uint32_t offset)
>  {
>      char *output, *input;
>      char magic[2];
> @@ -92,7 +92,7 @@ int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
>          free_domheap_page(pages + i);
>  
>      /*
> -     * When using static heap feature, don't give bootmodules memory back to
> +     * When using static heap feature, don't give boot_modules memory back to
>       * the heap allocator
>       */
>      if ( using_static_heap )
> @@ -118,7 +118,7 @@ int __init kernel_decompress(struct bootmodule *mod, uint32_t offset)
>  int __init kernel_probe(struct kernel_info *info,
>                          const struct dt_device_node *domain)
>  {
> -    struct bootmodule *mod = NULL;
> +    struct boot_module *mod = NULL;
>      struct bootcmdline *cmd = NULL;
>      struct dt_device_node *node;
>      u64 kernel_addr, initrd_addr, dtb_addr, size;
> @@ -140,8 +140,8 @@ int __init kernel_probe(struct kernel_info *info,
>  
>          mod = boot_module_find_by_kind(BOOTMOD_KERNEL);
>  
> -        info->kernel_bootmodule = mod;
> -        info->initrd_bootmodule = boot_module_find_by_kind(BOOTMOD_RAMDISK);
> +        info->kernel = mod;
> +        info->initrd = boot_module_find_by_kind(BOOTMOD_RAMDISK);
>  
>          cmd = boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
>          if ( cmd )
> @@ -162,7 +162,7 @@ int __init kernel_probe(struct kernel_info *info,
>                  dt_get_range(&val, node, &kernel_addr, &size);
>                  mod = boot_module_find_by_addr_and_kind(
>                          BOOTMOD_KERNEL, kernel_addr);
> -                info->kernel_bootmodule = mod;
> +                info->kernel = mod;
>              }
>              else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
>              {
> @@ -171,7 +171,7 @@ int __init kernel_probe(struct kernel_info *info,
>  
>                  val = dt_get_property(node, "reg", &len);
>                  dt_get_range(&val, node, &initrd_addr, &size);
> -                info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
> +                info->initrd = boot_module_find_by_addr_and_kind(
>                          BOOTMOD_RAMDISK, initrd_addr);
>              }
>              else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
> @@ -183,7 +183,7 @@ int __init kernel_probe(struct kernel_info *info,
>                  if ( val == NULL )
>                      continue;
>                  dt_get_range(&val, node, &dtb_addr, &size);
> -                info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
> +                info->dtb = boot_module_find_by_addr_and_kind(
>                          BOOTMOD_GUEST_DTB, dtb_addr);
>              }
>              else
> @@ -201,10 +201,10 @@ int __init kernel_probe(struct kernel_info *info,
>      }
>  
>      printk("Loading %pd kernel from boot module @ %"PRIpaddr"\n",
> -           info->d, info->kernel_bootmodule->start);
> -    if ( info->initrd_bootmodule )
> +           info->d, info->kernel->start);
> +    if ( info->initrd )
>          printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
> -               info->initrd_bootmodule->start);
> +               info->initrd->start);
>  
>      /*
>       * uImage isn't really used nowadays thereby leave kernel_uimage_probe()
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index ff40f3078e..236b456dd2 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -23,7 +23,7 @@ typedef enum {
>      BOOTMOD_GUEST_DTB,
>      BOOTMOD_MICROCODE,
>      BOOTMOD_UNKNOWN
> -}  bootmodule_kind;
> +}  boot_module_kind;
>  
>  enum membank_type {
>      /*
> @@ -103,8 +103,8 @@ struct shared_meminfo {
>   * initrd to be compatible with all versions of the multiboot spec.
>   */
>  #define BOOTMOD_MAX_CMDLINE 1024
> -struct bootmodule {
> -    bootmodule_kind kind;
> +struct boot_module {
> +    boot_module_kind kind;
>      bool domU;
>      paddr_t start;
>      paddr_t size;
> @@ -113,16 +113,16 @@ struct bootmodule {
>  /* DT_MAX_NAME is the node name max length according the DT spec */
>  #define DT_MAX_NAME 41
>  struct bootcmdline {
> -    bootmodule_kind kind;
> +    boot_module_kind kind;
>      bool domU;
>      paddr_t start;
>      char dt_name[DT_MAX_NAME];
>      char cmdline[BOOTMOD_MAX_CMDLINE];
>  };
>  
> -struct bootmodules {
> +struct boot_modules {
>      int nr_mods;
> -    struct bootmodule module[MAX_MODULES];
> +    struct boot_module module[MAX_MODULES];
>  };
>  
>  struct bootcmdlines {
> @@ -134,7 +134,7 @@ struct bootinfo {
>      struct meminfo mem;
>      /* The reserved regions are only used when booting using Device-Tree */
>      struct meminfo reserved_mem;
> -    struct bootmodules modules;
> +    struct boot_modules modules;
>      struct bootcmdlines cmdlines;
>  #ifdef CONFIG_ACPI
>      struct meminfo acpi;
> @@ -176,16 +176,16 @@ bool check_reserved_regions_overlap(paddr_t region_start,
>                                      paddr_t region_size,
>                                      bool allow_memreserve_overlap);
>  
> -struct bootmodule *add_boot_module(bootmodule_kind kind,
> +struct boot_module *add_boot_module(boot_module_kind kind,
>                                     paddr_t start, paddr_t size, bool domU);
> -struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
> -struct bootmodule * boot_module_find_by_addr_and_kind(bootmodule_kind kind,
> +struct boot_module *boot_module_find_by_kind(boot_module_kind kind);
> +struct boot_module * boot_module_find_by_addr_and_kind(boot_module_kind kind,
>                                                               paddr_t start);
>  void add_boot_cmdline(const char *name, const char *cmdline,
> -                      bootmodule_kind kind, paddr_t start, bool domU);
> -struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
> +                      boot_module_kind kind, paddr_t start, bool domU);
> +struct bootcmdline *boot_cmdline_find_by_kind(boot_module_kind kind);
>  struct bootcmdline * boot_cmdline_find_by_name(const char *name);
> -const char *boot_module_kind_as_string(bootmodule_kind kind);
> +const char *boot_module_kind_as_string(boot_module_kind kind);
>  
>  void populate_boot_allocator(void);
>  
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 1939c3ebf7..12a0b42d17 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -34,7 +34,7 @@ struct kernel_info {
>      paddr_t gnttab_size;
>  
>      /* boot blob load addresses */
> -    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
> +    const struct boot_module *kernel, *initrd, *dtb;
>      const char* cmdline;
>      paddr_t dtb_paddr;
>      paddr_t initrd_paddr;
> @@ -121,7 +121,7 @@ int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
>   */
>  void kernel_load(struct kernel_info *info);
>  
> -int kernel_decompress(struct bootmodule *mod, uint32_t offset);
> +int kernel_decompress(struct boot_module *mod, uint32_t offset);
>  
>  int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
>  
> @@ -130,8 +130,7 @@ int kernel_zimage_probe(struct kernel_info *info, paddr_t addr, paddr_t size);
>   * call here just for compatability with Arm code.
>   */
>  #ifdef CONFIG_ARM
> -struct bootmodule;

I just wanted to mention that I went line by line and this is the only
not search-and-replace change in this patch.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> -int kernel_uimage_probe(struct kernel_info *info, struct bootmodule *mod);
> +int kernel_uimage_probe(struct kernel_info *info, struct boot_module *mod);
>  #endif
>  
>  #endif /* __XEN_FDT_KERNEL_H__ */
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 7f70d860bd..1f88b4fc5a 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -68,7 +68,7 @@ int __init xsm_multiboot_policy_init(
>  #ifdef CONFIG_HAS_DEVICE_TREE
>  int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>  {
> -    struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
> +    struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
>      paddr_t paddr, len;
>  
>      if ( !mod || !mod->size )
> -- 
> 2.43.0
> 


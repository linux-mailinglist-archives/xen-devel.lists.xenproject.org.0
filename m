Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463ACAD9948
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 02:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015133.1393067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFAh-0006SD-AG; Sat, 14 Jun 2025 00:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015133.1393067; Sat, 14 Jun 2025 00:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQFAh-0006Ql-7e; Sat, 14 Jun 2025 00:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1015133;
 Sat, 14 Jun 2025 00:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQFAf-0006Qf-RK
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 00:54:57 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f8f32fe-48ba-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 02:54:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F5114A8FE;
 Sat, 14 Jun 2025 00:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A454AC4CEE3;
 Sat, 14 Jun 2025 00:54:52 +0000 (UTC)
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
X-Inumbo-ID: 2f8f32fe-48ba-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749862494;
	bh=5Y4Jxm55HtW/ogZ7bPNjtMmjHbwk/pl5TtQ0yTP0lWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OmiZR2xiB1nJL6olbR3ynNR4g2gngq2j2XzO8F6xTtJOFzIw9X1t4Ab21wvLIv6GB
	 iQaoFz9tGZlXNMc4rFz9z7f/kTFeO1AUZu9nzPB1ngHZZUrnZHTD5drY4yLVS5KJZy
	 c8+3ViRNCG0za4MiTtL2NDLWaUI9iLRGKPMypNtJGrr89eEZYUgZK0Ysrsh3dz8BNR
	 1kJasS3+CqrC3RZSb0B6nlG9KuBH5Sby5/CtEW7WcPvtCbTE/HvdlbsuEIOWtCzqz5
	 ucteaRxQH7sbxQNB8fixn7nUOo2OJKOyWfDaNaR3xzgtWC9Z2fBFzEwU4/QfhcSzaF
	 uP8mP9j6rJtLg==
Date: Fri, 13 Jun 2025 17:54:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 05/14] x86: Replace arch-specific boot_module with
 common one
In-Reply-To: <20250613151612.754222-6-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131743190.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-6-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent,
> and with "struct boot_module" already in common code it makes perfect
> sense to merge them. In order to do so, add an arch-specific area for
> x86-specific tidbits, and rename identical fields with conflicting
> names.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Hi Alejandro, this patch doesn't apply to staging anymore, it conflict
with 3998da124.


> ---
>  xen/arch/x86/cpu/microcode/core.c   |  7 ++--
>  xen/arch/x86/hvm/dom0_build.c       |  8 ++---
>  xen/arch/x86/include/asm/bootfdt.h  | 50 ++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/bootinfo.h | 56 +++--------------------------
>  xen/arch/x86/pv/dom0_build.c        |  6 ++--
>  xen/arch/x86/setup.c                | 42 +++++++++++-----------
>  xen/include/xen/bootfdt.h           |  8 +++++
>  xen/xsm/xsm_policy.c                |  2 +-
>  8 files changed, 95 insertions(+), 84 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/bootfdt.h
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 34a94cd25b..816e9bfe40 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -764,8 +764,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>              struct cpio_data cd;
>  
>              /* Search anything unclaimed or likely to be a CPIO archive. */
> -            if ( bm->type != BOOTMOD_UNKNOWN &&
> -                 bm->type != BOOTMOD_RAMDISK )
> +            if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
>                  continue;
>  
>              size = bm->size;
> @@ -815,12 +814,12 @@ static int __init early_microcode_load(struct boot_info *bi)
>              return -ENODEV;
>          }
>  
> -        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
> +        if ( bi->mods[idx].kind != BOOTMOD_UNKNOWN )
>          {
>              printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
>              return -ENODEV;
>          }
> -        bi->mods[idx].type = BOOTMOD_MICROCODE;
> +        bi->mods[idx].kind = BOOTMOD_MICROCODE;
>  
>          size = bi->mods[idx].size;
>          data = bootstrap_map_bm(&bi->mods[idx]);
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index a038e58c11..8d2734f2b5 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -648,9 +648,9 @@ static int __init pvh_load_kernel(
>  {
>      struct domain *d = bd->d;
>      struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct boot_module *initrd = bd->initrd;

It looks like struct boot_domain is still calling its member "module" at
this point


>      void *image_base = bootstrap_map_bm(image);
> -    void *image_start = image_base + image->headroom;
> +    void *image_start = image_base + image->arch.headroom;
>      unsigned long image_len = image->size;
>      unsigned long initrd_len = initrd ? initrd->size : 0;
>      size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
> @@ -721,9 +721,9 @@ static int __init pvh_load_kernel(
>      {
>          size_t initrd_space = elf_round_up(&elf, initrd_len);
>  
> -        if ( initrd->cmdline_pa )
> +        if ( initrd->arch.cmdline_pa )
>          {
> -            initrd_cmdline = __va(initrd->cmdline_pa);
> +            initrd_cmdline = __va(initrd->arch.cmdline_pa);
>              if ( !*initrd_cmdline )
>                  initrd_cmdline = NULL;
>          }
> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
> new file mode 100644
> index 0000000000..a4c4bf30b9
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef X86_BOOTFDT_H
> +#define X86_BOOTFDT_H
> +
> +#include <xen/types.h>
> +
> +struct arch_boot_module
> +{
> +    /*
> +     * Module State Flags:
> +     *   relocated:   indicates module has been relocated in memory.
> +     *   released:    indicates module's pages have been freed.
> +     */
> +    bool relocated:1;
> +    bool released:1;
> +
> +    /*
> +     * A boot module may need decompressing by Xen.  Headroom is an estimate of
> +     * the additional space required to decompress the module.
> +     *
> +     * Headroom is accounted for at the start of the module.  Decompressing is
> +     * done in-place with input=start, output=start-headroom, expecting the
> +     * pointers to become equal (give or take some rounding) when decompression
> +     * is complete.
> +     *
> +     * Memory layout at boot:
> +     *
> +     *               start ----+
> +     *                         v
> +     *   |<-----headroom------>|<------size------->|
> +     *                         +-------------------+
> +     *                         | Compressed Module |
> +     *   +---------------------+-------------------+
> +     *   |           Decompressed Module           |
> +     *   +-----------------------------------------+
> +     */
> +    unsigned long headroom;
> +    paddr_t cmdline_pa;
> +};
> +
> +#endif /* X86_BOOTFDT_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index 3afc214c17..d33b100e04 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -8,6 +8,7 @@
>  #ifndef X86_BOOTINFO_H
>  #define X86_BOOTINFO_H
>  
> +#include <xen/bootfdt.h>
>  #include <xen/init.h>
>  #include <xen/multiboot.h>
>  #include <xen/types.h>
> @@ -19,55 +20,6 @@
>  /* Max number of boot domains that Xen can construct */
>  #define MAX_NR_BOOTDOMS 1
>  
> -/* Boot module binary type / purpose */
> -enum bootmod_type {
> -    BOOTMOD_UNKNOWN,
> -    BOOTMOD_XEN,
> -    BOOTMOD_KERNEL,
> -    BOOTMOD_RAMDISK,
> -    BOOTMOD_MICROCODE,
> -    BOOTMOD_XSM_POLICY,
> -};
> -
> -struct boot_module {
> -    enum bootmod_type type;
> -
> -    /*
> -     * Module State Flags:
> -     *   relocated: indicates module has been relocated in memory.
> -     *   released:  indicates module's pages have been freed.
> -     */
> -    bool relocated:1;
> -    bool released:1;
> -
> -    /*
> -     * A boot module may need decompressing by Xen.  Headroom is an estimate of
> -     * the additional space required to decompress the module.
> -     *
> -     * Headroom is accounted for at the start of the module.  Decompressing is
> -     * done in-place with input=start, output=start-headroom, expecting the
> -     * pointers to become equal (give or take some rounding) when decompression
> -     * is complete.
> -     *
> -     * Memory layout at boot:
> -     *
> -     *               start ----+
> -     *                         v
> -     *   |<-----headroom------>|<------size------->|
> -     *                         +-------------------+
> -     *                         | Compressed Module |
> -     *   +---------------------+-------------------+
> -     *   |           Decompressed Module           |
> -     *   +-----------------------------------------+
> -     */
> -    unsigned long headroom;
> -
> -    paddr_t cmdline_pa;
> -
> -    paddr_t start;
> -    size_t size;
> -};
> -
>  /*
>   * Xen internal representation of information provided by the
>   * bootloader/environment, or derived from the information.
> @@ -94,16 +46,16 @@ struct boot_info {
>   *      Failure - a value greater than MAX_NR_BOOTMODS
>   */
>  static inline unsigned int __init next_boot_module_index(
> -    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
> +    const struct boot_info *bi, boot_module_kind k, unsigned int start)
>  {
>      unsigned int i;
>  
> -    if ( t == BOOTMOD_XEN )
> +    if ( k == BOOTMOD_XEN )
>          return bi->nr_modules;
>  
>      for ( i = start; i < bi->nr_modules; i++ )
>      {
> -        if ( bi->mods[i].type == t )
> +        if ( bi->mods[i].kind == k )
>              return i;
>      }
>  
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index e1b78d47c2..c37bea9454 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>      struct vcpu *v = d->vcpu[0];
>  
>      struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct boot_module *initrd = bd->initrd;
>      void *image_base;
>      unsigned long image_len;
>      void *image_start;
> @@ -422,7 +422,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>  
>      image_base = bootstrap_map_bm(image);
>      image_len = image->size;
> -    image_start = image_base + image->headroom;
> +    image_start = image_base + image->arch.headroom;
>  
>      d->max_pages = ~0U;
>  
> @@ -659,7 +659,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>               * pages. Tell the boot_module handling that we've freed it, so the
>               * memory is left alone.
>               */
> -            initrd->released = true;
> +            initrd->arch.released = true;
>          }
>  
>          iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 7d3b30e1db..c00b22205a 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -303,7 +303,7 @@ struct boot_info __initdata xen_boot_info = {
>       *
>       * The extra entry exists to be able to add the Xen image as a module.
>       */
> -    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
> +    .mods = { [0 ... MAX_NR_BOOTMODS] = { .kind = BOOTMOD_UNKNOWN } },
>  };
>  
>  static struct boot_info *__init multiboot_fill_boot_info(
> @@ -338,7 +338,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>       */
>      for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>      {
> -        bi->mods[i].cmdline_pa = mods[i].string;
> +        bi->mods[i].arch.cmdline_pa = mods[i].string;
>  
>          if ( efi_enabled(EFI_LOADER) )
>          {
> @@ -361,7 +361,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>      }
>  
>      /* Variable 'i' should be one entry past the last module. */
> -    bi->mods[i].type = BOOTMOD_XEN;
> +    bi->mods[i].kind = BOOTMOD_XEN;
>  
>      return bi;
>  }
> @@ -388,11 +388,11 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>  
>  void __init release_boot_module(struct boot_module *bm)
>  {
> -    ASSERT(!bm->released);
> +    ASSERT(!bm->arch.released);
>  
>      init_domheap_pages(bm->start, bm->start + PAGE_ALIGN(bm->size));
>  
> -    bm->released = true;
> +    bm->arch.released = true;
>  }
>  
>  void __init free_boot_modules(void)
> @@ -402,7 +402,7 @@ void __init free_boot_modules(void)
>  
>      for ( i = 0; i < bi->nr_modules; ++i )
>      {
> -        if ( bi->mods[i].released )
> +        if ( bi->mods[i].arch.released )
>              continue;
>  
>          release_boot_module(&bi->mods[i]);
> @@ -990,8 +990,9 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
>                                           const struct boot_domain *bd)
>  {
>      size_t s = bi->kextra ? strlen(bi->kextra) : 0;
> +    const struct arch_boot_module *abm = &bd->kernel->arch;
>  
> -    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +    s += abm->cmdline_pa ? strlen(__va(abm->cmdline_pa)) : 0;
>  
>      if ( s == 0 )
>          return s;
> @@ -1055,9 +1056,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>              panic("Error allocating cmdline buffer for %pd\n", d);
>  
> -        if ( bd->kernel->cmdline_pa )
> +        if ( bd->kernel->arch.cmdline_pa )
>              strlcpy(cmdline,
> -                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
> +                    cmdline_cook(__va(bd->kernel->arch.cmdline_pa),
> +                                 bi->loader),
>                      cmdline_size);
>  
>          if ( bi->kextra )
> @@ -1079,7 +1081,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>              strlcat(cmdline, " acpi=", cmdline_size);
>              strlcat(cmdline, acpi_param, cmdline_size);
>          }
> -        bd->kernel->cmdline_pa = 0;
> +        bd->kernel->arch.cmdline_pa = 0;
>          bd->cmdline = cmdline;
>      }
>  
> @@ -1292,7 +1294,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      }
>  
>      /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> +    bi->mods[0].kind = BOOTMOD_KERNEL;
>      bi->domains[0].kernel = &bi->mods[0];
>  
>      if ( pvh_boot )
> @@ -1476,7 +1478,7 @@ void asmlinkage __init noreturn __start_xen(void)
>          xen->size  = __2M_rwdata_end - _stext;
>      }
>  
> -    bi->mods[0].headroom =
> +    bi->mods[0].arch.headroom =
>          bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>      bootstrap_unmap();
>  
> @@ -1558,9 +1560,9 @@ void asmlinkage __init noreturn __start_xen(void)
>          for ( j = bi->nr_modules - 1; j >= 0; j-- )
>          {
>              struct boot_module *bm = &bi->mods[j];
> -            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
> +            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
>  
> -            if ( bm->relocated )
> +            if ( bm->arch.relocated )
>                  continue;
>  
>              /* Don't overlap with other modules (or Xen itself). */
> @@ -1570,12 +1572,12 @@ void asmlinkage __init noreturn __start_xen(void)
>              if ( highmem_start && end > highmem_start )
>                  continue;
>  
> -            if ( s < end && (bm->headroom || (end - size) > bm->start) )
> +            if ( s < end && (bm->arch.headroom || (end - size) > bm->start) )
>              {
> -                move_memory(end - size + bm->headroom, bm->start, bm->size);
> +                move_memory(end - size + bm->arch.headroom, bm->start, bm->size);
>                  bm->start = (end - size);
> -                bm->size += bm->headroom;
> -                bm->relocated = true;
> +                bm->size += bm->arch.headroom;
> +                bm->arch.relocated = true;
>              }
>          }
>  
> @@ -1601,7 +1603,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  #endif
>      }
>  
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
>          panic("Not enough memory to relocate the dom0 kernel image\n");
>      for ( i = 0; i < bi->nr_modules; ++i )
>      {
> @@ -2159,7 +2161,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>      if ( initrdidx < MAX_NR_BOOTMODS )
>      {
> -        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> +        bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
>          bi->domains[0].module = &bi->mods[initrdidx];
>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>              printk(XENLOG_WARNING
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 236b456dd2..854e7f1ed9 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -7,6 +7,10 @@
>  #include <xen/macros.h>
>  #include <xen/xmalloc.h>
>  
> +#if __has_include(<asm/bootfdt.h>)
> +#include <asm/bootfdt.h>
> +#endif
> +
>  #define MIN_FDT_ALIGN 8
>  
>  #define NR_MEM_BANKS 256
> @@ -108,6 +112,10 @@ struct boot_module {
>      bool domU;
>      paddr_t start;
>      paddr_t size;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_boot_module arch;
> +#endif
>  };
>  
>  /* DT_MAX_NAME is the node name max length according the DT spec */
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 1f88b4fc5a..1b4030edb4 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
>              printk("Policy len %#lx, start at %p.\n",
>                     _policy_len,_policy_start);
>  
> -            bm->type = BOOTMOD_XSM_POLICY;
> +            bm->kind = BOOTMOD_XSM;
>              break;
>  
>          }
> -- 
> 2.43.0
> 


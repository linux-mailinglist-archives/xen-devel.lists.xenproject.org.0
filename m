Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D24AC98BE
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001805.1381935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAp3-00057e-Df; Sat, 31 May 2025 01:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001805.1381935; Sat, 31 May 2025 01:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAp3-00055n-AO; Sat, 31 May 2025 01:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1001805;
 Sat, 31 May 2025 01:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAp1-00055g-Ih
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:15:39 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c244cf69-3dbc-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:15:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0D449629C1;
 Sat, 31 May 2025 01:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B15C4CEEB;
 Sat, 31 May 2025 01:15:34 +0000 (UTC)
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
X-Inumbo-ID: c244cf69-3dbc-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748654135;
	bh=jcdAsiCbQ3cf2MFF+M7HgfsH3we3p4nHID/5dy85cC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJBUYh6KF4BZtUwIK38f1R1LDYna+CoNiJdHsxHT1MnaYQ3G2N8LTxsbMA4ZQt26F
	 N0B+UT+ScJV3iAAXu9wyssPUBerwS0VBuCCq35O2pYRz1sWUMMTXV8IhL7F3ahnwLa
	 kEIX4rzLKtN2pfcXN/SwV+G+Dk7LAJjbCykWFQkmV4X9IpjLWhon56Wv7ylTr9tCEZ
	 ZCJxd9u6PPHePXiWbhUNrfcc0N7LW0xQjRIicTR/J0Y6jEclubkwL9lL7yTt4aC5An
	 oLwm4vdUorTt2nRfa4jqXZH68aF8XiHdQCqK62nzqCTmhz7o4yI0RwQDSFH5tMrS9o
	 8uudJ9xVTaJ1Q==
Date: Fri, 30 May 2025 18:15:32 -0700 (PDT)
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
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
In-Reply-To: <20250530120242.39398-11-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301814450.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-11-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent, and
> with "struct bootmodule" already in common code it makes perfect sense
> to merge them. In order to do so, add an arch-specific area for
> x86-specific tidbits.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/x86/cpu/microcode/core.c      |  9 ++--
>  xen/arch/x86/hvm/dom0_build.c          | 10 ++---
>  xen/arch/x86/include/asm/boot-domain.h |  4 +-
>  xen/arch/x86/include/asm/bootfdt.h     | 52 +++++++++++++++++++++++
>  xen/arch/x86/include/asm/bootinfo.h    | 58 +++-----------------------
>  xen/arch/x86/include/asm/setup.h       |  6 +--
>  xen/arch/x86/pv/dom0_build.c           |  8 ++--
>  xen/arch/x86/setup.c                   | 52 ++++++++++++-----------
>  xen/include/xen/bootfdt.h              |  9 ++++
>  xen/xsm/xsm_policy.c                   |  4 +-
>  10 files changed, 113 insertions(+), 99 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/bootfdt.h
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 34a94cd25b..0111ef9156 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -760,12 +760,11 @@ static int __init early_microcode_load(struct boot_info *bi)
>      {
>          for ( idx = 0; idx < bi->nr_modules; ++idx )
>          {
> -            const struct boot_module *bm = &bi->mods[idx];
> +            const struct bootmodule *bm = &bi->mods[idx];
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
> index a038e58c11..96410344a8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -647,10 +647,10 @@ static int __init pvh_load_kernel(
>      const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
>  {
>      struct domain *d = bd->d;
> -    struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct bootmodule *image = bd->kernel;
> +    struct bootmodule *initrd = bd->module;
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
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
> index d7c6042e25..242e9c9c2b 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -13,8 +13,8 @@
>  struct boot_domain {
>      domid_t domid;
>  
> -    struct boot_module *kernel;
> -    struct boot_module *module;
> +    struct bootmodule *kernel;
> +    struct bootmodule *module;
>      const char *cmdline;
>  
>      struct domain *d;
> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/asm/bootfdt.h
> new file mode 100644
> index 0000000000..c00de8c09b
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARCH_X86_BOOTFDT_H__
> +#define __ARCH_X86_BOOTFDT_H__

With the new convention this is just X86_BOOTFDT_H


> +#include <xen/types.h>
> +
> +struct arch_bootmodule
> +{
> +    /*
> +     * Module State Flags:
> +     *   relocated:   indicates module has been relocated in memory.
> +     *   released:    indicates module's pages have been freed.
> +     *   fdt_cmdline: indicates module's cmdline is in the FDT.
> +     */
> +    bool relocated:1;
> +    bool released:1;
> +    bool fdt_cmdline:1;

This is not actually used or needed in this patch?


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
> +#endif /* __ARCH_X86_BOOTFDT_H__ */
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
> index 3afc214c17..f3210b7d6a 100644
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
> @@ -81,7 +33,7 @@ struct boot_info {
>      size_t memmap_length;
>  
>      unsigned int nr_modules;
> -    struct boot_module mods[MAX_NR_BOOTMODS + 1];
> +    struct bootmodule mods[MAX_NR_BOOTMODS + 1];
>      struct boot_domain domains[MAX_NR_BOOTDOMS];
>  };
>  
> @@ -94,16 +46,16 @@ struct boot_info {
>   *      Failure - a value greater than MAX_NR_BOOTMODS
>   */
>  static inline unsigned int __init next_boot_module_index(
> -    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
> +    const struct boot_info *bi, bootmodule_kind k, unsigned int start)
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
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index ac34c69855..c7deaba109 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -36,11 +36,11 @@ extern struct boot_info xen_boot_info;
>  unsigned long initial_images_nrpages(nodeid_t node);
>  void free_boot_modules(void);
>  
> -struct boot_module;
> -void *bootstrap_map_bm(const struct boot_module *bm);
> +struct bootmodule;
> +void *bootstrap_map_bm(const struct bootmodule *bm);
>  void bootstrap_unmap(void);
>  
> -void release_boot_module(struct boot_module *bm);
> +void release_boot_module(struct bootmodule *bm);
>  
>  struct rangeset;
>  int remove_xen_ranges(struct rangeset *r);
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index e1b78d47c2..e6c77413f5 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -374,8 +374,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
>      struct domain *d = bd->d;
>      struct vcpu *v = d->vcpu[0];
>  
> -    struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->module;
> +    struct bootmodule *image = bd->kernel;
> +    struct bootmodule *initrd = bd->module;
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
> index 5da9df33c9..a6b3dbfc8c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -298,7 +298,7 @@ struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
>      .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
> -    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
> +    .mods = { [0 ... MAX_NR_BOOTMODS] = { .kind = BOOTMOD_UNKNOWN } },
>  };
>  
>  static struct boot_info *__init multiboot_fill_boot_info(
> @@ -333,7 +333,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>       */
>      for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>      {
> -        bi->mods[i].cmdline_pa = mods[i].string;
> +        bi->mods[i].arch.cmdline_pa = mods[i].string;
>  
>          if ( efi_enabled(EFI_LOADER) )
>          {
> @@ -356,7 +356,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>      }
>  
>      /* Variable 'i' should be one entry past the last module. */
> -    bi->mods[i].type = BOOTMOD_XEN;
> +    bi->mods[i].kind = BOOTMOD_XEN;
>  
>      return bi;
>  }
> @@ -381,13 +381,13 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>      return nr;
>  }
>  
> -void __init release_boot_module(struct boot_module *bm)
> +void __init release_boot_module(struct bootmodule *bm)
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
> @@ -397,7 +397,7 @@ void __init free_boot_modules(void)
>  
>      for ( i = 0; i < bi->nr_modules; ++i )
>      {
> -        if ( bi->mods[i].released )
> +        if ( bi->mods[i].arch.released )
>              continue;
>  
>          release_boot_module(&bi->mods[i]);
> @@ -519,7 +519,7 @@ static void *__init bootstrap_map_addr(paddr_t start, paddr_t end)
>      return ret;
>  }
>  
> -void *__init bootstrap_map_bm(const struct boot_module *bm)
> +void *__init bootstrap_map_bm(const struct bootmodule *bm)
>  {
>      return bootstrap_map_addr(bm->start, bm->start + bm->size);
>  }
> @@ -689,7 +689,7 @@ static void __init noinline move_xen(void)
>  #undef BOOTSTRAP_MAP_LIMIT
>  
>  static uint64_t __init consider_modules(
> -    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
> +    uint64_t s, uint64_t e, uint32_t size, const struct bootmodule mods[],
>      unsigned int nr_mods, unsigned int this_mod)
>  {
>      unsigned int i;
> @@ -985,8 +985,9 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
>                                           const struct boot_domain *bd)
>  {
>      size_t s = bi->kextra ? strlen(bi->kextra) : 0;
> +    const struct arch_bootmodule *abm = &bd->kernel->arch;
>  
> -    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +    s += abm->cmdline_pa ? strlen(__va(abm->cmdline_pa)) : 0;
>  
>      if ( s == 0 )
>          return s;
> @@ -1050,9 +1051,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
> @@ -1074,7 +1076,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>              strlcat(cmdline, " acpi=", cmdline_size);
>              strlcat(cmdline, acpi_param, cmdline_size);
>          }
> -        bd->kernel->cmdline_pa = 0;
> +        bd->kernel->arch.cmdline_pa = 0;
>          bd->cmdline = cmdline;
>      }
>  
> @@ -1287,7 +1289,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      }
>  
>      /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> +    bi->mods[0].kind = BOOTMOD_KERNEL;
>      bi->domains[0].kernel = &bi->mods[0];
>  
>      if ( pvh_boot )
> @@ -1458,7 +1460,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  
>      if ( xen_phys_start )
>      {
> -        struct boot_module *xen = &bi->mods[bi->nr_modules];
> +        struct bootmodule *xen = &bi->mods[bi->nr_modules];
>  
>          relocated = true;
>  
> @@ -1471,7 +1473,7 @@ void asmlinkage __init noreturn __start_xen(void)
>          xen->size  = __2M_rwdata_end - _stext;
>      }
>  
> -    bi->mods[0].headroom =
> +    bi->mods[0].arch.headroom =
>          bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>      bootstrap_unmap();
>  
> @@ -1552,10 +1554,10 @@ void asmlinkage __init noreturn __start_xen(void)
>          /* Is the region suitable for relocating the multiboot modules? */
>          for ( j = bi->nr_modules - 1; j >= 0; j-- )
>          {
> -            struct boot_module *bm = &bi->mods[j];
> -            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
> +            struct bootmodule *bm = &bi->mods[j];
> +            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
>  
> -            if ( bm->relocated )
> +            if ( bm->arch.relocated )
>                  continue;
>  
>              /* Don't overlap with other modules (or Xen itself). */
> @@ -1565,12 +1567,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
> @@ -1596,7 +1598,7 @@ void asmlinkage __init noreturn __start_xen(void)
>  #endif
>      }
>  
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
>          panic("Not enough memory to relocate the dom0 kernel image\n");
>      for ( i = 0; i < bi->nr_modules; ++i )
>      {
> @@ -2154,7 +2156,7 @@ void asmlinkage __init noreturn __start_xen(void)
>      initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>      if ( initrdidx < MAX_NR_BOOTMODS )
>      {
> -        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> +        bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
>          bi->domains[0].module = &bi->mods[initrdidx];
>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>              printk(XENLOG_WARNING
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index d503d1bd4b..fa65e8fcf4 100644
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
> @@ -106,8 +110,13 @@ struct shared_meminfo {
>  struct bootmodule {
>      bootmodule_kind kind;
>      bool domU;
> +
>      paddr_t start;
>      paddr_t size;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_bootmodule arch;
> +#endif
>  };
>  
>  /* DT_MAX_NAME is the node name max length according the DT spec */
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 7f70d860bd..0c2cdea8ed 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -40,7 +40,7 @@ int __init xsm_multiboot_policy_init(
>  
>      for_each_boot_module_by_type ( i, bi, BOOTMOD_UNKNOWN )
>      {
> -        struct boot_module *bm = &bi->mods[i];
> +        struct bootmodule *bm = &bi->mods[i];
>  
>          _policy_start = bootstrap_map_bm(bm);
>          _policy_len   = bm->size;
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


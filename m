Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8DB0CD47
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 00:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051755.1420170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udyyb-0000Ll-FB; Mon, 21 Jul 2025 22:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051755.1420170; Mon, 21 Jul 2025 22:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udyyb-0000K2-CT; Mon, 21 Jul 2025 22:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1051755;
 Mon, 21 Jul 2025 22:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7vdF=2C=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1udyyZ-0000Jw-ME
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 22:27:15 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82ba14a-6681-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 00:27:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1753136822246935.1508929017535;
 Mon, 21 Jul 2025 15:27:02 -0700 (PDT)
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
X-Inumbo-ID: d82ba14a-6681-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1753136824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kEdFm94lX4I81wc9ezJ6XCGW5ogwVnZpd5651tVtvNHCgioc6v70F5eE0iNeMgv3O1J6xCsRhrolkGKpyBIpxF5Woh0zdAs6yLIGyd1fbk42IDAAUhLh7pBtQjiddWzqnqEnyQADEPkfkdR+98qC9TyLhWJC4zgXQ5urQOZnxs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753136824; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Pw7ronM7u/8xtzorWB7XKpK+Z027WT3xhkhE38oihk=; 
	b=Fuu/CxjEYGerixGdsVXChxelQAJuO69Ov7U2oCQ6gSZYJvdOTWVUMGC0CbfsZnXObp1+bF3Gp/41Nd5iJTj1RUUNZ+CPBMV6VFqkw7dEA5VkYfCbRNc60krPJzpm727rU6gCggrl70jI3jStfQ83TtI/IhaKqFOOEiwznHA78CQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753136824;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4Pw7ronM7u/8xtzorWB7XKpK+Z027WT3xhkhE38oihk=;
	b=aNJrCOP7uZf/iu5xPot1oAqd6YT1Nrip3q3KTZryrd4nBeDFOHNm5MwicuIfGpFn
	VlxnNzh4KmF00W3rstRNC2E4EpaP5A+/CLw3/+iOGM0liiVcWsarpj8S4hNO1G+ucAu
	1ZPzs+CLSELFLXiIpOOC+15vTkIRlTJ1Loe47nYs=
Message-ID: <84d9ca22-a303-4490-ad39-aca66685dbb2@apertussolutions.com>
Date: Mon, 21 Jul 2025 18:27:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] x86: Replace arch-specific boot_module with
 common one
Content-Language: en-US
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-2-alejandro.garciavallejo@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250715161108.141126-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/15/25 12:10, Alejandro Vallejo wrote:
> These types resemble each other very closely in layout and intent,
> and with "struct boot_module" already in common code it makes perfect
> sense to merge them. In order to do so, rename identical fields with
> conflicting names.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/arch/x86/cpu/microcode/core.c   |  7 ++--
>   xen/arch/x86/hvm/dom0_build.c       |  6 ++--
>   xen/arch/x86/include/asm/bootfdt.h  | 50 ++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/bootinfo.h | 56 +++--------------------------
>   xen/arch/x86/pv/dom0_build.c        |  4 +--
>   xen/arch/x86/setup.c                | 43 +++++++++++-----------
>   xen/include/xen/bootfdt.h           |  8 +++++
>   xen/xsm/xsm_policy.c                |  2 +-
>   8 files changed, 93 insertions(+), 83 deletions(-)
>   create mode 100644 xen/arch/x86/include/asm/bootfdt.h
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 34a94cd25b..816e9bfe40 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -764,8 +764,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>               struct cpio_data cd;
>   
>               /* Search anything unclaimed or likely to be a CPIO archive. */
> -            if ( bm->type != BOOTMOD_UNKNOWN &&
> -                 bm->type != BOOTMOD_RAMDISK )
> +            if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
>                   continue;
>   
>               size = bm->size;
> @@ -815,12 +814,12 @@ static int __init early_microcode_load(struct boot_info *bi)
>               return -ENODEV;
>           }
>   
> -        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
> +        if ( bi->mods[idx].kind != BOOTMOD_UNKNOWN )
>           {
>               printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
>               return -ENODEV;
>           }
> -        bi->mods[idx].type = BOOTMOD_MICROCODE;
> +        bi->mods[idx].kind = BOOTMOD_MICROCODE;
>   
>           size = bi->mods[idx].size;
>           data = bootstrap_map_bm(&bi->mods[idx]);
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index a038e58c11..2bb8ef355c 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -650,7 +650,7 @@ static int __init pvh_load_kernel(
>       struct boot_module *image = bd->kernel;
>       struct boot_module *initrd = bd->module;
>       void *image_base = bootstrap_map_bm(image);
> -    void *image_start = image_base + image->headroom;
> +    void *image_start = image_base + image->arch.headroom;
>       unsigned long image_len = image->size;
>       unsigned long initrd_len = initrd ? initrd->size : 0;
>       size_t cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
> @@ -721,9 +721,9 @@ static int __init pvh_load_kernel(
>       {
>           size_t initrd_space = elf_round_up(&elf, initrd_len);
>   
> -        if ( initrd->cmdline_pa )
> +        if ( initrd->arch.cmdline_pa )
>           {
> -            initrd_cmdline = __va(initrd->cmdline_pa);
> +            initrd_cmdline = __va(initrd->arch.cmdline_pa);
>               if ( !*initrd_cmdline )
>                   initrd_cmdline = NULL;
>           }
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
>   #ifndef X86_BOOTINFO_H
>   #define X86_BOOTINFO_H
>   
> +#include <xen/bootfdt.h>
>   #include <xen/init.h>
>   #include <xen/multiboot.h>
>   #include <xen/types.h>
> @@ -19,55 +20,6 @@
>   /* Max number of boot domains that Xen can construct */
>   #define MAX_NR_BOOTDOMS 1
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
>   /*
>    * Xen internal representation of information provided by the
>    * bootloader/environment, or derived from the information.
> @@ -94,16 +46,16 @@ struct boot_info {
>    *      Failure - a value greater than MAX_NR_BOOTMODS
>    */
>   static inline unsigned int __init next_boot_module_index(
> -    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
> +    const struct boot_info *bi, boot_module_kind k, unsigned int start)
>   {
>       unsigned int i;
>   
> -    if ( t == BOOTMOD_XEN )
> +    if ( k == BOOTMOD_XEN )
>           return bi->nr_modules;
>   
>       for ( i = start; i < bi->nr_modules; i++ )
>       {
> -        if ( bi->mods[i].type == t )
> +        if ( bi->mods[i].kind == k )
>               return i;
>       }
>   
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index e1b78d47c2..a4b5362357 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -422,7 +422,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>   
>       image_base = bootstrap_map_bm(image);
>       image_len = image->size;
> -    image_start = image_base + image->headroom;
> +    image_start = image_base + image->arch.headroom;
>   
>       d->max_pages = ~0U;
>   
> @@ -659,7 +659,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
>                * pages. Tell the boot_module handling that we've freed it, so the
>                * memory is left alone.
>                */
> -            initrd->released = true;
> +            initrd->arch.released = true;
>           }
>   
>           iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 24e4f5ac7f..7e70b46332 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -303,7 +303,7 @@ struct boot_info __initdata xen_boot_info = {
>        *
>        * The extra entry exists to be able to add the Xen image as a module.
>        */
> -    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
> +    .mods = { [0 ... MAX_NR_BOOTMODS] = { .kind = BOOTMOD_UNKNOWN } },
>   };
>   
>   static struct boot_info *__init multiboot_fill_boot_info(
> @@ -338,7 +338,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>        */
>       for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>       {
> -        bi->mods[i].cmdline_pa = mods[i].string;
> +        bi->mods[i].arch.cmdline_pa = mods[i].string;
>   
>           if ( efi_enabled(EFI_LOADER) )
>           {
> @@ -361,7 +361,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
>       }
>   
>       /* Variable 'i' should be one entry past the last module. */
> -    bi->mods[i].type = BOOTMOD_XEN;
> +    bi->mods[i].kind = BOOTMOD_XEN;
>   
>       return bi;
>   }
> @@ -388,11 +388,11 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
>   
>   void __init release_boot_module(struct boot_module *bm)
>   {
> -    ASSERT(!bm->released);
> +    ASSERT(!bm->arch.released);
>   
>       init_domheap_pages(bm->start, bm->start + PAGE_ALIGN(bm->size));
>   
> -    bm->released = true;
> +    bm->arch.released = true;
>   }
>   
>   void __init free_boot_modules(void)
> @@ -402,7 +402,7 @@ void __init free_boot_modules(void)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        if ( bi->mods[i].released )
> +        if ( bi->mods[i].arch.released )
>               continue;
>   
>           release_boot_module(&bi->mods[i]);
> @@ -997,8 +997,8 @@ static size_t __init domain_cmdline_size(const struct boot_info *bi,
>   {
>       size_t s = 0;
>   
> -    if ( bd->kernel->cmdline_pa )
> -        s += strlen(__va(bd->kernel->cmdline_pa));
> +    if ( bd->kernel->arch.cmdline_pa )
> +        s += strlen(__va(bd->kernel->arch.cmdline_pa));
>   
>       if ( bi->kextra )
>           s += strlen(bi->kextra);
> @@ -1065,9 +1065,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>               panic("Error allocating cmdline buffer for %pd\n", d);
>   
> -        if ( bd->kernel->cmdline_pa )
> +        if ( bd->kernel->arch.cmdline_pa )
>               strlcpy(cmdline,
> -                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
> +                    cmdline_cook(__va(bd->kernel->arch.cmdline_pa),
> +                                 bi->loader),
>                       cmdline_size);
>   
>           if ( bi->kextra )
> @@ -1089,7 +1090,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>               strlcat(cmdline, " acpi=", cmdline_size);
>               strlcat(cmdline, acpi_param, cmdline_size);
>           }
> -        bd->kernel->cmdline_pa = 0;
> +        bd->kernel->arch.cmdline_pa = 0;
>           bd->cmdline = cmdline;
>       }
>   
> @@ -1302,7 +1303,7 @@ void asmlinkage __init noreturn __start_xen(void)
>       }
>   
>       /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> +    bi->mods[0].kind = BOOTMOD_KERNEL;
>       bi->domains[0].kernel = &bi->mods[0];
>   
>       if ( pvh_boot )
> @@ -1486,7 +1487,7 @@ void asmlinkage __init noreturn __start_xen(void)
>           xen->size  = __2M_rwdata_end - _stext;
>       }
>   
> -    bi->mods[0].headroom =
> +    bi->mods[0].arch.headroom =
>           bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
>       bootstrap_unmap();
>   
> @@ -1568,9 +1569,9 @@ void asmlinkage __init noreturn __start_xen(void)
>           for ( j = bi->nr_modules - 1; j >= 0; j-- )
>           {
>               struct boot_module *bm = &bi->mods[j];
> -            unsigned long size = PAGE_ALIGN(bm->headroom + bm->size);
> +            unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
>   
> -            if ( bm->relocated )
> +            if ( bm->arch.relocated )
>                   continue;
>   
>               /* Don't overlap with other modules (or Xen itself). */
> @@ -1580,12 +1581,12 @@ void asmlinkage __init noreturn __start_xen(void)
>               if ( highmem_start && end > highmem_start )
>                   continue;
>   
> -            if ( s < end && (bm->headroom || (end - size) > bm->start) )
> +            if ( s < end && (bm->arch.headroom || (end - size) > bm->start) )
>               {
> -                move_memory(end - size + bm->headroom, bm->start, bm->size);
> +                move_memory(end - size + bm->arch.headroom, bm->start, bm->size);
>                   bm->start = (end - size);
> -                bm->size += bm->headroom;
> -                bm->relocated = true;
> +                bm->size += bm->arch.headroom;
> +                bm->arch.relocated = true;
>               }
>           }
>   
> @@ -1611,7 +1612,7 @@ void asmlinkage __init noreturn __start_xen(void)
>   #endif
>       }
>   
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
>           panic("Not enough memory to relocate the dom0 kernel image\n");
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> @@ -2169,7 +2170,7 @@ void asmlinkage __init noreturn __start_xen(void)
>       initrdidx = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>       if ( initrdidx < MAX_NR_BOOTMODS )
>       {
> -        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
> +        bi->mods[initrdidx].kind = BOOTMOD_RAMDISK;
>           bi->domains[0].module = &bi->mods[initrdidx];
>           if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOTMODS )
>               printk(XENLOG_WARNING
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 7f49d0ccdd..1b19069833 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -7,6 +7,10 @@
>   #include <xen/macros.h>
>   #include <xen/xmalloc.h>
>   
> +#if __has_include(<asm/bootfdt.h>)
> +#include <asm/bootfdt.h>
> +#endif
> +
>   #define MIN_FDT_ALIGN 8
>   
>   #define NR_MEM_BANKS 256
> @@ -110,6 +114,10 @@ struct boot_module {
>   #endif
>       paddr_t start;
>       paddr_t size;
> +
> +#if __has_include(<asm/bootfdt.h>)
> +    struct arch_boot_module arch;
> +#endif
>   };
>   
>   /* DT_MAX_NAME is the node name max length according the DT spec */
> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 1f88b4fc5a..1b4030edb4 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
>               printk("Policy len %#lx, start at %p.\n",
>                      _policy_len,_policy_start);
>   
> -            bm->type = BOOTMOD_XSM_POLICY;
> +            bm->kind = BOOTMOD_XSM;

I would ask the change be made the other direction, for the three usages 
in the device-tree code. This isn't just a personal like, naming matters 
and XSM does not support external modules, which this insinuates. It 
only supports loadable policy and shorting this name creates ambiguity 
in something already confusing to many.

v/r,
dps



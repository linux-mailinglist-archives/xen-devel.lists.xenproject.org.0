Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AF74BEE8
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 21:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560732.876857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIDOn-0000P1-Kj; Sat, 08 Jul 2023 19:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560732.876857; Sat, 08 Jul 2023 19:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIDOn-0000Ld-Hf; Sat, 08 Jul 2023 19:15:17 +0000
Received: by outflank-mailman (input) for mailman id 560732;
 Sat, 08 Jul 2023 19:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIDOl-0000LH-I6
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 19:15:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28bbd24-1dc3-11ee-b237-6b7b168915f2;
 Sat, 08 Jul 2023 21:15:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E72A860A66;
 Sat,  8 Jul 2023 19:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C57C433C8;
 Sat,  8 Jul 2023 19:15:08 +0000 (UTC)
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
X-Inumbo-ID: c28bbd24-1dc3-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688843710;
	bh=lgbMCP0AFezAYeuRLr2ojoWv50nBejHsVAiwT4u9Ef8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eSYDgbINI2T9B9wV4XVMYww7Kb2WF8CDPihq+BysF7y229sDgLLHPWzo72+M9UrAN
	 LQzFfI2LTbGuwGWfCPqCgQhTKrHCp6hY67TNRXwtor1G7QGdydupbc9KzFj7R3Kery
	 9mtx2jwC4LqFVxFVEviyyYq6/ouVvUqlniugAQ3NIG41eCRaz69UfzViaaN/UEYp8F
	 Vy07O8O30isKLLIHaO7jc7XHRnmxgEqjEEEl34rELW3BzebsWWaBDtHsbnqYkkqKPK
	 m6LQDK0SCZfuHlZ+cVkiizYYvti4M0ACadVx/OPgETrj6VeJM3Gm8Bsez+lhiNCDrA
	 7Bzirb1rvBlWg==
Date: Sat, 8 Jul 2023 12:15:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 04/10] x86 setup: porting dom0 construction logic to boot
 module structures
In-Reply-To: <20230701071835.41599-5-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081149090.761183@ubuntu-linux-20-04-desktop>
References: <20230701071835.41599-1-christopher.w.clark@gmail.com> <20230701071835.41599-5-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jul 2023, Christopher Clark wrote:
> Adjust the PV and PVH dom0 construction entry points to take boot module
> structures as parameters, and add further fields to the boot module
> structures to plumb the data needed to support this use. Populate these
> from the multiboot module data.
> 
> This change removes multiboot from the PV and PVH dom0 construction logic.
> 
> Introduce and use new inline accessor functions for navigating the boot
> module structures.
> 
> The per-boot-module arrays are expanded from singletons to accommodate
> all modules, up to a static maximum of 64 modules including Xen that can
> be accepted from a bootloader to match the previous value from the
> module map check.
> 
> The field that identifies the type of a boot module (kernel, ramdisk,
> etc) is introduced to the common boot module structure and declared as a
> non-enum integer type to allow the field to be of a known-size and so
> structure can be packed in a subsequent patch in the series, and it will
> then be reconciled with the equivalent Arm boot field type.
> 
> The command line provided by multiboot for each boot module is added
> directly to the boot_module structure, which is appropriate for this
> logic just replacing multiboot.
> 
> The maximum number of boot modules that a bootloader can provide in
> addition to the Xen hypervisor is preserved from prior logic with the
> module_map at 63.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> ---
> Changes since v1: patch is a subset of v1 series patches 2 and 3.
> - The module_map is kept for now since still in use.
> - Move the static inline functions into a separate dedicated header.
> - <mm-frame.h> and <compiler.h> replace prior inclusion of <mm.h>
>   for simpler dependencies.
> 
>  xen/arch/x86/dom0_build.c             |  10 +-
>  xen/arch/x86/hvm/dom0_build.c         |  43 +++---
>  xen/arch/x86/include/asm/boot.h       |  36 +++++
>  xen/arch/x86/include/asm/bootinfo.h   |  24 +++
>  xen/arch/x86/include/asm/dom0_build.h |  13 +-
>  xen/arch/x86/include/asm/setup.h      |   4 +-
>  xen/arch/x86/pv/dom0_build.c          |  32 ++--
>  xen/arch/x86/setup.c                  | 206 +++++++++++++++-----------
>  xen/include/xen/bootinfo.h            |  27 ++++
>  9 files changed, 254 insertions(+), 141 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 9f5300a3ef..42310202a2 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2002-2005, K A Fraser
>   */
>  
> +#include <xen/bootinfo.h>
>  #include <xen/init.h>
>  #include <xen/iocap.h>
>  #include <xen/libelf.h>
> @@ -562,9 +563,8 @@ int __init dom0_setup_permissions(struct domain *d)
>      return rc;
>  }
>  
> -int __init construct_dom0(struct domain *d, const module_t *image,
> -                          unsigned long image_headroom, module_t *initrd,
> -                          char *cmdline)
> +int __init construct_dom0(struct domain *d, const struct boot_module *image,
> +    struct boot_module *initrd, char *cmdline)
>  {
>      int rc;
>  
> @@ -576,9 +576,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
>      process_pending_softirqs();
>  
>      if ( is_hvm_domain(d) )
> -        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
> +        rc = dom0_construct_pvh(d, image, initrd, cmdline);
>      else if ( is_pv_domain(d) )
> -        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> +        rc = dom0_construct_pv(d, image, initrd, cmdline);
>      else
>          panic("Cannot construct Dom0. No guest interface available\n");
>  
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 56fe89632b..c094863bb8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -8,9 +8,9 @@
>   */
>  
>  #include <xen/acpi.h>
> +#include <xen/bootinfo.h>
>  #include <xen/init.h>
>  #include <xen/libelf.h>
> -#include <xen/multiboot.h>
>  #include <xen/pci.h>
>  #include <xen/softirq.h>
>  
> @@ -530,14 +530,13 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> -static int __init pvh_load_kernel(struct domain *d, const module_t *image,
> -                                  unsigned long image_headroom,
> -                                  module_t *initrd, void *image_base,
> -                                  char *cmdline, paddr_t *entry,
> -                                  paddr_t *start_info_addr)
> +static int __init pvh_load_kernel(
> +    struct domain *d, const struct boot_module *image,
> +    struct boot_module *initrd, void *image_base, char *cmdline, paddr_t *entry,
> +    paddr_t *start_info_addr)
>  {
> -    void *image_start = image_base + image_headroom;
> -    unsigned long image_len = image->mod_end;
> +    void *image_start = image_base + image->arch->headroom;
> +    unsigned long image_len = image->size;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
>      paddr_t last_addr;
> @@ -546,7 +545,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>      struct vcpu *v = d->vcpu[0];
>      int rc;
>  
> -    if ( (rc = bzimage_parse(image_base, &image_start, image_headroom,
> +    if ( (rc = bzimage_parse(image_base, &image_start, image->arch->headroom,
>                               &image_len)) != 0 )
>      {
>          printk("Error trying to detect bz compressed kernel\n");
> @@ -594,7 +593,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>       * simplify it.
>       */
>      last_addr = find_memory(d, &elf, sizeof(start_info) +
> -                            (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
> +                            (initrd ? ROUNDUP(initrd->size, PAGE_SIZE) +
>                                        sizeof(mod)
>                                      : 0) +
>                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> @@ -608,8 +607,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>  
>      if ( initrd != NULL )
>      {
> -        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
> -                                    initrd->mod_end, v);
> +        rc = hvm_copy_to_guest_phys(last_addr, maddr_to_virt(initrd->start),
> +                                    initrd->size, v);
>          if ( rc )
>          {
>              printk("Unable to copy initrd to guest\n");
> @@ -617,11 +616,11 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>          }
>  
>          mod.paddr = last_addr;
> -        mod.size = initrd->mod_end;
> -        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
> -        if ( initrd->string )
> +        mod.size = initrd->size;
> +        last_addr += ROUNDUP(initrd->size, elf_64bit(&elf) ? 8 : 4);
> +        if ( initrd->string.len )
>          {
> -            char *str = __va(initrd->string);
> +            char *str = initrd->string.bytes;
>              size_t len = strlen(str) + 1;
>  
>              rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
> @@ -1176,10 +1175,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>      }
>  }
>  
> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> -                              unsigned long image_headroom,
> -                              module_t *initrd,
> -                              char *cmdline)
> +int __init dom0_construct_pvh(
> +    struct domain *d, const struct boot_module *image,
> +    struct boot_module *initrd, char *cmdline)
>  {
>      paddr_t entry, start_info;
>      int rc;
> @@ -1209,9 +1207,8 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
>          return rc;
>      }
>  
> -    rc = pvh_load_kernel(d, image, image_headroom, initrd,
> -                         bootstrap_map_multiboot(image),
> -                         cmdline, &entry, &start_info);
> +    rc = pvh_load_kernel(d, image, initrd, bootstrap_map(image), cmdline,
> +                         &entry, &start_info);
>      if ( rc )
>      {
>          printk("Failed to load Dom0 kernel\n");
> diff --git a/xen/arch/x86/include/asm/boot.h b/xen/arch/x86/include/asm/boot.h
> index 10b17f12b2..bcf4f2e2e3 100644
> --- a/xen/arch/x86/include/asm/boot.h
> +++ b/xen/arch/x86/include/asm/boot.h
> @@ -19,6 +19,42 @@ static inline void *bootstrap_map_multiboot(const module_t *mod)
>      return bootstrap_map(&bm);
>  }
>  
> +static inline unsigned long bootmodule_index(
> +    const struct boot_info *info, bootmod_type_t bootmod_type,
> +    unsigned long start)
> +{
> +    for ( ; start < info->nr_mods; start++ )
> +        if ( info->mods[start].bootmod_type == bootmod_type )
> +            return start;
> +
> +    return info->nr_mods + 1;
> +}
> +
> +static inline struct boot_module *bootmodule_next(
> +    const struct boot_info *info, bootmod_type_t bootmod_type)
> +{
> +    unsigned long i;
> +
> +    for ( i = 0; i < info->nr_mods; i++ )
> +        if ( info->mods[i].bootmod_type == bootmod_type )
> +            return &info->mods[i];
> +
> +    return NULL;
> +}
> +
> +static inline void bootmodule_update_start(struct boot_module *bm,
> +    paddr_t new_start)
> +{
> +    bm->start = new_start;
> +    bm->mfn = maddr_to_mfn(new_start);
> +}
> +
> +static inline void bootmodule_update_mfn(struct boot_module *bm, mfn_t new_mfn)
> +{
> +    bm->mfn = new_mfn;
> +    bm->start = mfn_to_maddr(new_mfn);
> +}
> +
>  #endif
>  
>  /*
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index a25054f372..30c27980e0 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -2,9 +2,33 @@
>  #define __ARCH_X86_BOOTINFO_H__
>  
>  struct arch_bootmodule {
> +#define BOOTMOD_FLAG_X86_RELOCATED     1U << 0
> +    uint32_t flags;
>      unsigned headroom;
>  };
>  
> +struct arch_boot_info {
> +    uint32_t flags;
> +#define BOOTINFO_FLAG_X86_CMDLINE      1U << 2

Is this to indicate the presence of the Xen cmdline?


> +#define BOOTINFO_FLAG_X86_MODULES      1U << 3
> +#define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
> +#define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
> +
> +    char *boot_loader_name;
> +
> +    uint32_t mmap_length;
> +    paddr_t mmap_addr;
> +};
> +
> +struct __packed mb_memmap {
> +    uint32_t size;
> +    uint32_t base_addr_low;
> +    uint32_t base_addr_high;
> +    uint32_t length_low;
> +    uint32_t length_high;
> +    uint32_t type;
> +};
> +
>  #endif
>  
>  /*
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 3b623a4149..f9b04daebd 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -37,6 +37,7 @@
>  #include <asm/processor.h>
>  #include <asm/mpspec.h>
>  #include <asm/apic.h>
> +#include <asm/boot.h>
>  #include <asm/msi.h>
>  #include <asm/desc.h>
>  #include <asm/paging.h>
> @@ -59,6 +60,9 @@
>  #include <asm/prot-key.h>
>  #include <asm/pv/domain.h>
>  
> +/* Max number of boot modules a bootloader can provide in addition to Xen */
> +#define MAX_NR_BOOTMODS 63

Call it MAX_MODULES ?
Like I wrote in the past, you already did the hard work of aligning the
interfaces, we might as well also use the same names.

[...]

> @@ -1357,12 +1382,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>           * respective reserve_e820_ram() invocation below. No need to
>           * query efi_boot_mem_unused() here, though.
>           */
> -        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
> -        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
> +        bootmodule_update_start(&boot_info->mods[boot_info->nr_mods],
> +                                virt_to_maddr(_stext));
> +        boot_info->mods[boot_info->nr_mods].size = __2M_rwdata_end - _stext;
>      }

The original code had the end address as "__2M_rwdata_end - _stext"
while now we have the size as "__2M_rwdata_end - _stext" which is not
the same?



>      boot_info->mods[0].arch->headroom =
> -        bzimage_headroom(bootstrap_map_multiboot(mod), mod->mod_end);
> +        bzimage_headroom(bootstrap_map(&boot_info->mods[0]),
> +                         boot_info->mods[0].size);
>  
>      bootstrap_map(NULL);
>  

[...]


> diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> index eb93cc3439..2f4284a91f 100644
> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -2,23 +2,50 @@
>  #define __XEN_BOOTINFO_H__
>  
>  #include <xen/types.h>
> +#include <xen/compiler.h>
> +#include <xen/mm-frame.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/bootinfo.h>
>  #else
>      struct arch_bootmodule { };
> +    struct arch_boot_info { };
>  #endif
>  
> +/* Boot module binary type / purpose */
> +#define BOOTMOD_UNKNOWN     0
> +#define BOOTMOD_XEN         1
> +#define BOOTMOD_FDT         2
> +#define BOOTMOD_KERNEL      3
> +#define BOOTMOD_RAMDISK     4
> +#define BOOTMOD_XSM         5
> +#define BOOTMOD_UCODE       6
> +#define BOOTMOD_GUEST_DTB   7
> +typedef unsigned int bootmod_type_t;
> +
> +#define BOOTMOD_STRING_MAX_LEN 1024

BOOTMOD_MAX_CMDLINE ?


> +struct boot_string {

struct bootcmdline ?


> +    char bytes[BOOTMOD_STRING_MAX_LEN];

cmdline?

If the string is \0 terminated we don't need len?


> +    size_t len;
> +};
> +
>  struct boot_module {
> +    bootmod_type_t bootmod_type;

Why not use a good old enum?


>      paddr_t start;
> +    mfn_t mfn;

I think mfn should be in arch_bootmodule


>      size_t size;
>  
>      struct arch_bootmodule *arch;
> +    struct boot_string string;
>  };
>  
>  struct boot_info {
> +    char *cmdline;

Is this for Xen cmdline? While all the other cmdline are in the various
struct boot_string? Is there any benefit in using the BOOTMOD_XEN for it?
BOOTMOD_XEN is not used so far, so if you don't end up using it,
probably not, otherwise it could be considered.




>      unsigned int nr_mods;
>      struct boot_module *mods;
> +
> +    struct arch_boot_info *arch;
>  };
>  
>  #endif
> -- 
> 2.25.1
> 
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71675BAAA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566774.886079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcEX-0005Cn-6d; Thu, 20 Jul 2023 22:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566774.886079; Thu, 20 Jul 2023 22:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcEX-0005B2-0d; Thu, 20 Jul 2023 22:34:53 +0000
Received: by outflank-mailman (input) for mailman id 566774;
 Thu, 20 Jul 2023 22:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC1w=DG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qMcEU-00057s-Rg
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:34:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a14d28bd-274d-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 00:34:46 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so2092365e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 15:34:47 -0700 (PDT)
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
X-Inumbo-ID: a14d28bd-274d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689892487; x=1690497287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvJ7EI3mmE/BYwp7MCuVAIIuBB1Lf/bXwOKArDSPpcA=;
        b=pC/SfHx06xZq1BxUdwZ13TGnpYpmV8UE5g17rJtFDOk7j815xAB89QjgixTtupdxG4
         zth8B7bPM5EaIMahxDkhX4DdtpAAFPJaLTibD5mJfDEE2+pHpvMr/znmNpchXsWbhnWA
         xQ2dDQxxd3/Fe1G6O7Eb7Qaqash8bV15WPd1aM2dZZ0YQxB8ie1QDMImddSmS7Xs0Q4u
         /rTH3+p2ag+YT6KGqyWssiySDnA3QJlL5zgWWA8SWUTEFwMtLBhRqfXLljt+WmKFIFpV
         g7Wu/4K+j6SbVsKeK3UvQA7GtrOIUXGxPaiuGGXwALLte3fmYBDJA9eynwimVj6GJ7Tz
         ahfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689892487; x=1690497287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvJ7EI3mmE/BYwp7MCuVAIIuBB1Lf/bXwOKArDSPpcA=;
        b=SWLzbcyxnMoZTAxb67nMTpWREP82oqJz5TGl7MONCsJiVOc00XW7cRA8ox6cI9SE6/
         fH7vyQGJJWHobydFp2AhmjAvQbe1JAZ+gQfaBHa9+tp8RP+F222EFIcJZwLUWLtNf3kJ
         sN9FBwL0zT5MYK/Ne/0bgPRSNGZJXYgUslfMM7Lfe/VEfxZ8s7jiaXtAou0UPybxzAXY
         pMY82H7uVbztYOrpsHPOGw9BdnzIJQZrc8uZTbM9TDcWvXxP1Lpz9EY5rP3LQicuv8XX
         kfzdwL0mxfg+wDpat+WAaIEbaDxl9peioHfJ1BnPQBrNo+d01eOWcIN852NFXTKCmZrt
         GE2g==
X-Gm-Message-State: ABy/qLZGKQSuMFxIyU7DcMHr6ky3+h71JV13ivuIi3IipD4jAI+oHvRr
	a3IxfoqLdD6Xlcvuj74/k+prusmSq/fWJiGZZa0=
X-Google-Smtp-Source: APBJJlF7HZj9KIQEfwtiA+te2wXHuEJOGKrLeRJuTc/+M4fQ318Vd4o1Aq2XVnWI3KCtROPSvPwQvw83OJmuGi4hHRA=
X-Received: by 2002:a05:6512:2352:b0:4fd:cfeb:4785 with SMTP id
 p18-20020a056512235200b004fdcfeb4785mr42868lfu.53.1689892486908; Thu, 20 Jul
 2023 15:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-5-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081149090.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307081149090.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 20 Jul 2023 15:34:35 -0700
Message-ID: <CACMJ4GaYtk=DiR0CCB7e4BZiFoMKzBKGMxVzKfx4UYPDr3wsHQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] x86 setup: porting dom0 construction logic to boot
 module structures
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006413430600f2c11a"

--0000000000006413430600f2c11a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 12:15=E2=80=AFPM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Sat, 1 Jul 2023, Christopher Clark wrote:
> > Adjust the PV and PVH dom0 construction entry points to take boot modul=
e
> > structures as parameters, and add further fields to the boot module
> > structures to plumb the data needed to support this use. Populate these
> > from the multiboot module data.
> >
> > This change removes multiboot from the PV and PVH dom0 construction
> logic.
> >
> > Introduce and use new inline accessor functions for navigating the boot
> > module structures.
> >
> > The per-boot-module arrays are expanded from singletons to accommodate
> > all modules, up to a static maximum of 64 modules including Xen that ca=
n
> > be accepted from a bootloader to match the previous value from the
> > module map check.
> >
> > The field that identifies the type of a boot module (kernel, ramdisk,
> > etc) is introduced to the common boot module structure and declared as =
a
> > non-enum integer type to allow the field to be of a known-size and so
> > structure can be packed in a subsequent patch in the series, and it wil=
l
> > then be reconciled with the equivalent Arm boot field type.
> >
> > The command line provided by multiboot for each boot module is added
> > directly to the boot_module structure, which is appropriate for this
> > logic just replacing multiboot.
> >
> > The maximum number of boot modules that a bootloader can provide in
> > addition to the Xen hypervisor is preserved from prior logic with the
> > module_map at 63.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >
> > ---
> > Changes since v1: patch is a subset of v1 series patches 2 and 3.
> > - The module_map is kept for now since still in use.
> > - Move the static inline functions into a separate dedicated header.
> > - <mm-frame.h> and <compiler.h> replace prior inclusion of <mm.h>
> >   for simpler dependencies.
> >
> >  xen/arch/x86/dom0_build.c             |  10 +-
> >  xen/arch/x86/hvm/dom0_build.c         |  43 +++---
> >  xen/arch/x86/include/asm/boot.h       |  36 +++++
> >  xen/arch/x86/include/asm/bootinfo.h   |  24 +++
> >  xen/arch/x86/include/asm/dom0_build.h |  13 +-
> >  xen/arch/x86/include/asm/setup.h      |   4 +-
> >  xen/arch/x86/pv/dom0_build.c          |  32 ++--
> >  xen/arch/x86/setup.c                  | 206 +++++++++++++++-----------
> >  xen/include/xen/bootinfo.h            |  27 ++++
> >  9 files changed, 254 insertions(+), 141 deletions(-)
> >
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 9f5300a3ef..42310202a2 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2002-2005, K A Fraser
> >   */
> >
> > +#include <xen/bootinfo.h>
> >  #include <xen/init.h>
> >  #include <xen/iocap.h>
> >  #include <xen/libelf.h>
> > @@ -562,9 +563,8 @@ int __init dom0_setup_permissions(struct domain *d)
> >      return rc;
> >  }
> >
> > -int __init construct_dom0(struct domain *d, const module_t *image,
> > -                          unsigned long image_headroom, module_t
> *initrd,
> > -                          char *cmdline)
> > +int __init construct_dom0(struct domain *d, const struct boot_module
> *image,
> > +    struct boot_module *initrd, char *cmdline)
> >  {
> >      int rc;
> >
> > @@ -576,9 +576,9 @@ int __init construct_dom0(struct domain *d, const
> module_t *image,
> >      process_pending_softirqs();
> >
> >      if ( is_hvm_domain(d) )
> > -        rc =3D dom0_construct_pvh(d, image, image_headroom, initrd,
> cmdline);
> > +        rc =3D dom0_construct_pvh(d, image, initrd, cmdline);
> >      else if ( is_pv_domain(d) )
> > -        rc =3D dom0_construct_pv(d, image, image_headroom, initrd,
> cmdline);
> > +        rc =3D dom0_construct_pv(d, image, initrd, cmdline);
> >      else
> >          panic("Cannot construct Dom0. No guest interface available\n")=
;
> >
> > diff --git a/xen/arch/x86/hvm/dom0_build.c
> b/xen/arch/x86/hvm/dom0_build.c
> > index 56fe89632b..c094863bb8 100644
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -8,9 +8,9 @@
> >   */
> >
> >  #include <xen/acpi.h>
> > +#include <xen/bootinfo.h>
> >  #include <xen/init.h>
> >  #include <xen/libelf.h>
> > -#include <xen/multiboot.h>
> >  #include <xen/pci.h>
> >  #include <xen/softirq.h>
> >
> > @@ -530,14 +530,13 @@ static paddr_t __init find_memory(
> >      return INVALID_PADDR;
> >  }
> >
> > -static int __init pvh_load_kernel(struct domain *d, const module_t
> *image,
> > -                                  unsigned long image_headroom,
> > -                                  module_t *initrd, void *image_base,
> > -                                  char *cmdline, paddr_t *entry,
> > -                                  paddr_t *start_info_addr)
> > +static int __init pvh_load_kernel(
> > +    struct domain *d, const struct boot_module *image,
> > +    struct boot_module *initrd, void *image_base, char *cmdline,
> paddr_t *entry,
> > +    paddr_t *start_info_addr)
> >  {
> > -    void *image_start =3D image_base + image_headroom;
> > -    unsigned long image_len =3D image->mod_end;
> > +    void *image_start =3D image_base + image->arch->headroom;
> > +    unsigned long image_len =3D image->size;
> >      struct elf_binary elf;
> >      struct elf_dom_parms parms;
> >      paddr_t last_addr;
> > @@ -546,7 +545,7 @@ static int __init pvh_load_kernel(struct domain *d,
> const module_t *image,
> >      struct vcpu *v =3D d->vcpu[0];
> >      int rc;
> >
> > -    if ( (rc =3D bzimage_parse(image_base, &image_start, image_headroo=
m,
> > +    if ( (rc =3D bzimage_parse(image_base, &image_start,
> image->arch->headroom,
> >                               &image_len)) !=3D 0 )
> >      {
> >          printk("Error trying to detect bz compressed kernel\n");
> > @@ -594,7 +593,7 @@ static int __init pvh_load_kernel(struct domain *d,
> const module_t *image,
> >       * simplify it.
> >       */
> >      last_addr =3D find_memory(d, &elf, sizeof(start_info) +
> > -                            (initrd ? ROUNDUP(initrd->mod_end,
> PAGE_SIZE) +
> > +                            (initrd ? ROUNDUP(initrd->size, PAGE_SIZE)=
 +
> >                                        sizeof(mod)
> >                                      : 0) +
> >                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,
> > @@ -608,8 +607,8 @@ static int __init pvh_load_kernel(struct domain *d,
> const module_t *image,
> >
> >      if ( initrd !=3D NULL )
> >      {
> > -        rc =3D hvm_copy_to_guest_phys(last_addr,
> mfn_to_virt(initrd->mod_start),
> > -                                    initrd->mod_end, v);
> > +        rc =3D hvm_copy_to_guest_phys(last_addr,
> maddr_to_virt(initrd->start),
> > +                                    initrd->size, v);
> >          if ( rc )
> >          {
> >              printk("Unable to copy initrd to guest\n");
> > @@ -617,11 +616,11 @@ static int __init pvh_load_kernel(struct domain
> *d, const module_t *image,
> >          }
> >
> >          mod.paddr =3D last_addr;
> > -        mod.size =3D initrd->mod_end;
> > -        last_addr +=3D ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : =
4);
> > -        if ( initrd->string )
> > +        mod.size =3D initrd->size;
> > +        last_addr +=3D ROUNDUP(initrd->size, elf_64bit(&elf) ? 8 : 4);
> > +        if ( initrd->string.len )
> >          {
> > -            char *str =3D __va(initrd->string);
> > +            char *str =3D initrd->string.bytes;
> >              size_t len =3D strlen(str) + 1;
> >
> >              rc =3D hvm_copy_to_guest_phys(last_addr, str, len, v);
> > @@ -1176,10 +1175,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct
> domain *d)
> >      }
> >  }
> >
> > -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> > -                              unsigned long image_headroom,
> > -                              module_t *initrd,
> > -                              char *cmdline)
> > +int __init dom0_construct_pvh(
> > +    struct domain *d, const struct boot_module *image,
> > +    struct boot_module *initrd, char *cmdline)
> >  {
> >      paddr_t entry, start_info;
> >      int rc;
> > @@ -1209,9 +1207,8 @@ int __init dom0_construct_pvh(struct domain *d,
> const module_t *image,
> >          return rc;
> >      }
> >
> > -    rc =3D pvh_load_kernel(d, image, image_headroom, initrd,
> > -                         bootstrap_map_multiboot(image),
> > -                         cmdline, &entry, &start_info);
> > +    rc =3D pvh_load_kernel(d, image, initrd, bootstrap_map(image),
> cmdline,
> > +                         &entry, &start_info);
> >      if ( rc )
> >      {
> >          printk("Failed to load Dom0 kernel\n");
> > diff --git a/xen/arch/x86/include/asm/boot.h
> b/xen/arch/x86/include/asm/boot.h
> > index 10b17f12b2..bcf4f2e2e3 100644
> > --- a/xen/arch/x86/include/asm/boot.h
> > +++ b/xen/arch/x86/include/asm/boot.h
> > @@ -19,6 +19,42 @@ static inline void *bootstrap_map_multiboot(const
> module_t *mod)
> >      return bootstrap_map(&bm);
> >  }
> >
> > +static inline unsigned long bootmodule_index(
> > +    const struct boot_info *info, bootmod_type_t bootmod_type,
> > +    unsigned long start)
> > +{
> > +    for ( ; start < info->nr_mods; start++ )
> > +        if ( info->mods[start].bootmod_type =3D=3D bootmod_type )
> > +            return start;
> > +
> > +    return info->nr_mods + 1;
> > +}
> > +
> > +static inline struct boot_module *bootmodule_next(
> > +    const struct boot_info *info, bootmod_type_t bootmod_type)
> > +{
> > +    unsigned long i;
> > +
> > +    for ( i =3D 0; i < info->nr_mods; i++ )
> > +        if ( info->mods[i].bootmod_type =3D=3D bootmod_type )
> > +            return &info->mods[i];
> > +
> > +    return NULL;
> > +}
> > +
> > +static inline void bootmodule_update_start(struct boot_module *bm,
> > +    paddr_t new_start)
> > +{
> > +    bm->start =3D new_start;
> > +    bm->mfn =3D maddr_to_mfn(new_start);
> > +}
> > +
> > +static inline void bootmodule_update_mfn(struct boot_module *bm, mfn_t
> new_mfn)
> > +{
> > +    bm->mfn =3D new_mfn;
> > +    bm->start =3D mfn_to_maddr(new_mfn);
> > +}
> > +
> >  #endif
> >
> >  /*
> > diff --git a/xen/arch/x86/include/asm/bootinfo.h
> b/xen/arch/x86/include/asm/bootinfo.h
> > index a25054f372..30c27980e0 100644
> > --- a/xen/arch/x86/include/asm/bootinfo.h
> > +++ b/xen/arch/x86/include/asm/bootinfo.h
> > @@ -2,9 +2,33 @@
> >  #define __ARCH_X86_BOOTINFO_H__
> >
> >  struct arch_bootmodule {
> > +#define BOOTMOD_FLAG_X86_RELOCATED     1U << 0
> > +    uint32_t flags;
> >      unsigned headroom;
> >  };
> >
> > +struct arch_boot_info {
> > +    uint32_t flags;
> > +#define BOOTINFO_FLAG_X86_CMDLINE      1U << 2
>
> Is this to indicate the presence of the Xen cmdline?
>

Yes; it replaces the previous use of the MBI_CMDLINE flag and is set
whenever MBI_CMDLINE is set when passed from multiboot. This indicates that
a command line has been passed via multiboot.

A comment in the conversion function confirms the intended use of the flag
field:
    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */


>
>
> > +#define BOOTINFO_FLAG_X86_MODULES      1U << 3
> > +#define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
> > +#define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9
> > +
> > +    char *boot_loader_name;
> > +
> > +    uint32_t mmap_length;
> > +    paddr_t mmap_addr;
> > +};
> > +
> > +struct __packed mb_memmap {
> > +    uint32_t size;
> > +    uint32_t base_addr_low;
> > +    uint32_t base_addr_high;
> > +    uint32_t length_low;
> > +    uint32_t length_high;
> > +    uint32_t type;
> > +};
> > +
> >  #endif
> >
> >  /*
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 3b623a4149..f9b04daebd 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -37,6 +37,7 @@
> >  #include <asm/processor.h>
> >  #include <asm/mpspec.h>
> >  #include <asm/apic.h>
> > +#include <asm/boot.h>
> >  #include <asm/msi.h>
> >  #include <asm/desc.h>
> >  #include <asm/paging.h>
> > @@ -59,6 +60,9 @@
> >  #include <asm/prot-key.h>
> >  #include <asm/pv/domain.h>
> >
> > +/* Max number of boot modules a bootloader can provide in addition to
> Xen */
> > +#define MAX_NR_BOOTMODS 63
>
> Call it MAX_MODULES ?
> Like I wrote in the past, you already did the hard work of aligning the
> interfaces, we might as well also use the same names.
>

On the general naming: BOOTMODS is more descriptive in that it indicates an
association between the module and the context it is from: ie. boot, and is
a module handed to the hypervisor by a bootloader (as opposed to say, a
late-loaded module). The term BOOTMOD is also already used within the Arm
source, see: BOOTMOD_MAX_CMDLINE.

On using the same name: following the feedback in the previous round of
reviews this value doesn't include a count of the hypervisor itself; so it
isn't the same thing and so I wouldn't use the same name for it.


>
> [...]
>
> > @@ -1357,12 +1382,14 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >           * respective reserve_e820_ram() invocation below. No need to
> >           * query efi_boot_mem_unused() here, though.
> >           */
> > -        mod[boot_info->nr_mods].mod_start =3D virt_to_mfn(_stext);
> > -        mod[boot_info->nr_mods].mod_end =3D __2M_rwdata_end - _stext;
> > +        bootmodule_update_start(&boot_info->mods[boot_info->nr_mods],
> > +                                virt_to_maddr(_stext));
> > +        boot_info->mods[boot_info->nr_mods].size =3D __2M_rwdata_end -
> _stext;
> >      }
>
> The original code had the end address as "__2M_rwdata_end - _stext"
> while now we have the size as "__2M_rwdata_end - _stext" which is not
> the same?
>

(this was answered by Jan in a previous reply)

>
>
>
> >      boot_info->mods[0].arch->headroom =3D
> > -        bzimage_headroom(bootstrap_map_multiboot(mod), mod->mod_end);
> > +        bzimage_headroom(bootstrap_map(&boot_info->mods[0]),
> > +                         boot_info->mods[0].size);
> >
> >      bootstrap_map(NULL);
> >
>
> [...]
>
>
> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> > index eb93cc3439..2f4284a91f 100644
> > --- a/xen/include/xen/bootinfo.h
> > +++ b/xen/include/xen/bootinfo.h
> > @@ -2,23 +2,50 @@
> >  #define __XEN_BOOTINFO_H__
> >
> >  #include <xen/types.h>
> > +#include <xen/compiler.h>
> > +#include <xen/mm-frame.h>
> >
> >  #ifdef CONFIG_X86
> >  #include <asm/bootinfo.h>
> >  #else
> >      struct arch_bootmodule { };
> > +    struct arch_boot_info { };
> >  #endif
> >
> > +/* Boot module binary type / purpose */
> > +#define BOOTMOD_UNKNOWN     0
> > +#define BOOTMOD_XEN         1
> > +#define BOOTMOD_FDT         2
> > +#define BOOTMOD_KERNEL      3
> > +#define BOOTMOD_RAMDISK     4
> > +#define BOOTMOD_XSM         5
> > +#define BOOTMOD_UCODE       6
> > +#define BOOTMOD_GUEST_DTB   7
> > +typedef unsigned int bootmod_type_t;
> > +
> > +#define BOOTMOD_STRING_MAX_LEN 1024
>
> BOOTMOD_MAX_CMDLINE ?
>

The string associated with a boot module may not be a command line; it
depends on the type of the module, hence BOOTMOD_MAX_STRING was what it was
called in v1 of the hyperlaunch series, and I revised it to this since I
think it's clearer.
ie. There's a purpose to the rename.


>
>
> > +struct boot_string {
>
> struct bootcmdline ?
>

It is similar to bootcmdline in that it stores the contents of the string
provided by the bootloader to associate with a boot module, but the struct
contents differ and the way that it is accessed is different too.

I think it replaces bootcmdline once the new structures are fully in use on
Arm.


>
>
> > +    char bytes[BOOTMOD_STRING_MAX_LEN];
>
> cmdline?
>

It may not be command line, depending on the module type, hence the
interest in using a different term for it.


>
> If the string is \0 terminated we don't need len?
>

This is for generalized strings associated with boot modules supplied by
the bootloader, not just command lines, so additional consideration may be
wanted. This is a defensive mechanism, attackers don't follow
specifications and sometimes people cause bugs.


>
>
> > +    size_t len;
> > +};
> > +
> >  struct boot_module {
> > +    bootmod_type_t bootmod_type;
>
> Why not use a good old enum?
>

The early x86 boot logic that runs in 32-bit mode populates the structures
which are then accessed in the main hypervisor initialization logic in
64-bit mode, and we would like to have a single common definition for the
structures in a header that is useable in both places, so that requires
preparing for fixed-size types in packed structures; an enum isn't
guaranteed to compile to
the same size in those two cases, so doesn't pack. To make transition for
the Arm code easier I can make these definitions closer to the old enum
though.


>
>
> >      paddr_t start;
> > +    mfn_t mfn;
>
> I think mfn should be in arch_bootmodule
>

I think that's ok if it's not needed in non-x86 logic.


>
>
> >      size_t size;
> >
> >      struct arch_bootmodule *arch;
> > +    struct boot_string string;
> >  };
> >
> >  struct boot_info {
> > +    char *cmdline;
>
> Is this for Xen cmdline?


Yes


> While all the other cmdline are in the various
> struct boot_string? Is there any benefit in using the BOOTMOD_XEN for it?
> BOOTMOD_XEN is not used so far, so if you don't end up using it,
> probably not, otherwise it could be considered.
>

ok - I agree that we haven't dropped any use of BOOTMOD_XEN so far but will
keep it in mind.

thanks,

Christopher


>
>
>
>
> >      unsigned int nr_mods;
> >      struct boot_module *mods;
> > +
> > +    struct arch_boot_info *arch;
> >  };
> >
> >  #endif
> > --
> > 2.25.1
> >
> >
>

--0000000000006413430600f2c11a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 8, 2023 at 12:15=E2=80=AF=
PM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabel=
lini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sat, 1 Jul 2023, Christopher Clark wrote:<br>
&gt; Adjust the PV and PVH dom0 construction entry points to take boot modu=
le<br>
&gt; structures as parameters, and add further fields to the boot module<br=
>
&gt; structures to plumb the data needed to support this use. Populate thes=
e<br>
&gt; from the multiboot module data.<br>
&gt; <br>
&gt; This change removes multiboot from the PV and PVH dom0 construction lo=
gic.<br>
&gt; <br>
&gt; Introduce and use new inline accessor functions for navigating the boo=
t<br>
&gt; module structures.<br>
&gt; <br>
&gt; The per-boot-module arrays are expanded from singletons to accommodate=
<br>
&gt; all modules, up to a static maximum of 64 modules including Xen that c=
an<br>
&gt; be accepted from a bootloader to match the previous value from the<br>
&gt; module map check.<br>
&gt; <br>
&gt; The field that identifies the type of a boot module (kernel, ramdisk,<=
br>
&gt; etc) is introduced to the common boot module structure and declared as=
 a<br>
&gt; non-enum integer type to allow the field to be of a known-size and so<=
br>
&gt; structure can be packed in a subsequent patch in the series, and it wi=
ll<br>
&gt; then be reconciled with the equivalent Arm boot field type.<br>
&gt; <br>
&gt; The command line provided by multiboot for each boot module is added<b=
r>
&gt; directly to the boot_module structure, which is appropriate for this<b=
r>
&gt; logic just replacing multiboot.<br>
&gt; <br>
&gt; The maximum number of boot modules that a bootloader can provide in<br=
>
&gt; addition to the Xen hypervisor is preserved from prior logic with the<=
br>
&gt; module_map at 63.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; Changes since v1: patch is a subset of v1 series patches 2 and 3.<br>
&gt; - The module_map is kept for now since still in use.<br>
&gt; - Move the static inline functions into a separate dedicated header.<b=
r>
&gt; - &lt;mm-frame.h&gt; and &lt;compiler.h&gt; replace prior inclusion of=
 &lt;mm.h&gt;<br>
&gt;=C2=A0 =C2=A0for simpler dependencies.<br>
&gt; <br>
&gt;=C2=A0 xen/arch/x86/dom0_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 xen/arch/x86/hvm/dom0_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 43 +++---<br>
&gt;=C2=A0 xen/arch/x86/include/asm/boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 36 +++++<br>
&gt;=C2=A0 xen/arch/x86/include/asm/bootinfo.h=C2=A0 =C2=A0|=C2=A0 24 +++<b=
r>
&gt;=C2=A0 xen/arch/x86/include/asm/dom0_build.h |=C2=A0 13 +-<br>
&gt;=C2=A0 xen/arch/x86/include/asm/setup.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
&gt;=C2=A0 xen/arch/x86/pv/dom0_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 ++--<br>
&gt;=C2=A0 xen/arch/x86/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 206 +++++++++++++++-----------<br>
&gt;=C2=A0 xen/include/xen/bootinfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 27 ++++<br>
&gt;=C2=A0 9 files changed, 254 insertions(+), 141 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c<br>
&gt; index 9f5300a3ef..42310202a2 100644<br>
&gt; --- a/xen/arch/x86/dom0_build.c<br>
&gt; +++ b/xen/arch/x86/dom0_build.c<br>
&gt; @@ -4,6 +4,7 @@<br>
&gt;=C2=A0 =C2=A0* Copyright (c) 2002-2005, K A Fraser<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; +#include &lt;xen/bootinfo.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/iocap.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/libelf.h&gt;<br>
&gt; @@ -562,9 +563,8 @@ int __init dom0_setup_permissions(struct domain *d=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int __init construct_dom0(struct domain *d, const module_t *image,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 unsigned long image_headroom, module_t *initrd,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 char *cmdline)<br>
&gt; +int __init construct_dom0(struct domain *d, const struct boot_module =
*image,<br>
&gt; +=C2=A0 =C2=A0 struct boot_module *initrd, char *cmdline)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int rc;<br>
&gt;=C2=A0 <br>
&gt; @@ -576,9 +576,9 @@ int __init construct_dom0(struct domain *d, const =
module_t *image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 process_pending_softirqs();<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( is_hvm_domain(d) )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D dom0_construct_pvh(d, image, image=
_headroom, initrd, cmdline);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D dom0_construct_pvh(d, image, initr=
d, cmdline);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else if ( is_pv_domain(d) )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D dom0_construct_pv(d, image, image_=
headroom, initrd, cmdline);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D dom0_construct_pv(d, image, initrd=
, cmdline);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Cannot construct Dom0. N=
o guest interface available\n&quot;);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_bui=
ld.c<br>
&gt; index 56fe89632b..c094863bb8 100644<br>
&gt; --- a/xen/arch/x86/hvm/dom0_build.c<br>
&gt; +++ b/xen/arch/x86/hvm/dom0_build.c<br>
&gt; @@ -8,9 +8,9 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;xen/acpi.h&gt;<br>
&gt; +#include &lt;xen/bootinfo.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/libelf.h&gt;<br>
&gt; -#include &lt;xen/multiboot.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/pci.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/softirq.h&gt;<br>
&gt;=C2=A0 <br>
&gt; @@ -530,14 +530,13 @@ static paddr_t __init find_memory(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return INVALID_PADDR;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int __init pvh_load_kernel(struct domain *d, const module_t *i=
mage,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long image_headr=
oom,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_t *initrd, void *i=
mage_base,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cmdline, paddr_t *e=
ntry,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr_t *start_info_addr)=
<br>
&gt; +static int __init pvh_load_kernel(<br>
&gt; +=C2=A0 =C2=A0 struct domain *d, const struct boot_module *image,<br>
&gt; +=C2=A0 =C2=A0 struct boot_module *initrd, void *image_base, char *cmd=
line, paddr_t *entry,<br>
&gt; +=C2=A0 =C2=A0 paddr_t *start_info_addr)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 void *image_start =3D image_base + image_headroom;<br>
&gt; -=C2=A0 =C2=A0 unsigned long image_len =3D image-&gt;mod_end;<br>
&gt; +=C2=A0 =C2=A0 void *image_start =3D image_base + image-&gt;arch-&gt;h=
eadroom;<br>
&gt; +=C2=A0 =C2=A0 unsigned long image_len =3D image-&gt;size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct elf_binary elf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct elf_dom_parms parms;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 paddr_t last_addr;<br>
&gt; @@ -546,7 +545,7 @@ static int __init pvh_load_kernel(struct domain *d=
, const module_t *image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct vcpu *v =3D d-&gt;vcpu[0];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int rc;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if ( (rc =3D bzimage_parse(image_base, &amp;image_start=
, image_headroom,<br>
&gt; +=C2=A0 =C2=A0 if ( (rc =3D bzimage_parse(image_base, &amp;image_start=
, image-&gt;arch-&gt;headroom,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;image_len)) !=3D 0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Error trying to detect =
bz compressed kernel\n&quot;);<br>
&gt; @@ -594,7 +593,7 @@ static int __init pvh_load_kernel(struct domain *d=
, const module_t *image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* simplify it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 last_addr =3D find_memory(d, &amp;elf, sizeof(star=
t_info) +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (initrd ? ROUNDUP(initrd-&gt;mod_end, PAGE_SIZ=
E) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (initrd ? ROUNDUP(initrd-&gt;size, PAGE_SIZE) =
+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeo=
f(mod)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 0) +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cmdline ? ROUNDUP(strlen(cmdline) + 1,<=
br>
&gt; @@ -608,8 +607,8 @@ static int __init pvh_load_kernel(struct domain *d=
, const module_t *image,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( initrd !=3D NULL )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D hvm_copy_to_guest_phys(last_addr, =
mfn_to_virt(initrd-&gt;mod_start),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd-&gt;mod_end=
, v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D hvm_copy_to_guest_phys(last_addr, =
maddr_to_virt(initrd-&gt;start),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd-&gt;size, v=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Unable to=
 copy initrd to guest\n&quot;);<br>
&gt; @@ -617,11 +616,11 @@ static int __init pvh_load_kernel(struct domain =
*d, const module_t *image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod.paddr =3D last_addr;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod.size =3D initrd-&gt;mod_end;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_addr +=3D ROUNDUP(initrd-&gt;mod_end=
, elf_64bit(&amp;elf) ? 8 : 4);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( initrd-&gt;string )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod.size =3D initrd-&gt;size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_addr +=3D ROUNDUP(initrd-&gt;size, e=
lf_64bit(&amp;elf) ? 8 : 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( initrd-&gt;string.len )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *str =3D __va(initrd-&=
gt;string);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *str =3D initrd-&gt;st=
ring.bytes;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(=
str) + 1;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D hvm_copy_to_gue=
st_phys(last_addr, str, len, v);<br>
&gt; @@ -1176,10 +1175,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct=
 domain *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int __init dom0_construct_pvh(struct domain *d, const module_t *image=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long image_headroom,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_t *initrd,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cmdline)<br>
&gt; +int __init dom0_construct_pvh(<br>
&gt; +=C2=A0 =C2=A0 struct domain *d, const struct boot_module *image,<br>
&gt; +=C2=A0 =C2=A0 struct boot_module *initrd, char *cmdline)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 paddr_t entry, start_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int rc;<br>
&gt; @@ -1209,9 +1207,8 @@ int __init dom0_construct_pvh(struct domain *d, =
const module_t *image,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 rc =3D pvh_load_kernel(d, image, image_headroom, initrd=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0bootstrap_map_multiboot(image),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0cmdline, &amp;entry, &amp;start_info);<br>
&gt; +=C2=A0 =C2=A0 rc =3D pvh_load_kernel(d, image, initrd, bootstrap_map(=
image), cmdline,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&amp;entry, &amp;start_info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( rc )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Failed to load Dom0 ker=
nel\n&quot;);<br>
&gt; diff --git a/xen/arch/x86/include/asm/boot.h b/xen/arch/x86/include/as=
m/boot.h<br>
&gt; index 10b17f12b2..bcf4f2e2e3 100644<br>
&gt; --- a/xen/arch/x86/include/asm/boot.h<br>
&gt; +++ b/xen/arch/x86/include/asm/boot.h<br>
&gt; @@ -19,6 +19,42 @@ static inline void *bootstrap_map_multiboot(const m=
odule_t *mod)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return bootstrap_map(&amp;bm);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static inline unsigned long bootmodule_index(<br>
&gt; +=C2=A0 =C2=A0 const struct boot_info *info, bootmod_type_t bootmod_ty=
pe,<br>
&gt; +=C2=A0 =C2=A0 unsigned long start)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 for ( ; start &lt; info-&gt;nr_mods; start++ )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( info-&gt;mods[start].bootmod_type =
=3D=3D bootmod_type )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return start;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return info-&gt;nr_mods + 1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline struct boot_module *bootmodule_next(<br>
&gt; +=C2=A0 =C2=A0 const struct boot_info *info, bootmod_type_t bootmod_ty=
pe)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 unsigned long i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; info-&gt;nr_mods; i++ )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( info-&gt;mods[i].bootmod_type =3D=3D=
 bootmod_type )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &amp;info-&gt;mods[i=
];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void bootmodule_update_start(struct boot_module *bm,<br=
>
&gt; +=C2=A0 =C2=A0 paddr_t new_start)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bm-&gt;start =3D new_start;<br>
&gt; +=C2=A0 =C2=A0 bm-&gt;mfn =3D maddr_to_mfn(new_start);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void bootmodule_update_mfn(struct boot_module *bm, mfn_=
t new_mfn)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bm-&gt;mfn =3D new_mfn;<br>
&gt; +=C2=A0 =C2=A0 bm-&gt;start =3D mfn_to_maddr(new_mfn);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/includ=
e/asm/bootinfo.h<br>
&gt; index a25054f372..30c27980e0 100644<br>
&gt; --- a/xen/arch/x86/include/asm/bootinfo.h<br>
&gt; +++ b/xen/arch/x86/include/asm/bootinfo.h<br>
&gt; @@ -2,9 +2,33 @@<br>
&gt;=C2=A0 #define __ARCH_X86_BOOTINFO_H__<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct arch_bootmodule {<br>
&gt; +#define BOOTMOD_FLAG_X86_RELOCATED=C2=A0 =C2=A0 =C2=A01U &lt;&lt; 0<b=
r>
&gt; +=C2=A0 =C2=A0 uint32_t flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned headroom;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +struct arch_boot_info {<br>
&gt; +=C2=A0 =C2=A0 uint32_t flags;<br>
&gt; +#define BOOTINFO_FLAG_X86_CMDLINE=C2=A0 =C2=A0 =C2=A0 1U &lt;&lt; 2<b=
r>
<br>
Is this to indicate the presence of the Xen cmdline?<br></blockquote><div><=
br></div><div>Yes; it replaces the previous use of the MBI_CMDLINE flag and=
 is set whenever MBI_CMDLINE is set when passed from multiboot. This indica=
tes that a command line has been passed via multiboot.<br><br>A comment in =
the conversion function confirms the intended use of the flag field:<br>=C2=
=A0 =C2=A0 /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +#define BOOTINFO_FLAG_X86_MODULES=C2=A0 =C2=A0 =C2=A0 1U &lt;&lt; 3<b=
r>
&gt; +#define BOOTINFO_FLAG_X86_MEMMAP=C2=A0 =C2=A0 =C2=A0 =C2=A01U &lt;&lt=
; 6<br>
&gt; +#define BOOTINFO_FLAG_X86_LOADERNAME=C2=A0 =C2=A01U &lt;&lt; 9<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 char *boot_loader_name;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t mmap_length;<br>
&gt; +=C2=A0 =C2=A0 paddr_t mmap_addr;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct __packed mb_memmap {<br>
&gt; +=C2=A0 =C2=A0 uint32_t size;<br>
&gt; +=C2=A0 =C2=A0 uint32_t base_addr_low;<br>
&gt; +=C2=A0 =C2=A0 uint32_t base_addr_high;<br>
&gt; +=C2=A0 =C2=A0 uint32_t length_low;<br>
&gt; +=C2=A0 =C2=A0 uint32_t length_high;<br>
&gt; +=C2=A0 =C2=A0 uint32_t type;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c<br>
&gt; index 3b623a4149..f9b04daebd 100644<br>
&gt; --- a/xen/arch/x86/setup.c<br>
&gt; +++ b/xen/arch/x86/setup.c<br>
&gt; @@ -37,6 +37,7 @@<br>
&gt;=C2=A0 #include &lt;asm/processor.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/mpspec.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/apic.h&gt;<br>
&gt; +#include &lt;asm/boot.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/msi.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/desc.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/paging.h&gt;<br>
&gt; @@ -59,6 +60,9 @@<br>
&gt;=C2=A0 #include &lt;asm/prot-key.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/pv/domain.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +/* Max number of boot modules a bootloader can provide in addition to=
 Xen */<br>
&gt; +#define MAX_NR_BOOTMODS 63<br>
<br>
Call it MAX_MODULES ?<br>
Like I wrote in the past, you already did the hard work of aligning the<br>
interfaces, we might as well also use the same names.<br></blockquote><div>=
<br></div><div>On the general naming: BOOTMODS is more descriptive in that =
it indicates an association between the module and the context it is from: =
ie. boot, and is a module handed to the hypervisor by a bootloader (as oppo=
sed to say, a late-loaded module). The term BOOTMOD is also already used wi=
thin the Arm source, see: BOOTMOD_MAX_CMDLINE.<br><br>On using the same nam=
e: following the feedback in the previous round of reviews this value doesn=
&#39;t include a count of the hypervisor itself; so it isn&#39;t the same t=
hing and so I wouldn&#39;t use the same name for it.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[...]<br>
<br>
&gt; @@ -1357,12 +1382,14 @@ void __init noreturn __start_xen(unsigned long=
 mbi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* respective reserve_e820_ram(=
) invocation below. No need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* query efi_boot_mem_unused() =
here, though.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[boot_info-&gt;nr_mods].mod_start =3D =
virt_to_mfn(_stext);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[boot_info-&gt;nr_mods].mod_end =3D __=
2M_rwdata_end - _stext;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootmodule_update_start(&amp;boot_info-&g=
t;mods[boot_info-&gt;nr_mods],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_to_maddr(_stext));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_info-&gt;mods[boot_info-&gt;nr_mods]=
.size =3D __2M_rwdata_end - _stext;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
The original code had the end address as &quot;__2M_rwdata_end - _stext&quo=
t;<br>
while now we have the size as &quot;__2M_rwdata_end - _stext&quot; which is=
 not<br>
the same?<br></blockquote><div><br></div><div>(this was answered by Jan in =
a previous reply)=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 boot_info-&gt;mods[0].arch-&gt;headroom =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bzimage_headroom(bootstrap_map_multiboot(=
mod), mod-&gt;mod_end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bzimage_headroom(bootstrap_map(&amp;boot_=
info-&gt;mods[0]),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0boot_info-&gt;mods[0].size);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bootstrap_map(NULL);<br>
&gt;=C2=A0 <br>
<br>
[...]<br>
<br>
<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; index eb93cc3439..2f4284a91f 100644<br>
&gt; --- a/xen/include/xen/bootinfo.h<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -2,23 +2,50 @@<br>
&gt;=C2=A0 #define __XEN_BOOTINFO_H__<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;xen/types.h&gt;<br>
&gt; +#include &lt;xen/compiler.h&gt;<br>
&gt; +#include &lt;xen/mm-frame.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifdef CONFIG_X86<br>
&gt;=C2=A0 #include &lt;asm/bootinfo.h&gt;<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct arch_bootmodule { };<br>
&gt; +=C2=A0 =C2=A0 struct arch_boot_info { };<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +/* Boot module binary type / purpose */<br>
&gt; +#define BOOTMOD_UNKNOWN=C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define BOOTMOD_XEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; +#define BOOTMOD_FDT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt; +#define BOOTMOD_KERNEL=C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define BOOTMOD_RAMDISK=C2=A0 =C2=A0 =C2=A04<br>
&gt; +#define BOOTMOD_XSM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
&gt; +#define BOOTMOD_UCODE=C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
&gt; +#define BOOTMOD_GUEST_DTB=C2=A0 =C2=A07<br>
&gt; +typedef unsigned int bootmod_type_t;<br>
&gt; +<br>
&gt; +#define BOOTMOD_STRING_MAX_LEN 1024<br>
<br>
BOOTMOD_MAX_CMDLINE ?<br></blockquote><div><br></div><div>The string associ=
ated with a boot module may not be a command line; it depends on the type o=
f the module, hence BOOTMOD_MAX_STRING was what it was called in v1 of the =
hyperlaunch series, and I revised it to this since I think it&#39;s clearer=
.<br>ie. There&#39;s a purpose to the rename.<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +struct boot_string {<br>
<br>
struct bootcmdline ?<br></blockquote><div><br></div><div>It is similar to b=
ootcmdline in that it stores the contents of the string provided by the boo=
tloader to associate with a boot module, but the struct contents differ and=
 the way that it is accessed is different too.<br><br>I think it replaces b=
ootcmdline once the new structures are fully in use on Arm.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 char bytes[BOOTMOD_STRING_MAX_LEN];<br>
<br>
cmdline?<br></blockquote><div><br></div><div>It may not be command line, de=
pending on the module type, hence the interest in using a different term fo=
r it.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
If the string is \0 terminated we don&#39;t need len?<br></blockquote><div>=
<br></div><div>This is for generalized strings associated with boot modules=
 supplied by the bootloader, not just command lines, so additional consider=
ation may be wanted. This=C2=A0is a defensive mechanism, attackers don&#39;=
t follow specifications and sometimes people cause bugs.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 size_t len;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 struct boot_module {<br>
&gt; +=C2=A0 =C2=A0 bootmod_type_t bootmod_type;<br>
<br>
Why not use a good old enum?<br></blockquote><div><br></div><div>The early =
x86 boot logic that runs in 32-bit mode populates the structures which are =
then accessed in the main hypervisor initialization logic in 64-bit mode, a=
nd we would like to have a single common definition for the structures in a=
 header that is useable in both places, so that requires preparing for fixe=
d-size types in packed structures; an enum isn&#39;t guaranteed to compile =
to<br>the same size in those two cases, so doesn&#39;t pack. To make transi=
tion for the Arm code easier I can make these definitions closer to the old=
 enum though.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 paddr_t start;<br>
&gt; +=C2=A0 =C2=A0 mfn_t mfn;<br>
<br>
I think mfn should be in arch_bootmodule<br></blockquote><div><br></div><di=
v>I think that&#39;s ok if it&#39;s not needed in non-x86 logic.<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t size;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct arch_bootmodule *arch;<br>
&gt; +=C2=A0 =C2=A0 struct boot_string string;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct boot_info {<br>
&gt; +=C2=A0 =C2=A0 char *cmdline;<br>
<br>
Is this for Xen cmdline?</blockquote><div><br></div><div>Yes</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"> While all the o=
ther cmdline are in the various<br>
struct boot_string? Is there any benefit in using the BOOTMOD_XEN for it?<b=
r>
BOOTMOD_XEN is not used so far, so if you don&#39;t end up using it,<br>
probably not, otherwise it could be considered.<br></blockquote><div><br></=
div><div>ok - I agree that we haven&#39;t dropped any use of BOOTMOD_XEN so=
 far but will keep it in mind.</div><div><br></div><div>thanks,</div><div><=
br></div><div>Christopher</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int nr_mods;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct boot_module *mods;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct arch_boot_info *arch;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--0000000000006413430600f2c11a--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1275B9BD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 23:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566741.885980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbUK-0001e7-Du; Thu, 20 Jul 2023 21:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566741.885980; Thu, 20 Jul 2023 21:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMbUK-0001aj-9h; Thu, 20 Jul 2023 21:47:08 +0000
Received: by outflank-mailman (input) for mailman id 566741;
 Thu, 20 Jul 2023 21:47:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC1w=DG=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qMbUI-0001ad-25
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 21:47:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f67e0493-2746-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 23:47:03 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51e619bcbf9so1577581a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 14:47:03 -0700 (PDT)
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
X-Inumbo-ID: f67e0493-2746-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689889623; x=1690494423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=52+s2SbNnxxNOwv+Zb60gyCGKTPiz+xuMsadNr5U7Vk=;
        b=G8YX3AGnO7cQuIWYINGlnztxF+yEwntD5yr5GgS+rNL7XQjL0c1XBkc3l75TdsaScu
         pr+icg6TvMNDBn6m4Lrsri+r+/Oqo4SNtwnvOYniw60ivs2lTt15IsbyOWjGRe1akusW
         Ti+YRNTExo5SPtSSIy0UYi09odsSFixZKX4i0yZtJIsPIoFr4t/ngwSFBSf0fJZdL+JR
         SSe1pEe2L0JOb9TTpaXbKcHYUu3Xwk3FB2p5wSUmKumoG+EY1EB2Lim4NnyPXSWAW2ke
         bIj/JYduPmFYl+iTBIBCTCb4Wi9fmpbqddZr6l03WfnU6+nZvzNgBL2vT+1lxQ1skUgt
         gpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689889623; x=1690494423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52+s2SbNnxxNOwv+Zb60gyCGKTPiz+xuMsadNr5U7Vk=;
        b=OI8OI9wlRd7cQo0yZCvcM2/ISiIUaGEkqq29L5WEBaarhrb5VtcMv01qT8SqovTTmK
         7gT89XfkXLwtM/YsuGWBMdWqYdjL+heGNRpBWZG045AtPOhL017sqS/O7psjT9mxN+zq
         Al/jlrVY+GFJeqc+67yYroqd0VzgbkVj/kNvSvNWLYjjnMdIyLznmg4zeXo36lQK81nL
         oPc2Wvrhp+AACiiOEuOyesozCyfc5C88qBIt/5APUVUG2jCg9GILGbIe2zvwBtqNNl/t
         rDtAcoM1sSQzrTCFzKBPUn7/+yhPwNoZDuzJnBNfdmkMqNnYG+409p7lD4o5GSyp+/Df
         GQZQ==
X-Gm-Message-State: ABy/qLZbqnWI3iMqaUaBmFd/XhWTXX94yFpZZ4gIDsyGKO3m9jgOIoIM
	qckMRBtmCBaVD2od+bP1m7d0l4lsE5bnxs3uoPYGYSkKxGy4vw==
X-Google-Smtp-Source: APBJJlENIfsfJkAnFAzIPF3bfkBisLFEB+2aHO1Zr6gjV2LRBTRCbykUFjF1SHuXtUUO/CyZjgoTJG9B0ydBoIcpHRA=
X-Received: by 2002:a05:6402:1a3c:b0:51a:2c81:72ee with SMTP id
 be28-20020a0564021a3c00b0051a2c8172eemr70508edb.20.1689889621882; Thu, 20 Jul
 2023 14:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-2-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081124250.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307081124250.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 20 Jul 2023 14:46:50 -0700
Message-ID: <CACMJ4GZ5-Mg7Tg_H4mCj6EUUbwhhjZYid2V==c71o1fa5VPgOQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] x86 setup: move x86 boot module counting into a new
 boot_info struct
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009f3b270600f21682"

--0000000000009f3b270600f21682
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 11:30=E2=80=AFAM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Sat, 1 Jul 2023, Christopher Clark wrote:
> > An initial step towards a non-multiboot internal representation of boot
> > modules for common code, starting with x86 setup and converting the
> > fields that are accessed for the startup calculations.
> >
> > Introduce a new header, <xen/bootinfo.h>, and populate it with a new
> > boot_info structure initially containing a count of the number of boot
> > modules.
> >
> > The naming of the header, structure and fields is intended to respect
> > the boot structures on Arm -- see arm/include/asm/setup.h -- as part of
> > work towards aligning common architecture-neutral boot logic and
> > structures.
>
> Thanks for aligning the two archs. At some point we should also have ARM
> use the common headers.
>
>
> > No functional change intended.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >
> > ---
> > Changes since v1: patch is a subset of v1 series patches 2 and 3.
> >
> >  xen/arch/x86/setup.c       | 58 +++++++++++++++++++++++---------------
> >  xen/include/xen/bootinfo.h | 20 +++++++++++++
> >  2 files changed, 55 insertions(+), 23 deletions(-)
> >  create mode 100644 xen/include/xen/bootinfo.h
> >
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 74e3915a4d..708639b236 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1,3 +1,4 @@
> > +#include <xen/bootinfo.h>
> >  #include <xen/init.h>
> >  #include <xen/lib.h>
> >  #include <xen/err.h>
> > @@ -268,7 +269,16 @@ static int __init cf_check parse_acpi_param(const
> char *s)
> >  custom_param("acpi", parse_acpi_param);
> >
> >  static const module_t *__initdata initial_images;
> > -static unsigned int __initdata nr_initial_images;
> > +static struct boot_info __initdata *boot_info;
>
> Why can't this be not a pointer?
>

In a later patch (10/10 in the same series posted), the boot_info pointer
is passed as an argument to start_xen. On x86 there are currently three
different entry points to this that have different environments which must
all be made to behave the same, and passing the argument as a pointer is a
lowest-common-denominater due to the 32bit x86 multiboot entry point.
Additionally another entry point will be coming soon for TrenchBoot.

Defining it as a pointer now where this logic is introduced saves having to
do a conversion of all accesses when the later change is made.

I can add a note about this to the commit message.



>
>
> > +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
> > +{
> > +    static struct boot_info __initdata info;
>
> Then we don't need this
>

(see above)

>
>
> > +    info.nr_mods =3D mbi->mods_count;
> > +
> > +    boot_info =3D &info;
>
> And we could just do:
>
>   boot_info.nr_mods =3D mbi->mods_count;
>
> ?
>

(see above)



>
>
> > +}
> >
> >  unsigned long __init initial_images_nrpages(nodeid_t node)
> >  {
> > @@ -277,7 +287,7 @@ unsigned long __init initial_images_nrpages(nodeid_=
t
> node)
> >      unsigned long nr;
> >      unsigned int i;
> >
> > -    for ( nr =3D i =3D 0; i < nr_initial_images; ++i )
> > +    for ( nr =3D i =3D 0; i < boot_info->nr_mods; ++i )
> >      {
> >          unsigned long start =3D initial_images[i].mod_start;
> >          unsigned long end =3D start + PFN_UP(initial_images[i].mod_end=
);
> > @@ -293,7 +303,7 @@ void __init discard_initial_images(void)
> >  {
> >      unsigned int i;
> >
> > -    for ( i =3D 0; i < nr_initial_images; ++i )
> > +    for ( i =3D 0; i < boot_info->nr_mods; ++i )
> >      {
> >          uint64_t start =3D (uint64_t)initial_images[i].mod_start <<
> PAGE_SHIFT;
> >
> > @@ -301,7 +311,7 @@ void __init discard_initial_images(void)
> >                             start +
> PAGE_ALIGN(initial_images[i].mod_end));
> >      }
> >
> > -    nr_initial_images =3D 0;
> > +    boot_info->nr_mods =3D 0;
> >      initial_images =3D NULL;
> >  }
> >
> > @@ -1020,6 +1030,8 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >          mod =3D __va(mbi->mods_addr);
> >      }
> >
> > +    multiboot_to_bootinfo(mbi);
> > +
> >      loader =3D (mbi->flags & MBI_LOADERNAME)
> >          ? (char *)__va(mbi->boot_loader_name) : "unknown";
> >
> > @@ -1127,18 +1139,18 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >             bootsym(boot_edd_info_nr));
> >
> >      /* Check that we have at least one Multiboot module. */
> > -    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count =3D=3D 0) )
> > +    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods =3D=3D 0) =
)
> >          panic("dom0 kernel not specified. Check bootloader
> configuration\n");
> >
> >      /* Check that we don't have a silly number of modules. */
> > -    if ( mbi->mods_count > sizeof(module_map) * 8 )
> > +    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
> >      {
> > -        mbi->mods_count =3D sizeof(module_map) * 8;
> > +        boot_info->nr_mods =3D sizeof(module_map) * 8;
> >          printk("Excessive multiboot modules - using the first %u
> only\n",
> > -               mbi->mods_count);
> > +               boot_info->nr_mods);
> >      }
> >
> > -    bitmap_fill(module_map, mbi->mods_count);
> > +    bitmap_fill(module_map, boot_info->nr_mods);
> >      __clear_bit(0, module_map); /* Dom0 kernel is always first */
> >
> >      if ( pvh_boot )
> > @@ -1311,9 +1323,9 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >      kexec_reserve_area(&boot_e820);
> >
> >      initial_images =3D mod;
> > -    nr_initial_images =3D mbi->mods_count;
> > +    boot_info->nr_mods =3D boot_info->nr_mods;
> >
> > -    for ( i =3D 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i+=
+ )
> > +    for ( i =3D 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods;
> i++ )
> >      {
> >          if ( mod[i].mod_start & (PAGE_SIZE - 1) )
> >              panic("Bootloader didn't honor module alignment request\n"=
);
> > @@ -1337,8 +1349,8 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >           * respective reserve_e820_ram() invocation below. No need to
> >           * query efi_boot_mem_unused() here, though.
> >           */
> > -        mod[mbi->mods_count].mod_start =3D virt_to_mfn(_stext);
> > -        mod[mbi->mods_count].mod_end =3D __2M_rwdata_end - _stext;
> > +        mod[boot_info->nr_mods].mod_start =3D virt_to_mfn(_stext);
> > +        mod[boot_info->nr_mods].mod_end =3D __2M_rwdata_end - _stext;
> >      }
> >
> >      modules_headroom =3D bzimage_headroom(bootstrap_map(mod),
> mod->mod_end);
> > @@ -1398,7 +1410,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >          {
> >              /* Don't overlap with modules. */
> >              end =3D consider_modules(s, e, reloc_size + mask,
> > -                                   mod, mbi->mods_count, -1);
> > +                                   mod, boot_info->nr_mods, -1);
> >              end &=3D ~mask;
> >          }
> >          else
> > @@ -1419,7 +1431,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >          }
> >
> >          /* Is the region suitable for relocating the multiboot modules=
?
> */
> > -        for ( j =3D mbi->mods_count - 1; j >=3D 0; j-- )
> > +        for ( j =3D boot_info->nr_mods - 1; j >=3D 0; j-- )
> >          {
> >              unsigned long headroom =3D j ? 0 : modules_headroom;
> >              unsigned long size =3D PAGE_ALIGN(headroom + mod[j].mod_en=
d);
> > @@ -1429,7 +1441,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >
> >              /* Don't overlap with other modules (or Xen itself). */
> >              end =3D consider_modules(s, e, size, mod,
> > -                                   mbi->mods_count + relocated, j);
> > +                                   boot_info->nr_mods + relocated, j);
> >
> >              if ( highmem_start && end > highmem_start )
> >                  continue;
> > @@ -1456,7 +1468,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >          {
> >              /* Don't overlap with modules (or Xen itself). */
> >              e =3D consider_modules(s, e,
> PAGE_ALIGN(kexec_crash_area.size), mod,
> > -                                 mbi->mods_count + relocated, -1);
> > +                                 boot_info->nr_mods + relocated, -1);
> >              if ( s >=3D e )
> >                  break;
> >              if ( e > kexec_crash_area_limit )
> > @@ -1471,7 +1483,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >
> >      if ( modules_headroom && !mod->reserved )
> >          panic("Not enough memory to relocate the dom0 kernel image\n")=
;
> > -    for ( i =3D 0; i < mbi->mods_count; ++i )
> > +    for ( i =3D 0; i < boot_info->nr_mods; ++i )
> >      {
> >          uint64_t s =3D (uint64_t)mod[i].mod_start << PAGE_SHIFT;
> >
> > @@ -1540,7 +1552,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >                      ASSERT(j);
> >                  }
> >                  map_e =3D boot_e820.map[j].addr + boot_e820.map[j].siz=
e;
> > -                for ( j =3D 0; j < mbi->mods_count; ++j )
> > +                for ( j =3D 0; j < boot_info->nr_mods; ++j )
> >                  {
> >                      uint64_t end =3D pfn_to_paddr(mod[j].mod_start) +
> >                                     mod[j].mod_end;
> > @@ -1616,7 +1628,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >          }
> >      }
> >
> > -    for ( i =3D 0; i < mbi->mods_count; ++i )
> > +    for ( i =3D 0; i < boot_info->nr_mods; ++i )
> >      {
> >          set_pdx_range(mod[i].mod_start,
> >                        mod[i].mod_start + PFN_UP(mod[i].mod_end));
> > @@ -1999,8 +2011,8 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >             cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
> >             cpu_has_nx ? "" : "not ");
> >
> > -    initrdidx =3D find_first_bit(module_map, mbi->mods_count);
> > -    if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
> > +    initrdidx =3D find_first_bit(module_map, boot_info->nr_mods);
> > +    if ( bitmap_weight(module_map, boot_info->nr_mods) > 1 )
> >          printk(XENLOG_WARNING
> >                 "Multiple initrd candidates, picking module #%u\n",
> >                 initrdidx);
> > @@ -2010,7 +2022,7 @@ void __init noreturn __start_xen(unsigned long
> mbi_p)
> >       * above our heap. The second module, if present, is an initrd
> ramdisk.
> >       */
> >      dom0 =3D create_dom0(mod, modules_headroom,
> > -                       initrdidx < mbi->mods_count ? mod + initrdidx :
> NULL,
> > +                       initrdidx < boot_info->nr_mods ? mod + initrdid=
x
> : NULL,
> >                         kextra, loader);
> >      if ( !dom0 )
> >          panic("Could not set up DOM0 guest OS\n");
> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> > new file mode 100644
> > index 0000000000..6a7d55d20e
> > --- /dev/null
> > +++ b/xen/include/xen/bootinfo.h
> > @@ -0,0 +1,20 @@
> > +#ifndef __XEN_BOOTINFO_H__
> > +#define __XEN_BOOTINFO_H__
> > +
> > +#include <xen/types.h>
>
> I don't think you need types.h right now
>

Ack - thanks


>
>
> > +struct boot_info {
>
> This is what we call struct bootmodules on ARM right? Would it help if
> we used the same name?
>
> I am not asking to make the ARM code common because I think that would
> probably be a lot more work.
>

It becomes clearer to see by the end of the full hyperlaunch v1 series with
the domain builder implemented, but it is also evident by the end of this
series: the core/common boot info for Xen is more than just a set of
bootmodules. This first patch is part of adding functionality to common
incrementally, as a starting point, and reducing this boot info to just a
bootmodules structure is going to be limiting it in this context.

Christopher


>
>
> > +    unsigned int nr_mods;
> > +};
> > +
> > +#endif
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > --
> > 2.25.1
> >
> >
>

--0000000000009f3b270600f21682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 8, 2023 at 11:30=E2=80=AF=
AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabel=
lini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sat, 1 Jul 2023, Christopher Clark wrote:<br>
&gt; An initial step towards a non-multiboot internal representation of boo=
t<br>
&gt; modules for common code, starting with x86 setup and converting the<br=
>
&gt; fields that are accessed for the startup calculations.<br>
&gt; <br>
&gt; Introduce a new header, &lt;xen/bootinfo.h&gt;, and populate it with a=
 new<br>
&gt; boot_info structure initially containing a count of the number of boot=
<br>
&gt; modules.<br>
&gt; <br>
&gt; The naming of the header, structure and fields is intended to respect<=
br>
&gt; the boot structures on Arm -- see arm/include/asm/setup.h -- as part o=
f<br>
&gt; work towards aligning common architecture-neutral boot logic and<br>
&gt; structures.<br>
<br>
Thanks for aligning the two archs. At some point we should also have ARM<br=
>
use the common headers.<br>
<br>
<br>
&gt; No functional change intended.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; Changes since v1: patch is a subset of v1 series patches 2 and 3.<br>
&gt; <br>
&gt;=C2=A0 xen/arch/x86/setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 58 ++++++++++++=
+++++++++++---------------<br>
&gt;=C2=A0 xen/include/xen/bootinfo.h | 20 +++++++++++++<br>
&gt;=C2=A0 2 files changed, 55 insertions(+), 23 deletions(-)<br>
&gt;=C2=A0 create mode 100644 xen/include/xen/bootinfo.h<br>
&gt; <br>
&gt; diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c<br>
&gt; index 74e3915a4d..708639b236 100644<br>
&gt; --- a/xen/arch/x86/setup.c<br>
&gt; +++ b/xen/arch/x86/setup.c<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; +#include &lt;xen/bootinfo.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/init.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/lib.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/err.h&gt;<br>
&gt; @@ -268,7 +269,16 @@ static int __init cf_check parse_acpi_param(const=
 char *s)<br>
&gt;=C2=A0 custom_param(&quot;acpi&quot;, parse_acpi_param);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const module_t *__initdata initial_images;<br>
&gt; -static unsigned int __initdata nr_initial_images;<br>
&gt; +static struct boot_info __initdata *boot_info;<br>
<br>
Why can&#39;t this be not a pointer?<br></blockquote><div><br></div><div>In=
 a later patch (10/10 in the same series posted), the boot_info pointer is =
passed as an argument to start_xen. On x86 there are currently three differ=
ent entry points to this that have different environments which must all be=
 made to behave the same, and passing the argument as a pointer is a lowest=
-common-denominater due to the 32bit x86 multiboot entry point.<br>Addition=
ally another entry point will be coming soon for TrenchBoot.<br><br>Definin=
g it as a pointer now where this logic is introduced saves having to do a c=
onversion of all accesses when the later change is made.<br><br>I can add a=
 note about this to the commit message.<br></div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 static struct boot_info __initdata info;<br>
<br>
Then we don&#39;t need this<br></blockquote><div><br></div><div>(see above)=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 info.nr_mods =3D mbi-&gt;mods_count;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 boot_info =3D &amp;info;<br>
<br>
And we could just do:<br>
<br>
=C2=A0 boot_info.nr_mods =3D mbi-&gt;mods_count;<br>
<br>
?<br></blockquote><div><br></div><div>(see above)=C2=A0</div><br class=3D"g=
mail-Apple-interchange-newline"><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 unsigned long __init initial_images_nrpages(nodeid_t node)<br>
&gt;=C2=A0 {<br>
&gt; @@ -277,7 +287,7 @@ unsigned long __init initial_images_nrpages(nodeid=
_t node)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned long nr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for ( nr =3D i =3D 0; i &lt; nr_initial_images; ++i )<b=
r>
&gt; +=C2=A0 =C2=A0 for ( nr =3D i =3D 0; i &lt; boot_info-&gt;nr_mods; ++i=
 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long start =3D initial_imag=
es[i].mod_start;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long end =3D start + PFN_UP=
(initial_images[i].mod_end);<br>
&gt; @@ -293,7 +303,7 @@ void __init discard_initial_images(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for ( i =3D 0; i &lt; nr_initial_images; ++i )<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; boot_info-&gt;nr_mods; ++i )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t start =3D (uint64_t)initial=
_images[i].mod_start &lt;&lt; PAGE_SHIFT;<br>
&gt;=C2=A0 <br>
&gt; @@ -301,7 +311,7 @@ void __init discard_initial_images(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start + PAGE_ALIGN(initial_images[i].mod_=
end));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 nr_initial_images =3D 0;<br>
&gt; +=C2=A0 =C2=A0 boot_info-&gt;nr_mods =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 initial_images =3D NULL;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -1020,6 +1030,8 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mod =3D __va(mbi-&gt;mods_addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 multiboot_to_bootinfo(mbi);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 loader =3D (mbi-&gt;flags &amp; MBI_LOADERNAME)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? (char *)__va(mbi-&gt;boot_loader_n=
ame) : &quot;unknown&quot;;<br>
&gt;=C2=A0 <br>
&gt; @@ -1127,18 +1139,18 @@ void __init noreturn __start_xen(unsigned long=
 mbi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootsym(boot_edd_info_n=
r));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check that we have at least one Multiboot modul=
e. */<br>
&gt; -=C2=A0 =C2=A0 if ( !(mbi-&gt;flags &amp; MBI_MODULES) || (mbi-&gt;mod=
s_count =3D=3D 0) )<br>
&gt; +=C2=A0 =C2=A0 if ( !(mbi-&gt;flags &amp; MBI_MODULES) || (boot_info-&=
gt;nr_mods =3D=3D 0) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;dom0 kernel not specifie=
d. Check bootloader configuration\n&quot;);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check that we don&#39;t have a silly number of =
modules. */<br>
&gt; -=C2=A0 =C2=A0 if ( mbi-&gt;mods_count &gt; sizeof(module_map) * 8 )<b=
r>
&gt; +=C2=A0 =C2=A0 if ( boot_info-&gt;nr_mods &gt; sizeof(module_map) * 8 =
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mbi-&gt;mods_count =3D sizeof(module_map)=
 * 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_info-&gt;nr_mods =3D sizeof(module_m=
ap) * 8;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Excessive multiboot mod=
ules - using the first %u only\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mbi-&gt;mods_c=
ount);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_info-&gt;=
nr_mods);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 bitmap_fill(module_map, mbi-&gt;mods_count);<br>
&gt; +=C2=A0 =C2=A0 bitmap_fill(module_map, boot_info-&gt;nr_mods);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 __clear_bit(0, module_map); /* Dom0 kernel is alwa=
ys first */<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( pvh_boot )<br>
&gt; @@ -1311,9 +1323,9 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kexec_reserve_area(&amp;boot_e820);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 initial_images =3D mod;<br>
&gt; -=C2=A0 =C2=A0 nr_initial_images =3D mbi-&gt;mods_count;<br>
&gt; +=C2=A0 =C2=A0 boot_info-&gt;nr_mods =3D boot_info-&gt;nr_mods;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for ( i =3D 0; !efi_enabled(EFI_LOADER) &amp;&amp; i &l=
t; mbi-&gt;mods_count; i++ )<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; !efi_enabled(EFI_LOADER) &amp;&amp; i &l=
t; boot_info-&gt;nr_mods; i++ )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( mod[i].mod_start &amp; (PAGE_SI=
ZE - 1) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Bootloader=
 didn&#39;t honor module alignment request\n&quot;);<br>
&gt; @@ -1337,8 +1349,8 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* respective reserve_e820_ram(=
) invocation below. No need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* query efi_boot_mem_unused() =
here, though.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[mbi-&gt;mods_count].mod_start =3D vir=
t_to_mfn(_stext);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[mbi-&gt;mods_count].mod_end =3D __2M_=
rwdata_end - _stext;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[boot_info-&gt;nr_mods].mod_start =3D =
virt_to_mfn(_stext);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mod[boot_info-&gt;nr_mods].mod_end =3D __=
2M_rwdata_end - _stext;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 modules_headroom =3D bzimage_headroom(bootstrap_ma=
p(mod), mod-&gt;mod_end);<br>
&gt; @@ -1398,7 +1410,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t overlap w=
ith modules. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D consider_modul=
es(s, e, reloc_size + mask,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod, mbi-&gt;mods_c=
ount, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod, boot_info-&gt;=
nr_mods, -1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end &amp;=3D ~mask;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; @@ -1419,7 +1431,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Is the region suitable for reloca=
ting the multiboot modules? */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( j =3D mbi-&gt;mods_count - 1; j &gt=
;=3D 0; j-- )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( j =3D boot_info-&gt;nr_mods - 1; j =
&gt;=3D 0; j-- )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long headroom=
 =3D j ? 0 : modules_headroom;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long size =3D=
 PAGE_ALIGN(headroom + mod[j].mod_end);<br>
&gt; @@ -1429,7 +1441,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t overlap w=
ith other modules (or Xen itself). */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D consider_modul=
es(s, e, size, mod,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mbi-&gt;mods_count =
+ relocated, j);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_info-&gt;nr_mo=
ds + relocated, j);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( highmem_start &am=
p;&amp; end &gt; highmem_start )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
;<br>
&gt; @@ -1456,7 +1468,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t overlap w=
ith modules (or Xen itself). */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D consider_modules=
(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mbi-&gt;mods_count + reloc=
ated, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_info-&gt;nr_mods + re=
located, -1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( s &gt;=3D e )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( e &gt; kexec_cras=
h_area_limit )<br>
&gt; @@ -1471,7 +1483,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( modules_headroom &amp;&amp; !mod-&gt;reserved=
 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Not enough memory to rel=
ocate the dom0 kernel image\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 for ( i =3D 0; i &lt; mbi-&gt;mods_count; ++i )<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; boot_info-&gt;nr_mods; ++i )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t s =3D (uint64_t)mod[i].mod_=
start &lt;&lt; PAGE_SHIFT;<br>
&gt;=C2=A0 <br>
&gt; @@ -1540,7 +1552,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ASSERT(j);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 map_e =
=3D boot_e820.map[j].addr + boot_e820.map[j].size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( j =3D 0=
; j &lt; mbi-&gt;mods_count; ++j )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( j =3D 0=
; j &lt; boot_info-&gt;nr_mods; ++j )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint64_t end =3D pfn_to_paddr(mod[j].mod_start) +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod[j].mod_en=
d;<br>
&gt; @@ -1616,7 +1628,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 for ( i =3D 0; i &lt; mbi-&gt;mods_count; ++i )<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; boot_info-&gt;nr_mods; ++i )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_pdx_range(mod[i].mod_start,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mod[i].mod_start + PFN_UP(mod[i].mod_end));<br>
&gt; @@ -1999,8 +2011,8 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_has_nx ? XENLOG_INF=
O : XENLOG_WARNING &quot;Warning: &quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_has_nx ? &quot;&quo=
t; : &quot;not &quot;);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 initrdidx =3D find_first_bit(module_map, mbi-&gt;mods_c=
ount);<br>
&gt; -=C2=A0 =C2=A0 if ( bitmap_weight(module_map, mbi-&gt;mods_count) &gt;=
 1 )<br>
&gt; +=C2=A0 =C2=A0 initrdidx =3D find_first_bit(module_map, boot_info-&gt;=
nr_mods);<br>
&gt; +=C2=A0 =C2=A0 if ( bitmap_weight(module_map, boot_info-&gt;nr_mods) &=
gt; 1 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(XENLOG_WARNING<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Mul=
tiple initrd candidates, picking module #%u\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrdidx=
);<br>
&gt; @@ -2010,7 +2022,7 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* above our heap. The second module, if pres=
ent, is an initrd ramdisk.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dom0 =3D create_dom0(mod, modules_headroom,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0initrdidx &lt; mbi-&gt;mods_count ? mod + initrdidx : NULL,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0initrdidx &lt; boot_info-&gt;nr_mods ? mod + initrdidx : NULL=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0kextra, loader);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( !dom0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Could not set up DOM0 gu=
est OS\n&quot;);<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..6a7d55d20e<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +#ifndef __XEN_BOOTINFO_H__<br>
&gt; +#define __XEN_BOOTINFO_H__<br>
&gt; +<br>
&gt; +#include &lt;xen/types.h&gt;<br>
<br>
I don&#39;t think you need types.h right now<br></blockquote><div><br></div=
><div>Ack - thanks</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
<br>
&gt; +struct boot_info {<br>
<br>
This is what we call struct bootmodules on ARM right? Would it help if<br>
we used the same name?<br>
<br>
I am not asking to make the ARM code common because I think that would<br>
probably be a lot more work.<br></blockquote><div><br></div><div>It becomes=
 clearer to see by the end of the full hyperlaunch v1 series with the domai=
n builder implemented, but it is also evident by the end of this series: th=
e core/common boot info for Xen is more than just a set of bootmodules. Thi=
s first patch is part of adding functionality to common incrementally, as a=
 starting point, and reducing this boot info to just a bootmodules structur=
e is going to be limiting it in this context.<br></div><div><br></div><div>=
Christopher</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 unsigned int nr_mods;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Local variables:<br>
&gt; + * mode: C<br>
&gt; + * c-file-style: &quot;BSD&quot;<br>
&gt; + * c-basic-offset: 4<br>
&gt; + * tab-width: 4<br>
&gt; + * indent-tabs-mode: nil<br>
&gt; + * End:<br>
&gt; + */<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--0000000000009f3b270600f21682--


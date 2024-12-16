Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4E9F333C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858148.1270410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC5b-0003e0-Py; Mon, 16 Dec 2024 14:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858148.1270410; Mon, 16 Dec 2024 14:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC5b-0003cN-MZ; Mon, 16 Dec 2024 14:28:51 +0000
Received: by outflank-mailman (input) for mailman id 858148;
 Mon, 16 Dec 2024 14:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuNa=TJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNC5Z-0003cH-O1
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:28:50 +0000
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ed3600d-bbba-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:28:46 +0100 (CET)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844df397754so130774139f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:28:46 -0800 (PST)
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
X-Inumbo-ID: 0ed3600d-bbba-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734359325; x=1734964125; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbXODO7ddqYeCaGkYUo4xqtbseVEAlqu5pXe3uCjUyM=;
        b=BdIdXob50uuHpehgXRfPl5weVPKLCW3OVZS8RL6hZqvWeQS9IrLPKyUFCkGGJHfrLA
         Y9gOGY4bBiuqiRtmecrGSI1tKn/6NPgiX0GX0PkTCe4YJv++OL7VRJD+0ck6oqDER7i7
         y7cpWmiDNL7rY9GB/iVrOpdp9shdl1F2qOBHos3SB8w+V+NqrEdberhITQ4hP9cLMVml
         jtWXqyrnmpxKiGbsk9lpGYB0LAeSkCWNOYYpP1y5gWoLze+Z4d2enjIIs3V3sqEkMSn9
         SCUoic3Gfwe98j4oXldjiHPKiIpJCP7xkLXN5oR6DhoHbbyh/BGgcztr/iwoyCj5xVvs
         25dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359325; x=1734964125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbXODO7ddqYeCaGkYUo4xqtbseVEAlqu5pXe3uCjUyM=;
        b=FuYTmhRIx+0UL96mrazDDK4cybOspkdXi0Twq50stDanFqG3gPKVrMR6wHVAi+iDyg
         V7VfH5CfmjahFpRmor1goDDQlWdalpypAvCzJo8n3W7ZNF02eu1rM16b9Zs2ktqjeFdp
         TdORx2ORpAXmD31K7HCZnXsWz/wFL/MeJVtxS3T41z8aijhEu/cg+Uz4n+MV2mGVtNAu
         LBAw1jHGoD8rZo8DF4dh5olTpFej1T8iE+QItvSfMA2SmwLTMozSyBZw6cBWblJjfhuu
         OGb8iAdNnpnmjNcOYa0bRJA3EhVZO0RRoVboAX4GzF0BECMyi53XtAvCIAwdWp/MZzD1
         BhFw==
X-Gm-Message-State: AOJu0YxdUimEviKy93xELaBTG5lSmbJ21g1E+qq6cG5SetUMX16s31SC
	9yfIaCBBIb/n41OMYTrfwTLZ1MEOYLQDaNytkXTvCUd6IaUeynOat/OCWuR79DWojybLA7WqL7Q
	riueNX2WkpDXK5DX29d2qUm19MjT6Oen43vl37w==
X-Gm-Gg: ASbGncsdS/G7LqzAGwbkFF5Ehcv8JCJyjLLsUi+o/NHnb+EzSiHkndRRWCTjRVNSvg+
	iUA87+1ROusv74d2DjaqTnCiNFbL6dCAr8n92Cyo=
X-Google-Smtp-Source: AGHT+IHSDYMyESLu/A8IPVsPXUpNhhjZePjUG9RIx/DxTWy/XHkKpuGDeOyfds4FoNX7e2fDr/8wrCGvYO+QBxRSYgk=
X-Received: by 2002:a05:6e02:20c2:b0:3a7:d84c:f2a0 with SMTP id
 e9e14a558f8ab-3aff69e2d54mr102508375ab.7.1734359325103; Mon, 16 Dec 2024
 06:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech> <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
In-Reply-To: <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 16 Dec 2024 15:28:34 +0100
Message-ID: <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen image
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Dec 16, 2024 at 2:56=E2=80=AFPM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> On 13/12/2024 17:28, Carlo Nonato wrote:
> >
> > Xen image is relocated to a new colored physical space. Some relocation
> > functionalities must be brought back:
> > - the virtual address of the new space is taken from 0c18fb76323b
> >   ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
> > - relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
> >   ("xen/arm: Stop relocating Xen").
> >
> > setup_pagetables() must be adapted for coloring and for relocation. Run=
time
> > page tables are used to map the colored space, but they are also linked=
 in
> > boot tables so that the new space is temporarily available for relocati=
on.
> > This implies that Xen protection must happen after the copy.
> >
> > Finally, since the alternative framework needs to remap the Xen text an=
d
> > inittext sections, this operation must be done in a coloring-aware way.
> > The function xen_remap_colored() is introduced for that.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
> > ---
> > v12:
> > - FUNC instead of ENTRY in head.S for relocate_xen
> > - dc cvau instead of dc cvav in relocate_xen()
> > - added relocate_and_switch_ttbr() to make setup_pagetables() code more=
 clear
> > v11:
> > - else if -> if in xen_colored_mfn()
> > v10:
> > - no changes
> > v9:
> > - patch adapted to changes to setup_pagetables()
> > v8:
> > - moved xen_colored_map_size() to arm/llc-coloring.c
> > v7:
> > - added BUG_ON() checks to arch_llc_coloring_init() and
> >   create_llc_coloring_mappings()
> > v6:
> > - squashed with BOOT_RELOC_VIRT_START patch
> > - consider_modules() moved in another patch
> > - removed psci and smpboot code because of new idmap work already handl=
es that
> > - moved xen_remap_colored() in alternative.c since it's only used there
> > - removed xen_colored_temp[] in favor of xen_xenmap[] usage for mapping
> > - use of boot_module_find_by_kind() to remove the need of extra paramet=
er in
> >   setup_pagetables()
> > - moved get_xen_paddr() in arm/llc-coloring.c since it's only used ther=
e
> > v5:
> > - FIXME: consider_modules copy pasted since it got moved
> > v4:
> > - removed set_value_for_secondary() because it was wrongly cleaning cac=
he
> > - relocate_xen() now calls switch_ttbr_id()
> > ---
> >  xen/arch/arm/alternative.c            |  26 ++++++-
> >  xen/arch/arm/arm64/mmu/head.S         |  58 ++++++++++++++-
> >  xen/arch/arm/arm64/mmu/mm.c           |  29 ++++++++
> >  xen/arch/arm/include/asm/mmu/layout.h |   3 +
> >  xen/arch/arm/include/asm/mmu/mm.h     |   1 +
> >  xen/arch/arm/llc-coloring.c           |  63 ++++++++++++++++
> >  xen/arch/arm/mmu/setup.c              | 103 ++++++++++++++++++++++----
> >  xen/arch/arm/setup.c                  |  10 ++-
> >  xen/common/llc-coloring.c             |  18 +++++
> >  xen/include/xen/llc-coloring.h        |  13 ++++
> >  10 files changed, 304 insertions(+), 20 deletions(-)
> >
> > diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> > index fec7dbd2cd..2c1af6e7e4 100644
> > --- a/xen/arch/arm/alternative.c
> > +++ b/xen/arch/arm/alternative.c
> > @@ -9,6 +9,7 @@
> >  #include <xen/init.h>
> >  #include <xen/types.h>
> >  #include <xen/kernel.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/mm.h>
> >  #include <xen/vmap.h>
> >  #include <xen/smp.h>
> > @@ -191,6 +192,25 @@ static int __apply_alternatives_multi_stop(void *x=
enmap)
> >      return 0;
> >  }
> >
> > +static void __init *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
> > +{
> > +    unsigned int i;
> > +    void *xenmap;
> > +    mfn_t *xen_colored_mfns, mfn;
> > +
> > +    xen_colored_mfns =3D xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
> > +    if ( !xen_colored_mfns )
> > +        panic("Can't allocate LLC colored MFNs\n");
> > +
> > +    for_each_xen_colored_mfn ( xen_mfn, mfn, i )
> > +        xen_colored_mfns[i] =3D mfn;
> > +
> > +    xenmap =3D vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
> > +    xfree(xen_colored_mfns);
> > +
> > +    return xenmap;
> > +}
> > +
> >  /*
> >   * This function should only be called during boot and before CPU0 jum=
p
> >   * into the idle_loop.
> > @@ -209,7 +229,11 @@ void __init apply_alternatives_all(void)
> >       * The text and inittext section are read-only. So re-map Xen to
> >       * be able to patch the code.
> >       */
> > -    xenmap =3D vmap_contig(xen_mfn, 1U << xen_order);
> > +    if ( llc_coloring_enabled )
> > +        xenmap =3D xen_remap_colored(xen_mfn, xen_size);
> > +    else
> > +        xenmap =3D vmap_contig(xen_mfn, 1U << xen_order);
> > +
> >      /* Re-mapping Xen is not expected to fail during boot. */
> >      BUG_ON(!xenmap);
> >
> > diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/hea=
d.S
> > index 665a51a337..634156f83d 100644
> > --- a/xen/arch/arm/arm64/mmu/head.S
> > +++ b/xen/arch/arm/arm64/mmu/head.S
> > @@ -428,6 +428,61 @@ FUNC_LOCAL(fail)
> >          b     1b
> >  END(fail)
> >
> > +/*
> > + * Copy Xen to new location and switch TTBR
> > + * x0    ttbr
> > + * x1    source address
> > + * x2    destination address
> > + * x3    length
> > + *
> > + * Source and destination must be word aligned, length is rounded up
> > + * to a 16 byte boundary.
> > + *
> > + * MUST BE VERY CAREFUL when saving things to RAM over the copy
> > + */
> > +FUNC(relocate_xen)
> > +        /*
> > +         * Copy 16 bytes at a time using:
> > +         *   x9: counter
> > +         *   x10: data
> > +         *   x11: data
> > +         *   x12: source
> > +         *   x13: destination
> > +         */
> > +        mov     x9, x3
> > +        mov     x12, x1
> > +        mov     x13, x2
> > +
> > +1:      ldp     x10, x11, [x12], #16
> > +        stp     x10, x11, [x13], #16
> > +
> > +        subs    x9, x9, #16
> > +        bgt     1b
> > +
> > +        /*
> > +         * Flush destination from dcache using:
> > +         *   x9: counter
> > +         *   x10: step
> > +         *   x11: vaddr
> > +         *
> > +         * This is to ensure data is visible to the instruction cache
> > +         */
> > +        dsb   sy
> > +
> > +        mov   x9, x3
> > +        ldr   x10, =3Ddcache_line_bytes /* x10 :=3D step */
> > +        ldr   x10, [x10]
> > +        mov   x11, x2
> > +
> > +1:      dc    cvau, x11
> > +
> > +        add   x11, x11, x10
> > +        subs  x9, x9, x10
> > +        bgt   1b
> > +
> > +        /* No need for dsb/isb because they are alredy done in switch_=
ttbr_id */
> > +        b switch_ttbr_id
> > +
> >  /*
> >   * Switch TTBR
> >   *
> > @@ -453,7 +508,8 @@ FUNC(switch_ttbr_id)
> >
> >          /*
> >           * 5) Flush I-cache
> > -         * This should not be necessary but it is kept for safety.
> > +         * This should not be necessary in the general case, but it's =
needed
> > +         * for cache coloring because code is relocated in that case.
> >           */
> >          ic     iallu
> >          isb
> > diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> > index 671eaadbc1..f1f2543902 100644
> > --- a/xen/arch/arm/arm64/mmu/mm.c
> > +++ b/xen/arch/arm/arm64/mmu/mm.c
> > @@ -1,6 +1,7 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >
> >  #include <xen/init.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/mm.h>
> >  #include <xen/pfn.h>
> >
> > @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
> >  }
> >
> >  extern void switch_ttbr_id(uint64_t ttbr);
> > +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t l=
en);
> >
> >  typedef void (switch_ttbr_fn)(uint64_t ttbr);
> > +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, si=
ze_t len);
> > +
> > +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
> CODING_STYLE: { needs to be on its own line
>
> Also, this function is only executed in case of LLC coloring, so shouldn'=
t it
> be #ifdef protected.

Here and in other places (patch #8) I'm relying on DCE to remove functions
that are not called. This was a suggestion from Jan in that patch. Can we
adopt the same here?

> > +    vaddr_t id_addr =3D virt_to_maddr(relocate_xen);
> > +    relocate_xen_fn *fn =3D (relocate_xen_fn *)id_addr;
> > +    lpae_t pte;
> > +
> > +    /* Enable the identity mapping in the boot page tables */
> > +    update_identity_mapping(true);
> > +
> > +    /* Enable the identity mapping in the runtime page tables */
> > +    pte =3D pte_of_xenaddr((vaddr_t)relocate_xen);
> > +    pte.pt.table =3D 1;
> > +    pte.pt.xn =3D 0;
> > +    pte.pt.ro =3D 1;
> > +    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
> > +
> > +    /* Relocate Xen and switch TTBR */
> > +    fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
> > +
> > +    /*
> > +     * Disable the identity mapping in the runtime page tables.
> > +     * Note it is not necessary to disable it in the boot page tables
> > +     * because they are not going to be used by this CPU anymore.
> > +     */
> > +    update_identity_mapping(false);
> > +}
> >
> >  void __init switch_ttbr(uint64_t ttbr)
> >  {
> > diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/inclu=
de/asm/mmu/layout.h
> > index a3b546465b..19c0ec63a5 100644
> > --- a/xen/arch/arm/include/asm/mmu/layout.h
> > +++ b/xen/arch/arm/include/asm/mmu/layout.h
> > @@ -30,6 +30,7 @@
> >   *  10M -  12M   Fixmap: special-purpose 4K mapping slots
> >   *  12M -  16M   Early boot mapping of FDT
> >   *  16M -  18M   Livepatch vmap (if compiled in)
> > + *  16M -  24M   Cache-colored Xen text, data, bss (temporary, if comp=
iled in)
> >   *
> >   *   1G -   2G   VMAP: ioremap and early_ioremap
> >   *
> > @@ -74,6 +75,8 @@
> >  #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
> >  #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
> >
> > +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_S=
IZE)
> > +
> >  #ifdef CONFIG_LIVEPATCH
> >  #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_S=
IZE)
> >  #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> > diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/a=
sm/mmu/mm.h
> > index c5e03a66bf..f5a00558c4 100644
> > --- a/xen/arch/arm/include/asm/mmu/mm.h
> > +++ b/xen/arch/arm/include/asm/mmu/mm.h
> > @@ -31,6 +31,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> >
> >  /* Switch to a new root page-tables */
> >  extern void switch_ttbr(uint64_t ttbr);
> > +extern void relocate_and_switch_ttbr(uint64_t ttbr);
> >
> >  #endif /* __ARM_MMU_MM_H__ */
> >
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > index 1c7b92bc45..7cb4ecb50e 100644
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -9,6 +9,7 @@
> >  #include <xen/llc-coloring.h>
> >
> >  #include <asm/processor.h>
> > +#include <asm/setup.h>
> >  #include <asm/sysregs.h>
> >  #include <asm/system.h>
> >
> > @@ -64,8 +65,70 @@ unsigned int __init get_llc_way_size(void)
> >      return line_size * num_sets;
> >  }
> >
> > +/**
> Incorrect comment style. Should be /*
>
> > + * get_xen_paddr - get physical address to relocate Xen to
> > + *
> > + * Xen is relocated to as near to the top of RAM as possible and
> > + * aligned to a XEN_PADDR_ALIGN boundary.
> > + */
> > +static paddr_t __init get_xen_paddr(paddr_t xen_size)
> > +{
> > +    const struct membanks *mem =3D bootinfo_get_mem();
> > +    paddr_t min_size, paddr =3D 0;
> > +    unsigned int i;
> > +
> > +    min_size =3D ROUNDUP(xen_size, XEN_PADDR_ALIGN);
> > +
> > +    /* Find the highest bank with enough space. */
> > +    for ( i =3D 0; i < mem->nr_banks; i++ )
> > +    {
> > +        const struct membank *bank =3D &mem->bank[i];
> > +        paddr_t s, e;
> > +
> > +        if ( bank->size >=3D min_size )
> > +        {
> > +            e =3D consider_modules(bank->start, bank->start + bank->si=
ze,
> > +                                 min_size, XEN_PADDR_ALIGN, 0);
> > +            if ( !e )
> > +                continue;
> > +
> > +#ifdef CONFIG_ARM_32
> > +            /* Xen must be under 4GB */
> > +            if ( e > GB(4) )
> > +                e =3D GB(4);
> > +            if ( e < bank->start )
> > +                continue;
> > +#endif
> > +
> > +            s =3D e - min_size;
> > +
> > +            if ( s > paddr )
> > +                paddr =3D s;
> > +        }
> > +    }
> > +
> > +    if ( !paddr )
> > +        panic("Not enough memory to relocate Xen\n");
> > +
> > +    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> > +           paddr, paddr + min_size);
> > +
> > +    return paddr;
> > +}
> > +
> > +static paddr_t __init xen_colored_map_size(void)
> > +{
> > +    return ROUNDUP((_end - _start) * get_max_nr_llc_colors(), XEN_PADD=
R_ALIGN);
> > +}
> > +
> >  void __init arch_llc_coloring_init(void)
> >  {
> > +    struct bootmodule *xen_bootmodule =3D boot_module_find_by_kind(BOO=
TMOD_XEN);
> > +
> > +    BUG_ON(!xen_bootmodule);
> > +
> > +    xen_bootmodule->size =3D xen_colored_map_size();
> > +    xen_bootmodule->start =3D get_xen_paddr(xen_bootmodule->size);
> >  }
> >
> >  /*
> > diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> > index 196974f3e2..073f762a32 100644
> > --- a/xen/arch/arm/mmu/setup.c
> > +++ b/xen/arch/arm/mmu/setup.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <xen/init.h>
> >  #include <xen/libfdt/libfdt.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/sections.h>
> >  #include <xen/sizes.h>
> >  #include <xen/vmap.h>
> > @@ -20,6 +21,9 @@
> >  #undef virt_to_mfn
> >  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >
> > +#define virt_to_reloc_virt(virt) \
> > +    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
> You need to enclose 'virt' in paranthesis.
>
> > +
> >  /* Main runtime page tables */
> >
> >  /*
> > @@ -69,6 +73,7 @@ static void __init __maybe_unused build_assertions(vo=
id)
> >      /* 2MB aligned regions */
> >      BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
> >      BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> > +    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
> >      /* 1GB aligned regions */
> >  #ifdef CONFIG_ARM_32
> >      BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> > @@ -138,6 +143,9 @@ static void __init __maybe_unused build_assertions(=
void)
> >
> >  lpae_t __init pte_of_xenaddr(vaddr_t va)
> >  {
> > +    if ( llc_coloring_enabled )
> > +        va =3D virt_to_reloc_virt(va);
> > +
> >      return mfn_to_xen_entry(virt_to_mfn(va), MT_NORMAL);
> >  }
> >
> > @@ -316,6 +324,32 @@ paddr_t __init consider_modules(paddr_t s, paddr_t=
 e,
> >      return e;
> >  }
> >
> > +static void __init create_llc_coloring_mappings(void)
> Shouldn't this be #ifdef protected and stub provided if config disabled?.

Same as above.

> > +{
> > +    lpae_t pte;
> > +    unsigned int i;
> > +    struct bootmodule *xen_bootmodule =3D boot_module_find_by_kind(BOO=
TMOD_XEN);
> > +    mfn_t start_mfn =3D maddr_to_mfn(xen_bootmodule->start), mfn;
> > +
> > +    for_each_xen_colored_mfn ( start_mfn, mfn, i )
> > +    {
> > +        pte =3D mfn_to_xen_entry(mfn, MT_NORMAL);
> > +        pte.pt.table =3D 1; /* level 3 mappings always have this bit s=
et */
> > +        xen_xenmap[i] =3D pte;
> > +    }
> > +
> > +    for ( i =3D 0; i < XEN_NR_ENTRIES(2); i++ )
> > +    {
> > +        vaddr_t va =3D BOOT_RELOC_VIRT_START + (i << XEN_PT_LEVEL_SHIF=
T(2));
> > +
> > +        pte =3D mfn_to_xen_entry(virt_to_mfn(xen_xenmap +
> > +                                           i * XEN_PT_LPAE_ENTRIES),
> > +                               MT_NORMAL);
> > +        pte.pt.table =3D 1;
> > +        write_pte(&boot_second[second_table_offset(va)], pte);
> > +    }
> > +}
> > +
> >  /*
> >   * Boot-time pagetable setup.
> >   * Changes here may need matching changes in head.S
> > @@ -326,6 +360,14 @@ void __init setup_pagetables(void)
> >      lpae_t pte, *p;
> >      int i;
> >
> > +    /*
> > +     * In case of cache coloring, map the new physical space in the bo=
ot page
> > +     * tables. From now on, pte_of_xenaddr() will translate addresses =
to this
> > +     * new space.
> > +     */
> > +    if ( llc_coloring_enabled )
> > +        create_llc_coloring_mappings();
> > +
> >      arch_setup_page_tables();
> >
> >  #ifdef CONFIG_ARM_64
> > @@ -353,13 +395,7 @@ void __init setup_pagetables(void)
> >              break;
> >          pte =3D pte_of_xenaddr(va);
> >          pte.pt.table =3D 1; /* third level mappings always have this b=
it set */
> > -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> > -        {
> > -            pte.pt.xn =3D 0;
> > -            pte.pt.ro =3D 1;
> > -        }
> > -        if ( is_kernel_rodata(va) )
> > -            pte.pt.ro =3D 1;
> > +        pte.pt.xn =3D 0; /* Permissions will be enforced later. Allow =
execution */
> >          xen_xenmap[i] =3D pte;
> >      }
> >
> > @@ -379,19 +415,54 @@ void __init setup_pagetables(void)
> >      pte.pt.table =3D 1;
> >      xen_second[second_table_offset(FIXMAP_ADDR(0))] =3D pte;
> >
> > -#ifdef CONFIG_ARM_64
> > -    ttbr =3D virt_to_maddr(xen_pgtable);
> > -#else
> > -    ttbr =3D virt_to_maddr(cpu0_pgtable);
> > +#ifdef CONFIG_ARM_32
> > +    per_cpu(xen_pgtable, 0) =3D cpu0_pgtable;
> >  #endif
> >
> > -    switch_ttbr(ttbr);
> > +    if ( llc_coloring_enabled ) {
> CODING_STYLE: { needs to be on its own line
>
> > +        ttbr =3D virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
> > +        relocate_and_switch_ttbr(ttbr);
> > +    }
> > +    else {
> CODING_STYLE: { needs to be on its own line
>
> > +        ttbr =3D virt_to_maddr(THIS_CPU_PGTABLE);
> > +        switch_ttbr(ttbr);
> > +    }
> >
> > -    xen_pt_enforce_wnx();
> > +    /* Protect Xen */
> > +    for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
> > +    {
> > +        vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> > +        lpae_t *entry =3D xen_xenmap + i;
> >
> > -#ifdef CONFIG_ARM_32
> > -    per_cpu(xen_pgtable, 0) =3D cpu0_pgtable;
> > -#endif
> > +        if ( !is_kernel(va) )
> > +            break;
> > +
> > +        pte =3D read_atomic(entry);
> > +
> > +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> > +        {
> > +            pte.pt.xn =3D 0;
> > +            pte.pt.ro =3D 1;
> > +        }
> > +        else if ( is_kernel_rodata(va) ) {
> CODING_STYLE: { needs to be on its own line
>
> > +            pte.pt.ro =3D 1;
> > +            pte.pt.xn =3D 1;
> > +        }
> > +        else {
> CODING_STYLE: { needs to be on its own line
>
> > +            pte.pt.xn =3D 1;
> > +            pte.pt.ro =3D 0;
> > +        }
> > +
> > +        write_pte(entry, pte);
> > +    }
> > +
> > +    /*
> > +     * We modified live page-tables. Ensure the TLBs are invalidated
> > +     * before setting enforcing the WnX permissions.
> > +     */
> > +    flush_xen_tlb_local();
> > +
> > +    xen_pt_enforce_wnx();
> >  }
> >
> >  void *__init arch_vmap_virt_end(void)
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 568a49b274..5e2c519ce8 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -304,8 +304,6 @@ void asmlinkage __init start_xen(unsigned long fdt_=
paddr)
> >      /* Initialize traps early allow us to get backtrace when an error =
occurred */
> >      init_traps();
> >
> > -    setup_pagetables();
> > -
> >      smp_clear_cpu_maps();
> >
> >      device_tree_flattened =3D early_fdt_map(fdt_paddr);
> > @@ -329,6 +327,14 @@ void asmlinkage __init start_xen(unsigned long fdt=
_paddr)
> >
> >      llc_coloring_init();
> >
> > +    /*
> > +     * Page tables must be setup after LLC coloring initialization bec=
ause
> > +     * coloring info are required in order to create colored mappings
> > +     */
> > +    setup_pagetables();
> > +    /* Device-tree was mapped in boot page tables, remap it in the new=
 tables */
> > +    device_tree_flattened =3D early_fdt_map(fdt_paddr);
> > +
> >      setup_mm();
> >
> >      vm_init();
> > diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> > index ff4837fcc6..545d8b49e8 100644
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -42,6 +42,8 @@ static unsigned int __ro_after_init xen_num_colors;
> >
> >  #define mfn_color_mask              (max_nr_colors - 1)
> >  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> > +#define get_mfn_with_color(mfn, color) \
> > +    (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
> >
> >  /*
> >   * Parse the coloring configuration given in the buf string, following=
 the
> > @@ -364,6 +366,22 @@ unsigned int get_max_nr_llc_colors(void)
> >      return max_nr_colors;
> >  }
> >
> > +mfn_t __init xen_colored_mfn(mfn_t mfn)
> > +{
> > +    unsigned int i, color =3D mfn_to_color(mfn);
> > +
> > +    for ( i =3D 0; i < xen_num_colors; i++ )
> > +    {
> > +        if ( color =3D=3D xen_colors[i] )
> > +            return mfn;
> > +        if ( color < xen_colors[i] )
> > +            return get_mfn_with_color(mfn, xen_colors[i]);
> > +    }
> > +
> > +    /* Jump to next color space (max_nr_colors mfns) and use the first=
 color */
> > +    return get_mfn_with_color(mfn_add(mfn, max_nr_colors), xen_colors[=
0]);
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-color=
ing.h
> > index 1216d1fbd4..30c8a1d9a6 100644
> > --- a/xen/include/xen/llc-coloring.h
> > +++ b/xen/include/xen/llc-coloring.h
> > @@ -8,6 +8,7 @@
> >  #ifndef __XEN_LLC_COLORING_H__
> >  #define __XEN_LLC_COLORING_H__
> >
> > +#include <xen/mm-frame.h>
> >  #include <xen/types.h>
> >
> >  struct domain;
> > @@ -30,6 +31,17 @@ static inline void domain_dump_llc_colors(const stru=
ct domain *d) {}
> >  static inline void domain_llc_coloring_free(struct domain *d) {}
> >  #endif
> >
> > +/**
> > + * Iterate over each Xen mfn in the colored space.
> > + * @start_mfn:  the first mfn that needs to be colored.
> > + * @mfn:        the current mfn.
> > + * @i:          loop index.
> > + */
> > +#define for_each_xen_colored_mfn(start_mfn, mfn, i) \
> > +    for ( i =3D 0, mfn =3D xen_colored_mfn(start_mfn);  \
> Here and elsewhere you need to enclose 'i' in paranthesis. Otherwise ECLA=
IR will report 20.7 violation.
>
> > +          i < (_end - _start) >> PAGE_SHIFT;        \
> > +          i++, mfn =3D xen_colored_mfn(mfn_add(mfn, 1)) )
> > +
> >  unsigned int get_llc_way_size(void);
> >  void arch_llc_coloring_init(void);
> >  int dom0_set_llc_colors(struct domain *d);
> > @@ -38,6 +50,7 @@ int domain_set_llc_colors(struct domain *d,
> >  int domain_set_llc_colors_from_str(struct domain *d, const char *str);
> >  unsigned int page_to_llc_color(const struct page_info *pg);
> >  unsigned int get_max_nr_llc_colors(void);
> > +mfn_t xen_colored_mfn(mfn_t mfn);
> >
> >  #endif /* __XEN_LLC_COLORING_H__ */
> >
> > --
> > 2.43.0
> >
>
> ~Michal
>

Thanks.

- Carlo


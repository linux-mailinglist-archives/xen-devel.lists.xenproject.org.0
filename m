Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05AD82D6F3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 11:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667270.1038363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJwX-000517-NY; Mon, 15 Jan 2024 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667270.1038363; Mon, 15 Jan 2024 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJwX-0004zH-Kb; Mon, 15 Jan 2024 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 667270;
 Mon, 15 Jan 2024 10:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyhf=IZ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPJwV-0004z9-Le
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 10:11:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a636c4-b38e-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 11:11:40 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a27733ae1dfso980166866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 02:11:40 -0800 (PST)
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
X-Inumbo-ID: 79a636c4-b38e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705313500; x=1705918300; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG9RdoTI1Fev2PV47zxkZTvtWxfXbDkghecJCYioV3I=;
        b=sNJpkU0I+kfsqgUMbZMT+p35gayPeqmbQ0RE1PYYChK3bW53gHhh8RwpdIQ/XBaPtS
         PJG78gfLyl/07sygOUEJZYnoe2q2U6Fh3lL8wqxxuuC02D3GK2vJQOLgUqC894jFsG48
         ugUpJl3kQf5u6BE2i6aBC9tchsBqQ6pS0h3vjCOUd9aJZVCwr33PY04UCrUiJyuvR9cW
         7IXgrlXIrjk/QOmkV6BuSVbskFdpWbw2bbFt0RcNdAvEKJFHVgp6vt746Sf2xcnNHg9D
         B4yVH1M+06mM+cYda71GlrSX+KdCzYqM6BWnl73WsJX/AFnhrki6Q9JMGqm0LKlhQyc9
         hIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313500; x=1705918300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG9RdoTI1Fev2PV47zxkZTvtWxfXbDkghecJCYioV3I=;
        b=rszykZr4jszpelr3xFEAyyjHsNoRLkKGBcI8Ux3Zk4HoMYGdU4ITBfsPe+8kuEGARl
         5ARqQ7AbN4zkIHHF/V+I5HMJl6Aheaj9r8dEUDPjyxsODN5pxNrn5PG2SR7Ss/IrVQMd
         5kAfBT/unsUwjWG2OdHfQoDHCPGNne+Zyxsrq6OjlUxIlQzTBs14NvuC+pzA0sNWHBgd
         45chLAAQ5YDzrD+vbilbjvmuhiZ8a/eLKQ1wraiLyqE5JHtmkISd3HowykFKYTNja24s
         RkSgsl+mF6gBI5nYS8C+wC4Vq8tPGhMKy0VZm+NEu4HzhzHDEl3ejIUXA9hqTjW85wXn
         Kuzg==
X-Gm-Message-State: AOJu0YwKxsY+xOZniLQCDqbyQTy736VqlnACB8Kj+lAe/3PyDnH/YZB9
	TLbSH79U4JV4Iyx0ifA4goJZ37sxe2CWvSbRiX59CLHhdnHb7g==
X-Google-Smtp-Source: AGHT+IEadYTbKRcOMFVcN3W+PSx+6uFCbYpOFoITXqgO0V2j57ssybREU5x35ZjykoxndF+b+/0vVbEp1EYc5hcFYPA=
X-Received: by 2002:a17:906:7d4f:b0:a2a:3d65:effa with SMTP id
 l15-20020a1709067d4f00b00a2a3d65effamr1170203ejp.104.1705313499829; Mon, 15
 Jan 2024 02:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech> <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
 <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com> <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org>
In-Reply-To: <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 15 Jan 2024 11:11:28 +0100
Message-ID: <CAG+AhRXUPvKGu-y9qbVmhc0_ThCdxFvG=BYwCQMBH=mjo45qHw@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sun, Jan 14, 2024 at 8:22=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Carlo,
>
> On 13/01/2024 17:07, Carlo Nonato wrote:
> >>> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> >>> index 37b6d230ad..66b674eeab 100644
> >>> --- a/xen/arch/arm/mmu/setup.c
> >>> +++ b/xen/arch/arm/mmu/setup.c
> >>> @@ -7,6 +7,7 @@
> >>>
> >>>    #include <xen/init.h>
> >>>    #include <xen/libfdt/libfdt.h>
> >>> +#include <xen/llc-coloring.h>
> >>>    #include <xen/sizes.h>
> >>>    #include <xen/vmap.h>
> >>>
> >>> @@ -39,6 +40,10 @@ DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> >>>    static DEFINE_PAGE_TABLE(cpu0_pgtable);
> >>>    #endif
> >>>
> >>> +#ifdef CONFIG_LLC_COLORING
> >>> +static DEFINE_PAGE_TABLE(xen_colored_temp);
> >>> +#endif
> >>
> >> Does this actually need to be static?
> >
> > Why it shouldn't be static? I don't want to access it from another file=
.
>
> My question was whether this could be allocated dynamically (or possibly
> re-use an existing set of page tables). In particular with the fact that
> we will need more than 1 page to cover the whole Xen binary.
>
> Looking at the use xen_colored_temp. This is pretty much the same as
> xen_map[i] but with different permissions. So what you could do is
> preparing xen_map[i] with very permissive permissions (i.e. RWX) and
> then enforcing the permission once the TTBR has been switched.
>
> Something like that (tested without cache coloring):
>
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index a3a263a5d94b..f7ac5cabf92c 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -306,7 +306,11 @@ void __init setup_pagetables(unsigned long
> boot_phys_offset, paddr_t xen_paddr)
>       p[0].pt.table =3D 1;
>       p[0].pt.xn =3D 0;
>
> -    /* Break up the Xen mapping into pages and protect them separately. =
*/
> +    /*
> +     * Break up the Xen mapping into pages. We will protect the
> +     * permissions later in order to allow xen_xenmap to be used for
> +     * when relocating Xen.
> +     */
>       for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
>       {
>           vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> @@ -315,13 +319,7 @@ void __init setup_pagetables(unsigned long
> boot_phys_offset, paddr_t xen_paddr)
>               break;
>           pte =3D pte_of_xenaddr(va);
>           pte.pt.table =3D 1; /* third level mappings always have this bi=
t
> set */
> -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> -        {
> -            pte.pt.xn =3D 0;
> -            pte.pt.ro =3D 1;
> -        }
> -        if ( is_kernel_rodata(va) )
> -            pte.pt.ro =3D 1;
> +        pte.pt.xn =3D 0; /* Permissions will be enforced later. Allow
> execution */
>           xen_xenmap[i] =3D pte;
>       }
>
> @@ -352,6 +350,37 @@ void __init setup_pagetables(unsigned long
> boot_phys_offset, paddr_t xen_paddr)
>
>       switch_ttbr(ttbr);
>
> +    /* Protect Xen */
> +    for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
> +    {
> +        vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> +        lpae_t *entry =3D xen_xenmap + i;
> +
> +        if ( !is_kernel(va) )
> +            break;
> +
> +        pte =3D read_atomic(entry);
> +
> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> +        {
> +            pte.pt.xn =3D 0;
> +            pte.pt.ro =3D 1;
> +        } else if ( is_kernel_rodata(va) ) {
> +            pte.pt.ro =3D 1;
> +            pte.pt.xn =3D 1;
> +        } else {
> +            pte.pt.xn =3D 1;
> +            pte.pt.ro =3D 0;
> +        }
> +
> +        write_pte(entry, pte);
> +    }
> +
> +    /*
> +     * We modified live page-tables. Ensure the TBLs are invalidated
> +     * before setting enforcing the WnX permissions.
> +     */
> +    flush_xen_tlb_local();
>       xen_pt_enforce_wnx();
>
>   #ifdef CONFIG_ARM_32

I understand what you're talking about, and it seems reasonable to get rid =
of
xen_colored_temp[] and create_llc_coloring_mappings() since in the end they
serve the purpose of mapping the physically colored space that is already
mapped using xen_xenmap[] pagetables.
What I don't understand is then how to copy/relocate Xen since I don't have=
 a
destination virtual space anymore to use in relocate_xen().

> >
> >> And if yes, then is it necessary
> >> to be kept the boot as completed?
> >
> > Nope. __initdata?
>
> Yes.
>
> [...]
>
> >> It feels wrong to keep the full Xen (even temporarily) just for CPU
> >> bring-up. But I don't think this is necessary. The secondary CPUs
> >> outside of code in head.S, secondary CPU should only need to access to
> >> init_ttbr and smp_cpu_up.
> >>
> >> The last one is already questionable because the CPU should never wait
> >> in Xen. Instead they would be held somewhere else. But that's separate
> >> issue.
> >>
> >> Anyway, if you move init_ttbr and smp_cpu_up in the identity mapped
> >> area, then you will not need to copy of Xen. Instead, secondary CPUs
> >> should be able to jump to the new Xen directly.
> >
> > So to recap:
> >
> > 1) How to move variables in the identity map area?
> > __attribute__((section(".text.idmap"))) triggers some warning when asse=
mbling.
> >
> > Warning: setting incorrect section attributes for .text.idmap
> >
> > 2) If I'm not mistaken the identity mapping is read only (PAGE_HYPERVIS=
OR_RX)
> > and forcing it to be PAGE_HYPERVISOR_RW breaks something else.
> The warning above has nothing to do with the attributes used in the
> page-tables. It is telling you have multiple .text.idmap section with
> different attributes.
>
> There are a couple of ways to solve it:
>     1. Define init_ttbr in head.S
>     2. Use a different section (e.g. .data.idmap) and add it in the linke=
r.

First one seems the easiest.

> Note that this means the init_ttbr cannot be written directly. But you
> can solve this problem by re-mapping the address.

How to remap a single address?
And if moving init_ttbr in the identity-mapped area means that it's no long=
er
writable, so that I need to remap it, why moving it in that area in the fir=
st
place. Again I think I'm missing something.

> >
> > 3) To access the identity mapping area I would need some accessor that =
takes
> > an address and returns it + phys_offset, or is there a better way to do=
 it?
>
> I am not sure I understand what you mean. Can you clarify?

In my idea, I would use the identity mapping to access the "old" variables,
where "old" means non physically colored. init_ttbr is an example. When
Xen it's copied on the new physical space, init_ttbr is copied with it and
if the boot cpu modifies this variable, it's actually touching the colored
one and not the old one. This means that secondary CPUs that still haven't
jumped to the new space, won't be able to see the new value and will never
go online.
So to access this "old" init_ttbr variable I need it's identity address,
which is its current virtual address + some physical offset. I was asking
you if this is the right approach to use the identity mapping.

> >
> > 4) Maybe I misinterpreted the above comment, but I would still need to =
copy
> > Xen in the physically colored space. What I can drop is the temporary v=
irtual
> > space used to access the "old" variables.
>
> Correct.
>
> >
> > 5) The identity mapping at runtime, at the moment, is pointing to the n=
ew
> > colored space because of how pte_of_xenaddr is implemented. This means =
that if
> > I want to use it to access the old variables, I would need to keep it a=
 real
> > identity mapping, right?
>
> Why would you need to access the old variables?

I hope the above comment is clear enough to answer this point.

> >> This will also avoid to spread cache coloring changes in every Xen
> >> components.
> >
> > Maybe I'm missing something, but even with this identity mapping "short=
cut" I
> > would still need to touch the same amount of files, for example when in=
it_ttbr
> > or smp_up_cpu are accessed, they would need to use identity virtual add=
resses.
>
> My point was not related to the amount of files you are touching. But
> the number of ...
>
> >
> >>> +    if ( llc_coloring_enabled )
>
> ... if ( llc_coloring_enabled ) you sprinkle in Xen. I would really like
> to reduce to the strict minimum. Also...
>
> [...]
>
> >>> @@ -751,8 +899,13 @@ void asmlinkage __init start_xen(unsigned long b=
oot_phys_offset,
> >>>        {
> >>>            if ( !llc_coloring_init() )
> >>>                panic("Xen LLC coloring support: setup failed\n");
> >>> +        xen_bootmodule->size =3D xen_colored_map_size(_end - _start)=
;
> >>> +        xen_bootmodule->start =3D get_xen_paddr(xen_bootmodule->size=
);
> >>
> >> As you update xen_bootmodule, wouldn't this mean that the non-relocate=
d >> Xen would could be passed to the bootallocator?
>
> ... as I wrote ealier your current approach seems to have a flaw. As you
> overwrite xen_bootmodule->{start, size}. setup_mm() will end up to add
> the old Xen region to the boot allocator. This is before any secondary
> CPUs are booted up.
>
> IOW, the allocator may provide some memory from the old Xen and nothing
> good will happen from that.
>
> The only way to solve it is to add another module. So the memory is
> skipped by setup_mm(). However see below.
>
> >
> > Yes that should be memory that in the end would not be needed so it mus=
t
> > return to the boot-allocator (if that's what you mean). But how to do
> > that?
>
> You can't really discard the old temporary Xen. This may work today
> because we don't support CPU hotplug or suspend/resume. But there was
> some series on the ML to enable it and I don't see any reason why
> someone would not want to use the features with cache coloring.
>
> So the old temporary Xen would have to be kept around forever. This is
> up to 8MB of memory wasted.
>
> The right approach is to have the secondary CPU boot code (including the
> variables it is using) fitting in the same page (or possibly multiple so
> long this is small and physically contiguous). With that it doesn't
> matter where is the trampoline, it could stay at the old place, but we
> would only waste a few pages rather than up 8MB as it is today.

So what are you suggesting is to create a new section in the linker script
for the trampoline code and data, then in setup_mm() we would skip this
memory? Am I following you correctly? Sorry those topics are a little out
of my preparation as you probably already guessed.

> Cheers,
>
> --
> Julien Grall

Thanks.


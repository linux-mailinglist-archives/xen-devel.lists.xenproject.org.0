Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520382DC8B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667488.1038802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP8D-0001Jb-Ck; Mon, 15 Jan 2024 15:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667488.1038802; Mon, 15 Jan 2024 15:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP8D-0001HB-9T; Mon, 15 Jan 2024 15:44:09 +0000
Received: by outflank-mailman (input) for mailman id 667488;
 Mon, 15 Jan 2024 15:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyhf=IZ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rPP8B-0001H3-Ks
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:44:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9bdf737-b3bc-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:44:05 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2e0be86878so117204266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:44:05 -0800 (PST)
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
X-Inumbo-ID: e9bdf737-b3bc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1705333445; x=1705938245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ+Dh41xEK+vcsGhMgIJAiumhJP32vBNNcJ2LshoHds=;
        b=zypFcJJnfFEF4KRuyJoCEi3xBVS9ZlRudXraYqsop/iix5ZGuyraMklDTUr6rX8S1I
         3UbUgt4sEhn8YfwS21VfauO8vXj0M2T/ID+tYqSQ6m66QwHVNG9izgKgR4IcmSp8K2Bp
         qw4nXqqslukHHsy0/+/HWFnpt+WPKCDwpW1j/98x2RkQfu8casw/HzyopTR/I9JlzV4B
         vtvu8GNl5AoPfSpg6biEj3obDFsSacFTKT4IcOIy3O2mnSTHpIrr24t0GF+7TbCdTpJm
         DLJJGsvrutdt2oAqCFWEbU9CNNMG/cPqmbOS6M5dKAb/sgHzQ1wz5LRPcA1/hAMchH0S
         jYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333445; x=1705938245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ+Dh41xEK+vcsGhMgIJAiumhJP32vBNNcJ2LshoHds=;
        b=LL2fgyDWLRP5aEB5DjDt7WYpkjPyRvRFjcn1qv50hURqUqIMvZY4Rt7avBhG5MSXqK
         7ZJBMRvnZyy4CZ7qIWDhRgat7rdZgjpSoO9k2u9RW4HhktbdI5YZiwi48eEtzi22ANaX
         nKv+8qDWU/jh1LW6a3giQg/Czc7211B/z+OFCnF1BWyDCSPCukYvhsNqgomamuN+8/Ra
         7bwK6g/35KsyHnoCR4cVeOvAFtvKM0K8d9SUqG5Bf9F2ZfdI7Ag6qKk1iXExG5x/Oy2k
         G/BO/IkfBfDmkovsBykS8Gv0BintsWzH4HYfXo6zlMtIKBw4eItmyxz2DeYaKwzX2LUF
         jN/w==
X-Gm-Message-State: AOJu0YwH6fmYgBkqR9IJx4d5b6MMjul6Po8S/r+ZVUmqQDKwIaKBxyYW
	Igm/cje+xHh/vPFxNk5dURzcfTElNQO1EvD67X3V+8WOz98j/w==
X-Google-Smtp-Source: AGHT+IGGNWC1+U10KVr9pKZWsn2JpWeDFE6AmhU7Y9/ohshiSkoC2gufp1FzgZ3Jx+uQ1NQ1JxRyZCr11pi4CStPimk=
X-Received: by 2002:a17:906:bc89:b0:a2d:4474:8fc1 with SMTP id
 lv9-20020a170906bc8900b00a2d44748fc1mr3349121ejb.50.1705333444662; Mon, 15
 Jan 2024 07:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech> <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
 <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com>
 <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org> <CAG+AhRXUPvKGu-y9qbVmhc0_ThCdxFvG=BYwCQMBH=mjo45qHw@mail.gmail.com>
 <985e1a2a-45eb-496c-8043-5f0c3c9f7766@xen.org>
In-Reply-To: <985e1a2a-45eb-496c-8043-5f0c3c9f7766@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 15 Jan 2024 16:43:53 +0100
Message-ID: <CAG+AhRVKbM-n8ieg-CMbRG-4RgUXMSZL=ZER8EAWvGJgpEzUwA@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Jan 15, 2024 at 12:18=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
> On 15/01/2024 10:11, Carlo Nonato wrote:
> > Hi Julien,
>
> Hi Carlo,
>
> > On Sun, Jan 14, 2024 at 8:22=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi Carlo,
> >>
> >> On 13/01/2024 17:07, Carlo Nonato wrote:
> >>>>> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> >>>>> index 37b6d230ad..66b674eeab 100644
> >>>>> --- a/xen/arch/arm/mmu/setup.c
> >>>>> +++ b/xen/arch/arm/mmu/setup.c
> >>>>> @@ -7,6 +7,7 @@
> >>>>>
> >>>>>     #include <xen/init.h>
> >>>>>     #include <xen/libfdt/libfdt.h>
> >>>>> +#include <xen/llc-coloring.h>
> >>>>>     #include <xen/sizes.h>
> >>>>>     #include <xen/vmap.h>
> >>>>>
> >>>>> @@ -39,6 +40,10 @@ DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> >>>>>     static DEFINE_PAGE_TABLE(cpu0_pgtable);
> >>>>>     #endif
> >>>>>
> >>>>> +#ifdef CONFIG_LLC_COLORING
> >>>>> +static DEFINE_PAGE_TABLE(xen_colored_temp);
> >>>>> +#endif
> >>>>
> >>>> Does this actually need to be static?
> >>>
> >>> Why it shouldn't be static? I don't want to access it from another fi=
le.
> >>
> >> My question was whether this could be allocated dynamically (or possib=
ly
> >> re-use an existing set of page tables). In particular with the fact th=
at
> >> we will need more than 1 page to cover the whole Xen binary.
> >>
> >> Looking at the use xen_colored_temp. This is pretty much the same as
> >> xen_map[i] but with different permissions. So what you could do is
> >> preparing xen_map[i] with very permissive permissions (i.e. RWX) and
> >> then enforcing the permission once the TTBR has been switched.
> >>
> >> Something like that (tested without cache coloring):
> >>
> >> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> >> index a3a263a5d94b..f7ac5cabf92c 100644
> >> --- a/xen/arch/arm/mmu/setup.c
> >> +++ b/xen/arch/arm/mmu/setup.c
> >> @@ -306,7 +306,11 @@ void __init setup_pagetables(unsigned long
> >> boot_phys_offset, paddr_t xen_paddr)
> >>        p[0].pt.table =3D 1;
> >>        p[0].pt.xn =3D 0;
> >>
> >> -    /* Break up the Xen mapping into pages and protect them separatel=
y. */
> >> +    /*
> >> +     * Break up the Xen mapping into pages. We will protect the
> >> +     * permissions later in order to allow xen_xenmap to be used for
> >> +     * when relocating Xen.
> >> +     */
> >>        for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
> >>        {
> >>            vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> >> @@ -315,13 +319,7 @@ void __init setup_pagetables(unsigned long
> >> boot_phys_offset, paddr_t xen_paddr)
> >>                break;
> >>            pte =3D pte_of_xenaddr(va);
> >>            pte.pt.table =3D 1; /* third level mappings always have thi=
s bit
> >> set */
> >> -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> >> -        {
> >> -            pte.pt.xn =3D 0;
> >> -            pte.pt.ro =3D 1;
> >> -        }
> >> -        if ( is_kernel_rodata(va) )
> >> -            pte.pt.ro =3D 1;
> >> +        pte.pt.xn =3D 0; /* Permissions will be enforced later. Allow
> >> execution */
> >>            xen_xenmap[i] =3D pte;
> >>        }
> >>
> >> @@ -352,6 +350,37 @@ void __init setup_pagetables(unsigned long
> >> boot_phys_offset, paddr_t xen_paddr)
> >>
> >>        switch_ttbr(ttbr);
> >>
> >> +    /* Protect Xen */
> >> +    for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
> >> +    {
> >> +        vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> >> +        lpae_t *entry =3D xen_xenmap + i;
> >> +
> >> +        if ( !is_kernel(va) )
> >> +            break;
> >> +
> >> +        pte =3D read_atomic(entry);
> >> +
> >> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> >> +        {
> >> +            pte.pt.xn =3D 0;
> >> +            pte.pt.ro =3D 1;
> >> +        } else if ( is_kernel_rodata(va) ) {
> >> +            pte.pt.ro =3D 1;
> >> +            pte.pt.xn =3D 1;
> >> +        } else {
> >> +            pte.pt.xn =3D 1;
> >> +            pte.pt.ro =3D 0;
> >> +        }
> >> +
> >> +        write_pte(entry, pte);
> >> +    }
> >> +
> >> +    /*
> >> +     * We modified live page-tables. Ensure the TBLs are invalidated
> >> +     * before setting enforcing the WnX permissions.
> >> +     */
> >> +    flush_xen_tlb_local();
> >>        xen_pt_enforce_wnx();
> >>
> >>    #ifdef CONFIG_ARM_32
> >
> > I understand what you're talking about, and it seems reasonable to get =
rid of
> > xen_colored_temp[] and create_llc_coloring_mappings() since in the end =
they
> > serve the purpose of mapping the physically colored space that is alrea=
dy
> > mapped using xen_xenmap[] pagetables.
> > What I don't understand is then how to copy/relocate Xen since I don't =
have a
> > destination virtual space anymore to use in relocate_xen().
>
> You will need to link xen_xenmap[] in boot_second[...] as well. With
> that, you will be able to access the new Xen through the temporary area.

Wouldn't it result in overwriting the current virtual space mapping?
boot_second is the live page table and if I link xen_xenmap[] then
XEN_VIRT_START would point to the new colored space which is still empty at
this stage...

> [...]
>
> >> Note that this means the init_ttbr cannot be written directly. But you
> >> can solve this problem by re-mapping the address.
> >
> > How to remap a single address?
>
> You should be able to use map_domain_page() to map the page where
> init_ttbr is.
>
> > And if moving init_ttbr in the identity-mapped area means that it's no =
longer
> > writable, so that I need to remap it, why moving it in that area in the=
 first
> > place. Again I think I'm missing something.
>
> The goal is to have everything used (code, data) before the MMU is
> turned on residing in a single page. So secondary CPUs can directly jump
> to the colored Xen without any trouble.

This is what confuses me. Why having everything on a single page makes
secondary cpus able to jump directly to colored Xen? (also see below)

> >>>
> >>> 3) To access the identity mapping area I would need some accessor tha=
t takes
> >>> an address and returns it + phys_offset, or is there a better way to =
do it?
> >>
> >> I am not sure I understand what you mean. Can you clarify?
> >
> > In my idea, I would use the identity mapping to access the "old" variab=
les,
> > where "old" means non physically colored. init_ttbr is an example. When
> > Xen it's copied on the new physical space, init_ttbr is copied with it =
and
> > if the boot cpu modifies this variable, it's actually touching the colo=
red
> > one and not the old one. This means that secondary CPUs that still have=
n't
> > jumped to the new space, won't be able to see the new value and will ne=
ver
> > go online.
> > So to access this "old" init_ttbr variable I need it's identity address=
,
> > which is its current virtual address + some physical offset. I was aski=
ng
> > you if this is the right approach to use the identity mapping.
>
> Secondary CPUs would directly start on the colored Xen. So they will be
> able to access the "new" init_ttbr & co.

How can this be true? I mean, in call_psci_cpu_on() I can start those CPUs =
in
the colored space, but they still use the boot_* pagetables and there I can=
't
easily link the new colored space, or, at least, I'm not succeding in doing
that. What I tried at the moment is to link xen_xenmap in boot_second after
switch_ttbr because of the problem I described above. But then secondary
CPUs never go online...

> [...]
>
> >> ... as I wrote ealier your current approach seems to have a flaw. As y=
ou
> >> overwrite xen_bootmodule->{start, size}. setup_mm() will end up to add
> >> the old Xen region to the boot allocator. This is before any secondary
> >> CPUs are booted up.
> >>
> >> IOW, the allocator may provide some memory from the old Xen and nothin=
g
> >> good will happen from that.
> >>
> >> The only way to solve it is to add another module. So the memory is
> >> skipped by setup_mm(). However see below.
> >>
> >>>
> >>> Yes that should be memory that in the end would not be needed so it m=
ust
> >>> return to the boot-allocator (if that's what you mean). But how to do
> >>> that?
> >>
> >> You can't really discard the old temporary Xen. This may work today
> >> because we don't support CPU hotplug or suspend/resume. But there was
> >> some series on the ML to enable it and I don't see any reason why
> >> someone would not want to use the features with cache coloring.
> >>
> >> So the old temporary Xen would have to be kept around forever. This is
> >> up to 8MB of memory wasted.
> >>
> >> The right approach is to have the secondary CPU boot code (including t=
he
> >> variables it is using) fitting in the same page (or possibly multiple =
so
> >> long this is small and physically contiguous). With that it doesn't
> >> matter where is the trampoline, it could stay at the old place, but we
> >> would only waste a few pages rather than up 8MB as it is today.
> >
> > So what are you suggesting is to create a new section in the linker scr=
ipt
> > for the trampoline code and data,
>
> We already have a section for that in place (see .idmap.*) which happens
> to be at the beginning of Xen. Right now, the section is in text. Which
> is why it is read-only executable.
>
> > then in setup_mm() we would skip this
> > memory?
>
> We should not need this. Secondary boot CPUs should boot direclty on the
> colored Xen.
>
> > Am I following you correctly? Sorry those topics are a little out
> > of my preparation as you probably already guessed.
>
> No worries. I am happy to go in as much details as necessary. I can also
> attempt to write a patch if that helps. (unless someone else in the Arm
> maintainers want to give a try).

Yes this would help. Thanks.

>
> Cheers,
>
> --
> Julien Grall


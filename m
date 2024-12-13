Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9739F0963
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 11:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856526.1269118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2sV-0004mb-JB; Fri, 13 Dec 2024 10:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856526.1269118; Fri, 13 Dec 2024 10:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM2sV-0004kl-FW; Fri, 13 Dec 2024 10:26:35 +0000
Received: by outflank-mailman (input) for mailman id 856526;
 Fri, 13 Dec 2024 10:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM2sT-0004kf-M2
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 10:26:33 +0000
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7e5b6ad-b93c-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 11:26:31 +0100 (CET)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844dae6a0caso48270539f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 02:26:31 -0800 (PST)
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
X-Inumbo-ID: b7e5b6ad-b93c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734085590; x=1734690390; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8Eo/2gPJP+l6AJHessDc20pqM3OY/WBTn7AI4vDpj8=;
        b=us6vVBn40Nsd6PIuh9D+uO76uMHF4v6KfgAGIep0Xf1BGQ/elJbtYpEcNDky+02F0X
         weypT3bq91dqH3WtkoLMy9HpsiTSF75lVN5VHrZIwvnWqhDK/gZCGh9C+Fz51pULxbUb
         TBQvaj1rcpKTHK8sdlWBd3T2CdS7ZMwgvSxai/8yA388dh/t1FbSWLY0GtAUdZ/49kW6
         S4xHHKxOSRmtz8aGUqDumQh2gWvxzhJ/Wq236mmhyBQSAd3Jz4Wc0PrfL0O+pX9pvz21
         /xLD0ATC3abnkZwK6M4alGiXuBvFhoEGLcrnz41MfisCf+DM/OYUkcDaeHr0hutwhceY
         AQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085590; x=1734690390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8Eo/2gPJP+l6AJHessDc20pqM3OY/WBTn7AI4vDpj8=;
        b=tjfsSQhdbEV+Vr2jd5w3FjzSk3ZJGZfaKv+w2WW6Pmg2Sq0fW1C4zl60NYibzYcTBm
         rmo7up+UYcoKbHW8Hyv+my4p5cIxDun0V4ceCaTurfToUvG1ygZn2xbCslphLSL9CToT
         Gsiwp5e4pXvvvnMf54LgO+8uoXJiZAaRBN1LK1wRErYJ6Cokj8KbA1Nw8fuz1XdqNAWQ
         CDjPTfklRjUtTKAtX/CWvJsg4OSZixUUVKvKX+i9MtL72UvPklnNAyGUISpjO1hgmJdY
         5T6lzqZ9QBhpq1MWm9M5qYSN5vfjSx9KMZ37qg9kCZQIIpONJsYC1Lh0w4dUjGVgJqV0
         Is8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0iY/TX6YXsf6ve2hQCpmLUZT9ZO0WdQ5kXF9FakgqCM2aWQ6xYv6bCA2o3H45ZDNPSrMyVH6uCew=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6no+NWzzkpo+HABtdGHAmEKwZAaCQ81VTuVl84KE8ULFfRRls
	o5lALrHtMh8pT8Pz7awfX4t2jTPzXftjiioWCHdmeikx4TRAwkfnRon8AoxQDlJPyu+ZcxkDbpW
	BeIGTq4VqYdK9IatQgQLJQe6GFzdLd4TWRi9/Zw==
X-Gm-Gg: ASbGnctueOX3xDFtZBnKAnvkeWKVjaLyqo0DBkK4DFnBWSM+vQ4mqKuoPA2pd5SrN/o
	5JvuId9vhdzcR6rCELDsrLkqkW4rdOxWcDMwx6Q==
X-Google-Smtp-Source: AGHT+IEFuq9kOTmslWolPGMKz/2LwQw4wp9Xsk3qe8bK1FzV/ygBZH3lqUF7P36KttGF8D/oPKDTjMLRvzVnAJWVgxg=
X-Received: by 2002:a05:6e02:1c4d:b0:3a7:7a68:44e2 with SMTP id
 e9e14a558f8ab-3aff243f5acmr22965785ab.15.1734085589979; Fri, 13 Dec 2024
 02:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org> <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech> <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
In-Reply-To: <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 13 Dec 2024 11:26:19 +0100
Message-ID: <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Fri, Dec 13, 2024 at 10:46=E2=80=AFAM Michal Orzel <michal.orzel@amd.com=
> wrote:
>
> Hi Carlo, Andrea,
>
> On 12/12/2024 19:22, Andrea Bastoni wrote:
> >
> >
> > On 12/12/2024 18:48, Carlo Nonato wrote:
> >> Hi,
> >>
> >> On Mon, Dec 9, 2024 at 8:17=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>>
> >>> Hi Michal,
> >>>
> >>> On 07/12/2024 15:04, Michal Orzel wrote:
> >>>>
> >>>>
> >>>> On 06/12/2024 19:37, Julien Grall wrote:
> >>>>>
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> Sorry for the late answer.
> >>>>>
> >>>>> On 05/12/2024 09:40, Michal Orzel wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 02/12/2024 17:59, Carlo Nonato wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> Cache coloring requires Dom0 not to be direct-mapped because of i=
ts non
> >>>>>>> contiguous mapping nature, so allocate_memory() is needed in this=
 case.
> >>>>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separ=
ate module")
> >>>>>>> moved allocate_memory() in dom0less_build.c. In order to use it
> >>>>>>> in Dom0 construction bring it back to domain_build.c and declare =
it in
> >>>>>>> domain_build.h.
> >>>>>>>
> >>>>>>> Take the opportunity to adapt the implementation of allocate_memo=
ry() so
> >>>>>>> that it uses the host layout when called on the hwdom, via
> >>>>>>> find_unallocated_memory().
> >>>>>>>
> >>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>>>>> ---
> >>>>>>> v11:
> >>>>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in al=
locate_memory()
> >>>>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> >>>>>>> - added a comment in allocate_memory() when skipping small banks
> >>>>>>> v10:
> >>>>>>> - fixed a compilation bug that happened when dom0less support was=
 disabled
> >>>>>>> v9:
> >>>>>>> - no changes
> >>>>>>> v8:
> >>>>>>> - patch adapted to new changes to allocate_memory()
> >>>>>>> v7:
> >>>>>>> - allocate_memory() now uses the host layout when called on the h=
wdom
> >>>>>>> v6:
> >>>>>>> - new patch
> >>>>>>> ---
> >>>>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
> >>>>>>>    xen/arch/arm/domain_build.c             | 97 +++++++++++++++++=
+++++++-
> >>>>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
> >>>>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0les=
s-build.c
> >>>>>>> index d93a85434e..67b1503647 100644
> >>>>>>> --- a/xen/arch/arm/dom0less-build.c
> >>>>>>> +++ b/xen/arch/arm/dom0less-build.c
> >>>>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
> >>>>>>>        return ( !dom0found && domUfound );
> >>>>>>>    }
> >>>>>>>
> >>>>>>> -static void __init allocate_memory(struct domain *d, struct kern=
el_info *kinfo)
> >>>>>>> -{
> >>>>>>> -    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>>>>> -    unsigned int i;
> >>>>>>> -    paddr_t bank_size;
> >>>>>>> -
> >>>>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for =
%pd:\n",
> >>>>>>> -           /* Don't want format this as PRIpaddr (16 digit hex) =
*/
> >>>>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>>>>> -
> >>>>>>> -    mem->nr_banks =3D 0;
> >>>>>>> -    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> >>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BA=
SE),
> >>>>>>> -                               bank_size) )
> >>>>>>> -        goto fail;
> >>>>>>> -
> >>>>>>> -    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> >>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BA=
SE),
> >>>>>>> -                               bank_size) )
> >>>>>>> -        goto fail;
> >>>>>>> -
> >>>>>>> -    if ( kinfo->unassigned_mem )
> >>>>>>> -        goto fail;
> >>>>>>> -
> >>>>>>> -    for( i =3D 0; i < mem->nr_banks; i++ )
> >>>>>>> -    {
> >>>>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpadd=
r" (%ldMB)\n",
> >>>>>>> -               d,
> >>>>>>> -               i,
> >>>>>>> -               mem->bank[i].start,
> >>>>>>> -               mem->bank[i].start + mem->bank[i].size,
> >>>>>>> -               /* Don't want format this as PRIpaddr (16 digit h=
ex) */
> >>>>>>> -               (unsigned long)(mem->bank[i].size >> 20));
> >>>>>>> -    }
> >>>>>>> -
> >>>>>>> -    return;
> >>>>>>> -
> >>>>>>> -fail:
> >>>>>>> -    panic("Failed to allocate requested domain memory."
> >>>>>>> -          /* Don't want format this as PRIpaddr (16 digit hex) *=
/
> >>>>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> >>>>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
> >>>>>>> -}
> >>>>>>> -
> >>>>>>>    #ifdef CONFIG_VGICV2
> >>>>>>>    static int __init make_gicv2_domU_node(struct kernel_info *kin=
fo)
> >>>>>>>    {
> >>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_bu=
ild.c
> >>>>>>> index 2c30792de8..2b8cba9b2f 100644
> >>>>>>> --- a/xen/arch/arm/domain_build.c
> >>>>>>> +++ b/xen/arch/arm/domain_build.c
> >>>>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct =
domain *d,
> >>>>>>>        }
> >>>>>>>    }
> >>>>>>>
> >>>>>>> -#ifdef CONFIG_DOM0LESS_BOOT
> >>>>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t =
tot_size,
> >>>>>>>                                        alloc_domheap_mem_cb cb, v=
oid *extra)
> >>>>>>>    {
> >>>>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kerne=
l_info *kinfo, gfn_t sgfn,
> >>>>>>>
> >>>>>>>        return true;
> >>>>>>>    }
> >>>>>>> -#endif
> >>>>>>>
> >>>>>>>    /*
> >>>>>>>     * When PCI passthrough is available we want to keep the
> >>>>>>> @@ -1003,6 +1001,94 @@ out:
> >>>>>>>        return res;
> >>>>>>>    }
> >>>>>>>
> >>>>>>> +void __init allocate_memory(struct domain *d, struct kernel_info=
 *kinfo)
> >>>>>>> +{
> >>>>>>> +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>>>>> +    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
> >>>>>>> +    paddr_t bank_start, bank_size;
> >>>>>> Limit the scope
> >>>>>>
> >>>>>>> +    struct membanks *hwdom_free_mem =3D NULL;
> >>>>>>> +    const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> >>>>>>> +    const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> >>>>>> Limit the scope
> >>>>>>
> >>>>>>> +
> >>>>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for =
%pd:\n",
> >>>>>>> +           /* Don't want format this as PRIpaddr (16 digit hex) =
*/
> >>>>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>>>>> +
> >>>>>>> +    mem->nr_banks =3D 0;
> >>>>>>> +    /*
> >>>>>>> +     * Use host memory layout for hwdom. Only case for this is w=
hen LLC coloring
> >>>>>>> +     * is enabled.
> >>>>>>> +     */
> >>>>>>> +    if ( is_hardware_domain(d) )
> >>>>>>> +    {
> >>>>>>> +        ASSERT(llc_coloring_enabled);
> >>>>>> This patch does not build because of declaration not being visible=
. You must include <xen/llc-coloring.h>.
> >>>>>
> >>>>> Piggying back on this comment. AFAICT, the code below would work al=
so in
> >>>>> the non cache coloring case. So what's the assert is for?
> >>>>>
> >>>>>>
> >>>>>>> +
> >>>>>>> +        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, =
bank,
> >>>>>>> +                                             NR_MEM_BANKS);
> >>>>>>> +        if ( !hwdom_free_mem )
> >>>>>>> +            goto fail;
> >>>>>>> +
> >>>>>>> +        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
> >>>>>>> +
> >>>>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
> >>>>>> My remarks for the use of find_unallocated_memory() 1:1 have not b=
een addressed. You did not even
> >>>>>> change the comments inside the function. The problem is that the f=
unction is specifically designed
> >>>>>> for finding extended regions and assumes being called at certain p=
oint i.e. dom0 RAM allocated, gnttab
> >>>>>> region allocated, etc.
> >>>>>
> >>>>> So I agree that the function should be updated if we plan to use it=
 for
> >>>>> other purpose.
> >>>>>
> >>>>> My opinion is that we should attempt to make the function generic s=
o
> >>>>> that in your
> >>>>>> case you can choose which regions to exclude, define even your own=
 function to grab free regions (at the moment
> >>>>>> add_ext_regions grabs banks >=3D 64M but you still discards banks =
>=3D 128M, so it's a bit wasteful.
> >>>>>>
> >>>>>> My very short attempt to make the function as generic as possible =
in the first iteration:
> >>>>>> https://paste.debian.net/1338334/
> >>>>>
> >>>>> This looks better, but I wonder why we need still need to exclude t=
he
> >>>>> static regions? Wouldn't it be sufficient to exclude just reserved =
regions?
> >>>> Static shared memory banks are not part of reserved memory (i.e. boo=
tinfo.reserved_mem) if that's what you're asking.
> >>>> They are stored in bootinfo.shmem, hence we need to take them into a=
ccount when searching for unused address space.
> >>>
> >>> Oh I missed the fact you now pass "mem_banks" as a parameter. I thoug=
ht
> >>> they would still get excluded for cache coloring case.
> >>>
> >>>>
> >>>> If you and Carlo are ok with my proposed solution for making the fun=
ction generic, I can send a patch as a prerequisite
> >>>> patch for Carlo series.
> >>>
> >>> I am fine with the approach.
> >>>
> >>> Cheers,
> >>>
> >>> --
> >>> Julien Grall
> >>>
> >>
> >>> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain=
 *d)
> >>>      /* type must be set before allocate_memory */
> >>>      d->arch.type =3D kinfo.type;
> >>>  #endif
> >>> -    allocate_memory_11(d, &kinfo);
> >>> +    if ( is_domain_direct_mapped(d) )
> >>> +        allocate_memory_11(d, &kinfo);
> >>> +    else
> >>> +        allocate_memory(d, &kinfo);
> >>>      find_gnttab_region(d, &kinfo);
> >>
> >> Since find_gnttab_region() is called after allocate_memory(), kinfo->g=
nttab_*
> >> fields aren't initialized and the call to find_unallocated_memory() wi=
th
> >> gnttab as the region to exclude, fails ending in a crash since memory =
for
> >> dom0 can't be allocated.
> >>
> >> Can the solution be to call find_gnttab_region() before the above if?
> >
> > The function is called find, but currently it only initializes kinfo->g=
nttab_start
> > and kinfo->gnttab_size and we tested that moving it before allocate_mem=
ory* doesn't
> > cause fallouts.
> >
> > If moving before allocate_memory*, would it be better to rename it e.g.=
, init_gnttab_region()?
> >
> > Thanks,
> > Andrea
> >
> >> Or should I just call it before allocate_memory() in one case, but sti=
ll after
> >> allocate_memory_11() in the other?
> >>
> >> Thanks.
> >
>
> AFAICT there is nothing stopping us from moving find_gnttab_region() befo=
re allocate_*. This function initializes
> gnttab region with PA of Xen. In normal case, because Xen is added as boo=
tmodule, it will never be mapped in dom0 memory map
> and the placement does not matter. In LLC case, it will point to relocate=
d address of Xen and it needs to be known before
> calling find_unallocated_memory. Don't rename it, leave as is, just move =
before allocate_*.
>
> @Carlo:
> My prerequisite patch has been merged, so you're good to respin a series =
(unless you wait for some feedback in which case do let me know).
> To prevent too many respins, you're going to call find_unallocated_memory=
 for LLC passing resmem and gnttab to be excluded. If you're going
> to reuse add_ext_regions, you need to rename it and fix comments to make =
it more generic. As for the size, the decision is yours. One solution
> would be to modify add_ext_regions to take min bank size as parameter (64=
MB for extended regions, X for LLC dom0). In your code, you write that
> the first bank must contain dom0, dtb, ramdisk and you chose 128MB. Howev=
er, looking at the code, you seem to discard banks < 128 for all the banks,
> not only for the first one. This is the part that I don't have a ready so=
lution. Maybe you could define your own add_free_region function and sort
> the banks, so that you take the largest possible bank first for dom0. Thi=
s could simplify things.

For the moment I added a __add_ext_regions() helper that also takes a skip_=
size
parameter. This is called by add_ext_regions() and by a new
add_hwdom_free_regions() callback used in allocate_memory().
I still use 128MB for all the banks. Do you think this is acceptable, maybe
with a FIXME comment cause we should skip only the first bank, or not?

> You can also ask others for opinion.
>
> We are approaching Dec 20th deadline, and I want this series to be in as =
it's been on the list for too many years. I'm willing to accept a sub-optim=
al solution
> (so far will be used only for LLC, and LLC as experimental feature will b=
e the only victim of not optimal algorithm) for now, and we can think of a =
better one
> after the release. But still, even the sub-optimal solution must make sen=
se.
>
> ~Michal
>

Thanks.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5C9F0B07
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 12:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856584.1269158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3sD-0007Gz-JT; Fri, 13 Dec 2024 11:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856584.1269158; Fri, 13 Dec 2024 11:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM3sD-0007Ek-GR; Fri, 13 Dec 2024 11:30:21 +0000
Received: by outflank-mailman (input) for mailman id 856584;
 Fri, 13 Dec 2024 11:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM3sB-0007Ee-VL
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 11:30:20 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06608ad-b945-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 12:30:17 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3ab2f414695so5255595ab.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 03:30:17 -0800 (PST)
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
X-Inumbo-ID: a06608ad-b945-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734089416; x=1734694216; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Skor99wtpWhnoGqVEyK458RiUEUsEy2xJ2n4H4KBoX4=;
        b=M5EsNAzR4LmUUSThLkWF9GAWp2hWvtmqH6Fqpd8T881xId29grmOL6K/VMUsRRJpX9
         FWlzQPkt1NPXfvbQvVEWmMwVoNrwCP0CrT675bdroQEU0QQnTQSEG83vCkuRuYFGMzfw
         EVwUXrUL7p8thXyWXXlLz7IeswYbHh9Uxagpxz9ESQo0Kwy7I5Evcd2aqcTKKCw0tyET
         z+0fD6SaA6PzJzXfRWmxa3AlC3eb7SSH31+W/dzBeBKeEj0h5mq/FLZi4jFjUxitJJnn
         Hhumhm+16QZcFn1vzhkHv9lR5ZCZ6jXoyC7cfhjLcILf9EDk9hscHZrEDmA+O2Z9H8UV
         4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089416; x=1734694216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Skor99wtpWhnoGqVEyK458RiUEUsEy2xJ2n4H4KBoX4=;
        b=iCvFy/kh7FJG2/zwygodVK9FXDEs5y1g0c5eCyyeZho7oJgI8qE3CtEXk0vsUCrQ5T
         pLjOa9iOcoN+7ftGGfT8UZRYo8WGaChnb0Fs9ieqd2TPV2OyXEBuBk06psH06UhKBo2J
         /1NU7gli52GbwktguNMASwcmke3AN8JSYG+/tgU+iBT32A/EAIP48mn6x6t9cMmBKf7m
         4/EoQhVD6cVgn1zKVg+SBgfkF+9xsxlIRT4FPFbXeosbHeV4/ofiK2ZpFHCjVGhXjqRM
         PujgBhobBIH/zCXeWMxLmT4dmC3plnWhKyBgdjH0Kr/hn/jVai1z5HRJ2kw214uFi2sw
         2tmA==
X-Forwarded-Encrypted: i=1; AJvYcCVwMe17KiAjGgiLsRbPeIXSKKiOlFpPlvjX7bMFMPOo5728YE4xFaxOFz3qge/8uNeQhDh5np/oUtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeV+zfncSDy+pvuV/5k1GxcNZpPPLDYvYWbiamMYNor8djzrov
	oXLZ3YhvhdHAjUvft/eOqFdTGcQUJ9r5+82qJzcLgZIFh6NPQL75sqYdbZTfHA3zyD9H0krNtE2
	wWW53kXVdrJgSWgdY4pT3lxPCngiicEznL4vzpU355suLBpkmhR7b5w==
X-Gm-Gg: ASbGncuCcAV6qosHSlkiwDLNuxitxmBCZ50iVC7Lr0HIEOXw/gc6M1atOY1BUPqdmAZ
	7TJFakcDmpjlT26TsN0jj2+XE78lqahWT5TiwfA==
X-Google-Smtp-Source: AGHT+IHmxHc6JXxNa+sbAFMjZ0da3wx+5KaBWKvazVK8XYBTB0UyLcMCrhIakEmL3lH4IZVE0z5uXynsT7O0kiZWAT8=
X-Received: by 2002:a05:6e02:1489:b0:3a3:b45b:fb92 with SMTP id
 e9e14a558f8ab-3aff2fbeacdmr25258775ab.23.1734089415898; Fri, 13 Dec 2024
 03:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org> <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
 <dbab9581-2059-4662-b684-163343b61d0d@minervasys.tech> <2f834c6b-c9fa-4b95-abff-b9bcb8c70246@amd.com>
 <CAG+AhRW0H7VSD3tzSydue1LPaT056metxQwUXPvQ+WO17KO67A@mail.gmail.com> <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com>
In-Reply-To: <6cb8c273-8e1d-4f34-adcc-620d4a71340c@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 13 Dec 2024 12:30:05 +0100
Message-ID: <CAG+AhRUFHH10daDvaqyhomCO6Yzyk4AUE_6E-53NmZU5auC9PQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrea Bastoni <andrea.bastoni@minervasys.tech>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 11:56=E2=80=AFAM Michal Orzel <michal.orzel@amd.com=
> wrote:
>
>
>
> On 13/12/2024 11:26, Carlo Nonato wrote:
> >
> >
> > Hi Michal,
> >
> > On Fri, Dec 13, 2024 at 10:46=E2=80=AFAM Michal Orzel <michal.orzel@amd=
.com> wrote:
> >>
> >> Hi Carlo, Andrea,
> >>
> >> On 12/12/2024 19:22, Andrea Bastoni wrote:
> >>>
> >>>
> >>> On 12/12/2024 18:48, Carlo Nonato wrote:
> >>>> Hi,
> >>>>
> >>>> On Mon, Dec 9, 2024 at 8:17=E2=80=AFPM Julien Grall <julien@xen.org>=
 wrote:
> >>>>>
> >>>>> Hi Michal,
> >>>>>
> >>>>> On 07/12/2024 15:04, Michal Orzel wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 06/12/2024 19:37, Julien Grall wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> Sorry for the late answer.
> >>>>>>>
> >>>>>>> On 05/12/2024 09:40, Michal Orzel wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 02/12/2024 17:59, Carlo Nonato wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Cache coloring requires Dom0 not to be direct-mapped because of=
 its non
> >>>>>>>>> contiguous mapping nature, so allocate_memory() is needed in th=
is case.
> >>>>>>>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a sep=
arate module")
> >>>>>>>>> moved allocate_memory() in dom0less_build.c. In order to use it
> >>>>>>>>> in Dom0 construction bring it back to domain_build.c and declar=
e it in
> >>>>>>>>> domain_build.h.
> >>>>>>>>>
> >>>>>>>>> Take the opportunity to adapt the implementation of allocate_me=
mory() so
> >>>>>>>>> that it uses the host layout when called on the hwdom, via
> >>>>>>>>> find_unallocated_memory().
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>>>>>>> ---
> >>>>>>>>> v11:
> >>>>>>>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in =
allocate_memory()
> >>>>>>>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> >>>>>>>>> - added a comment in allocate_memory() when skipping small bank=
s
> >>>>>>>>> v10:
> >>>>>>>>> - fixed a compilation bug that happened when dom0less support w=
as disabled
> >>>>>>>>> v9:
> >>>>>>>>> - no changes
> >>>>>>>>> v8:
> >>>>>>>>> - patch adapted to new changes to allocate_memory()
> >>>>>>>>> v7:
> >>>>>>>>> - allocate_memory() now uses the host layout when called on the=
 hwdom
> >>>>>>>>> v6:
> >>>>>>>>> - new patch
> >>>>>>>>> ---
> >>>>>>>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
> >>>>>>>>>    xen/arch/arm/domain_build.c             | 97 +++++++++++++++=
+++++++++-
> >>>>>>>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
> >>>>>>>>>    3 files changed, 94 insertions(+), 48 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0l=
ess-build.c
> >>>>>>>>> index d93a85434e..67b1503647 100644
> >>>>>>>>> --- a/xen/arch/arm/dom0less-build.c
> >>>>>>>>> +++ b/xen/arch/arm/dom0less-build.c
> >>>>>>>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
> >>>>>>>>>        return ( !dom0found && domUfound );
> >>>>>>>>>    }
> >>>>>>>>>
> >>>>>>>>> -static void __init allocate_memory(struct domain *d, struct ke=
rnel_info *kinfo)
> >>>>>>>>> -{
> >>>>>>>>> -    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>>>>>>> -    unsigned int i;
> >>>>>>>>> -    paddr_t bank_size;
> >>>>>>>>> -
> >>>>>>>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB fo=
r %pd:\n",
> >>>>>>>>> -           /* Don't want format this as PRIpaddr (16 digit hex=
) */
> >>>>>>>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>>>>>>> -
> >>>>>>>>> -    mem->nr_banks =3D 0;
> >>>>>>>>> -    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> >>>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_=
BASE),
> >>>>>>>>> -                               bank_size) )
> >>>>>>>>> -        goto fail;
> >>>>>>>>> -
> >>>>>>>>> -    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> >>>>>>>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_=
BASE),
> >>>>>>>>> -                               bank_size) )
> >>>>>>>>> -        goto fail;
> >>>>>>>>> -
> >>>>>>>>> -    if ( kinfo->unassigned_mem )
> >>>>>>>>> -        goto fail;
> >>>>>>>>> -
> >>>>>>>>> -    for( i =3D 0; i < mem->nr_banks; i++ )
> >>>>>>>>> -    {
> >>>>>>>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpa=
ddr" (%ldMB)\n",
> >>>>>>>>> -               d,
> >>>>>>>>> -               i,
> >>>>>>>>> -               mem->bank[i].start,
> >>>>>>>>> -               mem->bank[i].start + mem->bank[i].size,
> >>>>>>>>> -               /* Don't want format this as PRIpaddr (16 digit=
 hex) */
> >>>>>>>>> -               (unsigned long)(mem->bank[i].size >> 20));
> >>>>>>>>> -    }
> >>>>>>>>> -
> >>>>>>>>> -    return;
> >>>>>>>>> -
> >>>>>>>>> -fail:
> >>>>>>>>> -    panic("Failed to allocate requested domain memory."
> >>>>>>>>> -          /* Don't want format this as PRIpaddr (16 digit hex)=
 */
> >>>>>>>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> >>>>>>>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
> >>>>>>>>> -}
> >>>>>>>>> -
> >>>>>>>>>    #ifdef CONFIG_VGICV2
> >>>>>>>>>    static int __init make_gicv2_domU_node(struct kernel_info *k=
info)
> >>>>>>>>>    {
> >>>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_=
build.c
> >>>>>>>>> index 2c30792de8..2b8cba9b2f 100644
> >>>>>>>>> --- a/xen/arch/arm/domain_build.c
> >>>>>>>>> +++ b/xen/arch/arm/domain_build.c
> >>>>>>>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struc=
t domain *d,
> >>>>>>>>>        }
> >>>>>>>>>    }
> >>>>>>>>>
> >>>>>>>>> -#ifdef CONFIG_DOM0LESS_BOOT
> >>>>>>>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_=
t tot_size,
> >>>>>>>>>                                        alloc_domheap_mem_cb cb,=
 void *extra)
> >>>>>>>>>    {
> >>>>>>>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct ker=
nel_info *kinfo, gfn_t sgfn,
> >>>>>>>>>
> >>>>>>>>>        return true;
> >>>>>>>>>    }
> >>>>>>>>> -#endif
> >>>>>>>>>
> >>>>>>>>>    /*
> >>>>>>>>>     * When PCI passthrough is available we want to keep the
> >>>>>>>>> @@ -1003,6 +1001,94 @@ out:
> >>>>>>>>>        return res;
> >>>>>>>>>    }
> >>>>>>>>>
> >>>>>>>>> +void __init allocate_memory(struct domain *d, struct kernel_in=
fo *kinfo)
> >>>>>>>>> +{
> >>>>>>>>> +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>>>>>>> +    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
> >>>>>>>>> +    paddr_t bank_start, bank_size;
> >>>>>>>> Limit the scope
> >>>>>>>>
> >>>>>>>>> +    struct membanks *hwdom_free_mem =3D NULL;
> >>>>>>>>> +    const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> >>>>>>>>> +    const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> >>>>>>>> Limit the scope
> >>>>>>>>
> >>>>>>>>> +
> >>>>>>>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB fo=
r %pd:\n",
> >>>>>>>>> +           /* Don't want format this as PRIpaddr (16 digit hex=
) */
> >>>>>>>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>>>>>>> +
> >>>>>>>>> +    mem->nr_banks =3D 0;
> >>>>>>>>> +    /*
> >>>>>>>>> +     * Use host memory layout for hwdom. Only case for this is=
 when LLC coloring
> >>>>>>>>> +     * is enabled.
> >>>>>>>>> +     */
> >>>>>>>>> +    if ( is_hardware_domain(d) )
> >>>>>>>>> +    {
> >>>>>>>>> +        ASSERT(llc_coloring_enabled);
> >>>>>>>> This patch does not build because of declaration not being visib=
le. You must include <xen/llc-coloring.h>.
> >>>>>>>
> >>>>>>> Piggying back on this comment. AFAICT, the code below would work =
also in
> >>>>>>> the non cache coloring case. So what's the assert is for?
> >>>>>>>
> >>>>>>>>
> >>>>>>>>> +
> >>>>>>>>> +        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks=
, bank,
> >>>>>>>>> +                                             NR_MEM_BANKS);
> >>>>>>>>> +        if ( !hwdom_free_mem )
> >>>>>>>>> +            goto fail;
> >>>>>>>>> +
> >>>>>>>>> +        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
> >>>>>>>>> +
> >>>>>>>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
> >>>>>>>> My remarks for the use of find_unallocated_memory() 1:1 have not=
 been addressed. You did not even
> >>>>>>>> change the comments inside the function. The problem is that the=
 function is specifically designed
> >>>>>>>> for finding extended regions and assumes being called at certain=
 point i.e. dom0 RAM allocated, gnttab
> >>>>>>>> region allocated, etc.
> >>>>>>>
> >>>>>>> So I agree that the function should be updated if we plan to use =
it for
> >>>>>>> other purpose.
> >>>>>>>
> >>>>>>> My opinion is that we should attempt to make the function generic=
 so
> >>>>>>> that in your
> >>>>>>>> case you can choose which regions to exclude, define even your o=
wn function to grab free regions (at the moment
> >>>>>>>> add_ext_regions grabs banks >=3D 64M but you still discards bank=
s >=3D 128M, so it's a bit wasteful.
> >>>>>>>>
> >>>>>>>> My very short attempt to make the function as generic as possibl=
e in the first iteration:
> >>>>>>>> https://paste.debian.net/1338334/
> >>>>>>>
> >>>>>>> This looks better, but I wonder why we need still need to exclude=
 the
> >>>>>>> static regions? Wouldn't it be sufficient to exclude just reserve=
d regions?
> >>>>>> Static shared memory banks are not part of reserved memory (i.e. b=
ootinfo.reserved_mem) if that's what you're asking.
> >>>>>> They are stored in bootinfo.shmem, hence we need to take them into=
 account when searching for unused address space.
> >>>>>
> >>>>> Oh I missed the fact you now pass "mem_banks" as a parameter. I tho=
ught
> >>>>> they would still get excluded for cache coloring case.
> >>>>>
> >>>>>>
> >>>>>> If you and Carlo are ok with my proposed solution for making the f=
unction generic, I can send a patch as a prerequisite
> >>>>>> patch for Carlo series.
> >>>>>
> >>>>> I am fine with the approach.
> >>>>>
> >>>>> Cheers,
> >>>>>
> >>>>> --
> >>>>> Julien Grall
> >>>>>
> >>>>
> >>>>> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct doma=
in *d)
> >>>>>      /* type must be set before allocate_memory */
> >>>>>      d->arch.type =3D kinfo.type;
> >>>>>  #endif
> >>>>> -    allocate_memory_11(d, &kinfo);
> >>>>> +    if ( is_domain_direct_mapped(d) )
> >>>>> +        allocate_memory_11(d, &kinfo);
> >>>>> +    else
> >>>>> +        allocate_memory(d, &kinfo);
> >>>>>      find_gnttab_region(d, &kinfo);
> >>>>
> >>>> Since find_gnttab_region() is called after allocate_memory(), kinfo-=
>gnttab_*
> >>>> fields aren't initialized and the call to find_unallocated_memory() =
with
> >>>> gnttab as the region to exclude, fails ending in a crash since memor=
y for
> >>>> dom0 can't be allocated.
> >>>>
> >>>> Can the solution be to call find_gnttab_region() before the above if=
?
> >>>
> >>> The function is called find, but currently it only initializes kinfo-=
>gnttab_start
> >>> and kinfo->gnttab_size and we tested that moving it before allocate_m=
emory* doesn't
> >>> cause fallouts.
> >>>
> >>> If moving before allocate_memory*, would it be better to rename it e.=
g., init_gnttab_region()?
> >>>
> >>> Thanks,
> >>> Andrea
> >>>
> >>>> Or should I just call it before allocate_memory() in one case, but s=
till after
> >>>> allocate_memory_11() in the other?
> >>>>
> >>>> Thanks.
> >>>
> >>
> >> AFAICT there is nothing stopping us from moving find_gnttab_region() b=
efore allocate_*. This function initializes
> >> gnttab region with PA of Xen. In normal case, because Xen is added as =
bootmodule, it will never be mapped in dom0 memory map
> >> and the placement does not matter. In LLC case, it will point to reloc=
ated address of Xen and it needs to be known before
> >> calling find_unallocated_memory. Don't rename it, leave as is, just mo=
ve before allocate_*.
> >>
> >> @Carlo:
> >> My prerequisite patch has been merged, so you're good to respin a seri=
es (unless you wait for some feedback in which case do let me know).
> >> To prevent too many respins, you're going to call find_unallocated_mem=
ory for LLC passing resmem and gnttab to be excluded. If you're going
> >> to reuse add_ext_regions, you need to rename it and fix comments to ma=
ke it more generic. As for the size, the decision is yours. One solution
> >> would be to modify add_ext_regions to take min bank size as parameter =
(64MB for extended regions, X for LLC dom0). In your code, you write that
> >> the first bank must contain dom0, dtb, ramdisk and you chose 128MB. Ho=
wever, looking at the code, you seem to discard banks < 128 for all the ban=
ks,
> >> not only for the first one. This is the part that I don't have a ready=
 solution. Maybe you could define your own add_free_region function and sor=
t
> >> the banks, so that you take the largest possible bank first for dom0. =
This could simplify things.
> >
> > For the moment I added a __add_ext_regions() helper that also takes a s=
kip_size
> I'm not sure if MISRA and our guidelines are happy with prefixing with fu=
nction with __.
> I don't understand the skip_size parameter. In which scenario do you want=
 to use it? Not for
> extended regions and for LLC, even with your current solution, you also w=
ant to find banks bigger than
> some size.
>
> > parameter. This is called by add_ext_regions() and by a new
> > add_hwdom_free_regions() callback used in allocate_memory().
> > I still use 128MB for all the banks. Do you think this is acceptable, m=
aybe
> > with a FIXME comment cause we should skip only the first bank, or not?
> First of all, I'm not convinced with 128MB. This is definitely not a requ=
irement for arm64.
> allocate_memory_11 uses it but the algorithm of finding banks is complete=
ly different.
>
> AFAICT, with my suggested solution i.e. sorting banks in a helper like ad=
d_ext_regions used only
> for LLC case, you no longer need to worry about size. You simply start wi=
th the biggest possible bank
> as the first bank.
>
> ~Michal
>

Here's my current patch:

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index d93a85434e..67b1503647 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
     return ( !dom0found && domUfound );
 }

-static void __init allocate_memory(struct domain *d, struct kernel_info *k=
info)
-{
-    struct membanks *mem =3D kernel_info_get_mem(kinfo);
-    unsigned int i;
-    paddr_t bank_size;
-
-    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
-           /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
-
-    mem->nr_banks =3D 0;
-    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
-                               bank_size) )
-        goto fail;
-
-    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
-                               bank_size) )
-        goto fail;
-
-    if ( kinfo->unassigned_mem )
-        goto fail;
-
-    for( i =3D 0; i < mem->nr_banks; i++ )
-    {
-        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)=
\n",
-               d,
-               i,
-               mem->bank[i].start,
-               mem->bank[i].start + mem->bank[i].size,
-               /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
-    }
-
-    return;
-
-fail:
-    panic("Failed to allocate requested domain memory."
-          /* Don't want format this as PRIpaddr (16 digit hex) */
-          " %ldKB unallocated. Fix the VMs configurations.\n",
-          (unsigned long)kinfo->unassigned_mem >> 10);
-}
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index adf26f2778..59ac45c4e0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2,6 +2,7 @@
 #include <xen/init.h>
 #include <xen/compile.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/domain_page.h>
@@ -416,7 +417,6 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }

-#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
                                     alloc_domheap_mem_cb cb, void *extra)
 {
@@ -508,7 +508,6 @@ bool __init allocate_bank_memory(struct
kernel_info *kinfo, gfn_t sgfn,

     return true;
 }
-#endif

 /*
  * When PCI passthrough is available we want to keep the
@@ -859,8 +858,8 @@ int __init make_memory_node(const struct
kernel_info *kinfo, int addrcells,
     return res;
 }

-int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
-                           void *data)
+static int __init __add_ext_regions(unsigned long s_gfn, unsigned long e_g=
fn,
+                                    void *data, paddr_t skip_size)
 {
     struct membanks *ext_regions =3D data;
     paddr_t start, size;
@@ -885,12 +884,7 @@ int __init add_ext_regions(unsigned long s_gfn,
unsigned long e_gfn,
     e +=3D 1;
     size =3D (e - start) & ~(SZ_2M - 1);

-    /*
-     * Reasonable size. Not too little to pick up small ranges which are
-     * not quite useful but increase bookkeeping and not too large
-     * to skip a large proportion of unused address space.
-     */
-    if ( size < MB(64) )
+    if ( size < skip_size )
         return 0;

     ext_regions->bank[ext_regions->nr_banks].start =3D start;
@@ -900,6 +894,28 @@ int __init add_ext_regions(unsigned long s_gfn,
unsigned long e_gfn,
     return 0;
 }

+static int __init add_hwdom_free_regions(unsigned long s_gfn,
+                                         unsigned long e_gfn, void *data)
+{
+    /*
+     * Skip banks that are too small. The first bank must contain dom0 ker=
nel +
+     * ramdisk + dtb and 128 MB is the same limit used in allocate_memory_=
11().
+     */
+    return __add_ext_regions(s_gfn, e_gfn, data, MB(128));
+}
+
+
+int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
+                           void *data)
+{
+    /*
+     * Reasonable size. Not too little to pick up small ranges which are
+     * not quite useful but increase bookkeeping and not too large
+     * to skip a large proportion of unused address space.
+     */
+    return __add_ext_regions(s_gfn, e_gfn, data, MB(64));
+}
+
 /*
  * Find unused regions of Host address space which can be exposed to domai=
n
  * using the host memory layout. In order to calculate regions we exclude =
every
@@ -977,6 +993,109 @@ out:
     return res;
 }

+void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
+{
+    struct membanks *mem =3D kernel_info_get_mem(kinfo);
+    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
+    struct membanks *hwdom_free_mem =3D NULL;
+
+    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
+           /* Don't want format this as PRIpaddr (16 digit hex) */
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+
+    mem->nr_banks =3D 0;
+    /*
+     * Use host memory layout for hwdom. Only case for this is when
LLC coloring
+     * is enabled.
+     */
+    if ( is_hardware_domain(d) )
+    {
+        struct membanks *gnttab =3D xzalloc_flex_struct(struct
membanks, bank, 1);
+        /*
+         * Exclude the following regions:
+         * 1) Remove reserved memory
+         * 2) Grant table assigned to Dom0
+         */
+        const struct membanks *mem_banks[] =3D {
+            bootinfo_get_reserved_mem(),
+            gnttab,
+        };
+
+        ASSERT(llc_coloring_enabled);
+
+        if ( !gnttab )
+            goto fail;
+
+        gnttab->nr_banks =3D 1;
+        gnttab->bank[0].start =3D kinfo->gnttab_start;
+        gnttab->bank[0].size =3D kinfo->gnttab_start + kinfo->gnttab_size;
+
+        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, bank,
+                                             NR_MEM_BANKS);
+        if ( !hwdom_free_mem )
+            goto fail;
+
+        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
+
+        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_bank=
s),
+                                     hwdom_free_mem, add_hwdom_free_region=
s) )
+            goto fail;
+
+        nr_banks =3D hwdom_free_mem->nr_banks;
+        xfree(gnttab);
+    }
+
+    for ( i =3D 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_bank=
s-- )
+    {
+        paddr_t bank_start, bank_size;
+
+        if ( is_hardware_domain(d) )
+        {
+            bank_start =3D hwdom_free_mem->bank[i].start;
+            bank_size =3D hwdom_free_mem->bank[i].size;
+            ASSERT(bank_size >=3D MB(128));
+        }
+        else
+        {
+            const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
+            const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
+
+            if ( i >=3D GUEST_RAM_BANKS )
+                goto fail;
+
+            bank_start =3D bankbase[i];
+            bank_size =3D banksize[i];
+        }
+
+        bank_size =3D MIN(bank_size, kinfo->unassigned_mem);
+        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start),
bank_size) )
+            goto fail;
+    }
+
+    if ( kinfo->unassigned_mem )
+        goto fail;
+
+    for( i =3D 0; i < mem->nr_banks; i++ )
+    {
+        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)=
\n",
+               d,
+               i,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
+               /* Don't want format this as PRIpaddr (16 digit hex) */
+               (unsigned long)(mem->bank[i].size >> 20));
+    }
+
+    xfree(hwdom_free_mem);
+    return;
+
+fail:
+    panic("Failed to allocate requested domain memory."
+          /* Don't want format this as PRIpaddr (16 digit hex) */
+          " %ldKB unallocated. Fix the VMs configurations.\n",
+          (unsigned long)kinfo->unassigned_mem >> 10);
+}
+
 static int __init handle_pci_range(const struct dt_device_node *dev,
                                    uint64_t addr, uint64_t len, void *data=
)
 {
@@ -1235,7 +1354,7 @@ int __init make_hypervisor_node(struct domain *d,

         ext_regions->max_banks =3D NR_MEM_BANKS;

-        if ( is_domain_direct_mapped(d) )
+        if ( domain_use_host_layout(d) )
         {
             if ( !is_iommu_enabled(d) )
                 res =3D find_host_extended_regions(kinfo, ext_regions);
@@ -2164,8 +2283,11 @@ static int __init construct_dom0(struct domain *d)
     /* type must be set before allocate_memory */
     d->arch.type =3D kinfo.type;
 #endif
-    allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
+    if ( is_domain_direct_mapped(d) )
+        allocate_memory_11(d, &kinfo);
+    else
+        allocate_memory(d, &kinfo);

     rc =3D process_shm_chosen(d, &kinfo);
     if ( rc < 0 )
diff --git a/xen/arch/arm/include/asm/domain_build.h
b/xen/arch/arm/include/asm/domain_build.h
index e712afbc7f..b0d646e173 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -11,6 +11,7 @@ bool allocate_domheap_memory(struct domain *d,
paddr_t tot_size,
                              alloc_domheap_mem_cb cb, void *extra);
 bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
@@ -54,6 +55,9 @@ static inline int prepare_acpi(struct domain *d,
struct kernel_info *kinfo)
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 #endif

+typedef int (*add_free_regions_fn)(unsigned long s_gfn, unsigned long e_gf=
n,
+                                   void *data);
+
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);

 #endif

skip_size can be renamed to threshold_size to make it more clear.

Anyway I'm not following you on the suggested solution: when should I sort =
the
banks, how can I do it in the callback of find_unallocated_memory() and
what if the first biggest bank is lower than 128MB, I should not care for t=
hat?

Thanks.

- Carlo


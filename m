Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660599EF93E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 18:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856240.1268925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLnIV-0003Hr-3f; Thu, 12 Dec 2024 17:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856240.1268925; Thu, 12 Dec 2024 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLnIU-0003Fy-Ut; Thu, 12 Dec 2024 17:48:22 +0000
Received: by outflank-mailman (input) for mailman id 856240;
 Thu, 12 Dec 2024 17:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BjQ=TF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tLnIT-0003Fs-8s
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 17:48:21 +0000
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [2607:f8b0:4864:20::d2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4527a4ca-b8b1-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 18:48:19 +0100 (CET)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so27319739f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 09:48:18 -0800 (PST)
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
X-Inumbo-ID: 4527a4ca-b8b1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734025697; x=1734630497; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJmOoCTfegMJa1Yr0/R8zMtSjGdO8E/PmSuCtIKtiKM=;
        b=l7Y1tjCduv8gTsuZvWKwzFqJM7du5ivCqlrZTf0aNtoIynTGcZ0WFPtlbYinZmSRAk
         bPLifCXI+M8lfnbSF8/43mprV9hk8Y/mXvmWQB+44j9+1+JXGTR02beP/0qI15GwrN3p
         IjZ3dYmjdeTwAqb78cIAiw/6h0FsbAA1AvW0KZ8wXayaLpgYiBi6K+pHjGC/zgNRzu2g
         ITW2SkpcxadaempSsQJCpFD+lrXr7RF5seqK5oxO7DCsq3Y2ao1lL3K49fYC+7ygcTnB
         89jM54xG3AsmzFfPvsrRIrPpB2CmQh793PUbpQmwQm3K4QnOM1QOvBmI+8lN8/tw9Sdk
         FEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025697; x=1734630497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJmOoCTfegMJa1Yr0/R8zMtSjGdO8E/PmSuCtIKtiKM=;
        b=d7vJXGl917Mukh3BUDvly9U2Hu1BcTVOZUODTgFDhuNoryk/jZUQHCCRFOaGdqe8ld
         n+4L/l1fmdHq4m4mY9kdeiYWQx2S2Ohwk+6PnnyW3+Oka4e8avdw7YHRdihhL3QmeISB
         Hwg8TytD03XRjZbzC+7m0HmUVB2oRPEY0VrdODBb6wRdtNQ6ReWrqty+RcTt+MDPZJOk
         CeJJmyCj05zKSYK53JcRqzeV8FIXnGh/6f7SmyCpoNao7BizIDuo8+BVvb8YbQMUKPGV
         qihUfrommYtLu0jl5GZvvX912JjGItJE6ikpY6/Tqx4MR54K2ibS8sxQtjNKlFpuOUPl
         ykUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3vATy2QXbUwAhERO3jAXxX5ycn+HdGCcI807wpulB+ocrHqIOObL/UiaLmT7Dm6mI9q3C1pCQ+Lc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycZuph0fZfxb8uX3i0pdhSy+LuWighYzT0gwwnz6F67djgzpJM
	CaiPX8mdP6SMy/TuFmeavm6SUKLgXjwhhaIH72V7YxU+6G4MXuEdB/jnsFPcfyLSwV56M3LTUbS
	R2ZN3/Mr8Mds7kMAL8s9JJZ0Y6myIaDtsOMp45Q==
X-Gm-Gg: ASbGncuDsa/MPAnsuRoWs2Rn4Apa78oe/4w3JXulymXJ6HkIirRwu9+jVC/3uYnviAt
	sVotEzdkZehYxFDWR4gkzgWfEkLLaD4noT2UFo8w=
X-Google-Smtp-Source: AGHT+IGhRw4OjLOc+qBlOfuTB11qT8uwOJMXjtWxCy6RHajtcNdB/SHDcFD+aBS5toPWNZjWhJxOSlTw2djqsmla7rU=
X-Received: by 2002:a92:ca49:0:b0:3a7:e539:c272 with SMTP id
 e9e14a558f8ab-3ae5934c765mr14068265ab.23.1734025697419; Thu, 12 Dec 2024
 09:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
 <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
In-Reply-To: <0bacfdb6-d4ad-4dea-85d4-2851873dca4e@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 12 Dec 2024 18:48:06 +0100
Message-ID: <CAG+AhRUtMy=WckZaeWGBDSQEh_09p4cTVFWSSCxaEXv6vnLk4Q@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 9, 2024 at 8:17=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Michal,
>
> On 07/12/2024 15:04, Michal Orzel wrote:
> >
> >
> > On 06/12/2024 19:37, Julien Grall wrote:
> >>
> >>
> >> Hi,
> >>
> >> Sorry for the late answer.
> >>
> >> On 05/12/2024 09:40, Michal Orzel wrote:
> >>>
> >>>
> >>> On 02/12/2024 17:59, Carlo Nonato wrote:
> >>>>
> >>>>
> >>>> Cache coloring requires Dom0 not to be direct-mapped because of its =
non
> >>>> contiguous mapping nature, so allocate_memory() is needed in this ca=
se.
> >>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate=
 module")
> >>>> moved allocate_memory() in dom0less_build.c. In order to use it
> >>>> in Dom0 construction bring it back to domain_build.c and declare it =
in
> >>>> domain_build.h.
> >>>>
> >>>> Take the opportunity to adapt the implementation of allocate_memory(=
) so
> >>>> that it uses the host layout when called on the hwdom, via
> >>>> find_unallocated_memory().
> >>>>
> >>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>> ---
> >>>> v11:
> >>>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in alloc=
ate_memory()
> >>>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> >>>> - added a comment in allocate_memory() when skipping small banks
> >>>> v10:
> >>>> - fixed a compilation bug that happened when dom0less support was di=
sabled
> >>>> v9:
> >>>> - no changes
> >>>> v8:
> >>>> - patch adapted to new changes to allocate_memory()
> >>>> v7:
> >>>> - allocate_memory() now uses the host layout when called on the hwdo=
m
> >>>> v6:
> >>>> - new patch
> >>>> ---
> >>>>    xen/arch/arm/dom0less-build.c           | 44 -----------
> >>>>    xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++=
++++-
> >>>>    xen/arch/arm/include/asm/domain_build.h |  1 +
> >>>>    3 files changed, 94 insertions(+), 48 deletions(-)
> >>>>
> >>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-b=
uild.c
> >>>> index d93a85434e..67b1503647 100644
> >>>> --- a/xen/arch/arm/dom0less-build.c
> >>>> +++ b/xen/arch/arm/dom0less-build.c
> >>>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
> >>>>        return ( !dom0found && domUfound );
> >>>>    }
> >>>>
> >>>> -static void __init allocate_memory(struct domain *d, struct kernel_=
info *kinfo)
> >>>> -{
> >>>> -    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>> -    unsigned int i;
> >>>> -    paddr_t bank_size;
> >>>> -
> >>>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd=
:\n",
> >>>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
> >>>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>> -
> >>>> -    mem->nr_banks =3D 0;
> >>>> -    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> >>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE)=
,
> >>>> -                               bank_size) )
> >>>> -        goto fail;
> >>>> -
> >>>> -    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> >>>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE)=
,
> >>>> -                               bank_size) )
> >>>> -        goto fail;
> >>>> -
> >>>> -    if ( kinfo->unassigned_mem )
> >>>> -        goto fail;
> >>>> -
> >>>> -    for( i =3D 0; i < mem->nr_banks; i++ )
> >>>> -    {
> >>>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" =
(%ldMB)\n",
> >>>> -               d,
> >>>> -               i,
> >>>> -               mem->bank[i].start,
> >>>> -               mem->bank[i].start + mem->bank[i].size,
> >>>> -               /* Don't want format this as PRIpaddr (16 digit hex)=
 */
> >>>> -               (unsigned long)(mem->bank[i].size >> 20));
> >>>> -    }
> >>>> -
> >>>> -    return;
> >>>> -
> >>>> -fail:
> >>>> -    panic("Failed to allocate requested domain memory."
> >>>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
> >>>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> >>>> -          (unsigned long)kinfo->unassigned_mem >> 10);
> >>>> -}
> >>>> -
> >>>>    #ifdef CONFIG_VGICV2
> >>>>    static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
> >>>>    {
> >>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build=
.c
> >>>> index 2c30792de8..2b8cba9b2f 100644
> >>>> --- a/xen/arch/arm/domain_build.c
> >>>> +++ b/xen/arch/arm/domain_build.c
> >>>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct dom=
ain *d,
> >>>>        }
> >>>>    }
> >>>>
> >>>> -#ifdef CONFIG_DOM0LESS_BOOT
> >>>>    bool __init allocate_domheap_memory(struct domain *d, paddr_t tot=
_size,
> >>>>                                        alloc_domheap_mem_cb cb, void=
 *extra)
> >>>>    {
> >>>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_i=
nfo *kinfo, gfn_t sgfn,
> >>>>
> >>>>        return true;
> >>>>    }
> >>>> -#endif
> >>>>
> >>>>    /*
> >>>>     * When PCI passthrough is available we want to keep the
> >>>> @@ -1003,6 +1001,94 @@ out:
> >>>>        return res;
> >>>>    }
> >>>>
> >>>> +void __init allocate_memory(struct domain *d, struct kernel_info *k=
info)
> >>>> +{
> >>>> +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>>> +    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
> >>>> +    paddr_t bank_start, bank_size;
> >>> Limit the scope
> >>>
> >>>> +    struct membanks *hwdom_free_mem =3D NULL;
> >>>> +    const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> >>>> +    const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> >>> Limit the scope
> >>>
> >>>> +
> >>>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd=
:\n",
> >>>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
> >>>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>>> +
> >>>> +    mem->nr_banks =3D 0;
> >>>> +    /*
> >>>> +     * Use host memory layout for hwdom. Only case for this is when=
 LLC coloring
> >>>> +     * is enabled.
> >>>> +     */
> >>>> +    if ( is_hardware_domain(d) )
> >>>> +    {
> >>>> +        ASSERT(llc_coloring_enabled);
> >>> This patch does not build because of declaration not being visible. Y=
ou must include <xen/llc-coloring.h>.
> >>
> >> Piggying back on this comment. AFAICT, the code below would work also =
in
> >> the non cache coloring case. So what's the assert is for?
> >>
> >>>
> >>>> +
> >>>> +        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, ban=
k,
> >>>> +                                             NR_MEM_BANKS);
> >>>> +        if ( !hwdom_free_mem )
> >>>> +            goto fail;
> >>>> +
> >>>> +        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
> >>>> +
> >>>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
> >>> My remarks for the use of find_unallocated_memory() 1:1 have not been=
 addressed. You did not even
> >>> change the comments inside the function. The problem is that the func=
tion is specifically designed
> >>> for finding extended regions and assumes being called at certain poin=
t i.e. dom0 RAM allocated, gnttab
> >>> region allocated, etc.
> >>
> >> So I agree that the function should be updated if we plan to use it fo=
r
> >> other purpose.
> >>
> >> My opinion is that we should attempt to make the function generic so
> >> that in your
> >>> case you can choose which regions to exclude, define even your own fu=
nction to grab free regions (at the moment
> >>> add_ext_regions grabs banks >=3D 64M but you still discards banks >=
=3D 128M, so it's a bit wasteful.
> >>>
> >>> My very short attempt to make the function as generic as possible in =
the first iteration:
> >>> https://paste.debian.net/1338334/
> >>
> >> This looks better, but I wonder why we need still need to exclude the
> >> static regions? Wouldn't it be sufficient to exclude just reserved reg=
ions?
> > Static shared memory banks are not part of reserved memory (i.e. bootin=
fo.reserved_mem) if that's what you're asking.
> > They are stored in bootinfo.shmem, hence we need to take them into acco=
unt when searching for unused address space.
>
> Oh I missed the fact you now pass "mem_banks" as a parameter. I thought
> they would still get excluded for cache coloring case.
>
> >
> > If you and Carlo are ok with my proposed solution for making the functi=
on generic, I can send a patch as a prerequisite
> > patch for Carlo series.
>
> I am fine with the approach.
>
> Cheers,
>
> --
> Julien Grall
>

> @@ -2152,7 +2238,10 @@ static int __init construct_dom0(struct domain *d)
>      /* type must be set before allocate_memory */
>      d->arch.type =3D kinfo.type;
>  #endif
> -    allocate_memory_11(d, &kinfo);
> +    if ( is_domain_direct_mapped(d) )
> +        allocate_memory_11(d, &kinfo);
> +    else
> +        allocate_memory(d, &kinfo);
>      find_gnttab_region(d, &kinfo);

Since find_gnttab_region() is called after allocate_memory(), kinfo->gnttab=
_*
fields aren't initialized and the call to find_unallocated_memory() with
gnttab as the region to exclude, fails ending in a crash since memory for
dom0 can't be allocated.

Can the solution be to call find_gnttab_region() before the above if?
Or should I just call it before allocate_memory() in one case, but still af=
ter
allocate_memory_11() in the other?

Thanks.


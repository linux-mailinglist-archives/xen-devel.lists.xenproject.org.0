Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C29E8F16
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 10:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851094.1265239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKaMT-0007Ff-L2; Mon, 09 Dec 2024 09:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851094.1265239; Mon, 09 Dec 2024 09:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKaMT-0007E0-II; Mon, 09 Dec 2024 09:47:29 +0000
Received: by outflank-mailman (input) for mailman id 851094;
 Mon, 09 Dec 2024 09:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vcmU=TC=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tKaMS-0007Du-B7
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 09:47:28 +0000
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [2607:f8b0:4864:20::d33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988ffeb2-b612-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 10:47:26 +0100 (CET)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-84194e90c0fso298553039f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 01:47:26 -0800 (PST)
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
X-Inumbo-ID: 988ffeb2-b612-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733737645; x=1734342445; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNoixS+bSdns49ylC5jh5vsCyN5SjdzAMt56FHivZkk=;
        b=LRuGOXAixIhn9aqMGCeopTwdosFoYxn1S1QYkbu0Q3NbPlX4Lvbi9t04yLYTjZQEXC
         ClDY73XVaNsu9ZTiZZjC7YYzZQYUVsDtLNnvZGrsDW6uT0WaV95GxO9i8BoYcJlpPr20
         EF7essspU8S2Qjs8uSa+d9NoupRHMhLNnOHxfwB1Gz8TiX9n3AJZr0VYhTWlrx4Ah3xo
         nIccnff3eE8hvPCvf1G5PYOcgkzQKpagNNPLF7HDbG3/DJvzxGUFsBZDG78vpm/vM+VX
         ZedbKEGlfekrfUndAPrI2CkGEfsb6Ax6BBwtpq92wG0FC7kpMpHDiznZsdmaEqZZlyXX
         xEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737645; x=1734342445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNoixS+bSdns49ylC5jh5vsCyN5SjdzAMt56FHivZkk=;
        b=B0Csma5VAu04C5mjNixuBJpU9wFD4LVC8C2uky7sCylT/e8rWAZCKMJ/OUgX1fBWLW
         KhyEtw4XuwuQaP/cFzargmALozlnw052NaSwUzoKQFFaGDwjM4/kwtl3IxVLDR2LUYlU
         sV/3cPfaTG3Xd1CPbOkJujlT9OAKK5N4kgwD176GroRclLOblrMOdABzWzwVP21jYgu+
         NqApnRJ7ZVHK+hNWl899q80j9HbHFQSAjo0jgPuwrA5NDCoXuFUG5NpAgUcI1wac6d/M
         I99LPKMu4WlLX68VGS5qdyfr5pOtsGQvNLRGiUHiUmOT93cv7Q6V4eDZRczLu4fmX57D
         BzOw==
X-Forwarded-Encrypted: i=1; AJvYcCXXHk5MXUg0DLim71ZJ0a4HtRMYOfuOC40hLffoJzHd95bQFcQhKzurw2jtgX5DvQsh3KeE5b+cniA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznWi0wl3DBIPbdB11zyPyHFqJxj+LBOxyUAf2+rmKpeIzQSUgl
	Yf7gUBjubr1HDW8YdA/F1vVUyn3strXNmjKelG8W97I98ZjMeHknyOz/4uqvaevQRZRISOcnX77
	OScGgKndxxwPu4SLI3+5wxOmNp6VEid9ewBP9Qw==
X-Gm-Gg: ASbGncvxkwm2xLC0DPktxp1NUWKsWjsQLPUixSYDny4O/1mRh2OYSjiFDNgwgmxS3Cv
	zUw/orQc8w8jgoK085tVItElr6NB+pXP3fgjOAylB0f1iD3gZFuLdp/NDCn68esIS
X-Google-Smtp-Source: AGHT+IEQMTymVgc2tzxE7kABtIENjkqkgMzj9GUXFf4K0HOZzp69B6BUNJbTBDiWxjIo4cbUjRZnANHoxSvO35knlho=
X-Received: by 2002:a05:6e02:214a:b0:3a3:4175:79da with SMTP id
 e9e14a558f8ab-3a811dbaedamr95125945ab.13.1733737645134; Mon, 09 Dec 2024
 01:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
 <20241202165921.249585-4-carlo.nonato@minervasys.tech> <bc40c381-0998-4dd2-b5c9-5b70b45805ce@amd.com>
 <7ecc99c5-0cb5-4351-bede-cb03c9a4ac7e@xen.org> <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
In-Reply-To: <293004fa-c87e-4a45-aa4c-b02456aaecea@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 9 Dec 2024 10:47:14 +0100
Message-ID: <CAG+AhRUbsZrZV_Z6U0Xz8Gi9UBF21Q-2xHiEZn4J=MK-rqz9Kg@mail.gmail.com>
Subject: Re: [PATCH v11 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal, Julien

On Sat, Dec 7, 2024 at 4:05=E2=80=AFPM Michal Orzel <michal.orzel@amd.com> =
wrote:
>
> On 06/12/2024 19:37, Julien Grall wrote:
> >
> >
> > Hi,
> >
> > Sorry for the late answer.
> >
> > On 05/12/2024 09:40, Michal Orzel wrote:
> >>
> >>
> >> On 02/12/2024 17:59, Carlo Nonato wrote:
> >>>
> >>>
> >>> Cache coloring requires Dom0 not to be direct-mapped because of its n=
on
> >>> contiguous mapping nature, so allocate_memory() is needed in this cas=
e.
> >>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate =
module")
> >>> moved allocate_memory() in dom0less_build.c. In order to use it
> >>> in Dom0 construction bring it back to domain_build.c and declare it i=
n
> >>> domain_build.h.
> >>>
> >>> Take the opportunity to adapt the implementation of allocate_memory()=
 so
> >>> that it uses the host layout when called on the hwdom, via
> >>> find_unallocated_memory().
> >>>
> >>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>> ---
> >>> v11:
> >>> - GUEST_RAM_BANKS instead of hardcoding the number of banks in alloca=
te_memory()
> >>> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> >>> - added a comment in allocate_memory() when skipping small banks
> >>> v10:
> >>> - fixed a compilation bug that happened when dom0less support was dis=
abled
> >>> v9:
> >>> - no changes
> >>> v8:
> >>> - patch adapted to new changes to allocate_memory()
> >>> v7:
> >>> - allocate_memory() now uses the host layout when called on the hwdom
> >>> v6:
> >>> - new patch
> >>> ---
> >>>   xen/arch/arm/dom0less-build.c           | 44 -----------
> >>>   xen/arch/arm/domain_build.c             | 97 ++++++++++++++++++++++=
++-
> >>>   xen/arch/arm/include/asm/domain_build.h |  1 +
> >>>   3 files changed, 94 insertions(+), 48 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-bu=
ild.c
> >>> index d93a85434e..67b1503647 100644
> >>> --- a/xen/arch/arm/dom0less-build.c
> >>> +++ b/xen/arch/arm/dom0less-build.c
> >>> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
> >>>       return ( !dom0found && domUfound );
> >>>   }
> >>>
> >>> -static void __init allocate_memory(struct domain *d, struct kernel_i=
nfo *kinfo)
> >>> -{
> >>> -    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>> -    unsigned int i;
> >>> -    paddr_t bank_size;
> >>> -
> >>> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:=
\n",
> >>> -           /* Don't want format this as PRIpaddr (16 digit hex) */
> >>> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>> -
> >>> -    mem->nr_banks =3D 0;
> >>> -    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> >>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> >>> -                               bank_size) )
> >>> -        goto fail;
> >>> -
> >>> -    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> >>> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> >>> -                               bank_size) )
> >>> -        goto fail;
> >>> -
> >>> -    if ( kinfo->unassigned_mem )
> >>> -        goto fail;
> >>> -
> >>> -    for( i =3D 0; i < mem->nr_banks; i++ )
> >>> -    {
> >>> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (=
%ldMB)\n",
> >>> -               d,
> >>> -               i,
> >>> -               mem->bank[i].start,
> >>> -               mem->bank[i].start + mem->bank[i].size,
> >>> -               /* Don't want format this as PRIpaddr (16 digit hex) =
*/
> >>> -               (unsigned long)(mem->bank[i].size >> 20));
> >>> -    }
> >>> -
> >>> -    return;
> >>> -
> >>> -fail:
> >>> -    panic("Failed to allocate requested domain memory."
> >>> -          /* Don't want format this as PRIpaddr (16 digit hex) */
> >>> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> >>> -          (unsigned long)kinfo->unassigned_mem >> 10);
> >>> -}
> >>> -
> >>>   #ifdef CONFIG_VGICV2
> >>>   static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
> >>>   {
> >>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.=
c
> >>> index 2c30792de8..2b8cba9b2f 100644
> >>> --- a/xen/arch/arm/domain_build.c
> >>> +++ b/xen/arch/arm/domain_build.c
> >>> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct doma=
in *d,
> >>>       }
> >>>   }
> >>>
> >>> -#ifdef CONFIG_DOM0LESS_BOOT
> >>>   bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_s=
ize,
> >>>                                       alloc_domheap_mem_cb cb, void *=
extra)
> >>>   {
> >>> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_in=
fo *kinfo, gfn_t sgfn,
> >>>
> >>>       return true;
> >>>   }
> >>> -#endif
> >>>
> >>>   /*
> >>>    * When PCI passthrough is available we want to keep the
> >>> @@ -1003,6 +1001,94 @@ out:
> >>>       return res;
> >>>   }
> >>>
> >>> +void __init allocate_memory(struct domain *d, struct kernel_info *ki=
nfo)
> >>> +{
> >>> +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> >>> +    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
> >>> +    paddr_t bank_start, bank_size;
> >> Limit the scope
> >>
> >>> +    struct membanks *hwdom_free_mem =3D NULL;
> >>> +    const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> >>> +    const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> >> Limit the scope
> >>
> >>> +
> >>> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:=
\n",
> >>> +           /* Don't want format this as PRIpaddr (16 digit hex) */
> >>> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> >>> +
> >>> +    mem->nr_banks =3D 0;
> >>> +    /*
> >>> +     * Use host memory layout for hwdom. Only case for this is when =
LLC coloring
> >>> +     * is enabled.
> >>> +     */
> >>> +    if ( is_hardware_domain(d) )
> >>> +    {
> >>> +        ASSERT(llc_coloring_enabled);
> >> This patch does not build because of declaration not being visible. Yo=
u must include <xen/llc-coloring.h>.
> >
> > Piggying back on this comment. AFAICT, the code below would work also i=
n
> > the non cache coloring case. So what's the assert is for?
> >
> >>
> >>> +
> >>> +        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, bank=
,
> >>> +                                             NR_MEM_BANKS);
> >>> +        if ( !hwdom_free_mem )
> >>> +            goto fail;
> >>> +
> >>> +        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
> >>> +
> >>> +        if ( find_unallocated_memory(kinfo, hwdom_free_mem) )
> >> My remarks for the use of find_unallocated_memory() 1:1 have not been =
addressed. You did not even
> >> change the comments inside the function. The problem is that the funct=
ion is specifically designed
> >> for finding extended regions and assumes being called at certain point=
 i.e. dom0 RAM allocated, gnttab
> >> region allocated, etc.

Answering Michal. Sorry about it, since we were waiting for comments and I
wanted to keep the revision alive (it happend too many times that we
(minervasys) left the discussion hanging for too long) I sent the v11
even if it was incomplete. I should have at least added commens, you're
right.

> > So I agree that the function should be updated if we plan to use it for
> > other purpose.
> >
> > My opinion is that we should attempt to make the function generic so
> > that in your
> >> case you can choose which regions to exclude, define even your own fun=
ction to grab free regions (at the moment
> >> add_ext_regions grabs banks >=3D 64M but you still discards banks >=3D=
 128M, so it's a bit wasteful.
> >>
> >> My very short attempt to make the function as generic as possible in t=
he first iteration:
> >> https://paste.debian.net/1338334/
> >
> > This looks better, but I wonder why we need still need to exclude the
> > static regions? Wouldn't it be sufficient to exclude just reserved regi=
ons?
> Static shared memory banks are not part of reserved memory (i.e. bootinfo=
.reserved_mem) if that's what you're asking.
> They are stored in bootinfo.shmem, hence we need to take them into accoun=
t when searching for unused address space.
>
> If you and Carlo are ok with my proposed solution for making the function=
 generic, I can send a patch as a prerequisite
> patch for Carlo series.

I'm ok with that.

> ~Michal

Thanks both.

- Carlo


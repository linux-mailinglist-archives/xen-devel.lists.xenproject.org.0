Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F09DC112
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 10:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845779.1261114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGwxu-0002kc-Cw; Fri, 29 Nov 2024 09:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845779.1261114; Fri, 29 Nov 2024 09:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGwxu-0002iM-9q; Fri, 29 Nov 2024 09:07:06 +0000
Received: by outflank-mailman (input) for mailman id 845779;
 Fri, 29 Nov 2024 09:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lhP=SY=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tGwxs-0002iG-Vo
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 09:07:05 +0000
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [2607:f8b0:4864:20::d2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49afbbd7-ae31-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 10:06:59 +0100 (CET)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-843e3b49501so48575539f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 01:06:59 -0800 (PST)
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
X-Inumbo-ID: 49afbbd7-ae31-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpkMmMiLCJoZWxvIjoibWFpbC1pbzEteGQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5YWZiYmQ3LWFlMzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODcxMjE5LjUxNjQ3LCJzZW5kZXIiOiJjYXJsby5ub25hdG9AbWluZXJ2YXN5cy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732871218; x=1733476018; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYFCVluVcSJwdm3/KZCItIDRzM9+I51g0gVQxAcowDQ=;
        b=BjRYQzjZDV4/46nsmU3eEa7oXUIKz5bCi2RSV61sjyXtQ76pSQpL6dJOYm9yZ3aXru
         fDhkP1KbuMiE3Af1Hlx3cjhubYNv8LC1badxyVJyWIekJNWLIDeYXdwfYnS03cYShL7z
         tvTWmqj8QgbHFcNlvCbkz9RQKhfxId6Syga9Z5+USRtfItuxWOsNev8HQ+D1RFpokTqi
         gI0Vgfkhxi//l3+pQ/vlWobr5+Ofj4eETEFpEGPNs3oIISoSaRaKnbWcJQQ5hUvOem0W
         bdPzmt8NbusxhQCDXLtoxBpSDBQo7do3opbmzwjEvxwL7r+aLEjcukvzhalRKnYfxdBY
         7q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871218; x=1733476018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYFCVluVcSJwdm3/KZCItIDRzM9+I51g0gVQxAcowDQ=;
        b=R9Fc8UROrznuqcnn4m2kY0JJP9BS5HkuTkib9Ft9VmKwlbg0GZA4qYibQ8K1hz7YCB
         bx3Si7mG7zK+yafHTnrokWFkU7A5evrkdn7N0sBH4/yKAT503MEeD1WobYQm6L6goD7I
         SmgRIIsPUqbCHVW+jYttTaLp6RFzC0pNBE+xCBP2G4dlUgby0N2yVrdYjL4n0KrApddC
         nhaoBw2hy6eqAAWT5PSaHSRTSReDYTuP/RwEG1gyi2HuM6/H88hRkBX4joz/5Y0gYODH
         X9IolDoO6jeXDp2WeP554Uy46n93oAjjMZdbpOXGdrXJQVNIshHkfNY4mz6CMXbuBh/F
         /DAg==
X-Gm-Message-State: AOJu0YxmvHWY6wCw75nZns6BFFSKRZPY4NLXpRFWcl5CGAF/h+m7+2Fl
	QmxdqcBlvc2+kGIGkJhzm/LB6lBeqDnnX6SUsepMPJopyn+9SpkyquasG2aLZnZid7qgFPekTag
	tJrmJ/8t/O9I8oJz+3/7/Mn40e6uOiNdwDcUTWw==
X-Gm-Gg: ASbGncsq5w+aVCydbVsZ7VmR7dlmog7+pc7WYzPuBmkvh8a26nS2HJYKk0+z1ON/dBf
	a+LWTiFyjIG8THM8oMVfGsGWLO99XwMjl
X-Google-Smtp-Source: AGHT+IF6JJaW/Z2/BLQRVijM3QMkDRDeHls9cBgyuFq5CULTtubsBLMsvaathwK+GEgh9dBLp7Z0VWRF1lth646qXQk=
X-Received: by 2002:a05:6602:3424:b0:83b:5221:2a9b with SMTP id
 ca18e2360f4ac-843ecdaa332mr1188459939f.0.1732871217907; Fri, 29 Nov 2024
 01:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-4-carlo.nonato@minervasys.tech> <15ebc55c-62d0-4133-97cf-57f4c503aacb@amd.com>
In-Reply-To: <15ebc55c-62d0-4133-97cf-57f4c503aacb@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 29 Nov 2024 10:06:46 +0100
Message-ID: <CAG+AhRX6oNgMCk3fRyPcE=gpTyBen_9z_dpkoTUs-Mp6t5XYEw@mail.gmail.com>
Subject: Re: [PATCH v10 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Thu, Nov 28, 2024 at 11:34=E2=80=AFAM Michal Orzel <michal.orzel@amd.com=
> wrote:
> On 19/11/2024 15:13, Carlo Nonato wrote:
> >
> >
> > Cache coloring requires Dom0 not to be direct-mapped because of its non
> > contiguous mapping nature, so allocate_memory() is needed in this case.
> > 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate mo=
dule")
> > moved allocate_memory() in dom0less_build.c. In order to use it
> > in Dom0 construction bring it back to domain_build.c and declare it in
> > domain_build.h.
> >
> > Take the opportunity to adapt the implementation of allocate_memory() s=
o
> > that it uses the host layout when called on the hwdom, via
> > find_unallocated_memory().
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > ---
> > v10:
> > - fixed a compilation bug that happened when dom0less support was disab=
led
> > v9:
> > - no changes
> > v8:
> > - patch adapted to new changes to allocate_memory()
> > v7:
> > - allocate_memory() now uses the host layout when called on the hwdom
> > v6:
> > - new patch
> > ---
> >  xen/arch/arm/dom0less-build.c           | 44 ------------
> >  xen/arch/arm/domain_build.c             | 96 +++++++++++++++++++++++--
> >  xen/arch/arm/include/asm/domain_build.h |  1 +
> >  3 files changed, 93 insertions(+), 48 deletions(-)
> >
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index d93a85434e..67b1503647 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
> >      return ( !dom0found && domUfound );
> >  }
> >
> > -static void __init allocate_memory(struct domain *d, struct kernel_inf=
o *kinfo)
> > -{
> > -    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> > -    unsigned int i;
> > -    paddr_t bank_size;
> > -
> > -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n=
",
> > -           /* Don't want format this as PRIpaddr (16 digit hex) */
> > -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> > -
> > -    mem->nr_banks =3D 0;
> > -    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> > -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> > -                               bank_size) )
> > -        goto fail;
> > -
> > -    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> > -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> > -                               bank_size) )
> > -        goto fail;
> > -
> > -    if ( kinfo->unassigned_mem )
> > -        goto fail;
> > -
> > -    for( i =3D 0; i < mem->nr_banks; i++ )
> > -    {
> > -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%l=
dMB)\n",
> > -               d,
> > -               i,
> > -               mem->bank[i].start,
> > -               mem->bank[i].start + mem->bank[i].size,
> > -               /* Don't want format this as PRIpaddr (16 digit hex) */
> > -               (unsigned long)(mem->bank[i].size >> 20));
> > -    }
> > -
> > -    return;
> > -
> > -fail:
> > -    panic("Failed to allocate requested domain memory."
> > -          /* Don't want format this as PRIpaddr (16 digit hex) */
> > -          " %ldKB unallocated. Fix the VMs configurations.\n",
> > -          (unsigned long)kinfo->unassigned_mem >> 10);
> > -}
> > -
> >  #ifdef CONFIG_VGICV2
> >  static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
> >  {
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 2c30792de8..a95376dcdc 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain=
 *d,
> >      }
> >  }
> >
> > -#ifdef CONFIG_DOM0LESS_BOOT
> >  bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size=
,
> >                                      alloc_domheap_mem_cb cb, void *ext=
ra)
> >  {
> > @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info=
 *kinfo, gfn_t sgfn,
> >
> >      return true;
> >  }
> > -#endif
> >
> >  /*
> >   * When PCI passthrough is available we want to keep the
> > @@ -1003,6 +1001,93 @@ out:
> >      return res;
> >  }
> >
> > +void __init allocate_memory(struct domain *d, struct kernel_info *kinf=
o)
> > +{
> > +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> > +    unsigned int i, nr_banks =3D 2;
> Instead of hardcoding, shouldn't it be GUEST_RAM_BANKS?

Right.

> Also, the second bank won't work with CONFIG_ARM_PA_BITS_32 which limits =
PA to 32bit.

How is this being addressed in the current allocate_memory?
Also, LLC_COLORING depends on ARM_64. ARM_PA_BITS_32 requires ARM_32, so th=
e
two configurations should be incompatible as of now.

> > +    paddr_t bank_start, bank_size;
> > +    struct membanks *hwdom_ext_regions =3D NULL;
> AFAICT you search for free memory. Naming it as extended regions is not a=
 good choice.
> Instead, hwdom_free_mem?

Yes.

> > +
> > +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n=
",
> > +           /* Don't want format this as PRIpaddr (16 digit hex) */
> > +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> > +
> > +    mem->nr_banks =3D 0;
> > +    /*
> > +     * Use host memory layout for hwdom. Only case for this is when LL=
C coloring
> > +     * is enabled.
> > +     */
> > +    if ( is_hardware_domain(d) )
> > +    {
> > +        ASSERT(llc_coloring_enabled);
> > +
> > +        hwdom_ext_regions =3D xzalloc_flex_struct(struct membanks, ban=
k,
> > +                                                NR_MEM_BANKS);
> > +        if ( !hwdom_ext_regions )
> > +            goto fail;
> empty line here please
>
> > +        hwdom_ext_regions->max_banks =3D NR_MEM_BANKS;
> > +
> > +        if ( find_unallocated_memory(kinfo, hwdom_ext_regions) )
> If you reuse find_unallocated_memory for a purpose other than extended re=
gions, I think
> the description of this function should change as well as comments inside=
.

I can definetely change that.

> Today, the function gets all RAM and exclude dom0 RAM (in your case is 0 =
at this point, reserved memory,
> static shmem and gnttab (in your case is 0 at this point). I think we can=
not get away without
> making this function more generic. Maybe it should take as a parameter st=
ruct membanks * array?
> Also, the callback add_ext_regions() may not be suited for all purposes (=
i.e. it takes only banks
> > 64MB into account). I know that there will be more use cases for a func=
tion that will return the
> free memory for domains. As an example, today, for direct mapped domains =
we hardcode the gnttab region
> (only dom0 is special cased). This should not be like that. We would need=
 to find a free memory region
> to expose as gnttab.

For the current cases (including llc coloring) it works. If there are no
objections, a TODO plus comments and description changes you talked above i=
s
probably sufficient to cover the (current) use-cases and "ensure" this is n=
ot
forgotten for the future extension you mention.

> > +            goto fail;
> > +
> > +        nr_banks =3D hwdom_ext_regions->nr_banks;
> > +    }
> > +
> > +    for ( i =3D 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_=
banks-- )
> > +    {
> > +        if ( is_hardware_domain(d) )
> > +        {
> > +            bank_start =3D hwdom_ext_regions->bank[i].start;
> > +            bank_size =3D hwdom_ext_regions->bank[i].size;
> > +
> > +            if ( bank_size < min_t(paddr_t, kinfo->unassigned_mem, MB(=
128)) )
> I would expect some explanation.
>
> > +                continue;
> > +        }
> > +        else
> > +        {
> > +            if ( i =3D=3D 0 )
> > +            {
> > +                bank_start =3D GUEST_RAM0_BASE;
> > +                bank_size =3D GUEST_RAM0_SIZE;
> > +            }
> > +            else if ( i =3D=3D 1 )
> > +            {
> > +                bank_start =3D GUEST_RAM1_BASE;
> > +                bank_size =3D GUEST_RAM1_SIZE;
> > +            }
> > +            else
> > +                goto fail;
> This could be simplified:
> const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
>
> if ( i >=3D GUEST_RAM_BANKS )
>     goto fail;
>
> bank_start =3D bankbase[i];
> bank_size =3D banksize[i];

Ok.

> This patch requires also opinion of other maintainers.
>
> ~Michal

Thanks.

- Carlo


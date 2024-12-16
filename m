Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394159F34F9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858337.1270575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNDNg-00023f-IP; Mon, 16 Dec 2024 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858337.1270575; Mon, 16 Dec 2024 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNDNg-00020w-En; Mon, 16 Dec 2024 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 858337;
 Mon, 16 Dec 2024 15:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuNa=TJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNDNf-0001zq-5D
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:51:35 +0000
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [2607:f8b0:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ec085fc-bbc5-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 16:51:32 +0100 (CET)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a761a622dcso33692585ab.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:51:32 -0800 (PST)
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
X-Inumbo-ID: 9ec085fc-bbc5-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734364291; x=1734969091; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2W90Vrf3TRBuSnhmRzMXdqApGTAPFHO/d7jXo8Fzms=;
        b=ZWLkv9V4/VDI8cqFg749oC+YKkSgbzAf1yx3ludWlZPfkSlB18f+ezbFGnWnlxedOi
         XM1c26bBK+H3jfBNbE6xhYxcZkrltkl4s6ZCQ1ZHDhCYHQxQZysa8+8Jf+TG4Mj7HZhF
         e/++a0DUHWREXewkGjIgIkPH8sBPmFDxUxW2+e5X24RKYSIi/iIXM8d59sBsvLh7oz0Y
         B6Q6tBUE5haBexrWHOTb897aIGIJV/f7Xzj1fh1lXZKKUMRwGT20us3wspnV1Rh9aFST
         RFXPl7T88vIQTWL1vxY2Lv/gQB689Q65onNmIebvlKpEHvMfejsd4Znwz9TZCFHtXTnZ
         Hywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364291; x=1734969091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2W90Vrf3TRBuSnhmRzMXdqApGTAPFHO/d7jXo8Fzms=;
        b=SBhdf5jPEhsrMJvk/CPLVKUADpJTFB3EYfUFoszatVIomHhGnKe4x/GE8K/NpyvKrH
         V74i1YSyGj88XphvEHpi1obdY91usD5Qd7b0XDndbHt0ulazHu/CAs4nwvmLNleKLYh0
         aQtJXsDxXhot6Z7tl+zPFBdn/IPql/P3RimwaNi7utj61PP9WOxgWdPdX1wFOLB8Fwo6
         yQs8TW3kKSVO6HsOqRO88bBK39uV7ZIGKP0L3tuRrdsJmZ9T+k/TSp4UsnNtW+ftojHO
         +7R+PqCWGGgBjvUf4qXsyaH09BTpVBy6mHIEco/5k2qooUA3WVCeEecaLEwaEvSqyGbm
         G5Ig==
X-Gm-Message-State: AOJu0YzjdLVSnHngKzZcN0F+gYvG7wUpdXfzJE+RSpTcphHJQtebZmNN
	agXWbry+bCANFEPEOM/vs2dau7VCPRH5mSUewi/Gjrt+Zt4wBdTQ8DB4rpt8Ony3nCMSmQzwAP9
	rqaqUTz9/nBQDbgDXWAwpRWqNtijX5JI/ncreXw==
X-Gm-Gg: ASbGncuJsY7bBAW8FX4+AXfGY9EITwTL55qj6LfwcACUCt7rkRkliNix+SVBygKFXVz
	+0Ir+Z9rxjaQW6W34RIirvXvvOPXFKrPd/LNKo4I=
X-Google-Smtp-Source: AGHT+IF/4SaBnpvxVIMuSpfjYbb3OksmYIHm2L9KrwNcYnJsn/2iUx/n7K6vwmpnHTYTLiWw4Y0BQ7rydcytziip/Fw=
X-Received: by 2002:a05:6e02:12c4:b0:3a7:e528:6f1e with SMTP id
 e9e14a558f8ab-3aff6218adamr118489435ab.11.1734364291284; Mon, 16 Dec 2024
 07:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-4-carlo.nonato@minervasys.tech> <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
In-Reply-To: <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 16 Dec 2024 16:51:20 +0100
Message-ID: <CAG+AhRX77RjKKQsvdhU-uBG0jFGBB6SxiG-q6t4vT+q2URa7wA@mail.gmail.com>
Subject: Re: [PATCH v12 03/12] xen/arm: permit non direct-mapped Dom0 construction
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Dec 16, 2024 at 1:08=E2=80=AFPM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> On 13/12/2024 17:28, Carlo Nonato wrote:
> >
> > Cache coloring requires Dom0 not to be direct-mapped because of its non
> > contiguous mapping nature, so allocate_memory() is needed in this case.
> > 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate mo=
dule")
> > moved allocate_memory() in dom0less_build.c. In order to use it
> > in Dom0 construction bring it back to domain_build.c and declare it in
> > domain_build.h.
> >
> > Adapt the implementation of allocate_memory() so that it uses the host
> > layout when called on the hwdom, via find_unallocated_memory(). Take th=
e
> > opportunity to keep the parameter order consistent with
> > rangeset_report_ranges() and move the membanks struct after the callbac=
k
> > function in find_unallocated_memory().
> Why? What benefit does this change (that is irrelevant to the goal of thi=
s patch) provide?

You're right, it's irrelevant to this patch. Do you think it can be done in=
 a
separate patch? If nothing else, find_unallocated_memory() appears to be
called 2 times while rangeset_report_ranges() 11 times.

> > Introduce add_hwdom_free_regions() callback to add hwdom banks in desce=
nding
> > order.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > ---
> > v12:
> > - used the new generic find_unallocated_memory()
> > - added add_hwdom_free_regions() callback
> > v11:
> > - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate=
_memory()
> > - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> > - added a comment in allocate_memory() when skipping small banks
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
> >  xen/arch/arm/dom0less-build.c           |  44 -------
> >  xen/arch/arm/domain_build.c             | 164 +++++++++++++++++++++++-
> >  xen/arch/arm/include/asm/domain_build.h |   4 +
> >  3 files changed, 161 insertions(+), 51 deletions(-)
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
> > index adf26f2778..bfcff99194 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2,6 +2,7 @@
> >  #include <xen/init.h>
> >  #include <xen/compile.h>
> >  #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/mm.h>
> >  #include <xen/param.h>
> >  #include <xen/domain_page.h>
> > @@ -416,7 +417,6 @@ static void __init allocate_memory_11(struct domain=
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
> > @@ -508,7 +508,6 @@ bool __init allocate_bank_memory(struct kernel_info=
 *kinfo, gfn_t sgfn,
> >
> >      return true;
> >  }
> > -#endif
> >
> >  /*
> >   * When PCI passthrough is available we want to keep the
> > @@ -900,6 +899,52 @@ int __init add_ext_regions(unsigned long s_gfn, un=
signed long e_gfn,
> >      return 0;
> >  }
> >
> > +static int __init add_hwdom_free_regions(unsigned long s_gfn,
> > +                                         unsigned long e_gfn, void *da=
ta)
> > +{
> > +    struct membanks *free_regions =3D data;
> > +    paddr_t start, size;
> > +    paddr_t s =3D pfn_to_paddr(s_gfn);
> > +    paddr_t e =3D pfn_to_paddr(e_gfn);
> > +    unsigned int i, j;
> > +
> > +    if ( free_regions->nr_banks >=3D free_regions->max_banks )
> > +        return 0;
> > +
> > +    /*
> > +     * Both start and size of the free region should be 2MB aligned to
> > +     * potentially allow superpage mapping.
> > +     */
> > +    start =3D (s + SZ_2M - 1) & ~(SZ_2M - 1);
> > +    if ( start > e )
> > +        return 0;
> > +
> > +    /*
> > +     * e is actually "end-1" because it is called by rangeset function=
s
> > +     * which are inclusive of the last address.
> > +     */
> > +    e +=3D 1;
> > +    size =3D (e - start) & ~(SZ_2M - 1);
> > +
> > +    /* Find the insert position (descending order). */
> > +    for ( i =3D 0; i < free_regions->nr_banks ; i++)
> CODING_STYLE:
> for ( i =3D 0; i < free_regions->nr_banks; i++ )
>
> > +        if ( size > free_regions->bank[i].size )
> > +            break;
> > +
> > +    /* Move the other banks to make space. */
> > +    for ( j =3D free_regions->nr_banks; j > i ; j-- )
> > +    {
> > +        free_regions->bank[j].start =3D free_regions->bank[j - 1].star=
t;
> > +        free_regions->bank[j].size =3D free_regions->bank[j - 1].size;
> > +    }
> > +
> > +    free_regions->bank[i].start =3D start;
> > +    free_regions->bank[i].size =3D size;
> > +    free_regions->nr_banks++;
> The algorithm looks good. In my head I thought you will use sort() after =
adding all the banks, but
> I'm not sure which solution is more efficient. Probably yours and it avoi=
ds implementing cmp and swap functions.
>
> > +
> > +    return 0;
> > +}
> > +
> >  /*
> >   * Find unused regions of Host address space which can be exposed to d=
omain
> >   * using the host memory layout. In order to calculate regions we excl=
ude every
> > @@ -908,10 +953,10 @@ int __init add_ext_regions(unsigned long s_gfn, u=
nsigned long e_gfn,
> >  static int __init find_unallocated_memory(const struct kernel_info *ki=
nfo,
> >                                            const struct membanks *mem_b=
anks[],
> >                                            unsigned int nr_mem_banks,
> > -                                          struct membanks *free_region=
s,
> >                                            int (*cb)(unsigned long s_gf=
n,
> >                                                      unsigned long e_gf=
n,
> > -                                                    void *data))
> > +                                                    void *data),
> > +                                          struct membanks *free_region=
s)
> >  {
> >      const struct membanks *mem =3D bootinfo_get_mem();
> >      struct rangeset *unalloc_mem;
> > @@ -977,6 +1022,108 @@ out:
> >      return res;
> >  }
> >
> > +void __init allocate_memory(struct domain *d, struct kernel_info *kinf=
o)
> > +{
> > +    struct membanks *mem =3D kernel_info_get_mem(kinfo);
> > +    unsigned int i, nr_banks =3D GUEST_RAM_BANKS;
> > +    struct membanks *hwdom_free_mem =3D NULL;
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
> > +        struct membanks *gnttab =3D xzalloc_flex_struct(struct membank=
s, bank, 1);
> > +        /*
> > +         * Exclude the following regions:
> > +         * 1) Remove reserved memory
> > +         * 2) Grant table assigned to Dom0
> Can we not mention 'Dom0'? In the future hwdom may not necessarily be dom=
0. Especially that
> in other places you mention hwdom.
>
> > +         */
> > +        const struct membanks *mem_banks[] =3D {
> > +            bootinfo_get_reserved_mem(),
> > +            gnttab,
> > +        };
> > +
> > +        ASSERT(llc_coloring_enabled);
> Remove this assert. There's nothing LLC special here and this could be re=
-used in the future
> to provide non 1:1 hwdom.
>
> > +
> > +        if ( !gnttab )
> > +            goto fail;
> > +
> > +        gnttab->nr_banks =3D 1;
> > +        gnttab->bank[0].start =3D kinfo->gnttab_start;
> > +        gnttab->bank[0].size =3D kinfo->gnttab_start + kinfo->gnttab_s=
ize;
> Incorrect. You assign to 'end' to'size'. It should simply be:
> gnttab->bank[0].size =3D kinfo->gnttab_size.
>
> > +
> > +        hwdom_free_mem =3D xzalloc_flex_struct(struct membanks, bank,
> > +                                             NR_MEM_BANKS);
> > +        if ( !hwdom_free_mem )
> > +            goto fail;
> > +
> > +        hwdom_free_mem->max_banks =3D NR_MEM_BANKS;
> > +
> > +        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_=
banks),
> > +                                     add_hwdom_free_regions, hwdom_fre=
e_mem) )
> > +            goto fail;
> > +
> > +        nr_banks =3D hwdom_free_mem->nr_banks;
> > +        xfree(gnttab);
> > +    }
> > +
> > +    for ( i =3D 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_=
banks-- )
> > +    {
> > +        paddr_t bank_start, bank_size;
> > +
> > +        if ( is_hardware_domain(d) )
> > +        {
> > +            bank_start =3D hwdom_free_mem->bank[i].start;
> > +            bank_size =3D hwdom_free_mem->bank[i].size;
> > +        }
> > +        else
> > +        {
> > +            const uint64_t bankbase[] =3D GUEST_RAM_BANK_BASES;
> > +            const uint64_t banksize[] =3D GUEST_RAM_BANK_SIZES;
> > +
> > +            if ( i >=3D GUEST_RAM_BANKS )
> > +                goto fail;
> > +
> > +            bank_start =3D bankbase[i];
> > +            bank_size =3D banksize[i];
> > +        }
> > +
> > +        bank_size =3D MIN(bank_size, kinfo->unassigned_mem);
> > +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), ba=
nk_size) )
> > +            goto fail;
> > +    }
> > +
> > +    if ( kinfo->unassigned_mem )
> > +        goto fail;
> > +
> > +    for( i =3D 0; i < mem->nr_banks; i++ )
> > +    {
> > +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%l=
dMB)\n",
> > +               d,
> > +               i,
> > +               mem->bank[i].start,
> > +               mem->bank[i].start + mem->bank[i].size,
> > +               /* Don't want format this as PRIpaddr (16 digit hex) */
> > +               (unsigned long)(mem->bank[i].size >> 20));
> > +    }
> > +
> > +    xfree(hwdom_free_mem);
> > +    return;
> > +
> > +fail:
> > +    panic("Failed to allocate requested domain memory."
> > +          /* Don't want format this as PRIpaddr (16 digit hex) */
> > +          " %ldKB unallocated. Fix the VMs configurations.\n",
> > +          (unsigned long)kinfo->unassigned_mem >> 10);
> > +}
> > +
> >  static int __init handle_pci_range(const struct dt_device_node *dev,
> >                                     uint64_t addr, uint64_t len, void *=
data)
> >  {
> > @@ -1176,7 +1323,7 @@ static int __init find_host_extended_regions(cons=
t struct kernel_info *kinfo,
> >      gnttab->bank[0].size =3D kinfo->gnttab_size;
> >
> >      res =3D find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_b=
anks),
> > -                                  ext_regions, add_ext_regions);
> > +                                  add_ext_regions, ext_regions);
> >      xfree(gnttab);
> >
> >      return res;
> > @@ -1235,7 +1382,7 @@ int __init make_hypervisor_node(struct domain *d,
> >
> >          ext_regions->max_banks =3D NR_MEM_BANKS;
> >
> > -        if ( is_domain_direct_mapped(d) )
> > +        if ( domain_use_host_layout(d) )
> >          {
> >              if ( !is_iommu_enabled(d) )
> >                  res =3D find_host_extended_regions(kinfo, ext_regions)=
;
> > @@ -2164,8 +2311,11 @@ static int __init construct_dom0(struct domain *=
d)
> >      /* type must be set before allocate_memory */
> >      d->arch.type =3D kinfo.type;
> >  #endif
> > -    allocate_memory_11(d, &kinfo);
> >      find_gnttab_region(d, &kinfo);
> This re-ordering should be mentioned in commit msg.
>
> > +    if ( is_domain_direct_mapped(d) )
> > +        allocate_memory_11(d, &kinfo);
> > +    else
> > +        allocate_memory(d, &kinfo);
> >
> >      rc =3D process_shm_chosen(d, &kinfo);
> >      if ( rc < 0 )
> > diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/inc=
lude/asm/domain_build.h
> > index e712afbc7f..b0d646e173 100644
> > --- a/xen/arch/arm/include/asm/domain_build.h
> > +++ b/xen/arch/arm/include/asm/domain_build.h
> > @@ -11,6 +11,7 @@ bool allocate_domheap_memory(struct domain *d, paddr_=
t tot_size,
> >                               alloc_domheap_mem_cb cb, void *extra);
> >  bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> >                            paddr_t tot_size);
> > +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> >  int construct_domain(struct domain *d, struct kernel_info *kinfo);
> >  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
> >  int make_chosen_node(const struct kernel_info *kinfo);
> > @@ -54,6 +55,9 @@ static inline int prepare_acpi(struct domain *d, stru=
ct kernel_info *kinfo)
> >  int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
> >  #endif
> >
> > +typedef int (*add_free_regions_fn)(unsigned long s_gfn, unsigned long =
e_gfn,
> > +                                   void *data);
> Random code? Remove.
>
> With the remarks addressed:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal

Thanks.

- Carlo


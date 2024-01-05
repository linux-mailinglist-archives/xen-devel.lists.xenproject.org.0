Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F58258AC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662270.1032311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLnQm-0007He-9u; Fri, 05 Jan 2024 16:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662270.1032311; Fri, 05 Jan 2024 16:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLnQm-0007FG-75; Fri, 05 Jan 2024 16:52:24 +0000
Received: by outflank-mailman (input) for mailman id 662270;
 Fri, 05 Jan 2024 16:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Ewp=IP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rLnQk-0007Dr-Cd
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:52:22 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca1b7c3e-abea-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 17:52:19 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a27733ae1dfso206813166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:52:19 -0800 (PST)
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
X-Inumbo-ID: ca1b7c3e-abea-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704473539; x=1705078339; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRqeJhVhQtExIxhkrij+EMClpXEiYKfGl59c7a/eTbU=;
        b=2GUdNM3ye1Y0WWWkZjqYBM8+YYEXpbqy5LdyGUwy7HcqtKLXuGYyyGt0ipLntR+fD2
         gOa7WDuxoAa1Op68YsoHY1i6CqqabZudCHk1NzPa/xyYzR45Z0d0obTh346hN9xouCMV
         cVPBqyL85UDlbXvDsPT+yeRAUeS2WieTxYLg8ZbB/8GKYo8zaXoS1rIybV/P0VKNGR08
         ehpFiK//aGA5OO06KElObxVKx6/EB8ljLVTlsquYoXHjfMFv4uoYImsngTMp3OCzgx7/
         fLJqhUXkqIkdHCkcLhTap59rpros9cnT+AYLYJ4/7MOguC2nEcZhNIwezp1IIf+PgVIQ
         HNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704473539; x=1705078339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRqeJhVhQtExIxhkrij+EMClpXEiYKfGl59c7a/eTbU=;
        b=jUCqZEZfQmGYVvaXtpKACLTvoNCK23m5g1fU2cD6JVpzA7uf8am+Nxy3Vn7uhhPUI7
         Dt56+lRhFWLzyvwGySd7ELkMT5vreJ/bQNCIN7DUzGqIZo8t1e1UaekjBVrjvS9A8ceu
         NdGdH6QG47SvawhWwq6KvIZf4nsO4NepCoWggvBli5jdwHMdQjaYagezy9RwROFfX+hO
         wG+szF01xqUd/AGwNPgzP0J9C9lDUz8jY4n723CqIzQSTh6IskGrVS5WCzOYW/ZVFSI1
         miyxZPEqeiIYe5EzAdSllbL6lB3w8YxGU265TEHV14SZrY5NArDgQTPN6fCO//0RwXQ+
         D3uw==
X-Gm-Message-State: AOJu0Yxc1ndbNjS20uPR/uhVL1k1unZ4vvgrenJD2V0G2Mk37ANXFv4z
	tek2/4pTbKaSAyR8WrEeVP1iF1wtXu6TjE9hf/AlBeKP9dPaWEZ807Z6C5FXkuk=
X-Google-Smtp-Source: AGHT+IEQ3LHwcunMj1HSOHeIXxPD5DwZX2LpsOK0SmnefzxPVPnAgRN4Y1vI4EnYPojZP9+LsUmnQTIN33w7+gSGwg8=
X-Received: by 2002:a17:907:1b26:b0:a29:8f93:9e20 with SMTP id
 mp38-20020a1709071b2600b00a298f939e20mr298079ejc.130.1704473539140; Fri, 05
 Jan 2024 08:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-4-carlo.nonato@minervasys.tech> <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
In-Reply-To: <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 5 Jan 2024 17:52:08 +0100
Message-ID: <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Jan 4, 2024 at 8:54=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This commit allows the user to set the cache coloring configuration for
> > Dom0 via a command line parameter.
> > Since cache coloring and static memory are incompatible, direct mapping
> > Dom0 isn't possible when coloring is enabled.
> >
> > A common configuration syntax for cache colors is also introduced.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v5:
> > - Carlo Nonato as the new author
> > - moved dom0 colors parsing (parse_colors()) in this patch
> > - added dom0_set_llc_colors() to set dom0 colors after creation
> > - moved color allocation and checking in this patch
> > - error handling when allocating color arrays
> > - FIXME: copy pasted allocate_memory() cause it got moved
> > v4:
> > - dom0 colors are dynamically allocated as for any other domain
> >    (colors are duplicated in dom0_colors and in the new array, but logi=
c
> >    is simpler)
> > ---
> >   docs/misc/arm/cache-coloring.rst        |  29 ++++++
> >   docs/misc/xen-command-line.pandoc       |   9 ++
> >   xen/arch/arm/domain_build.c             |  60 ++++++++++-
> >   xen/arch/arm/include/asm/llc-coloring.h |   1 +
> >   xen/arch/arm/llc-coloring.c             | 128 +++++++++++++++++++++++=
+
> >   5 files changed, 224 insertions(+), 3 deletions(-)
> >
> > diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-col=
oring.rst
> > index eabf8f5d1b..acf82c3df8 100644
> > --- a/docs/misc/arm/cache-coloring.rst
> > +++ b/docs/misc/arm/cache-coloring.rst
> > @@ -84,6 +84,35 @@ More specific documentation is available at `docs/mi=
sc/xen-command-line.pandoc`.
> >   +----------------------+-------------------------------+
> >   | ``llc-way-size``     | set the LLC way size          |
> >   +----------------------+-------------------------------+
> > +| ``dom0-llc-colors``  | Dom0 color configuration      |
> > ++----------------------+-------------------------------+
> > +
> > +Colors selection format
> > +***********************
> > +
> > +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs)=
,
> > +the color selection can be expressed using the same syntax. In particu=
lar a
> > +comma-separated list of colors or ranges of colors is used.
> > +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusiv=
e on both
> > +sides.
> > +
> > +Note that:
> > +
> > +- no spaces are allowed between values.
> > +- no overlapping ranges or duplicated colors are allowed.
> > +- values must be written in ascending order.
> > +
> > +Examples:
> > +
> > ++-------------------+-----------------------------+
> > +| **Configuration** | **Actual selection**        |
> > ++-------------------+-----------------------------+
> > +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
> > ++-------------------+-----------------------------+
> > +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
> > ++-------------------+-----------------------------+
> > +| 0                 | [0]                         |
> > ++-------------------+-----------------------------+
> >
> >   Known issues and limitations
> >   ****************************
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 22d2d5b6cf..51f6adf035 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> >
> >   Specify a list of IO ports to be excluded from dom0 access.
> >
> > +### dom0-llc-colors (arm64)
> > +> `=3D List of [ <integer> | <integer>-<integer> ]`
>
> Someone reading only xen-command-line.pandoc would not know how each
> item of the list is separated. Can this be clarified?

Isn't it already known that the list is comma separated? It's written at th=
e
beginning of this file for the "List" type.
I can also point to cache-coloring documentation if needed.

> > +
> > +> Default: `All available LLC colors`
> > +
> > +Specify dom0 LLC color configuration. This options is available only w=
hen
> > +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all ava=
ilable
> > +colors are chosen and the user is warned on Xen serial console.
>
> I would drop anything starting from  "and the user ...". This is really
> implementation define and the reader of the doc should not need to know
> that.
>
> > +
> >   ### dom0_max_vcpus
> >
> >   Either:
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6945b9755d..482c059bfa 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2,6 +2,7 @@
> >   #include <xen/init.h>
> >   #include <xen/compile.h>
> >   #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >   #include <xen/mm.h>
> >   #include <xen/param.h>
> >   #include <xen/domain_page.h>
> > @@ -414,7 +415,7 @@ static void __init allocate_memory_11(struct domain=
 *d,
> >       }
> >   }
> >
> > -#ifdef CONFIG_DOM0LESS_BOOT
> > +#if defined(CONFIG_DOM0LESS_BOOT) || defined(CONFIG_LLC_COLORING)
> >   bool __init allocate_bank_memory(struct domain *d, struct kernel_info=
 *kinfo,
> >                                    gfn_t sgfn, paddr_t tot_size)
> >   {
> > @@ -478,6 +479,49 @@ bool __init allocate_bank_memory(struct domain *d,=
 struct kernel_info *kinfo,
> >   }
> >   #endif
> >
> > +static void __init allocate_memory(struct domain *d, struct kernel_inf=
o *kinfo)
>
> I saw the discussion on the cover letter. I agree that allocate_memory()
> should be moved back here (ideally in a separate patch) to avoid
> duplication.
>
> > +{
> > +    unsigned int i;
> > +    paddr_t bank_size;
> > +
> > +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n=
",
> > +           /* Don't want format this as PRIpaddr (16 digit hex) */
> > +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> > +
> > +    kinfo->mem.nr_banks =3D 0;
> > +    bank_size =3D MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> > +    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE)=
,
> > +                               bank_size) )
> > +        goto fail;
> > +
> > +    bank_size =3D MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> > +    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE)=
,
> > +                               bank_size) )
> > +        goto fail;
> > +
> > +    if ( kinfo->unassigned_mem )
> > +        goto fail;
> > +
> > +    for( i =3D 0; i < kinfo->mem.nr_banks; i++ )
> > +    {
> > +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%l=
dMB)\n",
> > +               d,
> > +               i,
> > +               kinfo->mem.bank[i].start,
> > +               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
> > +               /* Don't want format this as PRIpaddr (16 digit hex) */
> > +               (unsigned long)(kinfo->mem.bank[i].size >> 20));
> > +    }
> > +
> > +    return;
> > +
> > +fail:
> > +    panic("Failed to allocate requested domain memory."
> > +          /* Don't want format this as PRIpaddr (16 digit hex) */
> > +          " %ldKB unallocated. Fix the VMs configurations.\n",
> > +          (unsigned long)kinfo->unassigned_mem >> 10);
> > +}
> > +
> >   /*
> >    * When PCI passthrough is available we want to keep the
> >    * "linux,pci-domain" in sync for every host bridge.
> > @@ -2072,7 +2116,10 @@ static int __init construct_dom0(struct domain *=
d)
> >       /* type must be set before allocate_memory */
> >       d->arch.type =3D kinfo.type;
> >   #endif
> > -    allocate_memory_11(d, &kinfo);
> > +    if ( is_domain_llc_colored(d) )
>
> To me the choice here is more related to whether the domain direct
> mapped rather than the color itself. So I would rather prefer if we use
> is_domain_direct_mapped() even if this means the compiler will not be
> able to drop optimize the if when cache coloring is disabled.
>
> > +        allocate_memory(d, &kinfo);
> > +    else
> > +        allocate_memory_11(d, &kinfo);
> >       find_gnttab_region(d, &kinfo);
> >
> >       rc =3D process_shm_chosen(d, &kinfo);
> > @@ -2116,6 +2163,7 @@ void __init create_dom0(void)
> >           .max_maptrack_frames =3D -1,
> >           .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versi=
on),
> >       };
> > +    unsigned int flags =3D CDF_privileged;
> >       int rc;
> >
> >       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > @@ -2143,10 +2191,16 @@ void __init create_dom0(void)
> >               panic("SVE vector length error\n");
> >       }
> >
> > -    dom0 =3D domain_create(0, &dom0_cfg, CDF_privileged | CDF_directma=
p);
> > +    if ( !llc_coloring_enabled )
> > +        flags |=3D CDF_directmap;
> > +
> > +    dom0 =3D domain_create(0, &dom0_cfg, flags);
> >       if ( IS_ERR(dom0) )
> >           panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0)=
);
> >
> > +    if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> > +        panic("Error initializing LLC coloring for domain 0 (rc =3D %d=
)", rc);
> > +
> >       if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> >           panic("Error creating domain 0 vcpu0\n");
> >
> > diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/inc=
lude/asm/llc-coloring.h
> > index 7885e9e3f5..ee5551e3cc 100644
> > --- a/xen/arch/arm/include/asm/llc-coloring.h
> > +++ b/xen/arch/arm/include/asm/llc-coloring.h
> > @@ -14,6 +14,7 @@
> >   #include <xen/init.h>
> >
> >   bool __init llc_coloring_init(void);
> > +int dom0_set_llc_colors(struct domain *d);
> >
> >   #endif /* __ASM_ARM_COLORING_H__ */
> >
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > index 37d647f038..5ce58aba70 100644
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -26,6 +26,63 @@ size_param("llc-way-size", llc_way_size);
> >   /* Number of colors available in the LLC */
> >   static unsigned int __ro_after_init nr_colors =3D CONFIG_NR_LLC_COLOR=
S;
> >
> > +static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
> > +static unsigned int __ro_after_init dom0_num_colors;
>
> Any reason to keep dom0_colors/dom0_num_colors after init?

Nope.

> > +
> > +/*
> > + * Parse the coloring configuration given in the buf string, following=
 the
> > + * syntax below.
> > + *
> > + * COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> > + * RANGE               ::=3D COLOR-COLOR
> > + *
> > + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15=
,16.
> > + */
> > +static int parse_color_config(const char *buf, unsigned int *colors,
> > +                              unsigned int *num_colors)
> > +{
> > +    const char *s =3D buf;
> > +
> > +    if ( !colors || !num_colors )
> > +        return -EINVAL;
> > +
> > +    *num_colors =3D 0;
> > +
> > +    while ( *s !=3D '\0' )
> > +    {
> > +        if ( *s !=3D ',' )
> > +        {
> > +            unsigned int color, start, end;
> > +
> > +            start =3D simple_strtoul(s, &s, 0);
> > +
> > +            if ( *s =3D=3D '-' )    /* Range */
> > +            {
> > +                s++;
> > +                end =3D simple_strtoul(s, &s, 0);
> > +            }
> > +            else                /* Single value */
> > +                end =3D start;
> > +
> > +            if ( start > end || (end - start) > UINT_MAX - *num_colors=
 ||
>
> I am always confused with operatator predence and this is even more
> confusing because some similar operations have parentheses but not
> others. Can you ask you to use () around UINT_MAX - *num_colors.
>
> > +                 *num_colors + (end - start) >=3D nr_colors )
>
> Same here. This will make a lot more obvious what you intend to write.
>
> > +                return -EINVAL;
> > +            for ( color =3D start; color <=3D end; color++ )
> > +                colors[(*num_colors)++] =3D color;
> > +        }
> > +        else
> > +            s++;
> > +    }
> > +
> > +    return *s ? -EINVAL : 0;
> > +}
> > +
> > +static int __init parse_dom0_colors(const char *s)
> > +{
> > +    return parse_color_config(s, dom0_colors, &dom0_num_colors);
> > +}
> > +custom_param("dom0-llc-colors", parse_dom0_colors);
> > +
> >   /* Return the LLC way size by probing the hardware */
> >   static unsigned int __init get_llc_way_size(void)
> >   {
> > @@ -102,6 +159,28 @@ static void dump_coloring_info(unsigned char key)
> >       printk("Number of LLC colors supported: %u\n", nr_colors);
> >   }
> >
> > +static bool check_colors(unsigned int *colors, unsigned int num_colors=
)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( num_colors > nr_colors )
> > +    {
> > +        printk(XENLOG_ERR "Number of LLC colors requested > %u\n", nr_=
colors);
> > +        return false;
> > +    }
> > +
> > +    for ( i =3D 0; i < num_colors; i++ )
> > +    {
> > +        if ( colors[i] >=3D nr_colors )
> > +        {
> > +            printk(XENLOG_ERR "LLC color %u >=3D %u\n", colors[i], nr_=
colors);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >   bool __init llc_coloring_init(void)
> >   {
> >       if ( !llc_way_size && !(llc_way_size =3D get_llc_way_size()) )
> > @@ -150,6 +229,55 @@ void domain_dump_llc_colors(struct domain *d)
> >       print_colors(d->llc_colors, d->num_llc_colors);
> >   }
> >
> > +static int domain_alloc_colors(struct domain *d, unsigned int num_colo=
rs)
> > +{
> > +    d->num_llc_colors =3D num_colors;
>
> Shouldn't this be set *only* after the array was allocated?

Yes, it works also like I did, but it's cleaner like you said. I can also d=
rop
the next if.

> > +
> > +    if ( !num_colors )
> > +        return 0;
> > +
> > +    d->llc_colors =3D xmalloc_array(unsigned int, num_colors);
>
> Can I ask to introduce malloc and free within the same patch? I know
> this could introduce unused temporarily unused code. But at least it is
> easier to confirm that the two paths are correct.

Ok.

> > +    if ( !d->llc_colors )
> > +    {
> > +        printk("Can't allocate LLC colors for domain %pd\n", d);
>
> NIT: Above you use XENLOG_ERR for printk. But not here. To me they have
> the same severity. So can you explain the difference?

Just forgot it.

> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int domain_check_colors(struct domain *d)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( !d->num_llc_colors )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "LLC color config not found for %pd. Using default\n", =
d);
> > +        if ( domain_alloc_colors(d, nr_colors) )
> > +            return -ENOMEM;
> > +        for ( i =3D 0; i < nr_colors; i++ )
> > +            d->llc_colors[i] =3D i;
> > +    }
> > +    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int dom0_set_llc_colors(struct domain *d)
> > +{
> > +    if ( domain_alloc_colors(d, dom0_num_colors) )
> > +        return -ENOMEM;
> > +
> > +    memcpy(d->llc_colors, dom0_colors, sizeof(unsigned int) * dom0_num=
_colors);
> > +
> > +    return domain_check_colors(d);
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
>
> Cheers,
>
> --
> Julien Grall

Thanks.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DBD60CA72
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429766.680982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHYt-0004Ef-Hi; Tue, 25 Oct 2022 10:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429766.680982; Tue, 25 Oct 2022 10:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHYt-0004Bk-EP; Tue, 25 Oct 2022 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 429766;
 Tue, 25 Oct 2022 10:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6Q6=22=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1onHYr-0004Be-T6
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:53:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43f8819d-5453-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 12:53:31 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id t15so889523edd.4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 03:53:31 -0700 (PDT)
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
X-Inumbo-ID: 43f8819d-5453-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6cK4YnN8c5MzhKZLWqtmaFyl9yTbv5l1WkvHjsdMUD8=;
        b=PQm9JAhM4PrVc/5dAz+Y1u13UWHdXYFwTtayF5Qsuljn4QUSykWpkMacKENAHzB9Uq
         DH6Wh2oCQX2B3jONl+zScXjdndcjQsUIRynwPI91e4hypPrDAAOk3hJQ7MITlNjAhn2T
         C6wGvt09Sb+WPlQpFV5JdMHMZGzswZ9gUN5YjVJpy+oJcnt/Ai05jYeUoUO5cPZui6LO
         B/1ZmWh5nsezfbO/BGijdG4/8dHlJUGRSIGHilocru/U+9zk2mD/b5HY9eryHodcoCiK
         zi9B7z2T/odDei1L4MXOeGrV+DEh1PKZZ52HqrrK7Gf6leIB6zbIQwwdDDYG9UqyZUXw
         4thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cK4YnN8c5MzhKZLWqtmaFyl9yTbv5l1WkvHjsdMUD8=;
        b=OB91LNsAeAHVNDRwSj8PHAIROwrm88DZL3K4OfGrWQabEfRRbhiMloQxQIrhSa3ejq
         6IjlulsYcD0V+dxNQyo07EK5So7/X+PN79D8BuOs5A/UevjithLO3zM4zWgeW1aR5wYO
         yaMMFnr/dE74LhezJtOXubVPqhLwc07+G3n9JM0kZVHldPCFu7kzLaeKmZlZOfXzs0oE
         NGelPECs62uNHQHe7RRyu7oGhhmLSbLo3LZkuG7VqilXYfEiv7V/CVVbcjnXVXO2jB0o
         RNH0ZQyeMvjoX4xGRt1SGdasmsQ8dKgkCeK4vNk1uJ+DI10Q2KG2xqPr75RjPl4s1bNP
         iXOg==
X-Gm-Message-State: ACrzQf07zdQeX/0qMkiMbR8PpBAH6voOHwdYGF9kElrBinnM1JPlW+oN
	fmNzvvcp0WoZWSUD33sx+aLNp/BRgQ1cpLVs1azBGQ==
X-Google-Smtp-Source: AMsMyM4Dzt4MyzfLCXZoPMKWXIXVHc7Vnl8FbN676vjk72fNtlHO+AjT1wjsRtHQQt+opWILAlQtVVLG2qH9TAiG/QI=
X-Received: by 2002:a05:6402:2211:b0:461:5d0a:6678 with SMTP id
 cq17-20020a056402221100b004615d0a6678mr18790838edb.378.1666695211346; Tue, 25
 Oct 2022 03:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech> <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
In-Reply-To: <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 25 Oct 2022 12:53:20 +0200
Message-ID: <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com>
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for domains
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Fri, Oct 21, 2022 at 8:02 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 26/08/2022 13:51, Carlo Nonato wrote:
> > This commit adds array pointers to domains as well as to the hypercall
> > and configuration structure employed in domain creation. The latter is used
> > both by the toolstack and by Xen itself to pass configuration data to the
> > domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
> > able to access guest memory in the first case. This implies special care for
> > the copy of the configuration data into the domain data, meaning that a
> > discrimination variable for the two possible code paths (coming from Xen or
> > from the toolstack) is needed.
>
> So this means that a toolstack could set from_guest. I know the
> toolstack is trusted... However, we should try to limit when the trust
> when this is possible.
>
> In this case, I would consider to modify the prototype of
> domain_create() to pass internal information.

Doing as you said isn't a bit too invasive? I should also change all the call
sites of domain_create() and this means x86 too.
Isn't there an easier way to spot a guest address? Maybe just looking at the
address value... Or maybe adding an internal flag to the do_domctl() path.

> > The initialization and free functions for colored domains are also added.
> > The former is responsible for allocating and populating the color array
> > of the domain and it also checks for configuration issues. One of those
> > issues is enabling both coloring and directmap for the domain because they
> > contradicts one another. Since that, Dom0 must not be created with the
> > directmap flag.
> > The latter instead frees allocated memory.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> >   docs/misc/arm/cache-coloring.rst    |  7 ++--
> >   xen/arch/arm/coloring.c             | 56 +++++++++++++++++++++++++++++
> >   xen/arch/arm/domain.c               | 11 ++++++
> >   xen/arch/arm/domain_build.c         | 13 +++++--
> >   xen/arch/arm/include/asm/coloring.h |  7 ++++
> >   xen/arch/arm/include/asm/domain.h   |  4 +++
> >   xen/include/public/arch-arm.h       |  8 +++++
> >   7 files changed, 102 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> > index c7adcb0f1f..345d97cb56 100644
> > --- a/docs/misc/arm/cache-coloring.rst
> > +++ b/docs/misc/arm/cache-coloring.rst
> > @@ -13,7 +13,7 @@ In order to enable and use it, few steps are needed.
> >     (refer to menuconfig help for value meaning and when it should be changed).
> >
> >           CONFIG_MAX_CACHE_COLORS=<n>
> > -- Assign colors to Dom0 using the `Color selection format`_ (see
> > +- Assign colors to domains using the `Color selection format`_ (see
> >     `Coloring parameters`_ for more documentation pointers).
> >
> >   Background
> > @@ -109,4 +109,7 @@ Coloring parameters
> >
> >   LLC way size (as previously discussed) and Dom0 colors can be set using the
> >   appropriate command line parameters. See the relevant documentation in
> > -"docs/misc/xen-command-line.pandoc".
> > \ No newline at end of file
> > +"docs/misc/xen-command-line.pandoc".
> > +
> > +Note that if no color configuration is provided for domains, they fallback to
> > +the default one, which corresponds simply to all available colors.
> > \ No newline at end of file
> > diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> > index c010ebc01b..2b37cda067 100644
> > --- a/xen/arch/arm/coloring.c
> > +++ b/xen/arch/arm/coloring.c
> > @@ -22,6 +22,7 @@
> >    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> >    */
> >   #include <xen/errno.h>
> > +#include <xen/guest_access.h>
> >   #include <xen/keyhandler.h>
> >   #include <xen/param.h>
> >   #include <xen/types.h>
> > @@ -211,6 +212,61 @@ bool __init coloring_init(void)
> >       return true;
> >   }
> >
> > +int domain_coloring_init(struct domain *d,
> > +                         const struct xen_arch_domainconfig *config)
> > +{
> > +    if ( is_domain_direct_mapped(d) )
> > +    {
> > +        printk(XENLOG_ERR
> > +               "Can't enable coloring and directmap at the same time for %pd\n",
> > +               d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( is_hardware_domain(d) )
> > +    {
> > +        d->arch.colors = dom0_colors;
> > +        d->arch.num_colors = dom0_num_colors;
> > +    }
>
> I think it would be better if we allocate an array also for the HW
> domain. This is not going to require too much extra memory and will help
> the code to be simpler.

Yep.

> I would also pass the color to domain_create(). So there is no logic
> specific to the HW domain here.

If we can avoid changing domain_create(), I can simply use
struct xen_domctl_createdomain to pass this data.

> > +    else if ( config->num_colors == 0 )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Color config not found for %pd. Using default\n", d);
> > +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
> > +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
> Ah, so your check in set_default_domain_colors() is here to cater this
> case? I would prefer if we check the allocation before using it. This
> will make it more obvious compare to expecting
> set_default_domain_colors() checking for NULL.
>
> > +    }
> > +    else
> > +    {
> > +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
> > +        d->arch.num_colors = config->num_colors;
> > +        if ( config->from_guest )
> > +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
> > +        else
> > +            memcpy(d->arch.colors, config->colors.p,
> > +                   sizeof(unsigned int) * config->num_colors);
>
> See my remark above.
>
> > +    }
> > +
> > +    if ( !d->arch.colors )
> > +    {
> > +        printk(XENLOG_ERR "Colors allocation failed for %pd\n", d);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    if ( !check_colors(d->arch.colors, d->arch.num_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad color config for %pd\n", d);
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +void domain_coloring_free(struct domain *d)
> > +{
> > +    if ( !is_hardware_domain(d) )
> > +        xfree(d->arch.colors);
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 2d6253181a..c6fa8adc99 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -23,6 +23,9 @@
> >   #include <xen/wait.h>
> >
> >   #include <asm/alternative.h>
> > +#ifdef CONFIG_CACHE_COLORING
> > +#include <asm/coloring.h>
> > +#endif
> >   #include <asm/cpuerrata.h>
> >   #include <asm/cpufeature.h>
> >   #include <asm/current.h>
> > @@ -712,6 +715,11 @@ int arch_domain_create(struct domain *d,
> >       ioreq_domain_init(d);
> >   #endif
> >
> > +#ifdef CONFIG_CACHE_COLORING
>
> When !CONFIG_CACHE_COLORING, we should check that the color is not
> specified.
>
> > +    if ( (rc = domain_coloring_init(d, &config->arch)) )
> > +        goto fail;
> > +#endif
> > +
> >       /* p2m_init relies on some value initialized by the IOMMU subsystem */
> >       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
> >           goto fail;
> > @@ -807,6 +815,9 @@ void arch_domain_destroy(struct domain *d)
> >                          get_order_from_bytes(d->arch.efi_acpi_len));
> >   #endif
> >       domain_io_free(d);
> > +#ifdef CONFIG_CACHE_COLORING
> > +    domain_coloring_free(d);
> > +#endif
>
> See my remark in patch #1 about the #ifdef.
>
> >   }
> >
> >   void arch_domain_shutdown(struct domain *d)
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 3fd1186b53..4d4cb692fc 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -33,6 +33,12 @@
> >   #include <xen/grant_table.h>
> >   #include <xen/serial.h>
> >
> > +#ifdef CONFIG_CACHE_COLORING
> > +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
> > +#else
> > +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
> > +#endif
>
> I can't remember if I asked it before and it doesn't seem to written
> everywhere. This check suggest that it is not possible to use the same
> Xen binary for coloring and non-coloring.

If coloring is enabled, all the domains are colored (even if they use
zero colors
because of the default selection). This means that they are going to use
the colored allocator. Since this all-or-nothing design, if coloring is
enabled, dom0 is assumed to be colored, which implies removing the directmap
flag. So if what you mean with "same Xen binary for coloring and non-coloring"
is to have a way to select at runtime if a domain is colored, or if Xen
itself is colored, the answer is no, we don't have this right now.

> At the moment, we have been able to have all the features in the same
> Xen binary. So what are the reasons for this restriction?

Not sure about the first sentence (you mean, until this patch?), but the
restriction is just because it's simpler. For example if we have to support
colored and non-colored domains at the same time, we probably need to
change something in the allocator (at least reserving more memory for the
buddy).

> > +
> >   static unsigned int __initdata opt_dom0_max_vcpus;
> >   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> >
> > @@ -3399,7 +3405,10 @@ static int __init construct_dom0(struct domain *d)
> >       /* type must be set before allocate_memory */
> >       d->arch.type = kinfo.type;
> >   #endif
> > -    allocate_memory_11(d, &kinfo);
> > +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
>
> Even if we can't have a single Xen binary yet, I would prefer if we
> avoid using directly IS_ENABLED(CONFIG_CACHE_COLORING). Instead it would
> be better to provide an helper that check whether the domain has cache
> coloring is enabled.
>
> That helper could use IS_ENABLED(CONFIG_CACHE_COLORING) if that still
> wanted. The advantage is we make it easier to modify the code.

Ok.

> > +        allocate_memory(d, &kinfo);
> > +    else
> > +        allocate_memory_11(d, &kinfo);
> >       find_gnttab_region(d, &kinfo);
> >
> >       /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
> > @@ -3455,7 +3464,7 @@ void __init create_dom0(void)
> >       if ( iommu_enabled )
> >           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> >
> > -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> > +    dom0 = domain_create(0, &dom0_cfg, XEN_DOM0_CREATE_FLAGS);
> >       if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
> >           panic("Error creating domain 0\n");
> >
> > diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> > index dd7eff5f07..60c8b1f079 100644
> > --- a/xen/arch/arm/include/asm/coloring.h
> > +++ b/xen/arch/arm/include/asm/coloring.h
> > @@ -25,7 +25,14 @@
> >   #define __ASM_ARM_COLORING_H__
> >
> >   #include <xen/init.h>
> > +#include <xen/sched.h>
> > +
> > +#include <public/arch-arm.h>
> >
> >   bool __init coloring_init(void);
> >
> > +int domain_coloring_init(struct domain *d,
> > +                         const struct xen_arch_domainconfig *config);
> > +void domain_coloring_free(struct domain *d);
> > +
> >   #endif /* !__ASM_ARM_COLORING_H__ */
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > index 26a8348eed..291f7c375d 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -58,6 +58,10 @@ struct arch_domain
> >   #ifdef CONFIG_ARM_64
> >       enum domain_type type;
> >   #endif
>
> NIT: Newline here please. So we keep each feature in their own block.
>
> > +#ifdef CONFIG_CACHE_COLORING
> > +    unsigned int *colors;
> > +    unsigned int num_colors;
> > +#endif >
> >       /* Virtual MMU */
> >       struct p2m_domain p2m;
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index c8b6058d3a..adf843a7a1 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> >   #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> >   #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> >
> > +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
>
> You don't seem to use "color_t" outside of arch-arm.h and we already
> define guest handle for "unsigned int". So can they be used?

That's because the guest handle for "unsigned int" is defined later
(in public/xen.h). We can also think of moving the coloring fields from this
struct to the common one (xen_domctl_createdomain) protecting them with
the proper #ifdef (but we are targeting only arm64...).

> > +
> >   struct xen_arch_domainconfig {
> >       /* IN/OUT */
> >       uint8_t gic_version;
> > @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
> >        *
> >        */
> >       uint32_t clock_frequency;
> > +    /* IN */
> > +    uint8_t from_guest;
>
> There is an implicit padding here and ...
> > +    /* IN */
> > +    uint16_t num_colors;
>
> ... here. For the ABI, we are trying to have all the padding explicit.
> So the layout of the structure is clear.

Isn't it true also for other fields like gic_version and tee_type?

> Also, DOMCTL is an unstable ABI, so I think it would not be necessary to
> check the padding are zeroed. If it were a stable ABI, then we would
> need to check so they can be re-used in the future.
>
> > +    /* IN */
> > +    XEN_GUEST_HANDLE(color_t) colors;
> >   };
>
> Lastly, assuming this is the first patch touching the domctl for next
> release, you will want to bump the XEN_DOMCTL_INTERFACE_VERSION.

Ok.

> Cheers,
>
> --
> Julien Grall

Thanks.

-- Carlo Nonato


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53022826CAA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663399.1033288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnmC-0005RL-IB; Mon, 08 Jan 2024 11:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663399.1033288; Mon, 08 Jan 2024 11:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnmC-0005Pl-FX; Mon, 08 Jan 2024 11:26:40 +0000
Received: by outflank-mailman (input) for mailman id 663399;
 Mon, 08 Jan 2024 11:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMnmB-0005Pf-2j
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:26:39 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92948fe-ae18-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:26:37 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso1224629a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:26:37 -0800 (PST)
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
X-Inumbo-ID: c92948fe-ae18-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704713197; x=1705317997; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyFKGUcEuqg3Z/RJsyxe5YWWuyiSjCRRf0HOKwhMM6Q=;
        b=dueqwkP1dnwKZv4pqqXRx6h+JUjXhaUvEvMKXeEzLU5Ab+IDUrSIjcYbuxMbBwhUKt
         I8p9M03VXK8grHmjX19PityXqFMa+ScPFK1ruInOaPsMeDQ8MnlVB8Cs42gzHlNxspcM
         XApi16He9XGvDATrayWN7T6vH9aLe+ft0Rbz1EqAsJ+WNToFRjmjsO69nUrXR+Ad8R8c
         UxfvIn6DTYjF7PoXMuAN5gOMcKBa8k+W/ExeNglWAaqdh8t+xFItRN2ibabRAmyl6so0
         qBvGqKn/drKZuVB9/y3V0y8SNcMUupsG+ISPkmcxS0nKi6pwjpJrRFydRua1FbHvI6r0
         1rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713197; x=1705317997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyFKGUcEuqg3Z/RJsyxe5YWWuyiSjCRRf0HOKwhMM6Q=;
        b=XOUpS28Hj2Y7MRKHdNnp8zz4fgdLhk635EkHbpSK8bSvqZzUablvaeluZlCW+27yI0
         lew60PBhFdlBfoFELQieS1DRB4gskttMmdZJFo1ysDYhgnWc03bQJllXVO4uroYCls8O
         vvYjgQqK4n/Kw3ldXrrvzCZS3f0+LUH+cl6XL6L+c6xbEm6gJxLm5Z55RIirg4NY0dRx
         j37EuLg8nesIeEP90KUlrusP/DcU4yRVlkJW/vyHWIm481Jc5QIsdfrDRh9Gxe+VTsLm
         2718UVUQ0/ztboBxkUn88cBAMI1JWG+A37TwWSg2FlcEhO1bt3RTsknRiKCDJjAHi2YT
         fMxg==
X-Gm-Message-State: AOJu0YxP6AtP5DC1uyXJqqveCIbvljZoXiMi/ymSUYaFVPm7vJzj3ePr
	i1vQ7x9nQ/jqoGKfkNN9z2bNvm5irZlfb49oCS/i3ch4dfy3gQ==
X-Google-Smtp-Source: AGHT+IEcScpKg8jv9vt9Z82UfLFwg/LHfW3R+gBQFvsO13jeMn39wE3H/ZyBH/Y+m76RhDmR04ifrU2Liu2z/03rwW4=
X-Received: by 2002:a17:906:b04f:b0:a28:813c:78d6 with SMTP id
 bj15-20020a170906b04f00b00a28813c78d6mr1432972ejb.45.1704713196816; Mon, 08
 Jan 2024 03:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-7-carlo.nonato@minervasys.tech> <849b166d-a1a1-407e-8a9c-e0beac6ee955@xen.org>
In-Reply-To: <849b166d-a1a1-407e-8a9c-e0beac6ee955@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:26:26 +0100
Message-ID: <CAG+AhRUs-Kd5N8LRDshjF8_UDf8H=ef_cdYzzvXc52D_FamTRw@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] xen/arm: add support for cache coloring
 configuration via device-tree
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, Jan 5, 2024 at 6:38=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This commit adds the "llc-colors" Device Tree attribute that can be use=
d
> > for DomUs and Dom0less color configurations. The syntax is the same use=
d
> > for every color config.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v5:
> > - static-mem check has been moved in a previous patch
> > - added domain_set_llc_colors_from_str() to set colors after domain cre=
ation
> > ---
> >   docs/misc/arm/cache-coloring.rst        | 48 ++++++++++++++++++++++++=
-
> >   docs/misc/arm/device-tree/booting.txt   |  4 +++
> >   xen/arch/arm/dom0less-build.c           | 13 +++++++
> >   xen/arch/arm/include/asm/llc-coloring.h |  1 +
> >   xen/arch/arm/llc-coloring.c             | 17 +++++++++
> >   5 files changed, 82 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-col=
oring.rst
> > index acf82c3df8..ae1dd8f4af 100644
> > --- a/docs/misc/arm/cache-coloring.rst
> > +++ b/docs/misc/arm/cache-coloring.rst
> > @@ -10,7 +10,7 @@ If needed, change the maximum number of colors with
> >   ``CONFIG_NR_LLC_COLORS=3D<n>``.
> >
> >   Compile Xen and the toolstack and then configure it via
> > -`Command line parameters`_.
> > +`Command line parameters`_. For DomUs follow `DomUs configuration`_.
> >
> >   Background
> >   **********
> > @@ -114,6 +114,52 @@ Examples:
> >   | 0                 | [0]                         |
> >   +-------------------+-----------------------------+
> >
> > +DomUs configuration
> > +*******************
> > +
> > +DomUs colors can be set via Device Tree, also for Dom0less configurati=
ons
> > +(documentation at `docs/misc/arm/device-tree/booting.txt`) using the
> > +``llc-colors`` option. For example:
> > +
> > +::
> > +
> > +    xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D1G dom0_max_vcpus=3D1 sched=3Dnull llc-coloring=3Don llc-way-size=3D64K =
dom0-llc-colors=3D2-6";
> > +    xen,dom0-bootargs "console=3Dhvc0 earlycon=3Dxen earlyprintk=3Dxen=
 root=3D/dev/ram0"
> > +
> > +    dom0 {
> > +        compatible =3D "xen,linux-zimage" "xen,multiboot-module";
> > +        reg =3D <0x0 0x1000000 0x0 15858176>;
> > +    };
> > +
> > +    dom0-ramdisk {
> > +        compatible =3D "xen,linux-initrd" "xen,multiboot-module";
> > +        reg =3D <0x0 0x2000000 0x0 20638062>;
> > +    };
> > +
> > +    domU0 {
> > +        #address-cells =3D <0x1>;
> > +        #size-cells =3D <0x1>;
> > +        compatible =3D "xen,domain";
> > +        memory =3D <0x0 0x40000>;
> > +        llc-colors =3D "4-8,10,11,12";
> > +        cpus =3D <0x1>;
> > +        vpl011 =3D <0x1>;
> > +
> > +        module@2000000 {
> > +            compatible =3D "multiboot,kernel", "multiboot,module";
> > +            reg =3D <0x2000000 0xffffff>;
> > +            bootargs =3D "console=3DttyAMA0";
> > +        };
> > +
> > +        module@30000000 {
> > +            compatible =3D "multiboot,ramdisk", "multiboot,module";
> > +            reg =3D <0x3000000 0xffffff>;
> > +        };
> > +    };
> > +
> > +**Note:** If no color configuration is provided for a domain, the defa=
ult one,
> > +which corresponds to all available colors, is used instead.
>
> Looking at your code, it will use *all* the colors. Some of the colors
> might have been assigned to a domain. I am not entirely convinced this
> is good idea to allow this as a default setup.
>
>
> > +
> >   Known issues and limitations
> >   ****************************
> >
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devi=
ce-tree/booting.txt
> > index bbd955e9c2..e9f9862e9c 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -162,6 +162,10 @@ with the following properties:
> >
> >       An integer specifying the number of vcpus to allocate to the gues=
t.
> >
> > +- llc-colors
> > +    A string specifying the LLC color configuration for the guest.
> > +    Refer to "docs/misc/arm/cache_coloring.rst" for syntax.
> > +
> >   - vpl011
> >
> >       An empty property to enable/disable a virtual pl011 for the guest=
 to
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index 1142f7f74a..eb39f5291f 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -850,6 +850,7 @@ void __init create_domUs(void)
> >       struct dt_device_node *node;
> >       const struct dt_device_node *cpupool_node,
> >                                   *chosen =3D dt_find_node_by_path("/ch=
osen");
> > +    const char *llc_colors_str =3D NULL;
> >
> >       BUG_ON(chosen =3D=3D NULL);
> >       dt_for_each_child_node(chosen, node)
> > @@ -993,6 +994,13 @@ void __init create_domUs(void)
> >   #endif
> >           }
> >
> > +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> > +        if ( llc_coloring_enabled && !llc_colors_str )
> > +            panic("'llc-colors' is required when LLC coloring is enabl=
ed\n");
>
> In the documentation you wrote:
>
> "**Note:** If no color configuration is provided for a domain, the
> default one,which corresponds to all available colors, is used instead."
>
> I interpret as you want to continue rather than panic-ing. That said, I
> much prefer the panic version.

Will do as you said. No problem from my side.

> > +        else if ( !llc_coloring_enabled && llc_colors_str)
> > +            printk(XENLOG_WARNING
> > +                   "'llc-colors' found, but LLC coloring is disabled\n=
");
> > +
> >           /*
> >            * The variable max_init_domid is initialized with zero, so h=
ere it's
> >            * very important to use the pre-increment operator to call
> > @@ -1003,6 +1011,11 @@ void __init create_domUs(void)
> >               panic("Error creating domain %s (rc =3D %ld)\n",
> >                     dt_node_name(node), PTR_ERR(d));
> >
> > +        if ( llc_coloring_enabled &&
> > +             (rc =3D domain_set_llc_colors_from_str(d, llc_colors_str)=
) )
> > +            panic("Error initializing LLC coloring for domain %s (rc =
=3D %d)\n",
> > +                  dt_node_name(node), rc);
> > +
> >           d->is_console =3D true;
> >           dt_device_set_used_by(node, d->domain_id);
> >
> > diff --git a/xen/arch/arm/include/asm/llc-coloring.h b/xen/arch/arm/inc=
lude/asm/llc-coloring.h
> > index ee5551e3cc..5f9b0a8121 100644
> > --- a/xen/arch/arm/include/asm/llc-coloring.h
> > +++ b/xen/arch/arm/include/asm/llc-coloring.h
> > @@ -15,6 +15,7 @@
> >
> >   bool __init llc_coloring_init(void);
> >   int dom0_set_llc_colors(struct domain *d);
> > +int domain_set_llc_colors_from_str(struct domain *d, const char *str);
> >
> >   #endif /* __ASM_ARM_COLORING_H__ */
> >
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > index a08614ec36..d3de5f14cb 100644
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -295,6 +295,23 @@ int domain_set_llc_colors_domctl(struct domain *d,
> >       return domain_check_colors(d);
> >   }
> >
> > +int domain_set_llc_colors_from_str(struct domain *d, const char *str)
> > +{
> > +    int err;
> > +
> > +    if ( domain_alloc_colors(d, nr_colors) )
>
> This code is somewhat confusing and would deserve some explanation.
> AFAICT, you are allocating a large array because parse_color_config()
> expects an array of nr_colors.
>
> d->num_llc_colors will also be set to nr_colors but then overriden by
> parse_color_config().
>
> It feels to me that maybe set num_llc_colors() in domain_alloc_colors()
> is not right.

As previously discussed, I can move the d->num_llc_colors assignment out of
that function.

> > +        return -ENOMEM;
> > +
> > +    err =3D parse_color_config(str, d->llc_colors, &d->num_llc_colors)=
;
> > +    if ( err )
> > +    {
> > +        printk(XENLOG_ERR "Error parsing LLC color configuration.");
> > +        return err;
> > +    }
> > +
> > +    return domain_check_colors(d);
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
>
> Cheers,

Thanks.
>
> --
> Julien Grall


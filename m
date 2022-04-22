Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6050B532
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 12:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310805.527734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhqdb-0000XK-LG; Fri, 22 Apr 2022 10:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310805.527734; Fri, 22 Apr 2022 10:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhqdb-0000UC-Gt; Fri, 22 Apr 2022 10:35:43 +0000
Received: by outflank-mailman (input) for mailman id 310805;
 Fri, 22 Apr 2022 10:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhqdZ-0000U6-MW
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 10:35:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3d62de4-c227-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 12:35:39 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id y21so3008520edo.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 03:35:39 -0700 (PDT)
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
X-Inumbo-ID: f3d62de4-c227-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EzG1s9kf1XU0FJ5iNx5OiHIWUYKz1mxwT2mDLJVLVCQ=;
        b=mJq648sy/0rhD5M4vih/thTChIH6ujM5Zxu2D0xdYhogNN3iJdb2kTk27G0Gc8m7fo
         f6/+zImrGQDprhn06yLjNwZ+KSoVCeNoYre+82LdWUheVBoFMyQSvso9pxzSP+eFhZky
         Ssc6VNeGaGU1GfuXYtlPiJgsg24Th21j+pXjtoomro4XW8K+hUa+fIV6vPYBMeTHMYbz
         a6MYN8T2VTmHr4776E+8BZgrm1MPHsWLGzTNrlbFF3IOkCq4pEQVIoMeGTYOo043EfUx
         UkHMuKQ6/AqKODk5+OenaWII6ckaknD3+NEH2rxZm/XFitErEqsrWpa3vdVYXKgx9yUT
         uL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EzG1s9kf1XU0FJ5iNx5OiHIWUYKz1mxwT2mDLJVLVCQ=;
        b=BCfhKKTLbe25Q0a5FsO850d8TZdOCtmWlJyP8MeYbqdkizPjf5D8IoUWnOyFS9AmkL
         D0EIGMB6/d/MLRHFrOygcQAAjDayaauGA7VFJHcAr4MaJoaJ6dUOXRUvUo72c+5VK5Kt
         yt+fxWl/4sX1yFDULrPGSBzmlz1kXviTaZ4Rr5JSEr1LPqiIDSIVkBgMkqzgxKyN9BM7
         aPwfLY7N1JHSJa3wVeS6vKzmegWvYKLpqsZjkuM0gUk2z5BBKcc/mY3m2d7t/F0Xgi3Q
         6WZ1z9tARlHwBOixeUkP6skzPmh0X50mBGlZrVypdXsZWz9W58r5v4/pmw6PsHhh02Xm
         Gsow==
X-Gm-Message-State: AOAM532SS7Rk1zxP3/bvUgZTQsGC1+1DqJm9hlMblsu6Jd58Sdf/hNZV
	kqvYcIRDoI9xEdinYxCMRC9uvMfGMmgVbcnKFTk=
X-Google-Smtp-Source: ABdhPJygX1GqdCXNBfb90nG3KhUB9nMr8FATI73NaXLStLfYfMahx0rbepp3B+Nvi2vHy+y3N/VPF/OAvTPD6Ed/7tI=
X-Received: by 2002:a05:6402:1707:b0:41d:9794:6421 with SMTP id
 y7-20020a056402170700b0041d97946421mr4049610edu.212.1650623738832; Fri, 22
 Apr 2022 03:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-3-git-send-email-olekstysh@gmail.com> <VI1PR08MB3056B18C179244F174F0952F92F79@VI1PR08MB3056.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB3056B18C179244F174F0952F92F79@VI1PR08MB3056.eurprd08.prod.outlook.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 22 Apr 2022 13:34:48 +0300
Message-ID: <CAPD2p-mU-NN2xrC4DT7Nu3o17gq+SrcJO8JqehKA8e+d8Ad+RA@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
To: Jiamei Xie <Jiamei.Xie@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <Julien.Grall@arm.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Henry Wang <Henry.Wang@arm.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: multipart/alternative; boundary="0000000000009c6c3c05dd3bc9a7"

--0000000000009c6c3c05dd3bc9a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 5:43 AM Jiamei Xie <Jiamei.Xie@arm.com> wrote:

> Hi Oleksandr,
>

Hi Jiamei

[Sorry for the possible format issues]



>
>  I am happy to keep my T-b tag.  I have tested this latest patch series
> and it works.


Thank you for the testing and confirmation!



>
>
> Regards,
> Jiamei Xie
>
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > Oleksandr Tyshchenko
> > Sent: 2022=E5=B9=B44=E6=9C=889=E6=97=A5 2:21
> > To: xen-devel@lists.xenproject.org
> > Cc: Julien Grall <Julien.Grall@arm.com>; Wei Liu <wl@xen.org>; Anthony
> > PERARD <anthony.perard@citrix.com>; Juergen Gross <jgross@suse.com>;
> > Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <
> julien@xen.org>;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>; Jiamei Xie <Jiamei.Xie@arm.com>;
> > Henry Wang <Henry.Wang@arm.com>; Oleksandr Tyshchenko
> > <oleksandr_tyshchenko@epam.com>
> > Subject: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on A=
rm
> >
> > From: Julien Grall <julien.grall@arm.com>
> >
> > This patch introduces helpers to allocate Virtio MMIO params
> > (IRQ and memory region) and create specific device node in
> > the Guest device-tree with allocated params. In order to deal
> > with multiple Virtio devices, reserve corresponding ranges.
> > For now, we reserve 1MB for memory regions and 10 SPIs.
> >
> > As these helpers should be used for every Virtio device attached
> > to the Guest, call them for Virtio disk(s).
> >
> > Please note, with statically allocated Virtio IRQs there is
> > a risk of a clash with a physical IRQs of passthrough devices.
> > For the first version, it's fine, but we should consider allocating
> > the Virtio IRQs automatically. Thankfully, we know in advance which
> > IRQs will be used for passthrough to be able to choose non-clashed
> > ones.
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Tested-by: Jiamei Xie <Jiamei.xie@arm.com>
> > Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > ---
> > @Jiamei, @Henry I decided to leave your T-b and R-b tags with the minor
> > change I made, are you still happy with that?
> >
> > s/if (disk->virtio)/if (disk->protocol =3D=3D
> LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> >
> > Please note, this is a split/cleanup/hardening of Julien's PoC:
> > "Add support for Guest IO forwarding to a device emulator"
> >
> > Changes RFC -> V1:
> >    - was squashed with:
> >      "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correc=
t
> way"
> >      "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into
> virtio-
> > mmio device node"
> >      "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
> >    - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h
> >
> > Changes V1 -> V2:
> >    - update the author of a patch
> >
> > Changes V2 -> V3:
> >    - no changes
> >
> > Changes V3 -> V4:
> >    - no changes
> >
> > Changes V4 -> V5:
> >    - split the changes, change the order of the patches
> >    - drop an extra "virtio" configuration option
> >    - update patch description
> >    - use CONTAINER_OF instead of own implementation
> >    - reserve ranges for Virtio MMIO params and put them
> >      in correct location
> >    - create helpers to allocate Virtio MMIO params, add
> >      corresponding sanity-=D1=81hecks
> >    - add comment why MMIO size 0x200 is chosen
> >    - update debug print
> >    - drop Wei's T-b
> >
> > Changes V5 -> V6:
> >    - rebase on current staging
> >
> > Changes V6 -> V7:
> >    - rebase on current staging
> >    - add T-b and R-b tags
> >    - update according to the recent changes to
> >      "libxl: Add support for Virtio disk configuration"
> > ---
> >  tools/libs/light/libxl_arm.c  | 131
> > +++++++++++++++++++++++++++++++++++++++++-
> >  xen/include/public/arch-arm.h |   7 +++
> >  2 files changed, 136 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.=
c
> > index eef1de0..8132a47 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -8,6 +8,56 @@
> >  #include <assert.h>
> >  #include <xen/device_tree_defs.h>
> >
> > +/*
> > + * There is no clear requirements for the total size of Virtio MMIO
> region.
> > + * The size of control registers is 0x100 and device-specific
> configuration
> > + * registers starts at the offset 0x100, however it's size depends on
> the
> > device
> > + * and the driver. Pick the biggest known size at the moment to cover
> most
> > + * of the devices (also consider allowing the user to configure the
> size via
> > + * config file for the one not conforming with the proposed value).
> > + */
> > +#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)
> > +
> > +static uint64_t virtio_mmio_base;
> > +static uint32_t virtio_mmio_irq;
> > +
> > +static void init_virtio_mmio_params(void)
> > +{
> > +    virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;
> > +    virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;
> > +}
> > +
> > +static uint64_t alloc_virtio_mmio_base(libxl__gc *gc)
> > +{
> > +    uint64_t base =3D virtio_mmio_base;
> > +
> > +    /* Make sure we have enough reserved resources */
> > +    if ((virtio_mmio_base + VIRTIO_MMIO_DEV_SIZE >
> > +        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE)) {
> > +        LOG(ERROR, "Ran out of reserved range for Virtio MMIO BASE
> > 0x%"PRIx64"\n",
> > +            virtio_mmio_base);
> > +        return 0;
> > +    }
> > +    virtio_mmio_base +=3D VIRTIO_MMIO_DEV_SIZE;
> > +
> > +    return base;
> > +}
> > +
> > +static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc)
> > +{
> > +    uint32_t irq =3D virtio_mmio_irq;
> > +
> > +    /* Make sure we have enough reserved resources */
> > +    if (virtio_mmio_irq > GUEST_VIRTIO_MMIO_SPI_LAST) {
> > +        LOG(ERROR, "Ran out of reserved range for Virtio MMIO IRQ %u\n=
",
> > +            virtio_mmio_irq);
> > +        return 0;
> > +    }
> > +    virtio_mmio_irq++;
> > +
> > +    return irq;
> > +}
> > +
> >  static const char *gicv_to_string(libxl_gic_version gic_version)
> >  {
> >      switch (gic_version) {
> > @@ -26,8 +76,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >  {
> >      uint32_t nr_spis =3D 0;
> >      unsigned int i;
> > -    uint32_t vuart_irq;
> > -    bool vuart_enabled =3D false;
> > +    uint32_t vuart_irq, virtio_irq =3D 0;
> > +    bool vuart_enabled =3D false, virtio_enabled =3D false;
> >
> >      /*
> >       * If pl011 vuart is enabled then increment the nr_spis to allow
> allocation
> > @@ -39,6 +89,35 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >          vuart_enabled =3D true;
> >      }
> >
> > +    /*
> > +     * Virtio MMIO params are non-unique across the whole system and
> > must be
> > +     * initialized for every new guest.
> > +     */
> > +    init_virtio_mmio_params();
> > +    for (i =3D 0; i < d_config->num_disks; i++) {
> > +        libxl_device_disk *disk =3D &d_config->disks[i];
> > +
> > +        if (disk->protocol =3D=3D LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {
> > +            disk->base =3D alloc_virtio_mmio_base(gc);
> > +            if (!disk->base)
> > +                return ERROR_FAIL;
> > +
> > +            disk->irq =3D alloc_virtio_mmio_irq(gc);
> > +            if (!disk->irq)
> > +                return ERROR_FAIL;
> > +
> > +            if (virtio_irq < disk->irq)
> > +                virtio_irq =3D disk->irq;
> > +            virtio_enabled =3D true;
> > +
> > +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %=
u
> > BASE 0x%"PRIx64,
> > +                disk->vdev, disk->irq, disk->base);
> > +        }
> > +    }
> > +
> > +    if (virtio_enabled)
> > +        nr_spis +=3D (virtio_irq - 32) + 1;
> > +
> >      for (i =3D 0; i < d_config->b_info.num_irqs; i++) {
> >          uint32_t irq =3D d_config->b_info.irqs[i];
> >          uint32_t spi;
> > @@ -58,6 +137,13 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
> >              return ERROR_FAIL;
> >          }
> >
> > +        /* The same check as for vpl011 */
> > +        if (virtio_enabled &&
> > +           (irq >=3D GUEST_VIRTIO_MMIO_SPI_FIRST && irq <=3D virtio_ir=
q)) {
> > +            LOG(ERROR, "Physical IRQ %u conflicting with Virtio MMIO I=
RQ
> > range\n", irq);
> > +            return ERROR_FAIL;
> > +        }
> > +
> >          if (irq < 32)
> >              continue;
> >
> > @@ -787,6 +873,39 @@ static int make_vpci_node(libxl__gc *gc, void *fdt=
,
> >      return 0;
> >  }
> >
> > +
> > +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> > +                                 uint64_t base, uint32_t irq)
> > +{
> > +    int res;
> > +    gic_interrupt intr;
> > +    /* Placeholder for virtio@ + a 64-bit number + \0 */
> > +    char buf[24];
> > +
> > +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
> > +    res =3D fdt_begin_node(fdt, buf);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_compat(gc, fdt, 1, "virtio,mmio");
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > GUEST_ROOT_SIZE_CELLS,
> > +                            1, base, VIRTIO_MMIO_DEV_SIZE);
> > +    if (res) return res;
> > +
> > +    set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);
> > +    res =3D fdt_property_interrupts(gc, fdt, &intr, 1);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_property(fdt, "dma-coherent", NULL, 0);
> > +    if (res) return res;
> > +
> > +    res =3D fdt_end_node(fdt);
> > +    if (res) return res;
> > +
> > +    return 0;
> > +}
> > +
> >  static const struct arch_info *get_arch_info(libxl__gc *gc,
> >                                               const struct xc_dom_image
> *dom)
> >  {
> > @@ -988,6 +1107,7 @@ static int libxl__prepare_dtb(libxl__gc *gc,
> > libxl_domain_config *d_config,
> >      size_t fdt_size =3D 0;
> >      int pfdt_size =3D 0;
> >      libxl_domain_build_info *const info =3D &d_config->b_info;
> > +    unsigned int i;
> >
> >      const libxl_version_info *vers;
> >      const struct arch_info *ainfo;
> > @@ -1094,6 +1214,13 @@ next_resize:
> >          if (d_config->num_pcidevs)
> >              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> >
> > +        for (i =3D 0; i < d_config->num_disks; i++) {
> > +            libxl_device_disk *disk =3D &d_config->disks[i];
> > +
> > +            if (disk->protocol =3D=3D LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> > +                FDT( make_virtio_mmio_node(gc, fdt, disk->base,
> disk->irq) );
> > +        }
> > +
> >          if (pfdt)
> >              FDT( copy_partial_fdt(gc, fdt, pfdt) );
> >
> > diff --git a/xen/include/public/arch-arm.h
> b/xen/include/public/arch-arm.h
> > index ab05fe1..c8b6058 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -407,6 +407,10 @@ typedef uint64_t xen_callback_t;
> >
> >  /* Physical Address Space */
> >
> > +/* Virtio MMIO mappings */
> > +#define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> > +#define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> > +
> >  /*
> >   * vGIC mappings: Only one set of mapping is used by the guest.
> >   * Therefore they can overlap.
> > @@ -493,6 +497,9 @@ typedef uint64_t xen_callback_t;
> >
> >  #define GUEST_VPL011_SPI        32
> >
> > +#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> > +#define GUEST_VIRTIO_MMIO_SPI_LAST    43
> > +
> >  /* PSCI functions */
> >  #define PSCI_cpu_suspend 0
> >  #define PSCI_cpu_off     1
> > --
> > 2.7.4
> >
>
>

--=20
Regards,

Oleksandr Tyshchenko

--0000000000009c6c3c05dd3bc9a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 22, 2022 at 5:43 AM Jiame=
i Xie &lt;<a href=3D"mailto:Jiamei.Xie@arm.com">Jiamei.Xie@arm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Oleksa=
ndr,<br></blockquote><div><br></div><div>Hi=C2=A0Jiamei</div><div><br></div=
><div>[Sorry for the possible format issues]</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0I am happy to keep my T-b tag.=C2=A0 I have tested this latest patch =
series and it works.</blockquote><div><br></div><div>Thank you for the test=
ing and confirmation!</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"> <br>
<br>
Regards,<br>
Jiamei Xie<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Xen-devel &lt;<a href=3D"mailto:xen-devel-bounces@lists.xenproje=
ct.org" target=3D"_blank">xen-devel-bounces@lists.xenproject.org</a>&gt; On=
 Behalf Of<br>
&gt; Oleksandr Tyshchenko<br>
&gt; Sent: 2022=E5=B9=B44=E6=9C=889=E6=97=A5 2:21<br>
&gt; To: <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank=
">xen-devel@lists.xenproject.org</a><br>
&gt; Cc: Julien Grall &lt;<a href=3D"mailto:Julien.Grall@arm.com" target=3D=
"_blank">Julien.Grall@arm.com</a>&gt;; Wei Liu &lt;<a href=3D"mailto:wl@xen=
.org" target=3D"_blank">wl@xen.org</a>&gt;; Anthony<br>
&gt; PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com" target=3D"_bla=
nk">anthony.perard@citrix.com</a>&gt;; Juergen Gross &lt;<a href=3D"mailto:=
jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt;;<br>
&gt; Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" targe=
t=3D"_blank">sstabellini@kernel.org</a>&gt;; Julien Grall &lt;<a href=3D"ma=
ilto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;;<br>
&gt; Bertrand Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" targe=
t=3D"_blank">Bertrand.Marquis@arm.com</a>&gt;; Volodymyr Babchuk<br>
&gt; &lt;<a href=3D"mailto:Volodymyr_Babchuk@epam.com" target=3D"_blank">Vo=
lodymyr_Babchuk@epam.com</a>&gt;; Jiamei Xie &lt;<a href=3D"mailto:Jiamei.X=
ie@arm.com" target=3D"_blank">Jiamei.Xie@arm.com</a>&gt;;<br>
&gt; Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=3D"_blank"=
>Henry.Wang@arm.com</a>&gt;; Oleksandr Tyshchenko<br>
&gt; &lt;<a href=3D"mailto:oleksandr_tyshchenko@epam.com" target=3D"_blank"=
>oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; Subject: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on =
Arm<br>
&gt; <br>
&gt; From: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" target=
=3D"_blank">julien.grall@arm.com</a>&gt;<br>
&gt; <br>
&gt; This patch introduces helpers to allocate Virtio MMIO params<br>
&gt; (IRQ and memory region) and create specific device node in<br>
&gt; the Guest device-tree with allocated params. In order to deal<br>
&gt; with multiple Virtio devices, reserve corresponding ranges.<br>
&gt; For now, we reserve 1MB for memory regions and 10 SPIs.<br>
&gt; <br>
&gt; As these helpers should be used for every Virtio device attached<br>
&gt; to the Guest, call them for Virtio disk(s).<br>
&gt; <br>
&gt; Please note, with statically allocated Virtio IRQs there is<br>
&gt; a risk of a clash with a physical IRQs of passthrough devices.<br>
&gt; For the first version, it&#39;s fine, but we should consider allocatin=
g<br>
&gt; the Virtio IRQs automatically. Thankfully, we know in advance which<br=
>
&gt; IRQs will be used for passthrough to be able to choose non-clashed<br>
&gt; ones.<br>
&gt; <br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
" target=3D"_blank">julien.grall@arm.com</a>&gt;<br>
&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_ty=
shchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<=
br>
&gt; Tested-by: Jiamei Xie &lt;<a href=3D"mailto:Jiamei.xie@arm.com" target=
=3D"_blank">Jiamei.xie@arm.com</a>&gt;<br>
&gt; Reviewed-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" targ=
et=3D"_blank">Henry.Wang@arm.com</a>&gt;<br>
&gt; ---<br>
&gt; @Jiamei, @Henry I decided to leave your T-b and R-b tags with the mino=
r<br>
&gt; change I made, are you still happy with that?<br>
&gt; <br>
&gt; s/if (disk-&gt;virtio)/if (disk-&gt;protocol =3D=3D LIBXL_DISK_PROTOCO=
L_VIRTIO_MMIO)<br>
&gt; <br>
&gt; Please note, this is a split/cleanup/hardening of Julien&#39;s PoC:<br=
>
&gt; &quot;Add support for Guest IO forwarding to a device emulator&quot;<b=
r>
&gt; <br>
&gt; Changes RFC -&gt; V1:<br>
&gt;=C2=A0 =C2=A0 - was squashed with:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;[RFC PATCH V1 09/12] libxl: Handle virtio-mm=
io irq in more correct way&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;[RFC PATCH V1 11/12] libxl: Insert &quot;dma=
-coherent&quot; property into virtio-<br>
&gt; mmio device node&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;[RFC PATCH V1 12/12] libxl: Fix duplicate me=
mory node in DT&quot;<br>
&gt;=C2=A0 =C2=A0 - move VirtIO MMIO #define-s to xen/include/public/arch-a=
rm.h<br>
&gt; <br>
&gt; Changes V1 -&gt; V2:<br>
&gt;=C2=A0 =C2=A0 - update the author of a patch<br>
&gt; <br>
&gt; Changes V2 -&gt; V3:<br>
&gt;=C2=A0 =C2=A0 - no changes<br>
&gt; <br>
&gt; Changes V3 -&gt; V4:<br>
&gt;=C2=A0 =C2=A0 - no changes<br>
&gt; <br>
&gt; Changes V4 -&gt; V5:<br>
&gt;=C2=A0 =C2=A0 - split the changes, change the order of the patches<br>
&gt;=C2=A0 =C2=A0 - drop an extra &quot;virtio&quot; configuration option<b=
r>
&gt;=C2=A0 =C2=A0 - update patch description<br>
&gt;=C2=A0 =C2=A0 - use CONTAINER_OF instead of own implementation<br>
&gt;=C2=A0 =C2=A0 - reserve ranges for Virtio MMIO params and put them<br>
&gt;=C2=A0 =C2=A0 =C2=A0 in correct location<br>
&gt;=C2=A0 =C2=A0 - create helpers to allocate Virtio MMIO params, add<br>
&gt;=C2=A0 =C2=A0 =C2=A0 corresponding sanity-=D1=81hecks<br>
&gt;=C2=A0 =C2=A0 - add comment why MMIO size 0x200 is chosen<br>
&gt;=C2=A0 =C2=A0 - update debug print<br>
&gt;=C2=A0 =C2=A0 - drop Wei&#39;s T-b<br>
&gt; <br>
&gt; Changes V5 -&gt; V6:<br>
&gt;=C2=A0 =C2=A0 - rebase on current staging<br>
&gt; <br>
&gt; Changes V6 -&gt; V7:<br>
&gt;=C2=A0 =C2=A0 - rebase on current staging<br>
&gt;=C2=A0 =C2=A0 - add T-b and R-b tags<br>
&gt;=C2=A0 =C2=A0 - update according to the recent changes to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;libxl: Add support for Virtio disk configura=
tion&quot;<br>
&gt; ---<br>
&gt;=C2=A0 tools/libs/light/libxl_arm.c=C2=A0 | 131<br>
&gt; +++++++++++++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 xen/include/public/arch-arm.h |=C2=A0 =C2=A07 +++<br>
&gt;=C2=A0 2 files changed, 136 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm=
.c<br>
&gt; index eef1de0..8132a47 100644<br>
&gt; --- a/tools/libs/light/libxl_arm.c<br>
&gt; +++ b/tools/libs/light/libxl_arm.c<br>
&gt; @@ -8,6 +8,56 @@<br>
&gt;=C2=A0 #include &lt;assert.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/device_tree_defs.h&gt;<br>
&gt; <br>
&gt; +/*<br>
&gt; + * There is no clear requirements for the total size of Virtio MMIO r=
egion.<br>
&gt; + * The size of control registers is 0x100 and device-specific configu=
ration<br>
&gt; + * registers starts at the offset 0x100, however it&#39;s size depend=
s on the<br>
&gt; device<br>
&gt; + * and the driver. Pick the biggest known size at the moment to cover=
 most<br>
&gt; + * of the devices (also consider allowing the user to configure the s=
ize via<br>
&gt; + * config file for the one not conforming with the proposed value).<b=
r>
&gt; + */<br>
&gt; +#define VIRTIO_MMIO_DEV_SIZE=C2=A0 =C2=A0xen_mk_ullong(0x200)<br>
&gt; +<br>
&gt; +static uint64_t virtio_mmio_base;<br>
&gt; +static uint32_t virtio_mmio_irq;<br>
&gt; +<br>
&gt; +static void init_virtio_mmio_params(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 virtio_mmio_base =3D GUEST_VIRTIO_MMIO_BASE;<br>
&gt; +=C2=A0 =C2=A0 virtio_mmio_irq =3D GUEST_VIRTIO_MMIO_SPI_FIRST;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t alloc_virtio_mmio_base(libxl__gc *gc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t base =3D virtio_mmio_base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Make sure we have enough reserved resources */<br>
&gt; +=C2=A0 =C2=A0 if ((virtio_mmio_base + VIRTIO_MMIO_DEV_SIZE &gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMI=
O_SIZE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG(ERROR, &quot;Ran out of reserved rang=
e for Virtio MMIO BASE<br>
&gt; 0x%&quot;PRIx64&quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_mmio_base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 virtio_mmio_base +=3D VIRTIO_MMIO_DEV_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return base;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t irq =3D virtio_mmio_irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Make sure we have enough reserved resources */<br>
&gt; +=C2=A0 =C2=A0 if (virtio_mmio_irq &gt; GUEST_VIRTIO_MMIO_SPI_LAST) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG(ERROR, &quot;Ran out of reserved rang=
e for Virtio MMIO IRQ %u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_mmio_irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 virtio_mmio_irq++;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return irq;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const char *gicv_to_string(libxl_gic_version gic_version)=
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (gic_version) {<br>
&gt; @@ -26,8 +76,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,=
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t nr_spis =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt; -=C2=A0 =C2=A0 uint32_t vuart_irq;<br>
&gt; -=C2=A0 =C2=A0 bool vuart_enabled =3D false;<br>
&gt; +=C2=A0 =C2=A0 uint32_t vuart_irq, virtio_irq =3D 0;<br>
&gt; +=C2=A0 =C2=A0 bool vuart_enabled =3D false, virtio_enabled =3D false;=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* If pl011 vuart is enabled then increment t=
he nr_spis to allow allocation<br>
&gt; @@ -39,6 +89,35 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vuart_enabled =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Virtio MMIO params are non-unique across the wh=
ole system and<br>
&gt; must be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* initialized for every new guest.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 init_virtio_mmio_params();<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_disks; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_disk *disk =3D &amp;d_config=
-&gt;disks[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (disk-&gt;protocol =3D=3D LIBXL_DISK_P=
ROTOCOL_VIRTIO_MMIO) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;base =3D alloc_vir=
tio_mmio_base(gc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!disk-&gt;base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_=
FAIL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;irq =3D alloc_virt=
io_mmio_irq(gc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!disk-&gt;irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_=
FAIL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtio_irq &lt; disk-&g=
t;irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_irq =
=3D disk-&gt;irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_enabled =3D true;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG(DEBUG, &quot;Allocate V=
irtio MMIO params for Vdev %s: IRQ %u<br>
&gt; BASE 0x%&quot;PRIx64,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;vdev=
, disk-&gt;irq, disk-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (virtio_enabled)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 nr_spis +=3D (virtio_irq - 32) + 1;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;b_info.num_irqs;=
 i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq =3D d_config-&gt;b_info=
.irqs[i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t spi;<br>
&gt; @@ -58,6 +137,13 @@ int libxl__arch_domain_prepare_config(libxl__gc *g=
c,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_FAIL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The same check as for vpl011 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virtio_enabled &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(irq &gt;=3D GUEST_VIRTIO_MM=
IO_SPI_FIRST &amp;&amp; irq &lt;=3D virtio_irq)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG(ERROR, &quot;Physical I=
RQ %u conflicting with Virtio MMIO IRQ<br>
&gt; range\n&quot;, irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERROR_FAIL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq &lt; 32)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; <br>
&gt; @@ -787,6 +873,39 @@ static int make_vpci_node(libxl__gc *gc, void *fd=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; +<br>
&gt; +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base, uint32_t ir=
q)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int res;<br>
&gt; +=C2=A0 =C2=A0 gic_interrupt intr;<br>
&gt; +=C2=A0 =C2=A0 /* Placeholder for virtio@ + a 64-bit number + \0 */<br=
>
&gt; +=C2=A0 =C2=A0 char buf[24];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 snprintf(buf, sizeof(buf), &quot;virtio@%&quot;PRIx64, =
base);<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_begin_node(fdt, buf);<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_property_compat(gc, fdt, 1, &quot;virtio,mm=
io&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_C=
ELLS,<br>
&gt; GUEST_ROOT_SIZE_CELLS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, base, VIRTIO_MMIO_DEV_SIZE);<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);=
<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_property_interrupts(gc, fdt, &amp;intr, 1);=
<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_property(fdt, &quot;dma-coherent&quot;, NUL=
L, 0);<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 res =3D fdt_end_node(fdt);<br>
&gt; +=C2=A0 =C2=A0 if (res) return res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const struct arch_info *get_arch_info(libxl__gc *gc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct xc_dom_image *dom)<br>
&gt;=C2=A0 {<br>
&gt; @@ -988,6 +1107,7 @@ static int libxl__prepare_dtb(libxl__gc *gc,<br>
&gt; libxl_domain_config *d_config,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t fdt_size =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int pfdt_size =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libxl_domain_build_info *const info =3D &amp;d_con=
fig-&gt;b_info;<br>
&gt; +=C2=A0 =C2=A0 unsigned int i;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 const libxl_version_info *vers;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const struct arch_info *ainfo;<br>
&gt; @@ -1094,6 +1214,13 @@ next_resize:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (d_config-&gt;num_pcidevs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FDT( make_vpci_node(gc=
, fdt, ainfo, dom) );<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; d_config-&gt;num_dis=
ks; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl_device_disk *disk =3D=
 &amp;d_config-&gt;disks[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (disk-&gt;protocol =3D=
=3D LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FDT( make_vir=
tio_mmio_node(gc, fdt, disk-&gt;base, disk-&gt;irq) );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pfdt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FDT( copy_partial_fdt(=
gc, fdt, pfdt) );<br>
&gt; <br>
&gt; diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-a=
rm.h<br>
&gt; index ab05fe1..c8b6058 100644<br>
&gt; --- a/xen/include/public/arch-arm.h<br>
&gt; +++ b/xen/include/public/arch-arm.h<br>
&gt; @@ -407,6 +407,10 @@ typedef uint64_t xen_callback_t;<br>
&gt; <br>
&gt;=C2=A0 /* Physical Address Space */<br>
&gt; <br>
&gt; +/* Virtio MMIO mappings */<br>
&gt; +#define GUEST_VIRTIO_MMIO_BASE=C2=A0 =C2=A0xen_mk_ullong(0x02000000)<=
br>
&gt; +#define GUEST_VIRTIO_MMIO_SIZE=C2=A0 =C2=A0xen_mk_ullong(0x00100000)<=
br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* vGIC mappings: Only one set of mapping is used by the gu=
est.<br>
&gt;=C2=A0 =C2=A0* Therefore they can overlap.<br>
&gt; @@ -493,6 +497,9 @@ typedef uint64_t xen_callback_t;<br>
&gt; <br>
&gt;=C2=A0 #define GUEST_VPL011_SPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 32<br>
&gt; <br>
&gt; +#define GUEST_VIRTIO_MMIO_SPI_FIRST=C2=A0 =C2=A033<br>
&gt; +#define GUEST_VIRTIO_MMIO_SPI_LAST=C2=A0 =C2=A0 43<br>
&gt; +<br>
&gt;=C2=A0 /* PSCI functions */<br>
&gt;=C2=A0 #define PSCI_cpu_suspend 0<br>
&gt;=C2=A0 #define PSCI_cpu_off=C2=A0 =C2=A0 =C2=A01<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000009c6c3c05dd3bc9a7--


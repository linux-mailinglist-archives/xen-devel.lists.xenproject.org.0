Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF317B7EEE0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124919.1467066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyirS-00012C-Fk; Wed, 17 Sep 2025 03:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124919.1467066; Wed, 17 Sep 2025 03:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyirS-00010I-Bc; Wed, 17 Sep 2025 03:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1124919;
 Wed, 17 Sep 2025 03:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7FR=34=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyirQ-00010B-L9
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 03:29:36 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87d9eed6-9376-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 05:29:34 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-35eecfce023so3869441fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 20:29:34 -0700 (PDT)
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
X-Inumbo-ID: 87d9eed6-9376-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758079774; x=1758684574; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QFWpLR2EIZkKKQy2sEaLjYFIeEBGT0kYHmIFZ2W/UI=;
        b=nX2A+y0VS/Eev7nFyLvBSj/DpXJF0SugaIU43kF78o/MZgIowKV2qq+VDZ0jcbN+pc
         J/T2BxBxXguovSbDozedNj1LK4lzt3KV7DNEbZ42+LJY+szaFcXQT5XxF5ZaN0eIc3Sc
         H0O5vWT47yd2259W46W8z/trXf9fZwSZLjC9LsGSh+LCCsuLndaJgR64bIfw/EclDjs1
         63t/GfBrbQTXmDQlgE3hAlKWHD5qNsRsQ/Y8RhQiRvPKnmJbU2QN8L9vOmdS8GeaxAPv
         NLfQpAeY90O2RgxhXuL94c9iVKCe3qZvnbgeNavX5j9qyOMbQucHXz8/Gv4YUr3UkV1g
         GZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758079774; x=1758684574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QFWpLR2EIZkKKQy2sEaLjYFIeEBGT0kYHmIFZ2W/UI=;
        b=ZSWlM959YDdw6H+Z5QJNMPrB8NCvF5ip6fL70sRAqfQocp8t7ZOJNsAiIVtPnBqf8G
         4P8PKGBNey+en2fnC/V8U3Fb/Bugi1GbAEXHEIfSRPMdFqyCwv3nucLocGkbqUQ8Ro7v
         XD3L7QXxzoke3Esd0Rah7hESPcGVvXTq+FpOoH1doDX2WBNuMNCixi96X6l7tEEzP3+f
         ZhVeLHYZrhm528cJBCCp7F4CzIfLgOlu35WeLXzjKc6tPE/TB2z91vi10n7jYvVeHhUH
         rtH2y61BMOckGegmyfsekQNb/9tlrL8PXt9MC7lq1QjNWbGLCbqoqGcQn7U45JqzF5E/
         lPpA==
X-Gm-Message-State: AOJu0YzcsyUb4HkDdO33aUs8wji4kY/pOjknl67EFXxsp54fYZjSBlyi
	/9AsZT0ro9icjmVfxaEiOk3+pn2YpUNJIrKk8o0a9yzQT3iq47TER/8i1+Cwxg5uWTwl1oxFbF0
	R8gHwZovTNUU/2AKcavd3YPzOZdSRGjA=
X-Gm-Gg: ASbGncvKoLj5kdblI3BdtoND5d6hb968jo8FAMldO4DVH3ojQyEVbBQyxbfVv0pnsuJ
	gmGXoh+8CojY6SxRqahdGdApew8HpftvzjnP0WI1SIFf5ARrbvh1GYyV08PMI3vogkpXJFPF0ak
	hcz99/NXZ4mCQBAc/AA01tdyfcNKtfgvFk0/7zD6wULEj7F8chiprPix754sAjRwkLiaGa+AEEb
	rWlZQ==
X-Google-Smtp-Source: AGHT+IEWMxTLq0nRfC5yHHPPIDeIrX1w4CJXBz6+h+O2zMj4MIdXTJvDydiyUZ3UurwhD/tloz/JnekYpuZB1qzxPOA=
X-Received: by 2002:a05:651c:25d7:20b0:333:b90c:f48a with SMTP id
 38308e7fff4ca-35f6093dd1bmr1721841fa.10.1758079773443; Tue, 16 Sep 2025
 20:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
 <a3bf4862-b32b-4918-a924-b437f0f015cd@xen.org>
In-Reply-To: <a3bf4862-b32b-4918-a924-b437f0f015cd@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 17 Sep 2025 06:29:21 +0300
X-Gm-Features: AS18NWAoSKbAZ2zIcfqCTbUkF_yTXor_xLZhqzD8x2YbD_XBUJLpPciP61Vbs48
Message-ID: <CAGeoDV9gBq9SSg-PmDUnAPtv6QK9v6d6nz=OxUOoMU-x-eT5MQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for the review.

On Sat, Sep 13, 2025 at 2:30=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 01/09/2025 23:10, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v6:
> > - drop extra func/line printing from dprintk
> > - drop checking context allocation from resume handler
> > - merge some loops where it is possible
> >
> > Changes in v4:
> >    - Add error logging for allocation failures
> >
> > Changes in v3:
> >    - Drop asserts and return error codes instead.
> >    - Wrap code with CONFIG_SYSTEM_SUSPEND.
> >
> > Changes in v2:
> >    - Minor fixes after review.
> > ---
> >   xen/arch/arm/gic-v2.c          | 143 ++++++++++++++++++++++++++++++++=
+
> >   xen/arch/arm/gic.c             |  29 +++++++
> >   xen/arch/arm/include/asm/gic.h |  12 +++
> >   3 files changed, 184 insertions(+)
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index b23e72a3d0..6373599e69 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1098,6 +1098,140 @@ static int gicv2_iomem_deny_access(struct domai=
n *d)
> >       return iomem_deny_access(d, mfn, mfn + nr);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* GICv2 registers to be saved/restored on system suspend/resume */
> > +struct gicv2_context {
> > +    /* GICC context */
> > +    uint32_t gicc_ctlr;
> > +    uint32_t gicc_pmr;
> > +    uint32_t gicc_bpr;
> > +    /* GICD context */
> > +    uint32_t gicd_ctlr;
>
> I don't quite follow why all the registers above needs to be
> saved/restored. Is it just convenience because it is too complicated to
> recreate the value?

Do you mean reinitializing them with the same values as in the init path?
My reasoning for saving/restoring is to avoid duplicating assumptions from
initialization in the resume code. If the init sequence changes in the
future, or if some registers are modified outside of init, the resume path
would also need to be updated. Saving/restoring directly feels like a more
universal and robust approach.

>
> > +    uint32_t *gicd_isenabler;
> > +    uint32_t *gicd_isactiver;
> > +    uint32_t *gicd_ipriorityr;
> > +    uint32_t *gicd_itargetsr;
> > +    uint32_t *gicd_icfgr;
> > +};> +
> > +static struct gicv2_context gicv2_context;
> > +
> > +static int gicv2_suspend(void)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( !gicv2_context.gicd_isenabler )
> > +    {
> > +        dprintk(XENLOG_WARNING, "GICv2 suspend context not allocated!\=
n");
> > +        return -ENOMEM;
> > +    }
> > +
> > +    /* Save GICC configuration */
> > +    gicv2_context.gicc_ctlr =3D readl_gicc(GICC_CTLR);
> > +    gicv2_context.gicc_pmr =3D readl_gicc(GICC_PMR);
> > +    gicv2_context.gicc_bpr =3D readl_gicc(GICC_BPR);
> > +
> > +    /* Save GICD configuration */
> > +    gicv2_context.gicd_ctlr =3D readl_gicd(GICD_CTLR);
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> > +    {
> > +        gicv2_context.gicd_isenabler[i] =3D readl_gicd(GICD_ISENABLER =
+ i * 4);
> > +        gicv2_context.gicd_isactiver[i] =3D readl_gicd(GICD_ISACTIVER =
+ i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +    {
> > +        gicv2_context.gicd_ipriorityr[i] =3D readl_gicd(GICD_IPRIORITY=
R + i * 4);
> > +        gicv2_context.gicd_itargetsr[i] =3D readl_gicd(GICD_ITARGETSR =
+ i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> > +        gicv2_context.gicd_icfgr[i] =3D readl_gicd(GICD_ICFGR + i * 4)=
;
> > +
> > +    return 0;
> > +}
> > +
> > +static void gicv2_resume(void)
> > +{
> > +    unsigned int i;
> > +
>  > +    gicv2_cpu_disable();> +    /* Disable distributor */
> > +    writel_gicd(0, GICD_CTLR);
> > +
> > +    /* Restore GICD configuration */
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> > +    {
> > +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> > +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + =
i * 4);
> > +
> > +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> > +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + =
i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +    {
> > +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR =
+ i * 4);
> > +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + =
i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> > +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> > +
> > +    /* Make sure all registers are restored and enable distributor */
> > +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
>
> Why are we forcing CTL_ENABLE? Surely it should have been set and if
> not, then why is it fine to override it?

You are right =E2=80=94 forcing GICD_CTL_ENABLE is unnecessary here.
The value of GICD_CTLR was already saved before suspend, so restoring
it as-is should be sufficient.

I will drop the | GICD_CTL_ENABLE and just restore the saved value.

>
> > +
> > +    /* Restore GIC CPU interface configuration */
> > +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> > +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> > +
> > +    /* Enable GIC CPU interface */
> > +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_E=
OI,
> > +                GICC_CTLR);
>
> Same question here for both ENABLE and EOI.

You are right here as well =E2=80=94 we don=E2=80=99t need to force GICC_CT=
L_ENABLE
or GICC_CTL_EOI. The saved GICC_CTLR value should already reflect
the correct state at the time of suspend.

So it would be cleaner to just restore the saved register value
directly, without OR=E2=80=99ing additional bits.

>
> > +}
> > +
> > +static void gicv2_alloc_context(struct gicv2_context *gc)
>
> I am a bit surprised this is not returning an error? Why is it ok to
> ignore the error and continue? At least for now, if someone enable
> CONFIG_SYSTEM_SUSPEND, they would likely want the feature. So it would
> be better to crash early.

This behavior was introduced based on feedback on one of the earlier
versions of the patch series.

I agree with your point =E2=80=94 if CONFIG_SYSTEM_SUSPEND is enabled, then
failing to allocate the context should be treated as fatal. I will
update the code to crash early in this case.

>
> > +{
> > +    uint32_t n =3D gicv2_info.nr_lines;
> > +
> > +    gc->gicd_isenabler =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32)=
);
> > +    if ( !gc->gicd_isenabler )
> > +        goto err_free;
> > +
> > +    gc->gicd_isactiver =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32)=
);
> > +    if ( !gc->gicd_isactiver )
> > +        goto err_free;
> > +
> > +    gc->gicd_itargetsr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4))=
;
> > +    if ( !gc->gicd_itargetsr )
> > +        goto err_free;
> > +
> > +    gc->gicd_ipriorityr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4)=
);
> > +    if ( !gc->gicd_ipriorityr )
> > +        goto err_free;
> > +
> > +    gc->gicd_icfgr =3D xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
> > +    if ( !gc->gicd_icfgr )
> > +        goto err_free;
>
> I am wondering if we are really saving that much by allocating each
> array separately? It would simply the code if we fix the array to
> support up to 1024 interrupts so we allocate a single structure.

I suppose some systems may have only local interrupts, or a very small
number of SPIs, which is allowed by the spec.

We could rewrite the code to use a single allocation for all arrays, or
possibly avoid dynamic allocation entirely and declare the arrays of
structs in global scope. The latter approach would simplify the code
and reduce the number of allocations, but it would use memory less
efficiently.

>
>  > +> +    return;
> > +
> > + err_free:
> > +    printk(XENLOG_ERR "Failed to allocate memory for GICv2 suspend con=
text\n");
> > +> +    xfree(gc->gicd_icfgr);
> > +    xfree(gc->gicd_ipriorityr);
> > +    xfree(gc->gicd_itargetsr);
> > +    xfree(gc->gicd_isactiver);
> > +    xfree(gc->gicd_isenabler);
>
> NIT: If you use XFREE(), then you don't need the memset below.

Ack.

>
> > +
> > +    memset(gc, 0, sizeof(*gc));
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   #ifdef CONFIG_ACPI
> >   static unsigned long gicv2_get_hwdom_extra_madt_size(const struct dom=
ain *d)
> >   {
> > @@ -1302,6 +1436,11 @@ static int __init gicv2_init(void)
> >
> >       spin_unlock(&gicv2.lock);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    /* Allocate memory to be used for saving GIC context during the su=
spend */
> > +    gicv2_alloc_context(&gicv2_context);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >       return 0;
> >   }
> >
> > @@ -1345,6 +1484,10 @@ static const struct gic_hw_operations gicv2_ops =
=3D {
> >       .map_hwdom_extra_mappings =3D gicv2_map_hwdom_extra_mappings,
> >       .iomem_deny_access   =3D gicv2_iomem_deny_access,
> >       .do_LPI              =3D gicv2_do_LPI,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend             =3D gicv2_suspend,
> > +    .resume              =3D gicv2_resume,
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> >   };
> >
> >   /* Set up the GIC */
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index e80fe0ca24..a018bd7715 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -425,6 +425,35 @@ int gic_iomem_deny_access(struct domain *d)
> >       return gic_hw_ops->iomem_deny_access(d);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +int gic_suspend(void)
> > +{
> > +    /* Must be called by boot CPU#0 with interrupts disabled */
>
> What would prevent us to suspend from another CPU?

Nothing prevents suspend from being called on another CPU.
According to the PSCI specification, it just needs to be the last
running CPU in the system.

>
> > +    ASSERT(!local_irq_is_enabled());
> > +    ASSERT(!smp_processor_id());
> > +
> > +    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
> > +        return -ENOSYS;
> > +
> > +    return gic_hw_ops->suspend();
> > +}
> > +
> > +void gic_resume(void)
> > +{
> > +    /*
> > +     * Must be called by boot CPU#0 with interrupts disabled after gic=
_suspend
> > +     * has returned successfully.
> > +     */
> > +    ASSERT(!local_irq_is_enabled());
> > +    ASSERT(!smp_processor_id());
> > +    ASSERT(gic_hw_ops->resume);
> > +
> > +    gic_hw_ops->resume();
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   static int cpu_gic_callback(struct notifier_block *nfb,
> >                               unsigned long action,
> >                               void *hcpu)
> > diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/=
gic.h
> > index 541f0eeb80..a706303008 100644
> > --- a/xen/arch/arm/include/asm/gic.h
> > +++ b/xen/arch/arm/include/asm/gic.h
> > @@ -280,6 +280,12 @@ extern int gicv_setup(struct domain *d);
> >   extern void gic_save_state(struct vcpu *v);
> >   extern void gic_restore_state(struct vcpu *v);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +/* Suspend/resume */
> > +extern int gic_suspend(void);
> > +extern void gic_resume(void);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >   /* SGI (AKA IPIs) */
> >   enum gic_sgi {
> >       GIC_SGI_EVENT_CHECK,
> > @@ -395,6 +401,12 @@ struct gic_hw_operations {
> >       int (*iomem_deny_access)(struct domain *d);
> >       /* Handle LPIs, which require special handling */
> >       void (*do_LPI)(unsigned int lpi);
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    /* Save GIC configuration due to the system suspend */
> > +    int (*suspend)(void);
> > +    /* Restore GIC configuration due to the system resume */
> > +    void (*resume)(void);
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> >   };
> >
> >   extern const struct gic_hw_operations *gic_hw_ops;
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola


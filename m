Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F3B364D6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094412.1449728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwE-0007k6-E2; Tue, 26 Aug 2025 13:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094412.1449728; Tue, 26 Aug 2025 13:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwE-0007ht-Aa; Tue, 26 Aug 2025 13:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1094412;
 Tue, 26 Aug 2025 13:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwC-0007ex-P5
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:12 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 774c437f-8282-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 15:42:10 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-55f3a3f2f60so2488963e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:10 -0700 (PDT)
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
X-Inumbo-ID: 774c437f-8282-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215730; x=1756820530; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPDZW4RtYOdvhdvtHbUMHTmwCLpttVwtYw2VpfuKeIo=;
        b=G5zgCJJGH+bj/1YqdOcrmUKySLedYAhxyC4+jQCU3G5t+dJRXM0iX36JYIBqlTbxwV
         XfbC04KGVqE5yylDjny5dhMCGmBdS8xnGMSfgB71Z3jf1aOpkkpRdjOeEDZJI+BxnXyW
         uobn5Z7gjrgUIMwQbZYz3PoItamFGbqXULqTI2AmjWDE1WF3/jj3M8z7AqhBcON3fVjs
         FIhnk3tg5S+LmD2caYugRc5d4reg3RAnGCCuYL00nXLc9oFeAoJ3fquIK1QU4TC3u4VP
         npqTt+bSyjZqS9Mi2doZ4wtQ0aoWrghLIQ9W1tKnn/wqrzzMfQHUvsH7p5wMdWN9y9h3
         Orkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215730; x=1756820530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPDZW4RtYOdvhdvtHbUMHTmwCLpttVwtYw2VpfuKeIo=;
        b=JSXlmkZ8wI8H3Tq1avNQL4npUcVKfbVGUAkqDoRNkeLReXC35UbI8iR3Xg6tXytaXB
         1eCkqbZ/FFU7cA8NQttQOsFsYMliWFFLLg1320oW3qcMCcq+BAsMPu39fToCfMInwim5
         +hWFZdCBf4lwCb0TPBAwaNvm2sxtU57rfeAsJWHCtQVDGhbR5z/3jlq5nK7+U5xt6f83
         NsCgGW/rYvKNW/mfrSjcXISIANctKbZTE5TsSwz/4JwQoucz4sp/98ALtP7H6ZLmR9cd
         YCzAQIcTzwt65Ney8gxvLPDhOHkIV+GnowkK89PaViSTygWjbCbKW/QqKCDO8ChHh8E2
         Vx7w==
X-Gm-Message-State: AOJu0YzHjVeZXE3a09jjsdmmdnpTn70LK4B2y61jHwPCMG8VzCh6ELDu
	i5gOoK5LC/ajwogF7A4+CVNi/EVbbFrUzrfTgWmXymbyR/f3p8swDZfB7g/5GBtW38G00ivfK9z
	Bv6aeD5s57cvF1Hu/s4LXFZH7PvvnZYA=
X-Gm-Gg: ASbGncuE0nn67C6Cv5OF87JC16nDDpKEoPpgTvor/1n7avYswrfkadQzOpqZT3PbwFC
	oSNH0v8oI4V7g9nhh14klq43sk2EqNobXkcm2BaJAiQFWEspXy3kn4vnmIcuxaiom0LMl0I3aKc
	2eKJRk9mjv89LQgi6+Al1J+cDaF+FUgszu7uCwX8Rr5i0ArC8iAXMN1SjUYe9zp35axDbuZVivY
	xd2qA==
X-Google-Smtp-Source: AGHT+IFUJsMj5iY2X9cKJZ8ig2gWP4ixaeiiUnAawSYp93If0IpVjFaaN7GSHPSgLGrh2z4z1/smwE9PG+vdEYRbGQQ=
X-Received: by 2002:a05:6512:2212:b0:55f:3e26:2514 with SMTP id
 2adb3069b0e04-55f3e262913mr3535437e87.33.1756215729919; Tue, 26 Aug 2025
 06:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <451b8a0527a6193b6687e1c85bd254b4dfda142d.1754943874.git.mykola_kvach@epam.com>
 <87zfbqanx5.fsf@epam.com>
In-Reply-To: <87zfbqanx5.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:41:58 +0300
X-Gm-Features: Ac12FXzGb8_86ttSffJ3miSlk-AO546p63ktNLoUbzzYYfJk8g3Geptu4SqLRWU
Message-ID: <CAGeoDV_J3vSTJapz2gz8wB5P0mCLGAeghhsQXoLu7cCNCYjEgA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 3:20=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/gic-v3.c | 233 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 233 insertions(+)
> >
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index cd3e1acf79..a9b65ff5d4 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1776,6 +1776,231 @@ static bool gic_dist_supports_lpis(void)
> >      return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
> >  }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* GICv3 registers to be saved/restored on system suspend/resume */
> > +struct gicv3_ctx {
> > +    struct dist_ctx {
> > +        uint32_t ctlr;
> > +        /*
> > +         * This struct represent block of 32 IRQs
> > +         * TODO: store extended SPI configuration (GICv3.1+)
> > +         */
> > +        struct irq_regs {
> > +            uint32_t icfgr[2];
> > +            uint32_t ipriorityr[8];
> > +            uint64_t irouter[32];
> > +            uint32_t isactiver;
> > +            uint32_t isenabler;
> > +        } *irqs;
> > +    } dist;
> > +
> > +    /* have only one rdist structure for last running CPU during suspe=
nd */
> > +    struct redist_ctx {
> > +        uint32_t ctlr;
> > +        /* TODO: handle case when we have more than 16 PPIs (GICv3.1+)=
 */
> > +        uint32_t icfgr[2];
> > +        uint32_t igroupr;
> > +        uint32_t ipriorityr[8];
> > +        uint32_t isactiver;
> > +        uint32_t isenabler;
> > +    } rdist;
> > +
> > +    struct cpu_ctx {
> > +        uint32_t ctlr;
> > +        uint32_t pmr;
> > +        uint32_t bpr;
> > +        uint32_t sre_el2;
> > +        uint32_t grpen;
> > +    } cpu;
> > +};
> > +
> > +static struct gicv3_ctx gicv3_ctx;
> > +
> > +static void __init gicv3_alloc_context(void)
> > +{
> > +    uint32_t blocks =3D DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> > +
> > +    if ( gicv3_its_host_has_its() )
> > +        return;
>
> I think this needs a comment at least. And/or printk() message. Because
> for it is unclear why we are doing nothing if host has ITS

Got it, I'll add log message

>
> > +
> > +    /* according to spec it is possible don't have SPIs */
> > +    if ( blocks =3D=3D 1 )
> > +        return;
> > +
> > +    gicv3_ctx.dist.irqs =3D xzalloc_array(typeof(*gicv3_ctx.dist.irqs)=
, blocks - 1);
> > +    if ( !gicv3_ctx.dist.irqs )
> > +        dprintk(XENLOG_ERR,
> > +                "%s:%d: failed to allocate memory for GICv3 suspend co=
ntext\n",
> > +                __func__, __LINE__);
>
> dprintk() already prints function and line. Here and everywhere in this
> patch.

Thanks for noticing this. I=E2=80=99ll update the code accordingly.

>
> > +}
> > +
> > +static void gicv3_disable_redist(void)
> > +{
> > +    void __iomem* waker =3D GICD_RDIST_BASE + GICR_WAKER;
> > +
> > +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, w=
aker);
> > +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) =3D=3D =
0 );
> > +}
> > +
> > +static int gicv3_suspend(void)
> > +{
> > +    unsigned int i;
> > +    void __iomem *base;
> > +    typeof(gicv3_ctx.rdist)* rdist =3D &gicv3_ctx.rdist;
> > +
> > +    /* TODO: implement support for ITS */
> > +    if ( gicv3_its_host_has_its() )
> > +        return -EOPNOTSUPP;
> > +
> > +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IR=
QS )
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%s:%d: GICv3 suspend context is not allocated!\n",
> > +                __func__, __LINE__);
> > +        return -ENOMEM;
> > +    }
> > +
> > +    gicv3_save_state(current);
> > +
> > +    /* Save GICC configuration */
> > +    gicv3_ctx.cpu.ctlr     =3D READ_SYSREG(ICC_CTLR_EL1);
> > +    gicv3_ctx.cpu.pmr      =3D READ_SYSREG(ICC_PMR_EL1);
> > +    gicv3_ctx.cpu.bpr      =3D READ_SYSREG(ICC_BPR1_EL1);
> > +    gicv3_ctx.cpu.sre_el2  =3D READ_SYSREG(ICC_SRE_EL2);
> > +    gicv3_ctx.cpu.grpen    =3D READ_SYSREG(ICC_IGRPEN1_EL1);
> > +
> > +    gicv3_disable_interface();
> > +    gicv3_disable_redist();
> > +
> > +    /* Save GICR configuration */
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    base =3D GICD_RDIST_SGI_BASE;
> > +
> > +    rdist->ctlr =3D readl_relaxed(base + GICR_CTLR);
> > +
> > +    /* Set priority on PPI and SGI interrupts */
>
> Probably you wanted to say "Save priority..."

Yes, thank you!
I forgot to change it after copy-pasting.

>
> > +    for (i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i +=3D 4)
> > +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0=
 + 4 * i);
>
> Is this correct? You are writing to every 4th rdist->ipriorityr and
> reading every 4th GICR_IPRIORITYR<n>

Definitely not -- thank you for catching this!

>
> > +
> > +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> > +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> > +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> > +    rdist->icfgr[0]  =3D readl_relaxed(base + GICR_ICFGR0);
> > +    rdist->icfgr[1]  =3D readl_relaxed(base + GICR_ICFGR1);
> > +
> > +    /* Save GICD configuration */
> > +    gicv3_dist_wait_for_rwp();
> > +    gicv3_ctx.dist.ctlr =3D readl_relaxed(GICD + GICD_CTLR);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +    {
> > +        typeof(gicv3_ctx.dist.irqs) irqs =3D gicv3_ctx.dist.irqs + i -=
 1;
> > +        unsigned int irq;
> > +
> > +        base =3D GICD + GICD_ICFGR + 8 * i;
> > +        irqs->icfgr[0] =3D readl_relaxed(base);
> > +        irqs->icfgr[1] =3D readl_relaxed(base + 4);
> > +
> > +        base =3D GICD + GICD_IPRIORITYR + 32 * i;
> > +        for ( irq =3D 0; irq < 8; irq++ )
> > +            irqs->ipriorityr[irq] =3D readl_relaxed(base + 4 * irq);
> > +
> > +        base =3D GICD + GICD_IROUTER + 32 * i;
> > +        for ( irq =3D 0; irq < 32; irq++ )
> > +            irqs->irouter[irq] =3D readq_relaxed_non_atomic(base + 8 *=
 irq);
> > +
> > +        irqs->isactiver =3D readl_relaxed(GICD + GICD_ISACTIVER + 4 * =
i);
> > +        irqs->isenabler =3D readl_relaxed(GICD + GICD_ISENABLER + 4 * =
i);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void gicv3_resume(void)
> > +{
> > +    unsigned int i;
> > +    void __iomem *base;
> > +    typeof(gicv3_ctx.rdist)* rdist =3D &gicv3_ctx.rdist;
> > +
> > +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IR=
QS )
> > +    {
> > +        dprintk(XENLOG_WARNING, "%s:%d: GICv3 suspend context not allo=
cated!\n",
> > +            __func__, __LINE__);
> > +        return;
> > +    }
> > +
> > +    writel_relaxed(0, GICD + GICD_CTLR);
> > +
> > +    for ( i =3D NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i +=3D 32 =
)
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) =
* 4);
> > +
> > +    for ( i =3D 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> > +    {
> > +        typeof(gicv3_ctx.dist.irqs) irqs =3D gicv3_ctx.dist.irqs + i -=
 1;
> > +        unsigned int irq;
> > +
> > +        base =3D GICD + GICD_ICFGR + 8 * i;
> > +        writel_relaxed(irqs->icfgr[0], base);
> > +        writel_relaxed(irqs->icfgr[1], base + 4);
> > +
> > +        base =3D GICD + GICD_IPRIORITYR + 32 * i;
> > +        for ( irq =3D 0; irq < 8; irq++ )
> > +            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq );
>
> style: space before )

I'll fix it, thank you

>
> > +
> > +        base =3D GICD + GICD_IROUTER + 32 * i;
> > +        for ( irq =3D 0; irq < 32; irq++ )
> > +            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * i=
rq);
> > +
> > +        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4)=
;
> > +        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4)=
;
> > +    }
> > +
> > +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> > +    gicv3_dist_wait_for_rwp();
> > +
> > +    /* Restore GICR (Redistributor) configuration */
> > +    gicv3_enable_redist();
> > +
> > +    base =3D GICD_RDIST_SGI_BASE;
> > +
> > +    writel_relaxed(0xffffffff, base + GICR_ICENABLER0);
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    for (i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i +=3D 4)
> > +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 +=
 i * 4);
>
> Is this correct? You are writing to every 4th GICR_IPRIORITYR<n>

Definitely not -- thank you for catching this!

>
> > +
> > +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> > +
> > +    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
> > +    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);
> > +    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
> > +
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
> > +    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
> > +
> > +    gicv3_redist_wait_for_rwp();
> > +
> > +    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
> > +    isb();
> > +
> > +    /* Restore CPU interface (System registers) */
> > +    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
> > +    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
> > +    isb();
> > +
> > +    gicv3_hyp_init();
> > +
> > +    gicv3_restore_state(current);
> > +}
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >  /* Set up the GIC */
> >  static int __init gicv3_init(void)
> >  {
> > @@ -1850,6 +2075,10 @@ static int __init gicv3_init(void)
> >
> >      gicv3_hyp_init();
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    gicv3_alloc_context();
> > +#endif
> > +
> >  out:
> >      spin_unlock(&gicv3.lock);
> >
> > @@ -1889,6 +2118,10 @@ static const struct gic_hw_operations gicv3_ops =
=3D {
> >  #endif
> >      .iomem_deny_access   =3D gicv3_iomem_deny_access,
> >      .do_LPI              =3D gicv3_do_LPI,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend             =3D gicv3_suspend,
> > +    .resume              =3D gicv3_resume,
> > +#endif
> >  };
> >
> >  static int __init gicv3_dt_preinit(struct dt_device_node *node, const =
void *data)
>
> --
> WBR, Volodymyr

Best regards,
Mykola


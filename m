Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B8B40C0F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107192.1457709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUq8-0001Q6-PW; Tue, 02 Sep 2025 17:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107192.1457709; Tue, 02 Sep 2025 17:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUq8-0001Nt-Mj; Tue, 02 Sep 2025 17:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1107192;
 Tue, 02 Sep 2025 17:30:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utUq7-0001Ni-BD
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:30:39 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7e6245-8822-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 19:30:38 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f691c9febso4600007e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 10:30:38 -0700 (PDT)
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
X-Inumbo-ID: 8a7e6245-8822-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756834238; x=1757439038; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq5lCFTrf27tKo4TnS8xSpAFb1/eGhmT8fSIWcjSaCE=;
        b=Da+FsW6tBTSxL0x2FMrNVuIR/1073uGx1UIbAhkETGXvS27VlAIX64H76d/WfywOQa
         2v7lXcYA0j1QBFFb4kkTKUNH1ItGBoOQtCajot91lvypAjvMZnvAccvtBnVQHAOS35/i
         4+dBLNcJRa9iEMfiszHmBTa9g7+555Or2COBcYKclf2LkY9mplKgUu5nKWxlIYwTHyIY
         6Q8VoSF6RtqsTjleAFssRpiKTrly5Y+ZBfzsN3j9KWPNrWj9xDfJYuLWFDJD/hiEEvtl
         1oA/Z0hyL82XsmaATCvcqEE3Qv2mnk48dCEZVxNldVAG/VZrNy5KHdVGUZAWNe+1LY5w
         kHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834238; x=1757439038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zq5lCFTrf27tKo4TnS8xSpAFb1/eGhmT8fSIWcjSaCE=;
        b=K8a4EEbu42UANcE+mv9NFEOaCLTuRWbaM98l/7RDqJSbFfseiyKaWWo+WzpiJbPKp5
         JP+Jm27+oMS371ksIcddxBCMk6TTGlLA8+3vgYw2XA1RtJVuK/HvdsXa1KAmfwa8D8nT
         vvMuM9QfAxcS75SG1i5OtzfHxYLc0VCfr2BWwWS13yUPFKoCCxtNn1xEtvubzWNHmgMg
         +0cBK69o2/7VzAcKwJyh5+/hZ2I+rIybKrepUTUxq4rGfHX1Y40oCGk9BXTK981IpXnW
         zzi/9T+itHRraFjWDqWctEKfF4FOg9YIfqk7GmwchLLXJ2O1MgkUgrQa+nfdvH31QKUz
         iprw==
X-Gm-Message-State: AOJu0YxH5rRKOJjS3bpMDHO3GbKWBkPGzzH9GbIJBBpktjN3hogtGeWB
	3hgs9zW0LKydNENGsBFLckHSt0a2xbWcjaWw1s106PhcuP4bqG76qqxuRVKfzbJKv0OjibYC1hK
	/saDnnNQ9Jk0IcPEalcd3SZUu4rvOcoQ=
X-Gm-Gg: ASbGncvdoZumLDNWDkq+T4r4b9Fy4L7pLS+pp4iMFsW9u3xpKWny2NxMLnY+I7DKwiX
	RHEJknPASO9nJYgTYWLpkIz6bVM5XRLWhd2GiGkxlQBuZkJ2t5MbcD+oRVolFiVbcz5D8hWZFwp
	pf5F3zM5yN/Z4OSuG9mQJGAIvc5blXu2yWSdp1c5nYkvKyuRLx632156ynO6RBGyrU0VS6EF3M1
	Wf09LyE3mKupjS4d4c41EKXMkA=
X-Google-Smtp-Source: AGHT+IHfcLomDgZv5JieRWe2MKafHlDikojt6rPO2wUqKTbYVRm+9QL/v0ODkJAKCNZEbz+G1jSbbLCvaP/qyKGJ3io=
X-Received: by 2002:ac2:4bc5:0:b0:55f:3e82:9c7f with SMTP id
 2adb3069b0e04-55f7099a779mr3264871e87.51.1756834237319; Tue, 02 Sep 2025
 10:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <dc98a547ac7f746b21b47e826edf58fe9003c576.1756763487.git.mykola_kvach@epam.com>
 <cf39cf03-9b21-4fbd-a830-44bea7ee7fd1@gmail.com>
In-Reply-To: <cf39cf03-9b21-4fbd-a830-44bea7ee7fd1@gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 20:30:25 +0300
X-Gm-Features: Ac12FXypx56Kr5JaPxUtzfhPGSYumJ8qfdUj0eiR9hUZZhaaeIGZKJq-riEMHGY
Message-ID: <CAGeoDV9o5NET_G5pPZ-VRd_s+mMczHVE8m-mjsm_LO5JafUeGQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On Tue, Sep 2, 2025 at 7:08=E2=80=AFPM Oleksandr Tyshchenko <olekstysh@gmai=
l.com> wrote:
>
>
>
> On 02.09.25 01:10, Mykola Kvach wrote:
>
> Hello Mykola
>
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
> > Changes in V6:
> > - Drop gicv3_save/restore_state since it is already handled during vCPU
> >    context switch.
> > - The comment about systems without SPIs is clarified for readability.
> > - Error and warning messages related to suspend context allocation are =
unified
> >    and now use printk() with XENLOG_ERR for consistency.
> > - The check for suspend context allocation in gicv3_resume() is removed=
,
> >    as it is handled earlier in the suspend path.
> > - The loop for saving and restoring PPI/SGI priorities is corrected to =
use
> >    the proper increment.
> > - The gicv3_suspend() function now prints an explicit error if ITS susp=
end
> >    support is not implemented, and returns ENOSYS in this case.
> > - The GICD_CTLR_DS bit definition is added to gic_v3_defs.h.
> > - The comment for GICR_WAKER access is expanded to reference the releva=
nt
> >    ARM specification section and clarify the RAZ/WI behavior for Non-se=
cure
> >    accesses.
> > - Cleanup active and enable registers before restoring.
> > ---
> >   xen/arch/arm/gic-v3-lpi.c              |   3 +
> >   xen/arch/arm/gic-v3.c                  | 235 ++++++++++++++++++++++++=
+
> >   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
> >   3 files changed, 239 insertions(+)
> >
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index de5052e5cf..61a6e18303 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block *nfb,=
 unsigned long action,
> >       switch ( action )
> >       {
> >       case CPU_UP_PREPARE:
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            break;
> > +
> >           rc =3D gicv3_lpi_allocate_pendtable(cpu);
> >           if ( rc )
> >               printk(XENLOG_ERR "Unable to allocate the pendtable for C=
PU%lu\n",
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index cd3e1acf79..9f1be7e905 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1776,6 +1776,233 @@ static bool gic_dist_supports_lpis(void)
> >       return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
> >   }
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
> > +    /* We don't have ITS support for suspend */
> > +    if ( gicv3_its_host_has_its() )
> > +        return;
> > +
> > +    /* The spec allows for systems without any SPIs */
> > +    if ( blocks > 1 )
> > +    {
> > +        gicv3_ctx.dist.irqs =3D xzalloc_array(typeof(*gicv3_ctx.dist.i=
rqs),
> > +                                            blocks - 1);
> > +        if ( !gicv3_ctx.dist.irqs )
> > +            printk(XENLOG_ERR "Failed to allocate memory for GICv3 sus=
pend context\n");
> > +    }
> > +}
> > +
> > +static void gicv3_disable_redist(void)
> > +{
> > +    void __iomem* waker =3D GICD_RDIST_BASE + GICR_WAKER;
> > +
> > +    /*
> > +     * Avoid infinite loop if Non-secure does not have access to GICR_=
WAKER.
> > +     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
> > +     *     When GICD_CTLR.DS =3D=3D 0 and an access is Non-secure acce=
sses to this
> > +     *     register are RAZ/WI.
> > +     */
> > +    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
> > +        return;
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
> > +    {
> > +        printk(XENLOG_ERR "GICv3: ITS suspend support is not implement=
ed\n");
> > +        return -ENOSYS;
> > +    }
> > +
> > +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IR=
QS )
> > +    {
> > +        printk(XENLOG_ERR "GICv3: suspend context is not allocated!\n"=
);
> > +        return -ENOMEM;
> > +    }
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
> > +    /* Save priority on PPI and SGI interrupts */
> > +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> > +        rdist->ipriorityr[i] =3D readl_relaxed(base + GICR_IPRIORITYR0=
 + 4 * i);
> > +
> > +    rdist->isactiver =3D readl_relaxed(base + GICR_ISACTIVER0);
> > +    rdist->isenabler =3D readl_relaxed(base + GICR_ISENABLER0);
> > +    rdist->igroupr   =3D readl_relaxed(base + GICR_IGROUPR0);
> > +    rdist->icfgr[0]  =3D readl_relaxed(base + GICR_ICFGR0);
>
> GICR_ICFGR0 is for SGIs, which are always edge-triggered, so I am not
> sure that we need to save it here ...

Looks like I didn=E2=80=99t read the spec carefully and only paid attention=
 to:

12.11.7 GICR_ICFGR0, Interrupt Configuration Register 0
Determines whether the corresponding SGI is edge-triggered or level-sensiti=
ve.

But a few lines below it states:

but a few lines below

Int_config<x>, bits [2x+1:2x], for x =3D 15 to 0
    Indicates whether the is level-sensitive or edge-triggered.
        0b00   Corresponding interrupt is level-sensitive.
        0b10   Corresponding interrupt is edge-triggered.

SGIs are always edge-triggered.

>
>
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
> > +            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
> > +
> > +        base =3D GICD + GICD_IROUTER + 32 * i;
> > +        for ( irq =3D 0; irq < 32; irq++ )
> > +            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * i=
rq);
> > +
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLER + i * 4);
> > +        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4)=
;
> > +
> > +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVER + i * 4);
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
> > +    for ( i =3D 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> > +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 +=
 i * 4);
> > +
> > +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> > +
> > +    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
> > +    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);
>
>    ... and restore it here.

Thank you for pointing that out.
I will remove it in the next version of the patch series.

>
>
> > +    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
> > +
>
> [snip]

Best regards,
Mykola


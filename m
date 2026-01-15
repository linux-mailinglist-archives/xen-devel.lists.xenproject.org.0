Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2BD23C53
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204637.1519262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK9H-0003R6-RP; Thu, 15 Jan 2026 10:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204637.1519262; Thu, 15 Jan 2026 10:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK9H-0003PA-Ne; Thu, 15 Jan 2026 10:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1204637;
 Thu, 15 Jan 2026 10:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgiG=7U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vgK9F-0003P4-OG
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:00:13 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fba62c1c-f1f8-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:00:12 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59b6a987346so681728e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:00:12 -0800 (PST)
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
X-Inumbo-ID: fba62c1c-f1f8-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768471212; x=1769076012; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiE3X3RbLbN/YrjFYwPkJWRyZnCD12aqK2eKPDZSpvo=;
        b=kkPlVRPjAO5DRco6X/nA7+HO7bUGCSg0t7vCh/LD83hlB7YtLlc+RsvrsCYqxDy5lA
         k6PtzP2HkgMyIbpvaRPCIYuk0/MOmifn0BtTnXe0pcETzr3CDBpOYodInu0SMsRgdxQ2
         IYc7d0RxCvgEE50sWFbilOasqb9jvBriamrt/RrKVSQYEbkZRxohNFswatY6qgUXDUv5
         1nvxR9bGBAc89nD1P1vwLQBDLdFGXw27yN5bOtapJX6jI1n0U1ZqY6kywzKW1mpwfoO1
         W5sVsRSi65IL6fv2jhzcYxkrCdqy1SICGJHWGA6993OnbMvpqDQew5vjvEl9b21RLb+Z
         6OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471212; x=1769076012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiE3X3RbLbN/YrjFYwPkJWRyZnCD12aqK2eKPDZSpvo=;
        b=NG7zjceJyYaBM/XNG0tsnshYsF9G1+7qDE8EhbyHSYbWhmLLyV843PwUCj3W6+KtY5
         /AWp41AORdsvuyiCaXBso295ekAKuhJZcJbPyHO1IRod+vxi7hUZOWt6SINTQbnNWElw
         BhROyCfjEqVnqURBpEYO9xamOyxMxrNDYr+Ff8BZbX424fk9g1AE3PqAIsFzMTRBqEue
         sy1JNlPGdQl+1oTbWMT26ZW/lgo23W9EubYVOCuv5jXf3KptEhhNGO5SzNZ9fyriJ7BL
         gt/kM/H5QEGix/7Qht9QZFUOuuJcpRLUdeUDO5h1HgJXqRijyMJjvtHsVS+TrMHTZWee
         x2DA==
X-Gm-Message-State: AOJu0Yw0oqOCqiM3xe6eaOuyxwgoiZ1Bx2cmWEHwjvZqtkc8XTo6M8N2
	del+tiDfWXDGCbR/H0vldymN2bBzQJirjEt5Ypm4nui+3viF3Xdi/y8yt+rZHKE5+ABUI/FWFKA
	0Y7nK1phc2p07w7oSF1gAZTTQDyTU1FM=
X-Gm-Gg: AY/fxX5/tTsLBqZ1gvkuQN+skNZA0PH3ht5CSYla1GACWCYysS7U85kXJf+IYpKSaCk
	pmWscvukfi0rX6mt+ezolzGCyJqdZIVOAZQsnQwWiaHGVIrjDizPPCpI9PYYHZk4S6DUbmSFd2i
	fgZ4tFGO5pkmcWkpVk31q4tnAinjZuaaeGt2gcvQuzGixrN6EXcL069DMq8jkljYAm56VnGNrZO
	5cQE7PH/DIV7Dca4joAL+nHbpM2iWMdH7T92B12lHcMNURNjGw/h57FbFOJmuQapQiTxYC/xQYT
	NkJsucm90iuzH88+JDudgYzR
X-Received: by 2002:a05:6512:138d:b0:59b:9ae0:d94f with SMTP id
 2adb3069b0e04-59ba0f626a8mr2013102e87.14.1768471211604; Thu, 15 Jan 2026
 02:00:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <fe8b4d92a8dfd7b4c40429d10233637a339ae8e6.1765472890.git.mykola_kvach@epam.com>
 <75823cb4-c14c-4a4a-b523-e131c820a4d3@xen.org>
In-Reply-To: <75823cb4-c14c-4a4a-b523-e131c820a4d3@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 15 Jan 2026 12:00:00 +0200
X-Gm-Features: AZwV_QhsvrHWdgLHGqpfHSYTlC0Pumq3lobF2mT1E0OMzT10MFZ59gIyE9-WhTk
Message-ID: <CAGeoDV_beuoKuvdXpXsKv_RaNV0fsj0pHQcmQ+iPbsK4h4W6-w@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for the review.

On Fri, Dec 26, 2025 at 2:29=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 11/12/2025 18:43, Mykola Kvach wrote:
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index b23e72a3d0..0b2f7b3862 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1098,6 +1098,123 @@ static int gicv2_iomem_deny_access(struct domai=
n *d)
> >       return iomem_deny_access(d, mfn, mfn + nr);
> >   }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +/* This struct represent block of 32 IRQs */
> > +struct irq_block {
> > +    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
> > +    uint32_t ipriorityr[8];
> > +    uint32_t isenabler;
> > +    uint32_t isactiver;
> > +    uint32_t itargetsr[8];
> > +};
> > +
> > +/* GICv2 registers to be saved/restored on system suspend/resume */
> > +struct gicv2_context {
> > +    /* GICC context */
>  > +    struct cpu_ctx {> +        uint32_t ctlr;
> > +        uint32_t pmr;
> > +        uint32_t bpr;
> > +    } cpu;
> > +
> > +    /* GICD context */
> > +    struct dist_ctx {
> > +        uint32_t ctlr;
> > +        struct irq_block *irqs;
>
> To confirm my understanding, this will also include the PPIs, SGIs for
> the boot CPU, am I correct? If so, I would suggest to add a comment.

Yes, correct. I=E2=80=99ll add a comment to make it explicit that this incl=
udes
SGIs/PPIs for the boot CPU.

>
> > +    } dist;
> > +};
> > +
> > +static struct gicv2_context gic_ctx;
> > +
> > +static int gicv2_suspend(void)
> > +{
> > +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> > +
> > +    /* Save GICC configuration */
> > +    gic_ctx.cpu.ctlr =3D readl_gicc(GICC_CTLR);
> > +    gic_ctx.cpu.pmr =3D readl_gicc(GICC_PMR);
> > +    gic_ctx.cpu.bpr =3D readl_gicc(GICC_BPR);
> > +
> > +    /* Save GICD configuration */
> > +    gic_ctx.dist.ctlr =3D readl_gicd(GICD_CTLR);
>
> Do we want to disable the GIC distributor and CPU interface on suspend?

I think we should quiesce the CPU interface after saving state,
but not disable the distributor globally.

I still prefer not to disable GICD globally for safety on platforms
where the wake request is routed from the GIC to the PMU/SCP (e.g. via
nIRQOUT/nFIQOUT). So I=E2=80=99d quiesce GICC, keep GICD enabled.

Are you OK with this approach?

>
> > +
> > +    for ( i =3D 0; i < blocks; i++ )
> > +    {
> > +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> > +        size_t j, off =3D i * sizeof(irqs->isenabler);
> > +
> > +        irqs->isenabler =3D readl_gicd(GICD_ISENABLER + off);
> > +        irqs->isactiver =3D readl_gicd(GICD_ISACTIVER + off);
> > +
> > +        off =3D i * sizeof(irqs->ipriorityr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
> > +        {
> > +            irqs->ipriorityr[j] =3D readl_gicd(GICD_IPRIORITYR + off +=
 j * 4);
> > +            irqs->itargetsr[j] =3D readl_gicd(GICD_ITARGETSR + off + j=
 * 4);
> > +        }
> > +
> > +        off =3D i * sizeof(irqs->icfgr);
> > +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> > +            irqs->icfgr[j] =3D readl_gicd(GICD_ICFGR + off + j * 4);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void gicv2_resume(void)
> > +{
> > +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> > +
> > +    gicv2_cpu_disable();
>  > +    /* Disable distributor */> +    writel_gicd(0, GICD_CTLR);
>  > +> +    for ( i =3D 0; i < blocks; i++ )
> > +    {
> > +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> > +        size_t j, off =3D i * sizeof(irqs->isenabler);
> > +
> > +        writel_gicd(0xffffffffU, GICD_ICENABLER + off);
>
> NIT: Can we use GENMASK? This will make easier to confirm we have the
> correct number of bits.

Sure, I'll change it to GENMASK

Best regards,
Mykola


>
> [...]
>
> Cheers,
>
> --
> Julien Grall
>


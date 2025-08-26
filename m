Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85522B364D4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094410.1449717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtvx-0007OW-3O; Tue, 26 Aug 2025 13:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094410.1449717; Tue, 26 Aug 2025 13:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtvx-0007MJ-0O; Tue, 26 Aug 2025 13:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1094410;
 Tue, 26 Aug 2025 13:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtvv-0007MD-V4
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:41:56 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d601b86-8282-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:41:54 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-333f901b2d2so45618511fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:41:54 -0700 (PDT)
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
X-Inumbo-ID: 6d601b86-8282-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215713; x=1756820513; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaABR+zidYXjflvbFlucBVxL3yXOSA19cvQ9yVn/FvI=;
        b=Ml5swrnWAia/+iohSRWTMMtozNCMnypP5cmMZQ7P8hhDRyyMSjRofsyCYFzci5YDsX
         saxhfzRD6c5dArIg1D0wwSp9sN3UF/dE1g+QwV2b1IEe+YLBwaUBqyp+IT4GK/UrlRtj
         iB+UXRPMmDZsUrSzG7hrVuIzw49ZsBnoPtB0TfUUuNPaXa6X9Mf9kdCYCWKJp+3ZCF7Z
         XryKk+CPOWshBATjO5nzcud2R4672VqMZUJxmWA9BUjg8JsveyKd7rIK31UWqMzLtThc
         HxyYI0p6sd2BuZ26DKNcFpFxLmTwtuFt+6dGRfNZOXPOBR+fmPsGHDZhtI7GggUA9WXf
         5jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215713; x=1756820513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaABR+zidYXjflvbFlucBVxL3yXOSA19cvQ9yVn/FvI=;
        b=vrlJnZ9ObWkyXqGRAT+H7YPSkLF/hrTYu+yMXqo5UDgiYShy0jS74Et0E3N48TyhwB
         LJUq7GOFm7d5DFOTROvtEQIQPvkr/hdKwILuK5rziTHt6007X6hZ4Jd25EbsmDjXq6jK
         w1UToRu0U2TYqs6m8N/WldpwjKoLuEAaJzyBMs+FSwbIzIESEqaWqF2YfJe9Pbmr2PKX
         SHzE5bgjM67PbcGCwxLaA/rfsjsh0KBYiaBxXX2Nc1+W85HPDOOwwPxGKxjpmMCqvN9W
         S2uQZVoBdGc8uIq3Q/cBA4rnbYNRZsz5lQ7nbo8nPqnudpfq8zaH7guVse+HqXMC0dlE
         zM2g==
X-Gm-Message-State: AOJu0Yxms2B9dgT9Vp7JldZsxuVjeORrAfpBxW+tNZU8aeppNg0jho7C
	JQV4O/QWtUqoY3Wc5GbVktoxGl6HnB+I0U5bm0ajHXGT6RcDLXOsMC7c+sTseLxaR3GT3ANrO25
	J4vc/Aiy7XtDvXfywOTCvCka2zzj9emY=
X-Gm-Gg: ASbGncsU+mHNTNt5P0e+BBqo/biZhWNUtdWIrxF3NzefNbehXJTUQbaY7wG5UTepeSP
	yHN7X4BMEwUnNRmaNqkLpo3u+seATZTkyDYKlGm0lzzy2ekxU0lkBhibTTr9CaTT23/ehaBKNO9
	tFW0dvV3IoZ7MCWNzR307Qf1M22EvIeGztkw6ayvV8g9ChsxzeKfrVvB5UG7WZaZi9PH+EKSfWh
	a/nPA==
X-Google-Smtp-Source: AGHT+IEAHNz9GyYuT/1kzbi5vPFnU5nHLntqBXki2ihK/H/rNfYnvgVAUoTw3jpjmIOBT21JWca1u0ZBIi9Do+kmbl0=
X-Received: by 2002:a2e:b8d5:0:b0:336:7df1:7616 with SMTP id
 38308e7fff4ca-3367df1a4camr14695241fa.44.1756215713136; Tue, 26 Aug 2025
 06:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <db677462d1b5b698db417182c05c3a6c3a17c0d0.1754943874.git.mykola_kvach@epam.com>
 <878qjac3ec.fsf@epam.com>
In-Reply-To: <878qjac3ec.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:41:41 +0300
X-Gm-Features: Ac12FXxCUunu6NI7tWVtjmd_51yYBkNoQlrYnUkn-l7uktYR4SkDHuycvnd2iKw
Message-ID: <CAGeoDV-ApvduZ5vb_OgU+iSMh9rywxGrDBPUWV8pC+T-18shqg@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 3:01=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
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
> > Tested on Xilinx Ultrascale+ MPSoC with (and without) powering down
> > the GIC.
>
> I think you can drop this sentence, as I am pretty sure this patch
> wasn't tested on Ultrascale+ for last five(?) years..

Ok, I=E2=80=99ll drop that sentence.

>
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v4:
> >   - Add error logging for allocation failures
> >
> > Changes in v3:
> >   - Drop asserts and return error codes instead.
> >   - Wrap code with CONFIG_SYSTEM_SUSPEND.
> >
> > Changes in v2:
> >   - Minor fixes after review.
> > ---
> >  xen/arch/arm/gic-v2.c          | 154 +++++++++++++++++++++++++++++++++
> >  xen/arch/arm/gic.c             |  29 +++++++
> >  xen/arch/arm/include/asm/gic.h |  12 +++
> >  3 files changed, 195 insertions(+)
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index b23e72a3d0..dce8f5e924 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1098,6 +1098,151 @@ static int gicv2_iomem_deny_access(struct domai=
n *d)
> >      return iomem_deny_access(d, mfn, mfn + nr);
> >  }
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
> > +    uint32_t *gicd_isenabler;
> > +    uint32_t *gicd_isactiver;
> > +    uint32_t *gicd_ipriorityr;
> > +    uint32_t *gicd_itargetsr;
> > +    uint32_t *gicd_icfgr;
> > +};
> > +
> > +static struct gicv2_context gicv2_context;
> > +
> > +static int gicv2_suspend(void)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( !gicv2_context.gicd_isenabler )
> > +    {
> > +        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not allo=
cated!\n",
> > +            __func__, __LINE__);
>
> Should this be ASSERT(gicv2_context.gicd_isenabler) ? Or do we expect
> that this can happen during normal runtime?
>
> Also, you don't need to print __func__ and __LINE__ as dprintk does this
> for you already:
>
> #define dprintk(lvl, fmt, args...) \
>     printk(lvl "%s:%d: " fmt, __FILE__, __LINE__, ## args)
>
>
>
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
> > +        gicv2_context.gicd_isenabler[i] =3D readl_gicd(GICD_ISENABLER =
+ i * 4);
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> > +        gicv2_context.gicd_isactiver[i] =3D readl_gicd(GICD_ISACTIVER =
+ i * 4);
> > +
>
> I think you can merge this two loops

Ok, I'll do it

>
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +        gicv2_context.gicd_ipriorityr[i] =3D readl_gicd(GICD_IPRIORITY=
R + i * 4);
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +        gicv2_context.gicd_itargetsr[i] =3D readl_gicd(GICD_ITARGETSR =
+ i * 4);
> > +
>
> And this two as well

Ok

>
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
> > +    if ( !gicv2_context.gicd_isenabler )
> > +    {
> > +        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not allo=
cated!\n",
> > +            __func__, __LINE__);
>
> the same comment as for gicv2_suspend(). Actually, we should not reach
> here in any case.

You mean we should just drop the check, right?

>
> > +        return;
> > +    }
> > +
> > +    gicv2_cpu_disable();
> > +    /* Disable distributor */
> > +    writel_gicd(0, GICD_CTLR);
> > +
> > +    /* Restore GICD configuration */
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> > +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> > +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + =
i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> > +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> > +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + =
i * 4);
> > +    }
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR =
+ i * 4);
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> > +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + =
i * 4);
> > +
> > +    for ( i =3D 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> > +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> > +
> > +    /* Make sure all registers are restored and enable distributor */
> > +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
> > +
> > +    /* Restore GIC CPU interface configuration */
> > +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> > +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> > +
> > +    /* Enable GIC CPU interface */
> > +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_E=
OI,
> > +                GICC_CTLR);
> > +}
> > +
> > +static void gicv2_alloc_context(struct gicv2_context *gc)
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
> > +
> > +    return;
> > +
> > + err_free:
> > +    dprintk(XENLOG_ERR,
> > +            "%s:%d: failed to allocate memory for GICv2 suspend contex=
t\n",
> > +            __func__, __LINE__);
>
> Okay, this partially answers to my previous question about memory
> allocation. So it is possible to have active system without space for
> GIC context... But this basically renders system un-suspendable. I think
> this warrants non-debug print to warn user that suspend will be not
> available.

Ok, I=E2=80=99ll add a regular print instead. So your comments about assert=
s are
irrelevant in this case, right?

>
> [...]
>
> --
> WBR, Volodymyr

Best regards,
Mykola


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCfdGYg5C2qWEwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:08:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD85709AF
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312138.1582312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0W2-00075C-So; Mon, 18 May 2026 16:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312138.1582312; Mon, 18 May 2026 16:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0W2-00073E-Pa; Mon, 18 May 2026 16:08:26 +0000
Received: by outflank-mailman (input) for mailman id 1312138;
 Mon, 18 May 2026 16:08:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wP0W1-000738-Rl
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:08:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP0W1-0091uF-7m
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:08:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b3964-2eae-0a2a0a5409dd-0a2a4502bee4-40
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:08:25 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0b3978-af86-0a2a45020019-d155d0abbcb7-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:08:25 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-38e800deae4so25241471fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:08:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779120504; cv=none;
        d=google.com; s=arc-20240605;
        b=J6PKl+FzxGfECp8Hld8M52iOfThor0R6WBQoub/4gy9bf4ZPQ8+vcp14p8Z0nSnsgy
         JTNUbmHiy0X7zxIMA6CAtgwWaOh3cxWRb8ct2nMSdqKhqeZNihz3NE1UzuQm/Sd4Yp3U
         fWsMt+GlUUzgn9aFB+0trgxQ/EF4Y0g2TaVakbqMkkFSpjxHuW3DtXTmt4lPybJO7n0P
         mN2kozlhHw+g6AwZ2VN9S/qdzts5bruEEh8ykjsh8nuaF5yUUpdNKW+c1UWejzUTZT95
         u8s0zjzmySKPFMLliHX+PwoaTOHPLq57ymy47gnGnBupGSEJU3wcFodbIpH4CYhg49Wl
         4/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+C5Z7D2PCHplHcCQ1DIKAONDdkfE1fB3nnk1v3jlmc=;
        fh=Y48x1ukbkIffKm3ALNxHiiKo9yxrWWvlvMeS1xgC45s=;
        b=VWWqy89Fhp6p51oLbWokD2fm0gF0MHhI6mBxNbWRYAm/8+cczUa0AqBxSgkxnsOIrJ
         Ua5TozIRNetQCsRetdfDdCoujDIIh/JnN4Lt4mSh5WeJsoLpPetq35205twYCGo664zp
         7gx2q7YXDGN34G7waHTZnlXulg5HJMuuLfWBiLh3/v7lGMJS3BqjTaL3wQ8dudR4Yira
         Bx/Xc3L7+1fmtLMFjuV7yDeq3OxMUPHB5cjtB29Zx/TYVf3dAttTmVflJVSla7B9C2E/
         qVLXtgQQx90qBqeTzNQmEOuLYoKC5SdmgV4Fpi3Xs2XMMModQyOO6J1cX1c3CZ7IO4Av
         YwGw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120504; x=1779725304; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+C5Z7D2PCHplHcCQ1DIKAONDdkfE1fB3nnk1v3jlmc=;
        b=LqoaE/fuSUCUnI51y0QkC5na2zfuda92//64AYHCraqhYJe40DdU60andHTTa+ezFy
         /mb5mY6mOWpQbnDICnrciVkKB6AHUBphV4w0nx9tN/eZPmKj+lAq0iXvb63hYtJ+w6t/
         +HIxF4j6z3ZESLg0aF996p5ZNbg8mHXP4GhRFWw8/kIOyVPTLqK6IPgBNimmL7kosatp
         wd/dABzaI/bx4R9Q620IjtPPCtNHsl/uyLt6Bw4uBs3tcaxoZjze99iQLVhiRCtTQERE
         5u6LOq4tyjAHKibMy7O7DqI/d4R7JNR74oAbfO+C5AEqla7F/6dMyMNnagxMPzUu15ba
         zYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120504; x=1779725304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+C5Z7D2PCHplHcCQ1DIKAONDdkfE1fB3nnk1v3jlmc=;
        b=Kd67BnLmRrUxdsolyQ2usYt8DK6RlKP5w4MI9aHQFiELUkc/QyRkO+szbihz+vPA9o
         xNapv1NnnOYj1zbNFdGjmKPv29X4qoMpKXPhJuOM+CehHG1BFpHKulJXSTlzxVJYh3iN
         d9FxIaCA2vLuGsyUv9SlY2bINFrpJmMTLSDqOGyYo12u39GldYWW7a4ll+3KvdmU0d7I
         x3ovNiX0QHeh0Se/Zo7C81KFY7sHQaolN8B5u1j/GamVZQHAfBOkvMy3eTSWCrRC8Wjf
         pHoBSZHM72lpiPiKiODvzwT0hGNNHDj/055BAs26p7FERT8MYyso1d9Q5T6t8XB1lvnK
         fdGA==
X-Gm-Message-State: AOJu0YwDiuqJKpIU/iD+ihdVyMWnuhWG+xZtFwOviVYq+26jRDrbUtFv
	Vkyy32iJhHI9nBAohu+h4BbC0MqL/LJ8dbi+2+CBmtsZwp+HnYY/+Cm8r3UciYrADuB81tmLlyX
	OpokCSYZY8EXBVr8/4bo9bF2fSRccoJw=
X-Gm-Gg: Acq92OH1FyryTk5MUY+zuE/u1oxG1iIgzM4oPiCwW/r4Qy2VzZ9/hcoKIh2okokbauu
	ljnfiKiMdBYxU5nVgyNRdawDXar7RUQkt+TlKRsDby81V8/KqEnaiZxySwY+IC6tlJ0i0gE+mkq
	vnsa1PAAYvKzF/cr3/Lk60Fgs2c6MaEC2kh+RR/hITYzRPBhYvVTpj/Ef7PI60MIxujusn/fG50
	dYuGR8a8+9cWmk0iCihPP8Ig98uyYTDpy7vKZU/o75GkyMND7YWMtRjMVez9g6fWM/A3CKiP8/d
	hYUG
X-Received: by 2002:a05:651c:1608:b0:38e:7a75:8763 with SMTP id
 38308e7fff4ca-39561d60079mr48716381fa.18.1779120503998; Mon, 18 May 2026
 09:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <fae03d32bb817d56a20b0437e433bd124f89ac88.1778605274.git.mykola_kvach@epam.com>
 <EF57B350-AB80-4157-AB49-6A449604BC06@arm.com>
In-Reply-To: <EF57B350-AB80-4157-AB49-6A449604BC06@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 May 2026 19:08:12 +0300
X-Gm-Features: AVHnY4KvoH9vaDd8jAi1fl1JDyx0ETxOKyJq8oUfbWZiGZBzl4yiv0xTMr0Zcks
Message-ID: <CAGeoDV-Yb0pF0GN17FpuU3xk=EGcgx3vh087oGoaXTnL2=nDxQ@mail.gmail.com>
Subject: Re: [PATCH v9 09/13] xen/arm: smmu-v3: add suspend/resume handlers
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1779120505-A9D77161-15EFF6CE/0/0
X-purgate-type: clean
X-purgate-size: 5935
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C3CD85709AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the review.

On Thu, May 14, 2026 at 7:42=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> >
> > +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> > +{
> > + int ret;
> > + u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> > +
> > + if ( smmu->features & ARM_SMMU_FEAT_PRI )
> > + irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > +
> > + /* Enable interrupt generation on the SMMU */
> > + ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > +      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > + if ( ret )
> > + {
> > + dev_warn(smmu->dev, "failed to enable irqs\n");
> > + return ret;
> > + }
> > +
> > + return 0;
> > +}
> > +
> > +/*
> > + * Probe-time only: request host IRQs and, when available, program the=
 SMMU's
> > + * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI regi=
sters,
> > + * so any host suspend support must treat the active MSI IRQ path as
> > + * unsupported until that restore path exists.
> > + */
> > static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> > {
> > int ret, irq;
> > - u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> >
> > /* Disable IRQs first */
> > ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> > @@ -2028,22 +2052,7 @@ static int __init arm_smmu_setup_irqs(struct arm=
_smmu_device *smmu)
> > }
> > }
> >
> > - if (smmu->features & ARM_SMMU_FEAT_PRI)
> > - irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> > -
> > - /* Enable interrupt generation on the SMMU */
> > - ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> > -      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> > - if (ret) {
> > - dev_warn(smmu->dev, "failed to enable irqs\n");
> > - goto err_free_irqs;
> > - }
> > -
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> > @@ -2057,7 +2066,7 @@ static int arm_smmu_device_disable(struct arm_smm=
u_device *smmu)
> > return ret;
> > }
> >
> > -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > {
> > int ret;
> > u32 reg, enables;
> > @@ -2163,17 +2172,9 @@ static int __init arm_smmu_device_reset(struct a=
rm_smmu_device *smmu)
> > }
> > }
> >
> > - ret =3D arm_smmu_setup_irqs(smmu);
> > - if (ret) {
> > - dev_err(smmu->dev, "failed to setup irqs\n");
> > + ret =3D arm_smmu_enable_irqs(smmu);
> > + if ( ret )
> > return ret;
> > - }
> > -
> > - /* Initialize tasklets for threaded IRQs*/
> > - tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > - tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > - tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > - smmu);
> >
> > /* Enable the SMMU interface, or ensure bypass */
> > if (disable_bypass) {
> > @@ -2181,20 +2182,16 @@ static int __init arm_smmu_device_reset(struct =
arm_smmu_device *smmu)
> > } else {
> > ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> > if (ret)
> > - goto err_free_irqs;
> > + return ret;
> > }
> > ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> >      ARM_SMMU_CR0ACK);
> > if (ret) {
> > dev_err(smmu->dev, "failed to enable SMMU interface\n");
> > - goto err_free_irqs;
> > + return ret;
> > }
> >
> > return 0;
> > -
> > -err_free_irqs:
> > - arm_smmu_free_irqs(smmu);
> > - return ret;
> > }
> >
> > static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> > @@ -2558,10 +2555,23 @@ static int __init arm_smmu_device_probe(struct =
platform_device *pdev)
> > if (ret)
> > goto out_free;
> >
> > + ret =3D arm_smmu_setup_irqs(smmu);
> > + if ( ret )
> > + {
> > + dev_err(smmu->dev, "failed to setup irqs\n");
> > + goto out_free;
> > + }
> > +
> > + /* Initialize tasklets for threaded IRQs*/
> > + tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> > + tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> > + tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskl=
et,
> > + smmu);
> > +
> > /* Reset the device */
> > ret =3D arm_smmu_device_reset(smmu);
> > if (ret)
> > - goto out_free;
> > + goto out_free_irqs;
> >
> > /*
> > * Keep a list of all probed devices. This will be used to query
> > @@ -2575,6 +2585,8 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> >
> > return 0;
> >
> > +out_free_irqs:
> > + arm_smmu_free_irqs(smmu);
> >
> > out_free:
> > arm_smmu_free_structures(smmu);
> > @@ -2855,6 +2867,96 @@ static void arm_smmu_iommu_xen_domain_teardown(s=
truct domain *d)
> > xfree(xen_domain);
> > }
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device=
 *smmu)
> > +{
> > + int ret =3D arm_smmu_device_reset(smmu);
> > +
> > + if ( ret )
> > + dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
> > + ret);
> > +}
> > +
> > +static int arm_smmu_suspend(void)
> > +{
> > + struct arm_smmu_device *smmu;
> > + int ret =3D 0;
> > +
> > + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> > + {
> > + /* Abort all transactions before disable to avoid spurious bypass */
> > + ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > + if ( ret )
> > + goto fail;
>
> Should we have this here as the restore path calls arm_smmu_enable_irqs()=
?
>
> ret =3D arm_smmu_write_reg_sync(smmu, 0,
>                               ARM_SMMU_IRQ_CTRL,
>                               ARM_SMMU_IRQ_CTRLACK);
> if ( ret )
>     goto fail;

Yes, I agree. I will add the IRQ_CTRL disable here, after setting
GBPA.ABORT and before disabling the SMMU.

Thanks,
Mykola


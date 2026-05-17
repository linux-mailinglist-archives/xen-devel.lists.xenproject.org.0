Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKcnAdsGCmq9wAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 20:20:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A766563096
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2026 20:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311331.1581509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOg5U-0007QS-9A; Sun, 17 May 2026 18:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311331.1581509; Sun, 17 May 2026 18:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOg5U-0007Ns-5R; Sun, 17 May 2026 18:19:40 +0000
Received: by outflank-mailman (input) for mailman id 1311331;
 Sun, 17 May 2026 18:19:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wOg5S-0007Nm-7x
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 18:19:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOg5R-00BpRK-KV
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 20:19:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0a0673-5cb7-0a2a0a5109dd-0a2a4508e910-34
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 20:19:37 +0200
Received: from [209.85.208.169] (helo=mail-lj1-f169.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0a06b9-63b5-0a2a45080019-d155d0a9a53c-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 20:19:37 +0200
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-392445f11c5so18033211fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 11:19:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1779041977; cv=none;
        d=google.com; s=arc-20240605;
        b=flU2q9PuQnkn5+UWUKxmspMkp6OJWVeTccKkcAsMcBkHaxZdjCqvXzHQ5fDxXJ6QtV
         jr/vnFgxsEXBeD12Y6POEdeDO52wcBIvmSotAJ0WriKtXECL92T75unb74DxiRcolJtT
         6uINj49Yp01sr7Vt5OwH6wOmu2S2Xr2vIv99cmEZv1MDPy/BJ0ZOk2RhDICOv+7ZssSg
         sThTN1o9Gw8rzb324nfJKb0tQKKvGoAwTIt6IHeFu5ILLMAmvEIWFzmZ9fvKXOawJUIu
         hGmw4+CKfYudCric1EcaOWp8q3Ce9IC65Bpp+OYjPxtFJsURg8+R9pZKWHJ6bvdsdpEm
         v09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YyolJmAcUVh+sm7ixV7LFL/JAxTKpQ9xmGSvTegaVz8=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=Cy08y5H35zL4BtABNhj6F8FXBtkQseEIg4RU5sy+Y139vlgMzeV+KbilHo1n7mIAe7
         nHq8mVCQKubetdCig3grC+jpJhEdkJL10q6HSz7c5uGtzLk5OEPG5Z5HoWWWCpQMCWas
         I2bsFkedG/igGpT5zuDPJyJQQLWXAW1zSYKEyBv239tYW0o05BjRAsXxxRX3muof23R1
         N7prdhUlISvD/dmbSPAWeg18LdmUx/LHo/0t+s5ZkdmvOpificLyQxJgjMLt/t597fKM
         1Xl7Xn0Wr21vWK3+vHc8IMFxOfhtbJMo5xkpBm/TFKTYCly4mn+pIVsS/eMWEXBHA/WM
         7pVw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041977; x=1779646777; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyolJmAcUVh+sm7ixV7LFL/JAxTKpQ9xmGSvTegaVz8=;
        b=U27ErRNrS1U3GzjHmZ/+gb8QmoemqfCvI0wG3sZY4FMLSKgMVi4vF1zdFEKAMz7HLe
         GG18GBmDXQJAYHwUQe/IqAHo2d/5b7hxqmYoyfQwN1AONnOv7M5CsTsq8SzUCT9j0v+5
         25q8bjdTX6oaO6+0rx9gm81lkHb7dHHinM0Bhyzx3gzgX1tMqnX8vDBicSxMu5vNhAmM
         fhr4sMwPKTKbvW6HQphQS3NqeQeXoAA+Do4NPSLsMaP/X0P6TG2nGKyKNvuQ8o+zCNuA
         TQtiK/AlVzBDr/tWNrhi8xjNnRc5cZAv+dMQysPNtE5EAelbW5eLkJ22FKU81OY3xd84
         X/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041977; x=1779646777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyolJmAcUVh+sm7ixV7LFL/JAxTKpQ9xmGSvTegaVz8=;
        b=ERgKgqpK2JOd5BqZeSXczUdBOBq3zQ0/y+v2YKRdCaiCoNNcnqmM1aItFg92ToDID4
         1OAeyRcYhpYSI0wWq2X+P46vWpB3j29P4PzV1N2tDSl8u0KUCvx8FF/wFG+AoJGm50l5
         IKk8Vq/rpyeui3t76OsML9tmWtU/yvc9ICC/Ny6w36jUsbPYcEBr5RdZurRixNdJoEKP
         6e4/FB/uwhv0qPSUsaTCSI94DqLxETXiHHHlUD6+F7/tm1fTlLoJDnoUlXAaTNhHS1ZY
         vD1iTXnWFiKDogJQ/TJfiYxxYKvEQ7JiTjD/K2mVX9pdTJA2YOLk0QqyenlDnzRhuf+w
         o5fg==
X-Gm-Message-State: AOJu0Yw0g3ryfdt9ATEcevGyt8l9MoQhGXwlgPzZyaYPaJj6GiHuMgAG
	eLUi1vueyJKC+OANZiae1nB7ejuYXykxUGXLfzJYZmjHW0Ky3715iFq/rfFgeSIFgneWnw6shuX
	qYHJ8LPTMNxCydBI0Ux75sZwG9O253+Y=
X-Gm-Gg: Acq92OFFscn84owdIEiQMZsvip9TsyTq/jLlgcmSjArtwljPx7pduUWWN3f/4H+qyRw
	XXDFSHZ4KD7EC+1R4g34JTGRhQGf7V7+41l/95UDLImIggOwkkfrUksUj4/n3/hVjokQMEZ5Gqp
	w6BFbubLhPJw82q0RPjY4CBk3pjcx/Dlrv6GlbCyfNAAWApjAEd1WhRhOywO0JWIhhXivRRWjfn
	RZT+LkUt/dMvq8cVaoBoCp0L+c3j+FzimEL5iCwRleUqVI5r36x/qzVozc9RsGvDbAkBxQJyPUQ
	yVJu
X-Received: by 2002:a2e:a304:0:b0:38e:96c4:9244 with SMTP id
 38308e7fff4ca-3945b4fcd36mr35139421fa.9.1779041976495; Sun, 17 May 2026
 11:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <613c8d67a66924ea62c2436dac14708d939f6784.1778605274.git.mykola_kvach@epam.com>
 <8E531A25-5AB5-41CD-AB61-C426C58C8E1C@arm.com> <CAGeoDV8aKWLKVZN1oz4cUoaZbXX39q4gHgOp=w=0zPhhaN311A@mail.gmail.com>
 <1142B5E5-961F-4CD1-B70F-88630F0DA8F7@arm.com>
In-Reply-To: <1142B5E5-961F-4CD1-B70F-88630F0DA8F7@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sun, 17 May 2026 21:19:25 +0300
X-Gm-Features: AVHnY4J9xrdUtScx0AsbAllwzduE8OhEVZGnNClr5nX5BwoBG_obnEJB7O7T9Io
Message-ID: <CAGeoDV_Zmw8TGJkESWiB6rZKWrMn7EsQ-7=feCvmhukezhpNdQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1779041977-BEB74DB1-48E914A2/0/0
X-purgate-type: clean
X-purgate-size: 6353
X-Rspamd-Queue-Id: 5A766563096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 12:53=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.c=
om> wrote:
>
> Hi Mykola,
>
> > On 15 May 2026, at 08:59, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > Hi Luca,
> >
> > Thank you for the detailed review.
> >
> > On Wed, May 13, 2026 at 5:09=E2=80=AFPM Luca Fancellu <Luca.Fancellu@ar=
m.com> wrote:
> >>
> >> Hi Mykola,
> >>
> >>> +
> >>> +static void gicv2_resume(void)
> >>> +{
> >>> +    unsigned int i, blocks =3D DIV_ROUND_UP(gicv2_info.nr_lines, 32)=
;
> >>> +
> >>> +    gicv2_cpu_disable();
> >>> +    /* Disable distributor */
> >>> +    writel_gicd(0, GICD_CTLR);
> >>> +
> >>> +    for ( i =3D 0; i < blocks; i++ )
> >>> +    {
> >>> +        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> >>> +        size_t j, off =3D i * sizeof(irqs->isenabler);
> >>> +
> >>> +        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
> >>> +        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
> >>> +
> >>> +        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
> >>> +        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
> >>> +
> >>> +        off =3D i * sizeof(irqs->ipriorityr);
> >>> +        for ( j =3D 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
> >>> +            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off +=
 j * 4);
> >>
> >> apologies for spotting these only now, in case gicv2_info.nr_lines is =
1020,
> >> here and below for GICD_ITARGETSR we are going to save also IDs 1020-1=
023
> >> which are reserved.
> >>
> >> Could we assume irqs->ipriorityr and irqs->itargetsr have the same siz=
e and implement
> >> some cap logic which might cap the last loop (eventually):
> >>
> >>    for ( i =3D 0; i < blocks; i++ )
> >>    {
> >>        struct irq_block *irqs =3D gic_ctx.dist.irqs + i;
> >>        size_t j, off =3D i * sizeof(irqs->isenabler);
> >>        size_t nr_regs =3D ARRAY_SIZE(irqs->ipriorityr);
> >>
> >>        if ( i =3D=3D blocks - 1 )
> >>            nr_regs =3D DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
> >>
> >>        [=E2=80=A6]
> >>
> >>        off =3D i * sizeof(irqs->ipriorityr);
> >>        for ( j =3D 0; j < nr_regs; j++ )
> >>            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j =
* 4);
> >>
> >>        /*
> >>         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save=
:
> >>         * they are read-only on multiprocessor implementations and RAZ=
/WI
> >>         * on uniprocessor implementations.
> >>         */
> >>        if ( i )
> >>        {
> >>            off =3D i * sizeof(irqs->itargetsr);
> >>            for ( j =3D 0; j < nr_regs; j++ )
> >>                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + =
j * 4);
> >>        }
> >>
> >>        [=E2=80=A6]
> >>    }
> >
> > This was intentional to keep the logic simpler.
> >
> > For the 1020-interrupt case, the extra word would correspond to
> > interrupt IDs 1020-1023. My reading of ARM IHI 0048B.b is that this
> > is architecturally harmless: section 4.1.2 says that reserved
> > Distributor register addresses are RAZ/WI, and Table 4-1 marks
> > GICD_IPRIORITYR offset 0x7fc and GICD_ITARGETSR offset 0xbfc as
> > Reserved.
> >
> > Would you be OK with keeping this as-is, or would you prefer me to add
> > the cap logic anyway?
>
> I think this would be the only part in the driver that does that, also Li=
nux is avoiding
> to touch these reserved parts
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/irqchip/irq-gic.c?h=3Dv7.1-rc3#n582)
> My preference would be to be consistent.

Ack. I'll add the cap logic.

>
> >
> >>
> >>> +
> >>> +        /*
> >>> +         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to s=
ave:
> >>> +         * they are read-only on multiprocessor implementations and =
RAZ/WI
> >>> +         * on uniprocessor implementations.
> >>> +         */
> >>> +        if ( i )
> >>> +        {
> >>> +            off =3D i * sizeof(irqs->itargetsr);
> >>> +            for ( j =3D 0; j < ARRAY_SIZE(irqs->itargetsr); j++ )
> >>> +                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off=
 + j * 4);
> >>> +        }
> >>> +
> >>> +        off =3D i * sizeof(irqs->icfgr);
> >>> +        for ( j =3D 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> >>> +            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
> >>
> >> in the GICv2 specs the usage constraints
> >> of GICD_ICFGR says: =E2=80=9CBefore changing the value of a programmab=
le Int_config field,
> >> software must disable the corresponding interrupt, otherwise GIC behav=
ior is
> >> UNPREDICTABLE"
> >>
> >> ARM IHI 0048B.b, 4.3.13.
> >>
> >> I think we should move this restore just after GICD_ICENABLER write, b=
efore writing
> >> GICD_ISENABLER.
> >
> > Good catch, I agree.
> >
> > I will move the GICD_ICFGR restore after the GICD_ICENABLER writes
> > and before restoring GICD_ISENABLER, so that programmable Int_config
> > fields are restored while the corresponding interrupts are disabled.
> >
> > I will also check whether it makes sense to move the other
> > configuration restores before GICD_ISENABLER as well. The spec does
> > not seem to impose the same strict requirement there, but keeping all
> > configuration restores before re-enabling the interrupts might make
> > the ordering clearer.
> >
> >>
> >> And also the section says that the GICD_ICFGR0 is read-only.
> >
> > For GICD_ICFGR0, my intention was to keep the restore loop uniform.
> > There should be no useful SGI state to restore here: section 4.3.13
> > says that SGI Int_config[1] is not programmable and RAO/WI, while
> > Int_config[0] is reserved. Also, the value written is the value
> > previously read from the same register.
> >
> > So I do not expect this write to affect the architected SGI
> > configuration. However, if you prefer avoiding the write to
> > GICD_ICFGR0 explicitly, I will skip it in the next version of
> > this series.
>
> I think also Linux =E2=80=9Crestores=E2=80=9D it, so I=E2=80=99m ok to ke=
ep the code as it is, in fact it=E2=80=99s read-only
> and not marked as reserved, my bad!

Ack. I'll keep this part as-is here.

Best regards,
Mykola

>
> Cheers,
> Luca
>


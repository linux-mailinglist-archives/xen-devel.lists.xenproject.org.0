Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFDTBnZZ/mkWpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:45:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756CC4FC04A
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304302.1577383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT00-00022b-DH; Fri, 08 May 2026 21:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304302.1577383; Fri, 08 May 2026 21:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLT00-00020O-Ac; Fri, 08 May 2026 21:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1304302;
 Fri, 08 May 2026 21:44:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wLSzy-00020I-Ey
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:44:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSzx-00H3kf-7q
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:44:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe58e2-bab6-0a2a0a5309dd-0a2a4507c3bc-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:44:41 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fe5948-229c-0a2a45070019-d155d0b2d467-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:44:41 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3922b35e69cso19992961fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:44:40 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778276680; cv=none;
        d=google.com; s=arc-20240605;
        b=DMHgSQN04B7y4DlEF2bRqY4Ien/48xkX17+d9ZZwVWpcD6qIk6nr1+SGmxwvQEhaD9
         9Y3QXHRCPHDobmF0NZpgHHTHfyz6znHWYqolKqElIbl0YFYHP9Iv/KziqOTpC/Bp44i4
         SYdLbnB8uK7XYYCDWvbanoKPKZXJKt23hMD2ileB4YyNGR0FQ8BgEvH/+IAVN2thnXnv
         4w0XSIir9gFflhOIxURRAB9E4RzymDXSXqCssIYUJGM7Mg0z7iUL48Snn9RI0MSm8ZCU
         CszL8LLLoSmS3zcJLqGCEWrx8uDRaI68tX5xfYrLqiq1G87eZXxkwZKpq7WtbbS9NtQn
         +poA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2Tfv4RQ0b6OUOJg1H7aF6Cfn8Il7mcxiJlBmQdg7Kg=;
        fh=jXKZth/5dXfK4eyQ3th9VcbDCKu2IJKxdxWeypBGkUc=;
        b=T/HZfxtIkEQtgOuKjcGvERvmLySjehvh/WHmJKqzJJb0sPseBixZZjInNqa6CXRS6m
         z/B9dDc/V86G/En0VM7KiojLDZKBpXxoUNIpqmbB+geQJYt8jCduO5Oy8+F8XxB4JKQW
         MI2ogE3ivTsxJN5+iC9P1n2hobj/ftO1hF8D/00wB8vXSsYMzbAZm/Lg4QwHicPRKgeo
         +IhWUJVGgax9uI1BxyM9LBhLSXM8OmCVRXZiIkkCWiaYlBI/zjRe2tGfvVKHWI43f+89
         Bh863r+rrxef2PkptaldurdZOhDcrSgh2B17vm34+JxSv8YicDtF9Zu95YklEXkkejts
         7NZw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778276680; x=1778881480; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2Tfv4RQ0b6OUOJg1H7aF6Cfn8Il7mcxiJlBmQdg7Kg=;
        b=mugB9sZHNil9p9yOSrC4wAPdxY9UA7lK6CcEtaz1dPaEfZTiLVwDv/8wi00K1yP9bb
         3OBHctJece0nO/XdeqAhBC9JqAZJrGqcwvamidJJ1ivBuiycnZnBlZz+FVbCWzGGNqMJ
         wETRBP+/8eQE1qTzdYhsZ9nH89xVUugYuxHktquYRH6Px4ZH6OgWmuGrTDk1wRqyQSim
         XTXKBMjNiHV+jsbfh2VWWiRwm78/+vmi4MWd/uKVsCOVbU9YgasU2NgI6TxfsKs7P2fj
         DN8OvDtoEqomIdTzj6nMNI8Ur2xljs9poRdvj7z6J6ZWoo9/mJ3LorSVsFvEbktGqENI
         ogrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276680; x=1778881480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2Tfv4RQ0b6OUOJg1H7aF6Cfn8Il7mcxiJlBmQdg7Kg=;
        b=G2GJaT13hR7/dWYvZZ/9XCzs8j8JKSOOc64krVg0ixSHfUnjCnU/2Lrhzbnv9ZIB/s
         AGuLOWefzVfKS4zd9U+NQwyxR+mzVk+O/h2yOPc39oRI5P7Co0ThLazlQyRk5DX4nJGc
         u+b6YwpUXTVRU42iue2Gv6RyFIE+9dcpas3xwv//9vvKcDo8hBNTg+D7Ze9Rvii0sCE2
         72vLndn4E+gs9I9Sat2L9RN9laED1F3YEOBe6T89TuWmaA+l80xga7tnCpcfZbNUEE7W
         nIcPMrl0ggpYs6SYa9sV4BzoN7IW6svlJfMOUVdVLcgM77StMgmYrXNqNARBKWO1HoMP
         i9/A==
X-Gm-Message-State: AOJu0Yzw35FL8prlxytNuKgkw9MRcPA0dSDb6SHDPMdlZWnYc0N4p97C
	8RPv5hNQFe0OyXV4SngspnHbGtDmWblEEHVhdW5Grtj5zdR9elpGtV6EHrIuDLYi1/OZafGt8Bb
	liX79Z6OrJftPlHjxW0RmNRIsW7caXtg=
X-Gm-Gg: Acq92OHzN70BVm55oJkb/E1clJil7wvzBRAE8DV92pSxY2pEOa2pnjjXXwxgVTQ/YWL
	9rG0pA/4irfjjHQA+T99TJXVCdfwD7QSVvX4MiVX6QBbG1g9CyOfeBd4PhOJE6RIMHNmQ1nH5oS
	67deiGLmJOOx2fqOX2kJ2em1jBxgAOIvrd937uTrBi3EB2uPs3PAyUDRjl5SCPdc9XZ2AgKmqcr
	y2IYx+MrxHf73j5NVocu6haUvnnTtQ70WQPIWnrjd+4ogMyKTo7wA77TNGWx3O1o1Lz+Nih5e3w
	kvqzJ0QmPGPN+Y21
X-Received: by 2002:a2e:960b:0:b0:393:a7d7:7e84 with SMTP id
 38308e7fff4ca-393c41efc0cmr41003591fa.24.1778276680155; Fri, 08 May 2026
 14:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
 <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com> <CAGeoDV907jTK5RsN51ezapA5inhvG1jWpeybbqF=LkxWcEGnbQ@mail.gmail.com>
 <6E040BE7-0133-46AE-8B5C-85EA02704285@arm.com>
In-Reply-To: <6E040BE7-0133-46AE-8B5C-85EA02704285@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 9 May 2026 00:44:28 +0300
X-Gm-Features: AVHnY4I0Dk2BilN5FXWZwMs1RodiY10g2RcGJNBpEZQCimgeqB7rX_DKU3Xpq9s
Message-ID: <CAGeoDV9+kdwkdkA1CtPrOoBPeMH=TL5mdjrDoqdrS64hHuZGHg@mail.gmail.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1778276681-09969C48-B36CE70F/0/0
X-purgate-type: clean
X-purgate-size: 3043
X-Rspamd-Queue-Id: 756CC4FC04A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 3:22=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> HI Mykola,
>
> >>>
> >>> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu=
)
> >>> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> >>> {
> >>> int ret;
> >>> u32 reg, enables;
> >>> @@ -2163,17 +2166,9 @@ static int __init arm_smmu_device_reset(struct=
 arm_smmu_device *smmu)
> >>> }
> >>> }
> >>>
> >>> - ret =3D arm_smmu_setup_irqs(smmu);
> >>> - if (ret) {
> >>> - dev_err(smmu->dev, "failed to setup irqs\n");
> >>
> >> We are moving this one to the probe and ..
> >>
> >>> + ret =3D arm_smmu_enable_irqs(smmu);
> >>> + if ( ret )
> >>
> >> changing with this one, but arm_smmu_setup_irqs() also calls arm_smmu_=
setup_unique_irqs() which
> >> calls arm_smmu_setup_msis(), are we sure that on resume we will get th=
e same state?
> >
> > This follows the split introduced in the Linux arm-smmu-v3 runtime/syst=
em sleep
> > series:
> >
> > https://lore.kernel.org/linux-iommu/20260414194702.1229094-1-praan@goog=
le.com/
> >
> > The intent is to keep IRQ handler registration as one-time probe state,=
 while
> > reset/resume only restores the SMMU hardware state and re-enables inter=
rupt
> > generation.
> >
> > You are right that the MSI case needs extra care. In the Linux series t=
his is
> > handled by arm_smmu_resume_msis(), which restores the SMMU-side MSI
> > configuration. I did not port that part in this patch because Xen SMMUv=
3 MSI
> > support is currently documented as unsupported and is not part of the
> > supported/tested path, so this patch only covers the wired IRQ path use=
d by Xen
> > today.
> >
> > If Xen SMMUv3 MSI support becomes usable in the future, the resume path=
 will
> > need an equivalent MSI restore step before IRQ_CTRL is re-enabled.
>
> In the mean time should we check maybe smmu->features doesn=E2=80=99t hav=
e
> ARM_SMMU_FEAT_MSI flag and document it in commit message?
>
> What do you think about it? I=E2=80=99m just worried someone uses CONFIG_=
MSI and your
> feature and ends up in some trouble, while we know that your feature brea=
ks
> CONFIG_MSI.

Good point.

I don't think checking only ARM_SMMU_FEAT_MSI in this patch is the right
approach, since that reflects hardware capability rather than whether Xen i=
s
actually using the SMMUv3 MSI IRQ path.

For v9, I plan to keep this SMMUv3 patch limited to documenting the current
limitation in the driver and in the commit message: the MSI IRQ path is not
host-suspend-safe yet because resume does not restore the SMMU *_IRQ_CFGn
registers.

The actual runtime block will be added in a later host suspend policy patch=
,
together with the other runtime blockers. That keeps the policy in one plac=
e
and ensures PSCI_FEATURES(SYSTEM_SUSPEND) stays consistent with the actual
SYSTEM_SUSPEND handling.

Best regards,
Mykola

>
> Maybe the maintainers can give their opinion here as well.
>
> Cheers,
> Luca


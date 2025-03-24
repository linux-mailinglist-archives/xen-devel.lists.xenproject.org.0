Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE72A6D826
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925261.1328136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twetK-00041i-Jg; Mon, 24 Mar 2025 10:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925261.1328136; Mon, 24 Mar 2025 10:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twetK-00040G-Gj; Mon, 24 Mar 2025 10:18:46 +0000
Received: by outflank-mailman (input) for mailman id 925261;
 Mon, 24 Mar 2025 10:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g89S=WL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1twetJ-00040A-3X
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:18:45 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf111dd-0899-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 11:18:43 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so4800697e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:18:43 -0700 (PDT)
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
X-Inumbo-ID: 5cf111dd-0899-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742811522; x=1743416322; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4Gd5+WK++lCd5shaivnNVbRyV5DWLV5RGhlZthHvD4=;
        b=Sqc6YjodaFuzF+fu8ZH8ZHQVHkIiZH32ZzL1EWHOCPesEMDNU+ynrf2DtU7eukuqBS
         0XtShxiSr4HHnyD3gigsNMuoGItP6C3M7y5MNbJYDp/PtRMjqCDlXVgd3uuuOOGYrNly
         595+FMykQGDAN078ZsHh+CvIxKmaYxBVS9sd40GLgnBUSjCcGOzsM9HExOIZW3XbPFoU
         VrzI91xwFM4YjXfCHL02Zf3DQ7SzLZDqpMvj5vCz2vjotQgSiIh8xSOfPORT2KCkfRvf
         llVmaJvM11Sy8o8Vhtmiw+7XWdcPAI82qjEfff5S+V/kMkxOZ4G6iEMkWYLKNGVrg8Kr
         1V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742811522; x=1743416322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4Gd5+WK++lCd5shaivnNVbRyV5DWLV5RGhlZthHvD4=;
        b=vslkp/h0NCMgyhaRtZJ+j6caObrOtAOl7+zCznkve55VCxKIxrDxF41QL0YeCZiSF6
         odbKmVp/ML+baE9BLDuEQGhIrWGmv05nh6D2katGlQ+N9tLqSIIoA9Dyx1UOTTfcqA3u
         fmJP6NMbw2SMoep3j1Oeui6TU97EFEabEufx9Kumkn3uzZ74Jd9x2TQFat8IQ9W5D6Ex
         lMlvv85cMGeEoyb418Q7SMb8bcrPCh5JqNG03M6JsClaamgtQ6TmFIf97xEVUuRAM67O
         1Nktl8NU51JCghCYgfIx5A6j3uQG5ILVNFvBOwU3nOkjR7G+kri00n2NPbKCORewwg5n
         kbyw==
X-Forwarded-Encrypted: i=1; AJvYcCWljkf7g5vONdZOKkZPICxO635XbdXwIwDZwGaSMDCdHtyymqchl+M8WYl3uV4zYHYuIkQ57RuZKgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtzvfo7a34Iu+MbFB1Vfllcjn451pBxR8Nv2e9uE5eV/+VoNzG
	xXXCx33KXjAczkQmDnS0AZHE9N6BLDoW4XC6+71TC+9quJMUz/AVmoO5kO1wikq4hAWixJJLRf5
	u3ju8+pXkeKUCEemsQgfvalsB5OI=
X-Gm-Gg: ASbGncuT+0r1SltvlubUJMdWu6ry6ZkV6//oSMCgPn1QK30n4XGlYzygmQuqX6XOI1b
	PVSh7gXs4QEkcV0e46TyxVFAnTMQBfBmv6t59XlGKVN34mtnzURP6P7KCTwaTgAL7LhNG6aFJKR
	x+h8FmN0Xhf2wLDKe+fpoMNUojKGoSzq3d84lr
X-Google-Smtp-Source: AGHT+IHY6xJzvzu5wz0EHmZlqLH5rvOinUH/xP6fiP/5cGXbEFyVYlz0aXHEhv0laFaEgoH+e45mILioTJq5ul73mE4=
X-Received: by 2002:a05:6512:acf:b0:549:70ea:27a1 with SMTP id
 2adb3069b0e04-54ad6492df3mr4862630e87.23.1742811522216; Mon, 24 Mar 2025
 03:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
 <849e6163-141d-4c8a-a57f-e589a38dd38d@xen.org> <CAGeoDV9Ey9gnR=AGe13y0HtQ4UwoBOeD=LuY4KJud7jXuJ-h9g@mail.gmail.com>
 <db6426f2-76be-4ec1-bd01-4553ebdf63f1@epam.com>
In-Reply-To: <db6426f2-76be-4ec1-bd01-4553ebdf63f1@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 24 Mar 2025 12:18:30 +0200
X-Gm-Features: AQ5f1JpRmOsXh7SRnl2nzV5TvfJNOuXW1z4GcLRLuE1OabK1MwxNsg4TLfYBkeQ
Message-ID: <CAGeoDV-2wQDRSmo0Ae0HyrCD1qg45HJ9dViiaOL7YUUXw6n1oQ@mail.gmail.com>
Subject: Re: [PATCH 06/16] xen/arm: Introduce system suspend config option
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai <mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,

On Fri, Mar 21, 2025 at 4:58=E2=80=AFPM Grygorii Strashko
<grygorii_strashko@epam.com> wrote:
>
>
>
> On 21.03.25 11:48, Mykola Kvach wrote:
> > Hi,
> >
> > On Wed, Mar 12, 2025 at 12:29=E2=80=AFAM Julien Grall <julien@xen.org> =
wrote:
> >>
> >> Hi,
> >>
> >> On 05/03/2025 09:11, Mykola Kvach wrote:
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> This option enables the system suspend support. This is the
> >>> mechanism that allows the system to be suspended to RAM and
> >>> later resumed.
> >>>
> >>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> >>>    xen/arch/arm/Kconfig | 11 +++++++++++
> >>>    1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> >>> index a26d3e1182..5834af16ab 100644
> >>> --- a/xen/arch/arm/Kconfig
> >>> +++ b/xen/arch/arm/Kconfig
> >>> @@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
> >>>    config ARM32_HARDEN_BRANCH_PREDICTOR
> >>>        def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
> >>>
> >>> +config SYSTEM_SUSPEND
> >>> +     bool "System suspend support"
> >>> +     default y
> >>
> >> The default should likely be no until everything is working.
> >
> > got it!
> >
> >>
> >>> +     depends on ARM_64
> >>
> >> I think this also needs to depends on !LLC_COLORING (unless you
> >> confirmed cache coloring is working) and UNSUPPORTED.
> >
> > Sure! I'll add the dependency.
> >
> >>
> >>> +     help
> >>> +       This option enables the system suspend support. This is the
> >>> +       mechanism that allows the system to be suspended to RAM and
> >>> +       later resumed.
> >>
> >> You seem to also tie guest suspend/resunme to this option. Is it inten=
ded?
> >
> >  From the guest's perspective, it is a system suspend. However, it look=
s like the
> > description should be enhanced. Thank you for pointing that out.
>
> s2r =3D "suspend to ram"
>
> You definitely need consider and clarify ARM64 Guest System s2r and
> XEN system s2r. First can be supported without second, while the XEN syst=
em s2r
> depends on Guests System s2r support and required guests to be properly s=
uspended
> before allowing XEN to enter system s2r.
>

This is exactly what...

> You can't call freeze_domains() and blindly pause some domain, because if=
 it's not
> suspend and has passed through HW which is in the middle of transaction -=
> DEADBEEF.

... should happen. x86 works in the same way=E2=80=94we call domain_pause w=
hen
performing system suspend. All domains are paused except the one that
is eligible to request system suspend.

>
> --
> Best regards,
> -grygorii

Best regards,
Mykola


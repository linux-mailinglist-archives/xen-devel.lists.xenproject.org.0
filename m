Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF86FF5E8
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533477.830194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px8CM-0006G8-BA; Thu, 11 May 2023 15:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533477.830194; Thu, 11 May 2023 15:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px8CM-0006DL-8M; Thu, 11 May 2023 15:27:18 +0000
Received: by outflank-mailman (input) for mailman id 533477;
 Thu, 11 May 2023 15:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1K6=BA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1px8CK-0006DF-Lr
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 15:27:16 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f30a45c-f010-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 17:27:15 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so13637713a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 08:27:15 -0700 (PDT)
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
X-Inumbo-ID: 4f30a45c-f010-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683818835; x=1686410835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vtk5MqV3zMZ+NI6AhiF0E2y7HdDxZvVDkt8LnHerTJM=;
        b=OjrI5O9/UEBsNOcBAkwfOwK8qxL7NQVH1xrDFp9QO4BvOgE2hDalCPdorxGEN5+Prd
         mYt8alt6yS/keIFNRQmV5DKwjqxtHFfJVE8jkA20Pxmi9wB9WG2MFiG+6PHmhMFLNRkt
         HyghOw8mT9Pj9Uk5NRXCWzPrtekD0ulRRsSAxDPw9rrQMUei2N3xylXdScdqJ3YGrBEd
         +kOoYPI0hBDkT2CTUfIuf5MznPQCq2i6+tp6BVwpKBC7SpMbZvoyjz09fC44c24vQWM8
         G21wzeAh2IzTG7d8N+zK0l18gcswS1Tf+aA5KOGhqP1jFz1HJEWW4dwDqyls7zBTMeSO
         oLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683818835; x=1686410835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vtk5MqV3zMZ+NI6AhiF0E2y7HdDxZvVDkt8LnHerTJM=;
        b=Q5wbQ2gIvJyNka52/VK78iFrYhJpD5cDn+d56/Pnp6uKRIXMqdUF1nnBDcf0tp6UtM
         vuCN+5PM6KSdwhg7eQmCgcUJlHYhZyLWPHQ42HpPv0dxq7L5gx6DATMcsQEt2sNlYahi
         7+d3O/NEUXMAZe8jwoY8fHTatxYijvL0EFZ83uhevatG2IOJXQbnN0zqWZX5gMx67Z4q
         ifhIDxlOyi0Hgc78oP2qaFyH2r9LDpNGSs2evF5WjtdLbBlOGdikJttjsGVS3y8R1raY
         D9M6efqamqJwD9CRV+xwsPqmIg0WF2iRLLa9ph+hWOaFEE3xOzm2RHukKProO52fy+U6
         Lljg==
X-Gm-Message-State: AC+VfDz0Ypqg1Gq1ytGaATxifOC4hgIwTOYPi27nUDeYRboXuIfGZ0dg
	BKFrefB3gPRjVjMSW4FLmEU56XwSuhiaf7dtm91VD6Si
X-Google-Smtp-Source: ACHHUZ4eYXLD4gD3uhKBaMEEwvFvhn0Blmh9ChDyNU3HWbhw4o6yL02xnb3+mVteuMHbgNGoKrIUG2xVH/jbQQbHfNA=
X-Received: by 2002:a17:907:8a14:b0:94f:6218:191f with SMTP id
 sc20-20020a1709078a1400b0094f6218191fmr21655990ejc.52.1683818835233; Thu, 11
 May 2023 08:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpspPdt6mM4MuL2-vwXHu23ahm874e4kZqROqCwC4cd=fA@mail.gmail.com> <ZF0ISD/uMns0aLtd@mail-itl>
In-Reply-To: <ZF0ISD/uMns0aLtd@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 May 2023 11:27:02 -0400
Message-ID: <CAKf6xpsLg-Dve9-uLysGv-hnkVuk0vPsxf=a6fc3ebduzryqbQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 11:22=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Thu, May 11, 2023 at 10:58:48AM -0400, Jason Andryuk wrote:
> > On Fri, May 5, 2023 at 5:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On older systems, XHCI xcap had a layout that no other (interesting) =
registers
> > > were placed on the same page as the debug capability, so Linux was fi=
ne with
> > > making the whole page R/O. But at least on Tiger Lake and Alder Lake,=
 Linux
> > > needs to write to some other registers on the same page too.
> > >
> > > Add a generic API for making just parts of an MMIO page R/O and use i=
t to fix
> > > USB3 console with share=3Dyes or share=3Dhwdom options. More details =
in commit
> > > messages.
> > >
> > > Marek Marczykowski-G=C3=B3recki (2):
> > >   x86/mm: add API for marking only part of a MMIO page read only
> > >   drivers/char: Use sub-page ro API to make just xhci dbc cap RO
> >
> > Series:
> > Tested-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > I had the issue with a 10th Gen, Comet Lake, laptop.  With an HVM
> > usbvm with dbgp=3Dxhci,share=3D1, Xen crashed the domain because of:
> > (XEN) d1v0 EPT violation 0xdaa (-w-/r-x) gpa 0x000000f1008470 mfn 0xcc3=
28 type 5
>
> Hmm, this series is supposed to avoid exactly this issue. I tested it on
> 12th Gen, so maybe 10th Gen has a bit different layout.
> Can you add a debug print before subpage_mmio_ro_add() call in
> xhci-dbc.c and see what area is getting protected?

Your series fixes the problem!

I just had the details from the original issue, so I included them.  I
was trying to highlight what this series fixed for me.  Sorry for the
confusion.

Regards,
Jason


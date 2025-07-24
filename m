Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB0B10965
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055815.1424131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuKL-0003Zj-NV; Thu, 24 Jul 2025 11:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055815.1424131; Thu, 24 Jul 2025 11:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueuKL-0003X5-KK; Thu, 24 Jul 2025 11:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1055815;
 Thu, 24 Jul 2025 11:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ueuKK-0003GZ-KB
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:41:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2510ca61-6883-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:41:32 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5551a770828so919428e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:41:32 -0700 (PDT)
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
X-Inumbo-ID: 2510ca61-6883-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753357291; x=1753962091; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwX3lxekHTjwscZ9R2QOhlOjVlF+bqXWNdXjn4pJ0Rk=;
        b=O4QAMlPUK5X6h0UJ+geIrJyORtuS/RhmlsnjaCttw05eUB29zXmkj/5d8QwI6doAzx
         fhKOdfxuwysDVVWSQ2ZFr9S9oXI69lOX6D39teAPA7Q8zt+X6vraMRxR5tCVD//4hqnq
         i54zLsEG7mxT9hTT3equlcQcERp5e+smi3Shz+X8sNuBt7njY0TXRulJOZguFMRKyVSp
         2LGkZ1vl33p1XK9Pl8xmOMiqmTP2D5oYPacQkBCr2oXdU7zNOLGAl8cPMoiCagseDiWP
         697Y+zjN2rLSQwrbtm5/RxTxzEeUlj2LsyjarHHnyoBCFGk0kT/LPouRistcj80ImuvI
         V9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753357291; x=1753962091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwX3lxekHTjwscZ9R2QOhlOjVlF+bqXWNdXjn4pJ0Rk=;
        b=gKqD9e6XWt9WgfaaNKK8mLWhUDo/wdwPJU2VtrICzlF3jeBNm9Fzp0KRRhQgXBPQAg
         UInEdLOxpNC6AMD3EHUYNZFh+r4RwZe8Jfz22Z8l6ZnQfREo7wsAfYbfvXFzxZgvUgl9
         C0b0JZOAKlOXlXZg8Ey87XpMzdVaf0qHwNkNb4lzuVcx+Q/3AtctSsDixajFhmkt9lsd
         qbg+lL+cMKLdTi0lH258QNcht4eLcBI1Jgse8+82xIITHJMBgFNUguBqyPAvwWF13/kz
         D0B6r2cGW8Pvft9x188SMKhNR+OYJXWMnn8JQzRTBC99hSLyCWLc9Wb8YFkjhkvm6Bpd
         pTXg==
X-Forwarded-Encrypted: i=1; AJvYcCWkaSDrHspgJPx1gzT/ZDrxMv3Ooby91U4qc1SkzB2qrFoyl7awpzK14DCGdyj4eg/8qWFEtGK4LIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxee38FPlgEiKhiPkAE7OVCbHkB4N5UDp4MzmWA4fnj6EtoZcAb
	mDKwCZgSH0ChxwBXGFKdWzVAUrswbB+35wmcJ5NMThYvOyEorWm0xfe7qFAvXJRVLihLO451Wev
	SqNCBYHgfm4u+HH7IEvS6D25wAMOZCgE=
X-Gm-Gg: ASbGncsKyS6cUBi/dixtrHMuugcIC5UTIe247hf7MCVON8+oPiM4FjNIV+3WW45wv26
	D1daiDR38VcNT/haSp6k3jJpMqP5p5AiZgQ+Vz88Zmt/juHrJ4ubw+fc6uW6R3WX4xhew3RJkaJ
	4rGfAlVC/uUxLx+u648UKjaQ6G1jWJi6dkEbw4hjfpSEYMtWVpCRhgij5WC1RmgU5pQxQfXwWGT
	Vqoew==
X-Google-Smtp-Source: AGHT+IH4edUe2ZDT+F8k5SmTATaSuDVLHbdQ28u3hgjep5mMKUZPPtdzGoJoxw0MfQUQLmdlL6QIy7eQAwue/tN4ZzM=
X-Received: by 2002:a05:6512:3ba6:b0:553:6583:8e6 with SMTP id
 2adb3069b0e04-55a5136bd25mr1967836e87.15.1753357291340; Thu, 24 Jul 2025
 04:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com> <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
 <ea37a8cb-7d65-4c74-8c28-39579b5121cb@suse.com> <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
In-Reply-To: <CAGeoDV9zYwGg0pSrMZVK8AdGpX1m8kjExc2twx93yR+SbnrkcA@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Jul 2025 14:41:20 +0300
X-Gm-Features: Ac12FXxSirH1EBvHG6FJdI3w2KTKmj3Akf9QWOC6dVDGAA4H5ojXOwPVclV2PZY
Message-ID: <CAGeoDV9+Tdk9S63hegQt=CpLD9Ka16qqGs9fApbG9-Q=jBW8PQ@mail.gmail.com>
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, Jun 24, 2025 at 12:32=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.c=
om> wrote:
>
> On Tue, Jun 24, 2025 at 11:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> > On 24.06.2025 10:29, Mykola Kvach wrote:
> > > On Tue, Jun 24, 2025 at 10:53=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> > >> On 24.06.2025 09:18, Mykola Kvach wrote:
> > >>> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_u=
art_driver =3D {
> > >>>      .start_tx     =3D scif_uart_start_tx,
> > >>>      .stop_tx      =3D scif_uart_stop_tx,
> > >>>      .vuart_info   =3D scif_vuart_info,
> > >>> +#ifdef CONFIG_SYSTEM_SUSPEND
> > >>> +    .suspend      =3D scif_uart_suspend,
> > >>> +    .resume       =3D scif_uart_resume,
> > >>> +#endif
> > >>>  };
> > >>
> > >> As this being put inside #ifdef was to be expected, imo a prereq cha=
nge is to
> > >> also make the struct fields conditional in xen/console.h. I think I =
did even
> > >> comment to this effect back at the time.
> > >
> > > Would you prefer that I include this change in the current patch
> > > series, or is it acceptable to address it in a separate patch?
> >
> > Either way is fine with me. I expect the header fine change to be able =
to go
> > in right away (once submitted), whereas the patch here may take some ti=
me for
> > people to review.
>
> Got it, I'll submit a separate patch to make the struct fields and
> related code wrapped within SYSTEM_SUSPEND.
>
> ~Mykola
>
> >
> > Jan

Jan=E2=80=99s proposal to conditionally include the 'suspend' and 'resume' =
fields
in 'struct uart_driver' under CONFIG_SYSTEM_SUSPEND has already been
merged -- thanks!

Could you please take another look at this patch when time permits?


Best regards,
Mykola


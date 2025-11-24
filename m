Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAEC81062
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171187.1496219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXaq-0006Dr-Ng; Mon, 24 Nov 2025 14:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171187.1496219; Mon, 24 Nov 2025 14:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXaq-0006AV-Js; Mon, 24 Nov 2025 14:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1171187;
 Mon, 24 Nov 2025 14:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNXao-00069o-S2
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:31:02 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3243c533-c942-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:31:00 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3414de5b27eso3430838a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:31:00 -0800 (PST)
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
X-Inumbo-ID: 3243c533-c942-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763994659; x=1764599459; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4asNrNeJA6iBvqutjSt94zd0lcIIuAHvAQwmomaeYak=;
        b=nEhacNk3heg7Kpl64sIMtXCvABzoRGE/UN+V2LvNzaMSwaVXEaPRxyYG0KuuX4TZwQ
         b0GlPxlP/Lq3QsfVxTS0vJUbmqnTtwxlhUJYBC6ib3W8H71aDDrZL0IKHTSDFsilj0l6
         qDfT7IlM1f7n+eKUNb2+vFNedR/25AfxlsNYD/99X+VtkUZ7hxgue2sGFceN1M2uMi/Y
         HHIPowB7xt6ygm6WF0SQQ83bnZTcMIjCICFul6BIgTqrL3oifCajlRIhWQsbWJCSRrZA
         9HrVQpp3bxxTk4MQPUni9lmAYT8v+xW4Y5wP9f6buzHsmPG8oMizTa28Dwo8luWsACcK
         SmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994659; x=1764599459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4asNrNeJA6iBvqutjSt94zd0lcIIuAHvAQwmomaeYak=;
        b=jT05gOKO0Ojk/CRIMZjuG3FtgYz+LPGEKLcki51NHjMQEg2FKggIkrDAFmBfC1iRgP
         PYnk4gnj4uwPkSygCCNh+L5TdbKXBUkdn9mbYNqKkyxd9zYalNU4+sQgDztpVWubh9de
         Dv71iYOsKqz9bDnIXZjbzsQw9HXWbH7Ule0fXfMx1WRup0+YjklNfSVrgSlEQaVDwiBk
         Rzo0LUnIs0i9aQf5d0BU6c2/bV/6uhfu2zWC1EEPyKo5wC2Mz5PmqZpOenmjFROaNuLi
         QcwV/c1vBZwk+TaXyCAbJveY79xC6zx+2Uvl1vPUlT/oTIYwCvj8cC9OuKs7fCMo98Z6
         0BdA==
X-Gm-Message-State: AOJu0YzUJhsEtZCQ+SeIJ/g7PmrkTHmysEcZ9D2dCKkp9x70FfYh3oso
	5wYlXlgk+ZSVK9rNETbbZBtGi1se6YAdualIS6OccAOBPqjW5/c81AJr8Xq06SLPgZNggooCLwo
	riLR8d1zDBY/2J7E8LgF54dhc4+YBXQ==
X-Gm-Gg: ASbGncsfmM5Fw8sJJGT+D1bVsNNugb4EjoF03rhqzdobOUpn1pxT9946gGPbpk8VHwj
	LS1sxZWTO4Vk2FObTKHOx+1awNjBLstb5+MfpJuWIoiBA22zr2rsE6B327WAyJSvD2/bJ6EOUav
	dHmwdatjJlxkljx9abUqK46kTZj0KT1Nj83tdomAtO5dZH0hYp9b4qLfnOd2n4W5qP3xcFcFN+G
	kWklZZCjeIsmc/IskQvfveLEriYyE4xoy534mb8niX6ogfSiKwHH92d0hgAV20jkowI0Xs7RFxm
	CSjSQT5MqzLYTzVscAb/NZvN
X-Google-Smtp-Source: AGHT+IFZwwNJm2rksFlqFXOlv0lLus3HX720aZglZxISk5YyB0KMXV+DcFSYpmkNuZM+0ZHxxvSaUJ8nC8gj41Q8ZhE=
X-Received: by 2002:a17:90a:c2ce:b0:343:6c71:6d31 with SMTP id
 98e67ed59e1d1-34733e93813mr11809897a91.11.1763994658881; Mon, 24 Nov 2025
 06:30:58 -0800 (PST)
MIME-Version: 1.0
References: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
 <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
 <fe9df7df-3e4e-4fe0-965c-d9d317d629cb@citrix.com>
In-Reply-To: <fe9df7df-3e4e-4fe0-965c-d9d317d629cb@citrix.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 24 Nov 2025 08:30:47 -0600
X-Gm-Features: AWmQ_bn8g-r01OE1u18CbAb5MZ7bKs7RA3-TZcySTSvcxmFnYFKvSLba8vCuSMY
Message-ID: <CAHFNDNhYp3yBrdtP3nN=+iTVRNHqKGyH0XuyjWuG7cYe+Grb5A@mail.gmail.com>
Subject: Re: [PATCH v3] XEN: enable MC/DC coverage for Clang
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 8:19=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 24/11/2025 1:17 pm, Saman Dehghan wrote:
> > diff --git a/xen/Kconfig b/xen/Kconfig
> > index a5e5af3b76..8f2cc111cd 100644
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -51,9 +51,14 @@ config CC_HAS_ASM_GOTO_OUTPUT
> >       depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> >       depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(=
x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
> >
> > -# Compiler supports -fcondition-coverage aka MC/DC
> > +# Compiler supports Modified Condition/Decision Coverage (MC/DC).
>
> Ah sorry, I only meant for this line.  Enough for someone to usefully
> google.
>
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I can trim this down on commit if you're happy.
>
> ~Andrew

I=E2=80=99m happy with it, thanks a lot Andrew for suggesting to trim that =
line.

~Saman

>
> > +# MC/DC is a rigorous code coverage metric that requires every conditi=
on
> > +# within a decision (boolean expression) to be shown to independently
> > +# influence the decision's final outcome.
> > +#
> > +# Minimum toolchain baseline: GCC >=3D 14, or Clang >=3D 18.
> >  config CC_HAS_MCDC
> > -     def_bool $(cc-option,-fcondition-coverage)
> > +     def_bool $(cc-option,-fcondition-coverage) || $(cc-option,-fprofi=
le-instr-generate -fcoverage-mapping -fcoverage-mcdc)
> >
> >  # Set code alignment.
> >  #
> >


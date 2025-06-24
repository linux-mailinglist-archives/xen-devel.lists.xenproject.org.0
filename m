Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BCAE5F36
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023350.1399317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz27-0000Ca-M4; Tue, 24 Jun 2025 08:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023350.1399317; Tue, 24 Jun 2025 08:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz27-0000B4-JC; Tue, 24 Jun 2025 08:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1023350;
 Tue, 24 Jun 2025 08:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uTz25-0000Ax-SB
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:29:33 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a1a599b-50d5-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 10:29:32 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54e98f73850so4405519e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:29:31 -0700 (PDT)
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
X-Inumbo-ID: 5a1a599b-50d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750753771; x=1751358571; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EINKtiFQ12x+G2hBiaJd1jBjzmgneJmem09Rc4JkTN0=;
        b=gAY5LSZDwyym7poa/7TnUUFbhcogJOMEicsuUgPqaJYyfFOuIFgBk8KNRB+Ljf91ax
         DU5DhzQiIbn89tqBbyVgUmnkhh0fDjz96sEekV/5fLSkQHddYuXFloPJSqGX2BVXpcQy
         ziTb7flwI9mtuSXnG9w++HkCOTMpcxI/yjlLsV62hGAQSapiURZtCmFPCLU0DwZz1+fX
         zMuyUszBID4SFmuRXaoWH4yye/VsfS4Y9DTwFm2yiKpkj0aKus+Pzc/L6tH6o+hHYRsH
         ZBDrfMPx3JT0HeeHpuG+t5TdelUAmLk7/Q9mjJPjqDqONfPbd5Nn3w3Xczqv/mLoUHBK
         blmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753771; x=1751358571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EINKtiFQ12x+G2hBiaJd1jBjzmgneJmem09Rc4JkTN0=;
        b=LHdPbHHLHQumr+YhxZnKO0eDzFRw7Pgi2mog+Z68N5UKDQ8y52w8au4xuo2uXhKP3i
         gzrKiTNk4f/GTw8Y/YG12lqZI879w6pFEd7vZKyD2MfzR+NOIO+Ej0ucQ/2XtlqHaUKG
         kZ5W+YXja5bGokGaer1eC0wkfOw4NMwbMQ4idXGjQmNdjTtYUPr8puUFYkbaTQhoA+ZO
         Unmpg4twexTqkSHbXW6O77k0T54NAedcYnGFFlpPIPSdwrQKund60k7B5R5L5m90XmFK
         So7G35x0oRadelZEMYzfDPHRneRUH3FoxRHEpGC5qxBGKCD4RVO97MfkNaQYmWCiMJMq
         q/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2KKx89rSRdgNk41gH9pvsZkNfoKsfiG5UOQ6SuOyj/oADiEZhkUhfZS/F2sYcK9qR+6kuKQqBpE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWC4WOJf2vVaJ9qM2FMngZHbGTiyIb98dC+bRxkDxevo4XV2pW
	xQxjGtjKQ7JfdYpms7vbe6/rwMhAQganRxR5Dqj6mlsjEhBWEWJuvBl+h5f27RncP5cHRTZzqVR
	EHu6sOcv9m6yiq5hfcsdvQGO6DWu7HyI=
X-Gm-Gg: ASbGncuBSyhQfCbu66Wg/V81fCHDiGhmvR0Ek+Wau8fUdWK5FhBAuuB8+umt8jZPK79
	JO1ftScfYgVTFSHFvoIafYKZ+sU2nu0l697cX1G1KwBXxFY1mziojtRwwJB1Gqit79ci+8qbEJA
	MZX1kABSkoHT5vCBwb4m4SvZlh12+DpBGeK336CPFWPg==
X-Google-Smtp-Source: AGHT+IF1Z5fc+8q7VvYuPoBC9GNvSUrGip+h7Ag1qwI50ylEwDgEVsC4bssJWV7ulR3nLDiZzpf+sj9plIipEO021NE=
X-Received: by 2002:a05:6512:318e:b0:553:3770:c907 with SMTP id
 2adb3069b0e04-553e3b9adf2mr4634176e87.10.1750753771243; Tue, 24 Jun 2025
 01:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
 <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
In-Reply-To: <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 24 Jun 2025 11:29:19 +0300
X-Gm-Features: AX0GCFu7bWTDJvjIOhddrRP2JQTFOZKqpLEv-cfb0XMOYyfyeofZe8_rsyb9woc
Message-ID: <CAGeoDV98LJup77GQ4YrbeqSBeoojaNe+46NX37dHoiFDDHUGtw@mail.gmail.com>
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jun 24, 2025 at 10:53=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.06.2025 09:18, Mykola Kvach wrote:
> > @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_=
driver =3D {
> >      .start_tx     =3D scif_uart_start_tx,
> >      .stop_tx      =3D scif_uart_stop_tx,
> >      .vuart_info   =3D scif_vuart_info,
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    .suspend      =3D scif_uart_suspend,
> > +    .resume       =3D scif_uart_resume,
> > +#endif
> >  };
>
> As this being put inside #ifdef was to be expected, imo a prereq change i=
s to
> also make the struct fields conditional in xen/console.h. I think I did e=
ven
> comment to this effect back at the time.

Would you prefer that I include this change in the current patch
series, or is it acceptable to address it in a separate patch?

>
> Jan

Best Regards,
Mykola


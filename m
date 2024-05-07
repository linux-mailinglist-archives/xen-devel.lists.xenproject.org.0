Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EA8BE0D0
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 13:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718014.1120507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4IpB-0004t5-7f; Tue, 07 May 2024 11:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718014.1120507; Tue, 07 May 2024 11:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4IpB-0004qA-3y; Tue, 07 May 2024 11:17:33 +0000
Received: by outflank-mailman (input) for mailman id 718014;
 Tue, 07 May 2024 11:17:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7h5X=MK=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s4Ip9-0004q4-3I
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 11:17:31 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d531db-0c63-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 13:17:29 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5b2058b16d3so1050982eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 04:17:29 -0700 (PDT)
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
X-Inumbo-ID: 63d531db-0c63-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715080648; x=1715685448; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnxMVQLxN6lfLXdxL4OeHbWXPiJqXf0eZqdPM9jpIPY=;
        b=oXiQRlPdl5ZYuc7oocACoGEV0R1S0PKxfNhM1ppNaNUrodbVTv6DqChRcunn+Y0wBP
         oK0ihX6xqvZHrmZAPj0u2i8xtVGi1MsyMJ4GhxjrM4MpO/83uK9EC9dCqU5N2ssB6woH
         A2sAN6yo7n0fCSz3piYrfugPLZUlEZ68NpCaBRhNBcEsEBjfYf9vZ0aWyUiJtbjvfFFo
         rX11HSghdyOFktWvbokNoIvUmUmUtYaq2fQj1Cx1t7reuCL28QsLDVYAljOVVGEHmgjx
         oe1X/woDyRaqkikl2TWZuEmNmR6PAWQgu4BNqUNUk0JQXUaQoJTxGvjjZkwN3luMi1eO
         b3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715080648; x=1715685448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnxMVQLxN6lfLXdxL4OeHbWXPiJqXf0eZqdPM9jpIPY=;
        b=axvmwZ9mVez9IyuC3gSOfx66u4wSYP/mjuEW1IVR9JjGhmtjBD5Df57bnFnom/+R5J
         NZnq58UyPBf3FrBHuy5yTKNcDgqFEuRKQcmI0OyTAOedQ0b8ipt+AdugiTeodAfj6l0o
         16lUjxPyFXTEyw0gTo6KQlDAWb8O60QA44EkbGmwSpdxH+9zsUrArz1fnTLSBofHYTUn
         Gh9a9T6Ltc1HB2Q5lbeVn8F0V7C9FfvS8ifnxzXrxqlumU4QGKJwIujdrHNig8Q23u9s
         hr8jpM4z6c9F7Uo2gt2IWXe6iUmX/feDz7b7tt9aZfQg8E3+54p8zHiS2PnWKK6KDbmz
         L2Qw==
X-Gm-Message-State: AOJu0YyROBhMKjtlkXE+952z9zu/Kv2Q4WFecLO2FEUcXia81AkdviA6
	Mh/C0EVpkCsO4KsxUjaxdVyvnAfRNIRB2krJDqMVBImZd+ZHiC5ur8z14nj1rnptJAJT4jjbtoQ
	Z1y3+EzXsq33pH9vpQR/OQ66Zjsc7M8vGNGaP9g==
X-Google-Smtp-Source: AGHT+IFPb40kBdSq6e2UlwPFFb2+PpFqpZdbqA6mfmmn7A46+dNh903vNpriL6FBENJs88KoAeW1eleHY+B2kxa4fTE=
X-Received: by 2002:a4a:5441:0:b0:5aa:6404:936a with SMTP id
 t62-20020a4a5441000000b005aa6404936amr12790871ooa.5.1715080648523; Tue, 07
 May 2024 04:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
 <20240502145645.1201613-6-jens.wiklander@linaro.org> <935e3947-53ee-48c5-a10c-5fa7f572ae65@xen.org>
 <CAHUa44HdA_cdZcjbVL+xYXnLVkdK1hK5hfU_k+fZkS8=VAOy1A@mail.gmail.com> <447340c3-d57a-411b-8d4d-29e8683b27d9@xen.org>
In-Reply-To: <447340c3-d57a-411b-8d4d-29e8683b27d9@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 7 May 2024 13:17:16 +0200
Message-ID: <CAHUa44Fc6pRDjUr1HiW7r=QB4kxCEdRz_G9ATLqEg2KqNp+gFA@mail.gmail.com>
Subject: Re: [XEN PATCH v4 5/5] xen/arm: ffa: support notification
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, May 3, 2024 at 4:25=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> On 03/05/2024 14:54, Jens Wiklander wrote:
> >>> +static int ffa_setup_irq_callback(struct notifier_block *nfb,
> >>> +                                  unsigned long action, void *hcpu)
> >>> +{
> >>> +    unsigned int cpu =3D (unsigned long)hcpu;
> >>> +    struct notif_irq_info irq_info =3D { };
> >>> +
> >>> +    switch ( action )
> >>> +    {
> >>> +    case CPU_ONLINE:
> >>
> >> Can't you execute the notifier in CPU_STARTING? This will be called on
> >> the CPU directly, so you should be able to use request_irq(...).
> >
> > I tried that first but it failed with the ASSERT_ALLOC_CONTEXT() in _xm=
alloc().
> >
> > I've also tested a three-step solution with CPU_UP_PREPARE,
> > CPU_STARTING, and CPU_UP_CANCELED.
> > My approach here is more direct, but it still suffers from a weakness
> > in error handling even if it seems quite unlikely to run out of heap
> > or for setup_irq() to fail at this stage.
>
> Ah I didn't notice that notify_cpu_starting() is called with IRQ
> disabled. I assumed they would be enabled.
>
> Then I would consider to do:
>
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 6efed876782e..db322672e508 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -389,6 +389,7 @@ void asmlinkage start_secondary(void)
>        */
>       init_maintenance_interrupt();
>       init_timer_interrupt();
> +    init_tee_interrupt();
>
>       local_abort_enable();
>
> And plumb through the TEE subsystem.

I'll use that in the next version, it should remove a lot of complex code.

Thanks,
Jens


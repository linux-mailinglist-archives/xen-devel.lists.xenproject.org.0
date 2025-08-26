Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2DB365E2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094485.1449787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu54-0003vO-KU; Tue, 26 Aug 2025 13:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094485.1449787; Tue, 26 Aug 2025 13:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu54-0003sU-Hg; Tue, 26 Aug 2025 13:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1094485;
 Tue, 26 Aug 2025 13:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtx1-0007MD-3s
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:43:03 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95beb078-8282-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:43:01 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f44d5e6f8so1971049e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:43:01 -0700 (PDT)
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
X-Inumbo-ID: 95beb078-8282-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215781; x=1756820581; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acZuwbLHFG1MN6CIPiSWJkrdoomkBIOc5XFBpAwwQb4=;
        b=FO9gbLlAD1aPwsoH5sRRN8nvD1JrhTKU4yCXfAkvv9Inz74/9vHIPaL/kDGr2Rms48
         nURVb2j8r2K5XVeY2PpfutFwosgZhW1phIZZGSHPMC8CTA4i+jDkq3Bk+Z8b8GDg8oOB
         odWZPuRwXT0aFpAxULF3YbWhF6JMi/jP7EawsGMB2ThRWvvn7aGef2h6cNbLlNrVrMwC
         QVjGaybytOU1+PkrMPG5pFAKvdgUuGpIKYvkEXbuF+bDVxMDZnET4yKUl+Y4WuRy/F5V
         CTntWQEkYFmPxxFpBvapkF0UoG1nZViV0MRmuIrhuieqO9Objwph7vaqqrx164dCC9RX
         CIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215781; x=1756820581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acZuwbLHFG1MN6CIPiSWJkrdoomkBIOc5XFBpAwwQb4=;
        b=jE0htqkdvKYuWaPWKr/gGU+YGUwToeS0zPqLKydWb7sndn3paUdE6kRPMAEtXFpgAy
         K6/Si2CC49PqOIlbIoQYLOTfd1e+xDdeGbYq8ZCaQAsaiBs8oxlgYJbY5uH2FqjdWM7L
         VYwC1XEbV/tAlGpJCrwX/Oi1jUTvK5nnGMwQBSrPaPJ9mhlSKwxyqHd08lRR/UmVViQn
         PyqwN/8iBE7dH+WqhRXI2XFIGXoGsZ27uieSIdvyw4wbc/0q+UMt/fNtG/CXW9Ei1pu5
         heOniDx+zb2zal/Pwpc3rJejFsPCcfh/ASjYsbOpJq64QOqPCzF+TCmc3w7M6u31wlrh
         P6mQ==
X-Gm-Message-State: AOJu0YwqssCpc7eMLu7PqHGXOIOv7n+AyoOBaWe5JAF2sH2Xr3BhQW3D
	sNzBA83dga/6Gu0VRq1BS+Bjhf6ZEs204YWSB+6tskSssIcO0rzaEeyLOGftlnyu/oWmQODOxAa
	lKHwb8r3IIZov8K7c/RGcdwUIuKshrsY=
X-Gm-Gg: ASbGncsCsW49/Ow/fez74SUbMnGZ7jiSsNA8z//8MHIkXRMYTLHxx41zjgFlaN3HLPU
	Yjp8XCcaNc9eQsVMeWdFbCcuV2ZLYjooY/EW3qns7zEeM0/lX5+80OV03+pR57enU64Liwe0qDq
	1IPyoYdWs7OAXXEb7yfsTvk81B7UKfnv6FbBwRqg459seQPmDuv18alh+U9vl2zQaVuz0LcYi14
	fkO3RE6jYcTXURA
X-Google-Smtp-Source: AGHT+IFD6cBisTwl8yAlnXGU3XjDUba1NWnGY8Bpx7m+/ZmrEiQZ6ZJnfS7ukw1yacPk5YDSlnSb1LFmmljeX1UgkY4=
X-Received: by 2002:a05:6512:31c3:b0:553:ab9a:c94 with SMTP id
 2adb3069b0e04-55f0c6f7196mr5075269e87.6.1756215781195; Tue, 26 Aug 2025
 06:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
 <87frdh7wk0.fsf@epam.com>
In-Reply-To: <87frdh7wk0.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:49 +0300
X-Gm-Features: Ac12FXxG5aeG8gGEf9kaJaoXCSZuXqFdfsBbzYHmlwfJAeDRKcQjUBs69CIBOMY
Message-ID: <CAGeoDV9ftF_hihWJHqEV8R8X6ddbbZ_GCe7pgftD+S1u+FCr8g@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen suspend/resume
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 8:55=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > This is done using generic iommu_suspend/resume functions that cause
> > IOMMU driver specific suspend/resume handlers to be called for enabled
> > IOMMU (if one has suspend/resume driver handlers implemented).
> >
> > These handlers work only when IPMMU-VMSA is used; otherwise,
> > we return an error during system suspend requests.
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Tested-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > ---
> >  xen/arch/arm/suspend.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index b5398e5ca6..cb86426ebd 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -4,6 +4,7 @@
> >  #include <asm/suspend.h>
> >  #include <xen/console.h>
> >  #include <xen/cpu.h>
> > +#include <xen/iommu.h>
> >  #include <xen/llc-coloring.h>
> >  #include <xen/sched.h>
> >
> > @@ -49,6 +50,13 @@ static long system_suspend(void *data)
> >
> >      time_suspend();
> >
> > +    status =3D iommu_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_time;
> > +    }
> > +
> >      local_irq_save(flags);
> >      status =3D gic_suspend();
> >      if ( status )
> > @@ -105,6 +113,10 @@ static long system_suspend(void *data)
> >
> >   resume_irqs:
> >      local_irq_restore(flags);
> > +
> > +    iommu_resume();
> > +
> > + resume_time:
> >      time_resume();
> >
> >   resume_nonboot_cpus:
> > @@ -140,6 +152,15 @@ int host_system_suspend(void)
> >          return -ENOSYS;
> >      }
> >
> > +    /* TODO: drop check once suspend/resume support for SMMU is implem=
ented */
> > +#ifndef CONFIG_IPMMU_VMSA
>
> This check is meaningless, as you can have CONFIG_IPMMU_VMSA enabled
> along with CONFIG_ARM_SMMU on a system with SMMU. I think it is enough
> that iommu_suspend() will fail during system_suspend(), isn't it?

Not exactly. In the case of SMMU, we don=E2=80=99t have valid iommu_suspend=
/iommu_resume
handlers. So it=E2=80=99s possible to have CONFIG_ARM_SMMU enabled and iomm=
u_enabled
set, but without the appropriate suspend handlers. This could lead to
a crash during
system_suspend().


>
>
> > +    if ( iommu_enabled )
> > +    {
> > +        dprintk(XENLOG_ERR, "IOMMU is enabled, suspend not supported y=
et\n");
> > +        return -ENOSYS;
> > +    }
> > +#endif
> > +
> >      /*
> >       * system_suspend should be called when Dom0 finalizes the suspend
> >       * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 c=
ould
>
> --
> WBR, Volodymyr

Best regards,
Mykola


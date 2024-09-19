Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E497CBA3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 17:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800802.1210806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJAn-0004TR-HO; Thu, 19 Sep 2024 15:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800802.1210806; Thu, 19 Sep 2024 15:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJAn-0004RJ-Eo; Thu, 19 Sep 2024 15:34:25 +0000
Received: by outflank-mailman (input) for mailman id 800802;
 Thu, 19 Sep 2024 15:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGzI=QR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1srJAm-0004RD-Rn
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 15:34:24 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a476bcb5-769c-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 17:34:22 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3e049185cfeso418742b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 08:34:22 -0700 (PDT)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-84939994e8dsm1436459241.27.2024.09.19.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 08:34:19 -0700 (PDT)
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
X-Inumbo-ID: a476bcb5-769c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726760061; x=1727364861; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjDhq7+1RdYCrJ1i4TPTaRAHhdYLbWjdVx3paSErPag=;
        b=WduikiZxDkHpQ5ryIP87/tmmMWTV3BsQhoVaRAWOcR0z81Z0EGqBmFnjMYzXKLqfLS
         euZejEHv9uACgHqlNAWxbnLUSUpB+Hn3ayRCkdjtyoTPZjJJtpFNeXJC3zgyut1w1Ut8
         FXzXZz8Uk1rrHaa9XOJLwh/lArEpzLtRLYJ/xdS0WAHxVS7G/q+TDb04awkQN5BozcsF
         YEjs76xaG3PN8Y7hoOtRmO6XDuB73y6mMVygTk5fS/c41qsrZH/mOcdI9S9g9I4JrDPf
         /O9y324fqX//IkxrXoStQFI1Gi4wPzz88bM2PBb9lnRPFbD3qW1QvFvfSYL2tOggi2sj
         KugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726760061; x=1727364861;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjDhq7+1RdYCrJ1i4TPTaRAHhdYLbWjdVx3paSErPag=;
        b=KEthxJ48oXHzGVsL6i8JDo8/1SAXc7giDL7E9RkdxJbVKZh6aDsTeSVyT6oBtt+6ft
         PB7n5X+IlW7xm4mO7UbzDQcp2oFwr0ZduwEn3ndwZoTB2ACTo9dqnS3d6Aw5mbf6hjqc
         yHRnpNILVStlH9K9BYYQ7oSYZqYn4dfGBOPZMDqNxSyhAvrZbku4Ppd3kKi9IUVYuphN
         DJeawXgciWe4tJHaDdruq98J4ZpjS8NLHE2/Nlgm01W+vKYkpcs1on40szQs2OG9OJN/
         KxA0yeVrlZxBNXQ48XG4d9s3s8FEBJwKdHnIVj5R86DDsfDutxdSosI7n2kxDNRIiNoo
         OQFg==
X-Forwarded-Encrypted: i=1; AJvYcCX/8GMbNO3+dl6CiNZ/T9kUCyXmTcR7fqvI2gkR9ZCSjQ8iqRL0i41uZpG0aIZmpYFPvB73UWdw6pE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtkikcrRiWkmyaH0kdVOO5qX11AsoLzXhGGRUzDUM2PD87pY+X
	fNZMIJPMA9zsqT2FSeg2a625An77FS9ox49Ps7gxzYrEclRjeMk5
X-Google-Smtp-Source: AGHT+IGkPtGASlsN1mWnU/lPiOwMx8LXKTp+l3V1wEIIDvN6gyZZ5xYjRG3djb2ALL6FjuDV5gqYKg==
X-Received: by 2002:a05:6808:211d:b0:3e0:451b:d029 with SMTP id 5614622812f47-3e07a107173mr14248840b6e.15.1726760061048;
        Thu, 19 Sep 2024 08:34:21 -0700 (PDT)
Date: Thu, 19 Sep 2024 17:34:17 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, anthony@xenproject.org, paul@xen.org,
	peter.maydell@linaro.org, alex.bennee@linaro.org,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Message-ID: <ZuxEedSaR4fLKvrn@zapote>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
 <20240916150853.1216703-3-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2409161646360.1417852@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Mon, Sep 16, 2024 at 04:47:43PM -0700, Stefano Stabellini wrote:
> On Mon, 16 Sep 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add a way to enable/disable buffered IOREQs for PVH machines
> > and disable them for ARM. ARM does not support buffered
> > IOREQ's nor the legacy way to map IOREQ info pages.
> > 
> > See the following for more details:
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
> > https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/arm/xen-pvh.c                | 3 +++
> >  hw/i386/xen/xen-pvh.c           | 3 +++
> >  hw/xen/xen-pvh-common.c         | 2 +-
> >  include/hw/xen/xen-pvh-common.h | 3 +++
> >  4 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> > index 04cb9855af..28af3910ea 100644
> > --- a/hw/arm/xen-pvh.c
> > +++ b/hw/arm/xen-pvh.c
> > @@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> >       */
> >      mc->max_cpus = GUEST_MAX_VCPUS;
> >  
> > +    /* Xen/ARM does not use buffered IOREQs.  */
> > +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
> > +
> >      /* List of supported features known to work on PVH ARM.  */
> >      xpc->has_tpm = true;
> >      xpc->has_virtio_mmio = true;
> > diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
> > index 45645667e9..f1f02d3311 100644
> > --- a/hw/i386/xen/xen-pvh.c
> > +++ b/hw/i386/xen/xen-pvh.c
> > @@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
> >      /* We have an implementation specific init to create CPU objects.  */
> >      xpc->init = xen_pvh_init;
> >  
> > +    /* Enable buffered IOREQs.  */
> > +    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
> > +
> >      /*
> >       * PCI INTX routing.
> >       *
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index 08641fdcec..76a9b2b945 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
> >  
> >      xen_pvh_init_ram(s, sysmem);
> >      xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
> > -                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> > +                       xpc->handle_bufioreq,
> >                         &xen_memory_listener);
> >  
> >      if (s->cfg.virtio_mmio_num) {
> > diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
> > index bc09eea936..62c44a1ce7 100644
> > --- a/include/hw/xen/xen-pvh-common.h
> > +++ b/include/hw/xen/xen-pvh-common.h
> > @@ -43,6 +43,9 @@ struct XenPVHMachineClass {
> >       */
> >      int (*set_pci_link_route)(uint8_t line, uint8_t irq);
> >  
> > +    /* Allow implementations to optionally enable buffered ioreqs.  */
> > +    int handle_bufioreq;
> 
> Looking at the corresponding Xen interface this field is uint8_t. I
> think it would be better to use the same type here and also as a
> parameter to xen_register_ioreq in QEMU
>

Thanks Stefano,

I chose int because the interface to the Xen libs uses int:
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/include/xendevicemodel.h;h=797e0c6b2961926a68cd96b8ff5e1627067903ac;hb=HEAD#l40

But yes, the hypercall interface uses uint8_t, I'm happy to change it to
uint8_t in the next version!

Cheers,
Edgar



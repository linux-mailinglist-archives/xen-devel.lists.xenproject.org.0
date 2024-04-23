Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD98AEAFE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710851.1110392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI36-0008LF-EE; Tue, 23 Apr 2024 15:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710851.1110392; Tue, 23 Apr 2024 15:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzI36-0008Iw-Ac; Tue, 23 Apr 2024 15:27:12 +0000
Received: by outflank-mailman (input) for mailman id 710851;
 Tue, 23 Apr 2024 15:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6olb=L4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rzI34-0007z7-2Z
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:27:10 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ba37a0-0185-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:27:09 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5aa28cde736so3572846eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:27:09 -0700 (PDT)
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
X-Inumbo-ID: f2ba37a0-0185-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713886028; x=1714490828; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQpMAezwBtBrbfJQQwzCPmDm9iSWblKPS88LRxAVmaM=;
        b=nQ1melGeztdQ9uYwu7f4R/lyt1/hTCHAFtaIqqFN9x8YP/vzyofgi/y1ToQG815yMI
         EFaZLky27gUT8aUP2EOOCooOQiThfCbpObnQMwWB0ujVbP/7nCYByAY+M7OngJLGoSdy
         kKkd8iDbazc9QFOKy/aVZLD9cryNwBAILVVLvb7dxkE5leU12l2rE5WWfC2eOprovV/8
         wOn2TIqS+GSxASu702+aSOLQZirtW1njlyCEgv7VZjXvr8z6jfa820Ag1d6Ez+WzXfKj
         UhYDCsp2Gcw8+AlSDkZCylo/xH2ziOnf0Im1BgH52r6huAspk9OGemU6vXnIaNzMWFfk
         3AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886028; x=1714490828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQpMAezwBtBrbfJQQwzCPmDm9iSWblKPS88LRxAVmaM=;
        b=Hmga+1MVQ3Zedu6SJ7LRSwP/UB/Af8VLFwKHOaj6tkH9bgwjKR/BN2ltcPjc9TZNK3
         72h956kd57Fp9S/HD98eCfnDJ65VHvJzGDZ9n9HbJ8IFjDw+0fAc6iY4fTBbNdS8oZS2
         I/IMl59TBaOgHNjMrHo0bNEklfsBs6I5hnDNEj3wrtxj784pEgSYLR4IQZg0NK7UFrrj
         81dUHqaiHYPsbe6OKacGnbq0UCNyTnZJPIqTKYOUpozfXUztIyYvZTYI3UGZcsGg/rVj
         szeXU4Rza00X+rhrSDND9NlS73D4ZeJKvyrJIebMoUzPQs+CUtZ6a6BGzwT8ZS2fTGBx
         Tw4A==
X-Gm-Message-State: AOJu0YxZH7rBMtrFnbE9EvuJ0zwxsSB2c96wZM1JkjkxT2cZQU4B/TRS
	saD9h/1xGK0JmmpWd5XP4to2VvMXNb6Xq5M5gasNat+0PNfQnw0uJW5QS3gKzSkDKD3zUhMaqrs
	Id53IHNuUds2hMQG/yHTb8vYWCW103YFHUuz7WA==
X-Google-Smtp-Source: AGHT+IElEORTUNQQqYyx0l2Hfp9wWjp0wfe5BKI/4D9SGX/6LUj/LEJSnN5KGBxt840pocAivan3rmCvPP2e8zb+tj4=
X-Received: by 2002:a4a:d2cd:0:b0:5ad:ec7:1977 with SMTP id
 j13-20020a4ad2cd000000b005ad0ec71977mr15159802oos.0.1713886028171; Tue, 23
 Apr 2024 08:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org> <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
In-Reply-To: <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 Apr 2024 17:26:56 +0200
Message-ID: <CAHUa44FMsdn8LVc782EYno7fiFDBe7RSaiNgEnnzoc-Bozt05A@mail.gmail.com>
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Apr 22, 2024 at 1:40=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Jens,
>
> This is not a full review of the code. I will let Bertrand doing it.
>
> On 22/04/2024 08:37, Jens Wiklander wrote:
> > +void ffa_notif_init(void)
> > +{
> > +    const struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D FFA_FEATURES,
> > +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +    unsigned int irq;
> > +    int ret;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> > +        return;
> > +
> > +    irq =3D resp.a2;
> > +    if ( irq >=3D NR_GIC_SGI )
> > +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> > +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL)=
;
>
> If I am not mistaken, ffa_notif_init() is only called once on the boot
> CPU. However, request_irq() needs to be called on every CPU so the
> callback is registered every where and the interrupt enabled.
>
> I know the name of the function is rather confusing. So can you confirm
> this is what you expected?

Good catch, no this wasn't what I expected. I'll need to change this.

>
> [...]
>
> > diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priv=
ate.h
> > index 98236cbf14a3..ef8ffd4526bd 100644
> > --- a/xen/arch/arm/tee/ffa_private.h
> > +++ b/xen/arch/arm/tee/ffa_private.h
> > @@ -25,6 +25,7 @@
> >   #define FFA_RET_DENIED                  -6
> >   #define FFA_RET_RETRY                   -7
> >   #define FFA_RET_ABORTED                 -8
> > +#define FFA_RET_NO_DATA                 -9
> >
> >   /* FFA_VERSION helpers */
> >   #define FFA_VERSION_MAJOR_SHIFT         16U
> > @@ -97,6 +98,18 @@
> >    */
> >   #define FFA_MAX_SHM_COUNT               32
> >
> > +/*
> > + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
> > + * unused, but that may change.
>
> Are the value below intended for the guests? If so, can they be moved in
> public/arch-arm.h along with the others guest interrupts?

Yes, I'll move it.

>
> > + *
> > + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not=
 used
> > + * by a guest as they in a non-virtualized system typically are assign=
ed to
> > + * the secure world. Here we're free to use SGI 8-15 since they are vi=
rtual
> > + * and have nothing to do with the secure world.
>
> Do you have a pointer to the specification?

There's one at the top of arch/arm/tee/ffa.c,
https://developer.arm.com/documentation/den0077/e
Do you want the link close to the defines when I've moved them to
public/arch-arm.h?
Or is it perhaps better to give a link to "Arm Base System
Architecture v1.0C", https://developer.arm.com/documentation/den0094/
instead?

Thanks,
Jens


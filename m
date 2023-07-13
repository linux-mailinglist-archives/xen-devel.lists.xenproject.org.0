Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85122751947
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562939.879737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqLu-0003Z7-Gp; Thu, 13 Jul 2023 07:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562939.879737; Thu, 13 Jul 2023 07:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqLu-0003WQ-E5; Thu, 13 Jul 2023 07:03:02 +0000
Received: by outflank-mailman (input) for mailman id 562939;
 Thu, 13 Jul 2023 07:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bWA=C7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qJqLt-0003W4-GP
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:03:01 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cad8749-214b-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 09:02:59 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-635e8536ed6so2354216d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 00:02:59 -0700 (PDT)
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
X-Inumbo-ID: 4cad8749-214b-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689231778; x=1691823778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZTJtN55Wca58tCqwYuvWqT79USxYAYDiEgZB7QSGeo=;
        b=kEriNvikz5R/TZ3VfrtVAEk2utPtJnv42xg/MhwyMWjDoK+8HJN4cfL9TjsHcnoxH4
         FLcrH4IeUovTVpt1bCTNVxOmHX3mkB8t1xYDqC8mw7cdv+kO8+quOJjN7Gv3b1i7h0ei
         Km89cIALD75JWzbJvi0cFYo7uch8gUAfrK4TeyfE15BpGsTLcnI+mFiG2djUoGSjiaNe
         ECRd8cRecIIFpQVcy2qY5Wvwm9zrI+Gf/KHzXhImVziUFwBWqKWG5daK1i+G43sL49VC
         J2687BcGCjPLd4PJzWb+lVvG8JyS6yBaxVmHYK/zGNekm0LfuNILlAX9aUdJVYMLLOld
         TbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689231778; x=1691823778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZTJtN55Wca58tCqwYuvWqT79USxYAYDiEgZB7QSGeo=;
        b=EHdbI9fvgR8b5IK1UtT4kEVUmbZU58cGAQP3qgsJte3MyaooPISk8cc11+ApjKe875
         UuGpnoUP0bmxQVOzc0zxNRTC3JcDZpRCKygRmpOlR5mHv5QQMNKDQgDJ48KC3lyysw3a
         nz9S3OHEtrrXF18IaTZ/5iAHjH5T4hwOKikJz/56dNcExOdh+NfEb21f5YQ+aT00D9zN
         jtALwDHTrD7rKLfjxWCkpswPHh9j3h0pEOommxPkROuEu0BG0Ly1EclFiCagx4BUHI2p
         zzPZYV4s0Rg6+Bqe8dGaGX76Ui6EED0g7Hzi/wCK4+3+vtZJJ/RjEr2Zj6mVVvN3MFvJ
         4daQ==
X-Gm-Message-State: ABy/qLao3ZIJLCJ+O1rCLwpJD8UmxwFVz++CTCiWs9BY2ChKQ9UzmJeO
	b5hevdTjLy1Ev0pPOWxrfvS4YA/wNSOJfCd5zygTQQ==
X-Google-Smtp-Source: APBJJlFOD1EHQsjlMKEq0JW+9G5TdQXdWneOYBUts4u8JSA4QNqHF4aQbTCfWAfo71Vq4s+JAxaGCTn+itB6ZFw3cUo=
X-Received: by 2002:a0c:cc13:0:b0:636:39ed:4dd1 with SMTP id
 r19-20020a0ccc13000000b0063639ed4dd1mr766725qvk.29.1689231778335; Thu, 13 Jul
 2023 00:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org> <b1a9be99-6078-6553-74f1-5be5f002b23d@xen.org>
In-Reply-To: <b1a9be99-6078-6553-74f1-5be5f002b23d@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Jul 2023 09:02:47 +0200
Message-ID: <CAHUa44FxkUxN4+pfECk0Sb9JgArNAh7vgKktK+=bY1C0rABVqg@mail.gmail.com>
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to arch_domain_teardown()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <marc.bonnici@arm.com>, 
	Achin Gupta <achin.gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Wed, Jul 12, 2023 at 11:53=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 05/07/2023 10:34, Jens Wiklander wrote:
> > Adds a progress state for tee_domain_teardown() to be called from
> > arch_domain_teardown(). tee_domain_teardown() calls the new callback
> > domain_teardown() in struct tee_mediator_ops.
> >
> > An empty domain_teardown() callback is added to the OP-TEE mediator.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I am a bit confused with the tags ordering. The first signed-off-by
> indicates that Andrew is the author but he co-developped with himself?
> Did you indent to put your signed-off-by first?

Sorry, my mistake, I swapped the two lines. I'll fix it in the next version=
.

>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >
> > ---
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   xen/arch/arm/domain.c              | 36 +++++++++++++++++++++++++++++=
+
> >   xen/arch/arm/include/asm/tee/tee.h |  7 ++++++
> >   xen/arch/arm/tee/optee.c           |  6 +++++
> >   xen/arch/arm/tee/tee.c             |  8 +++++++
> >   4 files changed, 57 insertions(+)
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 15d9709a97d2..18171decdc66 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -795,6 +795,42 @@ fail:
> >
> >   int arch_domain_teardown(struct domain *d)
> >   {
> > +    int ret =3D 0;
> > +
> > +    BUG_ON(!d->is_dying);
> > +
> > +    /* See domain_teardown() for an explanation of all of this magic. =
*/
> > +    switch ( d->teardown.arch_val )
> > +    {
> > +#define PROGRESS(x)                             \
> > +        d->teardown.arch_val =3D PROG_ ## x;      \
> > +        fallthrough;                            \
> > +    case PROG_ ## x
> > +
> > +        enum {
> > +            PROG_none,
> > +            PROG_tee,
> > +            PROG_done,
> > +        };
> > +
> > +    case PROG_none:
> > +        BUILD_BUG_ON(PROG_none !=3D 0);
> > +
> > +    PROGRESS(tee):
> > +        ret =3D tee_domain_teardown(d);
> > +        if ( ret )
> > +            return ret;
> > +        break;
> > +
> > +    PROGRESS(done):
> > +        break;
> > +
> > +#undef PROGRESS
> > +
> > +    default:
> > +        BUG();
> > +    }
> > +
> >       return 0;
> >   }
> >
> > diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/=
asm/tee/tee.h
> > index f483986385c8..da324467e130 100644
> > --- a/xen/arch/arm/include/asm/tee/tee.h
> > +++ b/xen/arch/arm/include/asm/tee/tee.h
> > @@ -34,6 +34,7 @@ struct tee_mediator_ops {
> >        * guest and create own structures for the new domain.
> >        */
> >       int (*domain_init)(struct domain *d);
> > +    int (*domain_teardown)(struct domain *d);
> >
> >       /*
> >        * Called during domain destruction to relinquish resources used
> > @@ -62,6 +63,7 @@ struct tee_mediator_desc {
> >
> >   bool tee_handle_call(struct cpu_user_regs *regs);
> >   int tee_domain_init(struct domain *d, uint16_t tee_type);
> > +int tee_domain_teardown(struct domain *d);
> >   int tee_relinquish_resources(struct domain *d);
> >   uint16_t tee_get_type(void);
> >
> > @@ -93,6 +95,11 @@ static inline int tee_relinquish_resources(struct do=
main *d)
> >       return 0;
> >   }
> >
> > +static inline int tee_domain_teardown(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >   static inline uint16_t tee_get_type(void)
> >   {
> >       return XEN_DOMCTL_CONFIG_TEE_NONE;
> > diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> > index 301d205a36c5..c91bd7d5ac25 100644
> > --- a/xen/arch/arm/tee/optee.c
> > +++ b/xen/arch/arm/tee/optee.c
> > @@ -268,6 +268,11 @@ static int optee_domain_init(struct domain *d)
> >       return 0;
> >   }
> >
> > +static int optee_domain_teardown(struct domain *d)
> > +{
> > +    return 0;
>
> I think for OP-TEE, we also need to moved the smc call to destroy the VM
> here. I am OK if this is not handled here, but it would be worth
> mentioning in the commit message.

Fair enough, I'll mention that in the commit message.

>
> > +}
> > +
> >   static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
> >   {
> >       return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> > @@ -1732,6 +1737,7 @@ static const struct tee_mediator_ops optee_ops =
=3D
> >   {
> >       .probe =3D optee_probe,
> >       .domain_init =3D optee_domain_init,
> > +    .domain_teardown =3D optee_domain_teardown,
> >       .relinquish_resources =3D optee_relinquish_resources,
> >       .handle_call =3D optee_handle_call,
> >   };
> > diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> > index 3964a8a5cddf..ddd17506a9ff 100644
> > --- a/xen/arch/arm/tee/tee.c
> > +++ b/xen/arch/arm/tee/tee.c
> > @@ -52,6 +52,14 @@ int tee_domain_init(struct domain *d, uint16_t tee_t=
ype)
> >       return cur_mediator->ops->domain_init(d);
> >   }
> >
> > +int tee_domain_teardown(struct domain *d)
> > +{
> > +    if ( !cur_mediator )
> > +        return 0;
> > +
> > +    return cur_mediator->ops->domain_teardown(d);
>
> NIT: I would consider to check if the callback is NULL. This would avoid
> providing dummy helper.

Yes, that's an advantage, but we'd treat this callback differently
from others. I'd prefer to keep this as it is if you don't mind.

Thanks,
Jens

>
> > +}
> > +
> >   int tee_relinquish_resources(struct domain *d)
> >   {
> >       if ( !cur_mediator )
>
> Cheers,
>
> --
> Julien Grall


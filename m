Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2D6E1EEB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 11:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521070.809356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFK3-0004jL-Aj; Fri, 14 Apr 2023 09:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521070.809356; Fri, 14 Apr 2023 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFK3-0004gc-7S; Fri, 14 Apr 2023 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 521070;
 Fri, 14 Apr 2023 09:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnFK1-0004fJ-J3
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 09:02:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 107cb59b-daa3-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 11:02:21 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id v27so7545821wra.13
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 02:02:21 -0700 (PDT)
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
X-Inumbo-ID: 107cb59b-daa3-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681462940; x=1684054940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocke09pCVF1SRzVO7CZh1DeCa3giZ7bYqQybME6Jk/o=;
        b=d9Dkol2SQp6LyvvfSh6sz8SQIy/Y4jdNGzPpL0jrhGB6vdxmXMUeT1UZNeb3ECE1cY
         Tsoqr1/DQqEYrAyRhyrDYBIqri1XhKt8UJba7yenr5zOG2YXeCA/VuSfHEBWEddWuOA3
         qt3+ShuoUlZUjtxmF0eYqqy9ywf0vxDm3ZORxPeJckC6FGa0QJ+GY17b2pnQW8DthuVa
         zkL8V79vHmBfMJfruLg3d15zm47BA/WLxOE9VwkSMakiUnt6DWSbZTwTXzAZtnOAGMvp
         wq9dxDElmA/t+quRPtxrBd3ManFUGYqmNRVDaGGyth+KfYMd8LMX+QHMks4hoiAI8XnP
         wrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681462940; x=1684054940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ocke09pCVF1SRzVO7CZh1DeCa3giZ7bYqQybME6Jk/o=;
        b=VGtOYtXCJp1f4IMKWJe5jBzWDesIEhjHB731YAb6Ebl7J1lCKoqwXNMRu+wU9o3nkz
         zfKenGWTGD1mtY+uRll1fckuAMvQPhAHlpCjFJuwxIthq6wjKL0A3NxXvwIj8RVh9XIl
         1QZspTV2cPKDaLiFFhBwD6hniiPnENDVtmiE+D/STzBYScYhEwvRYRgJKJZYI2Leyt9J
         UwPMNRntjhlSV0kygmpx39KHVFZbYNPzL6j9yQ0RMH405mx7HatXpn98rDcBN+WvxGGh
         CKRgahdYhpR9pwq05aFAH/oPnaxOkFk0DKAgWVFixOIxY8NWBIQ/xI8m+ZV1mPmISXMJ
         07IQ==
X-Gm-Message-State: AAQBX9cG8wpbhRgwrM+3eYcF4byhELOrpuVhT2uB2sMHQemfQpLRgaTA
	cR1Q45dnI+dBib9BtnKOP6emeCzHlzF/JX1hrAAkHFip1Q67FuOF
X-Google-Smtp-Source: AKy350a/YvgC3+sORWjYf1mdBFgj5RF2hg9YrRLfVC/y9qxUJm/ZJaYPS2L1UEt1PO5Ce8As5NBhCe8mSVaHCaHQgHY=
X-Received: by 2002:a05:6000:1e02:b0:2f4:2e72:5bf7 with SMTP id
 bj2-20020a0560001e0200b002f42e725bf7mr2815992wrb.0.1681462940494; Fri, 14 Apr
 2023 02:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org> <AS8PR08MB7991020558FDF641D9E89C7192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991020558FDF641D9E89C7192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 11:02:09 +0200
Message-ID: <CAHUa44H8tNz-18m=rR-V+Sn1tH+yNqpnVver0OZ11PuXedwjow@mail.gmail.com>
Subject: Re: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:16=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
> >
> > Adds support for sending a FF-A direct request. Checks that the SP also
> > supports handling a 32-bit direct request. 64-bit direct requests are
> > not used by the mediator itself so there is not need to check for that.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  xen/arch/arm/tee/ffa.c | 112
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index f129879c5b81..f2cce955d981 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
> >      return true;
> >  }
> >
> > +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> > +{
> > +    switch ( resp->a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp->a2 )
> > +            return resp->a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +    case FFA_SUCCESS_64:
> > +        return FFA_RET_OK;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t=
 a2,
> > +                               register_t a3, register_t a4)
> > +{
> > +    const struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D fid,
> > +        .a1 =3D a1,
> > +        .a2 =3D a2,
> > +        .a3 =3D a3,
> > +        .a4 =3D a4,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_features(uint32_t id)
> > +{
> > +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> > +}
> > +
> > +static bool check_mandatory_feature(uint32_t id)
> > +{
> > +    int32_t ret =3D ffa_features(id);
> > +
> > +    if (ret)
>
> Coding style nit: You need spaces before and after "ret", i.e.
> if ( ret )
>
> With this fixed:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll fix it.

Thanks,
Jens

>
> Kind regards,
> Henry


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C566A983C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 14:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506004.779020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5JC-0006gX-Cs; Fri, 03 Mar 2023 13:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506004.779020; Fri, 03 Mar 2023 13:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5JC-0006d7-8q; Fri, 03 Mar 2023 13:18:50 +0000
Received: by outflank-mailman (input) for mailman id 506004;
 Fri, 03 Mar 2023 13:18:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pY5JB-0006d1-S3
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 13:18:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee6d1dc7-b9c5-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 14:18:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id h14so2238385wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 05:18:47 -0800 (PST)
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
X-Inumbo-ID: ee6d1dc7-b9c5-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677849527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0vC7BO849wdFN1d11IJCyZzTKdINlfggKV8T5pIJyE=;
        b=FHhVD1ZLaJMbbuC43jnK/88EPq56ybtd5ie2Htxrs6FDPAfi/D3sqo6yZse6u6AdYq
         Pkgs5zTkA8tNyv2S7UDsDMXDdRwn6E17cYNMBOybBkv1GWHe1nLeYEbeYLvUAuTjIg3S
         tPNE3seHc5X3aonhLOhTjhBBsiux42mhMDTQisP+esOnC+bgqRt9JpDUvGTsKfyqYAmo
         JU/H8s8vt0120YviVJvwMlqIVxSMSrJQsXqAEtvgxrB0MPDuwFUCS8W0Fk5Jbs0BWZQX
         HLd9ixAhpjWxDWGJVRwrFA7kzD+JlIwkndcaRZCSAWtYDr/JrsTkbHZx5J7Luo9qsjbL
         APoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677849527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0vC7BO849wdFN1d11IJCyZzTKdINlfggKV8T5pIJyE=;
        b=EYuM19HQyVxpeSnKd0gAkQgw0fzN5nobVcdWbzmOvnmY0eXlINQLCHggEIfZDldIFi
         ApSAl6IdPmiJSYu/tQ2PMtN0rci5R/eAgHIPmJYBJmPgLfdntou/Y0s0ZVVAdqRc0kPw
         r0pDPT9cq0XDX7ghh73fUXaqeklz6/r8TbFLAx58KBX9tfMVBa22zohA+JiHOA8askk8
         gnQUiOEC0Cm2NxR6Pq8lG3gdMCEp3mABVlVpXZMUpZgqbgAa0g8usD1j//XxZl2J6YY5
         QIpuecpiymQOlFGWnAL59WGuVs6z0DJ1xU87pM6u3q5NMMQE4JenPfl5hiP4TtLu/NYx
         EMxA==
X-Gm-Message-State: AO0yUKV1UjA7xXmFScY8toWF+7b45e2okI2oIc4lILn5NK8Yb4CPmz6Q
	MxCCgXDe/1V+rluiV9hKva6xJKL0zUuOXgUxPEhSBw==
X-Google-Smtp-Source: AK7set9AoMeiIHVM5NEZIelwQtjFCeZFAV8aBBSegm2WriALVsV7TmSLKZVlH+KyyVERNLiz3lVHfkKH9nFhcGFezIQ=
X-Received: by 2002:a5d:45ca:0:b0:2c7:1aa8:7cfa with SMTP id
 b10-20020a5d45ca000000b002c71aa87cfamr380485wrs.14.1677849527448; Fri, 03 Mar
 2023 05:18:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ee6ebe4d22c3aecf35b7a4813ca95b2978eed534.1677079672.git.jens.wiklander@linaro.org>
 <18852A93-9016-4C25-BE75-872F92BB5CEF@arm.com>
In-Reply-To: <18852A93-9016-4C25-BE75-872F92BB5CEF@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 14:18:36 +0100
Message-ID: <CAHUa44GbijWCcvBniyVfpZcmjP=V_BXEm72q_XYoaRt7uF9uYQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 15/20] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 11:51=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Moves the two helper functions regpair_to_uint64() and
> > uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> > specific regs.h. This enables reuse of these functions in the FF-A
> > mediator in a subsequent patch.
> >
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> Please move Michal R-B after your signed off.

OK

>
> With that fixed:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > ---
> > xen/arch/arm/include/asm/regs.h | 12 ++++++++++++
> > xen/arch/arm/tee/optee.c        | 11 -----------
> > 2 files changed, 12 insertions(+), 11 deletions(-)
> >
> > diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm=
/regs.h
> > index 0693a681315f..aa39e83ee5f4 100644
> > --- a/xen/arch/arm/include/asm/regs.h
> > +++ b/xen/arch/arm/include/asm/regs.h
> > @@ -60,6 +60,18 @@ static inline bool guest_mode(const struct cpu_user_=
regs *r)
> > register_t get_user_reg(struct cpu_user_regs *regs, int reg);
> > void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
> >
> > +static inline uint64_t regpair_to_uint64(register_t reg0, register_t r=
eg1)
> > +{
> > +    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> > +}
> > +
> > +static inline void uint64_to_regpair(register_t *reg0, register_t *reg=
1,
> > +                                     uint64_t val)
> > +{
> > +    *reg0 =3D val >> 32;
> > +    *reg1 =3D (uint32_t)val;
> > +}
> > +
> > #endif
> >
> > #endif /* __ARM_REGS_H__ */
> > diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> > index 9cb9f16d43cb..47027ecef47c 100644
> > --- a/xen/arch/arm/tee/optee.c
> > +++ b/xen/arch/arm/tee/optee.c
> > @@ -268,17 +268,6 @@ static int optee_domain_init(struct domain *d)
> >     return 0;
> > }
> >
> > -static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
> > -{
> > -    return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> > -}
> > -
> > -static void uint64_to_regpair(register_t *reg0, register_t *reg1, uint=
64_t val)
> > -{
> > -    *reg0 =3D val >> 32;
> > -    *reg1 =3D (uint32_t)val;
> > -}
> > -
> > static struct page_info *get_domain_ram_page(gfn_t gfn)
> > {
> >     struct page_info *page;
> > --
> > 2.34.1
> >
>


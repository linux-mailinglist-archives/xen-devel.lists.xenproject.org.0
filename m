Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E759F4CD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 10:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392273.630504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlTq-0008E6-MT; Wed, 24 Aug 2022 08:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392273.630504; Wed, 24 Aug 2022 08:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlTq-0008BI-JL; Wed, 24 Aug 2022 08:11:18 +0000
Received: by outflank-mailman (input) for mailman id 392273;
 Wed, 24 Aug 2022 08:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3XY=Y4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oQlTp-0008BC-KK
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 08:11:17 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f61366-2384-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 10:11:16 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso782777pjh.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 01:11:16 -0700 (PDT)
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
X-Inumbo-ID: 52f61366-2384-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Hf0gns039x7m3a/JaKOcl+yPrkSAeRekxQMdB+IBJO8=;
        b=IOTAZCdOiSpZVKyCv3GbrWaKzL8BMrkvGAFOgQphDfDjACqEEPvbndE8yZnHv6RuEs
         8ifi5MtTZgXvMAIPUJG54Gj1KCT178j+sfrckSmwQGhgk43Rs0f1gSmtbD+BGC5NtDRP
         8J4PkM1uLU4/u/yf909zxKWupdbj1jwJCJvoLcbF/Sk/pl6TJNpxgg/5EGIGhJM3qnUB
         rBtRKkEOGqYnWoxZXA62XqHi3QCAVt+IbrJiHptbXL/sAXwqHIzC83KV5Y3id2wJkBsM
         BEwV7x8wXHLzuN6xa490RgZS6V2OFj3JbmXfrYxYVpFOY35oV5aHIBe8fHr+SGSXlG05
         uEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Hf0gns039x7m3a/JaKOcl+yPrkSAeRekxQMdB+IBJO8=;
        b=mDNAGL4gZ8Yvwz7Os14MLR74cVhOu2UNAO4+DM0hfVFIfoI1u5WER3n6lALqzW7JAN
         VUapUxb/hBKZ6UxQKrme8nxhH7vS+70Kr8wGvOcB4lkgb3Pj/pDgNo63IOpyJNr/L/4k
         bGLePNx0rkjiPtoerBFlaCb/zD1aI3FcCzGBXF0eJFcCyY7np/W6spH3VwaaVXZJ8plP
         3bu0OhWMqZ7y7gBikQZCM2FtUGcI0V05+/t2VMrBNiz3dZReZyvXvxlzPKrwjOfxDGNj
         f7/jGdGTL9Yd6p8g7vSbs660z5TIz7gFmDhy2aqLQ1OVlipwuX2jOOVUT4TgqR3m3kIE
         Ou3g==
X-Gm-Message-State: ACgBeo165Ao/0da4x66uvXXP4d6rG9wxnK1E7ab1TqFXfUVxVu/E3m73
	ht6CAzMsyi5EvFP0cccKEp0GXKLjKeqLZauhM8cJCw==
X-Google-Smtp-Source: AA6agR7pI1XHKEAyyk0M7HJ6lSREuDF+wcVThb2aGnqKYr8P5PaYZODH0cuxOXDoCuGqVg6u7KqdDcFKry1fNWttRpg=
X-Received: by 2002:a17:90a:304a:b0:1fa:d832:5aca with SMTP id
 q10-20020a17090a304a00b001fad8325acamr7035197pjl.16.1661328674687; Wed, 24
 Aug 2022 01:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org> <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
 <4613f385-b11e-6d4f-42df-2febac4440d1@xen.org> <D8557FC4-C3B1-4F40-A264-2D8DE68E71CD@arm.com>
 <1527cfdf-5018-d495-cff7-528a278e1f67@xen.org>
In-Reply-To: <1527cfdf-5018-d495-cff7-528a278e1f67@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 24 Aug 2022 10:11:03 +0200
Message-ID: <CAHUa44H5yM=GXEP7kSyB=esxDarSALC4iWd-rD-nHRjr=iB=AQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, 
	Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 18, 2022 at 7:31 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Bertrand,
>
> On 18/08/2022 16:55, Bertrand Marquis wrote:
> >> On 18 Aug 2022, at 15:31, Julien Grall <julien@xen.org> wrote:
> >>>> +/*
> >>>> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> >>>> + *                        struct arm_smccc_1_2_regs *res)
> >>>> + */
> >>>> +ENTRY(arm_smccc_1_2_smc)
> >>>> +    /* Save `res` and free a GPR that won't be clobbered */
> >>> The comment here should be fixed, you are clobbering x19 hence you ne=
ed to save it.
> >>
> >> The comment is correct. x19 is one of the few registers that will not =
be clobbered by the SMC call. But we still need a register below to store '=
args', so we need to free it (what you call clobber).
> >
> > Adding =E2=80=9Cby SMC call" would make this more clear
>
> I would be fine with that.

I'll update the comment.

Thanks,
Jens

>
> Cheers,
>
> --
> Julien Grall


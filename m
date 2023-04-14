Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BF6E1F3A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 11:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521081.809375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFg5-0007md-FE; Fri, 14 Apr 2023 09:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521081.809375; Fri, 14 Apr 2023 09:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFg5-0007kN-CT; Fri, 14 Apr 2023 09:25:09 +0000
Received: by outflank-mailman (input) for mailman id 521081;
 Fri, 14 Apr 2023 09:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnFg4-0007kH-Mz
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 09:25:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e490ea5-daa6-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 11:25:06 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso14546482wmr.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 02:25:06 -0700 (PDT)
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
X-Inumbo-ID: 3e490ea5-daa6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681464306; x=1684056306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe0+F4NozuXBYn50mLdDfoIjRN8vhOuduj2ngocD7Sw=;
        b=ypycx2m+3sLbqN7qTe/OMw3H1gPasVHi0uRo4EUo4dZPm6wOICpQx9x9rMYxTJ0aUd
         N/QLJh5NupB+k5AdSO7PLbPDMNtrYFvlX/3byQ1rmeKf1xTQH0NDeBj4Hj1AwTbLJK2+
         v3k2gH2oGsfTM6lusSjyQXt7f5gnvHCQN5dQqooTMfiqdRYhgiNOXzoIzt42JJRCaEZr
         clh5Kg+Y+cEhS782BNamgTYYq4nV4xgLpSykuMS1M405NGPFo/aiMrAHo0zT5Zn0h/M/
         dXz0BlOo1XmQc0kGdS51ZR0Oa/7uwJL0YugulgMLC/nmC8Wp9UmWVs+IASvOnOiN2g/O
         xApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681464306; x=1684056306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pe0+F4NozuXBYn50mLdDfoIjRN8vhOuduj2ngocD7Sw=;
        b=gyTEoXRzCaa2O4qsCJQsmMrMHYgTcmauGm3FerrMDd1r3w2z6lMUgGGUBTZb914Zyi
         kYF8VRwV0+MRZvAp9Uj1rEE4/80S7WMZgEUGHN5hOqFVF4Z4mqh3UHpw1JaG0Yt2MYlQ
         ba9JN5b5t+4cbS0Q/7/IWz5TwECu0gcXbvEm3XMJQ3IrJthiJ7PWF2APRK4sED+Sqvm3
         hj54azjzAiS+BR6xsR7+4G/dJ7NFGXVksFxbEYbSeDn4RePaTEaFfndOFrNEBLS6CJkg
         uX+cnulKCifJQhCt0XyAvfpc3pK3xSvnkjExsbEPsQbfRqlqT8nTL06occxqWneRYaim
         PENQ==
X-Gm-Message-State: AAQBX9cSu57o4Ui0A7PkIjbFfR4X7FNWr2PA5KgcxubiWiXxWMCaIhNZ
	rPxB4rfuxawall60Yzy6tVavJlw74ubW2zgPPsDCPQ==
X-Google-Smtp-Source: AKy350aPZQFYIgxccfqLSGBHoPPFt6UbuzdwW6MFbQz340GnRRYB4WmiwIWjrlkRdji++vMuWKc3YQQuV4KkfzTfKnM=
X-Received: by 2002:a1c:f302:0:b0:3df:97de:8bab with SMTP id
 q2-20020a1cf302000000b003df97de8babmr1215506wmq.4.1681464305829; Fri, 14 Apr
 2023 02:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-6-jens.wiklander@linaro.org> <AS8PR08MB79913E8D281DB674FDC0D70192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <CAHUa44FqgH3QRiTR=8v4WH+6XYbzwHYn8=Ht_KRC--jLWz9cog@mail.gmail.com> <AS8PR08MB799116F19A91F29F889D57A892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB799116F19A91F29F889D57A892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 11:24:55 +0200
Message-ID: <CAHUa44HHSY7E6D4puMVMgnUb=5_tf8uOEdpQt1OtZeTogL-NYQ@mail.gmail.com>
Subject: Re: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 3:53=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > From: Jens Wiklander <jens.wiklander@linaro.org>
> > Subject: Re: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
> > FFA_PARTITION_INFO_GET
> > > > +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> > > > +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> > > > +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> > > > +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> > > > +#define FFA_PART_PROP_IS_MASK           (3U << 4)
> > >
> > > I am a bit confused here, here (3U<<4) is "IS_MASK" but...
> > >
> > > > +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> > > > +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> > > > +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> > > > +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> > >
> > > ...here the same value is used for "IS_AUX_ID". According to
> > > the spec that I referred to, bit[5:4] has the following encoding:
> > > b'11: Partition ID is an auxiliary ID. Hence I guess the above
> > > "IS_MASK" should be removed?
> >
> > FFA_PART_PROP_IS_MASK is supposed to be used when extracting the bits
> > to compare with one of the other  FFA_PART_PROP_IS_* defines. For
> > example:
> > if ((props & FFA_PART_PROP_IS_MASK) =3D=3D FFA_PART_PROP_IS_PE_ID)
>
> Ohh I now understand, the naming does not mean it "is a mask" but actuall=
y
> means "this is a mask for FFA_PART_PROP_IS_". That makes a lot of sense.
>
> To avoid this kind of ambiguity, do you think changing the name to someth=
ing
> like "FFA_PART_PROP_IS_TYPE_MASK" makes sense here? Note that this
> is just my suggestion, you can decide to change or not, I am asking just
> because I downloaded the whole series and found that currently
> FFA_PART_PROP_IS_MASK is not used anywhere, so before it is used everywhe=
re
> in the code, it might be good to use a more clear name.
>
> >
> > using
> > if ((props & FFA_PART_PROP_IS_AUX_ID) =3D=3D FFA_PART_PROP_IS_PE_ID)
> >
> > doesn't seem right.
>
> Indeed. Please see my above reply.
>
> Personally after the above clarification, I am good with the patch, so:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll update it as you suggest.

Thanks,
Jens

>
> Kind regards,
> Henry
>
> >
> > >
> > > I confirm the values of other fields are consistent with the spec.
> >
> > Thanks,
> > Jens
> >
> > >
> > > Kind regards,
> > > Henry


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE56E0F1A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520770.808749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxGe-00033i-Dd; Thu, 13 Apr 2023 13:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520770.808749; Thu, 13 Apr 2023 13:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxGe-000316-Ai; Thu, 13 Apr 2023 13:45:40 +0000
Received: by outflank-mailman (input) for mailman id 520770;
 Thu, 13 Apr 2023 13:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxGc-00030t-Qr
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:45:38 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d01c93-da01-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:45:37 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso13130222wmr.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 06:45:37 -0700 (PDT)
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
X-Inumbo-ID: 78d01c93-da01-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681393537; x=1683985537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyrGnitHbdUQwqT6RzMJ7xCDQTyGge708Ud+KeXIuOo=;
        b=vPDgz4ZuYSkCfQN1oGmbPdFR/lSJnvxtNfM6Jem1xta7eVlogCwNKcR74qi/w7KEkt
         Llq3LNWZhr5UJio9mPoFZYKiyapBR2jJ0QQ7pe+WEec8fJXZ25UYJpXA0Qbjd9L6aFX8
         gjTFux7rWot6b+eXZBGokLv0tX8w8jsGlc6isYO9zgTyMoMotTfSzspApSWZ5KO6cuXc
         CEhQLH7WQD88rfRsWJCKpA8Xh4MeO2h3oKmBsc9yg3em2ip74WNWay5N3hro9uBVizNl
         By2iuNFRToDGuTHmfiuby3W8L7sXiaGgY+9b71akncSFkjevf3r6wkwsAPP+WLXbt0QS
         NhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393537; x=1683985537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyrGnitHbdUQwqT6RzMJ7xCDQTyGge708Ud+KeXIuOo=;
        b=R8XSBewCl59jY1u7brBCJag/EOLP4jVW8KFQt3zfYSX7pblPhg19eIgvafKW4pI5JT
         eCi5Dsdr6c6KpIFLOA6JhYe0H0nf3yGNrt88sno/ecifJKS72Uc8QP919EG3w+1+5O3E
         zRQkAyaa+3Uek/wc75t99r5NNReuY0lm3hiAe0O8VlhNNtRyPfuDDQ2YQDYAhZySgCpS
         QCRnJmKVOw6Ar5tr06Ox7nRf+5pDcYHRHIfitUQc7DknvZOLkXfEI06Z+ASB3UAAHkY/
         QANSdOc2XWghHtVr/G9zc0LMb0KLaeGpEB184W7sT2dGFxfhudqgRBXX/1J+0Krc+zib
         xbRg==
X-Gm-Message-State: AAQBX9dB8on/q8zvLrvCoB/cFyAlQkh7Ok0KYiuYtRKUIIIjRPCTvLWM
	8b7A1Qnx+suCY6I6UDUx893XfpFhiY0Gb4RO/kmxlQ==
X-Google-Smtp-Source: AKy350ZswUTkpoHgm+BaPSSDOy/tKOK15YjSzcEmz1HZMPqZXjTmeRGSjcvzIxZSHzYbnrRWNsuqd2zyR+jn1nOvFq8=
X-Received: by 2002:a05:600c:201:b0:3f0:4428:94eb with SMTP id
 1-20020a05600c020100b003f0442894ebmr487362wmi.4.1681393537130; Thu, 13 Apr
 2023 06:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-6-jens.wiklander@linaro.org> <AS8PR08MB79913E8D281DB674FDC0D70192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79913E8D281DB674FDC0D70192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 15:45:26 +0200
Message-ID: <CAHUa44FqgH3QRiTR=8v4WH+6XYbzwHYn8=Ht_KRC--jLWz9cog@mail.gmail.com>
Subject: Re: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 12:28=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wr=
ote:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
> > FFA_PARTITION_INFO_GET
> >
> > Defines flags used for the function FFA_PARTITION_INFO_GET.
>
> Nit: Similarly as my comment for patch #4, I would suggest that in
> commit message you can mention the documentation number and
> the chapter of FFA_PARTITION_INFO_GET. Something like:
> "According to DEN0077A version 1.1 REL0, section 13.8, defines
> flags used for the function FFA_PARTITION_INFO_GET"

I'll add that.

>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index ba0942e76993..72e7d0575de5 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -57,6 +57,40 @@
> >  #define FFA_MY_VERSION
> > MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> >                                                   FFA_MY_VERSION_MINOR)
> >
> > +/*
> > + * Flags to determine partition properties in FFA_PARTITION_INFO_GET
> > return
> > + * message:
> > + * BIT(0): Supports receipt of direct requests
> > + * BIT(1): Can send direct requests
> > + * BIT(2): Can send and receive indirect messages
> > + * BIT(3): Supports receipt of notifications
> > + * BIT(4-5): Partition ID is a PE endpoint ID
> > + * BIT(6): Partition must be informed about each VM that is created by
> > + *         the Hypervisor
> > + * BIT(7): Partition must be informed about each VM that is destroyed =
by
> > + *         the Hypervisor
> > + * BIT(8): Partition runs in the AArch64 execution state else AArch32
> > + *         execution state
> > + */
> > +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> > +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> > +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> > +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> > +#define FFA_PART_PROP_IS_MASK           (3U << 4)
>
> I am a bit confused here, here (3U<<4) is "IS_MASK" but...
>
> > +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> > +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> > +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> > +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
>
> ...here the same value is used for "IS_AUX_ID". According to
> the spec that I referred to, bit[5:4] has the following encoding:
> b'11: Partition ID is an auxiliary ID. Hence I guess the above
> "IS_MASK" should be removed?

FFA_PART_PROP_IS_MASK is supposed to be used when extracting the bits
to compare with one of the other  FFA_PART_PROP_IS_* defines. For
example:
if ((props & FFA_PART_PROP_IS_MASK) =3D=3D FFA_PART_PROP_IS_PE_ID)

using
if ((props & FFA_PART_PROP_IS_AUX_ID) =3D=3D FFA_PART_PROP_IS_PE_ID)

doesn't seem right.

>
> I confirm the values of other fields are consistent with the spec.

Thanks,
Jens

>
> Kind regards,
> Henry


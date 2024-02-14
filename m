Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A48546CB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680344.1058462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC9G-0001Yz-DZ; Wed, 14 Feb 2024 10:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680344.1058462; Wed, 14 Feb 2024 10:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC9G-0001WN-Aq; Wed, 14 Feb 2024 10:05:50 +0000
Received: by outflank-mailman (input) for mailman id 680344;
 Wed, 14 Feb 2024 10:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raC9F-0001WH-2T
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:05:49 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a00f967c-cb20-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:05:48 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so745919366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:05:48 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a17090652d200b00a3d296f46besm833671ejn.120.2024.02.14.02.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:05:47 -0800 (PST)
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
X-Inumbo-ID: a00f967c-cb20-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707905147; x=1708509947; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2xgJgiFEZzPqRcLFJ9aO6MdPD1MeRpyCIrCOfZZoQhg=;
        b=OVz3aumlTIiCb6kiLzIYessgbwYnvoStaYPsp+q0xniLTlHHAB2igYm4A+DKB2NSq+
         sruFrZ1TsJNd8g/4YGxjmwUl4gLLI+aYZnFkALlgScspPk6ER7xh0B+csUhnlpgp/c6S
         2g+eRtosG/eR/6zl8arDON6g0DzEsk2IetsYN3N/bmgr2qoTfpMifTVjcGBTd/2KUIzy
         yTiq0Sau0ZijGQdvFsd1AsC9o8fMJ9KJvDKZ19ydURhUcw75nKc0poswt5AYOLLlAqHn
         oaOUJpqZeFu+ZdwYMEENEtmd4GmgcWLYQ+hPBVhIYHiqQN/yfNekNchJcPE8G831X/NI
         wPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905147; x=1708509947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xgJgiFEZzPqRcLFJ9aO6MdPD1MeRpyCIrCOfZZoQhg=;
        b=YIjZMbbfrS1jPGDC9612FFCDFNhahn/OuqOpuIFvXTWeIPoAfMvogzfL4pwTzZ80RK
         Oz9qppS+pxmYQ3eSp8ph2uQK8IghcxgJR/LL9vmM3iLmHxrME8U8a1T+N5S1Xg3e2uxT
         0JXV5M2/2TYn6vM9440PUwSPqtCV0G8xrb2TnJD6LAbXTy4hSasmHiykAneZj5nj2da6
         zPc21JbQy2eyEiPYt6ICOwYyuWL0WeSh9nbmHMHbRPxN6uRzz4/BrubALuTNp3OiJWx/
         B0RgKGneKf2bdLWjec9w4LWmAAPdPBsH/i8YPSfD1T7xbbvaCxZA6hVozxgp502z7yQc
         vatA==
X-Forwarded-Encrypted: i=1; AJvYcCUyJQLGJ+iTTeI/p3dCfUDD7VNgAwWtwjnGHXK2QSVJgRTr1ddRqDkZqns+RPoOyyXcNaSpLhLkVGWpAUD9cL+nHaYtK85AdBKmF7H5PAw=
X-Gm-Message-State: AOJu0YxSiy0vb40yhd8t/RhgrpoDuX5+LKFy5l5Etk+C6xwonG2x8l+W
	XIVoPsGJf7PU9e3KDPbavIKuz3L1N/Gitt3lHR3EJoN/vVfuUW4S
X-Google-Smtp-Source: AGHT+IGrupi4bYNxUawyMlYYQFOZPDtgIVlXbiuYH52DUepVKSXM6ir5SpKdZVBt9G81Z07Hm+W3Xw==
X-Received: by 2002:a17:906:b752:b0:a31:1154:89a9 with SMTP id fx18-20020a170906b75200b00a31115489a9mr1566077ejb.26.1707905147475;
        Wed, 14 Feb 2024 02:05:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUxhguMStd+NQ7temXCLaFabUEHam1aG9lNR7xE70CTVAaOp9AgYfN2uIGKLoJNIFscjcAWioTDJ/c4stElEmLD3F/Wo/0emY6vomYsvfpjh9BgsX2yKTb39xDAv06bQoR3PjB
Message-ID: <4ffa7f8e003ecaab8251f4534f5d81669d77fcd6.camel@gmail.com>
Subject: Re: [PATCH v4 06/30] xen: avoid generation of empty asm/iommu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 11:05:46 +0100
In-Reply-To: <81593ac4-7714-4dd1-89f9-c22e88223d34@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <a94aba19d32bbe8d2fa78d6d8931f9f0ca51160a.1707146506.git.oleksii.kurochko@gmail.com>
	 <81593ac4-7714-4dd1-89f9-c22e88223d34@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:10 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > asm/iommu.h shouldn't
>=20
> ... need to ...
>=20
> > be included when CONFIG_HAS_PASSTHROUGH
> > isn't enabled.
> > As <asm/iommu.h> is ifdef-ed by CONFIG_HAS_PASSTHROUGH it should
> > be also ifdef-ed field "struct arch_iommu arch" in struct
> > domain_iommu
> > as definition of arch_iommu is located in <asm/iommu.h>.
> >=20
> > These amount of changes are enough to avoid generation of empty
> > asm/iommu.h for now.
>=20
> I'm also inclined to insert "just" here, to make more obvious why
> e.g.
> ...
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0- Update the commit message.
> > ---
> > Changes in V3:
> > =C2=A0- new patch.
> > ---
> > =C2=A0xen/include/xen/iommu.h | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > index a21f25df9f..7aa6a77209 100644
> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -337,7 +337,9 @@ extern int
> > iommu_add_extra_reserved_device_memory(unsigned long start,
> > =C2=A0extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t
> > *func,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 void *ctxt);
> > =C2=A0
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > =C2=A0#include <asm/iommu.h>
> > +#endif
> > =C2=A0
> > =C2=A0#ifndef iommu_call
> > =C2=A0# define iommu_call(ops, fn, args...) ((ops)->fn(args))
> > @@ -345,7 +347,9 @@ extern int
> > iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0struct domain_iommu {
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > =C2=A0=C2=A0=C2=A0=C2=A0 struct arch_iommu arch;
> > +#endif
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* iommu_ops */
> > =C2=A0=C2=A0=C2=A0=C2=A0 const struct iommu_ops *platform_ops;
>=20
> ... this is left visible despite quite likely being meaningless
> without
> HAS_PASSTHROUGH.
>=20
> Then (happy to make the small edits while committing):
I'll be happy with that. Thanks.

> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks for Ack.

~ Oleksii


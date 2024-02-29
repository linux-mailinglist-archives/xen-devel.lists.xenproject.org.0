Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A786CE8E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687281.1070511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfj5p-0005oH-4F; Thu, 29 Feb 2024 16:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687281.1070511; Thu, 29 Feb 2024 16:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfj5p-0005mN-1M; Thu, 29 Feb 2024 16:17:09 +0000
Received: by outflank-mailman (input) for mailman id 687281;
 Thu, 29 Feb 2024 16:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygh/=KG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfj5n-0005mF-Nv
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:17:07 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb890447-d71d-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:17:06 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d2628e81b8so20852071fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:17:06 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a19700a000000b00511ad9e3f25sm296596lfc.286.2024.02.29.08.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 08:17:05 -0800 (PST)
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
X-Inumbo-ID: fb890447-d71d-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709223426; x=1709828226; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lDvdrrKupf26n1kpUObIgUkeaJWeXR3TDF1KarxNepM=;
        b=DaKOM4kxBSfmz8JPvULRlVEPHkA0Gq07SnkNHSu1/aNywVlc7+4WK4L5n0ZqZoPHBB
         4uDQY7gffaxE6d8C/8EwZL07+LJly6PKhQvRR64WgBfAmeQnnhW3m/alOokV6rSBXEal
         GWBZ7biGSLW/3VZyVE/ke07cztOiCZPYvYma/ltusJNHlxUilBB3gS/Jao3f/wTTYvrv
         YF7zRu2+oWjoqpBDfICQ7fU1aEbmGTd3NBXHCwyRZI8MvKFR5s7cbpj5omyc7As/gVZ3
         w4mREvkoV9YCOgR5CK4SrZccFVG1aS9srD9cMwDB77CxqY5ICUZIbJIKZAlbZs0gpBn3
         HjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223426; x=1709828226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDvdrrKupf26n1kpUObIgUkeaJWeXR3TDF1KarxNepM=;
        b=YFT/DzqljMcT58lPc5ufh3bTYri/jlc4JCH/pgXcAKxASigB5R47qVqGY2EOtakAdk
         TEDnr4NN+XbMqaRijH37GKoERJ7yjxd8C8lsFCYvuIzuj6dHl0xl59Yhaaw+ijgI3G3o
         2ZYS24r08G6IPh1gGTn3kTGzcvZlUGADySjbKtW1TVPB/pxQiFdzdgzRJyFwZy6FmHrE
         QiFKOYad8Pa/mDEDXn+MWgZywWCGaXxcmxs1wO4/c+q9kOqw4nUgqp62wrmTK9jHwdfh
         J31k0yoDDaJkyKocGInCOgNV6VL6YGCPczNtl0AuM5piIiGqJrSiMbl4uxVNAYTsVF2h
         7gKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLDEkL93OR6ELVF9NmE3XwXJ+RTRClzXzS7p5T2sm/wFeMaF42lULuTm/TzU5FrRjlY3A3VeOZXyCwEgm/o6eMpS6NqcU3uGRC811/ac8=
X-Gm-Message-State: AOJu0YwVIpZ+OfhMWMtOdbGoQhNtNq6l9lgj8zEyg07iygfUvN6e9G/M
	HU03g1HsOMaA6BuEU/ZUd9wavGW3kVy50PzqtgqgXt7lNIYDDev68gWS9WUu
X-Google-Smtp-Source: AGHT+IFXXTqppu0ZXr20LcNnWEM2+s2FEA+KOjKmnnH6EUf7YEIrcBBAjaFLWoC8vkKGjon5p5Xpbw==
X-Received: by 2002:a05:6512:40b:b0:512:db3c:702f with SMTP id u11-20020a056512040b00b00512db3c702fmr944258lfk.9.1709223426035;
        Thu, 29 Feb 2024 08:17:06 -0800 (PST)
Message-ID: <da22899de22aebf092103801b2b0421c1f86aaf4.camel@gmail.com>
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 29 Feb 2024 17:17:05 +0100
In-Reply-To: <e22ca712-b8cf-4bc9-87df-22cbd7819733@xen.org>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
	 <e22ca712-b8cf-4bc9-87df-22cbd7819733@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Thu, 2024-02-29 at 13:54 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 26/02/2024 17:38, Oleksii Kurochko wrote:
> > These functions can be useful for architectures that don't
> > have corresponding arch-specific instructions.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 Changes in V5:
> > =C2=A0=C2=A0=C2=A0 - new patch
> > ---
> > =C2=A0 xen/include/asm-generic/bitops/fls.h=C2=A0 | 18 ++++++++++++++++=
++
> > =C2=A0 xen/include/asm-generic/bitops/flsl.h | 10 ++++++++++
>=20
> One header per function seems a little bit excessive to me. Do you
> have=20
> any pointer where this request is coming from?
The goal was to be in sync with Linux kernel as Jan mentioned.
I will update the commit message as you suggested in one of replies.

>=20
> Why not using the pattern.
>=20
> In arch implementation:
>=20
> #define fls
> static inline ...
>=20
> In the generic header (asm-generic or xen/):
>=20
> #ifndef fls
> static inline ...
> #endif
>=20
> > =C2=A0 2 files changed, 28 insertions(+)
> > =C2=A0 create mode 100644 xen/include/asm-generic/bitops/fls.h
> > =C2=A0 create mode 100644 xen/include/asm-generic/bitops/flsl.h
> >=20
> > diff --git a/xen/include/asm-generic/bitops/fls.h
> > b/xen/include/asm-generic/bitops/fls.h
> > new file mode 100644
> > index 0000000000..369a4c790c
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/fls.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> You should use GPL-2.0-only.
Sure, I'll update the license here and in other files. I automatically
copied this SPDX from Linux kernel.

>=20
> > +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> > +#define _ASM_GENERIC_BITOPS_FLS_H_
> > +
> > +/**
> > + * fls - find last (most-significant) bit set
> > + * @x: the word to search
> > + *
> > + * This is defined the same way as ffs.
> > + * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
> > + */
> > +
> > +static inline int fls(unsigned int x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return generic_fls(x);
> > +}
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
>=20
> Missing emacs magic. I am probably not going to repeat this remark
> and=20
> the one above again. So please have a look.
Sure, I'll update files with emacs magic.

~ Oleksii
>=20
> > diff --git a/xen/include/asm-generic/bitops/flsl.h
> > b/xen/include/asm-generic/bitops/flsl.h
> > new file mode 100644
> > index 0000000000..d0a2e9c729
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/flsl.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
> > +#define _ASM_GENERIC_BITOPS_FLSL_H_
> > +
> > +static inline int flsl(unsigned long x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return generic_flsl(x);
> > +}
> > +
> > +#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */
>=20
> Cheers,
>=20



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919F1DCAC3
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 12:13:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbiCD-00006M-Ho; Thu, 21 May 2020 10:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFaT=7D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jbiCC-00006H-Js
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 10:13:00 +0000
X-Inumbo-ID: a591a190-9b4b-11ea-b07b-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a591a190-9b4b-11ea-b07b-bc764e2007e4;
 Thu, 21 May 2020 10:12:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g9so6284396edw.10
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xTOAQMdFJ8ZQa7G8tNEiJrlhqwWuXNce7Xeryge4dCY=;
 b=TgVmMm0sZduOIJ27pb2jz92xZDTCtvZyEQNTPqkYWpXCAtWnVZzDyAcf5vYT1scEXJ
 1lz7D/JAPAvqi7i1bd+k/+Q1+Aaz5q+NQplbqfGYIw3zoqP5VDSSMRkyAgebB4UbnvXn
 ggezOJc8/FB7psmg87hNSMu8lvHWkm6yCxKZGdjqG8kcKPozdT9UAlZc6+KRfFqaf9hE
 gqS84orfky+gwH+F2N6ZUXpmSs8gJtWJvmuZUR/GlmpVE1Y3doCqSd7ScYqt5dF4yGVG
 pMySmgzykp6EW9vY3sBISM/XObVSAcliqV2T/JYQU4Aq9INhMSrw0ezko8wFlL+z0qFR
 961g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xTOAQMdFJ8ZQa7G8tNEiJrlhqwWuXNce7Xeryge4dCY=;
 b=X5nbchDwMiyh9dBMn5i7j31IZRoYleUVFZjtNmIn9cBvroCmJe8GnIlCrYvN1w7695
 Y+w3/feos8aMG41HVA4QqNE0dLEwz00v+mAvQMH5wprHhfcVZEPCRjjDIicEA8+EUvvt
 1+zzU1IBgQjAx/Rf3v00kYxVTcmUmBHVx0XT/Jpm2a+chyGKS1SKlT7xfN+WEaWR5BP/
 bXu/UqcZAimkh8g8otTU9B7DsMz9lBX1q0SCf+josEOshmRqPuBJRxXORlT6J5pREHi7
 r97tElUp7j8G1KcmH/SXRhOj4nnjIUo5Q51aTrUyoCeNXmDXDzZZh+ctJNNywrEPgkTd
 ojnQ==
X-Gm-Message-State: AOAM530/9yjpnq6GrlL8aVHk42TqYLIGroCyQDj7vflR0ot02zPo6eRf
 fSD/hSdmTSLV4d8vKiClBPg=
X-Google-Smtp-Source: ABdhPJybgDobutCpQyXSEUrAQNSmHWCs161JKh8wLT47yfnEVBYIilZ7dWrA7pqBD/v17gIeYEY6yg==
X-Received: by 2002:a05:6402:348:: with SMTP id
 r8mr7025133edw.130.1590055978659; 
 Thu, 21 May 2020 03:12:58 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id v3sm4644534edd.16.2020.05.21.03.12.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 03:12:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200521090428.11425-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200521090428.11425-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
Date: Thu, 21 May 2020 11:12:56 +0100
Message-ID: <003e01d62f58$66bbcea0$34336be0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQDdpNCtQ9xLcYIXGO2ueKFGd4o5OqqjZl1A
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Tim Deegan' <tim@xen.org>, 'Jan Beulich' <JBeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Andrew Cooper
> Sent: 21 May 2020 10:04
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Tim Deegan =
<tim@xen.org>; Wei Liu <wl@xen.org>; Jan
> Beulich <JBeulich@suse.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: [PATCH] x86/shadow: Reposition =
sh_remove_write_access_from_sl1p()
>=20
> When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:
>=20
>   common.c:41:12: error: =
=E2=80=98sh_remove_write_access_from_sl1p=E2=80=99 declared =
=E2=80=98static=E2=80=99 but never defined [-
> Werror=3Dunused-function]
>    static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t =
gmfn,
>               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> due to an unguarded forward declaration.

Is this, perhaps, an argument for making SHADOW_OPTIMIZATIONS tunable =
via Kconfig so that randconfig could catch things like this?

  Paul

>=20
> It turns out there is no need to forward declare
> sh_remove_write_access_from_sl1p() to begin with, so move it to just =
ahead of
> its first users, which is within a larger #ifdef'd SHOPT_OUT_OF_SYNC =
block.
>=20
> Fix up for style while moving it.  No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Tim Deegan <tim@xen.org>
> ---
>  xen/arch/x86/mm/shadow/common.c | 56 =
++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 31 deletions(-)
>=20
> diff --git a/xen/arch/x86/mm/shadow/common.c =
b/xen/arch/x86/mm/shadow/common.c
> index 0ac3f880e1..6dff240e97 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -38,9 +38,6 @@
>  #include <xen/numa.h>
>  #include "private.h"
>=20
> -static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t =
gmfn,
> -                                            mfn_t smfn, unsigned long =
offset);
> -
>  DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
>=20
>  static int sh_enable_log_dirty(struct domain *, bool log_global);
> @@ -252,6 +249,31 @@ static inline void _sh_resync_l1(struct vcpu *v, =
mfn_t gmfn, mfn_t snpmfn)
>          SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
>  }
>=20
> +static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t =
gmfn,
> +                                            mfn_t smfn, unsigned long =
off)
> +{
> +    struct page_info *sp =3D mfn_to_page(smfn);
> +
> +    ASSERT(mfn_valid(smfn));
> +    ASSERT(mfn_valid(gmfn));
> +
> +    if ( sp->u.sh.type =3D=3D SH_type_l1_32_shadow ||
> +         sp->u.sh.type =3D=3D SH_type_fl1_32_shadow )
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
> +            (d, gmfn, smfn, off);
> +
> +    if ( sp->u.sh.type =3D=3D SH_type_l1_pae_shadow ||
> +         sp->u.sh.type =3D=3D SH_type_fl1_pae_shadow )
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
> +            (d, gmfn, smfn, off);
> +
> +    if ( sp->u.sh.type =3D=3D SH_type_l1_64_shadow ||
> +         sp->u.sh.type =3D=3D SH_type_fl1_64_shadow )
> +        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
> +            (d, gmfn, smfn, off);
> +
> +    return 0;
> +}
>=20
>  /*
>   * Fixup arrays: We limit the maximum number of writable mappings to
> @@ -2001,34 +2023,6 @@ int sh_remove_write_access(struct domain *d, =
mfn_t gmfn,
>  }
>  #endif /* CONFIG_HVM */
>=20
> -#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
> -static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t =
gmfn,
> -                                            mfn_t smfn, unsigned long =
off)
> -{
> -    struct page_info *sp =3D mfn_to_page(smfn);
> -
> -    ASSERT(mfn_valid(smfn));
> -    ASSERT(mfn_valid(gmfn));
> -
> -    if ( sp->u.sh.type =3D=3D SH_type_l1_32_shadow
> -         || sp->u.sh.type =3D=3D SH_type_fl1_32_shadow )
> -    {
> -        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,2)
> -            (d, gmfn, smfn, off);
> -    }
> -    else if ( sp->u.sh.type =3D=3D SH_type_l1_pae_shadow
> -              || sp->u.sh.type =3D=3D SH_type_fl1_pae_shadow )
> -        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,3)
> -            (d, gmfn, smfn, off);
> -    else if ( sp->u.sh.type =3D=3D SH_type_l1_64_shadow
> -              || sp->u.sh.type =3D=3D SH_type_fl1_64_shadow )
> -        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,4)
> -            (d, gmfn, smfn, off);
> -
> -    return 0;
> -}
> -#endif
> -
>  =
/************************************************************************=
**/
>  /* Remove all mappings of a guest frame from the shadow tables.
>   * Returns non-zero if we need to flush TLBs. */
> --
> 2.11.0
>=20




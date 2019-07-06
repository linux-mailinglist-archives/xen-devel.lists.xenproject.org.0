Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFAF60FD8
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 12:22:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjhnO-0000dD-9a; Sat, 06 Jul 2019 10:19:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L7pd=VD=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hjhnM-0000d8-NJ
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 10:19:52 +0000
X-Inumbo-ID: 95e85ec5-9fd7-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95e85ec5-9fd7-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 10:19:50 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e2so3223518edi.12
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jul 2019 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=teiE8e8+ro6V3ctqy8JevtSKoEssH4FnBWoBk7HKgF4=;
 b=Zp1X8cStro0bTaLs5kS+VHXVmT1QUc8alvZE0mKp8WjjCcqIl9SuTxA71pb3qqlT9s
 GGg70ZeuZnVB5zXPv5hKr+jKElBdXL5enW6YPb6/cm1hknvgsMN6vcnrHd5/xRWepD7Q
 h8YrWsFxdmbGcOyvN+DU3NkJqTYGoAHRwQfLb7JzM5Va+BpQpauvKxJEjx1FRrx4+j8G
 62IW6m0WhR15j9mt4BulhFAzS+Tntm+XSaZiIjvzOhqOxx2Ur345YV5+s0idwlos2Y3N
 6gZiOYnz8gsC7bZfu+8bcCcsPPpK83MgJpEGHhSrbJKfS2TSt0qz3bIB48VZMdDOiiAQ
 7FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=teiE8e8+ro6V3ctqy8JevtSKoEssH4FnBWoBk7HKgF4=;
 b=MkW8E/fedV2HNwEMie+Tjy1tsWITDpWOzeyqIz0hbUhKcT1SzEMi+cqFgxL8g8TAbL
 ZqIzaXQNbrJGmaWyCVLWFedWYe4DVlE0z5U41T0n5YbodGjdpWjxrkc9N9aNpvvJ/iwi
 4kltq1vxFeYeVaAMfb8BbOy+w9wygRb+EWVEiWA60037qXHO4k0ZcWyWkRDZNqAkzWcJ
 id1ANQdq7SPbF3O3aCQofukixkXla5vaDQaN2YeTtRwXhePay5jqhAV6FasFTWZDqYjz
 Whz1Dy6/a261USxn549TcG6qx9JufPpr8kNzR7nqLIuh2Ip5jAgv/lacQ0nrz0ULFnEK
 bvdg==
X-Gm-Message-State: APjAAAVHIstP1hU+tyYptHZW9A/lf96wwtFek99ReHPRBOPIpJj6a48n
 HsbABDkJEIs0rccAPhqlU6U=
X-Google-Smtp-Source: APXvYqyvN517Jyrl4gjqItDedXZP1qbG/tdJR58uLvF1WDCOSugv/63LTDcMWl1gtm2thgM1BVoabw==
X-Received: by 2002:a50:987a:: with SMTP id h55mr9469935edb.108.1562408389010; 
 Sat, 06 Jul 2019 03:19:49 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6?
 (200116b866196c001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id d44sm3517761eda.75.2019.07.06.03.19.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Jul 2019 03:19:48 -0700 (PDT)
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
Date: Sat, 6 Jul 2019 12:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: multipart/mixed; boundary="===============7334000029344184677=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7334000029344184677==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="o0gUdw5MIvGgySKokKYotlQXuavJRpSjL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--o0gUdw5MIvGgySKokKYotlQXuavJRpSjL
Content-Type: multipart/mixed; boundary="Z82wQzfCLnozIuT8yUiQaf1KI8cWrHlWA";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Iain Hunter <drhunter95@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Message-ID: <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
Subject: Re: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
In-Reply-To: <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>

--Z82wQzfCLnozIuT8yUiQaf1KI8cWrHlWA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 7/5/19 11:47 PM, Denis Obrezkov wrote:
> So,
>=20
>=20
>> I am going to try to expose the whole crossbar to the dom0 by mapping =
it
>> into dom0 and after that to unmap it and restrict the use of the contr=
ol
>> register via register_mmio_handler. Don't know whether this will work.=

>>
>=20
> I tried and write now now visible progress:
> --- a/xen/arch/arm/platforms/omap5.c
> +++ b/xen/arch/arm/platforms/omap5.c
> @@ -23,6 +23,8 @@
>  #include <xen/vmap.h>
>  #include <asm/io.h>
>=20
> +#define OMAP5_CTRL_CORE_MPU_IRQ 0x00000A48
> +
>  void omap5_init_secondary(void);
>  asm (
>          ".text                              \n\t"
> @@ -124,6 +126,8 @@ static int omap5_specific_mapping(struct domain *d)=

>      map_mmio_regions(d, gaddr_to_gfn(OMAP5_SRAM_PA), 32,
>                       maddr_to_mfn(OMAP5_SRAM_PA));
>=20
> +    map_mmio_regions(d, gaddr_to_gfn(OMAP5_CTRL_CORE_MPU_IRQ), 300,
> +                    maddr_to_mfn(OMAP5_CTRL_CORE_MPU_IRQ));
>      return 0;
>  }
>=20
>=20
I can see there is a mistake in OMAP5_CTRL_CORE_MPU_IRQ address, so, I
tried the right address for the MPU crossbar cotrol registers and I also
tried to expose the whole control CTRL register but unsurprisingly
haven't succeeded.

--=20
Regards, Denis Obrezkov


--Z82wQzfCLnozIuT8yUiQaf1KI8cWrHlWA--

--o0gUdw5MIvGgySKokKYotlQXuavJRpSjL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXSB1ugAKCRD7iQsTJJ7s
+Y90AQCEF65CrILppuq1At+r+aBGEH+2kOPdVbW/FxLYhZ9tfwEAjupXK7EK9Mlr
obFbvEPpDvfvAaKHn3NQbyRbqTgxeZ8=
=V1Xz
-----END PGP SIGNATURE-----

--o0gUdw5MIvGgySKokKYotlQXuavJRpSjL--


--===============7334000029344184677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7334000029344184677==--


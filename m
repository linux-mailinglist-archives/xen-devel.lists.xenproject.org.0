Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76C60332
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:38:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjKca-0000YT-1C; Fri, 05 Jul 2019 09:35:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ozbE=VC=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hjKcZ-0000YO-2R
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:35:11 +0000
X-Inumbo-ID: 2df1e967-9f08-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2df1e967-9f08-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:35:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e2so936881edi.12
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2019 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=zlzFzrnr1x55gYa+BOtr+Er+HqZWv9m8LX8rx6/KntQ=;
 b=UA60zWoiQw6razIRvvYLyfJIVPipyM0qKMUtAdneW3rM/cu5wlx3pWEQzdInlKxsUN
 2N/0BTn4i7XnNacbjYbtTWKLWoAVQXf//0Tys5b5trGsTfYpCoxStUFQ6naK9EhJ0o5G
 RyOqfKOsI9TEgjuR89MmqX0s2QnjbdjcsigzNuHg8zogI9IZGD9cyoCeszeoeOB46m0R
 DJHa89v2+imJR5R2SWlrSa9oV63CZ5yuCSFVn5+QUPdNi9kfAlDBI5sGILygu4lngPpn
 XetEb5T1SjC4fO1ZTYNdOvqqWBOxHQjsrQyJ0ZhleNOFihJaCKhYmbVuyJXkpbd2BueL
 o4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=zlzFzrnr1x55gYa+BOtr+Er+HqZWv9m8LX8rx6/KntQ=;
 b=t0kRxXnO9Q2YtWp3Xd9+D/uh5rej4Xbn6CxZ31/k6JSeoh++IwZeMVUkGMvNVFIMxr
 4Q+uKNpWI5FhT4i9uN9umro/wzpeE1UgY8zbwqbndMF1QfdSvnZY2Bo6K572HX71PcIM
 FLKkJIKSQ83sVgaxCIH48DFHc9VSjMx+imI2pR4ydGb1TW1qDmYaty6gRaYyYy4EopD+
 L60tUUHabphz8Uic6kpobrnZAzDhQ2NcZ8fPEkRzV9rZG1ktDCfQyA5NaBLXIz1KQTYH
 CBXxEbnPDzVv6v8UtXQeBhxxQg9sz6Ppi64TWr+7JuxU/WwYsHRcmH2CKSKKg0NPaChz
 /X7w==
X-Gm-Message-State: APjAAAWVuWrPNLWktwocOskhd9UHExQQNhE90wIw1uwg5ZOTeJ2+Cim3
 Cj1Wf0XSeA1DaI4To41C/m0=
X-Google-Smtp-Source: APXvYqxk9mKJE83LvolcwHHboDqMfMWappFZpieluwO/AJ7/cBpv+ymkTwPdxaxkbG3HHSUg5QnG/g==
X-Received: by 2002:a17:906:474a:: with SMTP id
 j10mr2642517ejs.104.1562319308749; 
 Fri, 05 Jul 2019 02:35:08 -0700 (PDT)
Received: from ?IPv6:2001:16b8:662e:9b00:1e4b:d6ff:fef9:46e6?
 (200116b8662e9b001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:662e:9b00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id v32sm2496792edm.92.2019.07.05.02.35.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 02:35:07 -0700 (PDT)
To: Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
Date: Fri, 5 Jul 2019 11:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8738430352733432075=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8738430352733432075==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DIyJEecCsOBnYLcc7E51Gx6Ccc3tqGpGG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DIyJEecCsOBnYLcc7E51Gx6Ccc3tqGpGG
Content-Type: multipart/mixed; boundary="a9cDRw65W45D1S5uh3X89GM7B7JcovFCD";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: Iain Hunter <drhunter95@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Message-ID: <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
Subject: Re: [GSOC-2019] Problem with initializing crossbar on bb-x15 in dom0
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
In-Reply-To: <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>

--a9cDRw65W45D1S5uh3X89GM7B7JcovFCD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Iain,

On 7/5/19 10:31 AM, Iain Hunter wrote:
> Hi Denis,
> That is about as far as I got....
>=20
> The driver to handle crossbar is
> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-cross=
bar.c
> The documentation is
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/arm/omap/crossbar.txt
Julien recommended me to look at the tegra example:
https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg00991.htm=
l
And I believe that Stefano proposed to implement a virtualized crossbar
control register.
I am going to try to expose the whole crossbar to the dom0 by mapping it
into dom0 and after that to unmap it and restrict the use of the control
register via register_mmio_handler. Don't know whether this will work.

--=20
Regards, Denis Obrezkov


--a9cDRw65W45D1S5uh3X89GM7B7JcovFCD--

--DIyJEecCsOBnYLcc7E51Gx6Ccc3tqGpGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXR8ZygAKCRD7iQsTJJ7s
+ddeAP4rnyq6VIkcJFJzglKczs2RG9Hfnh8AY/NeDTYkZqRgAgD/aAdsoBpYNUfH
NymASj9b5s0pgzDqTX6EPDT/adOPan8=
=z43A
-----END PGP SIGNATURE-----

--DIyJEecCsOBnYLcc7E51Gx6Ccc3tqGpGG--


--===============8738430352733432075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8738430352733432075==--


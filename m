Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51798740E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805456.1216555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto7g-0004Xo-Ky; Thu, 26 Sep 2024 13:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805456.1216555; Thu, 26 Sep 2024 13:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sto7g-0004W2-IP; Thu, 26 Sep 2024 13:01:32 +0000
Received: by outflank-mailman (input) for mailman id 805456;
 Thu, 26 Sep 2024 13:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=myTo=QY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sto7f-0004Vu-IL
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:01:31 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72b27b23-7c07-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 15:01:30 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37cc5fb1e45so632107f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 06:01:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc31f446sm6394928f8f.100.2024.09.26.06.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 06:01:27 -0700 (PDT)
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
X-Inumbo-ID: 72b27b23-7c07-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727355690; x=1727960490; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OzkQzjot7WoEInAEaplXK7Xk95B8K1y7bC7bXhpmqKg=;
        b=Rg0mWzjgSY5hXN1Lc92qFWXAAJt+6td3cSC/wbGbg0/p3QsQWUpbE6Dl85i18E13bb
         a7Zo9vcRWRXCFbKRgDolYjPwNL3BDYYwBXaQRqS3msttLk+5OWT/GbBSAwQF+c02/Vfx
         OaQXyWjwC6oh7Gcb/VfQzYkNKMCyyKDy1iFrGnec8758dyfUcC8XB1BIg76nJk7ARl6M
         v8Qc+EQSYtq/4qrLjN84T19p4RMqyH2CE0SG8X4iZXE+6XHvDOYOiaPPrmfK917J0Eez
         u17vdKEpyV4wlEkq+xCMrRPv+RGkRrOsjCGL/L/o7RcZfTbpQGZNQKUiCjD11c1mVchQ
         c9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355690; x=1727960490;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzkQzjot7WoEInAEaplXK7Xk95B8K1y7bC7bXhpmqKg=;
        b=LpqsKwAAUW8GY5x0aaBgzUCBd209jaIee7QGZZA2PTmMbY5nIcxnePDL33I4C94gLy
         Alxr4Nu1exjHQRY3Ucf/c7TuD0Cbtz/DZRVWfXgGEDLKqi0zJtUcyOc90YJ0xWirM70M
         L0zh9a7mYW2rGEhOrBN87fH4JCmDNdzvv2WU9nXxgFuRid7QuAtrN51/1fpmywELzRB+
         1YcbiAhhDJleOSGy6vqNS1neo+FqkJmpnWbRjDe7yaOKN8kfzvWipSzhJdm/Q03T37R9
         /r6TnAxxh5dGv7Pn2ZeBzgLPQR7hI/0yZ6kERIXUhPwBJHXEr8ju1Myu31ti+AogO5ub
         QeKA==
X-Forwarded-Encrypted: i=1; AJvYcCVgyZeJ1m0WQPU3Cnc6iXUNtkOe8JHGWmIGicYT6Qv7Rx0n4viEU/lrKpluV9OppCmEZCaZoP85ITQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy87jmUarDY/IHjwk2PeMG9mf1ziPC+ML+snbORb5hZkang2UeX
	wC5M5kHebqW/SOyGCMaOtAnyj5QXtLZOgHlSswTguWOxVaF1/cMKsZ7/Mm4Mw3w=
X-Google-Smtp-Source: AGHT+IFubkhtq2y3oEMDJ8FNnF1NkInPHp/PMC4akNnPtR36mrFBNK8+2Djt3DjbaX+F1i7e5aqWlg==
X-Received: by 2002:a5d:464e:0:b0:37c:d275:9ede with SMTP id ffacd0b85a97d-37cd275a0c3mr581800f8f.26.1727355688184;
        Thu, 26 Sep 2024 06:01:28 -0700 (PDT)
Message-ID: <2fe68e65-9e87-4bb5-a400-9d4a90b1dd9b@suse.com>
Date: Thu, 26 Sep 2024 15:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/2] blkif: Fix discard req align requirement and
 various typos
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240926125347.23738-1-anthony.perard@vates.tech>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20240926125347.23738-1-anthony.perard@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XyH2bSqJasF0DdgoOY12az0c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XyH2bSqJasF0DdgoOY12az0c
Content-Type: multipart/mixed; boundary="------------dzQoWTonSo0n4NqrWfpJES6m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <2fe68e65-9e87-4bb5-a400-9d4a90b1dd9b@suse.com>
Subject: Re: [XEN PATCH 0/2] blkif: Fix discard req align requirement and
 various typos
References: <20240926125347.23738-1-anthony.perard@vates.tech>
In-Reply-To: <20240926125347.23738-1-anthony.perard@vates.tech>

--------------dzQoWTonSo0n4NqrWfpJES6m
Content-Type: multipart/mixed; boundary="------------xkRPu7hoIF9EWEFmlI0A4nXr"

--------------xkRPu7hoIF9EWEFmlI0A4nXr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjQgMTQ6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBQYXRjaCBzZXJp
ZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoNCj4gaHR0cHM6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxlLmdpdCBici5ibGtp
Zi13b3JkaW5nLWZpeC12MQ0KPiANCj4gQ2hlZXJzLA0KPiANCj4gQW50aG9ueSBQRVJBUkQg
KDIpOg0KPiAgICBibGtpZjogRml4IGFsaWdubWVudCBkZXNjcmlwdGlvbiBmb3IgZGlzY2Fy
ZCByZXF1ZXN0DQo+ICAgIGJsa2lmOiBGaXggYSBjb3VwbGUgb2YgdHlwb3MNCj4gDQo+ICAg
eGVuL2luY2x1ZGUvcHVibGljL2lvL2Jsa2lmLmggfCA2ICsrKy0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KDQpGb3IgdGhl
IHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------xkRPu7hoIF9EWEFmlI0A4nXr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xkRPu7hoIF9EWEFmlI0A4nXr--

--------------dzQoWTonSo0n4NqrWfpJES6m--

--------------XyH2bSqJasF0DdgoOY12az0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmb1WycFAwAAAAAACgkQsN6d1ii/Ey8a
fggAhCeHvNQvCRGqvf12JVD+k7gyCK52sBimsn1JRneJp/vEoyf7Dzjdu3h5a8Ca1t0cUoMbRiZD
LpYnDJsMvEnuNfL75DPNCNIy5a8BqfkESTclXY19Q2pQRSLoEk72dQukLELkb2CdfREO6sk7+qC2
Oumr3wMC8pOZMvKAkJ8zrXUYFxo+wjDuSL3JZhAFbtUrXXIkEtn63373ho5YQDH0s9mGrLdO54wQ
RMtonKR6tECuzRNYoZMsABhKO1vl2Xo8zW4df9Y3Xt9dfVRQwJAvzlwzzfjIAp2XDbM1z9y6D3ad
SN8c+Pb0IHwNXBhZ+773m+1lmnYEaMI9Yj+QAn20tQ==
=i/AG
-----END PGP SIGNATURE-----

--------------XyH2bSqJasF0DdgoOY12az0c--


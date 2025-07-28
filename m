Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF56B13BF8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061554.1427162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOFQ-0003Pi-8G; Mon, 28 Jul 2025 13:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061554.1427162; Mon, 28 Jul 2025 13:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOFQ-0003Nq-4c; Mon, 28 Jul 2025 13:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1061554;
 Mon, 28 Jul 2025 13:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugOFO-0003Ni-Ib
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:50:34 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f97090-6bb9-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 15:50:33 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aec46b50f33so793861966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:50:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61531c78a0fsm1747528a12.41.2025.07.28.06.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:50:32 -0700 (PDT)
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
X-Inumbo-ID: d4f97090-6bb9-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710633; x=1754315433; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jFrrR2mCMh3S4/+2HQCCKG4mcYumPYXm+Lx107EP92A=;
        b=DKbBAMx0DZQWZNlnrJgVieEAlfcmMHZYGm+7eH1CIwIwHLfMmWdfBOhqUBSAaXfdXN
         IXdlAtCLd1AwoUjr2SQHuf8R9ODVHlJqetZGSEWwQtK4Sa73QDwB+n3n+OdKE9vJi4nJ
         iXXSh3gtoU0ZdlKqk3lSDHTO6QYr5uIWB3FDc4sPYfVxtr4puFxUh9ET7l4lBOwrq5lS
         J1N14pIq6gGiOaVwxSlhc00fSEI9XEAYdAzcHps9hj4PR6E9k/quS8OgAm1/bxAJhWCy
         s0TzG2429/fnO6lrF9Z/hLCls4MZ7ueQeNKi1DB+OBdIGEhdzRYr7Lh1zG37JFf2sI1U
         p4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710633; x=1754315433;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFrrR2mCMh3S4/+2HQCCKG4mcYumPYXm+Lx107EP92A=;
        b=JGCYRtmAnSqm9PZk8betjHvepeSaJJ1lTgdfkVa1q04Crqo3gIH9PDcviQsmdH53FU
         lmnwaiKlPkXBiGpL/0vakNshHpbLkQ7A+nLWpQlm8tZML2YcgxVkGGgKG8mOKbu/6A2M
         VQTLglwYQ31dliYL1xEdqaWFCN81QEFIZjWKtHmcTkJgMMQ+3g5ARZs4NX9MXHCOfjtb
         Yv1OptQlaza2DdKGqY4wxoCPpNrAXzE75s05WicYsqYcZhA0CX4FW2PbAqr38GHrWzB0
         XzY31Buh//LUM5dT7mDk2sV4ScbSl9vEPTXEEkm/JU91C+SZSYP+NpajvbWAIhEVS3Oc
         M9uw==
X-Forwarded-Encrypted: i=1; AJvYcCUdyEpu89YAJB1buPMoxI1Anj+D+uJQ0fLMRJ9epdRVhQz9qTwEzJOSC/GBG9Ov4MpWbN+mAduhJEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxaoy85SeyU9ryCO0AIj+Nu7qa+/p7uHFKIpqtOBnvTorqvwRp1
	oaRLdWLJNpQUVYftsWvYHjlzooB+zWjVA7g4i5qbGe2uxhNxHv0ayoOBRh5PmTmRqrY=
X-Gm-Gg: ASbGncuTecIrTy3UV4V8B73+LPEgRXbjCxFBu6UGkGU482xHG0wkaqq1eGhHk4wSRXs
	8h8IzJ9uBikQTlht1SKrDvq15ELQu40jwVsOWXz9cMbLlxngkkm1KeJ6gW5DiITdVofdzCNE7fo
	LaheVTq4+odDYCISiaKZwo6IW8NI9qnJntQGfu2VlRG74xL6Q3JdS2U8HeSbUCVVcs4RTORmE71
	gTzj5z4MHz0JpZZAOgxBq2eig1y7OiqWj4BhiSef2UF1vGnkr+VHPFWbaLFjkpZIB+CnemEPC2Z
	mkK0HpZwWTJXkXx895V81xbm11LIF33mh8C7Qiw8PbS8Pj3X8tZTmiy+y5LKaYdwTiFhcR9mvbB
	Rp5bJ3JaJoL2jLLiN0tfB3XzDszKH48FqtF054lsZD5W+jNis2HkhmtWIkzxr89dB4I5e73yFik
	EyM2bYJYRXsjjYSOEQBc9H64ExTghIOfH7JtrRAkyTnwxFqSPmHkKo
X-Google-Smtp-Source: AGHT+IGFptk23G/LR+kqIm4SHQJECzWWUC8as4lfldoA7UThAF2Ip66tYbYUPy9AZX6//gqNBfibqw==
X-Received: by 2002:a17:907:da8:b0:ae9:c86f:c777 with SMTP id a640c23a62f3a-af6191ffe9emr1080255166b.44.1753710632766;
        Mon, 28 Jul 2025 06:50:32 -0700 (PDT)
Message-ID: <02ddb162-4194-4594-a3a1-ca3cd109c558@suse.com>
Date: Mon, 28 Jul 2025 15:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] tools/xenstored: Use priv_domid for manual nodes
 and permission
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-9-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-9-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6JcjX1Qa3AZ8EWAkJ3aw8PwA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6JcjX1Qa3AZ8EWAkJ3aw8PwA
Content-Type: multipart/mixed; boundary="------------KKFIN31q8XdVrAIq4tbf0qAm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <02ddb162-4194-4594-a3a1-ca3cd109c558@suse.com>
Subject: Re: [PATCH v5 08/11] tools/xenstored: Use priv_domid for manual nodes
 and permission
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-9-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-9-jason.andryuk@amd.com>

--------------KKFIN31q8XdVrAIq4tbf0qAm
Content-Type: multipart/mixed; boundary="------------L0A8yxOF54pOLZwpCMauY195"

--------------L0A8yxOF54pOLZwpCMauY195
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVzdWFsbHksIHBy
aXZfZG9taWQgPT0gZG9tMF9kb21pZCA9PSAwLCBhbmQgdGhhdCBpcyB3aGF0IGlzIGV4cGVj
dGVkLg0KPiBJZiB3ZSByZW5hbWUgcy9kb20wX2RvbWlkL3N0b3JlX2RvbWlkLywgaXQgc2Vl
bXMgbW9yZSBsaWtlbHkgd2Ugd2FudCB0bw0KPiBhY3R1YWxseSBoYXZlIHRoZSBwcml2X2Rv
bWlkIGFzIHRoZSBvd25lci4NCj4gDQo+IFRoYXQgbGVhZHMgdG8gZm9sbG93IG9uIGNoYW5n
ZXMgdG8gZW5zdXJlIHRoYXQgdGhlIHByaXZfZG9taWQgaXMgY3JlYXRlZA0KPiBmaXJzdC4N
Cj4gDQo+IElmIHByaXZfZG9taWQgaXMgdW5zZXQsIHNldCB0byBkb20wX2RvbWlkIHRvIGhh
dmUgYSBmdW5jdGlvbmFsDQo+IHhlbnN0b3JlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
c29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------L0A8yxOF54pOLZwpCMauY195
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------L0A8yxOF54pOLZwpCMauY195--

--------------KKFIN31q8XdVrAIq4tbf0qAm--

--------------6JcjX1Qa3AZ8EWAkJ3aw8PwA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHgCgFAwAAAAAACgkQsN6d1ii/Ey/n
Ogf/drinWbHjEssHyah3J3x1bmJ3T8iffbatp+wA9gt40QBNc22HAuwjSYU0wstFs0C0kvgRybAx
0L2tLI7dLQodFGl7cL5xaIWqWhjdYEB3Q3OKkhEOBxXJ4uaOavMipMh0scFt5QUzgbkxBvsJ6Y3g
9guMfmPgdeeZ74nSjvJB2h90QoxJVrfuAzOiambQQru0sIlVZbvZu+Zv42Fn3aA0zAanNNAbm9q9
xiPXb96rWjPMXQkWB+p44Gma1GDOnCTtVZdwgYvoztXxhqakGx+Gkz3wwRPMZgzKPc0Nop/5JByh
e92AJxfxaW+MjSgXFSFVaqe7SvFOZT+5hoBL/uTUiQ==
=sN5x
-----END PGP SIGNATURE-----

--------------6JcjX1Qa3AZ8EWAkJ3aw8PwA--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D33B3E24C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104607.1455632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3M8-0001Ga-MC; Mon, 01 Sep 2025 12:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104607.1455632; Mon, 01 Sep 2025 12:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut3M8-0001DP-Hv; Mon, 01 Sep 2025 12:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1104607;
 Mon, 01 Sep 2025 12:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gKtY=3M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ut3M6-0001DD-77
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:09:50 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ed58a5e-872c-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 14:09:49 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b043a33b060so71522066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 05:09:49 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0425ce98f1sm273772766b.67.2025.09.01.05.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:09:48 -0700 (PDT)
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
X-Inumbo-ID: 8ed58a5e-872c-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756728589; x=1757333389; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCAxQL96obxbVkBrFpSZueJA0eDgS+0ZZivMDruOJ4M=;
        b=awKfMh/7JiuqjrEcyrehVJvR83MLhu1C9RdAetBeqTpCSY6ztvpdGmErp09K5w9yn2
         SOBx3biOih6xwyvtwVRJiK1uoAIZDiSKpi2Hej/X7S9Dxcrc/Q/nXDxDihnkV6WuyUAg
         suR+LYouReMyXpxn62vNGQbAX06vwqdPugRlTZOiYHPKNbNcoI1zovpIgkgLsRj1LBAq
         CFnw8h8oyuzgp0MyuVk5PZXyFup8LaQmpd1G2tihRz5DTPU/oG+potTjckLbYmDKKsmp
         RJTBPDoqc40XZ/PmzzbilIhHHczeojRSrmsj6dVZKaplBUgfBSjNNEIfCoZaVU0SIagx
         Bv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728589; x=1757333389;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yCAxQL96obxbVkBrFpSZueJA0eDgS+0ZZivMDruOJ4M=;
        b=RBiUP7vb2d/vB2Acq0GVYprYluwRWm/zl2G2ZoPv7EiusOyh6RcHi2A+IcTvletN+c
         Pkn7PnXvfCvChb2YoU5qz5R2pjB6nPcjdQr+KDQWVWYmY7VH0+wMdtzKWwhNPHFM9eZT
         Q0pRPpJSPcpO9GgVAaZxloJdtyINmvISUy81kv/GsYwn1WcHoRegR+XFcVBS+FNuWwLo
         qh2Am2Itg0WjTSqflzDL1lfviF4j1nqLrMzSpfCn7y4ANJ8zANPh+/qbbyCQzMo9NY8B
         WZbgk28XuIUuw8mWtPTDPU8VoLdcRHGrm6vsdeq1lp5N3RZsUuKcH4cdudF1dQc/kh8o
         GxqA==
X-Forwarded-Encrypted: i=1; AJvYcCVT5B6r/13LlaTvIleEYDOWPuWr+xzYcbzyOS7FSeXavQ40WpXjhMTpeiCG8EtwhGCh9noKLP/J4C8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWnsbvPkM1hNlwc/uYeRumyKq3dvva7XIrjpGem3GmBYyFLIXl
	vPteAwhj14iXJWQRgw6OU+/16hMTripzopzhx9x9uN8YqJyD2pGzlb9ZWUGw+bwO+jI=
X-Gm-Gg: ASbGncvmu5bLqO+vHa3Py/G07qEjokTUk/QZjghFqtOoRsFqNEFFRZgWHHp+rUnZnc4
	htLG/KJ/cJh8Lok5i99ppwKJYECADscklqhYGxbKtoFLQ0mHUORQ29jDNMsARPs4gmpu/T4pXqS
	gtNRCI+pR1Gz3Zj437pttIR2VF7/LltiF4PuHnTpKK7c5YKz4K98JRwbgq81X/7vMObnUvAMusa
	NdiVfViFwFzQcg9zJvmSNLmC9bdVQn8ZGXjNwsYQw9VhRIVxHlzZrt0tG4srbb4xnr9KH42LP/e
	KVAXXg95lSOZk1g0TwLwwD/4drraOjkBnjzXgHgbAXQv5TdRokopqa3PEXcpW+j5vGuCdV3py3D
	a9SJ/W6Vs1n1PrtxH2bB4hZ6UbCtc8o57qhk9BtUsPrihSttxwlDuZdvaY0GwX6AXc3rRvlyfVt
	kt5S7btTlQNCrKjeyOH8ojqPgtGVVf92daN84wQs7r4ySCn3cNwO5QY5Xjdg==
X-Google-Smtp-Source: AGHT+IE1o9sx7Llhurfs0VCkuXqa4ubmx1QoJwH0Py508CsSg45Tex5LOarXjPBXfNHph1KTZXisxA==
X-Received: by 2002:a17:907:3daa:b0:afe:6648:a24c with SMTP id a640c23a62f3a-b01d9774b47mr745995366b.52.1756728588793;
        Mon, 01 Sep 2025 05:09:48 -0700 (PDT)
Message-ID: <46d27fea-d2e2-4c4d-8e0a-824f5ed6a407@suse.com>
Date: Mon, 1 Sep 2025 14:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be
 returned.
To: Mark Syms <mark.syms@cloud.com>, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <20250828093821.372024-1-mark.syms@cloud.com>
 <20250829085627.407307-1-mark.syms@cloud.com>
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
In-Reply-To: <20250829085627.407307-1-mark.syms@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------byMyp4gA4Kx9HzFtsQ58OKNy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------byMyp4gA4Kx9HzFtsQ58OKNy
Content-Type: multipart/mixed; boundary="------------tIaR4mUckT2d0V2rQ8Bs0WkR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Syms <mark.syms@cloud.com>, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Message-ID: <46d27fea-d2e2-4c4d-8e0a-824f5ed6a407@suse.com>
Subject: Re: [PATCH v2] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be
 returned.
References: <20250828093821.372024-1-mark.syms@cloud.com>
 <20250829085627.407307-1-mark.syms@cloud.com>
In-Reply-To: <20250829085627.407307-1-mark.syms@cloud.com>

--------------tIaR4mUckT2d0V2rQ8Bs0WkR
Content-Type: multipart/mixed; boundary="------------MigJa9CsFUblyYR2Gz7A6IRI"

--------------MigJa9CsFUblyYR2Gz7A6IRI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDguMjUgMTA6NTYsIE1hcmsgU3ltcyB3cm90ZToNCj4gUHJldmlvdXNseSB0aGlz
IHNhaWQgaXQgd291bGQgb25seSBoYXBwZW4gb24gYmFycmllciB3cml0ZXMuIEV4Y2VwdA0K
PiB0aGUgZG9jdW1lbnRhdGlvbiBibG9ja3MgZm9yDQo+ICAgKiBmZWF0dXJlLWZsdXNoLWNh
Y2hlDQo+ICAgKiBmZWF0dXJlLWRpc2NhcmQNCj4gDQo+IEFsc28gc2F5IHRoYXQgdGhleSBj
YW4gcmV0dXJuIHRoaXMgZXJyb3IuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIFN5bXMg
PG1hcmsuc3ltc0BjbG91ZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------MigJa9CsFUblyYR2Gz7A6IRI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MigJa9CsFUblyYR2Gz7A6IRI--

--------------tIaR4mUckT2d0V2rQ8Bs0WkR--

--------------byMyp4gA4Kx9HzFtsQ58OKNy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi1jQsFAwAAAAAACgkQsN6d1ii/Ey92
pQgAgXwkelNF8iU8ozztxX3W3t1wMtRPjox6/VhgSzOIIHFdvopu0DZcn+NcGseHg1LYea6xtLdm
PDKVxLhbxuje3lBp/Yv0IAbEdsIEh8GkpBdFB6JP2PB23N6tGzmsCOElVM5at+6g50vUmD/w85DT
s+ymEJdZROVzE7AoSYe/suQflGQgi/pyiQhcvH+551HmjOSslLIb2jnvtWGylZNF9EDlXboinKIx
s/xva/5bdM/7GuNQ9s0gYO+eE7PomD4M63r4QK4I2UEV8tF29RAtqIzXdFPWpM2IV5DWMbjji1g6
waiu5bE4b9YBlA+Z2Nd71StyE6WGpnhV7rjVmrBNdg==
=oXuT
-----END PGP SIGNATURE-----

--------------byMyp4gA4Kx9HzFtsQ58OKNy--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0099441D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812924.1225677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6Q4-0001OA-HI; Tue, 08 Oct 2024 09:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812924.1225677; Tue, 08 Oct 2024 09:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6Q4-0001KR-E9; Tue, 08 Oct 2024 09:22:16 +0000
Received: by outflank-mailman (input) for mailman id 812924;
 Tue, 08 Oct 2024 09:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CgLP=RE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sy6Q3-0001JS-I3
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:22:15 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3f305f-8556-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 11:22:13 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c5cf26b95aso6992672a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 02:22:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7e2252sm478114266b.206.2024.10.08.02.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 02:22:12 -0700 (PDT)
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
X-Inumbo-ID: cd3f305f-8556-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728379332; x=1728984132; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhbXjuXR22fmRf7h/7I3p8JRUfqayVs73J8eKiD20jg=;
        b=ZL/m+nJZzSoxP3ylH8DbOTTNnufZ1yBOnX3QbJtWqoxFfCft7mhpLsrW4Uvls8pBBF
         Atm4XEN4HLQEjZGskkIRG/XFC60EHRP9QKGkoXtnf5eT1hkRB7KDLnEJdtDW8ScwdaIT
         nPDNIxhFd+pEFj1WCOf59B37FfJVI/7fgEOW5zD2bzgToUrqLrCfrHhkdP7CVUuVCD6+
         AFrDtXoBHZlaLxzQ58QxC7UVYYPrqXFQWbuNF3B9sWaAKUY12vyGAjhP2mDBvITc8MRE
         guR3/TWsHco07b91G8/pLqu2e+X7JVioClUgq8C+AJGANHoRQqCdFgnevbPd9leJzNaV
         ByCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379332; x=1728984132;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhbXjuXR22fmRf7h/7I3p8JRUfqayVs73J8eKiD20jg=;
        b=Mu/KL6qwX057BrUZ9qD/iVz0awx+TDUBK2RIQT7FjNjkUF07nAHxp3ymRg7cuJAqJm
         Gs7D9AZ1nfphe+0UrbY5RS1aiHPcrc94Orosn3Ned+Ae4UW3u712MER6vMdIG3b991Kf
         Pj5sK3ojONaIxa8cmSWIyIHj1duv6nXTTHgiAXA6XRbblZhrmh6P4WzGStXBz52Bf8Ro
         kYmPqCGBG0S0pqSG1Kulc3nH+w5pAonQ/UTuIvWepzFVToh8CFNjRB/r0F2iYABXus0f
         56BmztOgrMJc3xZDAa6BnMItHt+iTAjohny318gWOlqCigC38uzKzpse3YSn2Tg87e9u
         oVLg==
X-Forwarded-Encrypted: i=1; AJvYcCWZQw6SQKhWu4UhVVrgwcAczMQ7nISfTMSilkc13CE334dl7zEtsuiyo8T7oi+TW8vP4wSHocKIXkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp3VVXqbONAu7vZgJlYcfZAIO31PzpOL5QPes3B62p6ei6sxBs
	gH0UyCSAODjtVyRRxxlhTrZbLLa9yY/FHojsR5XPbyC7NMjCyKe1KZd+8e6RRCoWYno5HNUEQPE
	Q
X-Google-Smtp-Source: AGHT+IFhDxyaEpBfTM81xWO+233JafMDwIBWB6HTrSG3DntYX0AomcK3taY938zwJEs3VGSXCviJoA==
X-Received: by 2002:a17:907:9410:b0:a99:745b:82aa with SMTP id a640c23a62f3a-a99745b84c6mr129930266b.54.1728379332376;
        Tue, 08 Oct 2024 02:22:12 -0700 (PDT)
Message-ID: <a5a3abe5-245c-47ec-b197-261f4a61ccac@suse.com>
Date: Tue, 8 Oct 2024 11:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 2/2] drop CONFIG_XC support
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20241007103456.14946-1-jgross@suse.com>
 <20241007103456.14946-3-jgross@suse.com> <ZwRdCU20l8PUPQ-V@begin>
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
In-Reply-To: <ZwRdCU20l8PUPQ-V@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xTspKBEZryOy634QdTJpSbC2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xTspKBEZryOy634QdTJpSbC2
Content-Type: multipart/mixed; boundary="------------H0AneJI2sUflDMqFg6kReMTx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <a5a3abe5-245c-47ec-b197-261f4a61ccac@suse.com>
Subject: Re: [MINI-OS PATCH 2/2] drop CONFIG_XC support
References: <20241007103456.14946-1-jgross@suse.com>
 <20241007103456.14946-3-jgross@suse.com> <ZwRdCU20l8PUPQ-V@begin>
In-Reply-To: <ZwRdCU20l8PUPQ-V@begin>

--------------H0AneJI2sUflDMqFg6kReMTx
Content-Type: multipart/mixed; boundary="------------q2CGJI5btKacIlYabtTcF5GI"

--------------q2CGJI5btKacIlYabtTcF5GI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTAuMjQgMDA6MTMsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgbHVuLiAwNyBvY3QuIDIwMjQgMTI6MzQ6NTYgKzAyMDAsIGEgZWNyaXQ6DQo+
PiBDT05GSUdfWEMgaXMgbm8gbG9uZ2VyIG5lZWRlZCB3aXRoIGluZGl2aWR1YWwgQ09ORklH
X0xJQlhFTiBzdXBwb3J0Lg0KPiANCj4gSSBkb24ndCByZWFsbHkgc2VlIHdoeSBpbiB0aGUg
cHJldmlvdXMgcGF0Y2ggeW91IGludHJvZHVjZWQNCj4gY29tcGF0aWJpbGl0eSBhbmQgaGVy
ZSB5b3UgcmVtb3ZlIGl0Pw0KDQpPcmlnaW5hbGx5IEkgbWVhbnQgdG8gc3BsaXQgdGhlIHNl
cmllcyBieSBzZW5kaW5nIHRoZSBmaXJzdCBwYXRjaCBhcyBhDQpzdGFuZGFsb25lIG9uZSBh
bmQgdGhlbiB0aGUgc2Vjb25kIGFmdGVyIHRoZSBYZW4gc2lkZSBwYXRjaGVzIHdlbnQgaW4u
DQoNCldoZW4gY2hhbmdpbmcgbXkgbWluZCBpbiB0aGlzIHJlZ2FyZCBJIHRob3VnaHQgZHJv
cHBpbmcgQ09ORklHX1hDIG1pZ2h0DQpiZSBjb250cm92ZXJzaWFsLCBzbyBJIGRlY2lkZWQg
dG8ga2VlcCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZQ0KQ09ORklHX0xJQlhFTiBpdGVtcyBh
bmQgdGhlIGRyb3BwaW5nIG9mIENPTkZJR19YQyBzZXBhcmF0ZS4NCg0KSSBjYW4gbWVyZ2Ug
dGhlIHBhdGNoZXMgaWYgeW91IGxpa2UgdGhhdCBiZXR0ZXIuDQoNCg0KSnVlcmdlbg0K
--------------q2CGJI5btKacIlYabtTcF5GI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------q2CGJI5btKacIlYabtTcF5GI--

--------------H0AneJI2sUflDMqFg6kReMTx--

--------------xTspKBEZryOy634QdTJpSbC2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcE+cMFAwAAAAAACgkQsN6d1ii/Ey8g
uQf+IBpAeq+MQVp9ROy2eRAdKHEAjEtEdTvRvQfzqHO8vNKvDjuwWGgJKtB0d+Mnub6Kxx7158ya
o8J8p2ufNRT72IzALU7zMxCUg2jqpGEg20y7AEGIaAY1Ae2T1QAZdxelB5QQ88QFRC1vCvyVLzO6
Yjg6FCcyTLkk0OBIkaOmxzb0kPsGaVKsVPXYdu3hp59Yyq9AGePv2pp7U0jLAJCDtLAuEm3kN0vR
opd0JEEyIGypdHIArWjep+9s727CaQi0ZsHRsfO1V+Rf1i+IWdD0aRBbF8Mgql/gC358aG+2MDTh
xYRuNpOv7T+CMWw57lvqNDc1cn5H+ZNBtb0sQpte9Q==
=ih7I
-----END PGP SIGNATURE-----

--------------xTspKBEZryOy634QdTJpSbC2--


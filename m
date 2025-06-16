Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D53BADA8BA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016702.1393664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3pY-0007su-Rh; Mon, 16 Jun 2025 07:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016702.1393664; Mon, 16 Jun 2025 07:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3pY-0007qE-Oa; Mon, 16 Jun 2025 07:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1016702;
 Mon, 16 Jun 2025 07:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR3pX-0006aT-9z
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:00:31 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 968e8b0f-4a7f-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 09:00:29 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-adeaa4f3d07so807800566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:00:29 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec897be34sm596525966b.164.2025.06.16.00.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:00:28 -0700 (PDT)
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
X-Inumbo-ID: 968e8b0f-4a7f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057229; x=1750662029; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oM3HWedc39VOPKmVwddBr1kKRq04hYJM5xhlEjkVHGQ=;
        b=AGmHkjpOtHAMr2aFnv4Kk0W3flKsoqFvx+f/Gb1tpizMwu7/r3QqNhXOc1xarXdGNH
         cubGSJkIKJHupDcpJCovdQD1wj6e7o6NyIBpP1Z3KKc0IP4nTULTtzJkZuOofKAFVavb
         R+xieoyyHDS/siMECBi9J8Mi+C3d+6JnbMriEitjhauL7wevCPfH6fHAixGcsvg1ix5+
         4s9DWOPykfIkO0rsDEfu7x13LfdEzJ7TyBIEbXSX0k1ukFegRkiMvoABqHZT9TuoMX3V
         IvpeQoJQGYzCVXJ/txXtFvB2D0BeP1GheRlcXWY/YaMfycQUavZ40/jx9/97t/rZ7HDa
         mrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057229; x=1750662029;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oM3HWedc39VOPKmVwddBr1kKRq04hYJM5xhlEjkVHGQ=;
        b=IkFpmFwcgToQst+/Qqbl81fJTm8VhvazXPx9fwEraZNDxUFEyaAlKCdYGnPtMms5Lz
         GX5WvbX4IW66z2xdCFmOqD4o/DKzWkpczLZWE+ow1VqKoKddaGGsI2uNzq0qcsaSLyP3
         cY7AhhkrQikTL/eCgM8YRclM/psfP6iquiW3VUYq2wqh9jl74zhZby4oKtu2NRQR+C3p
         RLAN/MfIwjeIDCUNZ1FTQC1SEMoIGJFfXLkohPSpsM+OU8CAdArPMNCWqqSrkUMF1SYG
         oJC0hrfQPTXwpHzzEu30b6QuX9USTC/CYAEPF1EX5eqCe2167YhcmInPdhhOLr65cva1
         F4tA==
X-Forwarded-Encrypted: i=1; AJvYcCWp05yIIUpHZIDHE9dm6lha/kOhdBf/rhEEiPFwB00ZOIhIdiIIPEEKT0Nt49VLLCOeBpClLqOH55U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQYezbEkPS0dwHou2/8tlWXKOcvABgPKe8CSx2l0fUmI8h6Slz
	TFf+3SgRAdN5SwCJOuZQGg+HyzckusrNOUn0mJS5ERvUUMYJrIdHEtfhXczIGKfUuT4=
X-Gm-Gg: ASbGncuQPTwmw0tr/o+SEb7JvMGQB4pHCMbNFxphVhfbf1O/KdniHqkIBFTlEwvdLBz
	8hqLkVyhb7Q8RTbGmxGDaaIcXqqT17YaAAdqtV33non9Wwb6UJXI1wZMzCbERbgUTtMBgHqKjMU
	jfwcIzr3sFXoKdc2Gj32i7F0fmKM3qN7mqNSxd1eXpwFSn5SwnE0KYN4Iad8nnd+pyrIlyUdfJE
	Ntfq0kTCkRE7XH8+LWG+wu6bHnFfkhXAhsh2u6om5uJyszDlTiD7dC46ly1f1g44hKQunFPxgHs
	3QlQRSIofib33/1LMrjQ7FmBOYX8qsS4L+aaPEPstYWdbM8gvWB7F6Kt4Lh18b5ZMMCYKWsAxA5
	p+XfSDXIGjBMRIcegfUmTG9Os+GN9BoaKZdZ21MVwpX/zvAXk4V7Gfi1KVYAyW8qitDvZmRMs31
	puDyJ9OFNUpF4=
X-Google-Smtp-Source: AGHT+IG/n5+540BGy+MIW+Lnzn5EW6s1JugtQvsPGVVQKBsb8ipq3nIQpXt5pjUeCcXM5uPPlNqADw==
X-Received: by 2002:a17:907:d8c:b0:ade:9b52:4d78 with SMTP id a640c23a62f3a-adfad638ddamr804041166b.48.1750057229003;
        Mon, 16 Jun 2025 00:00:29 -0700 (PDT)
Message-ID: <8971cebb-6b31-4de1-bed9-4b2d8a03f65d@suse.com>
Date: Mon, 16 Jun 2025 09:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 07/12] kexec: build parameters for new kernel
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-8-jgross@suse.com>
 <CAKf6xptFRWt7tnBnfMKmuHUcOkBV0iiCyjnhu4bxfT=+YdvRXQ@mail.gmail.com>
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
In-Reply-To: <CAKf6xptFRWt7tnBnfMKmuHUcOkBV0iiCyjnhu4bxfT=+YdvRXQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PQ9GWc69PSq0JtVaYS0G2ViE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PQ9GWc69PSq0JtVaYS0G2ViE
Content-Type: multipart/mixed; boundary="------------qoDqfXXY85M0zGLrFV9q45cx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <8971cebb-6b31-4de1-bed9-4b2d8a03f65d@suse.com>
Subject: Re: [MINI-OS PATCH 07/12] kexec: build parameters for new kernel
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-8-jgross@suse.com>
 <CAKf6xptFRWt7tnBnfMKmuHUcOkBV0iiCyjnhu4bxfT=+YdvRXQ@mail.gmail.com>
In-Reply-To: <CAKf6xptFRWt7tnBnfMKmuHUcOkBV0iiCyjnhu4bxfT=+YdvRXQ@mail.gmail.com>

--------------qoDqfXXY85M0zGLrFV9q45cx
Content-Type: multipart/mixed; boundary="------------YzSBZLPQ5VCnVpxuPxiCrWTo"

--------------YzSBZLPQ5VCnVpxuPxiCrWTo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDYuMjUgMTk6MDIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDIxLCAyMDI1IGF0IDU6MzDigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEJ1aWxkIHRoZSBwYXJhbWV0ZXJzIGZvciB0aGUgbmV3IGtlcm5l
bCwgY29uc2lzdGluZyBvZiB0aGUNCj4+IGh2bV9zdGFydF9pbmZvIHN0cnVjdCwgdGhlIG1l
bW9yeSBtYXAgYW5kIHRoZSBjb21tYW5kIGxpbmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4+IEBAIC0yMTIsNCArMjEz
LDYxIEBAIHZvaWQga2V4ZWNfc2V0X3BhcmFtX2xvYyhjb25zdCBjaGFyICpjbWRsaW5lKQ0K
PiANCj4+ICsNCj4+ICsgICAgLyogVGhlIGNhbGwgb2YgdGhlIG5ldyBrZXJuZWwgaGFwcGVu
cyB2aWEgdGhlIHBoeXNpY2FsIGFkZHJlc3MhICovDQo+PiArICAgIGlmICgga2V4ZWNfYWRk
X2FjdGlvbihLRVhFQ19DQUxMLCAodm9pZCAqKWtlcm5lbF9lbnRyeSwNCj4gDQo+IE1heWJl
IGtlcm5lbF9lbnRyeV9wYSwga2VybmVsX3BoeXMzMl9lbnRyeSwgb3Iga2VybmVsX3BoeXNf
ZW50cnkgd291bGQNCj4gYmUgYSBiZXR0ZXIgbmFtZSB0byBtYWtlIHRoZSBwaHlzaWNhbCBh
ZGRyZXNzIGNsZWFyPw0KDQpGaW5lIHdpdGggbWUuDQoNCj4gDQo+IEVpdGhlciB3YXk6DQo+
IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoN
ClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------YzSBZLPQ5VCnVpxuPxiCrWTo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------YzSBZLPQ5VCnVpxuPxiCrWTo--

--------------qoDqfXXY85M0zGLrFV9q45cx--

--------------PQ9GWc69PSq0JtVaYS0G2ViE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPwQwFAwAAAAAACgkQsN6d1ii/Ey8Q
ngf8DZ9THyZDrfPA3d3dblT+EqhhpIO2C4lVLm1mER/5DMPtBEgK7FAoj7bYQiyodoimOsmgebi6
NN1ytltoJrC3S2a67a7wwAHV556Gxu7d0GczGUqzu8oeeJ6lsLfiDKjjjA9ALbmXS2jgVMZx2qzL
U6nXBjA67K/wSo97bFb8z2X0lq5prrGpVHAEHa16+Exg1DP8ZL8Gwx4dBvwtxjmc9C1LwMBZ1H+W
d/tu8UROlmknwxW5/XcvwZKscb6qpJSxI8s+LHK8nUjXzF900xT6UNGBeVvS6iwnsUfJ3SggO8+8
kJOAZGOkZJ2NFTztk7L8NMyOpv5R/7JBbAH2hmMVEQ==
=DI1w
-----END PGP SIGNATURE-----

--------------PQ9GWc69PSq0JtVaYS0G2ViE--


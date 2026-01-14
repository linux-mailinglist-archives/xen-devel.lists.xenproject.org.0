Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0ECD1D2D5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 09:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202658.1518122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwRj-0001CC-Ig; Wed, 14 Jan 2026 08:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202658.1518122; Wed, 14 Jan 2026 08:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfwRj-0001AA-G2; Wed, 14 Jan 2026 08:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1202658;
 Wed, 14 Jan 2026 08:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfwRi-0001A1-M8
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 08:41:42 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d923ac98-f124-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 09:41:41 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-b8710c9cddbso478908766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 00:41:41 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8?
 (2a00-12d0-af5b-2f01-96c4-9745-9e8c-b1e8.ip.tng.de.
 [2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d1c6csm2375170066b.39.2026.01.14.00.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:41:40 -0800 (PST)
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
X-Inumbo-ID: d923ac98-f124-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768380101; x=1768984901; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W5sYEAQcytupTs7Jv1BpsPPTMRJDcWNCQ1gZ3pmgRN0=;
        b=f771ML+InmeIS3OOZKkdCpjRzhoPzVxdZrf+a92FX28fhlxuYctJaEzWU8OLVoWkPO
         CPNTXLNr0LsbOBKvLvYKsEgRaSkcDC2fPBL6uxdpcCZrUy5bbnIfmB44ftoCKimv9Npf
         /RCdK1chjKEkHqx8X+heUUN7psdwa5I84btz/kJFClIEYKoCV+iZIijCb+OvT5tcp0uB
         lvl2uFWGfch5aeX5mBIMhLIdvTbFcdpI19u5r9NH2/EOdCK2qe49hwyoHfmrwydhFZIq
         DKpHxwvXvY9XLph67F8Yco/2zX7cUaCJ2olvNx62h9o7zd+fDZKQG6bCSZbFqXzBXgzr
         KUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380101; x=1768984901;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5sYEAQcytupTs7Jv1BpsPPTMRJDcWNCQ1gZ3pmgRN0=;
        b=XJNDOnfMokJeCZiSPLJ+6t6F7WFirzjyweVu0Qcz5Y3tjacXptTVASL77y2ZNBNRsL
         aJ60zWkerdPeAUjICI0GImstRY/xcKJaSPuuOYva7F2yZVmTpuYG9n/YSa67+bOXoAsH
         j56Z+Rj24lNm34lhiMgUsSdA6+eAEiSZN0jOCda4fAfCrrotfsFdAVNF0snnxSUxuJME
         1LhL7O0cMAFTroV1qholMvnKezx4HkohfOCAMWHmE0qWAsDlhi9DkJk1Ii4SJgw5AeZ0
         NiVJ/tuAzzG645o9y2H3qWBeSLXwRrzRbgiCGGwiydwWQNxEm5mVvjoW6IBCv2dnlNTf
         DOfw==
X-Forwarded-Encrypted: i=1; AJvYcCVmj3GNRrru9xjCXySXLSdZ8d7NPQv+fwz4y1iW5tX4spWx8WYRuYAqenlLGQmHWA2YdG+p681uc9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz90FV05//IPOOK6jxQMxW/0xm4DT6a/74S5V/T+vk9uzAhcDyv
	9Xy895B7K3Dogpf/wdMbeTdnB8gLWZGU1xIgBKfffwQOwoIq408Xuoiq+aEdr7gAQi4=
X-Gm-Gg: AY/fxX6IBcnhPNiMZMq+rV8PSC/QP0V5R0Si1ilXQ+GUi2e9B6W+PBDzX/M+I/1hVHl
	FKQLBHoJsTDlT/U81OvPcIL7qVZh9xgb8VLiY5zxuwM8rf0phT9JnmlyAwrpHZ+5+XOnsxCxnkV
	lLUYSNL85YTtX0O3dh8l+IgSM/X7vjSJpTYpumie27a5pGQgYh0v6f9c8PzS+o+4mWeVKnbyYpY
	NAtNxvN+8skbWE2B5QVzrjHHFVplZO+PzHpsxAHF20hj3vSnVelnAzqlzlLg5ju8LhdTv39ibZC
	kaXoveCE+++UTIWs1DFuINRKaEYnx6WOherPsUlH6j+z704cuF6OrEs5/vljc562XPMj8Dv5Kec
	/r7eR9kr8zBYtw2O7hr5hQUVhqZW7EqKbMWATY8QbmZ6/AgUOZ0A3AfLNRt9YB7sPXAgFUTQfkB
	jWjwRlWEZ5exxGvNcR7C4yUyYcF03Yt7ZMvVyays9Mo4QdV1jwRWVJZe2jtlk5uCDWnv2dAVOKR
	mfnfSfBxrn6C1JPOKH7K+CaFlE2/q7AHgdEjRc=
X-Received: by 2002:a17:907:747:b0:b87:2bd6:6bc3 with SMTP id a640c23a62f3a-b87613e0446mr166418666b.61.1768380100731;
        Wed, 14 Jan 2026 00:41:40 -0800 (PST)
Message-ID: <1d06919f-841f-44e4-b53f-af575e9dd2b1@suse.com>
Date: Wed, 14 Jan 2026 09:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
 <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>
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
In-Reply-To: <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e4uLFezTWl5w89CAkdBazpRt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e4uLFezTWl5w89CAkdBazpRt
Content-Type: multipart/mixed; boundary="------------CotXC5dkT0jy2ULllYVqsI1P";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <1d06919f-841f-44e4-b53f-af575e9dd2b1@suse.com>
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
 <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>
In-Reply-To: <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>

--------------CotXC5dkT0jy2ULllYVqsI1P
Content-Type: multipart/mixed; boundary="------------jo0OnpC40im3zESi56uw3K29"

--------------jo0OnpC40im3zESi56uw3K29
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDEuMjYgMDk6MjAsIEFsZXhhbmRyZSBHUklWRUFVWCB3cm90ZToNCj4gTGUgMTQv
MDEvMjAyNiDDoCAwODo0MywgSsO8cmdlbiBHcm/DnyBhIMOpY3JpdMKgOg0KPj4gWWVzLiBU
aGlzIGlzIHdoeSBJIGRvbid0IGxpa2UgdGhlIHdvcmRpbmcgImluc2lkZSBndWVzdCIsIHdo
aWNoIGlzIGp1c3Qgbm90DQo+PiB0cnVlLg0KPiANCj4gQmVmb3JlIHdhc3RpbmcgbW9yZSB0
aW1lIGZvciB0aGF0IHNpZGUsIHRoZXJlIGlzIGNocm9vdCB3aXRoIGJpbmQtbW91bnQgb2Yg
RG9tVSBGUy4NCj4gDQo+IFJlcGhyYXNpbmcgbGlrZSB0aGlzIHNob3VsZCBiZSBtb3JlIHRo
YW4gZW5vdWdoOg0KPiANCj4gIyBFbmFibGUgdG8gdXNlIGEgZ3J1YjIgZW11bGF0aW9uIGJv
b3QgaW5zdGVhZCBvZiBkaXJlY3Qga2VybmVsIGJvb3QuDQo+IA0KPj4NCj4+IFBsZWFzZSBi
ZSBhd2FyZSB0aGF0IHdlIGFyZSB0cnlpbmcgdG8gcGhhc2Ugb3V0IHB5Z3J1YiwgYXMgaXQg
d2lkZW5zIHRoZQ0KPj4gYXR0YWNrIHN1cmZhY2Ugb2YgZG9tMCBmcm9tIGEgZ3Vlc3QuIHB5
Z3J1YiBuZWVkcyB0byBsb29rIGludG8gZ3Vlc3QNCj4+IGNvbnRyb2xsZWQgZmlsZSBzeXN0
ZW1zLCBzbyBhbnkgYnVnIGluIHRoZSByZWxhdGVkIGNvZGUgKGUuZy4gZmFpbHVyZSB0bw0K
Pj4gaGFuZGxlIGEgY29ycnVwdGVkIG9yIG1hbGljaW91c2x5IG1vZGlmaWVkIGZpbGUgc3lz
dGVtKSBtaWdodCByZXN1bHQgaW4NCj4+IHNlY3VyaXR5IGlzc3VlcyBsaWtlIGNvZGUgaW5q
ZWN0aW9uLg0KPiANCj4gRWZmZWN0aXZlbHksIGlmIHB5Z3J1YiBpcyBvbiB2ZXJnZSBvZiBi
ZWluZyBwaGFzZWQgb3V0LCB0aGVyZSBpcyBub3QgbmVlZCBmb3IgDQo+IHRoaXMgcGF0Y2gu
Li4NCg0KOi0pDQoNCj4gQnV0IGNvdWxkIHlvdSBwb2ludCBtZSB0byB0aGUgZGlzY3Vzc2lv
biBvZiBhbHRlcm5hdGl2ZXMgPyBBcyBweWdydWIgYWxsb3cgYSANCj4gbW9yZSBlYXN5IG1h
bmFnZW1lbnQuLi4NCg0KT2gsIHRoZSBmdW4gb2Ygc2VsZWN0aW5nIHRoZSBncnViIHZhcmlh
bnQuIDotKQ0KDQpUaGVyZSBhcmU6DQoNCi0gcHlncnViIGFzIGRpc2N1c3NlZCBhbHJlYWR5
DQoNCi0gZ3J1Yi1wdiAoMzItIGFuZCA2NC1iaXQpIGFuZCBncnViLXB2aDogb2ZmaWNpYWwg
Zmxhdm9ycyBvZiBncnViMiBmb3IgUFYgYW5kDQogICBQVkggZ3Vlc3RzLCBzZWxlY3RlZCBi
eSBzcGVjaWZ5aW5nIHRoZW0gYXMgdGhlIGtlcm5lbCB0byBib290LCBydW5uaW5nIGluDQog
ICBkb21VIGNvbnRleHQNCg0KLSBwdmdydWIgKDMyLSBhbmQgNjQtYml0KTogbGVnYWN5IGdy
dWIgMC45NyB2YXJpYW50cyBiYXNlZCBvbiBNaW5pLU9TIGZvciBQVg0KICAgZ3Vlc3RzLCBz
ZWxlY3RlZCBieSBzcGVjaWZ5aW5nIHRoZW0gYXMgdGhlIGtlcm5lbCB0byBib290LCBydW5u
aW5nIGluIGRvbVUNCiAgIGNvbnRleHQNCg0KPiANCj4gU2hvdWxkIHRoaXMgYmUgbm90ZWQg
dG8gdGhlIHdpa2kgPw0KDQpZZXMuIERvY3VtZW50YXRpb24gc2hvdWxkIHJlYWxseSBiZSBl
bmhhbmNlZC4NCg0KPj4gU28gSSdtIG9uIHRoZSBlZGdlIHdoZXRoZXIgd2UgcmVhbGx5IHNo
b3VsZCBtYWtlIGl0IGVhc2llciB0byB1c2UgcHlncnViLg0KPiBMZWdpdCwgU2hvdWxkIHBh
dGNoIHN1YmplY3QgbmVlZCB0byBiZSBbUkZDIFBBVENIXSA/DQoNCk5vLCBJIGRvbid0IHRo
aW5rIHNvLiBPdGhlcnMgbWlnaHQgaGF2ZSBvdGhlciBvcGluaW9ucyB0aGFuIG1lIHJlZ2Fy
ZGluZyBweWdydWIuDQoNCkp1ZXJnZW4NCg==
--------------jo0OnpC40im3zESi56uw3K29
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jo0OnpC40im3zESi56uw3K29--

--------------CotXC5dkT0jy2ULllYVqsI1P--

--------------e4uLFezTWl5w89CAkdBazpRt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlnVsQFAwAAAAAACgkQsN6d1ii/Ey/u
Zgf9GfXsouSO1LhzX86dNGpTCSGik3bmgjPxHsB/ojPHx8N08WP+Pg7ZOlkTyp3h7Y0bVTvzMgiC
VjSukXu0gbuULkPlr9yXD5H2sWC+ZfiqIVb/OxNgA/Mt+OW60SAZbHG0vyw6dK/kcH+vYpQ3w1+f
j+T71RJ8z9xqrSuuN9QoUEvzLuzthBbWylRbIJ5TlNQE+k8g3J4UCb54D2yfRIUyx2xqNksqQMG7
6mFQoyecJhnaymRiP9RvQAPLGjRka2VYmyy7zoUJmiQ9nCewDcEGaY1buPVCb9kQFFEHI8PACLLf
as0XEXKG6OZP2sed0HmJa4vaxM64rVhe5/RCCDqppQ==
=3T+m
-----END PGP SIGNATURE-----

--------------e4uLFezTWl5w89CAkdBazpRt--


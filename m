Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACDB13BD3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061546.1427151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOC1-0001ve-QV; Mon, 28 Jul 2025 13:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061546.1427151; Mon, 28 Jul 2025 13:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOC1-0001tM-Nk; Mon, 28 Jul 2025 13:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1061546;
 Mon, 28 Jul 2025 13:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugOC0-0001tG-DG
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:47:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57260135-6bb9-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:47:02 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso771978666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:47:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635b4d58esm414931066b.150.2025.07.28.06.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:47:01 -0700 (PDT)
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
X-Inumbo-ID: 57260135-6bb9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710422; x=1754315222; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/6K/zuz7WU1COwUFa5EBlTT7bGjyRAw2msiFOrtWafo=;
        b=d8Ahc0vnZMuftHYC7olydG3PtRpHaz+LaSt6k0CVte2wkiKprwCUFIi3nnM8HxOAIr
         kkJbHh1o7f60ITmpHz35aAoXbGhSPyg8xfkVGSDZGOdvqRJUBnivJIHn2rpER0POHFg7
         mkcQg7c+5djKj7FOK/7NFAmF+CFdpj6zva1ntyVFtqcv0i6GjfEDLzf7pV1xaQK8kJVw
         TKi8N+dr4GPB3NnUzY3EE0K8B4RKObuycrexx9DkpZW2C4es0KjbP8IVJ8qM1QcnoMhK
         kk7kdJPDIOFTrN6OQZ4EqqCGJtyMnTdCjR6GK6mwd2uo1yFXjlkDVSSD90oAgOXSdBXf
         Rahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710422; x=1754315222;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6K/zuz7WU1COwUFa5EBlTT7bGjyRAw2msiFOrtWafo=;
        b=PXK6E7CNUSnwgCQ/7zxjcZR1BmT1tC5Dm7RH7/45YAoeOypnwuUVOTVjHdQa6w4J6P
         YIu4j/CKqG9Y7R4BsYbtdAJoS1d0zB+f+ibNOxLlHzAJ4S1xV/hlNoXDPqLo9KW6Rlw4
         IGjhFT7phmqn+hX6AImdqUHFQZwyj09eJhh6grpxHDMtbJqeG+oc+P1YoFRA67JvoaZX
         eF2TXKFrdsyZGxKcA92isyAYMniFQ+o39pz39acF9LQxPQIUpyk1PK9+vvX14aqyauEB
         lWLrobz1Xn+TOJ/UEteQWJI8EujES9stAOC3+X+JSUPuPHcKsVQUGnW5b9/uk2+PfwCU
         mduQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVHQLL+DTjdiuzR1dYzumFibxX5/XrRmWU0op+Ogmdx7qfrQYiKtfrZPqDINNb/hKPAOSmbXOAAV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAIgQrPNQOZcXra458t7KQ/0K6O4xEdrkdXTwYsact3qT8wr8e
	sXlZ88hf7ifA3G/s88PoM2um2VNZDkzNiWhHn22aWhnSygJvyemgutJ5X8FyQ5yPil8pju6zfAh
	n+u2nIYw=
X-Gm-Gg: ASbGncuAPddb1fVgBnPlQbCHF8t76uYHEC7NFCX4H24+Z9CsyRNn1sd6LB38FRV1Heh
	46fETlBVF//UWpFDbGm5PsriQmL2Egx4oe2WXs3hQki5qIp2HAVLip7+sik2DmIkbb0h2GEO84x
	INjyCPvB5/2akqMzfkjOhtUZpYcDAPuz38YEvJrRqXnmJM8p5knVL5C42g0UF5rQzYKnSsexsuJ
	TzS4xa4wxTzwzab6uNzmIHB7jLruTnF0/0TtgPWSm4LyGXZMItXGOCJQ79xRttUN9g6Tta16ZYK
	mEBn9vxEeQsAk9SGqU3DX3COmHP9FgcRLxh4YOtyuXyZZVIb8GAR9c7FWb7pXWgH3tUTOm+PHY0
	pcmh05d+7AExRZTjTfz0z/AQvWa/wwiyHWx4bUro/mOHPHWeCrudCMg6o6PakrgMtSJk+2bFuey
	hFfz7uCDuJI8n07ps09S3WKGBd3lN4W6qqP5m2VoG6jQ==
X-Google-Smtp-Source: AGHT+IFZrd/FUEMfhEQ0stePR62jHvzf3yDImxNdBPA6XJXF5IOlZh0+fFWejy3vbzXkqCzMcLU/SQ==
X-Received: by 2002:a17:907:608f:b0:af5:a834:c327 with SMTP id a640c23a62f3a-af61cea0370mr1284176666b.21.1753710421727;
        Mon, 28 Jul 2025 06:47:01 -0700 (PDT)
Message-ID: <85d807d3-548f-46bd-b131-a572a5538f72@suse.com>
Date: Mon, 28 Jul 2025 15:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] tools/xenstored: Auto-introduce domains
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-8-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-8-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wqHcr5UEkTuAJS2jki00pFHv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wqHcr5UEkTuAJS2jki00pFHv
Content-Type: multipart/mixed; boundary="------------K2AwHpqF0sH4nkX1GYl9CvTR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <85d807d3-548f-46bd-b131-a572a5538f72@suse.com>
Subject: Re: [PATCH v5 07/11] tools/xenstored: Auto-introduce domains
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-8-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-8-jason.andryuk@amd.com>

--------------K2AwHpqF0sH4nkX1GYl9CvTR
Content-Type: multipart/mixed; boundary="------------2x6LqQk84MUGfeRWiPUBsor8"

--------------2x6LqQk84MUGfeRWiPUBsor8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFJlcGxhY2UgZG9t
MF9pbml0KCkgd2l0aCBpbml0X2RvbWFpbnMoKSB3aGljaCB1c2VzIGxpYnhlbm1hbmFnZSB0
bw0KPiBpdGVyYXRlIHRocm91Z2ggYWxsIGV4aXN0aW5nIGRvbWFpbnMsIHN0b3JpbmcgdGhl
bSBpbiBhIGxpc3QuICBUaGUgeGVuc3RvcmUNCj4gZG9tYWluIGlzIGludHJvZHVjZWQgZmly
c3QsIGFuZCB0aGVuIGFsbCB0aGUgb3RoZXIgZG9tYWlucyBhcmUNCj4gaW50cm9kdWNlZC4g
IFRoZSB4ZW5zdG9yZSBkb21haW4gbmVlZHMgdG8gYmUgaW50cm9kdWNlZCBmaXJzdCB0byBz
ZXR1cA0KPiBzdHJ1Y3R1cmVzIG5lZWRlZCBmb3IgZmlyaW5nIHdhdGNoZXMuDQo+IA0KPiBk
b20wX2RvbWlkIGlzIHVwZGF0ZWQgd2l0aCB0aGUgeGVuc3RvcmUgZG9tYWluLCBzaW5jZSBp
dCByZWFsbHkNCj4gaW5kaWNhdGVzIHRoZSBsb2NhbCBkb21haW4uDQo+IA0KPiBwcml2X2Rv
bWlkIGlzIHNldCB0byB0aGUgY29udHJvbCBkb21haW4uICBUaGlzIG1ha2VzIGl0IGxpbWl0
ZWQgdG8gYQ0KPiBzaW5nbGUgZG9tYWluLg0KPiANCj4gVGhlc2UgZmVhdHVyZXMgbGV0IHhl
bnN0b3JlIGF1dG9tYXRpY2FsbHkgY29ubmVjdCBhbnkgZXhpc3RpbmcgZG9tYWlucywNCj4g
d2hpY2ggbWVhbnMgaXQgZG9lc24ndCBuZWVkIHRvIGJlIGRvbmUgbWFudWFsbHkgZnJvbSBp
bml0LWRvbTBsZXNzLg0KPiANCj4gRm9yIGEgbGVnYWN5IGRvbTAsIHRoZSByZXN1bHQgc2hv
dWxkIGJlIHVuY2hhbmdlZC4NCj4gDQo+IEZvciBhIGxhdGUgeGVuc3RvcmUgc3R1YmRvbSBp
dCBzaG91bGQgYWxzbyBiZSB0aGUgc2FtZSwgYnV0IHByaXZfZG9taWQNCj4gd291bGQgYmUg
c2V0IGF1dG9tYXRpY2FsbHkgdG8gY29udHJvbCBkb21haW4gKHdoaWNoIGRlZmF1bHQgdG8g
MA0KPiBub3JtYWxseSkuDQo+IA0KPiBBbHdheXMgc2lnbmFsIHRoZSBldmVudCBjaGFubmVs
IGZvciBpbml0aWFsIGRvbWFpbnMuICBUaGlzIGdldHMgZG9tMCAoYQ0KPiBsb2NhbCB4ZW5z
dG9yZWQgZG9tYWluKSB0byBjb25uZWN0Lg0KPiANCj4gQWxzbyBhbHdheXMgd3JpdGUgWEVO
U1RPUkVfQ09OTkVDVEVEIHNpbmNlIHdlIGtub3cgd2UgYXJlIGNvbm5lY3RlZCBhdA0KPiB0
aGlzIHBvaW50Lg0KPiANCj4gVG8gc3VwcG9ydCBBUk0gZG9tMGxlc3MgZG9tYWlucyB3aXRo
IHhlbixlbmhhbmNlZCA9ICJuby14ZW5zdG9yZSIgYQ0KPiBmYWlsZWQgaW50cm9kdWNlX2Rv
bWFpbigpIGJlY29tZXMgbm9uLWZhdGFsLiAgTm9ybWFsbHksDQo+IEhWTV9QQVJBTV9TVE9S
RV9FVlRDSE4gaXMgdXNlZCB0byBpZGVudGlmeSAuDQo+IA0KPiBwcml2X2RvbWlkIGZyb20g
dGhlIGNvbW1hbmQgbGluZSBpcyB1c2VkLCBvciB0aGUgZmlyc3QgY29udHJvbCBkb21haW4g
aXMNCj4gdXNlZC4NCj4gDQo+IGRvbTBfZG9taWQgd2lsbCBzZXQgdG8gdGhlIGxhc3QgeGVu
c3RvcmUgZm91bmQuICBUaGlzIHdpbGwgaGFuZGxlIGRvbTANCj4gb3IgZG9tMGxlc3MsIHdo
ZXJlIG9ubHkgMSB4ZW5zdG9yZSBkb21haW4gY2FuIGV4aXN0LCBvciBzdHViZG9tLCB3aGVy
ZQ0KPiBkb20wIGFuZCBkb20xIGV4aXN0LCBhbmQgd2Ugd2FudCB0byB0YWtlIHRoZSBzdHVi
ZG9tLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1
a0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------2x6LqQk84MUGfeRWiPUBsor8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2x6LqQk84MUGfeRWiPUBsor8--

--------------K2AwHpqF0sH4nkX1GYl9CvTR--

--------------wqHcr5UEkTuAJS2jki00pFHv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHf1UFAwAAAAAACgkQsN6d1ii/Ey/w
Xgf+LD3woVzEHNPGWsWb/o4zUHiJUbJXviW0ZPTkGQ3eAOI9KFnAfBuhQ2MUa6X0eL9vZSXj8TIE
d1Mk9/HldXUd3680Ofazu1RMiU7WrSI47crPkTlnEtzxlYWidafk1Is5hhMuTwkQAW7lzLB1Pyyh
hHCYeZr0bYboW+FjmKiddKE4ctrhmDDG95T1JOxusHgWSKc/nzo0cPbnwLQNiLuyrTMozMfpIU8n
ynL9AyAaraQn+M+nRP1X1/3U9P0SMshbbIHj6wipzZNnqc9LAQgeFSL9iw6jCuYYk0NwBA6fdLgH
PVTlx6vDZsR6sPZ2BqWUanMguN9NGPu2bFVCp6qt3w==
=J5Vt
-----END PGP SIGNATURE-----

--------------wqHcr5UEkTuAJS2jki00pFHv--


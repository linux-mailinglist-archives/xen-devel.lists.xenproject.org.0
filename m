Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB26B158B3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 08:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063419.1429145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzus-0000W4-1Y; Wed, 30 Jul 2025 06:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063419.1429145; Wed, 30 Jul 2025 06:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugzur-0000Tj-VF; Wed, 30 Jul 2025 06:03:53 +0000
Received: by outflank-mailman (input) for mailman id 1063419;
 Wed, 30 Jul 2025 06:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugzur-0000Td-3c
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 06:03:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f79a1720-6d0a-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 08:03:52 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-af901f72f11so52944666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 23:03:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a63ab0sm693837666b.65.2025.07.29.23.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 23:03:49 -0700 (PDT)
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
X-Inumbo-ID: f79a1720-6d0a-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753855431; x=1754460231; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m6Wiupw0xvxstUPL14uHd7tGmVSfXEJuuAYkn6pWbF4=;
        b=BABgui40P+1LFIUHeZmqsnIJIWVjjWSWB4fR6Z0FRqbVr9q2cJpGheeQqGbjLQ35LC
         nrQ3kIBNc0lvDcVc1Z3RaXUqOy4AgP4PadgBPYYFgWA8FSxksaoJAgSWVGfDDxC6uZir
         rjdQE9jw5L1bKMN9rQMwP+3vF5Jus3WJSzVLqQ8uEmTxll2UAatOlB3yHBMWGDOo22jl
         CKLYcncRrYM144LX5m+rqOsIgfn28TJzeOtLWIJ2ossbY1AgOfnyqrZfT9hI55mokhPz
         5ny5zRj76nvMPuNGxJtVFotMSpBSyTCKsuVbxmQS626PtdYFA885ZePghEWr2Sw2H7e7
         yS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753855431; x=1754460231;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6Wiupw0xvxstUPL14uHd7tGmVSfXEJuuAYkn6pWbF4=;
        b=lJVQqy8JnSCjMC1QXXggSFv95sCmboPjWYo+voOxdBqQixcepj0kG+HDSZWavB/JGE
         TYlS+tLphf35kf2rxP/zwqlRdhSWk8GOQWacZC56GJpi9+zsrcpQQbvnCwvNWXsrGWTI
         kHmCxLSBBBouAeLbBf/S+/lz5A3ujXZobaB5R2HqnJA759zLJJMCTAhOe5MLawP8NB/V
         /kTI8o2TO75EYq/BEsFofK+fjmpdvLaCnwklzN7C5161JkzNl4YynYt+k5FllwVw5zaZ
         xgfI/I4M+xIaCofer00mQcYmcD2JCz+cwGswYN6WvBiwGNxPhR/Oxc2cF3CZqo+4lbCm
         6eqw==
X-Gm-Message-State: AOJu0YwjW1ymVtCeKQxTT1S6BcVDSgCNpjRvYriwxlGpH0XQ/tPwkMqD
	11t0w4j1PeS4VgcbRQ8ldmVWySt7gfPLSwncIhWVKMeWfutf9u8k6PZT+igAyrZ5uMc=
X-Gm-Gg: ASbGncuN0HP1nIOHGDb2P2mxokrJ3d9hnvUo6H3k3+EjGy+LRv2rOjtS/95kLOY6QjK
	Gvh1yvVrXG273A6L+hI+rTmk0kBw1l5Y7yvsUGhvGm0w7wqhZolHexktD30ZCpjiAaMGe2EjJcw
	/vVAdSbAqhVRJ2lYOnYmBQ0Tm36MxjzihvZH7xYpHRO3OMZSPU3RwZ0Ukz65cGfFa17J6eBh41H
	Tz5kE6KGG6p/2pvnsaaLpO1wa1oRomk5O1xmwcHRpO6rWmdkiLnIPgIJu5JfWghxhKAFoYu2ttP
	I2HzEV541uPea57iImrbq7gY5wG7s5cMe2ObsULgx8slWbsT3Ga2NwsHm/XaLvkWbyj33C/PNXD
	+2YpVIffCDyuKWxFVV9Q42eEUbTeqc7goQ4OVWFLluSaLlFOwEkA4LWej7qoq2aTzhAuF3L9yJj
	7dEWQ8pAgzpTBEgkx1RPEO3z+d6m14UfE6c9lNVw3cvQ==
X-Google-Smtp-Source: AGHT+IGWGqG1uTuVBLl2RLz7KAE6r+mPqvgqIQv2F2AERDHbPug956qR86sgNmCXn/MWFCQD+HO9Nw==
X-Received: by 2002:a17:906:7313:b0:af2:3f43:d738 with SMTP id a640c23a62f3a-af8fd71f01emr268691266b.17.1753855430189;
        Tue, 29 Jul 2025 23:03:50 -0700 (PDT)
Message-ID: <5638360c-72d8-42a5-811c-592a6804c9f1@suse.com>
Date: Wed, 30 Jul 2025 08:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] tools/libxenevtchn: add xenevtchn_bind() under
 Mini-OS
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-6-jgross@suse.com> <aIj-H5QvGMhFLh4c@l14>
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
In-Reply-To: <aIj-H5QvGMhFLh4c@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0YDwam9qXt3z02ndfWfdmt0d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0YDwam9qXt3z02ndfWfdmt0d
Content-Type: multipart/mixed; boundary="------------TgCCQXtDQY8JA2j2S870UjKu";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <5638360c-72d8-42a5-811c-592a6804c9f1@suse.com>
Subject: Re: [PATCH v2 5/9] tools/libxenevtchn: add xenevtchn_bind() under
 Mini-OS
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-6-jgross@suse.com> <aIj-H5QvGMhFLh4c@l14>
In-Reply-To: <aIj-H5QvGMhFLh4c@l14>

--------------TgCCQXtDQY8JA2j2S870UjKu
Content-Type: multipart/mixed; boundary="------------O5q6yPo7nX2o2GVX0MoZDS2n"

--------------O5q6yPo7nX2o2GVX0MoZDS2n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjUgMTk6MDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEp1
bCAyOSwgMjAyNSBhdCAwMTowMTo0MVBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gSW4gb3JkZXIgdG8gcmVhY3RpdmF0ZSBhbiBldmVudCBjaGFubmVsIGFmdGVyIGtleGVj
KCkgb2YgTWluaS1PUywNCj4+IGxpYnhlbmV2dGNobiBuZWVkcyB0byBhbGxvY2F0ZSB0aGUg
cG9ydCBkYXRhIGZvciB0aGUgZXZlbnQgY2hhbm5lbA0KPj4gYW5kIHNldCB0aGUgaGFuZGxl
ciBhZ2Fpbi4gQWRkIGEgbmV3IGludGVyZmFjZSB4ZW5ldnRjaG5fYmluZCgpDQo+PiBmb3Ig
dGhhdCBwdXJwb3NlLCBhdmFpbGFibGUgdW5kZXIgTWluaS1PUyBvbmx5Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IFJldmll
d2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+PiAtLS0N
Cj4+ICAgdG9vbHMvaW5jbHVkZS94ZW5ldnRjaG4uaCAgfCAxMSArKysrKysrKysrKw0KPj4g
ICB0b29scy9saWJzL2V2dGNobi9taW5pb3MuYyB8IDE3ICsrKysrKysrKysrKysrKysrDQo+
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS90b29scy9pbmNsdWRlL3hlbmV2dGNobi5oIGIvdG9vbHMvaW5jbHVkZS94ZW5ldnRj
aG4uaA0KPj4gaW5kZXggMTI1NWM4NTE3OC4uMTEzYTcxOGQ2NyAxMDA2NDQNCj4+IC0tLSBh
L3Rvb2xzL2luY2x1ZGUveGVuZXZ0Y2huLmgNCj4+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVu
ZXZ0Y2huLmgNCj4+IEBAIC0xNzMsNiArMTczLDE3IEBAIGludCB4ZW5ldnRjaG5fdW5tYXNr
KHhlbmV2dGNobl9oYW5kbGUgKnhjZSwgZXZ0Y2huX3BvcnRfdCBwb3J0KTsNCj4+ICAgICov
DQo+PiAgIGludCB4ZW5ldnRjaG5fcmVzdHJpY3QoeGVuZXZ0Y2huX2hhbmRsZSAqeGNlLCBk
b21pZF90IGRvbWlkKTsNCj4+ICAgDQo+PiArLyoqDQo+PiArICogQmluZCBhbiBldmVudCBj
aGFubmVsIHVuZGVyIE1pbmktT1MuDQo+PiArICoNCj4+ICsgKiBCaW5kIGFuIGV2ZW50IGNo
YW5uZWwgc3BlY2lmaWVkIGJ5IGl0cyBrbm93biBwb3J0IGFmdGVyIGEga2V4ZWMoKSBvZg0K
Pj4gKyAqIE1pbmktT1MuIFRoaXMgZnVuY3Rpb24gaXMgYXZhaWxhYmxlIHVuZGVyIE1pbmkt
T1Mgb25seSENCj4gDQo+IFdvdWxkIGd1YXJkaW5nIHRoaXMgcHJvdG90eXBlIHdpdGhpbiAi
I2lmZGVmIF9fTUlOSU9TX18iIGJlIHVzZWZ1bCB0bw0KPiBwcmV2ZW50IGl0IGZyb20gYmVl
biB1c2VkPyBUaGF0IHdvdWxkIGdpdmUgYW4gZXJyb3IgZWFybGllciB3aGVuDQo+IGNvbXBp
bGluZywgcmF0aGVyIHRoYW4gbGF0ZXIgd2hlbiBsaW5raW5nIGEgYmluYXJ5Lg0KDQpZZXMs
IEkgY2FuIGFkZCB0aGF0Lg0KDQo+IA0KPiBJbiBhbnljYXNlOiBBY2tlZC1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+DQoNClRoYW5rcywNCg0KDQpK
dWVyZ2VuDQo=
--------------O5q6yPo7nX2o2GVX0MoZDS2n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------O5q6yPo7nX2o2GVX0MoZDS2n--

--------------TgCCQXtDQY8JA2j2S870UjKu--

--------------0YDwam9qXt3z02ndfWfdmt0d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiJtcUFAwAAAAAACgkQsN6d1ii/Ey/a
twf/VTCS03+vfmHcPiWSu2wpMk98HQfuOZvz8nF20mTZ30cFIMZYnZEWsMiPBKealzmwCbe7Cg5/
3QKW0qFwIS8lxMaZ+ivBtpf5AFPy1dGwq+QG/QO92WKsdkYUVfk6Eyw9xMEllOPNZiQtjP2i8KUe
iP4NnS/g7Mbxi80QZMTKyyZytAIAuJIZ85zL8QGSsM4qAjFZtqjZi75bA/tC/GefsRjgnhY7dUAr
RREt0h20qBwN8vB+2Rt4AvoGxPzpCAJBBsjATe4nn3ewupEv2L0i6cacxFzA69nQis1mYC9rmlnC
1una04/kZZ0kFRl40VrNbLvqGX3bID+rF4xHsW4SFg==
=yIj1
-----END PGP SIGNATURE-----

--------------0YDwam9qXt3z02ndfWfdmt0d--


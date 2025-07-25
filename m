Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF80B11904
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057366.1425273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCd4-00047t-G0; Fri, 25 Jul 2025 07:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057366.1425273; Fri, 25 Jul 2025 07:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCd4-00045P-DL; Fri, 25 Jul 2025 07:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1057366;
 Fri, 25 Jul 2025 07:14:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufCd2-00045J-El
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:14:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a00ff8-6926-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 09:14:03 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so8075725e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:14:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870553d72sm43758545e9.16.2025.07.25.00.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:14:02 -0700 (PDT)
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
X-Inumbo-ID: f1a00ff8-6926-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753427643; x=1754032443; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vE4+SDioOz+AxJ5kcRDTkjTnw6IhmHjcYJZhZ0U8Zqo=;
        b=Ui5KYG++9IYRTHSy0s5qPSwC+j0h4Cu7ArwSNjAo8PfYg5K2T/FCS3+tn6corfwjqu
         cMA8tbwbgv6LlZr3Pszr11kc2oCRgz/w2Qhyy0+rKtfXduvHELw5CWT8xmhHS6dlc8Yn
         V81iwe9JXy+mnBlUHlO2lCszkXqjm4j0kKLAVSxnE9joeCNFk5oMW326Xb2Ih6NVoR4e
         8CY+eNCBVuffbBYTBweT/4j3LuJQ3OcXZdso03YfGHuwsiR46b/j2ZOKmhnMC/YvMtH2
         8eLyRryFKX2wM0KvGd8F7LPuydHryrljwCE2D/ApbSFofBd/0J2V/l1N8AlWKJIMyUp0
         c/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753427643; x=1754032443;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vE4+SDioOz+AxJ5kcRDTkjTnw6IhmHjcYJZhZ0U8Zqo=;
        b=XTm2i4iHe2GLMyJVLA7thF6okEdrqBM8cjLHWZFVr/ZDu3s4GNgqZ+wi+/7u0qiP9A
         LLb+gba4sHsT1LWJOIZUw0pEf/Z50aO0unWKP2Tzy+2f3NEfx1qWxK7jg611TdKWToFu
         qOpH62wDOP88VtD/bJCtTq8YTBvyOq4ggiVCfegjTwVylp1gKncKFfwnEjjtAVwjqRxb
         I2LIMp1u0YDBlYkKdmdfsFzo5Q/ANaIASA+DCvObuRRiXGK3XZtuQsUq6s/Dkg87qpWJ
         nCsatU2yZo9D+eFIuxCmQpeJ1QNJrStiIiJbGFdf2f+bkkPDmH+PVLV2iDKSdSkwIEh+
         wkIw==
X-Forwarded-Encrypted: i=1; AJvYcCUFyCcLFPg675Sil7jVr9kFjY2K3GVbRVpZvvg6Z5JYV+3Ly7pSJOtufwDVrooJZAa/muenU4WMCxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvYkmnogLuKrGfy9mSh56l78RWeKFsdeHponb0ax6hVAqsYdSN
	uIrbidTULEvB2xkRTu+hT99XTj9KkIOgOOrPvj9Z43CGI79NU9FzSXAFBj2nCvk7v3o=
X-Gm-Gg: ASbGncvXRef71ALFT1txythiWt2FWhAjAc72shIc+AZ0KDYlbGWouDkN2Tkfu6yJkTx
	rSs+BrlrAVDYIRtUC2beXv9qFFZVZkBtoH7YpnZgE0ajxCb9rZOd4KhhqvE4lgOEDS5tXW2IM1q
	5KVby/vbnKZFoGQQogosmYNzlAJtx6kECsSTMFQgaX9H+/4za+ma70IBgJpC9NLIqkKmaZPbBrE
	p9MU39XE4WmZiG3J2KjGTz7u8+T877Eue9mfz+cUJ6mPIyibwRfPA/SSJweGyp1kqpeONMy8xSV
	wGWZ7sCHE2uxn6gBvURj45ovy5aHExb673aZduuf/nVWmpouGVRtcX0t4S8yScrJcRXQvcxDgZt
	i6LkXEhhQRlvqJP6LfBGaVZwHdoxT8wCixquWHJcmsftUpP9Sy2FVpGof77DSb4lsLQF5YBfv+Z
	wQ1VsxLHX/+bScaUdhMQZdqiud6kx+gPdXNCN3c7yiO4J5g1LdqeRtC5g=
X-Google-Smtp-Source: AGHT+IFoFACjmdG01Nk9JE+Cw0W5wHipBAdj9r5fX4QciBTBOtQoiqqCrw2dXD0zJWy7rQs5cpI6mA==
X-Received: by 2002:a05:6000:2288:b0:3aa:34f4:d437 with SMTP id ffacd0b85a97d-3b77675bd71mr499830f8f.37.1753427642797;
        Fri, 25 Jul 2025 00:14:02 -0700 (PDT)
Message-ID: <f4ad393d-da85-42cf-8b69-0466cb31fa73@suse.com>
Date: Fri, 25 Jul 2025 09:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] tools/xenstored: Remove stubdom special casing
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-9-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-9-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QMG6XuS651I7zDSt6zjC4LiV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QMG6XuS651I7zDSt6zjC4LiV
Content-Type: multipart/mixed; boundary="------------tC8TXJel70Pw70urxYPGqzdA";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <f4ad393d-da85-42cf-8b69-0466cb31fa73@suse.com>
Subject: Re: [PATCH v4 08/12] tools/xenstored: Remove stubdom special casing
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-9-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-9-jason.andryuk@amd.com>

--------------tC8TXJel70Pw70urxYPGqzdA
Content-Type: multipart/mixed; boundary="------------JYOOuuEl2igkwwEYLPu0bPi6"

--------------JYOOuuEl2igkwwEYLPu0bPi6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IHBvc2l4LmMgYW5k
IG1pbmlvcy5jIGltcGxlbWVudCB0aGUgc2FtZSBuYW1lZCBmdW5jdGlvbnMgc2VydmluZyBz
bGlnaHRseQ0KPiBkaWZmZXJlbnQgcHVycG9zZXMuDQo+IA0KPiBGb3IgeGVuYnVzX21hcCgp
DQo+IHBvc2l4LmMgbWFwcyB0aGUgbG9jYWwgL2Rldi94ZW4veHNkX2t2YQ0KPiBtaW5pb3Mu
YyBtYXBzIGRvbTAgdmlhIGdyYW50IGFuZCB0aGVyZSBpcyBvcGVuIGNvZGluZyBmb3Igc3R1
Yl9kb21pZCBpbg0KPiBtYXBfaW50ZXJmYWNlLg0KPiANCj4gQ2hhbmdlIHhlbmJ1c19tYXAo
KSB0byBtYXAgdGhlIGxvY2FsIGRvbWFpbidzIGludGVyZmFjZS4gIFRoZSBkZWZhdWx0DQo+
IGdyYW50IHRhYmxlIG1hcHBpbmcgaXMgcGVyZm9ybWVkIG90aGVyd2lzZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCj4g
LS0tDQo+ICAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIHwgNSAtLS0tLQ0KPiAgIHRvb2xz
L3hlbnN0b3JlZC9taW5pb3MuYyB8IDQgKy0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IGluZGV4
IGU5ZTQ1ZWQ4ZTguLmFjNGFjNzJmOTkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0b3Jl
ZC9kb21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4gQEAgLTUw
NiwxMSArNTA2LDYgQEAgc3RhdGljIHZvaWQgKm1hcF9pbnRlcmZhY2UoZG9taWRfdCBkb21p
ZCkNCj4gICAJaWYgKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJfZG9taWQoKSkNCj4gICAJCXJl
dHVybiB4ZW5idXNfbWFwKCk7DQo+ICAgDQo+IC0jaWZkZWYgX19NSU5JT1NfXw0KPiAtCWlm
IChkb21pZCA9PSBzdHViX2RvbWlkKQ0KPiAtCQlyZXR1cm4geGVuc3RvcmVfYnVmOw0KPiAt
I2VuZGlmDQo+IC0NCj4gICAJcmV0dXJuIHhlbmdudHRhYl9tYXBfZ3JhbnRfcmVmKCp4Z3Rf
aGFuZGxlLCBkb21pZCwNCj4gICAJCQkJICAgICAgIEdOVFRBQl9SRVNFUlZFRF9YRU5TVE9S
RSwNCj4gICAJCQkJICAgICAgIFBST1RfUkVBRHxQUk9UX1dSSVRFKTsNCj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3MuYyBiL3Rvb2xzL3hlbnN0b3JlZC9taW5pb3Mu
Yw0KPiBpbmRleCBhMjI5OTU0Y2Y0Li4zNGY2NTVmMjBhIDEwMDY0NA0KPiAtLS0gYS90b29s
cy94ZW5zdG9yZWQvbWluaW9zLmMNCj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL21pbmlvcy5j
DQo+IEBAIC00OCwxMyArNDgsMTEgQEAgZXZ0Y2huX3BvcnRfdCBnZXRfeGVuYnVzX2V2dGNo
bih2b2lkKQ0KPiAgIA0KPiAgIHZvaWQgKnhlbmJ1c19tYXAodm9pZCkNCj4gICB7DQo+IC0J
cmV0dXJuIHhlbmdudHRhYl9tYXBfZ3JhbnRfcmVmKCp4Z3RfaGFuZGxlLCB4ZW5idXNfbWFz
dGVyX2RvbWlkKCksDQo+IC0JCQlHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUsIFBST1RfUkVB
RHxQUk9UX1dSSVRFKTsNCj4gKwlyZXR1cm4geGVuc3RvcmVfYnVmOw0KPiAgIH0NCg0KSSB0
aGluayB0aGlzIGlzIGNvcnJlY3Qgb25seSBhZnRlciBwYXRjaCAxMC4NCg0KSW4gYSBYZW5z
dG9yZS1zdHViZG9tIHlvdSB3aWxsIHN3YXAgYnVmZmVycyBvZiBkb20wIGFuZCB0aGUgc3R1
YmRvbSB3aXRoDQp0aGlzIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------JYOOuuEl2igkwwEYLPu0bPi6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JYOOuuEl2igkwwEYLPu0bPi6--

--------------tC8TXJel70Pw70urxYPGqzdA--

--------------QMG6XuS651I7zDSt6zjC4LiV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDLrkFAwAAAAAACgkQsN6d1ii/Ey+B
XAgAkYC2fCeGczafOswYbIIQy506GRxdbq3/sDk+l1SiwTL/Av1DKvFSHbtLlT77DMwOO64cvuSi
kzMyGYeQqYi50qZ8gYc7MzANTtQzkqe0la2by4dCU+y1KmY7acfdJSXU21mNZ0VxqbIXeOh4NYME
hzSDRcMaDxmxTiyxNqr0w4vzcT7FG6806KAQz9oz6s3DqYVoWGw4JfkM/wSftJGi58/9mbmfnsmk
0/RvAiqbwRoxfU6KPasQgctZPS5rmq4aexcVIR+T0WYbfPiVeeiWf6j/Hwr4kXN0B56HKy7UFyx5
9Dj7MV4MkcwAQxqMQ2pLR+j9QucPpd/4GIIDtuQD5w==
=NZj3
-----END PGP SIGNATURE-----

--------------QMG6XuS651I7zDSt6zjC4LiV--


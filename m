Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E59A578DD
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 08:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905585.1313351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqoD3-0006jQ-OA; Sat, 08 Mar 2025 07:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905585.1313351; Sat, 08 Mar 2025 07:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqoD3-0006gN-LJ; Sat, 08 Mar 2025 07:02:57 +0000
Received: by outflank-mailman (input) for mailman id 905585;
 Sat, 08 Mar 2025 07:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vBWN=V3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqoD1-0006fw-FK
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 07:02:55 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b4412e5-fbeb-11ef-9ab7-95dc52dad729;
 Sat, 08 Mar 2025 08:02:54 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e0b70fb1daso4780701a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 23:02:54 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c7473ea1sm3589947a12.29.2025.03.07.23.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 23:02:52 -0800 (PST)
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
X-Inumbo-ID: 5b4412e5-fbeb-11ef-9ab7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741417373; x=1742022173; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weekariHQ1j4NG3soPlRTbfahMDCcJ/PoVzv62PshsU=;
        b=XqjAJsNKCbN/0E8Akkv2xQVLaDBqfhEnXNItHPadAihet0IC5KhsYNKRRpPIJn88nQ
         P5dbTZWQ/dRf7kU93jZhWOZT3SZJ9AQqZkC+BF8dEkalTAEbXxGiSNCCtVMBe38oOQKr
         pgm0kfDJjJnyERe2dSnGlVq3P9uI5d8flKt/2081K4iOxBW402HD6Vh8NFjs1MJ2Z5xN
         pH1is4isKckH2gZg9bkjCw/fySZ1efe7zZFe2Eq45A/T6166/JfC+/dpo4oSt98Yl5OV
         zMkYNqzwWTWHEmD/psQR805BAIEIjRMJU7tR/hLS9Z9lTWxJwob9Hdg0ABeBrqFWJ6Q9
         mRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741417373; x=1742022173;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weekariHQ1j4NG3soPlRTbfahMDCcJ/PoVzv62PshsU=;
        b=KLm5NGTGUoGvqRl0saaqnXOS8KIvgksgHo55DURBWZ5bIbtZludTqswzktWEow8q3G
         3gth/5R2+/EKNeCAAyFsjpE77F2coHDAjnQYzvZ0SLZqGBlnM9Ul490GJd4MrOJPtF3Y
         7+6A4NKQZQb0yzGQvYc6y783hhv7UMEnXViVA8VXzokpk8w2MHkVfyUtX4MnxaPVJVgU
         TxIlu/68scj4yolbpoK9ZAWZGziNTQ9BDkN70NGBHvZVcDuTzLyBHKZtZ+1pbfvZEHSx
         qyTTCdpv0JcdqLOEmdnnK89c0HMllHMDLNaanz8bEqXd72mCdjCygcwGyzdYVRYQ02or
         BgFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5jfNGPGAu+85Sw8ep/o29wqNkDuiGUETlD5jAIIvpRIvVNiYdNhbpXkjwg/zHUpww4kaaxlNDK68=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf2MZEBqbT3zCBlidXOyViNAG7KCAEiKz1MPSoM7RiKYDi0NwK
	RM5Ry4IMrFRIoFsy7mN5kJJU+xceo9sdJEDIAcvkHT6upxpNnSvjX2WXp1OULnQ=
X-Gm-Gg: ASbGncv2yiS9u6Gp4kiJxLLP/DPEh/St64LXct/xVG13OL9Gqj5+piVFFB9a/SnfqbM
	VAoN+gYB85rxG5XSEt84/m8Uz8/UjDkkZ3sapCLVkSMmweTKYCnNEb9+u2UBpYsLmvScYJELAFI
	Kr1BcRNuwhKLMs7rZuJPqYxXn00LS5MoQzYv36mHD3qNLkPpYcSbcjV70eaQZM/l7aM5OVTAqrK
	ipO1cRVfCsBYtp3lT1iusf5s3wPuBteLmEZ5ugy/686qqEqqZSjqA8SQ1MFTuzDmo2Xacnme4OS
	djkHznbSGitPZoYp/dCuhSUR1TjZLJeZSPoQ56tpM1NK1b3dFgzsb7dPAQyWuK/ulKC3V44Pw9S
	h2C0by7+rmwl69p+H/7HMx4JBerU+h6M8jjTsGMZ03CKPUInoUL3Yy/51V/g9Wr6wvbTdD1bewr
	Yo3A==
X-Google-Smtp-Source: AGHT+IGK7yG5U1Z3floOrCioom9oKztrxvpvwvd4C6NZZ8V8yhayQH7jNRc+4V5MUBUcfG/MgobMVw==
X-Received: by 2002:a05:6402:5387:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e5e22dbbf6mr7188642a12.11.1741417373321;
        Fri, 07 Mar 2025 23:02:53 -0800 (PST)
Message-ID: <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
Date: Sat, 8 Mar 2025 08:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and
 priv_domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-12-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-12-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NXaVMz0rUPJfoDTxmrcH0Aa0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NXaVMz0rUPJfoDTxmrcH0Aa0
Content-Type: multipart/mixed; boundary="------------xTZdO5NmatvmxbeVDyr9vTT4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
Subject: Re: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and
 priv_domid
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-12-jason.andryuk@amd.com>
In-Reply-To: <20250306220343.203047-12-jason.andryuk@amd.com>

--------------xTZdO5NmatvmxbeVDyr9vTT4
Content-Type: multipart/mixed; boundary="------------bNI0FAs32zyoJHTrWJFsFLyx"

--------------bNI0FAs32zyoJHTrWJFsFLyx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMjM6MDMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFdpdGggc3BsaXQg
aGFyZHdhcmUgYW5kIGNvbnRyb2wgZG9tYWlucywgZWFjaCBkb21haW4gc2hvdWxkIGJlDQo+
IHByaXZpbGVnZWQgd2l0aCByZXNwZWN0IHRvIHhlbnN0b3JlLiAgV2hlbiBhZGRpbmcgZG9t
YWlucyB0byB4ZW5zdG9yZSwNCj4gbG9vayBhdCB0aGVpciBwcml2aWxlZ2UgYW5kIGFkZCB0
aGVtIHRvIHhlbnN0b3JlZCBhcyBhcHByb3ByaWF0ZS4NCj4gZG9tMF9kb21pZCBpcyB1c2Vk
IGZvciB0aGUgaGFyZHdhcmUgZG9tYWluLCBhbmQgcHJpdl9kb21pZCBpcyB1c2VkIGZvciBh
DQo+IGNvbnRyb2wgZG9tYWluLg0KPiANCj4gT25seSBvbmUgb2YgZWFjaCBpcyBhbGxvd2Vk
IGZvciBub3cuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5h
bmRyeXVrQGFtZC5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uYyB8
IDE2ICsrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rv
b2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPiBpbmRleCA2NGM4ZmQwY2MzLi5mMjM5NGNkNmU5
IDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4gKysrIGIvdG9v
bHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IEBAIC03OTUsNiArNzk1LDIwIEBAIHN0YXRpYyBz
dHJ1Y3QgZG9tYWluICpmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbih1bnNpZ25lZCBp
bnQgZG9taWQpDQo+ICAgCXJldHVybiBkb21haW47DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGlj
IHZvaWQgZG9tYWluX3NldF9wcml2aWxlZ2VkKHN0cnVjdCBkb21haW4gKmRvbWFpbikNCj4g
K3sNCj4gKwl4Y19kb21haW5pbmZvX3QgZG9taW5mbzsNCj4gKw0KPiArCWlmICggIWdldF9k
b21haW5faW5mbyhkb21haW4tPmRvbWlkLCAmZG9taW5mbykgKQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwlpZiAoIGRvbWluZm8uZmxhZ3MgJiBYRU5fRE9NSU5GX3ByaXYgKQ0KPiArCQlw
cml2X2RvbWlkID0gZG9tYWluLT5kb21pZDsNCj4gKw0KPiArCWlmICggZG9taW5mby5mbGFn
cyAmIFhFTl9ET01JTkZfaGFyZHdhcmUgKQ0KPiArCQlkb20wX2RvbWlkID0gZG9tYWluLT5k
b21pZDsNCj4gK30NCg0KUGxlYXNlIG5vIHVzZSBvZiBsaWJ4ZW5jdHJsLiBJIGhhdmUgd29y
a2VkIGhhcmQgdG8gZWxpbWluYXRlIHRoZSB1c2FnZQ0KaW4gb3JkZXIgdG8gZW5hYmxlIGEg
eGVuc3RvcmUtc3R1YmRvbSBiZWluZyB1c2VkIGFjcm9zcyBYZW4gdmVyc2lvbnMNCihDIFhl
bnN0b3JlIGlzIHJlbHlpbmcgb24gc3RhYmxlIGh5cGVyY2FsbHMgb25seSBub3cpLg0KDQpZ
b3UgbmVlZCB0byBhZGQgdGhlIG5lZWRlZCBmbGFncyB0byB0aGUgcmF0aGVyIG5ldyBzdGFi
bGUgZG9tY3RsDQpYRU5fRE9NQ1RMX2dldF9kb21haW5fc3RhdGUgYW5kIHRvIGxpYnhlbm1h
bmFnZS4NCg0KPiArDQo+ICAgc3RhdGljIGludCBuZXdfZG9tYWluKHN0cnVjdCBkb21haW4g
KmRvbWFpbiwgaW50IHBvcnQsIGJvb2wgcmVzdG9yZSkNCj4gICB7DQo+ICAgCWludCByYzsN
Cj4gQEAgLTgzMSw2ICs4NDUsOCBAQCBzdGF0aWMgaW50IG5ld19kb21haW4oc3RydWN0IGRv
bWFpbiAqZG9tYWluLCBpbnQgcG9ydCwgYm9vbCByZXN0b3JlKQ0KPiAgIAlkb21haW4tPmNv
bm4tPmRvbWFpbiA9IGRvbWFpbjsNCj4gICAJZG9tYWluLT5jb25uLT5pZCA9IGRvbWFpbi0+
ZG9taWQ7DQo+ICAgDQo+ICsJZG9tYWluX3NldF9wcml2aWxlZ2VkKGRvbWFpbik7DQoNClRo
ZSBuYW1lIGltcGxpZXMgeW91IGFyZSBjaGFuZ2luZyB0aGUgZG9tYWluIHRvIGJlIHByaXZp
bGVnZWQsIGJ1dCB0aGlzDQppcyBkb25lIGNvbmRpdGlvbmFsbHkgb25seS4NCg0KTWF5YmUg
bmFtZSB0aGUgZnVuY3Rpb24gZG9tYWluX2FwcGx5X3ByaXZpbGVnZXMoKT8NCg0KDQpKdWVy
Z2VuDQo=
--------------bNI0FAs32zyoJHTrWJFsFLyx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bNI0FAs32zyoJHTrWJFsFLyx--

--------------xTZdO5NmatvmxbeVDyr9vTT4--

--------------NXaVMz0rUPJfoDTxmrcH0Aa0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfL65wFAwAAAAAACgkQsN6d1ii/Ey91
Xwf/Rvxst11NL8mBekmBLJFLDAyb7N3//65mrvVa9QFn2XQlciigtIWZtlUN0+3VD6sPfZwDA2es
dcpnP/whumGO30eGwwKtHgq0OpOVE7S1v3d3Kd8UPI9gvI7hMhkGbestpRntpbb44VJ6DgeOqY0W
ug9p9d+fZSB4fEKAxNk8sdVk0x5KzlomJMJy0W82himXpzkVg8LpAmAzcC3js0aioJIio6lFcWL7
i9eT16ZDOALQ1dP24SGErTzlsKN6NcVGM+kvaeSzjpRhPepIeoZLs6cBjk1C+772NPfCPpBRJSC2
F3IW+WBIGb8KWK4wxHRdzYQvP7XFYKM4Wnp5xrGZ8Q==
=ziOX
-----END PGP SIGNATURE-----

--------------NXaVMz0rUPJfoDTxmrcH0Aa0--


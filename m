Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8749F5670
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 19:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859856.1271951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNcUP-00082M-3z; Tue, 17 Dec 2024 18:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859856.1271951; Tue, 17 Dec 2024 18:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNcUP-00080t-1B; Tue, 17 Dec 2024 18:40:13 +0000
Received: by outflank-mailman (input) for mailman id 859856;
 Tue, 17 Dec 2024 18:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNcUN-00080n-3b
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 18:40:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5753e448-bca6-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 19:40:08 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso936919a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 10:40:08 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96068a96sm475088766b.73.2024.12.17.10.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 10:40:07 -0800 (PST)
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
X-Inumbo-ID: 5753e448-bca6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734460808; x=1735065608; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SR6YHJNa9owjTtl43jTu7TH1sEFYkOvFgGO5HaPjWtU=;
        b=b0H2rYKlBobbYY4Jw3fbPEddEgdMhNoNbM3dm2XgFnNuHNMquRuQ3oRESgWQxm+B85
         lq/JS4jYuKU4fmTD3y4t3Tl0SidvBrPLtvSfgLKMWegVORmHjg2J538nVfws07o+dvu6
         MKr14woSd1OtOCbZUb1aeI+iNoaK0Hwv1n4R3GXn/cI+5oBUYYkULslBWR/NEgw4ejdl
         PlIAcB0L22Qx1t/0uhWyjDE2KRnihyQy9zAIU9rlTdSNB9kNp3Yop40ksiPqW2Drz3y5
         8q6SOPT0ZqqFGshtpFPK6y+k5BhmJ+f7hAra7qC5xzU/khW6ihmOJydxg9/iXy6s2ZVE
         bxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734460808; x=1735065608;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SR6YHJNa9owjTtl43jTu7TH1sEFYkOvFgGO5HaPjWtU=;
        b=k9DzoNCtRGp1Bgd8ZVPak53itNIGKPT4bdj0Ym0gEXDem+ccpF+O7mEZjtinKjbs2y
         jQRaA588GLcnTPL/t6Z0pIhbUh4g9mXXhiPjhwq70HO5lNB1/qYOLDmFCJ/q5xsgjEAr
         yMbkr/UspAvdPOM757Lp8rYpi3FwCsyCC+HH1P5s8Ul3FJE7pe0hAL+FMCIh/eWbwqsv
         8Io2LLM5/yMcWwY9tKLdFdh/Z4tpvKHYagtGFnNBXojnmE6YCM0nYictUkF5/L7jg61Y
         0p6uAr3oP0eM3kk4VFKJwEe9H2qrNxtr+83q8Tenvm2oDjjcOy4ZG2lzo2vguwiS0We6
         uQgA==
X-Gm-Message-State: AOJu0YwScVK2ywcJ26aX5Nj4UC5G/O2i+X+tIa8M6i/iMLjO4/KBL20m
	+ThVf5sih2IIMpWM86p08BxckEcOUajhbWd0XJLioc/a2hNTpk81dNKtTMk1O0g=
X-Gm-Gg: ASbGncvJqoNU1GRO097Nkoc9T6CbY5WNpVBxhug+/5TF14nijSV/3Yy84dxSuKjeet+
	7ItdKomOCfb/Ru1hOP3OUBhCl7TkbLAQ15ptrJCu7B9CQvIxAkDdlT3OK5zWhodScKxR8zgKCmP
	3iRWtTI8PiqnGzVygHfZSjVgMmcZt62X7fAsgLiO0ZE3JD+Fbz0c/mBIcFrIyBFJkQxjcOjilaN
	jJnxos8QcuVG9VyuzUxg+j+42Qi2SJ+tjYkRtaMyowkxFGlaWayIVHwggkARf1J0vlQeUhqKBNo
	Xg3doXjbiJZEJxU1JzMvIqXpkfVxfGcr3PiTdYiCIH3OxPsafrsa2cj2ianCno2aH+Xc37lEF75
	z4LZllw==
X-Google-Smtp-Source: AGHT+IFzgAMZn5lovfApKMkBxc3pMRfMneV0ZUPlK+qZZTjoeMb9Vy/BeMDcxAs0c4PECpZXEqFrRg==
X-Received: by 2002:a05:6402:538a:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d7ee3ef4b2mr296979a12.23.1734460808266;
        Tue, 17 Dec 2024 10:40:08 -0800 (PST)
Message-ID: <450e9ba3-0df6-456b-a461-92c9d7652fd6@suse.com>
Date: Tue, 17 Dec 2024 19:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] tools/xenstored: use new stable interface instead
 of libxenctrl
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Julien Grall <julien@xen.org>
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-6-jgross@suse.com> <Z2G14bDyV_Dn06YP@l14>
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
In-Reply-To: <Z2G14bDyV_Dn06YP@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sXmoc73SwPQ9NPYe4mB55ETj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sXmoc73SwPQ9NPYe4mB55ETj
Content-Type: multipart/mixed; boundary="------------hWTFOetRL0jvT5XUhYWBTDbu";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Julien Grall <julien@xen.org>
Message-ID: <450e9ba3-0df6-456b-a461-92c9d7652fd6@suse.com>
Subject: Re: [PATCH v5 5/5] tools/xenstored: use new stable interface instead
 of libxenctrl
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-6-jgross@suse.com> <Z2G14bDyV_Dn06YP@l14>
In-Reply-To: <Z2G14bDyV_Dn06YP@l14>

--------------hWTFOetRL0jvT5XUhYWBTDbu
Content-Type: multipart/mixed; boundary="------------0aBYkAgqG02IBWAdN0FTYyye"

--------------0aBYkAgqG02IBWAdN0FTYyye
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTIuMjQgMTg6MzMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIERl
YyAxNywgMjAyNCBhdCAwMzoyMjoxOFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rvb2xzL3hlbnN0
b3JlZC9kb21haW4uYw0KPj4gaW5kZXggNjRjOGZkMGNjMy4uYTY1MDZhNWJiMiAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gKysrIGIvdG9vbHMveGVu
c3RvcmVkL2RvbWFpbi5jDQo+PiBAQCAtMTI1OCwxNSArMTI0OCw5IEBAIHZvaWQgZG9tYWlu
X2Vhcmx5X2luaXQodm9pZCkNCj4+ICAgCWlmICghZG9taGFzaCkNCj4+ICAgCQliYXJmX3Bl
cnJvcigiRmFpbGVkIHRvIGFsbG9jYXRlIGRvbWFpbiBoYXNodGFibGUiKTsNCj4+ICAgDQo+
PiAtCXhjX2hhbmRsZSA9IHRhbGxvYyh0YWxsb2NfYXV0b2ZyZWVfY29udGV4dCgpLCB4Y19p
bnRlcmZhY2UqKTsNCj4+IC0JaWYgKCF4Y19oYW5kbGUpDQo+PiAtCQliYXJmX3BlcnJvcigi
RmFpbGVkIHRvIGFsbG9jYXRlIGRvbWFpbiBoYW5kbGUiKTsNCj4+IC0NCj4+IC0JKnhjX2hh
bmRsZSA9IHhjX2ludGVyZmFjZV9vcGVuKDAsMCwwKTsNCj4+IC0JaWYgKCEqeGNfaGFuZGxl
KQ0KPj4gLQkJYmFyZl9wZXJyb3IoIkZhaWxlZCB0byBvcGVuIGNvbm5lY3Rpb24gdG8gaHlw
ZXJ2aXNvciIpOw0KPj4gLQ0KPj4gLQl0YWxsb2Nfc2V0X2Rlc3RydWN0b3IoeGNfaGFuZGxl
LCBjbG9zZV94Y19oYW5kbGUpOw0KPj4gKwl4bV9oYW5kbGUgPSB4ZW5tYW5hZ2Vfb3BlbihO
VUxMLCAwKTsNCj4+ICsJaWYgKCF4bV9oYW5kbGUpDQo+PiArCQliYXJmX3BlcnJvcigiRmFp
bGVkIHRvIG9wZW4gY29ubmVjdGlvbiB0byBsaWJ4ZW5tYW5hZ2UiKTsNCj4+ICAgDQo+PiAg
IAl4Z3RfaGFuZGxlID0gdGFsbG9jKHRhbGxvY19hdXRvZnJlZV9jb250ZXh0KCksIHhlbmdu
dHRhYl9oYW5kbGUqKTsNCj4+ICAgCWlmICgheGd0X2hhbmRsZSkNCj4+IEBAIC0xMzA2LDYg
KzEyOTAsOCBAQCB2b2lkIGRvbWFpbl9kZWluaXQodm9pZCkNCj4+ICAgew0KPj4gICAJaWYg
KHZpcnFfcG9ydCkNCj4+ICAgCQl4ZW5ldnRjaG5fdW5iaW5kKHhjZV9oYW5kbGUsIHZpcnFf
cG9ydCk7DQo+PiArDQo+PiArCXhlbm1hbmFnZV9jbG9zZSh4bV9oYW5kbGUpOw0KPiANCj4g
SXMgdGhpcyB0aGUgcmlndGggcGxhY2UgdG8gZnJlZSBgeG1faGFuZGxlYD8gZG9tYWluX2Rl
aW5pdCgpIHNlZW1zIHRvDQo+IG9ubHkgYmUgY2FsbGVkIGJ5IHRoZSBsaXZlIHVwZGF0ZSBj
b2RlLiBBbGwgdGhlIG90aGVyIGluaXRpYWxpc2F0aW9uDQo+IGRvbmUgaW4gZG9tYWluX2Vh
cmx5X2luaXQoKSBhcmUgZnJlZSB2aWEgdGFsbG9jX2F1dG9mcmVlKCkgaXQgc2VlbXMsDQo+
IHdoaWNoIGlzIGNhbGxlZCBieSBhdGV4aXQoKS4NCj4gDQo+IFNvLCBzaG91bGRuJ3QgYHht
X2hhbmRsZWAgYnkgaGFuZGxlIHdpdGggdGFsbG9jIGxpa2UgdGhlIG90aGVycz8NCg0KTm8s
IEkgZG9uJ3QgdGhpbmsgc28uDQoNClRCSCwgSSdtIHF1ZXN0aW9uaW5nIHRoZSB0YWxsb2Mo
KSBhbGxvY2F0aW9uIG9mIHRoZSBvdGhlciBoYW5kbGVzLCB0b28uDQoNClRoZSBvbmx5IGNh
c2Ugd2hlcmUgeGVuc3RvcmVkIGlzIHN0b3BwZWQgSVMgdGhlIGxpdmUgdXBkYXRlIGNhc2Uu
IEFwYXJ0DQpmcm9tIGNyYXNoZXMsIG9mIGNvdXJzZSwgYnV0IHRob3NlIHdvbid0IGV4ZWN1
dGUgdGhlIGRlc3RydWN0b3JzIGVpdGhlci4NCg0KDQpKdWVyZ2VuDQo=
--------------0aBYkAgqG02IBWAdN0FTYyye
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0aBYkAgqG02IBWAdN0FTYyye--

--------------hWTFOetRL0jvT5XUhYWBTDbu--

--------------sXmoc73SwPQ9NPYe4mB55ETj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdhxYcFAwAAAAAACgkQsN6d1ii/Ey9/
hggAlRbMZXGBugIzbv+P4aB/huwe2EbOLJrCF1R2THF4lqLuZFX3Ads+Y4b9Nw3zdqljGl+hyFfv
nJYKuWCgTSKlhrIgbG06FOULlJgkhPQkxwGAAV8KLsC7bT3Ds7EEwIJisg1+FLgsneiDL1KLwT3q
IOzyOd10Q+/jpGntDF6GA/KJ9YfzgA65AM0oEV16e4F+BshZfMG5MBqXaTKetWPihmb+vlH31wgg
5rsqLcfg1oNX6OGHuEyXVGEbjw8Sav/VlY51oCGVHQkjvECcMRJb3OJQF9VxYx2CTwO76ujt+cmL
wQNIYXp5yuOQL2CG94RMfa3rpirbf6MRv8iey4x40g==
=5z8B
-----END PGP SIGNATURE-----

--------------sXmoc73SwPQ9NPYe4mB55ETj--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83BA9475D
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 11:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960626.1352465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6R7G-00013D-Aa; Sun, 20 Apr 2025 09:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960626.1352465; Sun, 20 Apr 2025 09:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6R7G-000118-7c; Sun, 20 Apr 2025 09:37:34 +0000
Received: by outflank-mailman (input) for mailman id 960626;
 Sun, 20 Apr 2025 09:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u6R7E-0000zQ-KI
 for xen-devel@lists.xenproject.org; Sun, 20 Apr 2025 09:37:32 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14608ea6-1dcb-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 11:37:30 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac2dfdf3c38so563064866b.3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Apr 2025 02:37:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec5102bsm381392466b.68.2025.04.20.02.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Apr 2025 02:37:29 -0700 (PDT)
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
X-Inumbo-ID: 14608ea6-1dcb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745141850; x=1745746650; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QgQIwgzce6mn81FllKzjYLhPtXg/33rzsQt4hxyF/R4=;
        b=Se1nS01Z6W5y14LSBtLs0wvCIq3rkjUJmHjm763N4h3wfhiuMfBaBbMWAorseaILCH
         HXH15e2cWiz3t3dy9FjajCoPdMqOh5GWs/kajQ7rxIX52+uU6FWZNa3uOkljvw+gs18f
         bIsktuYEFPZcO6R/MFQ9NhxezjmXNXxGeHr5qTbOOoeS5z0I1erFt11k/F22LePl3wff
         lpcvi0csoQejbcrYRzPWYmymXkboYixAlzmw6kp2G1C6NoDgGH4QxLMEkjL1dzXA1Xi9
         tAIpZH+vGVUOtmaxJ1cKupZpf2oASoWXmCrEh8UXDD/aOwocCUyJRIxxqo+59tojhpFy
         zo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745141850; x=1745746650;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgQIwgzce6mn81FllKzjYLhPtXg/33rzsQt4hxyF/R4=;
        b=osdYwszG9ryMvck8rPkLvz0LEXkKDU/6RnZ/D5FZmO6HX0KNogJIYev/YZ+y1VTMVA
         kEvzr15CbRRf6VBQ63A9jkEwx/LmdGmX8vg7Hz/9VJ0O3qg5Bbl+RB/sJVaBIBV2138m
         3b2BRDh3QC4KS3HZLaOPSdJk93mAEvxLXFSUGyUbh5uVZZj7ZynTs/IGALLVikN4+W9G
         amtDH5K1oKXl3Ixn6Ec6ZB83TjzlaqbADoclhyfT4p6iFzVfkfUA2fuC3gIofoE/x1Le
         9S1tNpuv31dvgflOGIHaHcA1YAMda9O+ZPK+so8plHmDhb+luCrM2bXCZSaaHumHGnvO
         lRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm+0EjwrFKvwYmJeGAasoKCwjN9rpMeVqPngOQsnQ2dlfISyEfjQ5RVDbFkx+U9WgNAxVP285YwKA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5XgNgSTXDO8W8zsMyrly2L97EVR9LXTbgK517u2pRzn1As/Zq
	OnYBgeZnxNu77Xuw0QSFoOECIOjeDNmNu7rxTWZ45LYezltdomuwPhyffA7cT0s=
X-Gm-Gg: ASbGncuns3VJ/aO+rRlpKDP38J3fQwL0UoNXn+s0y7UsG3QRU7xL3sH/DjqiTx4Xq9a
	MrRIBrNR9b3qAV6quZYksOG+WgKKjQE9r6hsfBQ4XlhWBLXIGZDs0hHXvxQbLt3MKG6stf4ydTa
	O8HUJT+htmYsMaEGQDmvUvb9RohgYaCiaqL0BZXWTFJX8zSskl8YLw4Mi4D54/BG3GwuZ+CZrNi
	ALFKlbiajSFo9LIl0tA2wRXanpYg5bAlCHIU7IzCTYKjNugIxrv4xNxO4tpKc/snaPpL3gsj0UX
	jHzywXKWE3gYgxHAzLtOCFf/h+PZtkz0zO85MiHBw7CFyJO7XPBoTSBS+1TI8ElmOLqocikx3Le
	ap1wBq3Z4mMCMzKnDhtYvXXu6nY/L8Rfyo7+t7xRXEC3BRob+435QJYnEb2npsQSSfQ==
X-Google-Smtp-Source: AGHT+IFWw0zaxnQZoAi4meMJMRbz+GQeFdmUieMvqhl5ojuYniRZnV/03+F6cblD1PvqRvTllQlfMQ==
X-Received: by 2002:a17:907:9450:b0:acb:205e:e0ac with SMTP id a640c23a62f3a-acb74dd7715mr777818366b.57.1745141850153;
        Sun, 20 Apr 2025 02:37:30 -0700 (PDT)
Message-ID: <b51d7c0b-a97c-4b54-872b-90382f5dfdf4@suse.com>
Date: Sun, 20 Apr 2025 11:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstored: Remove setjmp.h
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250418205933.542150-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250418205933.542150-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iGOlWt07P7tf6btlAx8D8iOg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iGOlWt07P7tf6btlAx8D8iOg
Content-Type: multipart/mixed; boundary="------------JEoojZOWNEKLPzUOeaWZT0Mx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <b51d7c0b-a97c-4b54-872b-90382f5dfdf4@suse.com>
Subject: Re: [PATCH] xenstored: Remove setjmp.h
References: <20250418205933.542150-1-jason.andryuk@amd.com>
In-Reply-To: <20250418205933.542150-1-jason.andryuk@amd.com>

--------------JEoojZOWNEKLPzUOeaWZT0Mx
Content-Type: multipart/mixed; boundary="------------5SUpWrmFGl5u8wyscTNcdp0A"

--------------5SUpWrmFGl5u8wyscTNcdp0A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDQuMjUgMjI6NTksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVzZSBvZiBzZXRq
bXAvbG9uZ2ptcCBhcyByZW1vdmVkIGluIDIwMDYsIGJ1dCB0aGUgaW5jbHVkZSByZW1haW5l
ZC4NCj4gUmVtb3ZlIGl0IG5vdy4NCj4gDQo+IEZpeGVzOiAxYmFjM2I0OWNkICgiSW1wb3J0
IHRoZSBjdXJyZW50IHZlcnNpb24gb2YgdGFsbG9jLi4uIikNCj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KDQpBcGFydCBmcm9tIHRo
ZSBGaXhlczogY29tbWl0IGlkIHNob3J0ZW5pbmc6DQoNClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------5SUpWrmFGl5u8wyscTNcdp0A
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5SUpWrmFGl5u8wyscTNcdp0A--

--------------JEoojZOWNEKLPzUOeaWZT0Mx--

--------------iGOlWt07P7tf6btlAx8D8iOg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgEwFkFAwAAAAAACgkQsN6d1ii/Ey/B
EggAln2ouHt8uWKmI1duUOOrCmCOvDRh88Pj17YkM9UB2XwLoUdrmJGtIRGa8i9dVYKazoYQEur8
2lqRe9MI7UPIzSjBGhNCmcmivmskk7iAwBjBOpY1osJnr1XS/sj66GNcwmUDhtyB8oL4wIPQyGNh
iu1sCWUkqzJVFQhaIWLeqtdaNp+FQ0p3AGT+QVhirp9E4pQ0Q6XK2xjIo3fKyzNcVdDy86icOWtd
51zycmiPBtKjQMORSBAxLpCcZrJWp3JTbhHRdzbHwxBf1vqaKabUTs9HPzhgSgQVNbqsaitfueQT
TWt4xtbtEYbUefe8y9iftazOcE38P2cg71mtsVE6JQ==
=w4yt
-----END PGP SIGNATURE-----

--------------iGOlWt07P7tf6btlAx8D8iOg--


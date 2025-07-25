Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FBB119B7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057504.1425407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDez-00047k-M0; Fri, 25 Jul 2025 08:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057504.1425407; Fri, 25 Jul 2025 08:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDez-00045B-JJ; Fri, 25 Jul 2025 08:20:09 +0000
Received: by outflank-mailman (input) for mailman id 1057504;
 Fri, 25 Jul 2025 08:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufDey-0003zV-Ak
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:20:08 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2816563d-6930-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 10:20:00 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60c5b8ee2d9so3818992a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:20:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614f7eee647sm94609a12.61.2025.07.25.01.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 01:19:59 -0700 (PDT)
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
X-Inumbo-ID: 2816563d-6930-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753431599; x=1754036399; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ihifo2JPB/eb0ajXBbC9QA25ORy74CvNI/XgqnSIdgk=;
        b=UQddTA0RWOmEBwoG2tv9MV970RUlBS79EqGzJWC2qMJDwh2iXIa8AAUOpn6JmBfbfu
         PxV3lH8xhmU1qt/XstIEgQk+UfsCpCVUv7mgEuxE/VIacwwcvNVwOokyyujIy52bFjPm
         2DutVqUXyoB9tvmQOSNmBUYQs4kVUz5YLR2OZcIGmsunf5x2OOUi6SNYdCr3yscD9llC
         VKhIiDy3VNNpopxlGCoIZiRVGnbks4CV63XIlNCx2eHexiELsR3gkFqDaq4B14Gknp2u
         2pQybzIp7OsYkmUjXooLtIPnt1bdsHqAZtVg44RWTUu9yauX7PSOqqijFCkiDZ+zqd52
         AOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431599; x=1754036399;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihifo2JPB/eb0ajXBbC9QA25ORy74CvNI/XgqnSIdgk=;
        b=TPGzuN9200DmWni+BMR2QZXPi3Ip3sU/R9kmU4revjbghpHpLgA2h+0fk5DMcDXWOY
         IjKMBwveV0SVSYPScAaCk6wEq7K5Td7tgSHHZ4UvS+jkU/jTxuYBZvokDeNlG5GYAODt
         ungx+ebJInoXmfV/Y5WoSW1QJZJXihvbEwVq5OUTM1K4ICSvTi04sNORjyQHnJkQkwof
         JWiffptirKh7XaqED9/LtEpdzgKhP5LGKb5ggTnMYNHy1CQTjlsw7xt/kUFFZOpaNwJL
         9UcBS65Dk4vpucV0F1obtzOX5jAGVeYcOt6up1/kCE/gRkSLCd9p7Zkn5Qsdzql4aESu
         2Ahg==
X-Forwarded-Encrypted: i=1; AJvYcCU0o10/2bXEu7cWX69hCi+FYrUM4rl7KvF2PPguzset1TF0+eyV3eyrVsRfsBzMaZcb0n0GSr1pkDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKZ3DAbFwQPDTaa6mOP+ch2nOClvl5GPzjaPR54h2sHnSNdh+T
	GTEXnIOErHc+VMoNQJcNErd+9RuxpmrmCrk6TdOjaNLWgZ77H5d+08Yoy4qLTJ6/hxo=
X-Gm-Gg: ASbGncs+cioC6Aa5gL1ig3dzTPboDCnYTkNKSMj0qUrRKJdq8FhD3rCsIyJWTCkqglk
	/ONbo6Rc+me9uzFTquWgyqlmhhj1rYD/KiCZHx0vo4oZeG78gtftWQyyr3NhMJ1GpE1Mfpi0M6r
	DkxzBNDay32YcrS4JQog9Wo8jPa9/iqA1MRKddapB0tQxMcDOXSycdwKENdgQMf6FOKvTQaVJEW
	Hfip4P32aFKcE1cz4GA/BhNj+YIhOm4xdGa9sSx+dIDSjl2bbdR+9sU2AbUp4T9srzFJoTIzjw6
	iBkA6FyoQFkUdqr2fP1TfNSpzHeWVNPESD3khkuiI5ePnsiyjPXo7Bw53DxDZ1Kw8nXjtk80Rzk
	4MaixHECRdCZcq9QebvzhZ9qM2HOts5+hsnFQ+KAiB+V9+4X3kA82oXuWMjef2n7pgpctih9/QA
	ASZpsTdVlVZLqiiw/lrE17xK2zN9fgt4SvKjWdnfGeujPG
X-Google-Smtp-Source: AGHT+IHmxsx0o80pnuJj9/k9kLlvfRI+o59HftfHPvK7D66nv8/92Ij2fTW6wz3vSj5DYuEbCOUVoQ==
X-Received: by 2002:aa7:d353:0:b0:606:bea1:1740 with SMTP id 4fb4d7f45d1cf-614f1dbdb07mr671692a12.30.1753431599508;
        Fri, 25 Jul 2025 01:19:59 -0700 (PDT)
Message-ID: <8f1d71c5-2c75-4d6d-85b2-25da79f47377@suse.com>
Date: Fri, 25 Jul 2025 10:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/credit2: factor in previous active unit's credit in
 csched2_runtime()
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com, gwd@xenproject.org
References: <20250621141411.890250-1-den@valinux.co.jp>
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
In-Reply-To: <20250621141411.890250-1-den@valinux.co.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------blLcpGx7aCKhMdURzXElWkZA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------blLcpGx7aCKhMdURzXElWkZA
Content-Type: multipart/mixed; boundary="------------4gx07TR5BAG505919hLP09IR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com, gwd@xenproject.org
Message-ID: <8f1d71c5-2c75-4d6d-85b2-25da79f47377@suse.com>
Subject: Re: [PATCH] xen/credit2: factor in previous active unit's credit in
 csched2_runtime()
References: <20250621141411.890250-1-den@valinux.co.jp>
In-Reply-To: <20250621141411.890250-1-den@valinux.co.jp>

--------------4gx07TR5BAG505919hLP09IR
Content-Type: multipart/mixed; boundary="------------RpViA18Olzq3WuxnJlg2n4Lr"

--------------RpViA18Olzq3WuxnJlg2n4Lr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDYuMjUgMTY6MTQsIEtvaWNoaXJvIERlbiB3cm90ZToNCj4gV2hlbiBhIHJ1bm5p
bmcgdW5pdCBpcyBhYm91dCB0byBiZSBzY2hlZHVsZWQgb3V0IGR1ZSB0byBhIGNvbXBldGlu
ZyB1bml0DQo+IHdpdGggdGhlIGhpZ2hlc3QgcmVtYWluaW5nIGNyZWRpdCwgdGhlIHJlc2lk
dWFsIGNyZWRpdCBvZiB0aGUgcHJldmlvdXMNCj4gdW5pdCBpcyBjdXJyZW50bHkgaWdub3Jl
ZCBpbiBjc2NoZWQyX3J1bnRpbWUoKSBiZWNhdXNlIGl0IGhhc24ndCB5ZXQNCj4gYmVlbiBy
ZWluc2VydGVkIGludG8gdGhlIHJ1bnF1ZXVlLg0KPiANCj4gQXMgYSByZXN1bHQsIHR3byBl
cXVhbGx5IHdlaWdodGVkLCBidXN5IHVuaXRzIGNhbiBvZnRlbiBlYWNoIGJlIGdyYW50ZWQN
Cj4gYWxtb3N0IHRoZSBtYXhpbXVtIHBvc3NpYmxlIHJ1bnRpbWUgKGkuZS4gY29uc3VtaW5n
IENTQ0hFRDJfQ1JFRElUX0lOSVQNCj4gaW4gb25lIHNob3QpIHdoZW4gb25seSB0aG9zZSB0
d28gYXJlIGFjdGl2ZS4gSW4gYnJvYWQgc3Ryb2tlcyB0d28gdW5pdHMNCj4gc3dpdGNoIGJh
Y2sgYW5kIGZvcnRoIGV2ZXJ5IDEwbXMgKENTQ0hFRDJfTUFYX1RJTUVSKS4gSW4gY29udHJh
c3QsIHdoZW4NCj4gbW9yZSB0aGFuIHR3byBidXN5IHVuaXRzIGFyZSBjb21wZXRpbmcsIHN1
Y2ggY29hcnNlIHJ1bnRpbWUgYWxsb2NhdGlvbnMNCj4gYXJlIHJhcmVseSBzZWVuLCBzaW5j
ZSBhdCBsZWFzdCBvbmUgYWN0aXZlIHVuaXQgcmVtYWlucyBpbiB0aGUgcnVucXVldWUuDQo+
IA0KPiBUbyBlbnN1cmUgY29uc2lzdGVudCBiZWhhdmlvciwgaGF2ZSBjc2NoZWQyX3J1bnRp
bWUoKSB0YWtlIGludG8gYWNjb3VudA0KPiB0aGUgcHJldmlvdXMgdW5pdCdzIGxhdGVzdCBj
cmVkaXQgd2hlbiBpdCBzdGlsbCBjYW4vd2FudHMgdG8gcnVuLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS29pY2hpcm8gRGVuIDxkZW5AdmFsaW51eC5jby5qcD4NCg0KUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------RpViA18Olzq3WuxnJlg2n4Lr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RpViA18Olzq3WuxnJlg2n4Lr--

--------------4gx07TR5BAG505919hLP09IR--

--------------blLcpGx7aCKhMdURzXElWkZA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDPi4FAwAAAAAACgkQsN6d1ii/Ey9+
HQf7B0UITMdHRcjdZ4TlHir7bFTDqyKrVENCHFZq8ceXqZya9x1iUP+8G3mJpKVLlvu8akjmucQU
TzwzpPov6VrHlrnEra0ozgz4vhOwOQyiVk3lkPWoCOoE8DuvH/YMBOx0gGAy49bgLNjCrvmwAghS
3abuty6iG2HHxBWB+lMfmt3/ObdYwG5/wIP/X5Dh8z77Kz4X3ZUsXLUTw3dK4wKvEOxeQiTz3D1p
AikeFvAGtW/WdsZoZO2N8XvcsCekR+MWguK4blr9VYxey++gOzJO8aX+cQtn+xW9/YwuYtUhMVf5
EqZF1USgwXHtAAnhfWriB1eWJiH4Ci1GxCHNPUfD7w==
=A8B+
-----END PGP SIGNATURE-----

--------------blLcpGx7aCKhMdURzXElWkZA--


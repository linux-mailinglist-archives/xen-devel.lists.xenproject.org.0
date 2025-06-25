Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABDAE8675
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024993.1400739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUR6n-0005nu-W2; Wed, 25 Jun 2025 14:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024993.1400739; Wed, 25 Jun 2025 14:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUR6n-0005le-TA; Wed, 25 Jun 2025 14:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1024993;
 Wed, 25 Jun 2025 14:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUR6l-0005lW-Ux
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:28:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a08de970-51d0-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:28:13 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451d54214adso11808715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:28:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:8746:1a00:ff67:e633:2aa8:93ba?
 (p200300e587461a00ff67e6332aa893ba.dip0.t-ipconnect.de.
 [2003:e5:8746:1a00:ff67:e633:2aa8:93ba])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8117187sm4624855f8f.101.2025.06.25.07.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:28:12 -0700 (PDT)
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
X-Inumbo-ID: a08de970-51d0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750861693; x=1751466493; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qw9S+X7qnN19jV+x7VJaMOPSM0RwFy5vyFi9AVqCGq4=;
        b=ciBZ+H2NGo+xcGut4oJ+02UqmJ9LsaKJv39MYAqNTlGG8n8oUHqHFn1oss0Nr/U23Z
         CfY4RyE2e0f8xIHVOlCuWU7Djr9oQKvidknUvkKuflDp1YJNyYdkwR3kF236CxAXbJ+e
         GDKbSqtitJMp8w5N52x3Q2z5ewhWGQt2SpSP2DJ0tuKFT6HbPqzXOd0v5k8IJf7n/Ggm
         5gzqyPA/vGg1bv0bHiG6W55oOqxslxPPyAC3kSpUlAh6MDo2rOzsLp9k53yWo57MXkyJ
         4TICB70T15jAcI4FUKGAg0oMIkiOcdRYQ+dUFAR4Z6kmrJZdFFVWuCYYxVZqWcutSr0V
         kzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861693; x=1751466493;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qw9S+X7qnN19jV+x7VJaMOPSM0RwFy5vyFi9AVqCGq4=;
        b=O/TgEH9dkMMvIx9FTXkVLSLMmfA8YHTduOFciRBjcudKpt9eHCRSxhtxAMvGDLJOK1
         UQUvLF5M/looRLkGcc8HjTiJpbtqkr64xH/EiNgpLEC5hqXCHHDJfzyvGy0PwoWftYsM
         9OTut6CAcVj2YFez3VgV2a8+huBcnclDDi2oXIQFrqOGSb+DXnV6WLyyWzIlJsuMKk/V
         V4s9do7ZB7EmSyTEDxe9eKbRPqpr3lPlaDp0ZvsV3fPtRrS67Gx4nqkhn9+2gIOF27//
         ICIothRwJZi4G399KGv/9je/o6sxtQGA7tpEiBr3+s9WstJR27N0wfYWXblVDvSnRdxG
         oekg==
X-Forwarded-Encrypted: i=1; AJvYcCU1jhJgmyJs/172H8Plc0Z6F47Ma7qLpwPeBTnY3xPMmoaIqAtUH+UFwuJe//WmtOutRBh9DZO7ikc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd993zCppJmd6rrQc6AGzvlP13fg4C8wLEp9qliACVUwQv5X9V
	le8i2DIG5XSL+UT8QzhKrMkMZhuyXG6Yg3S9k1oYUg2JKzXubdZMYUZ6tGufhgtZmWF3lutOchG
	Uljh3ppU=
X-Gm-Gg: ASbGncubnAGaoZTi0PNRuyiXwQ1IyoOQ1m7d2ZFhDU4OAZjy5JngZdW1jp1K2pY8ols
	AkY5E3Iz8IqSH0ZvtGDLGnQDmrNyFO91HIOhxB8W3d9336tQaxWGvpOIfNIIkeg6qG1OqkfqzDL
	dba/9YUCIUCzH0cWrup+TRloncU1EhMVW7Np4qaggiFU5KOkZAQgB1pc9/KpqBuUKCK55mpl5jM
	AVy09KC1T1qwOh0Z0hQCEXSx89oqZNALX4aK2adiQ64prjq282Zi4rxq/ixyyLOluqhcA/Zf8Qx
	XbM0c8d14mmw78khrTD4H8h8WCG6Qo6xsdS45MHOnfhYWZFLe7GaYNTs6on71k+Hh0ViN2LiXL7
	EZ0P82/koYFGgOKJKJSKi/gPnZxSlZNnznmFz6Cx8yIkAkyyOh/LN9OyGPEvzxb/SzKLN0+Ajm5
	zj2ZkVBMNhqk8=
X-Google-Smtp-Source: AGHT+IFi8xbdBn4Q/OQtDPIvwYsVnbfcBoQry3KfQ9qeYmrKsDasKnEl818iXs4xP9bUZUcyoXXW9Q==
X-Received: by 2002:a05:600c:3e87:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-45381aa4a74mr34947745e9.3.1750861693207;
        Wed, 25 Jun 2025 07:28:13 -0700 (PDT)
Message-ID: <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
Date: Wed, 25 Jun 2025 16:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20250625110843.24840-1-jgross@suse.com>
 <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
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
In-Reply-To: <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HEz1L8lF0CODSDdXSJOb0xlG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HEz1L8lF0CODSDdXSJOb0xlG
Content-Type: multipart/mixed; boundary="------------SdlYIbD1f6CwtfcK4p66slQ7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
Message-ID: <d18ab226-183c-4c3b-b0e8-6d2aaae953c8@suse.com>
Subject: Re: [PATCH] stubdom/grub: avoid relying on start_info definition
References: <20250625110843.24840-1-jgross@suse.com>
 <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
In-Reply-To: <b6fb9ba0-7d37-41be-ac21-70604739202c@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------SdlYIbD1f6CwtfcK4p66slQ7
Content-Type: multipart/mixed; boundary="------------MN8lH1EsB1dqeen9LADNKhNF"

--------------MN8lH1EsB1dqeen9LADNKhNF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDYuMjUgMTY6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wNi4yMDI1
IDEzOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTQzMiwzICs0MzEsMTAgQEAg
b3V0Og0KPj4gICAgICAgYWxsb2NhdGVkID0gMDsNCj4+ICAgICAgIHhjX2ludGVyZmFjZV9j
bG9zZSh4Y19oYW5kbGUgKTsNCj4+ICAgfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGNhbGxf
c3RhcnRfaW5mb19ob29rKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkNCj4+ICt7DQo+PiAr
I3VuZGVmIHN0YXJ0X2luZm8NCj4+ICsgICAgaWYgKCBkb20tPmFyY2hfaG9va3MtPnN0YXJ0
X2luZm8gKQ0KPj4gKyAgICAgICAgZG9tLT5hcmNoX2hvb2tzLT5zdGFydF9pbmZvKGRvbSk7
DQo+PiArfQ0KPiANCj4gTWF5YmUgYWRkIGEgY29tbWVudCBhaGVhZCBvZiB0aGUgZnVuY3Rp
b24gY2xhcmlmeWluZyB0aGF0IGl0IG91Z2h0IHRvIHJlbWFpbg0KPiBsYXN0Pw0KDQpHb29k
IGlkZWEuDQoNCkknbGwgYWRkOg0KDQovKiBObyByZWZlcmVuY2VzIHRvIHN0YXJ0X2luZm8g
b2YgTWluaS1PUyBhZnRlciB0aGlzIGZ1bmN0aW9uLiAqLw0KDQoNCkp1ZXJnZW4NCg==
--------------MN8lH1EsB1dqeen9LADNKhNF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MN8lH1EsB1dqeen9LADNKhNF--

--------------SdlYIbD1f6CwtfcK4p66slQ7--

--------------HEz1L8lF0CODSDdXSJOb0xlG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhcB3sFAwAAAAAACgkQsN6d1ii/Ey+e
ogf6AhUwS+4G4yPlmh8x7VLyEAv3XKGrob3ja/rpNp4DWm4vR3/v3NKOO4wBNNmDgSFTBup8T591
v2M7gwOqD8XSGcCzKNSEFhDExz/tJ7iW7i9mD+I7IpQRhG6N/BM+L3VT/JZYBbNSwsPVnFOewvc0
SGOXzEXeAc7WIK/NpsiV36zT5RoMseRkVjTJst3OUZEB1+6yOD3s+cozDxBt+JDvthoY0zoRhVkW
BGufCKMQtYTsRhqfhVavRz4G3YKXksJjNbMrH/KLtQ76dCXr7xE+vqPRKCE7WZHDweJK/6O6eUpN
FYM45H40qi/PRlpXVnsj2vOwfNrr3dpCnpK955EECA==
=QU7h
-----END PGP SIGNATURE-----

--------------HEz1L8lF0CODSDdXSJOb0xlG--


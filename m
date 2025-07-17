Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF565B08540
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046217.1416478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucINU-00014u-U9; Thu, 17 Jul 2025 06:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046217.1416478; Thu, 17 Jul 2025 06:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucINU-00013R-Q0; Thu, 17 Jul 2025 06:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1046217;
 Thu, 17 Jul 2025 06:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucINT-000126-PJ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:45:59 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acee0d31-62d9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:45:49 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so298266f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:45:50 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2087sm20132622f8f.30.2025.07.16.23.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:45:49 -0700 (PDT)
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
X-Inumbo-ID: acee0d31-62d9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752734749; x=1753339549; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mugpjxTTDUnotx+oJPLgwiNxSNM17Rc6XbwLaCrwnys=;
        b=HcGMnRob00aQldNqkBIVtZtnsXID81kkn3EhRDwWZ7ZWadYc6GwYcP8LbhGsNL5Fns
         Tg9oWpbGamv0QzmmmyZlsaQ6U10jMlzYRVzyW82vdfsQa4ce8Vc1+nqEc92l8Y4onamD
         JNIeGP7hSYGwkr5NfpQUMflO2OvuwYH8iLx0E5DE9vaU3+Y9oo3XaWySyIrVgZrRjxOC
         vWWfR9qNnmsVaR6OPSbIebG+io6lN3BZ5hKYwvVMJ+UDzO5grAucx7oj1ShP61h9ok89
         zk23QhMbzr+IywISDmAAWAxvEw7KMqzzzpqbmvTL4zR2MlSUbsxVm7tg1UO2svpfb4ai
         Bwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734749; x=1753339549;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mugpjxTTDUnotx+oJPLgwiNxSNM17Rc6XbwLaCrwnys=;
        b=ejXZgf6jxkdVx1NAu4LvHnyvN1dseP6p56Gl3Iy8meUmozDRUQYhstmt5WBWD/8t3A
         i1/A/GRDNszEpSNLmnqXjjIWj42LsgJGh0w7eTa6Nk4KovDCMEsHynhKvcwEjytZpgoA
         2b5u2dxkzp/fjkhTrLrv9nSrT3SA6+A7v4SCF/O0QPz//pwa6HITjBQmZXpIP78fmn2R
         PHkkD6ah9G1Ie1Nl/sGiPj97ayLXz9nGuEVzE06LzT3vLTEPpJ6RhHLOD3h8vyy4iM85
         ri7dAPnxrE9kCoNAoF7PiteuQjWigV0lwgP23RRCDDAojRgkc/2sgV5ync1VyUJNhOXK
         m/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWkPP0puwb4lqgSKHbfcjc57bFLeLEGnGEZW8LN3y8VpNby0gL5YtEhvdwbkOynAdWgCOIe5Eg3UDQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBLNK+RgFHmOpQyNxm+c87nZ6YBeqFXiQBmBPAaNM1WLZSPmup
	C1/fU5eftJKAxOUfk/Lf5IXYoHrrBDX3RJl4XXgEITqMUAv/jM75RkWCf7Lz1enc6Uw=
X-Gm-Gg: ASbGnctnjRPutSIA0ze+949/F6jQxjWmypqMvEhoSWvur2qdF+93U5x2mpkQMHYvNIn
	kv2US0f+xjhB0MFMHnvzsWANnPHSrf3FVD5hsveMAI2gawTw3NBxLBdCVf1uLesHCaI4laDaDxs
	kUVoGr/DYYl/RZ9uTczBwA6PzvCL8QeDv9BEbe7/sAZaIaoeCf2xvZZED2Q9SS9Bp6I5aFxuI0C
	03BtF9nbD0IkPGfrVgyV+Yjb7rHgiK3uoVskCvx10ibOVHei348KsHqjFGbQTlZuWHdCdyCdJ1q
	zKwxI0YLJAx3N5J3wIx9Sgdua41hVdvhI0KvTU8Vq4XAIPrEPywP6ecg4fPwN6aZV5o1ZwYKe8C
	U/dlgPjFkla194ZvtOW2jqow4LbS6cGiAGy8ESMBmAqZUo7PC/G3HeZ7S38YKnWbbZ8QRfIHwLq
	9G9rBjgTiZyc/4WL9KhEKGNjF6Wu/XDCCyQ7MPKTx97muJLgAX5CNEUDY=
X-Google-Smtp-Source: AGHT+IFwF1KFLJD2mUnwKrEB+mGaLMSh+pgCUaAxyVPH3orqi94fug/Kiv41JzOkTVTxOS9EYn5Wkw==
X-Received: by 2002:a05:6000:4406:b0:3a5:3b93:be4b with SMTP id ffacd0b85a97d-3b60e4d4d6dmr3233933f8f.25.1752734749415;
        Wed, 16 Jul 2025 23:45:49 -0700 (PDT)
Message-ID: <669ec249-7219-4024-911d-bd8d72af2649@suse.com>
Date: Thu, 17 Jul 2025 08:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Enable Xenstore-stubdom Live Update
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250702081305.14440-1-jgross@suse.com>
 <ec59afd8-93e6-418a-b6ab-0db87ac986cb@suse.com>
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
In-Reply-To: <ec59afd8-93e6-418a-b6ab-0db87ac986cb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------40bSMLc8M2B8G6k609z00bav"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------40bSMLc8M2B8G6k609z00bav
Content-Type: multipart/mixed; boundary="------------3AGtZtLTL3QzjSfBsGTc6Aik";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
Message-ID: <669ec249-7219-4024-911d-bd8d72af2649@suse.com>
Subject: Re: [PATCH 0/9] Enable Xenstore-stubdom Live Update
References: <20250702081305.14440-1-jgross@suse.com>
 <ec59afd8-93e6-418a-b6ab-0db87ac986cb@suse.com>
In-Reply-To: <ec59afd8-93e6-418a-b6ab-0db87ac986cb@suse.com>
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

--------------3AGtZtLTL3QzjSfBsGTc6Aik
Content-Type: multipart/mixed; boundary="------------pqBXPXKcvpZe9nx4G30bK3s6"

--------------pqBXPXKcvpZe9nx4G30bK3s6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMDg6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4wNy4yMDI1
IDEwOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2l0aCB0aGlzIHNlcmllcyBhcHBs
aWVkIEkgd2FzIGFibGUgdG8gcGVyZm9ybSBMaXZlIFVwZGF0ZSBvZiBYZW5zdG9yZQ0KPj4g
cnVubmluZyBpbiBhIFBWSCBzdHViZG9tLg0KPj4NCj4+IFRoaXMgc2VyaWVzIGlzIGJhc2Vk
IG9uIGEgcmVsYXRlZCBNaW5pLU9TIHBhdGNoIHNlcmllcyBBTkQgaXQgbmVlZHMNCj4+IHRo
ZSBNaW5pLU9TIGNvbW1pdCBpZCB1cGRhdGVkIGFjY29yZGluZ2x5IGluIENvbmZpZy5tay4N
Cj4gDQo+IEkgd2FzIGFib3V0IHRvIGNvbW1pdCB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgaGVy
ZSwgYnV0IHRoZW4gd2VudCBiYWNrIHRvDQo+IGNoZWNrIGhlcmUuIEFpdWkgc3VjaCBhIHBh
dGNoIHdhc24ndCBzZW50IHlldCwgc28gSSBuZWVkIHRvIGhvbGQgb2ZmIC4uLg0KDQpJIHdh
cyBhYm91dCB0byBzZW5kIHRoYXQgcGF0Y2gsIG5vdyB0aGF0IHRoZSBNaW5pLU9TIHNpZGUg
aGFzIGdvbmUgaW4uDQoNCg0KSnVlcmdlbg0K
--------------pqBXPXKcvpZe9nx4G30bK3s6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pqBXPXKcvpZe9nx4G30bK3s6--

--------------3AGtZtLTL3QzjSfBsGTc6Aik--

--------------40bSMLc8M2B8G6k609z00bav
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh4nBwFAwAAAAAACgkQsN6d1ii/Ey8I
sQf/aVVK2irM6GBB3UictykiPvjUS6xFTE8gu9ka2n+Q0cLTLcHcDW4SvnWH8jU3ZFXSAb+8/XbJ
SQvE1rdZAMojVu71QBuXrnSUbN4DV17JrZTTrRSuBNpEIKS9kRVG2HH+10Tv2L0TgZWH5qegTIbu
vc+v1QtEtzKL6QSFkB3vjJ6PZBk1KME9sbfJBlfHuPsJHQCIZfTu1xXBeU759S5ztG76MK/YKkZR
6v9GMa1QO2SFCyQDQHUuOGhQwBLZ9jGBxoTozh2/Slpzt+jjLvFY2jHnThMM2MYD6noUHjWXTSn7
84dSq8XPdYEIEf7bEfNPhp8H6ALb1+H8APA8iXYBXw==
=gF1X
-----END PGP SIGNATURE-----

--------------40bSMLc8M2B8G6k609z00bav--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B038A4F9FB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901953.1309960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl2F-0008Qz-6g; Wed, 05 Mar 2025 09:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901953.1309960; Wed, 05 Mar 2025 09:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl2F-0008PE-2s; Wed, 05 Mar 2025 09:27:27 +0000
Received: by outflank-mailman (input) for mailman id 901953;
 Wed, 05 Mar 2025 09:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tpl2D-00080b-RI
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:27:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c869898-f9a4-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:27:25 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac1f5157c90so281028866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:27:25 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1f6a3769bsm243830266b.14.2025.03.05.01.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:27:24 -0800 (PST)
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
X-Inumbo-ID: 0c869898-f9a4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741166845; x=1741771645; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3HFsutJ7BhizMyQ2oedkF4m7Xtbz5yulaLfNy0pKilk=;
        b=ekBHfnnTxVGf71FQv2gJbDIyFaQklxVF4ZFIDx7qIyO18TxwKkolFw/qxdMq+A1SF0
         tuRpWruLJ0I2g1apTUumdlTlJmW8MnpZ4jM9qQOxYziegNtduYc7+OnYy40v0pWxvLt1
         Q0BQcIMFDQRTmsuEOlnI2s2ii/3K9P1nCvpP0VJqqO4E3RacfWW/TCAf1FfEbkEAVVSc
         ow6DhJkh9BtGgQaqbH/WEAPWKwDxUBkvQkXGB81k9xy3Ec7d1iI5TAGZi0qhqgLYLoqN
         3RB0vLzaG6NuAx2drkWi8OS+su/uRb+Ni9TBKyh80yjY1ECJYNqtWAXQCG70/ttKBENV
         xrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166845; x=1741771645;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HFsutJ7BhizMyQ2oedkF4m7Xtbz5yulaLfNy0pKilk=;
        b=Zxdq6T7OEaVNiX+eVYwOoqAiDVCN7SiQu9nOeAqvjT7SoJhjCaqcGXk6ObpoeoiDpY
         T/pEc6n6NptsGpIqjO4IUelNCeUBvlenn7oE3kwpgKQHzveGHPKQfu2cUJ+bCDPoBfrS
         PTkskgPuROtytEkiK/Pq5GK4Bg1hyU96QfesFbox/DnhVGYwRodE2OBCitBin95BMU/g
         1uMZQujPt/dLajFH/ZG6eyCJo94LM5AMl9tRPWZ2+oQz2McAj8ZeXOdxqMrvew9Rj6aX
         rIW8cD4krK9CkF/pcz3tXkg1UucJFvMJPrLrkiVicqc0PqvuxJNcVwhps/bxGmSJFdVd
         n3FA==
X-Gm-Message-State: AOJu0Yy4ypzRLBPiUy9JJXxugMr1LFDDd0S8JmsiRf1dZv6kaDqqOx0G
	r0CAcli+kjbAPY72z/bQOnWaAdN/affi4RLGsDVBHfbVDlgcwty+dlqJ58xQnFwewW6nHvikBl2
	aj7Q=
X-Gm-Gg: ASbGncv2i7Ov+D2jY+xKihFdjUjQduR+p7+RBK9qebBb0PtN8nDcKAdeWRhQRkdn3MQ
	fNWKx1NfFqPBcEQs1XsbmBvT11hoVCEy7wiSXQ5kE03oRhqp/9p/wpa+lauOMH+MGJtIpna26TP
	gXiuM2fOwNI5zL9B4xyvRFvZPoY35A+945MM+D3XmHEkvVcQE/danoQSscCHw1iKWUaoDEGomjN
	oTsH7D1qHgzPPK1fyUY5GfCMPr9p6SCnjsio/qK3B8HFNoTTEZLF8a4RpEttXRfPk9+50t1rw9K
	TJMHe2kqeZwJLUTPb8W57NSAmQ9bPqo94n03nuXkm3E12AP4Emp03AanXGQn2E8xauPMcTyOxvg
	+4dp5+5SQB5Ii4hSLc1Xj2Y7tYHONVpqcTEE+iQ4hxHcZ22jp2/270kRqYUcpBh6kY5M=
X-Google-Smtp-Source: AGHT+IFkvUmWED5D/Ixj3Zs9cs+dIaEMxtDGp/7mgoNvO2Zg4QoXTPYDk3EQ7hquBS11hf+SogZByQ==
X-Received: by 2002:a17:907:72ca:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ac20dd078aemr257312766b.44.1741166844657;
        Wed, 05 Mar 2025 01:27:24 -0800 (PST)
Message-ID: <f1f9ef43-ca01-4b69-ba04-696f53e4a990@suse.com>
Date: Wed, 5 Mar 2025 10:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: remove some unused defines from xs_wire.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20250305085646.26472-1-jgross@suse.com>
 <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
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
In-Reply-To: <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pLh6NCxfM9IXrqmzNhco2aTu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pLh6NCxfM9IXrqmzNhco2aTu
Content-Type: multipart/mixed; boundary="------------M00rU0a0Qq9cKIoEgJX6VW64";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <f1f9ef43-ca01-4b69-ba04-696f53e4a990@suse.com>
Subject: Re: [PATCH] xen/public: remove some unused defines from xs_wire.h
References: <20250305085646.26472-1-jgross@suse.com>
 <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
In-Reply-To: <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
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

--------------M00rU0a0Qq9cKIoEgJX6VW64
Content-Type: multipart/mixed; boundary="------------nowFI3hcCvBMMPQF0ao8bQ3o"

--------------nowFI3hcCvBMMPQF0ao8bQ3o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDMuMjUgMTA6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wMy4yMDI1
IDA5OjU2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4geHNfd2lyZS5oIGNvbnRhaW5zIHNv
bWUgZGVmaW5lcyBYU19XUklURV8qIHdoaWNoIHNlZW0gdG8gYmUgbGVmdG92ZXJzDQo+PiBm
cm9tIHNvbWUgZGVjYWRlcyBhZ28uIFRoZXkgaGF2ZW4ndCBiZWVuIHVzZWQgaW4gdGhlIFhl
biB0cmVlIHNpbmNlIGF0DQo+PiBsZWFzdCBYZW4gMi4wIGFuZCB0aGV5IG1ha2Ugbm8gc2Vu
c2UgYW55d2F5Lg0KPj4NCj4+IFJlbW92ZSB0aGVtLCBhcyB0aGV5IHNlZW0gbm90IHRvIGJl
IHJlbGF0ZWQgdG8gYW55IFhlbiBpbnRlcmZhY2Ugd2UNCj4+IGhhdmUgdG9kYXkuDQo+IA0K
PiBIb3cgc3VyZSBhcmUgeW91L3dlIHRoYXQgdGhlcmUgYXJlIG5vIG91dC1vZi10cmVlIHVz
ZXMgb2YgdGhlbT8gVGhleQ0KPiBhcmVuJ3QgaW4gZS5nLiBhIF9fWEVOX1RPT0xTX18gcHJv
dGVjdGVkIHJlZ2lvbiBhZnRlciBhbGwuIChJIGRvbid0DQo+IG1pbmQgdGhlaXIgcmVtb3Zh
bCwgYnV0IGluIHB1YmxpYyBoZWFkZXJzIEkgdGhpbmsgd2UgbmVlZCB0byBiZQ0KPiBkb3Vi
bGUgY2FyZWZ1bC4pDQoNClRoZSByZWFzb25pbmcgaXMgYWxsIGluIHRoZSBjb21taXQgbWVz
c2FnZTogdGhvc2UgbWFjcm9zIGhhdmVuJ3QgbWFkZQ0KYW55IHNlbnNlIHNpbmNlIGFnZXMu
DQoNCkluIGNhc2Ugc29tZW9uZSBpcyB1c2luZyB0aGVtLCB0aGUgdXNhZ2UgaXMgZWl0aGVy
IHdyb25nIG9yIG5vdCByZWxhdGVkDQp0byBYZW4uIEkgaGF2ZSBjaGVja2VkIE1pbmktT1Ms
IFFlbXUgYW5kIExpbnV4IGtlcm5lbCBmb3IgdXNlcyBhbmQNCmRpZG4ndCBmaW5kIGFueS4N
Cg0KDQpKdWVyZ2VuDQo=
--------------nowFI3hcCvBMMPQF0ao8bQ3o
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nowFI3hcCvBMMPQF0ao8bQ3o--

--------------M00rU0a0Qq9cKIoEgJX6VW64--

--------------pLh6NCxfM9IXrqmzNhco2aTu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfIGPsFAwAAAAAACgkQsN6d1ii/Ey+5
dAf/fCHCQH0CmLTpnnH+vV55fBwEykt/pPy1U4mkAXNn+kLxlNh3SLBbPWJDn+37Zr6R/19g5mUV
tCpuEyfTIFmHAwFKzgA780qsA1s9n4HA8GaeQAWizQgWq1CT/Pd4tuUvfzDTIfgaCbuCBZmFH33k
5c+ITdFUFlxlbdV3t00XrLoWlUqlT3QIJqzpPNYLtwk2ZuDqqe0ROF3zLu3DYOlUlVCAHrk+J5Qc
T6AOf8xlBlk3D73Q8c3u/e5W1KS9GGfKtYu1Xnuofv64mzkBWY/pT7ogKFZXfbPteRiVoIuOVIIa
nFDbO/OhoIJKfwjr4FIoJ5F/88gwk7rUHNPcWfeURw==
=qkRK
-----END PGP SIGNATURE-----

--------------pLh6NCxfM9IXrqmzNhco2aTu--


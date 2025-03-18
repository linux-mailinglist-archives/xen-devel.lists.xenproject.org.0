Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF4A66C38
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 08:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918565.1323208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRak-0000hd-E9; Tue, 18 Mar 2025 07:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918565.1323208; Tue, 18 Mar 2025 07:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRak-0000eY-AU; Tue, 18 Mar 2025 07:42:26 +0000
Received: by outflank-mailman (input) for mailman id 918565;
 Tue, 18 Mar 2025 07:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tuRai-0000eQ-Mp
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 07:42:24 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a12299-03cc-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 08:42:23 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so4192689f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 00:42:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df35ecsm17469306f8f.16.2025.03.18.00.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 00:42:22 -0700 (PDT)
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
X-Inumbo-ID: 87a12299-03cc-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742283743; x=1742888543; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1qelo60h3DD4suB1+dyfFkkmzSuK9XfyoEODpUP8ec=;
        b=RwV+44+Ba3pzJizLdbEU093sHWWF2PvMeIKtAOdUlq0SJhUrz9VEmOoy5pPOWjSXIH
         B0gOa4ohPVrYfMKPQLG9aYM8efCDtG6dj6f2mFM74khLMQhYHDkizPUj9bf2R2vQ8uS2
         HhLkuCXaj57m2vkPLk6dgiFitTE/VgfmWM/n+yPOoBMZc9wtc0KcNRp0UoeXrB9cQK5v
         0NCNgWTxz2sUruW5BdHM8f/HvZ/L7IUBL+U5/4syfVLX6Eqz8TvN03hR1Eh92KXp8PO5
         fKeXpNqSofLc/60UkqG+0x0dwJLrmu/mTiW+CyxiZ4iTaLTXG+dv8eixLeK4++/iJ05e
         JB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283743; x=1742888543;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1qelo60h3DD4suB1+dyfFkkmzSuK9XfyoEODpUP8ec=;
        b=f7mY2Zs6LY32bZqhMvw6nqGYci2qOIJ1QlYl2lUoWK8aOMXjNU00wZ3zUXNDWJ/v7s
         3WbRxZWAr6oOmO2nS+A/NEfSqsT8IZlKX9wnEnWtOdkk8A4ipaZSVZheWwA5Sa/kaIy9
         Nj3nJmVvygx5TYnIfKWQwQTHoI6dj0LaTPX4jYY/LI6s1aKBeOoCMP/eO5eoX2kTRrjD
         d6xR3CYkkiFi0xwYehtkrCP2ElbkGW8zqdudQIQo/iIPxgzTvB9oG8Savq0DcGGQgWeY
         OTLjm5kh9ajASXP2FUagi4GPsFEcQqMj3O3+nm21WkP2lhUc67x9K88rxZ0MDnekv3JE
         cbxA==
X-Forwarded-Encrypted: i=1; AJvYcCU/6ADl9IHDnKqRDEvP1bUMBM318XMgNjGgVaQwRQl9hJ5wh6BFo99B3T3/s4dKa28tJLM/9mVrAzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjU5D1dNvdzdIlOr4G/u9KrJUACI25Lt4fOM5DQc3t3WMapyIF
	O9fDDNaC4PZaeqhGZFAIyYewy4aJOF4w/j9FvipkgnRNR+2kAv2xXaYoyRKgwsg=
X-Gm-Gg: ASbGncsrOD96qFHD26W4QokOxG44ykinBgUD3L1e12FPD23LT1hSNVta2KkyXgn6xpz
	rrfU4h7oKBwbkozbIULiO0so3u7WmYJNSgsaJY8oZh0xziRitgAvDKs61m5W2vurjbCa6Zi9J3H
	BO3Z+lbCpp2+N/oBZX3VKgJpellSb8JfIC9e7keaXOC0TDfNlNQUPE0S6KxLlrjdMYBYudukRy8
	xbzpuKrmy8gaCqZrFlUNUFTup+T6406o5YykTBAhP+FsBeCQ5Qp88Rm7nhmkL2Y2wh0LhnuhDTC
	2gbYyUllY9w8eAoVr6qtHjqWI2MhST7nBt8QNE+2IMLmfqARvXcTjkQWoB6JuJoZ9V/n0WvjTsL
	DRCHsAkR3T/C7AnnipDn1P0CavVvg1HGJTE9z3fUGo5YMllM/vr1YzSjrY/xs61cnVDEp6g==
X-Google-Smtp-Source: AGHT+IFUiuxcCG3P9IYnpXN+3vSjTofrOhitYfclw1P0/fc1BHE/QyRdX6OJGlkOYbL5bS0jLmkXxQ==
X-Received: by 2002:a05:6000:2ce:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-3996b49976bmr2374039f8f.39.1742283742760;
        Tue, 18 Mar 2025 00:42:22 -0700 (PDT)
Message-ID: <735dd1b8-80e3-4748-b96d-e30cfe6943ac@suse.com>
Date: Tue, 18 Mar 2025 08:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arinc653: call xfree() with local IRQ enabled
To: Anderson Choi <anderson.choi@boeing.com>, xen-devel@lists.xenproject.org
Cc: nathan.studer@dornerworks.com, stewart@stew.dk,
 matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com
References: <20250318073415.6652-1-anderson.choi@boeing.com>
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
In-Reply-To: <20250318073415.6652-1-anderson.choi@boeing.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0HIWA5wd0C1C3kzs4GqKDkZI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0HIWA5wd0C1C3kzs4GqKDkZI
Content-Type: multipart/mixed; boundary="------------BCr8OypxII26vSkmtbMqTPTd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anderson Choi <anderson.choi@boeing.com>, xen-devel@lists.xenproject.org
Cc: nathan.studer@dornerworks.com, stewart@stew.dk,
 matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com
Message-ID: <735dd1b8-80e3-4748-b96d-e30cfe6943ac@suse.com>
Subject: Re: [PATCH v2] xen/arinc653: call xfree() with local IRQ enabled
References: <20250318073415.6652-1-anderson.choi@boeing.com>
In-Reply-To: <20250318073415.6652-1-anderson.choi@boeing.com>
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

--------------BCr8OypxII26vSkmtbMqTPTd
Content-Type: multipart/mixed; boundary="------------bH0BO1nO0LsXHPgQQkSr7vvc"

--------------bH0BO1nO0LsXHPgQQkSr7vvc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDMuMjUgMDg6MzQsIEFuZGVyc29uIENob2kgd3JvdGU6DQo+IHhlbiBwYW5pYyBp
cyBvYnNlcnZlZCB3aXRoIHRoZSBmb2xsb3dpbmcgY29uZmlndXJhdGlvbi4NCj4gDQo+IDEu
IERlYnVnIHhlbiBidWlsZCAoQ09ORklHX0RFQlVHPXkpDQo+IDIuIGRvbTEgb2YgYW4gQVJJ
TkM2NTMgZG9tYWluDQo+IDMuIHNodXRkb3duIGRvbTEgd2l0aCB4bCBjb21tYW5kDQo+IA0K
PiAkIHhsIHNodXRkb3duIDxkb21haW5fbmFtZT4NCj4gDQo+IChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gKFhFTikgUGFuaWMgb24gQ1BVIDI6
DQo+IChYRU4pIEFzc2VydGlvbiAnIWluX2lycSgpICYmIChsb2NhbF9pcnFfaXNfZW5hYmxl
ZCgpIHx8DQo+IG51bV9vbmxpbmVfY3B1cygpIDw9IDEpJyBmYWlsZWQgYXQgY29tbW9uL3ht
YWxsb2NfdGxzZi5jOjcxNA0KPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqDQo+IA0KPiBwYW5pYyB3YXMgdHJpZ2dlcmVkIHNpbmNlIHhmcmVlKCkg
d2FzIGNhbGxlZCB3aXRoIGxvY2FsIElSUSBkaXNhYmxlZCBhbmQNCj4gdGhlcmVmb3JlIGFz
c2VydGlvbiBmYWlsZWQuDQo+IA0KPiBGaXggdGhpcyBieSBjYWxsaW5nIHhmcmVlKCkgYWZ0
ZXIgbG9jYWwgSVJRIGlzIGVuYWJsZWQuDQo+IA0KPiBGaXhlczogMTkwNDlmOGQ3OTZhIHNj
aGVkOiBmaXggbG9ja2luZyBpbiBhNjUzc2NoZWRfZnJlZV92ZGF0YSgpDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZGVyc29uIENob2kgPGFuZGVyc29uLmNob2lAYm9laW5nLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2Vu
DQo=
--------------bH0BO1nO0LsXHPgQQkSr7vvc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bH0BO1nO0LsXHPgQQkSr7vvc--

--------------BCr8OypxII26vSkmtbMqTPTd--

--------------0HIWA5wd0C1C3kzs4GqKDkZI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfZI90FAwAAAAAACgkQsN6d1ii/Ey/w
0wgAgTw6JJ3ZBVho/cXc1EH0yhgqJRcGg7EnvpOk1guKIaOEuzL/rzfj7h0jnuAn7az0gzV9itfm
rnUkg3ahRcZMi8N1GJo1pb6lKjGp09M/j98h2KIMOgjPFCnYWtJ8JSB25TCVRElCbB4OZUahoWzm
WaSszdAzaS/07yFY8s3xaSxlh3/xCFaqFO1UlFcCEhFKeZewBOnYda7IGfLeNqf09MItRAvbMrSq
VU8nC6wm9c0TNPCflBbiGGMBL25MzKKn53BQv5MqdqzuIJR221KOepeHpBfiR9NbF6unnnPCZx50
4ay6uJpqO4vcbXF/lbulRxh35w4pVSj5wtTbitidBw==
=462G
-----END PGP SIGNATURE-----

--------------0HIWA5wd0C1C3kzs4GqKDkZI--


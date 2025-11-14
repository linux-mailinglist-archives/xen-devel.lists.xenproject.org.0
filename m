Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F23C5C9AE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 11:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162413.1490068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJr8K-0000NI-Hy; Fri, 14 Nov 2025 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162413.1490068; Fri, 14 Nov 2025 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJr8K-0000K7-Dd; Fri, 14 Nov 2025 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1162413;
 Fri, 14 Nov 2025 10:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJr8I-0000Jx-RG
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 10:34:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b651152-c145-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 11:34:21 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b727f452fffso474476866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 02:34:21 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809d2sm360738566b.42.2025.11.14.02.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 02:34:20 -0800 (PST)
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
X-Inumbo-ID: 7b651152-c145-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763116461; x=1763721261; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zg0HiBDncMCTVU0rpTCAZdHLTsT/iB7DFrfe7KE75z0=;
        b=SafpMpCZoWRErUSY+dK5T6zSvhKYmnuRug71c+cNJvPVRNQRy5NAxTk9yQTzoJIW4+
         hwxW3981Ka1eEYx2BIGxY5VwPVSoKXS2NWUgky9OU2QS5rDAv64ppft9Ncv6aJy4rntG
         tTIttPwFaQX8uIsDuUEIdfKFw4AAqTZCdbO/anpJWvji/fUvzwVTbh8Cw7XcPydJ33bQ
         SqFByo+kHssZGV5Hr6FIGO0L3NcvXGa46o8vmRt+n+rHxnS9qEZ4YAdxXtnmw9bQ9mNm
         g51RA3jepITRG/1iEe0s8Xfu7fz63hQHs2fccU/PjXyrfjB7ESJ3yPZg8MIEf/+90w+a
         7ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116461; x=1763721261;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zg0HiBDncMCTVU0rpTCAZdHLTsT/iB7DFrfe7KE75z0=;
        b=soXROJP4BM4BAweoLXrvKmxq7Usq9HGtrnb7BLN0vX2ligMnlOjIqq2gBOn0QmBEUX
         x+RWNWxM01cHY3p7Cl4OVA5pnP/2jTNP+25NcfXfZUva4N6fCVqON1A8J4ghCCGQ/CJE
         qNkJb57WY9WqIDinWjKaoBSwLD9H0dX+bHau2LoofDubBc0IByKCdBTU2RUZPIzWj/CW
         lvbWYFX9SkH3JEQLN2stPb8c5AfIcTEN82RwjmSop5TeIZq/KiblClKnypPZWRQ2RkJV
         tDBc7DJqKJV3Hd5QVOkzfeGmIUqcDtJsZNIzBSKiHIL3lCh/GXGF8H/SR1ytCGVxrkWM
         LwHw==
X-Forwarded-Encrypted: i=1; AJvYcCWwCLixjeZY4uxNSTNq5MHXFmEhvaVajwj6WTh8EnTjkLRLX18CLLhVqnuNVtuNUwJ5Bf+9/C8PXgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3j7lFVIISEOJr6tJn7owkZnJyZO1Ger40RETWgpuBJuRYVwUH
	FC1fTbg7sR3aDwze1SlRoLMAZhyuUF9gpIo4BU1X6xo1rj6mjq0CJ7lQ2mBrzT6qxio=
X-Gm-Gg: ASbGncth4ZYRfSDzx2TSne7DFW60rr9FJlY1iyJu3q4ebeEBdVzeUkWbVl2R4WfOaxJ
	aa9pMW2mu1OUyH3qmpaHhblb2SFvzZPbbJAGLwg7L9fCodIpuTIkMoQwX2rYSNqVkseILGrCgN2
	nX7puDV8GLcYtAdbc9K2Tfnf0HUDc2lAREelQr5hgxtMHrni9c4nRaZdNRSLc3XDk7yzAjNrN7h
	0GkW0Oi/TwPEJFbBAlvQi7c8AloTo9vw7ylOw0SaePOPEgy2gVS82Xme1d9XHT3hG7Gxum2k2Pv
	gei76o1Ujxgg5SQElIi2kovfCFkuORDZB6UeB63K5Rnhs02UKJWuM80xPTsWmdoMVTqQt3nVjSz
	t3h53sbRVxx/RHa8t5D702TJIPgDC2yVQb+WMeFFR63vnlFoeFjSlPt3uiOvuhePRWN/QOCCVpx
	r7Jlrcw0j5bkabnCVx9aF8jU6n+mdVdj/78rZt4U0QhrUYvrkqZkngjGIa2ORicTLOJtUfme87Z
	o6HCuI1UB+lPNOOrjoeyEejK824NPQmnK9jhBM=
X-Google-Smtp-Source: AGHT+IFJdOlEUK8TzwBE+FtsL/uI9X7qMbLq3CZzC7I6xuGVUwWsRDsytGZbNypxwsRNiJEt578SFg==
X-Received: by 2002:a17:907:6d06:b0:b4a:e7c9:84c1 with SMTP id a640c23a62f3a-b7365749f00mr315514666b.7.1763116461069;
        Fri, 14 Nov 2025 02:34:21 -0800 (PST)
Message-ID: <6e5267ef-f2d8-4a59-b3d0-63a478963803@suse.com>
Date: Fri, 14 Nov 2025 11:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
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
In-Reply-To: <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XiCnquZ90YnCqcD09Jf8tXHj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XiCnquZ90YnCqcD09Jf8tXHj
Content-Type: multipart/mixed; boundary="------------nm9uwfWCEsu81WLQ6t5mpIN0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Message-ID: <6e5267ef-f2d8-4a59-b3d0-63a478963803@suse.com>
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
In-Reply-To: <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
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

--------------nm9uwfWCEsu81WLQ6t5mpIN0
Content-Type: multipart/mixed; boundary="------------YugdIafSZ0KuW30x07kMKt36"

--------------YugdIafSZ0KuW30x07kMKt36
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjUgMTc6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMS4yMDI1
IDE3OjE5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvY29uZmlnL1BhdGhzLm1r
LmluDQo+PiArKysgYi9jb25maWcvUGF0aHMubWsuaW4NCj4+IEBAIC0yMCwxMCArMjAsNyBA
QCBsaWJleGVjZGlyICAgICAgICAgICAgICAgOj0gQGxpYmV4ZWNkaXJADQo+PiAgIGRhdGFy
b290ZGlyICAgICAgICAgICAgICA6PSBAZGF0YXJvb3RkaXJADQo+PiAgIG1hbmRpciAgICAg
ICAgICAgICAgICAgICA6PSBAbWFuZGlyQA0KPj4gICBkb2NkaXIgICAgICAgICAgICAgICAg
ICAgOj0gQGRvY2RpckANCj4+IC1kdmlkaXIgICAgICAgICAgICAgICAgICAgOj0gQGR2aWRp
ckANCj4+ICAgaHRtbGRpciAgICAgICAgICAgICAgICAgIDo9IEBodG1sZGlyQA0KPj4gLXBk
ZmRpciAgICAgICAgICAgICAgICAgICA6PSBAcGRmZGlyQA0KPiANCj4gUXVlc3Rpb24gaXMg
d2hldGhlciB3ZSdyZSBtaXN0YWtlbmx5IG5vdCByZXNwZWN0aW5nIGluIHBhcnRpY3VsYXIg
dGhpcyBvbmUsDQo+IGZvciB0aGUgKi5wZGYgd2UgY3JlYXRlLg0KV2UgY291bGQgYXMgd2Vs
bCB1c2UgZG9jZGlyIGZvciBQREZzLCByaWdodD8NCg0KSW4gY2FzZSB3ZSByZWFsbHkgd2Fu
dCBwZGZkaXIgbGF0ZXIgd2UgY2FuIGVhc2lseSByZS1hZGQgaXQuDQoNCg0KSnVlcmdlbg0K

--------------YugdIafSZ0KuW30x07kMKt36
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------YugdIafSZ0KuW30x07kMKt36--

--------------nm9uwfWCEsu81WLQ6t5mpIN0--

--------------XiCnquZ90YnCqcD09Jf8tXHj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXBawFAwAAAAAACgkQsN6d1ii/Ey+X
LQf+JTNWbLD7kBDv5JX/YmevC3W8G61V9FFHWAIMicMzn2oqLoQ0gNQZ/UNw+RavmtJjD+37Mog9
Y3XeyFSootUT7/NgkqrfmKHNqkzaaRikQ9yvZ5IhlkkybI+0RUfcr/RPNpaocTf1M131ssLGv2ml
FsgFqur6++xHOUzgVqMmIJGUaZJ/X67RAefaF4NXmYIPjC7oSznEs7eKcqBxEvXBTK+ghueRzpg2
/FecttjGUjAu5ctKJaJhUTolbRVZtSQ3EROFY6WRaiHYmLMjSCLL1SxdIXRy70ehkN2OcyvhHVgk
VQj7poNjCfkWDe7g7Wj9hm5Cn8YFkMa1lPr+4PtEEQ==
=i4bS
-----END PGP SIGNATURE-----

--------------XiCnquZ90YnCqcD09Jf8tXHj--


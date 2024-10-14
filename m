Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FA99C7F8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 13:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818631.1231948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Ipq-0007r1-JB; Mon, 14 Oct 2024 11:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818631.1231948; Mon, 14 Oct 2024 11:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Ipq-0007nq-Eq; Mon, 14 Oct 2024 11:01:58 +0000
Received: by outflank-mailman (input) for mailman id 818631;
 Mon, 14 Oct 2024 11:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pOqc=RK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t0Ipo-0007nk-DF
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 11:01:56 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b975b1d1-8a1b-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 13:01:55 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-431195c3538so27957225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 04:01:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7ef598sm11047296f8f.104.2024.10.14.04.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 04:01:54 -0700 (PDT)
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
X-Inumbo-ID: b975b1d1-8a1b-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728903715; x=1729508515; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=04mKF5lAhJJQ4fjVIIo7qqRP97sylIwR4SEge3NJB7M=;
        b=DapK+UQCaMv0zlhosFk8RzWmdwGgquaZPysEUcl4HS2LFuevEiw1kaM0xBPs7AnBfd
         JEBHPHzwDZLjaq7BgA3ujF83vTbNEdpRZQoF3zyH64O9D4lxVORet89bRi3nYMORljZ0
         UJtfqeHbp2EoJh0Rbqxw9fmHAMghx9rDn8Nu8W1jlOHup4oH75pfwZvpqXiX27BJspHr
         TnKMXUKyDWkCZeeiX7V23NTflL/g5n4jNEbX86dujzcFMX9i7eaHxqee1IyMxdVLBTXH
         VkA6LXtWWa9GEgcaLaNwV7Zh5CX362NeEAxRQB8Tj4LDd7HWK84kdIsQN78x3nKeucEe
         neKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903715; x=1729508515;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04mKF5lAhJJQ4fjVIIo7qqRP97sylIwR4SEge3NJB7M=;
        b=GdKfmHz1GwS8zrup58z0g8Z/ra1vTiPU1lmnSDBoZ74ztgsAiLrAxQ4vX2jlmh2/2W
         JGyOehtzIEyXTjVYaTMY2WPIo9vZNFnS5CTP9OrBUi+PEj4efTul3kuKPWFYE+aJCxzs
         x/rozGLpLS5EUhRmLMRuFD9SYaYaL21GqP8+uriGS1ibakh3IIpo0mAgXpdXE/rncbgP
         lqm2FwvpEBiaINY2owa+1NKaX7c34f9aJiEzONcVL6UoM5eUQeANcqxW6MuGmX/DfgMM
         pDsXAWuHlpes7UNwGMfzan2NHAKG9sx9gBnVf58xM62HpimfMeZJkMPQAON6mR6RdF9V
         JueQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBKh1XGvNrGIj6+KGHUsq3l3dwzJ2d71m3lMCY0iFNX7u6ZXeVr/QmfzdCWFsmnbfvjSLb9t+qwZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtKfKlcPqG+GQGqMorpia3DjV5De0SyK80Ynxb1fiPctcT97UG
	0mp8PHEeymJgTIm4hIT+BckZMMoDlQLbs86JFaZPscXkI8Zt3ug1fz6twXhkvUiQ5hRsHbDgyGY
	p
X-Google-Smtp-Source: AGHT+IF5px/Op7yeM3wbdLPw9HDXgnjZ3k9A3UFTJecCjRMG5BmjmzxYjY2LXPBzqHDIpcWQ/qxuvQ==
X-Received: by 2002:a05:600c:3ba0:b0:42f:310f:de9 with SMTP id 5b1f17b1804b1-4311deebe1dmr83294365e9.15.1728903714369;
        Mon, 14 Oct 2024 04:01:54 -0700 (PDT)
Message-ID: <370e7307-6698-4195-a703-76542bccd60c@suse.com>
Date: Mon, 14 Oct 2024 13:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: add comments regarding interface version
 bumps
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241014103311.31272-1-jgross@suse.com>
 <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
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
In-Reply-To: <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ua0YLV8JMnagrm7om7U9x6QF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ua0YLV8JMnagrm7om7U9x6QF
Content-Type: multipart/mixed; boundary="------------qakaIdllWfxUraU55kjxgEiJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <370e7307-6698-4195-a703-76542bccd60c@suse.com>
Subject: Re: [PATCH] xen/public: add comments regarding interface version
 bumps
References: <20241014103311.31272-1-jgross@suse.com>
 <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
In-Reply-To: <0be5b60b-c333-4718-98a8-34eae911a169@xen.org>
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

--------------qakaIdllWfxUraU55kjxgEiJ
Content-Type: multipart/mixed; boundary="------------Bk2vegGqr2BTVgI4Jr00uJzU"

--------------Bk2vegGqr2BTVgI4Jr00uJzU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTAuMjQgMTI6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzEwLzIwMjQgMTE6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
b21jdGwuaCBhbmQgc3lzY3RsLmggaGF2ZSBhbiBpbnRlcmZhY2UgdmVyc2lvbiwgd2hpY2gg
bmVlZHMgdG8gYmUNCj4+IGJ1bXBlZCBpbiBjYXNlIG9mIGluY29tcGF0aWJsZSBtb2RpZmlj
YXRpb25zIG9mIHRoZSBpbnRlcmZhY2UuDQo+IA0KPiBXaGF0IGFib3V0IHZtX2V2ZW50Lmg/
DQoNCkluZGVlZC4NCg0KVGhlcmUgc2VlbSB0byBiZSBvdGhlcnMgbWlzc2luZywgdG9vLiBI
ZXJlIGEgZ2l0IGdyZXAgb3V0cHV0IG9mDQpwb3NzaWJsZSBjYW5kaWRhdGVzIChpbmNsdWRp
bmcgZG9tY3RsLmgsIHN5c2N0bC5oIGFuZCB2bV9ldmVudC5oKToNCg0KYXJjaC14ODYveGVu
LW1jYS5oOiNkZWZpbmUgWEVOX01DQV9JTlRFUkZBQ0VfVkVSU0lPTiAweDAxZWNjMDAzDQpk
b21jdGwuaDojZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAx
Nw0KaHZtL2h2bV9vcC5oOiNkZWZpbmUgSFZNT1BfQUxUUDJNX0lOVEVSRkFDRV9WRVJTSU9O
IDB4MDAwMDAwMDENCnBsYXRmb3JtLmg6I2RlZmluZSBYRU5QRl9JTlRFUkZBQ0VfVkVSU0lP
TiAweDAzMDAwMDAxDQpzeXNjdGwuaDojZGVmaW5lIFhFTl9TWVNDVExfSU5URVJGQUNFX1ZF
UlNJT04gMHgwMDAwMDAxNQ0Kdm1fZXZlbnQuaDojZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFD
RV9WRVJTSU9OIDB4MDAwMDAwMDcNCnhzbS9mbGFza19vcC5oOiNkZWZpbmUgWEVOX0ZMQVNL
X0lOVEVSRkFDRV9WRVJTSU9OIDENCg0KSSBjYW4gYWRkIGFub3RoZXIgcGF0Y2ggZm9yIHRo
ZSBtaXNzaW5nIG9uZXMgKG9yIDEgcGF0Y2ggZm9yIGVhY2g/KQ0KDQo+IA0KPj4NCj4+IElu
IG9yZGVyIHRvIGF2b2lkIG1pc3VuZGVyc3RhbmRpbmdzLCBhZGQgYSBjb21tZW50IHRvIGJv
dGggaGVhZGVycw0KPj4gc3BlY2lmeWluZyBpbiB3aGljaCBjYXNlcyBhIGJ1bXAgaXMgbmVl
ZGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4gDQo+IFJlZ2FyZGxlc3MgbXkgcXVlc3Rpb24gYWJvdmU6DQo+IA0KPiBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmtzLA0KDQpK
dWVyZ2VuDQoNCg==
--------------Bk2vegGqr2BTVgI4Jr00uJzU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Bk2vegGqr2BTVgI4Jr00uJzU--

--------------qakaIdllWfxUraU55kjxgEiJ--

--------------Ua0YLV8JMnagrm7om7U9x6QF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcM+iEFAwAAAAAACgkQsN6d1ii/Ey8E
Bwf/Wdx7cbUn0Izf273xxb62G4TZ09BV5EbZIYel6iorUzm+JQp84dc8J4X7uLgI2mrFQ5qt437o
dOAzMRifRqRSClSuAuezpq11UrUyjoG1wgr/62kRmxExr7e1rXp9iMjTIWDaw0R6wTthO/7Fi0yn
Xel1nh9Kr3QXBQkzzqyLHI2NevdiiSDDxeJDnDn7GcSk2oUDl9mwiRYCWwxdnA6M3hIc//vnLQ7A
BS7RuyIgHxKnYueT1dXqKVb0AV9ZDHK1Zrn81bhWRN475yjKPYoaV05TRPQn6/FwOKhK4xgyXLH0
tB7xTObGAXA0FWMio1QHTockK37gwcjFnITpbAo5ZA==
=TUzN
-----END PGP SIGNATURE-----

--------------Ua0YLV8JMnagrm7om7U9x6QF--


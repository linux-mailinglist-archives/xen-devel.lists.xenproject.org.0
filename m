Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C09587A0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 15:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780407.1190027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOdL-0006DN-Tc; Tue, 20 Aug 2024 13:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780407.1190027; Tue, 20 Aug 2024 13:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOdL-0006Bk-Pi; Tue, 20 Aug 2024 13:10:47 +0000
Received: by outflank-mailman (input) for mailman id 780407;
 Tue, 20 Aug 2024 13:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sgOdK-0006AN-WF
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 13:10:47 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ca803e9-5ef5-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 15:10:46 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5befe420fc2so2629506a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 06:10:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839342f6sm761653966b.137.2024.08.20.06.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:10:44 -0700 (PDT)
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
X-Inumbo-ID: 9ca803e9-5ef5-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724159446; x=1724764246; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=06TrBrNLciHi6+vfpuKN7ddrFMPcoea/z9MTlgnXLXw=;
        b=Nv5fbPqG44IVE9SnRK/6AobzKguPPPheWwMeVJOhyMF0uGUDcPRxWysCCjgIArmdSc
         X5izotDxXNigr335qHP0x7yoU0/O+ir6g4pCEa+tsUDG9xTY0uUtFl9JyvXdC+2iJOqK
         CumSiPOxbrozsdWImNgMSKZkUGOp3Pjtblq2Ein6FRwI6+iDgnJ/VZ7fu3Q8zKT3YaAm
         Yf7dsljyPl5y9mHKmtLEFdbNNQn5xp9EcUaqDvLr+Pt69I0ZatutGbQVM9EYJ3Qn+l4X
         yWZcw13heDEF+dbpSuwXccWmWtEGhGe84BJca/OHcC6pMOA7fZdeD36wWKd+ooUnY3k+
         04XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724159446; x=1724764246;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06TrBrNLciHi6+vfpuKN7ddrFMPcoea/z9MTlgnXLXw=;
        b=Wp5aRcbvL3AVQLu/l3WfEE4aCvleNkCC2KFbIvFok0U80n+lkQr0H4pUAx34KBpN0Y
         oOoN4qRBEuIirRm3l4FyeAilMvuU84tfggBXMYa0HIqvvpo7B79Dw09HdmhHGjD74KiM
         eUzm3eZsDf1ifKObuiq5wHPt/0WpHU7Ne84onVBeS/lPhFUfX/dwc9lo8TS3oAct0SJP
         Uek3YB4D5+PMDTi92mSoLtj+ydHkI2sUSMszlOW39Hf/kqqwWdy2OpTV1Jv6OeMiNeml
         wxiPsxJ8+89/rHuZAKp5R5fhT8FB4hU2tkPx4umcciE2A/4havBQu3B8XbxwuHqND/Nn
         9qGA==
X-Forwarded-Encrypted: i=1; AJvYcCUsTUj3RCDsiWJy4ewxvRMwL7TJKu/EPlypAczWrDrHAS9WL/NgNvLZyufjBIPDrF719gUKTg/Bub0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOpeuEZlUgQsLIEZE4jw7RKe0oKPIYFT6yWCN/WybhTTIPBZWx
	4k5IZCZa51NQvO5/B3D4tcRF8edvlwv8oiqYBynQI/tENqXcxfVM4Xhe3IjDFSlya5S5m1VQsBA
	FqxI=
X-Google-Smtp-Source: AGHT+IEedr4iw1LWLs4QUWehBKVbDSElzBGPOw6gdDlbK/p6vMuAAkuG0Xa91bi2rWRjb4EK3VnvWg==
X-Received: by 2002:a17:907:97d5:b0:a6f:5150:b807 with SMTP id a640c23a62f3a-a8647a136e1mr134840466b.35.1724159445415;
        Tue, 20 Aug 2024 06:10:45 -0700 (PDT)
Message-ID: <79ab432d-2551-41c0-afd0-4223764ded1e@suse.com>
Date: Tue, 20 Aug 2024 15:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mini-os: mm: convert set_readonly() to use
 walk_pt()
To: Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-4-jgross@suse.com>
 <20240820115743.teyoiov6qx63flna@begin>
 <fa441335-bb76-462b-b64c-160cb1fa28ac@suse.com>
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
In-Reply-To: <fa441335-bb76-462b-b64c-160cb1fa28ac@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OQwIt5mfwX76T0mgkJFrSFDr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OQwIt5mfwX76T0mgkJFrSFDr
Content-Type: multipart/mixed; boundary="------------hBhs6O40hIWJOFZchOs0wO11";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <79ab432d-2551-41c0-afd0-4223764ded1e@suse.com>
Subject: Re: [PATCH v2 3/3] mini-os: mm: convert set_readonly() to use
 walk_pt()
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-4-jgross@suse.com>
 <20240820115743.teyoiov6qx63flna@begin>
 <fa441335-bb76-462b-b64c-160cb1fa28ac@suse.com>
In-Reply-To: <fa441335-bb76-462b-b64c-160cb1fa28ac@suse.com>
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

--------------hBhs6O40hIWJOFZchOs0wO11
Content-Type: multipart/mixed; boundary="------------OSoN7QDx5p5VoSJjpDAr9WS2"

--------------OSoN7QDx5p5VoSJjpDAr9WS2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDguMjQgMTQ6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI0
IDEzOjU3LCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+PiBKdWVyZ2VuIEdyb3NzLCBsZSBt
YXIuIDEzIGFvw7t0IDIwMjQgMTU6NDE6NTggKzAyMDAsIGEgZWNyaXQ6DQo+Pj4gKyAgICBp
ZiAoIHJvLT5jb3VudCA9PSBMMV9QQUdFVEFCTEVfRU5UUklFUyApDQo+Pj4gKyAgICB7DQo+
Pj4gKyAgICAgICAgIHJvLT5jb3VudCA9IDA7DQo+Pj4gKyAgICAgICAgIGlmICggSFlQRVJW
SVNPUl9tbXVfdXBkYXRlKG1tdV91cGRhdGVzLCByby0+Y291bnQsIE5VTEwsDQo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERPTUlEX1NFTEYpIDwgMCApDQo+
Pg0KPj4gWW91IG5lZWQgdG8gc2V0IHJvLT5jb3VudCAqYWZ0ZXIqIGNhbGxpbmcgbW11X3Vw
ZGF0ZS4NCj4gDQo+IEhhcHB5IHRvIG1vdmUgdGhlIGxpbmUgd2hpbGUgY29tbWl0dGluZywg
c28gbG9uZyBhcyBKw7xyZ2VuIGFncmVlcy4NCg0KT2ggeWVzLCBvZiBjb3Vyc2UgSSBkby4N
Cg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg==
--------------OSoN7QDx5p5VoSJjpDAr9WS2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------OSoN7QDx5p5VoSJjpDAr9WS2--

--------------hBhs6O40hIWJOFZchOs0wO11--

--------------OQwIt5mfwX76T0mgkJFrSFDr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbEldQFAwAAAAAACgkQsN6d1ii/Ey8p
zgf/d2JuulLFw2QhJVEm18gWKtiwqOdmK0jxII/lhGdUNZvCJVn//gRk+UnYLuXJfUnWoYw8HDSO
/aD6WYm3+5LEU8zIzPZrN4a3neKvTThAhc7JlJ7ue0S4mvveDAKqY8TE77J3LvxTex5AqMUfdxkM
ZoFdapo0PGrEgKegVxtlmSflezunb7lepKgVX0T1794BIR3YvsckjJUpZm7VH+77QMKnEJ4LTsxu
SRky5tIwt01LU/Qy+DbQ9xMpIVg3w7K4tFZk59t9gNbyRhJPSLbh1QMJscI2MlCQX5IUTSZSWnBQ
ij8gkzVu1yHHF7mmPlF54yZu/ILQfC1eWekOOpcGyA==
=vUTF
-----END PGP SIGNATURE-----

--------------OQwIt5mfwX76T0mgkJFrSFDr--


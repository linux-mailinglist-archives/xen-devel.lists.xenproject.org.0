Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FEC7FE08
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170221.1495292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTnS-0000YT-VX; Mon, 24 Nov 2025 10:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170221.1495292; Mon, 24 Nov 2025 10:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTnS-0000WV-Sp; Mon, 24 Nov 2025 10:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1170221;
 Mon, 24 Nov 2025 10:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNTnQ-0000W2-TB
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:27:48 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3759391a-c920-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 11:27:45 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so23329605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:27:45 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9df8db3sm143734375e9.11.2025.11.24.02.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 02:27:44 -0800 (PST)
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
X-Inumbo-ID: 3759391a-c920-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763980065; x=1764584865; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+uQ8yoQDarEKFfqnILD69W78C6mx41zZaOB4Hv5pSk=;
        b=Dwj9B2jwNqb3OiktUtP2939JG/DqFE/5gZOBXDetFzplqbI7/UwbbcT5G/Bimi/HWy
         iSKnEmkRsYeX3yBH5bkIjWP8y2PlSnlLgSo3b0PP98klF6kDfJKbab2fyjMEBLLHbEXj
         zQNuXfghIfHU0N56jBo8PyHrD02GTjdIojhiquzFfJ7BbMbDtv3yXD8sdWI5DH1zuf4K
         YJ7UMcw6GtQtn6/V1nY0c/phF9TOcSo6DsQlK4eDs103VbUINKeN48ujjqjLw9AiCsyn
         Tw0U01BX9DcDAjwkNHtFzCW6wwUEIceDES7VvR6h4D1RZDYAVoplpVPsh0K5zbA0tWW2
         D7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980065; x=1764584865;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+uQ8yoQDarEKFfqnILD69W78C6mx41zZaOB4Hv5pSk=;
        b=PwkrTpm/juhC39Xao69ppPD0wcuX3EdRtGVXdVoLCeE8kb92Galb7b/HG7BAz8tzic
         giOQN2nnMyTiJi6R/COaEi1lISUSQLQfgvPb1q2KBYRJS0RJ+Edag0u0LigEYWsUUzMX
         hkr/0GgwGPtt/arZqnxze66peG3L2YcQNNTadTZhdIBh4ArNzJ2V461OsZ7Ok/lx86Z3
         +2lUTLj+19IP1WabASOep9rdTcVI4emTO5ErikaS6iyolfO4Hc6/gK0KUTL492s0C1rS
         b/Zc3tMmijFR31NYo0A1/6p3uWSemjp6syMexRFDDEGrJ2JkLDWAyrxLip68N15XW5Fh
         2d/w==
X-Forwarded-Encrypted: i=1; AJvYcCUh8fLnm7PKhNHrG/BqBGnzAbfohPpIPGfoJXPeqsA/JFFf8E0PchvzSNYa/ZJyJHAcGWLiVRTY+P0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY4cz7/PiNswVBWmmYo64vN67fbSj68Zqd6KcRbDAKQ1ycdzYm
	PZ+HtuTd835ntK/tO+aqZy55BV5kAGrwsXmfUk4iWHWCAOvHwbqi8n6HUsD4bNF9v0g=
X-Gm-Gg: ASbGncvcc6bhDCOGv/Lt6S+oFN7d9lsPNXdesgUD26pReo21uQuLy1zECRLCZcnJ1Bu
	Ux1aw2P5BMzs9amvG/74DGIN07PBiU65OkpDd//+4JV9beCBhtiuzrWDdSrdDmJ9aESVnAvjRNk
	E+vStxURj3GflhWj4/pfOxlajiz5eMrkQ46F4e9fd1XA9aJeEE2GHeEH/nelHZ8qezKfgpntHX0
	QFlHUbnjsGkSXa+bFPsT5XMBvrOqhG1PgUkgHi8sXl9d/GP5cKwMooNAyGG7Di+mIgeB4TfKCML
	jHai5No4Xg+++W0ijBY5is2LmESbaDOXblx9PFZFEmihiCa+yxloAF0gsST8d7xPtYIXlcLmOYV
	T18Eh/qBsC/jvh2IfzUDyVKSiU2VnSpVNhYhUOAv4yt7ETTX1aH7yFEziIjFq9zON96315i9QcD
	3dla2p91NH8X6IAtrximbhEblCWIRZrTJiMG9a6TVl+gagwIqXhyMA+GsnakDFGdDiI2ezqc0kA
	7qGB+GFu6t9kzVXcBYG5/JK1PwmUztkNq8dSZU=
X-Google-Smtp-Source: AGHT+IH5ZhlsB4F/EOgv1cVgZImsF52L1UJM8JpN2q76FS9KDC+LnqVdXsuKmU0jumORHcnDyL8uzQ==
X-Received: by 2002:a05:600c:19d4:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-477c01c0026mr98351155e9.17.1763980064843;
        Mon, 24 Nov 2025 02:27:44 -0800 (PST)
Message-ID: <56d5c0e5-0c07-4494-b4fd-ce0754d70b79@suse.com>
Date: Mon, 24 Nov 2025 11:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/sched: address violation of MISRA C Rule 16.3
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
 <60e3bd1ba6ab3bc47d3a95ddf1e3e7ef71db5f3d.1763642993.git.nicola.vetrini@gmail.com>
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
In-Reply-To: <60e3bd1ba6ab3bc47d3a95ddf1e3e7ef71db5f3d.1763642993.git.nicola.vetrini@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZcWVTKxUjdHqMFs8ZWxLqsXg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZcWVTKxUjdHqMFs8ZWxLqsXg
Content-Type: multipart/mixed; boundary="------------83x9WoRLfr3bQ04d22l8vzrS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <56d5c0e5-0c07-4494-b4fd-ce0754d70b79@suse.com>
Subject: Re: [PATCH 2/4] xen/sched: address violation of MISRA C Rule 16.3
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
 <60e3bd1ba6ab3bc47d3a95ddf1e3e7ef71db5f3d.1763642993.git.nicola.vetrini@gmail.com>
In-Reply-To: <60e3bd1ba6ab3bc47d3a95ddf1e3e7ef71db5f3d.1763642993.git.nicola.vetrini@gmail.com>
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

--------------83x9WoRLfr3bQ04d22l8vzrS
Content-Type: multipart/mixed; boundary="------------REeiSj21JSP1hIbV0fPvtkkL"

--------------REeiSj21JSP1hIbV0fPvtkkL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTEuMjUgMjA6MzIsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBUaGUgcnVsZSBz
dGF0ZXM6IEFuIHVuY29uZGl0aW9uYWwgYGJyZWFrJyBzdGF0ZW1lbnQgc2hhbGwgdGVybWlu
YXRlDQo+IGV2ZXJ5IHN3aXRjaC1jbGF1c2UuDQo+IA0KPiBVc2UgdGhlIGBmYWxsdGhyb3Vn
aCcgcHNldWRvLWtleXdvcmQgZm9yIHdoaWNoIGFuIEVDTEFJUiBkZXZpYXRpb24NCj4gaXMg
YWxyZWFkeSBpbiBwbGFjZS4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGdtYWlsLmNv
bT4NCg0KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpK
dWVyZ2VuDQo=
--------------REeiSj21JSP1hIbV0fPvtkkL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------REeiSj21JSP1hIbV0fPvtkkL--

--------------83x9WoRLfr3bQ04d22l8vzrS--

--------------ZcWVTKxUjdHqMFs8ZWxLqsXg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkkMx8FAwAAAAAACgkQsN6d1ii/Ey8C
Twf/UQmyqkHtjJN6/SIEgidYsWHPNJlzEYV+9BD9gGSGuDMYmbSOhISB9dnldPQ3+O7rJL14zj/1
g6QCH8Yn8niT7zTFQot5eIfQ3XOL/5jh5VhVMu7ByUCLihGfj/yd0/mrblaL/hyzMuA6Gxd4kLXC
NPHJXhFfVPlNesC9jTXwO1/EKXpeU0TFn1w5BIkyjugzt7klYLtb97cKgFBJuDV/QITmXZOHbeDa
H06NRaSlWDOt/4RP4N83DAm28VVoXbXJD0u3jjNU5R9vxRhB4dhGDSKFVZ4+bjtBDtYA0yrFlEpr
g9K4jZCoe69Rnl3x5zWPyAHekSI8cw0l2jSgATtb/Q==
=4SEK
-----END PGP SIGNATURE-----

--------------ZcWVTKxUjdHqMFs8ZWxLqsXg--


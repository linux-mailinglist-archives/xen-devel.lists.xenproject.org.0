Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C1D17226
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 08:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201170.1516858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfZHM-0003sq-Lh; Tue, 13 Jan 2026 07:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201170.1516858; Tue, 13 Jan 2026 07:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfZHM-0003pj-IY; Tue, 13 Jan 2026 07:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1201170;
 Tue, 13 Jan 2026 07:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0+o2=7S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfZHL-0003pd-Ad
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 07:57:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e962e02-f055-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 08:57:23 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64b608ffca7so11315583a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 23:57:23 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8?
 (2a00-12d0-af5b-2f01-96c4-9745-9e8c-b1e8.ip.tng.de.
 [2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b22c3absm19583558a12.0.2026.01.12.23.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 23:57:22 -0800 (PST)
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
X-Inumbo-ID: 7e962e02-f055-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768291043; x=1768895843; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=udupZtdAsPzlrIdfOCuKMf+Aba1CLTE+bnyLTRSaJoY=;
        b=EKqGK4JuqFkDU3zzmnx/GfJwjX21iub0a8r4OFAz6JjRXDdetcgBHoZ7XfRPJwEDV9
         bWviVb4Wr9J/28rrHkLRFLAt2685/Ugbv9gQ2cez3RUxOlEJIEeDefux2TXrAnR4re2x
         19KgXnpwOGBzCR6BVTfaniKdrLkJw/Qyw/mSRvpy/6YycMSjx6BZQPHvHxM7ub3UA9O6
         R9AsBZU9hdTmy/DQ68wP4Ted6mXGGqUiCtxPcWp0lRz4kDjH6QJIKLtAxvpI93n+I9Go
         CxDuOn1GatajNeaSG8vebEK8q3248gQnRnwWNzxKd8TQobQ9DGMk5hHuI6ESKy5cXqWu
         8hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291043; x=1768895843;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udupZtdAsPzlrIdfOCuKMf+Aba1CLTE+bnyLTRSaJoY=;
        b=i7eP8WyVmYr19yx7Q1wmY1efUTOaQG+KiSkVPacqL4T7+ILh5owj04cfwU30pHPmQR
         LTIo2eQUywdrboS+gF5n1HNEPDEVdKPf2d6xV0nLrBRYaghzv4rvrS7x5kx6cZjIVNHx
         b3J3sIT4Oh3DxgJTX2FsfcNH1IzMuB0Ft89Lb0zmsZrIPlCgx4Bjx42vSiauBsNmcKap
         3yDkTUqoKoH0069k2V+VDh7ets4HZZ+wWiD2Mp1vKwDIi1dw0Ei7Qfe0Vhaqq5H3JoPg
         ihipyfaMM81OYdVMSXB70HcUYi59zyTMbUS97SUbSS8odNGxs/mxHafFtQO1hFkR6AcH
         IHdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXi9aPPdsaQjTe+hAAIha5VvzvROELFzl8OQvPLtoA13U8MHIUd6odo6XbMrBTvk0/HZRhXMhgMD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtl+2zTyM0EMCti/GAUt5OI7JSWBavM7fMRT5X0bLCEw3HM7gc
	XrZTPRxcdUNkj/t4eacw2CT8MuT2lNROQW+IKG0s8YagkNLGtGAfFQBx4UDA9ldaclo=
X-Gm-Gg: AY/fxX5vnlO+v+bsBVwDAouQ+uY0UNj3xE/d2rMT8xtyt94blAgjh1rvRxrlkX/ZUDc
	wjmmTkJK9AS4bHTvZJOflt6WdRcqKQ75DcjcQIKjFGlcxVO5QtxDHUKRq3RsPD5d67cduwbHbuO
	Qzg9RtIUxkmMEmEY/p6pcDqFsvF6/xd0OQr088UUDrVtVrqQuog+FKAkM4rXRYAtL5QuV2aE506
	CelQCmlloQ/yqB3WeKaYX2nsQQjzEqe4n3G1zq2ACLU7zbbLsQ+MIUhKK/VJ6XgpncHvfws/Swp
	9b8nKbh1E9u1VX+WUaGddkLcEFuGQNL5TfJlkXdegnQ6B4FkGa54LO3rBEFnVSBqrwarHwef8m4
	iSGtSS5smCadHmHt/okOgua7Ek1B1dqU3K/3W2/2cobR2ZuBnNnZSyJxAHoHtWhd9N/MJ8a4eJj
	KeNlpIXeGWJSbf44QjKQSxYa3fYbtWK7WBegF2kAL/Dr0CjH5GJJHyXPAfZXIeYYz5bzZQUqHrZ
	UM6g4iEKWGbRir4XXqxtILF+x51xqyOauyzzZA=
X-Google-Smtp-Source: AGHT+IHVR/bd0P4qXwmWclbr1WTM7yPgnnr97onn6wf/cfvPSeCpos1AvfrsVD0L7aGVtaOLzc3XFg==
X-Received: by 2002:a05:6402:3494:b0:649:cec1:6cf1 with SMTP id 4fb4d7f45d1cf-65097ce2c86mr18036355a12.0.1768291043048;
        Mon, 12 Jan 2026 23:57:23 -0800 (PST)
Message-ID: <a42c18c8-9bff-4d85-bb7a-4fbb2c43ad00@suse.com>
Date: Tue, 13 Jan 2026 08:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: introduce xen_console_io option
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LSSFxxtpIYj0v0pIT9Z82sKZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LSSFxxtpIYj0v0pIT9Z82sKZ
Content-Type: multipart/mixed; boundary="------------sHv0zXIgQHppjk0LX4uXAWBV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org
Message-ID: <a42c18c8-9bff-4d85-bb7a-4fbb2c43ad00@suse.com>
Subject: Re: [PATCH v2] xen: introduce xen_console_io option
References: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop>

--------------sHv0zXIgQHppjk0LX4uXAWBV
Content-Type: multipart/mixed; boundary="------------KUzPBRftuXCtXIG825Nrhkag"

--------------KUzPBRftuXCtXIG825Nrhkag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDEuMjYgMDE6MjQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gWGVuIGNh
biBzdXBwb3J0IGNvbnNvbGVfaW8gaHlwZXJjYWxscyBmb3IgYW55IGRvbWFpbnMsIG5vdCBq
dXN0IGRvbTAsDQo+IGRlcGVuZGluZyBvbiBERUJVRyBhbmQgWFNNIHBvbGljaWVzLiBUaGVz
ZSBoeXBlcmNhbGxzIGNhbiBiZSB2ZXJ5IHVzZWZ1bA0KPiBmb3IgZGV2ZWxvcG1lbnQgYW5k
IGRlYnVnZ2luZy4NCj4gDQo+IEludHJvZHVjZSBhIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0
aW9uIHhlbl9jb25zb2xlX2lvIHRvIGVuYWJsZSB0aGUNCj4gdXNhZ2Ugb2YgY29uc29sZV9p
byBoeXBlcmNhbGxzIGZvciBhbnkgZG9tYWluIHVwb24gcmVxdWVzdC4gV2hlbg0KPiB4ZW5f
Y29uc29sZV9pbyBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgY3VycmVudCBiZWhhdmlvciBpcyBy
ZXRhaW5lZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------KUzPBRftuXCtXIG825Nrhkag
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KUzPBRftuXCtXIG825Nrhkag--

--------------sHv0zXIgQHppjk0LX4uXAWBV--

--------------LSSFxxtpIYj0v0pIT9Z82sKZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmll+uIFAwAAAAAACgkQsN6d1ii/Ey8x
NAf+J3YY4/KEUAnLPqVn7/0N0ssf2J5VzF4VMEhuQL8awfn173n3CcNfodCOHQDyQO07aI9Hf4+Y
eOlCxTCrMLK8W/hIs4kdawmgV9W1Hf82l6nqmRAWDeEaFYv/dj3BhgHTJRinzwl6j8wZxAOPrssm
Gdy8w6259xY0HFqbJhbhiKi6hAU8xalYJQOjDl6mclqKOpM1ZI0zHN6pbHpaRROUwGJ9+ATww6N3
7mTryuc1cJNL65wW3M5Jgtuh8pgGUqGT4jeTB3FQDcjTh/pTuCM9uynQtmpbAfH3yKVW8Ny9j9NY
cc/SHLfOUdRCTTy+HtKyOKHZumbLGTmhO3IEQJ4xew==
=jRIk
-----END PGP SIGNATURE-----

--------------LSSFxxtpIYj0v0pIT9Z82sKZ--


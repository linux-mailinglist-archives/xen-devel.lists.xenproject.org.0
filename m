Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31D9BAF93
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829881.1244791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tKe-0002xt-5E; Mon, 04 Nov 2024 09:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829881.1244791; Mon, 04 Nov 2024 09:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tKe-0002vi-2i; Mon, 04 Nov 2024 09:25:08 +0000
Received: by outflank-mailman (input) for mailman id 829881;
 Mon, 04 Nov 2024 09:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t7tKc-0002vc-JC
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:25:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab57aac2-9a8e-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:25:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so34157785e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:25:02 -0800 (PST)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d685308sm145817825e9.33.2024.11.04.01.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:25:01 -0800 (PST)
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
X-Inumbo-ID: ab57aac2-9a8e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFiNTdhYWMyLTlhOGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzEyMzAyLjQ4MjUxMywic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730712302; x=1731317102; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3j6yw9G9MmSxTglPbSEmSMcnh+26FY7U9BWD66ivgE=;
        b=MZOXR6BopE3OVH9bfJXLIoSpLjgsHt0qbADjS0+g9Y5a6Z5E9bBcfGJYkbOCNe0noB
         KPsONAJC3/P+4tFnXoQgQfIPdUq8gCwHJjkfcyJsSEO3QJI7JqLhcgZUq/R3k70DAnbc
         rbnkvH9rlHYr7VSjRuffvhtLc1C8emSj3/NYhUYbvQ/p4AkzHn7R/AmmOFKMNnYjbCdR
         jouGrXf/jBh38w38L+BDcOJ6/+ZMi/8YOp0M73PQwcGHntKt1qKxpWMpt1WkEFmveUcZ
         Ub9U3S9LPfUHUAJatFeGxjbxgYgEfafNlavfB18rvQwktRXGWrHrlBlJq8nYKEz89a8T
         N98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712302; x=1731317102;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X3j6yw9G9MmSxTglPbSEmSMcnh+26FY7U9BWD66ivgE=;
        b=DkvMTcEW/MrWifFd9cI75RHI/Kk3rSyLjUpy6oWzkdqKoeecfrTku6YrgGTj11vLRM
         YHrC4dk6ifJ2SN8P/wGKuM3ohhNu8vcqukXGFydp5OLfizZmQg5BNrthiXUwysmgMleS
         9z2AZaDX9aw3JMuBqAA7tOpI2xsaL6bmy9f9wiKb20x96YZjVLf1urYZDpGtf60hCEtw
         hqCCUGI6I9+lcZ1EcuML5Pme30CPvC2zYzTbPquXLXH4sjT+kNC6HNoMNbKm6H6TKi8O
         nzk40nb3JxETu+Js2B5HRcYcd10lVD2GMZa0lgUr8w9ou+nSqypIlzHl3OQjMVgIKhEE
         L0zA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ17Kge1cbZr/NjYYR+cGXcQysc9reukMTdO10X/El1KpI4dVReuc3eBCxZQc/g0uob4G61sdAjZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwHSrSXfyTp1jABgltYDE8b5rCxBL0a1SfECQrJQtzUoSUUcuy
	TmXRfdYk3+s7EiqLHsxuM2vsM2yYS6md/R1MD7TJqf2UEl7KyoGdCuJYMij1Yv1dVc3JACeC+GC
	hriA=
X-Google-Smtp-Source: AGHT+IHI2kOYywT8q/plqqpqvShcJU7MytTNDmcUOu/Gxym10z/sE/f3c32CxiDcoJTxZHTeau8VHQ==
X-Received: by 2002:a05:600c:22d3:b0:432:7c08:d121 with SMTP id 5b1f17b1804b1-432849fa03amr100113175e9.12.1730712301759;
        Mon, 04 Nov 2024 01:25:01 -0800 (PST)
Message-ID: <5767653a-9b8c-4919-89b1-d487574ba212@suse.com>
Date: Mon, 4 Nov 2024 10:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dom0 crash (BUG_ON(old_mode != XEN_LAZY_NONE) in enter_lazy())
 with Linux 6.11.2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZyTFfG9i87hQXmwZ@mail-itl>
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
In-Reply-To: <ZyTFfG9i87hQXmwZ@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N93Bib0Tf8ImduKtcdy2IM0U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N93Bib0Tf8ImduKtcdy2IM0U
Content-Type: multipart/mixed; boundary="------------x0kmOHbzvtYtkXGh2lYeC2Zt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <5767653a-9b8c-4919-89b1-d487574ba212@suse.com>
Subject: Re: Dom0 crash (BUG_ON(old_mode != XEN_LAZY_NONE) in enter_lazy())
 with Linux 6.11.2
References: <ZyTFfG9i87hQXmwZ@mail-itl>
In-Reply-To: <ZyTFfG9i87hQXmwZ@mail-itl>

--------------x0kmOHbzvtYtkXGh2lYeC2Zt
Content-Type: multipart/mixed; boundary="------------9CAPdwntkE0lFDhD3V2F00le"

--------------9CAPdwntkE0lFDhD3V2F00le
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjQgMTM6MTEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBJJ3ZlIGdvdCBhIHJlcG9ydCB0aGF0IHN0YXJ0aW5nIHdpdGggNi4x
MSAoc3BlY2lmaWNhbGx5IDYuMTEuMikgZG9tMA0KPiBvZnRlbiBjcmFzaGVzIG9uIGEgQlVH
X09OKCkgbGlrZSBpbiB0aGUgc3ViamVjdC4gSSdtIG5vdCBzdXJlIHdoZXJlIHRoZQ0KPiBp
c3N1ZSBpcyAtIHRoZXJlIGlzIGk5MTUgYWxsIG92ZXIgdGhlIHN0YWNrIHRyYWNlLCBidXQg
aW4gdGhlIGVuZCBpdA0KPiBjcmFzaGVzIGluIGEgWGVuLXNwZWNpZmljIGNvZGUuDQoNClRo
aXMgaXMgcHJvYmFibHkgcmVsYXRlZCB0byB0aGUgc2NoZWR1bGluZyBjaGFuZ2VzIGRvbmUg
aW4gNi4xMS4gQ2FuIHlvdSBwbGVhc2UNCnNoYXJlIHRoZSBrZXJuZWwgY29uZmlnIHlvdSBh
cmUgdXNpbmc/DQoNCg0KSnVlcmdlbg0K
--------------9CAPdwntkE0lFDhD3V2F00le
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9CAPdwntkE0lFDhD3V2F00le--

--------------x0kmOHbzvtYtkXGh2lYeC2Zt--

--------------N93Bib0Tf8ImduKtcdy2IM0U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcokuwFAwAAAAAACgkQsN6d1ii/Ey87
Jwf/VqRc/laNwKCMet3IQF7TuiZnmzIAFlObLT4q/+EqM+wvVOMY2q+x52hNePZAmkBN7bZ+1CTo
bdFh/AIm3lwu+pPgkFFtwwJNOkSkqSQfxErJnXBAMrUl9jNeyTQHCxoWXqVPFWndlYH4QHyLsi1V
BAv/hXddCDH3ARmsxhCN66zLiV/4YTf+OprPLu4bvjjZvy7RfSU+Z1y/gAKOPM1CAI9JsCt4gaSa
OidA9b2oXN/QARB58BgKPJQgVo0q1/3lkt2c+R0fiVbReXhBRIqnvdkgoc71pGckZxQijCuemGDJ
5+CRAZkrURBGoyxBRQF/EGxRySe0vHuNrJflQrXaMw==
=/xEu
-----END PGP SIGNATURE-----

--------------N93Bib0Tf8ImduKtcdy2IM0U--


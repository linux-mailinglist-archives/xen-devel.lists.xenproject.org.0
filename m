Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC09BD1E52
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 09:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141804.1475968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DQU-0006dF-9r; Mon, 13 Oct 2025 07:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141804.1475968; Mon, 13 Oct 2025 07:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DQU-0006bn-6b; Mon, 13 Oct 2025 07:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1141804;
 Mon, 13 Oct 2025 07:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v8DQT-0006bh-2y
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 07:57:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 319a8956-a80a-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 09:56:58 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-63a0375d7b6so6888347a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 00:56:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d971ec69sm845406066b.85.2025.10.13.00.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 00:56:57 -0700 (PDT)
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
X-Inumbo-ID: 319a8956-a80a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760342218; x=1760947018; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t1oJTHkMIL7vbq3eQgyJOaqcLOW7sBeMG88248iy+Oo=;
        b=Hg9GXACzIKktlVxwafgEg1m0DxfWb/hpZCyTgOdyrDr1kRkb3XeYiMyLiOVNVn7fx7
         WO4rE5mS90QtaLEiqiuBDnlYTEzFlxFDa2HrFY5fcDcGe4+CsaRvrtj0xxSpP5yU+a6E
         VI446DB4ApLefGcXIs8YcKj9NQX9/FiT91McuSreLxF6fcwR71qFY+r54B4mhbsd3lN8
         mTaZ1n7ik8znbxxTp3Be5ddOBbQR2ND0GLUz+mmhmWQoJLb8byfmC7k9u3+/NSChP9g0
         2GmzLtb7IORKcTETPdZAuVDrtbjujHymOQ9yNEUvdOtjZK1P1op0R42m9fFSMQ3LotSh
         FMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342218; x=1760947018;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1oJTHkMIL7vbq3eQgyJOaqcLOW7sBeMG88248iy+Oo=;
        b=ipZkpBGsrsIsF5H+pTc5lXQovQJQLhp30hnmLbOagEx8M+I7/bgaDRKer+Ywtls7cT
         QZhpfk5GaPiIy197xasehIAgPWlzGTGLNGYPROIIHTNVGn/F/kAXfXqPKWFeKbYsgkFT
         HoTnx8UQZSXJUcFlvsUT+WtHDOeUtd3gbUeXgM5UqSStXvNo7ju7cE3vChqYTMeu3joF
         va/ycgvlQpbXV/YPMbIRvR7Q/jHHuoB8k24u5RWDaRczLvdzlef3KS1LS3ZQ3/s2mKap
         lLme+slE7m3xxzsphEZlGFzr0kqNyQKijjNeB+FEJ5y0eC1iHU/sXqmzJzR/cifJvTc0
         xZDw==
X-Forwarded-Encrypted: i=1; AJvYcCVdV5QBnUFTsn2im91dtVqCut+qGKEuz/684PyjL6itCXbPIbc7M6HsSb4XibPcGbSNjPYK7AHL8d0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmuTdnGzyCJsFsF1Y8+6TL5nU+ZLXbfdVjPvXz7ZVWMB/e9Qvb
	hD3SD4QUtInbc8TrgpPhecvqCv8iL2QvgrtXlT2gjCM/8hDIf1iIkCtuGBPwrmXyLOk=
X-Gm-Gg: ASbGncunnQIVl5GxH14qGhaQL+S98daNY7vn4GSnTjt+bcDQ19JBMCpwwr6GXOjQoHs
	8yXTJBmdsSRs1aqOBZrP8aqGY2vfWuVLr2+b5OYA/98BW5uFeBtiv5/QotXBKwiTSp26t/WryTt
	+JJXOU+eea8H5s3efY/+yaJKxY3RsndlkZO7ifhWfrvutQ1X7s6r8fVxaYlY+fMpew9ZvYh1ysu
	qxMp56qO1CQh/VQfxJYI5IF4/qYqXCJ6JYUEqOEjrhKuOdwiYcrypZbvebg/i4o0yT/wxibxV9d
	vj262HWz3hIkM2PxF0N1PLqFMBBF/uUC0wN5piIt0totddg3jj2zaaLCSR5Tu4PlQ7G5FXaugxW
	AK0YwzOY8p+9NKMomZqkEqpNQLt9nTHZ5IltM16cYKmMUjGPRwTcyDVtP+WReb52gDbwiY5AB+V
	KVkeee6U8FrpksxFDshRcekDLuM0TvBbq/BpB7hm/Y//wRcac5Pj+El7uHMtXYBhHqNfVQXD16G
	Q==
X-Google-Smtp-Source: AGHT+IHkDgV//eCHzuK1RkhUyBPwydYDLXy0mdcpfEBb5/5lf4f/bgTn5dAOsEHtCrMJsIWj/CR/VQ==
X-Received: by 2002:a17:907:1c15:b0:b40:e46e:3e0d with SMTP id a640c23a62f3a-b50abfd6af4mr2252809566b.46.1760342217840;
        Mon, 13 Oct 2025 00:56:57 -0700 (PDT)
Message-ID: <befe98a6-3712-4cd9-8a7b-c459f2e43138@suse.com>
Date: Mon, 13 Oct 2025 09:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Huang Rui <ray.huang@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20251013074533.67478-1-Jiqian.Chen@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mWnhtWZr3w0Hx5dEnbVuQk0A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mWnhtWZr3w0Hx5dEnbVuQk0A
Content-Type: multipart/mixed; boundary="------------N0ilWkw9qfSTU0HYIDuglhRH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Huang Rui <ray.huang@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <befe98a6-3712-4cd9-8a7b-c459f2e43138@suse.com>
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
In-Reply-To: <20251013074533.67478-1-Jiqian.Chen@amd.com>

--------------N0ilWkw9qfSTU0HYIDuglhRH
Content-Type: multipart/mixed; boundary="------------mDBR2m0zTaYRZfeqQZGccH7K"

--------------mDBR2m0zTaYRZfeqQZGccH7K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjUgMDk6NDUsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiA2NC1iaXQgQkFSIG1l
bW9yeSBhZGRyZXNzIGlzIHRydW5jYXRlZCB3aGVuIHJlbW92aW5nIGEgcGFzc3Rocm91Z2gN
Cj4gcGNpIGRldmljZSBmcm9tIGd1ZXN0IHNpbmNlIGl0IHVzZXMgInVuc2lnbmVkIGludCIu
DQo+IA0KPiBTbywgY2hhbmdlIHRvIHVzZSA2NC1iaXQgdHlwZSB0byBmaXggdGhpcyBwcm9i
bGVtLg0KPiANCj4gRml4ZXM6IGIwYTFhZjYxNjc4YiAoImxpYnhlbmxpZ2h0OiBpbXBsZW1l
bnQgcGNpIHBhc3N0aHJvdWdoIikNCj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEpp
cWlhbi5DaGVuQGFtZC5jb20+DQo+IFJlbGVhc2UtQWNrZWQtYnk6IE9sZWtzaWkgS3Vyb2No
a28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------mDBR2m0zTaYRZfeqQZGccH7K
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mDBR2m0zTaYRZfeqQZGccH7K--

--------------N0ilWkw9qfSTU0HYIDuglhRH--

--------------mWnhtWZr3w0Hx5dEnbVuQk0A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjssMkFAwAAAAAACgkQsN6d1ii/Ey/s
UQf/TWfqWbon8qbLRyvh6RKcwBVJrEekT7ydexPo6DYrFIA889O4MXSuaSoaH5au73wFrDuZD09X
dvs/E2nocLmlc39bEzTfRnwLOi4FzC4QC8gK4XuWbKVq1Y/wjDE9aR2fXsza0ZZuIDZIbzLoqq1w
3TWH/t8Rv7izjp/r73g2h3+OdSpjYiK76sFHY1M/aA28HlPQK+9T17zBU3cwXpEngT7GUY2zMk//
3UGUjtYX8b2kTBctNgxyW0cyc5uzwtdjC5wk+R9ttKjom8ThyKJkFEyxHUyxf2V70pEIDGlCNLKO
sfPCGdXfAF50s6ZiKB5ToBMjisq3JO6d5XkQoE0dRQ==
=XvuH
-----END PGP SIGNATURE-----

--------------mWnhtWZr3w0Hx5dEnbVuQk0A--


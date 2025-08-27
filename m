Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5479B385EF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096303.1451054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHpN-0002do-9x; Wed, 27 Aug 2025 15:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096303.1451054; Wed, 27 Aug 2025 15:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHpN-0002c2-73; Wed, 27 Aug 2025 15:12:45 +0000
Received: by outflank-mailman (input) for mailman id 1096303;
 Wed, 27 Aug 2025 15:12:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1urHpL-0002bw-Lt
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:12:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ed8038-8358-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:12:42 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afebe21a1a3so152894566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 08:12:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe6fddf163sm798516066b.53.2025.08.27.08.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 08:12:40 -0700 (PDT)
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
X-Inumbo-ID: 46ed8038-8358-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756307561; x=1756912361; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RxsbYgIsjbQtCJKQ3bzwR5hTOwxYVxpnylNoZaeQefU=;
        b=Ocmps38kC8kW8lWoO+A25xZXzrggVshsD6czveXwrPzgCRrLbSHA2Gh90AhL7HDRW1
         0vtCK/SiDHxe15yroLOL3QBC5Ckpq9HtSUziA6bytxbInzfYQfdjzehwKLkyZQHXImXT
         DbT3gEEGArXzCQUYTczBUKS0N6/0+eWUPpguErq1bQ0P29YZv/D4PuqCLJ1fPYBqS/xs
         FliJblDlsS73dcSGS01XiAeD6C2oC+iEamLRkYl+TqnN3mPIBk3S3iUTDHSkFVeusz/H
         Qw1du25FwY2W8cB00cqOnLZCLYGWDWjC9lNIaWAMOTPdDsgOXrVYr8Y/uL3kDxPZ4W6X
         sHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307561; x=1756912361;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RxsbYgIsjbQtCJKQ3bzwR5hTOwxYVxpnylNoZaeQefU=;
        b=CAKqVOUK5qnVmAJYk3Q8Dhnqs3kTMZvsMs3VDnOb0So6Cp8I2MJrs08hTJQ/eilnw8
         yt/ed9mI2QX3qIli35oEiE9bON0Fw0+Wa5dnxxJMYJlvE2Hgcy2WAoIg1rf7whVnvImn
         gRPu+6B4dm/0rmegwBK0updy3gn1D7L3qIWtuBYXpXBaKPu6g9+yHtitQXL6XVp+3fZh
         QQu1rofUqmM/5KvMTszRVfPtnZDxGTtQqmqwv7dkh30A8Lp0ASqahfkhgZJMsF4j1FOw
         Yb1lHi5kDwO6uLWJJ6ohe7AgFzOeIraLkTvWtUz3LwCihvDt39IBIySs1UJYhIYg3QJr
         Pjmg==
X-Forwarded-Encrypted: i=1; AJvYcCVc0G5RKCb6JNVANuKh+fb3v2Ptl3MdybSqrTgPXEDfC9baMoUMZhR8eS1UXOehK4DwxJiOXV+/DV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywfRv4zJvVqa3lKyVmi4pC+8IHlAEUFfgGmNMcN8beSnPwUq6m
	Vwbxze/p+1Oqk4Hb4xsD+l1HE3g3yH4CUSYifokCiQcwlTsQSYJyAgOb7WyfpdPds2E=
X-Gm-Gg: ASbGnctqUxi13HCwUl/eEKcpV6kfOlnqJxQqyE3eDQOplSs88HbEH/mDVe9O7nfarOe
	fG7OJCXgUxmWWqKmq8s1w7BM6X8XqMFpA398ruII7oGGjYJ5XmRAccJFYIiXhMveaoE4TRM68Su
	76Hq2wvJYIai69EMvyUkJfPBkj6ydsjdvvhX0O1UhdrTcNVBjNLa7W13u6Vt7Le9Hu7r43vfvYE
	BA5H/yVJ7yEr33XXXQNWFG2n8boANjZJ4mYkNp3F9fakl0vNre0oKIuEF+N8VU1C75+Ko//gghv
	jlzAj7lWoe9wOD22vY3imKPSl01QI8RfyuEgJfUv0cmn4QUwewyNiC7urG3iaq5DMH96zqac/0F
	4NqQ0lHzOkidBxH6GwvWjuT/H5TxLhevJegKVryeK9z5YTSEE7yxWqw1q6/Kho+prQpfegyYU5T
	ueNlylNAeWgL6WmuFv/6KtdTjMkLIyog45ywuK1LMm/L44OygQimJIFVJiLQ==
X-Google-Smtp-Source: AGHT+IEQwWYpKvHQmksoFVc9cJkbe3UQCuPnhJ08O6SFuBe6tnk1ktff5iSeRUGybE9aOx0ajeLdnA==
X-Received: by 2002:a17:907:7ba7:b0:af9:479b:8c80 with SMTP id a640c23a62f3a-afeafeccd92mr575636966b.4.1756307561061;
        Wed, 27 Aug 2025 08:12:41 -0700 (PDT)
Message-ID: <df337cd1-eabe-499b-aeff-443f73d5acc0@suse.com>
Date: Wed, 27 Aug 2025 17:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] tools/init-dom0less: Make handles global
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250826210847.126015-2-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sK08DEPMhpQX0MHcfnkr07t9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sK08DEPMhpQX0MHcfnkr07t9
Content-Type: multipart/mixed; boundary="------------a03DW9gAWvJ05ybPod3ywp9S";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <df337cd1-eabe-499b-aeff-443f73d5acc0@suse.com>
Subject: Re: [PATCH v3 1/8] tools/init-dom0less: Make handles global
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-2-jason.andryuk@amd.com>
In-Reply-To: <20250826210847.126015-2-jason.andryuk@amd.com>

--------------a03DW9gAWvJ05ybPod3ywp9S
Content-Type: multipart/mixed; boundary="------------NkLKUHHBZs60k5QoaqZluMl2"

--------------NkLKUHHBZs60k5QoaqZluMl2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjUgMjM6MDgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IGluaXQtZG9tMGxl
c3MgcGFzc2VzIHRoZSBhc3NvcnRlZCB4ZW4gbGlicmFyeSBoYW5kbGVzIGZyb20gbWFpbg0K
PiBkb3dud2FyZC4gIFRoaXMgaXMgYSBsaXR0bGUgZXhjZXNzaXZlIGluIHBsYWNlcyB3aXRo
IDQgaGFuZGxlcyBwYXNzZWQNCj4gaW50byBjb25maWd1cmVfeGVuc3RvcmUoKS4NCj4gDQo+
IFJlcGxhY2UgdGhlIGhhbmRsZSBwYXNzaW5nIHdpdGggZmlsZS1zY29wZWQgdmFyaWFibGVz
Lg0KPiANCj4gVGhlIHhlbnN0b3JlIGhlbHBlcnMgYXJlIG5vdCBjaGFuZ2VkLiAgVGhpcyBr
ZWVwcyB0aGVpciBpbXBsZW1lbnRhdGlvbg0KPiBjb21tb24gd2l0aCB0aGUgbGlieGVuc3Rv
cmUgZnVuY3Rpb25zIHRoYXQgdGFrZSBhIGhhbmRsZSwgdHJhbnNhdGlvbiwNCj4gYW5kIHRo
ZW4gYWRkaXRpb25hbCBhcmd1bWVudHMuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1
ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------NkLKUHHBZs60k5QoaqZluMl2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NkLKUHHBZs60k5QoaqZluMl2--

--------------a03DW9gAWvJ05ybPod3ywp9S--

--------------sK08DEPMhpQX0MHcfnkr07t9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmivIGgFAwAAAAAACgkQsN6d1ii/Ey8X
DAf/cOo9mn73LL2DP8ouV92FtBuJCIVDUL/sWiyGUMrHmfkHmS+Zqdyx6UoamSxZyI1gPk/gxKSu
yIDxfXuoHFo1AlmCidoIePm+LE5hHlSs83MR40CJyDQTrfLCZbuf85rcmo952NcPuTUeofu8dtP9
Shkn/N4D9OmNj3SeYbtMTFH6co7L/zAmGuv261vSVOriTqw9nCJIMCFJ6OB25Pu9i/WUby5x3HQX
NqhUvZpC3IbqaRfnQECOw4acKHZoTaotezkv5odYcnDVzj3HXwWY4eXJSZit8waCrbhrXZr6s8zk
hafuzzBH9kjjRcPtcUYfp2L8mQEQ7BIuxBKe/u/BvQ==
=aRae
-----END PGP SIGNATURE-----

--------------sK08DEPMhpQX0MHcfnkr07t9--


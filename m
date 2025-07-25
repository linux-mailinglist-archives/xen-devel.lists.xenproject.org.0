Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEBB11935
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057422.1425312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCtl-0000OI-Ge; Fri, 25 Jul 2025 07:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057422.1425312; Fri, 25 Jul 2025 07:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCtl-0000LX-CZ; Fri, 25 Jul 2025 07:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1057422;
 Fri, 25 Jul 2025 07:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufCtk-0007mB-0G
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:31:20 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa51fd8-6929-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 09:31:18 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aef575ad59eso310890466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:31:18 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47c495dd7sm228982366b.11.2025.07.25.00.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:31:17 -0700 (PDT)
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
X-Inumbo-ID: 5aa51fd8-6929-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753428678; x=1754033478; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GAR0L4tKAdHOeUC6P7eOwKVX16yOZu9G1Gngkhj1Dxc=;
        b=EUno8nDWD5zBEmrBIZMnw3qLtIo1U7okoVe9YtSJyNMpGlXvgbo2TOro8QmUpZKVY1
         PeSZjlVJMr/DR6YcetVncCMxOvYoZp0xMWMF6MMONGbZnVCOIXmOdm7S7fbEKdKzjc54
         mwqnrMAFlv+iVqbKS6pNB6MdfT/XygWiEYJQpd0h4OaQQgYRf5QryTBs0qp2es19Qj+P
         p2nFL4gQP3l+Zhe6JosQy9pTMuOVnF7+j62bhtE9721M53B24Guaxky2Yk/We2hrLCJy
         GMcajbqUbrUr3W4zXJEs58VNhlS0emcFroL8TXxpvtFe4p6Q3L1D2PXglh3rvjT7LZiF
         Jh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753428678; x=1754033478;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAR0L4tKAdHOeUC6P7eOwKVX16yOZu9G1Gngkhj1Dxc=;
        b=FJtAvIBVgkvcWewRak0QrZ8FZUa5go5sJ6c7P6PR7mTkOXkZK4eT59JuU7pZioHKjg
         hSG00J/jIvaLOLwxIjK9cbsA08n6kG3Quck4e9TPqXv5LAbP4qMifNoZxDWdTFXyQ/Al
         ZEIMfI5wIbAaXVaE0q/PvyjRxo9HYi2cIx+LyK9eNtAPSLB+Ab4aissZKaWtom1T0Vv9
         k8MdydqNQXx5ax0aRfpOb80gbYP0A2QGLOg1qlcoCgj6zzkoJIOmf1umHVsEjBPVmymX
         FsKGjHhkwgC7yPqlXTp6DMeTMm3OpQYg5LnZQPS/GqUfTU4jb0nUpd7qA9ypARI2K5Wn
         ulmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNHr+v36/HwzlhCgRSFDE4I3gukxdyytpBofCE2pwD5GVutFstZs8JjGJu5h3iuE/tltxy6miBc4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbq9JyQ/Z/IcPmnaSSF/LDezjwAyhqDkkE6uC/0kRwbA2QbBBl
	16FrmJfkGxkBlF+CJwiAunFjfhlbLt6gyfuTLGhPiWTBJGppsJ0lARGOuPlI6Zlz5jA=
X-Gm-Gg: ASbGncubwNX1v/W3rJ/LCabcfrAfcLTzd12GYICkobqnkPHPFQI+pSLBMjkThvhJVkN
	b2eQWEvbDD0XPa6xEOri2pfvlRO9OISgNmcm0uJF7UiFlz424B9XRjWyzOBorZR6vtmX6DalqH6
	qIRRqUqf13PCZXCHETMmOO2SteTKKmXg+s1h2lob3KZwS3H5kX4ec8VUZJEqPqbv93V8bNJ/4Ba
	ha7XBD0bKEN3fe9W9DmOzd4HYL+Sn6IklBgPh2Mo9ww7iKM5Q2jNkJ6egG4SHQ0gcPG6o8x9AGX
	LoRmhFzrk0EZM1jcsMI101uKp9tvNygLc0mPYP50SXLPw+OSUuO9mzpaHzvKQaygd1SqyZst1/K
	/8JlywmnHXrlcyDkOwJjl8QhXC0qeq1v0yzReQ6WUJwRfbtZsuHOHDTWBHvc3B7DhbSq1Wuqlvd
	3J5j7JIBmx4VZ0WgLpskUUmTn2tyJ87NoIjo8OvycftaKs
X-Google-Smtp-Source: AGHT+IEBQjv7vEFxib7m7v4KVcTGtA4FZ22lA1VSRKSDOPMN7rjK8aqkN+gKUbbZkmCd9XtEXQg7pQ==
X-Received: by 2002:a17:907:9723:b0:ae3:5e70:332b with SMTP id a640c23a62f3a-af61d77ba46mr94428766b.52.1753428677840;
        Fri, 25 Jul 2025 00:31:17 -0700 (PDT)
Message-ID: <807e1207-489b-41d4-94f6-97867a4598c6@suse.com>
Date: Fri, 25 Jul 2025 09:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] tools/xenstored: Rename xenbus_master_domid ->
 xenbus_store_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-12-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-12-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ta1IMW0Yk63LCUXSD2GzSSKS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ta1IMW0Yk63LCUXSD2GzSSKS
Content-Type: multipart/mixed; boundary="------------5T9kXxTVtOi3lmqxhF5ToqRt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <807e1207-489b-41d4-94f6-97867a4598c6@suse.com>
Subject: Re: [PATCH v4 11/12] tools/xenstored: Rename xenbus_master_domid ->
 xenbus_store_domain
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-12-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-12-jason.andryuk@amd.com>

--------------5T9kXxTVtOi3lmqxhF5ToqRt
Content-Type: multipart/mixed; boundary="------------ipuUISCBi0t9ZNnXQl9ieYw5"

--------------ipuUISCBi0t9ZNnXQl9ieYw5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFJlbmFtZSB0aGUg
aGVscGVyIHRoYXQgYWNjZXNzIHN0b3JlX2RvbWlkIGFjY29yZGluZ2x5Lg0KPiANCj4gV2hp
bGUgZG9pbmcgdGhpcywgcmVuYW1lIHRoZSBpc19zdG9yZV9kb21haW4gdmFyaWFibGUuDQo+
IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29u
IEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0KV2l0aCBteSByZW1hcmsgb24g
dGhlIHByZXZpb3VzIHBhdGNoIHRoaXMgb25lIGNhbiBqdXN0IGJlIGRyb3BwZWQuDQoNCg0K
SnVlcmdlbg0K
--------------ipuUISCBi0t9ZNnXQl9ieYw5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ipuUISCBi0t9ZNnXQl9ieYw5--

--------------5T9kXxTVtOi3lmqxhF5ToqRt--

--------------ta1IMW0Yk63LCUXSD2GzSSKS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDMsUFAwAAAAAACgkQsN6d1ii/Ey+o
UwgAl+bkYLO97ZjZ/2tkn3yYZ63tXYO2WoOtmAaZZcS+MICrvk5rjDaMxbcwgA/1l08Agm+PpKWM
PFEURR7kIeKVztp+gkl/g3UurAZOmWJ7st4O+io4wkiifplkkmt1PGF3N87k5Ihw4lLiHUxEiZnz
4WYtYoRGTMV3AgktA0j3tpqN6Z4n1USbol3eBN1MZnMTM4GVhJzQ9bhpY/AUqjOi9L55yEwqZQa2
UlKtkcda2qkHRdzyqi0MdWxJEeGrRITnkKWTn9ATWPOaoJ7XPxrpJplqxXrB0FcArZ5LdPlKz6fw
dHX+to/8HkfFPStLIlUDY3GDLhqOHjWlgozlzGqyQQ==
=TmJc
-----END PGP SIGNATURE-----

--------------ta1IMW0Yk63LCUXSD2GzSSKS--


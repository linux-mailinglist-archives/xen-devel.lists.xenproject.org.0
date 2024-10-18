Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AF9A3AAF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 11:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821721.1235641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1jlM-0001cM-Bw; Fri, 18 Oct 2024 09:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821721.1235641; Fri, 18 Oct 2024 09:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1jlM-0001ah-9H; Fri, 18 Oct 2024 09:59:16 +0000
Received: by outflank-mailman (input) for mailman id 821721;
 Fri, 18 Oct 2024 09:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Ho2=RO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t1jlL-0001Zn-7K
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 09:59:15 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0fec28c-8d37-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 11:59:13 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so2472058a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 02:59:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68ae6394sm72592166b.84.2024.10.18.02.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 02:59:12 -0700 (PDT)
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
X-Inumbo-ID: a0fec28c-8d37-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729245553; x=1729850353; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4rqjNImrHSaZ2A+eBwfHKQRTUfZ0zzYSU9zXimlEN9Y=;
        b=H10MPMeo4sLGYS3rLbb47mLLSqKAlw1wiAC3969nVcXgtbuAbEIIdrE38pD6WgIovn
         Xwea/nNV1zbq1wpLMqRwKjByCDFNPK/i9XanG7//4eNORZxPLApplKHZl97E3iwIQn1K
         LZUCz7aRBUL1t4E0ZGmJykxr78RC4kWNJEOrkLz38Ly1ZyVqi8NrLIM4NaH1nbBv0iQG
         q8rPmyIZREPU1+mM8yD/f+/pQeHJIgeMfKxryyM7nuNo0MuNMGQcjg6yWNhydrMdNb5E
         6JthT4rwGaX0aiVLHZWVXMjHLQAUrYVv7WylvOUk4Bjw8lvxjwW3WBHJTlhUMe521qTo
         Qaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245553; x=1729850353;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rqjNImrHSaZ2A+eBwfHKQRTUfZ0zzYSU9zXimlEN9Y=;
        b=abb3TiYd1gTG+ZpJc1KBp500IsR1esCdXSATI68tUjpb8kIbnN+X35bX4iSjpkGvqd
         Tuz4gfwUJcKU8NymjPNgU/i1hMzAuA4Qey5pxw9jEFBduywP7nPPendu/Tb9t3c8xuQb
         MYDdE0+r/PBc7SlM0wvI7S9itpbB3CkeKFKxE8cVtcACrAzJxcFcv+7Q7Lo3OIXid4y1
         YHow4zuDqVeCgS/G/5z6yOr8lCh3mg64yQ5d88d+Hkdh1lGMSQ48bkO0fkxhpbi46bRy
         7BQAf452JjGW1m7ANDLD2/Xm24CKcDamwCsSkFRBtFYGqkmzq8Ytb+9Vga3EpqEApFBS
         tQQQ==
X-Gm-Message-State: AOJu0YweN6bi3M29a2/i+IMb0mpf16jUMV4Wni/3fMx0J2OiuetVY0JC
	kbIpryozvIZX3xWPdp6RJFC6OZsSiqSIg/KZHsK50ELIhBC58KSDl6BYb3qH7nE=
X-Google-Smtp-Source: AGHT+IE6/oaz3Cowp8yQ0wdd0YPB7iS5/TLsQm8EmObTB4MGX187ObsFNLt7Mf1m25k8pC5NZ8c2eQ==
X-Received: by 2002:a17:907:8f16:b0:a9a:11f5:8cd9 with SMTP id a640c23a62f3a-a9a69ca372dmr121338366b.56.1729245553061;
        Fri, 18 Oct 2024 02:59:13 -0700 (PDT)
Message-ID: <c46981c8-e7d9-48f6-937f-5e8059114208@suse.com>
Date: Fri, 18 Oct 2024 11:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Remove dependency between pciback and privcmd
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241012084537.1543059-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241012084537.1543059-1-Jiqian.Chen@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AmPFckrNgvwwbduhaYh8qahR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AmPFckrNgvwwbduhaYh8qahR
Content-Type: multipart/mixed; boundary="------------Ce1NOyyNmelfgX6ZLDWQaQxN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <c46981c8-e7d9-48f6-937f-5e8059114208@suse.com>
Subject: Re: [PATCH v4] xen: Remove dependency between pciback and privcmd
References: <20241012084537.1543059-1-Jiqian.Chen@amd.com>
In-Reply-To: <20241012084537.1543059-1-Jiqian.Chen@amd.com>

--------------Ce1NOyyNmelfgX6ZLDWQaQxN
Content-Type: multipart/mixed; boundary="------------pj1s4fBFEZDt0TOUWOFV3jlC"

--------------pj1s4fBFEZDt0TOUWOFV3jlC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTAuMjQgMTA6NDUsIEppcWlhbiBDaGVuIHdyb3RlOg0KPiBDb21taXQgMmZhZTZi
YjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0byBnZXQgZ3NpIGZyb20g
ZGV2IikNCj4gYWRkcyBhIHdlYWsgcmV2ZXJzZSBkZXBlbmRlbmN5IHRvIHRoZSBjb25maWcg
WEVOX1BSSVZDTUQgZGVmaW5pdGlvbiwgdGhhdA0KPiBkZXBlbmRlbmN5IGNhdXNlcyB4ZW4t
cHJpdmNtZCBjYW4ndCBiZSBsb2FkZWQgb24gZG9tVSwgYmVjYXVzZSBkZXBlbmRlbnQNCj4g
eGVuLXBjaWJhY2sgaXNuJ3QgYWx3YXlzIGJlIGxvYWRlZCBzdWNjZXNzZnVsbHkgb24gZG9t
VS4NCj4gDQo+IFRvIHNvbHZlIGFib3ZlIHByb2JsZW0sIHJlbW92ZSB0aGF0IGRlcGVuZGVu
Y3ksIGFuZCBkbyBub3QgY2FsbA0KPiBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKCkgZGly
ZWN0bHksIGluc3RlYWQgYWRkIGEgaG9vayBpbg0KPiBkcml2ZXJzL3hlbi9hcGNpLmMsIHhl
bi1wY2liYWNrIHJlZ2lzdGVyIHRoZSByZWFsIGNhbGwgZnVuY3Rpb24sIHRoZW4gaW4NCj4g
cHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaSBjYWxsIHRoYXQgaG9vay4NCj4gDQo+IEZp
eGVzOiAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBzeXNjYWxsIHRvIGdl
dCBnc2kgZnJvbSBkZXYiKQ0KPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------pj1s4fBFEZDt0TOUWOFV3jlC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pj1s4fBFEZDt0TOUWOFV3jlC--

--------------Ce1NOyyNmelfgX6ZLDWQaQxN--

--------------AmPFckrNgvwwbduhaYh8qahR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcSMXAFAwAAAAAACgkQsN6d1ii/Ey+h
rQf/W/FjhT9zrxkOAN9UuDMjD0vzF0e41ptS9YFlrjdWeJvDZJsPCjQNXvSdAWMOrTlqRORXw+HP
D9n2WnI6CDTTYjQeY01ehsMCil9M7F5u3bXN7k0Am+bDao1g19XKmTA4LvhGX3RpyRNkbwwowkOr
nRm9dcczcHbQi8lkhlePgdqTvhYT5LxA9Rah5gjv0th0hJZVGTLb9jEVSBwfi0HrK7OrHW3jCZrD
885z7o/jnJVs5m6jXy8fRnIr5ZD2ahhFZ/MiVfOuGRyeBSVVOG84DQ6iVRMEMDxtbm8n2Uj6QnKr
LfMmFhDYGRv3WTa30NfVQZeweqDetVUnXN9MVHmOCw==
=Avxp
-----END PGP SIGNATURE-----

--------------AmPFckrNgvwwbduhaYh8qahR--


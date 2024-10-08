Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA63994400
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812914.1225654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6MR-00080B-KJ; Tue, 08 Oct 2024 09:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812914.1225654; Tue, 08 Oct 2024 09:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6MR-0007xK-HB; Tue, 08 Oct 2024 09:18:31 +0000
Received: by outflank-mailman (input) for mailman id 812914;
 Tue, 08 Oct 2024 09:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CgLP=RE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sy6MQ-0007xD-4T
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:18:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a048d8-8556-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 11:18:28 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4305413aec9so2943385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 02:18:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86b44380sm121058075e9.34.2024.10.08.02.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 02:18:27 -0700 (PDT)
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
X-Inumbo-ID: 47a048d8-8556-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728379108; x=1728983908; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlnU4XgnFcBmUh04YYKcHcjGGK3C6aHa7qrv7S+FCDM=;
        b=fe1YroYLpwK4v+BJAS/AFs3EhH8H273o44uUBGA+YLMCx98pAVbEICmMJ63SI6fXZr
         Xq8hvD917nyaGLx5toLOCVU6dSSjlZEi9HmpTXtXxvGvR/QE8On/64RrmHA5XX4W5zqZ
         0g31+sqTlSWUqrmGuP6uV2Jkd7jRY703dhWqgz/9BxQqLZWU9NzGDDaosra8P2y0XOFP
         btZRVdXiUuHNwK9FfBhmQi1LNVCjbp7Jmtp2BWfssR2cIgr19Sim3m5totHkMNwBHeeZ
         Jfh7szqtWxoDl33NI9RcPAawG35G37cwDMtr7T7al6sOrUtRal786FCVdpXfWPU96G35
         27eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379108; x=1728983908;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlnU4XgnFcBmUh04YYKcHcjGGK3C6aHa7qrv7S+FCDM=;
        b=ttJGgX8A2U3XW3rLgI5wwEqO0oF5Ixk4EQfvIOKSBxvCOPGcTgI5Auvo2PDSImx6HA
         841wsYKvHZ0QrkPdj8p7QTZF372OTw2syD1E8TqODdM4egTAeJdswrtSqv+gATs0IXUi
         qOT5sKKOeIeEk6+2Q9CYHS8GewTO8HMAmCX08IOl1dFSsvNKFM3IwRAMe9zZ/EiY582s
         wuP3xKhlFOR+WlWQR815FefV0wHB9as7xi9hzvqD8cRAhEbV7TQjwYpt4s63463KRyZu
         LFwfBjFfiNE/n7tnri/zFBgYmbJKQXGfhI9neUkQzF7FywAYIo8iH8IAA9AqVoaUz4HS
         4sfw==
X-Forwarded-Encrypted: i=1; AJvYcCW7fOiXFlAxojheFv8SY3O28fUn920HP0aKt3LzNBG2avvQEqdnky24rAAwDknQdheU5fJBjHjLKnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaYVuAvHCcSqDzJQ3YAoKSlSZimc18WbVCVJWYykpYXcG6WwSS
	lPizznkyPGXYM6y6Ej/G45J3FY2kOG4eMU4E0G1aT7NvNS9p8UkunwSVA1vp6wQ=
X-Google-Smtp-Source: AGHT+IEvwmWJgw9Lo/VaTgMlZ8apwFiDbaYv77mTkjbIWNeHOMQDM7k/jgV2kqDgK8SISNTwpChV3A==
X-Received: by 2002:a05:600c:1da8:b0:426:5fbc:f319 with SMTP id 5b1f17b1804b1-42f85aef6edmr111732375e9.33.1728379108180;
        Tue, 08 Oct 2024 02:18:28 -0700 (PDT)
Message-ID: <5b4233fc-ea12-4b19-bff9-dfb6c6c43832@suse.com>
Date: Tue, 8 Oct 2024 11:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config
 options
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-3-jgross@suse.com> <ZwRXvG4a2Jtgba2s@begin>
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
In-Reply-To: <ZwRXvG4a2Jtgba2s@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z2i7HuoZA5rLOyG7aZj0MOiO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z2i7HuoZA5rLOyG7aZj0MOiO
Content-Type: multipart/mixed; boundary="------------50wf0jqV05phGBcWWWfdT1eP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
Message-ID: <5b4233fc-ea12-4b19-bff9-dfb6c6c43832@suse.com>
Subject: Re: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config
 options
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-3-jgross@suse.com> <ZwRXvG4a2Jtgba2s@begin>
In-Reply-To: <ZwRXvG4a2Jtgba2s@begin>

--------------50wf0jqV05phGBcWWWfdT1eP
Content-Type: multipart/mixed; boundary="------------Ol4E1B5bS0KZhH0YJoQlqj2I"

--------------Ol4E1B5bS0KZhH0YJoQlqj2I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTAuMjQgMjM6NTAsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+IGRpZmYgLS1n
aXQgYS9zdHViZG9tL2dydWIvbWluaW9zLmNmZyBiL3N0dWJkb20vZ3J1Yi9taW5pb3MuY2Zn
DQo+PiBpbmRleCA4ZGY0OTA5MmNkLi41MTQ1YjM1N2UwIDEwMDY0NA0KPj4gLS0tIGEvc3R1
YmRvbS9ncnViL21pbmlvcy5jZmcNCj4+ICsrKyBiL3N0dWJkb20vZ3J1Yi9taW5pb3MuY2Zn
DQo+PiBAQCAtMSwzICsxLDQgQEANCj4+IC1DT05GSUdfU1RBUlRfTkVUV09SSz1uDQo+PiAr
Q09ORklHX0xJQkM9eQ0KPj4gK0NPTkZJR19MV0lQPW4NCj4+ICAgQ09ORklHX1NQQVJTRV9C
U1M9bg0KPj4gICBDT05GSUdfVFBNRlJPTlQ9eQ0KPiANCj4gR3J1YiBkb2VzIHVzZSBMV0lQ
LCBhbmQganVzdCBkb2VzIG5vdCB3YW50IG1pbmktb3MgdG8gc3RhcnQgbmV0d29yaw0KPiBh
dXRvbWF0aWNhbGx5LCBncnViIGRvZXMgc28gYnkgaXRzZWxmIGZyb20gbWluaW9zX3Byb2Jl
Lg0KDQpBcmUgeW91IHN1cmU/IExXSVBESVIgaXNuJ3QgYmVpbmcgc2V0IGZvciBidWlsZGlu
ZyBncnViLXN0dWJkb20uIEhvdw0KZG9lcyB0aGlzIHdvcms/DQoNCg0KSnVlcmdlbg0K
--------------Ol4E1B5bS0KZhH0YJoQlqj2I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Ol4E1B5bS0KZhH0YJoQlqj2I--

--------------50wf0jqV05phGBcWWWfdT1eP--

--------------Z2i7HuoZA5rLOyG7aZj0MOiO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcE+OIFAwAAAAAACgkQsN6d1ii/Ey9N
PggAkGedjuw2pjGpTMbqXdNZQI9vWiKd6N/kmc5JQnzUqMgrA7N4zNkhpz2LLfyvaYKXKpZLN5cZ
PqkBwFcq1odKu6xf0hqYO3Z5pY+dCcNv8X86o+psvwLmCMXNU4er3SL786fLQu7KaXUhjIseDrHi
lJGqKBQPpKmGXdsy4s3j3hfEElyefL1jFyRrP0JE0Ao17mwUWVo4NmQ0iIEYesKUqDi7yqE8EkQj
yw8G+anaggJMn5qL/XPeq+I+Z9FqWkuuw0+5TecgrKLW/PESYQ5TwJTv6v0bHSJoLf9m339skGA+
lf5jAPD2IVIgm9lv6s3Cr3ktIenL/qFlNSz0ZpoTAA==
=H/eP
-----END PGP SIGNATURE-----

--------------Z2i7HuoZA5rLOyG7aZj0MOiO--


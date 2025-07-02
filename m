Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19261AF1157
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030868.1404541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuQz-0001if-6b; Wed, 02 Jul 2025 10:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030868.1404541; Wed, 02 Jul 2025 10:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuQz-0001h9-3R; Wed, 02 Jul 2025 10:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1030868;
 Wed, 02 Jul 2025 10:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWuQx-0001gi-31
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:11:19 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e29012d8-572c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 12:11:14 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so3911275f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:11:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:8700:7f00:1496:8b57:2e38:232c?
 (p200300e587007f0014968b572e38232c.dip0.t-ipconnect.de.
 [2003:e5:8700:7f00:1496:8b57:2e38:232c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7386sm15501449f8f.20.2025.07.02.03.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:11:13 -0700 (PDT)
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
X-Inumbo-ID: e29012d8-572c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751451073; x=1752055873; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iB+0x0BCzpcjWc5TWOLLX3vYlUjQLWtqal5bB6mdfeU=;
        b=TtlfozgQyNETYUjFHjTCf7a9uGVHk7eBeJiVLvNB2WJNEiVuh0hVvXuMIRLQ5CK9yf
         B6mKKs/vT0nHxXcKoxJCkpPEHqmBMixm0JOAJ19/4iryFEvM/1AGy1P19YaOcc1yY9XL
         HryrkFWTpappAnzKLmJO24KaAvmv5rizBx65qnktvqcKTWFybwJ7gNIoK3islmIk2gzs
         QjM+mfyZYBBMg1i0GZmkbToVFAIy8d5ipwV+dThglFMt4XS0f2bSQ4VYbDLjUqM2TL6O
         Dy5hkCzp7YWKZa8A2/OY3abdLXAa2v2PS8/v2QhDGdo0cKVk0b/qAsZqXqpiN6Aer3T7
         z1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451073; x=1752055873;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB+0x0BCzpcjWc5TWOLLX3vYlUjQLWtqal5bB6mdfeU=;
        b=IwxgOlsPhDqnUjpdSFhS49Aiz+85dAGoFVWcU2rMQgKtHUffZ1e+ZfHh0SiS7gkNTg
         XS0HvM9U8Ct+zziN/cXIbNWJIRmmas9O+Ak1yAzGTDDVtMtriirrEMm8r1bakfm4e4uY
         gJSXkuVc4L3h6AC+7RDNMm7xTe18nrgtb7sVfsevILgLMODoOhQLQQq1AQ+Ti6ZQCdVf
         Isx7+Zf6kQn4nRBqd9HWfp6QDVzNdqt7j751CVfSD0fkiqFcw2Bnk93VaMOkMGFvhUt8
         ZmAfiSLyCbel5AWTw9nOjb7fkGK+cJ1oY6hrD0HHuK9btSsDdCAGtEiPzb9SOWTvsH1+
         WRmw==
X-Forwarded-Encrypted: i=1; AJvYcCVBO+Ig72IZwo4E1w2ipfKp7w2+kbgWHgYLBV66ZYafIOrFtKKpBy5r9VmyuSjpTWSQ7fn4iXfFKBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuQ/kjdBGmu/qSTgEUyrvK3twyQr1dX9+W0OP/XyLvWuvo4fIG
	yg26Xj00RtjAHZ6PFmxVssJBWG0C+Fl3cEzg43yfCwoVVLn5S5snzLE91RoOaR614eVyEqUMIC3
	9dN4h
X-Gm-Gg: ASbGncuXXooCb5Wk8Rlui3B5WGLPgRp0fncgdV1r49zi+P9HIKmOB8mhR6Xy/LQxeUf
	aeFEuPwukWDRU8Drvnk0/h3QCBoMld/26vRKvBe4kdfcxdUDvT8SizwuIVC1i4PhzSN553P3YX3
	rtpVtR0f3gtt3ZMgHAt8YVM+qPlvJNOHzHf8HkfuBjZmxZ+KJdv2Ot0Re/IJJq+hjQ9a00u5Fm3
	2vFs8qBrbwW/Y3/CbZ7RRzJ8YLTbHVgHPCSbkyChS41fl09FClj72APDSP69b+9ja1G0Xy7vAP9
	1AhzOux6rKbh4ZJLRaVu4vgmgavPjxO9MuGEXqTWKmylTFF1RWUAFQla0XlmgoYBF1TTbkkbF35
	3Ofw+1cYh09Brnq5l8ohZ7TTXeyzIrx/Y28FccwJrB3YkPF2FMdhmFchAr6FZsAAev5Jf1UM40f
	5Jmf9jzEPLD8U=
X-Google-Smtp-Source: AGHT+IH2qC396Ok7NZXJk6EY9jAVncfD/+VHEFkK/OxrxKi2w0l4Izvg/f70FghCIBwDk3jz3+s3mw==
X-Received: by 2002:a05:6000:2809:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3b2001acb8fmr1096869f8f.36.1751451073465;
        Wed, 02 Jul 2025 03:11:13 -0700 (PDT)
Message-ID: <baab0081-ae65-42a0-8d56-040d9c9cf420@suse.com>
Date: Wed, 2 Jul 2025 12:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/golang: update auto-generated libxl based types
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250702095639.90927-1-roger.pau@citrix.com>
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
In-Reply-To: <20250702095639.90927-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JOwVxKzSdJw06i7ksMNPUodd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JOwVxKzSdJw06i7ksMNPUodd
Content-Type: multipart/mixed; boundary="------------9tfnhEKI0USAyJWkLH3GX3iY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <baab0081-ae65-42a0-8d56-040d9c9cf420@suse.com>
Subject: Re: [PATCH] tools/golang: update auto-generated libxl based types
References: <20250702095639.90927-1-roger.pau@citrix.com>
In-Reply-To: <20250702095639.90927-1-roger.pau@citrix.com>

--------------9tfnhEKI0USAyJWkLH3GX3iY
Content-Type: multipart/mixed; boundary="------------g6gQajHV2xtYJiFqviUw7YrN"

--------------g6gQajHV2xtYJiFqviUw7YrN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDcuMjUgMTE6NTYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gQXMgYSByZXN1
bHQgb2YgdGhlIGFkZGl0aW9uIG9mIGEgbmV3IGZpZWxkIGluIGxpYnhsIGRvbWFpbiBidWls
ZCBpbmZvDQo+IHN0cnVjdHVyZSB0aGUgZ29sYW5nIHR5cGVzIG5lZWQgdG8gYmUgcmVnbmVy
YXRlZCwgdGhpcyB3YXMgbWlzc2luZyBhcyBwYXJ0DQo+IG9mIDIyNjUwZDYwNTQuDQo+IA0K
PiBSZWdlbmVyYXRlIHRoZSBoZWFkZXJzIG5vdy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IEZpeGVzOiAyMjY1MGQ2MDU0NjIgKCd4
ODYvaHZtbG9hZGVyOiBzZWxlY3QgeGVuIHBsYXRmb3JtIHBjaSBNTUlPIEJBUiBVQyBvciBX
QiBNVFJSIGNhY2hlIGF0dHJpYnV0ZScpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------g6gQajHV2xtYJiFqviUw7YrN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------g6gQajHV2xtYJiFqviUw7YrN--

--------------9tfnhEKI0USAyJWkLH3GX3iY--

--------------JOwVxKzSdJw06i7ksMNPUodd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhlBcAFAwAAAAAACgkQsN6d1ii/Ey92
tAgAh3sOO3fIwqQ5F9FXNVe+XktlKrbCsIvQxCCr+WZDmK1GabCgxm9qDoEgOJ20fHIO4rgZaiYe
M7yfDsmjyYEAF2g06cAHzIFRZ5hBbNtT8aCHyYbkk8aImUE+1+HrUa1DvlykLcmgXuFABCHdoDbW
G0gaCz1ODfkKnPYBvMXBzOnqv+slbxsnNQUtxnO4yG6E7aOfp32/KxqZWThHvGskiYrum3N9f1k7
r64w6l0VHqN6ddtGyh4e7A2ViObjVGeTIFJ7+nGpH10Ai2I7JMbefw1+Zv6TsLemzH3VXBy8WB3p
lK7dXJevafewR6RcTQx45hn8TvgyFaST+lG0r4HJWA==
=IzW0
-----END PGP SIGNATURE-----

--------------JOwVxKzSdJw06i7ksMNPUodd--


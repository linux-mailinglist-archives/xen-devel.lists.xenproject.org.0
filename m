Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599C989FAF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807207.1218506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDvr-0004wE-TE; Mon, 30 Sep 2024 10:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807207.1218506; Mon, 30 Sep 2024 10:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDvr-0004tz-QT; Mon, 30 Sep 2024 10:47:11 +0000
Received: by outflank-mailman (input) for mailman id 807207;
 Mon, 30 Sep 2024 10:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2FLj=Q4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1svDvp-0004tt-P2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 10:47:09 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56502f6f-7f19-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 12:47:07 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c71f1396e4so5311212a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 03:47:07 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245e990sm4314142a12.52.2024.09.30.03.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 03:47:06 -0700 (PDT)
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
X-Inumbo-ID: 56502f6f-7f19-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727693226; x=1728298026; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ao+LRs1XoQz1P06fH12+5l1sB5B65wYj/uSqNqdb0+0=;
        b=NNuE1bdY913xhnUvWU0YjE+4nly3TY1GEh0fn/Ec2mYqyS3ycQd2QQBt4H73hyCCI4
         J4WLnAvaFN7t5TEg9BbfrL98Occ4Y+EJYCVnGzHSIg/1+ksdyV1eiArZFBlC+oZkVcCs
         2+K2aSpD4qZdKh4fBX/mcyS9FX8SSo/aAlD1JC2q63mH/PAlYLKLQL3NgeOpZyk7eU7J
         0lPTwDwjTZO7XHS+5xkvCXWObWsa8SmU4LKOoIDSrDWyDYDZbNyKV/OYZuHjK9y4s4+K
         FLn73/KvP7Zu9wzqz+1ZAnxYdT6yY5/W23mbUYr/X+4x45lnddO/x+IRoiSktTRgkCsm
         +Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693226; x=1728298026;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ao+LRs1XoQz1P06fH12+5l1sB5B65wYj/uSqNqdb0+0=;
        b=UKzc0rD9VEesvlkQQFkodO9f+ZNFJwhdY9q8om+mWYK2DxyONenkuOnbGxUKZa6qlY
         rVItw4TWy3n2zQtnBX2biej7IVUP7YrzPtG3FzCe85MuK8IC0SnKr3k9pV+yA87DmlFU
         a2FfWDqcA2sRd4heqWTv2tbolmXBfT4fPqSmdRlI4lMk8UM6xdU0Nw+xzFBT6z+FJ+Fa
         JWyUm8V/0lkVaLv6v9z9K7Pyqsyq8E3X95IkEU+aw9hzvzBg0I3JFWzd0mB4pfFYaeXq
         FyZrcvXonj25s2RaN4Ynn6UG55r3KjeuIiwua7NOw300IRyuIJSqm4m88OO4GiIZSoe5
         EzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUweTQFfEeYYTZ1QpxVETo7JqJa1ZjeljYbNSGEQbW/MNuQDc9Dlu7lTg1QkOBsM8fX5fEOdOesfeE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9CTymf8ZJWU6+WdOkg38wd0Pl/f9h3E/1HiTii/FXa1/AbdKu
	jKAFzYm7UvMxCNYS/iTFCT/GPTWAtlYReyvpEA1w6z9FzcacZz9SpksN8ajGCwQ=
X-Google-Smtp-Source: AGHT+IEsiqN8PN9XPakbZut5c5B1JwST+qP4mTd08GJfvdaiyyQjqym6xFUbrn8lAXARktXpjJDjEQ==
X-Received: by 2002:a05:6402:5203:b0:5c8:8fe7:739c with SMTP id 4fb4d7f45d1cf-5c88fe7753amr4189870a12.7.1727693226478;
        Mon, 30 Sep 2024 03:47:06 -0700 (PDT)
Message-ID: <2f589a3d-91c9-4ebb-9206-97dd418fba47@suse.com>
Date: Mon, 30 Sep 2024 12:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix config option reference in XEN_PRIVCMD
 definition
To: Lukas Bulwahn <lbulwahn@redhat.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20240930090650.429813-1-lukas.bulwahn@redhat.com>
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
In-Reply-To: <20240930090650.429813-1-lukas.bulwahn@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VC7ijhQQ1OR8bXsGkE3wS3yb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VC7ijhQQ1OR8bXsGkE3wS3yb
Content-Type: multipart/mixed; boundary="------------RdCSKKeehgV62wBlowbHNvAk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Message-ID: <2f589a3d-91c9-4ebb-9206-97dd418fba47@suse.com>
Subject: Re: [PATCH] xen: Fix config option reference in XEN_PRIVCMD
 definition
References: <20240930090650.429813-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20240930090650.429813-1-lukas.bulwahn@redhat.com>

--------------RdCSKKeehgV62wBlowbHNvAk
Content-Type: multipart/mixed; boundary="------------T4rLNh4WFf3MVKVM9IdGtEUz"

--------------T4rLNh4WFf3MVKVM9IdGtEUz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDkuMjQgMTE6MDYsIEx1a2FzIEJ1bHdhaG4gd3JvdGU6DQo+IEZyb206IEx1a2Fz
IEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AcmVkaGF0LmNvbT4NCj4gDQo+IENvbW1pdCAyZmFl
NmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBzeXNjYWxsIHRvIGdldCBnc2kgZnJv
bSBkZXYiKQ0KPiBhZGRzIGEgd2VhayByZXZlcnNlIGRlcGVuZGVuY3kgdG8gdGhlIGNvbmZp
ZyBYRU5fUFJJVkNNRCBkZWZpbml0aW9uLA0KPiByZWZlcnJpbmcgdG8gQ09ORklHX1hFTl9Q
Q0lERVZfQkFDS0VORC4gSW4gS2NvbmZpZyBmaWxlcywgb25lIHJlZmVycyB0bw0KPiBjb25m
aWcgb3B0aW9ucyB3aXRob3V0IHRoZSBDT05GSUcgcHJlZml4LCB0aG91Z2guIFNvIGluIGl0
cyBjdXJyZW50IGZvcm0sDQo+IHRoaXMgZG9lcyBub3QgY3JlYXRlIHRoZSByZXZlcnNlIGRl
cGVuZGVuY3kgYXMgaW50ZW5kZWQsIGJ1dCBpcyBhbg0KPiBhdHRyaWJ1dGUgd2l0aCBubyBl
ZmZlY3QuDQo+IA0KPiBSZWZlciB0byB0aGUgaW50ZW5kZWQgY29uZmlnIG9wdGlvbiBYRU5f
UENJREVWX0JBQ0tFTkQgaW4gdGhlIFhFTl9QUklWQ01EDQo+IGRlZmluaXRpb24uDQo+IA0K
PiBGaXhlczogMmZhZTZiYjdiZTMyICgieGVuL3ByaXZjbWQ6IEFkZCBuZXcgc3lzY2FsbCB0
byBnZXQgZ3NpIGZyb20gZGV2IikNCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgQnVsd2FobiA8
bHVrYXMuYnVsd2FobkByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KDQpUaGFua3MgZm9yIHRoZSBmaXghDQoNCg0KSnVlcmdl
bg0KDQo=
--------------T4rLNh4WFf3MVKVM9IdGtEUz
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

--------------T4rLNh4WFf3MVKVM9IdGtEUz--

--------------RdCSKKeehgV62wBlowbHNvAk--

--------------VC7ijhQQ1OR8bXsGkE3wS3yb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmb6gakFAwAAAAAACgkQsN6d1ii/Ey99
kwf/dSv6dy3yrmpTlaXzpJil9FqrEO+dzqANIx9bAIwa0byNVv2n5RzhOxijyh65qNcrkwPwtzdf
5S55lVDAzF28cXo8V6hrn6rLOhX9JSMloUH3UHINwc9fsQ8OJmZ1RNwRTEISFMzr3XwxqQJZvS+u
jfig+SnIibRElcGyGEBqBspOrxuhvDfrOhs/zceiQ+ORCGNj113R96wSKz1JYZ65+7o77/B4tRiM
6Vk2ZKfgeL5+ysJBmiDcDwireo32aBdvZJnfzaBy/n6Nxw4BfJpHTYQPD7q/FqY+vSLw5vbOS1es
E7+lWy6+31GxY7NP8Sd9pQ8GAhjRUvTamkCFY0HmOQ==
=17Y+
-----END PGP SIGNATURE-----

--------------VC7ijhQQ1OR8bXsGkE3wS3yb--


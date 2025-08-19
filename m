Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C0B2B984
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 08:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086334.1444513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoFwd-0003RQ-5b; Tue, 19 Aug 2025 06:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086334.1444513; Tue, 19 Aug 2025 06:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoFwd-0003Ok-2c; Tue, 19 Aug 2025 06:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1086334;
 Tue, 19 Aug 2025 06:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zj8/=27=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uoFwb-0003Oe-7Z
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 06:35:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b899538e-7cc6-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 08:35:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso26996655e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 23:35:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a8670dsm26677285e9.16.2025.08.18.23.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:35:38 -0700 (PDT)
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
X-Inumbo-ID: b899538e-7cc6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755585339; x=1756190139; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s0DY+hzoJR4aPStnCVzJhld5S750sZJAFIORH8pKcno=;
        b=AZYnz/e9qA0ScANvk2JYTvcVzZlezfTA+LkP1pF73lQqYyMppCjuhf1sLzUYTGtIDE
         HDD6FpYa3HWceEm2KCzlRPHArd+BH48vV3sZcQuFQltupAgPSYbzpyFs7TXwaBWcEZcq
         t1iPVnfTWpLekVjN8jnWMQ+W9ekc+ugVMhSJHtfE5R9VjOukdnWoEFpCljlGCqdCapAZ
         pQtuhJjctE6F282fAOwxeVR0NVK76gfSow1OmmG+wM6hMj87V0/tUZhjMycXfPlR9MGO
         aEyuvr+0FtX5ta183qdUdYXgA4Z09Rpvja7Qm6Yv8VbiOgiTRhppD1V5c5elRNFXvAgj
         6KJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585339; x=1756190139;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0DY+hzoJR4aPStnCVzJhld5S750sZJAFIORH8pKcno=;
        b=Z91qMaXBv6NwJZh9CHmozy5hn/zmJQGmvkLhcmm9eabvQOpcuqa7jYkzwPdVLudkpM
         AUPUETHHIPYnCPIsktW9939F66Q5vRk/k9V5OYcrEnPAAaNneI8wNkyBzgr39g4y+6k2
         Aii3iJxODSuPwWKAtW8rYhViAua4xzfuPX7CavfSwCSbXMeovwTDa9l7WK9dRoJi9RZi
         gGEujiiXXpNSsdi7xPEj85CUya8yaRfmwJVCYROmBisQi+glYvuIFzzqoMrCn8vkA9Jo
         AtkKv8yhIF6Fh4NgwqipIAl2WrGjoS3aZl3NHU25gS9gg9mejGcBC41TF2jzHenFUpDY
         O1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+B+LPjB7gmEKHHYfUkJpOzwXl5/GqEtWJKDXZ4OH60TYu0DtF9Hh7ogq9ngpFKEMdOw/3oWupSJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLvDcBE8uqkfRmkW9aUs568hnJBCgo7+bYeZALjTEBtaWwDVzI
	btOUGAEMuegqUBU3262EK599z6X6kx1lPvVAgnv26BVl+q6WZEvSPVjl3eCZUv8sZ3E=
X-Gm-Gg: ASbGnctr1ZfXhHFiF916xdM9NBekEb07B4LAWdSuoIw7GuxKIgHI/vptFlhWH6JDBM1
	e18LEWFVUMFT3sR+eIg6TKqV6JvCG6s5oLwvUrsHA6eJux5ZXd4SCYE1tsnrk6WY1jdDOdlCy4u
	G5zktqwzkvdbFbfEn5++QbdR5FanUIfRjv+jeOQv5UGgg3ScGcEpAtJzxdTxaxwVTfOzN1Qll5S
	qbvCIZb+TdJsJnjfCmRkIMFFU/9+fKA5gjajuMfdcK8OtdfkXc0HJfI2Lf2Wc3DBCSR7P9tTS5M
	mwoH+m7/VTA24p2VRj6GUJsGoM5n7rISOODO6pUxw+Uimv8LJHPXpEK3dWqdjQjK7lZDdS2RE59
	Hv5pxbWeZu1P1BmaU/UbCYxIYflOfh9LCe7r9+827tK3KsgsAS4b30WM1C/9EHH/or79wpzIWFc
	OeZ2kBijqtUy9sZbXpWz+c6Oli+04rHzLRTiCsdfbUzLpXEZy1W3WKe9zqJw==
X-Google-Smtp-Source: AGHT+IFtUZOm0wFVz4zGXwJa59y1P4SKcixrdW2tIsMtq0MQe9GcYR/eZQRfpBe4pgY2Nnx6gj3xdA==
X-Received: by 2002:a05:600c:3b83:b0:459:dfa8:b854 with SMTP id 5b1f17b1804b1-45b43db7044mr9106015e9.5.1755585338536;
        Mon, 18 Aug 2025 23:35:38 -0700 (PDT)
Message-ID: <25dadb00-15ed-44f3-a325-9d96b9ef871e@suse.com>
Date: Tue, 19 Aug 2025 08:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] tools/xenstored: Check NULL domain in
 domain_chk_quota()
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
 <20250815213556.90068-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250815213556.90068-5-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EfHOjnOQ1QN0dNwwmcE2Tpu7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EfHOjnOQ1QN0dNwwmcE2Tpu7
Content-Type: multipart/mixed; boundary="------------uNUMUuQcqfXFmjRybN63Dk8L";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <25dadb00-15ed-44f3-a325-9d96b9ef871e@suse.com>
Subject: Re: [PATCH v6 4/8] tools/xenstored: Check NULL domain in
 domain_chk_quota()
References: <20250815213556.90068-1-jason.andryuk@amd.com>
 <20250815213556.90068-5-jason.andryuk@amd.com>
In-Reply-To: <20250815213556.90068-5-jason.andryuk@amd.com>

--------------uNUMUuQcqfXFmjRybN63Dk8L
Content-Type: multipart/mixed; boundary="------------Cva7dPcle5pfz2200k2k0CR7"

--------------Cva7dPcle5pfz2200k2k0CR7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjUgMjM6MzUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFdpdGggc2VwYXJh
dGUgY29udHJvbCBhbmQgeGVuc3RvcmUgZG9tYWlucywgdGhlIHhlbnN0b3JlIGRvbWFpbiBp
dHNlbGYNCj4gaXMgbm8gbG9uZ2VyIHByaXZpbGVnZWQuICBMb2NhbCBzb2NrZXQgY29ubmVj
dGlvbnMgZG8gbm90IGhhdmUNCj4gY29ubi0+ZG9tYWluIGFzc2lnbmVkLCBidXQgZG9tYWlu
X2Noa19xdW90YSgpIHdpbGwgZ28gYWhlYWQgYW5kDQo+IGRlcmVmZXJlbmNlIGl0LiAgVGhl
ICFkb21pZF9pc191bnByaXZpbGVnZWQoY29ubi0+aWQpIGNoZWNrIHVzdWFsbHkNCj4gbWVh
bnMgdGhlIGZ1bmN0aW9uIHdvdWxkIGhhdmUgYWxyZWFkeSByZXR1cm5lZC4NCj4gDQo+IEJh
aWwgb3V0IG9uICFjb25uLT5kb21haW4gdG8gYXZvaWQgZmF1bHRpbmcuICBUaGlzIGFkZHMg
YSBzaW1pbGFyIGNoZWNrDQo+IHRvIHRoYXQgaW4gZG9tYWluX21heF9jaGsoKQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0K
DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1
ZXJnZW4NCg==
--------------Cva7dPcle5pfz2200k2k0CR7
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

--------------Cva7dPcle5pfz2200k2k0CR7--

--------------uNUMUuQcqfXFmjRybN63Dk8L--

--------------EfHOjnOQ1QN0dNwwmcE2Tpu7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmikGzkFAwAAAAAACgkQsN6d1ii/Ey+q
uwf+Pfpe5LhDfQ/nnuusAw6VteDvEHnlz/PLfmyL8YwmsI9/v8BtLLTp/m0jg6i6Krrp9d3d7Lqx
45ogusiLLeTq3DE7SJ/cwg6xU3VmeFPp7AQXUZ7fVt0TkT8PF5q8wWMMzZ4F6FBvBl7eNO6f8nDU
2K1BWO1YSjZK1O6AcIuAzSZ0pkWkwFxtoZ+8PI0L66o0G+6iWd3bMi40LDNI6MCOQs+4iTXSZwSO
M1HRIBxOnaPpu2Zqv/SMPCMFHKIuGVSs+SXaCpK99+pxrsqhD7+iEaDsiaGzEqj2QyBgH/Fb0OmB
OZIQiM+jIlbbc70JzE73WRndKkGFz68ZGdpAcYohpQ==
=N1TY
-----END PGP SIGNATURE-----

--------------EfHOjnOQ1QN0dNwwmcE2Tpu7--


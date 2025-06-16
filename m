Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B56ADA898
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016651.1393589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hY-0002fB-77; Mon, 16 Jun 2025 06:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016651.1393589; Mon, 16 Jun 2025 06:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hY-0002dD-3i; Mon, 16 Jun 2025 06:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1016651;
 Mon, 16 Jun 2025 06:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR3Y9-0008AT-FQ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e80e5c-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:33 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-606fdbd20afso8406771a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 23:42:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8153529sm592184866b.23.2025.06.15.23.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 23:42:32 -0700 (PDT)
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
X-Inumbo-ID: 14e80e5c-4a7d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750056152; x=1750660952; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYFCQ6WsVUgyRd9/IeuXOI9XFmcm/xfYT+Apb/Pdycw=;
        b=J8HsgQTLFVDTtsecjMJRpZR0zcxIks+AXi12KUWMLXxK1pCFM7F6PvJrHt7vIXAZ1H
         t/z15WD9N15C+RIJFWXZOWNSL4Aa7qno3wZDUtd8FRo2QFvj2CNUi8PdhdQzJcbD6ASL
         Y5M3ssaE0JC/QzVLNhBI4SQm4rWu9JrxpwbMc9ypjbetGNF/ybjASPINXqcdOsx60Rrr
         irA2QQ2ScN1tE4iX0Ze0ks2oIbHMGYuJynSZOnhWZcp6UMGVkyHFuSK8VOSVRTtIhBqr
         GaO69aihRBASv9tU2CxIJt2fHN2J2lkUGuanvvf3ZI6JqrfxZkgA6gnbyaHSrmmzKl6f
         Hv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056152; x=1750660952;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYFCQ6WsVUgyRd9/IeuXOI9XFmcm/xfYT+Apb/Pdycw=;
        b=ex8XEKX+YjP0w8Y0GNsG4XYumLTxH8HoSUfkV2UOCeWmjjvTAzcQmRl6Oqla53++/b
         xciGq6fCUz37F3rSI9vvlZXt/Z9PSm3bDfv48OcXVxp2oYOt8zVtv4MV76lcBZ2m2MCJ
         QW1q5fvKc/1vWgeCuM23KFNXSDIHiKjxZE5NjRq5G1CzSgcxt4olAkjxLELVZ2aCe96J
         lAWTr+o8wa7MyG5db7JqqGVquDdHY76y5d4sI+p/OkmkwlFcgIvAv0X6eEiuXs8vF7DO
         NGikMm/Y78CycmDTu2053fo33NEvJvuPBu2y3qmXRaWo4x/Hy9RLYB9NZVOWOybQtwQm
         oH1w==
X-Forwarded-Encrypted: i=1; AJvYcCWFsum47nuOInqnuQ7qlbknTBZvR4y7izlHaHd9hBh9kQyPxrKt75lOEGvh3Tv8nBPRbxJ5PaLQZXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9LqVYm0XVe478Kk/xLjIjEiRYzVgFxRc/G+3wiuLd3ozuJMCx
	64F8231VmmrWQXc3m5hQTCGAVfm0793k3w0S1VevoUQ50n6beLeU8is+7CC2yzJuEi8=
X-Gm-Gg: ASbGncuj+/JqfAZElpvMmcQ64yWzbm8IRNLJTdG5WRUKDYfvrBUDf9JDwhyH25Z4lPU
	6FeKmwAkOCw9ju6vxwMg8T2AfnlBYfgNFcYQMC+Xo6lNBZeWtPK2UzGyk/3lvXTE3qsMZenbHfg
	JiXK1Wfp/5DVhvZMHuNddbpcu9gzIGGr3lPmlVeUOBgga6RT3cEpIejWw7iB9R+1gGZbn7kptJR
	TSekGFRgztZelOMlhk0bj8BNQ/dYwHJcRP9vvqXd+S/d5QaDSiheFUuMEi8K7intv9S45iYUNrE
	/0M3Zk6XHk3EZjzh3ib/4+NzEhdBQMkk5DkRqB0uUBd34U9hZ0e5wf21iL3iXflcI4tJGvKtH7H
	1qR0rVpY/Ts9Yb05E7Ua60u16ku7snSptQ1DXn3mJjbrZ0ZLexS5Fplik5KAgj0Cs+ExKOBwVs9
	IoNRxsX7uVncU=
X-Google-Smtp-Source: AGHT+IE/bXr2uJdQLzAl8b0T1zSu9r244BZnep6cbbNI/lbBzJSIA5JcB+5JVCevI+SLAkxffBIs7A==
X-Received: by 2002:a17:907:7e92:b0:adb:2e9f:5d11 with SMTP id a640c23a62f3a-adfad4515f3mr607055566b.37.1750056152469;
        Sun, 15 Jun 2025 23:42:32 -0700 (PDT)
Message-ID: <11e127a7-ce8d-4704-b7ce-33dd998a4a54@suse.com>
Date: Mon, 16 Jun 2025 08:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 04/12] kexec: analyze new kernel for kexec
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-5-jgross@suse.com>
 <CAKf6xpuz6K+0OXjZBCvKHiOAzep8TW2YPt2ztkc3wHcBiNC2Ow@mail.gmail.com>
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
In-Reply-To: <CAKf6xpuz6K+0OXjZBCvKHiOAzep8TW2YPt2ztkc3wHcBiNC2Ow@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aA8WnijPMm071xk0705UBV1k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aA8WnijPMm071xk0705UBV1k
Content-Type: multipart/mixed; boundary="------------w0G0OEvnL1hFS01Ak0zeLU29";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <11e127a7-ce8d-4704-b7ce-33dd998a4a54@suse.com>
Subject: Re: [MINI-OS PATCH 04/12] kexec: analyze new kernel for kexec
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-5-jgross@suse.com>
 <CAKf6xpuz6K+0OXjZBCvKHiOAzep8TW2YPt2ztkc3wHcBiNC2Ow@mail.gmail.com>
In-Reply-To: <CAKf6xpuz6K+0OXjZBCvKHiOAzep8TW2YPt2ztkc3wHcBiNC2Ow@mail.gmail.com>

--------------w0G0OEvnL1hFS01Ak0zeLU29
Content-Type: multipart/mixed; boundary="------------9PGHRtoGNhO3chPi8ugDJbgB"

--------------9PGHRtoGNhO3chPi8ugDJbgB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDYuMjUgMTg6NDEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDIxLCAyMDI1IGF0IDU6MjXigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEFuYWx5emUgdGhlIHByb3BlcnRpZXMgb2YgdGhlIG5ldyBrZXJu
ZWwgdG8gYmUgbG9hZGVkIGJ5IGtleGVjLiBUaGUNCj4+IGRhdGEgbmVlZGVkIGlzOg0KPj4N
Cj4+IC0gdXBwZXIgYm91bmRhcnkgaW4gZmluYWwgbG9jYXRpb24NCj4+IC0gY29weSBhbmQg
bWVtb3J5IGNsZWFyIG9wZXJhdGlvbnMNCj4+IC0gZW50cnkgcG9pbnQgYW5kIGVudHJ5IHBh
cmFtZXRlcg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCj4gDQo+PiArDQo+PiArc3RhdGljIHZvaWQgY2hlY2tfbm90ZXNfZW50cnko
ZWxmX2VoZHIgKmVoZHIsIHZvaWQgKnN0YXJ0LCB1bnNpZ25lZCBpbnQgbGVuKQ0KPiANCj4g
SSB0aGluayB5b3Ugc2hvdWxkIHJlbmFtZSB0aGlzIHRvIGluY2x1ZGUgcmVhZF8gc2luY2Ug
aXQgaXMgbmVjZXNzYXJ5DQo+IHRvIHNldCBrZXJuZWxfZW50cnkuICByZWFkX3BoeXMzMl9l
bnRyeV9ub3RlKCkgb3INCj4gcmVhZF9ub3RlX2tlcm5lbF9lbnRyeSgpIG9yIHNvbWUgdmFy
aWF0aW9uLiAgVG8gbWUsIGNoZWNrXyBpbXBsaWVzIGENCj4gYm9vbGVhbiByZXR1cm4gd2l0
aG91dCBhIHNpZGUgZWZmZWN0Lg0KDQpJJ2xsIGdvIHdpdGggcmVhZF9ub3RlX2VudHJ5KCku
DQoNCj4gDQo+PiBAQCAtNTQsOSArNTcsMTIyIEBADQo+PiAgICAqIC0gVGhlIG5ldyBrZXJu
ZWwgaXMgYWN0aXZhdGVkLg0KPj4gICAgKi8NCj4+DQo+PiAtaW50IGtleGVjKHZvaWQgKmtl
cm5lbCwgdW5zaWduZWQgbG9uZyBrZXJuZWxfc2l6ZSwNCj4+IC0gICAgICAgICAgY29uc3Qg
Y2hhciAqY21kbGluZSkNCj4gDQo+PiAraW50IGtleGVjKHZvaWQgKmtlcm5lbCwgdW5zaWdu
ZWQgbG9uZyBrZXJuZWxfc2l6ZSwgY29uc3QgY2hhciAqY21kbGluZSkNCj4gDQo+IE5JVDog
aW50cm9kdWNlIGtleGVjKCkgd2l0aCB0aGUgc2luZ2xlIGxpbmUgZm9ybSB0byBhdm9pZCBj
aGFuZ2luZyBpdA0KPiANCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QsIHNvIHByZWZl
cmFibHkgd2l0aCB0aGUgcmVuYW1pbmc6DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFzb24gQW5k
cnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KDQpUaGFua3MsDQoNCg0KSnVlcmdlbg0K

--------------9PGHRtoGNhO3chPi8ugDJbgB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9PGHRtoGNhO3chPi8ugDJbgB--

--------------w0G0OEvnL1hFS01Ak0zeLU29--

--------------aA8WnijPMm071xk0705UBV1k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPvNcFAwAAAAAACgkQsN6d1ii/Ey8Z
3Qf/chJd6vUDgMEz6Wr0ThCYubZhMOSeAdiyklSX1fWIJtQCIKGPG+bMgl7jyZzKBntF07u4lBNQ
Taixlr0oGhS0RvWlLKmqCNLLsPdgdgXmkH8Ffd3kgul3EuJ5S4UzDuCDv0ZwBd+IvBQD9wx2jKKc
dWdiwy+s+1cI2dYounoZpvpja2Tb2ccNDwxSOtIBVr/i4hdfxfe38hRZzWjdzj+2eiYisRv6flTp
2EtVZtaets/0OGqKqQrIsoXDL/6ZaxgX/bYGNmmOb30COBLJjpG1zHYOfehh6R0AyBRCjxlhlcI7
VGsMlr69u4YQ2PoQ3C+2L8jn5BcOLHjFFy0UEletHg==
=FN4F
-----END PGP SIGNATURE-----

--------------aA8WnijPMm071xk0705UBV1k--


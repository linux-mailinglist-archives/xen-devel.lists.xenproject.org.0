Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F61AAB707F
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 17:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984471.1370612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFETA-0002Wr-Qq; Wed, 14 May 2025 15:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984471.1370612; Wed, 14 May 2025 15:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFETA-0002VO-N3; Wed, 14 May 2025 15:56:32 +0000
Received: by outflank-mailman (input) for mailman id 984471;
 Wed, 14 May 2025 15:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2kKl=X6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uFET9-0002Ux-7W
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 15:56:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff758d34-30db-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 17:56:29 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbda5a8561so9760126a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 08:56:29 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d70f51esm8799706a12.79.2025.05.14.08.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:56:28 -0700 (PDT)
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
X-Inumbo-ID: ff758d34-30db-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747238188; x=1747842988; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZGT1lD5+P8o4surXWhjLhMIFTmAgabakL1I8TIT7s4=;
        b=c88S4/NB2kZ12FHY18/CSiC76Y1bmTeo0NTH3YkDJ5SNpg2CXxUIlypqp7m6+LrGCw
         4yiElVpPVtfBEBrzaI8NiPfY0bc1YSs/6F7Tftto8TpL4LfKPd9fuIo/eW0h9NHRdEoi
         1icb/3v0VfefTGEDwe9M21e8rBMe2HqFvX0R/YcSfo/4BUCELLM0PTm+VzWnU50ymZHg
         NJgSaMb+6V2/WRYnLxCOY3kKDwvP+xpjD4Myi8ak2k+WOCaa5tE/J0Kah8OIqlCoUhq2
         PluovND061nt662EgngvZayhtshFf0Q9jVmcirmQe3u1A5Lj9w6AIeJfo/WM5ci9p5xU
         PVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238188; x=1747842988;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZGT1lD5+P8o4surXWhjLhMIFTmAgabakL1I8TIT7s4=;
        b=WdqsjxtOZEgUqYt2vq3XpIT7Dwc5fKT+v3Ps2gR24dK4jDIPhkhnF1elHQUOH1whzu
         eEHr5etgL/wg9el8A5w0Nmw8ifluo7auQWyf/vkUCXku4/9iMh46u9th5/3f2B1P1t74
         qdBKpOOz1SHh7hUA/txTm1gQHQ6OUFEac5Oe/XQDKcX5sjc1zx/pka0+avuE8DzDiYPV
         b/IiqX2hnFiFPL5jplDsYVNuszvrmYRBv4useCXia0IDSn1NkIoYxdRVjxhulIb5xgLM
         BVbmTqrQRTBHqQjV3EnjpdswWhhS0xezDxv3Xvyp1RkCg5SXtCaB4i26Ve0vQvlA41lQ
         XSpg==
X-Forwarded-Encrypted: i=1; AJvYcCWmaWiyj1WlhYDyd/zs/MbHo9IrU1rYFpC0BhrnlpFIYN5d+Ra6JdXYKuI/gE0zeN81Dc//lXSzv8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFG2zrr5XbnboCQ9K066DSSIBuERM0ApfjKlDijBNMARg9FslU
	yEp9WvIC9L1zmiMKXFcjMP8Rzur/u5mDEwyjkeguh5+/gPs1La0QHdenU9nYFE0=
X-Gm-Gg: ASbGncvnRn3PXnyinYAJVg3W71Rk+EZ3Jd5Ky4uQPwnxCO+my7GWQKncVJW4j62sn71
	aVhaHnVIF8Dloa1OBV694F2tW6F/rDr1hF7hRtjBpMHEXPDbEZzHiZOxfKI4IpLIRM9W8ycl3El
	VJfKZNyZuSc9QvsHIsD8QAMSgI2bBQbB+Rv74d14nNc25tgs1jZcy4g2dXg8hT7ysI3nziKulKF
	kA/SajkFn65d67W+FGvlg9akoNeQVd9mnjfCYEUGUwoRjEwmGAjaOJ02U/OPMH2g489AQec891Z
	WTcBknPpT8vcKish0+YHd/lWRj4uBcCgFEgdsNMgsudhwcvgbTk/DUCYS23c9M/QMfsWzpQ8SuD
	mMu7VNHxSLSAKVPTTGWqtC3GCkue/R4OTMoHdc4UXI04+njt/l01h7ybV9RvjE/aMxQVaVMj9HA
	Wq
X-Google-Smtp-Source: AGHT+IGazqnyNdtpYvI2ZUK+d3wGphF/qroGz/5XaD/CJq/YwGfOc1xEFgU6NcJCQdpGjg+xcG/nQg==
X-Received: by 2002:a05:6402:2811:b0:5fc:9759:379c with SMTP id 4fb4d7f45d1cf-5ff988a59c3mr3613418a12.10.1747238188539;
        Wed, 14 May 2025 08:56:28 -0700 (PDT)
Message-ID: <d1d45a72-1506-4b81-a905-b9e94eb52825@suse.com>
Date: Wed, 14 May 2025 17:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, John <jw@nuclearfallout.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250514080427.28129-1-roger.pau@citrix.com>
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
In-Reply-To: <20250514080427.28129-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nqgFyaDVTJItwI4Ej6SU2P0D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nqgFyaDVTJItwI4Ej6SU2P0D
Content-Type: multipart/mixed; boundary="------------SMFpqtK4r85d3Z43p0E5K1wt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com, John <jw@nuclearfallout.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <d1d45a72-1506-4b81-a905-b9e94eb52825@suse.com>
Subject: Re: [PATCH] xen/x86: fix initial memory balloon target
References: <20250514080427.28129-1-roger.pau@citrix.com>
In-Reply-To: <20250514080427.28129-1-roger.pau@citrix.com>

--------------SMFpqtK4r85d3Z43p0E5K1wt
Content-Type: multipart/mixed; boundary="------------e0BN0WPbep9uHu6k0l4JliVs"

--------------e0BN0WPbep9uHu6k0l4JliVs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDUuMjUgMTA6MDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gV2hlbiBhZGRp
bmcgZXh0cmEgbWVtb3J5IHJlZ2lvbnMgYXMgYmFsbG9vbmVkIHBhZ2VzIGFsc28gYWRqdXN0
IHRoZSBiYWxsb29uDQo+IHRhcmdldCwgb3RoZXJ3aXNlIHdoZW4gdGhlIGJhbGxvb24gZHJp
dmVyIGlzIHN0YXJ0ZWQgaXQgd2lsbCBwb3B1bGF0ZQ0KPiBtZW1vcnkgdG8gbWF0Y2ggdGhl
IHRhcmdldCB2YWx1ZSBhbmQgY29uc3VtZSBhbGwgdGhlIGV4dHJhIG1lbW9yeSByZWdpb25z
DQo+IGFkZGVkLg0KPiANCj4gVGhpcyBtYWRlIHRoZSB1c2FnZSBvZiB0aGUgWGVuIGBkb20w
X21lbT0sbWF4OmAgY29tbWFuZCBsaW5lIHBhcmFtZXRlciBmb3INCj4gZG9tMCBub3Qgd29y
ayBhcyBleHBlY3RlZCwgYXMgdGhlIHRhcmdldCB3b24ndCBiZSBhZGp1c3RlZCBhbmQgd2hl
biB0aGUNCj4gYmFsbG9vbiBpcyBzdGFydGVkIGl0IHdpbGwgcG9wdWxhdGUgbWVtb3J5IHN0
cmFpZ2h0IHRvIHRoZSAnbWF4OicgdmFsdWUuDQo+IEl0IHdvdWxkIGVxdWFsbHkgYWZmZWN0
IGRvbVVzIHRoYXQgaGF2ZSBtZW1vcnkgIT0gbWF4bWVtLg0KPiANCj4gS2VybmVscyBidWls
dCB3aXRoIENPTkZJR19YRU5fVU5QT1BVTEFURURfQUxMT0MgYXJlIG5vdCBhZmZlY3RlZCwg
YmVjYXVzZQ0KPiB0aGUgZXh0cmEgbWVtb3J5IHJlZ2lvbnMgYXJlIGNvbnN1bWVkIGJ5IHRo
ZSB1bnBvcHVsYXRlZCBhbGxvY2F0aW9uIGRyaXZlciwNCj4gYW5kIHRoZW4gYmFsbG9vbl9h
ZGRfcmVnaW9ucygpIGJlY29tZXMgYSBuby1vcC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBKb2hu
IDxqd0BudWNsZWFyZmFsbG91dC5uZXQ+DQo+IEZpeGVzOiA4N2FmNjMzNjg5Y2UgKCd4ODYv
eGVuOiBmaXggYmFsbG9vbiB0YXJnZXQgaW5pdGlhbGl6YXRpb24gZm9yIFBWSCBkb20wJykN
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------e0BN0WPbep9uHu6k0l4JliVs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------e0BN0WPbep9uHu6k0l4JliVs--

--------------SMFpqtK4r85d3Z43p0E5K1wt--

--------------nqgFyaDVTJItwI4Ej6SU2P0D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgkvSsFAwAAAAAACgkQsN6d1ii/Ey+p
QQf/ZAvSSRLcI4Yh8O3g2SlYkobHbcWTYkNnIAbgL9miZ9mAwaX2THYDL0fwatYrIofEh+ryNc8A
LhqZ+9lBEofTM0+gQZrmpcdvBTYrq4akOo9vOVRMZ2doXN0BoFM3iSWncQ6Wy7VouGpAdfZzE5G1
THAAl8jEnfpb5iBK0YtBHn68i58VPFyWT5zoS3uBL+NKS9dEThORWvyk4j9IdmjNRN3tQGU6VFCL
u7ph4z9HIpe56Rg+nsq0a1MV7BhA9BWU5WApiSPvHE4R0gVgMkYtiBBPHS3ojD2kXeb0sy3v4++E
V7fCsi2RPcpGy8l96VEm0N0TzENQ22JwzYNxJKFTkw==
=xJm3
-----END PGP SIGNATURE-----

--------------nqgFyaDVTJItwI4Ej6SU2P0D--


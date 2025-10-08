Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE125BC57A2
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139867.1475082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VTj-0000i7-M0; Wed, 08 Oct 2025 14:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139867.1475082; Wed, 08 Oct 2025 14:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VTj-0000fK-Ir; Wed, 08 Oct 2025 14:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1139867;
 Wed, 08 Oct 2025 14:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGyo=4R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v6VTi-0000fE-4K
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:49:18 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f65ad848-a455-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:49:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso6433418a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:49:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a174a6dsm1681497366b.90.2025.10.08.07.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:49:15 -0700 (PDT)
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
X-Inumbo-ID: f65ad848-a455-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759934956; x=1760539756; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH6/tvu+6W8riJ92ieHJi2kIwh05Px8FGw25JuPlHt8=;
        b=CVw5XDMq2lTwTNkVy/ItxrcSRAum8HtPTo2bmfix8+jMAUL4P9ugPKkzZMvhPkgLQW
         nFNyzRRF6z/7R8HlBuod6AM7yV7WBQ7NoU/oZh0MmXBzfXuPbdCofpzTTqwzDRdAaFKq
         qSQkQg8Nm+xJyrx/6ufJOy8/M672APnrbDAbpyAYS/9vZtSUar9mpq29XlAFbAqCU7z+
         sNT2oEQMXYxcT8/bTsNm4+ZmX6ylHhJjv8K0YPrVOlZ+rbNnCr/2/ZHDSX90HKWriZNW
         FdCUdqFeollQbUKjRCRWfkaOQ6xivU/d6EGxObg+kJctBJa6FUUQzYZLU61s+lgjsjXk
         WoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934956; x=1760539756;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vH6/tvu+6W8riJ92ieHJi2kIwh05Px8FGw25JuPlHt8=;
        b=qelt2Ko7vZnN0+Fev52hQkXd163ETYPKRZjvlvft9HFWL9IqNsezdnk9v4qhTDvuK1
         Jo2MOKRHqqi+k+7JxmJOcqejT5MPZERL8LecQ2mOkyHoM6Mp7h2Cyus/qbDaI8041GPH
         HtMo0is0hrvyT4GXa1STui2HN08RoujzaUn+mDmoMANklwhtXg4fmLzww72O6uy2kaYH
         DvijohaKlF9q+08xemOjUFHUfDP43j06afCvu6Vxyxj463LzbTduo/4ANgkXiwKE3Vmu
         s+ubnFCLmSap3qtIukqSKO1tcGHxXJ34jEIejJEQH89CYUs7yOuzP63EM2QR8HT3Zp+K
         ZNeg==
X-Forwarded-Encrypted: i=1; AJvYcCWHnIWEB5ajEAsuHtdFusjAvq4UOv7vcToLfu426eLsX87SIURUec7rGPT5nKb0yzLeprEpNLC3Nao=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz2jrMyja03CmNfaT29mCN+E8RDT8pQXQ45q1FS/HyQ/JEcGHP
	oj28Qlzy1oT1qoyz5Oi76MXYi8RgZ667CiJo52SrjFjrCyGDffPn0J6vIboqRueeyE+Iuxabeio
	JxPhd7vg=
X-Gm-Gg: ASbGncu+i1s3diW6ouF0ViWiyo+eyu3vaQnTvBKScGgdlwpvFoWwBEOpL4xUmHG2ife
	nwjEaUfMnX+3ELLS0nTl94Tav6ipXtc7lc2/tJtfNwQ2ViQKMwXFXsCkdYPwJnnwHgtLESR4YR4
	OTZfT+Y5uxUdPq8d63paUqovDtCezFZSFejwYpfm+aE8LiKV2R0wDIR/XoLgeiWtiFEEJ5gSZno
	P9sC+I+EVb8AAsXLoV4uZZrIImnHtrAaIHSQHBl4LucYfeQlSnNaGQVwoMLbQAgeAQ8vyekbVcF
	PSZCKjdSNx60DBwQMn1hpGw/oxpUl1apCknrWWNTlROyJK1t1QBKQYeAJEqzZyelf4BwRGGbnq0
	lh+J9kFGDfmE6qUfohsFlpSZDtLdR76aoYF/Zypd2KFkV5vcjutAxCIDYyLyxkaWBP5E7yaKnTW
	3TsctcUSA6ULFLOzJ9BncB0c8b5RKBdbwzxaW3P6YYyZXCgziqMmYgX/OUt1tKhr22dzCrwwD4q
	5wBSxI=
X-Google-Smtp-Source: AGHT+IGyXmMrSRANJRLLalw6Z8pmR7lxXLAbIfbiFi9GAXF+7z4Y8zrFtR93+krnpBNm40n9+10U3A==
X-Received: by 2002:a17:907:3fa2:b0:b45:a6e6:97b4 with SMTP id a640c23a62f3a-b50ac7eab77mr440206266b.50.1759934955514;
        Wed, 08 Oct 2025 07:49:15 -0700 (PDT)
Message-ID: <1d64ee8e-bb00-46b0-b404-3639dd22a177@suse.com>
Date: Wed, 8 Oct 2025 16:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux xenfs vs privcmd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
 <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
 <6c9b2e4c-bf13-4f26-baab-13be9947c377@citrix.com>
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
In-Reply-To: <6c9b2e4c-bf13-4f26-baab-13be9947c377@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V60sOjzSS0UvH0OXS2ByVzxG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V60sOjzSS0UvH0OXS2ByVzxG
Content-Type: multipart/mixed; boundary="------------620GXPJYtwQ3pRNIYnE9rY4s";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1d64ee8e-bb00-46b0-b404-3639dd22a177@suse.com>
Subject: Re: Linux xenfs vs privcmd
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
 <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
 <6c9b2e4c-bf13-4f26-baab-13be9947c377@citrix.com>
In-Reply-To: <6c9b2e4c-bf13-4f26-baab-13be9947c377@citrix.com>

--------------620GXPJYtwQ3pRNIYnE9rY4s
Content-Type: multipart/mixed; boundary="------------GTupObQ6aKJfsZHDNA7j4tR1"

--------------GTupObQ6aKJfsZHDNA7j4tR1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTAuMjUgMTY6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA4LzEwLzIw
MjUgMzowOCBwbSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDA4LjEwLjI1IDE1OjMz
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEFueXdheSAtIC9kZXYveGVuL3ByaXZjbWQg
KGFuZCAvaHlwZXJjYWxsKSBzaG91bGRuJ3QgYmUgdGllZCB0byB4ZW5mcy4NCj4+PiBUaGV5
IHNob3VsZCBiZSBTSUZfUFJJVklMRUdFRCBhbG9uZSwgc2hvdWxkIHRoZXkgbm90Pw0KPj4N
Cj4+IEkgZG9uJ3QgdGhpbmsgdGhleSBzaG91bGQgYmUgdGllZCB0byBTSUZfUFJJVklMRUdF
RCwgYXMgZGV2aWNlIG1vZGVsIG9wcw0KPj4gYXJlIGhhbmRsZWQgdmlhIHRoZSBwcml2Y21k
IGRyaXZlciwgdG9vLg0KPj4NCj4+IFRCSCBJIGhhdmUgbm8gaWRlYSB3aHkgdGhlcmUgaXMg
YSBkaXJlY3QgY29ubmVjdGlvbiB0byB4ZW5mcy4NCj4+DQo+PiBEaWQgeW91IHRyeSB0byBt
b2Rwcm9iZSBwcml2Y21kIHdpdGhvdXQgbW91bnRpbmcgeGVuZnM/IEkgZ3Vlc3MgdGhlDQo+
PiBjb25uZWN0aW9uIGlzIHRoYXQgdGhlIGNhcGFiaWxpdGllcyBpbiAvcHJvYy94ZW4vY2Fw
YWJpbGl0aWVzIGFyZQ0KPj4gdGVzdGVkIHRvDQo+PiBjb250YWluICJjb250cm9sX2QiLCBy
ZXN1bHRpbmcgaW4gdGhlIHByaXZjbWQgZHJpdmVyIHRvIGJlIGxvYWRlZC4NCj4gDQo+IG1v
ZHByb2JlIHhlbl9wcml2Y21kIGluIGlzb2xhdGlvbiBkb2VzIGNhdXNlIC9kZXYveGVuL3By
aXZjbWQgdG8gYXBwZWFyLg0KDQpZZXMsIEkgZXhwZWN0ZWQgdGhhdC4NCg0KU28gZm9yIHJl
bW92aW5nIHhlbmZzIHRoZXJlIG5lZWRzIHRvIGJlIGEgd2F5IHRvIGZpbmQgb3V0IHRoYXQg
dGhlIHN5c3RlbQ0KaXMgYSBYZW4gZG9tMC4gVGhlIGVhc2llc3Qgd2F5IHdvdWxkIGJlIHRv
IGxvb2sgaW50byAvc3lzL2h5cGVydmlzb3IvdHlwZQ0KdG8gY29udGFpbiAieGVuIiBhbmQg
dGhlbiAvc3lzL2h5cGVydmlzb3Ivc3RhcnRfZmxhZ3MvcHJpdmlsZWdlZCB0byBjb250YWlu
DQoiMSIuDQoNCg0KSnVlcmdlbg0K
--------------GTupObQ6aKJfsZHDNA7j4tR1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GTupObQ6aKJfsZHDNA7j4tR1--

--------------620GXPJYtwQ3pRNIYnE9rY4s--

--------------V60sOjzSS0UvH0OXS2ByVzxG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjmeeoFAwAAAAAACgkQsN6d1ii/Ey9k
DQf9GPp5+eHacw2I5Hzxln+soZRg/57M1JOAhh0/D2dKv583I43eGxT3TxYwqUHW5GuQKLovDHYV
tvni7rGPQO3sPiIvFfB7YNqfYPad+ccNoASvH8CXJb3yUX9S+SrzbfzNWOGNaOzo/7mTyrx6C8HO
FquSpQP/1zoxUZsb/y+DYnwYbmV3frWGZjlWdOk4Ia/fcZpq41rsciEUBjfB1zW0ooM7U9e/sQAH
V0ZspSSVjnJEKGbAmFTCK1O0uZQHADZL1k+yzYobt74TsbPhsEWSe6Gml+o2qwb2PIRHF0lR0lCa
fx15g+XXjxYa4NiLojfGPK+oYl/77uB5iRe3HUT5Lg==
=3gIm
-----END PGP SIGNATURE-----

--------------V60sOjzSS0UvH0OXS2ByVzxG--


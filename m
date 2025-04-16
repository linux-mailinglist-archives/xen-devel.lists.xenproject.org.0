Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D570A8B9B1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955999.1349529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52Kx-0004tH-Vy; Wed, 16 Apr 2025 12:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955999.1349529; Wed, 16 Apr 2025 12:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52Kx-0004rw-QP; Wed, 16 Apr 2025 12:57:55 +0000
Received: by outflank-mailman (input) for mailman id 955999;
 Wed, 16 Apr 2025 12:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u52Kw-0004rq-7l
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 12:57:54 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ec4225-1ac2-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 14:57:52 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso427289f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 05:57:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4c8216sm20881075e9.7.2025.04.16.05.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 05:57:50 -0700 (PDT)
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
X-Inumbo-ID: 67ec4225-1ac2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744808271; x=1745413071; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5cCGj03zxFug0iIEMHG2sx3yR7VAi0V2fLRSZQmpBj4=;
        b=D319f9FgZkZrfrHXpUgX9gIPHN0QVgHeULxqj9Dkr9F8xckXuu1Me5ArPUpNwRie44
         dWZLVpXeEVjJTDokg583Eb41NVn3rqpQ+cJCWs+2YPxYAi7ahZ4ahBh8AnoiN1Ek5Wyv
         ESk0xvGeYD5KRTciVZmKBhVMhp6hbQYqK2K1gH2Ul7MIy9iuuwdozmNWx/SxlykOUKay
         UXIH+L/oTehPAUu66ha7YoUiZM/9qjbhlbm9UkTxwuFH2HRJrsF+Nfp+IMicG5mx8wQp
         pBKvfZvahHsRcP8uGF6BNQ4dgKw0HwF801jeK78yb3bju/BMutTa0doQs+SkW8ildXZ6
         c9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808271; x=1745413071;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cCGj03zxFug0iIEMHG2sx3yR7VAi0V2fLRSZQmpBj4=;
        b=XJvaZjrEIcMMbc14VP+UczHnFAZ77+9RsHdCoff1IFvWzS91syebySfOQjLbqB/prr
         TQTsX/gdPjqOeG4msCFf+pMiOuE2lKMc3ThlVvU/ZXJMsjMiaIGsZpI8joYhA/mEKOnR
         M8k4ALCRLEUbHW4JA3U7YrgNILgkmXEP2dYENB+Rn9NlFClHOlcjFFUhF6DjHEvw27+k
         Cl73lOcJ7u9594DLniG4i+rudEpYWWzNnn8o0/oPttlNttQh266pxQ8JEE2bCd7Rn/QM
         /OXBikxxkEPRQOEjTMlarzK57qIA+Fn/6DvNCbT7hx5p05fxC9k6Fre3+b2qY5B1LajB
         lGVA==
X-Forwarded-Encrypted: i=1; AJvYcCVe3IxVDyQUPz32tzcERUp947h1VI98tmvK6k3dWcn9bURpi4Hc4B3ZOoOy6tceV2BYcySURE4WRG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBKpbnF9egqsjyNqbfv5KS7LmVZtI7rhwyvRo+RhStWhu0rUGZ
	WIvgK0jaK9eo86W7Ef/6Pb1wsZaiWMSJoHLs2G/e6fICeUXGHn4vtBuZWTgZIOc=
X-Gm-Gg: ASbGncuEtotAxhG89xRMZoDWd9OGAAL62gW3LSddboycnKPB6Y4QoANKGrET+PG2Tkr
	yZg9qDFkJJez/XZ2CbvNSYCg7dAgmH5aPLnXrJupl0P5Yiy1bvs6l4GVOZ7P+M+kTQSi2wf2zfq
	IdtcOlyghgCcZG4rDntdu+5oceEdnNf+bQKtOHrC1usPUz8k2lXDaKXZ/+erV1lBQVD+l7FNWuP
	+dmnF0fBNRQ+wq6ZM6WXzk60isotCZQrC06dxKSy6Tl+89PuA5UX+atOL/8h7enhNvGsU+Y4His
	dIcxLBFH0CQguJC83c669DYSq539CiInvDVbwliih+sd4F0FymReDL/ru/3OZhuRjYtKRseqhmz
	O8Qla8v6EuGVGx/pyEJMuy/4kQED0WlSYPlG+8LPupCBCzVYyrphpt9genqaabne7nA==
X-Google-Smtp-Source: AGHT+IF47B4KfVM/cwCTnnUM3ht6L09Y6U+lo0E3E7g2X6pTzedt+j1hhkAgz5MB9+v+BnBH/qFZKA==
X-Received: by 2002:a05:6000:248a:b0:39e:cbca:8a72 with SMTP id ffacd0b85a97d-39ee5e9da0bmr1316967f8f.12.1744808271277;
        Wed, 16 Apr 2025 05:57:51 -0700 (PDT)
Message-ID: <4347cd96-52c8-4bfc-b383-6fea1554fd4a@suse.com>
Date: Wed, 16 Apr 2025 14:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression from a9b3c355c2e6 ("asm-generic: pgalloc: provide
 generic __pgd_{alloc,free}") with CONFIG_DEBUG_VM_PGFLAGS=y and Xen
To: =?UTF-8?Q?Petr_Van=C4=9Bk?= <arkamar@atlas.cz>,
 linux-kernel@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 x86@kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org
References: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>
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
In-Reply-To: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FkQJsDW1mYmCm5DnOnkQkf9p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FkQJsDW1mYmCm5DnOnkQkf9p
Content-Type: multipart/mixed; boundary="------------3Dk2044X09sxTqsUX7Bzjp0o";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Petr_Van=C4=9Bk?= <arkamar@atlas.cz>,
 linux-kernel@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 x86@kernel.org, xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org
Message-ID: <4347cd96-52c8-4bfc-b383-6fea1554fd4a@suse.com>
Subject: Re: Regression from a9b3c355c2e6 ("asm-generic: pgalloc: provide
 generic __pgd_{alloc,free}") with CONFIG_DEBUG_VM_PGFLAGS=y and Xen
References: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>
In-Reply-To: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>

--------------3Dk2044X09sxTqsUX7Bzjp0o
Content-Type: multipart/mixed; boundary="------------Nyzw2RMk0HI00TkZe46BthW0"

--------------Nyzw2RMk0HI00TkZe46BthW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDQuMjUgMTQ6MDcsIFBldHIgVmFuxJtrIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0K
PiBJIGhhdmUgZGlzY292ZXJlZCBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBpbiBjb21taXQg
YTliM2MzNTVjMmU2DQo+ICgiYXNtLWdlbmVyaWM6IHBnYWxsb2M6IHByb3ZpZGUgZ2VuZXJp
YyBfX3BnZF97YWxsb2MsZnJlZX0iKSBbMSwyXSBpbg0KPiBrZXJuZWwgdmVyc2lvbiA2LjE0
LiBUaGUgcHJvYmxlbSBvY2N1cnMgd2hlbiB0aGUgeDg2IGtlcm5lbCBpcw0KPiBjb25maWd1
cmVkIHdpdGggQ09ORklHX0RFQlVHX1ZNX1BHRkxBR1M9eSBhbmQgaXMgcnVuIGFzIGEgUFYg
RG9tMCBpbiBYZW4NCj4gNC4xOS4xLiBEdXJpbmcgdGhlIHN0YXJ0dXAsIHRoZSBrZXJuZWwg
cGFuaWNzIHdpdGggdGhlIGVycm9yIGxvZyBiZWxvdy4NCj4gDQo+IFRoZSBjb21taXQgY2hh
bmdlZCBQR0QgYWxsb2NhdGlvbiBwYXRoLiAgSW4gdGhlIG5ldyBpbXBsZW1lbnRhdGlvbg0K
PiBfcGdkX2FsbG9jIGFsbG9jYXRlcyBtZW1vcnkgd2l0aCBfX3BnZF9hbGxvYywgd2hpY2gg
aW5kaXJlY3RseSBjYWxscw0KPiANCj4gICAgYWxsb2NfcGFnZXNfbm9wcm9mKGdmcCB8IF9f
R0ZQX0NPTVAsIG9yZGVyKTsNCj4gDQo+IFRoaXMgaXMgaW4gY29udHJhc3QgdG8gdGhlIG9s
ZCBiZWhhdmlvciwgd2hlcmUgX19nZXRfZnJlZV9wYWdlcyB3YXMNCj4gdXNlZCwgd2hpY2gg
aW5kaXJlY3RseSBjYWxsZWQNCj4gDQo+ICAgIGFsbG9jX3BhZ2VzX25vcHJvZihnZnBfbWFz
ayAmIH5fX0dGUF9ISUdITUVNLCBvcmRlcik7DQo+IA0KPiBUaGUga2V5IGRpZmZlcmVuY2Ug
aXMgdGhhdCB0aGUgbmV3IGFsbG9jYXRvciBjYW4gcmV0dXJuIGEgY29tcG91bmQgcGFnZS4N
Cj4gV2hlbiB4ZW5fcGluX3BhZ2UgaXMgbGF0ZXIgY2FsbGVkIG9uIHN1Y2ggYSBwYWdlLCBp
dCBjYWxsDQo+IFRlc3RTZXRQYWdlUGlubmVkIGZ1bmN0aW9uLCB3aGljaCBpbnRlcm5hbGx5
IHVzZXMgdGhlIFBGX05PX0NPTVBPVU5EDQo+IG1hY3JvLiBUaGlzIG1hY3JvIGVuZm9yY2Vz
IFZNX0JVR19PTl9QR0ZMQUdTIGlmIFBhZ2VDb21wb3VuZCBpcyB0cnVlLA0KPiB0cmlnZ2Vy
aW5nIHRoZSBwYW5pYyB3aGVuIENPTkZJR19ERUJVR19WTV9QR0ZMQUdTIGlzIGVuYWJsZWQu
DQo+IA0KPiBJIGFtIHJlcG9ydGluZyB0aGlzIGlzc3VlIHdpdGhvdXQgYSBwYXRjaCBhcyBJ
IGFtIG5vdCBzdXJlIHdoaWNoIHBhcnQgb2YNCj4gdGhlIGNvZGUgc2hvdWxkIGJlIGFkYXB0
ZWQgdG8gcmVzb2x2ZSB0aGUgcmVncmVzc2lvbi4NCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0
IEFORCB0aGUgYW5hbHlzaXMuDQoNCkkgYmVsaWV2ZSBQTURfQUxMT0NBVElPTl9PUkRFUiBu
ZWVkcyB0byBiZSBjaGFuZ2VkOiBpbiBjYXNlIHRoZSBzeXN0ZW0gaXMNCnJ1bm5pbmcgYXMg
YSBYZW4gUFYgZG9tYWluIChvciB3aXRoIFBUSSBkaXNhYmxlZCksIFBNRF9BTExPQ0FUSU9O
X09SREVSDQpzaG91bGQgYmUgMC4NCg0KU28gSSdkIHN1Z2dlc3QgdG8gc3dpdGNoIFBHRF9B
TExPQ0FUSU9OX09SREVSIHRvIGJlIGRlZmluZWQgZWl0aGVyIGFzIDANCihpbiBjYXNlIFBU
SSBpcyBub3QgY29uZmlndXJlZCksIG9yIHBnZF9hbGxvY2F0aW9uX29yZGVyIChhIG5ldyBn
bG9iYWwNCnZhcmlhYmxlIGhhdmluZyB0aGUgdmFsdWUgMCBvciAxLCBkZXBlbmRpbmcgb24g
UFRJIGFjdGl2ZSBvciBub3QpLg0KDQpJJ2xsIHNlbmQgYSBwYXRjaC4NCg0KDQpKdWVyZ2Vu
DQo=
--------------Nyzw2RMk0HI00TkZe46BthW0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Nyzw2RMk0HI00TkZe46BthW0--

--------------3Dk2044X09sxTqsUX7Bzjp0o--

--------------FkQJsDW1mYmCm5DnOnkQkf9p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmf/qU0FAwAAAAAACgkQsN6d1ii/Ey8/
ZAf9HWoQ82HR5WwM41WwT44QBbTpPb6JDwcmr4yI1UsNkg5aSIoXkjDegTSHCuL0hiAeJcCBtP5J
RZjTIKgQb+Yi4ADWgPpLXsfIh55Vwp3axwOuciCPIF+X+Ndn6NhLoIfNxsLKFGqP0RpEbynPgIZd
/yBAH18bSesW9PvIh3lFH+4aWKnk/6c5LwqFuzYP23bxSsjO/5msvJSCcwm3j6VCTByhfKXJHmuJ
AP4SMUXmjmQcM3cSJ3r5nWT+AyznGl1l0bwtuEobuJRLCy6pwUpBYSUkelP+VUdYb8X9PiHcXCjM
1S5Wix4HXMXXsXhAvEzFjvtTjzJLGKvjIgwud23oew==
=R+Sn
-----END PGP SIGNATURE-----

--------------FkQJsDW1mYmCm5DnOnkQkf9p--


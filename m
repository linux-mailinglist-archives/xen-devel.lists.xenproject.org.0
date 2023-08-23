Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A47785A09
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589309.921178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoWl-0003QS-3q; Wed, 23 Aug 2023 14:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589309.921178; Wed, 23 Aug 2023 14:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoWl-0003Ol-12; Wed, 23 Aug 2023 14:08:07 +0000
Received: by outflank-mailman (input) for mailman id 589309;
 Wed, 23 Aug 2023 14:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ZVo=EI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qYoWj-0003OC-DW
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:08:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1bf7ae-41be-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:08:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F036E223C8;
 Wed, 23 Aug 2023 14:08:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C008D1351F;
 Wed, 23 Aug 2023 14:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TWb/LMMS5mQIBAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Aug 2023 14:08:03 +0000
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
X-Inumbo-ID: 7a1bf7ae-41be-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692799683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=POyUBbKLxMf/PBEze5OZHYkp8bKh7/PKxFyqKKyRL1Y=;
	b=dquXP6VO6KiSqUv3IaVlfrW+gRrnUqJeWVFIRcYx7J0ExLqw9ED+04UDWL4vEsW84j5n6k
	oeJJ6obQK/3V1q/hzThOw8OQU35nmeTqdWHS4N9hA8lG2cFeOaCf1bnj7Dq/J7B2o7l8D8
	9i8QJkqsHKiLW+tzhf909D10dnnaBbo=
Message-ID: <e7327ac2-6344-4b5a-a1c5-c1a997867c76@suse.com>
Date: Wed, 23 Aug 2023 16:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxc: remove / adjust xc_get_cpufreq_para()'s
 BUILD_BUG_ON()s
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
 <CAKf6xpvZ4JBEmp0tL4vQgjbEo2uB-nYp8-_dUoQo26x+sfHtKg@mail.gmail.com>
 <d6022d27-b38c-f41c-7725-60434691de0c@suse.com>
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <d6022d27-b38c-f41c-7725-60434691de0c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iBnC4NW0oTY0yC65RM6YcAyi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iBnC4NW0oTY0yC65RM6YcAyi
Content-Type: multipart/mixed; boundary="------------od5IZmThZSBUI5axjncOgEUr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e7327ac2-6344-4b5a-a1c5-c1a997867c76@suse.com>
Subject: Re: [PATCH] libxc: remove / adjust xc_get_cpufreq_para()'s
 BUILD_BUG_ON()s
References: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
 <CAKf6xpvZ4JBEmp0tL4vQgjbEo2uB-nYp8-_dUoQo26x+sfHtKg@mail.gmail.com>
 <d6022d27-b38c-f41c-7725-60434691de0c@suse.com>
In-Reply-To: <d6022d27-b38c-f41c-7725-60434691de0c@suse.com>

--------------od5IZmThZSBUI5axjncOgEUr
Content-Type: multipart/mixed; boundary="------------0R3FGpjHILQKSmWY7A5JtIOg"

--------------0R3FGpjHILQKSmWY7A5JtIOg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDguMjMgMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wOC4yMDIz
IDE1OjU3LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4gT24gV2VkLCBBdWcgMjMsIDIwMjMg
YXQgOTo0N+KAr0FNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+
Pj4gQEAgLTMxNiw2ICsyNzcsMjIgQEAgaW50IHhjX2dldF9jcHVmcmVxX3BhcmEoeGNfaW50
ZXJmYWNlICp4Yw0KPj4+ICAgICAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKCgoc3RydWN0
IHhjX2dldF9jcHVmcmVxX3BhcmEgKikwKS0+dSkgIT0NCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKCgoc3RydWN0IHhlbl9nZXRfY3B1ZnJlcV9wYXJhICopMCktPnUpKTsN
Cj4+DQo+PiBUaGlzIGNoZWNrLi4uDQo+Pg0KPj4+ICsgICAgICAgIC8qIFNhbml0eSBjaGVj
ayBsYXlvdXQgb2YgdGhlIHVuaW9uIHN1YmplY3QgdG8gbWVtY3B5KCkgYmVsb3cuICovDQo+
Pj4gKyAgICAgICAgQlVJTERfQlVHX09OKHNpemVvZih1c2VyX3BhcmEtPnUpICE9IHNpemVv
ZihzeXNfcGFyYS0+dSkpOw0KPj4NCj4+IEFuZCB0aGlzIGNoZWNrIGFyZSB0aGUgc2FtZT8g
IFlvdXIgbmV3ZXIgb25lIGlzIG5pY2VyLCBzbyBtYXliZSBkcm9wIHRoZSBmaXJzdD8NCj4g
DQo+IE9oLCBpbmRlZWQuIFdpbGwgZG8gKGFuZCBKw7xyZ2VuLCBJJ2xsIGFzc3VtZSB0aGlz
IHdvbid0IGludmFsaWRhdGUgeW91cg0KPiBSLWIpLg0KDQpDb3JyZWN0Lg0KDQoNCkp1ZXJn
ZW4NCg==
--------------0R3FGpjHILQKSmWY7A5JtIOg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0R3FGpjHILQKSmWY7A5JtIOg--

--------------od5IZmThZSBUI5axjncOgEUr--

--------------iBnC4NW0oTY0yC65RM6YcAyi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTmEsMFAwAAAAAACgkQsN6d1ii/Ey+A
QAf9FGpcXYNLfE0Q1RNIxWVhvY2H3rv1xmvg6wxwjFhOLoyiJa9+tIgAY9uoLBm3T3PMCDsbWnvc
AiGAQOw6Most64dxY6+/kxBd8/fx5JsoqHHHWbc5AYR4AIkUtVKL6gLfsq6PvlOM+Ts/feT1+ISy
LrLIShOmO4R3SA4R0b+V5hynGidEtbzCS+GBa/kBTAxTWS8GQ9cyv/mklbRmx6Sxb6N9pJxO4JRP
04Do4ScZLAyu9LJN2sLXNrtM/j2GbthoTLoBWZAhRt5ODw2Skc+1JyszBcRkrhUuY7hNa4JTLdJl
0unItq250GTID4uHjqwGZ/z1121mMc6ePdZ4MjUEKw==
=0Cek
-----END PGP SIGNATURE-----

--------------iBnC4NW0oTY0yC65RM6YcAyi--


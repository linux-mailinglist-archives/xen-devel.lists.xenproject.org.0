Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329A7DE4C9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 17:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626545.976862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEID-0007yp-UY; Wed, 01 Nov 2023 16:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626545.976862; Wed, 01 Nov 2023 16:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEID-0007wL-Rm; Wed, 01 Nov 2023 16:42:09 +0000
Received: by outflank-mailman (input) for mailman id 626545;
 Wed, 01 Nov 2023 16:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyEIC-0007uE-DW
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 16:42:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9780e4a5-78d5-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 17:42:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97F7C21A47;
 Wed,  1 Nov 2023 16:42:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69A5913460;
 Wed,  1 Nov 2023 16:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7e81GN1/QmUlRwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 16:42:05 +0000
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
X-Inumbo-ID: 9780e4a5-78d5-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698856925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AmVSf3iVh5PLB5CCPfnxVmNz++u+YUjG12JsFHMoo9c=;
	b=Y0Dm2nfbMYhczTJBrdoQGRidZDiVVfKopBslvnjzorjtFga3sroyQJu0hCEJjIL7BjSdMm
	QcSJZfq3L1hyvct5JkVqGEJ/lT56a5+i9kwQoAZVKAHjGZOwTKGzBZN2G7CN41HNw9huUb
	QEM2XmAmOIQK/zXi7qu6oFTP+DTBvdE=
Message-ID: <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
Date: Wed, 1 Nov 2023 17:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231101090024.28934-1-jgross@suse.com>
 <20231101090024.28934-3-jgross@suse.com>
 <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
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
In-Reply-To: <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x9kISKTTetzMZuOpyxmQOZoF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x9kISKTTetzMZuOpyxmQOZoF
Content-Type: multipart/mixed; boundary="------------M01IF0cgoE6w00v07YK7hGNQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
References: <20231101090024.28934-1-jgross@suse.com>
 <20231101090024.28934-3-jgross@suse.com>
 <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
In-Reply-To: <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>

--------------M01IF0cgoE6w00v07YK7hGNQ
Content-Type: multipart/mixed; boundary="------------1ItDwVLUlTIXGsHMbCLaAFIu"

--------------1ItDwVLUlTIXGsHMbCLaAFIu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMTc6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzExLzIw
MjMgOTowMCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEl0IG1pZ2h0IGJlIHBlcmZl
Y3RseSBmaW5lIG5vdCB0byBoYXZlIGEgY29udHJvbC9zaHV0ZG93biBYZW5zdG9yZQ0KPj4g
bm9kZS4gSWYgdGhpcyBpcyB0aGUgY2FzZSwgZG9uJ3QgY3Jhc2gsIGJ1dCBqdXN0IHRlcm1p
bmF0ZSB0aGUNCj4+IHNodXRkb3duIHRocmVhZCBhZnRlciBpc3N1aW5nIGEgbWVzc2FnZSB0
aGF0IHNodXRkb3duIGlzbid0IGF2YWlsYWJsZS4NCj4+DQo+PiBJbiBmaW5pX3NodXRkb3du
KCkgY2xlYXJpbmcgdGhlIHdhdGNoIGNhbiByZXN1bHQgaW4gYW4gZXJyb3Igbm93LCBpbg0K
Pj4gY2FzZSB0aGUgZWFybHkgZXhpdCBhYm92ZSB3YXMgdGFrZW4uIEp1c3QgaWdub3JlIHRo
aXMgZXJyb3Igbm93Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4gDQo+IFdoaWNoIGNhc2VzIG1pZ2h0IHdlIG5vdCBoYXZlIGEg
Y29udHJvbC9zaHV0ZG93biBub2RlPw0KDQpYZW5zdG9yZS1zdHViZG9tLiBJdCBzaG91bGQg
X25ldmVyXyBzaHV0ZG93biwgYW5kIGl0IGlzbid0IHJlYWxseSB1bmRlcg0KY29udHJvbCBv
ZiBYZW4gdG9vbHMgKG90aGVyIHRoYW4gYmVpbmcgY3JlYXRlZCkuDQoNCj4gSSdtIGFsbCBm
b3IgY29waW5nIGJldHRlciB3aXRoIGl0cyBhYnNlbmNlLCBidXQgaXQncyBub3QgYSBwaWVj
ZSBvZiB0aGUNCj4gWGVuIEFCSSB3aGljaCBpcyBvcHRpb25hbC4NCg0KSSdkIGxpa2UgdG8g
ZGlmZmVyIGhlcmUuIFNlZSByZWFzb25pbmcgYWJvdmUuDQoNCj4gQW5kIG9uIHRoYXQgZnJv
bnQsIG5vdCBjcmFzaGluZyBpcyBnb29kLCBidXQgd2h5IHJlbW92ZSB0aGUgd2F0Y2g/wqAg
V2hhdA0KPiBpZiBpdCBjb21lcyBpbnRvIGV4aXN0ZW5jZSBsYXRlcj/CoCBJcyB0aGVyZSBh
bnkgcHJvYmxlbSB3aXRoIGp1c3QNCj4gbGVhdmluZyB0aGUgd2F0Y2ggb3V0c3RhbmRpbmc/
DQoNCkEgbmVlZGxlc3Mgd2FzdGUgb2YgbWVtb3J5IGluIFhlbnN0b3JlLXN0dWJkb20uDQoN
Cg0KSnVlcmdlbg0K
--------------1ItDwVLUlTIXGsHMbCLaAFIu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1ItDwVLUlTIXGsHMbCLaAFIu--

--------------M01IF0cgoE6w00v07YK7hGNQ--

--------------x9kISKTTetzMZuOpyxmQOZoF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVCf90FAwAAAAAACgkQsN6d1ii/Ey/n
Ogf/QO3XPhEF3L8KKZWVUo3bru8mxyByy93ttc+hYcc28Pa893BQGhm7+QlgVtxzN4Id/HD411me
EFDYpTYoJ1dyQDpM22S/r4bXkmyj9yLk9ta6T1wUWsKAXzHxfkY+Rpsje9u/mrh1pA954qi2yHpO
onqfntpCHjJLK2P0XYpcAoVED5ui8GBHtaUxzutfEviqfybyqeeUb0gbG2Xpc2zetSeM+a/anDNg
0zDCtFi8319rB5g16Jj3yDDiPnAYT9g5VUJm+k67E0VpGZdaAOXUBKQ3dtySe8aJ4nZfv/wqaxE3
yFx5NhsbBbD94lakiWASkZuksl2dhHccon5eAS4uAQ==
=dRXQ
-----END PGP SIGNATURE-----

--------------x9kISKTTetzMZuOpyxmQOZoF--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD8773887
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579296.907216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGus-0005zA-9C; Tue, 08 Aug 2023 07:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579296.907216; Tue, 08 Aug 2023 07:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGus-0005wy-67; Tue, 08 Aug 2023 07:14:06 +0000
Received: by outflank-mailman (input) for mailman id 579296;
 Tue, 08 Aug 2023 07:14:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTGuq-0005ws-PW
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:14:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 277ce34c-35bb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 09:14:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E74FC2247E;
 Tue,  8 Aug 2023 07:14:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFEEA13451;
 Tue,  8 Aug 2023 07:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N2t1LTrr0WRbWAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 07:14:02 +0000
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
X-Inumbo-ID: 277ce34c-35bb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691478842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c+qF184B5rmJ/fR8Yb3OZb8seiHxjL7CMZfZGReEIlw=;
	b=EC1lc1fQzYx5WU3RKWQegFJP6jNyT9ZOzLEiPFg+cFA/Qrd5M6lwvdGodnOod6R4XhYKtE
	ONligztZClZpWj7nESh2iQhVj5XXVexLPleQTDd9oUR4d1av5LYJBGeHmcv9G8PO53n2eq
	ikmLxiCYl0nmnOdVIi5t60/SKVZeZtQ=
Message-ID: <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
Date: Tue, 8 Aug 2023 09:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
Content-Language: en-US
To: Kevin Alarcon Negy <kevin@exostellar.io>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
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
In-Reply-To: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tBBrA0wep04TuWTsbF0xBK0d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tBBrA0wep04TuWTsbF0xBK0d
Content-Type: multipart/mixed; boundary="------------aj0uQ70ddhSk6iwUnIkoxP0C";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Kevin Alarcon Negy <kevin@exostellar.io>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
In-Reply-To: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>

--------------aj0uQ70ddhSk6iwUnIkoxP0C
Content-Type: multipart/mixed; boundary="------------AzvIcT0FpbHwyGgoJ5s1ODMG"

--------------AzvIcT0FpbHwyGgoJ5s1ODMG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDguMjMgMDA6MTYsIEtldmluIEFsYXJjb24gTmVneSB3cm90ZToNCj4gV2hlbiBi
dWlsZGluZyBhIGRvbWFpbiwgeGNfZG9tYWluX3NldG1heG1lbSgpIGlzIGNhbGxlZCB3aXRo
IHRhcmdldF9tZW1rYiAobWVtb3J5IGluIGRvbWFpbiBjb25maWcgZmlsZSkuDQo+IElmIGEg
Y29uZmlnIHNwZWNpZmllcyBtYXhtZW0gPiBtZW1vcnksIGFueSBhdHRlbXB0cyB0byBpbmNy
ZWFzZSB0aGUgZG9tYWluIG1lbW9yeSBzaXplIHRvIGl0cyBtYXgsDQo+IG91dHNpZGUgb2Yg
eGwgbWVtLXNldCBvciB4bCBtZW0tbWF4LCB3aGljaCBhbHJlYWR5IGNhbGwgeGNfZG9tYWlu
X3NldG1heG1lbSgpIHByb3Blcmx5LCB3aWxsIGZhaWwuDQoNCkJ1dCB0aGlzIGlzIGhvdyBp
dCBzaG91bGQgd29yaywgbm8/DQoNCldpdGggeW91ciBjaGFuZ2UgdGhlIGd1ZXN0IGNvdWxk
IGVhc2lseSBiYWxsb29uIGl0c2VsZiB1cCB0byBtYXhtZW0gd2l0aG91dCBpdA0KaGF2aW5n
IGJlZW4gYWxsb3dlZCB0byBkbyBzby4NCg0KVGhlIG1heG1lbSBjb25maWcgb3B0aW9uIGlz
IG1lYW50IHRvIHRlbGwgdGhlIGRvbWFpbiBob3cgbXVjaCBtZW1vcnkgaXQgc2hvdWxkDQpi
ZSBwcmVwYXJlZCB0byB1c2Ugc29tZSB0aW1lIGluIHRoZSBmdXR1cmUuIEl0IGlzbid0IG1l
YW50IHRvIGFsbG93IHRoZSBkb21haW4NCnRvIHVzZSByaWdodCBub3cuDQoNCg0KSnVlcmdl
bg0KDQo+IENoYW5nZWQgeGNfZG9tYWluX3NldG1heG1lbSgpIGNhbGwgaW5zaWRlIGxpYnhs
X19idWlsZF9wcmUoKSB0byB1c2UgbWF4X21lbWtiLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
S2V2aW4gQWxhcmNvbiBOZWd5IDxrZXZpbkBleG9zdGVsbGFyLmlvPg0KPiAtLS0NCj4gICB0
b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rv
bS5jDQo+IGluZGV4IDk0ZmVmMzc0MDEuLjE2YWEyNTVhYWQgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9kb20uYw0KPiBAQCAtMzU1LDcgKzM1NSw3IEBAIGludCBsaWJ4bF9fYnVpbGRfcHJl
KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICAgICAgcmV0dXJuIEVS
Uk9SX0ZBSUw7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICBpZiAoeGNfZG9tYWluX3NldG1h
eG1lbShjdHgtPnhjaCwgZG9taWQsIGluZm8tPnRhcmdldF9tZW1rYiArIHNpemUpIDwgMCkg
ew0KPiArICAgIGlmICh4Y19kb21haW5fc2V0bWF4bWVtKGN0eC0+eGNoLCBkb21pZCwgaW5m
by0+bWF4X21lbWtiICsgc2l6ZSkgPCAwKSB7DQo+ICAgICAgICAgICBMT0dFKEVSUk9SLCAi
Q291bGRuJ3Qgc2V0IG1heCBtZW1vcnkiKTsNCj4gICAgICAgICAgIHJldHVybiBFUlJPUl9G
QUlMOw0KPiAgICAgICB9DQoNCg==
--------------AzvIcT0FpbHwyGgoJ5s1ODMG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------AzvIcT0FpbHwyGgoJ5s1ODMG--

--------------aj0uQ70ddhSk6iwUnIkoxP0C--

--------------tBBrA0wep04TuWTsbF0xBK0d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTR6zoFAwAAAAAACgkQsN6d1ii/Ey+/
VAgAkzTHnljJVZg5sw4nP7caJtbjmcekQu7sbUARJqHdKyHpM/gQ7aQI6HJDddFy7lZW8oh5v+Mw
b92iztQAz0S8/Yb++6m8+nul4jqYX5o4Y/Q41WPV88RoEe46DUCuyL/fvqOg4xQTB9qOIzPLNrxm
SP63UxAOQLSWnX8K0ZfS8q5Ab5F0YALq+jGbVjJPm4Vx1785XB4dIsCLUOha+AD6aPPaNB11EpoM
Vn5TIq86W3gRniUAzNMXOmJHyM9c2HYLnFoiMBu72I9ggwYxkXmnqWSbYNTdK2mqqporOZtayPaN
yE8Z3mlZOEZfIRipQppZGO2EAHlTpP2oic9drEee5w==
=z279
-----END PGP SIGNATURE-----

--------------tBBrA0wep04TuWTsbF0xBK0d--


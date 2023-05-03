Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166A6F5A6C
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529281.823510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDs3-0007FD-1B; Wed, 03 May 2023 14:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529281.823510; Wed, 03 May 2023 14:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDs2-0007DN-Tq; Wed, 03 May 2023 14:54:18 +0000
Received: by outflank-mailman (input) for mailman id 529281;
 Wed, 03 May 2023 14:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puDs1-0007DH-Ew
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:54:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f75e5cb-e9c2-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 16:54:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17EEC2291F;
 Wed,  3 May 2023 14:54:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D93C01331F;
 Wed,  3 May 2023 14:54:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +SafM5Z1UmQTUwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 14:54:14 +0000
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
X-Inumbo-ID: 5f75e5cb-e9c2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683125655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4lwZKYFnvfyzxvRQhR5IxeQ9hEUssK/wK2hS9nUgYfE=;
	b=SaExl2Xq7Kl3oT54ki1tokQuO5gTsqAKDuV6ZP5A1ZT1y30gRZHpn4xyol0w22NZy1qk2u
	H+PBiXZzBzBKCQgcQfasRsiU8k1ZuflH+Pcat3kJHHrpzomD87LjLVglg1jIfFDi2Bt/Ab
	tjYtk7pjmhrg/gzenaczb6LQF/VheuA=
Message-ID: <65f15210-2a7a-4629-1ee0-628fb0ccb8b4@suse.com>
Date: Wed, 3 May 2023 16:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 05/13] tools/xenstore: make some write limit functions
 static
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-6-jgross@suse.com>
 <f790c02a-6a04-b126-ec74-7af9ce708b52@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f790c02a-6a04-b126-ec74-7af9ce708b52@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iUv8k4vJcnYY1mZGZ8drVHpb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iUv8k4vJcnYY1mZGZ8drVHpb
Content-Type: multipart/mixed; boundary="------------uur77b6610Ll2FVVs7I0Gkdo";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <65f15210-2a7a-4629-1ee0-628fb0ccb8b4@suse.com>
Subject: Re: [PATCH v2 05/13] tools/xenstore: make some write limit functions
 static
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-6-jgross@suse.com>
 <f790c02a-6a04-b126-ec74-7af9ce708b52@citrix.com>
In-Reply-To: <f790c02a-6a04-b126-ec74-7af9ce708b52@citrix.com>

--------------uur77b6610Ll2FVVs7I0Gkdo
Content-Type: multipart/mixed; boundary="------------02RPCUk7hmNjeWEFo5EoNtf6"

--------------02RPCUk7hmNjeWEFo5EoNtf6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTY6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDMwLzAzLzIw
MjMgOTo1MCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+ICtzdGF0aWMgdm9pZCB3cmxf
eGZlcl9jcmVkaXQod3JsX2NyZWRpdHQgKmRlYml0LCAgd3JsX2NyZWRpdHQgZGViaXRfZmxv
b3IsDQo+PiArCQkJICAgIHdybF9jcmVkaXR0ICpjcmVkaXQsIHdybF9jcmVkaXR0IGNyZWRp
dF9jZWlsKQ0KPj4gKwkvKg0KPj4gKwkgKiBUcmFuc2ZlcnMgemVybyBvciBtb3JlIGNyZWRp
dCBmcm9tICJkZWJpdCIgdG8gImNyZWRpdCIuDQo+PiArCSAqIFRyYW5zZmVycyBhcyBtdWNo
IGFzIHBvc3NpYmxlIHdoaWxlIG1haW50YWluaW5nDQo+PiArCSAqIGRlYml0ID49IGRlYml0
X2Zsb29yIGFuZCBjcmVkaXQgPD0gY3JlZGl0X2NlaWwuDQo+PiArCSAqIChJZiB0aGF0J3Mg
dmlvbGF0ZWQgYWxyZWFkeSwgZG9lcyBub3RoaW5nLikNCj4+ICsJICoNCj4+ICsJICogU3Vm
ZmljaWVudCBjb25kaXRpb25zIHRvIGF2b2lkIG92ZXJmbG93LCBlaXRoZXIgb2Y6DQo+PiAr
CSAqICB8ZXZlcnkgYXJndW1lbnR8IDw9IDB4M2ZmZmZmZmYNCj4+ICsJICogIHxldmVyeSBh
cmd1bWVudHwgPD0gMUU5DQo+PiArCSAqICB8ZXZlcnkgYXJndW1lbnR8IDw9IFdSTF9DUkVE
SVRfTUFYDQo+PiArCSAqIChBbmQgdGhpcyBjb25kaXRpb24gaXMgcHJlc2VydmVkLikNCj4+
ICsJICovDQo+PiArew0KPj4gKwl3cmxfY3JlZGl0dCB4ZmVyID0gTUlOKCAqZGViaXQgICAg
ICAtIGRlYml0X2Zsb29yLA0KPj4gKwkJCSAgICAgICAgY3JlZGl0X2NlaWwgLSAqY3JlZGl0
ICAgICAgKTsNCj4gDQo+IE1JTigpIGV2YWx1YXRlcyBpdHMgcGFyYW1ldGVycyBtdWx0aXBs
ZSB0aW1lcy7CoCBJIGJlbGlldmUgdGhlIG9ubHkgbGVnYWwNCj4gd2F5IGZvciB0aGUgY29t
cGlsZXIgdG8gZW1pdCB0aGlzIGNvZGUgaXMgdG8gaW50ZXJsZWF2ZSBkb3VibGUgcmVhZHMu
DQo+IA0KPiBBcyB3aXRoIHByZXR0eSBtdWNoIGFueSBDIGNvZGUsIHlvdSB3YW50IHRvIHJl
YWQgdGhlIHBvaW50ZXJzIGludG8NCj4gbG9jYWxzIGZpcnN0LCB0aGVuIG9wZXJhdGUgb24g
dGhlbSwgdGhlbiB3cml0ZSB0aGVtIG91dCBhdCB0aGUgZW5kLg0KDQp4ZW5zdG9yZWQgaXMg
c2luZ2xlLXRocmVhZGVkLiBTbyBubyBuZWVkIHRvIHdvcnJ5IGhlcmUuDQoNCg0KSnVlcmdl
bg0KDQo=
--------------02RPCUk7hmNjeWEFo5EoNtf6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------02RPCUk7hmNjeWEFo5EoNtf6--

--------------uur77b6610Ll2FVVs7I0Gkdo--

--------------iUv8k4vJcnYY1mZGZ8drVHpb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSdZYFAwAAAAAACgkQsN6d1ii/Ey9q
Mwf+NEeKKQ7yqLna3vKVq3tKT5dHf7OXthyBNL8pa2Klur8q5FcZdWdBZjFh0IaJqiVFiUNaGeX8
TruPzEuHOcHja6FLiJyzADpLtUqebzs1/isVBVdykLSqF5vf/o2jSF/zOkK608hfOgNkA6qvX964
tAdyZ2vFySWs9EhLZsU/TGwmNGo/asR2DYnggUcleLtEPs7bXesJoJh59ZC75YUDU3D6duQ7FZtu
2xnOIT5ZTsUVRLny6XSV8y+wgaXCKIs/shTRGNfnaoHsMt71YlOaL3gvYn9jEzC4u5N3IzpvZALw
SgGd3GYym+AMEQmKuctrW6cnDZj502B78lep5zmwgQ==
=3xuG
-----END PGP SIGNATURE-----

--------------iUv8k4vJcnYY1mZGZ8drVHpb--


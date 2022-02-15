Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B937C4B6961
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272975.467994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJv9n-0000RE-JP; Tue, 15 Feb 2022 10:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272975.467994; Tue, 15 Feb 2022 10:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJv9n-0000OJ-FH; Tue, 15 Feb 2022 10:34:03 +0000
Received: by outflank-mailman (input) for mailman id 272975;
 Tue, 15 Feb 2022 10:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=az2O=S6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nJv9l-0000OC-Hq
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:34:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c92574a2-8e4a-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 11:33:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CFB5210EC;
 Tue, 15 Feb 2022 10:33:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12E1313C16;
 Tue, 15 Feb 2022 10:33:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FDcZApeBC2JWIgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Feb 2022 10:33:59 +0000
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
X-Inumbo-ID: c92574a2-8e4a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644921239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVja1UqqFM1W0cLK8QOShkZ+lCVnih9Wb4q2wyaOr+k=;
	b=F+T2mOAn+WIJEeU5BGFY3j9z6pRQ67CwxSDNd0CuwCo+vfb0DeJGJZZgLHviuO9nUkFKSQ
	AdvcJz84FDjOBtHHS8dPK0ogw2NDweQDoYz2cHVk9VLhdx6jKTJ0Lj0PGzYrRHi7yH/Q7V
	KyY1B2lcAOyaoH7sSaf95R3v6SU8AQY=
Message-ID: <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
Date: Tue, 15 Feb 2022 11:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
In-Reply-To: <20220215101551.23101-2-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sriHtO36xC09mYCYC9x41a3o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sriHtO36xC09mYCYC9x41a3o
Content-Type: multipart/mixed; boundary="------------60GwdNqEHkJ18tNLYn7Yegn9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
In-Reply-To: <20220215101551.23101-2-luca.fancellu@arm.com>

--------------60GwdNqEHkJ18tNLYn7Yegn9
Content-Type: multipart/mixed; boundary="------------3l0rYN46bNsgHZAMZVLZIi2s"

--------------3l0rYN46bNsgHZAMZVLZIi2s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTE6MTUsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IFdpdGggdGhlIGlu
dHJvZHVjdGlvbiBvZiBib290IHRpbWUgY3B1cG9vbHMsIFhlbiBjYW4gY3JlYXRlIG1hbnkN
Cj4gZGlmZmVyZW50IGNwdXBvb2xzIGF0IGJvb3QgdGltZSBvdGhlciB0aGFuIGNwdXBvb2wg
d2l0aCBpZCAwLg0KPiANCj4gU2luY2UgdGhlc2UgbmV3bHkgY3JlYXRlZCBjcHVwb29scyBj
YW4ndCBoYXZlIGFuDQo+IGVudHJ5IGluIFhlbnN0b3JlLCBjcmVhdGUgdGhlIGVudHJ5IHVz
aW5nIHhlbi1pbml0LWRvbTANCj4gaGVscGVyIHdpdGggdGhlIHVzdWFsIGNvbnZlbnRpb246
IFBvb2wtPGNwdXBvb2wgaWQ+Lg0KPiANCj4gR2l2ZW4gdGhlIGNoYW5nZSwgcmVtb3ZlIHRo
ZSBjaGVjayBmb3IgcG9vbGlkID09IDAgZnJvbQ0KPiBsaWJ4bF9jcHVwb29saWRfdG9fbmFt
ZSguLi4pLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPiAtLS0NCj4gICB0b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAu
YyAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIHRvb2xzL2xpYnMvbGln
aHQvbGlieGxfdXRpbHMuYyB8ICAzICstLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9o
ZWxwZXJzL3hlbi1pbml0LWRvbTAuYyBiL3Rvb2xzL2hlbHBlcnMveGVuLWluaXQtZG9tMC5j
DQo+IGluZGV4IGM5OTIyNGE0YjYwNy4uMzUzOWY1NmZhZWIwIDEwMDY0NA0KPiAtLS0gYS90
b29scy9oZWxwZXJzL3hlbi1pbml0LWRvbTAuYw0KPiArKysgYi90b29scy9oZWxwZXJzL3hl
bi1pbml0LWRvbTAuYw0KPiBAQCAtNDMsNyArNDMsMTAgQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQ0KPiAgICAgICBpbnQgcmM7DQo+ICAgICAgIHN0cnVjdCB4c19oYW5k
bGUgKnhzaCA9IE5VTEw7DQo+ICAgICAgIHhjX2ludGVyZmFjZSAqeGNoID0gTlVMTDsNCj4g
LSAgICBjaGFyICpkb21uYW1lX3N0cmluZyA9IE5VTEwsICpkb21pZF9zdHJpbmcgPSBOVUxM
Ow0KPiArICAgIGNoYXIgKmRvbW5hbWVfc3RyaW5nID0gTlVMTCwgKmRvbWlkX3N0cmluZyA9
IE5VTEwsICpwb29sX3N0cmluZyA9IE5VTEw7DQoNCnBvb2xfc3RyaW5nIHNlZW1zIHRvIGJl
IHVudXNlZC4NCg0KPiArICAgIGNoYXIgcG9vbF9wYXRoW3N0cmxlbigiL2xvY2FsL3Bvb2wi
KSArIDEyXSwgcG9vbF9uYW1lW3N0cmxlbigiUG9vbC0iKSArIDVdOw0KDQpJIGRvbid0IGxp
a2UgdGhhdC4gV2h5IGRvbid0IHlvdSB1c2UgcG9pbnRlcnMgYW5kIC4uLg0KDQo+ICsgICAg
eGNfY3B1cG9vbGluZm9fdCAqeGNpbmZvOw0KPiArICAgIHVuc2lnbmVkIGludCBwb29sX2lk
ID0gMDsNCj4gICAgICAgbGlieGxfdXVpZCB1dWlkOw0KPiAgIA0KPiAgICAgICAvKiBBY2Nl
cHQgMCBvciAxIGFyZ3VtZW50ICovDQo+IEBAIC0xMTQsNiArMTE3LDI3IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICAgICAgICAgIGdvdG8gb3V0Ow0KPiAgICAg
ICB9DQo+ICAgDQo+ICsgICAgLyogQ3JlYXRlIGFuIGVudHJ5IGluIHhlbnN0b3JlIGZvciBl
YWNoIGNwdXBvb2wgb24gdGhlIHN5c3RlbSAqLw0KPiArICAgIGRvIHsNCj4gKyAgICAgICAg
eGNpbmZvID0geGNfY3B1cG9vbF9nZXRpbmZvKHhjaCwgcG9vbF9pZCk7DQo+ICsgICAgICAg
IGlmICh4Y2luZm8gIT0gTlVMTCkgew0KPiArICAgICAgICAgICAgaWYgKHhjaW5mby0+Y3B1
cG9vbF9pZCAhPSBwb29sX2lkKQ0KPiArICAgICAgICAgICAgICAgIHBvb2xfaWQgPSB4Y2lu
Zm8tPmNwdXBvb2xfaWQ7DQo+ICsgICAgICAgICAgICBzbnByaW50Zihwb29sX3BhdGgsIHNp
emVvZihwb29sX3BhdGgpLCAiL2xvY2FsL3Bvb2wvJWQvbmFtZSIsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICBwb29sX2lkKTsNCj4gKyAgICAgICAgICAgIHNucHJpbnRmKHBvb2xfbmFt
ZSwgc2l6ZW9mKHBvb2xfbmFtZSksICJQb29sLSVkIiwgcG9vbF9pZCk7DQoNCi4uLiB1c2Ug
YXNwcmludGYoKSBoZXJlIGZvciBhbGxvY2F0aW5nIHRoZSBzdHJpbmdzIGluIHRoZSBuZWVk
ZWQgc2l6ZT8NCg0KPiArICAgICAgICAgICAgcG9vbF9pZCsrOw0KPiArICAgICAgICAgICAg
aWYgKCF4c193cml0ZSh4c2gsIFhCVF9OVUxMLCBwb29sX3BhdGgsIHBvb2xfbmFtZSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RybGVuKHBvb2xfbmFtZSkpKSB7DQo+ICsg
ICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJjYW5ub3Qgc2V0IHBvb2wgbmFtZVxu
Iik7DQo+ICsgICAgICAgICAgICAgICAgcmMgPSAxOw0KPiArICAgICAgICAgICAgfQ0KPiAr
ICAgICAgICAgICAgeGNfY3B1cG9vbF9pbmZvZnJlZSh4Y2gsIHhjaW5mbyk7DQo+ICsgICAg
ICAgICAgICBpZiAocmMpDQo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQoNCk1vdmlu
ZyB0aGUgY2FsbCBvZiB4Y19jcHVwb29sX2luZm9mcmVlKCkgYWhlYWQgb2YgdGhlIGNhbGwg
b2YgeHNfd3JpdGUoKQ0Kd291bGQgZHJvcCB0aGUgbmVlZCBmb3IgdGhpcyBsYXN0IGlmIHN0
YXRlbWVudCwgYXMgeW91IGNvdWxkIGFkZCB0aGUNCmdvdG8gdG8gdGhlIHVwcGVyIGlmLg0K
DQo+ICsgICAgICAgIH0NCj4gKyAgICB9IHdoaWxlKHhjaW5mbyAhPSBOVUxMKTsNCj4gKw0K
DQpXaXRoIGRvaW5nIGFsbCBvZiB0aGlzIGZvciBiZWluZyBhYmxlIHRvIGFzc2lnbiBvdGhl
ciBkb21haW5zIGNyZWF0ZWQNCmF0IGJvb3QgdG8gY3B1cG9vbHMsIHNob3VsZG4ndCB5b3Ug
YWRkIG5hbWVzIGZvciBvdGhlciBkb21haW5zIHRoYW4gZG9tMA0KaGVyZSwgdG9vPw0KDQoN
Ckp1ZXJnZW4NCg==
--------------3l0rYN46bNsgHZAMZVLZIi2s
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3l0rYN46bNsgHZAMZVLZIi2s--

--------------60GwdNqEHkJ18tNLYn7Yegn9--

--------------sriHtO36xC09mYCYC9x41a3o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmILgZYFAwAAAAAACgkQsN6d1ii/Ey9N
Gwf/Yr3vTwVYWvOeKVC6puMJU1+L6CL+1LUHewSXromDW0kj1Ep86IeEs7vlVVy4Qr3E2ZURxvNv
wFX/0Js9IMwSxoseyeGl4ehJEnq/KkGcRwXMg/M2AYQsQaVrHEeQ5t1NHPxEhHB6enSbhNzDLG7i
ddEi+4mPgJE6PY4O//fuyHcB4aF47FOBO0LyXhGcXuCNB21jI9D9aO2aiRTWXBS13uIKp0oNJFIe
echM/saePGn0ZjB4R+p9R9gg+EvN3fxUl8CJ9G68y1rijdzdQzzXpkKjpOyzQFrDxpHzwKEhUHhC
PSApeR6KayYPHHmgxdqzEl46QRmYDONfBGETXUyI0g==
=jWpi
-----END PGP SIGNATURE-----

--------------sriHtO36xC09mYCYC9x41a3o--


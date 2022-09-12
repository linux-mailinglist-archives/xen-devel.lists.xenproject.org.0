Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730185B5691
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405588.648058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf6T-0001QJ-4n; Mon, 12 Sep 2022 08:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405588.648058; Mon, 12 Sep 2022 08:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXf6T-0001Nw-27; Mon, 12 Sep 2022 08:47:41 +0000
Received: by outflank-mailman (input) for mailman id 405588;
 Mon, 12 Sep 2022 08:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXf6R-0001Nq-JW
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:47:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd0d292-3277-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 10:47:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17B992279B;
 Mon, 12 Sep 2022 08:47:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3490139E0;
 Mon, 12 Sep 2022 08:47:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wqAvMinyHmPZMgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 08:47:37 +0000
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
X-Inumbo-ID: 8dd0d292-3277-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662972458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YgTqOJxFI6coZ78jbYMdppqy8+zLTF9s4a9pMzQh86c=;
	b=rnSGMw8xjYYTdIQBLhaTiB3fWvx7ZKj4tZ62vkMEBPLerZ90I7oRHi07fBdUFa6ij/IORS
	AN7uW6kKIBXKYeHWnpDGGalU7LnNwOWm1L6yWV417v7Gt6ujODBmUWPJshoK6Z7NMwi7hB
	YbkO38Pztt21siWmbRE9WWkfBMqD5E0=
Message-ID: <b44345d4-0e3b-db07-834d-9a8ed8c5b9b2@suse.com>
Date: Mon, 12 Sep 2022 10:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
 <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
 <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5nm4ThQlerYa0nUZQVbiCxOA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5nm4ThQlerYa0nUZQVbiCxOA
Content-Type: multipart/mixed; boundary="------------AoA9YMWGoaS02hf6c5aKohTH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <b44345d4-0e3b-db07-834d-9a8ed8c5b9b2@suse.com>
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
 <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
 <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>
In-Reply-To: <e00875fe-1277-6e1d-ceeb-fc54cbcdf099@xen.org>

--------------AoA9YMWGoaS02hf6c5aKohTH
Content-Type: multipart/mixed; boundary="------------eZ2hSjHL5Px8QFa0I0IfwhE2"

--------------eZ2hSjHL5Px8QFa0I0IfwhE2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjIgMTA6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzA5LzIwMjIgMDk6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMi4wOS4yMiAxMDozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTIuMDkuMjAy
MiAxMDoyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMTIuMDkuMjIgMTA6MTks
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMTIuMDkuMjAyMiAwNzo1MywgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+Pj4+PiBBZGQgYSBoZWxwZXIgZG9taWRfdG9fZG9tYWluKCkg
cmV0dXJuaW5nIHRoZSBzdHJ1Y3QgZG9tYWluIHBvaW50ZXIgZm9yDQo+Pj4+Pj4gYSBkb21h
aW4gZ2l2ZSBieSBpdHMgZG9taWQgYW5kIHdoaWNoIGlzIGtub3duIG5vdCBiZWluZyBhYmxl
IHRvIGJlDQo+Pj4+Pj4gcmVsZWFzZWQgKGl0cyByZWZlcmVuY2UgY291bnQgaXNuJ3QgaW5j
cmVtZW50ZWQgYW5kIG5vIHJjdV9sb2NrX2RvbWFpbigpDQo+Pj4+Pj4gaXMgY2FsbGVkIGZv
ciBpdCkuDQo+Pj4+Pj4NCj4+Pj4+PiBJbiBvcmRlciB0byBzaW1wbGlmeSBjb2RpbmcgYWRk
IGFuIGludGVybmFsIGhlbHBlciBmb3IgZG9pbmcgdGhlIGxvb2t1cA0KPj4+Pj4+IGFuZCBj
YWxsIHRoYXQgZnJvbSB0aGUgbmV3IGZ1bmN0aW9uIGFuZCBzaW1pbGFyIGZ1bmN0aW9ucy4N
Cj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCj4+Pj4+DQo+Pj4+PiBJIGRvbid0IHNlZSBhbiBpc3N1ZSB3aXRoIGFkZGlu
ZyBzdWNoIGEgaGVscGVyIChyZXNwb25kaW5nIHRvIHlvdXIgY29uY2Vybg0KPj4+Pj4gaW4g
dGhlIGNvdmVyIGxldHRlciksIGJ1dCBJIHRoaW5rIHRoZSBjb25zdHJhaW50cyBuZWVkIHRv
IGJlIGVtcGFoc2l6ZWQNCj4+Pj4+IG1vcmU6IFdlIGFscmVhZHkgaGF2ZSBnZXRfa25vd25h
bGl2ZV9kb21haW4oKSBhbmQgZ2V0X2RvbWFpbl9ieV9pZCgpLCBzbw0KPj4+Pj4gaG93IGFi
b3V0IG5hbWluZyB0aGUgbmV3IGhlbHBlciBnZXRfa25vd25hbGl2ZV9kb21haW5fYnlfaWQo
KT8gQW5kIHRoZW4gLi4uDQo+Pj4+DQo+Pj4+IEkgZXhwbGljaXRseSBkaWRuJ3QgbmFtZSBp
dCAiZ2V0Xy4uLiIsIGFzIHRob3NlIGhlbHBlcnMgYWxsIGluY3JlbWVudCB0aGUNCj4+Pj4g
cmVmZXJlbmNlIGNvdW50IG9mIHRoZSBkb21haW4uIEFuZCB0aGlzIGlzIE5PVCBkb25lIGJ5
IHRoZSBuZXcgaGVscGVyLg0KPj4+DQo+Pj4gSG1tLCBhZ3JlZWQuIEJ1dCBkb21pZF90b19k
b21haW4oKSBpc24ndCBleHByZXNzaW5nIHRoZSAia25vd24gYWxpdmUiIGFzcGVjdCwNCj4+
PiB5ZXQgdGhhdCdzIHJlbGV2YW50IHRvIHNlZSB3aGVuIHJldmlld2luZyBuZXcgdXNlcyBv
ZiB0aGUgZnVuY3Rpb24uIFN1Y2ggdXNlcw0KPj4+IGFyZW4ndCBsaWtlbHkgdG8gbWFrZSB0
aGUgcmV2aWV3ZXIgZ28gbG9vayBhdCB0aGUgZnVuY3Rpb24gZGVjbGFyYXRpb24gd2hlbg0K
Pj4+IHRoZSBmdW5jdGlvbiBuYW1lIGlzIHByZXR0eSAiaW5ub2NlbnQiLg0KPj4NCj4+IE9r
YXksIHdoYXQgYWJvdXQgZG9taWRfdG9fa25vd25hbGl2ZV9kb21haW4oKT8NCj4+DQo+PiBP
ciBrbm93bmFsaXZlX2RvbWFpbl9mcm9tX2RvbWlkKCk/DQo+IA0KPiBGV0lXLCBJIGFtIGZp
bmUgd2l0aCBlaXRoZXIuIEhvd2V2ZXIsIHBsZWFzZSBkb24ndCByZXBsYWNlICd0bycgd2l0
aCAnMicgaWYgeW91IA0KPiBuZWVkIGEgaW50ZXJuYWwgaGVscGVyLiBKdXN0IHN1ZmZpeGVk
IHdpdGggJ2xvY2tlZCcgdG8gbWFrZSBjbGVhciB0aGlzIGlzIGEgDQo+IHZlcnNpb24gd2hl
cmUgdGhlIGNhbGxlciBzaG91bGQgdGFrZSB0aGUgbG9jay4NCg0KSSBjYW4ganVzdCByZW5h
bWUgaXQgdG8gImRvbWlkX3RvX2RvbWFpbigpIiwgbm93IHRoYXQgdGhlIG9mZmljaWFsIGhl
bHBlciB3aWxsDQpnZXQgYW5vdGhlciBuYW1lLg0KDQoNCkp1ZXJnZW4NCg==
--------------eZ2hSjHL5Px8QFa0I0IfwhE2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------eZ2hSjHL5Px8QFa0I0IfwhE2--

--------------AoA9YMWGoaS02hf6c5aKohTH--

--------------5nm4ThQlerYa0nUZQVbiCxOA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMe8ikFAwAAAAAACgkQsN6d1ii/Ey97
Jwf/XiCOZBPw+oz4jPyflGOA3O+k+erqf6j+FGvgN0adb/Y/hSXcCgIjEPPuGQQ7b/sMXo4UJKO6
BtEuDWt4cuksxiQwgrQYiweKyapBwp5Aa3+kBQkZ1hWqdXRDP6pApk6RjZgUo3Xf9uZ8o4zD3Oai
+lHK7V2ZjPyLYmm65322UmRIE29ZTkcznYU4sk/hompcj6U5HSWxgGx3MNlS06PK8Or9tx0ckPC0
c12lUu8vcnoEBVYoHC6Fe57laNUyeoIiK7ycrDJD04j8a2sN1Zbz9Kp1zH0xDol4WjVlQtjkbd2Q
dMoqaBDtDbD928VNj+W7n8VUBJL8AeKest8M+CIQew==
=ltjD
-----END PGP SIGNATURE-----

--------------5nm4ThQlerYa0nUZQVbiCxOA--


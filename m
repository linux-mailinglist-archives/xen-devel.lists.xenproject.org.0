Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD1570681
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 17:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365221.595334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuti-00034i-2W; Mon, 11 Jul 2022 15:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365221.595334; Mon, 11 Jul 2022 15:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAuth-00031r-VD; Mon, 11 Jul 2022 15:00:29 +0000
Received: by outflank-mailman (input) for mailman id 365221;
 Mon, 11 Jul 2022 15:00:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAutg-00031l-QO
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 15:00:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c0c22d-012a-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 17:00:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 25E052290A;
 Mon, 11 Jul 2022 15:00:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0822513322;
 Mon, 11 Jul 2022 15:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qfxlAAk7zGJ8VwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 15:00:25 +0000
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
X-Inumbo-ID: 31c0c22d-012a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657551625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0Z1JkHrguLco+8+ty/we+2irNYLKfPVb+Y5yghHYsc=;
	b=sMVURUtimO1dxdr7T1PHvRykBnKGm+qKXctBtyfmWiPbX66+sKaoLSSnlawHMdgL3VfoyB
	op97TEoHm+md7UzATRv6T6M+U8dnnW7mqQ+135k6anJI0B4ETxckciwgv3+KLisGSIW20W
	2Olf2BfdfFO5Dd7Q7z8BHms1PqMV1As=
Message-ID: <58b2eece-ecb3-76b4-ffa3-f58c571af308@suse.com>
Date: Mon, 11 Jul 2022 17:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220624092806.27700-1-jgross@suse.com>
 <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
 <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>
 <YswzJN6UJqauUeQ8@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YswzJN6UJqauUeQ8@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rCUIbmLcLfCR2XjE0Jv7iHRg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rCUIbmLcLfCR2XjE0Jv7iHRg
Content-Type: multipart/mixed; boundary="------------8KNVHbP50tb5XEVIKxg1b48K";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <58b2eece-ecb3-76b4-ffa3-f58c571af308@suse.com>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
References: <20220624092806.27700-1-jgross@suse.com>
 <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
 <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>
 <YswzJN6UJqauUeQ8@perard.uk.xensource.com>
In-Reply-To: <YswzJN6UJqauUeQ8@perard.uk.xensource.com>

--------------8KNVHbP50tb5XEVIKxg1b48K
Content-Type: multipart/mixed; boundary="------------1VkUtf5eBA0T6yKdW50nsMhn"

--------------1VkUtf5eBA0T6yKdW50nsMhn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMTY6MjYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAwNywgMjAyMiBhdCAwNTowMTozOFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMDcuMDcuMjIgMTY6NDUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIEZy
aSwgSnVuIDI0LCAyMDIyIGF0IDExOjI4OjA2QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IEluIGNhc2Ugb2YgbWF4bWVtICE9IG1lbXNpemUgdGhlIEU4MjAgbWFwIG9m
IHRoZSBQVkggc3R1YmRvbSBpcyB3cm9uZywNCj4+Pj4gYXMgaXQgaXMgbWlzc2luZyB0aGUg
UkFNIGFib3ZlIG1lbXNpemUuDQo+Pj4+DQo+Pj4+IEFkZGl0aW9uYWxseSB0aGUgTU1JTyBh
cmVhIHNob3VsZCBvbmx5IGNvdmVyIHRoZSBIVk0gc3BlY2lhbCBwYWdlcy4NCj4+Pj4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+
PiAtLS0NCj4+Pj4gICAgdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jIHwg
MTYgKysrKysrKysrKy0tLS0tLQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC14
ZW5zdG9yZS1kb21haW4uYw0KPj4+PiBpbmRleCBiNGYzYzY1YThhLi5kYWQ4ZTQzYzQyIDEw
MDY0NA0KPj4+PiAtLS0gYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMN
Cj4+Pj4gKysrIGIvdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRvbWFpbi5jDQo+Pj4+
IEBAIC0xNTcsMjEgKzE1OCwyNCBAQCBzdGF0aWMgaW50IGJ1aWxkKHhjX2ludGVyZmFjZSAq
eGNoKQ0KPj4+PiAgICAgICAgICAgIGNvbmZpZy5mbGFncyB8PSBYRU5fRE9NQ1RMX0NERl9o
dm0gfCBYRU5fRE9NQ1RMX0NERl9oYXA7DQo+Pj4+ICAgICAgICAgICAgY29uZmlnLmFyY2gu
ZW11bGF0aW9uX2ZsYWdzID0gWEVOX1g4Nl9FTVVfTEFQSUM7DQo+Pj4+ICAgICAgICAgICAg
ZG9tLT50YXJnZXRfcGFnZXMgPSBtZW1fc2l6ZSA+PiBYQ19QQUdFX1NISUZUOw0KPj4+PiAt
ICAgICAgICBkb20tPm1taW9fc2l6ZSA9IEdCKDQpIC0gTEFQSUNfQkFTRV9BRERSRVNTOw0K
Pj4+PiArICAgICAgICBkb20tPm1taW9fc2l6ZSA9IFg4Nl9IVk1fTlJfU1BFQ0lBTF9QQUdF
UyA8PCBYQ19QQUdFX1NISUZUOw0KPj4+PiAgICAgICAgICAgIGRvbS0+bG93bWVtX2VuZCA9
IChtZW1fc2l6ZSA+IExBUElDX0JBU0VfQUREUkVTUykgPw0KPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIExBUElDX0JBU0VfQUREUkVTUyA6IG1lbV9zaXplOw0KPj4+PiAg
ICAgICAgICAgIGRvbS0+aGlnaG1lbV9lbmQgPSAobWVtX3NpemUgPiBMQVBJQ19CQVNFX0FE
RFJFU1MpID8NCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0IoNCkgKyBt
ZW1fc2l6ZSAtIExBUElDX0JBU0VfQUREUkVTUyA6IDA7DQo+Pj4+IC0gICAgICAgIGRvbS0+
bW1pb19zdGFydCA9IExBUElDX0JBU0VfQUREUkVTUzsNCj4+Pj4gKyAgICAgICAgZG9tLT5t
bWlvX3N0YXJ0ID0gKFg4Nl9IVk1fRU5EX1NQRUNJQUxfUkVHSU9OIC0NCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFg4Nl9IVk1fTlJfU1BFQ0lBTF9QQUdFUykgPDwgWENf
UEFHRV9TSElGVDsNCj4+Pj4gICAgICAgICAgICBkb20tPm1heF92Y3B1cyA9IDE7DQo+Pj4+
ICAgICAgICAgICAgZTgyMFswXS5hZGRyID0gMDsNCj4+Pj4gLSAgICAgICAgZTgyMFswXS5z
aXplID0gZG9tLT5sb3dtZW1fZW5kOw0KPj4+PiArICAgICAgICBlODIwWzBdLnNpemUgPSAo
bWF4X3NpemUgPiBMQVBJQ19CQVNFX0FERFJFU1MpID8NCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgTEFQSUNfQkFTRV9BRERSRVNTIDogbWF4X3NpemU7DQo+Pj4+ICAgICAgICAg
ICAgZTgyMFswXS50eXBlID0gRTgyMF9SQU07DQo+Pj4+IC0gICAgICAgIGU4MjBbMV0uYWRk
ciA9IExBUElDX0JBU0VfQUREUkVTUzsNCj4+Pj4gKyAgICAgICAgZTgyMFsxXS5hZGRyID0g
ZG9tLT5tbWlvX3N0YXJ0Ow0KPj4+DQo+Pj4NCj4+PiBTbywgaXQgaXNuJ3QgZXhwZWN0ZWQg
dG8gaGF2ZSBhbiBlbnRyeSBjb3ZlcmluZyB0aGUgTEFQSUMgYWRkcmVzc2VzLA0KPj4+IHJp
Z2h0PyBJIGd1ZXNzIG5vdCBhcyBzZWVuIGluIGRmMWNhMWRmZTIwLg0KPj4+DQo+Pj4gQnV0
IGJhc2VkIG9uIHRoYXQgc2FtZSBjb21taXQgaW5mbywgc2hvdWxkbid0IHRoZSBMQVBJQyBh
ZGRyZXNzIHBhcnQgb2YNCj4+PiBgZG9tLT5tbWlvX3N0YXJ0LCBkb20tPm1taW9fc2l6ZWA/
IChJIGRvbid0IGtub3cgaG93IGRvbS0+bW1pb19zdGFydCBpcw0KPj4+IHVzZWQsIHlldCwg
YnV0IG1heWJlIGl0J3MgdXNlZCBieSBYZW4gb3IgeGVuIGxpYnJhcmllcyB0byBhdm9pZA0K
Pj4+IGFsbG9jYXRpb25zIGluIHRoZSB3cm9uZyBwbGFjZXMpDQo+Pg0KPj4gSW4gbXkgdW5k
ZXJzdGFuZGluZyB0aGlzIGlzIHRoZSBwdXJwb3NlIG9mIGxvd21lbV9lbmQuDQo+IA0KPiBJ
dCBsb29rcyBsaWtlIGRvbS0+bW1pb19zdGFydCBpcyB1c2VkIGluIGxpYnhlbmd1ZXN0Lm1l
bWluaXRfaHZtKCkgdG8NCj4gY2hlY2sgaWYgYSBzdXBlciBwYWdlIGNhbiBiZSBhbGxvY2F0
ZWQsIGJ1dCBsb3dtZW1fZW5kIHdvdWxkIHByb2JhYmx5DQo+IHByZXZlbnQgdGhlIGNoZWNr
IGZyb20gYmVlbiBkb25lIGluIHRoZSBmaXJzdCBwbGFjZS4gU28gSSBndWVzcw0KPiBtbWlv
X3N0YXJ0IHZhbHVlIGRvZXNuJ3QgbWF0dGVyIGluIHRoaXMgY2FzZS4NCj4gDQo+IFRoZXJl
IGlzIGFub3RoZXIgdXNlIG9mIG1taW9fc3RhcnQsIGl0J3MgaW4gbW9kdWxlX2luaXRfb25l
KCksIHdoaWNoIEkNCj4gdGhpbmsgaXMgdXNlZCB0byBibG9icyB0byB0aGUgZ3Vlc3QgbGlr
ZSB0aGUgZmlybXdhcmUgb3IgdGhlIGFjcGkNCj4gdGFibGVzLiBJdCdzIGFuIG90aGVyIGNo
ZWNrIHRvIGJlIHN1cmUgdGhlIG5ldyAibW9kdWxlIiBkb2Vzbid0IG92ZXJsYXANCj4gd2l0
aCB0aGUgbW1pbyByZWdpb24uIFNvIGJhc2VkIG9uIHRoYXQsIEkga2luZCBvZiB0aGluayB0
aGF0IG1taW9fc3RhcnQNCj4gc2hvdWxkIGluY2x1ZGUgdGhlIExBUElDLiBCdXQgb24gdGhl
IG90aGVyIGVuZCwgSSBkb24ndCB0aGluaw0KPiAiaW5pdC14ZW5zdG9yZS1kb21haW4iIGhh
dmUgYW55ICJtb2R1bGUiLCBzbyBhZ2FpbiwgdGhlIHZhbHVlIG9mDQo+IG1taW9fc3RhcnQg
cHJvYmFibHkgZG9lc24ndCBtYXR0ZXIgYXQgdGhpcyBwb2ludC4NCj4gDQo+IEJ1dCBtYXli
ZSB3ZSBzaG91bGQga2VlcCBMQVBJQyBpbiBbbW1pb19zdGFydCxtbWlvX3NpemVdIGp1c3Qg
aW4gY2FzZSBpdA0KPiBtYXR0ZXIgbGF0ZXIuDQoNCk9rYXksIHdpbGwgc2VuZCBhbiB1cGRh
dGVkIHBhdGNoIHZlcnNpb24uDQoNCg0KSnVlcmdlbg0K
--------------1VkUtf5eBA0T6yKdW50nsMhn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------1VkUtf5eBA0T6yKdW50nsMhn--

--------------8KNVHbP50tb5XEVIKxg1b48K--

--------------rCUIbmLcLfCR2XjE0Jv7iHRg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLMOwgFAwAAAAAACgkQsN6d1ii/Ey/L
pQf/fJo8NIT8iwpEakRnHmDW9Shi7PH64FqQGhu3Yd3RlOA4vBr1xeA7UadMDgtqawzmpUQZy1pL
656KXMbfF54PUD1mmHbs3ygCxQQMoZiByx4xJj/0lO7lxOcJ1LKgV1uSOd5zN0yDCLVgpCaC4xsa
m5RsqvizoYPMi3gnNJJI+u6mBeuF89jdHkG9KhnhynAOlUTBJ8F703bPBjp9+bJ0avbLO+cuh06B
d3hU0cEpbNCcuFSVJZcUHya8Cm/3zowny1v8tmREbPqUq6W/vfAKzOdWMeMUIhDg5wHTTuPigXp+
JMj1O8N1uqXLAwpznW9nnAZ67GL/DZEBJJR2CGgr6g==
=CYpf
-----END PGP SIGNATURE-----

--------------rCUIbmLcLfCR2XjE0Jv7iHRg--


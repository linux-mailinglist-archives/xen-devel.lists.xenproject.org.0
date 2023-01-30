Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F196806B9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 08:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486597.753980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOsV-0003ky-RU; Mon, 30 Jan 2023 07:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486597.753980; Mon, 30 Jan 2023 07:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOsV-0003j7-OV; Mon, 30 Jan 2023 07:46:59 +0000
Received: by outflank-mailman (input) for mailman id 486597;
 Mon, 30 Jan 2023 07:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pMOsT-0003j0-JK
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 07:46:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430fec9f-a072-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 08:46:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A93E31F855;
 Mon, 30 Jan 2023 07:46:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6379813444;
 Mon, 30 Jan 2023 07:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yj1jFux112OhOgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Jan 2023 07:46:52 +0000
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
X-Inumbo-ID: 430fec9f-a072-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675064812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ALpHwQMeAdsVsGP0ybp8R+AM8RKHdlTkO8wdswsUhLE=;
	b=nUMlCu5Zp0/v+jExYw3wpknW+6/4FMKc4rU97FqzbowQKInb+19prp0rzXQWCrbxDKk4WM
	/iHXOLHG3dFsHrKWKNCSP/PIaWuwIi4pmwcn8njYrWO+qHVHl0hGERrlb/GSXBWaFJlf12
	hROQ9g8Bt36LVAvx8FSJYq7R22KnD+8=
Message-ID: <962bd261-74cc-e78d-be54-182e4b9457d8@suse.com>
Date: Mon, 30 Jan 2023 08:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230130063725.22846-1-jgross@suse.com>
 <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/public: move xenstore related doc into 9pfs.h
In-Reply-To: <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BWOUTv0k8SDabJuUN1eDeCCP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BWOUTv0k8SDabJuUN1eDeCCP
Content-Type: multipart/mixed; boundary="------------OBH3csnzWrCvYAGhXPsvQDvJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <962bd261-74cc-e78d-be54-182e4b9457d8@suse.com>
Subject: Re: [PATCH] xen/public: move xenstore related doc into 9pfs.h
References: <20230130063725.22846-1-jgross@suse.com>
 <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>
In-Reply-To: <03cfb3a9-66f7-c376-c815-feba34afaf51@suse.com>

--------------OBH3csnzWrCvYAGhXPsvQDvJ
Content-Type: multipart/mixed; boundary="------------tnIMrbXhoJ8ZtA5q1DC00ZsX"

--------------tnIMrbXhoJ8ZtA5q1DC00ZsX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjMgMDg6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wMS4yMDIz
IDA3OjM3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIFhlbnN0b3JlIHJlbGF0ZWQg
ZG9jdW1lbnRhdGlvbiBpcyBjdXJyZW50bHkgdG8gYmUgZm91bmQgaW4NCj4+IGRvY3MvbWlz
Yy85cGZzLnBhbmRvYywgaW5zdGVhZCBvZiB0aGUgcmVsYXRlZCBoZWFkZXIgZmlsZQ0KPj4g
eGVuL2luY2x1ZGUvcHVibGljL2lvLzlwZnMuaCBsaWtlIGZvciBtb3N0IG90aGVyIHBhcmF2
aXJ0dWFsaXplZA0KPj4gZGV2aWNlIHByb3RvY29scy4NCj4+DQo+PiBUaGVyZSBpcyBhIGNv
bW1lbnQgaW4gdGhlIGhlYWRlciBwb2ludGluZyBhdCB0aGUgZG9jdW1lbnQsIGJ1dCB0aGUN
Cj4+IGdpdmVuIGZpbGUgbmFtZSBpcyB3cm9uZy4gQWRkaXRpb25hbGx5IHN1Y2ggaGVhZGVy
cyBhcmUgbWVhbnQgdG8gYmUNCj4+IGNvcGllZCBpbnRvIGNvbnN1bWluZyBwcm9qZWN0cyAo
TGludXgga2VybmVsLCBxZW11LCBldGMuKSwgc28gcG9pbnRpbmcNCj4+IGF0IGEgZG9jIGZp
bGUgaW4gdGhlIFhlbiBnaXQgcmVwb3NpdG9yeSBpc24ndCByZWFsbHkgaGVscGZ1bCBmb3Ig
dGhlDQo+PiBjb25zdW1lcnMgb2YgdGhlIGhlYWRlci4NCj4+DQo+PiBUaGlzIHNpdHVhdGlv
biBpcyBmYXIgZnJvbSBpZGVhbCwgd2hpY2ggaXMgYWxyZWFkeSBiZWluZyBwcm92ZWQgYnkg
dGhlDQo+PiBmYWN0IHRoYXQgbmVpdGhlciBxZW11IG5vciB0aGUgTGludXgga2VybmVsIGFy
ZSBpbXBsZW1lbnRpbmcgdGhlDQo+PiBkZXZpY2UgYXR0YWNoL2RldGFjaCBwcm90b2NvbCBj
b3JyZWN0bHkuIEFkZGl0aW9uYWxseSB0aGUgZG9jdW1lbnRlZA0KPj4gWGVuc3RvcmUgZW50
cmllcyBhcmUgbm90IG1hdGNoaW5nIHRoZSByZWFsaXR5LCBhcyB0aGUgInRhZyIgWGVuc3Rv
cmUNCj4+IGVudHJ5IGlzIG9uIHRoZSBmcm9udGVuZCBzaWRlLCBub3Qgb24gdGhlIGJhY2tl
bmQgb25lLg0KPj4NCj4+IENoYW5nZSB0aGF0IGJ5IG1vdmluZyB0aGUgWGVuc3RvcmUgcmVs
YXRlZCA5cGZzIGRvY3VtZW50YXRpb24gZnJvbQ0KPj4gZG9jcy9taXNjLzlwZnMucGFuZG9j
IGludG8geGVuL2luY2x1ZGUvcHVibGljL2lvLzlwZnMuaCB3aGlsZSBmaXhpbmcNCj4+IHRo
ZSB3cm9uZyBYZW5zdG9yZSBlbnRyeSBkZXRhaWwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIGRvY3MvbWlz
Yy85cGZzLnBhbmRvYyAgICAgICAgfCAxNTEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAgeGVuL2luY2x1ZGUvcHVibGljL2lvLzlwZnMuaCB8IDE2NSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE2
NCBpbnNlcnRpb25zKCspLCAxNTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RvY3MvbWlzYy85cGZzLnBhbmRvYyBiL2RvY3MvbWlzYy85cGZzLnBhbmRvYw0KPj4gaW5k
ZXggYjAzNGZiNWZhNi4uMDBmNjgxN2EwMSAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWlzYy85
cGZzLnBhbmRvYw0KPj4gKysrIGIvZG9jcy9taXNjLzlwZnMucGFuZG9jDQo+PiBAQCAtNTks
MTU3ICs1OSw2IEBAIFRoaXMgZG9jdW1lbnQgZG9lcyBub3QgY292ZXIgdGhlIDlwZnMgY2xp
ZW50L3NlcnZlciBkZXNpZ24gb3INCj4+ICAgaW1wbGVtZW50YXRpb24sIG9ubHkgdGhlIHRy
YW5zcG9ydCBmb3IgaXQuDQo+PiAgIA0KPj4gICANCj4+IC0jIyBYZW5zdG9yZQ0KPiANCj4g
TWF5YmUgbGVhdmUgYSByZWZlcmVuY2UgaGVyZSBub3cgcG9pbnRpbmcgYXQgdGhlIHB1Ymxp
YyBoZWFkZXI/DQoNCk9rYXksIFdvdWxkIHlvdSBiZSBmaW5lIHdpdGg6DQoNCiAgICMjIENv
bmZpZ3VyYXRpb24NCg0KICAgVGhlIGZyb250ZW5kIGFuZCBiYWNrZW5kIGFyZSBjb25maWd1
cmVkIHZpYSBYZW5zdG9yZS4gSGF2ZSBhIGxvb2sgYXQNCiAgIFtoZWFkZXJdIGZvciB0aGUg
ZGV0YWlsZWQgWGVuc3RvcmUgZW50cmllcyBhbmQgdGhlIGNvbm5lY3Rpb24gcHJvdG9jb2wu
DQoNCg0KSnVlcmdlbg0K
--------------tnIMrbXhoJ8ZtA5q1DC00ZsX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tnIMrbXhoJ8ZtA5q1DC00ZsX--

--------------OBH3csnzWrCvYAGhXPsvQDvJ--

--------------BWOUTv0k8SDabJuUN1eDeCCP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPXdewFAwAAAAAACgkQsN6d1ii/Ey+0
nwf/QDoHbA8gEdLPtyOtVWWvXRDU/v9LKelzfNU3CaaYDRqRyxkWeDfd25nNzDib8+RC81wntvlo
/guA762EGN3Vy/Ge9ueBqu8yLadmCP1sITBfm1NOprCgOjENDc4Z723+AfJfYRkeUbwxHYxZ9ZQd
7riJQqSE+gw1dO81uM/wRzdjELqudliyivYaCJHXaBfe5s3ixl758Jh0TuCpNA/T9swb9uITPm6x
I3j1K28/NM5Dbfr9HE9vjp83jOfmehC+r5Htet4QKo/CJbteOxY9kLxbtV7gUY7dNvQrmOLfoOnL
fmNdWT6irhTq2GUSrbTXf+V5CZG0OinzOOepR4acjg==
=haox
-----END PGP SIGNATURE-----

--------------BWOUTv0k8SDabJuUN1eDeCCP--


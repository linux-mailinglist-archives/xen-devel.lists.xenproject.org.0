Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795855931BA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 17:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387626.623952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbxq-0008JH-Hr; Mon, 15 Aug 2022 15:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387626.623952; Mon, 15 Aug 2022 15:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbxq-0008HJ-Et; Mon, 15 Aug 2022 15:25:14 +0000
Received: by outflank-mailman (input) for mailman id 387626;
 Mon, 15 Aug 2022 15:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dGwN=YT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oNbxp-0008HD-H0
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 15:25:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 744c93d5-1cae-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 17:25:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B56DB375AF;
 Mon, 15 Aug 2022 15:25:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 889DF13A93;
 Mon, 15 Aug 2022 15:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2lwGIFdl+mICeQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 15 Aug 2022 15:25:11 +0000
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
X-Inumbo-ID: 744c93d5-1cae-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1660577111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0R6SEiNk8qJpj0bv5l6nAJKgtmIYjRFQre7AfPEwQw=;
	b=C6S2d/7cQ0yVW/rZgBHXfBXcQRDcA6D4dutzN1sO0x2UDlCNkTlxAZrz/vU6lsu84+2E79
	SW664Gk36hNa++o5fdwSf2z7eHG7MckJFUVB5uxQkRB0/bLjoQ99TykBGQw6ozwXpn/HaT
	NK3ZNEx2qUkx5GavbdVMszc7NK0rrc4=
Message-ID: <937b0162-957d-630d-f05e-60ce5162699f@suse.com>
Date: Mon, 15 Aug 2022 17:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: rework hypercall argument count table instantiation
 & use
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
 <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
 <63d22c68-6a0e-b135-67fa-23d067bebafc@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <63d22c68-6a0e-b135-67fa-23d067bebafc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8rlvbxQcCnZbIggDkFL1Fu8h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8rlvbxQcCnZbIggDkFL1Fu8h
Content-Type: multipart/mixed; boundary="------------0ZCzFz4ezZQm2PXpfLht2IgT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <937b0162-957d-630d-f05e-60ce5162699f@suse.com>
Subject: Re: [PATCH] x86: rework hypercall argument count table instantiation
 & use
References: <cc65eb5f-310e-b51b-71c6-17b93cbe7d0d@suse.com>
 <caea2bb5-a37b-8660-4a8a-03aa7476af35@suse.com>
 <63d22c68-6a0e-b135-67fa-23d067bebafc@suse.com>
In-Reply-To: <63d22c68-6a0e-b135-67fa-23d067bebafc@suse.com>

--------------0ZCzFz4ezZQm2PXpfLht2IgT
Content-Type: multipart/mixed; boundary="------------GcOzcE23ncw8pn2F98GCV33F"

--------------GcOzcE23ncw8pn2F98GCV33F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjIgMTc6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDIy
IDE3OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjcuMDcuMjIgMTg6MDAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IFRoZSBpbml0aWFsIG9ic2VydmF0aW9uIHdlcmUgZHVw
bGljYXRlIHN5bWJvbHMgdGhhdCBvdXIgY2hlY2tpbmcgd2FybnMNCj4+PiBhYm91dC4gSW5z
dGVhZCBvZiBtZXJlbHkgcmVuYW1pbmcgb25lIG9yIGJvdGggcGFpcihzKSBvZiBzeW1ib2xz
LA0KPj4+IHJlZHVjZSAjaWZkZWYtYXJ5IGF0IHRoZSBzYW1lIHRpbWUgYnkgbW92aW5nIHRo
ZSBpbnN0YW50aWF0aW9uIG9mIHRoZQ0KPj4+IGFycmF5cyBpbnRvIG1hY3JvcyAoYSBuYXRp
dmUgYW5kIGEgMzItYml0IG9uZSBlYWNoLCB3aGVyZSBsaWtlbHkgbW9yZQ0KPj4+IHJlZHVu
ZGFuY3kgY291bGQgYmUgZWxpbWluYXRlZCwgaWYgd2UgcmVhbGx5IHdhbnRlZCB0bykuIFdo
aWxlIGRvaW5nIHRoZQ0KPj4+IGNvbnZlcnNpb24gYWxzbyBzdG9wIG9wZW4tY29kaW5nIGFy
cmF5X2FjY2Vzc19ub3NwZWMoKS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gVGhhbmtzLg0KPiANCj4+IFdpdGggb25l
IHNtYWxsIG5pdCAuLi4NCj4+DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2h5cGVyY2FsbC5oDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVy
Y2FsbC5oDQo+Pj4gQEAgLTQzLDE2ICs0Myw2IEBAIGNvbXBhdF9jb21tb25fdmNwdV9vcCgN
Cj4+PiAgICANCj4+PiAgICAjZW5kaWYgLyogQ09ORklHX0NPTVBBVCAqLw0KPj4+ICAgIA0K
Pj4+IC0jaWZuZGVmIE5ERUJVRw0KPj4+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBf
Z2V0X25hcmdzKGNvbnN0IHVuc2lnbmVkIGNoYXIgKnRibCwgdW5zaWduZWQgaW50IGMpDQo+
Pj4gLXsNCj4+PiAtICAgIHJldHVybiB0YmxbY107DQo+Pj4gLX0NCj4+PiAtI2RlZmluZSBn
ZXRfbmFyZ3ModCwgYykgX2dldF9uYXJncyh0LCBhcnJheV9pbmRleF9ub3NwZWMoYywgQVJS
QVlfU0laRSh0KSkpDQo+Pj4gLSNlbHNlDQo+Pj4gLSNkZWZpbmUgZ2V0X25hcmdzKHRibCwg
YykgMA0KPj4+IC0jZW5kaWYNCj4+PiAtDQo+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkIGNs
b2JiZXJfcmVncyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywNCj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBuYXJncykNCj4+PiAgICB7
DQo+Pj4gQEAgLTY5LDYgKzU5LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbG9iYmVyX3Jl
Z3Moc3RydWN0IGMNCj4+PiAgICAjZW5kaWYNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gKyNk
ZWZpbmUgY2xvYmJlcl9yZWdzKHIsIG4sIHQpICh7IFwNCj4+PiArICAgIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBjaGFyIHRbXSA9IGh5cGVyY2FsbF9hcmdzXyAjIyB0OyBcDQo+Pj4gKyAg
ICBjbG9iYmVyX3JlZ3MociwgYXJyYXlfYWNjZXNzX25vc3BlYyh0LCBuKSk7IFwNCj4+PiAr
fSkNCj4+PiArDQo+Pg0KPj4gLi4uIGNvdWxkIEkgdGFsayB5b3UgaW50byBub3Qgb3Zlcmxv
YWRpbmcgdGhlIG5hbWVzIG9mIHRoZSBpbmxpbmUNCj4+IGZ1bmN0aW9ucyB3aXRoIG1hY3Jv
cz8gWW91IGFyZSBjaGFuZ2luZyBhbGwgdGhlIGNhbGwgc2l0ZXMgYW55d2F5Lg0KPiANCj4g
SSBkbywgYnV0IHRoZSBjYWxsIHNpdGVzIHNob3VsZCB1c2UgdGhlIHByZXNlbnQgbmFtZSwg
c28gaWYgYW55dGhpbmcNCj4gaXQgd291bGQgYmUgdGhlIGlubGluZSBmdW5jdGlvbiB0aGF0
IGdldHMgcmVuYW1lZC4gWWV0IEknbQ0KPiBkZWxpYmVyYXRlbHkgdXNpbmcgdGhlIHNhbWUg
bmFtZSwgdG8ga2luZCBvZiAiaGlkZSIgdGhlIGFjdHVhbA0KPiBmdW5jdGlvbiAobGlrZSB3
ZSBkbyBlbHNld2hlcmUgaW4gYSBmZXcgY2FzZXMpLiBUaGUgZWZmZWN0IHlvdSdyZQ0KPiBh
ZnRlciB3b3VsZCBiZSBpbXBsaWNpdGx5IGhhZCBieSBnb2luZyB0aGUgcm91dGUgZGVzY3Jp
YmVkIGluIHRoZQ0KPiBwb3N0LWNvbW1pdC1tZXNzYWdlIHJlbWFyay4gSSdkIGJlIGhhcHB5
IHRvIHN3aXRjaCB0byB0aGF0IG1vZGVsLCBpZg0KPiB0aGF0IHN1aXRlcyB5b3UgYmV0dGVy
Lg0KDQpXb3VsZCBiZSBmaW5lIHdpdGggbWUuDQoNCg0KSnVlcmdlbg0K
--------------GcOzcE23ncw8pn2F98GCV33F
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GcOzcE23ncw8pn2F98GCV33F--

--------------0ZCzFz4ezZQm2PXpfLht2IgT--

--------------8rlvbxQcCnZbIggDkFL1Fu8h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmL6ZVcFAwAAAAAACgkQsN6d1ii/Ey+s
zwf+Lpq0K5dj8EhKm7Y+yIj5bYvx/UgN9sDpbsR0Pr95tpml0QOn8o+MqhRM1t+0Z1PLeHEBTrLv
a0+iyJ3n4lBtb/JsdA679jnQK981OiBuIrZLjJqfrSuLqrKZzqLSt+QgxBeGhNySmOlRVRTeIb90
UvAEgMTYWVo0uFFhJJta1jkEp9gWZd+fZxHXUGv3PWoRqrrMcCqIFCVJirLkicFaZ5+UrTN/YW9I
r3cyeUnCJrMRLxF97AD/LyqFBlhXEN0h+yme480fZAroyxJEYD29FvgZ7lXOdsrYlAAR5pkyc89p
UcI/+bxbhKPzeJU4pKmQkfV3eWbKnnfDSf4R+60qwA==
=0n2t
-----END PGP SIGNATURE-----

--------------8rlvbxQcCnZbIggDkFL1Fu8h--


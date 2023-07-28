Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6133766405
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 08:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571336.894925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGoL-0002NP-Ge; Fri, 28 Jul 2023 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571336.894925; Fri, 28 Jul 2023 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPGoL-0002KS-CG; Fri, 28 Jul 2023 06:18:49 +0000
Received: by outflank-mailman (input) for mailman id 571336;
 Fri, 28 Jul 2023 06:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPGoJ-0002KM-Lv
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 06:18:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6009db-2d0e-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 08:18:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3EF4321992;
 Fri, 28 Jul 2023 06:18:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12717133F7;
 Fri, 28 Jul 2023 06:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eL4MA8Vdw2QxKQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 06:18:45 +0000
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
X-Inumbo-ID: 9b6009db-2d0e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690525125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpPwGwD2a1pKkjmVdtQ3ttXRitOiNrk/G3EkHn3WJDE=;
	b=J+s41VDN/hviRGvZkirjvFLa5WssdGfOdGJrI6ZNED0T4KlytyO9hLRTfiQuIQTyJ5WFsR
	D9YJu3/yRSEBLxuCTYNRiq2ApYeRq92eE7NDS9J6DZidF/WjILknE4SgOpAal8f7VAjX/m
	5REt6FZlqMnvouJ4+MdnU7POV31bu/4=
Message-ID: <9376a2aa-9d78-c345-37f7-be54d91dd7f1@suse.com>
Date: Fri, 28 Jul 2023 08:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/25] tools/xenstore: move copying of node data out of
 db_fetch()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-17-jgross@suse.com>
 <85b2d6a2-b9ee-4c8a-3a7a-cb22934af825@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <85b2d6a2-b9ee-4c8a-3a7a-cb22934af825@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6ZB8ZeXR6iZF0vNM2eLxEQQ5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6ZB8ZeXR6iZF0vNM2eLxEQQ5
Content-Type: multipart/mixed; boundary="------------79VZLgIfBvH6n8EVTF8zgWic";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9376a2aa-9d78-c345-37f7-be54d91dd7f1@suse.com>
Subject: Re: [PATCH v3 16/25] tools/xenstore: move copying of node data out of
 db_fetch()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-17-jgross@suse.com>
 <85b2d6a2-b9ee-4c8a-3a7a-cb22934af825@xen.org>
In-Reply-To: <85b2d6a2-b9ee-4c8a-3a7a-cb22934af825@xen.org>

--------------79VZLgIfBvH6n8EVTF8zgWic
Content-Type: multipart/mixed; boundary="------------YV7anb0Raym8kDWT8QIByOSA"

--------------YV7anb0Raym8kDWT8QIByOSA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDcuMjMgMjM6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSB0aGUgbm9kZSBkYXRhIGlzIGNvcGllZCBpbiBkYl9mZXRjaCgpIG9uIGVhY2ggZGF0
YSBiYXNlIHJlYWQgaW4NCj4+IG9yZGVyIHRvIGF2b2lkIGFjY2lkZW50YWwgZGF0YSBiYXNl
IG1vZGlmaWNhdGlvbnMgd2hlbiB3b3JraW5nIG9uIGENCj4+IG5vZGUuDQo+Pg0KPj4gcmVh
ZF9ub2RlKCkgaXMgdGhlIG9ubHkgY2FsbGVyIG9mIGRiX2ZldGNoKCkgd2hpY2ggaXNuJ3Qg
ZnJlZWluZyB0aGUNCj4+IHJldHVybmVkIGRhdGEgYXJlYSBpbW1lZGlhdGVseSBhZnRlciB1
c2luZyBpdC4gVGhlIG90aGVyIGNhbGxlcnMgZG9uJ3QNCj4+IG1vZGlmeSB0aGUgcmV0dXJu
ZWQgZGF0YSwgc28gdGhleSBkb24ndCBuZWVkIHRoZSBkYXRhIHRvIGJlIGNvcGllZC4NCj4+
DQo+PiBNb3ZlIGNvcHlpbmcgb2YgdGhlIGRhdGEgaW50byByZWFkX25vZGUoKSwgcmVzdWx0
aW5nIGluIGEgc3BlZWR1cCBvZg0KPj4gdGhlIG90aGVyIGNhbGxlcnMgZHVlIHRvIG5vIG1l
bW9yeSBhbGxvY2F0aW9uIGFuZCBubyBjb3B5aW5nIGJlaW5nDQo+PiBuZWVkZWQgYW55bW9y
ZS4NCj4+DQo+PiBUaGlzIGFsbG93cyB0byBsZXQgZGJfZmV0Y2goKSByZXR1cm4gYSBwb2lu
dGVyIHRvIGNvbnN0IGRhdGEuDQo+Pg0KPj4gQXMgZGJfZmV0Y2goKSBjYW4ndCByZXR1cm4g
YW55IGVycm9yIG90aGVyIHRoYW4gRU5PRU5UIG5vdywgZXJyb3INCj4+IGhhbmRsaW5nIGZv
ciB0aGUgY2FsbGVycyBjYW4gYmUgc2ltcGxpZmllZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4g
LSBuZXcgcGF0Y2gNCj4+IFYzOg0KPj4gLSBtb2RpZnkgcmV0dXJuIHR5cGUgb2YgZGJfZmV0
Y2goKSB0byByZXR1cm4gYSBwb2ludGVyIHRvIGNvbnN0DQo+PiDCoMKgIChKdWxpZW4gR3Jh
bGwpDQo+PiAtIGRyb3Agc3RhbGUgY29tbWVudCAoSnVsaWVuIEdyYWxsKQ0KPj4gLSBmaXgg
dHJhbnNhY3Rpb24gaGFuZGxpbmcNCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuY8KgwqDCoMKgwqDCoMKgIHwgNDUgKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmjCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0
aW9uLmMgfCAyMyArKysrKysrKystLS0tDQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvcmUuYw0KPj4gaW5kZXggOWY4ODkxNDE0OS4uMWY1ZjExOGYxYyAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IEBAIC01NTUsMTAgKzU1NSw5IEBAIHN0YXRp
YyB2b2lkIGluaXRpYWxpemVfZmRzKGludCAqcF9zb2NrX3BvbGxmZF9pZHgsIGludCANCj4+
ICpwdGltZW91dCkNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqAgfQ0KPj4gLXN0cnVjdCB4c190
ZGJfcmVjb3JkX2hkciAqZGJfZmV0Y2goY29uc3QgY2hhciAqZGJfbmFtZSwgc2l6ZV90ICpz
aXplKQ0KPj4gK2NvbnN0IHN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciAqZGJfZmV0Y2goY29u
c3QgY2hhciAqZGJfbmFtZSwgc2l6ZV90ICpzaXplKQ0KPj4gwqAgew0KPj4gLcKgwqDCoCBj
b25zdCBzdHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIgKmhkcjsNCj4+IC3CoMKgwqAgc3RydWN0
IHhzX3RkYl9yZWNvcmRfaGRyICpwOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgeHNfdGRiX3JlY29y
ZF9oZHIgKmhkcjsNCj4gDQo+IENhbid0ICdoZHInIHN0YXkgY29uc3Q/DQoNCk9oIHllcywg
SSB0aGluayBzby4NCg0KPiANCj4+IMKgwqDCoMKgwqAgaGRyID0gaGFzaHRhYmxlX3NlYXJj
aChub2RlcywgZGJfbmFtZSk7DQo+PiDCoMKgwqDCoMKgIGlmICghaGRyKSB7DQo+IA0KPiBb
Li4uXQ0KPiANCj4+IEBAIC0zODgsMTQgKzM4NSwyNiBAQCBzdGF0aWMgaW50IGZpbmFsaXpl
X3RyYW5zYWN0aW9uKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChpLT50YV9ub2RlKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBoZHIgPSBkYl9mZXRjaChpLT50cmFuc19uYW1lLCAmc2l6ZSk7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoaGRyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBE
ZWxldGUgdHJhbnNhY3Rpb24gZW50cnkgYW5kIHdyaXRlIGl0IGFzDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBuby1UQSBlbnRyeS4gQXMgd2Ugb25seSBob2xk
IGEgcmVmZXJlbmNlDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0
byB0aGUgZGF0YSwgaW5jcmVtZW50IGl0cyByZWYgY291bnQsIHRoZW4NCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRlbGV0ZSBpdCBmcm9tIHRoZSBEQi4gTm93
IHdlIG93biBpdCBhbmQgY2FuDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBkcm9wIHRoZSBjb25zdCBhdHRyaWJ1dGUgZm9yIGNoYW5naW5nIHRoZQ0KPiANCj4g
SXQgaXMgbm90IGdyZWF0LCBidXQgSSB1bmRlcnN0YW5kIHRoaXMgaXMgYW5vdGhlciBuZWNl
c3NhcnkgZXZpbC4gU28gSSBhbSBvayANCj4gd2l0aCB0aGlzIGNhc3QtYXdheSBjb25zdC4g
SXQgaXMgYWxzbyB3ZWxsIGRvY3VtZW50ZWQuDQoNClRoYW5rcy4gSW4gZmFjdCB0aGlzIGlz
IGEgZml4IHJlc3VsdGluZyBmcm9tIGxldHRpbmcgZGJfZmV0Y2goKSByZXR1cm4gYSBjb25z
dA0KcG9pbnRlci4gU28gdGhlIGNvbnN0IGF0dHJpYnV0ZSBhbHJlYWR5IHBhaWQgb2ZmLg0K
DQoNCkp1ZXJnZW4NCg==
--------------YV7anb0Raym8kDWT8QIByOSA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YV7anb0Raym8kDWT8QIByOSA--

--------------79VZLgIfBvH6n8EVTF8zgWic--

--------------6ZB8ZeXR6iZF0vNM2eLxEQQ5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDXcQFAwAAAAAACgkQsN6d1ii/Ey8c
Qwf/VePratuxvxa0jX8cz/iMOKsffAuOW85pgkWIkSc5oAuzH+qb3CZoipBMVJecQjGA51Zv0hbh
g5fUhwCcvLkZs/qUi35xebBbKmX3kRC9iESFagIMZH/LlTj94fqZr1Q38Vr7MhbomdiqhJp00riP
7Z9c/VdTx39RdKnJkVQNChEqpEfPoPA5dtOrOT6SewEYN1mJ+akGbcw7dOPy86hvFFC1bxVGxgT8
jPjmms5iVkqbNi3m0Hx5br+PLaAVqcspToWlUf9Ny4aeC7cL2NFkhAecaznjz4MZM/Gmg5+BemjF
HnPxp7YEORed0gkig4Ey4To4Q5mpogYr6sZoL194YQ==
=30Vp
-----END PGP SIGNATURE-----

--------------6ZB8ZeXR6iZF0vNM2eLxEQQ5--


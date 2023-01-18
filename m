Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225DC6717E6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480285.744594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4t2-0005pU-NS; Wed, 18 Jan 2023 09:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480285.744594; Wed, 18 Jan 2023 09:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4t2-0005m1-Jk; Wed, 18 Jan 2023 09:37:40 +0000
Received: by outflank-mailman (input) for mailman id 480285;
 Wed, 18 Jan 2023 09:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov7m=5P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pI4t1-0005lt-0s
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:37:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f587631-9713-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:36:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 29DBA2105F;
 Wed, 18 Jan 2023 09:37:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05AA0139D2;
 Wed, 18 Jan 2023 09:37:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9tERANC9x2OEPAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 18 Jan 2023 09:37:19 +0000
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
X-Inumbo-ID: 9f587631-9713-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674034640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0o+AyJI14PwuFyUSa9s+WRcizaGnvbNkWcpl14cf+NA=;
	b=aU1uOSGQ60R016T35+Tzicd0iW+jsn7n8KJ05L9S2aOlSiVQUxrlIQPKwo9t5o01jgZCGc
	ZEDwuoBdopJOCDKRoFsDRyF2Uvos+WwovGB268FzitbJhkDVXDWeI22PvzdkhMTOGF7+Oq
	s2Lu9B9rNwqnaKPxbLl4VVJ6G9lQaEc=
Message-ID: <4aadcf29-04bc-964b-d2b2-42fd38dd5296@suse.com>
Date: Wed, 18 Jan 2023 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
 <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
 <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
 <449dae4d-c19c-87be-88ef-aa3ff79f1a23@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <449dae4d-c19c-87be-88ef-aa3ff79f1a23@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wOukoQWG4drppYz06WcT9RP9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wOukoQWG4drppYz06WcT9RP9
Content-Type: multipart/mixed; boundary="------------ayT9o0cF8XL7SNk0S0qWs5aA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4aadcf29-04bc-964b-d2b2-42fd38dd5296@suse.com>
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
 <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
 <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
 <449dae4d-c19c-87be-88ef-aa3ff79f1a23@xen.org>
In-Reply-To: <449dae4d-c19c-87be-88ef-aa3ff79f1a23@xen.org>

--------------ayT9o0cF8XL7SNk0S0qWs5aA
Content-Type: multipart/mixed; boundary="------------Fc1pInSWs2umJeLayAZLBA9k"

--------------Fc1pInSWs2umJeLayAZLBA9k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjMgMTA6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE4LzAxLzIwMjMgMDY6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxNy4wMS4yMyAyMzozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxNy8wMS8yMDIzIDA5OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBUb2RheSBjaGVja19zdG9yZSgpIGlzIG9ubHkgdGVzdGluZyB0aGUgY29ycmVjdG5l
c3Mgb2YgdGhlIG5vZGUgdHJlZS4NCj4+Pj4NCj4+Pj4gQWRkIHZlcmlmaWNhdGlvbiBvZiB0
aGUgYWNjb3VudGluZyBkYXRhIChudW1iZXIgb2Ygbm9kZXMpwqAgYW5kIGNvcnJlY3QNCj4+
Pg0KPj4+IE5JVDogb25lIHRvbyBtYW55IHNwYWNlIGJlZm9yZSAnYW5kJy4NCj4+Pg0KPj4+
PiB0aGUgZGF0YSBpZiBpdCBpcyB3cm9uZy4NCj4+Pj4NCj4+Pj4gRG8gdGhlIGluaXRpYWwg
Y2hlY2tfc3RvcmUoKSBjYWxsIG9ubHkgYWZ0ZXIgWGVuc3RvcmUgZW50cmllcyBvZiBhDQo+
Pj4+IGxpdmUgdXBkYXRlIGhhdmUgYmVlbiByZWFkLg0KPj4+DQo+Pj4gQ2FuIHlvdSBjbGFy
aWZ5IHdoZXRoZXIgdGhpcyBpcyBuZWVkZWQgZm9yIHRoZSByZXN0IG9mIHRoZSBwYXRjaCwg
b3Igc2ltcGx5IGEgDQo+Pj4gbmljZSB0aGluZyB0byBoYXZlIGluIGdlbmVyYWw/DQo+Pg0K
Pj4gSSdsbCBhZGQ6ICJUaGlzIGlzIHdhbnRlZCB0byBtYWtlIHN1cmUgdGhlIGFjY291bnRp
bmcgZGF0YSBpcyBjb3JyZWN0IGFmdGVyDQo+PiBhIGxpdmUgdXBkYXRlLiINCj4gDQo+IEZp
bmUgd2l0aCBtZS4NCj4gDQo+Pg0KPj4+DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIHRvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmPCoMKgIHwgNjIgKysrKysrKysrKysrKysrKy0t
LS0tLQ0KPj4+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCA4NiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9kb21haW4uaCB8wqAgNCArKw0KPj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQs
IDEzNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jDQo+Pj4+IGluZGV4IDMwOTkwNzdhODYuLmUyMDFmMTQwNTMg
MTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+
Pj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4+PiBAQCAtMjM4
OSw4ICsyMzg5LDYgQEAgdm9pZCBzZXR1cF9zdHJ1Y3R1cmUoYm9vbCBsaXZlX3VwZGF0ZSkN
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1hbnVhbF9ub2RlKCJAaW50cm9kdWNlRG9tYWlu
IiwgTlVMTCk7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW5fbmJlbnRyeV9maXgo
ZG9tMF9kb21pZCwgNSwgdHJ1ZSk7DQo+Pj4+IMKgwqDCoMKgwqAgfQ0KPj4+PiAtDQo+Pj4+
IC3CoMKgwqAgY2hlY2tfc3RvcmUoKTsNCj4+Pj4gwqAgfQ0KPj4+PiDCoCBzdGF0aWMgdW5z
aWduZWQgaW50IGhhc2hfZnJvbV9rZXlfZm4odm9pZCAqaykNCj4+Pj4gQEAgLTI0MzMsMjAg
KzI0MzEsMjggQEAgaW50IHJlbWVtYmVyX3N0cmluZyhzdHJ1Y3QgaGFzaHRhYmxlICpoYXNo
LCBjb25zdCANCj4+Pj4gY2hhciAqc3RyKQ0KPj4+PiDCoMKgICogQXMgd2UgZ28sIHdlIHJl
Y29yZCBlYWNoIG5vZGUgaW4gdGhlIGdpdmVuIHJlYWNoYWJsZSBoYXNodGFibGUuIFRoZXNl
DQo+Pj4+IMKgwqAgKiBlbnRyaWVzIHdpbGwgYmUgdXNlZCBsYXRlciBpbiBjbGVhbl9zdG9y
ZS4NCj4+Pj4gwqDCoCAqLw0KPj4+PiArDQo+Pj4+ICtzdHJ1Y3QgY2hlY2tfc3RvcmVfZGF0
YSB7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGhhc2h0YWJsZSAqcmVhY2hhYmxlOw0KPj4+PiAr
wqDCoMKgIHN0cnVjdCBoYXNodGFibGUgKmRvbWFpbnM7DQo+Pj4+ICt9Ow0KPj4+PiArDQo+
Pj4+IMKgIHN0YXRpYyBpbnQgY2hlY2tfc3RvcmVfc3RlcChjb25zdCB2b2lkICpjdHgsIHN0
cnVjdCBjb25uZWN0aW9uICpjb25uLA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBub2RlICpub2RlLCB2b2lkICphcmcpDQo+Pj4+IMKgIHsNCj4+
Pj4gLcKgwqDCoCBzdHJ1Y3QgaGFzaHRhYmxlICpyZWFjaGFibGUgPSBhcmc7DQo+Pj4+ICvC
oMKgwqAgc3RydWN0IGNoZWNrX3N0b3JlX2RhdGEgKmRhdGEgPSBhcmc7DQo+Pj4+IC3CoMKg
wqAgaWYgKGhhc2h0YWJsZV9zZWFyY2gocmVhY2hhYmxlLCAodm9pZCAqKW5vZGUtPm5hbWUp
KSB7DQo+Pj4+ICvCoMKgwqAgaWYgKGhhc2h0YWJsZV9zZWFyY2goZGF0YS0+cmVhY2hhYmxl
LCAodm9pZCAqKW5vZGUtPm5hbWUpKSB7DQo+Pj4NCj4+PiBJSVVDIHRoZSBjYXN0IGlzIG9u
bHkgbmVjZXNzYXJ5IGJlY2F1c2UgaGFzaHRhYmxlX3NlYXJjaCgpIGV4cGVjdHMgYSANCj4+
PiBub24tY29uc3QgdmFsdWUuIEkgY2FuJ3QgdGhpbmsgZm9yIGEgcmVhc29uIGZvciB0aGUg
a2V5IHRvIGJlIG5vbi1jb25zdC4gU28gSSANCj4+PiB3aWxsIGxvb2sgdG8gc2VuZCBhIGZv
bGxvdy11cCBwYXRjaC4NCj4+DQo+PiBJdCBpcyBwb3NzaWJsZSwgYnV0IG5hc3R5LCBkdWUg
dG8gdGFsbG9jX2ZyZWUoKSBub3QgdGFraW5nIGEgY29uc3QgcG9pbnRlci4NCj4gDQo+IEkg
YW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgcmVhc29uaW5nLiBMb29raW5nIGF0IGhh
c2h0YWJsZV9zZWFyY2goKSwgSSANCj4gZG9uJ3Qgc2VlIGEgY2FsbCB0byB0YWxsb2NfZnJl
ZSgpLg0KDQpPaCwgSSB0aG91Z2h0IHlvdSB3ZXJlIHJlZmVycmluZyB0byB0aGUga2V5IGlu
IGdlbmVyYWwuDQoNCg0KSnVlcmdlbg0K
--------------Fc1pInSWs2umJeLayAZLBA9k
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Fc1pInSWs2umJeLayAZLBA9k--

--------------ayT9o0cF8XL7SNk0S0qWs5aA--

--------------wOukoQWG4drppYz06WcT9RP9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPHvc8FAwAAAAAACgkQsN6d1ii/Ey+l
owf9E8EKsi5u6uTrzz8Bj6lJ3sbef2QdG1PpGr5yrvaTtNWggxAd9fVIsu4QKrBN2EqXraHJJ/r3
0NeklGg32JPwdByMCNfvOrCIREdVm0DjqkI8758SNPZDqKf4KGtMEYPeJe+QCc8X7/yfz5hmzaQ5
JCE631UvLFx3bHm2l01z3I4XGdAcwn6Z6nOfDwhhqzIiTMoA5FT2Zpze6M+f6IhRyLTTXgaf+NHQ
yZ8TYK4ZRql7OFosMi4Lul+fDpI64F+zAmlfp+K4fQmEVgYeKgX3atRC3Z6JwpVeLaGU2yMq5Dpk
9kdRxoTiYcGJg7qz/qzuvyNYKiomQooyyA8HhNU0Lg==
=b/Ek
-----END PGP SIGNATURE-----

--------------wOukoQWG4drppYz06WcT9RP9--


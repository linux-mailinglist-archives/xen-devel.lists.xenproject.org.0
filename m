Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE647423F5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556764.869514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoq2-0006Sb-88; Thu, 29 Jun 2023 10:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556764.869514; Thu, 29 Jun 2023 10:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoq2-0006Pj-5L; Thu, 29 Jun 2023 10:25:22 +0000
Received: by outflank-mailman (input) for mailman id 556764;
 Thu, 29 Jun 2023 10:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEoq0-0006PZ-FY
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:25:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cb82b39-1667-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 12:25:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC8702186E;
 Thu, 29 Jun 2023 10:25:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA78A13905;
 Thu, 29 Jun 2023 10:25:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1ceSLwpcnWQVGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 10:25:14 +0000
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
X-Inumbo-ID: 3cb82b39-1667-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688034314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ydm1pVCvL7Xed4qdB6Kz/bwbkfsK04tplzJxBL6u3hA=;
	b=Hfz+fiWsYYdbVeHvcZ9wUAS1vwuoaA+R1tKHaQtYe4rLmD7c4Gu5NzQx0o4XlYORMTSlRG
	QumMVG1v7RURCOWPFKpq8HtmXxTbbG2nriQEi3Vcp8/+f2IjHTDpN4SXpMtNdacELb9mSM
	w0M6nXBfYAt8Ks9+azV6/jP0nzebSN8=
Message-ID: <d5fdd09c-1e02-a415-8c11-0110b3ad3923@suse.com>
Date: Thu, 29 Jun 2023 12:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
 <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
 <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
 <bde3a806-2a90-5185-8483-0ec7b8972ca6@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <bde3a806-2a90-5185-8483-0ec7b8972ca6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QFLV0TEnZ0zpiCjYmKyOPdce"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QFLV0TEnZ0zpiCjYmKyOPdce
Content-Type: multipart/mixed; boundary="------------thx0oEgb1E9J0NwxsfKfo3Sl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <d5fdd09c-1e02-a415-8c11-0110b3ad3923@suse.com>
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
 <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
 <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
 <bde3a806-2a90-5185-8483-0ec7b8972ca6@xen.org>
In-Reply-To: <bde3a806-2a90-5185-8483-0ec7b8972ca6@xen.org>

--------------thx0oEgb1E9J0NwxsfKfo3Sl
Content-Type: multipart/mixed; boundary="------------tD0FfGytrBtkRGySKRYjGhDt"

--------------tD0FfGytrBtkRGySKRYjGhDt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDYuMjMgMTI6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI5LzA2LzIwMjMgMTA6MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMC4wNi4yMyAxMzoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAzMC8wNS8yMDIzIDEwOjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaCBiL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+Pj4gaW5kZXggZjdjYjAzNWYyNi4u
N2ZjNmQ3M2U1YSAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvcmUuaA0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+
Pj4+IEBAIC0zNTgsMTEgKzM1OCwxMiBAQCBleHRlcm4geGVuZ250dGFiX2hhbmRsZSAqKnhn
dF9oYW5kbGU7DQo+Pj4+IMKgIGludCByZW1lbWJlcl9zdHJpbmcoc3RydWN0IGhhc2h0YWJs
ZSAqaGFzaCwgY29uc3QgY2hhciAqc3RyKTsNCj4+Pj4gKy8qIERhdGEgYmFzZSBhY2Nlc3Mg
ZnVuY3Rpb25zLiAqLw0KPj4+PiDCoCB2b2lkIHNldF90ZGJfa2V5KGNvbnN0IGNoYXIgKm5h
bWUsIFREQl9EQVRBICprZXkpOw0KPj4+PiDCoCBpbnQgZG9fdGRiX3dyaXRlKHN0cnVjdCBj
b25uZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5LCBUREJfREFUQSAqZGF0YSwNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGVfYWNjb3VudF9kYXRhICphY2MsIGlu
dCBmbGFnLCBib29sIG5vX3F1b3RhX2NoZWNrKTsNCj4+Pj4gLWludCBkb190ZGJfZGVsZXRl
KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5LA0KPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBub2RlX2FjY291bnRfZGF0YSAqYWNjKTsNCj4+Pj4gK2lu
dCBkYl9kZWxldGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IGNoYXIgKm5hbWUs
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGVfYWNjb3VudF9kYXRhICph
Y2MpOw0KPj4+PiDCoCB2b2lkIGNvbm5fZnJlZV9idWZmZXJlZF9kYXRhKHN0cnVjdCBjb25u
ZWN0aW9uICpjb25uKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF90cmFuc2FjdGlvbi5jIA0KPj4+PiBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90
cmFuc2FjdGlvbi5jDQo+Pj4+IGluZGV4IDE2NDZjMDcwNDAuLmJmMTczZjNkMWQgMTAwNjQ0
DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jDQo+
Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jDQo+Pj4+
IEBAIC0zODUsOCArMzg1LDcgQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFuc2FjdGlvbihz
dHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEVu
dHJpZXMgZm9yIHVubW9kaWZpZWQgbm9kZXMgY2FuIGJlIHJlbW92ZWQgZWFybHkuICovDQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWktPm1vZGlmaWVkKSB7DQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpLT50YV9ub2RlKSB7DQo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3RkYl9rZXkoaS0+dHJhbnNfbmFtZSwgJnRh
X2tleSk7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRvX3Rk
Yl9kZWxldGUoY29ubiwgJnRhX2tleSwgTlVMTCkpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGRiX2RlbGV0ZShjb25uLCBpLT50cmFuc19uYW1lLCBOVUxM
KSkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBFSU87DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9kZWwoJmktPmxpc3QpOw0KPj4+PiBAQCAt
Mzk1LDIxICszOTQsMjEgQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFuc2FjdGlvbihzdHJ1
Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4+IMKgwqDCoMKg
wqAgd2hpbGUgKChpID0gbGlzdF90b3AoJnRyYW5zLT5hY2Nlc3NlZCwgc3RydWN0IGFjY2Vz
c2VkX25vZGUsIGxpc3QpKSkgew0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgc2V0X3RkYl9rZXko
aS0+bm9kZSwgJmtleSk7DQo+Pj4NCj4+PiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHlv
dSBhcmUgbW92aW5nIGxhdGVyIHRoZSBjYWxsIHRvIHNldF90ZGJfa2V5KCkgaW4gDQo+Pj4g
dGhpcyBwYXRjaC4NCj4+DQo+PiBJdCBpcyBuZWVkZWQgaW4gdGhlIGlmICgpIGNhc2Ugb25s
eSBub3csIGJlZm9yZSB0aGUgcGF0Y2ggdGhlIGVsc2UgY2FzZQ0KPj4gbmVlZGVkIGl0LCB0
b28uDQo+IA0KPiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZW4gY2FuIHdlIGFsc28gbW92ZSB0
aGUgZGVjbGFyYXRpb24gdG8gd2l0aGluIHRoZSBpZiBjYXNlPyANCj4gVGhpcyB3b3VsZCBt
YWtlIGEgYml0IG1vcmUgb2J2aW91cyB0aGF0IHRoZSBvdGhlciBicmFuY2ggaXMgbm90IG1l
YW50IHRvIHVzZSB0aGUgDQo+IHZhcmlhYmxlIGFueW1vcmUNCg0KTm8sIGtleSBpcyB1c2Vk
IGluIHRoZSBwcmV2aW91cyBsb29wLCB0b28uDQoNCg0KSnVlcmdlbg0K
--------------tD0FfGytrBtkRGySKRYjGhDt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tD0FfGytrBtkRGySKRYjGhDt--

--------------thx0oEgb1E9J0NwxsfKfo3Sl--

--------------QFLV0TEnZ0zpiCjYmKyOPdce
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdXAoFAwAAAAAACgkQsN6d1ii/Ey9P
3wf9FW+HiGT4SzmmrW67KSBISWGxJPfSpdbdAWButwWJO+cRozgqgsNCKwqr8oIbhbPj1EvwNdJd
pV6ZhSYBwkh0ITUGlX5a40AEp8fCKiG1FZmxLNHii3EAMH4X2D/H5BCd9V9bj3BCCcdnRRAZNxMt
cl9KH0rYu1lWWw9zwgfGD6rcteJrBrOQQ5hwWks0S54sKOCtPR0ZCXsZ7sLMG2HkpH81Jfa/IrQO
muJZY1FBSpSSVgLQ4Mu9newTL9UOW+9i7vI0v9rRGt/3UIJyCqQKTFyMcw/N0HyZ5A/o6C2VRhGN
oLpR0wO3qd6407KSk1frZIXZEjaq8MJQwEWCC6I7ag==
=mIij
-----END PGP SIGNATURE-----

--------------QFLV0TEnZ0zpiCjYmKyOPdce--


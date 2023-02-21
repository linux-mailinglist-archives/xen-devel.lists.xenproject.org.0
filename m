Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4D69DC42
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 09:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498598.769486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOD3-00015z-MR; Tue, 21 Feb 2023 08:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498598.769486; Tue, 21 Feb 2023 08:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUOD3-00013Q-JF; Tue, 21 Feb 2023 08:41:13 +0000
Received: by outflank-mailman (input) for mailman id 498598;
 Tue, 21 Feb 2023 08:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7VW=6R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUOD2-00011d-Ih
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 08:41:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d3699fd-b1c3-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 09:41:10 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 826E95C239;
 Tue, 21 Feb 2023 08:41:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FA0D13481;
 Tue, 21 Feb 2023 08:41:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9M4jFqWD9GMkEAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Feb 2023 08:41:09 +0000
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
X-Inumbo-ID: 7d3699fd-b1c3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676968869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R0hiB1GnotiwjOHdz4A5KmIRYHIqDndNjpbzReRgBtg=;
	b=bBq60sd934e+9HDq16qLkSK5596mFFckK/1sQ5iXTnP2UGeRc5rgBENt8I09tR9RBHNeVb
	ThV2pAuXdtCqiaCmHO0t9oBAGc3wG/SM4n4BfRaXCAn3FUPKQH3ZpeAPo8mQWgKHGtOlHf
	Y9b8QGO6SPnBZlaQSCBUG935j4E4hFk=
Message-ID: <be2e19ce-990c-4e31-4261-616928faa8b5@suse.com>
Date: Tue, 21 Feb 2023 09:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 09/13] tools/xenstore: add TDB access trace support
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-10-jgross@suse.com>
 <0f78fffe-5e53-5881-b5ac-421d1faa5e99@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <0f78fffe-5e53-5881-b5ac-421d1faa5e99@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g2T23BbxSwBUAsZ0xuPE6Gj6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g2T23BbxSwBUAsZ0xuPE6Gj6
Content-Type: multipart/mixed; boundary="------------aWD9t8vcsvlxVOksOoC0UDqX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <be2e19ce-990c-4e31-4261-616928faa8b5@suse.com>
Subject: Re: [PATCH v2 09/13] tools/xenstore: add TDB access trace support
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-10-jgross@suse.com>
 <0f78fffe-5e53-5881-b5ac-421d1faa5e99@xen.org>
In-Reply-To: <0f78fffe-5e53-5881-b5ac-421d1faa5e99@xen.org>

--------------aWD9t8vcsvlxVOksOoC0UDqX
Content-Type: multipart/mixed; boundary="------------TfmROTUzoiAkQ8CDoW1gzxoT"

--------------TfmROTUzoiAkQ8CDoW1gzxoT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMjM6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyMC8wMS8yMDIzIDEwOjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgbmV3
IHRyYWNlIHN3aXRjaCAidGRiIiBhbmQgdGhlIHJlbGF0ZWQgdHJhY2UgY2FsbHMuDQo+Pg0K
Pj4gVGhlICJ0ZGIiIHN3aXRjaCBpcyBvZmYgcGVyIGRlZmF1bHQuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gV2l0aCBv
bmUgcmVtYXJrIChzZWUgYmVsb3cpOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jwqDCoMKgwqDCoMKgwqAgfCA4ICsrKysrKystDQo+PiDCoCB0
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5owqDCoMKgwqDCoMKgwqAgfCA2ICsrKysr
Kw0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9uLmMgfCA3ICsr
KysrKy0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IGluZGV4IDU1
OGVmNDkxYjEuLjQ5ZTE5NmU3YWUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfY29yZS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29y
ZS5jDQo+PiBAQCAtNTg5LDYgKzU4OSw4IEBAIHN0YXRpYyB2b2lkIGdldF9hY2NfZGF0YShU
REJfREFUQSAqa2V5LCBzdHJ1Y3QgDQo+PiBub2RlX2FjY291bnRfZGF0YSAqYWNjKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvbGRfZGF0YS5kcHRyID09IE5VTEwpIHsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjYy0+bWVtb3J5ID0gMDsNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhY2Vf
dGRiKCJyZWFkICVzIHNpemUgJXp1XG4iLCBrZXktPmRwdHIsDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvbGRfZGF0YS5kc2l6ZSArIGtleS0+ZHNpemUpOw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyID0gKHZvaWQgKilvbGRfZGF0YS5k
cHRyOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjLT5tZW1vcnkgPSBvbGRf
ZGF0YS5kc2l6ZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFjYy0+ZG9taWQg
PSBoZHItPnBlcm1zWzBdLmlkOw0KPj4gQEAgLTY1NSw2ICs2NTcsNyBAQCBpbnQgZG9fdGRi
X3dyaXRlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5LCANCj4+IFRE
Ql9EQVRBICpkYXRhLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVycm5vID0gRUlPOw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnJubzsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4g
K8KgwqDCoCB0cmFjZV90ZGIoInN0b3JlICVzIHNpemUgJXp1XG4iLCBrZXktPmRwdHIsIGRh
dGEtPmRzaXplICsga2V5LT5kc2l6ZSk7DQo+PiDCoMKgwqDCoMKgIGlmIChhY2MpIHsNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBEb24ndCB1c2UgbmV3X2RvbWlkLCBhcyBpdCBtaWdo
dCBiZSBhIHRyYW5zYWN0aW9uIG5vZGUuICovDQo+PiBAQCAtNjgyLDYgKzY4NSw3IEBAIGlu
dCBkb190ZGJfZGVsZXRlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVycm5vID0gRUlPOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBlcnJubzsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCB0cmFj
ZV90ZGIoImRlbGV0ZSAlc1xuIiwga2V5LT5kcHRyKTsNCj4+IMKgwqDCoMKgwqAgaWYgKGFj
Yy0+bWVtb3J5KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG9taWQgPSBnZXRfYWNjX2Rv
bWlkKGNvbm4sIGtleSwgYWNjLT5kb21pZCk7DQo+PiBAQCAtNzMxLDYgKzczNSw4IEBAIHN0
cnVjdCBub2RlICpyZWFkX25vZGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IHZv
aWQgDQo+PiAqY3R4LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3I7DQo+PiDC
oMKgwqDCoMKgIH0NCj4+ICvCoMKgwqAgdHJhY2VfdGRiKCJyZWFkICVzIHNpemUgJXp1XG4i
LCBrZXkuZHB0ciwgZGF0YS5kc2l6ZSArIGtleS5kc2l6ZSk7DQo+PiArDQo+PiDCoMKgwqDC
oMKgIG5vZGUtPnBhcmVudCA9IE5VTEw7DQo+PiDCoMKgwqDCoMKgIHRhbGxvY19zdGVhbChu
b2RlLCBkYXRhLmRwdHIpOw0KPj4gQEAgLTI3NDYsNyArMjc1Miw3IEBAIHN0YXRpYyB2b2lk
IHNldF9xdW90YShjb25zdCBjaGFyICphcmcsIGJvb2wgc29mdCkNCj4+IMKgIC8qIFNvcnRl
ZCBieSBiaXQgdmFsdWVzIG9mIFRSQUNFXyogZmxhZ3MuIEZsYWcgaXMgKDF1IDw8IGluZGV4
KS4gKi8NCj4+IMKgIGNvbnN0IGNoYXIgKmNvbnN0IHRyYWNlX3N3aXRjaGVzW10gPSB7DQo+
PiAtwqDCoMKgICJvYmoiLCAiaW8iLCAid3JsIiwgImFjYyIsDQo+PiArwqDCoMKgICJvYmoi
LCAiaW8iLCAid3JsIiwgImFjYyIsICJ0ZGIiLA0KPj4gwqDCoMKgwqDCoCBOVUxMDQo+PiDC
oCB9Ow0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgg
Yi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+PiBpbmRleCAzZTA3MzRhNmM2
Li40MTlhMTQ0Mzk2IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2NvcmUuaA0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaA0KPj4g
QEAgLTMwMyw4ICszMDMsMTQgQEAgZXh0ZXJuIHVuc2lnbmVkIGludCB0cmFjZV9mbGFnczsN
Cj4+IMKgICNkZWZpbmUgVFJBQ0VfSU/CoMKgwqAgMHgwMDAwMDAwMg0KPj4gwqAgI2RlZmlu
ZSBUUkFDRV9XUkzCoMKgwqAgMHgwMDAwMDAwNA0KPj4gwqAgI2RlZmluZSBUUkFDRV9BQ0PC
oMKgwqAgMHgwMDAwMDAwOA0KPj4gKyNkZWZpbmUgVFJBQ0VfVERCwqDCoMKgIDB4MDAwMDAw
MTANCj4+IMKgIGV4dGVybiBjb25zdCBjaGFyICpjb25zdCB0cmFjZV9zd2l0Y2hlc1tdOw0K
Pj4gwqAgaW50IHNldF90cmFjZV9zd2l0Y2goY29uc3QgY2hhciAqYXJnKTsNCj4gDQo+IEFk
ZCBhIG5ld2xpbmUgaGVyZS4NCg0KT2theS4NCg0KDQpKdWVyZ2VuDQo=
--------------TfmROTUzoiAkQ8CDoW1gzxoT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TfmROTUzoiAkQ8CDoW1gzxoT--

--------------aWD9t8vcsvlxVOksOoC0UDqX--

--------------g2T23BbxSwBUAsZ0xuPE6Gj6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP0g6QFAwAAAAAACgkQsN6d1ii/Ey/v
aQf+MLMvqgcWrrsQ5FZ8mUehrocBU/9zM0ScpSkI+63TFtkn9j7C8YOb2ttAzFRLjUyjQAq+lr2E
r5nIJt8FEwzfm0h7HFMoKThYYnA/z2FXBPELpV9b68AQU5OZk8cx+K0lIhj5Z6k7cHI8vTtqJIiH
UipPFrf4FAYsJI6AzmEftJcbIFeD4/JcKC/QAq+8XNW0z0TyHomFSruBeD+nn9Qnr997orW6IeBF
88a4Em9+ODJO2VA11m6w+hh8r/tCTFjrabFkOHJ+PmQAxJNqTv+jPC4LKb6X0gtDzRHCi/Is5/f6
iiiEFTA8qCSJ2X+G2txau4adN5sbRM/KUwTRNxh9eQ==
=H67u
-----END PGP SIGNATURE-----

--------------g2T23BbxSwBUAsZ0xuPE6Gj6--


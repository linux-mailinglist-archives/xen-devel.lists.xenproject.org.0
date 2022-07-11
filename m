Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF195701DF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 14:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365076.595127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsNC-00017M-KJ; Mon, 11 Jul 2022 12:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365076.595127; Mon, 11 Jul 2022 12:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsNC-000153-HM; Mon, 11 Jul 2022 12:18:46 +0000
Received: by outflank-mailman (input) for mailman id 365076;
 Mon, 11 Jul 2022 12:18:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAsNB-00014x-CN
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 12:18:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b6f5fea-0113-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 14:18:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDEDE226DB;
 Mon, 11 Jul 2022 12:18:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A6D913524;
 Mon, 11 Jul 2022 12:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ke8JJCMVzGLNDQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 12:18:43 +0000
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
X-Inumbo-ID: 9b6f5fea-0113-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657541923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coJAKtWro/QwaPzIMIZrthrprFLcSmPOp/3UjS6lE4U=;
	b=Ds3bq2YgWb+RQCUSXyxzEK2NU1ytQGx7sDtukh5f6m52m2QjuBM/85EVrEWw2BK9AbEMdq
	I4qIxsSRsp07bO4Y8Oqrc7prDZsiIDOPj3m7zB3OAm7vOdgjcR0TOF5ersl20JncITLQwj
	XaxlttVT9Gg8XCgY60G6z3i9hTdKafM=
Message-ID: <55665843-dff0-1e71-762e-088089f49f16@suse.com>
Date: Mon, 11 Jul 2022 14:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] tools: remove xenstore entries on vchan server
 closure
Content-Language: en-US
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
 <CACM97VWWz-L8XvJkAUmfU2cOTwu=Hhhu3=w9n9sbi2cSDJk5+g@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CACM97VWWz-L8XvJkAUmfU2cOTwu=Hhhu3=w9n9sbi2cSDJk5+g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CAdvAzzbZbSyA8wUsTIPCwMC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CAdvAzzbZbSyA8wUsTIPCwMC
Content-Type: multipart/mixed; boundary="------------2qNJJd3iXHnjcZN5T4BZyvC1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
Message-ID: <55665843-dff0-1e71-762e-088089f49f16@suse.com>
Subject: Re: [PATCH 1/4] tools: remove xenstore entries on vchan server
 closure
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
 <CACM97VWWz-L8XvJkAUmfU2cOTwu=Hhhu3=w9n9sbi2cSDJk5+g@mail.gmail.com>
In-Reply-To: <CACM97VWWz-L8XvJkAUmfU2cOTwu=Hhhu3=w9n9sbi2cSDJk5+g@mail.gmail.com>

--------------2qNJJd3iXHnjcZN5T4BZyvC1
Content-Type: multipart/mixed; boundary="------------WZ0yoirnOlporgh2V4bfPdOc"

--------------WZ0yoirnOlporgh2V4bfPdOc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMTQ6MTIsIERteXRybyBTZW1lbmV0cyB3cm90ZToNCj4g0L/QvSwgMTEg
0LjRjtC7LiAyMDIyINCzLiDQsiAxMDowOSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjoNCj4+DQo+PiBPbiAwOS4wNy4yMiAxMjoxMCwgZG1pdHJ5LnNlbWVuZXRzQGdtYWls
LmNvbSB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiB2Y2hhbiBzZXJ2ZXIgY3Jl
YXRlcyBYZW5TdG9yZSBlbnRyaWVzIHRvIGFkdmVydGlzZSBpdHMgZXZlbnQgY2hhbm5lbCBh
bmQNCj4+PiByaW5nLCBidXQgdGhvc2UgYXJlIG5vdCByZW1vdmVkIGFmdGVyIHRoZSBzZXJ2
ZXIgcXVpdHMuDQo+Pj4gQWRkIGFkZGl0aW9uYWwgY2xlYW51cCBzdGVwLCBzbyB0aG9zZSBh
cmUgcmVtb3ZlZCwgc28gY2xpZW50cyBkbyBub3QgdHJ5DQo+Pj4gdG8gY29ubmVjdCB0byBh
IG5vbi1leGlzdGluZyBzZXJ2ZXIuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4gLS0tDQo+Pj4gICAgdG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hhbi5oIHwgIDUgKysrKysN
Cj4+PiAgICB0b29scy9saWJzL3ZjaGFuL2luaXQuYyAgICAgfCAyMyArKysrKysrKysrKysr
KysrKysrKysrKw0KPj4+ICAgIHRvb2xzL2xpYnMvdmNoYW4vaW8uYyAgICAgICB8ICA0ICsr
KysNCj4+PiAgICB0b29scy9saWJzL3ZjaGFuL3ZjaGFuLmggICAgfCAzMSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNl
cnRpb25zKCspDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvdmNoYW4v
dmNoYW4uaA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNo
YW4uaCBiL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPj4+IGluZGV4IGQ2MDEwYjE0
NWQuLjMwY2M3M2NmOTcgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvaW5jbHVkZS9saWJ4ZW52
Y2hhbi5oDQo+Pj4gKysrIGIvdG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hhbi5oDQo+Pj4gQEAg
LTg2LDYgKzg2LDExIEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiB7DQo+Pj4gICAgICAgIGludCBi
bG9ja2luZzoxOw0KPj4+ICAgICAgICAvKiBjb21tdW5pY2F0aW9uIHJpbmdzICovDQo+Pj4g
ICAgICAgIHN0cnVjdCBsaWJ4ZW52Y2hhbl9yaW5nIHJlYWQsIHdyaXRlOw0KPj4+ICsgICAg
IC8qKg0KPj4+ICsgICAgICAqIEJhc2UgeGVuc3RvcmUgcGF0aCBmb3Igc3RvcmluZyByaW5n
L2V2ZW50IGRhdGEgdXNlZCBieSB0aGUgc2VydmVyDQo+Pj4gKyAgICAgICogZHVyaW5nIGNs
ZWFudXAuDQo+Pj4gKyAgICAgICogKi8NCj4+PiArICAgICBjaGFyICp4c19wYXRoOw0KPj4+
ICAgIH07DQo+Pj4NCj4+PiAgICAvKioNCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy92
Y2hhbi9pbml0LmMgYi90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPj4+IGluZGV4IGM4NTEw
ZTZjZTkuLmM2Yjg2NzRlZjUgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvbGlicy92Y2hhbi9p
bml0LmMNCj4+PiArKysgYi90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPj4+IEBAIC00Niw2
ICs0Niw4IEBADQo+Pj4gICAgI2luY2x1ZGUgPHhlbi9zeXMvZ250ZGV2Lmg+DQo+Pj4gICAg
I2luY2x1ZGUgPGxpYnhlbnZjaGFuLmg+DQo+Pj4NCj4+PiArI2luY2x1ZGUgInZjaGFuLmgi
DQo+Pj4gKw0KPj4+ICAgICNpZm5kZWYgUEFHRV9TSElGVA0KPj4+ICAgICNkZWZpbmUgUEFH
RV9TSElGVCAxMg0KPj4+ICAgICNlbmRpZg0KPj4+IEBAIC0yNTEsNiArMjUzLDEwIEBAIHN0
YXRpYyBpbnQgaW5pdF94c19zcnYoc3RydWN0IGxpYnhlbnZjaGFuICpjdHJsLCBpbnQgZG9t
YWluLCBjb25zdCBjaGFyKiB4c19iYXNlDQo+Pj4gICAgICAgIGNoYXIgcmVmWzE2XTsNCj4+
PiAgICAgICAgY2hhciogZG9taWRfc3RyID0gTlVMTDsNCj4+PiAgICAgICAgeHNfdHJhbnNh
Y3Rpb25fdCB4c190cmFucyA9IFhCVF9OVUxMOw0KPj4+ICsNCj4+PiArICAgICAvLyBzdG9y
ZSB0aGUgYmFzZSBwYXRoIHNvIHdlIGNhbiBjbGVhbiB1cCBvbiBzZXJ2ZXIgY2xvc3VyZQ0K
Pj4NCj4+IFBsZWFzZSBkb24ndCBpbnRyb2R1Y2UgbmV3IHVzYWdlcyBvZiB0aGUgQysrIGNv
bW1lbnQgc3R5bGUuDQo+IE1vc3QgY29tbWVudHMgaW4gdGhpcyBmaWxlIGFyZSBDKysgc3R5
bGUgc2luY2UgbGlidmNoYW4gaW50cm9kdWNlZA0KDQpJIGtub3cuIE5ldmVydGhlbGVzcyBp
bnRyb2R1Y2luZyBuZXcgY29kaW5nIHN0eWxlIHZpb2xhdGlvbnMgc2hvdWxkIGJlDQphdm9p
ZGVkLCBlc3BlY2lhbGx5IGFzIGlvLmMgaXMgdXNpbmcgLyogLi4uICovIGFscmVhZHkuDQoN
Cg0KSnVlcmdlbg0K
--------------WZ0yoirnOlporgh2V4bfPdOc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WZ0yoirnOlporgh2V4bfPdOc--

--------------2qNJJd3iXHnjcZN5T4BZyvC1--

--------------CAdvAzzbZbSyA8wUsTIPCwMC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLMFSMFAwAAAAAACgkQsN6d1ii/Ey9/
3Af/QklEkyCcoQ3qojxEWj+Pew1afgR1c9Ap0x4hax0lKA462me8Ay5Myhf5bcv1tJ/wGWvpP2FM
e0jGrcE67jw2Gu9Wdy2nodqqE8OmhHqgWZDmz7w2x5QOVoypOAixhSwKpjbOH3tZ7aVD+kcBHKg4
c2FXQkTDvuQf741cp2YFNnB4awfibieiaqsqGKyuvuj1+lrvsC0TgiWtHoIGkqrBmIzDgs/ou4T/
XVXDKSJDqVZNWMg8X9XGyO2pndftKkf87m5NoTFGm0TJkSY0kEkOrnegXH5JS1xFjgdbOTbGH+gX
+E5gkrybX9cCgfpjTu8n0L/MYKiqFaXZPV8NpFUkFg==
=ESBK
-----END PGP SIGNATURE-----

--------------CAdvAzzbZbSyA8wUsTIPCwMC--


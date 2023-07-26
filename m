Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C115762B4E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570053.891323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXrk-0003NB-8E; Wed, 26 Jul 2023 06:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570053.891323; Wed, 26 Jul 2023 06:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOXrk-0003KI-4U; Wed, 26 Jul 2023 06:19:20 +0000
Received: by outflank-mailman (input) for mailman id 570053;
 Wed, 26 Jul 2023 06:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iO1l=DM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qOXri-0003KC-CV
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:19:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5913cf19-2b7c-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 08:19:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D59321D4F;
 Wed, 26 Jul 2023 06:19:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F88D139BD;
 Wed, 26 Jul 2023 06:19:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id War+AeS6wGSkBQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Jul 2023 06:19:16 +0000
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
X-Inumbo-ID: 5913cf19-2b7c-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690352356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+X9jDRcdGU4ikmY96k4/Zociwi0/HUX25UBQWYR4zc=;
	b=SwwA1waNMCMdz1iTjOXJuAFHH4tL+X0pY8JrtITM+0lFMzzq0nbbdq6/FiFDUPjTwFF0Rm
	9UmlnQ2ypLViygyiLozd6R2mP6sewxXckT98/LO3XeVQA2wc8hqcy9DMCzpuQlbM+pHA85
	KNNho6mtTWNSt43aojB4zT1Z1YwtCkc=
Message-ID: <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
Date: Wed, 26 Jul 2023 08:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k6R60Yqxbr0AHJ9o96ztcvnT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k6R60Yqxbr0AHJ9o96ztcvnT
Content-Type: multipart/mixed; boundary="------------xVutYgRy1uPh0DSozQRF8JV1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
In-Reply-To: <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>

--------------xVutYgRy1uPh0DSozQRF8JV1
Content-Type: multipart/mixed; boundary="------------zZtgOxDU0Ok0HOxI0XLxD8tg"

--------------zZtgOxDU0Ok0HOxI0XLxD8tg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjMgMTg6MDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGtleSBh
bmQgdmFsdWUgYXJlIG5ldmVyIG1vZGlmaWVkIGJ5IGhhc2h0YWJsZSBjb2RlLCBzbyB0aGV5
IHNob3VsZA0KPj4gYmUgbWFya2VkIGFzIGNvbnN0Lg0KPiANCj4gWW91IHdyb3RlIHRoaXMg
YnV0Li4uDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjM6DQo+PiAtIG1ha2UgdmFsdWUgY29uc3QsIHRv
by4NCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMgfCA3ICsrKyst
LS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5oIHwgNCArKy0tDQo+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMgYi90b29scy94ZW5z
dG9yZS9oYXNodGFibGUuYw0KPj4gaW5kZXggMTFmNmJmOGYxNS4uNjcwZGMwMTAwMyAxMDA2
NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jDQo+PiArKysgYi90b29s
cy94ZW5zdG9yZS9oYXNodGFibGUuYw0KPj4gQEAgLTExLDcgKzExLDggQEANCj4+IMKgIHN0
cnVjdCBlbnRyeQ0KPj4gwqAgew0KPj4gLcKgwqDCoCB2b2lkICprLCAqdjsNCj4+ICvCoMKg
wqAgY29uc3Qgdm9pZCAqazsNCj4+ICvCoMKgwqAgdm9pZCAqdjsNCj4gDQo+IA0KPiAuLi4g
dGhpcyBpcyBub3QgY29uc3QgYW5kIC4uLg0KPiANCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQg
aW50IGg7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBlbnRyeSAqbmV4dDsNCj4+IMKgIH07DQo+
PiBAQCAtMTQwLDcgKzE0MSw3IEBAIHN0YXRpYyBpbnQgaGFzaHRhYmxlX2V4cGFuZChzdHJ1
Y3QgaGFzaHRhYmxlICpoKQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgIH0NCj4+
IC1pbnQgaGFzaHRhYmxlX2FkZChzdHJ1Y3QgaGFzaHRhYmxlICpoLCB2b2lkICprLCB2b2lk
ICp2KQ0KPj4gK2ludCBoYXNodGFibGVfYWRkKHN0cnVjdCBoYXNodGFibGUgKmgsIGNvbnN0
IHZvaWQgKmssIGNvbnN0IHZvaWQgKnYpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIC8qIFRo
aXMgbWV0aG9kIGFsbG93cyBkdXBsaWNhdGUga2V5cyAtIGJ1dCB0aGV5IHNob3VsZG4ndCBi
ZSB1c2VkICovDQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBpbmRleDsNCj4+IEBAIC0x
NjQsNyArMTY1LDcgQEAgaW50IGhhc2h0YWJsZV9hZGQoc3RydWN0IGhhc2h0YWJsZSAqaCwg
dm9pZCAqaywgdm9pZCAqdikNCj4+IMKgwqDCoMKgwqAgZS0+ayA9IGs7DQo+PiDCoMKgwqDC
oMKgIGlmIChoLT5mbGFncyAmIEhBU0hUQUJMRV9GUkVFX0tFWSkNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB0YWxsb2Nfc3RlYWwoZSwgayk7DQo+PiAtwqDCoMKgIGUtPnYgPSB2Ow0KPj4g
K8KgwqDCoCBlLT52ID0gKHZvaWQgKil2Ow0KPiANCj4gLi4uIHlvdSBjYXN0LWF3YXkgdGhl
IGNvbnN0IGhlcmUuIEkgdGhpbmsgdGhpcyBpcyBhIHByZXR0eSBiYWQgaWRlYS4NCj4gDQo+
IENhbiB5b3UgY2xhcmlmeSB3aHkgeW91IGFyZSBkb2luZyBsaWtlIHRoYXQ/DQoNClRoZSB2
YWx1ZSBpcyBuZXZlciBjaGFuZ2VkIGJ5IHRoZSBoYXNodGFibGUgY29kZSwgYnV0IGl0IG1p
Z2h0IGJlIGNoYW5nZWQgYnkNCmUuZy4gYSBjYWxsZXIgb2YgaGFzaHRhYmxlX3NlYXJjaCgp
IChzZWUgZS5nLiBjYWxsZXJzIG9mIGZpbmRfZG9tYWluX3N0cnVjdCgpKS4NCg0KU29tZXdo
ZXJlIEkgbmVlZCB0byBjYXN0IHRoZSBjb25zdCBhd2F5LiBJIGNvdWxkIGRvIHNvIGluIGhh
c2h0YWJsZV9zZWFyY2goKQ0KaW4gY2FzZSB5b3UgcHJlZmVyIG1lIHRvIGRvIHNvLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------zZtgOxDU0Ok0HOxI0XLxD8tg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zZtgOxDU0Ok0HOxI0XLxD8tg--

--------------xVutYgRy1uPh0DSozQRF8JV1--

--------------k6R60Yqxbr0AHJ9o96ztcvnT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTAuuMFAwAAAAAACgkQsN6d1ii/Ey+U
/Qf+IFlBMtDDnVvFOKmQp7Gt9wDPX+ILAqqjKbVhVgoJ8SD/CGVYv200w/xHwpEmAcjNFYR/jt0i
tUWRmJXTupog+/W9uzg9CdBqrjuJApzyzVpJBngoNHjYrRKQH1VbflcJu+ifJj0QB0tK7v1aCru6
SC8FZ1DcdBmRmjJfPeoFspZo0j5x0lPY/gsQifyFk7PMqTczEI0cPDswpMa/TXyPeFdvpCohMnF1
/Iu3Lire+alEZmGqATp2b8F08kAiRocFV033Ss+9krgnQ1NaPYXlOGyBkiYIsQY+E+ctilLYw+AI
z5zu7gVC4krr1FEDFpflflJcvXzuKvsB9LzPf2Gapw==
=Rj8R
-----END PGP SIGNATURE-----

--------------k6R60Yqxbr0AHJ9o96ztcvnT--


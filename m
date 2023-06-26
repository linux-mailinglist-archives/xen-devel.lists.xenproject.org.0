Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C673E20A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555557.867423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn7z-0002yb-CA; Mon, 26 Jun 2023 14:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555557.867423; Mon, 26 Jun 2023 14:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn7z-0002w5-9X; Mon, 26 Jun 2023 14:23:39 +0000
Received: by outflank-mailman (input) for mailman id 555557;
 Mon, 26 Jun 2023 14:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ib7E=CO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qDn7y-0002vx-1s
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:23:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0910c213-142d-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 16:23:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7195216DC;
 Mon, 26 Jun 2023 14:23:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A97F813905;
 Mon, 26 Jun 2023 14:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +1CcJ2efmWSwBAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Jun 2023 14:23:35 +0000
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
X-Inumbo-ID: 0910c213-142d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687789415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LsHf9jAGOg70AbCiHmh/VpIYTjKRiDc0/Ydd8GiX+Co=;
	b=r4akE3sENCcehuwxO3g6vmuP78SDTWERrW+0QI9HcOw+0B5P5XBhctwOPC6hlEXZn1MmWf
	UisVpxTYS57NPPIYfPt9jgmQONS0QhygCMlYgGXIdrcnnhiQn0JZEGc4c3pw0vUF0vgEv9
	NvCLtTq7rtVrod5kjZPE5VHzrFXddaE=
Message-ID: <4ed502c9-c1e3-790e-0f33-1a889fa022c3@suse.com>
Date: Mon, 26 Jun 2023 16:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/11] tools/xenstore: let transaction_prepend() return
 the name for access
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-4-jgross@suse.com>
 <ebd06f1a-722f-e8e6-3040-ee470359bc96@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ebd06f1a-722f-e8e6-3040-ee470359bc96@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pvqk8fu9Icfuu7PGcrXtDOhf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pvqk8fu9Icfuu7PGcrXtDOhf
Content-Type: multipart/mixed; boundary="------------MNqsXmvFHsWXyzhWacM96ppA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4ed502c9-c1e3-790e-0f33-1a889fa022c3@suse.com>
Subject: Re: [PATCH 03/11] tools/xenstore: let transaction_prepend() return
 the name for access
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-4-jgross@suse.com>
 <ebd06f1a-722f-e8e6-3040-ee470359bc96@xen.org>
In-Reply-To: <ebd06f1a-722f-e8e6-3040-ee470359bc96@xen.org>

--------------MNqsXmvFHsWXyzhWacM96ppA
Content-Type: multipart/mixed; boundary="------------xgPWrTH75IC0YJWqxUYdVNOf"

--------------xgPWrTH75IC0YJWqxUYdVNOf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
bnN0ZWFkIG9mIHNldHRpbmcgdGhlIFREQiBrZXkgZm9yIGFjY2Vzc2luZyB0aGUgbm9kZSBp
biB0aGUgZGF0YSBiYXNlLA0KPj4gbGV0IHRyYW5zYWN0aW9uX3ByZXBlbmQoKSByZXR1cm4g
dGhlIGFzc29jaWF0ZWQgbmFtZSBpbnN0ZWFkLg0KPj4NCj4+IFRoaXMgaXMgaW4gcHJlcGFy
YXRpb24gdG8gcmVwbGFjZSBUREIgd2l0aCBhIG1vcmUgc2ltcGxlIGRhdGEgc3RvcmFnZS4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmPCoMKgwqDC
oMKgwqDCoCB8wqAgNCArKystDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJh
bnNhY3Rpb24uYyB8IDExICsrKystLS0tLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfdHJhbnNhY3Rpb24uaCB8wqAgMyArLS0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMNCj4+IGluZGV4IGExZDVkNGE0MTkuLjIzOWY4YzZiYzQgMTAwNjQ0DQo+
PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiArKysgYi90b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBAQCAtNjk0LDYgKzY5NCw3IEBAIHN0
cnVjdCBub2RlICpyZWFkX25vZGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IHZv
aWQgDQo+PiAqY3R4LA0KPj4gwqDCoMKgwqDCoCBUREJfREFUQSBrZXksIGRhdGE7DQo+PiDC
oMKgwqDCoMKgIHN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciAqaGRyOw0KPj4gwqDCoMKgwqDC
oCBzdHJ1Y3Qgbm9kZSAqbm9kZTsNCj4+ICvCoMKgwqAgY29uc3QgY2hhciAqZGJfbmFtZTsN
Cj4gDQo+IE5JVDogQXQgdGhlIG1vbWVudCB0aGUgbG9jYWwgdmFyaWFibGUgc2VlbXMgcG9p
bnRsZXNzIGdpdmVuLi4uDQo+IA0KPj4gwqDCoMKgwqDCoCBpbnQgZXJyOw0KPj4gwqDCoMKg
wqDCoCBub2RlID0gdGFsbG9jKGN0eCwgc3RydWN0IG5vZGUpOw0KPj4gQEAgLTcwOCw3ICs3
MDksOCBAQCBzdHJ1Y3Qgbm9kZSAqcmVhZF9ub2RlKHN0cnVjdCBjb25uZWN0aW9uICpjb25u
LCBjb25zdCB2b2lkIA0KPj4gKmN0eCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
TlVMTDsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoCB0cmFuc2FjdGlvbl9wcmVwZW5k
KGNvbm4sIG5hbWUsICZrZXkpOw0KPj4gK8KgwqDCoCBkYl9uYW1lID0gdHJhbnNhY3Rpb25f
cHJlcGVuZChjb25uLCBuYW1lKTsNCj4+ICvCoMKgwqAgc2V0X3RkYl9rZXkoZGJfbmFtZSwg
JmtleSk7DQo+IA0KPiAuLi4geW91IG9ubHkgdXNlIGluIG9uZSBwbGFjZS4gV2lsbCB0aGlz
IGNoYW5nZSBpbiBmb2xsb3ctdXAgcGF0Y2g/DQoNClllcy4gVGhlIGFkZGl0aW9uYWwgdXNl
IGNhc2Ugd2lsbCBiZSBhZGRlZCBpbiBwYXRjaCA3Lg0KDQo+IA0KPiBBbnl3YXk6DQo+IA0K
PiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KVGhh
bmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------xgPWrTH75IC0YJWqxUYdVNOf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------xgPWrTH75IC0YJWqxUYdVNOf--

--------------MNqsXmvFHsWXyzhWacM96ppA--

--------------Pvqk8fu9Icfuu7PGcrXtDOhf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSZn2cFAwAAAAAACgkQsN6d1ii/Ey9i
ugf+KFiHG+FDWhuwE965pAyFI+Iy/wfRs2BquTg7KWtq6Y1UmAnq8/o26zB28KsCHNAljVNasK8s
JkRpqDJiJmfn695U0TG1pVs+BK3OwNJ0e6oWMsjUdlYvVBLQqqFTx8IpHlYIb6tKSzHogodRB+n2
pHIOtv6BzZMy9c36HuR8qbmKkB6CMwDRgvRP+Nobx331UaNlBy9zzOlR8EcFddeqbIFFid9FuUL7
6zoEkrsVS67Vk9iaohRCbIciSwr8uX23xsIIq/I3v0u8vo7kQ+wYbp4Warg2HAB111zaovqCB4oU
RPamea6ACpxN4ICqe4ZrYbcldXBS+Y5gdnqTPDDePg==
=1IvH
-----END PGP SIGNATURE-----

--------------Pvqk8fu9Icfuu7PGcrXtDOhf--


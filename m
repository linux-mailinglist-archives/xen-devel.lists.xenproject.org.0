Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC214661F5C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 08:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473329.733856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmlQ-0004Vj-2Q; Mon, 09 Jan 2023 07:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473329.733856; Mon, 09 Jan 2023 07:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmlP-0004Tn-Vs; Mon, 09 Jan 2023 07:40:11 +0000
Received: by outflank-mailman (input) for mailman id 473329;
 Mon, 09 Jan 2023 07:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CfuE=5G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pEmlN-0004Th-Ra
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 07:40:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e8425d-8ff0-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 08:40:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DB577688E;
 Mon,  9 Jan 2023 07:40:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EC5A13583;
 Mon,  9 Jan 2023 07:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JyK7FdfEu2MpPgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 09 Jan 2023 07:40:07 +0000
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
X-Inumbo-ID: d6e8425d-8ff0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673250007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSvDl3n0oqx37p6IpNF7M63u6VQ9OMHV69YCbkVaQ4M=;
	b=Z++I4M9J3r2vZzgao5n8Nv5kJxoqLIJLdYgGV/bbOfXdlK1uJnghIz+PEFc1/qLq4K9IA3
	cLWDqq+UM2ByZ1RBkz8E65UnqJIvBlok+ig/XEy24JWABm6xEi8MvcZdL5KZ75iuVsEr/r
	xIsbvOGQCd2PkfnX/DUS65wMc2BQrcQ=
Message-ID: <a1ee03ca-1304-17c8-d075-9a235aa02fee@suse.com>
Date: Mon, 9 Jan 2023 08:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>
References: <22a2352464be2df92dc0d30a955034c59fdf3927.camel@infradead.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: (Ab)using xenstored without Xen
In-Reply-To: <22a2352464be2df92dc0d30a955034c59fdf3927.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZWAth3w0qNbwl4AZad2QP00l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZWAth3w0qNbwl4AZad2QP00l
Content-Type: multipart/mixed; boundary="------------KL09YnqV00A0Z8RF2HctPEEv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>
Message-ID: <a1ee03ca-1304-17c8-d075-9a235aa02fee@suse.com>
Subject: Re: (Ab)using xenstored without Xen
References: <22a2352464be2df92dc0d30a955034c59fdf3927.camel@infradead.org>
In-Reply-To: <22a2352464be2df92dc0d30a955034c59fdf3927.camel@infradead.org>

--------------KL09YnqV00A0Z8RF2HctPEEv
Content-Type: multipart/mixed; boundary="------------bKnsV4VNMmfJvVAL63oPCe6j"

--------------bKnsV4VNMmfJvVAL63oPCe6j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlciwgYnV0IEkgd2FzIHByZXR0eSBidXN5IGJlZm9y
ZSBteSAzIHdlZWsgdGltZSBvZmYuIDotKQ0KDQpPbiAyMC4xMi4yMiAxMzowMiwgRGF2aWQg
V29vZGhvdXNlIHdyb3RlOg0KPiBJJ3ZlIGJlZW4gd29ya2luZyBvbiBnZXR0aW5nIHFlbXUg
dG8gc3VwcG9ydCBYZW4gSFZNIGd1ZXN0cyAnbmF0aXZlbHknDQo+IHVuZGVyIEtWTToNCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIyMTIxNjAwNDExNy44NjIx
MDYtMS1kd213MkBpbmZyYWRlYWQub3JnL1QvDQo+IA0KPiBUaGUgYmFzaWMgcGxhdGZvcm0g
aXMgbW9zdGx5IHdvcmtpbmcgYW5kIEkgY2FuIHN0YXJ0IFhURiB0ZXN0cyB3aXRoDQo+ICdx
ZW11IC1rZXJuZWwnLiBOb3cgaXQgcmVhbGx5IG5lZWRzIGEgeGVuc3RvcmUuDQo+IA0KPiBJ
J20gdGhpbmtpbmcgb2YgaW1wbGVtZW50aW5nIHRoZSBiYXNpYyBzaGFyZWQgcmluZyBzdXBw
b3J0IG9uIHRoZSBxZW11DQo+IHNpZGUsIHRoZW4gY29tbXVuaWNhdGluZyB3aXRoIHRoZSBy
ZWFsIHhlbnN0b3JlZCBvdmVyIGl0cyBzb2NrZXQNCj4gaW50ZXJmYWNlLiBJdCB3b3VsZCBu
ZWVkIGEgJ1NVJyBjb21tYW5kIGluIHRoZSB4ZW5zdG9yZWQgcHJvdG9jb2wgdG8NCj4gbWFr
ZSBpdCB0cmVhdCB0aGF0IGNvbm5lY3Rpb24gYXMgYW4gdW5wcml2aWxlZ2VkIGNvbm5lY3Rp
b24gZnJvbSBhDQo+IHNwZWNpZmljIGRvbWlkLCBhbmFsb2dvdXMgdG8gJ0lOVFJPRFVDRScg
YnV0IG92ZXIgdGhlIGV4aXN0aW5nDQo+IGNvbm5lY3Rpb24uDQoNCldvdWxkbid0IGFuICJ1
bnByaXZpbGVnZWQiIHNvY2tldCBtYWtlIG1vcmUgc2Vuc2U/DQoNCj4gSG93ZXZlciwgdGhl
cmUgbWlnaHQgYmUgYSBiaXQgb2Ygd29yayB0byBkbyBmaXJzdC4gQXQgZmlyc3QsIGl0IHNl
ZW1lZA0KPiBsaWtlIHhlbnN0b3JlZCBkaWQgc3RhcnQgdXAgT0sgYW5kIHFlbXUgY291bGQg
ZXZlbiBjb25uZWN0IHRvIGl0IHdoZW4NCj4gbm90IHJ1bm5pbmcgdW5kZXIgWGVuLiBCdXQg
dGhhdCB3YXMgYSBjaGVja291dCBmcm9tIGEgZmV3IG1vbnRocyBhZ28sDQo+IGFuZCBldmVu
IHRoZW4gaXQgd291bGQgc2VnZmF1bHQgdGhlIGZpcnN0IHRpbWUgd2UgdHJ5IHRvIGFjdHVh
bGx5DQo+ICp3cml0ZSogYW55IG5vZGVzLg0KPiANCj4gTmV3ZXIgeGVuc3RvcmVkIGJyZWFr
cyBldmVuIHNvb25lciBiZWNhdXNlIHNpbmNlIGNvbW1pdCA2MGUyZjYwMjANCj4gKCJ0b29s
cy94ZW5zdG9yZTogbW92ZSB0aGUgY2FsbCBvZiBzZXR1cF9zdHJ1Y3R1cmUoKSB0byBkb20w
DQo+IGludHJvZHVjdGlvbiIpIGl0IGRvZXNuJ3QgZXZlbiBoYXZlIGEgdGRiX2N0eCBpZiB5
b3Ugc3RhcnQgaXQgd2l0aCB0aGUNCj4gLUQgb3B0aW9uLCBzbyBpdCBzZWdmYXVsdHMgZXZl
biBvbiBydW5uaW5nIHhlbnN0b3JlLWxzLiBBbmQgaWYgSSBtb3ZlDQo+IHRoZSB0ZGIgcGFy
dCBvZiBzZXR1cF9zdHJ1Y3R1cmUoKSBiYWNrIHRvIGJlIGNhbGxlZCBmcm9tIHdoZXJlIGl0
IHdhcywNCj4gd2UgZ2V0IGEgbGF0ZXIgY3Jhc2ggaW4gZ2V0X2RvbWFpbl9pbmZvKCkgYmVj
YXVzZSB0aGUgeGNfaGFuZGxlIGlzDQo+IE5VTEwuDQo+IA0KPiBXaGljaCBpcyBraW5kIG9m
IGZhaXIgZW5vdWdoLCBiZWNhdXNlIHhlbnN0b3JlZCBpcyBkZXNpZ25lZCB0byBydW4NCj4g
dW5kZXIgWGVuIDopDQo+IA0KPiBCdXQgd2hhdCAqaXMqIHRoZSAtRCBvcHRpb24gZm9yPyBJ
dCBnb2VzIGJhY2sgdG8gY29tbWl0IGJkZGQ0MTM2NiBpbg0KPiAyMDA1IHdoY2ggdGFsa3Mg
YWJvdXQgYWxsb3dpbmcgbXVsdGlwbGUgY29uY3VycmVudCB0cmFuc2FjdGlvbnMsIGFuZA0K
PiBkb2Vzbid0IG1lbnRpb24gdGhlIG5ldyBvcHRpb24gYXQgYWxsLiBJdCBzZWVtcyB0byBi
ZSBmYWlybHkgaG9zZWQgYXQNCj4gdGhlIG1vbWVudC4NCg0KSSBndWVzcyB0aGlzIHdhcyBz
b21lIGRlYnVnZ2luZyBhZGQtb24gd2hpY2ggaGFzbid0IGJlZW4gdXNlZCBmb3IgYWdlcy4N
Cg0KSSdtIGluY2xpbmVkIHRvIGp1c3QgcmVtb3ZlIHRoZSAtRCBvcHRpb24uDQoNCj4gSXMg
aXQgcmVhc29uYWJsZSB0byBhdHRlbXB0ICJmaXhpbmciIHhlbnN0b3JlZCB0byBydW4gd2l0
aG91dCBhY3R1YWwNCj4gWGVuLCBzbyB0aGF0IHdlIGNhbiB1c2UgaXQgZm9yIHZpcnR1YWwg
WGVuIHN1cHBvcnQ/DQoNCkkgZG9uJ3Qgc2VlIGEgbWFqb3IgcHJvYmxlbSB3aXRoIHRoYXQu
DQoNClRoZSByZXN1bHQgc2hvdWxkbid0IGJlIHRvbyB1Z2x5LCBvZiBjb3Vyc2UsIGFuZCBJ
IGRvbid0IHNlZSBhbnkgZWZmb3J0DQpvbiBYZW4gc2lkZSB0byB0ZXN0IGFueSBjaGFuZ2Vz
IGZvciBub3QgYnJlYWtpbmcgeW91ciB1c2UgY2FzZS4NCg0KDQpKdWVyZ2VuDQo=
--------------bKnsV4VNMmfJvVAL63oPCe6j
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bKnsV4VNMmfJvVAL63oPCe6j--

--------------KL09YnqV00A0Z8RF2HctPEEv--

--------------ZWAth3w0qNbwl4AZad2QP00l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO7xNYFAwAAAAAACgkQsN6d1ii/Ey/p
fwf+IuKOn8kcvHYU4CBvgV/Qmri9ctxjGGmSCBQgMrmnHVuCs6WVZXdmpwWIgNXTuPYgPSiBUtJJ
iLlo2ViuniKGYVeBBRbBX0C+S1p91RSDYPIQ3k/t7WH1pdpd2TK4wYb794KqLoqE8D9LJ7RHdwwg
RwVOQbAIHYYlbfEJg/v1ljMOY8UmeUgZr/8q0ucQf3RWs2GvTHVYjKIKAf0SWe9Bl4LDTi4783Vn
fyYAl1RignJYuKIf3pgKYeC8nreJMsY9n4uI9tiOMOuBlGL36vIuHEbzIGwiFjslnq4tnv6X+Sey
fYwzIPCGME0i+GX+uqI2Ou9RiRkldzjsXttmYZvA7Q==
=SOOS
-----END PGP SIGNATURE-----

--------------ZWAth3w0qNbwl4AZad2QP00l--


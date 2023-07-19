Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492AC758CFE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 07:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565568.883798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLzbl-0005Ah-8x; Wed, 19 Jul 2023 05:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565568.883798; Wed, 19 Jul 2023 05:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLzbl-00057t-5S; Wed, 19 Jul 2023 05:20:17 +0000
Received: by outflank-mailman (input) for mailman id 565568;
 Wed, 19 Jul 2023 05:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qLzbj-00057n-Uu
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 05:20:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f03fb835-25f3-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 07:20:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD8E41F8BB;
 Wed, 19 Jul 2023 05:20:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A425A138EE;
 Wed, 19 Jul 2023 05:20:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5xk4Joxyt2QRIQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jul 2023 05:20:12 +0000
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
X-Inumbo-ID: f03fb835-25f3-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689744012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2XP9hWi6MwAWUXvaq2FxfL6Mvji3sc0qi1oSVKf1xtk=;
	b=cpi124Gns3V7/tt2ITGZfsMMEQ/63Lx7H4f7/Tc4zyjVpgXPbEAcNZE4Fg1FaZdB45aHbp
	CnIV5OFazvYbtIows6TOrfqr5V311iYIvrqaU4qkF39TZLu9DeqAHnxjzWfd+9f8tepgZc
	0/g/e27aZa7WvLHTdnVJ/y75x7wD5cY=
Message-ID: <db6a3ba3-85c7-0190-759f-e5bcbd6ef7d9@suse.com>
Date: Wed, 19 Jul 2023 07:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/18] tools/xenstore: add hashtable_replace() function
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-11-jgross@suse.com>
 <f7e623a5-adec-fd99-4c42-fab0d04cd12e@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f7e623a5-adec-fd99-4c42-fab0d04cd12e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Da6W1PTy7RJezbeTXS1dxI9s"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Da6W1PTy7RJezbeTXS1dxI9s
Content-Type: multipart/mixed; boundary="------------CXPMbIRlSQXl4GRCKmKj7UQg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <db6a3ba3-85c7-0190-759f-e5bcbd6ef7d9@suse.com>
Subject: Re: [PATCH v2 10/18] tools/xenstore: add hashtable_replace() function
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-11-jgross@suse.com>
 <f7e623a5-adec-fd99-4c42-fab0d04cd12e@xen.org>
In-Reply-To: <f7e623a5-adec-fd99-4c42-fab0d04cd12e@xen.org>

--------------CXPMbIRlSQXl4GRCKmKj7UQg
Content-Type: multipart/mixed; boundary="------------4HlQ2nDEQLGtqIaUtTrnwu0Y"

--------------4HlQ2nDEQLGtqIaUtTrnwu0Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDcuMjMgMjI6NTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzA3LzIwMjMgMDc6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBG
b3IgYW4gZWZmZWN0aXZlIHdheSB0byByZXBsYWNlIGEgaGFzaHRhYmxlIGVudHJ5IGFkZCBh
IG5ldyBmdW5jdGlvbg0KPj4gaGFzaHRhYmxlX3JlcGxhY2UoKS4NCj4+DQo+PiBXaGlsZSBh
dCBpdCBsZXQgaGFzaHRhYmxlX2FkZCgpIGZhaWwgaWYgYW4gZW50cnkgd2l0aCB0aGUgc3Bl
Y2lmaWVkDQo+PiBrZXkgZG9lcyBhbHJlYWR5IGV4aXN0Lg0KPiANCj4gVGhpcyBzZWVtcyB0
byBiZSBhIGxlZnQtb3ZlciBmcm9tIHRoZSBwcmV2aW91cyB2ZXJzaW9uLg0KDQpZZXMsIHdp
bGwgcmVtb3ZlIGl0Lg0KDQo+IA0KPj4NCj4+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gdG8g
cmVwbGFjZSBUREIgd2l0aCBhIG1vcmUgc2ltcGxlIGRhdGEgc3RvcmFnZS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jIHwgMjAgKysrKysrKysrKysrKysr
KysrKysNCj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5oIHwgMTYgKysrKysrKysr
KysrKysrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jIGIvdG9vbHMveGVu
c3RvcmUvaGFzaHRhYmxlLmMNCj4+IGluZGV4IDI5YzI0N2Y5MTguLjBjMjZhMDk1NjcgMTAw
NjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS9oYXNodGFibGUuYw0KPj4gKysrIGIvdG9v
bHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+IEBAIC0xNjAsNiArMTYwLDcgQEAgc3RhdGlj
IHN0cnVjdCBlbnRyeSAqaGFzaHRhYmxlX3NlYXJjaF9lbnRyeShjb25zdCBzdHJ1Y3QgDQo+
PiBoYXNodGFibGUgKmgsDQo+PiDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4gwqAgfQ0K
Pj4gKw0KPiANCj4gSSB0aGluayB0aGlzIGJlbG9uZyB0byB0aGUgcHJldmlvdXMgcGF0Y2gu
DQoNCkluZGVlZCBpdCBkb2VzLA0KDQoNCkp1ZXJnZW4NCg==
--------------4HlQ2nDEQLGtqIaUtTrnwu0Y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4HlQ2nDEQLGtqIaUtTrnwu0Y--

--------------CXPMbIRlSQXl4GRCKmKj7UQg--

--------------Da6W1PTy7RJezbeTXS1dxI9s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS3cowFAwAAAAAACgkQsN6d1ii/Ey/T
lQf/dli7n1yElg4XCuso8WdsXV4asYBjxhKLUI+BLkpqceXmaAJnlvT1Vg5sAYq0TmQkNl1sEBjJ
YP89wapM5nYBRnVjaGdp5zIOdr6w5iAUtL2eDD4Rbw4aSmlMi579Hv7/LUo6aHioH2J+fh1q4I8Z
mKEMN3+Wp6DzUuusZ3zX2gtSx0tJulrk8YRVGf1fjUJDJtpTuGgsaJcJsZ/UQHu8qxG6LgxGyJ3j
KjwLdYnFZSniTA2yuyhFwRgkem1b/7y8EdEmdzhE/J93hu6ip2mWZB9bRH32+8ZkvTSWYch0NfcA
9dtcqAhiGtTADN093aamwuq5C7bDfn4DEoLSt39w6Q==
=ZoYQ
-----END PGP SIGNATURE-----

--------------Da6W1PTy7RJezbeTXS1dxI9s--


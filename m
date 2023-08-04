Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA176FDE0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577060.903892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrXr-0003vq-Kf; Fri, 04 Aug 2023 09:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577060.903892; Fri, 04 Aug 2023 09:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrXr-0003tS-Gy; Fri, 04 Aug 2023 09:56:31 +0000
Received: by outflank-mailman (input) for mailman id 577060;
 Fri, 04 Aug 2023 09:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRrXq-0003tM-6M
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:56:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e432841-32ad-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:56:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E62F21F749;
 Fri,  4 Aug 2023 09:56:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1B2A13904;
 Fri,  4 Aug 2023 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mw+OLUvLzGRLJQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 09:56:27 +0000
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
X-Inumbo-ID: 2e432841-32ad-11ee-b26b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691142987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NaB9noiwagUgfzbRquK80gEgFMYKlT0Y/GRF52rBjt4=;
	b=bESbR+1PKJ8uN3wbBGrJ5AvYt39As6VlM1PtyLmXRH3slGRTxYriptwFI/FG77PqNuPjVj
	iuimkdsHgC3kqy6ZXe2F/KJcN4tZ/p/2Z29RWpQBVjC0JteincInykUj/FyjqJB7YCtoxB
	BiezFX/XK7L8VIztmosTR/MOrtAqorI=
Message-ID: <f2e7bb58-4929-71fe-a0bc-4bc4e589f9bf@suse.com>
Date: Fri, 4 Aug 2023 11:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
 <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
 <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
 <dd226d4f-28f0-487f-996f-b1550e8d5db3@suse.com>
 <c6100033-4998-48aa-a9f3-a0bf2698ef49@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c6100033-4998-48aa-a9f3-a0bf2698ef49@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cbiz03jD6Hj0LQFMzwWwNVG2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Cbiz03jD6Hj0LQFMzwWwNVG2
Content-Type: multipart/mixed; boundary="------------v6AYWH5mYGRmekxjR7CvjFmH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f2e7bb58-4929-71fe-a0bc-4bc4e589f9bf@suse.com>
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
 <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
 <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
 <dd226d4f-28f0-487f-996f-b1550e8d5db3@suse.com>
 <c6100033-4998-48aa-a9f3-a0bf2698ef49@xen.org>
In-Reply-To: <c6100033-4998-48aa-a9f3-a0bf2698ef49@xen.org>

--------------v6AYWH5mYGRmekxjR7CvjFmH
Content-Type: multipart/mixed; boundary="------------I0R8q0RsAQsxLLT7nennnGoH"

--------------I0R8q0RsAQsxLLT7nennnGoH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjMgMTE6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
NC8wOC8yMDIzIDEwOjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDQuMDguMjMg
MTE6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDA0LzA4
LzIwMjMgMTA6MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDAzLjA4LjIzIDIz
OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+PiBPbiAy
NC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+IGRpZmYgLS1n
aXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2guYyANCj4+Pj4+PiBiL3Rvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF93YXRjaC5jDQo+Pj4+Pj4gaW5kZXggODZjZjgzMjJiNC4u
MjY2MmEzZmE0OSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfd2F0Y2guYw0KPj4+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF93YXRj
aC5jDQo+Pj4+Pj4gQEAgLTE2NiwxOSArMTY2LDEyIEBAIHN0YXRpYyBpbnQgZGVzdHJveV93
YXRjaCh2b2lkICpfd2F0Y2gpDQo+Pj4+Pj4gwqAgc3RhdGljIGludCBjaGVja193YXRjaF9w
YXRoKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQo+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICoqcGF0aCwg
Ym9vbCAqcmVsYXRpdmUpDQo+Pj4+Pj4gwqAgew0KPj4+Pj4+IC3CoMKgwqAgLyogQ2hlY2sg
aWYgdmFsaWQgZXZlbnQuICovDQo+Pj4+Pj4gLcKgwqDCoCBpZiAoc3Ryc3RhcnRzKCpwYXRo
LCAiQCIpKSB7DQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgICpyZWxhdGl2ZSA9IGZhbHNlOw0K
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoc3RybGVuKCpwYXRoKSA+IFhFTlNUT1JFX1JF
TF9QQVRIX01BWCkNCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGludmFs
Ow0KPj4+Pj4NCj4+Pj4+IEkgY2FuJ3QgZmluZCBhbiBleGFjdCBtYXRjaGluZyBjaGVjayBp
biBpc192YWxpZF9ub2RlbmFtZSgpLiBUaGUgY2FsbCBhbHNvIA0KPj4+Pj4gc2VlbXMgdG8g
cHV0IG1vcmUgcmVzdHJpY3Rpb24gb24gJ0AnIG5vZGUuIENhbiB5b3UgY2xhcmlmeT8NCj4+
Pj4NCj4+Pj4gVGhlIGNhbGwgb2YgZG9tYWluX21heF9jaGsoKSBpbiBpc192YWxpZF9ub2Rl
bmFtZSgpIHdpbGwgY2hlY2sgdGhlIGxlbmd0aA0KPj4+PiBvZiB0aGUgbm9kZSBuYW1lIChh
dCBsZWFzdCBmb3IgdW5wcml2aWxlZ2VkIGNhbGxlcnMsIHdoaWNoIGlzIHRoZSBpbXBvcnRh
bnQNCj4+Pj4gY2FzZSkuDQo+Pj4NCj4+PiBSaWdodCwgYnV0IGZyb20gbXkgdW5kZXJzdGFu
ZGluZywgdGhpcyBtYXkgbm90IGNoZWNrIGFnYWluc3QgDQo+Pj4gWEVOU1RPUkVfUkVMX1BB
VEhfTUFYIGJ1dCB3aGF0ZXZlciBsaW1pdCB0aGUgdXNlciBzZXQuDQo+Pg0KPj4gWWVzLCBh
bmQgdGhhdCdzIHdoYXQgc2hvdWxkIGJlIHRlc3RlZCwgcmlnaHQ/IEkgZG9uJ3Qgc2VlIHdo
eSBzcGVjaWFsIG5vZGVzDQo+PiBzaG91bGQgbm90IGFkaGVyZSB0byB0aGUgc2FtZSBsaW1p
dHMgYXMgb3RoZXIgbm9kZXMuIEluIGNhc2UgYW4gdW5wcml2aWxlZ2VkDQo+PiB1c2VyIHNo
b3VsZCBoYXZlIGFjY2VzcyB0byBzcGVjaWFsIG5vZGVzLCB0aGUgbGltaXRzIHNob3VsZG4n
dCBoaW5kZXIgdGhlDQo+PiB1c2VyIHRvIGFjY2VzcyB0aG9zZSBub2RlcyAoc2V0dGluZyBh
IGxpbWl0IGJlbG93IDE1IHdvdWxkIGJlIHJpZGljdWxvdXMNCj4+IGFueXdheSwgYW5kIHRo
YXQgaXMgdGhlIGxlbmd0aCBvZiBsb25nZXN0IHNwZWNpYWwgbm9kZSBuYW1lIHRvZGF5KS4N
Cj4gSSBkb24ndCBtaW5kIHlvdSB3YW50IHRvIHRlc3QgYWdhaW5zdCBhIGRpZmZlcmVudCB2
YWx1ZS4gTXkgcG9pbnQgaXMgbW9yZSB0aGF0IA0KPiB5b3UgZGlkbid0IG1lbnRpb24gdGhh
dCB0aGUgbGltaXQgd2lsbCBiZSBjaGFuZ2VkLg0KDQpXaWxsIG1lbnRpb24gaXQuDQoNCg0K
SnVlcmdlbg0KDQo=
--------------I0R8q0RsAQsxLLT7nennnGoH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------I0R8q0RsAQsxLLT7nennnGoH--

--------------v6AYWH5mYGRmekxjR7CvjFmH--

--------------Cbiz03jD6Hj0LQFMzwWwNVG2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTMy0sFAwAAAAAACgkQsN6d1ii/Ey9N
igf/VG8EzcLU/u9FlsxFX+vVVHmUD5bcN+FlXinxxBofRLaoJCGQBqpp6ZhW8UgRsUCRh2XPpnjh
FFupCjjuLfMciWe/6Cf9xbdWoWITCG2tbtPaL4CkQtl1kKgPKZo6Q5KjWhfHolRK85S1j6jJ82u1
ERRxthmIVnO9v1XIn2nXj04dhvWm9b7JOVkwiqUe7S3X+7UBwvflPzhRhlY6YSI9VjTBoWqkz+WV
d1+IDExr519iemqnvEffvLIwiAVbESxRPcEB7Z7IvYnJV/yjOs9OT/YMi65aYvTKXNt35CQP9ar5
VH2oNVhcrSrL1V+OkDqip/fjpydDnFlNh5aJjLJMRg==
=EiEA
-----END PGP SIGNATURE-----

--------------Cbiz03jD6Hj0LQFMzwWwNVG2--


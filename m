Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25399763481
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 13:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570324.892103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcMF-0000GD-F2; Wed, 26 Jul 2023 11:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570324.892103; Wed, 26 Jul 2023 11:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOcMF-0000E2-CO; Wed, 26 Jul 2023 11:07:07 +0000
Received: by outflank-mailman (input) for mailman id 570324;
 Wed, 26 Jul 2023 11:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iO1l=DM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qOcMD-0000Dq-Ur
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 11:07:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0cb608-2ba4-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 13:07:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BE6D1F85D;
 Wed, 26 Jul 2023 11:07:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1681C139BD;
 Wed, 26 Jul 2023 11:07:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Ku7A1f+wGRzGwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Jul 2023 11:07:03 +0000
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
X-Inumbo-ID: 8d0cb608-2ba4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690369623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQWth3HzOAPEhRj/NFkcxnmXAC1Etzn2prwQAeyTUxo=;
	b=PKOvFZXpo3HUa55kGL+KKfrZVuOBp5igY+iKdOkLUIgn0VUbhKvJ/zSpWBqX1HLJioRdfj
	Vio/4AIzqzXAzUw/gW5S1/YzHWhIMjZsOh8ZsV8vNjZ5owh+vmRbz2spM7oQB+iDJ/sunC
	IEB38jOVywkB4+NJ8GsdmA2WtsQKgf4=
Message-ID: <97a8e4e8-2955-f9bd-d5f2-7244061ee6f4@suse.com>
Date: Wed, 26 Jul 2023 13:07:02 +0200
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
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
 <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
 <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
 <c86e0983-6b51-c5be-a666-20fd407b2537@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c86e0983-6b51-c5be-a666-20fd407b2537@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hxI3ibq4dVH3R8hdfmK307so"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hxI3ibq4dVH3R8hdfmK307so
Content-Type: multipart/mixed; boundary="------------li9gz3XuiA5paHgFlJDTK25C";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <97a8e4e8-2955-f9bd-d5f2-7244061ee6f4@suse.com>
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
 <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
 <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
 <c86e0983-6b51-c5be-a666-20fd407b2537@xen.org>
In-Reply-To: <c86e0983-6b51-c5be-a666-20fd407b2537@xen.org>

--------------li9gz3XuiA5paHgFlJDTK25C
Content-Type: multipart/mixed; boundary="------------gxjfkNeBN6AFtqGmsbVc5Gzl"

--------------gxjfkNeBN6AFtqGmsbVc5Gzl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjMgMTE6MjksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNi8wNy8yMDIzIDA5OjQ0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDcu
MjMgMTA6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBUbyBnaXZlIGEgY29uY3JldGUg
ZXhhbXBsZSwgd2l0aCB0aGUgY3VycmVudCBpbnRlcmZhY2Ugd2UgYXJlIHRlbGxpbmcgdGhl
IA0KPj4+IHVzZXIgdGhhdCB3aGF0IHRoZXkgc3RvcmUgaW4gdGhlIGhhc2h0YWJsZSBjYW4g
YmUgbW9kaWZpZWQgYXQgc29tZSBwb2ludC4gQnkgDQo+Pj4gYWRkaW5nICdjb25zdCcgZm9y
IHRoZSB2YWx1ZSBpbiBoYXNodGFibGVfYWRkKCksIHdlIGNhbiBtaXNsZWFkIGEgdXNlciB0
byANCj4+PiB0aGluayBpdCBpcyBmaW5lIHRvIHN0b3JlIHN0YXRpYyBzdHJpbmcsIHlldCB0
aGlzIGlzIG5vdCBlbmZvcmNlZCBhbGwgdGhlIHdheSANCj4+PiB0aHJvdWdoLiBTbyBvbmUg
Y291bGQgbWlzdGFrZW5seSB0aGluayB0aGF0IHZhbHVlcyByZXR1cm5lZCANCj4+PiBoYXNo
dGFibGVfc2VhcmNoKCkgY2FuIGJlIG1vZGlmaWVkLiBBbmQgdGhlIGNvbXBpbGVyIHdpbGwg
bm90IGJlIGhlcmUgdG8gaGVscCANCj4+PiBlbmZvcmNpbmcgaXQgYmVjYXVzZSB5b3UgY2Fz
dC1hd2F5IHRoZSBjb25zdC4NCj4+DQo+PiBZZXMsIGxpa2UgaW4gdGhlIGNhc2Ugb2Ygc3Ry
c3RyKCkuDQo+Pg0KPj4gSXQgdGFrZXMgdHdvIGNvbnN0IGNoYXIgKiBwYXJhbWV0ZXJzIGFu
ZCBpdCBpcyByZXR1cm5pbmcgY2hhciAqLCBldmVuIHdpdGggaXQNCj4+IHBvaW50aW5nIGlu
dG8gdGhlIGZpcnN0IHBhcmFtZXRlci4NCj4gDQo+IFRoaXMgaXMgYSBwcmV0dHkgZ29vZCBl
eGFtcGxlIG9uIGhvdyB0byBub3Qgd3JpdGUgYW4gaW50ZXJmYWNlLiA6KQ0KPiANCj4+DQo+
Pj4gRG8geW91IGhhdmUgYW55IGNvZGUgaW4gdGhpcyBzZXJpZXMgdGhhdCByZXF1aXJlcyB0
aGUgJ2NvbnN0JyBpbiANCj4+PiBoYXNodGFibGVfYWRkKCk/IElmIHNvLCBjYW4geW91IHBv
aW50IG1lIHRvIHRoZSBwYXRjaCBhbmQgSSB3aWxsIGhhdmUgYSBsb29rPw0KPj4NCj4+IEkg
aGFkIGl0IHdoZW4gd3JpdGluZyB0aGlzIHBhdGNoLCBidXQgdGhpcyByZXF1aXJlbWVudCBp
cyBnb25lIG5vdy4gQnV0IHBsZWFzZQ0KPj4gbm90ZSB0aGF0IHRoaXMgbWVhbnMgdG8gZHJv
cCB0aGUgY29uc3QgZnJvbSBkYl93cml0ZSgpLCB0b28uDQo+Pg0KPj4+IElmIG5vdCwgdGhl
biBJIHdpbGwgc3Ryb25nbHkgYXJndWUgdGhhdCB0aGlzIHNob3VsZCBiZSBkcm9wcGVkIGJl
Y2F1c2UgDQo+Pj4gZHJvcHBpbmcgYSBjb25zdCBpcyBhbHdheXMgYSByZWNpcGUgZm9yIGRp
c2FzdGVyLg0KPj4NCj4+IERlcGVuZHMgSU1PLg0KPj4NCj4+IEkgYmVsaWV2ZSBpdCBpcyBi
ZXR0ZXIgYXMgSSd2ZSBkb25lIGl0LA0KPj4gYnV0IGluIGNhc2UgeW91IGluc2lzdCBvbiBp
dCBJIGNhbiBkcm9wDQo+PiB0aGUgcGF0Y2guDQo+IA0KPiBXZWxsLi4uIEkgY2FuIGFsd2F5
cyBiZSBzd2F5ZWQgaWYgdGhlcmUgaXMgYSBnb29kIGFyZ3VtZW50IHRvIG1ha2UgaXQgY29u
c3QuIFNvIA0KPiBmYXIsIHlvdSBtZW50aW9uIHRoYXQgaGFzaHRhYmxlIGRvZXNuJ3QgbW9k
aWZ5IHRoZSBjb250ZW50IGJ1dCB5b3UgZG9uJ3QgcmVhbGx5IA0KPiBleHBsYWluIHdoeSB3
YWl2aW5nIGF3YXkgdGhlIGhlbHAgZnJvbSB0aGUgY29tcGlsZXIgaXMgb2suIFRoZXJlZm9y
ZSwgdG8gbWUgaXQgDQo+IHNlZW1zIHRoZSBkb3duc2lkZSBpcyBiaWdnZXIgdGhhbiB0aGUg
YmVuZWZpdC4NCj4gDQo+IEFsc28sIEkgYW0gbm90IGFza2luZyB0byBkcm9wIHRoZSBwYXRj
aC4gVGhlIGNvbnN0IG9uIHRoZSBrZXkgaXMgb2suIEkgYW0gb25seSANCj4gcmVxdWVzdGlu
ZyB0byByZW1vdmUgdGhlIGNvbnN0IG9uIHRoZSB2YWx1ZS4NCj4gDQo+Pg0KPj4gQW4gYWx0
ZXJuYXRpdmUgd291bGQgYmUgbWFrZSBoYXNodGFibGVfc2VhcmNoKCkgcmV0dXJuIGEgY29u
c3QgYW5kIG9ubHkgY2FzdCB0aGUNCj4+IGNvbnN0IGF3YXkgd2hlcmUgaXQgaXMgcmVhbGx5
IG5lZWRlZCAoYW5kIHByb2JhYmx5IHdpdGggYSBwcm9taW5lbnQgY29tbWVudCBhdA0KPj4g
dGhlIHJlbGF0ZWQgaGFzaHRhYmxlX2FkZCgpIHBsYWNlKS4gSSB0aGluayB0aGlzIHdpbGwg
aGl0IHhlbnN0b3JlZF9kb21haW4uYyB1c2UNCj4+IGNhc2VzIG9ubHkuDQo+IA0KPiBBZ2Fp
biwgdGhpcyBzdGlsbCBtZWFucyB3ZSBhcmUgY2FzdGluZyBhd2F5IHRoZSBjb25zdCBzb21l
d2hlcmUuIFRoaXMgaXMgdGhlIA0KPiBwYXJ0IEkgYW0gYWdhaW5zdCBpZiB0aGVyZSBpcyBu
byBzdHJvbmcganVzdGlmaWNhdGlvbiBmb3IgaXQgKGkuZS4gdGhlcmUgaXMgbm8gDQo+IG90
aGVyIHdheSB0byBkbyBpdCkuDQoNCk9rYXksIEknbGwgZHJvcCB0aGUgY29uc3QgYXR0cmli
dXRlIGZvciB0aGUgdmFsdWUgcGFyYW1ldGVyLg0KDQoNCkp1ZXJnZW4NCg0K
--------------gxjfkNeBN6AFtqGmsbVc5Gzl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gxjfkNeBN6AFtqGmsbVc5Gzl--

--------------li9gz3XuiA5paHgFlJDTK25C--

--------------hxI3ibq4dVH3R8hdfmK307so
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTA/lYFAwAAAAAACgkQsN6d1ii/Ey/S
1wf+Mt5NGdZbmpH7qfz3nEynpaQ8lzKpVHFpfyiMw5sDPnYvOe0Z73RpjyAgzYzbFuqsiIlWz+Yt
Qu1tHp8VqoXSEmbcGfqt8Yhn5M6bW2LJrBRuG2Ye1V9SpITkBasOUClpv/eRkySX9Ay4u+UBewb9
OE4L+kC9Wr3iKTvyZmT5CaVDOK2r0k+3kaG8sg2EZiYcBWJ0i729D2bCcrzgnMVq6pqbdrqt1D8x
fLYT0S4cT8zuXaFlLJP4SIT8Igg7ZUJKoa4YQso9ljNGdATs3oQekg55bSPRX75yuC0cVJAr5m72
WHdJw53DTj4s36iPdbhppycOkovgZTHOu7Ph3N8A9w==
=vJjD
-----END PGP SIGNATURE-----

--------------hxI3ibq4dVH3R8hdfmK307so--


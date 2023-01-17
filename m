Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912266E2C5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 16:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479579.743514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoFG-00005G-J5; Tue, 17 Jan 2023 15:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479579.743514; Tue, 17 Jan 2023 15:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHoFG-0008UT-GR; Tue, 17 Jan 2023 15:51:30 +0000
Received: by outflank-mailman (input) for mailman id 479579;
 Tue, 17 Jan 2023 15:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRIs=5O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pHoFE-0008UI-Jh
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 15:51:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd6e4081-967e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 16:51:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CA5238894;
 Tue, 17 Jan 2023 15:51:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36D3113357;
 Tue, 17 Jan 2023 15:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n+ivC//DxmPoWQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 17 Jan 2023 15:51:27 +0000
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
X-Inumbo-ID: cd6e4081-967e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673970687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NcNHI/6jQuK9NSK4vkgXK9cEJCCCc5EiLrrsH2rtyDE=;
	b=daY0e6sqdjc1Lz/jZxwhiL+cLtCg6Owt6vwD6m74D+Gi7bbP+gNF3sBE87Vmw+DqOn/5DB
	7BO+/EYoIvT7otChAQhCM9cPqu57Zv43Ga1BN9XWfcS0sG8Evwj3si5QpAn67nW5QzrA18
	+xB+knEPKzWh29QsAb6zXkrjmpBc1xY=
Message-ID: <e0e74307-a9c6-97f2-6fd2-f982b10556b7@suse.com>
Date: Tue, 17 Jan 2023 16:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/17] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-9-jgross@suse.com>
 <8aa74a44-2189-ca6b-3668-722e74d233fd@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8aa74a44-2189-ca6b-3668-722e74d233fd@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WfxIilPo0M7BlwbCNv1FuJhc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WfxIilPo0M7BlwbCNv1FuJhc
Content-Type: multipart/mixed; boundary="------------PAOkmDDj440ty3Ctp1afpyLq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e0e74307-a9c6-97f2-6fd2-f982b10556b7@suse.com>
Subject: Re: [PATCH v3 08/17] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-9-jgross@suse.com>
 <8aa74a44-2189-ca6b-3668-722e74d233fd@xen.org>
In-Reply-To: <8aa74a44-2189-ca6b-3668-722e74d233fd@xen.org>

--------------PAOkmDDj440ty3Ctp1afpyLq
Content-Type: multipart/mixed; boundary="------------9UNnTaStq2uYDCGJcDCByauh"

--------------9UNnTaStq2uYDCGJcDCByauh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMTU6MDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE3LzAxLzIwMjMgMDk6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
aGUgYWNjb3VudGluZyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRvbWFpbiBpbiBh
biBhY3RpdmUNCj4+IHRyYW5zYWN0aW9uIGlzIG5vdCB3b3JraW5nIGNvcnJlY3RseSwgYXMg
aXQgYWxsb3dzIHRvIGNyZWF0ZSBhcmJpdHJhcnkNCj4+IG51bWJlciBvZiBub2Rlcy4gVGhl
IHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byBleGNlZWRpbmcNCj4+IHRo
ZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEsIGJ1dCBiZWZvcmUgY2xvc2luZyB0aGUgdHJhbnNh
Y3Rpb24gYW4NCj4+IHVucHJpdmlsZWdlZCBndWVzdCBjb3VsZCBjYXVzZSBYZW5zdG9yZSB0
byB1c2UgYSBsb3Qgb2YgbWVtb3J5Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IElzIHRoZSByZXN0IG9mIHRoZSBzZXJp
ZXMgZGVwZW5kIG9uIHRoaXMgcGF0Y2g/IEkgYW0gYXNraW5nIHRoaXMgYmVjYXVzZSBJIHN0
aWxsIA0KPiBuZWVkIHRvIGdvIHRocm91Z2ggeW91ciBzZWNvbmQgc2VyaWVzIGJlZm9yZSBm
b3JnaW5nIGFuIG9waW5pb24gb24gdGhpcyBwYXRjaC4NCg0KSSB0aGluayB0aGUgcmVzdCBz
aG91bGQgYXBwbHkgd2l0aG91dCB0aGlzIG9uZS4gVGhlcmUgc2hvdWxkbid0IGJlIGFueQ0K
ZnVuY3Rpb25hbCBkZXBlbmRlbmN5Lg0KDQo+IFlldCwgSSB3b3VsZCBsaWtlIHRvIHJlZHVj
ZSB0aGUgbnVtYmVyIG9mIGluZmxpZ2h0IHBhdGNoZXMgOikuDQoNCisxDQoNCg0KSnVlcmdl
bg0K
--------------9UNnTaStq2uYDCGJcDCByauh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9UNnTaStq2uYDCGJcDCByauh--

--------------PAOkmDDj440ty3Ctp1afpyLq--

--------------WfxIilPo0M7BlwbCNv1FuJhc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPGw/4FAwAAAAAACgkQsN6d1ii/Ey8L
lAf8D1ULiJpIx4BeOv/5WGLqEcel2McLvUxWs5jG0btBWHlMb1R51lve2FZ77Ku4GbGZveYCww40
2jUNCjX8sGVTcRJWipxONrl9R5x4vF0JcxeKg/gSSPQaqzui7eU4t5yFKiXCe6/89Gp8ETlNbpbh
yFT8ctmFOy0Geh5tBKqquWR1zwvIRj8OTUkgpsgOrDB+/uTYlIiHNJREfsKsTBrhm3hGSnnf0pYt
dMZozxkzy0uBb7Lvtrmhi/u6VaHBE5Rih5s4mULNk6Rzk9RJ+Ls8qfSfY7PzLkwDBPH8TMejR0SO
NhyZ6/laQeRJBEqnwBeDuC/A5JlLlT0L/MK/Hvza7g==
=bksH
-----END PGP SIGNATURE-----

--------------WfxIilPo0M7BlwbCNv1FuJhc--


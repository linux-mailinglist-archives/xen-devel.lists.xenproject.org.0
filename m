Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352046E7A22
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523432.813471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7L7-0003fP-QL; Wed, 19 Apr 2023 12:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523432.813471; Wed, 19 Apr 2023 12:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7L7-0003cK-MB; Wed, 19 Apr 2023 12:55:13 +0000
Received: by outflank-mailman (input) for mailman id 523432;
 Wed, 19 Apr 2023 12:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K18G=AK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pp7L5-0003bQ-Tz
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:55:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5eef20-deb1-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:55:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 108C21FD8C;
 Wed, 19 Apr 2023 12:55:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF9921390E;
 Wed, 19 Apr 2023 12:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /t3NNKzkP2RUGAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Apr 2023 12:55:08 +0000
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
X-Inumbo-ID: 6a5eef20-deb1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1681908909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yv4ELE92aFYt2QdmV0+wT68rjfxHkC6qcTXsnlMZF+8=;
	b=sRcZ+SaE1YSe+dB96HiaGgAbP9xRGBuM3/1JtJUaGgDlr7hHc0RfcbkE00ltyS91uIq4QB
	PXdqXT1skRONE7gn5k3eB0n1DGhgEi5NIQhbfgoYBuL5V9bmnHNOv0wPLWeOxYnBOVtpqu
	yN7Z5hR77eqPzJKJLRN1rUqiWmp5NrU=
Message-ID: <0fa11dd4-da6f-df95-bff7-dc4a80553b01@suse.com>
Date: Wed, 19 Apr 2023 14:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1] tools/libs/guest: assist gcc13's realloc analyzer
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230419100633.13047-1-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230419100633.13047-1-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xYCdlYbqKLWLzjsumfVXOtKv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xYCdlYbqKLWLzjsumfVXOtKv
Content-Type: multipart/mixed; boundary="------------7DXRDtF2RGCrUM6MolD2vxQB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <0fa11dd4-da6f-df95-bff7-dc4a80553b01@suse.com>
Subject: Re: [PATCH v1] tools/libs/guest: assist gcc13's realloc analyzer
References: <20230419100633.13047-1-olaf@aepfle.de>
In-Reply-To: <20230419100633.13047-1-olaf@aepfle.de>

--------------7DXRDtF2RGCrUM6MolD2vxQB
Content-Type: multipart/mixed; boundary="------------GwQcupx21pbiuN66Cfh6D5c5"

--------------GwQcupx21pbiuN66Cfh6D5c5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjMgMTI6MDYsIE9sYWYgSGVyaW5nIHdyb3RlOg0KPiBnY2MxMyBmYWlscyB0
byB0cmFjayB0aGUgYWxsb2NhdGVkIG1lbW9yeSBpbiBiYWNrdXBfcHRlczoNCj4gDQo+IHhn
X29mZmxpbmVfcGFnZS5jOiBJbiBmdW5jdGlvbiAnYmFja3VwX3B0ZXMnOg0KPiB4Z19vZmZs
aW5lX3BhZ2UuYzoxOTE6MTM6IGVycm9yOiBwb2ludGVyICdvcmlnJyBtYXkgYmUgdXNlZCBh
ZnRlciAncmVhbGxvYycgWy1XZXJyb3I9dXNlLWFmdGVyLWZyZWVdDQo+ICAgIDE5MSB8ICAg
ICAgICAgICAgIGZyZWUob3JpZyk7DQo+IA0KPiBBc3Npc3QgdGhlIGFuYWx5emVyIGJ5IHNs
aWdodGx5IHJlYXJyYW5naW5nIHRoZSBjb2RlOg0KPiBJbiBjYXNlIHJlYWxsb2Mgc3VjY2Vl
ZHMsIHRoZSBwcmV2aW91cyBhbGxvY2F0aW9uIGlzIGVpdGhlciBleHRlbmRlZA0KPiBvciBy
ZWxlYXNlZCBpbnRlcm5hbGx5LiBJbiBjYXNlIHJlYWxsb2MgZmFpbHMsIHRoZSBwcmV2aW91
cyBhbGxvY2F0aW9uDQo+IGlzIGxlZnQgdW5jaGFuZ2VkLiBSZXR1cm4gYW4gZXJyb3IgaW4g
dGhpcyBjYXNlLCB0aGUgY2FsbGVyIHdpbGwNCj4gcmVsZWFzZSB0aGUgY3VycmVudGx5IGFs
bG9jYXRlZCBtZW1vcnkgaW4gaXRzIGVycm9yIHBhdGguDQo+IA0KPiBodHRwOi8vYnVnemls
bGEuc3VzZS5jb20vc2hvd19idWcuY2dpP2lkPTEyMTA1NzANCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------GwQcupx21pbiuN66Cfh6D5c5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GwQcupx21pbiuN66Cfh6D5c5--

--------------7DXRDtF2RGCrUM6MolD2vxQB--

--------------xYCdlYbqKLWLzjsumfVXOtKv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQ/5KwFAwAAAAAACgkQsN6d1ii/Ey/6
UQf/RRQwx+Hn90kvjYfmeP7SLbTx8TmPJQTPH8wEgI/SNqqoCdilfg3O5XNZMZ2JLNbiWabL3guu
m4YqC5H6POtvI/COskpRczr6qEEOW2NXWqvjVfNU2lXhFX8/kO/Bj2YxT/yNUbEDLIWV4zd1+H50
C7KNJDSmY2M9yQsndN1kN5XBcZ9RcKdRv5cVq7HBqstgi/Svsn+OUOGA6WpcyjQfUPadnM6vBua8
db7Ios+q9TqHUibyA7mD8kjVvzcBSp7LgCro8dTcb90TNBdsbeMU55fuuZHAsnNhqBv2wIbvuGIf
kcw8V/SbHcb//sMP9xWx5nG2PvzQil0MT+igXGRFeg==
=J0pG
-----END PGP SIGNATURE-----

--------------xYCdlYbqKLWLzjsumfVXOtKv--


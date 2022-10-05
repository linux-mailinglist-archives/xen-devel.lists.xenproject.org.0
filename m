Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0675F54D1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 14:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416164.660808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3zl-0006qx-Vi; Wed, 05 Oct 2022 12:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416164.660808; Wed, 05 Oct 2022 12:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og3zl-0006ns-Sw; Wed, 05 Oct 2022 12:59:29 +0000
Received: by outflank-mailman (input) for mailman id 416164;
 Wed, 05 Oct 2022 12:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og3zk-0006CE-2T
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 12:59:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aebb626-44ad-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 14:59:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A62791F88E;
 Wed,  5 Oct 2022 12:59:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DF6113ABD;
 Wed,  5 Oct 2022 12:59:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8Z9TIa5/PWN0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 12:59:26 +0000
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
X-Inumbo-ID: 8aebb626-44ad-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664974766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH8KcuhuxOFWK8XhK7MbuIPgRbsAZ/vs6n+Ey0LATz0=;
	b=k/Ss1srB0873V8alY1t41iFq5uXEsMzixiGbAZnM9TYQAriEOVrtoNhGqyuX256fSZ8lfl
	lNC1nTYXWvGnbOh+8VpSGOiOck+gbsOPWpxWC8KA+AL8JhQAmz2Jn4lUiD5GNh+hCQgFXi
	N9lDuN9VgC5ZWnfNjSETzjBGzc5U3js=
Message-ID: <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
Date: Wed, 5 Oct 2022 14:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <Yz17cLIb1V0zjEjK@mail-itl>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yz17cLIb1V0zjEjK@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------khWIfZoQsuKs7zDfK8H7B6NR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------khWIfZoQsuKs7zDfK8H7B6NR
Content-Type: multipart/mixed; boundary="------------FCe4f0wCep9o8c8i6vL5xHaZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
References: <Yz17cLIb1V0zjEjK@mail-itl>
In-Reply-To: <Yz17cLIb1V0zjEjK@mail-itl>

--------------FCe4f0wCep9o8c8i6vL5xHaZ
Content-Type: multipart/mixed; boundary="------------HQ71QzRpj7eYhrQRM9R10n8i"

--------------HQ71QzRpj7eYhrQRM9R10n8i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTQ6NDEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBXaGVuIGJvb3RpbmcgWGVuIHdpdGggTGludXggZG9tMCBuZXN0ZWQg
dW5kZXIgS1ZNLA0KPiBDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVD15IG1ha2VzIGl0
IHVuYWJsZSB0byB1c2UgdmlydGlvIGRldmljZXMNCj4gcHJvdmlkZWQgYnkgTDAgaHlwZXJ2
aXNvciAoS1ZNIHdpdGggcWVtdSkuIFdpdGggUFYgZG9tMCwgZ3JhbnRzIGFyZQ0KPiByZXF1
aXJlZCBmb3IgdmlydGlvIGV2ZW4gaWYganVzdCBDT05GSUdfWEVOX1ZJUlRJTyBpcyBlbmFi
bGVkLg0KPiANCj4gVGhpcyBpcyBwcm9iYWJseSB1bmNvbW1vbiBjb3JuZXIgY2FzZSwgYnV0
IG9uZSB0aGF0IGhhcyBiaXR0ZW4gbWUgaW4gbXkNCj4gQ0kgc2V0dXAuLi4gSSB0aGluayBY
ZW4gc2hvdWxkIHNldCBzbWFydGVyDQo+IHZpcnRpb19yZXF1aXJlX3Jlc3RyaWN0ZWRfbWVt
X2FjYygpLCB0aGF0IGVuZm9yY2VzIGl0IG9ubHkgZm9yIGRldmljZXMNCj4gcmVhbGx5IHBy
b3ZpZGVkIGJ5IGFub3RoZXIgWGVuIFZNIChub3QgYnkgdGhlICJvdXRlciBob3N0IiksIGJ1
dCBJJ20gbm90DQo+IHN1cmUgaG93IHRoYXQgY291bGQgYmUgZG9uZS4gQW55IGlkZWFzPw0K
PiANCg0KSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGFkZCBhIGJvb3QgcGFyYW1ldGVyIGZv
ciB0aGF0IHB1cnBvc2UuIFVzaW5nIGl0DQp3b3VsZCBvcGVuIGEgc2VjdXJpdHkgaG9sZSwg
dGhvdWdoIChiYXNpY2FsbHkgbGlrZSBhbGwgUENJIHBhc3N0aHJvdWdoIHRvDQpQViBndWVz
dHMpLg0KDQoNCkp1ZXJnZW4NCg==
--------------HQ71QzRpj7eYhrQRM9R10n8i
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HQ71QzRpj7eYhrQRM9R10n8i--

--------------FCe4f0wCep9o8c8i6vL5xHaZ--

--------------khWIfZoQsuKs7zDfK8H7B6NR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM9fx0FAwAAAAAACgkQsN6d1ii/Ey9u
Ugf/TCR4t4JC14gNFymIvLp6gq41CclVPvtHxgT0RUYFitOYjOvURxRNjYSIhT9lrkIF1wric5Fr
biAoV21Z18f9R6nwNaV3p4nLW3/aKcK93UBTQUmLds1nyj4QKrubG9RNMQ5fbnoIe3nq21ogGfRv
Baax+sPjKShWgxJtI4v71LGG+vQwnoXZg26bGN0Ifl1uQh3EV9eechypDSwg9n6WuSOJR2bK9km/
skNhF23kAwTXtoAjNsjI0KvwrkudZRCFNvROFcQtol8QwRoWVJmewHqI9ek84CIuFtrT5EJnWev/
SHqPlmdzhU8tcCdq501G32PRek6gc/Qm5mD99qp35w==
=DIDJ
-----END PGP SIGNATURE-----

--------------khWIfZoQsuKs7zDfK8H7B6NR--


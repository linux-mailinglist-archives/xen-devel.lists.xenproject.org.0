Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED636731B4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 07:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480865.745462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIOI9-0007ix-I0; Thu, 19 Jan 2023 06:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480865.745462; Thu, 19 Jan 2023 06:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIOI9-0007gs-Et; Thu, 19 Jan 2023 06:20:53 +0000
Received: by outflank-mailman (input) for mailman id 480865;
 Thu, 19 Jan 2023 06:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z0M=5Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIOI7-0007gm-PM
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 06:20:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ec324b-97c1-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 07:20:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87BC437314;
 Thu, 19 Jan 2023 06:20:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E1E3139ED;
 Thu, 19 Jan 2023 06:20:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 57GlEUDhyGNxHAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 Jan 2023 06:20:48 +0000
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
X-Inumbo-ID: 66ec324b-97c1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674109248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7OU4iBHSBL7uO1d+9sDGk7WFkyzvKIudXuLywSlHhHM=;
	b=dLC9xLlxS3Z9cUDj1muNBg04KG+8PaAHKN6EZH17nX0LGo1D7C0Bsac0Rh8h0Fs+y9hSCi
	Xz9fk/v0PdQHRnrDyvf4vph1pUAETqXc1dV8c0b9HSETETfDywXthrLdhuf11+CYon4UUm
	zGld7AgtUDkbiTI3fwtBcgogej5y5Eo=
Message-ID: <3c0fb20e-b6bb-83f6-3460-53de14e18663@suse.com>
Date: Thu, 19 Jan 2023 07:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FoltJnnfUi5LMvGHM4vvbMeE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FoltJnnfUi5LMvGHM4vvbMeE
Content-Type: multipart/mixed; boundary="------------ULD5jsbBglIzZytbDu23PUfX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Message-ID: <3c0fb20e-b6bb-83f6-3460-53de14e18663@suse.com>
Subject: Re: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>

--------------ULD5jsbBglIzZytbDu23PUfX
Content-Type: multipart/mixed; boundary="------------SV0JbAsQMieIH6j57tU0i8FJ"

--------------SV0JbAsQMieIH6j57tU0i8FJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDEuMjMgMTQ6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFRoaXMgaXMgdGhl
IHRvb2xzIHNpZGUgb2YgdGhlIFhlbiBzZXJpZXMgcG9zdGVkIHByZXZpb3VzbHkuDQo+IA0K
PiBXaXRoIHRoaXMsIGEgWGVuIGJ1aWx0IHdpdGggbG9uZyBzdHJpbmdzIGNhbiBiZSByZXRy
aWV2ZWQ6DQo+IA0KPiAgICAjIHhsIGluZm8NCj4gICAgLi4uDQo+ICAgIHhlbl92ZXJzaW9u
ICAgICAgICAgICAgOiA0LjE4LXVuc3RhYmxlK1JFQUxMWSBMT05HIEVYVFJBVkVSU0lPTg0K
PiAgICB4ZW5fY2hhbmdlc2V0ICAgICAgICAgIDogVHVlIEphbiAzIDE5OjI3OjE3IDIwMjMg
Z2l0OjUyZDJkYTZjMDU0NCtSRUFMTFkgU1VQRVIgRFVQRVIgRVhUUkEgTUVHQSBMT05HIENI
QU5HRVNFVA0KPiAgICAuLi4NCj4gDQo+IA0KPiBBbmRyZXcgQ29vcGVyICg2KToNCj4gICAg
dG9vbHMvbGlieGM6IE1vdmUgeGNfdmVyc2lvbigpIG91dCBvZiB4Y19wcml2YXRlLmMgaW50
byBpdHMgb3duIGZpbGUNCj4gICAgdG9vbHM6IEludHJvZHVjZSBhIG5vbi10cnVuY2F0aW5n
IHhjX3hlbnZlcl9leHRyYXZlcnNpb24oKQ0KPiAgICB0b29sczogSW50cm9kdWNlIGEgbm9u
LXRydW5jYXRpbmcgeGNfeGVudmVyX2NhcGFiaWxpdGllcygpDQo+ICAgIHRvb2xzOiBJbnRy
b2R1Y2UgYSBub24tdHJ1bmNhdGluZyB4Y194ZW52ZXJfY2hhbmdlc2V0KCkNCj4gICAgdG9v
bHM6IEludHJvZHVjZSBhIG5vbi10cnVuY2F0aW5nIHhjX3hlbnZlcl9jbWRsaW5lKCkNCj4g
ICAgdG9vbHM6IEludHJvZHVjZSBhIHhjX3hlbnZlcl9idWlsZGlkKCkgd3JhcHBlcg0KPiAN
Cj4gICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAgICAgICB8ICAxMCArKw0KPiAg
IHRvb2xzL2xpYnMvY3RybC9NYWtlZmlsZS5jb21tb24gICAgIHwgICAxICsNCj4gICB0b29s
cy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jICAgICAgICB8ICA2NiAtLS0tLS0tLS0tLS0NCj4g
ICB0b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5oICAgICAgICB8ICAgNyAtLQ0KPiAgIHRv
b2xzL2xpYnMvY3RybC94Y192ZXJzaW9uLmMgICAgICAgIHwgMjA2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGwuYyAg
ICAgICAgICAgIHwgIDYxICstLS0tLS0tLS0tDQo+ICAgdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsX3N0dWJzLmMgfCAgNDUgKysrKystLS0NCj4gICA3IGZpbGVzIGNoYW5nZWQsIDI1
MCBpbnNlcnRpb25zKCspLCAxNDYgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL2xpYnMvY3RybC94Y192ZXJzaW9uLmMNCj4gDQoNCkhtbSwgSSdtIG5vdCBj
b21wbGV0ZWx5IG9wcG9zZWQgdG8gdGhpcywgYnV0IGRvIHdlIHJlYWxseSBuZWVkIGFsbCB0
aGF0DQphZGRpdGlvbmFsIGNvZGU/DQoNCkFwYXJ0IGZyb20gdGhlIGJ1aWxkLWlkIGFsbCB0
aGUgaW5mb3JtYXRpb24gaXMgZWFzaWx5IGF2YWlsYWJsZSB2aWEgaHlwZnMuDQpBbmQgdGhl
IGJ1aWxkLWlkIGNhbiBiZSBlYXNpbHkgYWRkZWQgdG8gaHlwZnMuDQoNCg0KSnVlcmdlbg0K

--------------SV0JbAsQMieIH6j57tU0i8FJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------SV0JbAsQMieIH6j57tU0i8FJ--

--------------ULD5jsbBglIzZytbDu23PUfX--

--------------FoltJnnfUi5LMvGHM4vvbMeE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPI4T8FAwAAAAAACgkQsN6d1ii/Ey9m
UAf/dUGjTFneYdpmNPpCMXHoBI8dE0RHc3+PchzZ+0sNI81Ipq6N82D+KmkkXcDFsb4tBBjWvMgW
yJAYPvId043gcOTbRZctEgj1aCJx2RLvMOYWJCsNNSrrVy4ShFluPF5MkiNsLWFRLCLZbsQs/gjc
pfinUCnG7cNvgS8HL/IMoCuh5k+0isayfNOGNIYJzxTCpAAS5J6KQOp7Lg6I22sHnHbxM4cyz0xB
Ou7LZ9+/Fg4mqTqVR9zbMdhMnoIekhAnLLY8eKfMXuqvZ16oKQGNihwJi1+9/4C9MihItlpOsPwd
ZgOzFwnDoHY1/IuHmRxZm0TcUQjvq19lauZFhU0SAQ==
=aBK3
-----END PGP SIGNATURE-----

--------------FoltJnnfUi5LMvGHM4vvbMeE--


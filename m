Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81596DFAB2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 18:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520258.807649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcsm-0004rq-F0; Wed, 12 Apr 2023 15:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520258.807649; Wed, 12 Apr 2023 15:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmcsm-0004ps-C4; Wed, 12 Apr 2023 15:59:40 +0000
Received: by outflank-mailman (input) for mailman id 520258;
 Wed, 12 Apr 2023 15:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/N7h=AD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pmcsl-0004pm-Dj
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 15:59:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 063aafaa-d94b-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 17:59:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D1F721852;
 Wed, 12 Apr 2023 15:59:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8400613498;
 Wed, 12 Apr 2023 15:59:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rN2CHmjVNmQVQwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Apr 2023 15:59:36 +0000
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
X-Inumbo-ID: 063aafaa-d94b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1681315176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2sDQFE0958jm+r9RCHSMtJJSFOUbPg85D4fX12sQKU=;
	b=Wovnyqf/iXpjFBFaKebkCa3aM60LRrj7jXW15Fc0nEtDrvGELbhpIMGubaBU+St7eETdzA
	RBx4ecleQ98HMfetMrl2W8i1895WY40lUnEMlfD75jLXmhaRW2eSe/bxtQHgujcKq+JykS
	5d5Zd+zDhjBjncF4lMV5taqerszA54Q=
Message-ID: <4df0a9b9-db58-c25e-f166-878efd53e5d1@suse.com>
Date: Wed, 12 Apr 2023 17:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
Content-Language: en-US
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9yO0uIg1vua9CFsYKNPhS6qZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9yO0uIg1vua9CFsYKNPhS6qZ
Content-Type: multipart/mixed; boundary="------------p3P0VdE0yxKc78Ow5j7oQ4Vz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Message-ID: <4df0a9b9-db58-c25e-f166-878efd53e5d1@suse.com>
Subject: Re: xenstored: EACCESS error accessing control/feature-balloon 1
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>
In-Reply-To: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu>

--------------p3P0VdE0yxKc78Ow5j7oQ4Vz
Content-Type: multipart/mixed; boundary="------------yL0GrpwVDbBsGQJmvbglSETD"

--------------yL0GrpwVDbBsGQJmvbglSETD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDQuMjMgMTc6NDgsIHppdGhybyB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gdGhp
cyBpcyB3aGF0IEkgaGF2ZSBpbiAieGVuc3RvcmVkLWFjY2Vzcy5sb2ciIGluIGRvbTAgOg0K
PiANCj4gWzIwMjMwNDExVDIzOjQ4OjI3LjkxN1pdwqAgRDXCoMKgwqDCoMKgwqDCoMKgIHdy
aXRlwqDCoMKgwqAgY29udHJvbC9mZWF0dXJlLWJhbGxvb24gMQ0KPiBbMjAyMzA0MTFUMjM6
NDg6MjcuOTE3Wl3CoCBENcKgwqDCoMKgwqDCoMKgwqAgZXJyb3LCoMKgwqDCoCBFQUNDRVMN
Cj4gWzIwMjMwNDExVDIzOjQ4OjI3LjkyM1pdwqAgRDXCoMKgwqDCoMKgwqDCoMKgIHdyaXRl
wqDCoMKgwqAgZGF0YS91cGRhdGVkIFdlZCBBcHIgMTIgMDE6NDg6MjcgDQo+IENFU1QgMjAy
Mw0KPiANCj4gSXQgaGFwcGVucyBvbmNlIGVhY2ggbWludXRlLCBvbiB0d28gZGlmZmVyZW50
IGhvc3RzLCBib3RoIGFtZDY0Lg0KPiAoYm90aCBob3N0cyB1c2luZyB0aGUgc2FtZSBjb25m
aWcsIG9ubHkgdGhlIGhhcmR3YXJlIGRpZmZlcnMpLg0KPiANCj4gSSB0cmllZCBsb29raW5n
IHVwIGZvciBhIHNpbWlsYXIgYnVnLCBidXQgZGlkbid0IGZpbmQgb25lLg0KPiBJIGFwb2xv
Z2l6ZSBpbiBhZHZhbmNlIGlmIHRoaXMgZXJyb3IgaXMga25vd24sIGFuZCBpZiB0aGlzIGlz
IG5vdCB0aGUNCj4gcGxhY2UgdG8gcmVwb3J0IHRoaXMgIQ0KDQpUaGlzIGlzIG5vcm1hbCBi
ZWhhdmlvci4gQSBndWVzdCBpc24ndCBhbGxvd2VkIHRvIGNyZWF0ZSByYW5kb20gbmV3IG5v
ZGVzDQpiZWxvdyAiY29udHJvbCIsIGFuZCAiZmVhdHVyZS1iYWxsb29uIiBpc24ndCBjcmVh
dGVkIGJ5IHRoZSBYZW4gdG9vbHMsIHNvDQp0aGUgZ3Vlc3QgY2FuJ3Qgd3JpdGUgImNvbnRy
b2wvZmVhdHVyZS1iYWxsb29uIi4NCg0KDQpKdWVyZ2VuDQo=
--------------yL0GrpwVDbBsGQJmvbglSETD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yL0GrpwVDbBsGQJmvbglSETD--

--------------p3P0VdE0yxKc78Ow5j7oQ4Vz--

--------------9yO0uIg1vua9CFsYKNPhS6qZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQ21WgFAwAAAAAACgkQsN6d1ii/Ey8X
iAf9FWt+pJn+P3pI4pDGa5L4WrLIfxNPj1Wc24Oeo6PzGbsIh0fvb/dSNKP/RexYJqZi2huTIGrk
aNj2iKgZB7lf7PtiehIs2Uy8zw9FYsecgOT6E8bzWY0QBtSr5e1zCXTEv2AqqmtdattYis8OcyOK
OGLt+coIZQzSHBmW8inGIcUeonemsIChszRxUk9w0osBO/V1ZzyKtYsKosEHC/pOun/EOh4bF3tQ
D1lp8iLAKFsAiLL1jlo5PAg8MgPdcJrA+/4BuWv2HesUeDLGq/A0zR+1f/GlDwwpw+6AyjmZVVLZ
Eeic7OnZKtMuO1in2WKOq2FLFQfiVAioK+zxZUhkwQ==
=4QLz
-----END PGP SIGNATURE-----

--------------9yO0uIg1vua9CFsYKNPhS6qZ--


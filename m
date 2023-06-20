Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2673736601
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 10:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551476.861033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWdL-0002lt-3R; Tue, 20 Jun 2023 08:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551476.861033; Tue, 20 Jun 2023 08:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBWdK-0002j6-WA; Tue, 20 Jun 2023 08:22:38 +0000
Received: by outflank-mailman (input) for mailman id 551476;
 Tue, 20 Jun 2023 08:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=su2+=CI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qBWdJ-0002j0-G6
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 08:22:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bee874a-0f43-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 10:22:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6563A1F37E;
 Tue, 20 Jun 2023 08:22:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 401521346D;
 Tue, 20 Jun 2023 08:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FL8eDsphkWTmGQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 20 Jun 2023 08:22:34 +0000
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
X-Inumbo-ID: 9bee874a-0f43-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687249354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=virbmNNKVgzWFRLjmWEmVBilE9iwYG3pvTGZxysanPc=;
	b=M7meAr8lX66zDBmfW0cBpz5DQ3NzGLtPZD5xIw5hxIOEVxA7VXL+kc0QAs/zVvzH4MXZbZ
	XlR2yUvHoAmhs7SGF4nm5qqVT1CSnQ8jaTTx7Tf2OWbZe+OiPgynCNKueOhsk/ndPXkB/f
	7pfQ4Ud2DfMdDpGZO2GNIbQwrP+Hs8o=
Message-ID: <00887979-9133-fc6f-63c1-eb46da27cc32@suse.com>
Date: Tue, 20 Jun 2023 10:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 14/16] tools/xenstore: split out environment specific
 live update code
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-15-jgross@suse.com>
 <94daf68e-f623-acf0-5139-fdcb736a367e@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <94daf68e-f623-acf0-5139-fdcb736a367e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oE9C9XbhqwmxnaxOJ0EG12ne"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oE9C9XbhqwmxnaxOJ0EG12ne
Content-Type: multipart/mixed; boundary="------------e5teC6MDOrOJWJaIXQlNQdX0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <00887979-9133-fc6f-63c1-eb46da27cc32@suse.com>
Subject: Re: [PATCH v3 14/16] tools/xenstore: split out environment specific
 live update code
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-15-jgross@suse.com>
 <94daf68e-f623-acf0-5139-fdcb736a367e@xen.org>
In-Reply-To: <94daf68e-f623-acf0-5139-fdcb736a367e@xen.org>

--------------e5teC6MDOrOJWJaIXQlNQdX0
Content-Type: multipart/mixed; boundary="------------cqHn9gftYSiKMI83GYQfLkKy"

--------------cqHn9gftYSiKMI83GYQfLkKy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDYuMjMgMTk6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMDk6NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiAt
c3RhdGljIHN0cnVjdCBsaXZlX3VwZGF0ZSAqbHVfc3RhdHVzOw0KPj4gLQ0KPj4gLXN0cnVj
dCBsdV9kdW1wX3N0YXRlIHsNCj4+IC3CoMKgwqAgdm9pZCAqYnVmOw0KPj4gLcKgwqDCoCB1
bnNpZ25lZCBpbnQgc2l6ZTsNCj4+IC0jaWZuZGVmIF9fTUlOSU9TX18NCj4+IC3CoMKgwqAg
aW50IGZkOw0KPj4gLcKgwqDCoCBjaGFyICpmaWxlbmFtZTsNCj4+IC0jZW5kaWYNCj4+IC19
Ow0KPj4gLQ0KPj4gLXN0YXRpYyBpbnQgbHVfZGVzdHJveSh2b2lkICpkYXRhKQ0KPj4gLXsN
Cj4+IC0jaWZkZWYgX19NSU5JT1NfXw0KPj4gLcKgwqDCoCBpZiAobHVfc3RhdHVzLT5kdW1w
X3N0YXRlKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIG11bm1hcChsdV9zdGF0dXMtPmR1bXBfc3Rh
dGUsIGx1X3N0YXR1cy0+ZHVtcF9zaXplKTsNCj4+IC0jZW5kaWYNCj4+IC3CoMKgwqAgbHVf
c3RhdHVzID0gTlVMTDsNCj4+IC0NCj4+IC3CoMKgwqAgcmV0dXJuIDA7DQo+PiAtfQ0KPiAN
Cj4gSSB0aGluayBtb3ZpbmcgYWxsIGx1X2Rlc3Ryb3koKSBvdXQgb2YgeGVuc3RvcmVkX2Nv
bnRyb2wuYyBpcyBhIG1pc3Rha2UgYmVjYXVzZSANCj4gd2Ugbm93IG5lZWQgdG8gcmVtZW1i
ZXIgdGhhdCBhbnkgY29tbW9uIGNoYW5nZSBpbiBsdV9iZWdpbigpIG1heSBuZWVkIGFuIHVw
ZGF0ZSANCj4gaW4gdGhlIHR3byBpbXBsZW1lbnRhdGlvbiBvZiBsdV9kZXN0cm95KCkuDQo+
IA0KPiBFdmVuIGlmIHRoaXMgc2VlbXMgcG9pbnRsZXNzIGZvciBhIGZldyBsaW5lcywgaXQg
d291bGQgYmUgYmVzdCB0byBzcGxpdCANCj4gbHVfZGVzdHJveSgpIGluIHR3byBwYXJ0czog
b25lIGNvbW1vbiBhbmQgb25lIHBlciBsdSBiYWNrZW5kLg0KDQpPa2F5LCBmaW5lIHdpdGgg
bWUuDQoNCj4gDQo+IFRoZSByZXN0IG9mIHRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4N
Cg0KVGhhbmtzLA0KDQpKdWVyZ2VuDQo=
--------------cqHn9gftYSiKMI83GYQfLkKy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cqHn9gftYSiKMI83GYQfLkKy--

--------------e5teC6MDOrOJWJaIXQlNQdX0--

--------------oE9C9XbhqwmxnaxOJ0EG12ne
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSRYckFAwAAAAAACgkQsN6d1ii/Ey+o
igf/ZnyXKjsqUDkl2Wn4wTiQ5R79cyInjNhWfJxR7vAOCBlYegQPX/xEAd9UQ/9V98aT6Zz3sjvg
ALm/1rK/OYP0KZkl0bC3FjYzejkpGoY9Y6OP9ZsMNc1UIhpsj+mFbgCX2pxVgv8xcKRNJ1pN7byH
hc6q+uZmjWdacuOCZm3BjWUOWyjMM4SDcsJRkh1Iop6+6T5Exx7TKX+wPIFXWvo+RxL9qqo53FGr
LDkph7WlvINjvfoXLITy64ehbWsppLFoa54UFM4mY4N0aWrnZnctKZ6oyO9aLG0Ycg5o/zaftDYC
9g/Prm/8Mwyruo0rgnw5x1AvTb1yArLY1TwLTLxW6w==
=br9o
-----END PGP SIGNATURE-----

--------------oE9C9XbhqwmxnaxOJ0EG12ne--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA355EAB37
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 17:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411982.655131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocq9Q-0005xP-CL; Mon, 26 Sep 2022 15:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411982.655131; Mon, 26 Sep 2022 15:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocq9Q-0005ut-7C; Mon, 26 Sep 2022 15:36:08 +0000
Received: by outflank-mailman (input) for mailman id 411982;
 Mon, 26 Sep 2022 15:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocq9O-0005ug-FJ
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 15:36:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eef1d36d-3db0-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 17:36:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B785721EF3;
 Mon, 26 Sep 2022 15:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D01A139BD;
 Mon, 26 Sep 2022 15:36:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ph1fGeTGMWMqKAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 15:36:04 +0000
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
X-Inumbo-ID: eef1d36d-3db0-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664206564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9WOVGWfEzL7vU7Bj+g2o5y92Z7T6KVmygK/v8vociYw=;
	b=qOwRVOfMklLWP1ajTpkk8MNF2cv/9TiwDwz0NWsu6fdRglmK9u+miAHvx7cdkFzyExm6pf
	7kBwfrJCngo/AA3p3xHmNz9k66TzGdrKW7RmaInjRph+l08F8icItH4A5s3cSOqYbQCxj2
	/TVvkNkDvr+y8NLzqYnu6KfWeIpmSKA=
Message-ID: <7477c714-4aa3-5fea-47db-01ccf91f3d6e@suse.com>
Date: Mon, 26 Sep 2022 17:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/3] xen/pv: support selecting safe/unsafe msr accesses
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-4-jgross@suse.com>
 <a9f6c0e9-f34d-7205-9e85-054088ecddb4@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a9f6c0e9-f34d-7205-9e85-054088ecddb4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1MXODAaqPWPZ0uy8iXtWpCDv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1MXODAaqPWPZ0uy8iXtWpCDv
Content-Type: multipart/mixed; boundary="------------Kgf54Q0ZcCQxSVy0QutR0C3S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <7477c714-4aa3-5fea-47db-01ccf91f3d6e@suse.com>
Subject: Re: [PATCH 3/3] xen/pv: support selecting safe/unsafe msr accesses
References: <20220926141849.21805-1-jgross@suse.com>
 <20220926141849.21805-4-jgross@suse.com>
 <a9f6c0e9-f34d-7205-9e85-054088ecddb4@suse.com>
In-Reply-To: <a9f6c0e9-f34d-7205-9e85-054088ecddb4@suse.com>

--------------Kgf54Q0ZcCQxSVy0QutR0C3S
Content-Type: multipart/mixed; boundary="------------ErEI6mST0vA9KC03NyB6XuvU"

--------------ErEI6mST0vA9KC03NyB6XuvU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjIgMTc6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wOS4yMDIy
IDE2OjE4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvYXJjaC94ODYveGVuL0tj
b25maWcNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9LY29uZmlnDQo+PiBAQCAtOTIsMyArOTIs
MTIgQEAgY29uZmlnIFhFTl9ET00wDQo+PiAgIAlzZWxlY3QgWDg2X1gyQVBJQyBpZiBYRU5f
UFZIICYmIFg4Nl82NA0KPj4gICAJaGVscA0KPj4gICAJICBTdXBwb3J0IHJ1bm5pbmcgYXMg
YSBYZW4gRG9tMCBndWVzdC4NCj4+ICsNCj4+ICtjb25maWcgWEVOX1BWX01TUl9TQUZFDQo+
PiArCWJvb2wgIkFsd2F5cyB1c2Ugc2FmZSBNU1IgYWNjZXNzZXMgaW4gUFYgZ3Vlc3RzIg0K
Pj4gKwlkZWZhdWx0IHkNCj4gDQo+IElzIHRoZXJlIGFueSB0aW1lIGxpbmUgd2hlbiB0aGlz
IGRlZmF1bHQgd2lsbCBjaGFuZ2UsIHBlcmhhcHMgZmlyc3QgdG8NCj4gREVCVUcgYW5kIGxh
dGVyIHRvIE4/DQoNCkknbSBub3Qgc3VyZS4gSSBkaWQgYW4gaW5pdGlhbCB0ZXN0IHdpdGgg
dGhlIHNhZmUgdmFyaWFudHMgZGlzYWJsZWQgaW4gZG9tMA0KYW5kIGl0IGp1c3Qgd29ya2Vk
Lg0KDQpJJ20gbm90IHN1cmUgd2Ugd2FudCBhbiBpbnRlcm1lZGlhdGUgc3RlcCwgYXMgaW4g
Y3JpdGljYWwgY2FzZXMgdGhlIHVzZXIgY2FuDQpzdGlsbCB1c2UgdGhlIGJvb3QgcGFyYW1l
dGVyLg0KDQo+IA0KPj4gQEAgLTEwMTAsMjIgKzEwMjAsMTYgQEAgc3RhdGljIGludCB4ZW5f
d3JpdGVfbXNyX3NhZmUodW5zaWduZWQgaW50IG1zciwgdW5zaWduZWQgaW50IGxvdywNCj4+
ICAgDQo+PiAgIHN0YXRpYyB1NjQgeGVuX3JlYWRfbXNyKHVuc2lnbmVkIGludCBtc3IpDQo+
PiAgIHsNCj4+IC0JLyoNCj4+IC0JICogVGhpcyB3aWxsIHNpbGVudGx5IHN3YWxsb3cgYSAj
R1AgZnJvbSBSRE1TUi4gIEl0IG1heSBiZSB3b3J0aA0KPj4gLQkgKiBjaGFuZ2luZyB0aGF0
Lg0KPj4gLQkgKi8NCj4+ICAgCWludCBlcnI7DQo+PiAgIA0KPj4gLQlyZXR1cm4geGVuX3Jl
YWRfbXNyX3NhZmUobXNyLCAmZXJyKTsNCj4+ICsJcmV0dXJuIHhlbl9kb19yZWFkX21zciht
c3IsIHhlbl9tc3Jfc2FmZSA/ICZlcnIgOiBOVUxMKTsNCj4+ICAgfQ0KPiANCj4gV2hlbiB3
ZSB3ZXJlIHRhbGtpbmcgYXQgdGhlIHNlc3Npb24sIEkgdGhpbmsgSSBzYWlkIHRoYXQgYXQg
bGVhc3QgdGhlcmUNCj4gaXMgbm8gdW5pbml0aWFsaXplZCB2YWx1ZSBiZWluZyBwYXNzZWQg
YmFjay4gQnV0IEkgZGlkIGxvb2sgYXQNCj4geGVuX3JlYWRfbXNyX3NhZmUoKSBvbmx5LCB3
aGljaCBpbmRlZWQgaXMgb2theS4gV2hlcmVhcw0KPiBuYXRpdmVfcmVhZF9tc3Jfc2FmZSgp
IGlzbid0IChub3IgaXMgbmF0aXZlX3JlYWRfbXNyKCkgYWZhaWN0KSwgc28gSQ0KPiB0aGlu
ayBwYXJ0IG9mIHRoaXMgc2VyaWVzIHNob3VsZCBiZSB0byBhbHNvIGVsaW1pbmF0ZSB0aGUg
dW5kZWZpbmVkLQ0KPiBuZXNzIGZyb20gdGhpcyBjb2RlIHBhdGggKHBvc3NpYmxlIG5vdyBv
bmx5IHdoZW4geGVuX21zcl9zYWZlIGlzIHRydWUsDQo+IGJ1dCBhcyBwZXIgYWJvdmUgdGhh
dCdsbCBiZSB0aGUgZGVmYXVsdCBhdCBsZWFzdCBmb3Igc29tZSB0aW1lKSwgd2hlcmUNCj4g
dGhlIGNhbGxlciBoYXMgbm8gd2F5IHRvIGtub3cgdGhhdCBpdCBzaG91bGRuJ3QgbG9vayBh
dCB0aGUgdmFsdWUuDQoNCkkgY2FuIGFkZCB0aGF0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------ErEI6mST0vA9KC03NyB6XuvU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ErEI6mST0vA9KC03NyB6XuvU--

--------------Kgf54Q0ZcCQxSVy0QutR0C3S--

--------------1MXODAaqPWPZ0uy8iXtWpCDv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMxxuQFAwAAAAAACgkQsN6d1ii/Ey/P
xAf+NyM7Tlvoo4n3JMLN0ocKeidnbN9wh2U0Iae2Kcj7T2rL81rDc2+KXC/YcXBN9hXVRlG7CO8J
JEu6hKs++g9wXO1UokttV9HaFowPvKMJQAq/NISINinlTwx7O11KN3DpUdrFtk2NEc0Fea7SxP/k
dRhn2ACOmhctLzmgUYFI/OrzRrwwxjpb5Jw7LY0h0dyvVfJQezGHxsIm82ZWd5hFnUlV+oQ9iJwW
K0+Dvp2l3Xrk1zw1SegCe7PKBANLf75mP40gXeoqIihpOMZmEaMoi6BnYE/vE9u+AxB7y+18GEXw
ATrc7dFLwQQzOL47+AYs7re4Xanb3hzkX6LEwo3M2g==
=zd9Z
-----END PGP SIGNATURE-----

--------------1MXODAaqPWPZ0uy8iXtWpCDv--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB7674DED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 08:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481458.746335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIlh3-00020k-Im; Fri, 20 Jan 2023 07:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481458.746335; Fri, 20 Jan 2023 07:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIlh3-0001y3-FI; Fri, 20 Jan 2023 07:20:09 +0000
Received: by outflank-mailman (input) for mailman id 481458;
 Fri, 20 Jan 2023 07:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NYwS=5R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pIlh2-0001xu-3P
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 07:20:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dccb0f1a-9892-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 08:20:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E44622657;
 Fri, 20 Jan 2023 07:20:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4B011390C;
 Fri, 20 Jan 2023 07:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XcdlNqRAymNRagAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 20 Jan 2023 07:20:04 +0000
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
X-Inumbo-ID: dccb0f1a-9892-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674199205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2q4fzQCu5e7fvGqH5s1QSEHRhfxesa3qtzT1vLYVUsA=;
	b=rhIM/52jz4TuyKcZXDGnBQxGmmiOBO5JdXPN2N8wkkDTOKepOkj+Wd/qPvB5AtAyAmZ7hF
	pbrGP23sPXqNjxtoC197ylRm2QuIBl8LHVaJxm3Lp5+FHCGsJnec4YbnpHReiWUFZQnhNj
	bR8fglv2ZIELDUvW+Hmn0UpD9Fw7l9M=
Message-ID: <1834b425-2d77-a0c3-e2a9-5c1fc9de750d@suse.com>
Date: Fri, 20 Jan 2023 08:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen: Allow platform PCI interrupt to be shared
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
References: <f9a29a68d05668a3636dd09acd94d970269eaec6.camel@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Gleixner <tglx@linutronix.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f9a29a68d05668a3636dd09acd94d970269eaec6.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------guK1Nuw1nAow0CzighlzBg96"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------guK1Nuw1nAow0CzighlzBg96
Content-Type: multipart/mixed; boundary="------------LqczeNPWt0NQ0pIdP3EIij9f";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <1834b425-2d77-a0c3-e2a9-5c1fc9de750d@suse.com>
Subject: Re: [PATCH] xen: Allow platform PCI interrupt to be shared
References: <f9a29a68d05668a3636dd09acd94d970269eaec6.camel@infradead.org>
In-Reply-To: <f9a29a68d05668a3636dd09acd94d970269eaec6.camel@infradead.org>

--------------LqczeNPWt0NQ0pIdP3EIij9f
Content-Type: multipart/mixed; boundary="------------ozj20MEsJlZdsBkhWZq6i8yX"

--------------ozj20MEsJlZdsBkhWZq6i8yX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjMgMTM6MjIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gRnJvbTogRGF2
aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4NCj4gDQo+IFdoZW4gd2UgZG9uJ3Qg
dXNlIHRoZSBwZXItQ1BVIHZlY3RvciBjYWxsYmFjaywgd2UgYXNrIFhlbiB0byBkZWxpdmVy
IGV2ZW50DQo+IGNoYW5uZWwgaW50ZXJydXB0cyBhcyBJTlR4IG9uIHRoZSBQQ0kgcGxhdGZv
cm0gZGV2aWNlLiBBcyBzdWNoLCBpdCBjYW4gYmUNCj4gc2hhcmVkIHdpdGggSU5UeCBvbiBv
dGhlciBQQ0kgZGV2aWNlcy4NCj4gDQo+IFNldCBJUlFGX1NIQVJFRCwgYW5kIG1ha2UgaXQg
cmV0dXJuIElSUV9IQU5ETEVEIG9yIElSUV9OT05FIGFjY29yZGluZyB0bw0KPiB3aGV0aGVy
IHRoZSBldnRjaG5fdXBjYWxsX3BlbmRpbmcgZmxhZyB3YXMgYWN0dWFsbHkgc2V0LiBOb3cg
SSBjYW4gc2hhcmUNCj4gdGhlIGludGVycnVwdDoNCj4gDQo+ICAgMTE6ICAgICAgICAgODIg
ICAgICAgICAgMCAgIElPLUFQSUMgIDExLWZhc3Rlb2kgICB4ZW4tcGxhdGZvcm0tcGNpLCBl
bnM0DQo+IA0KPiBEcm9wIHRoZSBJUlFGX1RSSUdHRVJfUklTSU5HLiBJdCBoYXMgbm8gZWZm
ZWN0IHdoZW4gdGhlIElSUSBpcyBzaGFyZWQsDQo+IGFuZCBiZXNpZGVzLCB0aGUgb25seSBl
ZmZlY3QgaXQgd2FzIGhhdmluZyBldmVuIGJlZm9yZWhhbmQgd2FzIHRvIHRyaWdnZXINCj4g
YSBkZWJ1ZyBtZXNzYWdlIGluIGJvdGggSS9PQVBJQyBhbmQgbGVnYWN5IFBJQyBjYXNlczoN
Cj4gDQo+IFsgICAgMC45MTU0NDFdIGdlbmlycTogTm8gc2V0X3R5cGUgZnVuY3Rpb24gZm9y
IElSUSAxMSAoSU8tQVBJQykNCj4gWyAgICAwLjk1MTkzOV0gZ2VuaXJxOiBObyBzZXRfdHlw
ZSBmdW5jdGlvbiBmb3IgSVJRIDExIChYVC1QSUMpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQo+IC0tLQ0KPiBXaGF0IGRvZXMgeGVu
X2V2dGNobl9kb191cGNhbGwoKSBleGlzdCBmb3I/IENhbiB3ZSBkZWxldGUgaXQ/IEkgZG9u
J3QNCj4gc2VlIGl0IGJlaW5nIGNhbGxlZCBhbnl3aGVyZS4NCg0KSXQgY2FuIGJlIGRlbGV0
ZWQuDQoNCg0KSnVlcmdlbg0K
--------------ozj20MEsJlZdsBkhWZq6i8yX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ozj20MEsJlZdsBkhWZq6i8yX--

--------------LqczeNPWt0NQ0pIdP3EIij9f--

--------------guK1Nuw1nAow0CzighlzBg96
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPKQKQFAwAAAAAACgkQsN6d1ii/Ey/k
Jgf/ShQUkF68ZJ7LVMFtJAEAY4UI7xClGLkU85Zwd3vNnZdvIZuY3GpxVa6ZqkSEubzPzY6+C+S2
cJuimmOvsamewAtDCjnh+jtlkFHUi+c5xTtP3Qc0ZZDzBE+KL90G6uBQqVRLptELX4hK+QgEDsnZ
jIoowp3i9vdEEjhAq1VQ95h8LjA+HTYdCZcvTZPdm8jVSVtbbtvrxSl0SX/B7vqz+iIIu5SfYywf
t/ONVN3UXxzUtHiWKmoaAVcMvFHPR1W1u6V1iLO0oJNSWk1ypY0zsmh+JZ/FH9kmJ9dKr+LS3TB0
6MSUlUn6aQQTx9344uynMgQzHOE8kvxaSTBNDDZCng==
=gDUX
-----END PGP SIGNATURE-----

--------------guK1Nuw1nAow0CzighlzBg96--


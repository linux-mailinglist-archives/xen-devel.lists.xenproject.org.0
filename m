Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97155C0D4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 14:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357061.585460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o69w8-0007Pg-Iu; Tue, 28 Jun 2022 12:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357061.585460; Tue, 28 Jun 2022 12:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o69w8-0007Mp-FD; Tue, 28 Jun 2022 12:03:20 +0000
Received: by outflank-mailman (input) for mailman id 357061;
 Tue, 28 Jun 2022 12:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VG4i=XD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o69w6-0007Mc-Hq
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 12:03:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b1778a9-f6da-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 14:03:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C2DD21EDC;
 Tue, 28 Jun 2022 12:03:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A35D5139E9;
 Tue, 28 Jun 2022 12:03:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HhcWJgPuumJVFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Jun 2022 12:03:15 +0000
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
X-Inumbo-ID: 4b1778a9-f6da-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656417796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yVWg7wp4h+Cfn2qEfC6WV/K5Vv+RBe+YiFsHKlpkmZQ=;
	b=hn0c66rsHaEfSrsSHHC75IHTya+X9eM25nyDtKYbte2CMyE/UkS5l2Qk+r7uMe2XaB4x9P
	FyitlS0G+yD3KL+iWvvwRwSZHj4mp6FJMYNS74SzKWDKnaIsRvJJS0jRmErIdE30Vr6sL4
	WYPCi5jahpUkFo1HGGlnS4TmaMnHVBM=
Message-ID: <8e7faa1d-9e72-5b2e-2a70-426d822d05b3@suse.com>
Date: Tue, 28 Jun 2022 14:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20220623094608.7294-1-jgross@suse.com>
 <20220623094608.7294-2-jgross@suse.com>
 <117fd526-a241-2f01-47b5-e40e1803124b@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] x86/xen: use clear_bss() for Xen PV guests
In-Reply-To: <117fd526-a241-2f01-47b5-e40e1803124b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PKRvAy4qT3iQa0ns18QQvZQy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PKRvAy4qT3iQa0ns18QQvZQy
Content-Type: multipart/mixed; boundary="------------80o8n7krF6sw0zfxyPWo7gx5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <8e7faa1d-9e72-5b2e-2a70-426d822d05b3@suse.com>
Subject: Re: [PATCH v2 1/3] x86/xen: use clear_bss() for Xen PV guests
References: <20220623094608.7294-1-jgross@suse.com>
 <20220623094608.7294-2-jgross@suse.com>
 <117fd526-a241-2f01-47b5-e40e1803124b@suse.com>
In-Reply-To: <117fd526-a241-2f01-47b5-e40e1803124b@suse.com>

--------------80o8n7krF6sw0zfxyPWo7gx5
Content-Type: multipart/mixed; boundary="------------sDLlMP0x9f6jm3WTSHG4Qbmi"

--------------sDLlMP0x9f6jm3WTSHG4Qbmi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMTE6NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNi4yMDIy
IDExOjQ2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9wdi5jDQo+PiArKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMNCj4+
IEBAIC0xMTgzLDE1ICsxMTgzLDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5fZG9tdV9z
ZXRfbGVnYWN5X2ZlYXR1cmVzKHZvaWQpDQo+PiAgIGV4dGVybiB2b2lkIGVhcmx5X3hlbl9p
cmV0X3BhdGNoKHZvaWQpOw0KPj4gICANCj4+ICAgLyogRmlyc3QgQyBmdW5jdGlvbiB0byBi
ZSBjYWxsZWQgb24gWGVuIGJvb3QgKi8NCj4+IC1hc21saW5rYWdlIF9fdmlzaWJsZSB2b2lk
IF9faW5pdCB4ZW5fc3RhcnRfa2VybmVsKHZvaWQpDQo+PiArYXNtbGlua2FnZSBfX3Zpc2li
bGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbChzdHJ1Y3Qgc3RhcnRfaW5mbyAqc2kp
DQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBwaHlzZGV2X3NldF9pb3BsIHNldF9pb3BsOw0KPj4g
ICAJdW5zaWduZWQgbG9uZyBpbml0cmRfc3RhcnQgPSAwOw0KPj4gICAJaW50IHJjOw0KPj4g
ICANCj4+IC0JaWYgKCF4ZW5fc3RhcnRfaW5mbykNCj4+ICsJaWYgKCFzaSkNCj4+ICAgCQly
ZXR1cm47DQo+PiAgIA0KPj4gKwljbGVhcl9ic3MoKTsNCj4gDQo+IEFzIHBlciBzdWJzZXF1
ZW50IG9ic2VydmF0aW9uLCB0aGlzIHNob3VsZG4ndCByZWFsbHkgYmUgbmVlZGVkOiBUaGUN
Cj4gaHlwZXJ2aXNvciAob3IgdG9vbCBzdGFjayBmb3IgRG9tVS1zKSBhbHJlYWR5IGRvZXMg
c28uIFdoaWxlIEkgZ3Vlc3MNCj4gd2Ugd2FudCB0byBrZWVwIGl0IHRvIGJlIG9uIHRoZSBz
YWZlIHNpZGUsIG1heWJlIHdvcnRoIGEgY29tbWVudD8NCg0KQXJlIHlvdSBzdXJlIGFsbCBw
b3NzaWJsZSBib290IGxvYWRlcnMgYXJlIGNsZWFyaW5nIGFsbG9jLW9ubHkgc2VjdGlvbnM/
DQoNCkknZCByYXRoZXIgbm90IGNvdW50IG9uIGUuZy4gZ3J1YiBkb2luZyB0aGlzIGluIGFs
bCBjYXNlcy4NCg0KDQpKdWVyZ2VuDQo=
--------------sDLlMP0x9f6jm3WTSHG4Qbmi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------sDLlMP0x9f6jm3WTSHG4Qbmi--

--------------80o8n7krF6sw0zfxyPWo7gx5--

--------------PKRvAy4qT3iQa0ns18QQvZQy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK67gMFAwAAAAAACgkQsN6d1ii/Ey8H
Ugf+OD0yOcSu9qozk0L8XeQDqTSi3n0Bqexn+BBDt0XHm6r4L2T2nvJU+bm4aH5cJDM8yrn6ZBze
cv9u3M/ecd16V2FT4ISCgC769pZX+9BEUD+GGwKsEhCaTiVw67M+Te/HqgqrnMClvQD4WBOBU4a5
AFaJRyBb1kymiMPPW16OlNeGH8a1+5/m6G3Kxz4bvfbhuAJDeusORVKsHEwts77+8wHd7ZRQG6O+
d9OmaoT9tpFr1QSOCfYLx5X4wGnr+G6LFX8955T1JzKkVJ9g275FTBnStHGtnGcXsxFpkMv7ejK9
EQMtmeyo0A+EVQt3QXGr9aRZL5jZR8uw7De/F9rXCA==
=5oig
-----END PGP SIGNATURE-----

--------------PKRvAy4qT3iQa0ns18QQvZQy--


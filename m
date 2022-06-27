Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E455B956
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 13:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356470.584721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mbH-0002bB-Hb; Mon, 27 Jun 2022 11:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356470.584721; Mon, 27 Jun 2022 11:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5mbH-0002ZB-DH; Mon, 27 Jun 2022 11:08:15 +0000
Received: by outflank-mailman (input) for mailman id 356470;
 Mon, 27 Jun 2022 11:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5mbG-0002Z5-4f
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 11:08:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f8f34fd-f609-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 13:08:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96FBF1F8F7;
 Mon, 27 Jun 2022 11:08:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45A4113AB2;
 Mon, 27 Jun 2022 11:08:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id egO9D5yPuWKIWQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 11:08:12 +0000
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
X-Inumbo-ID: 6f8f34fd-f609-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656328092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t65R6Hz/gmeFj2B3stg0eE558saEADtFx1n/YiXzQ6Q=;
	b=nQn5WlWJWns5S0K3BEqPTVA9y9RE4r0cbLNsefZlOsTtpqHMcEMHcJNrW/cePdLzaATPSZ
	R9xOBjEvt5dO1JP8wHzYu58v3iCQhJuHAXdAEiBixgT2PtfdT8SqJ3pNyTHJf5XZFKkXXT
	vXURB6FQjPbFwilnlQcZIN3gucFpb4M=
Message-ID: <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
Date: Mon, 27 Jun 2022 13:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com> <YrmGQj/W7KTzJ1vo@Air-de-Roger>
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
 <YrmOQPQlbAMwULWc@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YrmOQPQlbAMwULWc@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pI1MzcG9tFV3Cgp2dtp1BQ3h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pI1MzcG9tFV3Cgp2dtp1BQ3h
Content-Type: multipart/mixed; boundary="------------lgnQJJYqFo7P3vXdBMNZ3E4v";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
Message-ID: <e0b54db4-af1a-fb54-e6e5-ef0b71194091@suse.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com> <YrmGQj/W7KTzJ1vo@Air-de-Roger>
 <8951e03f-ba63-4524-99e9-c030e273c1d1@suse.com>
 <YrmOQPQlbAMwULWc@Air-de-Roger>
In-Reply-To: <YrmOQPQlbAMwULWc@Air-de-Roger>

--------------lgnQJJYqFo7P3vXdBMNZ3E4v
Content-Type: multipart/mixed; boundary="------------NEGoqHbNdO6rVtX0zHb0HpuR"

--------------NEGoqHbNdO6rVtX0zHb0HpuR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTM6MDIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwg
SnVuIDI3LCAyMDIyIGF0IDEyOjQwOjQxUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+PiBPbiAyNy4wNi4yMiAxMjoyOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBUaHUsIE1hciAyNCwgMjAyMiBhdCAwMzowMTozMVBNICswMTAwLCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPj4+PiBUaGUgZW50cnkgcG9pbnQgdXNlZCBmb3IgdGhlIHZjcHVfb3AgaHlw
ZXJjYWxsIG9uIEFybSBpcyBkaWZmZXJlbnQNCj4+Pj4gZnJvbSB0aGUgb25lIG9uIHg4NiB0
b2RheSwgYXMgc29tZSBvZiB0aGUgY29tbW9uIHN1Yi1vcHMgYXJlIG5vdA0KPj4+PiBzdXBw
b3J0ZWQgb24gQXJtLiBUaGUgQXJtIHNwZWNpZmljIGhhbmRsZXIgZmlsdGVycyBvdXQgdGhl
IG5vdA0KPj4+PiBzdXBwb3J0ZWQgc3ViLW9wcyBhbmQgdGhlbiBjYWxscyB0aGUgY29tbW9u
IGhhbmRsZXIuIFRoaXMgbGVhZHMgdG8gdGhlDQo+Pj4+IHdlaXJkIGNhbGwgaGllcmFyY2h5
Og0KPj4+Pg0KPj4+PiAgICAgZG9fYXJtX3ZjcHVfb3AoKQ0KPj4+PiAgICAgICBkb192Y3B1
X29wKCkNCj4+Pj4gICAgICAgICBhcmNoX2RvX3ZjcHVfb3AoKQ0KPj4+Pg0KPj4+PiBDbGVh
biB0aGlzIHVwIGJ5IHJlbmFtaW5nIGRvX3ZjcHVfb3AoKSB0byBjb21tb25fdmNwdV9vcCgp
IGFuZA0KPj4+PiBhcmNoX2RvX3ZjcHVfb3AoKSBpbiBlYWNoIGFyY2hpdGVjdHVyZSB0byBk
b192Y3B1X29wKCkuIFRoaXMgd2F5IG9uZQ0KPj4+PiBvZiBhYm92ZSBjYWxscyBjYW4gYmUg
YXZvaWRlZCB3aXRob3V0IHJlc3RyaWN0aW5nIGFueSBwb3RlbnRpYWwNCj4+Pj4gZnV0dXJl
IHVzZSBvZiBjb21tb24gc3ViLW9wcyBmb3IgQXJtLg0KPj4+DQo+Pj4gV291bGRuJ3QgaXQg
YmUgbW9yZSBuYXR1cmFsIHRvIGhhdmUgZG9fdmNwdV9vcCgpIGNvbnRhaW4gdGhlIGNvbW1v
bg0KPj4+IGNvZGUgKEFGQUlDVCBoYW5kbGVycyBmb3INCj4+PiBWQ1BVT1BfcmVnaXN0ZXJf
e3ZjcHVfaW5mbyxydW5zdGF0ZV9tZW1vcnlfYXJlYX0pIGFuZCB0aGVuIGV2ZXJ5dGhpbmcN
Cj4+PiBlbHNlIGhhbmRsZWQgYnkgdGhlIHg4NiBhcmNoX2RvX3ZjcHVfb3AoKSBoYW5kbGVy
Pw0KPj4+DQo+Pj4gSSBmaW5kIHRoZSBjb21tb24gcHJlZml4IG1pc2xlYWRpbmcsIGFzIG5v
dCBhbGwgdGhlIFZDUFVPUCBoeXBlcmNhbGxzDQo+Pj4gYXJlIGF2YWlsYWJsZSB0byBhbGwg
dGhlIGFyY2hpdGVjdHVyZXMuDQo+Pg0KPj4gVGhpcyB3b3VsZCBlbmQgdXAgaW4gQXJtIHN1
ZGRlbmx5IHN1cHBvcnRpbmcgdGhlIHN1Yi1vcHMgaXQgZG9lc24ndA0KPj4gKHdhbnQgdG8p
IHN1cHBvcnQgdG9kYXkuIE90aGVyd2lzZSBpdCB3b3VsZCBtYWtlIG5vIHNlbnNlIHRoYXQg
QXJtIGhhcw0KPj4gYSBkZWRpY2F0ZWQgZW50cnkgZm9yIHRoaXMgaHlwZXJjYWxsLg0KPiAN
Cj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSBmb3IgYSBjb21tb24gZG9fdmNwdV9vcCgpIHRo
YXQganVzdCBjb250YWlucw0KPiBoYW5kbGVycyBmb3IgVkNQVU9QX3JlZ2lzdGVyX3t2Y3B1
X2luZm8scnVuc3RhdGVfbWVtb3J5X2FyZWF9IGFuZCB0aGVuDQo+IGFuIGVtcHR5IGFyY2hf
IGhhbmRsZXIgZm9yIEFybSwgYW5kIGV2ZXJ5dGhpbmcgZWxzZSBtb3ZlZCB0byB0aGUgeDg2
DQo+IGFyY2hfIGhhbmRsZXIuICBUaGF0IG9idmlvdXNseSBpbXBsaWVzIHNvbWUgY29kZSBj
aHVybiwgYnV0IHJlc3VsdHMgaW4NCj4gYSBjbGVhbmVyIGltcGxlbWVudGF0aW9uIElNTy4N
Cg0KSSdkIGJlIGZpbmUgd2l0aCB0aGF0Lg0KDQpJIGRpZCBpdCBpbiBWMiBvZiB0aGUgKHRo
ZW4gc2VjcmV0KSBzZXJpZXMsIGFuZCBKYW4gcmVwbGllZDoNCg0KICAgSSdtIGFmcmFpZCBJ
IGRvbid0IGFncmVlIHdpdGggdGhpcyBtb3ZlbWVudC4gSSBjb3VsZCBzZWUgdGhpbmdzIGdl
dHRpbmcNCiAgIG1vdmVkIHRoYXQgYXJlIHB1cmVseSBQViAob24gdGhlIGFzc3VtcHRpb24g
dGhhdCBubyBuZXcgUFYgcG9ydHMgd2lsbA0KICAgYXBwZWFyKSwgYnV0IGFueXRoaW5nIHRo
YXQncyBhbHNvIHVzYWJsZSBieSBQVkggLyBIVk0gb3VnaHQgdG8gYmUgdXNhYmxlDQogICBp
biBwcmluY2lwbGUgYWxzbyBieSBBcm0gb3Igb3RoZXIgUFYtZnJlZSBwb3J0cy4NCg0KDQpK
dWVyZ2VuDQo=
--------------NEGoqHbNdO6rVtX0zHb0HpuR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NEGoqHbNdO6rVtX0zHb0HpuR--

--------------lgnQJJYqFo7P3vXdBMNZ3E4v--

--------------pI1MzcG9tFV3Cgp2dtp1BQ3h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5j5sFAwAAAAAACgkQsN6d1ii/Ey8y
/QgAjhokKmFRVhuxRxM88r1cnD0kDqv5jKi29N+NS4sM6AeddH+HcA8fioTO+5yA0gR+K6kc8iob
cZ29UA8qXE5S+oM7VqwPOz76SrjSGF3qaMGyV2rCHp2LIwwS+KMDWgAOFv6rEDVmFF8+B/NlsLlH
mVetTfxxVhn1iTNefHFZMVzuUBpV6DBdJScCOBVLwpXkNFvdvFf77Hh0jvEz+wLBLUjAfS/4IIBE
JQ8EzngxbibcsKauo5UqmSpOOzCjuZMhR1dgqm1+so9X5TMnlZrv7i9dRqnFPSyXKctG00H5qCYY
totM+gQEStl8DCgB438JlX+2ZaoFSm4nMs1cta+8mg==
=V7r8
-----END PGP SIGNATURE-----

--------------pI1MzcG9tFV3Cgp2dtp1BQ3h--


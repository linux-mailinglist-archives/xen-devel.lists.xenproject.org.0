Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A625F0C31
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 15:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414225.658402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFnM-0007jb-79; Fri, 30 Sep 2022 13:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414225.658402; Fri, 30 Sep 2022 13:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFnM-0007ge-3I; Fri, 30 Sep 2022 13:11:12 +0000
Received: by outflank-mailman (input) for mailman id 414225;
 Fri, 30 Sep 2022 13:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oeFnK-0007gW-1n
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 13:11:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5914f574-40c1-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 15:11:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4543721901;
 Fri, 30 Sep 2022 13:11:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 059E513776;
 Fri, 30 Sep 2022 13:11:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FC12O+vqNmN6OgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 30 Sep 2022 13:11:07 +0000
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
X-Inumbo-ID: 5914f574-40c1-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664543468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FM4f4tXnXj3U/kFNpq1mFmA1c6yYY+Wn6io+sfM0N34=;
	b=tA0H2CDFor/7qw1oq9VkLVkn+QtmfE6XRpUSTlwmJi8bA8mgvk8LEyJhLgANYKDug9iBA/
	obXTOKusKzvyz5JS2Qbm4uHRzqNGMz4BoSPeUp1/hrRxyZfUl2w5NhreXE/JCfu6u8F2Bi
	q70ZPdjriYLebSzLKDJe47X29Vyey60=
Message-ID: <2e843e28-2836-910e-bcd8-f35872adf21a@suse.com>
Date: Fri, 30 Sep 2022 15:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <YzOEYsqM0UEsiFuS@zn.tnic>
 <73d8fabd-8b93-2e65-da4b-ea509818e666@suse.com>
 <24088a15-50a1-f818-8c3e-6010925bffbf@suse.com> <YzQmeh50ne8dyR2P@zn.tnic>
 <f8da6988-afa3-1e85-b47d-d91fc4113803@suse.com> <YzQui+rOGrM6otzp@zn.tnic>
 <c67d3887-498b-6e4d-857d-1cef7835421d@suse.com> <YzRyaLRqWd6YSgeJ@zn.tnic>
 <6d37c273-423c-fdce-c140-e5b90d723b9e@suse.com>
 <b707e459-4e21-80f5-c676-c275528c06ae@suse.com> <YzbZJEeVHkTnWIfc@zn.tnic>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
In-Reply-To: <YzbZJEeVHkTnWIfc@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bcOyG0ujFtoERu0bGw1r6lJq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bcOyG0ujFtoERu0bGw1r6lJq
Content-Type: multipart/mixed; boundary="------------E1J2klAWh1q7JORXFxdUMsr4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <2e843e28-2836-910e-bcd8-f35872adf21a@suse.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
References: <YzOEYsqM0UEsiFuS@zn.tnic>
 <73d8fabd-8b93-2e65-da4b-ea509818e666@suse.com>
 <24088a15-50a1-f818-8c3e-6010925bffbf@suse.com> <YzQmeh50ne8dyR2P@zn.tnic>
 <f8da6988-afa3-1e85-b47d-d91fc4113803@suse.com> <YzQui+rOGrM6otzp@zn.tnic>
 <c67d3887-498b-6e4d-857d-1cef7835421d@suse.com> <YzRyaLRqWd6YSgeJ@zn.tnic>
 <6d37c273-423c-fdce-c140-e5b90d723b9e@suse.com>
 <b707e459-4e21-80f5-c676-c275528c06ae@suse.com> <YzbZJEeVHkTnWIfc@zn.tnic>
In-Reply-To: <YzbZJEeVHkTnWIfc@zn.tnic>

--------------E1J2klAWh1q7JORXFxdUMsr4
Content-Type: multipart/mixed; boundary="------------r0LnBELVCjdRvxjqn4e77Bb0"

--------------r0LnBELVCjdRvxjqn4e77Bb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDkuMjIgMTM6NTUsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gVGh1LCBT
ZXAgMjksIDIwMjIgYXQgMTA6MjY6NTlBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+IFNvIHJpZ2h0IG5vdyBJJ20gaW5jbGluZWQgdG8gYmUgYmV0dGVyIG9uIHRoZSBzYWZl
IHNpZGUgYnkgbm90IGFkZGluZyBhbnkNCj4+IGNwdSBob3RwbHVnIGhvb2ssIGJ1dCB0byB1
c2UganVzdCB0aGUgc2FtZSAiZGVsYXllZCBBUCBpbml0IiBmbGFnIGFzIHRvZGF5LA0KPj4g
anVzdCByZW5hbWluZyBpdC4gVGhpcyB3b3VsZCBsZWF2ZSB0aGUgZGVsYXllZCBNVFJSL1BB
VCBpbml0IGluIHBsYWNlIGZvcg0KPj4gcmVzdW1lIGFuZCBrZXhlYyBjYXNlcywgYnV0IGRl
ZmVycmluZyB0aGUgTVRSUi9QQVQgY2xlYW51cCBkdWUgdG8gdGhpcw0KPj4gcG90ZW50aWFs
IGlzc3VlIHNlZW1zIG5vdCBhcHByb3ByaWF0ZSwgYXMgdGhlIGNsZWFudXAgaXNuJ3QgY2hh
bmdpbmcgdGhlDQo+PiBiZWhhdmlvciBoZXJlLg0KPiANCj4gT2ssIHdoYXQncyB3cm9uZyB3
aXRoIGFkZGluZyBhIHNwZWNpYWwgaG90cGx1ZyBsZXZlbCBqdXN0IGZvciB0aGF0IHRoaW5n
DQo+IGFuZCBydW5uaW5nIGl0IHZlcnkgZWFybHk/IFByYWN0aWNhbGx5IHByZXR0eSBtdWNo
IHdoZXJlIGl0IHdhcyBpbiB0aW1lLA0KPiBpbiBpZGVudGlmeV9zZWNvbmRhcnlfY3B1KCk/
DQoNClllcywgdGhpcyBjYW4gYmUgZG9uZS4gSXQgd291bGQgcHJhY3RpY2FsbHkgaGF2ZSB0
byBiZSB0aGUgZmlyc3Qgb25lIGp1c3QNCmFmdGVyIENQVUhQX0JSSU5HVVBfQ1BVLg0KDQpU
aGUgcXVlc3Rpb24gaXMgd2hldGhlciB3ZSByZWFsbHkgd2FudCB0byBjYWxsIHRoZSBNVFJS
L1BBVCBpbml0aWFsaXphdGlvbg0Kb24gaG90cGx1Z2dlZCBjcHVzIG9ubHkgYWZ0ZXIgZW5h
YmxpbmcgaW50ZXJydXB0cy4gTm90ZSB0aGF0IHRoZSBjYWxsYmFja3MNCmFyZSBhY3RpdmF0
ZWQgb25seSBhdCB0aGUgZW5kIG9mIHN0YXJ0X3NlY29uZGFyeSgpLCB3aGlsZSB0b2RheSBN
VFJSL1BBVA0KaW5pdGlhbGl6YXRpb24gaXMgY2FsbGVkIHNvbWUgdGltZSBlYXJsaWVyIGJ5
Og0KDQogICBzdGFydF9zZWNvbmRhcnkoKQ0KICAgICBzbXBfY2FsbGluKCkNCiAgICAgICBz
bXBfc3RvcmVfY3B1X2luZm8oKQ0KICAgICAgICAgaWRlbnRpZnlfc2Vjb25kYXJ5X2NwdSgp
DQogICAgICAgICAgIG10cnJfYXBfaW5pdCgpDQoNCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBh
IHJlYWwgcHJvYmxlbSwgYnV0IEkgd2FudGVkIHRvIG1lbnRpb24gaXQuDQoNClRoZSBuZXh0
IHF1ZXN0aW9uIHdvdWxkIGJlLCB3aHkgTVRSUi9QQVQgaW5pdCBzaG91bGQgYmUgc3BlY2lh
bCAobWVhbmluZzoNCndoeSBhcmUgYWxsIHRoZSBvdGhlciBmdW5jdGlvbnMgY2FsbGVkIHRo
YXQgZWFybHkgbm90IHJlYWxpemVkIHZpYQ0KY2FsbGJhY2tzKT8gSXMgaXQganVzdCBiZWNh
dXNlIG9mIHRoZSBzcGVjaWFsIGhhbmRsaW5nIGR1cmluZyBib290L3Jlc3VtZT8NCg0KSXQg
bWlnaHQgYmUgd29ydGggYSBkaXNjdXNzaW9uIHdoZXRoZXIgdGhlcmUgc2hvdWxkbid0IGJl
IGEgc3BlY2lhbCBncm91cA0Kb2YgY2FsbGJhY2tzIGFjdGl2YXRlZCBCRUZPUkUgaW50ZXJy
dXB0cyBhcmUgYmVpbmcgZW5hYmxlZC4NCg0KPiBIYXZpbmcgYSBzcGVjaWFsIG9uZSBpcyB3
YXJyYW50ZWQsIGFzIHlvdSBleHBsYWluLCBJJ2Qgc2F5Lg0KDQpUaGFua3MuIEknbGwgd3Jp
dGUgYSBwYXRjaCBmb3IgdGhhdC4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------r0LnBELVCjdRvxjqn4e77Bb0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r0LnBELVCjdRvxjqn4e77Bb0--

--------------E1J2klAWh1q7JORXFxdUMsr4--

--------------bcOyG0ujFtoERu0bGw1r6lJq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM26usFAwAAAAAACgkQsN6d1ii/Ey8J
zwgAgSAXDKiemWugJj/aDeRfSfU/ea6aRbt66SfEPZISqoadWEqq7HqpA6Wu/dT/U4eZvkFU2MzR
Ksa7uxVqDuesv8O02H3lymc2XSB8vUFR3sBW1yQnHnaH7rnKZiK97q/McKuBgYOHzGTZxDAffpdw
XpLgvwxyp+CnQ5lWX0OKaAzOCb88nr+PAuolzIDI6U74Dr+GJCoNSFdD83AVl1kkPk7P3zCrFo1n
WkWpaRmiD6Nj8ccIzFGFOMZrrsUzHA/uuKjWI5J+WLFPTJCqFfqTS1mG038i6qG5zAANJqLNRn9a
dSeT1G5MmH5wFuvnzLEgAvxO4W4f4SYumg3JOHibvA==
=nWua
-----END PGP SIGNATURE-----

--------------bcOyG0ujFtoERu0bGw1r6lJq--


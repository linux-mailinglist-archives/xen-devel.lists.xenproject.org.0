Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC94ABEA7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266848.460570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Rx-00037s-N3; Mon, 07 Feb 2022 12:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266848.460570; Mon, 07 Feb 2022 12:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Rx-00034X-JB; Mon, 07 Feb 2022 12:48:57 +0000
Received: by outflank-mailman (input) for mailman id 266848;
 Mon, 07 Feb 2022 12:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddl1=SW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nH3Rv-00032i-S7
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:48:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 492a5f0d-8814-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 13:48:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 203C71F37E;
 Mon,  7 Feb 2022 12:48:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDE7513BF5;
 Mon,  7 Feb 2022 12:48:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UTjWNDQVAWJEDQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Feb 2022 12:48:52 +0000
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
X-Inumbo-ID: 492a5f0d-8814-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644238133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T+yLJ1HC6XKwwdt1xrfZ5TMCElmKEFqXJba0PRNdDhY=;
	b=sbEX48MYhQz6ruqrv7fiU/UFyryCAi9f/R5cReDzKrT92zClqKGiu/gvwSZZkb09MbO9CQ
	/jDc5LlBSzHxdyMkHj9Oh6t4ZjF8riE12+3UogdRseQUeubH9olSJfJeGk9JC7+rY69UTM
	gnfL9zWRLURP3YY8gYdp3nyfcwIN0fI=
Message-ID: <cc4bfd5a-d574-7950-5638-ddac85ffe650@suse.com>
Date: Mon, 7 Feb 2022 13:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220207103613.32260-1-jgross@suse.com>
 <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
 <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
 <11b3a2be-0ca9-6464-e9a3-392f7495793e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <11b3a2be-0ca9-6464-e9a3-392f7495793e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CAE4S9venc9Dn8tyZe5JsY2J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CAE4S9venc9Dn8tyZe5JsY2J
Content-Type: multipart/mixed; boundary="------------OAAhB8NlPwxY2Eqoyt80ZwXi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <cc4bfd5a-d574-7950-5638-ddac85ffe650@suse.com>
Subject: Re: [PATCH] xen/public: partially revert commit 7c7f7e8fba01
References: <20220207103613.32260-1-jgross@suse.com>
 <c2c185cb-2368-cd61-df72-7792b075746e@suse.com>
 <9bba716a-8ea3-a104-65d4-28d62f69f22b@suse.com>
 <11b3a2be-0ca9-6464-e9a3-392f7495793e@suse.com>
In-Reply-To: <11b3a2be-0ca9-6464-e9a3-392f7495793e@suse.com>

--------------OAAhB8NlPwxY2Eqoyt80ZwXi
Content-Type: multipart/mixed; boundary="------------QiXcbOXLxRXa0JvEo2YoSUMp"

--------------QiXcbOXLxRXa0JvEo2YoSUMp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDIuMjIgMTM6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMi4yMDIy
IDEyOjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDIuMjIgMTE6NDYsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTE6MzYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPj4+
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4+Pj4gQEAgLTY2Miw3ICs2
NjIsMTcgQEAgc3RydWN0IHhlbl9tZW1fYWNxdWlyZV9yZXNvdXJjZSB7DQo+Pj4+ICAgICAg
ICAgKiB0d28gY2FsbHMuDQo+Pj4+ICAgICAgICAgKi8NCj4+Pj4gICAgICAgIHVpbnQzMl90
IG5yX2ZyYW1lczsNCj4+Pj4gLSAgICB1aW50MzJfdCBwYWQ7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICAvKg0KPj4+PiArICAgICAqIE9VVCAtIE11c3QgYmUgemVybyBvbiBlbnRyeS4gT24gcmV0
dXJuIHRoaXMgbWF5IGNvbnRhaW4gYSBiaXR3aXNlDQo+Pj4+ICsgICAgICogICAgICAgT1Ig
b2YgdGhlIGZvbGxvd2luZyB2YWx1ZXMuDQo+Pj4+ICsgICAgICovDQo+Pj4+ICsgICAgdWlu
dDMyX3QgZmxhZ3M7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBObyBsb25nZXIgc3VwcG9ydGVk
IC0gd2lsbCBiZSBuZXZlciBzZXQgKi8NCj4+Pj4gKyNkZWZpbmUgX1hFTk1FTV9yc3JjX2Fj
cV9jYWxsZXJfb3duZWQgMA0KPj4+PiArI2RlZmluZSBYRU5NRU1fcnNyY19hY3FfY2FsbGVy
X293bmVkICgxdSA8PCBfWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCkNCj4+Pg0KPj4+
IEkgdGhpbmsgdGhpcyBnb2VzIHRvbyBmYXI6IE5laXRoZXIgZG8gd2Ugd2FudCB0byByZS1p
bnRyb2R1Y2UgdGhlDQo+Pj4gI2RlZmluZS1zLCBub3Igc2hvdWxkIHdlIHJlLWZpeCB0aGUg
cHVycG9zZSBvZiB0aGUgcGFkZGluZyBmaWVsZA0KPj4+IHRvIGJlIE9VVCAob25seSkuIEFs
bCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSBpcyB0aGF0IHRoZSBmaWVsZA0KPj4+IGNvbWluZyBp
biBhcyB6ZXJvIHdvbid0IGdldCByZXNwb25kZWQgdG8gYnkgc2V0dGluZyBiaXQgMCBvZiBp
dC4NCj4+PiBJbW8gdGhpcyBjYW4gb25seSByZWFzb25hYmx5IGJlIGRvbmUgYnkgd2F5IG9m
IGFkZGluZyBhIGNvbW1lbnQuDQo+Pj4gVGhpcyBjb21tZW50IG1heSwgaW4gdHVybiwgbWVu
dGlvbiBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkDQo+Pj4gb2YgY291cnNlLg0KPj4N
Cj4+IFRoZSBrZXJuZWwgY291bGQgYmUgY2hhbmdlZCB0byBubyBsb25nZXIgdXNlIHRoYXQg
I2RlZmluZSBiZWZvcmUNCj4+IHVwZGF0aW5nIHRoZSBoZWFkZXIgZnJvbSBYZW4sIGJ1dCBh
cmUgd2UgcmVhbGx5IHN1cmUgdGhlcmUgYXJlIG5vDQo+PiBvdGhlciB1c2VycywgdG9vPw0K
PiANCj4gUHJldHR5IHN1cmUuIEFuZCBJIHRoaW5rIGluIHRoaXMgY2FzZSBpdCdzIGJldHRl
ciB0byBicmVhayB0aGUgYnVpbGQNCj4gb2YgY29uc3VtZXJzIChzbyB3ZSdyZSBzdXJlIHRo
ZXknZCBub3RpY2UsIGFzc3VtaW5nIHRoZXkgaW1wb3J0IHRoZQ0KPiBoZWFkZXIgZGlyZWN0
bHkgaW4gdGhlIGZpcnN0IHBsYWNlKS4gSXQncyByYXRoZXIgYW4gZXhjZXB0aW9uYWwgY2Fz
ZQ0KPiBhZnRlciBhbGwuDQoNCk9rYXksIEknbGwganVzdCBhZGQgYSBjb21tZW50IHJlZ2Fy
ZGluZyB0aGUgcmVzZXJ2ZWQgYml0IHRoZW4sIHdpdGhvdXQNCnJldmVydGluZyBhbnkgcGFy
dCBvZiBjb21taXQgN2M3ZjdlOGZiYTAxLg0KDQoNCkp1ZXJnZW4NCg==
--------------QiXcbOXLxRXa0JvEo2YoSUMp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QiXcbOXLxRXa0JvEo2YoSUMp--

--------------OAAhB8NlPwxY2Eqoyt80ZwXi--

--------------CAE4S9venc9Dn8tyZe5JsY2J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIBFTQFAwAAAAAACgkQsN6d1ii/Ey89
Dwf7BIQwwDWqwXJF7WvPjnLsuxUbryPjaRFn6L3iEFD3SfAL8ALSWpVh8EM/Q11DnnJxEYsOxnVJ
igzv/CPVX5/kgX0exGH6FsWK3HV4x5i7L4GHctXXcBhu1PwXqSCNuVsedGCP16mM236OnTer7h5V
kA3HlO3P1wFc8fwkNcC/bpb8tcUnrfj+VYfxqpDqFyyxFjRLU1FYfajRTO/8K+tRFjBhdfxVjWPo
Qqvj3tVNpMBsP1BRFsvkmVq0M5pFNCqC1Zsz/v57UsJOqpIRLSLdkYWCbyooOl5x9+uA5P8aMqum
oKT11hW6lodJipC/zm25WV/VRlLDRDqx4AMeUIOnhQ==
=vnKt
-----END PGP SIGNATURE-----

--------------CAE4S9venc9Dn8tyZe5JsY2J--


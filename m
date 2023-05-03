Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF76F5A63
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529270.823479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDmd-0004fO-Rg; Wed, 03 May 2023 14:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529270.823479; Wed, 03 May 2023 14:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDmd-0004d2-OY; Wed, 03 May 2023 14:48:43 +0000
Received: by outflank-mailman (input) for mailman id 529270;
 Wed, 03 May 2023 14:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puDmc-0004cq-IS
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:48:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98322c7d-e9c1-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 16:48:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DBDC02047A;
 Wed,  3 May 2023 14:48:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B603F1331F;
 Wed,  3 May 2023 14:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KQoOK0h0UmTkTwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 14:48:40 +0000
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
X-Inumbo-ID: 98322c7d-e9c1-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683125320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hB2lLaG8pUH5+daj/u8rW0lInWwuo6ot3NYeUtBZcfQ=;
	b=aAuHV+So7HcZC1mPG1MTlnbtcrlCdf9Pdwsh/uoKLlUK9VEwJCUvjAvdLPK1cYHbE6gXBl
	EK0GWD3CFjpkm7Z+/qG8ML+IVxxExUaY8MXcqIYXRQ4/n1ZnR3M26wt5QuMm0//IV2eKbG
	ICV4CCY67zWjsFlGM61pvQqVM8otsmg=
Message-ID: <991a003c-fc7e-f922-6a5c-9a8d75c543db@suse.com>
Date: Wed, 3 May 2023 16:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 04/13] tools/xenstore: let hashtable_insert() return 0
 on success
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-5-jgross@suse.com>
 <d918cc78-de22-9599-9a91-f6c11028d11b@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <d918cc78-de22-9599-9a91-f6c11028d11b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I4fGrNu5OMWFyWrFpZNunVy4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I4fGrNu5OMWFyWrFpZNunVy4
Content-Type: multipart/mixed; boundary="------------6oQMX19aK3dEXiLiQ4sh08Cc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <991a003c-fc7e-f922-6a5c-9a8d75c543db@suse.com>
Subject: Re: [PATCH v2 04/13] tools/xenstore: let hashtable_insert() return 0
 on success
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-5-jgross@suse.com>
 <d918cc78-de22-9599-9a91-f6c11028d11b@xen.org>
In-Reply-To: <d918cc78-de22-9599-9a91-f6c11028d11b@xen.org>

--------------6oQMX19aK3dEXiLiQ4sh08Cc
Content-Type: multipart/mixed; boundary="------------zN0jWzD3yow0FXWGwseRoJWV"

--------------zN0jWzD3yow0FXWGwseRoJWV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTU6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAzMC8wMy8yMDIzIDA5OjUwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgaGFz
aHRhYmxlX2luc2VydCgpIHJldHVybnMgMCBpbiBjYXNlIG9mIGFuIGVycm9yLiBDaGFuZ2Ug
dGhhdCB0bw0KPj4gbGV0IGl0IHJldHVybiBhbiBlcnJubyB2YWx1ZSBpbiB0aGUgZXJyb3Ig
Y2FzZSBhbmQgMCBpbiBjYXNlIG9mIHN1Y2Nlc3MuDQo+IA0KPiBJIHVzdWFsbHkgZmluZCBz
dWNoIGNoYW5nZSByaXNreSBiZWNhdXNlIGl0IG1ha2VzIHRoZSBiYWNrcG9ydCBtb3JlIGNv
bXBsZXggaWYgDQo+IHdlIGludHJvZHVjZSBhIG5ldyBjYWxsIHRvIGhhc2h0YWJsZV9pbnNl
cnQoKSBhbmQgaXQgaXMgYWxzbyBxdWl0ZSBkaWZmaWN1bHQgdG8gDQo+IHJldmlldyAodGhl
IGNvbXBpbGVyIHdvdWxkIG5vdCBoZWxwIHRvIGNvbmZpcm0gYWxsIHRoZSBjYWxsZXJzIGhh
dmUgY2hhbmdlZCkuDQo+IA0KPiBTbyBjYW4geW91IHByb3ZpZGUgYSBjb21wZWxsaW5nIHJl
YXNvbiBmb3IgZG9pbmcgdGhlIGNoYW5nZT8gKGNvbnNpc3RlbmN5IHdvdWxkIA0KPiBub3Qg
YmUgb25lIElNTykNCg0KVGhlIG1vdGl2YXRpb24gd2FzIGNvbnNpc3RlbmN5LiA6LSkNCg0K
VGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIHJlYWxseSBzZXQgZXJybm8gaW4gdGhlIGVy
cm9yIGNhc2UsIHdoaWNoDQp3b3VsZCBhZGQgYWRkaXRpb25hbCBsaW5lcy4NCg0KSSdtIG5v
dCByZWFsbHkgZmVlbGluZyBzdHJvbmcgaGVyZSwgQlRXLg0KDQoNCkp1ZXJnZW4NCg0K
--------------zN0jWzD3yow0FXWGwseRoJWV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zN0jWzD3yow0FXWGwseRoJWV--

--------------6oQMX19aK3dEXiLiQ4sh08Cc--

--------------I4fGrNu5OMWFyWrFpZNunVy4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSdEgFAwAAAAAACgkQsN6d1ii/Ey8A
cwf+IpaXsnTe8X6ponzYHoHUEwlFAKBgwOiMKgF4xpAJOO683wVsgnmFHhnWvcGTEXYMdRAr5q6o
23+0XGVeVj2omMaBbIzmurEVN5joJfCDa61gQ7WGUQ/xcgBkTAfQCFR9vOb+kOZykyPsnv79Hhw4
Rn01vm1JGFowzoXxL3oUeqT5SSZIUZlMRsj/wzVBFpOjjS+XYKyW764UMkT0eS5Zam4hg1Tp56lu
4vJNsAik1t7IJ8KVjiOXfvS2yKE8jO+o7qaF3RYo7+4gTmqOS6coJ7ASsCWBHLv34ivLCM2pRUMg
7Qdq6Z+6g5DaPIuguuDD5edffmymCo743rerPVqIwg==
=4IAH
-----END PGP SIGNATURE-----

--------------I4fGrNu5OMWFyWrFpZNunVy4--


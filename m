Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED015B55DA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405527.647960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeh0-0001z3-0v; Mon, 12 Sep 2022 08:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405527.647960; Mon, 12 Sep 2022 08:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXegz-0001wG-U1; Mon, 12 Sep 2022 08:21:21 +0000
Received: by outflank-mailman (input) for mailman id 405527;
 Mon, 12 Sep 2022 08:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXegy-0001w8-Um
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:21:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1144e1b-3273-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 10:21:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E6A0226CE;
 Mon, 12 Sep 2022 08:21:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2782A139E0;
 Mon, 12 Sep 2022 08:21:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X2XrB//rHmNsJgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 08:21:19 +0000
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
X-Inumbo-ID: e1144e1b-3273-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662970879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7vmXbjdXLGxV9NpKCL417Hzt61WIiRyvRp+kk2oMR3s=;
	b=EDT8ela3CEBzqspkmYRt5qOqkyHcp74fXIE7PLYK9cX7qyh1CgmkisA/mQGO1yCrV33Syu
	pP7SfBrguPlMLHxHecFM5u6ERUKwpSJibGH+0RTDl/H/IIKkDtMjqWObEhRbPGazSXQ4Da
	PmFh5euXuF7ejlpHeUeIszLRhvFmvXM=
Message-ID: <20d6999d-abd7-3d5c-7203-1bf986159f3b@suse.com>
Date: Mon, 12 Sep 2022 10:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] xen/gnttab: reduce size of struct active_grant_entry
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-3-jgross@suse.com>
 <2241c6e3-74fd-55f3-6de3-93f3733baf2c@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2241c6e3-74fd-55f3-6de3-93f3733baf2c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NG207YcL0IUjp5jQCQVpNp5q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NG207YcL0IUjp5jQCQVpNp5q
Content-Type: multipart/mixed; boundary="------------yiSQ76pz30eAViSuijKCHTRq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <20d6999d-abd7-3d5c-7203-1bf986159f3b@suse.com>
Subject: Re: [PATCH 2/2] xen/gnttab: reduce size of struct active_grant_entry
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-3-jgross@suse.com>
 <2241c6e3-74fd-55f3-6de3-93f3733baf2c@suse.com>
In-Reply-To: <2241c6e3-74fd-55f3-6de3-93f3733baf2c@suse.com>

--------------yiSQ76pz30eAViSuijKCHTRq
Content-Type: multipart/mixed; boundary="------------QPqB0Fe9zFfMC2fiFeCqAcOg"

--------------QPqB0Fe9zFfMC2fiFeCqAcOg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjIgMTA6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wOS4yMDIy
IDA3OjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIHNpemUgb2Ygc3RydWN0IGFj
dGl2ZV9ncmFudF9lbnRyeSBmb3IgNjQtYml0IGJ1aWxkcyBpcyA0MCBvciA0OA0KPj4gYnl0
ZXMgdG9kYXkgKHdpdGggb3Igd2l0aG91dCBOREVCVUcpLg0KPiANCj4gLi4uIGFuZCBsZWF2
aW5nIGFzaWRlIERFQlVHX0xPQ0tTIC8gREVCVUdfTE9DS19QUk9GSUxFLg0KDQpPbmx5IGxl
YXZpbmcgYXNpZGUgREVCVUdfTE9DS19QUk9GSUxFLiBERUJVR19MT0NLUyBkb2Vzbid0IG1h
dHRlciByZWdhcmRpbmcNCnN0cnVjdCBhY3RpdmVfZ3JhbnRfZW50cnkgc2l6ZS4NCg0KPiAN
Cj4+IEl0IGNhbiBlYXNpbHkgYmUgcmVkdWNlZCBieSA4IGJ5dGVzIGJ5IHJlcGxhY2luZyB0
aGUgdHJhbnNfZG9tYWluDQo+PiBwb2ludGVyIHdpdGggdGhlIGRvbWlkIG9mIHRoZSByZWxh
dGVkIGRvbWFpbi4gdHJhbnNfZG9tYWluIGlzIG9ubHkgZXZlcg0KPj4gdXNlZCBmb3IgdHJh
bnNpdGl2ZSBncmFudHMsIHdoaWNoIGxhc3Qga25vd24gdXNlciBoYXMgYmVlbiB0aGUgb2xk
DQo+PiBYZW5vbGludXggYnJhbmNoIG9mIHRoZSBMaW51eCBrZXJuZWwuDQo+IA0KPiBUaGF0
IHRyZWUgdXNlZCBncmFudCB0cmFuc2ZlcnMsIGJ1dCBJJ20gdW5hd2FyZSBvZiAoYWN0dWFs
KSB1c2VzIG9mDQo+IHRyYW5zaXRpdmUgZ3JhbnRzOyB0aGVyZSBtYXkgaGF2ZSBiZWVuIGNv
ZGUgdGhlcmUgdG8gYWxsb3cgdGhlaXINCj4gdXNlLCBidXQgaWlyYyB0aGF0IHdvdWxkIHRo
ZW4gbm90IGhhdmUgaGFkIGFueSB1c2Vycy4gT3IgYW0gSQ0KPiBtaXMtcmVtZW1iZXJpbmc/
DQoNCk9oLCBtYXliZSBJIG1peGVkIHRob3NlIHR3byBjYXNlcyB1cC4NCg0KPj4gLS0tIGEv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMNCj4+IEBAIC0zODEsMTMgKzM4MSwxMyBAQCBzdHJ1Y3QgYWN0aXZlX2dyYW50X2Vu
dHJ5IHsNCj4+ICAgfSkNCj4+ICAgDQo+PiAgICAgICBkb21pZF90ICAgICAgIGRvbWlkOyAg
LyogRG9tYWluIGJlaW5nIGdyYW50ZWQgYWNjZXNzLiAgICAgICAgICAgICAqLw0KPj4gKyAg
ICBkb21pZF90ICAgICAgIHRyYW5zX2RvbWlkOyAvKiBEb21haW4gZ3JhbnRpbmcgYWNjZXNz
LiAgICAgICAgICAgICAqLw0KPiANCj4gSSdtIGFmcmFpZCBJIGNvbnNpZGVyIHRoZSBjb21t
ZW50IG1pc2xlYWRpbmcgYW5kIG5vdCBpbiBsaW5lIHdpdGgNCj4gZmllbGQgbmFtZS4gRm9y
IG5vcm1hbCBncmFudHMgdGhpcyBpcyBtZXJlbHkgdGhlICJzb3VyY2UiIGRvbWFpbg0KPiAo
aS5lLiAiZ3JhbnRpbmciIGluIHRoZSBjb21tZW50IGlzIGNvcnJlY3QsIGJ1dCAidHJhbnMi
IGluIHRoZQ0KPiBuYW1lIGlzbid0KSwgd2hpbGUgZm9yIHRyYW5zaXRpdmUgZ3JhbnRzIHRo
ZXJlIGFyZSB0d28gZG9tYWlucw0KPiBncmFudGluZyBhY2Nlc3MuIFRoZXJlZm9yZSBtYXkg
SSBzdWdnZXN0IHRvIHVzZSBzcmNfZG9taWQgb3INCj4gb3JpZ19kb21pZCwgb3Igb3RoZXJ3
aXNlIG9taXQgdGhlIGNvbW1lbnQgKGp1c3QgbGlrZSB0aGVyZSB3YXMNCj4gbm9uZSBvcmln
aW5hbGx5KT8NCg0KSSdkIHByZWZlciB0aGUgcmVuYW1lIHRvIHNyY19kb21pZCAob3JpZ19k
b21pZCBzb3VuZHMgZm9yIG1lIGxpa2UgYW4gb2xkDQp2YWx1ZSBvZiBkb21pZCkuDQoNCg0K
SnVlcmdlbg0K
--------------QPqB0Fe9zFfMC2fiFeCqAcOg
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QPqB0Fe9zFfMC2fiFeCqAcOg--

--------------yiSQ76pz30eAViSuijKCHTRq--

--------------NG207YcL0IUjp5jQCQVpNp5q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMe6/4FAwAAAAAACgkQsN6d1ii/Ey9G
lQf+JG40vDsudt8mAkX9ZmYZbEhgqOVaGHX7i0zX5sGVNzBqvyYB6B3jneMJGNSlJyLing4M3gXA
bs/ghqEuzagulZ7Ujg6xKt/ucai21d+tqhnEG2NBxxwhnQIaRwdAIXmWjYHl0xW4gw67THfHPilm
Fhbi1qsYhidIiTHbuRXhRRmx0UBN1kPp2e2b6ebbwS4bH0OKX/Wih9sy8sSkiwcoapdG0LcT+PXo
fE147Ava6XXDG5Iat0sH3zFaOg03MYamMiHXoxNPjg4GZc7obQlg8b3Kfw5/KIzUDl3+5s2dRCM0
khRGhZfbP22YHbix7NeqxhVdzOu6OI2lVWkAcBD67A==
=3XlP
-----END PGP SIGNATURE-----

--------------NG207YcL0IUjp5jQCQVpNp5q--


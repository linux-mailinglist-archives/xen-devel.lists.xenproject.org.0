Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541CF68F1E2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 16:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491882.761227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmFO-0006Fm-FK; Wed, 08 Feb 2023 15:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491882.761227; Wed, 08 Feb 2023 15:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPmFO-0006Cs-Bq; Wed, 08 Feb 2023 15:20:34 +0000
Received: by outflank-mailman (input) for mailman id 491882;
 Wed, 08 Feb 2023 15:20:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pPmFN-0006Cm-23
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 15:20:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fdf9b94-a7c4-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 16:20:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E7DA1FE93;
 Wed,  8 Feb 2023 15:20:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 701B513425;
 Wed,  8 Feb 2023 15:20:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hO6lGb6942M4PQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Feb 2023 15:20:30 +0000
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
X-Inumbo-ID: 1fdf9b94-a7c4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675869630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNudGKwfWz2Qi9qUZWYX4r6w5ISOHAiaiJecluurz8Q=;
	b=Q7SvzmiLbf/F+8FfSiba+wJUWsDhLkRsb1/iuTDE5ApMh+1QPKoMJnnoJw3HfeeH84I+Up
	uqBGezGdkp/sO16kMNua9mDdzKJslfjz52FA8Pu6Y/0SDjg/MfeHGq/1az7auPGIscDnIZ
	mYFwxWG5NpFfcpfNcyJ8VZ4GFZv4OSM=
Message-ID: <6a141dab-aef8-960d-269d-23f8000a257d@suse.com>
Date: Wed, 8 Feb 2023 16:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to
 provide library flags only.
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-6-anthony.perard@citrix.com>
 <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>
 <Y+O7WntT11toKyH/@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Y+O7WntT11toKyH/@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3XYzH0xAdv2HzJAOc6ANiMLK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3XYzH0xAdv2HzJAOc6ANiMLK
Content-Type: multipart/mixed; boundary="------------LCfy9ydGsVF7jbzK000cXc0t";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <6a141dab-aef8-960d-269d-23f8000a257d@suse.com>
Subject: Re: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to
 provide library flags only.
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-6-anthony.perard@citrix.com>
 <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>
 <Y+O7WntT11toKyH/@perard.uk.xensource.com>
In-Reply-To: <Y+O7WntT11toKyH/@perard.uk.xensource.com>

--------------LCfy9ydGsVF7jbzK000cXc0t
Content-Type: multipart/mixed; boundary="------------NGeQ0T0Ln0Bk0r7ebsQeeLuP"

--------------NGeQ0T0Ln0Bk0r7ebsQeeLuP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDIuMjMgMTY6MTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIEZl
YiAwOCwgMjAyMyBhdCAwODo0ODozM0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMjAuMDEuMjMgMjA6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IExETElC
UyBpcyB1c3VhbGx5IG9ubHkgdGhlIGxpYnJhcnkgZmxhZ3MgKHRoYXQgaXMgdGhlIGAtbGAg
ZmxhZ3MpLCBhcw0KPj4+IHByb3Bvc2VkIGluIEdOVSBtYWtlIG1hbnVhbCwgd2hpbGUgTERG
TEFHUyB3b3VsZCBiZSBleHRyYSBmbGFncyBzdWNoDQo+Pj4gYXMgYC1MYC4NCj4+Pg0KPj4+
IFJld29yayB0aGUgbWFrZSBtYWNybyAkKHhlbmxpYnMtbGRsaWJzLCApIHRvIG9ubHkgcHJv
dmlkZSB0aGUgbGlicmFyeQ0KPj4+IGZsYWdzLiAkKHhlbmxpYnMtbGRmbGFncywgKSBhbHJl
YWR5IG9ubHkgcHJvdmlkZSB0aGUgZXh0cmEgZmxhZ3MgbGlrZQ0KPj4+IHRoZSAtcnBhdGgt
bGluayBmbGFncy4NCj4+Pg0KPj4+IEFsc28gZml4ICJ0ZXN0XyUiIHJlY2lwZSBpbiBsaWJz
L2xpZ2h0IGFzICJsaWJ4ZW5saWdodC5zbyIgaW4NCj4+PiAkKExETElCU19saWJ4ZW5saWdo
dCkgaXMgYmVlbiByZXBsYWNlZCBieSAiLWx4ZW5saWdodCIuIEluc3RlYWQgb2YNCj4+PiBq
dXN0IGNoYW5naW5nIHRoZSBmaWx0ZXIsIHdlIHdpbGwgc3RhcnQgdXNpbmcgdGhlICQoeGVu
bGlicy0qLCkgbWFjcm8uDQo+Pj4gRm9yIExERkxBR1MsIHdlIG9ubHkgbmVlZHMgdGhlIG9u
ZSBmb3IgbGlieGVubGlnaHQsIGFzIHRoZSBvbmUgZm9yDQo+Pg0KPj4gbml0OiBzL25lZWRz
L25lZWQvDQo+Pg0KPj4+IHRvb2xjb3JlIGFuZCB0b29sbG9nIGFyZSBhbHJlYWR5IGluICQo
TERGTEFHUyksIHRoZXkgYXJlIGRlcGVuZGVuY2llcw0KPj4+IHRvIGJ1aWxkIGxpYnhlbmxp
Z2h0LnNvLg0KPj4NCj4+IEkgZG9uJ3QgbGlrZSB0aGlzIHZlcnkgbXVjaC4gdG9vbGNvcmUg
YW5kIHRvb2xsb2cgYXJlIHVzZWQgZGlyZWN0bHkgYnkNCj4+IHRoZSB0ZXN0XyUgcHJvZ3Jh
bXMsIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHJlbHkgb24gbGlieGVubGlnaHQNCj4+
IGRlcGVuZGluZyBvbiB0aGVtLg0KPiANCj4gT2ssIEkgY2FuIGFkZCB0aGVtIGJhY2ssIGl0
IGlzbid0IG11Y2ggb2YgYW4gaXNzdWUgdG8gaGF2ZSBkdXBsaWNhdGVkDQo+IGZsYWdzIG9u
IHRoZSBjb21tYW5kIGxpbmUuDQoNCkluIHRoYXQgY2FzZSB5b3UgY2FuIGFkZCBteQ0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg0K
--------------NGeQ0T0Ln0Bk0r7ebsQeeLuP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NGeQ0T0Ln0Bk0r7ebsQeeLuP--

--------------LCfy9ydGsVF7jbzK000cXc0t--

--------------3XYzH0xAdv2HzJAOc6ANiMLK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPjvb4FAwAAAAAACgkQsN6d1ii/Ey/c
NggAnsThHSKs11L8Gg/65yMm/QFoXIGuJVVYtrqerdkhy+Pd8WdGrGbyUS9YMFCdMMAZPjQhZM5i
zihP9uP6JX1sn83JFlP4dOAU3onPEDDc7v2A92ZbQiYf8xIFlTvaIBG+6puIw226Buev7Aim0R36
c6yyNp3vOJ4zaw22h1HuW5Tb07RcFbkFphXvUcrFkMpQ/lPw8HncRk3vTBMi1y5LeRR7+VYzfKps
pcCjjEwJKNYNvMrssWibpuN5NoV2pNs+HCFiL8bCdpHRFs9GUOa7c41NXheL65jRlpaHn3AQfngO
rLzXDgISvBT/tdXJUjbIWt3BBpHrUEQiJxz7PERrig==
=231C
-----END PGP SIGNATURE-----

--------------3XYzH0xAdv2HzJAOc6ANiMLK--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC40B59F89A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392470.630837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoYX-0000tT-NX; Wed, 24 Aug 2022 11:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392470.630837; Wed, 24 Aug 2022 11:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoYX-0000r5-KY; Wed, 24 Aug 2022 11:28:21 +0000
Received: by outflank-mailman (input) for mailman id 392470;
 Wed, 24 Aug 2022 11:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQoYW-0000qz-Op
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 11:28:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9c871a-239f-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 13:28:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E51A8336A7;
 Wed, 24 Aug 2022 11:28:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 918F113780;
 Wed, 24 Aug 2022 11:28:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4sscIlILBmNqNQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 11:28:18 +0000
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
X-Inumbo-ID: da9c871a-239f-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661340498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+pWZEMJHDDWvoypE91ZsNAUt0AldcHG+mqtHsHy8fwk=;
	b=cOjJQVrff3Gs74i4lr/D6Z+98mSt6h9a4w0tpdSEbshftcotbBsPm8mM1K6tWpxMOh9bGG
	rAuEQLgxCdpBjUwS5N775jyzPs1lwW6n78yVQAJy6ceAR6BjmNEvWTQfHUnMaeNIr7C/SO
	V0FiTjgfDOt7QjflYNfBVpcGROzPdHg=
Message-ID: <be746029-d140-78e2-5c67-2913236eadfb@suse.com>
Date: Wed, 24 Aug 2022 13:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
 <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
 <6c29aab9-2d8b-44a2-d6c8-3316ac437c1e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <6c29aab9-2d8b-44a2-d6c8-3316ac437c1e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JW0Qn0KteBHamQA22KGnDhjT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JW0Qn0KteBHamQA22KGnDhjT
Content-Type: multipart/mixed; boundary="------------AIR7bT7dpPwi8GjpaQaqKiT0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <be746029-d140-78e2-5c67-2913236eadfb@suse.com>
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
 <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
 <6c29aab9-2d8b-44a2-d6c8-3316ac437c1e@suse.com>
In-Reply-To: <6c29aab9-2d8b-44a2-d6c8-3316ac437c1e@suse.com>

--------------AIR7bT7dpPwi8GjpaQaqKiT0
Content-Type: multipart/mixed; boundary="------------ftCogh8QRgrursOUE0LUxrk9"

--------------ftCogh8QRgrursOUE0LUxrk9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTM6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDIy
IDEyOjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjQuMDguMjIgMTI6MzUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjA4LjIwMjIgMTI6MjIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEhpdHRpbmcgYW4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaXMgYWx3
YXlzIHdyb25nLCBzbyBldmVuIGluIHByb2R1Y3Rpb24NCj4+Pj4gYnVpbGRzIGEgd2Fybmlu
ZyBzZWVtcyB0byBiZSBhcHByb3ByaWF0ZSB3aGVuIGhpdHRpbmcgb25lLg0KPj4+DQo+Pj4g
SSBkaXNhZ3JlZSwgZm9yIHR3byByZWFzb25zOiBUaGlzIHZpb2xhdGVzIHRoZSBpbXBsaWNh
dGlvbiBvZiBOREVCVUcNCj4+PiBtZWFuaW5nIEFTU0VSVCgpIGFuZCBmcmllbmRzIGV4cGFu
ZCB0byBubyBhY3R1YWwgY29kZS4gUGx1cyBpZiBkb2luZyBzbw0KPj4NCj4+IFRoaXMgaXMg
c29tZXRoaW5nIHdlIGNhbiBjaGFuZ2UgSU1ITy4NCj4+DQo+Pj4gZm9yIEFTU0VSVF9VTlJF
QUNIQUJMRSgpLCB3aHkgd291bGQgd2Ugbm90IGRvIHRoZSBzYW1lIGZvciBBU1NFUlQoKT8N
Cj4+DQo+PiBUaGVyZSBhcmUgbXVsdGlwbGUgcmVhc29ucyB0byBoYXZlIEFTU0VSVCgpcy4g
U29tZSBzZXJ2ZSBhcyBhIGtpbmQgb2YNCj4+IGRvY3VtZW50YXRpb24gKGUuZy4gdG8gZG9j
dW1lbnQgdGhhdCB0aGUgcHJvZ3JhbW1lciB0aG91Z2h0IG9mIGEgc3BlY2lhbA0KPj4gY2Fz
ZSBub3QgYmVpbmcgcG9zc2libGUpLCBvciB0aGV5IGFyZSBtZWFudCB0byBjYXRjaCBoYXJk
IHRvIGRpYWdub3NlDQo+PiBidWdzIHJhdGhlciBlYXJseSBpbnN0ZWFkIG9mIGxldHRpbmcg
dGhlbSBoaXQgbGF0ZXIgaW4gYSBzaXR1YXRpb24gd2hlcmUNCj4+IGl0IHdvdWxkbid0IGJl
IGNsZWFyIHdoYXQgY2F1c2VkIHRoZW0uIEFkZGluZyBhIFdBUk4oKSBmb3IgYWxsIG9mIHRo
ZXNlDQo+PiBjYXNlcyBpc24ndCByZWFsbHkgYXBwcm9wcmlhdGUsIGVzcGVjaWFsbHkgYXMg
dGhpcyBtaWdodCBpbXBhY3QNCj4+IHBlcmZvcm1hbmNlIGR1ZSB0byBhZGRlZCB0ZXN0cywg
d2hpY2ggaXNuJ3QgdGhlIGNhc2UgZm9yIHRoZW9yZXRpY2FsbHkNCj4+IHVucmVhY2hhYmxl
IGNvZGUuDQo+Pg0KPj4+IFRoZXJlJ3MgYSByZWFzb24gd2UgaGF2ZSBBU1NFUlQoKSBhbmQg
ZnJpZW5kcyBhbmQsIGluZGVwZW5kZW50bHksDQo+Pj4gV0FSTl9PTigpIC8gQlVHX09OKCkg
ZXQgYWwuDQo+Pg0KPj4gV2UgbWlnaHQgd2FudCB0byBpbnRyb2R1Y2Ugc29tZXRoaW5nIGxp
a2UgQVNTRVJUX09SX1dBUk4oKS4gSSdtIHN1cmUNCj4+IHRoaXMgY291bGQgYmUgdXNlZnVs
IGluIHNvbWUgY2FzZXMuDQo+IA0KPiBJJ20gY3VyaW91cyB3aHkgaW4gc3VjaCBjYXNlcyBp
dCBjYW4ndCBqdXN0IGJlIFdBUk5fT04oKS4NCg0KSXQgd29uJ3QgcmVzdWx0IGluIHRlc3Qg
ZmFpbHVyZSBvZiBkZWJ1ZyBidWlsZHMuDQoNCkluIHRoZSBlbmQgSSdtIG5vdCBmZWVsaW5n
IHJlYWxseSBzdHJvbmcgaGVyZSwgc28gSSdtIGZpbmUgdG8gZHJvcCB0aGlzDQpwYXRjaC4N
Cg0KDQpKdWVyZ2VuDQo=
--------------ftCogh8QRgrursOUE0LUxrk9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ftCogh8QRgrursOUE0LUxrk9--

--------------AIR7bT7dpPwi8GjpaQaqKiT0--

--------------JW0Qn0KteBHamQA22KGnDhjT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMGC1IFAwAAAAAACgkQsN6d1ii/Ey+T
bgf/fd6hhyh5Q4qCNd7BMHiY5uDftrQlnxaTwsynpxi/HNTTwWajB9y1tg1Y+EmQEKPrfpu7MCc0
1mboPQSCsd8rV/kF4LLjhcALTcetfqmJc43Xkm0DI8p+d6f+s3adOYi/Djhub8vHCwfmuLqHv9ex
eG0R4mx+uWJjuVg33XdzykADiMp/P4dXrgB8OeYYYDl6jXF4tlmPG7COma7h/VHQ4TZxVuMd7VOd
oE2RJ1h025NFC6hC404ON2JWywJZW2+agsYXITlsdBpcsrbAQ0kpRdoBnMdRgvXklukBuT2SknU1
nymZMWLlemzmmkK9HTAKuenoDM2YMHhgRjco+JcsfQ==
=cCZv
-----END PGP SIGNATURE-----

--------------JW0Qn0KteBHamQA22KGnDhjT--


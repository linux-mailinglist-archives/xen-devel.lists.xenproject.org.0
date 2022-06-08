Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193C54214D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 07:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343667.569108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyoNV-00070B-DW; Wed, 08 Jun 2022 05:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343667.569108; Wed, 08 Jun 2022 05:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyoNV-0006vq-9f; Wed, 08 Jun 2022 05:37:13 +0000
Received: by outflank-mailman (input) for mailman id 343667;
 Wed, 08 Jun 2022 05:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dgi5=WP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nyoNT-0006t8-P5
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 05:37:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae79603-e6ed-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 07:37:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CAD121A6B;
 Wed,  8 Jun 2022 05:37:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F07D13638;
 Wed,  8 Jun 2022 05:37:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Su0UCoY1oGIDcAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Jun 2022 05:37:10 +0000
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
X-Inumbo-ID: 0ae79603-e6ed-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654666630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/FPclAX4SEQhI3WAYAvS5WpRBi4c3ovJp5fbx59ihQ=;
	b=gaL6+OK02YkQai6LRYBqGDzbwRYz887l/KNSZ9kW7PRK7y11HZMHu33Qg3KUQvJRWMaUpV
	Xqx9zSHQ4NP5bWaDWM0hG2bL2/58rBbX3t5BpEUM8q6fTaJEn8vECY18p2tiydox3GClBJ
	37oMixruWaW2fUSzaYkXeR1TTau431Y=
Message-ID: <d7ab14e9-2411-774e-21f1-2ecf3cffd2e9@suse.com>
Date: Wed, 8 Jun 2022 07:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] xen: unexport __init-annotated
 xen_xlate_map_ballooned_pages()
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 moderated for non-subscribers <xen-devel@lists.xenproject.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Julien Grall <julien.grall@arm.com>, Shannon Zhao <shannon.zhao@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20220606045920.4161881-1-masahiroy@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220606045920.4161881-1-masahiroy@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oj1mRICSkSejk0rWguOK0LQn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oj1mRICSkSejk0rWguOK0LQn
Content-Type: multipart/mixed; boundary="------------JvVY88ac2iha0WITW905MGd9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 moderated for non-subscribers <xen-devel@lists.xenproject.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Julien Grall <julien.grall@arm.com>, Shannon Zhao <shannon.zhao@linaro.org>,
 linux-kernel@vger.kernel.org
Message-ID: <d7ab14e9-2411-774e-21f1-2ecf3cffd2e9@suse.com>
Subject: Re: [PATCH] xen: unexport __init-annotated
 xen_xlate_map_ballooned_pages()
References: <20220606045920.4161881-1-masahiroy@kernel.org>
In-Reply-To: <20220606045920.4161881-1-masahiroy@kernel.org>

--------------JvVY88ac2iha0WITW905MGd9
Content-Type: multipart/mixed; boundary="------------ZeiZdpYwEdKOOY0zd3kClKE9"

--------------ZeiZdpYwEdKOOY0zd3kClKE9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDYuMjIgMDY6NTksIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToNCj4gRVhQT1JUX1NZ
TUJPTCBhbmQgX19pbml0IGlzIGEgYmFkIGNvbWJpbmF0aW9uIGJlY2F1c2UgdGhlIC5pbml0
LnRleHQNCj4gc2VjdGlvbiBpcyBmcmVlZCB1cCBhZnRlciB0aGUgaW5pdGlhbGl6YXRpb24u
IEhlbmNlLCBtb2R1bGVzIGNhbm5vdA0KPiB1c2Ugc3ltYm9scyBhbm5vdGF0ZWQgX19pbml0
LiBUaGUgYWNjZXNzIHRvIGEgZnJlZWQgc3ltYm9sIG1heSBlbmQgdXANCj4gd2l0aCBrZXJu
ZWwgcGFuaWMuDQo+IA0KPiBtb2Rwb3N0IHVzZWQgdG8gZGV0ZWN0IGl0LCBidXQgaXQgaGFz
IGJlZW4gYnJva2VuIGZvciBhIGRlY2FkZS4NCj4gDQo+IFJlY2VudGx5LCBJIGZpeGVkIG1v
ZHBvc3Qgc28gaXQgc3RhcnRlZCB0byB3YXJuIGl0IGFnYWluLCB0aGVuIHRoaXMNCj4gc2hv
d2VkIHVwIGluIGxpbnV4LW5leHQgYnVpbGRzLg0KPiANCj4gVGhlcmUgYXJlIHR3byB3YXlz
IHRvIGZpeCBpdDoNCj4gDQo+ICAgIC0gUmVtb3ZlIF9faW5pdA0KPiAgICAtIFJlbW92ZSBF
WFBPUlRfU1lNQk9MDQo+IA0KPiBJIGNob3NlIHRoZSBsYXR0ZXIgZm9yIHRoaXMgY2FzZSBi
ZWNhdXNlIG5vbmUgb2YgdGhlIGluLXRyZWUgY2FsbC1zaXRlcw0KPiAoYXJjaC9hcm0veGVu
L2VubGlnaHRlbi5jLCBhcmNoL3g4Ni94ZW4vZ3JhbnQtdGFibGUuYykgaXMgY29tcGlsZWQg
YXMNCj4gbW9kdWxhci4NCj4gDQo+IEZpeGVzOiAyNDM4NDhmYzAxOGMgKCJ4ZW4vZ3JhbnQt
dGFibGU6IE1vdmUgeGxhdGVkX3NldHVwX2dudHRhYl9wYWdlcyB0byBjb21tb24gcGxhY2Ui
KQ0KPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcu
YXU+DQo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5l
bC5vcmc+DQoNClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4xOWENCg0KDQpK
dWVyZ2VuDQo=
--------------ZeiZdpYwEdKOOY0zd3kClKE9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZeiZdpYwEdKOOY0zd3kClKE9--

--------------JvVY88ac2iha0WITW905MGd9--

--------------oj1mRICSkSejk0rWguOK0LQn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKgNYUFAwAAAAAACgkQsN6d1ii/Ey9e
Xgf+KwHpnK/tq7Xc1VnnhPGEDHSqDxRDwlvwcfgFFl2Z9EqwXcDwIQ7HGtnRVS5FyxGzDx1Z/RrA
tuPi1k/MjwoqMVWMuoxRxfoIe2fQN/3PtawkVviWyNjL+3D8QDwks/dBhlrnYxHMP6XCtwtoxzz7
jGla6k3nDKEsb5GI7d6aaMzt1dXduBIqW/e8QX46rh7isnR7byqkGv8hC+4VQ8X8iOH2KAIvX1UV
k7EAwLZzhxXgegCDr7CWvb/jOqo7dnKmVPAyvUeqDWou29zlq+XovMB7I5gpl8q0SXr8SOJsB89s
fFNGCjpClpothDKrjtjlZ3RxwXgQHP+ZIviJcJZqdw==
=tDYM
-----END PGP SIGNATURE-----

--------------oj1mRICSkSejk0rWguOK0LQn--


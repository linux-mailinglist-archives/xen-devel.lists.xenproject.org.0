Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D999F64CD16
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 16:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462369.720547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TjN-0005iB-73; Wed, 14 Dec 2022 15:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462369.720547; Wed, 14 Dec 2022 15:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5TjN-0005ej-3u; Wed, 14 Dec 2022 15:31:37 +0000
Received: by outflank-mailman (input) for mailman id 462369;
 Wed, 14 Dec 2022 15:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5TjL-0005ed-AO
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 15:31:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d452e9-7bc4-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 16:31:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9797C2222F;
 Wed, 14 Dec 2022 15:31:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DB461333E;
 Wed, 14 Dec 2022 15:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tDW6CVXsmWNGSwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 15:31:33 +0000
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
X-Inumbo-ID: 63d452e9-7bc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671031893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lcQ/Gv8YF6dzEpM0Jqu+P1LKJ/NzZB2VUTm3uCQJfJ8=;
	b=Qa9qmwdPr5DNhh+qDPnY7ryq9Q+WGo8/18GtZEI93T/m3vRKIFu59/T7FaY4FYZa1fzfl0
	50cB3QYVskhIaWjw4WV1ONPKZ0vFelgaKURg57mpO1KAXn+8vU5eei6sNL0/ZxXrHBGnMB
	pnAKbVoSBCfx5Uc+aMq08ttci8fbtKY=
Message-ID: <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
Date: Wed, 14 Dec 2022 16:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BsPBzYjlOnm0SyDuNFC632AL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BsPBzYjlOnm0SyDuNFC632AL
Content-Type: multipart/mixed; boundary="------------aKaZMplz0xHsaQTZMkJlGrZJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
Message-ID: <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
In-Reply-To: <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>

--------------aKaZMplz0xHsaQTZMkJlGrZJ
Content-Type: multipart/mixed; boundary="------------3Z6OlOkUnntNCP1uUAv42U7i"

--------------3Z6OlOkUnntNCP1uUAv42U7i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTY6MDMsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gDQo+IE9uIDkv
MTAvMjIgMTE6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJbnN0ZWFkIG9mIGJlaW5n
IGFibGUgdG8gdXNlIG5vcm1hbCBzcGlubG9ja3MgYXMgcmVjdXJzaXZlIG9uZXMsIHRvbywN
Cj4+IG1ha2UgcmVjdXJzaXZlIHNwaW5sb2NrcyBhIHNwZWNpYWwgbG9jayB0eXBlLg0KPj4N
Cj4+IFRoaXMgd2lsbCBtYWtlIHRoZSBzcGlubG9jayBzdHJ1Y3R1cmUgc21hbGxlciBpbiBw
cm9kdWN0aW9uIGJ1aWxkcyBhbmQNCj4+IGFkZCB0eXBlLXNhZmV0eS4NCj4gDQo+IEp1c3Qg
YSBsaXR0bGUgeWFrIHNoYXZpbmcsIElNSE8gYSBzcGlubG9jayBpcyBub3JtYWxseSBub3Qg
ZXhwZWN0ZWQgdG8gYmUgDQo+IHJlY3Vyc2l2ZS4gVGh1cyBleHBsaWNpdGx5IG5hbWluZyBh
IHNwaW5sb2NrIGFzIG5vbi1yZWN1cnNpdmUgSSBmaW5kIHRvIGJlIA0KPiByZWR1bmRhbnQg
YWxvbmcgd2l0aCBiZWluZyBleHBlbnNpdmUgZm9yIHR5cGluZy4gV2hlcmVhcyBhIHJlY3Vy
c2l2ZSBzcGlubG9jayBpcyANCj4gdGhlIHNwZWNpYWwgaW5zdGFuY2UgYW5kIHNob3VsZCBo
YXZlIGEgZGVjbGFyYXRpdmUgZGlzdGluY3Rpb24uIE9ubHkgY29kaWZ5aW5nIA0KPiB0aGUg
cmVjdXJzaXZlIHR5cGUgd291bGQgc2lnbmlmaWNhbnRseSBjdXQgZG93biBvbiB0aGUgc2l6
ZSBvZiB0aGUgc2VyaWVzIGFuZCANCj4gc3RpbGwgcHJvdmlkZSBlcXVhbCB0eXBlIGFuZCB2
aXN1YWwgY2xhcmlmaWNhdGlvbi4NCg0KQSAibm9ybWFsIiBzcGlubG9jayBpcyBub24tcmVj
dXJzaXZlLg0KDQpBIHJlY3Vyc2l2ZSBzcGlubG9jayBpbiBYZW4gY2FuIGJlIGVpdGhlciB0
YWtlbiByZWN1cnNpdmUsIG9yIGl0IGNhbiBiZSB0YWtlbg0Kbm9uLXJlY3Vyc2l2ZSwgY2F1
c2luZyBmdXJ0aGVyIHJlY3Vyc2l2ZSBhdHRlbXB0cyB0byBzcGluLg0KDQpTbyB0aGUgZXhw
bGljaXQgbm9uLXJlY3Vyc2l2ZSBsb2NraW5nIGFwcGxpZXMgdG8gdGhhdCBzcGVjaWFsIHRy
ZWF0bWVudCBvZg0KcmVjdXJzaXZlIHNwaW5sb2Nrcy4NCg0KDQpKdWVyZ2VuDQo=
--------------3Z6OlOkUnntNCP1uUAv42U7i
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3Z6OlOkUnntNCP1uUAv42U7i--

--------------aKaZMplz0xHsaQTZMkJlGrZJ--

--------------BsPBzYjlOnm0SyDuNFC632AL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZ7FQFAwAAAAAACgkQsN6d1ii/Ey+M
uwf+JyNY6vDn0oOSsydsktFKAPyAhufOXHfsaAz0xP4Y/mRgDOYjcMa1XvzUyM4WKxuk2FsPWXs5
lp1VV0nmBGiW+OxDARRwj9TzT13SXakFWsr3bKYKZDTNIzW4FRszqgEnyuWWns+2fldWCZXSSH1L
vCTtrIiVMEMdqvwPeRvYW5rs23yqiL110Moy5SHnhO7Blk0SiL2j4bF0Jmk3SVd5vmLJOdl2skq3
+eQvMylS4Lnj7xWiumGc3bk711p297oxCiDnye2tl1PiWz413n7QqnwLunlFiOp7CBSU/NrEz4E3
Fssm0iRQIOfXGA40HImKa63wjqCwRjzd/hiGoI6m6A==
=0xw+
-----END PGP SIGNATURE-----

--------------BsPBzYjlOnm0SyDuNFC632AL--


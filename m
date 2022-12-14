Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA064C746
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:39:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462026.720184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PA3-0000wa-N5; Wed, 14 Dec 2022 10:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462026.720184; Wed, 14 Dec 2022 10:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PA3-0000tH-Jb; Wed, 14 Dec 2022 10:38:51 +0000
Received: by outflank-mailman (input) for mailman id 462026;
 Wed, 14 Dec 2022 10:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5PA2-0000tB-FV
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:38:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9dae81-7b9b-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 11:38:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17EE01FE82;
 Wed, 14 Dec 2022 10:38:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3BE41333E;
 Wed, 14 Dec 2022 10:38:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PFOGJrinmWNzJwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 10:38:48 +0000
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
X-Inumbo-ID: 7e9dae81-7b9b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671014329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zq8BZqrPNzJVT2V8MZEYV7uJeThDUpqEtPhtIfdPtW4=;
	b=M+vbHxxRW3jQoUeeKz5WMwMccMR5Wa1LNiF1rN4rXqXv5otndP/ockV3NJpXXb3ilJhSff
	wp47e4I0kcpWqLDB19uLJIWhxoJ7rnvXGGdL8H2qJBRDtfbMQJ+UXQ0nnw227IoL69EGiH
	q+xmlspNfPe5GAS5T7eTzLPDIYwps7A=
Message-ID: <9165f5ae-b1d6-58fa-4f9a-9afcfcb4161c@suse.com>
Date: Wed, 14 Dec 2022 11:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 1/3] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-2-jgross@suse.com>
 <5a3c8cd5-7f78-aaaa-0338-d063bb04e357@suse.com>
 <03f07de4-400b-941f-0efb-77ff3f76e9f0@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <03f07de4-400b-941f-0efb-77ff3f76e9f0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3SvHT46k2viicluMyTvfH8Y0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3SvHT46k2viicluMyTvfH8Y0
Content-Type: multipart/mixed; boundary="------------cJ0W0YSjX9GuqjuJOKUrZ0mL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <9165f5ae-b1d6-58fa-4f9a-9afcfcb4161c@suse.com>
Subject: Re: [RFC PATCH 1/3] xen/spinlock: add explicit non-recursive locking
 functions
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-2-jgross@suse.com>
 <5a3c8cd5-7f78-aaaa-0338-d063bb04e357@suse.com>
 <03f07de4-400b-941f-0efb-77ff3f76e9f0@suse.com>
In-Reply-To: <03f07de4-400b-941f-0efb-77ff3f76e9f0@suse.com>

--------------cJ0W0YSjX9GuqjuJOKUrZ0mL
Content-Type: multipart/mixed; boundary="------------iDUWEu3PmzzPrl00QcgJ0po2"

--------------iDUWEu3PmzzPrl00QcgJ0po2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTE6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMi4yMDIy
IDExOjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDEwLjA5LjIwMjIgMTc6NDksIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBhIHR5cGUtc2Fm
ZSByZWN1cnNpdmUgc3BpbmxvY2sgc3RydWN0dXJlLCBhZGQNCj4+PiBleHBsaWNpdGx5IG5v
bi1yZWN1cnNpdmUgbG9ja2luZyBmdW5jdGlvbnMgdG8gYmUgdXNlZCBmb3Igbm9uLXJlY3Vy
c2l2ZQ0KPj4+IGxvY2tpbmcgb2Ygc3BpbmxvY2tzLCB3aGljaCBhcmUgdXNlIHJlY3Vyc2l2
ZWx5LCB0b28uDQo+Pg0KPj4gV2hpbGUgSSBjYW4gc2VlIHRoYXQgc29tZXRoaW5nIG5lZWRz
IGRvaW5nLCBhIGZ1bmN0aW9uIG5hbWUgbGlrZQ0KPj4gc3Bpbl91bmxvY2tfbm9ucmVjdXJz
aXZlX2lycXJlc3RvcmUoKSBpcyByZWFsbHkgdW53aWVsZHksIGltby4NCj4gDQo+IFdoaWxl
IGZ1cnRoZXIgbG9va2luZyBhdCBwYXRjaCAyIC0gaG93IGFib3V0IHJzcGlubG9ja190IGFu
ZCByc3Bpbl9sb2NrKCkNCj4gZXRjLCBhbmQgdGhlbiBucnNwaW5fbG9jaygpIGV0YyBoZXJl
Pw0KDQpXb3VsZCB3b3JrIGZvciBtZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------iDUWEu3PmzzPrl00QcgJ0po2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------iDUWEu3PmzzPrl00QcgJ0po2--

--------------cJ0W0YSjX9GuqjuJOKUrZ0mL--

--------------3SvHT46k2viicluMyTvfH8Y0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZp7gFAwAAAAAACgkQsN6d1ii/Ey8b
TQf/aaUpCXkK9IAMn9I6c3Vbdg0Fya15MFIpDOsYu+wfffauDZ4pURozqqV6VH7QbZipvS/bjY7z
P2CrVuIKolfkhUjXS28N67/YRXHgMY3ut69OnR2SLSTxjFUTzt6RGRwXe6nnWQjvM1hkTlOANiRm
xFE4yD5nx87/7jZUXYVmloT4X/YKuKKDrXrwjA5WlDdzVRkOA9CXVm9Rw8FeWm6w5CgUk4Qm/BEH
mDE2LyO4FsPGjw8VvkLGOhR4YlfXD6vtq/uYdPw9lEKltzpF7ccwZZi3d3wGWCQN72S6bsNP3IT4
q7QqXh2k/GAZOAtrn2FuAPCUn0c4naf19b802ngyng==
=6xXV
-----END PGP SIGNATURE-----

--------------3SvHT46k2viicluMyTvfH8Y0--


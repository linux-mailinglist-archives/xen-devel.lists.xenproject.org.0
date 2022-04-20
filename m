Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C1508CBB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 18:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309481.525766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCo9-0000Uk-S6; Wed, 20 Apr 2022 16:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309481.525766; Wed, 20 Apr 2022 16:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhCo9-0000S1-Na; Wed, 20 Apr 2022 16:03:57 +0000
Received: by outflank-mailman (input) for mailman id 309481;
 Wed, 20 Apr 2022 16:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhCo7-0000Rv-HU
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 16:03:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a382252-c0c3-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 18:03:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B6C51F385;
 Wed, 20 Apr 2022 16:03:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D46FB13AD5;
 Wed, 20 Apr 2022 16:03:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S9/gMekuYGIERAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 16:03:53 +0000
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
X-Inumbo-ID: 7a382252-c0c3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650470634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVjg2mRYK4qiokg63C3YtQVzNHSP9U5XoeF6De8JgMg=;
	b=n4N/Ik897z38UAfLP7jabyF16X5oGYzuZ6fR6b0URMapBN8JFRaM4ATG0Rhl+CB/Y1WPoU
	z2dVx1XT6Je9hNn07AGWgdVqvP0E2Y5LgETbPkOvhQ/qayqpGJXu1PGJWXOb0Q5MXBOG78
	3JHwRRDxRozslUsp9MdNzPOASAM2EFI=
Message-ID: <70490620-16d2-6045-f83c-df65540025a8@suse.com>
Date: Wed, 20 Apr 2022 18:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220420155657.32506-1-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220420155657.32506-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rWutLE0nMFnDzCxKho9GRhUZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rWutLE0nMFnDzCxKho9GRhUZ
Content-Type: multipart/mixed; boundary="------------O1FIbOsQ3rcXguZCxjpy8c71";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <70490620-16d2-6045-f83c-df65540025a8@suse.com>
Subject: Re: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
References: <20220420155657.32506-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220420155657.32506-1-andrew.cooper3@citrix.com>

--------------O1FIbOsQ3rcXguZCxjpy8c71
Content-Type: multipart/mixed; boundary="------------KHFjSC3gpBygPpKhaHAiLoDS"

--------------KHFjSC3gpBygPpKhaHAiLoDS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjIgMTc6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFdoZW4gQ09ORklH
X0dEQlNYIGlzIGNvbXBpbGVkIG91dCwgaW9tbXVfZG9fZG9tY3RsKCkgZmFsbHMgb3ZlciBh
IE5VTEwNCj4gcG9pbnRlci4gIEl0IGlzbid0IHJlYWxseSBjb3JyZWN0IGZvciBwcm9jZXNz
aW5nIG9mIFhFTl9ET01DVExfZ2Ric3hfKiB0byBmYWxsDQo+IGludG8gdGhlIGRlZmF1bHQg
Y2FzZSB3aGVuIGNvbXBpbGVkIG91dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPg0KPiBDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPg0KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4gQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT4NCj4gQ0M6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJt
LmNvbT4NCj4gDQo+IFJGQywgYmVjYXVzZSB0aGlzIGhhcyBpbXBsaWNhdGlvbnMgYWNyb3Nz
IHRoZSBjb2RlYmFzZS4gIFRoZSB0bDtkciBpcyB0aGF0DQo+IGNhc2UgRk9POidzIHNob3Vs
ZG4ndCBiZSBjb21waWxlZCBvdXQ7IHdlIHN0aWxsIGtub3cgd2hhdCB0aGUgc3Vib3BzIGFy
ZSwgZXZlbg0KPiB3aGVuIHRoZSBmdW5jdGlvbmFsaXR5IGlzIGNvbXBpbGVkIG91dC4NCj4g
DQo+IFRoZXJlIGFyZSBzZXZlcmFsIHdheXMgdG8gZXhwcmVzcyB0aGlzLiAgQWx0ZXJuYXRp
dmVzIHdvdWxkIGJlOg0KPiANCj4gICAgICBjYXNlIFhFTl9ET01DVExfZ2Ric3hfZ3Vlc3Rt
ZW1pbzoNCj4gICAgICAgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfR0RCU1gpICkNCj4g
ICAgICAgICAgew0KPiAgICAgICAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsNCj4gICAgICAg
ICAgICAgIGJyZWFrOw0KPiAgICAgICAgICB9DQo+ICAgICAgICAgIC4uLjsNCj4gDQo+IGJ1
dCBnaXZlbiBteSBkZWJ1Z2dlciBzZXJpZXMgY3JlYXRpbmcgZ2Ric3guYywgSSB3YXMgYWxz
byBjb25zaWRlcmluZzoNCj4gDQo+ICAgICAgY2FzZSBYRU5fRE9NQ1RMX2dkYnN4X2d1ZXN0
bWVtaW86DQo+ICAgICAgY2FzZSBYRU5fRE9NQ1RMX2dkYnN4X3BhdXNldmNwdToNCj4gICAg
ICBjYXNlIFhFTl9ET01DVExfZ2Ric3hfdW5wYXVzZXZjcHU6DQo+ICAgICAgY2FzZSBYRU5f
RE9NQ1RMX2dkYnN4X2RvbXN0YXR1czoNCj4gICAgICAgICAgcmMgPSBnZGJzeF9kb19kb21j
dGwoZCwgaW9wKTsNCj4gICAgICAgICAgYnJlYWs7DQoNCkknZCBnbyB0aGlzIHJvdXRlLg0K
DQoNCkp1ZXJnZW4NCg==
--------------KHFjSC3gpBygPpKhaHAiLoDS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KHFjSC3gpBygPpKhaHAiLoDS--

--------------O1FIbOsQ3rcXguZCxjpy8c71--

--------------rWutLE0nMFnDzCxKho9GRhUZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJgLukFAwAAAAAACgkQsN6d1ii/Ey+K
JQf9EOeQnheS7CA4o6YD8xWOSH/dH2PY8eIKzOwVm0wzSxvnFYYLyeZI43BNgec4rDVOvrt7zKWT
3cIcgCWZ2zFL+PZewcO2Eh4sIiMIQyJ5VI1RiDQr1+/6gBC6TJJDbFQcjqYzOOX3KeazOJ2ZN12T
jBzq9v2CCrxPxyw7/Zk/2XRy7Wy9uv23218H/LLSaKvYLWscYBdmLEjYfvRJSAJdyGxItlqmbINz
6KR3alGwI099mGevuL9BmEb0dsIIzV9dsYeCmDxDkVrMrpUn9cwmXnw/ZXEEGFkzCR4pHJAvjy8l
u7//Wqdu4UGiRHEiyPJ4dgepHAe80yGHZxX2TGM2Bg==
=2oou
-----END PGP SIGNATURE-----

--------------rWutLE0nMFnDzCxKho9GRhUZ--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95CB645627
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456073.713773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qT4-0006yn-M1; Wed, 07 Dec 2022 09:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456073.713773; Wed, 07 Dec 2022 09:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qT4-0006w7-HK; Wed, 07 Dec 2022 09:11:54 +0000
Received: by outflank-mailman (input) for mailman id 456073;
 Wed, 07 Dec 2022 09:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p2qT2-0006vz-Mt
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:11:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f53ce3b-760f-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 10:11:51 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0B241FDEF;
 Wed,  7 Dec 2022 09:11:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8F645134CD;
 Wed,  7 Dec 2022 09:11:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id dUFPIdZYkGP/YgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Dec 2022 09:11:50 +0000
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
X-Inumbo-ID: 2f53ce3b-760f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670404310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htPrc76l+zy+mgKybJzD3g5ztXTI5xWfmLJegnWOUmI=;
	b=Av/8LmCuhz3IzFibumHhILDZtQXW9BALBv822ZStEeY9lEPOpqZ5+W/dKKbYfWoKjMal55
	4xtuXlycQJ3Jt3Z/KCkruw3ZhnqseLEFqp+Tt7RBCbt/6ZONVCRZu1uFuNbF0GwWWURk34
	968C5aJpZeFVGUSdyQlG2WqjAQuudEE=
Message-ID: <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
Date: Wed, 7 Dec 2022 10:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
 <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
 <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AU0vXA1wv4eONdYx0lpuAdjC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AU0vXA1wv4eONdYx0lpuAdjC
Content-Type: multipart/mixed; boundary="------------LqVQqEOm9oOJ8Yu904NXpTlf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
 <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
 <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
In-Reply-To: <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>

--------------LqVQqEOm9oOJ8Yu904NXpTlf
Content-Type: multipart/mixed; boundary="------------ei0G3vehQ01Xt7P1oilgmO0B"

--------------ei0G3vehQ01Xt7P1oilgmO0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTIuMjIgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4xMi4yMDIy
IDA4OjIxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA2LjEyLjIwMjIgMjE6MjYsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMDYvMTIvMjAyMiAxNDozMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+IEdyYW50IHRhYmxlIGNvZGUgaXMgdW51c2VkIGluIHNoaW0gbW9k
ZSwgc28gdGhlcmUncyBubyBwb2ludCBpbg0KPj4+PiBidWlsZGluZyBpdCBpbiB0aGUgZmly
c3QgcGxhY2UgZm9yIHNoaW0tZXhjbHVzaXZlIG1vZGUuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pg0KPj4+IG5hY2su
DQo+Pj4NCj4+PiBUaGlzIGlzIGJvZ3VzLCBhcyBpcyBldmVyeSBvdGhlciAiZGVwZW5kcyBv
biAhUFZfU0hJTV9FWENMVVNJVkUiLg0KPj4NCj4+IEJ1dCB3aHk/IERvaW5nIHRoaW5ncyBs
aWtlIHRoaXMgaW4gS2NvbmZpZyBpcyBleGFjdGx5IC4uLg0KPj4NCj4+PiBUaGUgb25seSBy
ZWFzb24gSSBoYXZlbid0IHJldmVydGluZyB0aGUgb3RoZXJzIHNvIGBtYWtlIGFsbHllc2Nv
bmZpZ2ANCj4+PiBkb2Vzbid0IGRpc2FibGUgQ09ORklHX0hWTSwgaXMgYmVjYXVzZSBJIGhh
dmVuJ3QgaGFkIHRpbWUuwqAgVGhpcyBjaGFuZ2UNCj4+PiBmdXJ0aGVyIGJyZWFrcyBhbGx5
ZXNjb25maWcgYnkgZGlzYWJsaW5nIEdSQU5UX1RBQkxFIHRvby4NCj4+Pg0KPj4+IFBWX1NI
SU1fRVhDTFVTSVZFIGlzIGEgc2ltcGxlIG9wdGlvbiBmb3IgYSBiaXQgb2YgZGVhZCBjb2Rl
DQo+Pj4gZWxpbWluYXRpb24uwqAgSXQgaXMgbm90IHZhbGlkIHRvIGJlIHVzZWQgbGlrZSB0
aGlzLg0KPj4NCj4+IC4uLiBmb3IgdGhlIHB1cnBvc2Ugb2YgZGVhZCBjb2RlIGVsaW1pbmF0
aW9uLiBCeSBuYWNrLWluZyBhIGNoYW5nZSBsaWtlDQo+PiB0aGlzIChhbmQgYnkgaGF2aW5n
IHZvaWNlZCBvcHBvc2l0aW9uIHRvIGVhcmxpZXIgb25lcykgeW91IHNpbXBseSBjYWxsDQo+
PiBmb3IgeWV0IG1vcmUgZW50aXJlbHkgdW5oZWxwZnVsICNpZmRlZi1hcnkuIFNlZSB0aGUg
bGFzdCBwYXJhZ3JhcGggb2YNCj4+IHRoZSBkZXNjcmlwdGlvbiBvZiBwYXRjaCAxLCBoYWxm
IG9mIHdoaWNoIHRoaXMgY2hhbmdlIHJlY3RpZmllcy4gVGhlDQo+PiBzb2x1dGlvbiBvbiB0
aGUgZXZ0Y2huIHNpZGUsIHVuZm9ydHVuYXRlbHksIGxvb2tzIHRvIGJlICNpZmRlZi1hcnks
DQo+PiBzaG9ydCBvZiB0aGVyZSBiZWluZyBhIHN1aXRhYmxlIEtjb25maWcgb3B0aW9uLg0K
Pj4NCj4+IEZ1cnRoZXJtb3JlIEtjb25maWcsIGluIG15IHZpZXcsIGlzIHNwZWNpZmljYWxs
eSBpbnRlbmRlZCB0byBhbGxvdyB0bw0KPj4gcHJldmVudCB0aGUgdXNlciBmcm9tIHNlbGVj
dGluZyBlbnRpcmVseSBib2d1cyBvcHRpb24gY29tYmluYXRpb25zDQo+PiAoYW5kIGV2ZW4g
bW9yZSBzbyBzdWdnZXN0IGVudGlyZWx5IGJvZ3VzIGNvbmZpZ3VyYXRpb25zIGJ5IGJvZ3Vz
DQo+PiBkZWZhdWx0IHNldHRpbmdzKS4gSWYgeW91IGRpc2FncmVlLCB0aGVuIEknbSBhZnJh
aWQgd2UgaGF2ZSBhIDJuZA0KPj4gS2NvbmZpZyB1c2FnZSB0b3BpYyB3aGljaCB3ZSBuZWVk
IHRvIHNldHRsZSBvbiBpbiBhIHByb2plY3Qtd2lkZQ0KPj4gbWFubmVyLiBJZiBvbmx5IHdl
IGV2ZXIgbWFkZSBhbnkgcHJvZ3Jlc3Mgb24gc3VjaCAuLi4NCj4+DQo+PiBBcyB0byBhbGx5
ZXNjb25maWcgLSBJIGNhbiBzZWUgeW91ciBwb2ludCB0aGVyZSwgYnV0IHRoZW4gYXJyYW5n
ZW1lbnRzDQo+PiBuZWVkIHRvIGJlIGludmVudGVkIHRvIGF2b2lkIHRoaXMga2luZCBvZiB1
bmhlbHBmdWwgYmVoYXZpb3IuDQo+IA0KPiBUaGlua2luZyBtb3JlIGFib3V0IGl0LCBpZiBh
bGx5ZXNjb25maWcgaXMgbWVhbnQgdG8gYmUgdXNlZnVsLCB0aGVuDQo+IGFueSAiZGVwZW5k
cyBvbiAhLi4uIiAob3RoZXIgdGhhbiBmb3IgYmFzZSBhcmNoaXRlY3R1cmUgaWRlbnRpZmll
cnMpDQo+IHdvdWxkIGJlIHdyb25nIChzZWUgZS5nLiBDT1ZFUkFHRSBkZXBlbmRpbmcgb24g
IUxJVkVQQVRDSCBvcg0KPiBBUk1fU01NVV9WMyBkZXBlbmRpbmcgb24gIUFDUEkpLiBBbmQg
dGhpcyB3b3VsZCBleHRlbmQgdG8gTGludXggYXMNCj4gd2VsbCAtIGhvdyBkbyB0aGV5IGRl
YWwgd2l0aCB0aGF0Pw0KDQpJc24ndCBhbGx5ZXNjb25maWcgZm9yIG5ldyBvcHRpb25zIG9u
bHk/IEF0IGxlYXN0IGluIExpbnV4IGl0IGlzDQpkb2N1bWVudGVkIHRoaXMgd2F5Lg0KDQpP
dGhlcndpc2Ugb3B0aW9ucyBsaWtlIENPTkZJR19YODZfMzIgKHdoaWNoIGRlcGVuZHMgb24g
IVg4Nl82NCkgd291bGQgbWFrZQ0Kbm8gc2Vuc2UgZWl0aGVyLg0KDQpTbyB0aGUgd2F5IHRv
IGdvIHNlZW1zIHRvIGhhdmUgc29tZSBkZWZhdWx0IG1pbmltYWwgY29uZmlncyAoaW4gb3Vy
IGNhc2UNCmUuZy4gc2hpbSBhbmQgbm8tc2hpbSksIHdoaWNoIGNhbiB0aGVuIGJlIGV4cGFu
ZGVkIHZpYSBhbGx5ZXNjb25maWcgb3INCmFsbG5vY29uZmlnLg0KDQoNCkp1ZXJnZW4NCg==

--------------ei0G3vehQ01Xt7P1oilgmO0B
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ei0G3vehQ01Xt7P1oilgmO0B--

--------------LqVQqEOm9oOJ8Yu904NXpTlf--

--------------AU0vXA1wv4eONdYx0lpuAdjC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOQWNYFAwAAAAAACgkQsN6d1ii/Ey/0
uggAkm57ttZUfcOrNfxt8tvxF1YnmWuQmFOWvH6NG6YKpJg8HASvz84BTFJZaA2IXB+nUItb9bnF
1MJROGXWAXRxosE+DssyXEgy6wmJPSSQCdDpLCkahZA8VupbLiaUUAWp0SrWaIbaZstOXYGL1tEX
D6OYwDC4Ai0uq5M62nxJJYEM9RaVMBo2b/R3FzxsVa3qp59NibmciOyLcrwSvtDIpgiWYayo3Fao
fU0X80MnbbslyNE+Lrtf1WWJcCh536Rdb0lTvKxIcsbeONkMIb1MQ4K6EeRT5y83KAOyPfxBNJNf
sN+OHsDF6BxdzOndC7SaL9E89DMRB8mXJqci3cs6Ig==
=X97z
-----END PGP SIGNATURE-----

--------------AU0vXA1wv4eONdYx0lpuAdjC--


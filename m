Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442F645701
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456117.713826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rDq-0008HI-Ir; Wed, 07 Dec 2022 10:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456117.713826; Wed, 07 Dec 2022 10:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rDq-0008EX-GB; Wed, 07 Dec 2022 10:00:14 +0000
Received: by outflank-mailman (input) for mailman id 456117;
 Wed, 07 Dec 2022 10:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p2rDp-0008Db-G1
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:00:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef98576a-7615-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 11:00:12 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4899921CA3;
 Wed,  7 Dec 2022 10:00:10 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 00D6913732;
 Wed,  7 Dec 2022 10:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +fzXOSlkkGMcfQAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Dec 2022 10:00:09 +0000
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
X-Inumbo-ID: ef98576a-7615-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670407210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0NdNa7EL/MamKpASJtNe8nod+Zve0iBy/vQmu6jfhI=;
	b=K2VpWwAsYfiIJs/cr8XGC8g2xw8HAo/wilX78zBEHRP++ymSdf4yW5hdJq+XxT/XIo9jeV
	94nPxH9RFf1IW3vX/Mqmokc4pkg3MdkN9i3x7rTa5AYHsOmdvJIBQ8Vy739Ga2UPMKGqSm
	BUv1QfuMU8UFW+rt//uIsOuTDsLq6wE=
Message-ID: <b64a4445-b634-4c85-1a0d-ef00fa018c0c@suse.com>
Date: Wed, 7 Dec 2022 11:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
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
 <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
 <780ba615-a375-f32c-705d-64560133085b@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
In-Reply-To: <780ba615-a375-f32c-705d-64560133085b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GYRvcwGu3tuwc0Hj61t5uc9l"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GYRvcwGu3tuwc0Hj61t5uc9l
Content-Type: multipart/mixed; boundary="------------333z0lnea2erQB9s2V6J0iq1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <b64a4445-b634-4c85-1a0d-ef00fa018c0c@suse.com>
Subject: Re: [PATCH 2/3] x86/pv-shim: don't even allow enabling GRANT_TABLE
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
 <5fd43248-225e-99c0-7bbb-65e7cf7f08d1@suse.com>
 <5c934e1d-c785-d330-f0e1-acaaef700265@citrix.com>
 <606aff14-8abe-1788-6bc7-f3b279db8106@suse.com>
 <5bde8110-bdc8-e5f6-8677-8ae23f4990c4@suse.com>
 <e5fa33d5-a82a-606c-2ab0-013a9ed72c08@suse.com>
 <780ba615-a375-f32c-705d-64560133085b@suse.com>
In-Reply-To: <780ba615-a375-f32c-705d-64560133085b@suse.com>

--------------333z0lnea2erQB9s2V6J0iq1
Content-Type: multipart/mixed; boundary="------------OhZvUxJBPI9QFQ4zge1SoTxn"

--------------OhZvUxJBPI9QFQ4zge1SoTxn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTIuMjIgMTA6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4xMi4yMDIy
IDEwOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMTIuMjIgMDk6NTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjEyLjIwMjIgMDg6MjEsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAwNi4xMi4yMDIyIDIxOjI2LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gT24gMDYvMTIvMjAyMiAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
Pj4gR3JhbnQgdGFibGUgY29kZSBpcyB1bnVzZWQgaW4gc2hpbSBtb2RlLCBzbyB0aGVyZSdz
IG5vIHBvaW50IGluDQo+Pj4+Pj4gYnVpbGRpbmcgaXQgaW4gdGhlIGZpcnN0IHBsYWNlIGZv
ciBzaGltLWV4Y2x1c2l2ZSBtb2RlLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+Pj4NCj4+Pj4+IG5hY2suDQo+
Pj4+Pg0KPj4+Pj4gVGhpcyBpcyBib2d1cywgYXMgaXMgZXZlcnkgb3RoZXIgImRlcGVuZHMg
b24gIVBWX1NISU1fRVhDTFVTSVZFIi4NCj4+Pj4NCj4+Pj4gQnV0IHdoeT8gRG9pbmcgdGhp
bmdzIGxpa2UgdGhpcyBpbiBLY29uZmlnIGlzIGV4YWN0bHkgLi4uDQo+Pj4+DQo+Pj4+PiBU
aGUgb25seSByZWFzb24gSSBoYXZlbid0IHJldmVydGluZyB0aGUgb3RoZXJzIHNvIGBtYWtl
IGFsbHllc2NvbmZpZ2ANCj4+Pj4+IGRvZXNuJ3QgZGlzYWJsZSBDT05GSUdfSFZNLCBpcyBi
ZWNhdXNlIEkgaGF2ZW4ndCBoYWQgdGltZS7CoCBUaGlzIGNoYW5nZQ0KPj4+Pj4gZnVydGhl
ciBicmVha3MgYWxseWVzY29uZmlnIGJ5IGRpc2FibGluZyBHUkFOVF9UQUJMRSB0b28uDQo+
Pj4+Pg0KPj4+Pj4gUFZfU0hJTV9FWENMVVNJVkUgaXMgYSBzaW1wbGUgb3B0aW9uIGZvciBh
IGJpdCBvZiBkZWFkIGNvZGUNCj4+Pj4+IGVsaW1pbmF0aW9uLsKgIEl0IGlzIG5vdCB2YWxp
ZCB0byBiZSB1c2VkIGxpa2UgdGhpcy4NCj4+Pj4NCj4+Pj4gLi4uIGZvciB0aGUgcHVycG9z
ZSBvZiBkZWFkIGNvZGUgZWxpbWluYXRpb24uIEJ5IG5hY2staW5nIGEgY2hhbmdlIGxpa2UN
Cj4+Pj4gdGhpcyAoYW5kIGJ5IGhhdmluZyB2b2ljZWQgb3Bwb3NpdGlvbiB0byBlYXJsaWVy
IG9uZXMpIHlvdSBzaW1wbHkgY2FsbA0KPj4+PiBmb3IgeWV0IG1vcmUgZW50aXJlbHkgdW5o
ZWxwZnVsICNpZmRlZi1hcnkuIFNlZSB0aGUgbGFzdCBwYXJhZ3JhcGggb2YNCj4+Pj4gdGhl
IGRlc2NyaXB0aW9uIG9mIHBhdGNoIDEsIGhhbGYgb2Ygd2hpY2ggdGhpcyBjaGFuZ2UgcmVj
dGlmaWVzLiBUaGUNCj4+Pj4gc29sdXRpb24gb24gdGhlIGV2dGNobiBzaWRlLCB1bmZvcnR1
bmF0ZWx5LCBsb29rcyB0byBiZSAjaWZkZWYtYXJ5LA0KPj4+PiBzaG9ydCBvZiB0aGVyZSBi
ZWluZyBhIHN1aXRhYmxlIEtjb25maWcgb3B0aW9uLg0KPj4+Pg0KPj4+PiBGdXJ0aGVybW9y
ZSBLY29uZmlnLCBpbiBteSB2aWV3LCBpcyBzcGVjaWZpY2FsbHkgaW50ZW5kZWQgdG8gYWxs
b3cgdG8NCj4+Pj4gcHJldmVudCB0aGUgdXNlciBmcm9tIHNlbGVjdGluZyBlbnRpcmVseSBi
b2d1cyBvcHRpb24gY29tYmluYXRpb25zDQo+Pj4+IChhbmQgZXZlbiBtb3JlIHNvIHN1Z2dl
c3QgZW50aXJlbHkgYm9ndXMgY29uZmlndXJhdGlvbnMgYnkgYm9ndXMNCj4+Pj4gZGVmYXVs
dCBzZXR0aW5ncykuIElmIHlvdSBkaXNhZ3JlZSwgdGhlbiBJJ20gYWZyYWlkIHdlIGhhdmUg
YSAybmQNCj4+Pj4gS2NvbmZpZyB1c2FnZSB0b3BpYyB3aGljaCB3ZSBuZWVkIHRvIHNldHRs
ZSBvbiBpbiBhIHByb2plY3Qtd2lkZQ0KPj4+PiBtYW5uZXIuIElmIG9ubHkgd2UgZXZlciBt
YWRlIGFueSBwcm9ncmVzcyBvbiBzdWNoIC4uLg0KPj4+Pg0KPj4+PiBBcyB0byBhbGx5ZXNj
b25maWcgLSBJIGNhbiBzZWUgeW91ciBwb2ludCB0aGVyZSwgYnV0IHRoZW4gYXJyYW5nZW1l
bnRzDQo+Pj4+IG5lZWQgdG8gYmUgaW52ZW50ZWQgdG8gYXZvaWQgdGhpcyBraW5kIG9mIHVu
aGVscGZ1bCBiZWhhdmlvci4NCj4+Pg0KPj4+IFRoaW5raW5nIG1vcmUgYWJvdXQgaXQsIGlm
IGFsbHllc2NvbmZpZyBpcyBtZWFudCB0byBiZSB1c2VmdWwsIHRoZW4NCj4+PiBhbnkgImRl
cGVuZHMgb24gIS4uLiIgKG90aGVyIHRoYW4gZm9yIGJhc2UgYXJjaGl0ZWN0dXJlIGlkZW50
aWZpZXJzKQ0KPj4+IHdvdWxkIGJlIHdyb25nIChzZWUgZS5nLiBDT1ZFUkFHRSBkZXBlbmRp
bmcgb24gIUxJVkVQQVRDSCBvcg0KPj4+IEFSTV9TTU1VX1YzIGRlcGVuZGluZyBvbiAhQUNQ
SSkuIEFuZCB0aGlzIHdvdWxkIGV4dGVuZCB0byBMaW51eCBhcw0KPj4+IHdlbGwgLSBob3cg
ZG8gdGhleSBkZWFsIHdpdGggdGhhdD8NCj4+DQo+PiBJc24ndCBhbGx5ZXNjb25maWcgZm9y
IG5ldyBvcHRpb25zIG9ubHk/IEF0IGxlYXN0IGluIExpbnV4IGl0IGlzDQo+PiBkb2N1bWVu
dGVkIHRoaXMgd2F5Lg0KPiANCj4gSXMgaXQ/IEkgb25seSBmaW5kDQo+IA0KPiAgICAgICAi
bWFrZSBhbGx5ZXNjb25maWciDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBDcmVhdGUg
YSAuLy5jb25maWcgZmlsZSBieSBzZXR0aW5nIHN5bWJvbA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgdmFsdWVzIHRvICd5JyBhcyBtdWNoIGFzIHBvc3NpYmxlLg0KDQpIbW0sIHN0
cmFuZ2UuIEkgc2VlbSB0byBoYXZlIGVpdGhlciBsb29rZWQgYXQgc29tZXRoaW5nIGVsc2Us
IG9yIEkgaGF2ZW4ndA0KcmVhZCBpdCBjb3JyZWN0bHkuDQoNClNvcnJ5IGZvciB0aGUgbm9p
c2UuDQoNCkFuZCBwcm9iYWJseSB0aW1lIGZvciBtb3JlIGNvZmZlZS4NCg0KDQpKdWVyZ2Vu
DQo=
--------------OhZvUxJBPI9QFQ4zge1SoTxn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------OhZvUxJBPI9QFQ4zge1SoTxn--

--------------333z0lnea2erQB9s2V6J0iq1--

--------------GYRvcwGu3tuwc0Hj61t5uc9l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOQZCkFAwAAAAAACgkQsN6d1ii/Ey93
LAf+OcI0E/IzINzTfKuVta+i6AtUx69eI+mhC8PnisS27Fz+6t49ZzghGr6Ud7ovJeSHtvaGt4dJ
nzt6v4fAehLYdve1AJQpbfO0vdmHavOhVvRTss7KgyWUmy4co6WJehxDoG2BT3QO2Y0PKCoSV1Z9
TuTr5F1dTt0kE0p2NAV9UCMk4VlNBc6J7oqSLouWeeCdsO0CbFYBw5JKxp9BMAM7hZiv+f5bcjj0
2aOu8NLybijE9VHT6CnCEqeqdKk+oWd1lzOycNjfaE1ENaeUnXl8JkzqErBXM2BrqQK1nkdHYLgo
XmKt4AIDxJEVUMqJPyM+QB1FD5At/nlrliFqF2IEWw==
=0qG6
-----END PGP SIGNATURE-----

--------------GYRvcwGu3tuwc0Hj61t5uc9l--


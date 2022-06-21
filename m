Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA3552BA4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 09:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352986.579863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Y9a-0008VU-46; Tue, 21 Jun 2022 07:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352986.579863; Tue, 21 Jun 2022 07:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Y9a-0008T4-1P; Tue, 21 Jun 2022 07:18:26 +0000
Received: by outflank-mailman (input) for mailman id 352986;
 Tue, 21 Jun 2022 07:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Y9X-0008R4-SQ
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 07:18:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 541bbbc6-f132-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 09:18:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60DA121EC7;
 Tue, 21 Jun 2022 07:18:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EBBF13638;
 Tue, 21 Jun 2022 07:18:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Min+DbxwsWJ1YQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Jun 2022 07:18:20 +0000
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
X-Inumbo-ID: 541bbbc6-f132-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655795900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYzXzyNLzxsDxkplJxEXVmQtR/+WRwMen2LYGkswUAg=;
	b=UedvPFVXUz6Pwwbt3p91AyHRx91X3F5psqWH2mwSrFcUT50qda33Clpq2B4JDw27mDvuvn
	NkaasDvlrfPN1h/ZM+f05QF36AbWikkTQJ0wJcAcjr7TrSDXxr/ZHrcwQLs9UCe5VkmSmU
	36IY33UU5yvCwPFrh1x6C6iKw0tGTl8=
Message-ID: <d45f10c8-236b-3302-5cc5-9aba6dab2dea@suse.com>
Date: Tue, 21 Jun 2022 09:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] mini-os: fix number of pages for PVH
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20220619065253.19503-1-jgross@suse.com>
 <20220619065253.19503-4-jgross@suse.com>
 <20220620224359.qbpojkdwbxbsfcv3@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220620224359.qbpojkdwbxbsfcv3@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I43HiciVyFPAPnKWa290gyk6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I43HiciVyFPAPnKWa290gyk6
Content-Type: multipart/mixed; boundary="------------PzYnehsueDrjJ0UbXmf7UCZQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <d45f10c8-236b-3302-5cc5-9aba6dab2dea@suse.com>
Subject: Re: [PATCH v2 3/4] mini-os: fix number of pages for PVH
References: <20220619065253.19503-1-jgross@suse.com>
 <20220619065253.19503-4-jgross@suse.com>
 <20220620224359.qbpojkdwbxbsfcv3@begin>
In-Reply-To: <20220620224359.qbpojkdwbxbsfcv3@begin>

--------------PzYnehsueDrjJ0UbXmf7UCZQ
Content-Type: multipart/mixed; boundary="------------b1dMPg1H1UbvgQvcqzHbdAqC"

--------------b1dMPg1H1UbvgQvcqzHbdAqC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDYuMjIgMDA6NDMsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgZGltLiAxOSBqdWluIDIwMjIgMDg6NTI6NTIgKzAyMDAsIGEgZWNyaXQ6DQo+
PiBXaGVuIGdldHRpbmcgdGhlIGN1cnJlbnQgYWxsb2NhdGlvbiBmcm9tIFhlbiwgdGhpcyB2
YWx1ZSBpbmNsdWRlcyB0aGUNCj4+IHBhZ2VzIGFsbG9jYXRlZCBpbiB0aGUgTU1JTyBhcmVh
LiBGaXggdGhlIGhpZ2hlc3QgYXZhaWxhYmxlIFJBTSBwYWdlDQo+PiBieSBzdWJ0cmFjdGlu
ZyB0aGUgc2l6ZSBvZiB0aGF0IGFyZWEuDQo+Pg0KPj4gVGhpcyByZXF1aXJlcyB0byByZWFk
IHRoZSBFODIwIG1hcCBiZWZvcmUgbmVlZGluZyB0aGlzIHZhbHVlLiBBZGQgdHdvDQo+PiBm
dW5jdGlvbnMgcmV0dXJuaW5nIHRoZSBjdXJyZW50IGFuZCB0aGUgbWF4aW11bSBudW1iZXIg
b2YgUkFNIHBhZ2VzDQo+PiB0YWtpbmcgdGhpcyBjb3JyZWN0aW9uIGludG8gYWNjb3VudC4N
Cj4+DQo+PiBBdCB0aGUgc2FtZSB0aW1lIGFkZCB0aGUgTEFQSUMgcGFnZSB0byB0aGUgbWVt
b3J5IG1hcCBpbiBvcmRlciB0bw0KPj4gYXZvaWQgcmV1c2luZyB0aGF0IFBGTiBmb3IgaW50
ZXJuYWwgcHVycG9zZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0gbWFrZSBlODIwX2luaXRp
YWxfcmVzZXJ2ZWRfcGZucyBzdGF0aWMgKFNhbXVlbCBUaGliYXVsdCkNCj4+IC0gYWRkIGU4
MjBfZ2V0X2N1cnJlbnRfcGFnZXMoKSBhbmQgZTgyMF9nZXRfbWF4X3BhZ2VzKCkNCj4+IC0t
LQ0KPiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2U4MjAuaCBiL2luY2x1ZGUvZTgyMC5o
DQo+PiBpbmRleCA1NDM4YTdjOC4uNmYxNWZjZDIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRl
L2U4MjAuaA0KPj4gKysrIGIvaW5jbHVkZS9lODIwLmgNCj4+IEBAIC01Miw2ICs1Miw4IEBA
IHN0cnVjdCBfX3BhY2tlZCBlODIwZW50cnkgew0KPj4gICBleHRlcm4gc3RydWN0IGU4MjBl
bnRyeSBlODIwX21hcFtdOw0KPj4gICBleHRlcm4gdW5zaWduZWQgZTgyMF9lbnRyaWVzOw0K
Pj4gICANCj4+ICt1bnNpZ25lZCBpbnQgZTgyMF9nZXRfY3VycmVudF9wYWdlcyh2b2lkKTsN
Cj4+ICt1bnNpZ25lZCBpbnQgZTgyMF9nZXRfbWF4X3BhZ2VzKHZvaWQpOw0KPiANCj4gV2h5
IGFuIGludCByYXRoZXIgdGhhbiBhIGxvbmcgaW50PyBZZXMgNFRpQiBtZW1vcnkgaXMgbGFy
Z2UgZm9yIG1pbmktb3MsDQo+IGJ1dCBiZXR0ZXIga2VlcCBudW1iZXJzIG9mIHBhZ2VzIGEg
bG9uZz8NCg0KSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIHRoYXQgbXVjaCAoY3VycmVudGx5
IE1pbmktT1MgY2FuJ3Qgc3VwcG9ydCBtb3JlDQp0aGFuIDUxMkdpQiBvZiBtZW1vcnkpLCBi
dXQgSSBjYW4gY2hhbmdlIHRoZSBmdW5jdGlvbnMgdG8gdW5zaWduZWQgbG9uZy4NCg0KPiAN
Cj4gQXBhcnQgZnJvbSB0aGF0LA0KPiANCj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBUaGliYXVs
dCA8c2FtdWVsLnRoaWJhdWx0QGVucy1seW9uLm9yZz4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJn
ZW4NCg==
--------------b1dMPg1H1UbvgQvcqzHbdAqC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------b1dMPg1H1UbvgQvcqzHbdAqC--

--------------PzYnehsueDrjJ0UbXmf7UCZQ--

--------------I43HiciVyFPAPnKWa290gyk6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKxcLsFAwAAAAAACgkQsN6d1ii/Ey8f
VQf/ZilBm1MDU6FR6KXhb73Zic/eJtTqV1m8kZsrdu0NdvPfOZExXl+9cqYG0DzYrXLBcYLtM5Ik
NWSTJMJTzvrGsjwiu6SJRY05jqYmSz1GNWFa5DP3bdbyRt1tQjJxw6XalYh4Kce4VduS2x9hVezH
AI4iP05C2m+9WDxhSJxbn3AQfOgdwkfCnqx5hjXTn/lBSlWqlQdkgYL3qWpL7ZfOQe3Dzfb7pm5z
2qBywR9lJDWIlAOfw0rv1697tuI2Fy4Ebj2p3AowoEH/F8GYbTz6nI0XLXfOlcrRxP3cuuLQPjvv
HLW+Cq3kxJ/XcRGgbPfMig1MNcaNv2HsXUL8tITOuw==
=cLAS
-----END PGP SIGNATURE-----

--------------I43HiciVyFPAPnKWa290gyk6--


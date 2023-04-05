Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5576D7DFF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518534.805194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3RO-0005n0-QY; Wed, 05 Apr 2023 13:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518534.805194; Wed, 05 Apr 2023 13:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3RO-0005jo-NJ; Wed, 05 Apr 2023 13:44:46 +0000
Received: by outflank-mailman (input) for mailman id 518534;
 Wed, 05 Apr 2023 13:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pk3RN-0005jZ-LD
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:44:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e8fd71-d3b8-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 15:44:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDDF120634;
 Wed,  5 Apr 2023 13:44:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F42513A31;
 Wed,  5 Apr 2023 13:44:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IZ/fIEh7LWQtcgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 13:44:40 +0000
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
X-Inumbo-ID: 03e8fd71-d3b8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680702280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PFghx5Gd1bMgaOBQLPmS7nHyfVl84PcJEn2YPi2RhpU=;
	b=Vug5EE6ZVVNV7Z32SW5o6BNOux/v7tRNnACieTv+QSNgiNpLfnVqj1CVABqe4UnrXimQ4x
	RE5zvMSy9iczPPOfuwlDRT74l3rWhcgyJ9Ql+oPBD6Ojk8LWSYPT6emuR8ZLzkTpk1Z+im
	ihRQv4KY+yRXK3LssiJT73gaNG+t3eM=
Message-ID: <718c7a92-b3ca-8fb3-e698-5e01464258c3@suse.com>
Date: Wed, 5 Apr 2023 15:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-2-jgross@suse.com>
 <c22b42fc-9dcb-72cf-ad6c-fa4311502465@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
In-Reply-To: <c22b42fc-9dcb-72cf-ad6c-fa4311502465@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o00O0sD67mTCNvhlEJMiCJzA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o00O0sD67mTCNvhlEJMiCJzA
Content-Type: multipart/mixed; boundary="------------U1KZpPbs6bUVrEt0X0kQ5wrL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <718c7a92-b3ca-8fb3-e698-5e01464258c3@suse.com>
Subject: Re: [PATCH v2 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-2-jgross@suse.com>
 <c22b42fc-9dcb-72cf-ad6c-fa4311502465@suse.com>
In-Reply-To: <c22b42fc-9dcb-72cf-ad6c-fa4311502465@suse.com>

--------------U1KZpPbs6bUVrEt0X0kQ5wrL
Content-Type: multipart/mixed; boundary="------------ZU19NvmbvRm5zir8Zt0wfHpu"

--------------ZU19NvmbvRm5zir8Zt0wfHpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDQuMjMgMTU6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNC4yMDIz
IDE4OjI4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gc3VwcG9ydCBo
eXBlcnZpc29yIGFuYWx5c2lzIG9mIGNyYXNoIGR1bXBzLCB4ZW4tc3ltcyBuZWVkcw0KPj4g
dG8gY29udGFpbiBkZWJ1Z19pbmZvLiBJdCBzaG91bGQgYmUgYWxsb3dlZCB0byBjb25maWd1
cmUgdGhlIGh5cGVydmlzb3INCj4+IHRvIGJlIGJ1aWx0IHdpdGggQ09ORklHX0RFQlVHX0lO
Rk8gaW4gbm9uLWRlYnVnIGJ1aWxkcyB3aXRob3V0IGhhdmluZw0KPj4gdG8gZW5hYmxlIEVY
UEVSVC4NCj4+DQo+PiBVc2luZyBhIHJhdGhlciBvbGRpc2ggZ2NjICg3LjUpIGl0IHdhcyB2
ZXJpZmllZCB0aGF0IGNvZGUgZ2VuZXJhdGlvbg0KPj4gZG9lc24ndCByZWFsbHkgZGlmZmVy
IGJldHdlZW4gQ09ORklHX0RFQlVHX0lORk8gb24gb3Igb2ZmIHdpdGhvdXQNCj4+IENPTkZJ
R19ERUJVRyBiZWluZyBzZXQgKG9ubHkgb2JzZXJ2ZWQgZGlmZmVyZW5jZXMgd2VyZSBzbGln
aHRseQ0KPj4gZGlmZmVyZW50IHN5bWJvbCBhZGRyZXNzZXMsIHZlcmlmaWVkIHZpYSAib2Jq
ZHVtcCAtZCIsIHJlc3VsdGluZyBmcm9tDQo+PiB0aGUgZGlmZmVyZW50IGNvbmZpZy5neiBp
biB0aGUgYmluYXJ5KS4gVGhlIG9sZCBnY2MgdmVyc2lvbiBzZWxlY3Rpb24NCj4+IHdhcyBi
YXNlZCBvbiB0aGUgYXNzdW1wdGlvbiwgdGhhdCBuZXdlciBnY2Mgd29uJ3QgcmVncmVzcyBp
biB0aGlzDQo+PiByZWdhcmQuDQo+Pg0KPj4gU28gbW92ZSBDT05GSUdfREVCVUdfSU5GTyBv
dXQgb2YgdGhlIHNlY3Rpb24gZ3VhcmRlZCBieSBFWFBFUlQuDQo+Pg0KPj4gSXQgc2hvdWxk
IGJlIG1lbnRpb25lZCB0aGF0IHRoZXJlIGhhdmUgYmVlbiByZXBvcnRzIHRoYXQgdGhlIGxp
bmtpbmcNCj4+IG9mIHRoZSB4ZW4uZWZpIG1pZ2h0IHRha2UgY29uc2lkZXJhYmx5IGxvbmdl
ciB3aXRoIENPTkZJR19ERUJVR19JTkZPDQo+PiBzZWxlY3RlZCB3aGVuIHVzaW5nIG5ld2Vy
IGJpbnV0aWxzLg0KPiANCj4gVGhpbmtpbmcgb2YgaXQ6IEJlY2F1c2Ugb2YgdGhlIG5lZWQg
dG8gZGVhbCB3aXRoIG9sZGVyIGJpbnV0aWxzLCB3ZQ0KPiBhbHJlYWR5IGZvcmNlIC0tc3Ry
aXAtZGVidWcgYXMgYSBsaW5raW5nIG9wdGlvbiBmb3IgeGVuLmVmaSBpbg0KPiBjZXJ0YWlu
IGNhc2VzLiBQZXJoYXBzIHdlIGNvdWxkIG1ha2UgYW5vdGhlciAoeDg2LW9ubHkpIEtjb25m
aWcNCj4gY29udHJvbCB3aGljaCBhbGxvd3MgdG8gZm9yY2UgdGhpcyBtb2RlIGV2ZW4gd2l0
aCByZWNlbnQgYmludXRpbHM/DQo+IElmIHNvLCB3b3VsZCB5b3UgYmUgd2lsbGluZyB0byBp
bmNsdWRlIHRoaXMgcmlnaHQgaGVyZSwgb3Igc2hvdWxkIEkNCj4gdGFrZSBjYXJlIG9mIHRo
aXMgYWZ0ZXJ3YXJkcyAob3IgbWF5YmUgZXZlbiBpbiBwYXJhbGxlbCk/DQoNCkknbSBwbGFu
bmluZyB0byBkbyB0aGUgRUZJIHNpZGUgaW4gdGhlIG5leHQgZGF5cywgaG9waW5nIHRoYXQg
SSBjYW4gc2V0dXANCnRoZSB0ZXN0IHN5c3RlbS4NCg0KSSdkIGluY2x1ZGUgdGhhdCBhZGRp
dGlvbmFsIGNvbmZpZyBvcHRpb24gaW4gdGhlIHByb2JhYmx5IG5lZWRlZCBwYXRjaChlcykN
CnRoZW4gKGNyYXNoIGlzbid0IGhhcHB5IHdpdGggeGVuLmVmaSBhbnl3YXksIHNvIEknbGwg
bmVlZCBzb21lIGtpbmQgb2YNCnhlbi1zeW1zLmVmaSBvciB3aGF0ZXZlciB5b3Ugd2FudCB0
byBjYWxsIGl0KS4NCg0KPiANCj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnDQo+PiArKysg
Yi94ZW4vS2NvbmZpZy5kZWJ1Zw0KPj4gQEAgLTExLDYgKzExLDEzIEBAIGNvbmZpZyBERUJV
Rw0KPj4gICANCj4+ICAgCSAgWW91IHByb2JhYmx5IHdhbnQgdG8gc2F5ICdOJyBoZXJlLg0K
Pj4gICANCj4+ICtjb25maWcgREVCVUdfSU5GTw0KPj4gKwlib29sICJDb21waWxlIFhlbiB3
aXRoIGRlYnVnIGluZm8iDQo+PiArCWRlZmF1bHQgREVCVUcNCj4+ICsJaGVscA0KPj4gKwkg
IElmIHlvdSBzYXkgWSBoZXJlIHRoZSByZXN1bHRpbmcgWGVuIHdpbGwgaW5jbHVkZSBkZWJ1
Z2dpbmcgaW5mbw0KPj4gKwkgIHJlc3VsdGluZyBpbiBhIGxhcmdlciBiaW5hcnkgaW1hZ2Uu
DQo+PiArDQo+PiAgIGlmIERFQlVHIHx8IEVYUEVSVA0KPiANCj4gSnVzdCB0byByZXBlYXQg
bXkgdjEgY29tbWVudCAodG8gd2hpY2ggeW91ciByZXNwb25zZSB3YXMgIkZpbmUgd2l0aCBt
ZSIpOg0KPiANCj4gVGhlIG5ldyBwbGFjZW1lbnQgaXNuJ3QgdmVyeSBoZWxwZnVsIHdoZW4g
Y29uc2lkZXJpbmcgc29tZSBvZiB0aGUgd2F5cw0KPiBrY29uZmlnIGRhdGEgaXMgcHJlc2Vu
dGVkLiBBdCBsZWFzdCBmb3IgdGhlIG5vbi1ncmFwaGljYWwgcHJlc2VudGF0aW9uDQo+IGl0
IHVzZWQgdG8gYmUgdGhlIGNhc2UgdGhhdCBoaWVyYXJjaGllcyB3ZXJlIHByZXNlbnRlZCBw
cm9wZXJseSBvbmx5DQo+IHdoZW4gZGVwZW5kZW5jaWVzIGltbWVkaWF0ZWx5IGZvbGxvd2Vk
IHRoZWlyIGRlcGVuZGVudHMgKGkuZS4gaGVyZToNCj4gREVCVUcgaXMgYSBkZXBlbmRlbnQg
b2YgZXZlcnl0aGluZyBpbnNpZGUgdGhlICJpZiIgYWJvdmUpLiBUaGVyZWZvcmUgSQ0KPiB0
aGluayByYXRoZXIgdGhhbiBtb3ZpbmcgdGhlIGJsb2NrIHVwIHlvdSBtYXkgYmV0dGVyIG1v
dmUgaXQgZG93biBwYXN0DQo+IHRoZSAiZW5kaWYiLg0KDQpPaCwgSSBzZWVtIHRvIGhhdmUg
bWlzc2VkIHRoYXQgbGFzdCBwYXJhZ3JhcGggd2hlbiBnb2luZyB0aHJvdWdoIHRoZSB0aHJl
YWQuDQoNCldpbGwgY29ycmVjdCBpdC4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------ZU19NvmbvRm5zir8Zt0wfHpu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZU19NvmbvRm5zir8Zt0wfHpu--

--------------U1KZpPbs6bUVrEt0X0kQ5wrL--

--------------o00O0sD67mTCNvhlEJMiCJzA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQte0gFAwAAAAAACgkQsN6d1ii/Ey8r
Kwf+KZyGG/vV4YsXnS/k3jLP3WZ7QBavZ1Y1KmL0eqAvSM3+fgHfX2wjqTjptCWSsVlBsQRpz03o
7QNDBlkJBUClhv3TmzB8g4htgQuZEMFTTOVXi7xwuwctB/VnklJ5BN9gnvLQv2sk7984L2OdrlBl
H9rWyLt7RBAyNNLil46PFyHoJonrRzAejQYgLDxA3NqHW21VPfNNfYWQUr1vNbEi4VOVBysKN2xE
9FCUaILN9pgKRSABkiZvlPo1StusNDCEONMlVz8wV2rFlx+W8FMonwUleJQgo6bFikL8l0ALZlRC
qJ7MemkhxLdcvqY3YLwJD0FqwWcvYRze7bd8+5JkNQ==
=T3r3
-----END PGP SIGNATURE-----

--------------o00O0sD67mTCNvhlEJMiCJzA--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16554C4756
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279138.476704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbSy-0007Px-0T; Fri, 25 Feb 2022 14:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279138.476704; Fri, 25 Feb 2022 14:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbSx-0007Nz-S9; Fri, 25 Feb 2022 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 279138;
 Fri, 25 Feb 2022 14:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNbSw-0007Na-Cm
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:21:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27fe86dd-9646-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 15:21:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C10A51F38B;
 Fri, 25 Feb 2022 14:21:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8945913BEA;
 Fri, 25 Feb 2022 14:21:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /K0WIMzlGGLJZAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 14:21:00 +0000
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
X-Inumbo-ID: 27fe86dd-9646-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645798860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UAV7wLYRHNjzDGv5jhiBwVgAofY76KduxbiwjOfQgn8=;
	b=Va5LMDDh7OTQ83gzegMLp+aTgRVRXIt60b5eQ4bANVjssqDj8gtLE/kSNwP+gOkisqKfHV
	FfSc623Rodpjjs0Pd1O5ojd34wqiOECwxQUI/5F+zUe/XCz80QXSTRzonYtBesB0fupLS0
	BFsU2GBdDdMTY5JAaEiJSlpyQPfCnx0=
Message-ID: <36a36a8f-0b93-9393-f446-6c85b9118532@suse.com>
Date: Fri, 25 Feb 2022 15:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
 <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
 <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
 <2295bb1c-6298-75b2-5f51-80bf114e365f@xen.org>
 <a27ff4b4-37ea-7bbc-eb43-6c4e6eb9277b@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a27ff4b4-37ea-7bbc-eb43-6c4e6eb9277b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Vu0sP6PNebs7qSkur4hAP3X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4Vu0sP6PNebs7qSkur4hAP3X
Content-Type: multipart/mixed; boundary="------------09EOFPML600r03fpLPlH2GSp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <36a36a8f-0b93-9393-f446-6c85b9118532@suse.com>
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
 <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
 <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
 <2295bb1c-6298-75b2-5f51-80bf114e365f@xen.org>
 <a27ff4b4-37ea-7bbc-eb43-6c4e6eb9277b@suse.com>
In-Reply-To: <a27ff4b4-37ea-7bbc-eb43-6c4e6eb9277b@suse.com>

--------------09EOFPML600r03fpLPlH2GSp
Content-Type: multipart/mixed; boundary="------------FGS0c7d4WFH3HQk4l7A9qOK0"

--------------FGS0c7d4WFH3HQk4l7A9qOK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDIuMjIgMTE6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wMi4yMDIy
IDExOjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAyNS8wMi8yMDIyIDA4OjEyLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wMi4yMDIyIDIzOjU1LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6DQo+Pj4+IE9uIDE2LzAyLzIwMjIgMDk6MjksIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4gT24gMTYuMDIuMjAyMiAwODoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+
Pj4+PiBPbiAxNS4wMi4yMiAyMjoxMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4+PiBB
cyBhIHNpZGUgbm90ZSwgc2hvdWxkIHdlIGFsc28gdXBkYXRlIFNVUFBPUlQubWQ/DQo+Pj4+
Pj4NCj4+Pj4+PiBHb29kIHF1ZXN0aW9uLg0KPj4+Pj4NCj4+Pj4+IEknbSBub3Qgc3VyZSBo
ZXJlIGVpdGhlciAtIHRhbGtpbmcgYWJvdXQgaW5kaXZpZHVhbCBoeXBlcmNhbGwgc3ViLW9w
cw0KPj4+Pj4gc2VlbXMgb3Zlcmx5IHNtYWxsIGdyYW51bGFyaXR5IHRvIG1lIGZvciB0aGlz
IGtpbmQgb2YgZG9jLiBQbHVzIEkNCj4+Pj4+IGRvbid0IHZpZXcgZGVwcmVjYXRpb24gYW5k
IGRlLXN1cHBvcnRpbmcgYXMgdGhlIHNhbWUgdGhpbmcuIFRoZSBsYXR0ZXINCj4+Pj4+IHdv
dWxkIG1lYW4gdG8gcmVuZGVyIHVuc3VwcG9ydGVkIGFueSBvbGQgWGVub0xpbnV4IHdoaWNo
IG1heSBzdGlsbCBiZQ0KPj4+Pj4gaW4gdXNlLCBhbGwgb2YgdGhlIHN1ZGRlbi4NCj4+Pj4N
Cj4+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgd291bGQgcmVzdWx0IHRvIHVuc3VwcG9ydCBzb21l
IG9sZCBPU2VzIChub3QgY2xlYXIgaG93DQo+Pj4+IG9sZCkuIEhvd2V2ZXIsIGZyb20gd2hh
dCBKdWVyZ2VuIHNhaWQgdGhpcyBmZWF0dXJlIGlzIHVudGVzdGVkLg0KPj4+Pg0KPj4+PiBU
byBtZSBpdCBzb3VuZCBsaWtlIHdlIGFyZSBub3QgY29uZmlkZW50IHRoYXQgd2UgY291bGQg
c2VjdXJpdHkgc3VwcG9ydA0KPj4+PiB0aGlzIGZlYXR1cmUuDQo+Pj4+DQo+Pj4+IFNvIEkg
YW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB3aHkgd2Ugb25seSB3YW50IHRvIGRlcHJlY2F0
ZSBpdC4NCj4+Pg0KPj4+IE5vdCBzdXJlIHdoYXQgdG8gc2F5OiBSZW5kZXJpbmcgdW5zdXBw
b3J0ZWQgaG93ZXZlciBvbGQgZ3Vlc3RzIGlzIG5vdA0KPj4+IGEgbmljZSBzdGVwLiBIZW5j
ZSBteSBjb25jZXJuICh3aGljaCBpc24ndCBhbiBvdXRyaWdodCBvYmplY3Rpb24pLg0KPj4N
Cj4+IEluIHRoZSBwYXN0IHdlIGhhdmUgcmVtb3ZlZCBzdXBwb3J0IGZvciBmZWF0dXJlIHdl
IGRlZW1lZCB1bnNhZmUgdG8gdXNlDQo+PiBhbmQgaXQgd291bGQgcmVxdWlyZSBlZmZvcnQg
dG8gc2VjdXJlIGl0LiBUaGlzIGlzIGRlc3BpdGUgdGhlIGZhY3QgdGhhdA0KPj4gaXQgbWF5
IGJlIHVzZWQgaW4gcHJvZHVjdGlvbiAoZS5nLiBQViBkZXZpY2VzLCBxZW11IHRyYWQuLi4p
Lg0KPj4NCj4+IFNvIEkgdGhpbmsgdGhlIHF1ZXN0aW9uIGhlcmUgaXMgcmVhbGx5LCBkbyB5
b3UgdGhpbmsgd2UgY2FuIHNlbnNpYmx5DQo+PiBzZWN1cml0eSBzdXBwb3J0IEdOVFRBQk9Q
X3RyYW5zZmVyPw0KPiANCj4gSSBkb24ndCB0aGluayBpdCdzIGEgcXVlc3Rpb24gb2YgImNh
biIsIGJ1dCBvZiAiYXJlIHdlIHdpbGxpbmcgdG8iLiBJdA0KPiB3b3VsZCBiZSAiY2FuIiBv
bmx5IGlmIHdlIGxlYXJuZWQgb2Ygc29tZSBzZWVtaW5nbHkgdmVyeSBoYXJkIHRvIHNvbHZl
DQo+IGlzc3VlLiBGcm9tIGEgd29ya2xvYWQgcGVyc3BlY3RpdmUgaXQgd291bGQgY2VydGFp
bmx5IGJlIG5pY2UgaWYgd2UNCj4gZGlkbid0IGhhdmUgdG8gdGhpbmsgYWJvdXQgdGhpcyBh
bnltb3JlLiBZZXQgbGlrZSBpbiBjZXJ0YWluIG90aGVyDQo+IGNhc2VzLCBiZXNpZGVzIHRo
ZSBwYXJ0aWN1bGFyIGl0ZW0gaGVyZSBJJ20gYWxzbyB3b3JyaWVkIG9mIHNldHRpbmcNCj4g
YSBwcmVjZWRlbnQgd2hpY2ggbWF5IHRoZW4gYmUgdXNlZCB0byBhcmd1ZSBmb3IgdGhlIHJl
bW92YWwgb2Ygc3VwcG9ydA0KPiBmb3Igb3RoZXIgb3BlcmF0aW9ucywganVzdCB0byBtYWtl
IG91ciBsaXZlcyBlYXNpZXIuDQoNCkp1c3Qgb25lIGNvbW1lbnQ6IGRlc3VwcG9ydGluZyBH
TlRUQUJPUF90cmFuc2ZlciB3b3VsZCBoaXQgb25seSBzeXN0ZW1zDQp3aXRoIGEgWGVub0xp
bnV4IGRvbTAuIEkgdGhpbmsgdGhvc2UgcnVubmluZyBvbiBhIHN0aWxsIHN1cHBvcnRlZCBY
ZW4NCnZlcnNpb24gYXJlIHJlYWxseSByYXJlIHRoZXNlIGRheXMuDQoNCg0KSnVlcmdlbg0K

--------------FGS0c7d4WFH3HQk4l7A9qOK0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FGS0c7d4WFH3HQk4l7A9qOK0--

--------------09EOFPML600r03fpLPlH2GSp--

--------------4Vu0sP6PNebs7qSkur4hAP3X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIY5cwFAwAAAAAACgkQsN6d1ii/Ey8+
JwgAjXqAdOTRAP1BNGPLP2DKLc7h7dO3HxGZVWjEv6Lyk/duf/iunCanKYbXOFiXzROsWjm/8yMd
fxgxDA+uBOXTMgjdjDoJcgw+8kEgZ5xXpIEVNw5tM/M3ud3Y3/SJwcA1jzjjDk1OWqhNyL1twY19
LOSh1EoWmo9DHsVksJZ+It26/3w8aqnyyIfnDzErHgqxy73Ga5VLJzfTDd+b9S2KdT2JivFP5wGl
jilY3f51HWmATGq5srJ7Q1JgVm7dJoN/diDji5cKI7DFPW8HlskymCSQ2Q396jPudzsW1yZd3zXv
1HpYeoVEr6tTGk1lso09Xf6aNhyrlVxtE0Iv5pwB2A==
=KyBk
-----END PGP SIGNATURE-----

--------------4Vu0sP6PNebs7qSkur4hAP3X--


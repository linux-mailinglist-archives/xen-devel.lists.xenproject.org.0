Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79D69F1E9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 10:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499307.770392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUlZJ-0001hz-Gp; Wed, 22 Feb 2023 09:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499307.770392; Wed, 22 Feb 2023 09:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUlZJ-0001fl-DV; Wed, 22 Feb 2023 09:37:45 +0000
Received: by outflank-mailman (input) for mailman id 499307;
 Wed, 22 Feb 2023 09:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUlZH-0001ff-Qv
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 09:37:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c499b91-b294-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 10:37:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 839C45C341;
 Wed, 22 Feb 2023 09:37:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A373139DB;
 Wed, 22 Feb 2023 09:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xX/GFGPi9WPBZAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Feb 2023 09:37:39 +0000
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
X-Inumbo-ID: 8c499b91-b294-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677058659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Iji8OsdvXBhM/POPsPgFug1wYdIPUler1Sxos8F54g=;
	b=VSD+OIL8BXUoaRJvG+Tba/xlaswW2gJMECurw6bHg3QO8j1h4sLjZGd87pfxkR9ei+4F/G
	hBaqJY84Fua2hGg0CtsuWGQZygYgUw8lPtsup+oa3P0MOG0pNv0lEg94f53sEvUChHAjU1
	MLBswK5DXMGvN7jWvBPirUDDjRJKTyg=
Message-ID: <a51cf7d2-a3ba-b68d-ee52-899328201a16@suse.com>
Date: Wed, 22 Feb 2023 10:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
 <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
 <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
 <f73142d0-d550-78e3-6119-a963560d0b12@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f73142d0-d550-78e3-6119-a963560d0b12@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OzNMiYGf4oUyP9My4G6kRV9J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OzNMiYGf4oUyP9My4G6kRV9J
Content-Type: multipart/mixed; boundary="------------N07yogLjHR4aWprqHXhRtYl1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Message-ID: <a51cf7d2-a3ba-b68d-ee52-899328201a16@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
 <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
 <5fc2636e-45b0-e515-d901-18dc5fc214eb@xen.org>
 <28c5c478-b1b6-c8e1-ce9c-287e8afc604a@suse.com>
 <f73142d0-d550-78e3-6119-a963560d0b12@xen.org>
In-Reply-To: <f73142d0-d550-78e3-6119-a963560d0b12@xen.org>

--------------N07yogLjHR4aWprqHXhRtYl1
Content-Type: multipart/mixed; boundary="------------av6WNI7RO55KITFxB6HOvG7b"

--------------av6WNI7RO55KITFxB6HOvG7b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjMgMDk6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIyLzAyLzIwMjMgMDg6MzYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMS4wMi4yMyAyMzozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAyMS8wMi8yMDIzIDA4OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBPbiAyMC4wMi4yMyAxOTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gU28g
SSBoYXZlIHJlY3JlYXRlZCBhbiBYVEYgdGVzdCB3aGljaCBJIHRoaW5rIG1hdGNoIHdoYXQg
eW91IHdyb3RlIFsxXS4NCj4+Pj4+DQo+Pj4+PiBJdCBpcyBpbmRlZWQgZmFpbGluZyB3aXRo
b3V0IHlvdXIgcGF0Y2guIEJ1dCB0aGVuIHRoZXJlIGFyZSBzdGlsbCBzb21lIA0KPj4+Pj4g
d2VpcmQgYmVoYXZpb3IgaGVyZS4NCj4+Pj4+DQo+Pj4+PiBJIHdvdWxkIGV4cGVjdCB0aGUg
Y3JlYXRpb24gb2YgdGhlIG5vZGUgd291bGQgYWxzbyBmYWlsIGlmIGluc3RlYWQgb2YgDQo+
Pj4+PiByZW1vdmluZyB0aGUgbm9kZSBpZiByZW1vdmVkIG91dHNpZGUgb2YgdGhlIHRyYW5z
YWN0aW9uLg0KPj4+Pj4NCj4+Pj4+IFRoaXMgaXMgbm90IHRoZSBjYXNlIGJlY2F1c2Ugd2Ug
YXJlIGxvb2tpbmcgYXQgdGhlIGN1cnJlbnQgcXVvdGEuIFNvIA0KPj4+Pj4gc2hvdWxkbid0
IHdlIHNuYXBzaG90IHRoZSBnbG9iYWwgY291bnQ/DQo+Pj4+DQo+Pj4+IEFzIHdlIGRvbid0
IGRvIGEgZ2xvYmFsIHNuYXBzaG90IG9mIHRoZSBkYXRhIGJhc2UgZm9yIGEgdHJhbnNhY3Rp
b24gKHRoaXMgd2FzDQo+Pj4+IGNoYW5nZWQgZHVlIHRvIGh1Z2UgbWVtb3J5IG5lZWRzLCBi
YWQgcGVyZm9ybWFuY2UsIGFuZCBhIGhpZ2hlciB0cmFuc2FjdGlvbg0KPj4+PiBmYWlsdXJl
IHJhdGUpLCANCj4+Pg0KPj4+IEkgYW0gYSBiaXQgc3VycHJpc2VkIHRoYXQgdGhlIG9ubHkg
d2F5IHRvIGRvIHByb3BlciB0cmFuc2FjdGlvbiBpcyB0byBoYXZlIGEgDQo+Pj4gZ2xvYmFs
IHNuYXBzaG90LiBJbnN0ZWFkLCB5b3UgY291bGQgaGF2ZSBhbiBvdmVybGF5Lg0KPj4NCj4+
IEkgZGlkbid0IHNheSB0aGF0IGEgZ2xvYmFsIHNuYXBzaG90IGlzIHRoZSBvbmx5IHdheS4g
QW5kIHdlIGFyZSB1c2luZyBhbg0KPj4gb3ZlcmxheS4NCj4+DQo+Pj4NCj4+Pj4gSSBkb24n
dCB0aGluayB3ZSBzaG91bGQgc25hcHNob3QgdGhlIGNvdW50IGVpdGhlci4NCj4+Pg0KPj4+
IEJ1dCB0aGF0IHdvdWxkIG1lYW4gdGhhdCB0aGUgcXVvdGEgd2lsbCBjaGFuZ2UgZGVwZW5k
aW5nIG9uIG1vZGlmaWNhdGlvbiBvZiANCj4+PiB0aGUgZ2xvYmFsIGRhdGFiYXNlIHdoaWxl
IHRoZSB0cmFuc2FjdGlvbiBpcyBpbmZsaWdodC4NCj4+DQo+PiBJIHJlYWxseSBkb24ndCBz
ZWUgdGhlIHByb2JsZW0gd2l0aCB0aGF0LiBCdXQgaXQgc2VlbXMgb3VyIHZpZXdzIGFyZSBk
aWZmZXJlbnQNCj4+IGluIHRoaXMgY2FzZS4NCj4gDQo+IFNlZSBiZWxvdy4NCj4gDQo+Pg0K
Pj4+IEkgZ3Vlc3MgdGhpcyBpcyBub3QgYmV0dGVyIG5vciB3b3JzZSB0aGF0IHRoZSBjdXJy
ZW50IHNpdHVhdGlvbi4gQnV0IGl0IGlzIA0KPj4+IHN0aWxsIHJlYWxseSBjb25mdXNpbmcg
Zm9yIGEgY2xpZW50IGJlY2F1c2U6DQo+Pj4gwqDCoCAxKSBUaGUgZXJyb3IgY291bGQgaGFw
cGVuIGF0IHJhbmRvbSBwb2ludA0KPj4NCj4+IFllcywgbGlrZSB3aXRob3V0IGEgdHJhbnNh
Y3Rpb24uDQo+Pg0KPj4+IMKgwqAgMikgWW91IG1heSBzZWUgYW4gaW5jb25zaXN0ZW50IGRh
dGFiYXNlIGFzIG5vZGVzIGFyZSBvbmx5IGNhY2hlZCB3aGVuIHRoZXkgDQo+Pj4gYXJlIGZp
cnN0IGFjY2Vzc2VkDQo+Pg0KPj4gSXQgaXNuJ3QgaW5jb25zaXN0ZW50IGF0IGFsbC4gVGhl
IHNhbWUgY291bGQgaGFwcGVuIGlmIHN1Y2ggb3RoZXIgbm9kZXMgYXJlDQo+PiBhZGRlZC9t
b2RpZmllZC9yZW1vdmVkIGp1c3QgYSBtaWNyb3NlY29uZCBiZWZvcmUgeW91IHN0YXJ0IHRo
ZSB0cmFuc2FjdGlvbi4NCj4+IFlvdSB3b24ndCBiZSBhYmxlIHRvIHRlbGwgdGhlIGRpZmZl
cmVuY2UuIFlvdSBjYW4gb25seSByZWFzb24gYWJvdXQgbm9kZXMNCj4+IGJlaW5nIGFjY2Vz
c2VkIGluIHRoZSB0cmFuc2FjdGlvbiwgYW5kIHRob3NlIGFyZSB0cmFuc2FjdGlvbi1sb2Nh
bC4NCj4gDQo+IEkgYW0gbm90IHRhbGtpbmcgYWJvdXQgdGhlIGNhc2UgYSBub2RlIGlzIGFk
ZGVkL21vZGlmaWVkL3JlbW92ZWQgb3V0c2lkZSBvZiBhIA0KPiB0cmFuc2FjdGlvbi4gSSBh
bSB0YWxraW5nIGFib3V0IHRoZSBpbi10cmFuc2FjdGlvbiBjYXNlLiBGb3IgZXhhbXBsZSwg
bGV0IHNheSB3ZSANCj4gaGF2ZSBhIHRyYW5zYWN0aW9uIEEgdGhhdCByZW1vdmUgbm9kZSAx
LCAyIGFuZCB0cmFuc2FjdGlvbiBCIHRvIGFjY2VzcyAxLCAyIChpdCANCj4gbWF5IGRvIG1v
cmUpLg0KPiANCj4gTm93IGxldCdzIGltYWdpbmUgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZSB3
aXRoIHRoZSBpbml0aWFsIHN0YXRlIGlzIG5vZGUgMSBhbmQgMiANCj4gZXhpc3RzOg0KPiAN
Cj4gIMKgLSBUQSBzdGFydGVkDQo+ICDCoC0gVEEgcmVtb3ZlIDENCj4gIMKgLSBUQSByZW1v
dmUgMg0KPiAgwqAtIFRBIHJlbW92ZSAzDQo+ICDCoC0gVEIgc3RhcnRlZA0KPiAgwqAtIFRC
IHJlYWQgMQ0KPiAgwqAtIFRBIGVuZGVkDQo+ICDCoC0gVEIgcmVhZCAyDQo+IA0KPiBXaXRo
IHRoZSBhYm92ZSwgb25lIHdvdWxkIGV4cGVjdCB0aGF0IHRyYW5zYWN0aW9uIEIgY2FuIHJl
YWQgMiBhcyB0cmFuc2FjdGlvbiBBIA0KPiBkaWRuJ3QgY29tbWl0IGJlZm9yZSBCIHN0YXJ0
ZWQuIEJ1dCB0aGlzIGlzIG5vdCB3aGF0J3MgaGFwcGVuaW5nLg0KPiANCj4gTXkgcG9pbnQg
aGVyZSBpcyB0aGF0IGEgcHJvdG9jb2wgY291bGQgcmVxdWlyZSB0aGF0IGlmIDEgaXMgcHJl
c2VudCB0aGVuIDIgaXMuIA0KPiBTbyBpdCB3b3VsZCBiZSB2YWxpZCBmb3IgYSBjbGllbnQg
dG8gZXJyb3Igb3V0IGJlY2F1c2UgdGhlIG90aGVyIHNpZGUgd2FzIA0KPiBjb25zaWRlcmVk
IHRvIGhhdmUgbWlzYmVoYXZlZC4gSG93ZXZlciwgaGVyZSB0aGlzIGlzIGp1c3QgaG93IFhl
bnN0b3JlZCBiZWhhdmUgDQo+IGFuZCBBRkFJQ1QgaXQgaXMgdW5kb2N1bWVudGVkLg0KDQpB
aCwgb2theS4NCg0KWWVzLCBJIGNhbiBzZWUgeW91ciBwb2ludC4NCg0KSSB3YXMgdGhpbmtp
bmcgZm9yIHNvbWUgdGltZSBub3cgdG8gc3dpdGNoIG92ZXIgdG8gYSAiQ29weSBvbiBXcml0
ZSIgc2NoZW1lIGZvcg0KdHJhbnNhY3Rpb25zLiBUaGlzIHdpbGwgcmVxdWlyZSB0byBnZXQg
cmlkIG9mIFREQiwgYXMgb3RoZXJ3aXNlIGl0IHdpbGwgYmUgcXVpdGUNCmhhcmQgdG8gc2V0
dXAgdGhlIG5lZWRlZCBsaW5rcyBiZXR3ZWVuIG5vZGVzLg0KDQpJJ20gcXVpdGUgY2xvc2Ug
dG8gc3VjY2VlZCBvbiB0aGUgVERCIHJlbW92YWwuIFN3aXRjaGluZyB0aGUgdHJhbnNhY3Rp
b24NCm1lY2hhbmlzbSB3aWxsIG5lZWQgc29tZSBtb3JlIHRob3VnaHRzLCB0aG91Z2guDQoN
ClNvIHRoaXMgaXMgbm90aGluZyBJJ2xsIGJlIGFibGUgdG8gc29sdmUgc29vbi4gOy0pDQoN
Cg0KSnVlcmdlbg0K
--------------av6WNI7RO55KITFxB6HOvG7b
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------av6WNI7RO55KITFxB6HOvG7b--

--------------N07yogLjHR4aWprqHXhRtYl1--

--------------OzNMiYGf4oUyP9My4G6kRV9J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP14mIFAwAAAAAACgkQsN6d1ii/Ey9z
igf9GLwzr9R2fLV7Kefkg+u4e5kGZlqOIQVtiComlHwXg1CTWWh1y0HgDX7tLmfN2b2Yy85YYd64
856pLJx4w8ye7m3rgErks6kI7FkMAHOq3UulTXcifm+NdYfsWneICZoJzyA8TL1zcYLMwue7B0SN
1NLTpXrJUMpC4ssgTcm8rajP/1ahq3/rW0uL7SyzMAgVRiPGDeTiLNU6YZWI0mDUrrLvAJqAJwKk
bIoAWJbOjT2cADEoLlg4zHA5ex6KjASKVN0j4CZzpgffPzNdU4Tg7DqFf1Tap23cW5cIERpbgH3X
+sRRG9fZhSdx0zrk9DklIs45Ftb88VJF6U33NgniHw==
=lEjF
-----END PGP SIGNATURE-----

--------------OzNMiYGf4oUyP9My4G6kRV9J--


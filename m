Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EA73E114
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 15:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555521.867345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmdn-0003va-9G; Mon, 26 Jun 2023 13:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555521.867345; Mon, 26 Jun 2023 13:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmdn-0003sf-5V; Mon, 26 Jun 2023 13:52:27 +0000
Received: by outflank-mailman (input) for mailman id 555521;
 Mon, 26 Jun 2023 13:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ib7E=CO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qDmdl-0003sZ-UY
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 13:52:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7eceb0-1428-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 15:52:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 734D11F898;
 Mon, 26 Jun 2023 13:52:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F1FE13483;
 Mon, 26 Jun 2023 13:52:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id REjbDReYmWSEcwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Jun 2023 13:52:23 +0000
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
X-Inumbo-ID: ad7eceb0-1428-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687787543; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lzth4Sx29xjaSLfIoyIJ4zwdue10uluRR6cpznhU/xI=;
	b=bW47Qs3BUGg77b6IlEkFs33Og9LMZQg1S2RZYUEHYC1e69FtVot1Z2rRNW+Cj8gT9grGiR
	ueuYy7K9cB7fI1bodigHZ2/DIIwQVHN5iFJoQBpHeq+viWItrtfjQcGa1rSHAfKHnQGOm6
	c/GdtcJF/FlCQEjkaYbvlWbbb6A4p14=
Message-ID: <2ded70cd-dde8-640b-866a-bc9d357963e2@suse.com>
Date: Mon, 26 Jun 2023 15:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
 <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
 <a1cea404-329b-1516-bc7c-1f9d427751a4@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a1cea404-329b-1516-bc7c-1f9d427751a4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SmDqFT5bujW77jyQOhpM3vJe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SmDqFT5bujW77jyQOhpM3vJe
Content-Type: multipart/mixed; boundary="------------CEpDAPNp0sa0tB2ou9L6qv0d";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2ded70cd-dde8-640b-866a-bc9d357963e2@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <a9aaf2df-f3c6-71a5-426d-096d9aaf0545@xen.org>
 <2bfc737a-53c5-ef13-835e-97933a57f414@suse.com>
 <a1cea404-329b-1516-bc7c-1f9d427751a4@xen.org>
In-Reply-To: <a1cea404-329b-1516-bc7c-1f9d427751a4@xen.org>

--------------CEpDAPNp0sa0tB2ou9L6qv0d
Content-Type: multipart/mixed; boundary="------------7MLjRQtPRQNYigJg3m07ubMi"

--------------7MLjRQtPRQNYigJg3m07ubMi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDYuMjMgMTU6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI2LzA2LzIwMjMgMTI6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxOS4wNi4yMyAyMDoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBjb2RlIGluIGRldGFpbHMgeWV0
LiBCdXQgSSBoYXZlIGEgZmV3IHF1ZXN0aW9ucyANCj4+PiByZWdhcmRpbmcgdGhlIGNvbW1p
dCBtZXNzYWdlLw0KPj4+DQo+Pj4gT24gMzAvMDUvMjAyMyAxMDoxMywgSnVlcmdlbiBHcm9z
cyB3cm90ZToNCj4+Pj4gVG9kYXkgYWxsIFhlbnN0b3JlIG5vZGVzIGFyZSBzdG9yZWQgaW4g
YSBUREIgZGF0YSBiYXNlLiBUaGlzIGRhdGEgYmFzZQ0KPj4+PiBoYXMgc2V2ZXJhbCBkaXNh
ZHZhbnRhZ2VzOg0KPj4+Pg0KPj4+PiAtIGl0IGlzIHVzaW5nIGEgZml4ZWQgc2l6ZWQgaGFz
aCB0YWJsZSwgcmVzdWx0aW5nIGluIGhpZ2ggbWVtb3J5DQo+Pj4+IMKgwqAgb3ZlcmhlYWQg
Zm9yIHNtYWxsIGluc3RhbGxhdGlvbnMgd2l0aCBvbmx5IHZlcnkgZmV3IFZNcywgYW5kIGEg
cmF0aGVyDQo+Pj4+IMKgwqAgbGFyZ2UgcGVyZm9ybWFuY2UgaGl0IGZvciBzeXN0ZW1zIHdp
dGggbG90cyBvZiBWTXMgZHVlIHRvIG1hbnkNCj4+Pj4gwqDCoCBjb2xsaXNpb25zDQo+Pj4N
Cj4+PiBDYW4geW91IHByb3ZpZGUgc29tZSBjb25jcmV0ZSBudW1iZXJzIGFuZCBhIHNldHVw
IGluIG1pbmQ/IFRoaXMgd291bGQgaGVscCBpZiANCj4+PiBzb21lb25lIGluIHRoZSBmdXR1
cmUgc2F5cyB0aGF0IHRoZXkgc2VlIHRoZSBpbnZlcnNlIGFuZCB3ZSBuZWVkIHRvIHJld29y
ayANCj4+PiB0aGUgbG9naWMuDQo+Pg0KPj4gVGhlIGhhc2ggdGFibGUgc2l6ZSB0b2RheSBp
cyA3OTE5IGVudHJpZXMuIFRoaXMgbWVhbnMgdGhhdCBlLmcuIGluIGNhc2UNCj4+IG9mIGEg
c2ltcGxlIGRlc2t0b3AgdXNlIGNhc2Ugd2l0aCAyIG9yIDMgVk1zIHByb2JhYmx5IGZhciBs
ZXNzIHRoYW4gMTAlDQo+PiBvZiB0aGUgZW50cmllcyB3aWxsIGJlIHVzZWQgKGFzc3VtaW5n
IHJvdWdobHkgMTAwIG5vZGVzIHBlciBWTSkuIE9UT0ggYQ0KPj4gc2V0dXAgb24gYSBsYXJn
ZSBzZXJ2ZXIgd2l0aCA1MDAgVk1zIHdvdWxkIHJlc3VsdCBpbiBoZWF2eSBjb25mbGljdHMg
aW4NCj4+IHRoZSBoYXNoIGxpc3Qgd2l0aCA1LTEwIG5vZGVzIHBlciBoYXNoIHRhYmxlIGVu
dHJ5Lg0KPiANCj4gVGhhbmtzISBDYW4gdGhpcyBiZSB3cml0dGVuIGRvd24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlPw0KDQpPa2F5Lg0KDQo+IA0KPj4+PiBTbyBkcm9wIHVzaW5nIFREQiBh
bmQgc3RvcmUgdGhlIG5vZGVzIGRpcmVjdGx5IGluIG1lbW9yeSBtYWtpbmcgdGhlbQ0KPj4+
PiBlYXNpbHkgYWNjZXNzaWJsZS4gVXNlIGEgaGFzaC1iYXNlZCBsb29rdXAgbWVjaGFuaXNt
IGZvciBmYXN0IGxvb2t1cA0KPj4+PiBvZiBub2RlcyBieSB0aGVpciBmdWxsIHBhdGguDQo+
Pj4+DQo+Pj4+IEZvciBub3cgb25seSByZXBsYWNlIFREQiBrZWVwaW5nIHRoZSBjdXJyZW50
IGFjY2VzcyBmdW5jdGlvbnMuDQo+Pj4NCj4+PiBEbyB5b3UgcGxhbiB0byBoYXZlIHRoZSBy
ZXN0IG9mIHRoZSB3b3JrIHVwc3RyZWFtZWQgZm9yIDQuMTg/IEFsc28sIGlmIGZvciANCj4+
PiBzb21lIHJlYXNvbnMsIG9ubHkgdGhpcyB3b3JrIHdpbGwgYmUgbWVyZ2VkLiBXaWxsIHRo
aXMgaGF2ZSBhbiBpbXBhY3Qgb24gDQo+Pj4gWGVuc3RvcmVkIG1lbW9yeSB1c2FnZS9wZXJm
b3JtYW5jZT8NCj4+DQo+PiBNZW1vcnkgdXNhZ2Ugc2hvdWxkIGdvIGRvd24sIGVzcGVjaWFs
bHkgYWZ0ZXIgZGVsZXRpbmcgbG90cyBvZiBlbnRyaWVzDQo+PiAoQUZBSUsgVERCIHdpbGwg
bmV2ZXIgZnJlZSB0aGUgdW51c2VkIG1lbW9yeSBhZ2FpbiwgaXQgd2lsbCBqdXN0IGtlZXAg
aXQNCj4+IGZvciB0aGUgZnV0dXJlKS4NCj4+DQo+PiBNZW1vcnkgZnJhZ21lbnRhdGlvbiBt
aWdodCBnbyB1cCwgdGhvdWdoLg0KPj4NCj4+IFBlcmZvcm1hbmNlIG1pZ2h0IGJlIGJldHRl
ciwgdG9vLCBhcyB0aGVyZSBpcyBubyBuZWVkIHRvIHJlYWxsb2MoKSB0aGUNCj4+IG1lbW9y
eSB3aGVuIGFkZGluZyBub2Rlcy4NCj4gDQo+IFdoYXQgeW91IHdyaXRlIHNlZW1zIHRvIGJl
IHF1aXRlIGh5cG90aGV0aWNhbCBzbyBmYXIuIEdpdmVuIHRoZXJlIHRoaXMgaXMgbm90IA0K
PiBnYXRlZCBieSBhbiAjaWZkZWYsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBoYXZl
IGEgZ29vZCBpZGVhIG9mIHRoZSBpbXBhY3QgDQo+IHRvIGhhdmUgb25seSB0aGUgcGFydGlh
bCByZXdvcmsuDQoNCkkgaGF2ZSBjaGVja2VkIGl0LiBXaXRob3V0IG15IHBhdGNoZXMgbWVt
b3J5IGNvbnN1bXB0aW9uIGlzIGFib3V0IDgwayBhZnRlcg0KY3JlYXRpbmcgYW5kIHNodXR0
aW5nIGRvd24gYSBndWVzdCBhZ2Fpbi4gV2l0aCBteSBwYXRjaGVzIGl0IGlzIDE4ay4NCg0K
UGVyZm9ybWFuY2Ugc2VlbXMgYSBsaXR0bGUgYml0IGJldHRlciB3aXRoIG15IHBhdGNoZXMs
IGJ1dCB0aGlzIG1pZ2h0IGJlDQpyZWFsdGVkIHRvIGEgYmFkIHRlc3QgKEkganVzdCB1c2Vk
IHhlbnN0b3JlLXRlc3Qgd2hpY2ggZG9lc24ndCBkbyBtYW55IG5vZGVzDQppbiBwYXJhbGxl
bCkuDQoNCg0KSnVlcmdlbg0K
--------------7MLjRQtPRQNYigJg3m07ubMi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7MLjRQtPRQNYigJg3m07ubMi--

--------------CEpDAPNp0sa0tB2ou9L6qv0d--

--------------SmDqFT5bujW77jyQOhpM3vJe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSZmBYFAwAAAAAACgkQsN6d1ii/Ey9Q
kwgAlDoHcDutLIdfeksVAuX1Vzqejj5o06K/pwTjgTl+RuOvigbGg8GhJHroOGYUhMNZUv+FBvFN
Sz6K2n8378Ke1KH0rX/pVYoz6tK+SL3eaJQDrz3QCnK5OD56M5GtyCZ6qVTE7LjVyf5FemaDIZNG
5SG5el+qrUqU5d9QqNOU+A251Gr04b+/wZ7vaQkZYKvqgq2XOGXROSCaV0dakJi7/YKoR9DAVugF
D+qRuLYJcwo6b1ACTlT/7/nu5AIK0OUsg72PE9cBfyZKUkKIZy46gSN+h9WXktlXNN1XEHFJnptS
HOvk9+9MPd5ghhUqRvG7960/btHFWFRrn8in8YDwaw==
=dEvV
-----END PGP SIGNATURE-----

--------------SmDqFT5bujW77jyQOhpM3vJe--


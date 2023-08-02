Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E723C76C446
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 06:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574688.900201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR3of-0001YE-Ru; Wed, 02 Aug 2023 04:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574688.900201; Wed, 02 Aug 2023 04:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR3of-0001Vc-OQ; Wed, 02 Aug 2023 04:50:33 +0000
Received: by outflank-mailman (input) for mailman id 574688;
 Wed, 02 Aug 2023 04:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qR3oe-0001VS-54
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 04:50:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba25f9a-30f0-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 06:50:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFE391F38D;
 Wed,  2 Aug 2023 04:50:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A06C13909;
 Wed,  2 Aug 2023 04:50:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OowjJJbgyWT+VgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Aug 2023 04:50:30 +0000
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
X-Inumbo-ID: 1ba25f9a-30f0-11ee-b25e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690951830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O9bKgcdWKomLWy0HXyWDVTSHUSkrbXKE1jyDrwiAGAc=;
	b=BcJyH7XoKhEmX1vTLSnJCMFCzupA/m8NPozRqPVcC+aitAn4jgZd1uoIz2lG+NDl0D9Cdt
	XW37OcfWWUUpuQ7I+19klbizIVOv71lXNIkEzAbVPC0DXRzGFvtTwIc2BRNGOZ0Hdk+Ljk
	yCyqNXX6bhVFjtgNCT2AUK32ZV/mZRM=
Message-ID: <09811df6-96da-c1a0-be1c-24e2f6d6dacb@suse.com>
Date: Wed, 2 Aug 2023 06:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 19/25] tools/xenstore: use struct node_hdr in struct
 node
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-20-jgross@suse.com>
 <dc888f49-0e9e-cce3-541e-9eb6cc6d599b@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <dc888f49-0e9e-cce3-541e-9eb6cc6d599b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------43R0FoyWmr04auMdovkISPsS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------43R0FoyWmr04auMdovkISPsS
Content-Type: multipart/mixed; boundary="------------Zjb7PCGdBmkKPLGeyTjhW6GI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <09811df6-96da-c1a0-be1c-24e2f6d6dacb@suse.com>
Subject: Re: [PATCH v3 19/25] tools/xenstore: use struct node_hdr in struct
 node
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-20-jgross@suse.com>
 <dc888f49-0e9e-cce3-541e-9eb6cc6d599b@xen.org>
In-Reply-To: <dc888f49-0e9e-cce3-541e-9eb6cc6d599b@xen.org>

--------------Zjb7PCGdBmkKPLGeyTjhW6GI
Content-Type: multipart/mixed; boundary="------------HGEQ8N0lasvqxxGD0fBYFuGl"

--------------HGEQ8N0lasvqxxGD0fBYFuGl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDguMjMgMjM6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IGluZGV4IGM3MmZjMGM3MjUuLjQwNGVjZDBj
NjIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+
PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBAQCAtNTU1LDYg
KzU1NSwxMiBAQCBzdGF0aWMgdm9pZCBpbml0aWFsaXplX2ZkcyhpbnQgKnBfc29ja19wb2xs
ZmRfaWR4LCBpbnQgDQo+PiAqcHRpbWVvdXQpDQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIH0N
Cj4+ICtzdGF0aWMgc2l6ZV90IGNhbGNfbm9kZV9hY2Nfc2l6ZShzdHJ1Y3Qgbm9kZV9oZHIg
KmhkcikNCj4gDQo+IFRoZSBwYXJhbWV0ZXIgY2FuIGJlIGNvbnN0Lg0KDQpJJ3ZlIGNoYW5n
ZWQgdGhpcyBhbHJlYWR5IGluIG15IHBlbmRpbmcgVjQuIDotKQ0KDQo+IA0KPj4gK3sNCj4+
ICvCoMKgwqAgcmV0dXJuIHNpemVvZigqaGRyKSArIGhkci0+bnVtX3Blcm1zICogc2l6ZW9m
KHN0cnVjdCB4c19wZXJtaXNzaW9ucykgKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGhk
ci0+ZGF0YWxlbiArIGhkci0+Y2hpbGRsZW47DQo+PiArfQ0KPj4gKw0KPiANCj4gWy4uLl0N
Cj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaCBi
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+IGluZGV4IDljYjRjMmYzZWIu
LmFkZjhhNzg1ZmMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
Y29yZS5oDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+PiBA
QCAtMTgxLDYgKzE4MSw3IEBAIGV4dGVybiBzdHJ1Y3QgbGlzdF9oZWFkIGNvbm5lY3Rpb25z
Ow0KPj4gwqDCoCAqLw0KPj4gwqAgc3RydWN0IG5vZGVfaGRyIHsNCj4+IMKgwqDCoMKgwqAg
dWludDY0X3QgZ2VuZXJhdGlvbjsNCj4+ICsjZGVmaW5lIE5PX0dFTkVSQVRJT04gfigodWlu
dDY0X3QpMCkNCj4+IMKgwqDCoMKgwqAgdWludDE2X3QgbnVtX3Blcm1zOw0KPj4gwqDCoMKg
wqDCoCB1aW50MTZfdCBkYXRhbGVuOw0KPj4gwqDCoMKgwqDCoCB1aW50MzJfdCBjaGlsZGxl
bjsNCj4+IEBAIC0xOTcsNiArMTk4LDEwIEBAIHN0cnVjdCBub2RlX2FjY291bnRfZGF0YSB7
DQo+PiDCoCB9Ow0KPj4gwqAgc3RydWN0IG5vZGUgew0KPj4gK8KgwqDCoCAvKiBEYXRhIGRp
cmVjdCBmb3IgZGF0YSBiYXNlLiAqLw0KPiANCj4gSSBjYW4ndCBwYXJzZSBpdC4gRGlkIHlv
dSBtZWFuICdmcm9tJyByYXRoZXIgdGhhbiAnZm9yJz8NCg0KSSdsbCBjaGFuZ2UgaXQgdG86
DQoNCgkvKiBDb3BpZWQgdG8vZnJvbSBkYXRhIGJhc2UuICovDQoNCg0KSnVlcmdlbg0KDQo=

--------------HGEQ8N0lasvqxxGD0fBYFuGl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HGEQ8N0lasvqxxGD0fBYFuGl--

--------------Zjb7PCGdBmkKPLGeyTjhW6GI--

--------------43R0FoyWmr04auMdovkISPsS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTJ4JYFAwAAAAAACgkQsN6d1ii/Ey9s
LwgAmF49Pj9dMd2PzOTmoW5Gj96J+onAMnhMqnZx8uCbqdwiEL1ETWhIzelYw/45PW16nHxqMBC7
LAKPkPM3DIO4hJsFn7dR28ga3R1IUvswnMK0nnJ3xYJpb+vMN+gz9OaSkoFBDx21TTUFPfZFVaMa
0rQ1jDYARaf/LrXChEpc4Yt51Rn2aoqaiEp9Xe3au5uPH8H250lxGtztQlbCmhwfb95rTM9k6RdB
w8V70KYvwnXdcC/PtaEUYx7jZOFwJz6FUjjD3WreX42NY+efKxdfVOo0xaTnad2LGMt6EeZf1NCS
xnwkTmkckgW/XIlonV89KaD3GdWSLTPXljKsdJbKHQ==
=RvDv
-----END PGP SIGNATURE-----

--------------43R0FoyWmr04auMdovkISPsS--


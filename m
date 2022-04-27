Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328535118C0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 16:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315143.533541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njidK-0002p4-6z; Wed, 27 Apr 2022 14:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315143.533541; Wed, 27 Apr 2022 14:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njidK-0002lZ-45; Wed, 27 Apr 2022 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 315143;
 Wed, 27 Apr 2022 14:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njidI-0002lN-QN
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 14:27:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bed02cf-c636-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 16:27:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1C69F210E4;
 Wed, 27 Apr 2022 14:27:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5E9813A39;
 Wed, 27 Apr 2022 14:27:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JCC4NrpSaWIqdgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 14:27:06 +0000
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
X-Inumbo-ID: 1bed02cf-c636-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651069627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/ZToLcmRVQdEqLq+h+9teJxIxexnemIN9E7TCopzUw=;
	b=WjKYEGyB2/r9WXYp1jbKvUojZIGo2fTz5fRvdlBCH5jmdvpMxshIeh5cHNFei8brGOLH6t
	97bzVz+H/zNFaUbMppD4vllL9F8r4/qFS4RGMICtvFoZkezytqKOFlFS9b1ha5BNqmqEI+
	QUnf5FyVg94oaSdWUg2/mEMstILii1Y=
Message-ID: <92715e65-da71-7fdd-96b7-0cc88a22f263@suse.com>
Date: Wed, 27 Apr 2022 16:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/xenstore: don't let special watches be children of
 /
Content-Language: en-US
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220427135156.4605-1-jgross@suse.com>
 <a95fafbb-1910-7e3b-43f8-d507fcf162e8@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a95fafbb-1910-7e3b-43f8-d507fcf162e8@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LPivvrMEirKl0jSjq2f6Iyjs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LPivvrMEirKl0jSjq2f6Iyjs
Content-Type: multipart/mixed; boundary="------------jmexubG0KtPb0hdU7Odbq6jm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Raphael Ning <raphning@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <92715e65-da71-7fdd-96b7-0cc88a22f263@suse.com>
Subject: Re: [PATCH] tools/xenstore: don't let special watches be children of
 /
References: <20220427135156.4605-1-jgross@suse.com>
 <a95fafbb-1910-7e3b-43f8-d507fcf162e8@gmail.com>
In-Reply-To: <a95fafbb-1910-7e3b-43f8-d507fcf162e8@gmail.com>

--------------jmexubG0KtPb0hdU7Odbq6jm
Content-Type: multipart/mixed; boundary="------------uHpfSBYfhik5peSSj5RQY6yU"

--------------uHpfSBYfhik5peSSj5RQY6yU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDQuMjIgMTY6MjUsIFJhcGhhZWwgTmluZyB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IA0KPiBPbiAyNy8wNC8yMDIyIDE0OjUxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gV2hlbiBmaXJpbmcgc3BlY2lhbCB3YXRjaGVzIChlLmcuICJAcmVsZWFzZURvbWFpbiIp
LCB0aGV5IHdpbGwgYmUNCj4+IHJlZ2FyZGVkIHRvIGJlIHZhbGlkIGNoaWxkcmVuIG9mIHRo
ZSAiLyIgbm9kZS4gU28gYSBkb21haW4gaGF2aW5nDQo+PiByZWdpc3RlcmVkIGEgd2F0Y2gg
Zm9yICIvIiBhbmQgaGF2aW5nIHRoZSBwcml2aWxlZ2UgdG8gcmVjZWl2ZQ0KPj4gdGhlIHNw
ZWNpYWwgd2F0Y2hlcyB3aWxsIHJlY2VpdmUgdGhvc2Ugc3BlY2lhbCB3YXRjaCBldmVudHMg
Zm9yIHRoZQ0KPj4gcmVnaXN0ZXJlZCAiLyIgd2F0Y2guDQo+Pg0KPj4gRml4IHRoYXQgYnkg
Y2FsbGluZyB0aGUgcmVsYXRlZCBmaXJlX3dhdGNoZXMoKSB3aXRoIHRoZSAiZXhhY3QiDQo+
PiBwYXJhbWV0ZXIgc2V0IHRvIHRydWUsIGNhdXNpbmcgYSBtaXNtYXRjaCBmb3IgdGhlICIv
IiBub2RlLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBSYXBoYWVsIE5pbmcgPHJhcGhuaW5nQGdt
YWlsLmNvbT4NCj4gDQo+IA0KPiBDYW4gSSBhc2sgeW91IHRvIHVzZSBteSBBbWF6b24gZW1h
aWwgaW5zdGVhZDoNCj4gDQo+IFJlcG9ydGVkLWJ5OiBSYXBoYWVsIE5pbmcgPHJhcGhuaW5n
QGFtYXpvbi5jb20+DQoNClllcywgb2YgY291cnNlLg0KDQo+IA0KPiBTb3JyeSBhYm91dCB0
aGUgaW5jb25zaXN0ZW5jeS4gSSB3b3JrIG9uIFhlbiBhcyBwYXJ0IG9mIG15IGpvYiwgYnV0
IEkgZGVjaWRlZCB0byB1c2UgR21haWwgZm9yIHBvc3Rpbmcgb24geGVuLWRldmVsLCBiZWNh
dXNlIEkgaGVhcmQgdGhhdCBpdCdzIGEgcGFpbiB0byBtYWtlIEFtYXpvbiBtYWlsIHdvcmsg
cHJvcGVybHkgd2l0aCBleHRlcm5hbCBtYWlsaW5nIGxpc3RzLg0KPiANCj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+
ICAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jIHwgNiArKystLS0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jIGIvdG9v
bHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+PiBpbmRleCBhZTA2NWZjYmVlLi44
MGJhMWQ2MjdiIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Rv
bWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCj4+
IEBAIC0yMzEsNyArMjMxLDcgQEAgc3RhdGljIGludCBkZXN0cm95X2RvbWFpbih2b2lkICpf
ZG9tYWluKQ0KPj4gICAJCQl1bm1hcF9pbnRlcmZhY2UoZG9tYWluLT5pbnRlcmZhY2UpOw0K
Pj4gICAJfQ0KPj4gICANCj4+IC0JZmlyZV93YXRjaGVzKE5VTEwsIGRvbWFpbiwgIkByZWxl
YXNlRG9tYWluIiwgTlVMTCwgZmFsc2UsIE5VTEwpOw0KPj4gKwlmaXJlX3dhdGNoZXMoTlVM
TCwgZG9tYWluLCAiQHJlbGVhc2VEb21haW4iLCBOVUxMLCB0cnVlLCBOVUxMKTsNCj4+ICAg
DQo+PiAgIAl3cmxfZG9tYWluX2Rlc3Ryb3koZG9tYWluKTsNCj4+ICAgDQo+PiBAQCAtMjgy
LDcgKzI4Miw3IEBAIHZvaWQgY2hlY2tfZG9tYWlucyh2b2lkKQ0KPj4gICAJfQ0KPj4gICAN
Cj4+ICAgCWlmIChub3RpZnkpDQo+PiAtCQlmaXJlX3dhdGNoZXMoTlVMTCwgTlVMTCwgIkBy
ZWxlYXNlRG9tYWluIiwgTlVMTCwgZmFsc2UsIE5VTEwpOw0KPj4gKwkJZmlyZV93YXRjaGVz
KE5VTEwsIE5VTEwsICJAcmVsZWFzZURvbWFpbiIsIE5VTEwsIHRydWUsIE5VTEwpOw0KPj4g
ICB9DQo+PiAgIA0KPj4gICAvKiBXZSBzY2FuIGFsbCBkb21haW5zIHJhdGhlciB0aGFuIHVz
ZSB0aGUgaW5mb3JtYXRpb24gZ2l2ZW4gaGVyZS4gKi8NCj4+IEBAIC00OTUsNyArNDk1LDcg
QEAgc3RhdGljIHN0cnVjdCBkb21haW4gKmludHJvZHVjZV9kb21haW4oY29uc3Qgdm9pZCAq
Y3R4LA0KPj4gICANCj4+ICAgCQlpZiAoIWlzX21hc3Rlcl9kb21haW4gJiYgIXJlc3RvcmUp
DQo+PiAgIAkJCWZpcmVfd2F0Y2hlcyhOVUxMLCBjdHgsICJAaW50cm9kdWNlRG9tYWluIiwg
TlVMTCwNCj4+IC0JCQkJICAgICBmYWxzZSwgTlVMTCk7DQo+PiArCQkJCSAgICAgdHJ1ZSwg
TlVMTCk7DQo+PiAgIAl9IGVsc2Ugew0KPj4gICAJCS8qIFVzZSBYU19JTlRST0RVQ0UgZm9y
IHJlY3JlYXRpbmcgdGhlIHhlbmJ1cyBldmVudC1jaGFubmVsLiAqLw0KPj4gICAJCWlmIChk
b21haW4tPnBvcnQpDQo+IA0KPiANCj4gVGhhbmtzLCB0aGUgcGF0Y2ggbG9va3MgZ29vZC4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBSYXBoYWVsIE5pbmcgPHJhcGhuaW5nQGFtYXpvbi5jb20+
DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQoNCg==
--------------uHpfSBYfhik5peSSj5RQY6yU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uHpfSBYfhik5peSSj5RQY6yU--

--------------jmexubG0KtPb0hdU7Odbq6jm--

--------------LPivvrMEirKl0jSjq2f6Iyjs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJpUroFAwAAAAAACgkQsN6d1ii/Ey9Q
dwf/SJuOytCgNUQ8u8e10B4Q7d/wBzv6Cg7x0qfKFbIU4dqqwn8ngaXUaQuq8f5iUTs/FQXa4Q2S
7Bg+e/Nm3E2PJJDebu0c3E0tqlBzy2HMwlhFktgENktl93fFgo94I1KbPEvzaBe0iIUgvrdEXYKA
HMOKl+8eCPVlGVf3ro37Aecx87ukSHzsYBGrw2IySgEHPoiH1VeaRE3gEAWw6ggv8l5LAcFpcuDB
Rlur0A50v8bUG0qTmsDcNy6T5FFbbVEmZLtDFIGVjM2biQ45/n32F95369ACzxPC7qosM8NQCSPi
bzpiogNnSNojzkHOWjQgCkpAxXcWJmm6tXfBZoImzA==
=IU9C
-----END PGP SIGNATURE-----

--------------LPivvrMEirKl0jSjq2f6Iyjs--


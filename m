Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0F76FD6A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577027.903821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrCj-0006Qp-Ab; Fri, 04 Aug 2023 09:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577027.903821; Fri, 04 Aug 2023 09:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrCj-0006O1-7s; Fri, 04 Aug 2023 09:34:41 +0000
Received: by outflank-mailman (input) for mailman id 577027;
 Fri, 04 Aug 2023 09:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRrCh-0006Nv-Cv
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:34:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20c596b0-32aa-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 11:34:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C2CFA1F8AE;
 Fri,  4 Aug 2023 09:34:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E6D213904;
 Fri,  4 Aug 2023 09:34:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KMNKJSzGzGSlGgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 09:34:36 +0000
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
X-Inumbo-ID: 20c596b0-32aa-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691141676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A82bLYqaz93UDvSrWKnOK89kLHiJz3SDvPNd6oqJhkE=;
	b=H3wh3pQXiChcTRJeSC/yDJxLqbos6gFPCJwO/EIyysjOLARGrqnUxYAD0sevi9P/ZRjwpF
	1JlgPCK5HuA2Q154Q7xlvDuDx88aWAeaJ4ixc5r+jSMhZxgXQrpNN5VEQikgjsoQxbY1Hc
	twqeN+Jzh4lW0QJwTARVhjy+JdIL+NE=
Message-ID: <dd226d4f-28f0-487f-996f-b1550e8d5db3@suse.com>
Date: Fri, 4 Aug 2023 11:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
 <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
 <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wBl4XspPGxdVBxCVMQxYoWXl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wBl4XspPGxdVBxCVMQxYoWXl
Content-Type: multipart/mixed; boundary="------------8s0ihwnIigIEkLv0llY3wiHr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <dd226d4f-28f0-487f-996f-b1550e8d5db3@suse.com>
Subject: Re: [PATCH v3 22/25] tools/xenstore: merge get_spec_node() into
 get_node_canonicalized()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-23-jgross@suse.com>
 <bf77f848-498f-ce8a-ab4a-23995636ca81@xen.org>
 <014c1c12-ffba-97fa-d07a-ca2e82179c70@suse.com>
 <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>
In-Reply-To: <c7e32b8c-9f89-4560-961a-a3c258bba3ee@xen.org>

--------------8s0ihwnIigIEkLv0llY3wiHr
Content-Type: multipart/mixed; boundary="------------OgudeLWwb2kPZEqUPTdWYkY3"

--------------OgudeLWwb2kPZEqUPTdWYkY3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjMgMTE6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwNC8wOC8yMDIzIDEwOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDMuMDgu
MjMgMjM6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDI0
LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IGRpZmYgLS1naXQg
YS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2guYyANCj4+Pj4gYi90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfd2F0Y2guYw0KPj4+PiBpbmRleCA4NmNmODMyMmI0Li4yNjYyYTNm
YTQ5IDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2gu
Yw0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfd2F0Y2guYw0KPj4+PiBA
QCAtMTY2LDE5ICsxNjYsMTIgQEAgc3RhdGljIGludCBkZXN0cm95X3dhdGNoKHZvaWQgKl93
YXRjaCkNCj4+Pj4gwqAgc3RhdGljIGludCBjaGVja193YXRjaF9wYXRoKHN0cnVjdCBjb25u
ZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqKnBhdGgsIGJvb2wgKnJlbGF0aXZlKQ0K
Pj4+PiDCoCB7DQo+Pj4+IC3CoMKgwqAgLyogQ2hlY2sgaWYgdmFsaWQgZXZlbnQuICovDQo+
Pj4+IC3CoMKgwqAgaWYgKHN0cnN0YXJ0cygqcGF0aCwgIkAiKSkgew0KPj4+PiAtwqDCoMKg
wqDCoMKgwqAgKnJlbGF0aXZlID0gZmFsc2U7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAo
c3RybGVuKCpwYXRoKSA+IFhFTlNUT1JFX1JFTF9QQVRIX01BWCkNCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byBpbnZhbDsNCj4+Pg0KPj4+IEkgY2FuJ3QgZmluZCBhbiBl
eGFjdCBtYXRjaGluZyBjaGVjayBpbiBpc192YWxpZF9ub2RlbmFtZSgpLiBUaGUgY2FsbCBh
bHNvIA0KPj4+IHNlZW1zIHRvIHB1dCBtb3JlIHJlc3RyaWN0aW9uIG9uICdAJyBub2RlLiBD
YW4geW91IGNsYXJpZnk/DQo+Pg0KPj4gVGhlIGNhbGwgb2YgZG9tYWluX21heF9jaGsoKSBp
biBpc192YWxpZF9ub2RlbmFtZSgpIHdpbGwgY2hlY2sgdGhlIGxlbmd0aA0KPj4gb2YgdGhl
IG5vZGUgbmFtZSAoYXQgbGVhc3QgZm9yIHVucHJpdmlsZWdlZCBjYWxsZXJzLCB3aGljaCBp
cyB0aGUgaW1wb3J0YW50DQo+PiBjYXNlKS4NCj4gDQo+IFJpZ2h0LCBidXQgZnJvbSBteSB1
bmRlcnN0YW5kaW5nLCB0aGlzIG1heSBub3QgY2hlY2sgYWdhaW5zdCANCj4gWEVOU1RPUkVf
UkVMX1BBVEhfTUFYIGJ1dCB3aGF0ZXZlciBsaW1pdCB0aGUgdXNlciBzZXQuDQoNClllcywg
YW5kIHRoYXQncyB3aGF0IHNob3VsZCBiZSB0ZXN0ZWQsIHJpZ2h0PyBJIGRvbid0IHNlZSB3
aHkgc3BlY2lhbCBub2Rlcw0Kc2hvdWxkIG5vdCBhZGhlcmUgdG8gdGhlIHNhbWUgbGltaXRz
IGFzIG90aGVyIG5vZGVzLiBJbiBjYXNlIGFuIHVucHJpdmlsZWdlZA0KdXNlciBzaG91bGQg
aGF2ZSBhY2Nlc3MgdG8gc3BlY2lhbCBub2RlcywgdGhlIGxpbWl0cyBzaG91bGRuJ3QgaGlu
ZGVyIHRoZQ0KdXNlciB0byBhY2Nlc3MgdGhvc2Ugbm9kZXMgKHNldHRpbmcgYSBsaW1pdCBi
ZWxvdyAxNSB3b3VsZCBiZSByaWRpY3Vsb3VzDQphbnl3YXksIGFuZCB0aGF0IGlzIHRoZSBs
ZW5ndGggb2YgbG9uZ2VzdCBzcGVjaWFsIG5vZGUgbmFtZSB0b2RheSkuDQoNCj4gVGhpcyBp
cyBhIGNoYW5nZSBvZiBiZWhhdmlvciB0aGF0IHlvdSBvdWdodCB0byBiZSBleHBsYWluZWQu
DQo+IA0KPj4NCj4+IFRoZSBhZGRpdGlvbmFsIHJlc3RyaWN0aW9ucyBmb3Igc3BlY2lhbCBu
b2RlcyBhcmU6DQo+Pg0KPj4gLSB0aGV5IGNhbid0IGVuZCB3aXRoICIvIg0KPj4gLSB0aGV5
IGNhbid0IGNvbnRhaW4gIi8vIg0KPj4gLSB0aGV5IGNhbid0IGNvbnRhaW4gY2hhcmFjdGVy
cyBvdGhlciB0aGFuIHRoZSBvbmVzIGFsbG93ZWQgZm9yIG5vcm1hbCBub2Rlcw0KPj4NCj4+
IE5vbmUgb2YgdGhvc2UgcmVzdHJpY3Rpb25zIGFyZSBwcm9ibGVtYXRpYy4gSSBjYW4gYWRk
IHNvbWV0aGluZyB0byB0aGUNCj4+IGNvbW1pdCBtZXNzYWdlIGlmIHlvdSB3YW50Lg0KPiAN
Cj4gWWVzIHBsZWFzZS4NCg0KSnVlcmdlbg0KDQo=
--------------OgudeLWwb2kPZEqUPTdWYkY3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------OgudeLWwb2kPZEqUPTdWYkY3--

--------------8s0ihwnIigIEkLv0llY3wiHr--

--------------wBl4XspPGxdVBxCVMQxYoWXl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTMxiwFAwAAAAAACgkQsN6d1ii/Ey+P
Jgf+I9lnIFNC6LtcamtZDQjCtMnCo/A1rLm9c6w6MahURiCfIgJPTWK34Yct5tUh8R3Lm3zRKiJc
v951iUKNufkJGvPuosp0hCJnXrWpJ0/oTT/Sh8LPGUjCxlIq4nfOE443sot9HHQ02xQIuesPUAjz
6/TbIUNge2adDhu50I33JOBLjE1Uz6fgGKK2CmauOj6PO1eAFYFsE2SAr8uJPqIdnF3QszKGReU4
fZTDeK0euZC2ZVmLpZDkU3c1FrhPs4ZS4Ob/wCNPV7M3NA4sJaR++BVip3+aRVOmFC25aDKSvtS1
KxMMRoLHLvO9NV9QW4un2+sbRAaLOma60EgdyJmfzg==
=FYC/
-----END PGP SIGNATURE-----

--------------wBl4XspPGxdVBxCVMQxYoWXl--


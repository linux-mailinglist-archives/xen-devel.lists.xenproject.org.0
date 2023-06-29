Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D97423E3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556754.869494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEomT-0005H0-Jw; Thu, 29 Jun 2023 10:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556754.869494; Thu, 29 Jun 2023 10:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEomT-0005FL-GJ; Thu, 29 Jun 2023 10:21:41 +0000
Received: by outflank-mailman (input) for mailman id 556754;
 Thu, 29 Jun 2023 10:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEomS-0005FE-1j
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:21:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb38152f-1666-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 12:21:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87064211C2;
 Thu, 29 Jun 2023 10:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4ED4313905;
 Thu, 29 Jun 2023 10:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /WeaETFbnWR2GQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 10:21:37 +0000
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
X-Inumbo-ID: bb38152f-1666-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688034097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVBJ/kc6KHAgS1uquDqv3wmu8JnzveqF4o15ZxZz18w=;
	b=QRipPmhOaFnNVTn8nm3WR5x8xayWjje/Vc59ZLdrmzoK95J48TIofhnIfhY8AWfYotlRxO
	TTgrfZfDP+x8xoHVZN70VrWrFfc5N64g6b1zcHoHtLbhPxCyqPLIrqXLpAUIf2sfrCK+Y+
	aKaJLZ4y1c5Iy6BcBF/pa7Mpp/XHows=
Message-ID: <c6aa3c0e-d5fb-7395-ded4-3ad4552e1199@suse.com>
Date: Thu, 29 Jun 2023 12:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-8-jgross@suse.com>
 <a183e00e-2c2e-a2dd-092a-ea51b6bbc699@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a183e00e-2c2e-a2dd-092a-ea51b6bbc699@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6g7GQ047zt2uEy9RoddeTyW2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6g7GQ047zt2uEy9RoddeTyW2
Content-Type: multipart/mixed; boundary="------------YX8FMcRpdqFekGx9pVSFLKxj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <c6aa3c0e-d5fb-7395-ded4-3ad4552e1199@suse.com>
Subject: Re: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-8-jgross@suse.com>
 <a183e00e-2c2e-a2dd-092a-ea51b6bbc699@xen.org>
In-Reply-To: <a183e00e-2c2e-a2dd-092a-ea51b6bbc699@xen.org>

--------------YX8FMcRpdqFekGx9pVSFLKxj
Content-Type: multipart/mixed; boundary="------------zaTU5MC00witgNh8EPUd7Qm0"

--------------zaTU5MC00witgNh8EPUd7Qm0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTU6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uZSBtb3JlIHJlbWFyayBhcyBJIHdhcyByZXZpZXdpbmcgcGF0Y2ggIzEwLg0K
PiANCj4gT24gMzAvMDUvMjAyMyAxMDoxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEFk
ZCBhIHdyYXBwZXIgZnVuY3Rpb24gZm9yIHRkYl9mZXRjaCB0YWtpbmcgdGhlIG5hbWUgb2Yg
dGhlIG5vZGUgaW4NCj4+IHRoZSBkYXRhIGJhc2UgYXMgYSBwYXJhbWV0ZXIuIExldCBpdCBy
ZXR1cm4gYSBkYXRhIHBvaW50ZXIgYW5kIHRoZQ0KPj4gbGVuZ3RoIG9mIHRoZSBkYXRhIHZp
YSBhIGxlbmd0aCBwb2ludGVyIHByb3ZpZGVkIGFzIGFkZGl0aW9uYWwNCj4+IHBhcmFtZXRl
ci4NCj4+DQo+PiBUaGlzIGVuYWJsZXMgdG8gbWFrZSBzZXRfdGRiX2tleSgpIHN0YXRpYyBh
Z2Fpbi4NCj4+DQo+PiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIHRvIHJlcGxhY2UgVERCIHdp
dGggYSBtb3JlIHNpbXBsZSBkYXRhIHN0b3JhZ2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiDCoCB0b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqDCoMKgwqDCoMKgwqAgfCA1NSArKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUu
aMKgwqDCoMKgwqDCoMKgIHzCoCAzICstDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfdHJhbnNhY3Rpb24uYyB8IDM0ICsrKysrKysrLS0tLS0tLS0NCj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRleCA1MjJiMmJiZjVmLi4xMmM1ODRmMDli
IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4g
KysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gQEAgLTg1LDcgKzg1
LDcgQEAgYm9vbCBrZWVwX29ycGhhbnMgPSBmYWxzZTsNCj4+IMKgIHN0YXRpYyBpbnQgcmVv
cGVuX2xvZ19waXBlWzJdOw0KPj4gwqAgc3RhdGljIGludCByZW9wZW5fbG9nX3BpcGUwX3Bv
bGxmZF9pZHggPSAtMTsNCj4+IMKgIGNoYXIgKnRyYWNlZmlsZSA9IE5VTEw7DQo+PiAtVERC
X0NPTlRFWFQgKnRkYl9jdHggPSBOVUxMOw0KPj4gK3N0YXRpYyBUREJfQ09OVEVYVCAqdGRi
X2N0eCA9IE5VTEw7DQo+PiDCoCB1bnNpZ25lZCBpbnQgdHJhY2VfZmxhZ3MgPSBUUkFDRV9P
QkogfCBUUkFDRV9JTzsNCj4+IMKgIHN0YXRpYyBjb25zdCBjaGFyICpzb2NrbXNnX3N0cmlu
ZyhlbnVtIHhzZF9zb2NrbXNnX3R5cGUgdHlwZSk7DQo+PiBAQCAtNTU2LDcgKzU1Niw3IEBA
IHN0YXRpYyB2b2lkIGluaXRpYWxpemVfZmRzKGludCAqcF9zb2NrX3BvbGxmZF9pZHgsIGlu
dCANCj4+ICpwdGltZW91dCkNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqAgfQ0KPj4gLXZvaWQg
c2V0X3RkYl9rZXkoY29uc3QgY2hhciAqbmFtZSwgVERCX0RBVEEgKmtleSkNCj4+ICtzdGF0
aWMgdm9pZCBzZXRfdGRiX2tleShjb25zdCBjaGFyICpuYW1lLCBUREJfREFUQSAqa2V5KQ0K
Pj4gwqAgew0KPj4gwqDCoMKgwqDCoCAvKg0KPj4gwqDCoMKgwqDCoMKgICogRHJvcHBpbmcg
Y29uc3QgaXMgZmluZSBoZXJlLCBhcyB0aGUga2V5IHdpbGwgbmV2ZXIgYmUgbW9kaWZpZWQN
Cj4+IEBAIC01NjYsMjUgKzU2NiwzOSBAQCB2b2lkIHNldF90ZGJfa2V5KGNvbnN0IGNoYXIg
Km5hbWUsIFREQl9EQVRBICprZXkpDQo+PiDCoMKgwqDCoMKgIGtleS0+ZHNpemUgPSBzdHJs
ZW4obmFtZSk7DQo+PiDCoCB9DQo+PiArdm9pZCAqZGJfZmV0Y2goY29uc3QgY2hhciAqZGJf
bmFtZSwgc2l6ZV90ICpzaXplKQ0KPiANCj4gU2hvdWxkIG5vdCB0aGlzIHJldHVybiB4c190
ZGJfcmVjb3JkX2hkcj8NCg0KSW5kZWVkLg0KDQoNCkp1ZXJnZW4NCg0K
--------------zaTU5MC00witgNh8EPUd7Qm0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zaTU5MC00witgNh8EPUd7Qm0--

--------------YX8FMcRpdqFekGx9pVSFLKxj--

--------------6g7GQ047zt2uEy9RoddeTyW2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdWzAFAwAAAAAACgkQsN6d1ii/Ey83
hQf9G8UEotE3hrZF3bVS2IUIuirkh593H1mQV6WJQZcXmkB5GMgZZ1+/DdjRCveAav2YzzCyrW3j
bYwKEvKtieHkGAr+Fu9MqprZpWwMbJjigGF+0Y0E+QaH9tV+oTgWnQPK7bniUB6Mtnu74HSkvIbU
fo3HDiYB6Wz4g0UQAoQY+2DL6SLPWlFSytA5BVdIe3v62IOcu7Gu8BwfST4xE4PlVWkx6LryWsSN
FL1GirxbBEJTgMeimEHL6B+aeph6V0HznCUMVkpRy2/wy5cW5De+5Np/peEaegyDMGZrBWjEonAR
IQjfvIigCDkzvHHKsEVixm7xKk+/GrkQ6X4QF8rFsA==
=pi09
-----END PGP SIGNATURE-----

--------------6g7GQ047zt2uEy9RoddeTyW2--


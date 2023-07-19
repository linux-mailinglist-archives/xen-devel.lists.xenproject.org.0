Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B0758D22
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 07:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565572.883807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLzls-0006us-7p; Wed, 19 Jul 2023 05:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565572.883807; Wed, 19 Jul 2023 05:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLzls-0006sJ-4w; Wed, 19 Jul 2023 05:30:44 +0000
Received: by outflank-mailman (input) for mailman id 565572;
 Wed, 19 Jul 2023 05:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qLzlr-0006sD-7b
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 05:30:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65494a2c-25f5-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 07:30:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD47B218EE;
 Wed, 19 Jul 2023 05:30:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A186E138EE;
 Wed, 19 Jul 2023 05:30:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6TbeJf50t2RpJQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jul 2023 05:30:38 +0000
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
X-Inumbo-ID: 65494a2c-25f5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689744638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmv1k5T2JC8mW5NDusryIAMyQynxd8InsGYUsj15BII=;
	b=oBo+nbPTrjKpa8M+IOSUwABRQUQ/qz1pszrJNmuoY03VcxtfXyEyiOvrOP6r6248U0aHcx
	6YmfNmD4De3TiHjxX2Vw1cI9Q4D0ohSwoJirW//M6Zyci7YOYbYI2l7NmO11Qjp5YRuNjb
	VSpVEOD+6QTv848iMkV0ucdwPIkMNlQ=
Message-ID: <bfa195e3-c55b-f1fc-20c8-a7ed98e05e39@suse.com>
Date: Wed, 19 Jul 2023 07:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/18] tools/xenstore: drop use of tdb
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-12-jgross@suse.com>
 <47c36d64-3161-cfb5-a34a-7abcf253113b@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <47c36d64-3161-cfb5-a34a-7abcf253113b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y4eE0JptZV5LWX0a5ihgYJu9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y4eE0JptZV5LWX0a5ihgYJu9
Content-Type: multipart/mixed; boundary="------------nuy8WyElYkXMlXFUCelZWnLE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <bfa195e3-c55b-f1fc-20c8-a7ed98e05e39@suse.com>
Subject: Re: [PATCH v2 11/18] tools/xenstore: drop use of tdb
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-12-jgross@suse.com>
 <47c36d64-3161-cfb5-a34a-7abcf253113b@xen.org>
In-Reply-To: <47c36d64-3161-cfb5-a34a-7abcf253113b@xen.org>

--------------nuy8WyElYkXMlXFUCelZWnLE
Content-Type: multipart/mixed; boundary="------------zUSWfwO9YEeqJAIYmkyBb0Kt"

--------------zUSWfwO9YEeqJAIYmkyBb0Kt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDcuMjMgMjM6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzA3LzIwMjMgMDc6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiAt
wqDCoMKgIHJldHVybiAoc3RydWN0IHhzX3RkYl9yZWNvcmRfaGRyICopZGF0YS5kcHRyOw0K
Pj4gK8KgwqDCoCAqc2l6ZSA9IHNpemVvZigqaGRyKSArIGhkci0+bnVtX3Blcm1zICogc2l6
ZW9mKGhkci0+cGVybXNbMF0pICsNCj4+ICvCoMKgwqDCoMKgwqDCoCBoZHItPmRhdGFsZW4g
KyBoZHItPmNoaWxkbGVuOw0KPj4gKw0KPj4gK8KgwqDCoCBwID0gdGFsbG9jX3NpemUoTlVM
TCwgKnNpemUpOw0KPj4gK8KgwqDCoCBpZiAoIXApIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBl
cnJubyA9IEVOT01FTTsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+ICvC
oMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDCoCB0cmFjZV90ZGIoInJlYWQgJXMgc2l6ZSAlenVc
biIsIGRiX25hbWUsICpzaXplICsgc3RybGVuKGRiX25hbWUpKTsNCj4+ICsNCj4+ICvCoMKg
wqAgLyogUmV0dXJuIGEgY29weSwgYXZvaWRpbmcgYSBwb3RlbnRpYWwgbW9kaWZpY2F0aW9u
IGluIHRoZSBEQi4gKi8NCj4+ICvCoMKgwqAgbWVtY3B5KHAsIGhkciwgKnNpemUpOw0KPiAN
Cj4gVGhlIHRhbGxvY19zaXplKCkgKyBtZW1jcHkoKSBzZWVtcyB0byBiZSBhbiBvcGVuLWNv
ZGVkIHZlcnNpb24gb2YgDQo+IHRhbGxvY19tZW1kdXAoKS4gQ2FuIHlvdSB1c2UgaXQ/DQoN
Ck9oLCBnb29kIGlkZWEuDQoNCj4gDQo+IFRoZSByZXN0IGxvb2tzIGdvb2QgdG8gbWUuDQoN
ClRoYW5rcywNCg0KDQpKdWVyZ2VuDQoNCg==
--------------zUSWfwO9YEeqJAIYmkyBb0Kt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zUSWfwO9YEeqJAIYmkyBb0Kt--

--------------nuy8WyElYkXMlXFUCelZWnLE--

--------------y4eE0JptZV5LWX0a5ihgYJu9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS3dP4FAwAAAAAACgkQsN6d1ii/Ey9t
eQf8Dtw783oyEH9vBoZhewO3/goZRFvh3qyTbIr8vELirurMyIoASGrV/Z0I0QW9kIxwI1yGMqBk
McJz2HHF/rAocJm8RcfDHHCPkG0525Syn2zCpRGtwehTgAOCbVRE7XNWNWOhhntO4RpUKp4C7++P
kvJvr8uUzQnEyck+1iscEgETmmSXseyP+KUgWoPW28k7PBVdlQjdY4CXIjK3fpoKfrPlRCaknwDN
0miYvzkFrEzB9ioRQxarNC8SRT1FMQQblIlNKU5/CJFJEjmPgbRKZsxnhm22BLxNictVS5CiSbpQ
DAetGI/a+j2YYiuAuVdV+0h0ZwmtmRR8LuaHMn867w==
=kMDe
-----END PGP SIGNATURE-----

--------------y4eE0JptZV5LWX0a5ihgYJu9--


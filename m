Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B565664C6C9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461984.720141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OgU-0003KD-Bg; Wed, 14 Dec 2022 10:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461984.720141; Wed, 14 Dec 2022 10:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OgU-0003Gm-8S; Wed, 14 Dec 2022 10:08:18 +0000
Received: by outflank-mailman (input) for mailman id 461984;
 Wed, 14 Dec 2022 10:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5OgS-0003Gg-GM
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:08:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 395e1899-7b97-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 11:08:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3050E22111;
 Wed, 14 Dec 2022 10:08:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F27581333E;
 Wed, 14 Dec 2022 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vIO+OY2gmWOFFgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 10:08:13 +0000
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
X-Inumbo-ID: 395e1899-7b97-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671012494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u6tzzth1nCNtShvbjU8W37+mofdr/Ic4vsmHlBuR0AE=;
	b=HTNX6g9K259pkfgdHvQ0QQs0aik39F3f9uWcCW9BrqcH4KOzMNBNpTttoA5npAVqvj71DO
	R+NGzB3dkN7C2JgtDbNa9GT1SmwGLQUaJ6S5KO5FyCscfboKlAEeo7LU8zBikmWjnCf0ny
	DPjpZhfnIYB0Zp8uOLHhu2+BXKKFq2k=
Message-ID: <e7bf1e02-7c32-cfab-9f02-1a4779c255e7@suse.com>
Date: Wed, 14 Dec 2022 11:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 01/19] tools/xenstore: let talloc_free() preserve errno
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-2-jgross@suse.com>
 <cfa88146-96c2-33c2-e140-a486caa320ca@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <cfa88146-96c2-33c2-e140-a486caa320ca@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------egry9dcsmULvJCaOuHU2KtAT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------egry9dcsmULvJCaOuHU2KtAT
Content-Type: multipart/mixed; boundary="------------Ke2q7HbZ8iRGYQpiQu9NiK8m";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <e7bf1e02-7c32-cfab-9f02-1a4779c255e7@suse.com>
Subject: Re: [PATCH v2 01/19] tools/xenstore: let talloc_free() preserve errno
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-2-jgross@suse.com>
 <cfa88146-96c2-33c2-e140-a486caa320ca@suse.com>
In-Reply-To: <cfa88146-96c2-33c2-e140-a486caa320ca@suse.com>

--------------Ke2q7HbZ8iRGYQpiQu9NiK8m
Content-Type: multipart/mixed; boundary="------------0061S55UXsbNRP1aZpAq6vvS"

--------------0061S55UXsbNRP1aZpAq6vvS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTA6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMi4yMDIy
IDE3OjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgdGFsbG9jX2ZyZWUoKSBp
cyBub3QgZ3VhcmFudGVlZCB0byBwcmVzZXJ2ZSBlcnJubywgZXNwZWNpYWxseSBpbg0KPj4g
Y2FzZSBhIGN1c3RvbSBkZXN0cnVjdG9yIGlzIGJlaW5nIHVzZWQuDQo+Pg0KPj4gQ2hhbmdl
IHRoYXQgYnkgcmVuYW1pbmcgdGFsbG9jX2ZyZWUoKSB0byBfdGFsbG9jX2ZyZWUoKSBpbiB0
YWxsb2MuYyBhbmQNCj4+IGFkZGluZyBhIHdyYXBwZXIgdG8gdGFsbG9jLmMuDQo+IA0KPiBU
aGlzIGxvb2tzIHRvIGJlIHN0YWxlIC4uLg0KPiANCj4+IFRoaXMgYWxsb3dzIHRvIHJlbW92
ZSBzb21lIGVycm5vIHNhdmluZyBvdXRzaWRlIG9mIHRhbGxvYy5jLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4g
VjI6DQo+PiAtIGRyb3Agd3JhcHBlciAoSnVsaWVuIEdyYWxsKQ0KPiANCj4gLi4uIGFmdGVy
IHRoaXMgY2hhbmdlPw0KDQpPaCB5ZXMsIGluZGVlZC4NCg0KSXQgc2hvdWxkIGJlIHJlcGxh
Y2VkIGJ5Og0KDQoiU28gcHJlc2VydmUgZXJybm8gaW4gdGFsbG9jX2ZyZWUoKS4iDQoNCkp1
ZXJnZW4NCg0K
--------------0061S55UXsbNRP1aZpAq6vvS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0061S55UXsbNRP1aZpAq6vvS--

--------------Ke2q7HbZ8iRGYQpiQu9NiK8m--

--------------egry9dcsmULvJCaOuHU2KtAT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZoI0FAwAAAAAACgkQsN6d1ii/Ey+p
tAgAicRzlvJiqvlA0hhiskMureb2LRrteq0l+0f4h4/VNbnm4pzeXGhfPMVfFTNHz9+ZfMw9lpwO
eKbhIEAz85qKOTRe3cBDBaFEFm+qoUXMXgMcL71FnKBewwGJofulXOhWnMHBA8DPzvTc4Klijg3X
qF7CkWIrqhvQv2Lc7wueY3CDglZT8Loeke6xC3ieQY3pV2cqDt7j/Z9WShCrZQ2vQQJSDuenYqXn
ibBCmecO+MerqW4HlD1qWUK9lKSxiNC4wX3HNhg5QN1rrbdfhE6g6v+VrTagxksoXfxVeoWN2bl0
EmRdCbNXlcqVo9bFYMzmIuKN75coVXt+EDObKqiCMw==
=m0Yt
-----END PGP SIGNATURE-----

--------------egry9dcsmULvJCaOuHU2KtAT--


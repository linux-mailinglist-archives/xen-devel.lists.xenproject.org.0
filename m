Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24425643DC6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 08:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454470.712022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Se0-0007pL-UQ; Tue, 06 Dec 2022 07:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454470.712022; Tue, 06 Dec 2022 07:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Se0-0007mX-Qz; Tue, 06 Dec 2022 07:45:36 +0000
Received: by outflank-mailman (input) for mailman id 454470;
 Tue, 06 Dec 2022 07:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A06j=4E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p2Sdz-0007mR-67
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 07:45:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7213083-7539-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 08:45:34 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 917961F8D4;
 Tue,  6 Dec 2022 07:45:33 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5F99813326;
 Tue,  6 Dec 2022 07:45:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id uuAVFh3zjmOeWQAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 06 Dec 2022 07:45:33 +0000
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
X-Inumbo-ID: f7213083-7539-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670312733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GZWkAmfEbYJbEsWTwv/nxqbNMUj3Lt5eEGinR1/P7AM=;
	b=ncVjf85O67C/qzDrYi4HPy6xgAZDKNMDC6PoRtVUpWPZ2EqbOc4tO3uHUEa9+rUJiR5Eag
	soECWmj6pNq9Fe7taXkxuMc2QXlHJnj6UEDWl/Mu3QbSwTPtd4uhSMfYz9mk7pK7R4x9J1
	v9PmhAbkMM5jiaJq1IdDz5x6/h7ZG2s=
Message-ID: <664444f9-2e82-8b15-2613-4bc29bfb4e86@suse.com>
Date: Tue, 6 Dec 2022 08:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: Fix removal of COPYING and .gitignore
In-Reply-To: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------htBj77fTTPP63yyddnOPAp0M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------htBj77fTTPP63yyddnOPAp0M
Content-Type: multipart/mixed; boundary="------------a02f6cs0Px8gbmaY1gLCc3Ma";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <664444f9-2e82-8b15-2613-4bc29bfb4e86@suse.com>
Subject: Re: [PATCH] tools: Fix removal of COPYING and .gitignore
References: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>
In-Reply-To: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>

--------------a02f6cs0Px8gbmaY1gLCc3Ma
Content-Type: multipart/mixed; boundary="------------Rb010cWYl0k0y0RrFn54JP0T"

--------------Rb010cWYl0k0y0RrFn54JP0T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTIuMjIgMDg6MjUsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gVGhlIE1ha2VmaWxl
IGNvbnRpbnVlcyB0byByZW1vdmUgdGhlIGVudGlyZSB0b29scy9pbmNsdWRlL3hlbi8gZGly
ZWN0b3J5DQo+IG9uICJtYWtlIGNsZWFuIiwgd2hpY2ggaXNuJ3QgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvIGFueW1vcmUgc2luY2UgdGhpcw0KPiBmaWxlIGNvbnRhaW5zIGZpbGVzIGxpa2Ug
Q09QWUlORyBhbmQgLmdpdGlnbm9yZSBub3cuDQoNCkkgZG9uJ3Qgc2VlIGEgLmdpdGlnbm9y
ZSBmaWxlIGluIHRvb2xzL2luY2x1ZGUveGVuLCBhbmQgdGhlIENPWVBJTkcgZmlsZQ0KaXMg
Y3JlYXRlZCBieSB0b29scy9pbmNsdWRlL01ha2VmaWxlIHdoZW4gY3JlYXRpbmcgdG9vbHMv
aW5jbHVkZS94ZW4uDQoNCj4gU2luY2UgdGhlcmUgYXJlIG9ubHkgdHdvIGZpbGVzIGF0IHRo
ZSBtb21lbnQsIHVzZSAieGVuL1thLXpdKiIgcmVnZXggdG8NCj4gcmVtb3ZlIGV2ZXJ5dGhp
bmcgZWxzZS4NCj4gDQo+IEZpeGVzOiA0ZWE3NWU5YTkwNTggKCJSZXdvcmsgQ09QWUlORyBp
bnN0YWxsZWQgaW4gL3Vzci9pbmNsdWRlL3hlbi8sIGR1ZSB0byBzZXZlcmFsIGxpY2VuY2Vz
IikNCj4gU2lnbmVkLW9mZi1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJv
Lm9yZz4NCg0KTkFLLg0KDQo+IC0tLQ0KPiBJIGdvdCBpbnRvIHRyb3VibGUgYXMgbXkgYnVp
bGQgc2NyaXB0IGRvZXMgYSAibWFrZSBjbGVhbiIgYmVmb3JlIGJ1aWxkaW5nDQo+IGV2ZXJ5
dGhpbmcgYWdhaW4gYW5kIHNvIGJ1aWxkIGZhaWxzIHdpdGhvdXQgdGhlIENPUFlJTkcgZmls
ZS4NCg0KVGhpcyBpcyB3b3JraW5nIGp1c3QgZmluZSBmb3IgbWUuDQoNCj4gQmFzZWQgb2Y6
DQo+IA0KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2p1bGll
bmcveGVuLXVuc3RhYmxlLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9mb3ItbmV4dC80
LjE4DQoNCk1heWJlIGluIHRoZSB0cmVlIHlvdSBhcmUgdXNpbmcgY29tbWl0IDI1YjU1Njg4
ZTFmMjBlYmIgaXMgbWlzc2luZz8NCg0KDQpKdWVyZ2VuDQo=
--------------Rb010cWYl0k0y0RrFn54JP0T
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Rb010cWYl0k0y0RrFn54JP0T--

--------------a02f6cs0Px8gbmaY1gLCc3Ma--

--------------htBj77fTTPP63yyddnOPAp0M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOO8xwFAwAAAAAACgkQsN6d1ii/Ey9q
1gf/f98oGmjbkYlSK9E4KwM2RVR6zDZ7iB+wosgkp0TQNsSaaFXf32/bWjdLBu7plBIyh2+3rBWn
iwFL0F9j01bcsvZkPTn+D2sxyUGVNcH1g0zeyrWPDfEF4FCuB5HTuUVSeA9KisJdMvkJ+1BqRCON
7y9Pm8wAZl0vgrOiuKnU64ddd34NiZ2id8V4jwIaXF7yGkcTI5mI1kr6S4wHAuiMaYJyl+Jn8DEa
lQ52gro9yUzi5+CSqtJQI21XymJKyKiJ8KORuGZQsAhRW85FjrWNhbmpWZmWT61Es/buuhrBfk4w
d/zXNgn8HMqq6mZ4GLrY34UmWB77SDgBRN45up7vhg==
=tTGx
-----END PGP SIGNATURE-----

--------------htBj77fTTPP63yyddnOPAp0M--


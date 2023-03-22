Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B96C4B06
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513428.794391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexsI-0005Fp-Oc; Wed, 22 Mar 2023 12:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513428.794391; Wed, 22 Mar 2023 12:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexsI-0005DL-L1; Wed, 22 Mar 2023 12:47:30 +0000
Received: by outflank-mailman (input) for mailman id 513428;
 Wed, 22 Mar 2023 12:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pexsH-0005DF-JV
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:47:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b367542c-c8af-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:47:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69CAE33AFF;
 Wed, 22 Mar 2023 12:47:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36A19138E9;
 Wed, 22 Mar 2023 12:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b6CjC9/4GmTLZgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Mar 2023 12:47:27 +0000
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
X-Inumbo-ID: b367542c-c8af-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679489247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SlW2SN47T91v1XK3Mbmju1WAfpd2sy1Ql5qwoUhtkvc=;
	b=c99Jscf5PNgtHkUODsUnaFYJiO/zgC0Su6F3frjD86w0qEyC4OmY8jUR2iyI7lTQk3fgJ7
	cpI/cvJFKShVHUM7X06MDoaFuMHsKhqHHHvFIXrbcgj1zPwepF0wZqf42SSzl+PSXVLpUw
	hYqBtULT2eEhTXcS5WK+ytLIbu95H5g=
Message-ID: <8919014d-55cd-6761-7c7f-9f5e12459c2f@suse.com>
Date: Wed, 22 Mar 2023 13:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/5] tools/hvmloader: remove private offsetof()
 definition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-4-jgross@suse.com>
 <2342adc4-0011-8441-86b6-48cc21e999eb@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2342adc4-0011-8441-86b6-48cc21e999eb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YgGnd9s02HilpHfociL4weWG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YgGnd9s02HilpHfociL4weWG
Content-Type: multipart/mixed; boundary="------------Q2R9LrvKYdAeX7noseGX2cW8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <8919014d-55cd-6761-7c7f-9f5e12459c2f@suse.com>
Subject: Re: [PATCH v4 3/5] tools/hvmloader: remove private offsetof()
 definition
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-4-jgross@suse.com>
 <2342adc4-0011-8441-86b6-48cc21e999eb@suse.com>
In-Reply-To: <2342adc4-0011-8441-86b6-48cc21e999eb@suse.com>

--------------Q2R9LrvKYdAeX7noseGX2cW8
Content-Type: multipart/mixed; boundary="------------2qVY13NiGOa3JY9KCcYqBWJW"

--------------2qVY13NiGOa3JY9KCcYqBWJW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDMuMjMgMTM6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wMy4yMDIz
IDEzOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gdXRpbC5oIGNvbnRhaW5zIGEgZGVm
aW5pdGlvbiBvZiBvZmZzZXRvZigpLCB3aGljaCBpc24ndCBuZWVkZWQuDQo+IA0KPiBXaGls
ZSB0cnVlLCB0aGlzIGlzIGFsc28gYW1iaWd1b3VzIGluIHRoZSBjb250ZXh0IG9mIHRoaXMg
c2VyaWVzOiBJdCBpc24ndA0KPiAibm90IG5lZWRlZCIgYmVjYXVzZSBjb21tb24tbWFjcm9z
LmggaGFzIGFub3RoZXIgZGVmaW5pdGlvbiwgYnV0IGl0IGlzDQo+IGFjdHVhbGx5IHVudXNl
ZCBpbiBodm1sb2FkZXIgY29kZS4gU28gcGVyaGFwcyBzL25lZWRlZC91c2VkLz8NCg0KRmlu
ZSB3aXRoIG1lLg0KDQo+IA0KPj4gUmVtb3ZlIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KDQpUaGFua3MsDQoNCg0KSnVlcmdl
bg0K
--------------2qVY13NiGOa3JY9KCcYqBWJW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2qVY13NiGOa3JY9KCcYqBWJW--

--------------Q2R9LrvKYdAeX7noseGX2cW8--

--------------YgGnd9s02HilpHfociL4weWG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQa+N4FAwAAAAAACgkQsN6d1ii/Ey84
iAf/VO9sotQcyML/Q698WuFoJKn7V7A0RDqOynj7Z6MRRcp5D0I69H0ithSFN0cy4Zhp32bSk/nK
3+ZFRzLp8YIWjap20Xiu5LA2JSR2a/sMuSEUrNkeqKeaY+sdmN6ZKGv3zK2FP/yajHWEr3wzZh8t
kbBelzdLr/Fsw+2vb1F721hn7qUvKD6lKOLcGj2RzgeKGo8Ssm3gPLx8ISi63KdGAxgjeDf8nZZe
fAS7fQ6PyaGHd25kllKJWVSqqIjG8yc9COuFi/2T2eI56fc9b+mOrXME9M+hksy9jbcAV9S0uZVR
FxKcKW0VouhZTUawDIigWvPXXm5oGosge2NeXWiJZw==
=SHiZ
-----END PGP SIGNATURE-----

--------------YgGnd9s02HilpHfociL4weWG--


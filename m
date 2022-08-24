Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F259F3A4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 08:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392216.630416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQk01-0002Mo-NZ; Wed, 24 Aug 2022 06:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392216.630416; Wed, 24 Aug 2022 06:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQk01-0002Ka-Ko; Wed, 24 Aug 2022 06:36:25 +0000
Received: by outflank-mailman (input) for mailman id 392216;
 Wed, 24 Aug 2022 06:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQk00-0002KU-NQ
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 06:36:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12272e93-2377-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 08:36:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1D5D339C2;
 Wed, 24 Aug 2022 06:36:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1EF013780;
 Wed, 24 Aug 2022 06:36:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a9HVKebGBWPfOAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 06:36:22 +0000
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
X-Inumbo-ID: 12272e93-2377-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661322982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ss0C8XmbDfzDAwkDpVgOHXI1U+Px+nKGfPKL6sPrYbM=;
	b=smzHhriikRZDpbdrZ7hNbc1Im1iCvXK2Yr9iRbn0t9nF+bfG8tPupLA/timtUmrqlhdrp/
	tZCKYKQaMYcl6mtsiQGWC/9V3K3ifmvJbopWsgMdZERM+LMNfwd0SFb7Hy08NdXZ5eqMxG
	5VI+DByYq0CczxQR0M9TqIPgPWFlyoc=
Message-ID: <81811b5a-7006-bae3-422b-81e38bcdaef3@suse.com>
Date: Wed, 24 Aug 2022 08:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com>
 <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U9RAF6oDgfA05WxiWhiWvYvS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U9RAF6oDgfA05WxiWhiWvYvS
Content-Type: multipart/mixed; boundary="------------7nKQHlGKmXNZX30uRfsUGSyL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <81811b5a-7006-bae3-422b-81e38bcdaef3@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com>
 <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>
In-Reply-To: <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>

--------------7nKQHlGKmXNZX30uRfsUGSyL
Content-Type: multipart/mixed; boundary="------------buqb5wX3Bu2g7Bqpgu402uG9"

--------------buqb5wX3Bu2g7Bqpgu402uG9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMDg6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDIy
IDA4OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGJsa2lmLmggY29tbWVudHMg
c2hvdWxkIGJlIHVwZGF0ZWQgdG8gbWFrZSBpdCBjbGVhciB0aGF0IHRoZSB2YWx1ZXMgaW4N
Cj4+IFhlbnN0b3JlIGRvbid0IHJlZmxlY3QgdGhlIHN0YXRlIG9mIHRoZSBjb25uZWN0aW9u
LCBidXQgdGhlIGF2YWlsYWJpbGl0eSBvZg0KPj4gdGhlIGZlYXR1cmUgaW4gdGhlIHJlbGF0
ZWQgZHJpdmVyLg0KPiANCj4gSXNuJ3QgdGhhdCBpbXBsaWVkIGZvciBhbGwgdGhlIGZlYXR1
cmUtKiBsZWF2ZXM/IEkgY2VydGFpbmx5IGRvbid0IG1pbmQgaXQNCj4gYmVpbmcgc3BlbGxl
ZCBvdXQsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55IHJlYWwgYW1iaWd1aXR5IGhl
cmUuDQoNCkkgdGhpbmsgaXQgc2hvdWxkIHNwZWxsZWQgb3V0IGV4cGxpY2l0bHksIG1heWJl
IGluIHRoZSBnZW5lcmFsIHBhcmFncmFwaA0KYWJvdXQgZmVhdHVyZSBuZWdvdGlhdGlvbi4N
Cg0KVG8gbWUgZXNwZWNpYWxseSB0aGUgcGhyYXNpbmcgb24gdGhlIGZyb250ZW5kIHNpZGUg
d2FzIHJlYWRpbmcgYXMgaWYgYSAiMSINCndvdWxkIGluZGljYXRlIHRoZSBmZWF0dXJlIHRv
IGJlIGFjdGl2ZWx5IHVzZWQ6DQoNCiJBIHZhbHVlIG9mICIxIiBpbmRpY2F0ZXMgdGhhdCB0
aGUgZnJvbnRlbmQgd2lsbCByZXVzZSB0aGUgc2FtZSBncmFudHMgLi4uIg0KDQoNCkp1ZXJn
ZW4NCg==
--------------buqb5wX3Bu2g7Bqpgu402uG9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------buqb5wX3Bu2g7Bqpgu402uG9--

--------------7nKQHlGKmXNZX30uRfsUGSyL--

--------------U9RAF6oDgfA05WxiWhiWvYvS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMFxuYFAwAAAAAACgkQsN6d1ii/Ey9a
fwf6Aq/fqtep9emutnk3tQgTjLf4RiJUhxqR9xAecDyDLK4lzueJUI63rcN+Iz3K8SQXjD9BPxwN
CjSd2ENbpxFV9TfKzxT4DtCAG1JgmiF43TC5tqmEaFh2neoLpJYMwW8J6VvrEDcqQp284bMkp5Rb
sjQGYDJN9I5KJcaG/DjplBzUtTlQLGaYrLzOUL7aEvI5qNW60+QUi6mNFp14VDbevraml+oAS044
9ShxgeaBSuBZcp+XRRG+phKP9asQ7nPxZLZDTyEZF88XYVtZeskTBsg9UIKJUzP9WBYtZp4ebMAQ
6004PLAGp9P84D10AYHdc35pXfGgr5Ku5WJYnhgpTg==
=/M/z
-----END PGP SIGNATURE-----

--------------U9RAF6oDgfA05WxiWhiWvYvS--


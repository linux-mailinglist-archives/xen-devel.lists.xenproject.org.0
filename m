Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9B61EC7E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 08:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439096.693058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwxh-0001UP-JS; Mon, 07 Nov 2022 07:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439096.693058; Mon, 07 Nov 2022 07:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orwxh-0001Ry-GA; Mon, 07 Nov 2022 07:54:29 +0000
Received: by outflank-mailman (input) for mailman id 439096;
 Mon, 07 Nov 2022 07:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orwxg-0001Rp-0v
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 07:54:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66b6dcb2-5e71-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 08:54:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 556FA22657;
 Mon,  7 Nov 2022 07:54:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30FFD13AC7;
 Mon,  7 Nov 2022 07:54:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m7J/CrK5aGO1FgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Nov 2022 07:54:26 +0000
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
X-Inumbo-ID: 66b6dcb2-5e71-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667807666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bdiXlpfw3m4WP/H2SIBGgzTQn84VQTKPGTJyFY8nzPw=;
	b=i5sGNpgpGSQdo/15SRqUlI4fQxI6BCc/2XvP+X4QHRDASsL1wnkzCmmUV3gOrMezOWcOMk
	gOROR2Fg6urjpvz2GZf41qSPvDOu06BLNBKmdo/SFreJIUYZvYUpS2KrZe+YIMq79243ez
	l1lbjbh/he3BA68xShD/M8PXzFWvjXo=
Message-ID: <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
Date: Mon, 7 Nov 2022 08:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WOuuf0XTot4JfyTLyQoDfAx4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WOuuf0XTot4JfyTLyQoDfAx4
Content-Type: multipart/mixed; boundary="------------fzYtJkBsGeFOTD0BrodI4bxJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
In-Reply-To: <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>

--------------fzYtJkBsGeFOTD0BrodI4bxJ
Content-Type: multipart/mixed; boundary="------------7N81NnY0BDvT9DsnytLmzcJd"

--------------7N81NnY0BDvT9DsnytLmzcJd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjIgMjI6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBX
aGVuIGEgZG9tYWluIGhhcyBiZWVuIHJlY29nbml6ZWQgdG8gaGF2ZSBzdG9wcGVkLCByZW1v
dmUgYWxsIGl0cw0KPj4gcmVnaXN0ZXJlZCB3YXRjaGVzLiBUaGlzIGF2b2lkcyBzZW5kaW5n
IHdhdGNoIGV2ZW50cyB0byB0aGUgZGVhZCBkb21haW4NCj4+IHdoZW4gYWxsIHRoZSBub2Rl
cyByZWxhdGVkIHRvIGl0IGFyZSBiZWluZyByZW1vdmVkIGJ5IHRoZSBYZW4gdG9vbHMuDQo+
IA0KPiAgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBzaHV0ZG93biBkb2Vzbid0IG1lYW4gZGVh
ZC4gSXQgbWF5IGJlIHVzZWQgZHVyaW5nIA0KPiBtaWdyYXRpb24gKG9yIHNuYXBzaG90dGlu
ZyksIHdoZXJlIHdlIGRvbid0IHdhbnQgdG8gdG91Y2ggdGhlIHN0YXRlIGluIGNhc2Ugb2Yg
YSANCj4gY2FuY2VsbGF0aW9uIChvciByZXN1bWUpLg0KPiANCj4gRm9yIGluc3RhbmNlLCBz
ZWUgdGhlIGNvbW1hbmQgWFNfUkVTVU1FIHdoaWNoIHdpbGwgY2xlYXIgZG9tYWluLT5zaHV0
ZG93bi4NCg0KT2gsIGdvb2QgY2F0Y2ghDQoNCkkgbmVlZCB0byBhZGRpdGlvbmFsbHkgY2hl
Y2sgdGhlICJzaHV0ZG93biByZWFzb24iLiBJIGNhbiByZW1vdmUgdGhlDQp3YXRjaGVzIG9u
bHkgaW4gY2FzZSBvZiB0aGUgcmVhc29uIG5vdCBoYXZpbmcgYmVlbiAic3VzcGVuZCIuDQoN
Cg0KSnVlcmdlbg0KDQo=
--------------7N81NnY0BDvT9DsnytLmzcJd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7N81NnY0BDvT9DsnytLmzcJd--

--------------fzYtJkBsGeFOTD0BrodI4bxJ--

--------------WOuuf0XTot4JfyTLyQoDfAx4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNoubEFAwAAAAAACgkQsN6d1ii/Ey8d
4QgAlq1xIvLiVzOVpQi/zNvOo5yI2RGY/Q5srVGRsSGB+YCMK4e6qso94idmC64XFXFUDLEUklDr
VY1O82WYX7/xM8OGspvUj/U+1+oQayKBOj0qKHlAWfrvj64LcKV2WSr/aFhXyT9qqSBSxRe/WIFC
aDx9G83W1aHG/4Ukmsf4Luve3mQnOaSSkEU0KahaaK/rOZZsa92f2qfli+XbX4FLvMVYlGq7cDD+
VlvYUmSpXe5xwClNo1sjSuZRdKz/ZIiv6GB7R6qs1BzwX2qRcRIP5F56YFxZrbBMz3+DSx1Elocf
6H8syo+B/izCRq3+Oacbp1A81dWbM8La1oIoOOfEAQ==
=/IoK
-----END PGP SIGNATURE-----

--------------WOuuf0XTot4JfyTLyQoDfAx4--


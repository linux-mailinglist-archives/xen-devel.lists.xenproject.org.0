Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EED64028E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451592.709375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11pq-0000x8-HM; Fri, 02 Dec 2022 08:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451592.709375; Fri, 02 Dec 2022 08:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11pq-0000uo-DW; Fri, 02 Dec 2022 08:55:54 +0000
Received: by outflank-mailman (input) for mailman id 451592;
 Fri, 02 Dec 2022 08:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p11po-0000ud-Su
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:55:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f8d4fde-721f-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 09:55:51 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6354121C11;
 Fri,  2 Dec 2022 08:55:51 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1646C133DE;
 Fri,  2 Dec 2022 08:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id BrgGBJe9iWPWNAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 02 Dec 2022 08:55:51 +0000
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
X-Inumbo-ID: 1f8d4fde-721f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669971351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wtCc35EMrsGgNt1HPhXPZ/PW8H5z+COqCXJe4yt9koo=;
	b=qCmm+AqbMBJeJkeZsNjhgVJMCpOgz8x9t+URndclu1VKzoSx8SsnnEYWJe4FlR6KbsqGBl
	gAQFNDeOhZLJNnH8UdYiWOlVrSnr/MpzwFf2t3m27td5gt6lb1zBUkrHkuxzV1YoQ+4Js4
	WGHErBrtbRgOqk2ctKtGIaw1UwJ2gXs=
Message-ID: <42cd5af5-b2fd-59ad-7de7-f14e2facac28@suse.com>
Date: Fri, 2 Dec 2022 09:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] xen/privcmd: Fix a possible warning in
 privcmd_ioctl_mmap_resource()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: error27@gmail.com, harshit.m.mogalapalli@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20221126050745.778967-1-harshit.m.mogalapalli@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221126050745.778967-1-harshit.m.mogalapalli@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uwdMa1iAv3egOVPQfJ0E0w6z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uwdMa1iAv3egOVPQfJ0E0w6z
Content-Type: multipart/mixed; boundary="------------HdAZBpjEv01GON4bPbJ6Wl6i";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: error27@gmail.com, harshit.m.mogalapalli@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <42cd5af5-b2fd-59ad-7de7-f14e2facac28@suse.com>
Subject: Re: [PATCH] xen/privcmd: Fix a possible warning in
 privcmd_ioctl_mmap_resource()
References: <20221126050745.778967-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20221126050745.778967-1-harshit.m.mogalapalli@oracle.com>

--------------HdAZBpjEv01GON4bPbJ6Wl6i
Content-Type: multipart/mixed; boundary="------------VErMBwayIgMAgiu0uLX3QHlZ"

--------------VErMBwayIgMAgiu0uLX3QHlZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTEuMjIgMDY6MDcsIEhhcnNoaXQgTW9nYWxhcGFsbGkgd3JvdGU6DQo+IEFzICdr
ZGF0YS5udW0nIGlzIHVzZXItY29udHJvbGxlZCBkYXRhLCBpZiB1c2VyIHRyaWVzIHRvIGFs
bG9jYXRlDQo+IG1lbW9yeSBsYXJnZXIgdGhhbig+PSkgTUFYX09SREVSLCB0aGVuIGtjYWxs
b2MoKSB3aWxsIGZhaWwsIGl0DQo+IGNyZWF0ZXMgYSBzdGFjayB0cmFjZSBhbmQgbWVzc2Vz
IHVwIGRtZXNnIHdpdGggYSB3YXJuaW5nLg0KPiANCj4gQ2FsbCB0cmFjZToNCj4gLT4gcHJp
dmNtZF9pb2N0bA0KPiAtLT4gcHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNlDQo+IA0KPiBB
ZGQgX19HRlBfTk9XQVJOIGluIG9yZGVyIHRvIGF2b2lkIHRvbyBsYXJnZSBhbGxvY2F0aW9u
IHdhcm5pbmcuDQo+IFRoaXMgaXMgZGV0ZWN0ZWQgYnkgc3RhdGljIGFuYWx5c2lzIHVzaW5n
IHNtYXRjaC4NCj4gDQo+IEZpeGVzOiAzYWQwODc2NTU0Y2EgKCJ4ZW4vcHJpdmNtZDogYWRk
IElPQ1RMX1BSSVZDTURfTU1BUF9SRVNPVVJDRSIpDQo+IFNpZ25lZC1vZmYtYnk6IEhhcnNo
aXQgTW9nYWxhcGFsbGkgPGhhcnNoaXQubS5tb2dhbGFwYWxsaUBvcmFjbGUuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg==
--------------VErMBwayIgMAgiu0uLX3QHlZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------VErMBwayIgMAgiu0uLX3QHlZ--

--------------HdAZBpjEv01GON4bPbJ6Wl6i--

--------------uwdMa1iAv3egOVPQfJ0E0w6z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOJvZYFAwAAAAAACgkQsN6d1ii/Ey8V
0wgAkI0Bqdx5wFAHiOD4GBKxRcVeYVXMSWmGPw7UTTWSin6avteyKIT6RS8/bz+bWrKo/AugPsrR
4+HsjQdT2WBl2TowaOA/FtO5WqEzH+e6wwgokLyLO8crHdObvcuDhfpYviVUxrZNeBDnZhq89CC+
dKw606WDRtfl3lPfwh5/nKheZXSsO3Trfu4jgDZZsvalRjIBzOD01Jd3cy3ucjkvZUEA9J6qg8Za
FMpo0J1WkoKOHgpsEl/4w56WezIgRzAFY5XWBMJWNEtaecEB9rENd3JhHggNX7KWJCIJVKdwZrsS
mXCc0b4MlQUKUoq98OIlmRlp9Cy1c6HiRjjQo2jUtw==
=7Ix1
-----END PGP SIGNATURE-----

--------------uwdMa1iAv3egOVPQfJ0E0w6z--


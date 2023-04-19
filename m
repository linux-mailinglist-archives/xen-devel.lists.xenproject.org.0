Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8246E79E3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523421.813451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp78w-0001ZZ-DV; Wed, 19 Apr 2023 12:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523421.813451; Wed, 19 Apr 2023 12:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp78w-0001Ws-9b; Wed, 19 Apr 2023 12:42:38 +0000
Received: by outflank-mailman (input) for mailman id 523421;
 Wed, 19 Apr 2023 12:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K18G=AK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pp78v-0001Wm-5V
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:42:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8bfadd7-deaf-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:42:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5EF221986;
 Wed, 19 Apr 2023 12:42:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96AF71390E;
 Wed, 19 Apr 2023 12:42:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /whYI7rhP2TMEAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Apr 2023 12:42:34 +0000
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
X-Inumbo-ID: a8bfadd7-deaf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1681908154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+NYry55bNWgpBMPW2QTjRl5RzMdlcbH8Fpx7gA6h+E=;
	b=S7cL/Zv6O7o/O5YvaY7zPFnZHN5czWMiUYbSqVHjpUMTpgUn6QL/mEN8LsH/c/VV9YLnly
	FMl+q2OxNdlXZL4PAkheMZInKTcGLd8siomNAruEcdWviqDSQ1BIrMZSaWQGtO2tIFjMYk
	nxEdvxcXaohUr/u4Vj6tQYxanPrVzvU=
Message-ID: <99abd9a7-87cd-2f37-05bd-f4cdffd47a9c@suse.com>
Date: Wed, 19 Apr 2023 14:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] tools/xenstore/xenstored_control.c: correctly print
 time_t
Content-Language: en-US
To: Alexander Kanavin <alex@linutronix.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230419120710.855128-1-alex@linutronix.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230419120710.855128-1-alex@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------08iSab8KZaYOdHQsdzRTyQAc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------08iSab8KZaYOdHQsdzRTyQAc
Content-Type: multipart/mixed; boundary="------------Kv070jtSObHpcN0gkewur5bV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alexander Kanavin <alex@linutronix.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <99abd9a7-87cd-2f37-05bd-f4cdffd47a9c@suse.com>
Subject: Re: [PATCH v2] tools/xenstore/xenstored_control.c: correctly print
 time_t
References: <20230419120710.855128-1-alex@linutronix.de>
In-Reply-To: <20230419120710.855128-1-alex@linutronix.de>

--------------Kv070jtSObHpcN0gkewur5bV
Content-Type: multipart/mixed; boundary="------------97XNhJeuIboOGXtWz7fcczD4"

--------------97XNhJeuIboOGXtWz7fcczD4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjMgMTQ6MDcsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBPbiAzMiBi
aXQgc3lzdGVtcyB3aXRoIDY0IGJpdCB0aW1lX3QgKGhlbGxvLCBZMjAzOCBwcm9ibGVtKSwN
Cj4gdGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnMgb3RoZXJ3aXNlOg0KPiANCj4gfCB4ZW5z
dG9yZWRfY29udHJvbC5jOiBJbiBmdW5jdGlvbiAnbHVfcmVqZWN0X3JlYXNvbic6DQo+IHwg
eGVuc3RvcmVkX2NvbnRyb2wuYzo2NDY6NzA6IGVycm9yOiBmb3JtYXQgJyVsZCcgZXhwZWN0
cyBhcmd1bWVudCBvZiB0eXBlICdsb25nIGludCcsIGJ1dCBhcmd1bWVudCA1IGhhcyB0eXBl
ICd0aW1lX3QnIHtha2EgJ2xvbmcgbG9uZyBpbnQnfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0K
DQpKdWVyZ2VuDQoNCg==
--------------97XNhJeuIboOGXtWz7fcczD4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------97XNhJeuIboOGXtWz7fcczD4--

--------------Kv070jtSObHpcN0gkewur5bV--

--------------08iSab8KZaYOdHQsdzRTyQAc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQ/4boFAwAAAAAACgkQsN6d1ii/Ey9E
CQf+MNqY8qwH7szIksdPBiWVxwjdG+Rll6WKITATZMu/DFtsz4pD/TbQgyspoHyOscrdO+qS1Oh1
rJUhwF//Unp5FuQGRyytwIF0VargnDtuua7U9J9pDBhJ08L/PyqIDTi+180T+/t5ZH15wk38SNV4
xHfbAClSl1CRVKYcflnnzCBpxxUvnlGqRJ8rvvuudvHnNcUTF3mxd+0asO+wAwyP3NORH8rqbGyu
z0qr7yLzZDPntiRrtwsjKRLt4KOtCDiPOUg8slwM17BocndfhKDkAw0TkG5n6zBbZkCdNZUsYeW5
9GZ5UHGaehOBioT4E1AsLrBHtGrL1qbTngQMtK6kbg==
=DBx9
-----END PGP SIGNATURE-----

--------------08iSab8KZaYOdHQsdzRTyQAc--


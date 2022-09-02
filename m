Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9AA5AA875
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397366.637917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0gb-00081y-Ba; Fri, 02 Sep 2022 07:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397366.637917; Fri, 02 Sep 2022 07:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0gb-0007zJ-7r; Fri, 02 Sep 2022 07:01:53 +0000
Received: by outflank-mailman (input) for mailman id 397366;
 Fri, 02 Sep 2022 07:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2+i=ZF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oU0gZ-0007zD-DM
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:01:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf2257f-2a8d-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 09:01:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1AF034017;
 Fri,  2 Sep 2022 07:01:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A646A13328;
 Fri,  2 Sep 2022 07:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tq4fJ1uqEWMVUwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 02 Sep 2022 07:01:47 +0000
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
X-Inumbo-ID: 1cf2257f-2a8d-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662102107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sbV+FiqQ4NiOM+U9g9WVXNt3yfp7aQHt2tv8AaKog2o=;
	b=sXru7CJnp43OSHE+Q3gfs7Reml5Ral30qA5NcMVaeaDo9KZXV++Nmo0PZJlCThWGm5emu/
	985qf4Cg/8Mt/aNZhD8VxxD3yAYuUs59iovYZZ8XAEpFjUzJtWL65nnFHJQrCUXFKRBL03
	PP1tYD9pDp/Mr+hBu9UpqHefhePfCTA=
Message-ID: <5b0a0f39-7016-c447-fc45-9f66146f1cd2@suse.com>
Date: Fri, 2 Sep 2022 09:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/grants: prevent integer overflow in
 gnttab_dma_alloc_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
References: <YxDROJqu/RPvR0bi@kili>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YxDROJqu/RPvR0bi@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cRQo4LafssU0J0xeIuAJyvJO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cRQo4LafssU0J0xeIuAJyvJO
Content-Type: multipart/mixed; boundary="------------fkTq3z0VP8wTMXnXLZNXAXX2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Message-ID: <5b0a0f39-7016-c447-fc45-9f66146f1cd2@suse.com>
Subject: Re: [PATCH] xen/grants: prevent integer overflow in
 gnttab_dma_alloc_pages()
References: <YxDROJqu/RPvR0bi@kili>
In-Reply-To: <YxDROJqu/RPvR0bi@kili>

--------------fkTq3z0VP8wTMXnXLZNXAXX2
Content-Type: multipart/mixed; boundary="------------AajvFlGqY4hdbrcAuSypkoVX"

--------------AajvFlGqY4hdbrcAuSypkoVX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjIgMTc6MzUsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFRoZSBjaGFuZ2Ug
ZnJvbSBrY2FsbG9jKCkgdG8ga3ZtYWxsb2MoKSBtZWFucyB0aGF0IGFyZy0+bnJfcGFnZXMN
Cj4gbWlnaHQgbm93IGJlIGxhcmdlIGVub3VnaCB0aGF0IHRoZSAiYXJncy0+bnJfcGFnZXMg
PDwgUEFHRV9TSElGVCIgY2FuDQo+IHJlc3VsdCBpbiBhbiBpbnRlZ2VyIG92ZXJmbG93Lg0K
PiANCj4gRml4ZXM6IGIzZjc5MzFmNWM2MSAoInhlbi9nbnRkZXY6IHN3aXRjaCBmcm9tIGtj
YWxsb2MoKSB0byBrdmNhbGxvYygpIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRl
ciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------AajvFlGqY4hdbrcAuSypkoVX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------AajvFlGqY4hdbrcAuSypkoVX--

--------------fkTq3z0VP8wTMXnXLZNXAXX2--

--------------cRQo4LafssU0J0xeIuAJyvJO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMRqlsFAwAAAAAACgkQsN6d1ii/Ey/Y
LAf/WuPTgtFX7MUPzC8lcBQxS2xaDfDr2daJDF5ms0Ls/odgnyktNNsgplfNsK4x2ob598B7gvYO
WFvC7BVywEDmQD2vM6SDcgF0igg2aNxUenSGht+RrJhZuMDa8dT4/noOX+n5WED4cXFQ9IXFeGss
MsRRkAp2hgU7RZbp5qWpNOxLK7SUlvP4IcQ2F9CFdB12gnbjVr3OtNmdv43Dww38eYr70CIUNgC3
xOxUiYqe8BwBYd+eDHXiX4vBkygD7AM5BiyBev3+BJ3vXrHRXVLf45j2n8fY1X6E6o9nIbR6J7jJ
PcmPu9D8m+lSgFlXIXUanZ0O5ZCcAzSjqzKKJxsICg==
=7Ns1
-----END PGP SIGNATURE-----

--------------cRQo4LafssU0J0xeIuAJyvJO--


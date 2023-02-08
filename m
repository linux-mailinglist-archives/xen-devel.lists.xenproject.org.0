Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC868E94C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 08:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491608.760802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfC1-0004l2-Sl; Wed, 08 Feb 2023 07:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491608.760802; Wed, 08 Feb 2023 07:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfC1-0004hf-Om; Wed, 08 Feb 2023 07:48:37 +0000
Received: by outflank-mailman (input) for mailman id 491608;
 Wed, 08 Feb 2023 07:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pPfC0-0004hZ-5j
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 07:48:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0782f4-a784-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 08:48:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B67411F8AA;
 Wed,  8 Feb 2023 07:48:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9722813425;
 Wed,  8 Feb 2023 07:48:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9buBI9FT42O7bwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Feb 2023 07:48:33 +0000
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
X-Inumbo-ID: fd0782f4-a784-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675842513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tucXlCXEqqliuqXuPmdogZ+wrgldXIdN/2httANrX/M=;
	b=VTFofPOexpBmO639Mq02ozXJUdLm75I27i7raUn27plf03RQheUCQ7GlhcVk0d/I7leMzV
	/K8IkzJrhBsNf7/ZchVm4boou+8iN1kOM1Igw/le/Lgr2L0lrJcq49BAKAy+kQEocCUbrF
	bKqJbxZvUmQZ85vz0NTcv8F6+EgB4RI=
Message-ID: <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>
Date: Wed, 8 Feb 2023 08:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to
 provide library flags only.
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-6-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230120194431.55922-6-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h9owloSCSzLYg0sdCqtZqI71"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h9owloSCSzLYg0sdCqtZqI71
Content-Type: multipart/mixed; boundary="------------qDYDCpw0cKZds2C7BEkWMtme";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>
Subject: Re: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to
 provide library flags only.
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-6-anthony.perard@citrix.com>
In-Reply-To: <20230120194431.55922-6-anthony.perard@citrix.com>

--------------qDYDCpw0cKZds2C7BEkWMtme
Content-Type: multipart/mixed; boundary="------------9GPa8ZrkbXXvgJnFE7kjL6Zf"

--------------9GPa8ZrkbXXvgJnFE7kjL6Zf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDEuMjMgMjA6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBMRExJQlMgaXMg
dXN1YWxseSBvbmx5IHRoZSBsaWJyYXJ5IGZsYWdzICh0aGF0IGlzIHRoZSBgLWxgIGZsYWdz
KSwgYXMNCj4gcHJvcG9zZWQgaW4gR05VIG1ha2UgbWFudWFsLCB3aGlsZSBMREZMQUdTIHdv
dWxkIGJlIGV4dHJhIGZsYWdzIHN1Y2gNCj4gYXMgYC1MYC4NCj4gDQo+IFJld29yayB0aGUg
bWFrZSBtYWNybyAkKHhlbmxpYnMtbGRsaWJzLCApIHRvIG9ubHkgcHJvdmlkZSB0aGUgbGli
cmFyeQ0KPiBmbGFncy4gJCh4ZW5saWJzLWxkZmxhZ3MsICkgYWxyZWFkeSBvbmx5IHByb3Zp
ZGUgdGhlIGV4dHJhIGZsYWdzIGxpa2UNCj4gdGhlIC1ycGF0aC1saW5rIGZsYWdzLg0KPiAN
Cj4gQWxzbyBmaXggInRlc3RfJSIgcmVjaXBlIGluIGxpYnMvbGlnaHQgYXMgImxpYnhlbmxp
Z2h0LnNvIiBpbg0KPiAkKExETElCU19saWJ4ZW5saWdodCkgaXMgYmVlbiByZXBsYWNlZCBi
eSAiLWx4ZW5saWdodCIuIEluc3RlYWQgb2YNCj4ganVzdCBjaGFuZ2luZyB0aGUgZmlsdGVy
LCB3ZSB3aWxsIHN0YXJ0IHVzaW5nIHRoZSAkKHhlbmxpYnMtKiwpIG1hY3JvLg0KPiBGb3Ig
TERGTEFHUywgd2Ugb25seSBuZWVkcyB0aGUgb25lIGZvciBsaWJ4ZW5saWdodCwgYXMgdGhl
IG9uZSBmb3INCg0Kbml0OiBzL25lZWRzL25lZWQvDQoNCj4gdG9vbGNvcmUgYW5kIHRvb2xs
b2cgYXJlIGFscmVhZHkgaW4gJChMREZMQUdTKSwgdGhleSBhcmUgZGVwZW5kZW5jaWVzDQo+
IHRvIGJ1aWxkIGxpYnhlbmxpZ2h0LnNvLg0KDQpJIGRvbid0IGxpa2UgdGhpcyB2ZXJ5IG11
Y2guIHRvb2xjb3JlIGFuZCB0b29sbG9nIGFyZSB1c2VkIGRpcmVjdGx5IGJ5DQp0aGUgdGVz
dF8lIHByb2dyYW1zLCBzbyBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCByZWx5IG9uIGxpYnhl
bmxpZ2h0DQpkZXBlbmRpbmcgb24gdGhlbS4NCg0KDQpKdWVyZ2VuDQo=
--------------9GPa8ZrkbXXvgJnFE7kjL6Zf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9GPa8ZrkbXXvgJnFE7kjL6Zf--

--------------qDYDCpw0cKZds2C7BEkWMtme--

--------------h9owloSCSzLYg0sdCqtZqI71
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPjU9EFAwAAAAAACgkQsN6d1ii/Ey/u
Rgf/ToA05R83oh3Zxnn9QBhbo/DWFt/KwXWWDlQZTU2bb2V66C4cT7sk8C9XJD7EdNBQTX2oUyg/
qqdJTWZBHBdHwPkcA26BVd34BJOLoFGUSKlq0NvyLSsNSTRTp7lH2b2qswDbGcFSft8nq5b90pOp
7QVx7KBneQnjH3GAUgqEMsavxHeAXZgHqH2Od+OQ91Nvlqk9WT9yHWiMP7yEcNyn2O/GShEKFjsc
d7+sD4P3YlRxRCFZTHSSi5vACCtB5h6LhkoLDzra5LKHAy2t95s9YNXzUDmlnivXOCx7f4OzMzcG
i1mSpFlAq9qJ5Wm+R7vQMaQwjlMs6ZG+5GYpNamobA==
=l8fu
-----END PGP SIGNATURE-----

--------------h9owloSCSzLYg0sdCqtZqI71--


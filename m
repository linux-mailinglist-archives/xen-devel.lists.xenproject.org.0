Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C856FB480
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 17:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531649.827428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw3En-0002Ey-5n; Mon, 08 May 2023 15:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531649.827428; Mon, 08 May 2023 15:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw3En-0002Be-2y; Mon, 08 May 2023 15:57:21 +0000
Received: by outflank-mailman (input) for mailman id 531649;
 Mon, 08 May 2023 15:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pw3El-0002BY-Tr
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 15:57:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0250432e-edb9-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 17:57:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED6AE21E9C;
 Mon,  8 May 2023 15:57:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB4481346B;
 Mon,  8 May 2023 15:57:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EbczLN0bWWQqOwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 15:57:17 +0000
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
X-Inumbo-ID: 0250432e-edb9-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683561437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uJsZCdyVn5207Vye65VsGviklEd6AocSi/qGBd7aHkI=;
	b=AgB+dU+oP9plsZBFhGD+WPMqLBj8LtSrFz8Z8g1HZIZuZZbycHFYaCWnAtY0KNbh/Cybig
	ZtQUnMFz3v2c6S/MyUMiXXKSL9ACf8v3Cf7Hhp3Fhosbhb3IVhvKXHwR4w2dlipITC5BVg
	xvd+S3fAJywGgjvvAPWaXgABg+jnQIo=
Message-ID: <db39c117-d6fa-ab4d-1683-05fccdeda404@suse.com>
Date: Mon, 8 May 2023 17:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/pvcalls-back: fix double frees with
 pvcalls_new_active_socket()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
References: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GQgp9aeO0OpOmH1pBanwsEqn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GQgp9aeO0OpOmH1pBanwsEqn
Content-Type: multipart/mixed; boundary="------------qLcoMchTk1vUtg8ADvS0YEfR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Message-ID: <db39c117-d6fa-ab4d-1683-05fccdeda404@suse.com>
Subject: Re: [PATCH] xen/pvcalls-back: fix double frees with
 pvcalls_new_active_socket()
References: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>
In-Reply-To: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>

--------------qLcoMchTk1vUtg8ADvS0YEfR
Content-Type: multipart/mixed; boundary="------------XKdA7KkFzwvrNm5B0HXEBVTK"

--------------XKdA7KkFzwvrNm5B0HXEBVTK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTc6MTEsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IEluIHRoZSBwdmNh
bGxzX25ld19hY3RpdmVfc29ja2V0KCkgZnVuY3Rpb24sIG1vc3QgZXJyb3IgcGF0aHMgY2Fs
bA0KPiBwdmNhbGxzX2JhY2tfcmVsZWFzZV9hY3RpdmUoZmVkYXRhLT5kZXYsIGZlZGF0YSwg
bWFwKSB3aGljaCBjYWxscw0KPiBzb2NrX3JlbGVhc2UoKSBvbiAic29jayIuICBUaGUgYnVn
IGlzIHRoYXQgdGhlIGNhbGxlciBhbHNvIGZyZWVzIHNvY2suDQo+IA0KPiBGaXggdGhpcyBi
eSBtYWtpbmcgZXZlcnkgZXJyb3IgcGF0aCBpbiBwdmNhbGxzX25ld19hY3RpdmVfc29ja2V0
KCkNCj4gcmVsZWFzZSB0aGUgc29jaywgYW5kIGRvbid0IGZyZWUgaXQgaW4gdGhlIGNhbGxl
ci4NCj4gDQo+IEZpeGVzOiA1ZGI0ZDI4NmE4ZWYgKCJ4ZW4vcHZjYWxsczogaW1wbGVtZW50
IGNvbm5lY3QgY29tbWFuZCIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------XKdA7KkFzwvrNm5B0HXEBVTK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------XKdA7KkFzwvrNm5B0HXEBVTK--

--------------qLcoMchTk1vUtg8ADvS0YEfR--

--------------GQgp9aeO0OpOmH1pBanwsEqn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRZG90FAwAAAAAACgkQsN6d1ii/Ey9p
CAf/UjzlrR65HDDHfmlqqsZfml3j7ueSzKVzrj7j4Ak/rlQupbNWb/03mifKyEBPoBJ8+qEV2yhZ
VGm1S9mL6iXq4+tJWIwiHEAB+a/JkCREjiMARkT7s3OuFi60SDWIbJJzNeZFk2zf+EhhvKrygjP5
19rB2nfHdjc1kRuHTh8jwUKihsxam/LuprDgq77gN+3HO/Y4AjR+/AIrtGifuza+do4YPc9ECHv4
xrO8kjf04JUQVZsS7vDDNBQc4NJChg/vIFP7P56hJdSjTl+DU5hLqtAldYs2ModCd43J0gGoKyTV
rEPYka4jLtmTJFzyLYxwFnMkII2qzV3lcc9pHpb31w==
=IZyW
-----END PGP SIGNATURE-----

--------------GQgp9aeO0OpOmH1pBanwsEqn--


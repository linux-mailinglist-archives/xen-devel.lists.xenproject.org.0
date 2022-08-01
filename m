Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC815866A5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378593.611855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRFP-0003UK-FE; Mon, 01 Aug 2022 08:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378593.611855; Mon, 01 Aug 2022 08:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRFP-0003Rf-Bj; Mon, 01 Aug 2022 08:57:59 +0000
Received: by outflank-mailman (input) for mailman id 378593;
 Mon, 01 Aug 2022 08:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIRFN-0003RV-JM
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:57:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d81d82-1178-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 10:57:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D271333BF3;
 Mon,  1 Aug 2022 08:57:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 999DD13A72;
 Mon,  1 Aug 2022 08:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Gt4BJIuV52IIOQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Aug 2022 08:57:47 +0000
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
X-Inumbo-ID: 08d81d82-1178-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659344267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hMoY77jUFboPd1i4gHzoPyqs7hqfM3X0gMz1RIrPPiA=;
	b=qTeGHlApy5qtBV9OLhvke4JGlJTaeV2sEQUIIXz/Gpltl4kuGitYVnBaiQr1jqoY/2TBd3
	TfpOzYWtOGTwPIP9lmfXfVY3Hqne4TIWvxrpPZYFFgnmDanXSyLa4F3RSpT70T1BrBOms0
	QGhLF76fyIdM/afzCWvZl4VmTOZB40U=
Message-ID: <336cfa84-2f32-286a-394b-fc596b2ce03e@suse.com>
Date: Mon, 1 Aug 2022 10:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] tools: remove xenstore entries on vchan server
 closure
Content-Language: en-US
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nQYxkk01zcVmrtVUW7pNmQHn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nQYxkk01zcVmrtVUW7pNmQHn
Content-Type: multipart/mixed; boundary="------------00yoX429ATutGKy84cV000YS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
Message-ID: <336cfa84-2f32-286a-394b-fc596b2ce03e@suse.com>
Subject: Re: [PATCH v2 1/4] tools: remove xenstore entries on vchan server
 closure
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
In-Reply-To: <20220713150311.4152528-1-dmitry.semenets@gmail.com>

--------------00yoX429ATutGKy84cV000YS
Content-Type: multipart/mixed; boundary="------------P0NmayjkooFtKpCpSaWaEo0u"

--------------P0NmayjkooFtKpCpSaWaEo0u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDcuMjIgMTc6MDMsIGRtaXRyeS5zZW1lbmV0c0BnbWFpbC5jb20gd3JvdGU6DQo+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4gDQo+IHZjaGFuIHNlcnZlciBjcmVhdGVzIFhlblN0b3JlIGVudHJp
ZXMgdG8gYWR2ZXJ0aXNlIGl0cyBldmVudCBjaGFubmVsIGFuZA0KPiByaW5nLCBidXQgdGhv
c2UgYXJlIG5vdCByZW1vdmVkIGFmdGVyIHRoZSBzZXJ2ZXIgcXVpdHMuDQo+IEFkZCBhZGRp
dGlvbmFsIGNsZWFudXAgc3RlcCwgc28gdGhvc2UgYXJlIHJlbW92ZWQsIHNvIGNsaWVudHMg
ZG8gbm90IHRyeQ0KPiB0byBjb25uZWN0IHRvIGEgbm9uLWV4aXN0aW5nIHNlcnZlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFNlbWVu
ZXRzIDxkbXl0cm9fc2VtZW5ldHNAZXBhbS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------P0NmayjkooFtKpCpSaWaEo0u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------P0NmayjkooFtKpCpSaWaEo0u--

--------------00yoX429ATutGKy84cV000YS--

--------------nQYxkk01zcVmrtVUW7pNmQHn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLnlYsFAwAAAAAACgkQsN6d1ii/Ey/E
kAf/TD4ms4Sa97xSRntdYNBHw3Twvb+x0taZ5BwwxyaXMvHyT8W/zbJc2Q/M3aOpcOXf7Qtv0VXW
/u6Qd+RDDzWQhGCL/NVFPZ6sf5aEdQxUa8nnwfVbg8gwWsohbAsmZzBoUvfLvVvXBhTB+jmwqmO8
0cj57T+PbnyjiJNmCtLjuGgWyuqV20CAD1Wr42TFzBIFj7cPcnLLxXAbifbJD5161Gv7KJUCsc3c
fqNNPYEEcuB5jT5Th4lHflbq+5NrXm41x+8opCbow/YKC/myLMLsEd7GGK+PFo2qrRGa09iq13yY
xKdDlGHukPak57pFc7uc1LKqspsoVpBxNW+dM1oguA==
=DCd7
-----END PGP SIGNATURE-----

--------------nQYxkk01zcVmrtVUW7pNmQHn--


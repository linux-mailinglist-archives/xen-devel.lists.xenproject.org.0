Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64CE72B868
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546855.853923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bZZ-0004on-Oo; Mon, 12 Jun 2023 07:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546855.853923; Mon, 12 Jun 2023 07:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bZZ-0004mC-MA; Mon, 12 Jun 2023 07:02:41 +0000
Received: by outflank-mailman (input) for mailman id 546855;
 Mon, 12 Jun 2023 07:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SXsF=CA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q8bZY-0004m6-9E
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:02:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cba4791-08ef-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 09:02:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A630227F8;
 Mon, 12 Jun 2023 07:02:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F7571357F;
 Mon, 12 Jun 2023 07:02:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id anjXDQzDhmT6VwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Jun 2023 07:02:36 +0000
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
X-Inumbo-ID: 1cba4791-08ef-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686553356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NC7un6X72tTBu9wNNi0mbZ/fpp283kPMIrsVcPzsIVM=;
	b=Rqwmc+Wxc5df32JUkfZT4ZWlmQUww75uY/P5lZIPCjT+1FUWzyRsAR97fs4aH/atKi/bKw
	W5EkbKmmWd+n6hYTZN6cwT3FmwAPvAw9ymJdpGkLrfuNmRYYdD7ZOSZNAgU7sAvxJ3zc7T
	9u9sdvZ58P7Cj4YAF7n1hPH0HQk3FAY=
Message-ID: <b34ce9b4-f289-c836-17d6-fcdd105f301f@suse.com>
Date: Mon, 12 Jun 2023 09:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
 <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gvOqnGIvhOxru1BHHSWVkMns"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gvOqnGIvhOxru1BHHSWVkMns
Content-Type: multipart/mixed; boundary="------------M27SiL0OQ6uIjDyldWSaR1FT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b34ce9b4-f289-c836-17d6-fcdd105f301f@suse.com>
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
 <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
In-Reply-To: <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>

--------------M27SiL0OQ6uIjDyldWSaR1FT
Content-Type: multipart/mixed; boundary="------------UfHf3PlA0D4GFpKQt0W9NKB2"

--------------UfHf3PlA0D4GFpKQt0W9NKB2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDYuMjMgMjA6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMDk6NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBS
ZXBsYWNlIHRoZSB1c2FnZSBvZiB0aGUgeGVuc3RvcmUgcHJpdmF0ZSBsaXN0LmggaGVhZGVy
IHdpdGggdGhlDQo+PiBjb21tb24geGVuX2xpc3QuaCBvbmUuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMzoN
Cj4+IC0gbmV3IHBhdGNoDQo+PiAtLS0NCj4+IMKgIHRvb2xzL2xpYnMvc3RvcmUveHMuYyB8
IDU2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9zdG9yZS94cy5jIGIvdG9vbHMvbGlicy9z
dG9yZS94cy5jDQo+PiBpbmRleCA3YTlhOGIxNjU2Li4zODEzYjY5YWUyIDEwMDY0NA0KPj4g
LS0tIGEvdG9vbHMvbGlicy9zdG9yZS94cy5jDQo+PiArKysgYi90b29scy9saWJzL3N0b3Jl
L3hzLmMNCj4+IEBAIC0zNSwxMyArMzUsMTMgQEANCj4+IMKgICNpbmNsdWRlIDxlcnJuby5o
Pg0KPj4gwqAgI2luY2x1ZGUgInhlbnN0b3JlLmgiDQo+PiDCoCAjaW5jbHVkZSAieHNfbGli
LmgiDQo+PiAtI2luY2x1ZGUgImxpc3QuaCINCj4+IMKgICNpbmNsdWRlICJ1dGlscy5oIg0K
Pj4gwqAgI2luY2x1ZGUgPHhlbnRvb2xjb3JlX2ludGVybmFsLmg+DQo+PiArI2luY2x1ZGUg
PHhlbl9saXN0Lmg+DQo+PiDCoCBzdHJ1Y3QgeHNfc3RvcmVkX21zZyB7DQo+PiAtwqDCoMKg
IHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4+ICvCoMKgwqAgWEVOX1RBSUxRX0VOVFJZKHN0
cnVjdCB4c19zdG9yZWRfbXNnKSBsaXN0Ow0KPiANCj4gSSBoYXZlIGV4cGVjdGVkIHVzIHRv
IHVzZSB0byBYRU5fTElTVF8qLiBDYW4geW91IGV4cGxhaW4gd2h5IHlvdSBkaWRuJ3QgdXNl
IHRoZW0/DQoNClhFTl9MSVNUXyogZG9lc24ndCBwcm92aWRlIGEgbGlzdF9hZGRfdGFpbCgp
IHJlcGxhY2VtZW50Lg0KDQoNCkp1ZXJnZW4NCg==
--------------UfHf3PlA0D4GFpKQt0W9NKB2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------UfHf3PlA0D4GFpKQt0W9NKB2--

--------------M27SiL0OQ6uIjDyldWSaR1FT--

--------------gvOqnGIvhOxru1BHHSWVkMns
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSGwwsFAwAAAAAACgkQsN6d1ii/Ey9f
6wf/cH/qfFw9NIdQTW3BhnWOvVn0taxhRuvCD+g0K/IQum4h2gDbpGyWdk6QQ5qtTKJLY1YnM9uS
yo2itNywNFbdDlRdWRsq6mEmcUSRzEVH78GJPAOErsCqLgpLPDDZfA94isUhPRsE1qB/m2Le5PNm
oGl+sN0Ppwi6/pyV29fcimhtw11BuLIkVNdY8ckVxV/LlD21mNhAvJz7df46rsT/afmxJ/PjXOSV
wW/C6yN8xWUW+Swb05avR929Ryc2aBnOJMg8/Yl8Jqdj4OycVLdxlRSJuArCcyaGfCx/eFtwouPn
xCDBK1NWA1yfAnaBeBtPxd2eFMZgTUXubYJbsRYy3w==
=5Lzm
-----END PGP SIGNATURE-----

--------------gvOqnGIvhOxru1BHHSWVkMns--


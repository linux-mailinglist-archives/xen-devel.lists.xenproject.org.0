Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89156FF5C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365028.595060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqtl-0005It-C5; Mon, 11 Jul 2022 10:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365028.595060; Mon, 11 Jul 2022 10:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqtl-0005Gb-9J; Mon, 11 Jul 2022 10:44:17 +0000
Received: by outflank-mailman (input) for mailman id 365028;
 Mon, 11 Jul 2022 10:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAqtj-0005GV-S7
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:44:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67fa3212-0106-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 12:44:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 218D220329;
 Mon, 11 Jul 2022 10:44:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC38913322;
 Mon, 11 Jul 2022 10:44:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CEPRN/3+y2IRYAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 10:44:13 +0000
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
X-Inumbo-ID: 67fa3212-0106-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657536254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fNY2tzMpecI/Es63WOyi5BWI9B0cLSfSQLp3+4IlGPg=;
	b=F/iwf41xOHBS02am2XFkipnVqbzEkMAtw6Xoia4RVAIOPExFPe3f3zv99MKp9zB4AZ6NIA
	+9fFwtDK4eP9eoVhEJSq6VQx+UywHtH3quGCpYin1YGmWb0rS1ISCpyZo6WoX0mf6/S2S4
	qTxQcePTk5bOp3MNukqhkwQSAm6FIRI=
Message-ID: <490ef2d3-98e3-42f9-84e9-cf2122b14472@suse.com>
Date: Mon, 11 Jul 2022 12:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH] libxl: Check return value of libxl__xs_directory in
 name2bdf
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: "G.R." <firemeteor@users.sourceforge.net>, Wei Liu <wl@xen.org>
References: <20220711103847.21276-1-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220711103847.21276-1-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lAlZYpRiOY7rvg3t1TwCzJYV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lAlZYpRiOY7rvg3t1TwCzJYV
Content-Type: multipart/mixed; boundary="------------Duz7u0ji8E8bnqoM7exFYdBF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: "G.R." <firemeteor@users.sourceforge.net>, Wei Liu <wl@xen.org>
Message-ID: <490ef2d3-98e3-42f9-84e9-cf2122b14472@suse.com>
Subject: Re: [XEN PATCH] libxl: Check return value of libxl__xs_directory in
 name2bdf
References: <20220711103847.21276-1-anthony.perard@citrix.com>
In-Reply-To: <20220711103847.21276-1-anthony.perard@citrix.com>

--------------Duz7u0ji8E8bnqoM7exFYdBF
Content-Type: multipart/mixed; boundary="------------t3RRTQa1sGj3M0FRwJJ0rSb1"

--------------t3RRTQa1sGj3M0FRwJJ0rSb1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMTI6MzgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBsaWJ4bF9feHNf
ZGlyZWN0b3J5KCkgY2FuIHBvdGVudGlhbGx5IHJldHVybiBOVUxMIHdpdGhvdXQgc2V0dGlu
ZyBgbmAuDQo+IEFzIGBuYCBpc24ndCBpbml0aWFsaXNlZCwgd2UgbmVlZCB0byBjaGVjayBs
aWJ4bF9feHNfZGlyZWN0b3J5KCkNCj4gcmV0dXJuIHZhbHVlIGJlZm9yZSBjaGVja2luZyBg
bmAuIE90aGVyd2lzZSwgYG5gIG1pZ2h0IGJlIG5vbi16ZXJvDQo+IHdpdGggYGJkZnNgIE5V
TEwgd2hpY2ggd291bGQgbGVhZCB0byBhIHNlZ3YuDQo+IA0KPiBSZXBvcnRlZC1ieTogIkcu
Ui4iIDxmaXJlbWV0ZW9yQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCj4gRml4ZXM6IDU3YmZm
MDkxZjQgKCJsaWJ4bDogYWRkICduYW1lJyBmaWVsZCB0byAnbGlieGxfZGV2aWNlX3BjaScg
aW4gdGhlIElETC4uLiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------t3RRTQa1sGj3M0FRwJJ0rSb1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------t3RRTQa1sGj3M0FRwJJ0rSb1--

--------------Duz7u0ji8E8bnqoM7exFYdBF--

--------------lAlZYpRiOY7rvg3t1TwCzJYV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLL/v0FAwAAAAAACgkQsN6d1ii/Ey/x
nwf+IRMtHgSpJ7w7Tj1C4yvqDNNoxfzLXYUSkvBnqcSplc76Pqpee9HwoUt885jfrMwmB/+h1dq0
N6Xws1uV3KEpOV2efZTiMgkVWnSc8d6JyxdCfTnjE2qBqFEnKsYzypZoYpfDm47joXPWXfF8CUdv
c8Otn6OwVkJvq3XLO71h2cEX0KrBGu+c76m2UlCvJ9YYGWP8jD1UT/rBLbpZzhmOQOPQjM5/NFWj
JUt0nx4+1OF6Nd/51QlvCX3TTCOot8kMPz7fSlziB+X74vpiemP+KKPaHgbTn8LzMZeaC4vecWCh
omfNLDoNkuXH1WvzLkjJIPdGHuDxjDrmrtTTe4uAeQ==
=uFRv
-----END PGP SIGNATURE-----

--------------lAlZYpRiOY7rvg3t1TwCzJYV--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E55657B6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 15:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360375.589733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8MP2-0007ue-TB; Mon, 04 Jul 2022 13:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360375.589733; Mon, 04 Jul 2022 13:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8MP2-0007rp-PV; Mon, 04 Jul 2022 13:46:16 +0000
Received: by outflank-mailman (input) for mailman id 360375;
 Mon, 04 Jul 2022 13:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o8MP2-0007rj-19
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 13:46:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab93f71e-fb9f-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 15:46:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F6172281F;
 Mon,  4 Jul 2022 13:46:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57ED713451;
 Mon,  4 Jul 2022 13:46:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XmAyFCXvwmIWTQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Jul 2022 13:46:13 +0000
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
X-Inumbo-ID: ab93f71e-fb9f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656942373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fl5l9I6WsRK1qr9A0067bXv2MqCT0sQnOAP1WCC7YQ0=;
	b=CeFmmjJrcRvNLyQ20qNxBV5Ya95RuxvQgB4xlGne+267lztMwhsd1oD84orTYyDXzQKv5T
	LYUsV2cYO21/UO2GOOZ1mSMnXvw8xPpdSznqaxhXm1Awlsg6PThDTG8iq3I/pMmE0BD4vl
	9gMF7cKyU29yfnnMER8V3EMnEPMB2lM=
Message-ID: <a66f85f9-6182-ea1e-bb9b-18ac04d0ecea@suse.com>
Date: Mon, 4 Jul 2022 15:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Hopefully correct backports for gntdev deadlock
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220701000951.5072-1-demi@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220701000951.5072-1-demi@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vz0g3DiMkO808ZAmkMQiZxLV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Vz0g3DiMkO808ZAmkMQiZxLV
Content-Type: multipart/mixed; boundary="------------qk6Lgr0KLo4043DZUgcEpPXD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <a66f85f9-6182-ea1e-bb9b-18ac04d0ecea@suse.com>
Subject: Re: Hopefully correct backports for gntdev deadlock
References: <20220701000951.5072-1-demi@invisiblethingslab.com>
In-Reply-To: <20220701000951.5072-1-demi@invisiblethingslab.com>

--------------qk6Lgr0KLo4043DZUgcEpPXD
Content-Type: multipart/mixed; boundary="------------ai1fu7we68Z0vxqNj0p0FHiB"

--------------ai1fu7we68Z0vxqNj0p0FHiB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjIgMDI6MDksIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gVGhpcyBi
YWNrcG9ydHMgInhlbi9nbnRkZXY6IEF2b2lkIGJsb2NraW5nIGluIHVubWFwX2dyYW50X3Bh
Z2VzKCkiIHRvDQo+IHRoZSB2YXJpb3VzIHN0YWJsZSB0cmVlcywgaG9wZWZ1bGx5IGNvcnJl
Y3RseS4NCj4gDQoNCkkgaGF2ZSByZXZpZXdlZCBhbGwgYmFja3BvcnRzIGFuZCB0aGV5IHNl
ZW0gY29ycmVjdCB0byBtZS4NCg0KR3JlZywgSSdtIGZpbmUgd2l0aCB5b3UgYWRkaW5nIHRo
ZSBiYWNrcG9ydHMgdG8gdGhlIHJlbGF0ZWQgc3RhYmxlDQpicmFuY2hlcy4NCg0KDQpUaGFu
a3MsDQoNCkp1ZXJnZW4NCg==
--------------ai1fu7we68Z0vxqNj0p0FHiB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ai1fu7we68Z0vxqNj0p0FHiB--

--------------qk6Lgr0KLo4043DZUgcEpPXD--

--------------Vz0g3DiMkO808ZAmkMQiZxLV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLC7yQFAwAAAAAACgkQsN6d1ii/Ey8w
xQf+Mr+KRji1iAWtaDWYXPbukyBn2Us2gThiJaGBJxNG8D2vvIm8uHpXYLiqPTvVdr6nIW8ESn73
ejnklfxRBVRo/6yscN9CShjfS8rUECHFhvBK2CXIDREHA8S0Z9co30yVCD2KlzUOJ7rlerEta/qx
KOGQiZKv9v2m3sp5q9ZN2u8wGlwqfEWukrxDj0ydqr1TddLLwZka+gHSkAMDZXIxH387soepXka5
SGrdjcQ4wZkBJhDNPvL5SV1L0EpVLKpEpmSS5rJ9NOVhzToKXB/K7y/YPuwwiRP8kEmlzQ8dYMaG
f1J+7S9zbAOrwmn7mwoIKXZ9uEPP2xFU4CPu7o9GoA==
=f8Sz
-----END PGP SIGNATURE-----

--------------Vz0g3DiMkO808ZAmkMQiZxLV--


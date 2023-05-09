Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A86FC02E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 09:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531975.827967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwHU8-0004WB-S4; Tue, 09 May 2023 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531975.827967; Tue, 09 May 2023 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwHU8-0004UV-P2; Tue, 09 May 2023 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 531975;
 Tue, 09 May 2023 07:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8dUO=A6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pwHU6-0004UP-MU
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 07:10:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 861745a1-ee38-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 09:10:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F31A01F45A;
 Tue,  9 May 2023 07:10:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6005139B3;
 Tue,  9 May 2023 07:10:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NsYJL8zxWWS3HAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 09 May 2023 07:10:04 +0000
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
X-Inumbo-ID: 861745a1-ee38-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683616205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr6sbJPcZ0amzdla/OGNm5kfmiUJwrr6bXmyCciMiNo=;
	b=sjpn9UqCABm+jh9+9zxNPf3OuvMIEsW+Qs4/ir3YUsk492Hml1iTd40ewLCoyO5hfKp7Hw
	tKNg2nDQVVhNVE5XZz28lrUcfAAOGc8w1xVEhhDRHAa86v96+BKYUei7yqVbNTJ4KYg8cD
	v1Xeifqsf3k6rOQmNndBOSs49LGEOK4=
Message-ID: <0e7c1819-f611-1ba1-9f5a-3295eae7f95d@suse.com>
Date: Tue, 9 May 2023 09:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] tools: convert bitfields to unsigned type
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230508164618.21496-1-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230508164618.21496-1-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FijHca0A7NcSsaFZsH2RsFYv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FijHca0A7NcSsaFZsH2RsFYv
Content-Type: multipart/mixed; boundary="------------myB8dc4MuSE18IXYazDCN9VE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Message-ID: <0e7c1819-f611-1ba1-9f5a-3295eae7f95d@suse.com>
Subject: Re: [PATCH v2] tools: convert bitfields to unsigned type
References: <20230508164618.21496-1-olaf@aepfle.de>
In-Reply-To: <20230508164618.21496-1-olaf@aepfle.de>

--------------myB8dc4MuSE18IXYazDCN9VE
Content-Type: multipart/mixed; boundary="------------0P9cVVRs7fsnXncdrNUt2qh6"

--------------0P9cVVRs7fsnXncdrNUt2qh6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDUuMjMgMTg6NDYsIE9sYWYgSGVyaW5nIHdyb3RlOg0KPiBjbGFuZyBjb21wbGFp
bnMgYWJvdXQgdGhlIHNpZ25lZCB0eXBlOg0KPiANCj4gaW1wbGljaXQgdHJ1bmNhdGlvbiBm
cm9tICdpbnQnIHRvIGEgb25lLWJpdCB3aWRlIGJpdC1maWVsZCBjaGFuZ2VzIHZhbHVlIGZy
b20gMSB0byAtMSBbLVdzaW5nbGUtYml0LWJpdGZpZWxkLWNvbnN0YW50LWNvbnZlcnNpb25d
DQo+IA0KPiBUaGUgcG90ZW50aWFsIEFCSSBjaGFuZ2UgaW4gbGlieGVudmNoYW4gaXMgY292
ZXJlZCBieSB0aGUgWGVuIHZlcnNpb24gYmFzZWQgU09OQU1FLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------0P9cVVRs7fsnXncdrNUt2qh6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0P9cVVRs7fsnXncdrNUt2qh6--

--------------myB8dc4MuSE18IXYazDCN9VE--

--------------FijHca0A7NcSsaFZsH2RsFYv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRZ8cwFAwAAAAAACgkQsN6d1ii/Ey+B
fgf/fOoGMrP46JTa1DIHq46O64fgzD+gBmIMnoZIjfG/HBQe5sgVULg1dZAfjV7fZqhWSB6otjk/
GS3gyXqISlQfN77bITjsVkECGbhp4VFbGcgtOApjA+PzLFNS3owXgqJ7ZFqfDUhHYsyliI+G8ffC
Sfs91UPk1GR4AF5GgNqbQ3psULeclZJCT13WtK0m9/2eg16nB9vQeCdW9Kb7pV6kGG+IhJos3HVd
ZtGWBOPTSZsXLsZoL6Lup8uKYsNo53j7v/GUzB+mnWxNqh6fBBRqSFBFk16UMO4/vutrkJPq/OEg
ZdsXND9xmV283BtI/sSQ2ji5yvk2Qi+NGHtAJaaJkw==
=uxQS
-----END PGP SIGNATURE-----

--------------FijHca0A7NcSsaFZsH2RsFYv--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0726F4088
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 11:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528433.821567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmlw-0000qX-Hs; Tue, 02 May 2023 09:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528433.821567; Tue, 02 May 2023 09:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptmlw-0000oQ-F1; Tue, 02 May 2023 09:58:12 +0000
Received: by outflank-mailman (input) for mailman id 528433;
 Tue, 02 May 2023 09:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ptmlv-0000oI-Db
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 09:58:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d75d9f23-e8cf-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 11:58:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7373A21D47;
 Tue,  2 May 2023 09:58:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DD3C139C3;
 Tue,  2 May 2023 09:58:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2rIuDbDeUGTnZQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 May 2023 09:58:08 +0000
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
X-Inumbo-ID: d75d9f23-e8cf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683021488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3qmdns4q/cZ/NWmrzqGY03nxOPP2tMuMNz4jFkuKl4=;
	b=mBLYkkHJcOwd8p316DbLOqa2WVhMjfKHp1xXlIBJDCNwZ2l0o3I6E64A/AEVLOtfHU8RRh
	vjq4VkJniQ85luURpoMiGlxdQoooC9zcBaOwa+gpLJ9w1sVOL5rTB8rW3cjjnvHei9MozT
	iDFQzKooD/a8KZm8XwxVgHxSa0p28ss=
Message-ID: <1d6010d8-ec3b-6b34-f031-5c0e68ebaf6a@suse.com>
Date: Tue, 2 May 2023 11:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, axboe@kernel.dk
References: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L7dAGg1Ytvh72l5dMzjFTHrd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L7dAGg1Ytvh72l5dMzjFTHrd
Content-Type: multipart/mixed; boundary="------------EA7GBIwmE5skG7fSwXaPF5qz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, axboe@kernel.dk
Message-ID: <1d6010d8-ec3b-6b34-f031-5c0e68ebaf6a@suse.com>
Subject: Re: [PATCH] xen/blkfront: Only check REQ_FUA for writes
References: <20230426164005.2213139-1-ross.lagerwall@citrix.com>
In-Reply-To: <20230426164005.2213139-1-ross.lagerwall@citrix.com>

--------------EA7GBIwmE5skG7fSwXaPF5qz
Content-Type: multipart/mixed; boundary="------------KMPQhgyXkctIaC4EjZvsJSnt"

--------------KMPQhgyXkctIaC4EjZvsJSnt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDQuMjMgMTg6NDAsIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOg0KPiBUaGUgZXhpc3Rp
bmcgY29kZSBzaWxlbnRseSBjb252ZXJ0cyByZWFkIG9wZXJhdGlvbnMgd2l0aCB0aGUNCj4g
UkVRX0ZVQSBiaXQgc2V0IGludG8gd3JpdGUtYmFycmllciBvcGVyYXRpb25zLiBUaGlzIHJl
c3VsdHMgaW4gZGF0YQ0KPiBsb3NzIGFzIHRoZSBiYWNrZW5kIHNjcmliYmxlcyB6ZXJvZXMg
b3ZlciB0aGUgZGF0YSBpbnN0ZWFkIG9mIHJldHVybmluZw0KPiBpdC4NCj4gDQo+IFdoaWxl
IHRoZSBSRVFfRlVBIGJpdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ugb24gYSByZWFkIG9wZXJhdGlv
biwgYXQgbGVhc3QNCj4gb25lIHdlbGwta25vd24gb3V0LW9mLXRyZWUga2VybmVsIG1vZHVs
ZSBkb2VzIHNldCBpdCBhbmQgc2luY2UgaXQNCj4gcmVzdWx0cyBpbiBkYXRhIGxvc3MsIGxl
dCdzIGJlIHNhZmUgaGVyZSBhbmQgb25seSBsb29rIGF0IFJFUV9GVUEgZm9yDQo+IHdyaXRl
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------KMPQhgyXkctIaC4EjZvsJSnt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KMPQhgyXkctIaC4EjZvsJSnt--

--------------EA7GBIwmE5skG7fSwXaPF5qz--

--------------L7dAGg1Ytvh72l5dMzjFTHrd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRQ3q8FAwAAAAAACgkQsN6d1ii/Ey/N
oAf/Y0NoXQFylmrPidnUfvHRCcY4DCzY0QIQ9+y+7uP5XrvPp9yEpcikk7Oi2pkxcEpFL844n/uT
rtZdjhhYqhTh95OSvyX04XfGWKT+uXoaBndQW3coqiuzneG0RZRzZoxCh8w/xdRqgIIdeSp0mkaM
TlBnBrhOmlyC45Kevr5ih1jPO4pYf4PT/Qa71Iv0o47N2+O0IAOvLt4/N8eX3fgb2KicQoy4v48e
CPFO2kz92vlwRR2IDriK/M7kYwDldrxfBwOOEWdtdcgY/+dorkTuCAmleq+3S413pC4eSh9+cZrq
NzvA19d102W+gRexoEuAqZIb6FvlpaG7Y37nqWUSYg==
=Uish
-----END PGP SIGNATURE-----

--------------L7dAGg1Ytvh72l5dMzjFTHrd--


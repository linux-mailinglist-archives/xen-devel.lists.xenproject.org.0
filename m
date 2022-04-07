Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C144F7688
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300432.512441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLtn-0000MB-Bl; Thu, 07 Apr 2022 06:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300432.512441; Thu, 07 Apr 2022 06:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLtn-0000KI-8l; Thu, 07 Apr 2022 06:45:43 +0000
Received: by outflank-mailman (input) for mailman id 300432;
 Thu, 07 Apr 2022 06:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncLtm-0000KC-0c
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:45:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56ef5c30-b63e-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 08:45:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0370C210E5;
 Thu,  7 Apr 2022 06:45:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6C8813A66;
 Thu,  7 Apr 2022 06:45:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4w0xJ5OITmLMXgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 06:45:39 +0000
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
X-Inumbo-ID: 56ef5c30-b63e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649313940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fZTbClyKGGoIN+6/3vy0k/EUsRrzSi6W8nYjD4NuceI=;
	b=YVaO6inOwtu1oLDMIA5EdgLUD91wuRBsRcz+R+YoUujzH0yIHIRwuxCBIeevW4m3r/vpHU
	lU9PfyVayWI26CuB8JyQ7ypg1Czx/GSZQ0vZ0xS0NsFT+T/DZoTcGYK+SbV5l+2rWeuF0u
	EB9DkXruvD4wvnMze6dwchlNmfiT+xY=
Message-ID: <f9e6e597-f9e7-50a7-1abf-aaa20d07c10f@suse.com>
Date: Thu, 7 Apr 2022 08:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 6/6] xen/cpupool: Allow cpupool0 to use different
 scheduler
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-7-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220405085741.18336-7-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TIIQGH3C2eDhPCh50lo72Iqt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TIIQGH3C2eDhPCh50lo72Iqt
Content-Type: multipart/mixed; boundary="------------jNLT8zg4w90D8SE50DZu6oG0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <f9e6e597-f9e7-50a7-1abf-aaa20d07c10f@suse.com>
Subject: Re: [PATCH v5 6/6] xen/cpupool: Allow cpupool0 to use different
 scheduler
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-7-luca.fancellu@arm.com>
In-Reply-To: <20220405085741.18336-7-luca.fancellu@arm.com>

--------------jNLT8zg4w90D8SE50DZu6oG0
Content-Type: multipart/mixed; boundary="------------as1trS9w68ATLmwdzrcFmW0j"

--------------as1trS9w68ATLmwdzrcFmW0j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDQuMjIgMTA6NTcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEN1cnJlbnRseSBj
cHVwb29sMCBjYW4gdXNlIG9ubHkgdGhlIGRlZmF1bHQgc2NoZWR1bGVyLCBhbmQNCj4gY3B1
cG9vbF9jcmVhdGUgaGFzIGFuIGhhcmRjb2RlZCBiZWhhdmlvciB3aGVuIGNyZWF0aW5nIHRo
ZSBwb29sIDANCj4gdGhhdCBkb2Vzbid0IGFsbG9jYXRlIG5ldyBtZW1vcnkgZm9yIHRoZSBz
Y2hlZHVsZXIsIGJ1dCB1c2VzIHRoZQ0KPiBkZWZhdWx0IHNjaGVkdWxlciBzdHJ1Y3R1cmUg
aW4gbWVtb3J5Lg0KPiANCj4gV2l0aCB0aGlzIGNvbW1pdCBpdCBpcyBwb3NzaWJsZSB0byBh
bGxvY2F0ZSBhIGRpZmZlcmVudCBzY2hlZHVsZXIgZm9yDQo+IHRoZSBjcHVwb29sMCB3aGVu
IHVzaW5nIHRoZSBib290IHRpbWUgY3B1cG9vbC4NCj4gVG8gYWNoaWV2ZSB0aGlzIHRoZSBo
YXJkY29kZWQgYmVoYXZpb3IgaW4gY3B1cG9vbF9jcmVhdGUgaXMgcmVtb3ZlZA0KPiBhbmQg
dGhlIGNwdXBvb2wwIGNyZWF0aW9uIGlzIG1vdmVkLg0KPiANCj4gV2hlbiBjb21waWxpbmcg
d2l0aG91dCBib290IHRpbWUgY3B1cG9vbHMgZW5hYmxlZCwgdGhlIGN1cnJlbnQNCj4gYmVo
YXZpb3IgaXMgbWFpbnRhaW5lZCAoZXhjZXB0IHRoYXQgY3B1cG9vbDAgc2NoZWR1bGVyIG1l
bW9yeSB3aWxsIGJlDQo+IGFsbG9jYXRlZCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------as1trS9w68ATLmwdzrcFmW0j
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------as1trS9w68ATLmwdzrcFmW0j--

--------------jNLT8zg4w90D8SE50DZu6oG0--

--------------TIIQGH3C2eDhPCh50lo72Iqt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJOiJMFAwAAAAAACgkQsN6d1ii/Ey+f
SQf8Dq+erOZ7dBzwOVAlA2+PvcKdyVwUgj8JUQv7pMAzWn4+o9psk9F4dP4n2It8RfxKFiQk6uhW
qYWIdveMYYu0+a1p4xv9N9FBCsioOnB9bLy5hNkf454XigHWvQ/SaQtGNBjx73SB1p8WoPi8Zvdd
jrKLxCUye9pgqrbq5fjNXqZwpELjS6a0VLacbFqjmkmGMWCJ+TDMMqdTwWKntwjGSH165JvoznEo
RwHfLTqAWG7CXkI0WIEIEcsCc1/yrsHyW2BEKeS7i9WjfcmkGW0vJLEh8F8mSdKjIGYC953xVs1u
wE+r7/E2iKHWyWD2TVZK4WxIYTIvUSML5IGsEtvbig==
=rpyy
-----END PGP SIGNATURE-----

--------------TIIQGH3C2eDhPCh50lo72Iqt--


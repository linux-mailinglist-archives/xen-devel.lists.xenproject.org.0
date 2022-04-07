Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE504F759E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300376.512307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLJ2-00077S-JR; Thu, 07 Apr 2022 06:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300376.512307; Thu, 07 Apr 2022 06:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLJ2-00074V-Fi; Thu, 07 Apr 2022 06:07:44 +0000
Received: by outflank-mailman (input) for mailman id 300376;
 Thu, 07 Apr 2022 06:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncLJ1-00074M-Ou
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:07:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09390ee8-b639-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 08:07:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52F12210F4;
 Thu,  7 Apr 2022 06:07:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2B1C13485;
 Thu,  7 Apr 2022 06:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mhayNa1/TmIoUAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 06:07:41 +0000
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
X-Inumbo-ID: 09390ee8-b639-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649311662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JGmSjF6pVNGXAInKuwVmHmKz0Sh1UD4JOuhFLGlC+xc=;
	b=FP1ydTeuJrHWWkE1J/souxlHHPv93g6Y1c+eJV6mE39SVuc60dJrCTRT6jnIny7oTPBn2J
	X+WCDq7aoGhMr6L61Q1Id3P1th2dk6vXEX2p5vEWTdIpVSn/qVQN7R2wR75UEMFNNtg3Rt
	G/+iaQY6iQrU+KS1ku2GevSn/iqTj9c=
Message-ID: <9e776738-7e54-27ad-0a41-dc5cf8669510@suse.com>
Date: Thu, 7 Apr 2022 08:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/6] xen/sched: create public function for cpupools
 creation
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-3-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220405085741.18336-3-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------axlaadpoda6kaQUZsfixwwE0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------axlaadpoda6kaQUZsfixwwE0
Content-Type: multipart/mixed; boundary="------------5wUE9qfpqmOJvTqHFuilU2lx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <9e776738-7e54-27ad-0a41-dc5cf8669510@suse.com>
Subject: Re: [PATCH v5 2/6] xen/sched: create public function for cpupools
 creation
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-3-luca.fancellu@arm.com>
In-Reply-To: <20220405085741.18336-3-luca.fancellu@arm.com>

--------------5wUE9qfpqmOJvTqHFuilU2lx
Content-Type: multipart/mixed; boundary="------------ZBw4fphiiDH1pWalTaI9MWaf"

--------------ZBw4fphiiDH1pWalTaI9MWaf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDQuMjIgMTA6NTcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IENyZWF0ZSBuZXcg
cHVibGljIGZ1bmN0aW9uIHRvIGNyZWF0ZSBjcHVwb29scywgY2FuIHRha2UgYXMgcGFyYW1l
dGVyDQo+IHRoZSBzY2hlZHVsZXIgaWQgb3IgYSBuZWdhdGl2ZSB2YWx1ZSB0aGF0IG1lYW5z
IHRoZSBkZWZhdWx0IFhlbg0KPiBzY2hlZHVsZXIgd2lsbCBiZSB1c2VkLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiAt
LS0NCj4gQ2hhbmdlcyBpbiB2NToNCj4gLSBubyBjaGFuZ2VzDQo+IENoYW5nZXMgaW4gdjQ6
DQo+IC0gbm8gY2hhbmdlcw0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIEZpeGVkIGNvbW1lbnQg
KEFuZHJldykNCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBjcHVwb29sX2NyZWF0ZV9wb29sIGRv
ZXNuJ3QgY2hlY2sgYW55bW9yZSBmb3IgcG9vbCBpZCB1bmlxdWVuZXNzDQo+ICAgIGJlZm9y
ZSBjYWxsaW5nIGNwdXBvb2xfY3JlYXRlLiBNb2RpZmllZCBjb21taXQgbWVzc2FnZSBhY2Nv
cmRpbmdseQ0KDQpJIGdhdmUgeW91IG15ICJSZXZpZXdlZC1ieToiIGluIFYyIGFscmVhZHku
DQoNCg0KSnVlcmdlbg0K
--------------ZBw4fphiiDH1pWalTaI9MWaf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZBw4fphiiDH1pWalTaI9MWaf--

--------------5wUE9qfpqmOJvTqHFuilU2lx--

--------------axlaadpoda6kaQUZsfixwwE0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJOf60FAwAAAAAACgkQsN6d1ii/Ey+L
9Af8DShp5jmpFaJdq0x4kVym4BgB5qmsovBHhsjrmbFHsl1hzv7o0rUQ1etVQYfb41ftwXls91x6
WvQxmZDZuP3Yu3vW/i2hP3DpSaw0rzqdS1f58xOP3uyTjPNceY5LYkpCPq7nGad64X30Phxb6lVa
OOJzAlUbgAWB96OcNv2MZQKeSJDRuMjiZC6kt47Of9KONisOEVP1BpxwOOCrGY6h612wm50skHGm
9IqBPeEZgOUfWd+bKh18/UWfiov/M7vm6p3gvwAXtpFQtZboU9+nnZKU4izac3/XvCxd6UE14I3w
i71u96ehmvA0oBswgJhB5qdn1UV3DbQu9Nm1VzTtJw==
=8b7S
-----END PGP SIGNATURE-----

--------------axlaadpoda6kaQUZsfixwwE0--


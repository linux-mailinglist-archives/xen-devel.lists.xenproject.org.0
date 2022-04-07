Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F94F75D1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300406.512373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLQz-0003JO-WE; Thu, 07 Apr 2022 06:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300406.512373; Thu, 07 Apr 2022 06:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLQz-0003G6-SZ; Thu, 07 Apr 2022 06:15:57 +0000
Received: by outflank-mailman (input) for mailman id 300406;
 Thu, 07 Apr 2022 06:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncLQy-0003Fw-3M
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:15:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec4962d-b63a-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 08:15:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD8AB1F85B;
 Thu,  7 Apr 2022 06:15:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8156313485;
 Thu,  7 Apr 2022 06:15:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3POMHZqBTmKQUwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 06:15:54 +0000
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
X-Inumbo-ID: 2ec4962d-b63a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649312154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8SutVXeCr1YmsqlT/WY69fwgxgczRzOCrKzxQx/uaeA=;
	b=TQobK7zZ2WByT6i3sVlYhwxXO8bLaLq0FF2Mbe93KSj/TeHpjlTzI3gmH1BZ6xsKQBxrPw
	ClUu4ShL/oxZOB0NIuVlMS959yjHq9mDvjxwOjcY7pGKI0pC8U4+ynSiiGWN8RJ3j7/uj9
	cj23DHvo4/CKAB6lRQG/uMEmjRUgRLo=
Message-ID: <985e0230-bfc3-8cf1-84b9-0d3a43e4f58f@suse.com>
Date: Thu, 7 Apr 2022 08:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-5-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220405085741.18336-5-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d3V8DgBcMTj0NZmT54PdL4lK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d3V8DgBcMTj0NZmT54PdL4lK
Content-Type: multipart/mixed; boundary="------------QKdZ4klpWqssqoh0U90f2J8s";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <985e0230-bfc3-8cf1-84b9-0d3a43e4f58f@suse.com>
Subject: Re: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-5-luca.fancellu@arm.com>
In-Reply-To: <20220405085741.18336-5-luca.fancellu@arm.com>

--------------QKdZ4klpWqssqoh0U90f2J8s
Content-Type: multipart/mixed; boundary="------------raFQN2Ydhj6LWNJqeiuKVe3l"

--------------raFQN2Ydhj6LWNJqeiuKVe3l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDQuMjIgMTA6NTcsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEludHJvZHVjZSBh
IHdheSB0byBjcmVhdGUgZGlmZmVyZW50IGNwdXBvb2xzIGF0IGJvb3QgdGltZSwgdGhpcyBp
cw0KPiBwYXJ0aWN1bGFybHkgdXNlZnVsIG9uIEFSTSBiaWcuTElUVExFIHN5c3RlbSB3aGVy
ZSB0aGVyZSBtaWdodCBiZSB0aGUNCj4gbmVlZCB0byBoYXZlIGRpZmZlcmVudCBjcHVwb29s
cyBmb3IgZWFjaCB0eXBlIG9mIGNvcmUsIGJ1dCBhbHNvDQo+IHN5c3RlbXMgdXNpbmcgTlVN
QSBjYW4gaGF2ZSBkaWZmZXJlbnQgY3B1IHBvb2xzIGZvciBlYWNoIG5vZGUuDQo+IA0KPiBU
aGUgZmVhdHVyZSBvbiBhcm0gcmVsaWVzIG9uIGEgc3BlY2lmaWNhdGlvbiBvZiB0aGUgY3B1
cG9vbHMgZnJvbSB0aGUNCj4gZGV2aWNlIHRyZWUgdG8gYnVpbGQgcG9vbHMgYW5kIGFzc2ln
biBjcHVzIHRvIHRoZW0uDQo+IA0KPiBEb2N1bWVudGF0aW9uIGlzIGNyZWF0ZWQgdG8gZXhw
bGFpbiB0aGUgZmVhdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4gIyB4ZW4vY29tbW9uL3NjaGVkDQo=
--------------raFQN2Ydhj6LWNJqeiuKVe3l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------raFQN2Ydhj6LWNJqeiuKVe3l--

--------------QKdZ4klpWqssqoh0U90f2J8s--

--------------d3V8DgBcMTj0NZmT54PdL4lK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJOgZkFAwAAAAAACgkQsN6d1ii/Ey8c
kgf/T8iBC/kzZY4oxJhLHTUWuf5PZqr8ttbtI/P4XNAtZGlV7Z2Pe+sOUJUqRWKKu/okcYyRc/i8
PStsEhgY3Z4kytUbRU7m9AzPTqKaQ3nZ4HlMYDu+FkvKQgiKubYkfHcHFKgxCGm14O4P6M4Ljjw9
SST1MoAvEfeENYcjZRZjZ0JYeAPDdHnaha8YvADsqSGZC7lUNbTOjPBPAkd6Y9FDZer6SNShew0I
BQwPpsqDL9+g9w847xdQAW4WCaXR1AQUUoB7xYnuXnUl4aN1oHd6zeKJRFLfKbhHQ2kryG42Dl3w
ThkbTeBuR+SAu5XGLsSYtSH+nsLuR23e0qSyuZhrfQ==
=ZvMl
-----END PGP SIGNATURE-----

--------------d3V8DgBcMTj0NZmT54PdL4lK--


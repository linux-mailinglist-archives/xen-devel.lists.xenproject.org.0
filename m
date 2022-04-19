Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3113D506673
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307830.523139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nginM-0003mq-Lw; Tue, 19 Apr 2022 08:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307830.523139; Tue, 19 Apr 2022 08:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nginM-0003kE-Iq; Tue, 19 Apr 2022 08:01:08 +0000
Received: by outflank-mailman (input) for mailman id 307830;
 Tue, 19 Apr 2022 08:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nginK-0003k8-KQ
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:01:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbdd933d-bfb6-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 10:01:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3593E210F5;
 Tue, 19 Apr 2022 08:01:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5140139BE;
 Tue, 19 Apr 2022 08:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id We/RLj5sXmIEWwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Apr 2022 08:01:02 +0000
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
X-Inumbo-ID: dbdd933d-bfb6-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650355263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IAHVyZh9M1yn3uyFX0Q4UeRtgTRg365FY7m2GYk9oCY=;
	b=DjLOzxF3cyir/0kWRt1Fs3ew3uIdKJqJlhPqYGtEY/OvuGL5r+7fdXtEVPF+r2ZpHUnbc/
	ABZULYMo5mXmF0Fi3U45puIglH5j9j0ej2jbiHp3rOtnkaKg5UthJMqMfiK00UOirlsKr+
	+5JtXkZ58snpPIyMa64kmHP/M5hBzd4=
Message-ID: <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
Date: Tue, 19 Apr 2022 10:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220324140139.5899-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220324140139.5899-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jab0lu4vYhIgPHd2XwkkHXO5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jab0lu4vYhIgPHd2XwkkHXO5
Content-Type: multipart/mixed; boundary="------------2yl3GC04CGvGtrIaahRaFddn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
References: <20220324140139.5899-1-jgross@suse.com>
In-Reply-To: <20220324140139.5899-1-jgross@suse.com>

--------------2yl3GC04CGvGtrIaahRaFddn
Content-Type: multipart/mixed; boundary="------------H4LdJhjyGQtwbpBwYW0oMf51"

--------------H4LdJhjyGQtwbpBwYW0oMf51
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjIgMTU6MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEluIG9yZGVyIHRv
IGF2b2lkIGluZGlyZWN0IGZ1bmN0aW9uIGNhbGxzIG9uIHRoZSBoeXBlcmNhbGwgcGF0aCBh
cw0KPiBtdWNoIGFzIHBvc3NpYmxlIHRoaXMgc2VyaWVzIGlzIHJlbW92aW5nIHRoZSBoeXBl
cmNhbGwgZnVuY3Rpb24gdGFibGVzDQo+IGFuZCBpcyByZXBsYWNpbmcgdGhlIGh5cGVyY2Fs
bCBoYW5kbGVyIGNhbGxzIHZpYSB0aGUgZnVuY3Rpb24gYXJyYXkNCj4gYnkgYXV0b21hdGlj
YWxseSBnZW5lcmF0ZWQgY2FsbCBtYWNyb3MuDQo+IA0KPiBBbm90aGVyIGJ5LXByb2R1Y3Qg
b2YgZ2VuZXJhdGluZyB0aGUgY2FsbCBtYWNyb3MgaXMgdGhlIGF1dG9tYXRpYw0KPiBnZW5l
cmF0aW5nIG9mIHRoZSBoeXBlcmNhbGwgaGFuZGxlciBwcm90b3R5cGVzIGZyb20gdGhlIHNh
bWUgZGF0YSBiYXNlDQo+IHdoaWNoIGlzIHVzZWQgdG8gZ2VuZXJhdGUgdGhlIG1hY3Jvcy4N
Cj4gDQo+IFRoaXMgaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSBvZiB1c2luZyB0eXBl
IHNhZmUgY2FsbHMgb2YgdGhlDQo+IGhhbmRsZXJzIGFuZCB0byBlbnN1cmUgcmVsYXRlZCBo
YW5kbGVyIChlLmcuIFBWIGFuZCBIVk0gb25lcykgc2hhcmUNCj4gdGhlIHNhbWUgcHJvdG90
eXBlcy4NCj4gDQo+IEEgdmVyeSBicmllZiBwZXJmb3JtYW5jZSB0ZXN0IChwYXJhbGxlbCBi
dWlsZCBvZiB0aGUgWGVuIGh5cGVydmlzb3INCj4gaW4gYSA2IHZjcHUgZ3Vlc3QpIHNob3dl
ZCBhIHZlcnkgc2xpbSBpbXByb3ZlbWVudCAobGVzcyB0aGFuIDElKSBvZg0KPiB0aGUgcGVy
Zm9ybWFuY2Ugd2l0aCB0aGUgcGF0Y2hlcyBhcHBsaWVkLiBUaGUgdGVzdCB3YXMgcGVyZm9y
bWVkIHVzaW5nDQo+IGEgUFYgYW5kIGEgUFZIIGd1ZXN0Lg0KDQpBIGdlbnRsZSBwaW5nIHJl
Z2FyZGluZyB0aGlzIHNlcmllcy4NCg0KSSB0aGluayBwYXRjaCAxIHN0aWxsIGxhY2tzIGFu
IEFjayBmcm9tIHg4NiBzaWRlLiBPdGhlciB0aGFuIHRoYXQNCnBhdGNoZXMgMSwgMiBhbmQg
NCBzaG91bGQgYmUgZmluZSB0byBnbyBpbiwgYXMgdGhleSBhcmUgY2xlYW51cHMgd2hpY2gN
CmFyZSBmaW5lIG9uIHRoZWlyIG93biBJTUhPLg0KDQpBbmRyZXcsIHlvdSB3YW50ZWQgdG8g
Z2V0IHNvbWUgcGVyZm9ybWFuY2UgbnVtYmVycyBvZiB0aGUgc2VyaWVzIHVzaW5nDQp0aGUg
Q2l0cml4IHRlc3QgZW52aXJvbm1lbnQuIEFueSBuZXdzIG9uIHRoZSBwcm9ncmVzcyBoZXJl
Pw0KDQoNCkp1ZXJnZW4NCg==
--------------H4LdJhjyGQtwbpBwYW0oMf51
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------H4LdJhjyGQtwbpBwYW0oMf51--

--------------2yl3GC04CGvGtrIaahRaFddn--

--------------jab0lu4vYhIgPHd2XwkkHXO5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJebD4FAwAAAAAACgkQsN6d1ii/Ey93
YAf/RX7t7SpBZZVbbiHDfLzqP3XoEBC+iB8MICxbv/DIkMkQy91gjwanHwdD5BZNAMBtH7cnGH7l
xDsrC77RbZ+cQkhaqeja6VGV3Ded/qgPP9bPNahNjxK7AZ8HPe8R1ewYJpXMnFROOvV+4gxYNaEP
Jbqmy6iZ9bAkeXZDjDXgJxvOSlWmh98kHIM7ySlY5/Fuwy3/k0P55ety4qNRXH/uaNYJhmx/9Ffc
bOb0Z/fBaWTIkbzHr2kQO0MDLM5Q/CDnFT5Adbxtior3KaD63RnYZhj6YOnJtvV4whewQWZJMDmH
WDMWhIbbnawbdRcFETjOea+XooWijcGGl7FF2uiUcg==
=Irrv
-----END PGP SIGNATURE-----

--------------jab0lu4vYhIgPHd2XwkkHXO5--


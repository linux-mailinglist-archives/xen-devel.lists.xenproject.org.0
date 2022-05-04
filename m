Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548215198FB
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 09:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320404.541116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9pX-0006Fi-Qa; Wed, 04 May 2022 07:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320404.541116; Wed, 04 May 2022 07:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9pX-0006DS-NN; Wed, 04 May 2022 07:53:51 +0000
Received: by outflank-mailman (input) for mailman id 320404;
 Wed, 04 May 2022 07:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nm9pW-0006D3-17
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 07:53:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54268061-cb7f-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 09:53:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53A77210E5;
 Wed,  4 May 2022 07:53:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3ADA131BD;
 Wed,  4 May 2022 07:53:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3J+lNQoxcmJGXgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 04 May 2022 07:53:46 +0000
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
X-Inumbo-ID: 54268061-cb7f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651650827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tRuMICiQGR2wMmghH8xrPLx6iImFqvCTPWI3QuRWDZQ=;
	b=UdjnifrIpvNDPAbkkItX5X3RY5KGwxbTUXkyTDFcejonRrdWpoC9bo6SPx3yJtDrlgm5NN
	4WFyLLhDSztZiA7JAkNSpfX84gBA2pUUw6BQPWP3BXHveI7rK1G96Da1aroaq6feK6SQk7
	mIrlT83axm0ymIj0ib5we5eCVRIL//c=
Message-ID: <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
Date: Wed, 4 May 2022 09:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
In-Reply-To: <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nbQOVFr5r5mbpitkQo1XeI30"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nbQOVFr5r5mbpitkQo1XeI30
Content-Type: multipart/mixed; boundary="------------vXg90Jstq1UIB17NgjOQiR29";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <8baf689f-2a20-cf07-6878-9f9459063a25@suse.com>
Subject: Re: [PATCH v6 0/9] xen: drop hypercall function tables
References: <20220324140139.5899-1-jgross@suse.com>
 <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>
In-Reply-To: <06edd55a-86f2-52e3-e275-ee928a956fdf@suse.com>

--------------vXg90Jstq1UIB17NgjOQiR29
Content-Type: multipart/mixed; boundary="------------Q5PLr7JUyt9dWWE9Aa75SSaw"

--------------Q5PLr7JUyt9dWWE9Aa75SSaw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDQuMjIgMTA6MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDI0LjAzLjIy
IDE1OjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gYXZvaWQgaW5k
aXJlY3QgZnVuY3Rpb24gY2FsbHMgb24gdGhlIGh5cGVyY2FsbCBwYXRoIGFzDQo+PiBtdWNo
IGFzIHBvc3NpYmxlIHRoaXMgc2VyaWVzIGlzIHJlbW92aW5nIHRoZSBoeXBlcmNhbGwgZnVu
Y3Rpb24gdGFibGVzDQo+PiBhbmQgaXMgcmVwbGFjaW5nIHRoZSBoeXBlcmNhbGwgaGFuZGxl
ciBjYWxscyB2aWEgdGhlIGZ1bmN0aW9uIGFycmF5DQo+PiBieSBhdXRvbWF0aWNhbGx5IGdl
bmVyYXRlZCBjYWxsIG1hY3Jvcy4NCj4+DQo+PiBBbm90aGVyIGJ5LXByb2R1Y3Qgb2YgZ2Vu
ZXJhdGluZyB0aGUgY2FsbCBtYWNyb3MgaXMgdGhlIGF1dG9tYXRpYw0KPj4gZ2VuZXJhdGlu
ZyBvZiB0aGUgaHlwZXJjYWxsIGhhbmRsZXIgcHJvdG90eXBlcyBmcm9tIHRoZSBzYW1lIGRh
dGEgYmFzZQ0KPj4gd2hpY2ggaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgbWFjcm9zLg0KPj4N
Cj4+IFRoaXMgaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSBvZiB1c2luZyB0eXBlIHNh
ZmUgY2FsbHMgb2YgdGhlDQo+PiBoYW5kbGVycyBhbmQgdG8gZW5zdXJlIHJlbGF0ZWQgaGFu
ZGxlciAoZS5nLiBQViBhbmQgSFZNIG9uZXMpIHNoYXJlDQo+PiB0aGUgc2FtZSBwcm90b3R5
cGVzLg0KPj4NCj4+IEEgdmVyeSBicmllZiBwZXJmb3JtYW5jZSB0ZXN0IChwYXJhbGxlbCBi
dWlsZCBvZiB0aGUgWGVuIGh5cGVydmlzb3INCj4+IGluIGEgNiB2Y3B1IGd1ZXN0KSBzaG93
ZWQgYSB2ZXJ5IHNsaW0gaW1wcm92ZW1lbnQgKGxlc3MgdGhhbiAxJSkgb2YNCj4+IHRoZSBw
ZXJmb3JtYW5jZSB3aXRoIHRoZSBwYXRjaGVzIGFwcGxpZWQuIFRoZSB0ZXN0IHdhcyBwZXJm
b3JtZWQgdXNpbmcNCj4+IGEgUFYgYW5kIGEgUFZIIGd1ZXN0Lg0KPiANCj4gQSBnZW50bGUg
cGluZyByZWdhcmRpbmcgdGhpcyBzZXJpZXMuDQo+IA0KPiBJIHRoaW5rIHBhdGNoIDEgc3Rp
bGwgbGFja3MgYW4gQWNrIGZyb20geDg2IHNpZGUuIE90aGVyIHRoYW4gdGhhdA0KPiBwYXRj
aGVzIDEsIDIgYW5kIDQgc2hvdWxkIGJlIGZpbmUgdG8gZ28gaW4sIGFzIHRoZXkgYXJlIGNs
ZWFudXBzIHdoaWNoDQo+IGFyZSBmaW5lIG9uIHRoZWlyIG93biBJTUhPLg0KPiANCj4gQW5k
cmV3LCB5b3Ugd2FudGVkIHRvIGdldCBzb21lIHBlcmZvcm1hbmNlIG51bWJlcnMgb2YgdGhl
IHNlcmllcyB1c2luZw0KPiB0aGUgQ2l0cml4IHRlc3QgZW52aXJvbm1lbnQuIEFueSBuZXdz
IG9uIHRoZSBwcm9ncmVzcyBoZXJlPw0KDQpBbmQgYW5vdGhlciBwaW5nLg0KDQpBbmRyZXcs
IGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBzb21lIGZlZWRiYWNrIHJlZ2FyZGluZyBwZXJmb3Jt
YW5jZQ0KdGVzdGluZyBwcm9ncmVzcz8NCg0KDQpKdWVyZ2VuDQo=
--------------Q5PLr7JUyt9dWWE9Aa75SSaw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Q5PLr7JUyt9dWWE9Aa75SSaw--

--------------vXg90Jstq1UIB17NgjOQiR29--

--------------nbQOVFr5r5mbpitkQo1XeI30
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJyMQoFAwAAAAAACgkQsN6d1ii/Ey+6
Sgf+P/dXNAYpj/JqNjQZg6H+qpuJmtJ2PXpENwKAkEQcZbIbcjycuGGtnBU8+FPMuZaau0F3JGVo
r0FmajuhTYEXTWAtjpVKmlggTWc7RtHkyUCQl1lNQnhr2p60pZmDFKG/lCZa4+1FZgjIb6QdieeP
2/04X+dzIFHd0Lk7lVxVF7/dhB70zD/tFuyWzrmYnoF0VtQFH0uxH8Q+pwRbmfegWCKus7FhRO15
WrHyhIicsRFVeRmSBIJskKpGEWJL0QReRp5EZXC6usKBKYHS3ToSsiHBswupnwBYo9VKAvexF0TU
REB6wiOb5lo3fXXqr6t6q4OfKiIFaMZquziRnwiXdg==
=DR5Z
-----END PGP SIGNATURE-----

--------------nbQOVFr5r5mbpitkQo1XeI30--


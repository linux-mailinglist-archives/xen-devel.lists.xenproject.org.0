Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAD64CE28
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 17:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462449.720605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5UkZ-0008Jv-QH; Wed, 14 Dec 2022 16:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462449.720605; Wed, 14 Dec 2022 16:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5UkZ-0008Gm-N8; Wed, 14 Dec 2022 16:36:55 +0000
Received: by outflank-mailman (input) for mailman id 462449;
 Wed, 14 Dec 2022 16:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p5UkY-0008Ge-6R
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 16:36:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b62e78-7bcd-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 17:36:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46A4B21E40;
 Wed, 14 Dec 2022 16:36:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE6BF1333E;
 Wed, 14 Dec 2022 16:36:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id abyyMKP7mWM1cgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Dec 2022 16:36:51 +0000
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
X-Inumbo-ID: 83b62e78-7bcd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671035812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PyvwgZmcHUwgn/iFdAylnfgSHpELP1GmOXa+thqQGvs=;
	b=urmVoqGn+iAIkp7XDwdQpBf9DXVUGcUQ8vZwIkP9v+vXHD0l+Lc+3YLxFznP0WQaD91AM4
	nWkNkcdKNG77NyM6bVZlNCtZregUp/nTBz05aVYVYryeqfgVStVYWp2B2P0QF784pBNUIf
	fje5jkSu0piR4MyTVqCidSmHOfmbPWc=
Message-ID: <0fef4389-0373-b214-800c-f2457676e929@suse.com>
Date: Wed, 14 Dec 2022 17:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
In-Reply-To: <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zb895KB2Hz1S1W4J2TYXy201"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zb895KB2Hz1S1W4J2TYXy201
Content-Type: multipart/mixed; boundary="------------u1Hi7PgPEGFWTpJt6G3fITCf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
Message-ID: <0fef4389-0373-b214-800c-f2457676e929@suse.com>
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
 <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
In-Reply-To: <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>

--------------u1Hi7PgPEGFWTpJt6G3fITCf
Content-Type: multipart/mixed; boundary="------------WCiPuWs07kgP047jbO9LR4T6"

--------------WCiPuWs07kgP047jbO9LR4T6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjIgMTc6MjUsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gT24gMTIvMTQv
MjIgMTA6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAxNC4xMi4yMiAxNjowMywg
RGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4+DQo+Pj4gT24gOS8xMC8yMiAxMTo0OSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gSW5zdGVhZCBvZiBiZWluZyBhYmxlIHRvIHVzZSBu
b3JtYWwgc3BpbmxvY2tzIGFzIHJlY3Vyc2l2ZSBvbmVzLCB0b28sDQo+Pj4+IG1ha2UgcmVj
dXJzaXZlIHNwaW5sb2NrcyBhIHNwZWNpYWwgbG9jayB0eXBlLg0KPj4+Pg0KPj4+PiBUaGlz
IHdpbGwgbWFrZSB0aGUgc3BpbmxvY2sgc3RydWN0dXJlIHNtYWxsZXIgaW4gcHJvZHVjdGlv
biBidWlsZHMgYW5kDQo+Pj4+IGFkZCB0eXBlLXNhZmV0eS4NCj4+Pg0KPj4+IEp1c3QgYSBs
aXR0bGUgeWFrIHNoYXZpbmcsIElNSE8gYSBzcGlubG9jayBpcyBub3JtYWxseSBub3QgZXhw
ZWN0ZWQgdG8gYmUgDQo+Pj4gcmVjdXJzaXZlLiBUaHVzIGV4cGxpY2l0bHkgbmFtaW5nIGEg
c3BpbmxvY2sgYXMgbm9uLXJlY3Vyc2l2ZSBJIGZpbmQgdG8gYmUgDQo+Pj4gcmVkdW5kYW50
IGFsb25nIHdpdGggYmVpbmcgZXhwZW5zaXZlIGZvciB0eXBpbmcuIFdoZXJlYXMgYSByZWN1
cnNpdmUgc3BpbmxvY2sgDQo+Pj4gaXMgdGhlIHNwZWNpYWwgaW5zdGFuY2UgYW5kIHNob3Vs
ZCBoYXZlIGEgZGVjbGFyYXRpdmUgZGlzdGluY3Rpb24uIE9ubHkgDQo+Pj4gY29kaWZ5aW5n
IHRoZSByZWN1cnNpdmUgdHlwZSB3b3VsZCBzaWduaWZpY2FudGx5IGN1dCBkb3duIG9uIHRo
ZSBzaXplIG9mIHRoZSANCj4+PiBzZXJpZXMgYW5kIHN0aWxsIHByb3ZpZGUgZXF1YWwgdHlw
ZSBhbmQgdmlzdWFsIGNsYXJpZmljYXRpb24uDQo+Pg0KPj4gQSAibm9ybWFsIiBzcGlubG9j
ayBpcyBub24tcmVjdXJzaXZlLg0KPj4NCj4+IEEgcmVjdXJzaXZlIHNwaW5sb2NrIGluIFhl
biBjYW4gYmUgZWl0aGVyIHRha2VuIHJlY3Vyc2l2ZSwgb3IgaXQgY2FuIGJlIHRha2VuDQo+
PiBub24tcmVjdXJzaXZlLCBjYXVzaW5nIGZ1cnRoZXIgcmVjdXJzaXZlIGF0dGVtcHRzIHRv
IHNwaW4uDQo+IA0KPiBZZXMsIEkgdW5kZXJzdGFuZCB0aGUgY3VycmVudCBzaXR1YXRpb24u
DQo+IA0KPj4gU28gdGhlIGV4cGxpY2l0IG5vbi1yZWN1cnNpdmUgbG9ja2luZyBhcHBsaWVz
IHRvIHRoYXQgc3BlY2lhbCB0cmVhdG1lbnQgb2YNCj4+IHJlY3Vyc2l2ZSBzcGlubG9ja3Mu
DQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhpcywgYnV0IHRvIGhlbHAgY2xhcmlmeSB3aGF0IEkg
YW0gc2F5aW5nIGlzIHRoYXQgaW5kaXZpZHVhbHMgDQo+IGNvbWluZyBmcm9tIG91dHNpZGUg
WGVuIHdvdWxkIGV4cGVjdCBpcyB0aGUgc3BpbmxvY2sgZmFtaWx5IG9mIGNhbGxzIHRvIGJl
aGF2ZSANCj4gYXMgYSBub24tcmVjdXJzaXZlIHNwaW5sb2NrcyBhbmQgcmVjdXJzaXZlIHNw
aW5sb2NrIGZhbWlseSBvZiBjYWxscyB3b3VsZCANCj4gcHJvdmlkZSB0aGUgcmVjdXJzaXZl
IGJlaGF2aW9yLiBDdXJyZW50bHkgWGVuJ3MgYmVoYXZpb3IgaXMgYmFja3dhcmRzIHRvIHRo
aXMsIA0KPiB3aGljaCB0aGlzIHNlcmllcyBjb250aW51ZXMgYW5kIGlzIGEgdmFsaWQgYXBw
cm9hY2guIEhlcmUgc3BpbmxvY2sgYW5kIHJlY3Vyc2l2ZSANCj4gc3BpbmxvY2sgZmFtaWx5
IG9mIGNhbGxzIGFyZSByZWN1cnNpdmUgYW5kIG11c3QgdXNlIG5vbi1yZWN1cnNpdmUgc3Bp
bmxvY2sgDQo+IGZhbWlseSB0byBoYXZlICJub3JtYWwiIHNwaW5sb2NrIGJlaGF2aW9yLiBJ
TUhPIGl0IHdvdWxkIGdyZWF0bHkgc2ltcGxpZnkgdGhlIA0KDQpNeSBzZXJpZXMgZG9lc24n
dCBjaGFuZ2UgdHJlYXRtZW50IG9mIG5vcm1hbCBzcGlubG9ja3MuIFRoZXkgYXJlIHN0aWxs
IHVzZWQgdmlhDQpzcGluX3tsb2NrLGxvY2tlZCx1bmxvY2t9Lg0KDQo+IGNvZGUgYW5kIGFs
aWduIHdpdGggdGhlICJub3JtYWwiIHVuZGVyc3RhbmRpbmcgb2Ygc3BpbmxvY2tzIGlmIGlu
c3RlYWQgDQo+IHNwaW5fe2xvY2ssbG9ja2VkLHVubG9ja30gbWFjcm9zIHdlcmUgdGhlIG5v
bi1yZWN1cnNpdmUgY2FsbHMgYW5kIA0KPiBzcGluX3tsb2NrLGxvY2tlZCx1bmxvY2t9X3Jl
Y3Vyc2l2ZSBtYWNyb3Mgd2VyZSB0aGUgcmVjdXJzaXZlIGNhbGxzLiBUaGVuIHRoZXJlIA0K
PiB3b3VsZCBvbmx5IGJlIHR3byBzdWl0ZXMgb2YgY2FsbHMgZm9yIHNwaW5sb2NrcyBhbmQg
YSBsb3QgbGVzcyBrZXlzdHJva2VzIGZvciANCj4gbmVlZCBmb3IgbW9zdCBkZXZlbG9wbWVu
dC4NCg0KT25seSB0aGUgcmVjdXJzaXZlIHNwaW5sb2NrIHR5cGUgdXNlciBtdXN0IHNwZWNp
ZnksIHdoZXRoZXIgYSBsb2NrIGlzIG1lYW50IHRvDQpiZSBoYW5kbGVkIGFzIGEgcmVjdXJz
aXZlIG9yIGEgbm9uLXJlY3Vyc2l2ZSBsb2NrIGF0dGVtcHQuIFRoaXMgaXMgc2ltaWxhciB0
bw0KYSByd2xvY2ssIHdoZXJlIHRoZSB1c2VyIG11c3Qgc3BlY2lmeSB3aGV0aGVyIHRvIGxv
Y2sgYXMgYSByZWFkZXIgb3IgYSB3cml0ZXIuDQoNCg0KSnVlcmdlbg0K
--------------WCiPuWs07kgP047jbO9LR4T6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WCiPuWs07kgP047jbO9LR4T6--

--------------u1Hi7PgPEGFWTpJt6G3fITCf--

--------------zb895KB2Hz1S1W4J2TYXy201
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOZ+6MFAwAAAAAACgkQsN6d1ii/Ey/2
Awf+Ph1g2tEzIy3M1Vt0HIguIk5GyvO/ODiTZ5Qzeh8tGXGACUQ/9Lhshjpc/vwgvBx98EkhEohO
LHTty5Bd1nZCMXGw9J4tY8fqYC+27Bf2f3jBJQ7FuGEzZMlDR60mszOI6NAH/ZDQR5722/eymKHv
jCdg+UNJXhmGvdBI9Ae1GvwutnsMjmrnAn4JTM0pWBxUq4Ow9jqnUtzOLHxzuGrK06sN6ymMHbwp
U/ZL4QSlk7CyT2dBeSHwEx936nMRi/IHppS3FSTB68RQFk9o0iNUDA5gcG/l2PkPFi2HpT4zxOce
dwqrXpynn1+6D5DdaG7d9KuJv0nzGZSHhFqLIk0clQ==
=2RAi
-----END PGP SIGNATURE-----

--------------zb895KB2Hz1S1W4J2TYXy201--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FF5B5610
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405533.647971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXejG-0002cj-D0; Mon, 12 Sep 2022 08:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405533.647971; Mon, 12 Sep 2022 08:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXejG-0002Zd-A5; Mon, 12 Sep 2022 08:23:42 +0000
Received: by outflank-mailman (input) for mailman id 405533;
 Mon, 12 Sep 2022 08:23:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXejE-0002ZW-F1
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:23:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f5da71-3274-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 10:23:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B70061FA0A;
 Mon, 12 Sep 2022 08:23:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E1B8139E0;
 Mon, 12 Sep 2022 08:23:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rCYEHIrsHmNsJwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 08:23:38 +0000
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
X-Inumbo-ID: 33f5da71-3274-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662971018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTyvCwiJViDhAwb3CqykfKBNOXyxabvwchEafMCB2B8=;
	b=rprufwgoxO1DHFgRMVnSVXVCjEVb//40w3yEVK0kdFnjM68LhwDGnyaRDT+vVFI5E9t98w
	QDpmve3D7Germ/XsWr+ADHZB2xULUHFFPgSU9SqiNHMn3CL5z+RxYRoEGOgDqg4vEknjUG
	GTYe5y3vdZiDHUHzIbD8uGBnywYi9V8=
Message-ID: <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
Date: Mon, 12 Sep 2022 10:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3yO0Mmqo1aUIqxXy14lpC6Lo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3yO0Mmqo1aUIqxXy14lpC6Lo
Content-Type: multipart/mixed; boundary="------------3WBMFl9fx8t9bZhELbR4bSTy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
In-Reply-To: <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>

--------------3WBMFl9fx8t9bZhELbR4bSTy
Content-Type: multipart/mixed; boundary="------------DXIa29hswfuGEodiYCCswbEX"

--------------DXIa29hswfuGEodiYCCswbEX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjIgMTA6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wOS4yMDIy
IDA3OjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgaGVscGVyIGRvbWlkX3Rv
X2RvbWFpbigpIHJldHVybmluZyB0aGUgc3RydWN0IGRvbWFpbiBwb2ludGVyIGZvcg0KPj4g
YSBkb21haW4gZ2l2ZSBieSBpdHMgZG9taWQgYW5kIHdoaWNoIGlzIGtub3duIG5vdCBiZWlu
ZyBhYmxlIHRvIGJlDQo+PiByZWxlYXNlZCAoaXRzIHJlZmVyZW5jZSBjb3VudCBpc24ndCBp
bmNyZW1lbnRlZCBhbmQgbm8gcmN1X2xvY2tfZG9tYWluKCkNCj4+IGlzIGNhbGxlZCBmb3Ig
aXQpLg0KPj4NCj4+IEluIG9yZGVyIHRvIHNpbXBsaWZ5IGNvZGluZyBhZGQgYW4gaW50ZXJu
YWwgaGVscGVyIGZvciBkb2luZyB0aGUgbG9va3VwDQo+PiBhbmQgY2FsbCB0aGF0IGZyb20g
dGhlIG5ldyBmdW5jdGlvbiBhbmQgc2ltaWxhciBmdW5jdGlvbnMuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gSSBkb24n
dCBzZWUgYW4gaXNzdWUgd2l0aCBhZGRpbmcgc3VjaCBhIGhlbHBlciAocmVzcG9uZGluZyB0
byB5b3VyIGNvbmNlcm4NCj4gaW4gdGhlIGNvdmVyIGxldHRlciksIGJ1dCBJIHRoaW5rIHRo
ZSBjb25zdHJhaW50cyBuZWVkIHRvIGJlIGVtcGFoc2l6ZWQNCj4gbW9yZTogV2UgYWxyZWFk
eSBoYXZlIGdldF9rbm93bmFsaXZlX2RvbWFpbigpIGFuZCBnZXRfZG9tYWluX2J5X2lkKCks
IHNvDQo+IGhvdyBhYm91dCBuYW1pbmcgdGhlIG5ldyBoZWxwZXIgZ2V0X2tub3duYWxpdmVf
ZG9tYWluX2J5X2lkKCk/IEFuZCB0aGVuIC4uLg0KDQpJIGV4cGxpY2l0bHkgZGlkbid0IG5h
bWUgaXQgImdldF8uLi4iLCBhcyB0aG9zZSBoZWxwZXJzIGFsbCBpbmNyZW1lbnQgdGhlDQpy
ZWZlcmVuY2UgY291bnQgb2YgdGhlIGRvbWFpbi4gQW5kIHRoaXMgaXMgTk9UIGRvbmUgYnkg
dGhlIG5ldyBoZWxwZXIuDQoNCj4gDQo+PiBAQCAtODU5LDIwICs4NjYsMjcgQEAgc3RydWN0
IGRvbWFpbiAqZ2V0X2RvbWFpbl9ieV9pZChkb21pZF90IGRvbSkNCj4+ICAgDQo+PiAgIHN0
cnVjdCBkb21haW4gKnJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb21pZF90IGRvbSkNCj4+ICAg
ew0KPj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gTlVMTDsNCj4+ICsgICAgc3RydWN0IGRv
bWFpbiAqZDsNCj4+ICAgDQo+PiAgICAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRf
bG9jayk7DQo+PiAgIA0KPj4gLSAgICBmb3IgKCBkID0gcmN1X2RlcmVmZXJlbmNlKGRvbWFp
bl9oYXNoW0RPTUFJTl9IQVNIKGRvbSldKTsNCj4+IC0gICAgICAgICAgZCAhPSBOVUxMOw0K
Pj4gLSAgICAgICAgICBkID0gcmN1X2RlcmVmZXJlbmNlKGQtPm5leHRfaW5faGFzaGJ1Y2tl
dCkgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBpZiAoIGQtPmRvbWFpbl9pZCA9PSBkb20g
KQ0KPj4gLSAgICAgICAgew0KPj4gLSAgICAgICAgICAgIHJjdV9sb2NrX2RvbWFpbihkKTsN
Cj4+IC0gICAgICAgICAgICBicmVhazsNCj4+IC0gICAgICAgIH0NCj4+IC0gICAgfQ0KPj4g
KyAgICBkID0gZG9taWRfMl9kb21haW4oZG9tKTsNCj4+ICsgICAgaWYgKCBkICkNCj4+ICsg
ICAgICAgIHJjdV9sb2NrX2RvbWFpbihkKTsNCj4+ICsNCj4+ICsgICAgcmN1X3JlYWRfdW5s
b2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+PiArDQo+PiArICAgIHJldHVybiBkOw0KPj4g
K30NCj4+ICsNCj4+ICsvKiBVc2Ugb25seSBpZiBzdHJ1Y3QgZG9tYWluIGlzIGtub3duIHRv
IHN0YXkgYWxsb2NhdGVkISAqLw0KPj4gK3N0cnVjdCBkb21haW4gKmRvbWlkX3RvX2RvbWFp
bihkb21pZF90IGRvbSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBkb21haW4gKmQ7DQo+PiAr
DQo+PiArICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsNCj4+ICsNCj4+
ICsgICAgZCA9IGRvbWlkXzJfZG9tYWluKGRvbSk7DQo+PiAgIA0KPj4gICAgICAgcmN1X3Jl
YWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+IA0KPiAuLi4gZXh0ZW5kIHRoZSBj
b21tZW50IGhlcmUgYW5kIGluIHRoZSBoZWFkZXIgKG9yIHBlcmhhcHMgb25lIGluDQo+IHRo
ZSBoZWFkZXIgd291bGQgc3VmZmljZSBhbmQgdGhlIGRlZmluaXRpb24gaGVyZSBkb2Vzbid0
IG5lZWQgYW55DQo+IGZ1cnRoZXIgY29tbWVudCkgdG8gZXhwbGljaXRseSBzYXkgInJlZmVy
ZW5jZSBoZWxkIG9yIFJDVS1sb2NrZWQiLg0KDQpZZXMsIGdvb2QgaWRlYS4NCg0KDQpKdWVy
Z2VuDQo=
--------------DXIa29hswfuGEodiYCCswbEX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------DXIa29hswfuGEodiYCCswbEX--

--------------3WBMFl9fx8t9bZhELbR4bSTy--

--------------3yO0Mmqo1aUIqxXy14lpC6Lo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMe7IkFAwAAAAAACgkQsN6d1ii/Ey/+
vAf/blhSm4T58i9Dc2wMTuqX6aGhAJoI8w9qnLslrHDxE2mQ6bIan/aEiJYaq8N85xWgaDD8bPpA
XYe9vUwgfUrFEloBNRmfNZ4mocjW+piBvK4JcMX3xACRrIk2EPBrmOk5Z25k7bHYhUt53cLhJBxt
WtjOUQaTb9C0Gk/hOiqOiOFvxk0/SP2UvqBE02i90S9sB1AmA5WViDYJctSBDEsii8+Re87AD+34
xsS2VUBcJKQZr8/nA7glexk+L1tJgpncKfvbXZB6A/Jc2kbJ6kILIvpil5F4gUeA8+nsQJ7Xm/ME
32CgzgbYhYhLojyZXaP26dM/vcM8zhyXnLpjkylNTg==
=4UIo
-----END PGP SIGNATURE-----

--------------3yO0Mmqo1aUIqxXy14lpC6Lo--


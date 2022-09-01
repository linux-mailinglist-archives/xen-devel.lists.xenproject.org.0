Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C05A95A5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 13:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396531.636695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTiJX-0003CZ-AU; Thu, 01 Sep 2022 11:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396531.636695; Thu, 01 Sep 2022 11:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTiJX-0003Aj-7l; Thu, 01 Sep 2022 11:24:51 +0000
Received: by outflank-mailman (input) for mailman id 396531;
 Thu, 01 Sep 2022 11:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oTiJV-0003AY-QZ
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 11:24:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b011c100-29e8-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 13:24:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE23E2265F;
 Thu,  1 Sep 2022 11:24:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4F5E13A79;
 Thu,  1 Sep 2022 11:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ePyfKn+WEGOGBQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Sep 2022 11:24:47 +0000
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
X-Inumbo-ID: b011c100-29e8-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662031487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uedeku0RXtcWiyeFDdKyLcP3uEp1CyzNSCtc/pYt7E4=;
	b=P5r1NDWMV9/HgyLe56TlCkHaKAeBYsr8dSSRMnowPmNh++mwtOCkD6XFp8Ibo++spv400G
	1S7mSEkIfTL1pU6EUzLzwerA7ZH8Tmg9IhTEOkC9Z5h2NEeYJXg0KtmY3Sv0b/rX3t38Xs
	HHZ0z86s6wIcB9ScHrVJRT06HkmzwTk=
Message-ID: <77346c6d-4a0c-b441-2253-4e968207c780@suse.com>
Date: Thu, 1 Sep 2022 13:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-3-jgross@suse.com>
 <f2f53416-c2bf-4239-4816-685b0c105952@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f2f53416-c2bf-4239-4816-685b0c105952@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ruzH4VwDHLoAVF3POWYEEM0e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ruzH4VwDHLoAVF3POWYEEM0e
Content-Type: multipart/mixed; boundary="------------fe45wrmu3t9Q9l9LH38KZmyB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Message-ID: <77346c6d-4a0c-b441-2253-4e968207c780@suse.com>
Subject: Re: [PATCH v3 2/3] xen/sched: carve out memory allocation and freeing
 from schedule_cpu_rm()
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-3-jgross@suse.com>
 <f2f53416-c2bf-4239-4816-685b0c105952@citrix.com>
In-Reply-To: <f2f53416-c2bf-4239-4816-685b0c105952@citrix.com>

--------------fe45wrmu3t9Q9l9LH38KZmyB
Content-Type: multipart/mixed; boundary="------------gp2lrGx52mDprKaBfe7qTnfh"

--------------gp2lrGx52mDprKaBfe7qTnfh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjIgMTM6MTcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE2LzA4LzIw
MjIgMTE6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gaW5kZXgg
ZjZlZWQ4ODkzMC4uMjI4NDcwYWM0MSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vc2No
ZWQvY29yZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4gQEAgLTMy
MzcsNiArMzIzNyw3NSBAQCBvdXQ6DQo+PiAgICAgICByZXR1cm4gcmV0Ow0KPj4gICB9DQo+
PiAgIA0KPj4gKy8qDQo+PiArICogQWxsb2NhdGUgYWxsIG1lbW9yeSBuZWVkZWQgZm9yIHNj
aGVkdWxlX2NwdV9ybV9mcmVlKCksIHdoaWNoIGNhbid0IGRvIHRoYXQNCj4+ICsgKiBkdWUg
dG8gYmUgY2FsbGVkIGluIHN0b3BfbWFjaGluZSgpIGNvbnRleHQgd2l0aCBpbnRlcnJ1cHRz
IGRpc2FibGVkLg0KPiANCj4gQXMgYSBtaW5vciBvYnNlcnZhdGlvbiwgdGhpcyBpcyBhd2t3
YXJkIGdyYW1tYXIuwqAgSSdkIHN1Z2dlc3QgIi4uLg0KPiBuZWVkZWQgZm9yIGZyZWVfY3B1
X3JtX2RhdGEoKSwgYXMgYWxsb2NhdGlvbnMgY2Fubm90IGJlIG1hZGUgaW4NCj4gc3RvcF9t
YWNoaW5lKCkgY29udGV4dCIuDQoNCk9rYXksIHdpbGwgY2hhbmdlIGl0Lg0KDQoNCkp1ZXJn
ZW4NCg==
--------------gp2lrGx52mDprKaBfe7qTnfh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gp2lrGx52mDprKaBfe7qTnfh--

--------------fe45wrmu3t9Q9l9LH38KZmyB--

--------------ruzH4VwDHLoAVF3POWYEEM0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMQln8FAwAAAAAACgkQsN6d1ii/Ey9e
Igf8DCsny9dM+Vxut0ae1VbWx8mNugXxHGrOFtFHd18N0xat0XGa2knJh1z5DQOQdAZDI8fHt5XJ
r/KNChIOWcPXTNJ+jbVRHM2M0AeOmbIgszuf6Mur9dIK818B2x+RttX0J3pFRCYU8DjAUgiAbIYs
ocmvoXGZISvIygjyyOewI2jBujv7hppV5f8TCB4udSeICQc7SMiClU4zkaikmtOn2IL4Iunex93R
/mS8/W8F/Swdr7p7OSTg3Yrgi8dunSB5GaZq5hz4fEiVQo7he18eL+NO5meUlIovQqr5mnWx8o/k
R1YCYgTT03Q5/Z8zTcDNpIy7LR8SINWs+9c4pO0WRA==
=UJ8Q
-----END PGP SIGNATURE-----

--------------ruzH4VwDHLoAVF3POWYEEM0e--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6554659F675
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:38:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392331.630611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmpz-00048m-Ac; Wed, 24 Aug 2022 09:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392331.630611; Wed, 24 Aug 2022 09:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmpz-00045R-7O; Wed, 24 Aug 2022 09:38:15 +0000
Received: by outflank-mailman (input) for mailman id 392331;
 Wed, 24 Aug 2022 09:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQmpy-00045L-2R
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:38:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789acd2e-2390-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 11:38:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31F6F202A0;
 Wed, 24 Aug 2022 09:38:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B14E013AC0;
 Wed, 24 Aug 2022 09:38:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rbeJKYPxBWMzBgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 09:38:11 +0000
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
X-Inumbo-ID: 789acd2e-2390-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661333892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3g9xe+nMq5l74oQ4YrNdfkOkdaaNgceVbt4sMbG8vTI=;
	b=p1r35KLdNHaP7AVlCBge8M0nl/dcS5Rb30GmmvKsauREXFXGSnFGIZUOSKO8oMBx1hS1uE
	gHdsWV5CFC+ZRTX9K3jYO8/86xNeNfW/LB05IhVowszZzx1XEyTPSBelNITv8Z0fNyQY5D
	UdzaHSegF8GrmZcUGpaytXwF85rCFaY=
Message-ID: <fe3d72a7-7e85-1d53-df63-9315c38d63c5@suse.com>
Date: Wed, 24 Aug 2022 11:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
 <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
 <bea39396-43ba-9d21-7ada-00dd70614fd2@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <bea39396-43ba-9d21-7ada-00dd70614fd2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sQkrZ96pLJlrKFp0xUORJY6D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sQkrZ96pLJlrKFp0xUORJY6D
Content-Type: multipart/mixed; boundary="------------RuZXevF4PVlAU0fNrsMwEkmr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Message-ID: <fe3d72a7-7e85-1d53-df63-9315c38d63c5@suse.com>
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
 <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
 <bea39396-43ba-9d21-7ada-00dd70614fd2@xen.org>
In-Reply-To: <bea39396-43ba-9d21-7ada-00dd70614fd2@xen.org>

--------------RuZXevF4PVlAU0fNrsMwEkmr
Content-Type: multipart/mixed; boundary="------------kBW3ES9X6zMf9BY0avKI05x0"

--------------kBW3ES9X6zMf9BY0avKI05x0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTE6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA4LzIwMjIgMTA6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyNC4wOC4yMiAxMTowMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMTYvMDgvMjAyMiAwNzo0MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDE2
LjA4LjIwMjIgMDQ6MzYsIFBlbm55IFpoZW5nIHdyb3RlOg0KPj4+Pj4gK3ZvaWQgZnJlZV9k
b21zdGF0aWNfcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQ0KPj4+Pj4gK3sNCj4+Pj4+
ICvCoMKgwqAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOw0KPj4+
Pj4gK8KgwqDCoCBib29sIGRyb3BfZG9tX3JlZjsNCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAg
aWYgKCB1bmxpa2VseSghZCkgKQ0KPj4+Pj4gK8KgwqDCoCB7DQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcHJp
bnRrKCJUaGUgYWJvdXQtdG8tZnJlZSBzdGF0aWMgcGFnZSAlIlBSSV9tZm4iIG11c3QgYmUg
b3duZWQgYnkgDQo+Pj4+PiBhIGRvbWFpblxuIiwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKSk7DQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOw0KPj4+Pj4gK8KgwqDCoCB9DQo+Pj4+DQo+Pj4+IEZvciB0aGUg
bWVzc2FnZSB0byBiZSB1c2VmdWwgYXMgYSBoaW50IGlmIHRoZSBhc3NlcnRpb24gdHJpZ2dl
cnMsIGl0DQo+Pj4+IHdhbnRzIHByaW50aW5nIGFoZWFkIG9mIHRoZSBhc3NlcnRpb24uIEkg
YWxzbyB0aGluayBpdCB3YW50cyB0byBiZSBhDQo+Pj4+IFhFTkxPR19HXyoga2luZCBvZiBs
b2cgbGV2ZWwsIHNvIGl0IHdvdWxkIGJlIHJhdGUgbGltaXRlZCBieSBkZWZhdWx0DQo+Pj4+
IGluIHJlbGVhc2UgYnVpbGRzLiBKdXN0IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUuDQo+Pj4N
Cj4+PiArMQ0KPj4+DQo+Pj4+IChJJ20gbm90IGluIGZhdm9yIG9mDQo+Pj4+IHRoZSBsb2cg
bWVzc2FnZSBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCBJIGRvIGtub3cgdGhhdCBKdWxpZW4g
aGFkDQo+Pj4+IGFza2VkIGZvciBvbmUuKQ0KPj4+IFRCSCwgSSB0aGluayBhbGwgQVNTRVJU
X1VOUkVBQ0hBQkxFKCkgcGF0aHMgc2hvdWxkIGJlIGFjY29tcGFuaWVkIHdpdGggYSANCj4+
PiBwcmludGsoKS4gVGhpcyB3b3VsZCBhbHNvIGFsbG93IHVzIHRvIGNhdGNoIGlzc3VlIGlu
IHByb2R1Y3Rpb24gcmF0aGVyIHRoYW4gDQo+Pj4gaW4gb25seSBpbiBkZWJ1Zy4NCj4+DQo+
PiBXaGF0IGFib3V0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgdGhlbj8NCj4gDQo+
IFRoYXQgY291bGQgYmUgYSBmaXJzdCBzdGVwLiBJIHN0aWxsIHRoaW5rIGEgbWVzc2FnZSBs
aWtlIFBlbm55IGhhcyBhZGRlZCBpbiB0aGUgDQo+IHBhdGNoIGlzIHVzZWZ1bC4NCg0KQXMg
dGhlIFdBUk4oKSB3b3VsZCBzcGl0IG91dCBmaWxlIGFuZCBsaW5lLCBhIGNvbW1lbnQgbWln
aHQgYmUgZW5vdWdoLg0KDQpJbiB0aGUgZW5kIHRoYXQgaXMgc29tZXRoaW5nIHRoZSBtYWlu
dGFpbmVyIG9mIHRoZSByZWxhdGVkIGNvZGUgc2hvdWxkIGRlY2lkZS4NCg0KDQpKdWVyZ2Vu
DQo=
--------------kBW3ES9X6zMf9BY0avKI05x0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------kBW3ES9X6zMf9BY0avKI05x0--

--------------RuZXevF4PVlAU0fNrsMwEkmr--

--------------sQkrZ96pLJlrKFp0xUORJY6D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMF8YMFAwAAAAAACgkQsN6d1ii/Ey+o
3ggAhIGxxItPgxfkOjp9rOXCAO1DXWPM0/NyeHEXL6mdldbnORA/Z3Dd4IwXS6JbyKEkYeWbNEMk
PUOgzdRw0lIwOvNAxr4tW+7rJWVEwcSW/m6nAskvFCTtUTvTroA1XIECx8Ob7SRZl1uimMWYtU4A
j02bfSJz32IWFs9etO/jgtwj37fqxwRzszSJTbMJ7kkH86GjMK9JEgRp71GjFcVlWUpGFEflN9Fn
tPn5qu65qDx8H1Ry5jcLeFbz1ysyTebEcq3j2xH5J2TZ2isLMsPUzOfohSZb7pxRChh3aY2n/F/P
cPzMakquU67Wkp61X1e9BIx1RW6bTMqQ0ekV3pCVTg==
=6jZF
-----END PGP SIGNATURE-----

--------------sQkrZ96pLJlrKFp0xUORJY6D--


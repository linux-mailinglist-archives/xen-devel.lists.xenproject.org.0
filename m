Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301C4B69AF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273005.468038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvNh-0003mu-Ox; Tue, 15 Feb 2022 10:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273005.468038; Tue, 15 Feb 2022 10:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvNh-0003jr-KQ; Tue, 15 Feb 2022 10:48:25 +0000
Received: by outflank-mailman (input) for mailman id 273005;
 Tue, 15 Feb 2022 10:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=az2O=S6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nJvNg-0003jl-51
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:48:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb9ce62b-8e4c-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 11:48:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5ACE71F38A;
 Tue, 15 Feb 2022 10:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E82C813C51;
 Tue, 15 Feb 2022 10:48:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jm+JNvWEC2KAKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Feb 2022 10:48:21 +0000
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
X-Inumbo-ID: cb9ce62b-8e4c-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644922102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuvSLSxwbmb5A6tlfi9Q8ctChVdW6o0Yygd+0MI1wis=;
	b=SSLfzZ9YeZ3R3p8U7V5NkhNupHaJLItsDqpAtOeLYHauXrxnH65QpIgZ4i61yai1eu1UD5
	WDz/KC30pspAL/ryGSGxGRnnLmwl1P04oug77+/nWT8gCg4e3/eKXDZlumyUCsO75ffhkC
	GvJ0aWpcIl09J0LToUFLNX4+/RUIgvI=
Message-ID: <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
Date: Tue, 15 Feb 2022 11:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220215101551.23101-5-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IH1xSgiRHrgOw810U9nQXYMh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IH1xSgiRHrgOw810U9nQXYMh
Content-Type: multipart/mixed; boundary="------------F2Md6mPTv1jnNv9QytnN2Bf6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
In-Reply-To: <20220215101551.23101-5-luca.fancellu@arm.com>

--------------F2Md6mPTv1jnNv9QytnN2Bf6
Content-Type: multipart/mixed; boundary="------------gycSYTcWkOrVZhXQy1o5Sqoe"

--------------gycSYTcWkOrVZhXQy1o5Sqoe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTE6MTUsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEludHJvZHVjZSBh
biBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgd2F5IHRvIGNyZWF0ZSBkaWZmZXJlbnQgY3B1cG9v
bHMNCj4gYXQgYm9vdCB0aW1lLCB0aGlzIGlzIHBhcnRpY3VsYXJseSB1c2VmdWwgb24gQVJN
IGJpZy5MSVRUTEUgc3lzdGVtDQo+IHdoZXJlIHRoZXJlIG1pZ2h0IGJlIHRoZSBuZWVkIHRv
IGhhdmUgZGlmZmVyZW50IGNwdXBvb2xzIGZvciBlYWNoIHR5cGUNCj4gb2YgY29yZSwgYnV0
IGFsc28gc3lzdGVtcyB1c2luZyBOVU1BIGNhbiBoYXZlIGRpZmZlcmVudCBjcHUgcG9vbHMg
Zm9yDQo+IGVhY2ggbm9kZS4NCj4gDQo+IFRoZSBmZWF0dXJlIG9uIGFybSByZWxpZXMgb24g
YSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBjcHVwb29scyBmcm9tIHRoZQ0KPiBkZXZpY2UgdHJl
ZSB0byBidWlsZCBwb29scyBhbmQgYXNzaWduIGNwdXMgdG8gdGhlbS4NCj4gDQo+IERvY3Vt
ZW50YXRpb24gaXMgY3JlYXRlZCB0byBleHBsYWluIHRoZSBmZWF0dXJlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpJ
SVJDIEkgc3VnZ2VzdGVkIHRvIGhhdmUgdGhlIGNvcmUgZnVuY3Rpb25hbGl0eSBpbiBjb21t
b24gY29kZSBpbiBvcmRlcg0KdG8gYWxsb3cgdXNpbmcgYm9vdCB0aW1lIGNwdXBvb2wgY3Jl
YXRpb24gZS5nLiB2aWEgY29tbWFuZGxpbmUgZm9yIHg4NiwNCnRvby4NCg0KDQpKdWVyZ2Vu
DQo=
--------------gycSYTcWkOrVZhXQy1o5Sqoe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gycSYTcWkOrVZhXQy1o5Sqoe--

--------------F2Md6mPTv1jnNv9QytnN2Bf6--

--------------IH1xSgiRHrgOw810U9nQXYMh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmILhPUFAwAAAAAACgkQsN6d1ii/Ey85
7wgAlWjfkno+W1GlGSLhlpfi433RqQYOTngZk01HkvI1L8H/ZTzpofqXQvGBwfi5JnH6hxHNzmmi
ZYlAdcLdf/7UMDoYBxXo/2UP2OQVf4ikjw9xD7F8TkFc1zGfCmh2AZZmhOGywjxjQ0HzMSrnTWF4
f8CfoSz8I0LuyINpB+g5Hl9MJrN1+ydDB+iGYqTUQY1w0icNv5I/tNL5D2hpzxsD+4O2xgpPr/ur
y9nUUqTN7ZgKrQkMduISWo5KEFdNwGZJddmPQF416Du0SyPTBb4tHbCoQkgUGy7rgjSrZitiMuKQ
VRSaxfBijUmI0lXEeFJggPOw9kQ7cd5fhG7y1Gs1Gw==
=boQB
-----END PGP SIGNATURE-----

--------------IH1xSgiRHrgOw810U9nQXYMh--


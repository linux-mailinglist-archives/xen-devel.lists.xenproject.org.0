Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EB607543
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427575.676783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpUe-0008RT-KR; Fri, 21 Oct 2022 10:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427575.676783; Fri, 21 Oct 2022 10:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpUe-0008Or-Fk; Fri, 21 Oct 2022 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 427575;
 Fri, 21 Oct 2022 10:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olpUc-0008Ol-TC
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:43:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 276c5174-512d-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 12:43:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6AB771F8CA;
 Fri, 21 Oct 2022 10:43:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 163191331A;
 Fri, 21 Oct 2022 10:43:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4EkCBL13UmN4JAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Oct 2022 10:43:09 +0000
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
X-Inumbo-ID: 276c5174-512d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666348989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LzF3OBwfwloab9Lcfqr3ZlCK1ou/gF3cemkZ/4InwNI=;
	b=VvwzxUrHQFggLe6RzGhUv5YnJYOxRsCWTcRpyhILH3mRIYNiemiSFhfFWLQdnrufhYGKnR
	Zfx49CsHwebDZ1/gvYfzqb/eR7MJreogF2FDjyUlquJ1Dla9RkgrYCdQPVCW+7FLRn3gGZ
	3PneqyZlrSCKocm/FpmMcuUTd7kBXkk=
Message-ID: <0d80d3e3-11ec-22b4-cfc2-a315a9186f67@suse.com>
Date: Fri, 21 Oct 2022 12:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20221021065806.14316-1-jgross@suse.com>
 <2b767003-487a-d463-3a74-92d834fc8e11@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2b767003-487a-d463-3a74-92d834fc8e11@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ilnUQI7pNegR0xZs4M2FNX3m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ilnUQI7pNegR0xZs4M2FNX3m
Content-Type: multipart/mixed; boundary="------------KjJKFiKXCjJ8uY5d6TfPZypm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <0d80d3e3-11ec-22b4-cfc2-a315a9186f67@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: fix restore_vcpu_affinity() by
 removing it
References: <20221021065806.14316-1-jgross@suse.com>
 <2b767003-487a-d463-3a74-92d834fc8e11@suse.com>
In-Reply-To: <2b767003-487a-d463-3a74-92d834fc8e11@suse.com>

--------------KjJKFiKXCjJ8uY5d6TfPZypm
Content-Type: multipart/mixed; boundary="------------jXU0xbZSfm0tFGHl5LwuPOPr"

--------------jXU0xbZSfm0tFGHl5LwuPOPr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTAuMjIgMTI6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4xMC4yMDIy
IDA4OjU4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtMTE5
Niw3NiArMTE5Niw2IEBAIHN0YXRpYyB2b2lkIHNjaGVkX3Jlc2V0X2FmZmluaXR5X2Jyb2tl
bihjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkNCj4+ICAgICAgICAgICB2LT5hZmZp
bml0eV9icm9rZW4gPSBmYWxzZTsNCj4+ICAgfQ0KPiANCj4gTXkgcHJlLXB1c2ggYnVpbGQg
dGVzdCBmYWlsZWQgYmVjYXVzZSB0aGUgZnVuY3Rpb24gYWJvdmUgLi4uDQo+IA0KPj4gLXZv
aWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpDQo+PiAtew0KPj4g
LSAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOw0KPj4gLSAgICBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsNCj4+IC0NCj4+IC0gICAgQVNTRVJUKHN5c3RlbV9z
dGF0ZSA9PSBTWVNfU1RBVEVfcmVzdW1lKTsNCj4+IC0NCj4+IC0gICAgcmN1X3JlYWRfbG9j
aygmc2NoZWRfcmVzX3JjdWxvY2spOw0KPj4gLQ0KPj4gLSAgICBmb3JfZWFjaF9zY2hlZF91
bml0ICggZCwgdW5pdCApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIHNwaW5sb2NrX3QgKmxv
Y2s7DQo+PiAtICAgICAgICB1bnNpZ25lZCBpbnQgb2xkX2NwdSA9IHNjaGVkX3VuaXRfbWFz
dGVyKHVuaXQpOw0KPj4gLSAgICAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpyZXM7DQo+
PiAtDQo+PiAtICAgICAgICBBU1NFUlQoIXVuaXRfcnVubmFibGUodW5pdCkpOw0KPj4gLQ0K
Pj4gLSAgICAgICAgLyoNCj4+IC0gICAgICAgICAqIFJlLWFzc2lnbiB0aGUgaW5pdGlhbCBw
cm9jZXNzb3IgYXMgYWZ0ZXIgcmVzdW1lIHdlIGhhdmUgbm8NCj4+IC0gICAgICAgICAqIGd1
YXJhbnRlZSB0aGUgb2xkIHByb2Nlc3NvciBoYXMgY29tZSBiYWNrIHRvIGxpZmUgYWdhaW4u
DQo+PiAtICAgICAgICAgKg0KPj4gLSAgICAgICAgICogVGhlcmVmb3JlLCBoZXJlLCBiZWZv
cmUgYWN0dWFsbHkgdW5wYXVzaW5nIHRoZSBkb21haW5zLCB3ZSBzaG91bGQNCj4+IC0gICAg
ICAgICAqIHNldCB2LT5wcm9jZXNzb3Igb2YgZWFjaCBvZiB0aGVpciB2Q1BVcyB0byBzb21l
dGhpbmcgdGhhdCB3aWxsDQo+PiAtICAgICAgICAgKiBtYWtlIHNlbnNlIGZvciB0aGUgc2No
ZWR1bGVyIG9mIHRoZSBjcHVwb29sIGluIHdoaWNoIHRoZXkgYXJlIGluLg0KPj4gLSAgICAg
ICAgICovDQo+PiAtICAgICAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0
KTsNCj4+IC0NCj4+IC0gICAgICAgIGNwdW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9jcHUo
Y3B1KSwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHksDQo+PiAtICAgICAgICAgICAgICAgICAg
ICBjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhkKSk7DQo+PiAtICAgICAgICBpZiAo
IGNwdW1hc2tfZW1wdHkoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpKSApDQo+PiAtICAgICAg
ICB7DQo+PiAtICAgICAgICAgICAgaWYgKCBzY2hlZF9jaGVja19hZmZpbml0eV9icm9rZW4o
dW5pdCkgKQ0KPj4gLSAgICAgICAgICAgIHsNCj4+IC0gICAgICAgICAgICAgICAgc2NoZWRf
c2V0X2FmZmluaXR5KHVuaXQsIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5X3NhdmVkLCBOVUxM
KTsNCj4+IC0gICAgICAgICAgICAgICAgc2NoZWRfcmVzZXRfYWZmaW5pdHlfYnJva2VuKHVu
aXQpOw0KPiANCj4gLi4uIGhhcyBpdHMgb25seSB1c2UgcmVtb3ZlZCBoZXJlLiBJdCBkaWRu
J3Qgc2VlbSBhcHByb3ByaWF0ZSBmb3IgbWUgdG8NCj4gZ28gYW5kIHNpbGVudGx5IHJlbW92
ZSB0aGF0IGZ1bmN0aW9uIGFzIHdlbGwuDQoNCldlaXJkIEkgZGlkbid0IHNwb3QgdGhhdC4N
Cg0KSSdsbCB1cGRhdGUgdGhlIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg0K
--------------jXU0xbZSfm0tFGHl5LwuPOPr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------jXU0xbZSfm0tFGHl5LwuPOPr--

--------------KjJKFiKXCjJ8uY5d6TfPZypm--

--------------ilnUQI7pNegR0xZs4M2FNX3m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNSd7wFAwAAAAAACgkQsN6d1ii/Ey8P
HwgAgDW8hrpErkceD1RaXGhqQ+lt2BLDfudGgVsKGXt0U4xBf+xR6zthjBkEiCmYmKP/HVucw3Dp
dkOOe4xOrTyUezyVUygi19nXTZudJ6cPZEg0w+yQNNDULdO5MTX9dptiRFKo2oa2Nr4P5J/mT1fM
3MKNjQj7cVgq+tTnUWNE+6DgOXPdG9O/U/+AwwInaMjQ0FSiXaFHgJV3g3QJejyKnav8hugnlNB/
1Lndlk1evyq5SeF9QVjay+Y4AhhhCa5rID/o1dcBvPy1ZZ2BqJ3HEf5Mob5Mfc53HNyKuEj7WUAO
3djOzC2QfpPvZyzZMxBPR3Ue6d0Ly79v8XeC/L4jaQ==
=efAo
-----END PGP SIGNATURE-----

--------------ilnUQI7pNegR0xZs4M2FNX3m--


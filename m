Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A464A82C6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 11:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264616.457768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZm5-0000Sw-2C; Thu, 03 Feb 2022 10:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264616.457768; Thu, 03 Feb 2022 10:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZm4-0000Qe-VS; Thu, 03 Feb 2022 10:55:36 +0000
Received: by outflank-mailman (input) for mailman id 264616;
 Thu, 03 Feb 2022 10:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nHU3=SS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nFZm3-0000QY-8x
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 10:55:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf8a549f-84df-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 11:55:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 549C11F440;
 Thu,  3 Feb 2022 10:55:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DF5A13BAC;
 Thu,  3 Feb 2022 10:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dCfuBaW0+2FoZgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Feb 2022 10:55:33 +0000
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
X-Inumbo-ID: cf8a549f-84df-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643885733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N/TMokAea3A/PETWtYhknx9ccrHFTYWQUwOmRVJPOxY=;
	b=mdNyYRSrms7wQueLuj+j1GxmgGBCXi0fVTbEOIgV2FOKm/f0s74zBmna439yx5Z89Quo4B
	yKfMVakM+pc6r0kt7nMRRsFEePcO4hH7jxrRx8WBypW/Ny1ufulafWrkplGUEQfw1JucbS
	fqNxCKa9fnZWKwxQtouyRevhL+KxOkg=
Message-ID: <93d0c738-df71-bfc2-445a-7b892884d8f3@suse.com>
Date: Thu, 3 Feb 2022 11:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] xen: add option to disable GNTTABOP_transfer
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201090239.32067-1-jgross@suse.com>
 <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------92dA1oy60qxRr6BoyEpVCJt2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------92dA1oy60qxRr6BoyEpVCJt2
Content-Type: multipart/mixed; boundary="------------Re08gcV5BadRwUXckh8Z7KzP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <93d0c738-df71-bfc2-445a-7b892884d8f3@suse.com>
Subject: Re: [PATCH] xen: add option to disable GNTTABOP_transfer
References: <20220201090239.32067-1-jgross@suse.com>
 <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>
In-Reply-To: <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>

--------------Re08gcV5BadRwUXckh8Z7KzP
Content-Type: multipart/mixed; boundary="------------9Fobx7Ee2ZHGKKzd0aYZXm76"

--------------9Fobx7Ee2ZHGKKzd0aYZXm76
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDIuMjIgMTA6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wMi4yMDIy
IDEwOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGdyYW50IHRhYmxlIG9wZXJh
dGlvbiBHTlRUQUJPUF90cmFuc2ZlciBpcyBtZWFudCB0byBiZSB1c2VkIGluDQo+PiBQViBk
ZXZpY2UgYmFja2VuZHMsIGFuZCBpdCBoYXNuJ3QgYmVlbiB1c2VkIGluIExpbnV4IHNpbmNl
IHRoZSBvbGQNCj4+IFhlbi1vLUxpbnV4IGRheXMuDQo+IA0KPiBLaW5kIG9mIHVudXN1YWwg
c3BlbGxpbmcgb2YgWGVub0xpbnV4IDstKQ0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vZ3Jh
bnRfdGFibGUuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+PiBAQCAt
MTgxLDYgKzE4MSw3IEBAIHN0YXRpYyBpbnQgcGFyc2VfZ250dGFiX21heF9tYXB0cmFja19m
cmFtZXMoY29uc3QgY2hhciAqYXJnKQ0KPj4gICANCj4+ICAgdW5zaWduZWQgaW50IF9fcmVh
ZF9tb3N0bHkgb3B0X2dudHRhYl9tYXhfdmVyc2lvbiA9IEdOVFRBQl9NQVhfVkVSU0lPTjsN
Cj4+ICAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfdHJhbnNpdGl2ZV9ncmFudHMg
PSB0cnVlOw0KPj4gK3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0X2dyYW50X3RyYW5z
ZmVyID0gdHJ1ZTsNCj4gDQo+IElmIHRoaXMgd2FzIGNvbmRpdGlvbmFsIHVwb24gUFYgKHdp
dGggYSAjZGVmaW5lIHRvIGZhbHNlIGluIHRoZQ0KPiBvcHBvc2l0ZSBjYXNlKSwgaXQgY291
bGQgYmUgX19yb19hZnRlcl9pbml0IHJpZ2h0IGF3YXksIHdoaWxlIGF0DQo+IHRoZSBzYW1l
IHRpbWUgYWxsb3dpbmcgdGhlIGNvbXBpbGVyIHRvIGVsaW1pbmF0ZSBnbnR0YWJfdHJhbnNm
ZXIoKS4NCg0KTmljZSBpZGVhLiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHB1dCBh
bGwgKG9yIG1vc3QpIG9mDQpnbnR0YWJfdHJhbnNmZXIoKSBpbiBhICIjaWZkZWYgQ09ORklH
X1BWIiBzZWN0aW9uLCBhbGxvd2luZyB0bw0KcmVtb3ZlIHRoZSAiI2lmZGVmIENPTkZJR19Y
ODYiIHBhcnRzIGluIGl0LCB0b28uDQoNCj4gDQo+PiBAQCAtMjA0LDYgKzIwNSw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IHBhcnNlX2dudHRhYihjb25zdCBjaGFyICpzKQ0KPj4gICAgICAg
ICAgIH0NCj4+ICAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInRy
YW5zaXRpdmUiLCBzLCBzcykpID49IDAgKQ0KPj4gICAgICAgICAgICAgICBvcHRfdHJhbnNp
dGl2ZV9ncmFudHMgPSB2YWw7DQo+PiArICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNl
X2Jvb2xlYW4oInRyYW5zZmVyIiwgcywgc3MpKSA+PSAwICkNCj4+ICsgICAgICAgICAgICBv
cHRfZ3JhbnRfdHJhbnNmZXIgPSB2YWw7DQo+PiAgICAgICAgICAgZWxzZQ0KPj4gICAgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7DQo+IA0KPiBUbyBwb3NzaWJseSBzYXZlIGEgZnVydGhl
ciByb3VuZHRyaXA6IElmIHRoZSBQViBkZXBlbmRlbmN5IHdhcyBhZGRlZA0KPiBhYm92ZSwg
SSdkIGxpa2UgdG8gYXNrIHRvIGZvbGxvdyB0aGUgbW9kZWwgb2YgcGFyc2VfaW9tbXVfcGFy
YW0oKQ0KPiBoZXJlIGFuZCB1c2UgIiNpZm5kZWYgb3B0X2dyYW50X3RyYW5zZmVyIiBhcm91
bmQgdGhlIGFkZGVkIGNvZGUgaW4NCj4gZmF2b3Igb2YgIiNpZmRlZiBDT05GSUdfUFYiLg0K
DQpPa2F5Lg0KDQo+IA0KPj4gQEAgLTIyMzMsNiArMjIzNiw5IEBAIGdudHRhYl90cmFuc2Zl
cigNCj4+ICAgICAgIHVuc2lnbmVkIGludCBtYXhfYml0c2l6ZTsNCj4+ICAgICAgIHN0cnVj
dCBhY3RpdmVfZ3JhbnRfZW50cnkgKmFjdDsNCj4+ICAgDQo+PiArICAgIGlmICggIW9wdF9n
cmFudF90cmFuc2ZlciApDQo+PiArICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4gDQo+IC1F
T1BOT1RTVVBQIHBsZWFzZS4NCg0KWWVzLCB0aGF0J3MgYmV0dGVyLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------9Fobx7Ee2ZHGKKzd0aYZXm76
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9Fobx7Ee2ZHGKKzd0aYZXm76--

--------------Re08gcV5BadRwUXckh8Z7KzP--

--------------92dA1oy60qxRr6BoyEpVCJt2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmH7tKQFAwAAAAAACgkQsN6d1ii/Ey+3
jAgAkw9tzwrfNqTQDO9Sb3DV/SMsEWDhD4gc5daC+2sgIbMd27MmBdF9LWajvK2PTFY2aLIsC8ZK
bp70d6Yv0LT11PAq/EsYHOJdv8aizUcEG+oFDMz01W17Y82gemVqP/WOUdJLPaogdUmXxWK/iKg9
DVy1DVOv8Fw1NdVWY9gUwsPJpvcPQIMe5zopv3WZ2qfI5lLf1v1wXfO7qNDGqPJAm+l115rgCIjr
mRhD3c28yM1bP7H8VDFKgeKspCkuY+DACA8Agbl2JiUJ0htQoHa4a0GNEPV7vxmxVjcfLl3T9/mY
cx0ZvOX1dvskIENR3KG3RCbAvVp2ZK5fMeiiDwmCIw==
=0zHN
-----END PGP SIGNATURE-----

--------------92dA1oy60qxRr6BoyEpVCJt2--


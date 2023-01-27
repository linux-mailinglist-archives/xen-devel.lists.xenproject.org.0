Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12267DEB3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485342.752495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJWF-0003AG-Ed; Fri, 27 Jan 2023 07:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485342.752495; Fri, 27 Jan 2023 07:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJWF-000380-Bj; Fri, 27 Jan 2023 07:51:31 +0000
Received: by outflank-mailman (input) for mailman id 485342;
 Fri, 27 Jan 2023 07:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLJWD-00037u-T5
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:51:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67cb96ca-9e17-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 08:51:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBF2F21D83;
 Fri, 27 Jan 2023 07:51:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7C28138E3;
 Fri, 27 Jan 2023 07:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id twLSJn+C02OGaAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 07:51:27 +0000
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
X-Inumbo-ID: 67cb96ca-9e17-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674805887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=empbKyW0EVxAMyn8UGPwYPl8YjmloVGQm4Ju7WfuG7Q=;
	b=llHbutsG9cVNpVeRLsOdAb1oihQQQheT5EGnAk1shkJnehrM4c5F4Tm9pofALKe8Q1/dBD
	V5L2ORsNX0irf23SUDZha5kCi/OR7ULfuaNGHcB2j2NQmkIDPj+YJY+ZusDCrfllKP+QaS
	4+t+NCw1Yperym0IN6vFKvQXRCtjI6s=
Message-ID: <9ab4f70d-9aff-cfb2-edde-cb79b9834c03@suse.com>
Date: Fri, 27 Jan 2023 08:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230127055421.22945-1-jgross@suse.com>
 <9ea1c4b9-c02a-f189-f535-bf15d28f57ed@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <9ea1c4b9-c02a-f189-f535-bf15d28f57ed@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YjO6YdBSO2dQV0F6etaW132Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YjO6YdBSO2dQV0F6etaW132Z
Content-Type: multipart/mixed; boundary="------------Mdr0V0B27dqO9at8iOxQMbL6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <9ab4f70d-9aff-cfb2-edde-cb79b9834c03@suse.com>
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
References: <20230127055421.22945-1-jgross@suse.com>
 <9ea1c4b9-c02a-f189-f535-bf15d28f57ed@suse.com>
In-Reply-To: <9ea1c4b9-c02a-f189-f535-bf15d28f57ed@suse.com>

--------------Mdr0V0B27dqO9at8iOxQMbL6
Content-Type: multipart/mixed; boundary="------------QbR67bX0WLAdjGiT5MlQincT"

--------------QbR67bX0WLAdjGiT5MlQincT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDEuMjMgMDg6NDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wMS4yMDIz
IDA2OjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBsb2FkaW5nIGEgWGVuc3Rv
cmUgc3R1YmRvbSB0aGUgbG9hZGVyIGRvZXNuJ3Qga25vdyB3aGV0aGVyIHRoZQ0KPj4gbG8g
YmUgbG9hZGVkIGtlcm5lbCBpcyBhIFBWSCBvciBhIFBWIG9uZS4gU28gaXQgdHJpZXMgdG8g
bG9hZCBpdCBhcw0KPj4gYSBQVkggb25lIGZpcnN0LCBhbmQgaWYgdGhpcyBmYWlscyBpdCBp
cyBsb2FkaW5nIGl0IGFzIGEgUFYga2VybmVsLg0KPj4NCj4+IFRoaXMgcmVzdWx0cyBpbiBl
cnJvcnMgYmVpbmcgbG9nZ2VkIGluIGNhc2UgdGhlIHN0dWJkb20gaXMgYSBQViBrZXJuZWwu
DQo+Pg0KPj4gU3VwcHJlc3MgdGhvc2UgZXJyb3JzIGJ5IHNldHRpbmcgdGhlIG1pbmltdW0g
bG9nZ2luZyBsZXZlbCB0bw0KPj4gImNyaXRpY2FsIiB3aGlsZSB0cnlpbmcgdG8gbG9hZCB0
aGUga2VybmVsIGFzIFBWSC4NCj4+DQo+PiBGaXhlczogZjg5OTU1NDQ5YzVhICgidG9vbHMv
aW5pdC14ZW5zdG9yZS1kb21haW46IHN1cHBvcnQgeGVuc3RvcmUgcHZoIHN0dWJkb20iKQ0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4g
LS0tDQo+PiBWMjoNCj4+IC0gcmV0cnkgUFZIIGxvYWRpbmcgd2l0aCBsb2dnaW5nIGlmIFBW
IGZhaWxzLCB0b28gKEphbiBCZXVsaWNoKQ0KPiANCj4gSSdtIHNvcnJ5IHRvIGJlIHBpY2t5
LCBidXQgc2hvdWxkbid0IHRoaXMgYmUgcmVmbGVjdGVkIGluIHRoZSBkZXNjcmlwdGlvbj8N
Cg0KSSBjYW4gYWRkIHRoYXQsIGJ1dCBJIHRoaW5rIGxvb2tpbmcgYXQgdGhlIHBhdGNoIGl0
c2VsZiBpdCBpcyByYXRoZXINCmNsZWFyLCBlc3BlY2lhbGx5IHdpdGggdGhlIGFkZGVkIGNv
bW1lbnRzLg0KDQpJZiB5b3Ugc3RpbGwgdGhpbmsgaXQgc2hvdWxkIGJlIGFkZGVkLCBteSBz
dWdnZXN0aW9uIHdvdWxkIGJlOg0KDQogICBJbiBjYXNlIFBWSCBtb2RlIGFuZCBQViBtb2Rl
IGxvYWRpbmcgZmFpbHMsIHJldHJ5IFBWSCBtb2RlIGxvYWRpbmcNCiAgIHdpdGhvdXQgY2hh
bmdpbmcgdGhlIGxvZyBsZXZlbCBpbiBvcmRlciB0byBnZXQgdGhlIGVycm9yIG1lc3NhZ2Vz
DQogICBsb2dnZWQuDQoNCkkgY2FuIHJlc2VuZCwgaWYgeW91IHdhbnQgbWUgdG8sIG9yIEkn
ZCBiZSBmaW5lIHdpdGggYWJvdmUgYWRkaXRpb24NCmFkZGVkIHdoaWxlIGNvbW1pdHRpbmcg
KGlmIG5lZWRlZCkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------QbR67bX0WLAdjGiT5MlQincT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------QbR67bX0WLAdjGiT5MlQincT--

--------------Mdr0V0B27dqO9at8iOxQMbL6--

--------------YjO6YdBSO2dQV0F6etaW132Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPTgn8FAwAAAAAACgkQsN6d1ii/Ey+V
mwf+N3U6zdbveeQUA9s/sGaab2s3uWTTtsEB7DkJuMn0HvEk4E4pVd8aT/A3T4XrSR0XncXxcn3N
Sf2KuyNVLMhaHwdWaSbMzraHRxD6duLmTmHBqry4FE60PIc7Obngn58G41aidW2MigISzNOmmPGY
7dSI/obm/rq8kCAzeEWZbV3j1Jluf2OelTHiMjZfUjNmu+n1ZD/hHZnHCTQfeF3INhZn4gw68Wtg
KimqsiRO2WlW88eyxkuzCKkY4SvM4UVLi4U6xAlyi5g75642SbKzX18hfQBzgU8vV4waEQG9MbyR
barVmFQaUz83RI26p1JtDFUQm1fhiqzIFHq5aqDpgQ==
=oLqy
-----END PGP SIGNATURE-----

--------------YjO6YdBSO2dQV0F6etaW132Z--


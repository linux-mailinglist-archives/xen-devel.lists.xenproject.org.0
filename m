Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219456F4FAE
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 07:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528949.822750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu4oK-0000jc-UU; Wed, 03 May 2023 05:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528949.822750; Wed, 03 May 2023 05:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu4oK-0000ga-RT; Wed, 03 May 2023 05:13:52 +0000
Received: by outflank-mailman (input) for mailman id 528949;
 Wed, 03 May 2023 05:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pu4oJ-0000gU-7d
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 05:13:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4863da49-e971-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 07:13:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 433382220F;
 Wed,  3 May 2023 05:13:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18B661331F;
 Wed,  3 May 2023 05:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yzlhA4rtUWTuDAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 05:13:46 +0000
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
X-Inumbo-ID: 4863da49-e971-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683090826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWDROxnQcpwHJGfkAql2NTegOv3GyU+pkxSUG8g+SA=;
	b=pnNZhh5mhscbPVHU/wsicPKUkI9tXkqGFZyRghDH8ItD91k9k36az7kNVBMVWR6eTJ6J4K
	vHdrd91uaGWn5BQPHaAaWAZGNYrmWrkcGVHLlGlf9FR8PhU4Xln1j+vqAV130Th6TtICoQ
	oNKnVcY+NJKrp27X2nT+OFh05uQkVFA=
Message-ID: <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
Date: Wed, 3 May 2023 07:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
 <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VeQcZ8FdmnwJV4taqQPZtlrI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VeQcZ8FdmnwJV4taqQPZtlrI
Content-Type: multipart/mixed; boundary="------------nfpqoveNwzJbFL96YvSvSfM1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <887675ad-ef06-cf8c-8a32-5b3f726e2198@suse.com>
Subject: Re: [PATCH v4 05/13] tools/xenstore: use accounting buffering for
 node accounting
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-6-jgross@suse.com>
 <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>
In-Reply-To: <c3be0db1-ed47-967b-7f98-6f1569691fb6@xen.org>

--------------nfpqoveNwzJbFL96YvSvSfM1
Content-Type: multipart/mixed; boundary="------------N8VE7HNtmR9cgCw1BF6JdMag"

--------------N8VE7HNtmR9cgCw1BF6JdMag
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDUuMjMgMjA6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA1LzA0LzIwMjMgMDg6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgdGhlIG5vZGUgYWNjb3VudGluZyB0byB0aGUgYWNjb3VudGluZyBpbmZvcm1hdGlvbiBi
dWZmZXJpbmcgaW4NCj4+IG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byB1bmRvIGl0IGluIGNh
c2Ugb2YgZmFpbHVyZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmPCoMKgIHwgMjEgKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCB0b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmggfMKgIDQgKystLQ0KPj4gwqAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gaW5kZXggODQzMzVmNWYzZC4uOTJhNDBjY2YzZiAx
MDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+ICsr
KyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IEBAIC0xNDUyLDcgKzE0
NTIsNiBAQCBzdGF0aWMgdm9pZCBkZXN0cm95X25vZGVfcm0oc3RydWN0IGNvbm5lY3Rpb24g
KmNvbm4sIA0KPj4gc3RydWN0IG5vZGUgKm5vZGUpDQo+PiDCoCBzdGF0aWMgaW50IGRlc3Ry
b3lfbm9kZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgc3RydWN0IG5vZGUgKm5vZGUpDQo+
PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGRlc3Ryb3lfbm9kZV9ybShjb25uLCBub2RlKTsNCj4+
IC3CoMKgwqAgZG9tYWluX25iZW50cnlfZGVjKGNvbm4sIGdldF9ub2RlX293bmVyKG5vZGUp
KTsNCj4+IMKgwqDCoMKgwqAgLyoNCj4+IMKgwqDCoMKgwqDCoCAqIEl0IGlzIG5vdCBwb3Nz
aWJsZSB0byBlYXNpbHkgcmV2ZXJ0IHRoZSBjaGFuZ2VzIGluIGEgdHJhbnNhY3Rpb24uDQo+
PiBAQCAtMTc5NywyNyArMTc5NiwxMSBAQCBzdGF0aWMgaW50IGRvX3NldF9wZXJtcyhjb25z
dCB2b2lkICpjdHgsIHN0cnVjdCANCj4+IGNvbm5lY3Rpb24gKmNvbm4sDQo+PiDCoMKgwqDC
oMKgIG9sZF9wZXJtcyA9IG5vZGUtPnBlcm1zOw0KPj4gwqDCoMKgwqDCoCBkb21haW5fbmJl
bnRyeV9kZWMoY29ubiwgZ2V0X25vZGVfb3duZXIobm9kZSkpOw0KPiANCj4gSUlSQywgd2Ug
b3JpZ2luYWxseSBzYWlkIHRoYXQgZG9tYWluX25iZW50cnlfZGVjKCkgY291bGQgbmV2ZXIg
ZmFpbCBpbiBhIA0KPiBub24tdHJhbnNhY3Rpb24gY2FzZS4gQnV0IHdpdGggeW91ciBjdXJy
ZW50IHJld29yaywgdGhlIGZ1bmN0aW9uIGNhbiBub3cgZmFpbCANCj4gYmVjYXVzZSBvZiBh
biBhbGxvY2F0aW9uIGZhaWx1cmUuDQoNCkhvdyB3b3VsZCB0aGF0IGJlIHBvc3NpYmxlIHRv
IGhhcHBlbj8NCg0KZG9tYWluX25iZW50cnlfZGVjKCkgY2FuIG9ubHkgYmUgY2FsbGVkIGlm
IGEgbm9kZSBpcyBiZWluZyBvd25lZCBieSBhbiBhbHJlYWR5DQprbm93biBkb21haW4uIFNv
IGFsbG9jYXRpb24gaXMgaW1wb3NzaWJsZSB0byBoYXBwZW4sIGFzIHRoaXMgd291bGQgYmUg
YSBtYWpvcg0KZXJyb3IgaW4geGVuc3RvcmVkLg0KDQo+IFRoZXJlZm9yZSwgc2hvdWxkbid0
IHdlIG5vdyBjaGVjayB0aGUgZXJyb3I/IChQb3NzaWJseSBpbiBhIHBhdGNoIGJlZm9yZWhh
bmQpLg0KDQpJIGRvbid0IHRoaW5rIHNvLiBJIGNhbiBhZGQgYSBjb21tZW50IGlmIHlvdSB3
YW50Lg0KDQoNCkp1ZXJnZW4NCg==
--------------N8VE7HNtmR9cgCw1BF6JdMag
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------N8VE7HNtmR9cgCw1BF6JdMag--

--------------nfpqoveNwzJbFL96YvSvSfM1--

--------------VeQcZ8FdmnwJV4taqQPZtlrI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRR7YkFAwAAAAAACgkQsN6d1ii/Ey/O
7Qf7BulSDLguGvrfdji0yzCuDH9ISSVnqqtzcCMi3AZy9wmPBj113oiv2J7ZzwGyQ3VJBKb/kDk5
JM178hdWL1FiLNNtnac6ax5jiRg75E2665mu2LzoPoRz6Qdhxr5gEb8h+Bq2+1Smawdm4g0bt0rF
vbfNPmmRXF8xlGYIKNkgSXdgzKdXeFv9QrzZ7G1V/dq1e2o86r94MMFfN9czyXrMqjsh9mVM5HPb
TL4iD8ch8HMkon0oigu9IK+pEcfyfoqDe2zgctyvzbVS1bxX08ZEpzaYRzFGAjLHxJJRQ7Jw0CUQ
WH6QgH+ej9RJMLCzH+D1wUI1luasOklU29qNHGk/6Q==
=DZH8
-----END PGP SIGNATURE-----

--------------VeQcZ8FdmnwJV4taqQPZtlrI--


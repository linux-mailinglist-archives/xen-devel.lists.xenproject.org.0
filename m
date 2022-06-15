Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDA54CA27
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 15:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350134.576367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TMM-0007Sk-Ae; Wed, 15 Jun 2022 13:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350134.576367; Wed, 15 Jun 2022 13:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TMM-0007QW-72; Wed, 15 Jun 2022 13:47:02 +0000
Received: by outflank-mailman (input) for mailman id 350134;
 Wed, 15 Jun 2022 13:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o1TML-0007QQ-EO
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 13:47:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a14e994d-ecb1-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 15:47:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E105D21C44;
 Wed, 15 Jun 2022 13:46:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A890113A35;
 Wed, 15 Jun 2022 13:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VmCWJ9PiqWKiLAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Jun 2022 13:46:59 +0000
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
X-Inumbo-ID: a14e994d-ecb1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655300819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t8c6ISAdYWh/3XpBO9dSTJ2YoEerDJCxg3v6Cg36NWI=;
	b=ebBHbnYZMWGRp7C4ce9eYigmVRAlcjPIk/98LGdgKWQfvlsNZyq4CezBMmipkcMDDO5CgT
	p3yD8OzAhioZsuL+R09saUbA0FGzYil8/TgufQFqDDJ23uE6T8SBE1ULe6pDaZSuOVm2a9
	LDZDTV90P2TZOZe0xECHv56qnT+juCQ=
Message-ID: <0a1501fc-e03f-8a1d-76a1-c115606c6278@suse.com>
Date: Wed, 15 Jun 2022 15:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20220615084835.27113-1-jgross@suse.com>
 <YqnBZhiLOHnoalbC@infradead.org>
 <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
 <YqnCZ+EKZeZ5AEnr@infradead.org>
 <c5a521e0-26b1-b1d6-7f7d-00aa9b4b1e0e@suse.com>
 <YqnIWCXxsGzkfQp7@infradead.org>
 <ab0653bc-7728-e24c-5d83-78cee135528c@suse.com>
 <Yqnh7vjO8iT4/fiK@infradead.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yqnh7vjO8iT4/fiK@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ag0QxufSzrrpFlmYdFmtHaa1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ag0QxufSzrrpFlmYdFmtHaa1
Content-Type: multipart/mixed; boundary="------------0baxSOydh0hsGx0Put4W0HVi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <0a1501fc-e03f-8a1d-76a1-c115606c6278@suse.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
References: <20220615084835.27113-1-jgross@suse.com>
 <YqnBZhiLOHnoalbC@infradead.org>
 <9b9785f5-085b-0882-177f-d8418c366beb@suse.com>
 <YqnCZ+EKZeZ5AEnr@infradead.org>
 <c5a521e0-26b1-b1d6-7f7d-00aa9b4b1e0e@suse.com>
 <YqnIWCXxsGzkfQp7@infradead.org>
 <ab0653bc-7728-e24c-5d83-78cee135528c@suse.com>
 <Yqnh7vjO8iT4/fiK@infradead.org>
In-Reply-To: <Yqnh7vjO8iT4/fiK@infradead.org>

--------------0baxSOydh0hsGx0Put4W0HVi
Content-Type: multipart/mixed; boundary="------------yO30fh0Q0Jn02q3nM59fph43"

--------------yO30fh0Q0Jn02q3nM59fph43
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDYuMjIgMTU6NDMsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBPbiBXZWQs
IEp1biAxNSwgMjAyMiBhdCAwMjo1Mzo1NFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPj4gT24gMTUuMDYuMjIgMTM6NTQsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPj4+
IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDAxOjM5OjAxUE0gKzAyMDAsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE5vLCBpdCBkb2Vzbid0LiBJJ20gd29ya2luZyBvbiBhIHFlbXUg
cGF0Y2ggc2VyaWVzIGVuYWJsaW5nIHRoZSBxZW11DQo+Pj4+IGJhc2VkIGJhY2tlbmRzIHRv
IHN1cHBvcnQgZ3JhbnRzIHdpdGggdmlydGlvLiBUaGUgY29kZSBpcyB3b3JraW5nIGZpbmUN
Cj4+Pj4gb24geDg2LCB0b28gKGFwYXJ0IGZyb20gdGhlIGZhY3QgdGhhdCB0aGUgYmFja2Vu
ZHMgYXJlbid0IHJlYWR5IHlldCkuDQo+Pj4NCj4+PiBUaGUgY29kZSByaWdodCBub3cgaW4g
bWFpbmxpbmUgb25seSBldmVyIHNldHMgdGhlIG9wcyBmb3IgRE1BLiAgU28NCj4+PiBJIGNh
bid0IHNlZSBob3cgeW91IGNvdWxkIG1ha2UgaXQgd29yay4NCj4+DQo+PiBBaCwgeW91IGFy
ZSByaWdodC4gSSB3YXMgdXNpbmcgYSBndWVzdCB3aXRoIGFuIG9sZGVyIHZlcnNpb24gb2Yg
dGhlIHNlcmllcy4NCj4+IFNvcnJ5IGZvciB0aGUgbm9pc2UuDQo+IA0KPiBObyBwcm9ibGVt
LiAgQnV0IHdoYXRldmVyIHlvdSBlbmQgdXAgdXNpbmcgdG8gZW5hYmxlIHRoZSBncmFudCBE
TUENCj4gb3BzIG4geDg2IHNob3VsZCBhbHNvIHJlcXVpcmUgdGhlIHBsYXRmb3JtIGFjY2Vz
cyBmZWF0dXJlLiAgV2UgYWxyZWFkeQ0KPiBoYXZlIHRoYXQgaW5mb3JtYXRpb24gc28gd2Ug
Y2FuIG1ha2UgdXNlIG9mIGl0Lg0KDQpZZXMsIG9mIGNvdXJzZS4NCg0KDQpKdWVyZ2VuDQo=

--------------yO30fh0Q0Jn02q3nM59fph43
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yO30fh0Q0Jn02q3nM59fph43--

--------------0baxSOydh0hsGx0Put4W0HVi--

--------------ag0QxufSzrrpFlmYdFmtHaa1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKp4tMFAwAAAAAACgkQsN6d1ii/Ey9o
ZQf/bERS+itpRsVc5LubFWQpXz+QtHmp7xtjzZR9SBcdwrciAvH05Tjkabht1CobtWXS/qJwT6RP
GpMmfNa8JTdkNTTuDai4B4d5SNOEaDdOrI4rDPlFVBUU1zny2ZdAagAGZoNXJY34m2iw74y12BIL
42JHw3AnqXVAA/sgVMwYYGjQIccTDT2UUCqPDGL03662ZwGRV1YFPy0t4EebQx6QrrpWv4R3ixqg
3qMhwYlsH7S2BVs2yFDc8psGlPn5uBFsayJcuiL15OLvrmKoCn16mrbLhZpDkpQBYKuym31Iduo8
3olWAUdMp+Zn1Gc4vBKe5BP4Borm144RUhDNZURRrA==
=VSIN
-----END PGP SIGNATURE-----

--------------ag0QxufSzrrpFlmYdFmtHaa1--


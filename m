Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD175BD1E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 06:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566829.886209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMhSR-0006Tf-Ir; Fri, 21 Jul 2023 04:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566829.886209; Fri, 21 Jul 2023 04:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMhSR-0006Rj-Fi; Fri, 21 Jul 2023 04:09:35 +0000
Received: by outflank-mailman (input) for mailman id 566829;
 Fri, 21 Jul 2023 04:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfIn=DH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qMhSQ-0006Rd-L1
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 04:09:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b348a8-277c-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 06:09:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6A8821A87;
 Fri, 21 Jul 2023 04:09:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CC66134B0;
 Fri, 21 Jul 2023 04:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +uWcIPwEumTUWwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 21 Jul 2023 04:09:32 +0000
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
X-Inumbo-ID: 65b348a8-277c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689912572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+wb19BdGhpyh4/RvwwArZ9MDpw/UcwPy66NyncwESHE=;
	b=OaSkMorcXd3QrAMy8ehU4CyPPRW7f/gRvSxooMYno3UNaE/t5nrC/rOwRZ4L0DQ/qX41ls
	4OGSaCooFDakiv7hOKZTB7QTpMh0Mh5gSf0hMjfHTR+i4+KZ0CBK4gaJBfK8gJvA7DfckJ
	fC5W1wbFJZW5oWuYAYT2FkiIXMmoGxA=
Message-ID: <adeeeada-6f93-20d5-ef07-61a57d0de206@suse.com>
Date: Fri, 21 Jul 2023 06:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] tools/xenstore: fix get_spec_node()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230720150853.31368-1-jgross@suse.com>
 <d19a18c3-128b-2997-e22c-b2f2f6c46083@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <d19a18c3-128b-2997-e22c-b2f2f6c46083@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xunum8HqzHpo3zf30U1iVAZE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xunum8HqzHpo3zf30U1iVAZE
Content-Type: multipart/mixed; boundary="------------DDAv689UTkI0SewFEu6NhH4R";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <adeeeada-6f93-20d5-ef07-61a57d0de206@suse.com>
Subject: Re: [PATCH] tools/xenstore: fix get_spec_node()
References: <20230720150853.31368-1-jgross@suse.com>
 <d19a18c3-128b-2997-e22c-b2f2f6c46083@xen.org>
In-Reply-To: <d19a18c3-128b-2997-e22c-b2f2f6c46083@xen.org>

--------------DDAv689UTkI0SewFEu6NhH4R
Content-Type: multipart/mixed; boundary="------------S37SVvBaGV6wYoBV02vLBt6f"

--------------S37SVvBaGV6wYoBV02vLBt6f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDcuMjMgMDA6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIwLzA3LzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biBjYXNlIGdldF9zcGVjX25vZGUoKSBpcyBiZWluZyBjYWxsZWQgZm9yIGEgc3BlY2lhbCBu
b2RlIHN0YXJ0aW5nDQo+PiB3aXRoICdAJyBpdCB3b24ndCBzZXQgKmNhbm9uaWNhbF9uYW1l
LiBUaGlzIGNhbiByZXN1bHQgaW4gYSBjcmFzaCBvZg0KPj4geGVuc3RvcmVkIGR1ZSB0byBk
ZXJlZmVyZW5jaW5nIHRoZSB1bmluaXRpYWxpemVkIG5hbWUgaW4NCj4+IGZpcmVfd2F0Y2hl
cygpLg0KPj4NCj4+IFRoaXMgaXMgbm8gc2VjdXJpdHkgaXNzdWUgYXMgaXQgcmVxdWlyZXMg
ZWl0aGVyIGEgcHJpdmlsZWdlZCBjYWxsZXIgb3INCj4+IG93bmVyc2hpcCBvZiB0aGUgc3Bl
Y2lhbCBub2RlIGluIHF1ZXN0aW9uIGJ5IGFuIHVucHJpdmlsZWdlZCBjYWxsZXINCj4+ICh3
aGljaCBpcyBxdWVzdGlvbmFibGUsIGFzIHRoaXMgd291bGQgbWFrZSB0aGUgb3duZXIgcHJp
dmlsZWdlZCBpbiBzb21lDQo+PiB3YXkpLg0KPj4NCj4+IEZpeGVzOiBkNmJiNjM5MjRmYzIg
KCJ0b29scy94ZW5zdG9yZTogaW50cm9kdWNlIGR1bW15IG5vZGVzIGZvciBzcGVjaWFsIHdh
dGNoIA0KPj4gcGF0aHMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
Y29yZS5jIHwgNSArKysrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4g
aW5kZXggYTFkMzA0N2U0OC4uNzkwYzQwMzkwNCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMNCj4+IEBAIC0xMjUyLDggKzEyNTIsMTEgQEAgc3RhdGljIHN0cnVjdCBu
b2RlICpnZXRfc3BlY19ub2RlKHN0cnVjdCBjb25uZWN0aW9uIA0KPj4gKmNvbm4sIGNvbnN0
IHZvaWQgKmN0eCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IGNoYXIgKm5hbWUsIGNoYXIgKipjYW5vbmljYWxfbmFtZSwNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBwZXJtKQ0KPj4g
wqAgew0KPj4gLcKgwqDCoCBpZiAobmFtZVswXSA9PSAnQCcpDQo+PiArwqDCoMKgIGlmIChu
YW1lWzBdID09ICdAJykgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjYW5vbmljYWxfbmFt
ZSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpjYW5vbmljYWxfbmFtZSA9IChjaGFy
ICopbmFtZTsNCj4gDQo+IGV3dy4gTGV0J3Mgbm90IGNvbnRpbnVlIHRoZSBiYWQgcHJhY3Rp
Y2UgaW4gWGVuc3RvcmVkIHRvIGNhc3QgYXdheSB0aGUgY29uc3QuIEkgDQo+IHdpbGwgaGF2
ZSBhIGxvb2sgdG8gcmVtb3ZlIHRoZSBjb25zdCBhbmQgeW91IGNhbiByZWJhc2UgeW91ciBw
YXRjaCBvbiB0b3AuDQoNCkkgdGhpbmsgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIG1ha2Ug
Y2Fub25pY2FsX25hbWUgY29uc3QuIEknbGwgbG9vayBpbnRvIHRoYXQuDQoNCg0KSnVlcmdl
bg0KDQo=
--------------S37SVvBaGV6wYoBV02vLBt6f
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------S37SVvBaGV6wYoBV02vLBt6f--

--------------DDAv689UTkI0SewFEu6NhH4R--

--------------xunum8HqzHpo3zf30U1iVAZE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS6BPsFAwAAAAAACgkQsN6d1ii/Ey8D
9gf/ZpFig+LlV3iiyruPfWS//8RKJvJcdtCCgdRVQW6RItaeStbTjF+lIhsab+D/3tOFNmqLfsE6
f0tZNu8OpZV5JW/Cn/7Go2xvYl6piYsgP22tV1mnmpn0wOtFWQTQntT7LHeuE2eQltW1PR+spp1i
iQjaMFm+nZesqcu0hCpyEiaArSo5qDb+OoyMs0sBfMw1ScFQpW/dwLqSQvGvktSlObTZv6QM7DL2
sxXwwL3ePNg+MyEydbHi7YT0YnDD2sqIcSxd43+RKPt1uWt9ne4A5wrvBvk5nuTgNSyQEZfgnM4h
Opey+gK6td9Mv/fbZ0AYl01DjhrApusn6cukkk2kDQ==
=CrW7
-----END PGP SIGNATURE-----

--------------xunum8HqzHpo3zf30U1iVAZE--


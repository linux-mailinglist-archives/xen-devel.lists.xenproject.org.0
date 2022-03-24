Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A504E5F01
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 07:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294170.500029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXHQC-0006tH-Q7; Thu, 24 Mar 2022 06:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294170.500029; Thu, 24 Mar 2022 06:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXHQC-0006rM-MW; Thu, 24 Mar 2022 06:58:12 +0000
Received: by outflank-mailman (input) for mailman id 294170;
 Thu, 24 Mar 2022 06:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXHQA-0006rG-D5
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 06:58:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2cae806-ab3f-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 07:58:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B898A1F387;
 Thu, 24 Mar 2022 06:58:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8178513A67;
 Thu, 24 Mar 2022 06:58:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fkdyHX8WPGKPJQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 06:58:07 +0000
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
X-Inumbo-ID: c2cae806-ab3f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648105087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IOtMP5uh1AQ/43ENvyekAsIkZOBEZWniky/IrI/Qt4U=;
	b=unN19x/9mtEuQkQVR/8sHZ6F6iKFiUTwtYS2ac7OaJQIIXgunt23i3HXzcrX7/I/SAqnCX
	sCmBvBVJvAAJzPrA50yYyn2I5X4ese5mQuu7xxmRnU00rc5FUF5MG/vqNyx8fPVFaeHs82
	trdEfkuuSIh4dEIMg3z2YsTrP4PZrlY=
Message-ID: <2a289375-7dae-c829-dfb9-af39724e1e4c@suse.com>
Date: Thu, 24 Mar 2022 07:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 10/11] xen/arm: call hypercall handlers via generated
 macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-11-jgross@suse.com>
 <93bdb9e5-f054-704e-9302-3c2e17d92c60@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <93bdb9e5-f054-704e-9302-3c2e17d92c60@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mHtKh4A7paYyKPSS49lwAqZv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mHtKh4A7paYyKPSS49lwAqZv
Content-Type: multipart/mixed; boundary="------------fd1klvXh1EAjlDklVSuTwurU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
Message-ID: <2a289375-7dae-c829-dfb9-af39724e1e4c@suse.com>
Subject: Re: [PATCH v4 10/11] xen/arm: call hypercall handlers via generated
 macro
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-11-jgross@suse.com>
 <93bdb9e5-f054-704e-9302-3c2e17d92c60@xen.org>
In-Reply-To: <93bdb9e5-f054-704e-9302-3c2e17d92c60@xen.org>

--------------fd1klvXh1EAjlDklVSuTwurU
Content-Type: multipart/mixed; boundary="------------fGBgndfdTA3IUIxOu0s8vO1x"

--------------fGBgndfdTA3IUIxOu0s8vO1x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjIgMTA6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMC8wMy8yMDIyIDA3OjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTE1MjAs
NyArMTQ2MCwxMCBAQCBzdGF0aWMgYm9vbCBjaGVja19tdWx0aWNhbGxfMzJiaXRfY2xlYW4o
c3RydWN0IA0KPj4gbXVsdGljYWxsX2VudHJ5ICptdWx0aSkNCj4+IMKgIHsNCj4+IMKgwqDC
oMKgwqAgaW50IGk7DQo+PiAtwqDCoMKgIGZvciAoIGkgPSAwOyBpIDwgYXJtX2h5cGVyY2Fs
bF90YWJsZVttdWx0aS0+b3BdLm5yX2FyZ3M7IGkrKyApDQo+PiArwqDCoMKgIGlmICggbXVs
dGktPm9wID49IEFSUkFZX1NJWkUoaHlwZXJjYWxsX2FyZ3MpICkNCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gdHJ1ZTsNCj4gDQo+IE5JVDogVGhpcyBjaGFuZ2UgcmVhZHMgb2RkIHRv
IG1lLiBTbyBJIHdvdWxkIHByZWZlci4uLg0KPiANCj4+ICsNCj4+ICvCoMKgwqAgZm9yICgg
aSA9IDA7IGkgPCBoeXBlcmNhbGxfYXJnc1ttdWx0aS0+b3BdOyBpKysgKQ0KPj4gwqDCoMKg
wqDCoCB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCB1bmxpa2VseShtdWx0aS0+YXJn
c1tpXSAmIDB4ZmZmZmZmZmYwMDAwMDAwMFVMTCkgKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHsNCj4+IEBAIC0xNTM3LDI4ICsxNDgwLDEzIEBAIHN0YXRpYyBib29sIGNoZWNrX211bHRp
Y2FsbF8zMmJpdF9jbGVhbihzdHJ1Y3QgDQo+PiBtdWx0aWNhbGxfZW50cnkgKm11bHRpKQ0K
Pj4gwqAgZW51bSBtY19kaXNwb3NpdGlvbiBhcmNoX2RvX211bHRpY2FsbF9jYWxsKHN0cnVj
dCBtY19zdGF0ZSAqc3RhdGUpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBtdWx0
aWNhbGxfZW50cnkgKm11bHRpID0gJnN0YXRlLT5jYWxsOw0KPj4gLcKgwqDCoCBhcm1faHlw
ZXJjYWxsX2ZuX3QgY2FsbCA9IE5VTEw7DQo+PiAtDQo+PiAtwqDCoMKgIGlmICggbXVsdGkt
Pm9wID49IEFSUkFZX1NJWkUoYXJtX2h5cGVyY2FsbF90YWJsZSkgKQ0KPiANCj4gLi4uIGlm
IHdlIGtlZXAgdGhpcyBjaGVja3MuIFNvIHdlIGRvbid0IHJldHVybiB0cnVlIGluIA0KPiBj
aGVja19tdWx0aWNhbGxfMzJiaXRfY2xlYW4oKSB3aGVuIHRoZSBoeXBlcmNhbGwgZG9lc24n
dCBleGlzdC4NCg0KVGhlIGlkZWEgd2FzIHRvIHNwYXJlIHRoZSBub3QgbmVjZXNzYXJ5IGNo
ZWNrIGluIGNhc2Ugb2YgYSA2NC1iaXQgZ3Vlc3QuDQoNCklmIHlvdSBwcmVmZXIgdG8ga2Vl
cCB0aGUgY2hlY2sgaGVyZSwgSSdtIGZpbmUgdG8gZG8gaXQgdGhpcyB3YXkuDQoNCj4gDQo+
IFRoZSBjb2RlIHN0aWxsIGRvIHRoZSByaWdodCB0aGluZywgc28gZWl0aGVyIHdheToNCj4g
DQo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpU
aGFua3MsDQoNCg0KSnVlcmdlbg0KDQo=
--------------fGBgndfdTA3IUIxOu0s8vO1x
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------fGBgndfdTA3IUIxOu0s8vO1x--

--------------fd1klvXh1EAjlDklVSuTwurU--

--------------mHtKh4A7paYyKPSS49lwAqZv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI8Fn4FAwAAAAAACgkQsN6d1ii/Ey9d
8gf+NkgcnhOeJj32V4a+2LTatLhFE74kFnbfnWespsgurI6aXu3ldvPGiitKbWWZ2cCopmqsJ/+X
u+GLU9fMMAAahJPKg1w5F8+lXmfhOF25CW6DWhhHz5w3jds0kTRJlFkLYJermgpOWKxSYP/Uwgjy
gigABnlcKhnbDT74dGNMWAplm3nCEJrvDGzpxeTOq2hPitZE7Sto6JB5PVfWALR94NxOsEXKGNGC
am/M6gBY5OncG3bAKMd7d3x7vy+7RH+EUNbgqvx91CvpehgFAs16fscUMbNwr96vhqSay2in0NEw
DgetXjoYMwLPX0NWORKZp4iT/07QnIA/iW6SJD/c+g==
=eT8K
-----END PGP SIGNATURE-----

--------------mHtKh4A7paYyKPSS49lwAqZv--


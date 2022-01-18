Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90094928DB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258587.445507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9psY-00030A-Rv; Tue, 18 Jan 2022 14:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258587.445507; Tue, 18 Jan 2022 14:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9psY-0002x5-OB; Tue, 18 Jan 2022 14:54:34 +0000
Received: by outflank-mailman (input) for mailman id 258587;
 Tue, 18 Jan 2022 14:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdM9=SC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9psX-0002j7-N4
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:54:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b221ab9-786e-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:54:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AECD6218A9;
 Tue, 18 Jan 2022 14:54:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85A8B13AC3;
 Tue, 18 Jan 2022 14:54:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q41tH6fU5mGSTgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Jan 2022 14:54:31 +0000
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
X-Inumbo-ID: 8b221ab9-786e-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642517671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DkqqooiueTSRrpomD9t4NXqh0JZYEpWP21NNPgurwUs=;
	b=e44Z/zgurXoTc9BpiV6oVxkLyrC9HgmMQ2IWLuFuZ5NylFiBm0Qd1pKx4jlm5b6fgX4o6k
	kk6gSXOVaaLqSE6H8FkMSEIbuRy/rLhmvbnzhM9YT7sWDqE+XyKt+AUMjZpzFJSiz8fa6/
	66me5ff4bkJnhNGoubnJ8hQBLmfFFL8=
Message-ID: <7eb2b1da-310c-009e-e06c-fb10d950e517@suse.com>
Date: Tue, 18 Jan 2022 15:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [MINIOS PATCH v3 04/12] use alloc_file_type() and
 get_file_from_fd() in tpm_tis
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-5-jgross@suse.com>
 <fe8f11f6-fdcf-f99f-4767-8248c6f0c2cf@srcf.net>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <fe8f11f6-fdcf-f99f-4767-8248c6f0c2cf@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JmznQ2LzEbK0m5IKJmzCqAK6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JmznQ2LzEbK0m5IKJmzCqAK6
Content-Type: multipart/mixed; boundary="------------ZCqPjPVfbqxtsYwd02it6Tjf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <7eb2b1da-310c-009e-e06c-fb10d950e517@suse.com>
Subject: Re: [MINIOS PATCH v3 04/12] use alloc_file_type() and
 get_file_from_fd() in tpm_tis
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-5-jgross@suse.com>
 <fe8f11f6-fdcf-f99f-4767-8248c6f0c2cf@srcf.net>
In-Reply-To: <fe8f11f6-fdcf-f99f-4767-8248c6f0c2cf@srcf.net>

--------------ZCqPjPVfbqxtsYwd02it6Tjf
Content-Type: multipart/mixed; boundary="------------hkhEPsBsvqqIYS9Boh2Co5X8"

--------------hkhEPsBsvqqIYS9Boh2Co5X8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjIgMTU6MzIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE2LzAxLzIw
MjIgMDg6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdHBtX3Rp
cy5jIGIvdHBtX3Rpcy5jDQo+PiBpbmRleCA0NzdmNTU1MC4uYjg4ZWM4NzQgMTAwNjQ0DQo+
PiAtLS0gYS90cG1fdGlzLmMNCj4+ICsrKyBiL3RwbV90aXMuYw0KPj4gQEAgLTEwOTMsNiAr
MTA5NywyNiBAQCBzc2l6ZV90IHRwbV9nZXRjYXAoc3RydWN0IHRwbV9jaGlwICpjaGlwLCB1
aW50MzJfdCBzdWJjYXBfaWQsIGNhcF90ICpjYXAsDQo+PiAgICAgICAgICAgcmV0dXJuIHJj
Ow0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyB2b2lkIHNodXRkb3duX3RwbV90aXMoc3Ry
dWN0IHRwbV9jaGlwICp0cG0pDQo+PiArew0KPj4gKyAgICBpbnQgaTsNCj4+ICsNCj4+ICsg
ICAgcHJpbnRrKCJTaHV0dGluZyBkb3duIHRwbV90aXMgZGV2aWNlXG4iKTsNCj4+ICsNCj4+
ICsgICAgaW93cml0ZTMyKFRQTV9JTlRfRU5BQkxFKHRwbSwgdHBtLT5sb2NhbGl0eSksIH5U
UE1fR0xPQkFMX0lOVF9FTkFCTEUpOw0KPj4gKw0KPj4gKyAgICAvKiBVbm1hcCBhbGwgb2Yg
dGhlIG1taW8gcGFnZXMgKi8NCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCA1OyArK2kgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIHRwbS0+cGFnZXNbaV0gIT0gTlVMTCApDQo+
PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgaW91bm1hcCh0cG0tPnBhZ2VzW2ldLCBQ
QUdFX1NJWkUpOw0KPj4gKyAgICAgICAgICAgIHRwbS0+cGFnZXNbaV0gPSBOVUxMOw0KPj4g
KyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArICAgIGZyZWUodHBtKTsNCj4+ICsgICAgcmV0
dXJuOw0KPiANCj4gU2VlaW5nIGFzIHRoZSBmdW5jdGlvbiBpcyBtb3ZpbmcgYW55d2F5LCB0
aGlzIHNwdXJpb3VzIHJldHVybiBjYW4gZ28gdG9vLg0KDQpZZXMuDQoNCg0KSnVlcmdlbg0K
DQo=
--------------hkhEPsBsvqqIYS9Boh2Co5X8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------hkhEPsBsvqqIYS9Boh2Co5X8--

--------------ZCqPjPVfbqxtsYwd02it6Tjf--

--------------JmznQ2LzEbK0m5IKJmzCqAK6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHm1KcFAwAAAAAACgkQsN6d1ii/Ey+W
Ewf9ENFVlvSLJHbuYVboHNtdGuGvtq93TM1v7tkuXch0GuciRcjUylg9wW4OVdyIrJvV1Ch9ZwyZ
ZXT3GrWk2KEWLbH3xtdDp9G4/g+IPXQL1kH/BQRtUQ5G0yuCkjjainL3sGTzehfi+3rPLOhpn0vP
A0LE6RrwAMtCjN1joZz5bzjTJCaA5T8Iv8Y8ghOV3dW//6nEsvKohtSDcMsF0L8uVIl24dlIxMVf
o2/9O8HiAT2lSD6S6dhHtVFOerm/21sFEwmifEyrgeHEhM1d2jdjV7IPUMSc5zEyOZmijC1uhwPJ
jxXLZoD/cA4kg4WqKI9NtaBnbOGiOr5A2HbTYYDD9w==
=KFaX
-----END PGP SIGNATURE-----

--------------JmznQ2LzEbK0m5IKJmzCqAK6--


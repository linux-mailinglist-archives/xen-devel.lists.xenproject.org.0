Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5546F65B5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529578.824097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTOY-0008Kj-4w; Thu, 04 May 2023 07:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529578.824097; Thu, 04 May 2023 07:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTOY-0008Ha-2E; Thu, 04 May 2023 07:28:54 +0000
Received: by outflank-mailman (input) for mailman id 529578;
 Thu, 04 May 2023 07:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zFwM=AZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puTOW-0008HO-5M
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:28:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 502288e7-ea4d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:28:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D94E2093F;
 Thu,  4 May 2023 07:28:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26172133F7;
 Thu,  4 May 2023 07:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ljjEB7FeU2TREAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 May 2023 07:28:49 +0000
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
X-Inumbo-ID: 502288e7-ea4d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683185329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ay238mjQf1ceO3a0O/KbE61dVumd3XZZUy4XAGxOU7M=;
	b=WpRLtgl4xAFAqsK4cZW08WEZwX9+BFJ1rQaX4L28EDWJmsbGJJyNoPX46XCcNd7Ug7lqPr
	TXSLcYMkOHf7h9l5yOIGEdtI/bV9YCnZ2ei3b3unvvuyIf1KfA8Nsptf7iF3PcDuM8yaW+
	OoXCVklH1bO5qFeUjyLS5/2oClW4fBs=
Message-ID: <b97e5159-7419-625d-d1e8-fc00c553a9dc@suse.com>
Date: Thu, 4 May 2023 09:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 12/13] tools/xenstore: use generic accounting for
 remaining quotas
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-13-jgross@suse.com>
 <e4f8a0e6-7a4c-3193-ce38-e43891f063ed@xen.org>
 <da3b9daf-9358-2af8-edc3-4f74f9cc0c55@suse.com>
In-Reply-To: <da3b9daf-9358-2af8-edc3-4f74f9cc0c55@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------omy7s3TeOwCTo65ysfZS0svu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------omy7s3TeOwCTo65ysfZS0svu
Content-Type: multipart/mixed; boundary="------------krxl8VYciXw4aVNwHwjYgAy3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b97e5159-7419-625d-d1e8-fc00c553a9dc@suse.com>
Subject: Re: [PATCH v4 12/13] tools/xenstore: use generic accounting for
 remaining quotas
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-13-jgross@suse.com>
 <e4f8a0e6-7a4c-3193-ce38-e43891f063ed@xen.org>
 <da3b9daf-9358-2af8-edc3-4f74f9cc0c55@suse.com>
In-Reply-To: <da3b9daf-9358-2af8-edc3-4f74f9cc0c55@suse.com>

--------------krxl8VYciXw4aVNwHwjYgAy3
Content-Type: multipart/mixed; boundary="------------Al8MzfbhTp0V99nba1sGjqRy"

--------------Al8MzfbhTp0V99nba1sGjqRy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTY6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAzLjA1LjIz
IDEyOjE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAwNS8wNC8yMDIzIDA4OjAzLCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+ICtzdGF0aWMgdm9pZCBkb21haW5fYWNjX3ZhbGlk
X21heChzdHJ1Y3QgZG9tYWluICpkLCBlbnVtIGFjY2l0ZW0gd2hhdCwNCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHZhbCkNCj4+PiArew0K
Pj4+ICvCoMKgwqAgYXNzZXJ0KHdoYXQgPCBBUlJBWV9TSVpFKGQtPmFjYykpOw0KPj4+ICvC
oMKgwqAgYXNzZXJ0KHdoYXQgPCBBUlJBWV9TSVpFKGFjY19nbG9iYWxfbWF4KSk7DQo+Pj4g
Kw0KPj4+ICvCoMKgwqAgaWYgKHZhbCA+IGQtPmFjY1t3aGF0XS5tYXgpDQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGQtPmFjY1t3aGF0XS5tYXggPSB2YWw7DQo+Pj4gK8KgwqDCoCBpZiAodmFs
ID4gYWNjX2dsb2JhbF9tYXhbd2hhdF0gJiYgZG9taWRfaXNfdW5wcml2aWxlZ2VkKGQtPmRv
bWlkKSkNCj4+PiArwqDCoMKgwqDCoMKgwqAgYWNjX2dsb2JhbF9tYXhbd2hhdF0gPSB2YWw7
DQo+Pj4gK30NCj4+PiArDQo+Pj4gwqAgc3RhdGljIGludCBkb21haW5fYWNjX2FkZF92YWxp
ZChzdHJ1Y3QgZG9tYWluICpkLCBlbnVtIGFjY2l0ZW0gd2hhdCwgaW50IGFkZCkNCj4+PiDC
oCB7DQo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgdmFsOw0KPj4+IC3CoMKgwqAgYXNz
ZXJ0KHdoYXQgPCBBUlJBWV9TSVpFKGQtPmFjYykpOw0KPj4NCj4+IEkgdGhpbmsgdGhpcyBh
c3NlcnQgc2hvdWxkIGJlIGtlcHQgYmVjYXVzZS4uLg0KPj4NCj4+PiAtDQo+Pj4gwqDCoMKg
wqDCoCBpZiAoKGFkZCA8IDAgJiYgLWFkZCA+IGQtPmFjY1t3aGF0XS52YWwpIHx8DQo+Pg0K
Pj4gLi4uIG9mIHRoaXMgY2hlY2suIE90aGVyd2lzZSwgeW91IHdvdWxkIGNoZWNrIHRoYXQg
J3doYXQnIGlzIHdpdGhpbiB0aGUgYm91bmRzIA0KPj4gYWZ0ZXIgdGhlIHVzZS4NCj4gDQo+
IE9rYXkuDQoNCkhtbSwgSSdtIG5vIGxvbmdlciBzdXJlIHRoaXMgaXMgYSBnb29kIHJlYXNv
biB0byBkdXBsaWNhdGUgdGhlIGFzc2VydCgpLg0KDQpGb2xsb3dpbmcgdGhpcyByZWFzb25p
bmcgSSdkIG5lZWQgdG8gcHV0IGl0IGludG8gZXZlbiBtb3JlIGZ1bmN0aW9ucy4gQW5kIGFu
DQphc3NlcnQoKSB0cmlnZ2VyaW5nIGEgbGl0dGxlIGJpdCBsYXRlIGlzIG5vIHJlYWwgcHJv
YmxlbSwgYXMgaXQgd2lsbCBhYm9ydA0KeGVuc3RvcmVkIGFueXdheS4NCg0KQWRkaXRpb25h
bGx5IHdpdGggdGhlIGdsb2JhbCBhbmQgdGhlIHBlci1kb21haW4gYXJyYXlzIG5vdyBjb3Zl
cmluZyBhbGwNCnBvc3NpYmxlIHF1b3RhcywgaXQgd291bGQgZXZlbiBiZSByZWFzb25hYmxl
IHRvIGRyb3AgdGhlIGFzc2VydCgpcyBpbg0KZG9tYWluX2FjY192YWxpZF9tYXgoKSBjb21w
bGV0ZWx5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Al8MzfbhTp0V99nba1sGjqRy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Al8MzfbhTp0V99nba1sGjqRy--

--------------krxl8VYciXw4aVNwHwjYgAy3--

--------------omy7s3TeOwCTo65ysfZS0svu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRTXrAFAwAAAAAACgkQsN6d1ii/Ey/c
YAf+MbaXkDJigZEt8y6Sh5KvAOMsl3S4KOLaM4KZgsGjgMA5S5O/tMI3FV7z97sF8UzOZ0naj7UH
eBvjq+SCXbL4fXN4k812h3Nn2hSfEGugcsl9XWgBh+CFCUJS7Jf1KQ3wS1QF1/zgBjom/Kari62c
EMVQaJVp0S+9QNDGlT+19mZFocfPxQerlUTp5+xr0kf9VBeMrijEK6i86VOmKyFg2K6ZkzRMmKTg
KcDjmv8e8xgcU8QIZiwnftYZj7qE0wnFfuwf0hFFNnn+n7EhkM4bgUlMDxr22/3OpMmMRF1hGNFG
B27d5HJ8qQz43E6Ha+IKnRogYxEPS2uhVMHCXp0dKw==
=umYT
-----END PGP SIGNATURE-----

--------------omy7s3TeOwCTo65ysfZS0svu--


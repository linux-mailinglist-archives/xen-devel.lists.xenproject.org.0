Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12455BA82
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356807.585094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pm5-0001JZ-MK; Mon, 27 Jun 2022 14:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356807.585094; Mon, 27 Jun 2022 14:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pm5-0001H0-IU; Mon, 27 Jun 2022 14:31:37 +0000
Received: by outflank-mailman (input) for mailman id 356807;
 Mon, 27 Jun 2022 14:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5pm4-0001Gu-Fu
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 14:31:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6295788-f625-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 16:31:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4AA01F9FC;
 Mon, 27 Jun 2022 14:31:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD7D013456;
 Mon, 27 Jun 2022 14:31:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zJUYKUa/uWL9PAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 14:31:34 +0000
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
X-Inumbo-ID: d6295788-f625-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656340294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0717JwRJTN1P8VXJ8tnpmxFaGUDfHIV5/gpuWRh0kM=;
	b=VLz5jHtAGhX/FS20ycOWZOAPcUDHwR3zGMtV/xvlY8G1D6EkkCcBXyKA8tE/w1Z9uFzo67
	9gdrCg/8AZMrnEJHXKyZH880KfoZqmkJJPNBKmcI88yndcFdpR/FHYhD5Vo7h1KQkGBSKD
	Y4Es1/vmBsJfODLHJfikg6cjIu4dU6U=
Message-ID: <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
Date: Mon, 27 Jun 2022 16:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220627123635.3416-2-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v0BbcrXxybXE5lMIgIAU42u3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v0BbcrXxybXE5lMIgIAU42u3
Content-Type: multipart/mixed; boundary="------------SQJo3kdLaMyHTGbHpuLA106k";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
Message-ID: <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
In-Reply-To: <20220627123635.3416-2-julien@xen.org>

--------------SQJo3kdLaMyHTGbHpuLA106k
Content-Type: multipart/mixed; boundary="------------rPs4yjCoC15pFnFCTYDwYSxA"

--------------rPs4yjCoC15pFnFCTYDwYSxA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTQ6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IFNvbWUgdG9vbHMgKGUuZy4geGVu
c3RvcmVkKSBhbHdheXMgZXhwZWN0IEVJTlZBTCB0byBiZSBmaXJzdCBpbiB4c2RfZXJyb3Jz
Lg0KPiANCj4gRG9jdW1lbnQgaXQgc28sIG9uZSBkb2Vzbid0IGFkZCBhIG5ldyBlbnRyeSBi
ZWZvcmUgaGFuZCBieSBtaXN0YWtlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IC0tLS0NCj4gDQo+IEkgaGF2ZSB0cmll
ZCB0byBhZGQgYSBCVUlMRF9CVUdfT04oKSBidXQgR0NDIGNvbXBsYWluZWQgdGhhdCB0aGUg
dmFsdWUNCj4gd2FzIG5vdCBhIGNvbnN0YW50LiBJIGNvdWxkbid0IGZpZ3VyZSBvdXQgYSB3
YXkgdG8gbWFrZSBHQ0MgaGFwcHkuDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgICAgIC0g
TmV3IHBhdGNoDQo+IC0tLQ0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9pby94c193aXJlLmgg
fCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oIGIveGVuL2luY2x1ZGUv
cHVibGljL2lvL3hzX3dpcmUuaA0KPiBpbmRleCBjMWVjN2M3M2UzYjEuLmRkNGM5YzliOTcy
ZCAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3hzX3dpcmUuaA0KPiAr
KysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oDQo+IEBAIC03Niw2ICs3Niw3
IEBAIHN0YXRpYyBzdHJ1Y3QgeHNkX2Vycm9ycyB4c2RfZXJyb3JzW10NCj4gICBfX2F0dHJp
YnV0ZV9fKCh1bnVzZWQpKQ0KPiAgICNlbmRpZg0KPiAgICAgICA9IHsNCj4gKyAgICAvKiAv
IVwgU29tZSB1c2VycyAoZS5nLiB4ZW5zdG9yZWQpIGV4cGVjdCBFSU5WQUwgdG8gYmUgdGhl
IGZpcnN0IGVudHJ5LiAqLw0KPiAgICAgICBYU0RfRVJST1IoRUlOVkFMKSwNCj4gICAgICAg
WFNEX0VSUk9SKEVBQ0NFUyksDQo+ICAgICAgIFhTRF9FUlJPUihFRVhJU1QpLA0KDQpXaGF0
IGFib3V0IGFub3RoZXIgYXBwcm9hY2gsIGxpa2U6DQoNCi0tLSBhL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9jb3JlLmMNCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3Jl
LmMNCkBAIC03NDYsMTYgKzc0NiwxNyBAQCB1bnNpZ25lZCBpbnQgZ2V0X3N0cmluZ3Moc3Ry
dWN0IGJ1ZmZlcmVkX2RhdGEgKmRhdGEsDQogIHN0YXRpYyB2b2lkIHNlbmRfZXJyb3Ioc3Ry
dWN0IGNvbm5lY3Rpb24gKmNvbm4sIGludCBlcnJvcikNCiAgew0KICAgICAgICAgdW5zaWdu
ZWQgaW50IGk7DQorICAgICAgIGNoYXIgKmVyciA9IE5VTEw7DQoNCiAgICAgICAgIGZvciAo
aSA9IDA7IGVycm9yICE9IHhzZF9lcnJvcnNbaV0uZXJybnVtOyBpKyspIHsNCiAgICAgICAg
ICAgICAgICAgaWYgKGkgPT0gQVJSQVlfU0laRSh4c2RfZXJyb3JzKSAtIDEpIHsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICBlcHJpbnRmKCJ4ZW5zdG9yZWQ6IGVycm9yICVpIHVudHJh
bnNsYXRhYmxlIiwgZXJyb3IpOw0KLSAgICAgICAgICAgICAgICAgICAgICAgaSA9IDA7IC8q
IEVJTlZBTCAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gIkVJTlZBTCI7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQogICAgICAgICAgICAgICAgIH0NCiAg
ICAgICAgIH0NCi0gICAgICAgc2VuZF9yZXBseShjb25uLCBYU19FUlJPUiwgeHNkX2Vycm9y
c1tpXS5lcnJzdHJpbmcsDQotICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmxlbih4c2Rf
ZXJyb3JzW2ldLmVycnN0cmluZykgKyAxKTsNCisgICAgICAgZXJyID0gZXJyID8gOiB4c2Rf
ZXJyb3JzW2ldLmVycnN0cmluZzsNCisgICAgICAgc2VuZF9yZXBseShjb25uLCBYU19FUlJP
UiwgZXJyLCBzdHJsZW4oZXJyKSArIDEpOw0KICB9DQoNCiAgdm9pZCBzZW5kX3JlcGx5KHN0
cnVjdCBjb25uZWN0aW9uICpjb25uLCBlbnVtIHhzZF9zb2NrbXNnX3R5cGUgdHlwZSwNCg0K

--------------rPs4yjCoC15pFnFCTYDwYSxA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------rPs4yjCoC15pFnFCTYDwYSxA--

--------------SQJo3kdLaMyHTGbHpuLA106k--

--------------v0BbcrXxybXE5lMIgIAU42u3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5v0YFAwAAAAAACgkQsN6d1ii/Ey/V
ywf+IbgX0aCSOCAcAkqsqA7kwdsw57sSMzB1nEBmMKt3R7yu7HJVnWAAqbMYp7LM0l/sQr1erUAn
7HWXNXBOpYZzfL8rRALOorKf0419PxH+y6pllka/+IA1yYpZ0r0qbK35vgIz97vYxOT+sGdSV/TN
M7way2qamhkWIiyw/vbWxl79JFAlW9bSX89LAXEQ+t46s2lFnCrmhB1DUO3aedMIfcd6G/rHqS97
PYqyR/PntLAFWe3GeQoP4C4YMnZ/zcGJWjuoeORRbodfLaTqiYhV8XZQb/524FVLQnZEoNNdlmjT
PZf6Y4/wylGcN7LZHcmRrJdoF3G5Z3vOVurlhxGijQ==
=eNMj
-----END PGP SIGNATURE-----

--------------v0BbcrXxybXE5lMIgIAU42u3--


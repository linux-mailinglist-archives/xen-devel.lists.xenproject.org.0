Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54053569E90
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362841.593117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NpE-0008Iw-Hd; Thu, 07 Jul 2022 09:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362841.593117; Thu, 07 Jul 2022 09:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NpE-0008GM-EE; Thu, 07 Jul 2022 09:29:32 +0000
Received: by outflank-mailman (input) for mailman id 362841;
 Thu, 07 Jul 2022 09:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tn4w=XM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o9NpC-0008GG-SC
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:29:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d063d57-fdd7-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 11:29:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0677A1F97D;
 Thu,  7 Jul 2022 09:29:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA5AE13A33;
 Thu,  7 Jul 2022 09:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yq6lM3inxmLGFgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Jul 2022 09:29:28 +0000
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
X-Inumbo-ID: 4d063d57-fdd7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657186169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G1P8eRdGF/FuOqF2VxK31LjQw8VBl6xBhpvo5J3qD5I=;
	b=P96Kv92HBrLGV+Mmto+9Zz4I3bIirZoWl9vLP9cJy15a4FjT+TujiEuiSLzYru+Za9Byw/
	Fsesomp150WdTeGIQ9u43ECnp7iES0sGxcZYgORw+l5jNRsJLbs/ZZB3us4vcxqvj4fHY8
	n9qsJP6eenCObxVfAtYAwkcWdXTl2cE=
Message-ID: <2d2c8fcd-63ee-3977-54d4-0810c883c09e@suse.com>
Date: Thu, 7 Jul 2022 11:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220624092806.27700-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220624092806.27700-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YgskTndJnIkDiaEXLlMLeAZQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YgskTndJnIkDiaEXLlMLeAZQ
Content-Type: multipart/mixed; boundary="------------jmpeRE3sBZ7s2nwnIPqYegOc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <2d2c8fcd-63ee-3977-54d4-0810c883c09e@suse.com>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
References: <20220624092806.27700-1-jgross@suse.com>
In-Reply-To: <20220624092806.27700-1-jgross@suse.com>

--------------jmpeRE3sBZ7s2nwnIPqYegOc
Content-Type: multipart/mixed; boundary="------------bYDb6I97p9Fxgglo9FUtRzsB"

--------------bYDb6I97p9Fxgglo9FUtRzsB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMjQuMDYuMjIgMTE6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IElu
IGNhc2Ugb2YgbWF4bWVtICE9IG1lbXNpemUgdGhlIEU4MjAgbWFwIG9mIHRoZSBQVkggc3R1
YmRvbSBpcyB3cm9uZywNCj4gYXMgaXQgaXMgbWlzc2luZyB0aGUgUkFNIGFib3ZlIG1lbXNp
emUuDQo+IA0KPiBBZGRpdGlvbmFsbHkgdGhlIE1NSU8gYXJlYSBzaG91bGQgb25seSBjb3Zl
ciB0aGUgSFZNIHNwZWNpYWwgcGFnZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL2hlbHBlcnMvaW5p
dC14ZW5zdG9yZS1kb21haW4uYyB8IDE2ICsrKysrKysrKystLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgYi90b29scy9o
ZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4gaW5kZXggYjRmM2M2NWE4YS4uZGFk
OGU0M2M0MiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaGVscGVycy9pbml0LXhlbnN0b3JlLWRv
bWFpbi5jDQo+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYw0K
PiBAQCAtNzEsOCArNzEsOSBAQCBzdGF0aWMgaW50IGJ1aWxkKHhjX2ludGVyZmFjZSAqeGNo
KQ0KPiAgICAgICBjaGFyIGNtZGxpbmVbNTEyXTsNCj4gICAgICAgaW50IHJ2LCB4c19mZDsN
Cj4gICAgICAgc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tID0gTlVMTDsNCj4gLSAgICBpbnQg
bGltaXRfa2IgPSAobWF4bWVtID8gOiAobWVtb3J5ICsgMSkpICogMTAyNDsNCj4gKyAgICBp
bnQgbGltaXRfa2IgPSAobWF4bWVtID8gOiBtZW1vcnkpICogMTAyNCArIFg4Nl9IVk1fTlJf
U1BFQ0lBTF9QQUdFUyAqIDQ7DQo+ICAgICAgIHVpbnQ2NF90IG1lbV9zaXplID0gTUIobWVt
b3J5KTsNCj4gKyAgICB1aW50NjRfdCBtYXhfc2l6ZSA9IE1CKG1heG1lbSk7DQo+ICAgICAg
IHN0cnVjdCBlODIwZW50cnkgZTgyMFszXTsNCj4gICAgICAgc3RydWN0IHhlbl9kb21jdGxf
Y3JlYXRlZG9tYWluIGNvbmZpZyA9IHsNCj4gICAgICAgICAgIC5zc2lkcmVmID0gU0VDSU5J
VFNJRF9ET01VLA0KPiBAQCAtMTU3LDIxICsxNTgsMjQgQEAgc3RhdGljIGludCBidWlsZCh4
Y19pbnRlcmZhY2UgKnhjaCkNCj4gICAgICAgICAgIGNvbmZpZy5mbGFncyB8PSBYRU5fRE9N
Q1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NERl9oYXA7DQo+ICAgICAgICAgICBjb25maWcu
YXJjaC5lbXVsYXRpb25fZmxhZ3MgPSBYRU5fWDg2X0VNVV9MQVBJQzsNCj4gICAgICAgICAg
IGRvbS0+dGFyZ2V0X3BhZ2VzID0gbWVtX3NpemUgPj4gWENfUEFHRV9TSElGVDsNCj4gLSAg
ICAgICAgZG9tLT5tbWlvX3NpemUgPSBHQig0KSAtIExBUElDX0JBU0VfQUREUkVTUzsNCj4g
KyAgICAgICAgZG9tLT5tbWlvX3NpemUgPSBYODZfSFZNX05SX1NQRUNJQUxfUEFHRVMgPDwg
WENfUEFHRV9TSElGVDsNCj4gICAgICAgICAgIGRvbS0+bG93bWVtX2VuZCA9IChtZW1fc2l6
ZSA+IExBUElDX0JBU0VfQUREUkVTUykgPw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTEFQSUNfQkFTRV9BRERSRVNTIDogbWVtX3NpemU7DQo+ICAgICAgICAgICBkb20tPmhp
Z2htZW1fZW5kID0gKG1lbV9zaXplID4gTEFQSUNfQkFTRV9BRERSRVNTKSA/DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgR0IoNCkgKyBtZW1fc2l6ZSAtIExBUElDX0JBU0Vf
QUREUkVTUyA6IDA7DQo+IC0gICAgICAgIGRvbS0+bW1pb19zdGFydCA9IExBUElDX0JBU0Vf
QUREUkVTUzsNCj4gKyAgICAgICAgZG9tLT5tbWlvX3N0YXJ0ID0gKFg4Nl9IVk1fRU5EX1NQ
RUNJQUxfUkVHSU9OIC0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9IVk1f
TlJfU1BFQ0lBTF9QQUdFUykgPDwgWENfUEFHRV9TSElGVDsNCj4gICAgICAgICAgIGRvbS0+
bWF4X3ZjcHVzID0gMTsNCj4gICAgICAgICAgIGU4MjBbMF0uYWRkciA9IDA7DQo+IC0gICAg
ICAgIGU4MjBbMF0uc2l6ZSA9IGRvbS0+bG93bWVtX2VuZDsNCj4gKyAgICAgICAgZTgyMFsw
XS5zaXplID0gKG1heF9zaXplID4gTEFQSUNfQkFTRV9BRERSRVNTKSA/DQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIExBUElDX0JBU0VfQUREUkVTUyA6IG1heF9zaXplOw0KPiAgICAg
ICAgICAgZTgyMFswXS50eXBlID0gRTgyMF9SQU07DQo+IC0gICAgICAgIGU4MjBbMV0uYWRk
ciA9IExBUElDX0JBU0VfQUREUkVTUzsNCj4gKyAgICAgICAgZTgyMFsxXS5hZGRyID0gZG9t
LT5tbWlvX3N0YXJ0Ow0KPiAgICAgICAgICAgZTgyMFsxXS5zaXplID0gZG9tLT5tbWlvX3Np
emU7DQo+ICAgICAgICAgICBlODIwWzFdLnR5cGUgPSBFODIwX1JFU0VSVkVEOw0KPiAgICAg
ICAgICAgZTgyMFsyXS5hZGRyID0gR0IoNCk7DQo+IC0gICAgICAgIGU4MjBbMl0uc2l6ZSA9
IGRvbS0+aGlnaG1lbV9lbmQgLSBHQig0KTsNCj4gKyAgICAgICAgZTgyMFsyXS5zaXplID0g
KG1heF9zaXplID4gTEFQSUNfQkFTRV9BRERSRVNTKSA/DQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIG1heF9zaXplIC0gTEFQSUNfQkFTRV9BRERSRVNTIDogMDsNCj4gICAgICAgICAg
IGU4MjBbMl0udHlwZSA9IEU4MjBfUkFNOw0KPiAgICAgICB9DQo+ICAgDQoNCg==
--------------bYDb6I97p9Fxgglo9FUtRzsB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------bYDb6I97p9Fxgglo9FUtRzsB--

--------------jmpeRE3sBZ7s2nwnIPqYegOc--

--------------YgskTndJnIkDiaEXLlMLeAZQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLGp3gFAwAAAAAACgkQsN6d1ii/Ey+H
jwgAjLflYjVm5G6JJNHFG910HBKPfTstQFxVdR5kPs+pW6dWypqJtaTOxzE3glCJ3hjR5Z98o3kA
MhjRcwi1eCo7Yfx1W2W7oLKGt2VmjgysEX5IADKiHkOncU3xPo4TkPsIhqmOAYyQaVqdhnGikSJB
QQQdAbbNT61vJYwUQthP/Tnh2fGcHq4eXe0hW/Rc8AlLdanX55g29gyh8CZkS5l3MdfUAyA7kcVC
8t4cRSPIO6TyhoMKO1qIdAIaT2OTnIpvEI4RspXU+pxpQEtJdxp2thYLgzk0vW09n/dq1SJ1pvwq
K/dPO4xDLiuVjMIt2I8G3maxzMackaP4wjngUDPqig==
=9lAD
-----END PGP SIGNATURE-----

--------------YgskTndJnIkDiaEXLlMLeAZQ--


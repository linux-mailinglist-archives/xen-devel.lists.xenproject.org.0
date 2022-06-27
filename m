Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B4955BA97
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356817.585116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5q3c-0003Wx-EL; Mon, 27 Jun 2022 14:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356817.585116; Mon, 27 Jun 2022 14:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5q3c-0003Ul-Ar; Mon, 27 Jun 2022 14:49:44 +0000
Received: by outflank-mailman (input) for mailman id 356817;
 Mon, 27 Jun 2022 14:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5q3b-0003UX-84
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 14:49:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df9b2a7-f628-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 16:49:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 805021F9FC;
 Mon, 27 Jun 2022 14:49:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CA6213AB2;
 Mon, 27 Jun 2022 14:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b2DuEIXDuWL7RAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 14:49:41 +0000
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
X-Inumbo-ID: 5df9b2a7-f628-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656341381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/pKS3FRD7md/yjGps2cf8DUF1qB3qBp1ml/VVot9SB4=;
	b=JDE2n/1Pr0DdZx9o9pcnoTi/7qYMnHauI2Cf75QTpFbUyLqfnzMQ52hvsDvb1bnrGsDyo2
	K0hVVl4M/yd9KNzWLUG0c62iqjlj+IZvII2Vtu2CignMezrpo+Rdt0mhZdqOXek6rRnKtw
	68yElBBpishaRKNiCH5Go2+docVu2tg=
Message-ID: <cb96ebcf-46d7-63a8-cb7b-ce274ff7d815@suse.com>
Date: Mon, 27 Jun 2022 16:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20220627142822.3612106-1-ross.lagerwall@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot
In-Reply-To: <20220627142822.3612106-1-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Q6OdEyPXulR1QIOKe7CfTVZN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Q6OdEyPXulR1QIOKe7CfTVZN
Content-Type: multipart/mixed; boundary="------------0AfsGRMueD1YhcFLMs0qhTyL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <cb96ebcf-46d7-63a8-cb7b-ce274ff7d815@suse.com>
Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot
References: <20220627142822.3612106-1-ross.lagerwall@citrix.com>
In-Reply-To: <20220627142822.3612106-1-ross.lagerwall@citrix.com>

--------------0AfsGRMueD1YhcFLMs0qhTyL
Content-Type: multipart/mixed; boundary="------------uCpcWeqF10wX09TTDmuX3RkV"

--------------uCpcWeqF10wX09TTDmuX3RkV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTY6MjgsIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOg0KPiBDdXJyZW50bHkg
d2hlbiB0aGUgdG9vbHN0YWNrIGlzc3VlcyBhIHJlYm9vdCwgaXQgZ2V0cyB0cmFuc2xhdGVk
IGludG8gYQ0KPiBjYWxsIHRvIGN0cmxfYWx0X2RlbCgpLiBCdXQgdHlpbmcgcmVib290IHRv
IGN0cmwtYWx0LWRlbCBtZWFucyByZWJvb3RpbmcNCj4gbWF5IGZhaWwgaWYgZS5nLiB0aGUg
dXNlciBoYXMgbWFza2VkIHRoZSBjdHJsLWFsdC1kZWwudGFyZ2V0IHVuZGVyDQo+IHN5c3Rl
bWQuDQo+IA0KPiBBIHByZXZpb3VzIGF0dGVtcHQgdG8gZml4IHRoaXMgc2V0IHRoZSBmbGFn
IHRvIGZvcmNlIHJlYm9vdGluZyB3aGVuDQo+IGN0cmxfYWx0X2RlbCgpIGlzIGNhbGxlZC4N
Cg0KU29ycnksIEkgaGF2ZSBwcm9ibGVtcyBwYXJzaW5nIHRoaXMgc2VudGVuY2UuDQoNCiA+
IEhvd2V2ZXIsIHRoaXMgZG9lc24ndCBnaXZlIHVzZXJzcGFjZSB0aGUNCj4gb3Bwb3J0dW5p
dHkgdG8gYmxvY2sgcmVib290aW5nIG9yIGV2ZW4gZG8gYW55IGNsZWFudXAgb3Igc3luY2lu
Zy4NCj4gDQo+IEluc3RlYWQsIGNhbGwgb3JkZXJseV9yZWJvb3QoKSB3aGljaCB3aWxsIGNh
bGwgdGhlICJyZWJvb3QiIGNvbW1hbmQsDQo+IGdpdmluZyB1c2Vyc3BhY2UgdGhlIG9wcG9y
dHVuaXR5IHRvIGJsb2NrIGl0IG9yIHBlcmZvcm0gdGhlIHVzdWFsIHJlYm9vdA0KPiBwcm9j
ZXNzIHdoaWxlIGJlaW5nIGluZGVwZW5kZW50IG9mIHRoZSBjdHJsLWFsdC1kZWwgYmVoYXZp
b3VyLiBJdCBhbHNvDQo+IG1hdGNoZXMgd2hhdCBoYXBwZW5zIGluIHRoZSBzaHV0ZG93biBj
YXNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL21hbmFnZS5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL21hbmFnZS5jIGIvZHJpdmVycy94ZW4v
bWFuYWdlLmMNCj4gaW5kZXggM2Q1YTM4NGQ2NWY3Li5jMTZkZjYyOTkwN2UgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMveGVuL21hbmFnZS5jDQo+ICsrKyBiL2RyaXZlcnMveGVuL21hbmFn
ZS5jDQo+IEBAIC0yMDUsNyArMjA1LDcgQEAgc3RhdGljIHZvaWQgZG9fcG93ZXJvZmYodm9p
ZCkNCj4gICBzdGF0aWMgdm9pZCBkb19yZWJvb3Qodm9pZCkNCj4gICB7DQo+ICAgCXNodXR0
aW5nX2Rvd24gPSBTSFVURE9XTl9QT1dFUk9GRjsgLyogPyAqLw0KPiAtCWN0cmxfYWx0X2Rl
bCgpOw0KPiArCW9yZGVybHlfcmVib290KCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBz
dHJ1Y3Qgc2h1dGRvd25faGFuZGxlciBzaHV0ZG93bl9oYW5kbGVyc1tdID0gew0KDQpUaGUg
Y29kZSBzZWVtcyB0byBiZSBmaW5lLg0KDQpBbGJlaXQgSSB3b25kZXIgd2hldGhlciB3ZSBz
aG91bGRuJ3QgdHVybiBzaHV0dGluZ19kb3duIGludG8gYSBib29sLA0KYXMgYWxsIHRoYXQg
c2VlbXMgdG8gYmUgbmVlZGVkIGlzICJzaHV0dGluZ19kb3duICE9IFNIVVRET1dOX0lOVkFM
SUQiDQp0b2RheS4gQnV0IHRoaXMgY291bGQgYmUgcGFydCBvZiBhbm90aGVyIHBhdGNoLg0K
DQoNCkp1ZXJnZW4NCg==
--------------uCpcWeqF10wX09TTDmuX3RkV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uCpcWeqF10wX09TTDmuX3RkV--

--------------0AfsGRMueD1YhcFLMs0qhTyL--

--------------Q6OdEyPXulR1QIOKe7CfTVZN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5w4QFAwAAAAAACgkQsN6d1ii/Ey+0
VQf+JhVkoemqcHS4yPxqXVGiOreILcez6U8VehRQ0X/iMQ4zurYQ2nHidX/HAZgGw0E1hMOpGV+i
gfmv0KPJGbRgchosbyn9it8d252/XAvPxfaf5bLn9mSWX1WxU6NiNKMB6JxBaReVZr0HR6E2dvOg
460uRJBpK701KKZODcu/JCUP8WnwhCOIyAnocB3Ah/2q4g3lSNYSKL0Q342MpfZKQE5krGpFr9OV
3D3g2dOzGvRTgJQxXyVdDXb3buT2XoDQxXwO4STf6RMgQHZe6/51dNvjZR2djN6MXh+buDFWpKWQ
F4hfssfyXUNzb4d4PjBIsVbET7WyTeTt51Sf3G2z/g==
=ex4X
-----END PGP SIGNATURE-----

--------------Q6OdEyPXulR1QIOKe7CfTVZN--


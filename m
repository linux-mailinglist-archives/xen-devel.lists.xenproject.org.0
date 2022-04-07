Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD44F7C5B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 12:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300620.512876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncP1o-0001sy-54; Thu, 07 Apr 2022 10:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300620.512876; Thu, 07 Apr 2022 10:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncP1o-0001r6-0T; Thu, 07 Apr 2022 10:06:12 +0000
Received: by outflank-mailman (input) for mailman id 300620;
 Thu, 07 Apr 2022 10:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mzit=UR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ncP1m-0001r0-I0
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 10:06:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56245c61-b65a-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 12:06:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB14221122;
 Thu,  7 Apr 2022 10:06:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76A8D13485;
 Thu,  7 Apr 2022 10:06:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 772XG4y3TmKHQAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Apr 2022 10:06:04 +0000
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
X-Inumbo-ID: 56245c61-b65a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1649325964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViNMmtauRUZTlEmfR2WCY8dl0yCS/arQ83AKCE1RXss=;
	b=eLF4I7sK4P7PVy9ZxnRn5tPFd1d8qIOsftuMehMGbf8uGw3wh+Pm8vqJbd0ObODLB3f1WE
	JihY1J/cnoWJ8l03H1j2534V6nkmqVu0NjugR1tG/mSSs/Hp4G8VYN6mBLjetmal2p0mO+
	PbftG9ju3TIpeDNhwLVQaPjYowONo40=
Message-ID: <2491f4fb-cb4b-55d7-d23d-2f6917c859cb@suse.com>
Date: Thu, 7 Apr 2022 12:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Michal Hocko <mhocko@kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>
References: <20220407093221.1090-1-jgross@suse.com>
 <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R6URGsa0NFZmm44zukJXCTkF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R6URGsa0NFZmm44zukJXCTkF
Content-Type: multipart/mixed; boundary="------------J0C1DDTD70mjAc0TYWh1eHXU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Michal Hocko <mhocko@kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>
Message-ID: <2491f4fb-cb4b-55d7-d23d-2f6917c859cb@suse.com>
Subject: Re: [PATCH] mm, page_alloc: fix build_zonerefs_node()
References: <20220407093221.1090-1-jgross@suse.com>
 <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>
In-Reply-To: <1028ca3c-5b6c-d95e-9372-ae64b1fcbc82@redhat.com>

--------------J0C1DDTD70mjAc0TYWh1eHXU
Content-Type: multipart/mixed; boundary="------------FebjrF4g9WpyJ5mEPwYASAiv"

--------------FebjrF4g9WpyJ5mEPwYASAiv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDQuMjIgMTE6NDYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOg0KPiBPbiAwNy4w
NC4yMiAxMTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFNpbmNlIGNvbW1pdCA5ZDNi
ZTIxYmY5YzAgKCJtbSwgcGFnZV9hbGxvYzogc2ltcGxpZnkgem9uZWxpc3QNCj4+IGluaXRp
YWxpemF0aW9uIikgb25seSB6b25lcyB3aXRoIGZyZWUgbWVtb3J5IGFyZSBpbmNsdWRlZCBp
biBhIGJ1aWx0DQo+PiB6b25lbGlzdC4gVGhpcyBpcyBwcm9ibGVtYXRpYyB3aGVuIGUuZy4g
YWxsIG1lbW9yeSBvZiBhIHpvbmUgaGFzIGJlZW4NCj4+IGJhbGxvb25lZCBvdXQuDQo+Pg0K
Pj4gVXNlIHBvcHVsYXRlZF96b25lKCkgd2hlbiBidWlsZGluZyBhIHpvbmVsaXN0IGFzIGl0
IGhhcyBiZWVuIGRvbmUNCj4+IGJlZm9yZSB0aGF0IGNvbW1pdC4NCj4+DQo+PiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPj4gRml4ZXM6IDlkM2JlMjFiZjljMCAoIm1tLCBwYWdl
X2FsbG9jOiBzaW1wbGlmeSB6b25lbGlzdCBpbml0aWFsaXphdGlvbiIpDQo+PiBSZXBvcnRl
ZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0
aGluZ3NsYWIuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIG1tL3BhZ2VfYWxsb2MuYyB8IDIgKy0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYw0KPj4gaW5k
ZXggYmRjOGY2MGFlNDYyLi4zZDA2NjJhZjMyODkgMTAwNjQ0DQo+PiAtLS0gYS9tbS9wYWdl
X2FsbG9jLmMNCj4+ICsrKyBiL21tL3BhZ2VfYWxsb2MuYw0KPj4gQEAgLTYxMjgsNyArNjEy
OCw3IEBAIHN0YXRpYyBpbnQgYnVpbGRfem9uZXJlZnNfbm9kZShwZ19kYXRhX3QgKnBnZGF0
LCBzdHJ1Y3Qgem9uZXJlZiAqem9uZXJlZnMpDQo+PiAgIAlkbyB7DQo+PiAgIAkJem9uZV90
eXBlLS07DQo+PiAgIAkJem9uZSA9IHBnZGF0LT5ub2RlX3pvbmVzICsgem9uZV90eXBlOw0K
Pj4gLQkJaWYgKG1hbmFnZWRfem9uZSh6b25lKSkgew0KPj4gKwkJaWYgKHBvcHVsYXRlZF96
b25lKHpvbmUpKSB7DQo+PiAgIAkJCXpvbmVyZWZfc2V0X3pvbmUoem9uZSwgJnpvbmVyZWZz
W25yX3pvbmVzKytdKTsNCj4+ICAgCQkJY2hlY2tfaGlnaGVzdF96b25lKHpvbmVfdHlwZSk7
DQo+PiAgIAkJfQ0KPiANCj4gTGV0J3Mgc2VlIGlmIHdlIGhhdmUgdG8gZmluZCBhbm90aGVy
IHdheSB0byBwcm9wZXJseSBoYW5kbGUgZmFkdW1wLg0KDQpUQkgsIEkgZG9uJ3QgdGhpbmsg
dGhpcyBzaG91bGQgbWF0dGVyIGhlcmUuIEEgem9uZSBjYW4gYWx3YXlzIGhhcHBlbiB0bw0K
aGF2ZSBubyBmcmVlIG1lbW9yeSBsZWZ0LCBzbyBvbmx5IGhhbmRsaW5nIHRoaXMgY2FzZSB3
aGVuIGJ1aWxkaW5nIHRoZQ0Kem9uZWxpc3QgY2FuJ3QgYmUgdGhlIGZ1bGwgc29sdXRpb24g
b2YgdGhhdCBwcm9ibGVtLiBJdCBtaWdodCB0cmlnZ2VyDQphIHByb2JsZW0gbW9yZSBlYXNp
bHksIHRob3VnaC4NCg0KPiBBY2tlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJl
ZGhhdC5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQoNCg==
--------------FebjrF4g9WpyJ5mEPwYASAiv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FebjrF4g9WpyJ5mEPwYASAiv--

--------------J0C1DDTD70mjAc0TYWh1eHXU--

--------------R6URGsa0NFZmm44zukJXCTkF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJOt4sFAwAAAAAACgkQsN6d1ii/Ey8m
hwf9GoM9befCZ8OMyFEmJXC37VS+oZhOJZfxZhuXhQhsTQRMly3vQfcF+zOF8NbUeXRi2WnoX679
9iDpcx8gueWWNlH+p7q50BT+8cOTaQRyyjEjNexf6g5XDvqSkYg0FTHITSVjZtcs4l51EGhHT2nO
saoL7JCwBP8ofq+oLPJo7zDh+VUvP6E9oxgO6KqiCV3/E457hV0SwcWTdRC8p4VDmfwvqGervZW8
UpjfgFiGYRJq7rgZGK/Lbr4P+83tSJkYCFy5NAUmK97PFF2/7yFUz8DC+RamLwwdKUxc4PJEgaAJ
WxPjXlvk3ZvdQ1s+SVCYJ9T04YfQ9WTsVuWKXcbKTw==
=bAsf
-----END PGP SIGNATURE-----

--------------R6URGsa0NFZmm44zukJXCTkF--


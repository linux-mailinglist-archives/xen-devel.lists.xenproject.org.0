Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0514C56FF78
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365039.595071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqzw-0006so-4t; Mon, 11 Jul 2022 10:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365039.595071; Mon, 11 Jul 2022 10:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqzw-0006qd-2D; Mon, 11 Jul 2022 10:50:40 +0000
Received: by outflank-mailman (input) for mailman id 365039;
 Mon, 11 Jul 2022 10:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAqzu-0006qX-9R
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:50:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c019064-0107-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 12:50:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC6032284D;
 Mon, 11 Jul 2022 10:50:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7170B13322;
 Mon, 11 Jul 2022 10:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h3jmGXwAzGLdYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 10:50:36 +0000
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
X-Inumbo-ID: 4c019064-0107-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657536636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRr+ub8cB+llrj9b1Eu7Fe4+2ipE6S2QVXMNVbgFoSU=;
	b=l0mJ599vWK19JNh7qXa7zc+1pH4yenMnZZnSDc4ydvpu3xxT1X600e11WEeJfKzeMp+fOP
	MJmkWbEwdxu4t/5Rh9xfE3agcge0qCQUKk+NIhB1dfgy4MokQreuk2u9YLf/m2B22BYm2t
	xTh2rscl2M8yzzuHU31agE7ZFs9NR6w=
Message-ID: <2e49ac6b-d234-27d6-5b6b-767365a1f474@suse.com>
Date: Mon, 11 Jul 2022 12:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 5/9] xen: generate hypercall interface related code
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-6-jgross@suse.com>
 <48f157d0-ed5d-b584-fcff-1425c137335a@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <48f157d0-ed5d-b584-fcff-1425c137335a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DBau36QdcOftjL5AQ00BLMVF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DBau36QdcOftjL5AQ00BLMVF
Content-Type: multipart/mixed; boundary="------------nbAXcKk0XmqMDe0JblD0MF4W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Message-ID: <2e49ac6b-d234-27d6-5b6b-767365a1f474@suse.com>
Subject: Re: [PATCH v6 5/9] xen: generate hypercall interface related code
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-6-jgross@suse.com>
 <48f157d0-ed5d-b584-fcff-1425c137335a@suse.com>
In-Reply-To: <48f157d0-ed5d-b584-fcff-1425c137335a@suse.com>

--------------nbAXcKk0XmqMDe0JblD0MF4W
Content-Type: multipart/mixed; boundary="------------Dpwu2SdrMXWTjzXD9wFosHwN"

--------------Dpwu2SdrMXWTjzXD9wFosHwN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMTI6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMy4yMDIy
IDE1OjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvTWFr
ZWZpbGUNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL01ha2VmaWxlDQo+PiBAQCAtNzcsNiArNzcs
MTggQEAgJChvYmopL2NvbXBhdC94bGF0Lmg6ICQoYWRkcHJlZml4ICQob2JqKS9jb21wYXQv
LnhsYXQvLCQoeGxhdC15KSkgJChvYmopL2NvbmZpZy8NCj4+ICAgCWNhdCAkKGZpbHRlciAl
LmgsJF4pID4kQC5uZXcNCj4+ICAgCW12IC1mICRALm5ldyAkQA0KPj4gICANCj4+ICtxdWll
dF9jbWRfZ2VuaHlwID0gR0VOICAgICAkQA0KPj4gK2RlZmluZSBjbWRfZ2VuaHlwDQo+PiAr
ICAgIGF3ayAtZiAkKHNyY3RyZWUpL3NjcmlwdHMvZ2VuX2h5cGVyY2FsbC5hd2sgPCQ8ID4k
QA0KPj4gK2VuZGVmDQo+PiArDQo+PiArYWxsOiAkKG9iaikveGVuL2h5cGVyY2FsbC1kZWZz
LmgNCj4+ICsNCj4+ICskKG9iaikveGVuL2h5cGVyY2FsbC1kZWZzLmg6ICQob2JqKS9oeXBl
cmNhbGwtZGVmcy5pICQoc3JjdHJlZSkvc2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3ayBGT1JD
RQ0KPj4gKwkkKGNhbGwgaWZfY2hhbmdlZCxnZW5oeXApDQo+PiArDQo+PiArdGFyZ2V0cyAr
PSB4ZW4vaHlwZXJjYWxsLWRlZnMuaA0KPj4gKw0KPj4gICBpZmVxICgkKFhFTl9UQVJHRVRf
QVJDSCksJChYRU5fQ09NUElMRV9BUkNIKSkNCj4+ICAgDQo+PiAgIGFsbDogJChvYmopL2hl
YWRlcnMuY2hrICQob2JqKS9oZWFkZXJzOTkuY2hrICQob2JqKS9oZWFkZXJzKysuY2hrDQo+
PiBAQCAtMTMyLDMgKzE0NCw0IEBAIGFsbDogbGliLXg4Ni1hbGwNCj4+ICAgZW5kaWYNCj4+
ICAgDQo+PiAgIGNsZWFuLWZpbGVzIDo9IGNvbXBhdCBjb25maWcgZ2VuZXJhdGVkIGhlYWRl
cnMqLmNoayB4ZW4vbGliL3g4Ni9jcHVpZC1hdXRvZ2VuLmgNCj4+ICtjbGVhbi1maWxlcyAr
PSB4ZW4vaHlwZXJjYWxsLWRlZnMuaCBoeXBlcmNhbGwtZGVmcy5pDQo+IA0KPiBJJ3ZlIGNv
bW1pdHRlZCB0aGlzIGFzLWlzICh3aXRoIGp1c3QgZnV6eiBzdWl0YWJseSByZXNvbHZlZCks
IGRlc3BpdGUNCj4gYmVpbmcgdW5jZXJ0YWluIHdoZXRoZXIgeGVuL2h5cGVyY2FsbC1kZWZz
LmggLSBiZWluZyBwYXJ0IG9mIHRhcmdldHMgLQ0KPiBhY3R1YWxseSBuZWVkcyBlbnVtZXJh
dGluZyBoZXJlIChhbnltb3JlKS4NCg0KV2l0aG91dCBpdCBiZWluZyBlbnVtZXJhdGVkICJt
YWtlIGNsZWFuIiB3aWxsIHN0aWxsIHJlbW92ZSBpdC4gU28gaXQgaXMNCm9idmlvdXNseSBu
b3QgbmVlZGVkLg0KDQpTZW5kaW5nIGEgcGF0Y2ggLi4uDQoNCg0KSnVlcmdlbg0KDQo=
--------------Dpwu2SdrMXWTjzXD9wFosHwN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Dpwu2SdrMXWTjzXD9wFosHwN--

--------------nbAXcKk0XmqMDe0JblD0MF4W--

--------------DBau36QdcOftjL5AQ00BLMVF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLMAHwFAwAAAAAACgkQsN6d1ii/Ey8/
rwf+IqOwuOCCv5p+2aFUbrR4ExWRmihbGd/NvoFVVLFuIWWBzALBzGbgbN5hHHknqP5YpxQ0yenv
Esd5ExQ4ZjMMFlQRilJHActELmdsIXBxVY/ovgkPypxVFM3RuMwagmtOIkO5xWqvwdG4oMiVV3iy
WSTytUmljLWNmqjYFWop7EMgtmG+ZZQcIENTfsJYiPp6l7Dpxb8Erw8INw+i6+XKMP6ueKT9IRzQ
r/iqPXUx3F2vtSbnNubYA8p2caE4p9yRm99Rq91xRKnGsv62aYxi32YF04NmfrulFcaeyFtOXm6F
DUdbg4z1zEnppFybaUTbwgp+gGmUf2EWPE4jXYDgLA==
=7En2
-----END PGP SIGNATURE-----

--------------DBau36QdcOftjL5AQ00BLMVF--


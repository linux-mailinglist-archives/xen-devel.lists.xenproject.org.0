Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476B4D5D2D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288852.489940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaWU-0002GQ-Fw; Fri, 11 Mar 2022 08:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288852.489940; Fri, 11 Mar 2022 08:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaWU-0002Dr-Cf; Fri, 11 Mar 2022 08:21:18 +0000
Received: by outflank-mailman (input) for mailman id 288852;
 Fri, 11 Mar 2022 08:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nSaWS-0002Dl-8i
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:21:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 374ae060-a114-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:21:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F40E91F38D;
 Fri, 11 Mar 2022 08:21:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8919513C9D;
 Fri, 11 Mar 2022 08:21:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /GfwH3kGK2ISNwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 11 Mar 2022 08:21:13 +0000
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
X-Inumbo-ID: 374ae060-a114-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646986874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXKZK6VpRmVkqGgeqBb2LsXN95cf+e6tyUgBVx4yzR8=;
	b=nEVOKknHKq2LjN3CzzWqNopXQlhi6yEL0wckxXoR20uqEYbkP9eH71dGtXxi+D1NdKcGqB
	vZpG60tQs5kWEnlh1qzRYqSpSiAL8qD8mHGlHYY+MSJzZXf4WYSi175SNv99eRochgrpLR
	1CAm/U64QaQgOiEVyEXPiNtAKMWAaxE=
Message-ID: <8bbd6239-f6e9-6c76-bca7-b382306e4171@suse.com>
Date: Fri, 11 Mar 2022 09:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-3-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220310171019.6170-3-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UUgjTmVUl98wrUEGdY76aT2x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UUgjTmVUl98wrUEGdY76aT2x
Content-Type: multipart/mixed; boundary="------------fE7BZbS8pPGzPI3ffF6ibudk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <8bbd6239-f6e9-6c76-bca7-b382306e4171@suse.com>
Subject: Re: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-3-luca.fancellu@arm.com>
In-Reply-To: <20220310171019.6170-3-luca.fancellu@arm.com>

--------------fE7BZbS8pPGzPI3ffF6ibudk
Content-Type: multipart/mixed; boundary="------------PlyAXB9er6a5m1IllIzc914r"

--------------PlyAXB9er6a5m1IllIzc914r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDMuMjIgMTg6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IENyZWF0ZSBuZXcg
cHVibGljIGZ1bmN0aW9uIHRvIGNyZWF0ZSBjcHVwb29scywgY2FuIHRha2UgYXMgcGFyYW1l
dGVyDQo+IHRoZSBzY2hlZHVsZXIgaWQgb3IgYSBuZWdhdGl2ZSB2YWx1ZSB0aGF0IG1lYW5z
IHRoZSBkZWZhdWx0IFhlbg0KPiBzY2hlZHVsZXIgd2lsbCBiZSB1c2VkLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiAt
LS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBjcHVwb29sX2NyZWF0ZV9wb29sIGRvZXNuJ3Qg
Y2hlY2sgYW55bW9yZSBmb3IgcG9vbCBpZCB1bmlxdWVuZXNzDQo+ICAgIGJlZm9yZSBjYWxs
aW5nIGNwdXBvb2xfY3JlYXRlLiBNb2RpZmllZCBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmds
eQ0KPiAtLS0NCj4gICB4ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyB8IDE1ICsrKysrKysr
KysrKysrKw0KPiAgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgIHwgMTYgKysrKysrKysr
KysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9z
Y2hlZC9jcHVwb29sLmMNCj4gaW5kZXggYTZkYTQ5NzA1MDZhLi44OWE4OTFhZjcwNzYgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+ICsrKyBiL3hlbi9j
b21tb24vc2NoZWQvY3B1cG9vbC5jDQo+IEBAIC0xMjE5LDYgKzEyMTksMjEgQEAgc3RhdGlj
IHZvaWQgY3B1cG9vbF9oeXBmc19pbml0KHZvaWQpDQo+ICAgDQo+ICAgI2VuZGlmIC8qIENP
TkZJR19IWVBGUyAqLw0KPiAgIA0KPiArc3RydWN0IGNwdXBvb2wgKl9faW5pdCBjcHVwb29s
X2NyZWF0ZV9wb29sKHVuc2lnbmVkIGludCBwb29sX2lkLCBpbnQgc2NoZWRfaWQpDQo+ICt7
DQo+ICsgICAgc3RydWN0IGNwdXBvb2wgKnBvb2w7DQo+ICsNCj4gKyAgICBpZiAoIHNjaGVk
X2lkIDwgMCApDQo+ICsgICAgICAgIHNjaGVkX2lkID0gc2NoZWR1bGVyX2dldF9kZWZhdWx0
KCktPnNjaGVkX2lkOw0KPiArDQo+ICsgICAgcG9vbCA9IGNwdXBvb2xfY3JlYXRlKHBvb2xf
aWQsIHNjaGVkX2lkKTsNCj4gKw0KPiArICAgIEJVR19PTihJU19FUlIocG9vbCkpOw0KPiAr
ICAgIGNwdXBvb2xfcHV0KHBvb2wpOw0KPiArDQo+ICsgICAgcmV0dXJuIHBvb2w7DQo+ICt9
DQo+ICsNCj4gICBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBjcHVwb29sX2luaXQodm9p
ZCkNCj4gICB7DQo+ICAgICAgIHVuc2lnbmVkIGludCBjcHU7DQo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IGlu
ZGV4IDEwZWE5NjljN2FmOS4uNDdmYzg1NmUwZmUwIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiBA
QCAtMTE0NSw2ICsxMTQ1LDIyIEBAIGludCBjcHVwb29sX21vdmVfZG9tYWluKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKTsNCj4gICBpbnQgY3B1cG9vbF9kb19zeXNj
dGwoc3RydWN0IHhlbl9zeXNjdGxfY3B1cG9vbF9vcCAqb3ApOw0KPiAgIHVuc2lnbmVkIGlu
dCBjcHVwb29sX2dldF9pZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKTsNCj4gICBjb25zdCBj
cHVtYXNrX3QgKmNwdXBvb2xfdmFsaWRfY3B1cyhjb25zdCBzdHJ1Y3QgY3B1cG9vbCAqcG9v
bCk7DQo+ICsNCj4gKy8qDQo+ICsgKiBjcHVwb29sX2NyZWF0ZV9wb29sIC0gQ3JlYXRlcyBh
IGNwdXBvb2wNCj4gKyAqIEBwb29sX2lkOiBpZCBvZiB0aGUgcG9vbCB0byBiZSBjcmVhdGVk
DQo+ICsgKiBAc2NoZWRfaWQ6IGlkIG9mIHRoZSBzY2hlZHVsZXIgdG8gYmUgdXNlZCBmb3Ig
dGhlIHBvb2wNCj4gKyAqDQo+ICsgKiBDcmVhdGVzIGEgY3B1cG9vbCB3aXRoIHBvb2xfaWQg
aWQuDQo+ICsgKiBUaGUgc2NoZWRfaWQgcGFyYW1ldGVyIGlkZW50aWZpZXMgdGhlIHNjaGVk
dWxlciB0byBiZSB1c2VkLCBpZiBpdCBpcw0KPiArICogbmVnYXRpdmUsIHRoZSBkZWZhdWx0
IHNjaGVkdWxlciBvZiBYZW4gd2lsbCBiZSB1c2VkLg0KPiArICoNCj4gKyAqIHJldHVybnM6
DQo+ICsgKiAgICAgcG9pbnRlciB0byB0aGUgc3RydWN0IGNwdXBvb2wganVzdCBjcmVhdGVk
LCBvbiBzdWNjZXNzDQo+ICsgKiAgICAgTlVMTCwgb24gY3B1cG9vbCBjcmVhdGlvbiBlcnJv
cg0KDQpFaXRoZXIgYWRkIGEgIi4iIGluIHRoZSBwcmV2aW91cyBsaW5lLCBvciByZXBocmFz
ZSAoZS5nLjoNCiJwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgY3B1cG9vbCBqdXN0IGNyZWF0ZWQs
IG9yIE5VTEwgaW4gY2FzZSBvZiBlcnJvciINCg0KSSBoYXBwZW5lZCB0byByZWFkIGl0IGFz
ICJwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgY3B1cG9vbCBqdXN0IGNyZWF0ZWQsDQpvbiBzdWNj
ZXNzIE5VTEwsIG9uIGNwdXBvb2wgY3JlYXRpb24gZXJyb3IiIGZpcnN0LCB3aGljaCB3YXMg
d2VpcmQuDQoNCldpdGggdGhhdCBmaXhlZDoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------PlyAXB9er6a5m1IllIzc914r
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PlyAXB9er6a5m1IllIzc914r--

--------------fE7BZbS8pPGzPI3ffF6ibudk--

--------------UUgjTmVUl98wrUEGdY76aT2x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIrBnkFAwAAAAAACgkQsN6d1ii/Ey/V
xQf9HuHOhVR6goNc7b9eU5YAi7u987F3hg5EfrBLai1hKIA5a2DVR0XKvFhB0ZC/TpCSv056Od2a
bdnSHKdCH6TtkMoLQP44VJLVBFvnn8UtEkAbcpE0dZhaP8ws1wKWQSU7FABji7pv+mNuFUkm/n5j
iencsbHtetmPTXUsxAHLuDloJS6uY5zjt7r3Chnn/Qw2KEtItcY3ixCn05SIs28hdGEv/T2xE+s4
1KlJ6MWmu3dtmytyG2w/bJbqmaH6XaSrtZLBvWvxOXE5PtJnm794SlaR8QMQoL/UbJ5ELVTk4sLh
Bo+fRkP2KHkPnVhQHkoQIzWSqVO2fg/nzkhlWQqubA==
=/C/t
-----END PGP SIGNATURE-----

--------------UUgjTmVUl98wrUEGdY76aT2x--


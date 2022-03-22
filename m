Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5C4E4357
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293569.498737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgnR-0002kc-HE; Tue, 22 Mar 2022 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293569.498737; Tue, 22 Mar 2022 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWgnR-0002il-DA; Tue, 22 Mar 2022 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 293569;
 Tue, 22 Mar 2022 15:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJOs=UB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWgnQ-0002ib-0W
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:51:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f833a28f-a9f7-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 16:51:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEC0D210E5;
 Tue, 22 Mar 2022 15:51:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74022133B6;
 Tue, 22 Mar 2022 15:51:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ECUFG47wOWIlWAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Mar 2022 15:51:42 +0000
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
X-Inumbo-ID: f833a28f-a9f7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647964302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFktat+7ApyjoGXFa1yZioTq/sp+PSrn1regvTl8ofE=;
	b=n80Vr1W8JJqaq7yS+uNo3EE/GEbtL2a1jH10Hy0HwwLoAkOeoh6aXIkerNNGBrc/05peuz
	HOOxFeribZ0BDVQfMm2V/JKLRRAInRTzrzudyfG6sRs94O6NyiSQmlQ0kmeSSGjXWE0HCA
	dc14Qioyq5jaVV3jUVlgWXR+BT+eodQ=
Message-ID: <65436e8b-b5fb-6c53-1dc4-d8a89e4a9315@suse.com>
Date: Tue, 22 Mar 2022 16:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 07/11] xen: generate hypercall interface related code
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-8-jgross@suse.com>
 <Yjnr3FAS3G94Yf6+@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yjnr3FAS3G94Yf6+@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9KqAWBwLMAiBYEy0DMcbOf2N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9KqAWBwLMAiBYEy0DMcbOf2N
Content-Type: multipart/mixed; boundary="------------rphbHH9Q8X3zE3m0LD8q9XYa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <65436e8b-b5fb-6c53-1dc4-d8a89e4a9315@suse.com>
Subject: Re: [PATCH v4 07/11] xen: generate hypercall interface related code
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-8-jgross@suse.com>
 <Yjnr3FAS3G94Yf6+@perard.uk.xensource.com>
In-Reply-To: <Yjnr3FAS3G94Yf6+@perard.uk.xensource.com>

--------------rphbHH9Q8X3zE3m0LD8q9XYa
Content-Type: multipart/mixed; boundary="------------2YXHEz6Agg4tG4bNOKgOLjGk"

--------------2YXHEz6Agg4tG4bNOKgOLjGk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDMuMjIgMTY6MzEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAxMCwgMjAyMiBhdCAwODozNDoxNkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL01ha2VmaWxlIGIveGVuL2luY2x1ZGUvTWFr
ZWZpbGUNCj4+IGluZGV4IGEzYzI1MTFmNWYuLmI1MmEyZGE0MGMgMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vaW5jbHVkZS9NYWtlZmlsZQ0KPj4gKysrIGIveGVuL2luY2x1ZGUvTWFrZWZpbGUN
Cj4+IEBAIC03Nyw2ICs3NywxOCBAQCAkKG9iaikvY29tcGF0L3hsYXQuaDogJChhZGRwcmVm
aXggJChvYmopL2NvbXBhdC8ueGxhdC8sJCh4bGF0LXkpKSAkKG9iaikvY29uZmlnLw0KPj4g
ICAJY2F0ICQoZmlsdGVyICUuaCwkXikgPiRALm5ldw0KPj4gICAJbXYgLWYgJEAubmV3ICRA
DQo+PiAgIA0KPj4gK3F1aWV0X2NtZF9nZW5oeXAgPSBHRU4gICAgICRADQo+PiArZGVmaW5l
IGNtZF9nZW5oeXANCj4+ICsgICAgYXdrIC1mICQoc3JjKS8uLi9zY3JpcHRzL2dlbl9oeXBl
cmNhbGwuYXdrIDwkPCA+JEANCj4gDQo+IFlvdSBzaG91bGQgdXNlICIkKHNyY3RyZWUpIiBp
bnN0ZWFkIG9mICIkKHNyYykvLi4iLg0KPiANCj4gJChzcmN0cmVlKSBhbHdheXMgcG9pbnQg
dG8gdGhlIHNvdXJjZSB0cmVlIG9mIHRoZSBoeXBlcnZpc29yLiAoICQoc3JjKQ0KPiBkb2Vz
bid0IG5lY2Vzc2FyaWx5IHBvaW50IHRvICJpbmNsdWRlLyIgaW4gdGhlIHNvdXJjZSB0cmVl
LiApDQoNCk9rYXkuDQoNCj4gDQo+PiArZW5kZWYNCj4+ICsNCj4+ICthbGw6ICQob2JqKS94
ZW4vaHlwZXJjYWxsLWRlZnMuaA0KPj4gKw0KPj4gKyQob2JqKS94ZW4vaHlwZXJjYWxsLWRl
ZnMuaDogJChvYmopL2h5cGVyY2FsbC1kZWZzLmkgJChzcmMpLy4uL3NjcmlwdHMvZ2VuX2h5
cGVyY2FsbC5hd2sgRk9SQ0UNCj4gDQo+IEhlcmUgYXMgd2VsbCwgaXQgd291bGQgYmUgYmV0
dGVyIHRvIHVzZSAkKHNyY3RyZWUpIGluc3RlYWQgb2YgJChzcmMpLy4uIC4NCg0KVGhhbmtz
LA0KDQoNCkp1ZXJnZW4NCg==
--------------2YXHEz6Agg4tG4bNOKgOLjGk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2YXHEz6Agg4tG4bNOKgOLjGk--

--------------rphbHH9Q8X3zE3m0LD8q9XYa--

--------------9KqAWBwLMAiBYEy0DMcbOf2N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI58I0FAwAAAAAACgkQsN6d1ii/Ey+B
tgf/bjh7nQA5SNazOw2AUUjoYfDC21lLjhi1nxx7c1YM2J+cXMqXN1wOPzHb4QncfQNmnpoTOV2u
/9pKGKf3eoz1NIHPyFglH1630V8l2SzA356n500/MCYpgLd7fmjfvpjGEQO2PQ2NJOGvqBbavSHq
LjV9lYlm8RnL7xUDS+q6yzZuYI4uUIa6HcI5G2IfNZ9VXJOwMQ70Xwt7DRkHpRvn+472IuY29rKd
VOvkoDU6Sq+/sHoIhomk3ZGSQJL9HXXafHxakv4LWs4jDgQvcMJBRs8Ijx3urN96FFPYwDcrKT6f
cfvg+m+OvTr+KPcjHYf929/WMR0JCQGnRGbfWcNf6w==
=9Vxq
-----END PGP SIGNATURE-----

--------------9KqAWBwLMAiBYEy0DMcbOf2N--


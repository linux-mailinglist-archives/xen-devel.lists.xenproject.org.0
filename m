Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA355FD1C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357769.586562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Utb-0001sP-Df; Wed, 29 Jun 2022 10:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357769.586562; Wed, 29 Jun 2022 10:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Utb-0001pY-AD; Wed, 29 Jun 2022 10:26:07 +0000
Received: by outflank-mailman (input) for mailman id 357769;
 Wed, 29 Jun 2022 10:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o6Uta-0001pS-1X
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:26:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1a0644b-f795-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 12:26:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5D7021F90;
 Wed, 29 Jun 2022 10:26:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B656B133D1;
 Wed, 29 Jun 2022 10:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4yYXK7wovGJGIAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Jun 2022 10:26:04 +0000
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
X-Inumbo-ID: e1a0644b-f795-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656498364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQeCfMHyw+TPb/Ff8NyKyc14By/yE0uYswCVx9GkER8=;
	b=uFX0PJKb3qtmbmZHOg58WhyYsYeKctbVkQFr77y8gL3FzbDtOYuMFISXH8BNnn30kEVG/0
	9h4GaIGtmEyfmCwME2qlG6z5icClgOU+TvmgL3monBE+1rpwR9VZhH7qRWDAfkHTjiRc+y
	xuq0IQuL8HxW64PIOOS/PRSj7h+/lHk=
Message-ID: <91e01772-1d23-760b-4cea-3d0ed7a62237@suse.com>
Date: Wed, 29 Jun 2022 12:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v3 18/25] tools: Introduce $(xenlibs-rpath,..) to
 replace $(SHDEPS_lib*)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-19-anthony.perard@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220624160422.53457-19-anthony.perard@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tw60pFjxzWpjI2bzB05Nkr7n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tw60pFjxzWpjI2bzB05Nkr7n
Content-Type: multipart/mixed; boundary="------------Q80JA0qdgJ3Zb3EjL3K5uGnZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Message-ID: <91e01772-1d23-760b-4cea-3d0ed7a62237@suse.com>
Subject: Re: [XEN PATCH v3 18/25] tools: Introduce $(xenlibs-rpath,..) to
 replace $(SHDEPS_lib*)
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-19-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-19-anthony.perard@citrix.com>

--------------Q80JA0qdgJ3Zb3EjL3K5uGnZ
Content-Type: multipart/mixed; boundary="------------8y1CJZWShjfV195fNCqonXfm"

--------------8y1CJZWShjfV195fNCqonXfm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjIgMTg6MDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBUaGlzIHBhdGNo
IGludHJvZHVjZSBhIG5ldyBtYWNybyAkKHhlbmxpYnMtZGVwZW5kZW5jaWVzLCkgdG8gZ2Vu
ZXJhdGUNCj4gYSBsaXN0IG9mIGFsbCB0aGUgeGVuIGxpYnJhcnkgdGhhdCBhIGxpYnJhcnkg
aXMgbGlzdCBhZ2FpbnN0LCBhbmQgdGhleQ0KPiBhcmUgbGlzdGVkIG9ubHkgb25jZS4gV2Ug
dXNlIHRoZSBzaWRlIGVmZmVjdCBvZiAkKHNvcnQgKSB3aGljaCByZW1vdmUNCj4gZHVwbGlj
YXRlcy4NCj4gDQo+IFRoaXMgaXMgdXNlZCBieSBhbm90aGVyIG1hY3JvICQoeGVubGlicy1y
cGF0aCwpIHdoaWNoIGlzIHRvIHJlcGxhY2UNCj4gJChTSERFUFNfbGlieGVuKikuDQo+IA0K
PiBJbiBsaWJzLm1rLCB3ZSBkb24ndCBuZWVkIHRvICQoc29ydCApIFNITElCX2xpYiogYW55
bW9yZSBhcyB0aGlzIHdhcyB1c2VkDQo+IHRvIHJlbW92ZSBkdXBsaWNhdGVzIGFuZCB0aGV5
IGFyZSBubyBtb3JlIGR1cGxpY2F0ZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------8y1CJZWShjfV195fNCqonXfm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8y1CJZWShjfV195fNCqonXfm--

--------------Q80JA0qdgJ3Zb3EjL3K5uGnZ--

--------------tw60pFjxzWpjI2bzB05Nkr7n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK8KLwFAwAAAAAACgkQsN6d1ii/Ey/Q
QAf8D/+9D8RL/GIfrgULbINOPlRX2SOLjbmtR/6gvItV91V0jayTvOfMrctQEvJjCV9FaRcLku1t
pEmhyarC85sx4lUDYquiQ2iihFvUMAvfEKSjHRM02ai5TB4J8HGuLG3RBx167kYTF0zrdvDHet5M
VrllKQGO42vgirTYgWe9DLvq7sLt+am/UbAmYMPqjPejTkzLUYd3EtnnWvTgezCp/HyCFZV9l21Q
BqvqbEj1VI9a40HXfmbEro/UEH59jK0a1dZBVaPVp42F9+J7DWDExdlF08L3vQ57orzHhsZfJ5Al
uU+ILKJgkibHKE7oAT8VHtXMUTqkFsgDctC/AdfcEA==
=GJgn
-----END PGP SIGNATURE-----

--------------tw60pFjxzWpjI2bzB05Nkr7n--


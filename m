Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1890691EE1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 13:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493388.763341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQSIN-0007kK-FQ; Fri, 10 Feb 2023 12:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493388.763341; Fri, 10 Feb 2023 12:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQSIN-0007i5-CQ; Fri, 10 Feb 2023 12:14:27 +0000
Received: by outflank-mailman (input) for mailman id 493388;
 Fri, 10 Feb 2023 12:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9hqk=6G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pQSIL-0007g6-Ik
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 12:14:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734b821d-a93c-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 13:14:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3129138C6F;
 Fri, 10 Feb 2023 12:14:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0643913206;
 Fri, 10 Feb 2023 12:14:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u4geAB015mPzAwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Feb 2023 12:14:21 +0000
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
X-Inumbo-ID: 734b821d-a93c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676031261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9/7LL8YFeevoXTCk3DqI4RZG1qm/mpzkWP4bI9bxHzc=;
	b=k0BQzmIHjgo4E4iqbBFAKg8OeZ8Dzipc4yMeuHlwkBpcUkgMaCFGulYyJAeyYKn1mf61gT
	wSX170aqyK/yVrni2ywFF2s9ZWOfSaWBVq0b5FXuI7qU+C1b1LRnffyzSfUM7u4YKUA6Z9
	G8IbhP1ll7cwjMwe/B1d4BoFGywAMiQ=
Message-ID: <8c007a9a-1466-f200-d7f6-27c81622ef27@suse.com>
Date: Fri, 10 Feb 2023 13:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-4-jgross@suse.com>
 <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
In-Reply-To: <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gYHr6Z1L8dY8JCyXyg5uCt7O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gYHr6Z1L8dY8JCyXyg5uCt7O
Content-Type: multipart/mixed; boundary="------------ZaUrE1zYQss3ulHEXpjQy7bV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <8c007a9a-1466-f200-d7f6-27c81622ef27@suse.com>
Subject: Re: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-4-jgross@suse.com>
 <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
In-Reply-To: <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>

--------------ZaUrE1zYQss3ulHEXpjQy7bV
Content-Type: multipart/mixed; boundary="------------lk0kNtLJLnA1v7uhw6G0v4ci"

--------------lk0kNtLJLnA1v7uhw6G0v4ci
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDIuMjMgMTI6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEwLzAyLzIw
MjMgMTA6NDYgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvbGli
L3N5cy5jIGIvbGliL3N5cy5jDQo+PiBpbmRleCAyZjMzYzkzNy4uZGM4YThjNjkgMTAwNjQ0
DQo+PiAtLS0gYS9saWIvc3lzLmMNCj4+ICsrKyBiL2xpYi9zeXMuYw0KPj4gQEAgLTMzOSw3
ICszMzksMTQgQEAgc3RhdGljIGludCBvcGVuX21lbShzdHJ1Y3QgbW91bnRfcG9pbnQgKm1u
dCwgY29uc3QgY2hhciAqcGF0aG5hbWUsIGludCBmbGFncywNCj4+ICAgICAgIHJldHVybiBm
ZDsNCj4+ICAgfQ0KPj4gICANCj4+IC1zdGF0aWMgc3RydWN0IG1vdW50X3BvaW50IG1vdW50
X3BvaW50c1tdID0gew0KPj4gKyNpZmRlZiBDT05GSUdfQ09OU0ZST05UDQo+PiArI2RlZmlu
ZSBTVEFUSUNfTU5UUyAgIDQNCj4+ICsjZWxzZQ0KPj4gKyNkZWZpbmUgU1RBVElDX01OVFMg
ICAyDQo+PiArI2VuZGlmDQo+IA0KPiBUaGlzIG91Z2h0IHRvIGJlDQo+IA0KPiAjZGVmaW5l
IFNUQVRJQ19NTlRTICgyICsgKElTX0VOQUJMRUQoQ09ORklHX0NPTlNGUk9OVCkgKiAyKSkN
Cj4gDQo+IGJlY2F1c2UgaXQgc2hvd3Mgd2hlcmUgdGhlIHBhcnRzIGNvbWUgZnJvbSwgYW5k
IGlzIG11Y2ggY2xlYW5lciB0byBhZGQgYQ0KPiAzcmQgb25lIHRvIGluIGR1ZSBjb3Vyc2Uu
DQoNCkluIHByaW5jaXBsZSBmaW5lLCBidXQgSSdtIG5vdCBzdXJlIGl0IGlzIHdvcnRoIHRo
ZSBlZmZvcnQgdG8gYWRkDQpJU19FTkFCTEVEKCkgc3VwcG9ydCB0byBNaW5pLU9TLg0KDQo+
IFRoYXQgc2FpZCwgaXQgd291bGQgYmUgc2ltcGxlciB0byBqdXN0IGhhdmUgYSB0b3RhbCBt
b3VudHMgc2V0IGF0IDE2IG9yDQo+IHNvP8KgIERvZXMgYSBkaWZmZXJlbmNlIG9mIHR3byBk
eW5hbWljIG1vdW50cyBkZXBlbmRpbmcgb24gQ09OU0ZST05UDQo+IGFjdHVhbGx5IG1hdHRl
cj8NCg0KUHJvYmFibHkgbm90LiBTYW11ZWwsIGFueSB0aG91Z2h0cyBvbiB0aGF0Pw0KDQoN
Ckp1ZXJnZW4NCg0K
--------------lk0kNtLJLnA1v7uhw6G0v4ci
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lk0kNtLJLnA1v7uhw6G0v4ci--

--------------ZaUrE1zYQss3ulHEXpjQy7bV--

--------------gYHr6Z1L8dY8JCyXyg5uCt7O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPmNRwFAwAAAAAACgkQsN6d1ii/Ey8S
ngf/UNYiWsjsaAcKMRDx6fEDCyFeOm6XXBnOIj7C7XEt1lZUJFmcwcYzMmbuJquh8laOwcs0Orpi
NDjLFQb20xHxlWvOHYTD0G/qldZVUUSfd3Xto03EmoTrMqH/oNh7Q/xE6EJouPns22lkNJMaHHOY
vVpvjuRNIqSP2U6GGr82qmqKWQPovJ86p+TBaYbmpnTKBd22ReEmEUh+PicLxjjH6Hbf79TqrrqZ
GsR0JfQPkNuzqo3Y1gn+MClsEDLS4uxmJmyoi3tQYIHACPQ7HMUqtzYE/fTnN8AvkQeXNbAqlNo5
+wt0ZtC2r8VdIfl/OY1qBHGf8cWX7ukv0nqkbmBz6A==
=HSde
-----END PGP SIGNATURE-----

--------------gYHr6Z1L8dY8JCyXyg5uCt7O--


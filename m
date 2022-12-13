Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4B64B02B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 08:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460205.718077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zL7-0002IF-Uk; Tue, 13 Dec 2022 07:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460205.718077; Tue, 13 Dec 2022 07:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4zL7-0002FZ-S1; Tue, 13 Dec 2022 07:04:33 +0000
Received: by outflank-mailman (input) for mailman id 460205;
 Tue, 13 Dec 2022 07:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4zL6-0002FS-KQ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 07:04:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 643ce687-7ab4-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 08:04:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0581D22848;
 Tue, 13 Dec 2022 07:04:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6B0B138EE;
 Tue, 13 Dec 2022 07:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EboAM/4jmGMUdgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 07:04:30 +0000
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
X-Inumbo-ID: 643ce687-7ab4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670915071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RJQjl74BRMZ8wxOF0MrXigOWJ6L/36Vamz8c5CDdI5c=;
	b=Rp7g4KCse1wfZrH8Gnv3IG8+l7LPZ9rjux+crwkK5nwuxftQSUa4zVLplhejL0c/ZoEjNR
	n8Ji9WmmuVIaxmeF2l6EM++g2vEIAbuzI/pshm1WeBsDunc28thn2y0dtaErCTkhIguGCE
	DSP2b65QxWaSB+gmK7K+Q5ypTsIJ3e8=
Message-ID: <627d04b2-895f-59b2-b5bc-5315ceacf015@suse.com>
Date: Tue, 13 Dec 2022 08:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
 <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
In-Reply-To: <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0QCAD15bJe9LFYQ6Fmck2as2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0QCAD15bJe9LFYQ6Fmck2as2
Content-Type: multipart/mixed; boundary="------------5gvzHhh8lZAgCldlaqPKOBr6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <627d04b2-895f-59b2-b5bc-5315ceacf015@suse.com>
Subject: Re: [PATCH 11/20] tools/xenstore: move changed domain handling
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-12-jgross@suse.com>
 <6bad7b3c-eaa2-d342-a7f2-d265bdefd54a@xen.org>
 <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>
In-Reply-To: <e2aa2c60-5d4f-06ca-153e-cdb422aa084d@suse.com>

--------------5gvzHhh8lZAgCldlaqPKOBr6
Content-Type: multipart/mixed; boundary="------------NQVabWaBqd4Dtu0ER1TgYGPt"

--------------NQVabWaBqd4Dtu0ER1TgYGPt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjIgMDc6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAxLjEyLjIy
IDIyOjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBKdWVyZ2VuLA0KPj4NCj4+IE9u
IDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gwqAgc3RhdGlj
IGJvb2wgY2hlY2tfaW5kZXhlcyhYRU5TVE9SRV9SSU5HX0lEWCBjb25zLCBYRU5TVE9SRV9S
SU5HX0lEWCBwcm9kKQ0KPj4+IEBAIC00OTIsOCArNTA0LDEyIEBAIHN0YXRpYyBzdHJ1Y3Qg
ZG9tYWluIA0KPj4+ICpmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbih1bnNpZ25lZCBp
bnQgZG9taWQpDQo+Pj4gwqDCoMKgwqDCoCB4Y19kb21pbmZvX3QgZG9taW5mbzsNCj4+PiDC
oMKgwqDCoMKgIGRvbWFpbiA9IGZpbmRfZG9tYWluX3N0cnVjdChkb21pZCk7DQo+Pj4gLcKg
wqDCoCBpZiAoIWRvbWFpbiAmJiBnZXRfZG9tYWluX2luZm8oZG9taWQsICZkb21pbmZvKSkN
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZG9tYWluID0gYWxsb2NfZG9tYWluKE5VTEwsIGRvbWlk
KTsNCj4+PiArwqDCoMKgIGlmICghZG9tYWluKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghZ2V0X2RvbWFpbl9pbmZvKGRvbWlkLCAmZG9taW5mbykpDQo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZXJybm8gPSBFTk9FTlQ7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UN
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW4gPSBhbGxvY19kb21haW4oTlVM
TCwgZG9taWQpOw0KPj4+ICvCoMKgwqAgfQ0KPj4NCj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCBo
b3cgdGhpcyBjaGFuZ2UgaXMgcmVsYXRlZCB0byB0aGlzIGNvbW1pdC4NCj4gDQo+IEl0IGlz
IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhlIGh1bmsgYmVsb3cuIFJldHVybmluZyBlcnJubyBp
bg0KPiBhY2NfYWRkX2RvbV9uYmVudHJ5KCkgcmVxdWlyZXMgaXQgdG8gYmUgc2V0IGNvcnJl
Y3RseSBpbg0KPiBmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbigpLg0KDQpXYWl0LCB0
aGF0IHdhcyBub25zZW5zZS4gVGhpcyBjaGFuZ2UgaXMgcHJvYmFibHkgYSBsZWZ0b3ZlciBv
ZiBhDQpwcmV2aW91cyB2ZXJzaW9uLiBXaWxsIHJlbW92ZSBpdC4NCg0KDQpKdWVyZ2VuDQo=

--------------NQVabWaBqd4Dtu0ER1TgYGPt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NQVabWaBqd4Dtu0ER1TgYGPt--

--------------5gvzHhh8lZAgCldlaqPKOBr6--

--------------0QCAD15bJe9LFYQ6Fmck2as2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOYI/4FAwAAAAAACgkQsN6d1ii/Ey9h
AQf/ew9ccdRP1XUNDwHG38pZLBD8DiwpiHVz8fwD7RvTchZWEdXtjz1ZudZY7RgW0omQW3qCl3h7
NYQFOsolTPRY2JCy8winAtestvmQDXPciGHm2NRJcMj6VX3vB6KCB7BCFhTazgxQtAolKrdOWJiE
6zb6GZOMnHYDk31ChZCBbbVpgNrjL0e9DJt8aVl75W6MCyZSz0jmOswoGq/GELWffdgxKp9ZX1w4
w1qroEqg4VfkvxbWkOsWNEuNuVgWbg7R4z7l8ZP3xoUHPFEdnEVX7nw84ReqEDENLuOI5lDsu1s4
M1WYXMEuUGgYdSHB1x+avoOzlnGASyMqdSbrB4Z6sA==
=6hHN
-----END PGP SIGNATURE-----

--------------0QCAD15bJe9LFYQ6Fmck2as2--


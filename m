Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C0E7423D9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556747.869483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEok2-0003ou-3b; Thu, 29 Jun 2023 10:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556747.869483; Thu, 29 Jun 2023 10:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEok2-0003la-0b; Thu, 29 Jun 2023 10:19:10 +0000
Received: by outflank-mailman (input) for mailman id 556747;
 Thu, 29 Jun 2023 10:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEok0-0003lU-9r
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:19:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60906b10-1666-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 12:19:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F8611F8AA;
 Thu, 29 Jun 2023 10:19:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4249D13905;
 Thu, 29 Jun 2023 10:19:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BRKqDplanWQsGAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 10:19:05 +0000
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
X-Inumbo-ID: 60906b10-1666-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nxdhVA354rJMJzwqE/v5/f0J4sK6BbhWPHY4M2TdX0c=;
	b=KOWkYHisgtsbI1VDcQhDgY9iEHK8Ys/E7JgqkTmC3iJhdBjcE2eY+htJ91e+LVwnj2OshG
	zNOZtK2JM2jPSMXk/o+/Ooz2ZWOo37EaYH1lckYiNDyFvQKlj4DECaFqz//QQIau2zs1Sx
	vZXaQnAMz399iDJF/0mL5AOmWONXDYY=
Message-ID: <ca30b1f2-d190-5772-e326-35e34abc7643@suse.com>
Date: Thu, 29 Jun 2023 12:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-8-jgross@suse.com>
 <77a0b256-ce9f-ee19-66e5-e2b3f60656c4@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <77a0b256-ce9f-ee19-66e5-e2b3f60656c4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UsQs1tzUQxIyqASW6HBRKvUF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UsQs1tzUQxIyqASW6HBRKvUF
Content-Type: multipart/mixed; boundary="------------XGx1qUy5TrZmYA1GVt2Xd1Dp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ca30b1f2-d190-5772-e326-35e34abc7643@suse.com>
Subject: Re: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-8-jgross@suse.com>
 <77a0b256-ce9f-ee19-66e5-e2b3f60656c4@xen.org>
In-Reply-To: <77a0b256-ce9f-ee19-66e5-e2b3f60656c4@xen.org>

--------------XGx1qUy5TrZmYA1GVt2Xd1Dp
Content-Type: multipart/mixed; boundary="------------3uH1p0r3nr0d6iEk3loROsZ3"

--------------3uH1p0r3nr0d6iEk3loROsZ3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTQ6MjgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBB
ZGQgYSB3cmFwcGVyIGZ1bmN0aW9uIGZvciB0ZGJfZmV0Y2ggdGFraW5nIHRoZSBuYW1lIG9m
IHRoZSBub2RlIGluDQo+PiB0aGUgZGF0YSBiYXNlIGFzIGEgcGFyYW1ldGVyLiBMZXQgaXQg
cmV0dXJuIGEgZGF0YSBwb2ludGVyIGFuZCB0aGUNCj4+IGxlbmd0aCBvZiB0aGUgZGF0YSB2
aWEgYSBsZW5ndGggcG9pbnRlciBwcm92aWRlZCBhcyBhZGRpdGlvbmFsDQo+PiBwYXJhbWV0
ZXIuDQo+Pg0KPj4gVGhpcyBlbmFibGVzIHRvIG1ha2Ugc2V0X3RkYl9rZXkoKSBzdGF0aWMg
YWdhaW4uDQo+Pg0KPj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byByZXBsYWNlIFREQiB3
aXRoIGEgbW9yZSBzaW1wbGUgZGF0YSBzdG9yYWdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gwqAgdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqDCoMKgwqDCoMKgIHwgNTUgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3Jl
LmjCoMKgwqDCoMKgwqDCoCB8wqAgMyArLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX3RyYW5zYWN0aW9uLmMgfCAzNCArKysrKysrKy0tLS0tLS0tDQo+PiDCoCAzIGZpbGVz
IGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIGIvdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gaW5kZXggNTIyYjJiYmY1Zi4uMTJjNTg0ZjA5
YiAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+
ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IEBAIC04NSw3ICs4
NSw3IEBAIGJvb2wga2VlcF9vcnBoYW5zID0gZmFsc2U7DQo+PiDCoCBzdGF0aWMgaW50IHJl
b3Blbl9sb2dfcGlwZVsyXTsNCj4+IMKgIHN0YXRpYyBpbnQgcmVvcGVuX2xvZ19waXBlMF9w
b2xsZmRfaWR4ID0gLTE7DQo+PiDCoCBjaGFyICp0cmFjZWZpbGUgPSBOVUxMOw0KPj4gLVRE
Ql9DT05URVhUICp0ZGJfY3R4ID0gTlVMTDsNCj4+ICtzdGF0aWMgVERCX0NPTlRFWFQgKnRk
Yl9jdHggPSBOVUxMOw0KPiANCj4gSW4gdGhlIGNvbW1pdCBtZXNzYWdlLCB5b3UgZXhwbGFp
biB3aHkgc2V0X3RkYl9rZXkoKSBpcyBub3cgc3RhdGljIGJ1dCBub3QgdGhpcyANCj4gb25l
Lg0KDQpJJ2xsIGFkZCBpdC4NCg0KPiANCj4+IMKgIHVuc2lnbmVkIGludCB0cmFjZV9mbGFn
cyA9IFRSQUNFX09CSiB8IFRSQUNFX0lPOw0KPj4gwqAgc3RhdGljIGNvbnN0IGNoYXIgKnNv
Y2ttc2dfc3RyaW5nKGVudW0geHNkX3NvY2ttc2dfdHlwZSB0eXBlKTsNCj4+IEBAIC01NTYs
NyArNTU2LDcgQEAgc3RhdGljIHZvaWQgaW5pdGlhbGl6ZV9mZHMoaW50ICpwX3NvY2tfcG9s
bGZkX2lkeCwgaW50IA0KPj4gKnB0aW1lb3V0KQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCB9
DQo+PiAtdm9pZCBzZXRfdGRiX2tleShjb25zdCBjaGFyICpuYW1lLCBUREJfREFUQSAqa2V5
KQ0KPj4gK3N0YXRpYyB2b2lkIHNldF90ZGJfa2V5KGNvbnN0IGNoYXIgKm5hbWUsIFREQl9E
QVRBICprZXkpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqAg
KiBEcm9wcGluZyBjb25zdCBpcyBmaW5lIGhlcmUsIGFzIHRoZSBrZXkgd2lsbCBuZXZlciBi
ZSBtb2RpZmllZA0KPj4gQEAgLTU2NiwyNSArNTY2LDM5IEBAIHZvaWQgc2V0X3RkYl9rZXko
Y29uc3QgY2hhciAqbmFtZSwgVERCX0RBVEEgKmtleSkNCj4+IMKgwqDCoMKgwqAga2V5LT5k
c2l6ZSA9IHN0cmxlbihuYW1lKTsNCj4+IMKgIH0NCj4+ICt2b2lkICpkYl9mZXRjaChjb25z
dCBjaGFyICpkYl9uYW1lLCBzaXplX3QgKnNpemUpDQo+PiArew0KPj4gK8KgwqDCoCBUREJf
REFUQSBrZXksIGRhdGE7DQo+PiArDQo+PiArwqDCoMKgIHNldF90ZGJfa2V5KGRiX25hbWUs
ICZrZXkpOw0KPj4gK8KgwqDCoCBkYXRhID0gdGRiX2ZldGNoKHRkYl9jdHgsIGtleSk7DQo+
PiArwqDCoMKgIGlmICghZGF0YS5kcHRyKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGVycm5vID0g
KHRkYl9lcnJvcih0ZGJfY3R4KSA9PSBUREJfRVJSX05PRVhJU1QpID8gRU5PRU5UIDogRUlP
Ow0KPiANCj4gWGVuc3RvcmVkIGlzIHRlY2huaWNhbGx5IG5vdCAoeWV0PykgaW4gdGhlIHNj
b3BlIG9mIE1JU1JBLiBCdXQgSSB3b3VsZCBzYXkgd2UgDQo+IHN0aWxsIHdhbnQgdG8gc2V0
ICpzaXplIHRvIDAgaW4gdGhlIGVycm9yIHBhdGggKHRoaXMgd291bGQgYWRkcmVzcyBNSVNS
QSBydWxlIDkuMSkuDQoNCkZpbmUgd2l0aCBtZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------3uH1p0r3nr0d6iEk3loROsZ3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3uH1p0r3nr0d6iEk3loROsZ3--

--------------XGx1qUy5TrZmYA1GVt2Xd1Dp--

--------------UsQs1tzUQxIyqASW6HBRKvUF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdWpgFAwAAAAAACgkQsN6d1ii/Ey/9
aAf+I8qTPj7DT/g3HWpj4uhKdtpRe1nC8odYRP2pA6KTmyHaF9PnCXgwXWx0ImbqdGovWDCO2Smh
X5VMq2MhhCsQoN1dnd75RzJ5Iy3SQOmmQysOixQaF7tyxGWhJDpDdIOKCkPLuJfruMUI8zuE46VC
JhAAzsTIwin98RBsMkjiu/bu9tm5KGBxbu1/1eAtVab3buCoFTHs8N6BMxGJK0xkq9PRxHQHcpbm
Y6zBwkUe55d6JQmiLBU7Gqbwhdy2ulUixvpxXOyRohMhSocdYGHW+RMmV8kOaLu2qd2VHe8twmPi
0jE5ZAhRvMVLo2zdEcQwW37D2jdQ84yQ9xXKoLfHyA==
=1OUu
-----END PGP SIGNATURE-----

--------------UsQs1tzUQxIyqASW6HBRKvUF--


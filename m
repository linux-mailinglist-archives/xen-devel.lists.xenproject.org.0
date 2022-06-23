Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0645578B0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354837.582156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4L0x-0001J9-NL; Thu, 23 Jun 2022 11:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354837.582156; Thu, 23 Jun 2022 11:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4L0x-0001H3-KV; Thu, 23 Jun 2022 11:28:47 +0000
Received: by outflank-mailman (input) for mailman id 354837;
 Thu, 23 Jun 2022 11:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4L0w-0001Gu-50
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:28:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4096908-f2e7-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 13:28:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F19D1F994;
 Thu, 23 Jun 2022 11:28:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4127E13461;
 Thu, 23 Jun 2022 11:28:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dr6EDmxOtGLHZQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 11:28:44 +0000
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
X-Inumbo-ID: a4096908-f2e7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655983724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+00qCXe7hDN9wYDblsGuNcErdjw2EFhuqfdmI5V723k=;
	b=fargDTtVjAniKj7dw4Xco45nMsHOgRggTlqKOYTmRYr9hs4GMa5F9Yh8bTJ+HBMGg4Bv1O
	LhvRRbAM+YyFkLeV3uedpT/BNRnP7Co9+UKUdPubuNTicWxMKpkBEFMtfw54MC5x5VrYwq
	qUWPqr64VwY61Eby+Atr8xh/Z/GDWW0=
Message-ID: <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
Date: Thu, 23 Jun 2022 13:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220623112407.13604-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220623112407.13604-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s46Q8hVdPpF9cwpjVnblTuSM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s46Q8hVdPpF9cwpjVnblTuSM
Content-Type: multipart/mixed; boundary="------------rWlG0HTXLrMjiqSDd9wti2CU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
References: <20220623112407.13604-1-julien@xen.org>
In-Reply-To: <20220623112407.13604-1-julien@xen.org>

--------------rWlG0HTXLrMjiqSDd9wti2CU
Content-Type: multipart/mixed; boundary="------------cCFzKXoew5MRVpUlnABX4vlf"

--------------cCFzKXoew5MRVpUlnABX4vlf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDYuMjIgMTM6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IEF0IHRoZSBtb21lbnQsIGNvcnJ1
cHQoKSBpcyBuZWl0aGVyIGNoZWNraW5nIGZvciBhbGxvY2F0aW9uIGZhaWx1cmUNCj4gbm9y
IGZyZWVpbmcgdGhlIGFsbG9jYXRlZCBtZW1vcnkuDQo+IA0KPiBIYXJkZW4gdGhlIGNvZGUg
YnkgcHJpbnRpbmcgRU5PTUVNIGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxlZCBhbmQNCj4gZnJl
ZSAnc3RyJyBhZnRlciB0aGUgbGFzdCB1c2UuDQo+IA0KPiBUaGlzIGlzIG5vdCBjb25zaWRl
cmVkIHRvIGJlIGEgc2VjdXJpdHkgaXNzdWUgYmVjYXVzZSBjb3JydXB0KCkgc2hvdWxkDQo+
IG9ubHkgYmUgY2FsbGVkIHdoZW4gWGVuc3RvcmVkIHRoaW5rcyB0aGUgZGF0YWJhc2UgaXMg
Y29ycnVwdGVkLiBOb3RlDQo+IHRoYXQgdGhlIHRyaWdnZXIgKGkuZS4gYSBndWVzdCByZWxp
YWJseSBwcm92b2tpbmcgdGhlIGNhbGwpIHdvdWxkIGJlDQo+IGEgc2VjdXJpdHkgaXNzdWUu
DQo+IA0KPiBGaXhlczogMDZkMTc5NDNmMGNkICgiQWRkZWQgYSBiYXNpYyBpbnRlZ3JpdHkg
Y2hlY2tlciwgYW5kIHNvbWUgYmFzaWMgYWJpbGl0eSB0byByZWNvdmVyIGZyb20gc3RvcmUi
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0K
PiAtLS0NCj4gICB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIHwgNiArKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4gaW5kZXggZmE3MzNlNzE0ZTlhLi5i
NjI3OWJkZmUyMjkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9j
b3JlLmMNCj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPiBAQCAt
MjA2NSw3ICsyMDY1LDExIEBAIHZvaWQgY29ycnVwdChzdHJ1Y3QgY29ubmVjdGlvbiAqY29u
biwgY29uc3QgY2hhciAqZm10LCAuLi4pDQo+ICAgCXZhX2VuZChhcmdsaXN0KTsNCj4gICAN
Cj4gICAJbG9nKCJjb3JydXB0aW9uIGRldGVjdGVkIGJ5IGNvbm5lY3Rpb24gJWk6IGVyciAl
czogJXMiLA0KPiAtCSAgICBjb25uID8gKGludCljb25uLT5pZCA6IC0xLCBzdHJlcnJvcihz
YXZlZF9lcnJubyksIHN0cik7DQo+ICsJICAgIGNvbm4gPyAoaW50KWNvbm4tPmlkIDogLTEs
IHN0cmVycm9yKHNhdmVkX2Vycm5vKSwNCj4gKwkgICAgc3RyID8gc3RyIDogIkVOT01FTSIp
Ow0KPiArDQo+ICsJaWYgKHN0cikNCg0KTm8gbmVlZCBmb3IgdGhlICJpZiIuIHRhbGxvY19m
cmVlKCkgaGFuZGxlcyBOVUxMIHF1aXRlIGZpbmUuDQoNCj4gKwkJdGFsbG9jX2ZyZWUoc3Ry
KTsNCj4gICANCj4gICAJY2hlY2tfc3RvcmUoKTsNCj4gICB9DQoNCldpdGggYWJvdmUgZml4
ZWQ6DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------cCFzKXoew5MRVpUlnABX4vlf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cCFzKXoew5MRVpUlnABX4vlf--

--------------rWlG0HTXLrMjiqSDd9wti2CU--

--------------s46Q8hVdPpF9cwpjVnblTuSM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0TmsFAwAAAAAACgkQsN6d1ii/Ey8t
1Af/cxr70pVmTbfpxwIzK7j20HnG+4/8jRnPmhoXDXYBaYh/EwtekAh1fiiYN7TsBOZh4I9oFPXG
8fDjKfbE9b/EmMtMEKdqCR42z4jtaEpTqw949wDwyo/jicvdysaTCJ4Fv5YuQ9BOoyewdfu1Oz7O
a0aUqHThLf+mRaTjor6PwgwkK84FDgqtrnbhxIlK6q9aIeUqd1BYm02u7efwi7x4G1QN1YgDAknk
0L69HaXJHofA61Yqe4aF5bVXDsBBYDJU4yy2KohtCxB+UrpheT1+ETgbz5lv3p1kGTB2SMThSm/8
fHEK0jalM0wzViyrg6SieA5/JTWaJyCHtvSCeW5OWw==
=gJME
-----END PGP SIGNATURE-----

--------------s46Q8hVdPpF9cwpjVnblTuSM--


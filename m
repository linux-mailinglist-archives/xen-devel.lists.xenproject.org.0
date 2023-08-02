Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6C76C44B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 06:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574693.900210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR3pV-00028R-90; Wed, 02 Aug 2023 04:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574693.900210; Wed, 02 Aug 2023 04:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR3pV-00026B-65; Wed, 02 Aug 2023 04:51:25 +0000
Received: by outflank-mailman (input) for mailman id 574693;
 Wed, 02 Aug 2023 04:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuXe=DT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qR3pU-00025i-5Q
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 04:51:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 387eb699-30f0-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 06:51:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 408B021B73;
 Wed,  2 Aug 2023 04:51:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16FD413909;
 Wed,  2 Aug 2023 04:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PFgxBMfgyWRLVwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Aug 2023 04:51:19 +0000
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
X-Inumbo-ID: 387eb699-30f0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690951879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4PSGMwWbk4P8w7ztqk0CAWrzy5bIeDcfk2lLlw0U0s=;
	b=pp5SnA66a/BYX7FpEb6/kmCiTrCgeOCYAPnZfevFB8WCht6yu6g6xe1GIDnZoW32na+7xB
	Oo+a53wHHld8gjEp0y8K702oDF6mknzlWjkVyfTtAKBDw8iy3tBZiAzYmDR/qX9dltyyUC
	FLA4O6dr6L9Rxm3uTjXNDHW6Cw6mFFM=
Message-ID: <e40bcd91-a007-d72c-de8e-6db7ac00f0c4@suse.com>
Date: Wed, 2 Aug 2023 06:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 20/25] tools/xenstore: alloc new memory in
 domain_adjust_node_perms()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-21-jgross@suse.com>
 <eee34bcc-2937-4a1f-b326-4a21c9db2173@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <eee34bcc-2937-4a1f-b326-4a21c9db2173@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xXcQ60UYAMJuYm0d5bkISI2M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xXcQ60UYAMJuYm0d5bkISI2M
Content-Type: multipart/mixed; boundary="------------bNNvoBGTLP7dHvGY06PeJjGQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e40bcd91-a007-d72c-de8e-6db7ac00f0c4@suse.com>
Subject: Re: [PATCH v3 20/25] tools/xenstore: alloc new memory in
 domain_adjust_node_perms()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-21-jgross@suse.com>
 <eee34bcc-2937-4a1f-b326-4a21c9db2173@xen.org>
In-Reply-To: <eee34bcc-2937-4a1f-b326-4a21c9db2173@xen.org>

--------------bNNvoBGTLP7dHvGY06PeJjGQ
Content-Type: multipart/mixed; boundary="------------n5g42DvTrRRlpIu0JpklBvq3"

--------------n5g42DvTrRRlpIu0JpklBvq3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDguMjMgMjM6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biBvcmRlciB0byBhdm9pZCBtb2RpZnlpbmcgdGhlIG5vZGUgZGF0YSBpbiB0aGUgZGF0YSBi
YXNlIGluIGNhc2UgYQ0KPj4gZG9tYWluIGlzIGdvbmUsIGxldCBkb21haW5fYWRqdXN0X25v
ZGVfcGVybXMoKSBhbGxvY2F0ZSBuZXcgbWVtb3J5IGZvcg0KPj4gdGhlIHBlcm1pc3Npb25z
IGluIGNhc2UgdGhleSBuZWVkIHRvIGJlIG1vZGlmaWVkLiBBcyB0aGlzIHNob3VsZA0KPj4g
aGFwcGVuIG9ubHkgaW4gdmVyeSByYXJlIGNhc2VzLCBpdCBpcyBmaW5lIHRvIGRvIHRoaXMg
ZXZlbiB3aGVuIGhhdmluZw0KPj4gY29waWVkIHRoZSBub2RlIGRhdGEgYWxyZWFkeS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
PiAtLS0NCj4+IFYzOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqAgfCAxMCArKysrKy0tLS0tDQo+PiDCoCB0b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgfCAxOSArKysrKysrKysrKysrKystLS0t
DQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3Jl
LmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRleCA0MDRlY2Qw
YzYyLi5lYTNkMjBhMzcyIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0K
Pj4gQEAgLTc1MSw2ICs3NTEsMTEgQEAgc3RydWN0IG5vZGUgKnJlYWRfbm9kZShzdHJ1Y3Qg
Y29ubmVjdGlvbiAqY29ubiwgY29uc3QgDQo+PiB2b2lkICpjdHgsDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBlcnJvcjsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCAvKiBE
YXRhIGlzIGJpbmFyeSBibG9iICh1c3VhbGx5IGFzY2lpLCBubyBudWwpLiAqLw0KPj4gK8Kg
wqDCoCBub2RlLT5kYXRhID0gbm9kZS0+cGVybXMgKyBoZHItPm51bV9wZXJtczsNCj4+ICvC
oMKgwqAgLyogQ2hpbGRyZW4gaXMgc3RyaW5ncywgbnVsIHNlcGFyYXRlZC4gKi8NCj4+ICvC
oMKgwqAgbm9kZS0+Y2hpbGRyZW4gPSBub2RlLT5kYXRhICsgbm9kZS0+aGRyLmRhdGFsZW47
DQo+PiArDQo+IA0KPiBJdCB0b29rIG1lIGEgd2hpbGUgdG8gdW5kZXJzdGFuZCB3aHkgeW91
IG1vdmUgdGhlIGxpbmVzIGFib3ZlLiBJIHRpaG5rIGl0IHdvdWxkIA0KPiBiZSB3b3J0aCBk
b2N1bWVudGluZyBpbiB0aGUgY29kZSAocG9zc2libHkgb24gdG9wIG9mIHRoZSBkZWNsYXJh
dGlvbiANCj4gZG9tYWluX2FkanVzdF9ub2RlX3Blcm1zKCkpIHRoYXQgZG9tYWluX2FkanVz
dF9ub2RlX3Blcm1zKCkgbWF5IHJlLWFsbG9jYXRlIHRoZSANCj4gcGVybWlzc2lvbnMuDQoN
Ck9rYXkuDQoNCj4gDQo+PiDCoMKgwqDCoMKgIGlmIChkb21haW5fYWRqdXN0X25vZGVfcGVy
bXMobm9kZSkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsNCj4+IEBAIC03
NTgsMTEgKzc2Myw2IEBAIHN0cnVjdCBub2RlICpyZWFkX25vZGUoc3RydWN0IGNvbm5lY3Rp
b24gKmNvbm4sIGNvbnN0IA0KPj4gdm9pZCAqY3R4LA0KPj4gwqDCoMKgwqDCoCBpZiAobm9k
ZS0+YWNjLmRvbWlkICE9IGdldF9ub2RlX293bmVyKG5vZGUpKQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIG5vZGUtPmFjYy5tZW1vcnkgPSAwOw0KPj4gLcKgwqDCoCAvKiBEYXRhIGlzIGJp
bmFyeSBibG9iICh1c3VhbGx5IGFzY2lpLCBubyBudWwpLiAqLw0KPj4gLcKgwqDCoCBub2Rl
LT5kYXRhID0gbm9kZS0+cGVybXMgKyBoZHItPm51bV9wZXJtczsNCj4+IC3CoMKgwqAgLyog
Q2hpbGRyZW4gaXMgc3RyaW5ncywgbnVsIHNlcGFyYXRlZC4gKi8NCj4+IC3CoMKgwqAgbm9k
ZS0+Y2hpbGRyZW4gPSBub2RlLT5kYXRhICsgbm9kZS0+aGRyLmRhdGFsZW47DQo+PiAtDQo+
PiDCoMKgwqDCoMKgIGlmIChhY2Nlc3Nfbm9kZShjb25uLCBub2RlLCBOT0RFX0FDQ0VTU19S
RUFELCBOVUxMKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yOw0KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyANCj4+IGIvdG9v
bHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+PiBpbmRleCBmZGYxMDk1YWNiLi5j
ZGVmNmVmZWY0IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Rv
bWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCj4+
IEBAIC0xMzM0LDEzICsxMzM0LDI0IEBAIGludCBkb21haW5fYWxsb2NfcGVybXJlZnMoc3Ry
dWN0IG5vZGVfcGVybXMgKnBlcm1zKQ0KPj4gwqAgaW50IGRvbWFpbl9hZGp1c3Rfbm9kZV9w
ZXJtcyhzdHJ1Y3Qgbm9kZSAqbm9kZSkNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IGk7DQo+PiArwqDCoMKgIHN0cnVjdCB4c19wZXJtaXNzaW9ucyAqcGVybXMgPSBu
b2RlLT5wZXJtczsNCj4+ICvCoMKgwqAgYm9vbCBjb3BpZWQgPSBmYWxzZTsNCj4+IMKgwqDC
oMKgwqAgZm9yIChpID0gMTsgaSA8IG5vZGUtPmhkci5udW1fcGVybXM7IGkrKykgew0KPj4g
LcKgwqDCoMKgwqDCoMKgIGlmIChub2RlLT5wZXJtc1tpXS5wZXJtcyAmIFhTX1BFUk1fSUdO
T1JFKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmICgocGVybXNbaV0ucGVybXMgJiBYU19QRVJN
X0lHTk9SRSkgfHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoa19kb21haW5fZ2Vu
ZXJhdGlvbihwZXJtc1tpXS5pZCwgbm9kZS0+aGRyLmdlbmVyYXRpb24pKQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KCFjaGtfZG9tYWluX2dlbmVyYXRpb24obm9kZS0+cGVybXNbaV0uaWQsDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZS0+aGRyLmdlbmVy
YXRpb24pKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZS0+cGVybXNbaV0ucGVy
bXMgfD0gWFNfUEVSTV9JR05PUkU7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFj
b3BpZWQpIHsNCj4gDQo+IFRoaXMgd2FudHMgYSBjb21lbnQgZXhwbGFpbiB3aHkgeW91IG5l
ZWQgdG8gY29weSBpdC4NCg0KT2theS4NCg0KDQpKdWVyZ2VuDQo=
--------------n5g42DvTrRRlpIu0JpklBvq3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------n5g42DvTrRRlpIu0JpklBvq3--

--------------bNNvoBGTLP7dHvGY06PeJjGQ--

--------------xXcQ60UYAMJuYm0d5bkISI2M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTJ4MYFAwAAAAAACgkQsN6d1ii/Ey9d
rAf/QRNqqfEvhxbalOUwNxnFZ6G3YMDkovla43OEQ70WQNYjlGUEyG9u44CbtYh41nmELGUtoW85
6tg694PzGgo8uVnC3JGu4wyaEj7oG+aWmDhnhsSzXKx32JlKue/Y6XCdNcHWOvYMIQIYt8pAJRVf
25+5L7jgm8qbceRMc0FzZT2PYdbP4i3M2qIRNUjVIKPGJ9HTpjbTX7WYOv2EvmlGnAD+C/GIJ7BC
/2BjaNkZohs4EK40Yuxbb6txR44FmJD4aJ0TkCMp5MrTauGHH+88/UiGKYg8tbXzpjbU50MTVmUp
nhX431Vce5Qs2RRgaqkXCz7a2kNUb2AwCUz4j7OdIA==
=KVKY
-----END PGP SIGNATURE-----

--------------xXcQ60UYAMJuYm0d5bkISI2M--


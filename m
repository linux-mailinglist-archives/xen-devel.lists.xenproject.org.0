Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D66F5A59
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529267.823470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDk5-00042u-EI; Wed, 03 May 2023 14:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529267.823470; Wed, 03 May 2023 14:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDk5-0003zW-Am; Wed, 03 May 2023 14:46:05 +0000
Received: by outflank-mailman (input) for mailman id 529267;
 Wed, 03 May 2023 14:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puDk3-0003zE-GJ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:46:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39af8658-e9c1-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 16:46:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56BAB1FFDE;
 Wed,  3 May 2023 14:46:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 309871331F;
 Wed,  3 May 2023 14:46:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sh1wCqpzUmRFTgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 14:46:02 +0000
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
X-Inumbo-ID: 39af8658-e9c1-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683125162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFpmv1gGDLXU8PfERn9zZeyVEmZy5izRrOkIEEPjLEc=;
	b=A8EHRUb/mS9PCKrQruVCiAPVfIyydnOqbJETVV8gxX9LVMFDmXJ6yyUj0/axUeH5idSUET
	df5BJmNCxqTGW/CLOZYTz318HVQ4luzG74rdcZaHJSJXJYuGK31Cgs1wSmYf77bifHR6be
	EKR1Ox7tw9ZYih9yQYQmupPtfvy9vSg=
Message-ID: <fb4a9057-e13c-e890-caf6-1ba2abf3a850@suse.com>
Date: Wed, 3 May 2023 16:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 02/13] tools/xenstore: do some cleanup of hashtable.c
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-3-jgross@suse.com>
 <8d91f57b-41ed-2939-94e8-9f73f0d523a6@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8d91f57b-41ed-2939-94e8-9f73f0d523a6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EddWgL95A5UVdSL8zjLHahIL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EddWgL95A5UVdSL8zjLHahIL
Content-Type: multipart/mixed; boundary="------------LReBWUmikuryo4KQO0eBI0CF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <fb4a9057-e13c-e890-caf6-1ba2abf3a850@suse.com>
Subject: Re: [PATCH v2 02/13] tools/xenstore: do some cleanup of hashtable.c
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-3-jgross@suse.com>
 <8d91f57b-41ed-2939-94e8-9f73f0d523a6@xen.org>
In-Reply-To: <8d91f57b-41ed-2939-94e8-9f73f0d523a6@xen.org>

--------------LReBWUmikuryo4KQO0eBI0CF
Content-Type: multipart/mixed; boundary="------------76X27yqS6xh0zS29YlioB0ik"

--------------76X27yqS6xh0zS29YlioB0ik
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTQ6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzAzLzIwMjMgMDk6NTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBE
byB0aGUgZm9sbG93aW5nIGNsZWFudXBzOg0KPj4gLSBoYXNodGFibGVfY291bnQoKSBpc24n
dCB1c2VkIGF0IGFsbCwgc28gcmVtb3ZlIGl0DQo+PiAtIHJlcGxhY2UgcHJpbWVfdGFibGVf
bGVuZ3RoIGFuZCBtYXhfbG9hZF9mYWN0b3Igd2l0aCBtYWNyb3MNCj4+IC0gbWFrZSBoYXNo
KCkgc3RhdGljDQo+PiAtIGFkZCBhIGxvYWRsaW1pdCgpIGhlbHBlciBmdW5jdGlvbg0KPj4g
LSByZW1vdmUgdGhlIC8qKiovIGxpbmVzIGJldHdlZW4gZnVuY3Rpb25zDQo+PiAtIGRvIHNv
bWUgc3R5bGUgY29ycmVjdGlvbnMNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hh
c2h0YWJsZS5jIHwgNzEgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5oIHwgMTAgLS0tLS0tDQo+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS9oYXNodGFibGUuYyBiL3Rvb2xzL3hl
bnN0b3JlL2hhc2h0YWJsZS5jDQo+PiBpbmRleCAzZDQ0NjZiNTk3Li5jMWIxMTc0M2JiIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+ICsrKyBiL3Rv
b2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jDQo+PiBAQCAtNDAsMjIgKzQwLDI1IEBAIHN0YXRp
YyBjb25zdCB1bnNpZ25lZCBpbnQgcHJpbWVzW10gPSB7DQo+PiDCoCA1MDMzMTY1MywgMTAw
NjYzMzE5LCAyMDEzMjY2MTEsIDQwMjY1MzE4OSwNCj4+IMKgIDgwNTMwNjQ1NywgMTYxMDYx
Mjc0MQ0KPj4gwqAgfTsNCj4+IC1jb25zdCB1bnNpZ25lZCBpbnQgcHJpbWVfdGFibGVfbGVu
Z3RoID0gc2l6ZW9mKHByaW1lcykvc2l6ZW9mKHByaW1lc1swXSk7DQo+PiAtY29uc3QgdW5z
aWduZWQgaW50IG1heF9sb2FkX2ZhY3RvciA9IDY1OyAvKiBwZXJjZW50YWdlICovDQo+PiAt
LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqLw0KPj4gLS8qIGluZGV4Rm9yICovDQo+PiAtc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBpbnQNCj4+IC1pbmRleEZvcih1bnNpZ25lZCBpbnQgdGFi
bGVsZW5ndGgsIHVuc2lnbmVkIGludCBoYXNodmFsdWUpIHsNCj4+ICsjZGVmaW5lIFBSSU1F
X1RBQkxFX0xFTsKgwqAgQVJSQVlfU0laRShwcmltZXMpDQo+PiArI2RlZmluZSBNQVhfTE9B
RF9QRVJDRU5UwqAgNjUNCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBp
bmRleEZvcih1bnNpZ25lZCBpbnQgdGFibGVsZW5ndGgsDQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgaGFzaHZhbHVlKQ0KPj4gK3sNCj4+IMKgwqDCoMKgwqAgcmV0dXJu
IChoYXNodmFsdWUgJSB0YWJsZWxlbmd0aCk7DQo+PiDCoCB9DQo+PiAtLyoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLw0KPj4gLXN0cnVjdCBoYXNodGFibGUgKg0KPj4gLWNyZWF0ZV9oYXNo
dGFibGUoY29uc3Qgdm9pZCAqY3R4LCB1bnNpZ25lZCBpbnQgbWluc2l6ZSwNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgKCpoYXNoZikgKGNv
bnN0IHZvaWQgKiksDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ICgqZXFmKSAoY29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICopLA0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncykNCj4+ICtzdGF0aWMg
dW5zaWduZWQgaW50IGxvYWRsaW1pdCh1bnNpZ25lZCBpbnQgcGluZGV4KQ0KPj4gK3sNCj4+
ICvCoMKgwqAgcmV0dXJuICgodWludDY0X3QpcHJpbWVzW3BpbmRleF0gKiBNQVhfTE9BRF9Q
RVJDRU5UKSAvIDEwMDsNCj4+ICt9DQo+PiArDQo+PiArc3RydWN0IGhhc2h0YWJsZSAqY3Jl
YXRlX2hhc2h0YWJsZShjb25zdCB2b2lkICpjdHgsIHVuc2lnbmVkIGludCBtaW5zaXplLA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCAoKmhhc2hmKSAoY29uc3Qgdm9pZCAq
KSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgKCplcWYpIChjb25zdCB2b2lkICosIGNvbnN0
IHZvaWQgKiksDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPj4g
wqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaGFzaHRhYmxlICpoOw0KPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgcGluZGV4LCBzaXplID0gcHJpbWVzWzBdOw0KPj4gQEAgLTY0LDcg
KzY3LDcgQEAgY3JlYXRlX2hhc2h0YWJsZShjb25zdCB2b2lkICpjdHgsIHVuc2lnbmVkIGlu
dCBtaW5zaXplLA0KPj4gwqDCoMKgwqDCoCBpZiAobWluc2l6ZSA+ICgxdSA8PCAzMCkpIHJl
dHVybiBOVUxMOw0KPj4gwqDCoMKgwqDCoCAvKiBFbmZvcmNlIHNpemUgYXMgcHJpbWUgKi8N
Cj4+IC3CoMKgwqAgZm9yIChwaW5kZXg9MDsgcGluZGV4IDwgcHJpbWVfdGFibGVfbGVuZ3Ro
OyBwaW5kZXgrKykgew0KPj4gK8KgwqDCoCBmb3IgKHBpbmRleD0wOyBwaW5kZXggPCBQUklN
RV9UQUJMRV9MRU47IHBpbmRleCsrKSB7DQo+IA0KPiBBcyB5b3UgZml4IHRoZSBzdHlsZSwg
aG93IGFib3V0IGFkZGluZyBhIHNwYWNlIGJlZm9yZS9hZnRlciAnPScgYW5kLi4uDQo+IA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwcmltZXNbcGluZGV4XSA+IG1pbnNpemUpIHsg
c2l6ZSA9IHByaW1lc1twaW5kZXhdOyBicmVhazsgfQ0KPiANCj4gLi4uIGJyZWFrIHRoaXMg
bGluZSBpbiBtdWx0aXBsZSBvbmVzPw0KDQpXaWxsIGRvIGJvdGguDQoNCj4gDQo+IFdpdGgg
b3Igd2l0aG91dCB0aGlzIGluY2x1ZGVkIGhlcmU6DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4N
Cg0K
--------------76X27yqS6xh0zS29YlioB0ik
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------76X27yqS6xh0zS29YlioB0ik--

--------------LReBWUmikuryo4KQO0eBI0CF--

--------------EddWgL95A5UVdSL8zjLHahIL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSc6kFAwAAAAAACgkQsN6d1ii/Ey8y
XwgAiROwk8wPAlouLo9qg3I+G4Ngy2oBDrZfkY6SftKQQRARuizeHq6dCNwpDVX8CAG7Gom9Nh9e
KW9pOhXSjJl7G48PcKoncRh2X64K4x4VknU5PCIRCaHurTD3m7jvDu+z9zHgSh52iOcZ0PTs3NeN
Z9VdeIXziC9yvMHn9Fpnnp4LGZUty9xBTJ8cjwFqnRIiprFgdDYxDgDxhvAbQYO+/1BkZay1Z1/e
uo6sIcVoro4KEF0jWuEcffwsT7BIT78dZKsPcHZt93zgXuj4G9teQpkF3PapVa1cu5ukw3oXf1ai
mmokGMrCQwJ1Pr2V3b4Cs+WaCt2P+z5tRNRqM6IPHw==
=lYd0
-----END PGP SIGNATURE-----

--------------EddWgL95A5UVdSL8zjLHahIL--


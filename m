Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9F7423FB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556775.869534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEosI-0007cO-0x; Thu, 29 Jun 2023 10:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556775.869534; Thu, 29 Jun 2023 10:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEosH-0007af-Se; Thu, 29 Jun 2023 10:27:41 +0000
Received: by outflank-mailman (input) for mailman id 556775;
 Thu, 29 Jun 2023 10:27:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEosG-0007aD-BT
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:27:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91b318a0-1667-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 12:27:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9092B2187E;
 Thu, 29 Jun 2023 10:27:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6364D139FF;
 Thu, 29 Jun 2023 10:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dgy6FplcnWQlHAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 10:27:37 +0000
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
X-Inumbo-ID: 91b318a0-1667-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688034457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=My9BrPYbPnXCs5lCRE3H9zHAZ7fJY0RT0q3HjkmYtKs=;
	b=FV6AJArSC0fZmn9U3wCnph+PD0yreDzFgycsMgvXFyKs8zsnIKDWDPmzzlwAl1kqkoEalQ
	zjhYRamqdj4veNll5L8SsLde9isw+GdcZWSBNeoyZE9wq8a+bvpZEW4EeKa7pdQJcT/IXA
	6hMpWUwO/FQf8by8ggh9JQqVmd9wAik=
Message-ID: <22bdc750-6aab-7f8e-d1e8-2d9ecbedc894@suse.com>
Date: Thu, 29 Jun 2023 12:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 09/11] tools/xenstore: add hashtable_replace() function
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-10-jgross@suse.com>
 <95c4f593-a619-b6c3-6268-4db32c514cd5@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <95c4f593-a619-b6c3-6268-4db32c514cd5@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0le3EjrzohjZY0RVvrYeF054"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0le3EjrzohjZY0RVvrYeF054
Content-Type: multipart/mixed; boundary="------------eWGoX90jj7rGWhCBwPtC3NOE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <22bdc750-6aab-7f8e-d1e8-2d9ecbedc894@suse.com>
Subject: Re: [PATCH 09/11] tools/xenstore: add hashtable_replace() function
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-10-jgross@suse.com>
 <95c4f593-a619-b6c3-6268-4db32c514cd5@xen.org>
In-Reply-To: <95c4f593-a619-b6c3-6268-4db32c514cd5@xen.org>

--------------eWGoX90jj7rGWhCBwPtC3NOE
Content-Type: multipart/mixed; boundary="------------NJlVRUMydtd2cR1vy4fLF98v"

--------------NJlVRUMydtd2cR1vy4fLF98v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTQ6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBG
b3IgYW4gZWZmZWN0aXZlIHdheSB0byByZXBsYWNlIGEgaGFzaHRhYmxlIGVudHJ5IGFkZCBh
IG5ldyBmdW5jdGlvbg0KPj4gaGFzaHRhYmxlX3JlcGxhY2UoKS4NCj4+DQo+PiBXaGlsZSBh
dCBpdCBsZXQgaGFzaHRhYmxlX2FkZCgpIGZhaWwgaWYgYW4gZW50cnkgd2l0aCB0aGUgc3Bl
Y2lmaWVkDQo+PiBrZXkgZG9lcyBhbHJlYWR5IGV4aXN0Lg0KPiANCj4gUGxlYXNlIGV4cGxh
aW4gd2h5IHlvdSB3YW50IHRvIGRvIGl0LiBJIGFsc28gdGhpbmsgdGhpcyBjaGFuZ2Ugc2hv
dWxkIGJlIGluIGl0cyANCj4gb3duIHBhdGNoLg0KDQpPa2F5IHRvIGJvdGguDQoNCj4gDQo+
Pg0KPj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byByZXBsYWNlIFREQiB3aXRoIGEgbW9y
ZSBzaW1wbGUgZGF0YSBzdG9yYWdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUv
aGFzaHRhYmxlLmMgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmggfCAxNiArKysrKysrKysrKysN
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL2hhc2h0YWJsZS5jIGIv
dG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+IGluZGV4IDlkYWRkZDk3ODIuLmYzNThi
ZWM1YWUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS9oYXNodGFibGUuYw0KPj4g
KysrIGIvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+IEBAIC0xNDEsMTEgKzE0MSwz
MiBAQCBzdGF0aWMgaW50IGhhc2h0YWJsZV9leHBhbmQoc3RydWN0IGhhc2h0YWJsZSAqaCkN
Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+PiArc3RhdGljIHN0cnVjdCBl
bnRyeSAqaGFzaHRhYmxlX3NlYXJjaF9lbnRyeShjb25zdCBzdHJ1Y3QgaGFzaHRhYmxlICpo
LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3Qgdm9pZCAqaykNCj4+ICt7DQo+PiArwqDCoMKgIHN0cnVjdCBlbnRyeSAqZTsNCj4+
ICvCoMKgwqAgdW5zaWduZWQgaW50IGhhc2h2YWx1ZSwgaW5kZXg7DQo+PiArDQo+PiArwqDC
oMKgIGhhc2h2YWx1ZSA9IGhhc2goaCwgayk7DQo+PiArwqDCoMKgIGluZGV4ID0gaW5kZXhG
b3IoaC0+dGFibGVsZW5ndGgsaGFzaHZhbHVlKTsNCj4gDQo+IE1pc3Npbmcgc3BhY2UgYWZ0
ZXIgJywnLg0KDQpUaGFua3MgZm9yIG5vdGljaW5nLg0KDQo+IA0KPj4gK8KgwqDCoCBlID0g
aC0+dGFibGVbaW5kZXhdOw0KPj4gK8KgwqDCoCB3aGlsZSAoTlVMTCAhPSBlKQ0KPj4gK8Kg
wqDCoCB7DQo+IA0KPiBXaGlsZSB5b3UgYXJlIG1vdmluZyB0aGUgY29kZS4gSSB0aGluayB5
b3UgY2FuIHJlZHVjZSB0aGUgY29kZSBzaXplIHdpdGg6DQo+IA0KPiBmb3IgKCBlID0gaC0+
dGFibGVbaW5kZXhdOyBlICE9IE5VTEw7IGUgPSBlLT5uZXh0ICkNCj4gIMKgwqAgaWYgKC4u
Li4pDQoNCldpbGwgY2hhbmdlIGl0Lg0KDQo+IA0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIENo
ZWNrIGhhc2ggdmFsdWUgdG8gc2hvcnQgY2lyY3VpdCBoZWF2aWVyIGNvbXBhcmlzb24gKi8N
Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoKGhhc2h2YWx1ZSA9PSBlLT5oKSAmJiAoaC0+ZXFm
bihrLCBlLT5rKSkpIHJldHVybiBlOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGUgPSBlLT5uZXh0
Ow0KPj4gK8KgwqDCoCB9DQo+PiArwqDCoMKgIHJldHVybiBOVUxMOw0KPj4gK30NCj4+ICsN
Cj4+IMKgIGludCBoYXNodGFibGVfYWRkKHN0cnVjdCBoYXNodGFibGUgKmgsIGNvbnN0IHZv
aWQgKmssIHZvaWQgKnYpDQo+PiDCoCB7DQo+PiAtwqDCoMKgIC8qIFRoaXMgbWV0aG9kIGFs
bG93cyBkdXBsaWNhdGUga2V5cyAtIGJ1dCB0aGV5IHNob3VsZG4ndCBiZSB1c2VkICovDQo+
PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBpbmRleDsNCj4+IMKgwqDCoMKgwqAgc3RydWN0
IGVudHJ5ICplOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAoaGFzaHRhYmxlX3NlYXJjaF9lbnRy
eShoLCBrKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRUVYSVNUOw0KPj4gKw0KPj4g
wqDCoMKgwqDCoCBpZiAoKysoaC0+ZW50cnljb3VudCkgPiBoLT5sb2FkbGltaXQpDQo+PiDC
oMKgwqDCoMKgIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJZ25vcmUgdGhlIHJldHVy
biB2YWx1ZS4gSWYgZXhwYW5kIGZhaWxzLCB3ZSBzaG91bGQNCj4+IEBAIC0xNzYsMTcgKzE5
NywyOCBAQCBpbnQgaGFzaHRhYmxlX2FkZChzdHJ1Y3QgaGFzaHRhYmxlICpoLCBjb25zdCB2
b2lkICprLCANCj4+IHZvaWQgKnYpDQo+PiDCoCB2b2lkICpoYXNodGFibGVfc2VhcmNoKGNv
bnN0IHN0cnVjdCBoYXNodGFibGUgKmgsIGNvbnN0IHZvaWQgKmspDQo+PiDCoCB7DQo+PiDC
oMKgwqDCoMKgIHN0cnVjdCBlbnRyeSAqZTsNCj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IGhh
c2h2YWx1ZSwgaW5kZXg7DQo+PiAtwqDCoMKgIGhhc2h2YWx1ZSA9IGhhc2goaCxrKTsNCj4+
IC3CoMKgwqAgaW5kZXggPSBpbmRleEZvcihoLT50YWJsZWxlbmd0aCxoYXNodmFsdWUpOw0K
Pj4gLcKgwqDCoCBlID0gaC0+dGFibGVbaW5kZXhdOw0KPj4gLcKgwqDCoCB3aGlsZSAoTlVM
TCAhPSBlKQ0KPj4gKw0KPj4gK8KgwqDCoCBlID0gaGFzaHRhYmxlX3NlYXJjaF9lbnRyeSho
LCBrKTsNCj4+ICvCoMKgwqAgcmV0dXJuIGUgPyBlLT52IDogTlVMTDsNCj4+ICt9DQo+PiAr
DQo+PiAraW50IGhhc2h0YWJsZV9yZXBsYWNlKHN0cnVjdCBoYXNodGFibGUgKmgsIGNvbnN0
IHZvaWQgKmssIHZvaWQgKnYpDQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3QgZW50cnkgKmU7
DQo+PiArDQo+PiArwqDCoMKgIGUgPSBoYXNodGFibGVfc2VhcmNoX2VudHJ5KGgsIGspOw0K
Pj4gK8KgwqDCoCBpZiAoIWUpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVOT0VOVDsN
Cj4+ICsNCj4+ICvCoMKgwqAgaWYgKGgtPmZsYWdzICYgSEFTSFRBQkxFX0ZSRUVfVkFMVUUp
DQo+PiDCoMKgwqDCoMKgIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCAvKiBDaGVjayBoYXNoIHZh
bHVlIHRvIHNob3J0IGNpcmN1aXQgaGVhdmllciBjb21wYXJpc29uICovDQo+PiAtwqDCoMKg
wqDCoMKgwqAgaWYgKChoYXNodmFsdWUgPT0gZS0+aCkgJiYgKGgtPmVxZm4oaywgZS0+aykp
KSByZXR1cm4gZS0+djsNCj4+IC3CoMKgwqDCoMKgwqDCoCBlID0gZS0+bmV4dDsNCj4+ICvC
oMKgwqDCoMKgwqDCoCB0YWxsb2NfZnJlZShlLT52KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCB0
YWxsb2Nfc3RlYWwoZSwgdik7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqAgcmV0dXJu
IE5VTEw7DQo+PiArDQo+PiArwqDCoMKgIGUtPnYgPSB2Ow0KPj4gKw0KPiANCj4gQ29kaW5n
IHN0eWxlOiBBYm92ZSB5b3UgZG9uJ3QgYWRkIGEgbmV3bGluZSBiZWZvcmUgcmV0dXJuIGJ1
dCBoZXJlIHlvdSBkby4gSSANCj4gZG9uJ3QgcGFydGljdWxhcmx5IGNhcmUgd2hpY2ggb25l
IHlvdSB3YW50IHRvIHVzZSBpbiB4ZW5zdG9yZWQuIEJ1dCBjYW4geW91IGF0IA0KPiBsZWFz
dCBiZSBjb25zaXN0ZW50Pw0KDQpPa2F5Lg0KDQo+IA0KPj4gK8KgwqDCoCByZXR1cm4gMDsN
Cg0KDQpKdWVyZ2VuDQoNCg==
--------------NJlVRUMydtd2cR1vy4fLF98v
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------NJlVRUMydtd2cR1vy4fLF98v--

--------------eWGoX90jj7rGWhCBwPtC3NOE--

--------------0le3EjrzohjZY0RVvrYeF054
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSdXJgFAwAAAAAACgkQsN6d1ii/Ey/1
TQf+JSfHB1wSRco2FfiKR28qd8vjGTqOLOb9xGQaj4GmGOVY9xPAy4+3h9dJQwyxI+TjInexjN3A
nWL22x0vM2JKALYBmhN5NjYYgSSNqegSl8oCO1jN4b/ohX69o0sNUaEi/IQjah9/eCjL7A3V0KfC
BES9MZb9nw8S5SMRXKVs0rh+BZM5t28+/Sq5bYNDzmqkm2x0jZHxquU6GSX60Yq4ow+JVdyANqlY
skMxXBMzHEKTEvrE0VHx6S+qSxu5RdByFaeGhEJtC5XDMyapusBpHBgwCM68ClSnuXFX11Q0mle1
2/ixY4DaML9wgRHG1e9BITRjtF/USSc1HOqwcSTz+w==
=85TM
-----END PGP SIGNATURE-----

--------------0le3EjrzohjZY0RVvrYeF054--


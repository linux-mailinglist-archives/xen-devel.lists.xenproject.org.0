Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D469E44C1B2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 13:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224280.387501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkn98-0008Ec-E4; Wed, 10 Nov 2021 12:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224280.387501; Wed, 10 Nov 2021 12:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkn98-0008C8-B4; Wed, 10 Nov 2021 12:56:10 +0000
Received: by outflank-mailman (input) for mailman id 224280;
 Wed, 10 Nov 2021 12:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz66=P5=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1mkn96-0008C2-B4
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 12:56:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef1af74-4225-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 13:56:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B672921921;
 Wed, 10 Nov 2021 12:56:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A2B713C13;
 Wed, 10 Nov 2021 12:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W9DjHGHBi2F2DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Nov 2021 12:56:01 +0000
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
X-Inumbo-ID: 8ef1af74-4225-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1636548961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IbcrZNdGCCu9qg2Kk1Wawu7N5Sn+2bqvD1tsM0ThCa8=;
	b=JSS7iyXOYhcE2A+amQG8b/os01cMRf22I3bMpMimqyssfIzQK5gq73EgXyOBEth6APqFZX
	h+6QANyG5Vbpo+20BE+r66JYOsV3+8IVM3uuAWZbuqzvswBA/sABtNIdEMKrfF8KyD4jB8
	E2GX6cX+y423i8iTn5hjvokpJH9iLHE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1636548961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IbcrZNdGCCu9qg2Kk1Wawu7N5Sn+2bqvD1tsM0ThCa8=;
	b=bO+GELzAiQX+Aw4orrOC1ndtvb3iJCup5CUSgEtVCLg32h7dU1Y3X3CfeeD8tdJ9DZPj2U
	AK8OfsFfx+HO2EDw==
Message-ID: <91b6dafa-de34-d972-50bc-b401820b5ccb@suse.de>
Date: Wed, 10 Nov 2021 13:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap
 hook
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, sw0312.kim@samsung.com,
 oleksandr_andrushchenko@epam.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-4-tzimmermann@suse.de>
 <YYujGLFf+spiXMil@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YYujGLFf+spiXMil@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1un6YQuZTKE0bDSxqwf0DnRw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1un6YQuZTKE0bDSxqwf0DnRw
Content-Type: multipart/mixed; boundary="------------APu0kFdmYGIun6HoTLUqXH0N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, sw0312.kim@samsung.com,
 oleksandr_andrushchenko@epam.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <91b6dafa-de34-d972-50bc-b401820b5ccb@suse.de>
Subject: Re: [PATCH 3/3] drm: Update documentation and TODO of gem_prime_mmap
 hook
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-4-tzimmermann@suse.de>
 <YYujGLFf+spiXMil@phenom.ffwll.local>
In-Reply-To: <YYujGLFf+spiXMil@phenom.ffwll.local>

--------------APu0kFdmYGIun6HoTLUqXH0N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTEuMjEgdW0gMTE6NDYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBNb24sIE5vdiAwOCwgMjAyMSBhdCAxMToyODo0NkFNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IFRoZSBob29rIGdlbV9wcmltZV9tbWFwIGluIHN0cnVjdCBkcm1f
ZHJpdmVyIGlzIGRlcHJlY2F0ZWQuIERvY3VtZW50DQo+PiB0aGUgbmV3IHJlcXVpcmVtZW50
cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPg0KDQpUaGFua3MgYSBsb3QhDQoNCldpdGggdGhlIHJlbWFpbmlu
ZyBwYXRjaGVzIG1lcmdlZCwgYWxsIGRyaXZlcnMgd2lsbCBpbXBsZW1lbnQgDQpnZW1fcHJp
bWVfbW1hcCB2aWEgZHJtX2dlbV9wcmltZV9tbWFwKCkgYW5kIHVzZSB0aGUgR0VNIG9iamVj
dCdzIG1tYXAgDQpjYWxsYmFjayBmb3Igc3BlY2lmaWMgZGV0YWlscy4NCg0KVGhlIG5leHQg
c3RlcCB3b3VsZCBiZSB0byBtb3ZlIGFsbCBjdXN0b20gaW1wbGVtZW50YXRpb25zIG9mIA0K
ZmlsZV9vcGVyYXRpb25zLm1tYXAgaW50byB0aGUgR0VNIG9iamVjdCdzIG1tYXAgYW5kIGlt
cGxlbWVudCB0aGUgDQpmaWxlX29wZXJhdGlvbnMgY2FsbGJhY2sgd2l0aCBkcm1fbW1hcCgp
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gLS0tDQo+PiAgIERvY3VtZW50
YXRpb24vZ3B1L3RvZG8ucnN0IHwgMTEgLS0tLS0tLS0tLS0NCj4+ICAgaW5jbHVkZS9kcm0v
ZHJtX2Rydi5oICAgICAgfCAxMSArKysrKysrLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5y
c3QNCj4+IGluZGV4IDYwZDFkN2VlMDcxOS4uNjU5M2M0YzQwMDZlIDEwMDY0NA0KPj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
Z3B1L3RvZG8ucnN0DQo+PiBAQCAtMjY4LDE3ICsyNjgsNiBAQCBDb250YWN0OiBEYW5pZWwg
VmV0dGVyDQo+PiAgIA0KPj4gICBMZXZlbDogSW50ZXJtZWRpYXRlDQo+PiAgIA0KPj4gLUNs
ZWFuIHVwIG1tYXAgZm9yd2FyZGluZw0KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4gLQ0KPj4gLUEgbG90IG9mIGRyaXZlcnMgZm9yd2FyZCBnZW0gbW1hcCBjYWxscyB0byBk
bWEtYnVmIG1tYXAgZm9yIGltcG9ydGVkIGJ1ZmZlcnMuDQo+PiAtQW5kIGFsc28gYSBsb3Qg
b2YgdGhlbSBmb3J3YXJkIGRtYS1idWYgbW1hcCB0byB0aGUgZ2VtIG1tYXAgaW1wbGVtZW50
YXRpb25zLg0KPj4gLVRoZXJlJ3MgZHJtX2dlbV9wcmltZV9tbWFwKCkgZm9yIHRoaXMgbm93
LCBidXQgc3RpbGwgbmVlZHMgdG8gYmUgcm9sbGVkIG91dC4NCj4+IC0NCj4+IC1Db250YWN0
OiBEYW5pZWwgVmV0dGVyDQo+PiAtDQo+PiAtTGV2ZWw6IEludGVybWVkaWF0ZQ0KPj4gLQ0K
Pj4gICBHZW5lcmljIGZiZGV2IGRlZmlvIHN1cHBvcnQNCj4+ICAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9k
cnYuaCBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4gaW5kZXggMGNkOTU5NTNjZGY1Li5h
ODRlYjQwMjhlNWIgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmgNCj4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPj4gQEAgLTM0NSwxMSArMzQ1LDE0IEBA
IHN0cnVjdCBkcm1fZHJpdmVyIHsNCj4+ICAgCSAqIG1tYXAgaG9vayBmb3IgR0VNIGRyaXZl
cnMsIHVzZWQgdG8gaW1wbGVtZW50IGRtYS1idWYgbW1hcCBpbiB0aGUNCj4+ICAgCSAqIFBS
SU1FIGhlbHBlcnMuDQo+PiAgIAkgKg0KPj4gLQkgKiBGSVhNRTogVGhlcmUncyB3YXkgdG9v
IG11Y2ggZHVwbGljYXRpb24gZ29pbmcgb24gaGVyZSwgYW5kIGFsc28gbW92ZWQNCj4+IC0J
ICogdG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLg0KPj4gKwkgKiBUaGlzIGhvb2sgb25seSBl
eGlzdHMgZm9yIGhpc3RvcmljYWwgcmVhc29ucy4gRHJpdmVycyBtdXN0IHVzZQ0KPj4gKwkg
KiBkcm1fZ2VtX3ByaW1lX21tYXAoKSB0byBpbXBsZW1lbnQgaXQuDQo+PiArCSAqDQo+PiAr
CSAqIEZJWE1FOiBDb252ZXJ0IGFsbCBkcml2ZXJzIHRvIGltcGxlbWVudCBtbWFwIGluIHN0
cnVjdA0KPj4gKwkgKiAmZHJtX2dlbV9vYmplY3RfZnVuY3MgYW5kIGlubGluZSBkcm1fZ2Vt
X3ByaW1lX21tYXAoKSBpbnRvDQo+PiArCSAqIGl0cyBjYWxsZXJzLiBUaGlzIGhvb2sgc2hv
dWxkIGJlIHJlbW92ZWQgYWZ0ZXJ3YXJkcy4NCj4gDQo+IEkgdGhpbmsgYXQgbGVhc3QgaTkx
NSBoYXMgZGlmZmVyZW50IHNlbWFudGljcyBiZXR3ZWVuIGRtYS1idWYgbW1hcCBhbmQgZ2Vt
DQo+IG1tYXAgaW4gc29tZSBjYXNlcywgc28gdGhpcyBtaWdodCBiZSB0cmlja3kgdG8gYWNo
aWV2ZS4gQnV0IEkgdGhpbmsNCj4gZXZlcnl3aGVyZSBlbHNlIHRoaXMgc2hvdWxkIGJlIHNv
bGlkLg0KPiAtRGFuaWVsDQo+IA0KPj4gICAJICovDQo+PiAtCWludCAoKmdlbV9wcmltZV9t
bWFwKShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwNCj4+IC0JCQkJc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpOw0KPj4gKwlpbnQgKCpnZW1fcHJpbWVfbW1hcCkoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsNCj4+ICAg
DQo+PiAgIAkvKioNCj4+ICAgCSAqIEBkdW1iX2NyZWF0ZToNCj4+IC0tIA0KPj4gMi4zMy4x
DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------APu0kFdmYGIun6HoTLUqXH0N--

--------------1un6YQuZTKE0bDSxqwf0DnRw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGLwWAFAwAAAAAACgkQlh/E3EQov+CA
fBAAnt27HP1sslZ8zQ6FW7dhzL7+pCcCbrAWcp0h9im+1qFVDKWgYUEFnFGBrzAPC5YN+4Uqsvkc
QIgkdKhBqxx35e7fCeQV83msFRb1kL/Y6FmLDbR+0RfqEkWmP3Fo3HIfgf9yL0Mho/lGcN/NF+qp
YYXy9HdAm2wlzP8EEfEQfe2zEpWOCrM2QyJ3qIxMg6Qh/sbXjP3NftH5dZ9hlHF7l5CtzeP0IXhf
EwNzkB2bz4Tl0Vf9QhUHN3+w24jYd/4dEAk45LfTqgEQZHEhd37O4x30VntBGsMTUi+psrvX+1HC
tPraFA0ssZI97FAbU3DWYpf9ggRBD3A9W9drQ4xUbjVBCyBsFYo/1YW+hdJXbuyL1rM/wPXH4MQ8
iAiBd37Cgjrvj1OMeEVXUERO/ve2ILcT4XeiQHJTk8qGchaSAn+M+qIxVn3q+IIsRJRXnfQJap7Z
FGiwdC4g9BWDl8o4yoqDdq39ICvIu/27DEHhmVy3MnwlpEP0chUANtnm4842TazKhnXKHYe//G6/
uojiuyyW4FA5+UVoWz7dLEqsf2PYz2MEGKrNPGrmqOX9XAk0Pm2CjvgqL4qz5J1GCfwGPZbhWZ4E
ZzYoy6JTmq5DUUh7KdOfFXvBTT4YZligymd33irsEnpHUz1ivyK1zCb5T+fl3g3hNaDa2yVGdNoW
LyM=
=nP0D
-----END PGP SIGNATURE-----

--------------1un6YQuZTKE0bDSxqwf0DnRw--


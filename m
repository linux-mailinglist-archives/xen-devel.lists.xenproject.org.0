Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD65866A7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378599.611866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRGf-00047e-TM; Mon, 01 Aug 2022 08:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378599.611866; Mon, 01 Aug 2022 08:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRGf-00044E-Q9; Mon, 01 Aug 2022 08:59:17 +0000
Received: by outflank-mailman (input) for mailman id 378599;
 Mon, 01 Aug 2022 08:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oIRGd-000442-JP
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:59:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37987cbe-1178-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 10:59:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 677A14D711;
 Mon,  1 Aug 2022 08:59:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33DE413A72;
 Mon,  1 Aug 2022 08:59:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RvM7C+KV52LzOQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Aug 2022 08:59:14 +0000
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
X-Inumbo-ID: 37987cbe-1178-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659344354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6KNu2/zaNN6R5tznBsl2HAm+fRY/hvUL4HdC4polMjg=;
	b=dDSH+/WT3pv+bO9obgFKj62fRhaTAdAcznwR22cW6PxdZnQsGeGSR4wXRsLkAcwQ55gvpH
	RcK/Bjo8uP0BW23nC4drXZ/ngrgaJVs6u8vLadNSIMvfuZFt9Y695JgqmDC95RXolMytMp
	C5LYZXd2RiUz8hClTpGyVrUUxZso6Jc=
Message-ID: <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
Date: Mon, 1 Aug 2022 10:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
Content-Language: en-US
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220713150311.4152528-2-dmitry.semenets@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zPBOVyeWBYfM1tXlBYI0NhKk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zPBOVyeWBYfM1tXlBYI0NhKk
Content-Type: multipart/mixed; boundary="------------9cMj7DkBvzekzepH7EJvbQoG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
Message-ID: <124efe96-ed51-6312-75a8-1248724b619e@suse.com>
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com>
In-Reply-To: <20220713150311.4152528-2-dmitry.semenets@gmail.com>

--------------9cMj7DkBvzekzepH7EJvbQoG
Content-Type: multipart/mixed; boundary="------------0GsZOTEEXerrEqLM5FZHoiIE"

--------------0GsZOTEEXerrEqLM5FZHoiIE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDcuMjIgMTc6MDMsIGRtaXRyeS5zZW1lbmV0c0BnbWFpbC5jb20gd3JvdGU6DQo+
IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4gDQo+IEN1cnJlbnQgdmNoYW4gaW1wbGVtZW50YXRpb24sIHdoaWxl
IGRlYWxpbmcgd2l0aCBYZW5TdG9yZSBwYXRocywNCj4gYWxsb2NhdGVzIDY0IGJ5dGVzIGJ1
ZmZlciBvbiB0aGUgc3RhY2sgd2hpY2ggbWF5IG5vdCBiZSBlbm91Z2ggZm9yDQo+IHNvbWUg
dXNlLWNhc2VzLiBNYWtlIHRoZSBidWZmZXIgbG9uZ2VyIHRvIHJlc3BlY3QgbWF4aW11bSBh
bGxvd2VkDQo+IFhlblN0b3JlIHBhdGggb2YgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gU2VtZW5l
dHMgPGRteXRyb19zZW1lbmV0c0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvbGlicy92
Y2hhbi9pbml0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlicy92Y2hhbi9pbml0LmMgYi90b29scy9saWJzL3ZjaGFu
L2luaXQuYw0KPiBpbmRleCA5MTk1YmQzYjk4Li4zODY1OGYzMGFmIDEwMDY0NA0KPiAtLS0g
YS90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPiArKysgYi90b29scy9saWJzL3ZjaGFuL2lu
aXQuYw0KPiBAQCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRpYyBpbnQgaW5pdF94c19zcnYoc3Ry
dWN0IGxpYnhlbnZjaGFuICpjdHJsLCBpbnQgZG9tYWluLCBjb25zdCBjaGFyKiB4c19iYXNl
DQo+ICAgCWludCByZXQgPSAtMTsNCj4gICAJc3RydWN0IHhzX2hhbmRsZSAqeHM7DQo+ICAg
CXN0cnVjdCB4c19wZXJtaXNzaW9ucyBwZXJtc1syXTsNCj4gLQljaGFyIGJ1Zls2NF07DQo+
ICsJY2hhciAqYnVmOw0KPiAgIAljaGFyIHJlZlsxNl07DQo+ICAgCWNoYXIqIGRvbWlkX3N0
ciA9IE5VTEw7DQo+ICAgCXhzX3RyYW5zYWN0aW9uX3QgeHNfdHJhbnMgPSBYQlRfTlVMTDsN
Cj4gQEAgLTI1OSw2ICsyNTksMTIgQEAgc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3Qg
bGlieGVudmNoYW4gKmN0cmwsIGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UNCj4g
ICAJaWYgKCFjdHJsLT54c19wYXRoKQ0KPiAgIAkJcmV0dXJuIC0xOw0KPiAgIA0KPiArCWJ1
ZiA9IG1hbGxvYyhYRU5TVE9SRV9BQlNfUEFUSF9NQVgpOw0KPiArCWlmICghYnVmKSB7DQo+
ICsJCWZyZWUoY3RybCk7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKw0KPiAgIAl4cyA9
IHhzX29wZW4oMCk7DQo+ICAgCWlmICgheHMpDQo+ICAgCQlnb3RvIGZhaWw7DQo+IEBAIC0y
ODAsMTQgKzI4NiwxNCBAQCByZXRyeV90cmFuc2FjdGlvbjoNCj4gICAJCWdvdG8gZmFpbF94
c19vcGVuOw0KPiAgIA0KPiAgIAlzbnByaW50ZihyZWYsIHNpemVvZiByZWYsICIlZCIsIHJp
bmdfcmVmKTsNCj4gLQlzbnByaW50ZihidWYsIHNpemVvZiBidWYsICIlcy9yaW5nLXJlZiIs
IHhzX2Jhc2UpOw0KPiArCXNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAi
JXMvcmluZy1yZWYiLCB4c19iYXNlKTsNCj4gICAJaWYgKCF4c193cml0ZSh4cywgeHNfdHJh
bnMsIGJ1ZiwgcmVmLCBzdHJsZW4ocmVmKSkpDQo+ICAgCQlnb3RvIGZhaWxfeHNfb3BlbjsN
Cj4gICAJaWYgKCF4c19zZXRfcGVybWlzc2lvbnMoeHMsIHhzX3RyYW5zLCBidWYsIHBlcm1z
LCAyKSkNCj4gICAJCWdvdG8gZmFpbF94c19vcGVuOw0KPiAgIA0KPiAgIAlzbnByaW50Zihy
ZWYsIHNpemVvZiByZWYsICIlZCIsIGN0cmwtPmV2ZW50X3BvcnQpOw0KPiAtCXNucHJpbnRm
KGJ1Ziwgc2l6ZW9mIGJ1ZiwgIiVzL2V2ZW50LWNoYW5uZWwiLCB4c19iYXNlKTsNCj4gKwlz
bnByaW50ZihidWYsIFhFTlNUT1JFX0FCU19QQVRIX01BWCwgIiVzL2V2ZW50LWNoYW5uZWwi
LCB4c19iYXNlKTsNCj4gICAJaWYgKCF4c193cml0ZSh4cywgeHNfdHJhbnMsIGJ1ZiwgcmVm
LCBzdHJsZW4ocmVmKSkpDQo+ICAgCQlnb3RvIGZhaWxfeHNfb3BlbjsNCj4gICAJaWYgKCF4
c19zZXRfcGVybWlzc2lvbnMoeHMsIHhzX3RyYW5zLCBidWYsIHBlcm1zLCAyKSkNCj4gQEAg
LTMwMyw2ICszMDksNyBAQCByZXRyeV90cmFuc2FjdGlvbjoNCj4gICAJZnJlZShkb21pZF9z
dHIpOw0KPiAgIAl4c19jbG9zZSh4cyk7DQo+ICAgIGZhaWw6DQo+ICsJZnJlZShidWYpOw0K
PiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gQEAgLTQxOSwxMyArNDI2LDIwIEBA
IHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xpZW50X2luaXQoc3RydWN0IHhl
bnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgbGlieGVudmNo
YW4gKmN0cmwgPSBtYWxsb2Moc2l6ZW9mKHN0cnVjdCBsaWJ4ZW52Y2hhbikpOw0KPiAgIAlz
dHJ1Y3QgeHNfaGFuZGxlICp4cyA9IE5VTEw7DQo+IC0JY2hhciBidWZbNjRdOw0KPiArCWNo
YXIgKmJ1ZjsNCj4gICAJY2hhciAqcmVmOw0KPiAgIAlpbnQgcmluZ19yZWY7DQo+ICAgCXVu
c2lnbmVkIGludCBsZW47DQo+ICAgDQo+ICAgCWlmICghY3RybCkNCj4gICAJCXJldHVybiAw
Ow0KPiArDQo+ICsJYnVmID0gbWFsbG9jKFhFTlNUT1JFX0FCU19QQVRIX01BWCk7DQo+ICsJ
aWYgKCFidWYpIHsNCj4gKwkJZnJlZShjdHJsKTsNCj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0K
PiArDQo+ICAgCWN0cmwtPnJpbmcgPSBOVUxMOw0KPiAgIAljdHJsLT5ldmVudCA9IE5VTEw7
DQo+ICAgCWN0cmwtPmdudHRhYiA9IE5VTEw7DQo+IEBAIC00MzYsOCArNDUwLDkgQEAgc3Ry
dWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9v
bGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4gICAJaWYgKCF4cykNCj4gICAJCWdvdG8gZmFpbDsN
Cj4gICANCj4gKw0KPiAgIC8vIGZpbmQgeGVuc3RvcmUgZW50cnkNCj4gLQlzbnByaW50Zihi
dWYsIHNpemVvZiBidWYsICIlcy9yaW5nLXJlZiIsIHhzX3BhdGgpOw0KPiArCXNucHJpbnRm
KGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAiJXMvcmluZy1yZWYiLCB4c19wYXRoKTsN
Cj4gICAJcmVmID0geHNfcmVhZCh4cywgMCwgYnVmLCAmbGVuKTsNCj4gICAJaWYgKCFyZWYp
DQo+ICAgCQlnb3RvIGZhaWw7DQo+IEBAIC00NDUsNyArNDYwLDcgQEAgc3RydWN0IGxpYnhl
bnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dn
ZXIgKmxvZ2dlciwNCj4gICAJZnJlZShyZWYpOw0KPiAgIAlpZiAoIXJpbmdfcmVmKQ0KPiAg
IAkJZ290byBmYWlsOw0KPiAtCXNucHJpbnRmKGJ1Ziwgc2l6ZW9mIGJ1ZiwgIiVzL2V2ZW50
LWNoYW5uZWwiLCB4c19wYXRoKTsNCj4gKwlzbnByaW50ZihidWYsIFhFTlNUT1JFX0FCU19Q
QVRIX01BWCwgIiVzL2V2ZW50LWNoYW5uZWwiLCB4c19wYXRoKTsNCj4gICAJcmVmID0geHNf
cmVhZCh4cywgMCwgYnVmLCAmbGVuKTsNCj4gICAJaWYgKCFyZWYpDQo+ICAgCQlnb3RvIGZh
aWw7DQo+IEBAIC00NzUsNiArNDkwLDcgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52
Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4g
ICAgb3V0Og0KPiAgIAlpZiAoeHMpDQo+ICAgCQl4c19jbG9zZSh4cyk7DQo+ICsJZnJlZShi
dWYpOw0KPiAgIAlyZXR1cm4gY3RybDsNCj4gICAgZmFpbDoNCj4gICAJbGlieGVudmNoYW5f
Y2xvc2UoY3RybCk7DQoNCkkgdGhpbmsgeW91IGFyZSBsZWFraW5nIGJ1ZiBpbiBjYXNlIG9m
ICJnb3RvIGZhaWwiLg0KDQoNCkp1ZXJnZW4NCg==
--------------0GsZOTEEXerrEqLM5FZHoiIE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0GsZOTEEXerrEqLM5FZHoiIE--

--------------9cMj7DkBvzekzepH7EJvbQoG--

--------------zPBOVyeWBYfM1tXlBYI0NhKk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLnleEFAwAAAAAACgkQsN6d1ii/Ey+a
LQf/a4/ephMayyUZJP40pZpkBphgQ1V5UIW+ppxpX5EpXGzJtzhs3t/hj3L5V+Z5e529UA9fCheB
aSejKo8vmsNYIZlK6pMO0zFkCLFcQmt1B2pAmNSmvKe0TW0slyU7i3Vxab46cFTFWROuF6yzKq/m
Bmc1sxqb2e0xtmzEo5CbAdCbCcFzr0IaEfok+4lph5GZBUO5poO6zGOdadXXdMsWALGdvQWj7vue
gbj9r7D7lco+c878TRu6ODfbogkvBAeFmwaSDhNNwgQwcbrxdHV+Ji2sqGfN+g6sTu/YnNg9dZeN
yfoYaqEdKBxstipSRwl6XiXk+oYY0ly6pFjRqllg6g==
=0gSf
-----END PGP SIGNATURE-----

--------------zPBOVyeWBYfM1tXlBYI0NhKk--


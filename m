Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B61A11A99A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:04:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezlN-0006rj-6n; Wed, 11 Dec 2019 11:02:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iezlL-0006rd-Uk
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:02:35 +0000
X-Inumbo-ID: bc93ab6a-1c05-11ea-8afe-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc93ab6a-1c05-11ea-8afe-12813bfff9fa;
 Wed, 11 Dec 2019 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576062155; x=1607598155;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G1DwXXDW3fxKjZKLOPvvh4Xlu5ue4nZYYPH7PlSOwYo=;
 b=Xfis7zJ+0orW0LMrz9HtlNmts9wipTp6AxXclEPnZWnxsd9QwgE1AUfI
 ejDufGMoCynM8Mj4eq6fhBMGSiLpxscuV99k6z4SfoiA0VuLPp5YhLyGe
 nMxEOuQOZZSeplhjkP2Ifnw+HHs7o+RRUhUq+UxHwFZvtQd/NLao7dizv s=;
IronPort-SDR: HPsquihyZLjBB0+RuamZ/leOO2Z+l75N6a2vhnI1bgXbvTFTGeaPGh5hHtEHf50TH42rclkMim
 UZUuQ8fnJhrA==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="7149684"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 11 Dec 2019 11:02:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7270DA24B5; Wed, 11 Dec 2019 11:02:33 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:02:32 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:02:32 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 11:02:32 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v2 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVr21Mya/2xs4A+0SBttLhz9PjBqe0xhyA
Date: Wed, 11 Dec 2019 11:02:31 +0000
Message-ID: <552d4ec33cc5623999468e711c988854e7032941.camel@amazon.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
 <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
In-Reply-To: <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.120]
Content-ID: <7EB8C82571E9654DB29A57439E580F1D@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTEyLTEwIGF0IDE2OjIwICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMDkuMTIuMjAxOSAxMjo0OCwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYw0KPiA+IEBAIC01MTUxLDYg
KzUxNTEsNTEgQEAgbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZw0K
PiA+IHYpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVzaF9hcmVhX2xvY2FsKChj
b25zdCB2b2lkICopdiwgZikgOiBcDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVz
aF9hcmVhX2FsbCgoY29uc3Qgdm9pZCAqKXYsIGYpKQ0KPiA+ICANCj4gPiArLyogU2hhdHRlciBh
biBsMyBlbnRyeSBhbmQgcG9wdWxhdGUgbDIuIElmIHZpcnQgaXMgcGFzc2VkIGluLCBhbHNvDQo+
ID4gZG8gZmx1c2guICovDQo+ID4gK3N0YXRpYyBpbnQgc2hhdHRlcl9sM2UobDNfcGdlbnRyeV90
ICpwbDNlLCB1bnNpZ25lZCBsb25nIHZpcnQsDQo+ID4gYm9vbCBsb2NraW5nKQ0KPiA+ICt7DQo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiArICAgIGwzX3BnZW50cnlfdCBvbDNlOw0KPiA+
ICsgICAgbDJfcGdlbnRyeV90IG9sMmUsICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7DQo+
ID4gKw0KPiA+ICsgICAgaWYgKCBsMnQgPT0gTlVMTCApDQo+IA0KPiBOb3dhZGF5cyB3ZSBzZWVt
IHRvIHByZWZlciAhbDJ0IGluIGNhc2VzIGxpa2UgdGhpcyBvbmUuDQo+IA0KPiA+ICsgICAgICAg
IHJldHVybiAtMTsNCj4gDQo+IC1FTk9NRU0gcGxlYXNlIChhbmQgdGhlbiBoYW5kZWQgb24gYnkg
dGhlIGNhbGxlcikuDQo+IA0KPiA+ICsgICAgb2wzZSA9ICpwbDNlOw0KPiANCj4gVGhpcyBjb3Vs
ZCBiZSB0aGUgdmFyaWFibGUncyBpbml0aWFsaXplci4NCj4gDQo+ID4gKyAgICBvbDJlID0gbDJl
X2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRlKG9sM2UpKTsNCj4gDQo+IFRoZXJlJ3Mgbm90aGlu
ZyAib2xkIiBhYm91dCB0aGlzIEwyIGVudHJ5LCBzbyBpdHMgbmFtZSB3b3VsZCBiZXR0ZXINCj4g
YmUganVzdCAibDJlIiBJIHRoaW5rLg0KPiANCj4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgTDJf
UEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgbDJlX3dy
aXRlKGwydCArIGksIG9sMmUpOw0KPiA+ICsgICAgICAgIG9sMmUgPSBsMmVfZnJvbV9pbnRwdGUo
DQo+ID4gKyAgICAgICAgICAgICAgICBsMmVfZ2V0X2ludHB0ZShvbDJlKSArICgxIDw8IChQQUdF
VEFCTEVfT1JERVIgKw0KPiA+IFBBR0VfU0hJRlQpKSk7DQo+IA0KPiBJbmRlbnRhdGlvbiBsb29r
cyBvZGQgaGVyZSAoYWxzbyBmdXJ0aGVyIGRvd24pLiBJZiB0aGUgZmlyc3QgYXJndW1lbnQNCj4g
b2YgYSBmdW5jdGlvbiBjYWxsIGRvZXNuJ3QgZml0IG9uIHRoZSBsaW5lIGFuZCB3b3VsZCBhbHNv
IGJlIHVnbHkgdG8NCj4gc3BsaXQgYWNyb3NzIGxpbmVzLCB3aGF0IHdlIGRvIGlzIGluZGVudCBp
dCB0aGUgdXN1YWwgNCBjaGFyYWN0ZXJzDQo+IGZyb20gdGhlIGZ1bmN0aW9uIGludm9jYXRpb24s
IGkuZS4gaW4gdGhpcyBjYXNlDQo+IA0KPiAgICAgICAgIG9sMmUgPSBsMmVfZnJvbV9pbnRwdGUo
DQo+ICAgICAgICAgICAgICAgICAgICBsMmVfZ2V0X2ludHB0ZShvbDJlKSArICgxIDw8IChQQUdF
VEFCTEVfT1JERVIgKw0KPiBQQUdFX1NISUZUKSkpOw0KPiANCj4gYW5kIHRoZW4gc2xpZ2h0bHkg
c2hvcnRlcg0KPiANCj4gICAgICAgICBvbDJlID0gbDJlX2Zyb21faW50cHRlKA0KPiAgICAgICAg
ICAgICAgICAgICAgbDJlX2dldF9pbnRwdGUob2wyZSkgKyAoUEFHRV9TSVpFIDw8DQo+IFBBR0VU
QUJMRV9PUkRFUikpOw0KPiANCj4gT2YgY291cnNlLCBhcyBtZW50aW9uZWQgYmVmb3JlLCBJJ20g
bm90IG92ZXJseSBoYXBweSB0byBzZWUgdHlwZQ0KPiBzYWZldHkgbG9zdCBpbiBjYXNlIGxpa2Ug
dGhpcyBvbmUsIHdoZXJlIGl0J3Mgbm90IG5lZWRlZCBsaWtlIGUuZy4NCj4gZnVydGhlciB1cCB0
byBjb252ZXJ0IGZyb20gTDMgdG8gTDIgZW50cnkuDQo+IA0KPiA+ICsgICAgfQ0KPiA+ICsgICAg
aWYgKCBsb2NraW5nICkNCj4gPiArICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsN
Cj4gPiArICAgIGlmICggKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgJiYN
Cj4gPiArICAgICAgICAgKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSApDQo+ID4g
KyAgICB7DQo+ID4gKyAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLA0KPiA+ICsgICAgICAg
ICAgICAgICAgbDNlX2Zyb21fcGFkZHIoKHBhZGRyX3QpdmlydF90b19tYWRkcihsMnQpLA0KPiA+
IF9fUEFHRV9IWVBFUlZJU09SKSk7DQo+ID4gKyAgICAgICAgbDJ0ID0gTlVMTDsNCj4gPiArICAg
IH0NCj4gPiArICAgIGlmICggbG9ja2luZyApDQo+ID4gKyAgICAgICAgc3Bpbl91bmxvY2soJm1h
cF9wZ2Rpcl9sb2NrKTsNCj4gPiArICAgIGlmICggdmlydCApDQo+ID4gKyAgICB7DQo+ID4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzID0NCj4gPiArICAgICAgICAgICAgRkxVU0hf
VExCIHwgRkxVU0hfT1JERVIoMiAqIFBBR0VUQUJMRV9PUkRFUik7DQo+ID4gKw0KPiA+ICsgICAg
ICAgIGlmICggKGwzZV9nZXRfZmxhZ3Mob2wzZSkgJiBfUEFHRV9HTE9CQUwpICkNCj4gDQo+IFVu
bmVjZXNzYXJ5IHBhaXIgb2YgcGFyZW50aGVzZXMgKHdoaWNoIGFsc28gd2Fzbid0IHRoZXJlIGlu
IHRoZQ0KPiBvcmlnaW5hbCBjb2RlKS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICBmbHVzaF9m
bGFncyB8PSBGTFVTSF9UTEJfR0xPQkFMOw0KPiANCj4gVG9vIGRlZXAgaW5kZW50YXRpb24uDQo+
IA0KPiA+ICsgICAgICAgIGZsdXNoX2FyZWEodmlydCwgZmx1c2hfZmxhZ3MpOw0KPiA+ICsgICAg
fQ0KPiA+ICsgICAgaWYgKCBsMnQgKQ0KPiA+ICsgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShs
MnQpOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiBBbHNvIHBsZWFz
ZSBhZGQgYmxhbmsgbGluZXMgYmV0d2Vlbg0KPiAtIEwyIHBvcHVsYXRpb24gYW5kIGxvY2sgYWNx
dWlyZSwNCj4gLSBsb2NrIHJlbGVhc2UgYW5kIFRMQiBmbHVzaCwNCj4gLSBUTEIgZmx1c2ggYW5k
IGZyZWUuDQo+IA0KPiBKYW4NCg0KSXNzdWVzIGZpeGVkIGluIHYzLiBJIGhhdmUgbm90IHRvdWNo
ZWQgdGhlIHR5cGUgc2FmZXR5IHBhcnQuIElmIHdlDQp0aGluayB0aGlzIGlzIHJlYWxseSBpbXBv
cnRhbnQgd2UgY2FuIHJldmVydCB0byB3aGF0IGl0IHdhcyBiZWZvcmUsDQphbHRob3VnaCBmcm9t
IHRoZSBxdWljayBzdHVkeSBJIGRpZCBpbiBteSBwcmV2aW91cyBlbWFpbCwgdGhlcmUgaXMgYQ0K
cGVyZm9ybWFuY2UgZGlmZmVyZW5jZS4NCg0KSG9uZ3lhbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

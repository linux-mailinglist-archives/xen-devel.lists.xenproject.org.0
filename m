Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54644122FF4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:17:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEYS-0000CB-51; Tue, 17 Dec 2019 15:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qn7z=2H=amazon.com=prvs=247c3a56a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihEYQ-0000Br-Sk
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 15:14:30 +0000
X-Inumbo-ID: e6b11d68-20df-11ea-88e7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6b11d68-20df-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576595661; x=1608131661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nvnhKOPGUnKBSzlXHGO7yql/nTH132NVVImvXDaLlyE=;
 b=pO/cbvyKMeRWUWTF/Q6dMIdJvBaYGKaS4vWLpTaNrzvFiMxWslZq6/AJ
 jXOLxHKc9TfyQmE5TRyC3a9xTMbGKEeRDz9AK+gs0pw6Pha1iuBqHw1z9
 moBagmD2vdXfEuLu1c0sbXiDEpBrOM0/BQ3E4/sIKukCKcqMT9pdGYOdo 0=;
IronPort-SDR: WiqUlRzcYaihh5s2TAgZrBB/GiTaQvKw2TzPl9PRlhywhqtxuORZ9jO7XWS91yYjzzNiQvojLo
 1HS9Pj4QC6Hg==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="15412641"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Dec 2019 15:14:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 26C83A1C29; Tue, 17 Dec 2019 15:14:06 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 15:14:05 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 15:14:04 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 17 Dec 2019 15:14:04 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, "kasan-dev@googlegroups.com"
 <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [Xen-devel] [RFC PATCH 3/3] xen/netback: Fix grant copy across
 page boundary with KASAN
Thread-Index: AQHVtOOxycSsl6gyPk+5/XL6YmuKRKe+Zpag
Date: Tue, 17 Dec 2019 15:14:04 +0000
Message-ID: <8e2d5fca57a74d31be8d5daf399454c0@EX13D32EUC003.ant.amazon.com>
References: <20191217140804.27364-1-sergey.dyasli@citrix.com>
 <20191217140804.27364-4-sergey.dyasli@citrix.com>
In-Reply-To: <20191217140804.27364-4-sergey.dyasli@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.146]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 3/3] xen/netback: Fix grant copy across
 page boundary with KASAN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gU2VyZ2V5IER5
YXNsaQ0KPiBTZW50OiAxNyBEZWNlbWJlciAyMDE5IDE0OjA4DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVuLm9yZzsga2FzYW4tZGV2QGdvb2dsZWdyb3Vwcy5jb207IGxpbnV4LQ0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBT
ZXJnZXkgRHlhc2xpDQo+IDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+OyBSb3NzIExhZ2Vyd2FsbA0KPiA8cm9zcy5sYWdlcndhbGxAY2l0
cml4LmNvbT47IEFsZXhhbmRlciBQb3RhcGVua28gPGdsaWRlckBnb29nbGUuY29tPjsNCj4gQW5k
cmV5IFJ5YWJpbmluIDxhcnlhYmluaW5AdmlydHVvenpvLmNvbT47IEJvcmlzIE9zdHJvdnNreQ0K
PiA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+OyBEbWl0cnkgVnl1a292IDxkdnl1a292QGdv
b2dsZS5jb20+DQo+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtSRkMgUEFUQ0ggMy8zXSB4ZW4vbmV0
YmFjazogRml4IGdyYW50IGNvcHkgYWNyb3NzDQo+IHBhZ2UgYm91bmRhcnkgd2l0aCBLQVNBTg0K
PiANCj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+DQo+
IA0KPiBXaGVuIEtBU0FOIChvciBTTFVCX0RFQlVHKSBpcyB0dXJuZWQgb24sIHRoZSBub3JtYWwg
ZXhwZWN0YXRpb24gdGhhdA0KPiBhbGxvY2F0aW9ucyBhcmUgYWxpZ25lZCB0byB0aGUgbmV4dCBw
b3dlciBvZiAyIG9mIHRoZSBzaXplIGRvZXMgbm90DQo+IGhvbGQuIFRoZXJlZm9yZSwgaGFuZGxl
IGdyYW50IGNvcGllcyB0aGF0IGNyb3NzIHBhZ2UgYm91bmRhcmllcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+DQoNCldv
dWxkIGhhdmUgYmVlbiBuaWNlIHRvIGNjIG5ldGJhY2sgbWFpbnRhaW5lcnMuLi4NCg0KPiAtLS0N
Cj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oICB8ICAyICstDQo+ICBkcml2ZXJz
L25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5o
IGIvZHJpdmVycy9uZXQveGVuLQ0KPiBuZXRiYWNrL2NvbW1vbi5oDQo+IGluZGV4IDA1ODQ3ZWI5
MWExYi4uZTU3Njg0NDE1ZWRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9jb21tb24uaA0KPiArKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaA0KPiBA
QCAtMTU1LDcgKzE1NSw3IEBAIHN0cnVjdCB4ZW52aWZfcXVldWUgeyAvKiBQZXItcXVldWUgZGF0
YSBmb3IgeGVudmlmICovDQo+ICAJc3RydWN0IHBlbmRpbmdfdHhfaW5mbyBwZW5kaW5nX3R4X2lu
Zm9bTUFYX1BFTkRJTkdfUkVRU107DQo+ICAJZ3JhbnRfaGFuZGxlX3QgZ3JhbnRfdHhfaGFuZGxl
W01BWF9QRU5ESU5HX1JFUVNdOw0KPiANCj4gLQlzdHJ1Y3QgZ250dGFiX2NvcHkgdHhfY29weV9v
cHNbTUFYX1BFTkRJTkdfUkVRU107DQo+ICsJc3RydWN0IGdudHRhYl9jb3B5IHR4X2NvcHlfb3Bz
W01BWF9QRU5ESU5HX1JFUVMgKiAyXTsNCj4gIAlzdHJ1Y3QgZ250dGFiX21hcF9ncmFudF9yZWYg
dHhfbWFwX29wc1tNQVhfUEVORElOR19SRVFTXTsNCj4gIAlzdHJ1Y3QgZ250dGFiX3VubWFwX2dy
YW50X3JlZiB0eF91bm1hcF9vcHNbTUFYX1BFTkRJTkdfUkVRU107DQo+ICAJLyogcGFzc2VkIHRv
IGdudHRhYl9bdW5dbWFwX3JlZnMgd2l0aCBwYWdlcyB1bmRlciAodW4pbWFwcGluZyAqLw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIGIvZHJpdmVycy9u
ZXQveGVuLQ0KPiBuZXRiYWNrL25ldGJhY2suYw0KPiBpbmRleCAwMDIwYjJlOGMyNzkuLjE1NDFi
NmUwY2M2MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5j
DQo+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYw0KPiBAQCAtMzIwLDYg
KzMyMCw3IEBAIHN0YXRpYyBpbnQgeGVudmlmX2NvdW50X3JlcXVlc3RzKHN0cnVjdCB4ZW52aWZf
cXVldWUNCj4gKnF1ZXVlLA0KPiANCj4gIHN0cnVjdCB4ZW52aWZfdHhfY2Igew0KPiAgCXUxNiBw
ZW5kaW5nX2lkeDsNCj4gKwl1OCBjb3BpZXM7DQo+ICB9Ow0KDQpJIGtub3cgd2UncmUgYSB3YXkg
b2ZmIHRoZSBsaW1pdCAoNDggYnl0ZXMpIGJ1dCBJIHdvbmRlciBpZiB3ZSBvdWdodCB0byBoYXZl
IGEgY29tcGlsZSB0aW1lIGNoZWNrIGhlcmUgdGhhdCB3ZSdyZSBub3Qgb3ZlcmZsb3dpbmcgc2ti
LT5jYi4NCg0KPiANCj4gICNkZWZpbmUgWEVOVklGX1RYX0NCKHNrYikgKChzdHJ1Y3QgeGVudmlm
X3R4X2NiICopKHNrYiktPmNiKQ0KPiBAQCAtNDM5LDYgKzQ0MCw3IEBAIHN0YXRpYyBpbnQgeGVu
dmlmX3R4X2NoZWNrX2dvcChzdHJ1Y3QgeGVudmlmX3F1ZXVlDQo+ICpxdWV1ZSwNCj4gIHsNCj4g
IAlzdHJ1Y3QgZ250dGFiX21hcF9ncmFudF9yZWYgKmdvcF9tYXAgPSAqZ29wcF9tYXA7DQo+ICAJ
dTE2IHBlbmRpbmdfaWR4ID0gWEVOVklGX1RYX0NCKHNrYiktPnBlbmRpbmdfaWR4Ow0KPiArCXU4
IGNvcGllcyA9IFhFTlZJRl9UWF9DQihza2IpLT5jb3BpZXM7DQo+ICAJLyogVGhpcyBhbHdheXMg
cG9pbnRzIHRvIHRoZSBzaGluZm8gb2YgdGhlIHNrYiBiZWluZyBjaGVja2VkLCB3aGljaA0KPiAg
CSAqIGNvdWxkIGJlIGVpdGhlciB0aGUgZmlyc3Qgb3IgdGhlIG9uZSBvbiB0aGUgZnJhZ19saXN0
DQo+ICAJICovDQo+IEBAIC00NTAsMjMgKzQ1MiwyNyBAQCBzdGF0aWMgaW50IHhlbnZpZl90eF9j
aGVja19nb3Aoc3RydWN0IHhlbnZpZl9xdWV1ZQ0KPiAqcXVldWUsDQo+ICAJaW50IG5yX2ZyYWdz
ID0gc2hpbmZvLT5ucl9mcmFnczsNCj4gIAljb25zdCBib29sIHNoYXJlZHNsb3QgPSBucl9mcmFn
cyAmJg0KPiAgCQkJCWZyYWdfZ2V0X3BlbmRpbmdfaWR4KCZzaGluZm8tPmZyYWdzWzBdKSA9PQ0K
PiBwZW5kaW5nX2lkeDsNCj4gLQlpbnQgaSwgZXJyOw0KPiArCWludCBpLCBlcnIgPSAwOw0KPiAN
Cj4gLQkvKiBDaGVjayBzdGF0dXMgb2YgaGVhZGVyLiAqLw0KPiAtCWVyciA9ICgqZ29wcF9jb3B5
KS0+c3RhdHVzOw0KPiAtCWlmICh1bmxpa2VseShlcnIpKSB7DQo+IC0JCWlmIChuZXRfcmF0ZWxp
bWl0KCkpDQo+IC0JCQluZXRkZXZfZGJnKHF1ZXVlLT52aWYtPmRldiwNCj4gKwl3aGlsZSAoY29w
aWVzKSB7DQo+ICsJCS8qIENoZWNrIHN0YXR1cyBvZiBoZWFkZXIuICovDQo+ICsJCWludCBuZXdl
cnIgPSAoKmdvcHBfY29weSktPnN0YXR1czsNCj4gKwkJaWYgKHVubGlrZWx5KG5ld2VycikpIHsN
Cj4gKwkJCWlmIChuZXRfcmF0ZWxpbWl0KCkpDQo+ICsJCQkJbmV0ZGV2X2RiZyhxdWV1ZS0+dmlm
LT5kZXYsDQo+ICAJCQkJICAgIkdyYW50IGNvcHkgb2YgaGVhZGVyIGZhaWxlZCEgc3RhdHVzOiAl
ZA0KPiBwZW5kaW5nX2lkeDogJXUgcmVmOiAldVxuIiwNCj4gIAkJCQkgICAoKmdvcHBfY29weSkt
PnN0YXR1cywNCj4gIAkJCQkgICBwZW5kaW5nX2lkeCwNCj4gIAkJCQkgICAoKmdvcHBfY29weSkt
PnNvdXJjZS51LnJlZik7DQo+IC0JCS8qIFRoZSBmaXJzdCBmcmFnIG1pZ2h0IHN0aWxsIGhhdmUg
dGhpcyBzbG90IG1hcHBlZCAqLw0KPiAtCQlpZiAoIXNoYXJlZHNsb3QpDQo+IC0JCQl4ZW52aWZf
aWR4X3JlbGVhc2UocXVldWUsIHBlbmRpbmdfaWR4LA0KPiAtCQkJCQkgICBYRU5fTkVUSUZfUlNQ
X0VSUk9SKTsNCj4gKwkJCS8qIFRoZSBmaXJzdCBmcmFnIG1pZ2h0IHN0aWxsIGhhdmUgdGhpcyBz
bG90IG1hcHBlZCAqLw0KPiArCQkJaWYgKCFzaGFyZWRzbG90ICYmICFlcnIpDQo+ICsJCQkJeGVu
dmlmX2lkeF9yZWxlYXNlKHF1ZXVlLCBwZW5kaW5nX2lkeCwNCj4gKwkJCQkJCSAgIFhFTl9ORVRJ
Rl9SU1BfRVJST1IpOw0KDQpDYW4ndCB0aGlzIGJlIGRvbmUgYWZ0ZXIgdGhlIGxvb3AsIGlmIHRo
ZXJlIGlzIGFuIGFjY3VtdWxhdGVkIGVycj8gSSB0aGluayBpdCB3b3VsZCBtYWtlIHRoZSBjb2Rl
IHNsaWdodGx5IG5lYXRlci4NCg0KPiArCQkJZXJyID0gbmV3ZXJyOw0KPiArCQl9DQo+ICsJCSgq
Z29wcF9jb3B5KSsrOw0KPiArCQljb3BpZXMtLTsNCj4gIAl9DQo+IC0JKCpnb3BwX2NvcHkpKys7
DQo+IA0KPiAgY2hlY2tfZnJhZ3M6DQo+ICAJZm9yIChpID0gMDsgaSA8IG5yX2ZyYWdzOyBpKyss
IGdvcF9tYXArKykgew0KPiBAQCAtOTEwLDYgKzkxNiw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl90
eF9idWlsZF9nb3BzKHN0cnVjdCB4ZW52aWZfcXVldWUNCj4gKnF1ZXVlLA0KPiAgCQkJeGVudmlm
X3R4X2VycihxdWV1ZSwgJnR4cmVxLCBleHRyYV9jb3VudCwgaWR4KTsNCj4gIAkJCWJyZWFrOw0K
PiAgCQl9DQo+ICsJCVhFTlZJRl9UWF9DQihza2IpLT5jb3BpZXMgPSAwOw0KPiANCj4gIAkJc2ti
X3NoaW5mbyhza2IpLT5ucl9mcmFncyA9IHJldDsNCj4gIAkJaWYgKGRhdGFfbGVuIDwgdHhyZXEu
c2l6ZSkNCj4gQEAgLTkzMyw2ICs5NDAsNyBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfdHhfYnVpbGRf
Z29wcyhzdHJ1Y3QgeGVudmlmX3F1ZXVlDQo+ICpxdWV1ZSwNCj4gIAkJCQkJCSAgICJDYW4ndCBh
bGxvY2F0ZSB0aGUgZnJhZ19saXN0DQo+IHNrYi5cbiIpOw0KPiAgCQkJCWJyZWFrOw0KPiAgCQkJ
fQ0KPiArCQkJWEVOVklGX1RYX0NCKG5za2IpLT5jb3BpZXMgPSAwOw0KPiAgCQl9DQo+IA0KPiAg
CQlpZiAoZXh0cmFzW1hFTl9ORVRJRl9FWFRSQV9UWVBFX0dTTyAtIDFdLnR5cGUpIHsNCj4gQEAg
LTk5MCw2ICs5OTgsMzEgQEAgc3RhdGljIHZvaWQgeGVudmlmX3R4X2J1aWxkX2dvcHMoc3RydWN0
IHhlbnZpZl9xdWV1ZQ0KPiAqcXVldWUsDQo+IA0KPiAgCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNv
cHlfb3BzXS5sZW4gPSBkYXRhX2xlbjsNCg0KSWYgb2Zmc2V0X2luX3BhZ2Uoc2tiLT5kYXRhKSsg
ZGF0YV9sZW4gY2FuIGV4Y2VlZCBYRU5fUEFHRV9TSVpFLCBkb2VzIHRoaXMgbm90IG5lZWQgdG8g
YmUgdHJ1bmNhdGVkPw0KDQogIFBhdWwNCg0KPiAgCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNvcHlf
b3BzXS5mbGFncyA9IEdOVENPUFlfc291cmNlX2dyZWY7DQo+ICsJCVhFTlZJRl9UWF9DQihza2Ip
LT5jb3BpZXMrKzsNCj4gKw0KPiArCQlpZiAob2Zmc2V0X2luX3BhZ2Uoc2tiLT5kYXRhKSArIGRh
dGFfbGVuID4gWEVOX1BBR0VfU0laRSkgew0KPiArCQkJdW5zaWduZWQgaW50IGV4dHJhX2xlbiA9
IG9mZnNldF9pbl9wYWdlKHNrYi0+ZGF0YSkgKw0KPiArCQkJCQkgICAgIGRhdGFfbGVuIC0gWEVO
X1BBR0VfU0laRTsNCj4gKw0KPiArCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10ubGVu
IC09IGV4dHJhX2xlbjsNCj4gKwkJCSgqY29weV9vcHMpKys7DQo+ICsNCj4gKwkJCXF1ZXVlLT50
eF9jb3B5X29wc1sqY29weV9vcHNdLnNvdXJjZS51LnJlZiA9IHR4cmVxLmdyZWY7DQo+ICsJCQlx
dWV1ZS0+dHhfY29weV9vcHNbKmNvcHlfb3BzXS5zb3VyY2UuZG9taWQgPQ0KPiArCQkJCXF1ZXVl
LT52aWYtPmRvbWlkOw0KPiArCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10uc291cmNl
Lm9mZnNldCA9DQo+ICsJCQkJdHhyZXEub2Zmc2V0ICsgZGF0YV9sZW4gLSBleHRyYV9sZW47DQo+
ICsNCj4gKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmRlc3QudS5nbWZuID0NCj4g
KwkJCQl2aXJ0X3RvX2dmbihza2ItPmRhdGEgKyBkYXRhX2xlbiAtIGV4dHJhX2xlbik7DQo+ICsJ
CQlxdWV1ZS0+dHhfY29weV9vcHNbKmNvcHlfb3BzXS5kZXN0LmRvbWlkID0gRE9NSURfU0VMRjsN
Cj4gKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmRlc3Qub2Zmc2V0ID0gMDsNCj4g
Kw0KPiArCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10ubGVuID0gZXh0cmFfbGVuOw0K
PiArCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10uZmxhZ3MgPQ0KPiBHTlRDT1BZX3Nv
dXJjZV9ncmVmOw0KPiArDQo+ICsJCQlYRU5WSUZfVFhfQ0Ioc2tiKS0+Y29waWVzKys7DQo+ICsJ
CX0NCj4gDQo+ICAJCSgqY29weV9vcHMpKys7DQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IA0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

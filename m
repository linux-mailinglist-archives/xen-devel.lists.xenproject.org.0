Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823DD231AF0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 10:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0hCS-0006lC-7v; Wed, 29 Jul 2020 08:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mo4V=BI=amazon.co.uk=prvs=472d6771e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k0hCQ-0006l7-Fk
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 08:12:30 +0000
X-Inumbo-ID: 3ece5058-d173-11ea-8c30-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ece5058-d173-11ea-8c30-bc764e2007e4;
 Wed, 29 Jul 2020 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596010350; x=1627546350;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=6vcRAB27ls93TsENA4IBQqvbiF1CMrS2M/Z8hoki6y4=;
 b=VzRhq3HPvrT9lcVGGwYtKuVkADP7NsRIFGaDfVtvXB7u1WyMAKuTmr3u
 UBDyre35mlk7GCN/c1w8sd23WtLUE3XY74UnzjmHiLZsInef60IoBehUw
 55pAouH1Imf3ZIABNy74XKE7xREPM6LpvVFTxAi7s4eAiFd5/4yilxdee M=;
IronPort-SDR: 8CF7jLBI6RiWtox6OBzkymrdt/3XmhCfosBn7uUg5T7tNP/g9cDVb7FHBk9kIKq+RacpEikSrT
 3Kg0JOfs6LYg==
X-IronPort-AV: E=Sophos;i="5.75,409,1589241600"; d="scan'208";a="55689104"
Subject: RE: [PATCH 4/6] remove remaining uses of iommu_legacy_map/unmap
Thread-Topic: [PATCH 4/6] remove remaining uses of iommu_legacy_map/unmap
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jul 2020 08:12:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id B1E00A2096; Wed, 29 Jul 2020 08:12:21 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:12:21 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:12:20 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 29 Jul 2020 08:12:20 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQG5eCzFAqpVTo2oHmSP0A==
Date: Wed, 29 Jul 2020 08:12:20 +0000
Message-ID: <0bb87826ac30438d9f279bd3148ce4cc@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-5-paul@xen.org>
 <3face98c-7fa7-2baf-2fe8-b5869865203f@suse.com>
In-Reply-To: <3face98c-7fa7-2baf-2fe8-b5869865203f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jun
 Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAyMCAwOTozNg0KPiBUbzogUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBp
bnRlbC5jb20+Ow0KPiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIDQvNl0gcmVtb3ZlIHJlbWFpbmluZyB1c2VzIG9mIGlv
bW11X2xlZ2FjeV9tYXAvdW5tYXANCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDI0LjA3LjIwMjAg
MTg6NDYsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAtLS0NCj4gPiAgeGVuL2FyY2gveDg2L21t
LmMgICAgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKy0tLS0tDQo+ID4gIHhlbi9hcmNo
L3g4Ni9tbS9wMm0tZXB0LmMgICAgICAgfCAyMiArKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICB4
ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgICAgICAgIHwgMTcgKysrKysrKysrKystLS0tDQo+ID4g
IHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKyst
LS0tLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyAgICAgICAgfCAyNyArKysrKysr
KysrKysrKysrKystLS0tLS0NCj4gPiAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jICAgICAgICB8
IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gIHhlbi9jb21tb24vbWVt
b3J5LmMgICAgICAgICAgICAgfCAgNyArKystLS0tDQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMgfCAzNyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAg
eGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICB8IDIwICsrKysrLS0tLS0tLS0tLS0tLQ0K
PiA+ICA5IGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlvbnMoLSkN
Cj4gDQo+IE92ZXJhbGwgbW9yZSBjb2RlLiBJIHdvbmRlciB3aGV0aGVyIGEgbWFwLWFuZC1mbHVz
aCBmdW5jdGlvbiAobmFtZWQNCj4gZGlmZmVyZW50bHkgdGhhbiB0aGUgY3VycmVudCBvbmVzKSB3
b3VsZG4ndCBzdGlsbCBiZSB3b3J0aHdoaWxlIHRvDQo+IGhhdmUuDQoNCkFncmVlZCBidXQgYW4g
ZXh0cmEgMzAgbGluZXMgaXMgbm90IGh1Z2UuIEknZCBzdGlsbCBsaWtlIHRvIGtlZXAgbWFwL3Vu
bWFwIGFuZCBmbHVzaCBzZXBhcmF0ZSBidXQgSSdsbCBzZWUgaWYgSSBjYW4gcmVkdWNlIHRoZSBh
ZGRlZCBsaW5lcy4NCg0KPiANCj4gPiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4g
PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4gPiBAQCAtMTIyNSwxMSArMTIyNSwy
NSBAQCBtYXBfZ3JhbnRfcmVmKA0KPiA+ICAgICAgICAgICAgICBraW5kID0gSU9NTVVGX3JlYWRh
YmxlOw0KPiA+ICAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAga2luZCA9IDA7DQo+ID4g
LSAgICAgICAgaWYgKCBraW5kICYmIGlvbW11X2xlZ2FjeV9tYXAobGQsIF9kZm4obWZuX3gobWZu
KSksIG1mbiwgMCwga2luZCkgKQ0KPiA+ICsgICAgICAgIGlmICgga2luZCApDQo+ID4gICAgICAg
ICAgew0KPiA+IC0gICAgICAgICAgICBkb3VibGVfZ3RfdW5sb2NrKGxndCwgcmd0KTsNCj4gPiAt
ICAgICAgICAgICAgcmMgPSBHTlRTVF9nZW5lcmFsX2Vycm9yOw0KPiA+IC0gICAgICAgICAgICBn
b3RvIHVuZG9fb3V0Ow0KPiA+ICsgICAgICAgICAgICBkZm5fdCBkZm4gPSBfZGZuKG1mbl94KG1m
bikpOw0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPSAwOw0KPiA+
ICsgICAgICAgICAgICBpbnQgZXJyOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgZXJyID0gaW9t
bXVfbWFwKGxkLCBkZm4sIG1mbiwgMCwga2luZCwgJmZsdXNoX2ZsYWdzKTsNCj4gPiArICAgICAg
ICAgICAgaWYgKCBlcnIgKQ0KPiA+ICsgICAgICAgICAgICAgICAgcmMgPSBHTlRTVF9nZW5lcmFs
X2Vycm9yOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgZXJyID0gaW9tbXVfaW90bGJfZmx1c2go
bGQsIGRmbiwgMSwgZmx1c2hfZmxhZ3MpOw0KPiA+ICsgICAgICAgICAgICBpZiAoIGVyciApDQo+
ID4gKyAgICAgICAgICAgICAgICByYyA9IEdOVFNUX2dlbmVyYWxfZXJyb3I7DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICBpZiAoIHJjICE9IEdOVFNUX29rYXkgKQ0KPiA+ICsgICAgICAgICAgICB7
DQo+ID4gKyAgICAgICAgICAgICAgICBkb3VibGVfZ3RfdW5sb2NrKGxndCwgcmd0KTsNCj4gPiAr
ICAgICAgICAgICAgICAgIGdvdG8gdW5kb19vdXQ7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiAg
ICAgICAgICB9DQo+IA0KPiBUaGUgbWFwcGluZyBuZWVkcyB0byBoYXBwZW4gd2l0aCBhdCBsZWFz
dCBsZCdzIGxvY2sgaGVsZCwgeWVzLiBCdXQNCj4gaXMgdGhlIHNhbWUgdHJ1ZSBhbHNvIGZvciB0
aGUgZmx1c2hpbmc/IENhbid0IChub3QgbmVjZXNzYXJpbHkNCj4gcmlnaHQgaW4gdGhpcyBjaGFu
Z2UpIHRoZSBmbHVzaCBiZSBwdWxsZWQgb3V0IG9mIHRoZSBmdW5jdGlvbiBhbmQNCj4gaW5zdGVh
ZCBkb25lIG9uY2UgcGVyIGJhdGNoIHRoYXQgZ290IHByb2Nlc3NlZD8NCj4gDQoNClRydWUsIHRo
ZSBsb2NrcyBuZWVkIG5vdCBiZSBoZWxkIGFjcm9zcyB0aGUgZmx1c2guIEknbGwgaGF2ZSBhIGxv
b2sgYXQgYmF0Y2hpbmcgdG9vLg0KDQogIFBhdWwNCg0KPiBKYW4NCg==


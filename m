Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAE143D08
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:41:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itsnJ-0000oL-NT; Tue, 21 Jan 2020 12:38:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zZg3=3K=amazon.co.uk=prvs=282bd3163=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itsnI-0000nb-0S
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:38:08 +0000
X-Inumbo-ID: dfd4db3e-3c4a-11ea-b833-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfd4db3e-3c4a-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579610288; x=1611146288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fucj2aZRMsgCZ3zpKLT3JwQmLRO3SMrqpQvgRqgAvrI=;
 b=hLKTz4zu6nFoyJq0Tv26H+Xk9SCTtuOfiPP62ThpTjv2+roqeCYUYPLO
 B5nz82i7ttlsGruMJtOIY0pkqW0GSRvDhgN9MSU/IGEiGV+Kj9sqkLwEG
 tuyXQvTcjOd4zRUXgOCGFueIZt6ZZccLtvgwmJcIVxrawVaXn0uz7fJkE g=;
IronPort-SDR: aYBa04Ki7lLI/FGb6zOQwzNbZPKBDQgAkFpd7QDFX6qOCAjgeHnFEst/lhRaMinELYvRDgiDWW
 at6+fhkwUilg==
X-IronPort-AV: E=Sophos;i="5.70,345,1574121600"; d="scan'208";a="20107260"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Jan 2020 12:37:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 26A1CA1CFE; Tue, 21 Jan 2020 12:37:55 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 12:37:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 12:37:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 21 Jan 2020 12:37:53 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 3/3] x86 / vmx: use a 'normal' domheap page
 for APIC_DEFAULT_PHYS_BASE
Thread-Index: AQHV0FJcY7J90OgIvEqx31hCfypvqqf1DBaAgAAAkwA=
Date: Tue, 21 Jan 2020 12:37:53 +0000
Message-ID: <9d6f7088425d48c399501ab91ba08b42@EX13D32EUC003.ant.amazon.com>
References: <20200121120009.1767-1-pdurrant@amazon.com>
 <20200121120009.1767-4-pdurrant@amazon.com>
 <1c6f1cc1-d341-791e-bdc1-4f2d6beb2495@xen.org>
In-Reply-To: <1c6f1cc1-d341-791e-bdc1-4f2d6beb2495@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/3] x86 / vmx: use a 'normal' domheap page
 for APIC_DEFAULT_PHYS_BASE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gSnVsaWVuIEdy
YWxsDQo+IFNlbnQ6IDIxIEphbnVhcnkgMjAyMCAxMjoyOQ0KPiBUbzogRHVycmFudCwgUGF1bCA8
cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1h
QGludGVsLmNvbT47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGV1LmNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ow0KPiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCAzLzNdIHg4NiAvIHZteDogdXNlIGEgJ25vcm1hbCcgZG9taGVhcA0KPiBw
YWdlIGZvciBBUElDX0RFRkFVTFRfUEhZU19CQVNFDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIxLzAx
LzIwMjAgMTI6MDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IGluZGV4IDkx
OWEyNzA1ODcuLmVmMzI3MDcyZWQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0yMjY5LDcg
KzIyNjksOCBAQCBpbnQgYXNzaWduX3BhZ2VzKA0KPiA+DQo+ID4gICAgICAgaWYgKCAhKG1lbWZs
YWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQ0KPiA+ICAgICAgIHsNCj4gPiAtICAgICAgICBpZiAo
IHVubGlrZWx5KChkLT50b3RfcGFnZXMgKyAoMSA8PCBvcmRlcikpID4gZC0+bWF4X3BhZ2VzKSAp
DQo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSgoZC0+dG90X3BhZ2VzICsgKDEgPDwgb3JkZXIp
KSA+IGQtPm1heF9wYWdlcykgJiYNCj4gPiArICAgICAgICAgICAgIGQtPmNyZWF0aW9uX2Zpbmlz
aGVkICkNCj4gDQo+IFRoaXMgaXMgbm90IGVudGlyZWx5IG9idmlvdXMgdG8gbWUgaG93IHRoaXMg
aXMgc2FmZS4gV2hhdCB3b3VsZCBoYXBwZW4NCj4gaWYgZC0+Y3JlYXRpb25fZmluaXNoZWQgaXMg
c2V0IG9uIGFub3RoZXIgQ1BVIGF0IHRoZSBzYW1lIHRpbWU/IEF0IGxlYXN0DQo+IG9uIEFybSwg
dGhpcyBtYXkgbm90IGJlIHNlZW4gZGlyZWN0bHkuDQo+IA0KPiBJIGd1ZXNzIHRoZSBwcm9ibGVt
IHdvdWxkIG5vdCBvbmx5IGhhcHBlbiBpbiB0aGlzIHVzZSBjYXNlIChJIGFtIG1vcmUNCj4gY29u
Y2VybmVkIGluIHRoZSBwaHlzbWFwIGNvZGUpLCBidXQgaXQgd291bGQgYmUgZ29vZCB0byBkb2N1
bWVudCBob3cgaXQNCj4gaXMgbWVhbnQgdG8gYmUgc2FmZSB0byB1c2UuDQo+IA0KPiBIb3dldmVy
LCBBRkFJVSwgdGhlIG9ubHkgcmVhc29uIGZvciB0aGUgY2hlY2sgdG8gYmUgaGVyZSBpcyBiZWNh
dXNlDQo+IGQtPm1heF9wYWdlcyBpcyBzZXQgcXVpdGUgbGF0ZS4gSG93IGFib3V0IHNldHRpbmcg
bWF4X3BhZ2VzIGFzIHBhcnQgb2YNCj4gdGhlIGRvbWFpbl9jcmVhdGUgaHlwZXJjYWxsPw0KDQpU
aGF0IHdvdWxkIGJlIHVzZWZ1bCBidXQgY2VydGFpbmx5IG1vcmUgaW52YXNpdmUuIFRoZXJlJ3Mg
bm8gd2F5IGEgZ3Vlc3QgdmNwdSBjYW4gc2VlIGNyZWF0aW9uX2ZpbmlzaGVkIHNldCB0byB0cnVl
IGFzIGl0IGlzIHN0aWxsIHBhdXNlZC4gVGhlIG9ubHkgY29uY2VybiB3b3VsZCBiZSBhIHN0dWIg
ZG9tYWluIGNhdXNpbmcgZG9taGVhcCBwYWdlcyB0byBiZSBhbGxvY2F0ZWQgb24gYmVoYWxmIG9m
IHRoZSBndWVzdCwgYW5kIGNhbiB3ZSBub3QgdHJ1c3QgYSBzdHViIGRvbWFpbiB1bnRpbCBpdCdz
IGd1ZXN0IGhhcyBiZWVuIHVucGF1c2VkIChzaW5jZSB0aGVyZSBpcyBubyBzY29wZSBmb3IgdGhl
IGd1ZXN0IHRvIGF0dGFjayBpdCB1bnRpbCB0aGVuKT8NCg0KICBQYXVsDQoNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5622E92F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:38:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzzaj-0006eM-9V; Mon, 27 Jul 2020 09:38:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI7O=BG=amazon.co.uk=prvs=4708ece4a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jzzai-0006eH-El
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:38:40 +0000
X-Inumbo-ID: f33da472-cfec-11ea-8a81-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f33da472-cfec-11ea-8a81-bc764e2007e4;
 Mon, 27 Jul 2020 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1595842720; x=1627378720;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=0VLjvdKyeGmxbYMfcdQ08Jsa+quogTnBMX/jxawSbsw=;
 b=lgNQIW3QvGQixj3quvrF/zDrxkxP/tMxY2Ur/IAKmNuA8iqcrE9qQzZq
 2bE77Q/RCCQzuuH6NWc5MFLxqAOKLo7NBAFO+EVcWenfn4XwDUtXLbQvV
 hRuc7qD//jsZA9BMo21/uDwgJjj7RNjF+dH3fd6wt/hYbM3xubVvcN3fD 0=;
IronPort-SDR: MvjbV/Tmpm3PDWtolt+8BfAVux5KR42P4ZrIqoMS7HFkh79mkWaFSF7B1fkgUxf2TDOK5jW7xB
 n2uBlm/Eb8+w==
X-IronPort-AV: E=Sophos;i="5.75,402,1589241600"; d="scan'208";a="54963528"
Subject: RE: [PATCH 2/6] x86/iommu: add common page-table allocator
Thread-Topic: [PATCH 2/6] x86/iommu: add common page-table allocator
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 27 Jul 2020 09:38:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9955D284705; Mon, 27 Jul 2020 09:38:12 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:38:12 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:37:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 27 Jul 2020 09:37:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQEN3iu2Al/FU/SoIwmk8A==
Date: Mon, 27 Jul 2020 09:37:47 +0000
Message-ID: <d329b845e6c348e8bf484e45f051779f@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-3-paul@xen.org>
 <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
In-Reply-To: <d0a0c46f-1461-144c-ca62-259b0a1894fa@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyNCBKdWx5IDIwMjAgMTk6MjQNCj4gVG86
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBLZXZpbiBUaWFuDQo+IDxrZXZpbi50aWFuQGludGVs
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIDIvNl0geDg2L2lv
bW11OiBhZGQgY29tbW9uIHBhZ2UtdGFibGUgYWxsb2NhdG9yDQo+IA0KPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZp
cm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0K
PiBPbiAyNC8wNy8yMDIwIDE3OjQ2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+DQo+ID4gSW5zdGVhZCBvZiBoYXZp
bmcgc2VwYXJhdGUgcGFnZSB0YWJsZSBhbGxvY2F0aW9uIGZ1bmN0aW9ucyBpbiBWVC1kIGFuZCBB
TUQNCj4gPiBJT01NVSBjb2RlLCB1c2UgYSBjb21tb24gYWxsb2NhdGlvbiBmdW5jdGlvbiBpbiB0
aGUgZ2VuZXJhbCB4ODYgY29kZS4NCj4gPiBBbHNvLCByYXRoZXIgdGhhbiB3YWxraW5nIHRoZSBw
YWdlIHRhYmxlcyBhbmQgdXNpbmcgYSB0YXNrbGV0IHRvIGZyZWUgdGhlbQ0KPiA+IGR1cmluZyBp
b21tdV9kb21haW5fZGVzdHJveSgpLCBhZGQgYWxsb2NhdGVkIHBhZ2UgdGFibGUgcGFnZXMgdG8g
YSBsaXN0IGFuZA0KPiA+IHRoZW4gc2ltcGx5IHdhbGsgdGhlIGxpc3QgdG8gZnJlZSB0aGVtLiBU
aGlzIHNhdmVzIH45MCBsaW5lcyBvZiBjb2RlIG92ZXJhbGwuDQo+ID4NCj4gPiBOT1RFOiBUaGVy
ZSBpcyBubyBuZWVkIHRvIGNsZWFyIGFuZCBzeW5jIFBURXMgZHVyaW5nIHRlYXJkb3duIHNpbmNl
IHRoZSBwZXItDQo+ID4gICAgICAgZGV2aWNlIHJvb3QgZW50cmllcyB3aWxsIGhhdmUgYWxyZWFk
eSBiZWVuIGNsZWFyZWQgKHdoZW4gZGV2aWNlcyB3ZXJlDQo+ID4gICAgICAgZGUtYXNzaWduZWQp
IHNvIHRoZSBwYWdlIHRhYmxlcyBjYW4gbm8gbG9uZ2VyIGJlIGFjY2Vzc2VkIGJ5IHRoZSBJT01N
VS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4NCj4gDQo+IE9oIHdvdyAtIEkgZG9uJ3QgaGF2ZSBhbnkgcG9saXRlIHdvcmRzIGZvciBo
b3cgdGhhdCBjb2RlIHdhcyBvcmdhbmlzZWQNCj4gYmVmb3JlLg0KPiANCj4gSW5zdGVhZCBvZiBk
aXNjdXNzaW5nIHRoZSB+OTAgbGluZXMgc2F2ZWQsIHdoYXQgYWJvdXQgdGhlIHJlbW92YWwgb2Yg
YQ0KPiBnbG9iYWwgYm90dGxlbmVjayAodGhlIHRhc2tsZXQpIG9yIGV4cGFuZCBvbiB0aGUgcmVt
b3ZhbCBvZiByZWR1bmRhbnQNCj4gVExCL2NhY2hlIG1haW50ZW5hbmNlPw0KPiANCg0KT2suDQoN
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9t
bXUuYw0KPiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMNCj4g
PiBpbmRleCBjMzg2ZGM0Mzg3Li5mZDliMWU3YmQ1IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMNCj4gPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+ID4gQEAgLTM3OCw2NCArMzgwLDkg
QEAgc3RhdGljIGludCBhbWRfaW9tbXVfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1
OCBkZXZmbiwNCj4gPiAgICAgIHJldHVybiByZWFzc2lnbl9kZXZpY2UocGRldi0+ZG9tYWluLCBk
LCBkZXZmbiwgcGRldik7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBkZWFsbG9jYXRl
X25leHRfcGFnZV90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwZywgaW50IGxldmVsKQ0KPiA+IC17
DQo+ID4gLSAgICBQRk5fT1JERVIocGcpID0gbGV2ZWw7DQo+ID4gLSAgICBzcGluX2xvY2soJmlv
bW11X3B0X2NsZWFudXBfbG9jayk7DQo+ID4gLSAgICBwYWdlX2xpc3RfYWRkX3RhaWwocGcsICZp
b21tdV9wdF9jbGVhbnVwX2xpc3QpOw0KPiA+IC0gICAgc3Bpbl91bmxvY2soJmlvbW11X3B0X2Ns
ZWFudXBfbG9jayk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyB2b2lkIGRlYWxsb2NhdGVf
cGFnZV90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwZykNCj4gPiAtew0KPiA+IC0gICAgc3RydWN0
IGFtZF9pb21tdV9wdGUgKnRhYmxlX3ZhZGRyOw0KPiA+IC0gICAgdW5zaWduZWQgaW50IGluZGV4
LCBsZXZlbCA9IFBGTl9PUkRFUihwZyk7DQo+ID4gLQ0KPiA+IC0gICAgUEZOX09SREVSKHBnKSA9
IDA7DQo+ID4gLQ0KPiA+IC0gICAgaWYgKCBsZXZlbCA8PSAxICkNCj4gPiAtICAgIHsNCj4gPiAt
ICAgICAgICBmcmVlX2FtZF9pb21tdV9wZ3RhYmxlKHBnKTsNCj4gPiAtICAgICAgICByZXR1cm47
DQo+ID4gLSAgICB9DQo+ID4gLQ0KPiA+IC0gICAgdGFibGVfdmFkZHIgPSBfX21hcF9kb21haW5f
cGFnZShwZyk7DQo+ID4gLQ0KPiA+IC0gICAgZm9yICggaW5kZXggPSAwOyBpbmRleCA8IFBURV9Q
RVJfVEFCTEVfU0laRTsgaW5kZXgrKyApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgc3RydWN0
IGFtZF9pb21tdV9wdGUgKnBkZSA9ICZ0YWJsZV92YWRkcltpbmRleF07DQo+ID4gLQ0KPiA+IC0g
ICAgICAgIGlmICggcGRlLT5tZm4gJiYgcGRlLT5uZXh0X2xldmVsICYmIHBkZS0+cHIgKQ0KPiA+
IC0gICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgLyogV2UgZG8gbm90IHN1cHBvcnQgc2tpcCBs
ZXZlbHMgeWV0ICovDQo+ID4gLSAgICAgICAgICAgIEFTU0VSVChwZGUtPm5leHRfbGV2ZWwgPT0g
bGV2ZWwgLSAxKTsNCj4gPiAtICAgICAgICAgICAgZGVhbGxvY2F0ZV9uZXh0X3BhZ2VfdGFibGUo
bWZuX3RvX3BhZ2UoX21mbihwZGUtPm1mbikpLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwZGUtPm5leHRfbGV2ZWwpOw0KPiA+IC0gICAgICAgIH0NCj4gPiAt
ICAgIH0NCj4gPiAtDQo+ID4gLSAgICB1bm1hcF9kb21haW5fcGFnZSh0YWJsZV92YWRkcik7DQo+
ID4gLSAgICBmcmVlX2FtZF9pb21tdV9wZ3RhYmxlKHBnKTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAt
c3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9pb21tdV9wYWdlX3RhYmxlcyhzdHJ1Y3QgZG9tYWluICpk
KQ0KPiA+IC17DQo+ID4gLSAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShk
KTsNCj4gPiAtDQo+ID4gLSAgICBzcGluX2xvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+
ID4gLSAgICBpZiAoIGhkLT5hcmNoLmFtZF9pb21tdS5yb290X3RhYmxlICkNCj4gPiAtICAgIHsN
Cj4gPiAtICAgICAgICBkZWFsbG9jYXRlX25leHRfcGFnZV90YWJsZShoZC0+YXJjaC5hbWRfaW9t
bXUucm9vdF90YWJsZSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
ZC0+YXJjaC5hbWRfaW9tbXUucGFnaW5nX21vZGUpOw0KPiANCj4gSSByZWFsbHkgbmVlZCB0byBk
dXN0IG9mZiBteSBwYXRjaCBmaXhpbmcgdXAgc2V2ZXJhbCBiaXRzIG9mIGR1YmlvdXMNCj4gbG9n
aWMsIGluY2x1ZGluZyB0aGUgbmFtZSAicGFnaW5nX21vZGUiIHdoaWNoIGlzIGFjdHVhbGx5IHNp
bXBseSB0aGUNCj4gbnVtYmVyIG9mIGxldmVscy4NCj4gDQo+IEF0IHRoaXMgcG9pbnQsIGl0IHdp
bGwgcHJvYmFibHkgYmUgYmVzdCB0byBnZXQgdGhpcyBzZXJpZXMgaW4gZmlyc3QsIGFuZA0KPiBm
b3IgbWUgdG8gcmViYXNlLg0KPiANCg0KT2suDQoNCj4gPiAtICAgICAgICBoZC0+YXJjaC5hbWRf
aW9tbXUucm9vdF90YWJsZSA9IE5VTEw7DQo+ID4gLSAgICB9DQo+ID4gLSAgICBzcGluX3VubG9j
aygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAtDQo+ID4gIHN0
YXRpYyB2b2lkIGFtZF9pb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+
ICB7DQo+ID4gLSAgICBkZWFsbG9jYXRlX2lvbW11X3BhZ2VfdGFibGVzKGQpOw0KPiA+ICsgICAg
ZG9tX2lvbW11KGQpLT5hcmNoLmFtZF9pb21tdS5yb290X3RhYmxlID0gTlVMTDsNCj4gPiAgICAg
IGFtZF9pb21tdV9mbHVzaF9hbGxfcGFnZXMoZCk7DQo+IA0KPiBQZXIgeW91ciBOT1RFOiwgc2hv
dWxkbid0IHRoaXMgZmx1c2ggY2FsbCBiZSBkcm9wcGVkPw0KPiANCg0KSW5kZWVkIGl0IHNob3Vs
ZC4NCg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+ID4gaW5kZXggYTEyMTA5
YTFkZS4uYjNjN2RhMGZlMiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC94ODYvaW9tbXUuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jDQo+ID4gQEAgLTE0MCwxMSArMTQwLDE5IEBAIGludCBhcmNoX2lvbW11X2RvbWFpbl9pbml0
KHN0cnVjdCBkb21haW4gKmQpDQo+ID4NCj4gPiAgICAgIHNwaW5fbG9ja19pbml0KCZoZC0+YXJj
aC5tYXBwaW5nX2xvY2spOw0KPiA+DQo+ID4gKyAgICBJTklUX1BBR0VfTElTVF9IRUFEKCZoZC0+
YXJjaC5wZ3RhYmxlcy5saXN0KTsNCj4gPiArICAgIHNwaW5fbG9ja19pbml0KCZoZC0+YXJjaC5w
Z3RhYmxlcy5sb2NrKTsNCj4gPiArDQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+
ID4gIHZvaWQgYXJjaF9pb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+
ICB7DQo+ID4gKyAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4g
PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+ICsNCj4gPiArICAgIHdoaWxlICggKHBn
ID0gcGFnZV9saXN0X3JlbW92ZV9oZWFkKCZoZC0+YXJjaC5wZ3RhYmxlcy5saXN0KSkgKQ0KPiA+
ICsgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKHBnKTsNCj4gDQo+IFNvbWUgb2YgdGhvc2UgOTAg
bGluZXMgc2F2ZWQgd2VyZSB0aGUgbG9naWMgdG8gbm90IHN1ZmZlciBhIHdhdGNoZG9nDQo+IHRp
bWVvdXQgaGVyZS4NCj4gDQo+IFRvIGRvIGl0IGxpa2UgdGhpcywgaXQgbmVlZHMgcGx1bWJpbmcg
aW50byB0aGUgcmVsaW5xdWlzaCByZXNvdXJjZXMgcGF0aC4NCj4gDQoNCk9rLiBJIGRvZXMgbG9v
ayBsaWtlIHRoZXJlIGNvdWxkIGJlIG90aGVyIHBvdGVudGlhbGx5IGxlbmd0aHkgZGVzdHJ1Y3Rp
b24gZG9uZSBvZmYgdGhlIGJhY2sgb2YgdGhlIFJDVSBjYWxsLiBPdWdodCB3ZSBoYXZlIHRoZSBh
YmlsaXR5IHRvIGhhdmUgYSByZXN0YXJ0YWJsZSBkb21haW5fZGVzdHJveSgpPw0KDQo+ID4gIH0N
Cj4gPg0KPiA+ICBzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXQgaHdkb21faW9tbXVfbWFwKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQsDQo+ID4gQEAgLTI1Nyw2ICsyNjUsMzkgQEAgdm9pZCBfX2h3ZG9t
X2luaXQgYXJjaF9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+ID4gICAgICAg
ICAgcmV0dXJuOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RydWN0IHBhZ2VfaW5mbyAqaW9tbXVfYWxs
b2NfcGd0YWJsZShzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgZG9t
YWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gPiArI2lmZGVmIENPTkZJR19OVU1BDQo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MgPSAoaGQtPm5vZGUgPT0gTlVNQV9OT19OT0RF
KSA/DQo+ID4gKyAgICAgICAgMCA6IE1FTUZfbm9kZShoZC0+bm9kZSk7DQo+ID4gKyNlbHNlDQo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MgPSAwOw0KPiA+ICsjZW5kaWYNCj4gPiArICAg
IHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+ICsgICAgdm9pZCAqcDsNCj4gDQo+IFRoZSBtZW1m
bGFncyBjb2RlIGlzIHZlcnkgYXdrd2FyZC4gIEhvdyBhYm91dCBpbml0aWFsaXNpbmcgaXQgdG8g
MCwgYW5kDQo+IGhhdmluZzoNCj4gDQo+ICNpZmRlZiBDT05GSUdfTlVNQQ0KPiAgICAgaWYgKCBo
ZC0+bm9kZSAhPSBOVU1BX05PX05PREUgKQ0KPiAgICAgICAgIG1lbWZsYWdzID0gTUVNRl9ub2Rl
KGhkLT5ub2RlKTsNCj4gI2VuZGlmDQo+IA0KPiBoZXJlPw0KPiANCg0KU3VyZS4NCg0KPiA+ICsN
Cj4gPiArICAgIEJVR19PTighaW9tbXVfZW5hYmxlZCk7DQo+IA0KPiBJcyB0aGlzIHJlYWxseSBu
ZWNlc3Nhcnk/ICBDYW4gd2UgcGxhdXNpYmx5IGVuZCB1cCBpbiB0aGlzIGZ1bmN0aW9uDQo+IG90
aGVyd2lzZT8NCj4gDQoNCk5vdCByZWFsbHk7IEknbGwgZHJvcCBpdC4NCg0KPiANCj4gT3ZlcmFs
bCwgSSB3b25kZXIgaWYgdGhpcyBwYXRjaCB3b3VsZCBiZXR0ZXIgYmUgc3BsaXQgaW50byBzZXZl
cmFsLiAgT25lDQo+IHdoaWNoIGludHJvZHVjZXMgdGhlIGNvbW1vbiBhbGxvYy9mcmVlIGltcGxl
bWVudGF0aW9uLCB0d28gd2hpY2ggc3dpdGNoDQo+IHRoZSBWVC1kIGFuZCBBTUQgaW1wbGVtZW50
YXRpb25zIG92ZXIsIGFuZCBwb3NzaWJseSBvbmUgY2xlYW4tdXAgb24gdGhlIGVuZD8NCj4gDQoN
Ck9rLCBpZiB5b3UgZmVlbCB0aGUgcGF0Y2ggaXMgdG9vIGxhcmdlIGFzLWlzIHRoZW4gSSdsbCBz
cGxpdCBhcyB5b3Ugc3VnZ2VzdC4NCg0KICBQYXVsDQoNCj4gfkFuZHJldw0K


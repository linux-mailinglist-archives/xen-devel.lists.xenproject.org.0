Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5623AA57
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2d9C-00056g-2y; Mon, 03 Aug 2020 16:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjNm=BN=amazon.co.uk=prvs=47772d4cd=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k2d9A-00056Z-OR
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:17:08 +0000
X-Inumbo-ID: c6735334-d5a4-11ea-af56-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6735334-d5a4-11ea-af56-12813bfff9fa;
 Mon, 03 Aug 2020 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596471427; x=1628007427;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=QXyg9b+PP6vrVQj4grqEMl3N+4MmPdmGswAr9dCXQtg=;
 b=F9wH5uIbojDSHsiRNYEEwWF1O3LQmJj7WI0mRkPuk/POYIs6xkSd2dcZ
 pLN7Nvcw6gg5ETN6JDfZupCtL3k7/VKlTWAMSpzwrR3bGkYO58SzwzAf5
 PiNgTtnTKWC0ZlkM2OMBHx2Tb8uJmBV6EdkL2+NrOG2zjNbDBgpJoWZz1 s=;
IronPort-SDR: KvcF9b4Hjr65tgUl+rBmyxmKEYmBLrVE/0S0supfO0zH4JF0Y1ziTfnQpN2r8VeixSHUVIwpTx
 7lHEno5CTNLw==
X-IronPort-AV: E=Sophos;i="5.75,430,1589241600"; d="scan'208";a="47131808"
Subject: RE: [PATCH v3 02/11] x86/iommu: add common page-table allocator
Thread-Topic: [PATCH v3 02/11] x86/iommu: add common page-table allocator
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Aug 2020 16:17:06 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9A5ECA0370; Mon,  3 Aug 2020 16:17:04 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 16:17:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 16:17:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 3 Aug 2020 16:17:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQHWaa8KHRMAXkKC7EeaIzxZlnqXcqkmjknw
Date: Mon, 3 Aug 2020 16:17:03 +0000
Message-ID: <23bb9481c2534476aa992cefdf887ae4@EX13D32EUC003.ant.amazon.com>
References: <20200803122914.2259-1-paul@xen.org>
 <20200803122914.2259-3-paul@xen.org>
 <1bc6fcbe-534a-b056-7744-e96eb4f09757@suse.com>
In-Reply-To: <1bc6fcbe-534a-b056-7744-e96eb4f09757@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEF1Z3VzdCAyMDIwIDE2OjU5DQo+IFRvOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgQW5kcmV3IENvb3Blcg0K
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRF
Uk5BTF0gW1BBVENIIHYzIDAyLzExXSB4ODYvaW9tbXU6IGFkZCBjb21tb24gcGFnZS10YWJsZSBh
bGxvY2F0b3INCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNp
ZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDAzLjA4LjIwMjAgMTQ6MjksIFBhdWwg
RHVycmFudCB3cm90ZToNCj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5j
b20+DQo+ID4NCj4gPiBJbnN0ZWFkIG9mIGhhdmluZyBzZXBhcmF0ZSBwYWdlIHRhYmxlIGFsbG9j
YXRpb24gZnVuY3Rpb25zIGluIFZULWQgYW5kIEFNRA0KPiA+IElPTU1VIGNvZGUsIHdlIGNvdWxk
IHVzZSBhIGNvbW1vbiBhbGxvY2F0aW9uIGZ1bmN0aW9uIGluIHRoZSBnZW5lcmFsIHg4NiBjb2Rl
Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGFsbG9jYXRpb24gZnVuY3Rpb24sIGlv
bW11X2FsbG9jX3BndGFibGUoKSwgZm9yIHRoaXMNCj4gPiBwdXJwb3NlLiBUaGUgZnVuY3Rpb24g
YWRkcyB0aGUgcGFnZSB0YWJsZSBwYWdlcyB0byBhIGxpc3QuIFRoZSBwYWdlcyBpbiB0aGlzDQo+
ID4gbGlzdCBhcmUgdGhlbiBmcmVlZCBieSBpb21tdV9mcmVlX3BndGFibGVzKCksIHdoaWNoIGlz
IGNhbGxlZCBieQ0KPiA+IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGFmdGVyIFBDSSBk
ZXZpY2VzIGhhdmUgYmVlbiBkZS1hc3NpZ25lZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiA+IENj
OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+DQo+ID4gdjI6
DQo+ID4gIC0gVGhpcyBpcyBzcGxpdCBvdXQgZnJvbSBhIGxhcmdlciBwYXRjaCBvZiB0aGUgc2Ft
ZSBuYW1lIGluIHYxDQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAg
ICAgICAgIHwgIDkgKysrKystDQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2luY2x1ZGUv
YXNtLXg4Ni9pb21tdS5oICAgICAgICAgfCAgNyArKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
NjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiA+IGluZGV4IGY4
MDg0ZGM5ZTMuLmQxZWNjN2I4M2IgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFp
bi5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jDQo+ID4gQEAgLTIxNTMsNyArMjE1
Myw4IEBAIGludCBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkN
Cj4gPiAgICAgICAgICBkLT5hcmNoLnJlbF9wcml2ID0gUFJPR18gIyMgeDsgLyogRmFsbHRocm91
Z2ggKi8gY2FzZSBQUk9HXyAjIyB4DQo+ID4NCj4gPiAgICAgICAgICBlbnVtIHsNCj4gPiAtICAg
ICAgICAgICAgUFJPR19wYWdpbmcgPSAxLA0KPiA+ICsgICAgICAgICAgICBQUk9HX2lvbW11X3Bh
Z2V0YWJsZXMgPSAxLA0KPiA+ICsgICAgICAgICAgICBQUk9HX3BhZ2luZywNCj4gPiAgICAgICAg
ICAgICAgUFJPR192Y3B1X3BhZ2V0YWJsZXMsDQo+ID4gICAgICAgICAgICAgIFBST0dfc2hhcmVk
LA0KPiA+ICAgICAgICAgICAgICBQUk9HX3hlbiwNCj4gDQo+IElzIHRoZXJlIGEgcGFydGljdWxh
ciByZWFzb24gdG8gbWFrZSB0aGlzIG5ldyBpdGVtIHRoZSB2ZXJ5IGZpcnN0DQo+IG9uZT8NCg0K
SXQgc2VlbXMgbGlrZSB0aGUgbG9naWNhbCBwbGFjZSBhcyBpdCBjb21lcyBzdHJhaWdodCBhZnRl
ciBkZXZpY2UgZGUtYXNzaWdubWVudC4NCg0KPiANCj4gPiBAQCAtMjU3LDYgKzI2MCw1MyBAQCB2
b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkN
Cj4gPiAgICAgICAgICByZXR1cm47DQo+ID4gIH0NCj4gPg0KPiA+ICtpbnQgaW9tbXVfZnJlZV9w
Z3RhYmxlcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgZG9tYWlu
X2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gPiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBn
Ow0KPiA+ICsNCj4gPiArICAgIHdoaWxlICggKHBnID0gcGFnZV9saXN0X3JlbW92ZV9oZWFkKCZo
ZC0+YXJjaC5wZ3RhYmxlcy5saXN0KSkgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGZyZWVf
ZG9taGVhcF9wYWdlKHBnKTsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBnZW5lcmFsX3ByZWVt
cHRfY2hlY2soKSApDQo+ID4gKyAgICAgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7DQo+IA0KPiBQ
ZXJoYXBzIGJldHRlciBvbmx5IGNoZWNrIG9uY2UgZXZlcnkgc28gbWFueSBwYWdlcz8NCj4gDQoN
ClllcywgdGhhdCB3b3VsZCBiZSByZWFzb25hYmxlLg0KDQo+ID4gK3N0cnVjdCBwYWdlX2luZm8g
KmlvbW11X2FsbG9jX3BndGFibGUoc3RydWN0IGRvbWFpbiAqZCkNCj4gPiArew0KPiA+ICsgICAg
c3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQo+ID4gKyAgICB1bnNpZ25l
ZCBpbnQgbWVtZmxhZ3MgPSAwOw0KPiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+ID4g
KyAgICB2b2lkICpwOw0KPiA+ICsNCj4gPiArI2lmZGVmIENPTkZJR19OVU1BDQo+ID4gKyAgICBp
ZiAoaGQtPm5vZGUgIT0gTlVNQV9OT19OT0RFKQ0KPiANCj4gTWlzc2luZyBibGFua3MgaW5zaWRl
IHBhcmVudGhlc2VzLg0KPiANCg0KT2ggeWVzLi4uIGJhZCBjb252ZXJzaW9uIGZyb20gdGVybmFy
eSBzdGF0ZW1lbnQgaW4gcHJldmlvdXMgdmVyc2lvbi4NCg0KPiA+IEBAIC0xMzEsNiArMTM1LDkg
QEAgaW50IHBpX3VwZGF0ZV9pcnRlKGNvbnN0IHN0cnVjdCBwaV9kZXNjICpwaV9kZXNjLCBjb25z
dCBzdHJ1Y3QgcGlycSAqcGlycSwNCj4gPiAgICAgICAgICBpb21tdV92Y2FsbChvcHMsIHN5bmNf
Y2FjaGUsIGFkZHIsIHNpemUpOyAgICAgICBcDQo+ID4gIH0pDQo+ID4NCj4gPiAraW50IF9fbXVz
dF9jaGVjayBpb21tdV9mcmVlX3BndGFibGVzKHN0cnVjdCBkb21haW4gKmQpOw0KPiA+ICtzdHJ1
Y3QgcGFnZV9pbmZvICogX19tdXN0X2NoZWNrIGlvbW11X2FsbG9jX3BndGFibGUoc3RydWN0IGRv
bWFpbiAqZCk7DQo+IA0KPiBDb21tb25seSB3ZSBwdXQgYSBibGFuayBvbiB0aGUgbGVmdCBzaWRl
IG9mICosIGJ1dCBub25lIHRvIGl0cyByaWdodC4NCj4gDQoNCktpbmQgb2YgZmVsdCB3cm9uZyBu
b3QgdG8gc2VwYXJhdGUgaXQgZnJvbSAnX19tdXN0X2NoZWNrJy4NCg0KICBQYXVsDQoNCj4gSmFu
DQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5122822E9D3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 12:14:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k008m-0001qP-KK; Mon, 27 Jul 2020 10:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI7O=BG=amazon.co.uk=prvs=4708ece4a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k008k-0001pg-A5
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 10:13:50 +0000
X-Inumbo-ID: dd6d23b6-cff1-11ea-8a85-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd6d23b6-cff1-11ea-8a85-bc764e2007e4;
 Mon, 27 Jul 2020 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1595844830; x=1627380830;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=r5nDZhrxGII8pB7FymrLLyH1jsMWLlJfmuypoJsDnnc=;
 b=dk5vej5KmyBz0G9NawHAsb8sLeHOteCgTJKI3x69WBkFRv4gJq+qBjs2
 Nt2CPclNGsoKsH7R/Y6fNeCVvbvi9Q8IXmWdr0/gyrRYeplI7sAKH7ukw
 WtxuUpVnMx2eHa4KgkmkVfuNCwZJjSf3a96ts5mQ/XTtIjQqXDr1v9xTu A=;
IronPort-SDR: sWbUITzr8Fnkldg8I/a3W06pAJKpLtW/k9jYlT0aFgMIYn9enWoAIMQjvwM2NUjO4T7Ul7vU1s
 /vIiHXFOC2Yg==
X-IronPort-AV: E=Sophos;i="5.75,402,1589241600"; d="scan'208";a="44341488"
Subject: RE: [PATCH 6/6] iommu: stop calling IOMMU page tables 'p2m tables'
Thread-Topic: [PATCH 6/6] iommu: stop calling IOMMU page tables 'p2m tables'
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 27 Jul 2020 10:13:49 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 85BCFA1E1A; Mon, 27 Jul 2020 10:13:47 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 10:13:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 10:13:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 27 Jul 2020 10:13:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQEff0zhAU0DZhGoKx3ZEA==
Date: Mon, 27 Jul 2020 10:13:45 +0000
Message-ID: <be5b86a5ad6f4ad286dcdf825ac2175e@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-7-paul@xen.org>
 <4e1c2ed8-dfc4-812b-d341-04bc5eedad8e@citrix.com>
In-Reply-To: <4e1c2ed8-dfc4-812b-d341-04bc5eedad8e@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAyNCBKdWx5IDIwMjAgMjA6MDkNCj4gVG86
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBLZXZpbiBUaWFuDQo+IDxrZXZpbi50aWFuQGludGVs
LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIDYvNl0gaW9tbXU6IHN0b3Ag
Y2FsbGluZyBJT01NVSBwYWdlIHRhYmxlcyAncDJtIHRhYmxlcycNCj4gDQo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29u
ZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4g
DQo+IE9uIDI0LzA3LzIwMjAgMTc6NDYsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMNCj4gPiBpbmRleCA2YTM4MDNmZjJjLi41YmMxOTBiZjk4IDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4gQEAgLTUzNSwxMiArNTM1LDEyIEBAIHN0
YXRpYyB2b2lkIGlvbW11X2R1bXBfcDJtX3RhYmxlKHVuc2lnbmVkIGNoYXIga2V5KQ0KPiA+DQo+
ID4gICAgICAgICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkNCj4gPiAgICAgICAgICB7DQo+
ID4gLSAgICAgICAgICAgIHByaW50aygiXG5kb21haW4lZCBJT01NVSBwMm0gdGFibGUgc2hhcmVk
IHdpdGggTU1VOiBcbiIsIGQtPmRvbWFpbl9pZCk7DQo+ID4gKyAgICAgICAgICAgIHByaW50aygi
JXBkOiBJT01NVSBwYWdlIHRhYmxlcyBzaGFyZWQgd2l0aCBNTVVcbiIsIGQpOw0KPiANCj4gQ2hh
bmdlIE1NVSB0byBDUFU/ICBNTVUgaXMgdmVyeSBhbWJpZ3VvdXMgaW4gdGhpcyBjb250ZXh0Lg0K
PiANCg0KQWN0dWFsbHkgSSBjb3VsZCBwdXNoIHRoaXMgaW50byB0aGUgVlQtZCBjb2RlIGFuZCBq
dXN0IHNheSBzb21ldGhpbmcgbGlrZSAnc2hhcmVkIEVQVCBpcyBlbmFibGVkJy4gV291bGQgdGhh
dCBiZSBsZXNzIGFtYmlndW91cz8NCg0KPiA+ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiAg
ICAgICAgICB9DQo+ID4NCj4gPiAtICAgICAgICBwcmludGsoIlxuZG9tYWluJWQgSU9NTVUgcDJt
IHRhYmxlOiBcbiIsIGQtPmRvbWFpbl9pZCk7DQo+ID4gLSAgICAgICAgb3BzLT5kdW1wX3AybV90
YWJsZShkKTsNCj4gPiArICAgICAgICBwcmludGsoIiVwZDogSU9NTVUgcGFnZSB0YWJsZXM6IFxu
IiwgZCk7DQo+IA0KPiBEcm9wIHRoZSB0cmFpbGluZyB3aGl0ZXNwYWNlPw0KPiANCg0KU3VyZS4N
Cg0KICBQYXVsDQoNCj4gfkFuZHJldw0K


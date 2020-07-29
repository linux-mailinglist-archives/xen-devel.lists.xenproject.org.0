Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB8231B8A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 10:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0hio-00010C-5i; Wed, 29 Jul 2020 08:45:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mo4V=BI=amazon.co.uk=prvs=472d6771e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k0him-000106-Ft
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 08:45:56 +0000
X-Inumbo-ID: ea611460-d177-11ea-a993-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea611460-d177-11ea-a993-12813bfff9fa;
 Wed, 29 Jul 2020 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596012356; x=1627548356;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=CKdJV+JgaMZyz8cY/v6LH76+8eASYE5xaX2k2Sxkxbw=;
 b=DGdPrtxSXMUCVJ1dRh2SSUhBRqrbHxa5Bo0RnfKren2za4YU5z1pF1ZA
 NgXjaQ2eYDGHJ8fsWK/EMoYSxydhF0tZgz7rskFtR2nasr7hvvnSm5W8Q
 2dGB7NfEUBMP7wrjcKx26WZ61KrNM+coeKY1kSRY4/udZhPrgd8e5oich o=;
IronPort-SDR: dw50FH2SMuBPCN040W8krWId+p1P3nB7mqTXhk+yftg+99dM24FftPei9QcxH93eSSGJijdx5W
 fzc2pbIrqSFA==
X-IronPort-AV: E=Sophos;i="5.75,409,1589241600"; d="scan'208";a="63894231"
Subject: RE: [PATCH 5/6] iommu: remove the share_p2m operation
Thread-Topic: [PATCH 5/6] iommu: remove the share_p2m operation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Jul 2020 08:45:55 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 54EDEA2BC0; Wed, 29 Jul 2020 08:45:54 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:45:53 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 29 Jul 2020 08:45:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 29 Jul 2020 08:45:52 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQJLmpxbAnxUoGeoG00acA==
Date: Wed, 29 Jul 2020 08:45:52 +0000
Message-ID: <319306da26bc4e848e9a46cf0caa10ea@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-6-paul@xen.org>
 <d005885d-d983-7328-ee36-efd6032e8c96@suse.com>
In-Reply-To: <d005885d-d983-7328-ee36-efd6032e8c96@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAyMCAwOTo1MA0KPiBUbzogUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXINCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIDUvNl0gaW9tbXU6IHJlbW92ZSB0aGUg
c2hhcmVfcDJtIG9wZXJhdGlvbg0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMjQuMDcuMjAyMCAx
ODo0NiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3Z0ZC9pb21tdS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gPiBAQCAtMzEzLDYgKzMxMywyNiBAQCBzdGF0aWMgdTY0IGFkZHJfdG9fZG1hX3Bh
Z2VfbWFkZHIoc3RydWN0IGRvbWFpbiAqZG9tYWluLCB1NjQgYWRkciwgaW50IGFsbG9jKQ0KPiA+
ICAgICAgcmV0dXJuIHB0ZV9tYWRkcjsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1NjQgZG9t
YWluX3BnZF9tYWRkcihzdHJ1Y3QgZG9tYWluICpkKQ0KPiANCj4gdWludDY0X3QgcGxlYXNlLg0K
PiANCg0KT2suDQoNCj4gPiArew0KPiA+ICsgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBk
b21faW9tbXUoZCk7DQo+ID4gKw0KPiA+ICsgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZoZC0+
YXJjaC5tYXBwaW5nX2xvY2spKTsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGlvbW11X3VzZV9oYXBf
cHQoZCkgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIG1mbl90IHBnZF9tZm4gPQ0KPiA+ICsg
ICAgICAgICAgICBwYWdldGFibGVfZ2V0X21mbihwMm1fZ2V0X3BhZ2V0YWJsZShwMm1fZ2V0X2hv
c3RwMm0oZCkpKTsNCj4gPiArDQo+ID4gKyAgICAgICAgcmV0dXJuIHBhZ2V0YWJsZV9nZXRfcGFk
ZHIocGFnZXRhYmxlX2Zyb21fbWZuKHBnZF9tZm4pKTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4g
KyAgICBpZiAoICFoZC0+YXJjaC52dGQucGdkX21hZGRyICkNCj4gPiArICAgICAgICBhZGRyX3Rv
X2RtYV9wYWdlX21hZGRyKGQsIDAsIDEpOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiBoZC0+YXJj
aC52dGQucGdkX21hZGRyOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBpb21tdV9m
bHVzaF93cml0ZV9idWZmZXIoc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUpDQo+ID4gIHsNCj4gPiAg
ICAgIHUzMiB2YWw7DQo+ID4gQEAgLTEzNDcsMjIgKzEzNjcsMTcgQEAgaW50IGRvbWFpbl9jb250
ZXh0X21hcHBpbmdfb25lKA0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIHNwaW5fbG9jaygmaGQt
PmFyY2gubWFwcGluZ19sb2NrKTsNCj4gPg0KPiA+IC0gICAgICAgIC8qIEVuc3VyZSB3ZSBoYXZl
IHBhZ2V0YWJsZXMgYWxsb2NhdGVkIGRvd24gdG8gbGVhZiBQVEUuICovDQo+ID4gLSAgICAgICAg
aWYgKCBoZC0+YXJjaC52dGQucGdkX21hZGRyID09IDAgKQ0KPiA+ICsgICAgICAgIHBnZF9tYWRk
ciA9IGRvbWFpbl9wZ2RfbWFkZHIoZG9tYWluKTsNCj4gPiArICAgICAgICBpZiAoICFwZ2RfbWFk
ZHIgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgYWRkcl90b19kbWFfcGFnZV9t
YWRkcihkb21haW4sIDAsIDEpOw0KPiA+IC0gICAgICAgICAgICBpZiAoIGhkLT5hcmNoLnZ0ZC5w
Z2RfbWFkZHIgPT0gMCApDQo+ID4gLSAgICAgICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgbm9t
ZW06DQo+ID4gLSAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGluZ19s
b2NrKTsNCj4gPiAtICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZpb21tdS0+bG9jayk7DQo+
ID4gLSAgICAgICAgICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UoY29udGV4dF9lbnRyaWVz
KTsNCj4gPiAtICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+IC0gICAgICAgICAg
ICB9DQo+ID4gKyAgICAgICAgbm9tZW06DQo+ID4gKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZo
ZC0+YXJjaC5tYXBwaW5nX2xvY2spOw0KPiA+ICsgICAgICAgICAgICBzcGluX3VubG9jaygmaW9t
bXUtPmxvY2spOw0KPiA+ICsgICAgICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UoY29udGV4
dF9lbnRyaWVzKTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gICAgICAg
ICAgfQ0KPiANCj4gVGhpcyByZW5kZXJzIGFsbCBjYWxscyBib2d1cyBpbiBzaGFyZWQgbW9kZSAt
IHRoZSBmdW5jdGlvbiwgaWYNCj4gaXQgZW5kZWQgdXAgZ2V0dGluZyBjYWxsZWQgbmV2ZXJ0aGVs
ZXNzLCB3b3VsZCB0aGVuIHN0aWxsIGFsbG9jDQo+IHRoZSByb290IHRhYmxlLiBUaGVyZWZvcmUg
SSdkIGxpa2UgdG8gc3VnZ2VzdCB0aGF0IGF0IGxlYXN0IGFsbA0KPiBpdHMgY2FsbGVycyBnZXQg
YW4gZXhwbGljaXQgY2hlY2suIFRoYXQncyByZWFsbHkganVzdA0KPiBkbWFfcHRlX2NsZWFyX29u
ZSgpIGFzIGl0IGxvb2tzLg0KPiANCg0KT2ssIEkgdGhpbmsgSSBtYXkgbW92ZSB0aGlzIGNvZGUg
b3V0IGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbiB0b28gc2luY2UgdGhlIG5vbWVtIGxhYmVsIGlz
IHNsaWdodGx5IGF3a3dhcmQsIHNvIEknbGwgcmUtZmFjdG9yIGl0Lg0KDQogIFBhdWwNCg0KPiBK
YW4NCg==


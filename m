Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD27A3AC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsO5r-0004qq-Gr; Tue, 30 Jul 2019 09:06:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsO5q-0004ql-Pv
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:06:50 +0000
X-Inumbo-ID: 5b5e09c7-b2a9-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b5e09c7-b2a9-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:06:49 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:06:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:05:10 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:05:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjbqKFyJvInSVb8Tg3E8ak4Qyq+z+8qn4rN1rfOr8GMdnqA+nzV/RhBKmWg7HQ0KdGeraPiRSSqu2pBzdFb2iWDDercDIxyIY9bDKOEp9oqM2HutYll6/ZZ4ueOEKDxXnOrDgn8xzyRFpoWbB6doUCJ/3BmWiyeeqb19zckgUiOiy2Z5yI3ReKYgjGVE+xpIZTeuvs5MwgepulyAEfd8mZCTkZOE0GuS9G6wd59l5rEnX57QpH3lYmied3nr5T8RR6zXJZkMLxWVOvhXAj/2RdUvjsL4U4+J4d6n8Ll0I0ayF5N9+NJkY0RqWtAB74nbXSVZVJY7XQKPAZg02biL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74DmJnjMjuDf8XRw37aDuEcGmVqLt4j51B0BS3NbHuU=;
 b=BG61viaajEcDM9T/ihqI4+5jCDiJUkpXE2Lu7M3vy67IxO/y9FbMDOiwa29JhZObSKkS6oiuK5qqLhX0z+X/CcipKzBDmt1xZX5O8lojVRWkxIOuDEOKekRiCD3SuIDybFtEOo4X0hY2LOXhEJCGUFwSJv5uaOu9iG7cl0FiRWbVGRqFHRHBmNS7cWW5vEkUJ0pSwU7kcq8rx+Oz/S35jcFqmRjuJqMRD0HB+UVpQYhEWFGKjfPlzrBi/9GXQ8W2jh9QDPlDk8XwAa0nw0sYy+6F6vpnnTrhYqs8wQwdKj9w1hdF2i5ZgWz4844scub9eBZoIM1aWI/XED9vSOQSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3138.namprd18.prod.outlook.com (10.255.137.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 09:05:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:05:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] Intel TXT: add reviewer, move to Odd Fixes state
Thread-Index: AQHVRqQXgGfUTRtdJUu4GI2iK/jW8qbi1I8AgAAHKbaAAAK9AA==
Date: Tue, 30 Jul 2019 09:05:09 +0000
Message-ID: <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
In-Reply-To: <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0011.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97aac24b-c943-49a3-79f9-08d714cd0582
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3138; 
x-ms-traffictypediagnostic: BY5PR18MB3138:
x-microsoft-antispam-prvs: <BY5PR18MB3138854FD0F9A541786F2C94B3DC0@BY5PR18MB3138.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(51444003)(199004)(189003)(8936002)(102836004)(76176011)(6436002)(71200400001)(486006)(6512007)(66066001)(71190400001)(7416002)(53546011)(386003)(6246003)(6506007)(6486002)(99286004)(3846002)(229853002)(66446008)(66476007)(64756008)(6116002)(5660300002)(186003)(11346002)(66946007)(26005)(2616005)(446003)(36756003)(53936002)(52116002)(14444005)(31686004)(476003)(256004)(4326008)(66556008)(81166006)(14454004)(81156014)(316002)(8676002)(54906003)(7736002)(305945005)(478600001)(2906002)(31696002)(25786009)(86362001)(80792005)(68736007)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3138;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hqAxSV7N3JH1B5GUEz0r+ptAZddnWUxVzd2zJHtaWAK9qC6OWkdj5bEdoPMQxnbfc4EDAYSugjPd4PPUFl2Eit9hS/hjyGchnjqg2Ng+we4MsJTHZD+2cXx6o/9UkYb4s+qz8zw1Nuy5l/jR4OvAvisWO3XBZYO1zdilUxyU+3RKgChWCqC9bjQ4wEYNKDcKJ+erwxrBUtF0pbzD27PpEOmy96WvkgOMjl5QWmaNpGwXNiaE26SeMHohC8Ygx708eqVmJazZuD2WLoEz8emQjC24uJaTEeFUszN6vr5HC9rMEfwTgNOOVtd0kkwC2Ls89Gh/mK69nzku+NYH/Z4JY+PRiVMS1fgErW1zLJ4dsiZw0ciivEa5bDoM3x+vSXy0r4s0vcxCdgkvOPwPXHrAoULQM2njYy70e4VXpVW6n6Q=
Content-ID: <814EDA9D63E7234F89965EC75C4BD97F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aac24b-c943-49a3-79f9-08d714cd0582
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:05:09.1211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3138
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxMDo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiA3LzMwLzE5IDk6
MjkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMzAuMDcuMjAxOSAwODo1NiwgTHVrYXN6
IEhhd3J5bGtvIHdyb3RlOg0KPj4+IFN1cHBvcnQgZm9yIEludGVsIFRYVCBoYXMgb3JwaGFuZWQg
c3RhdHVzIHJpZ2h0IG5vdyBiZWNhdXNlDQo+Pj4gbm8gYWN0aXZlIG1haW50YWludGVyIGlzIGxp
c3RlZC4gQWRkaW5nIG15c2VsZiBhcyByZXZpZXdlcg0KPj4+IGFuZCBtb3ZpbmcgaXQgdG8gT2Rk
IEZpeGVzIHN0YXRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IEhhd3J5bGtvIDxs
dWthc3ouaGF3cnlsa29AaW50ZWwuY29tPg0KPj4+IC0tLQ0KPj4+IMKgwqAgTUFJTlRBSU5FUlMg
fCAzICsrLQ0KPj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMN
Cj4+PiBpbmRleCA4OWEwMWI3MTBiLi5jYTMwMGU4N2M4IDEwMDY0NA0KPj4+IC0tLSBhL01BSU5U
QUlORVJTDQo+Pj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+PiBAQCAtMjQwLDcgKzI0MCw4IEBAIFM6
wqDCoMKgIE1haW50YWluZWQNCj4+PiAgRjrCoMKgwqAgdG9vbHMvZ29sYW5nDQo+Pj4gIElOVEVM
KFIpIFRSVVNURUQgRVhFQ1VUSU9OIFRFQ0hOT0xPR1kgKFRYVCkNCj4+PiAtUzrCoMKgwqAgT3Jw
aGFuZWQNCj4+PiArUjrCoMKgwqAgTHVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29AaW50
ZWwuY29tPg0KPj4+ICtTOsKgwqDCoCBPZGQgRml4ZXMNCj4+DQo+PiBJIGd1ZXNzIHdlIHNob3Vs
ZCBnaXZlIGl0IGEgZmV3IGRheXMgZm9yIG9iamVjdGlvbnMgdG8gYmUgcmFpc2VkDQo+PiBhZ2Fp
bnN0IHRoaXMgc2xpZ2h0bHkgaW5jb25zaXN0ZW50IHN0YXRlLCBidXQgSSB0aGluayB0aGF0J3Mg
dGhlDQo+PiBiZXN0IHdheSB0byBleHByZXNzIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoaW5ncyAo
aGVuY2UgbXkNCj4+IHN1Z2dlc3Rpb24gdG8gdGhpcyBlZmZlY3QpLiBJZiBubyBvYmplY3Rpb25z
IHR1cm4gdXAsIEkndmUgcXVldWVkDQo+PiB0aGlzIG9udG8gbXkgdG8tYmUtY29tbWl0dGVkIGxp
c3QuDQo+IA0KPiBJIGhhdmUgc29tZSBvYmplY3Rpb25zIHJlZ2FyZGluZyB0aGUgcHJvY2VzcyBp
dHNlbGYuLi4gT24gdGhlIGZpcnN0DQo+IHZlcnNpb24gb2YgdGhpcyBwYXRjaCwgaXQgd2FzIHBv
aW50ZWQgb3V0IHRoYXQgdGhlIGUtbWFpbCBzaG91bGRuJ3QNCj4gYmUgc2VudCB3aXRoIGRpc2Ns
YWltZXIuIFRoaXMgaXMgbm93IHRoZSB0aGlyZCB2ZXJzaW9uIGFuZCB0aGUNCj4gZGlzY2xhaW1l
ciBpcyBzdGlsbCBwcmVzZW50Lg0KDQpPa2F5LCBJIG11c3QgaGF2ZSBtaXNzZWQgYm90aCBlYXJs
aWVyIHJlcXVlc3RzIHRvIHRoaXMgZWZmZWN0LiBJJ3ZlDQpnb25lIGJhY2sgdG8gdGhlIGxpc3Qg
YXJjaGl2ZXMgdGhvdWdoLCBhbmQgSSBjb3VsZG4ndCBmaW5kIGFueSBzdWNoDQpyZXF1ZXN0IGVp
dGhlciBmcm9tIEp1bHkgb3IgSnVuZS4gVGhlcmVmb3JlIC4uLg0KDQo+IFRlY2huaWNhbGx5LCBu
byBwYXRjaCBzaG91bGQgYmUgYXBwbGllZCB3aGVuIHRoZXJlIGFyZSBhIGRpc2NsYWltZXIuDQoN
Ci4uLiBJJ2QgYWxzbyBsaWtlIHRvIGFzayBmb3IgdGhlIGJhY2tncm91bmQgb2YgdGhpcy4gSXQg
d291bGQgbmV2ZXINCmhhdmUgb2NjdXJyZWQgdG8gbWUgdGhhdCBJIHNob3VsZCBwYXkgYXR0ZW50
aW9uIHRvIHBvc3NpYmxlDQpkaXNjbGFpbWVycyBvciBhbGlrZSBvbiBwYXRjaCBzdWJtaXNzaW9u
cy4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

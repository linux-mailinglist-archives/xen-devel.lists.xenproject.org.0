Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83CF9520
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 17:07:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYdy-0001Pv-PC; Tue, 12 Nov 2019 16:03:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ob2=ZE=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1iUYdx-0001Pq-Jl
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 16:03:49 +0000
X-Inumbo-ID: ff942a4a-0565-11ea-9631-bc764e2007e4
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff942a4a-0565-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 16:03:46 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 12 Nov 2019 16:03:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 12 Nov 2019 16:02:15 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 12 Nov 2019 16:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzrVmUw9JNIyW6Wpkxus2hYTcQz8xXEJJug5YUsk4zfepo0x661JM/SuVXbSnO4wg1v8Bc+7rDXWigPqX9MiaN9A7iWO5hefTo6byx/0QVJ3yqhiza8IP6wPlt6ki/7S9HsWPMwxzGC3ySyERPuOLn/avb0O2ZShb337pF+PbhJUbUqD2Uxd77DYbTsMsxWKmgeIh2mZmhV8dGaThvpXeydySD49EXBrHiKl2Qg2/NwfYqSi8PQUeOoICwIjbhXFtj7ZMCO9iPuaxe3Q4gRXU6svdWy4NbCKxu7QGjN/ZqYFq5jheGiDr0kgVYlG0s8ksOREoSwIFOI9ViZ/8uLy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE9hpd6TfytQNCMG38wyH6Ishld5ske2ih5t8boYnWY=;
 b=W7BcodeX3eKTP9bFrBG+l2tNr07y2GcE1Khn2DtpEkoT6LjH1HzQ78ebssDlRqoujTVgoJdV/bCP70YiPXgyC+sZOfV0JjX0wMyusqzIKtlHO2UG+O1NoVu/OQis6VR1AwIGiIbQGlaNmh8cnPDe2kD3zcs3AeEiNWYp2t+hI5aTJGgWf9voAZUA5IIsNXejbLwHpFcLRQF8+dLfgmOrAYKUT4qQhn8+sONMZX3qwlyWPfbVuW4bCCYdJl/Cvjk+aB08pCxYJkAbAM86ykL3IhAsVVpT/f1n6sGn6lw6w7puPNT17t7pGlW/QX0Z4OSqWlE+3JfnbmSXsM+Qu5iWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3172.namprd18.prod.outlook.com (10.255.137.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 16:02:14 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 16:02:14 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [OSSTEST PATCH 2/2] ts-libvirt-build: Do an out-of-tree build
Thread-Index: AQHVmVI6429aMa0My0KgJaURJTPYn6eHsnIA
Date: Tue, 12 Nov 2019 16:02:14 +0000
Message-ID: <ac4c8f6f-f38b-bb56-ce6d-e0b6780d0293@suse.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
 <20191112120913.25864-2-ian.jackson@eu.citrix.com>
In-Reply-To: <20191112120913.25864-2-ian.jackson@eu.citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:300:4b::33) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [137.65.135.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa12cb69-285c-40b9-8f03-08d76789af31
x-ms-traffictypediagnostic: BY5PR18MB3172:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB31729EDA6A12C23ABEAEB570C6770@BY5PR18MB3172.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(189003)(199004)(7736002)(8676002)(36756003)(8936002)(6436002)(31686004)(316002)(305945005)(229853002)(110136005)(64756008)(6486002)(256004)(81156014)(66446008)(25786009)(81166006)(5660300002)(66556008)(26005)(486006)(52116002)(102836004)(53546011)(6506007)(386003)(476003)(76176011)(6512007)(11346002)(446003)(6246003)(2906002)(66066001)(186003)(14454004)(478600001)(71200400001)(66946007)(86362001)(2501003)(2616005)(966005)(71190400001)(3846002)(107886003)(99286004)(6306002)(6116002)(31696002)(66476007)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3172;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UfNdz4qJA1dWGJ3qXEKsuySlwkKeL4l7ox2x6JFiYPq+Bb5c6PiKgE2l6doz+UGesuLA84plFizDkNBgXva8vZXTwf6pk6EVUyQxW9v4q/vvdAT6a9jWSYpdSgX/0RW+9P+ScHmRvMZxBxrLyPzmkzwoIcbuBrw4FNaOpjy0ed/ss5BKz/okd5zFlfrWtRGOQBgNOIAgI2Ly6uJ2eDDZrld7c9AOUFjlegXO6iw8n+3LAw9oMEYrPltQ1AWkLJBdVGaLgS6rPhZt0xyh3G1cJwqQDAJMbCchmQzE9O5lXErEqsQcj1o7E+sx9xRlnkFjrQsOFgL4RUOA/8CXlUua6Jer9AIPsX9wZj3bUtbNAj+sOFUlLC6a+peFqlYzjeD4sCk96RlJCf1c2EEZ6Ey/JjmZzc194AyLkeCC7iS4bCh3GqffcHl2973Ek7anUuZnPHg3m9HLnN+kp1YE0HKp1AFWAsp7lCa6oQ75K63XZrg=
Content-ID: <F1D8F470251F654092D99627BB72C7AD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa12cb69-285c-40b9-8f03-08d76789af31
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 16:02:14.5804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtQts/sE+mNkI/44507bAkfLjUgjXxijlh+DRy0KNgFQ3Sp7vZzSBCqiHgOl4by7hJCnqCbWrJ9MFWxwuSkXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3172
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] ts-libvirt-build: Do an
 out-of-tree build
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
Cc: Juergen Gross <JGross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTIvMTkgNTowOSBBTSwgSWFuIEphY2tzb24gd3JvdGU6DQo+IFJlY2VudCB2ZXJzaW9u
cyBvZiBsaWJ2aXJ0IGRvIG5vdCBzdXBwb3J0IGluLXRyZWUgYnVpbGRzICghKQ0KDQpJIGFzc3Vt
ZWQgbGlidmlydCdzIGdyYWR1YWwgbW92ZSBmcm9tIGF1dG90b29scyB0byBtZXNvbiB3b3VsZCBh
ZmZlY3QgT1NTVEVTVCwgDQpidXQgbGF0ZXIgcmF0aGVyIHRoYW4gc29vbmVyLiBTb3JyeSBmb3Ig
bm90IG1lbnRpb25pbmcgaXQgZWFybGllciwgYnV0IG5vdyB5b3UgDQpoYXZlIGJlZW4gd2FybmVk
IHRoYXQgbGlidmlydCBpcyBtb3ZpbmcgdG8gbWVzb24gOi0pLiBNZXNvbiBoYXMgYSBzdHJpY3Qg
DQpzZXBhcmF0aW9uIGJldHdlZW4gc291cmNlIGFuZCBidWlsZCBkaXJlY3RvcmllcyBhbmQgc29t
ZSBwcmVwYXJhdG9yeSBwYXRjaGVzIA0Kd2VyZSBwdXNoZWQgdGhhdCBmb3JjZSBzcmNkaXIgIT0g
YnVpbGRkaXINCg0KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9saWJ2aXItbGlzdC8y
MDE5LU9jdG9iZXIvbXNnMDE2ODEuaHRtbA0KDQpEYW5pZWwgcG9zdGVkIGEgbm90ZSBhYm91dCB0
aGlzIGNoYW5nZSB5ZXN0ZXJkYXkNCg0KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9s
aWJ2aXItbGlzdC8yMDE5LU5vdmVtYmVyL21zZzAwMjk5Lmh0bWwNCg0KSSBkaWRuJ3QgcmVhZCBs
aWJ2aXJ0IG1haWwgeWVzdGVyZGF5IG90aGVyd2lzZSBJIHdvdWxkIGhhdmUgZm9yd2FyZGVkIHRo
YXQgdG8gDQp4ZW4tZGV2ZWwuIEkgbmVlZCB0byBiZSBtb3JlIHByb2FjdGl2ZSB3aXRoIGxpYnZp
cnQgY2hhbmdlcyB0aGF0IG1pZ2h0IGFmZmVjdCANCk9TU1RFU1QuLi4NCg0KUmVnYXJkcywNCkpp
bQ0KDQo+IA0KPiBDb3BlIHdpdGggdGhpcyBieSBhbHdheXMgYnVpbGRpbmcgaW4gYSBzdWJkaXJl
Y3RvcnkgYGJ1aWxkJyAoYQ0KPiBzdWJkaXJlY3Rvcnkgb2YgdGhlIHNvdXJjZSB0cmVlKTsgdGhp
cyBpcyB0aGUgYXJyYW5nZW1lbnQgd2hpY2ggdGhlDQo+IGxpYnZpcnQgdXBzdHJlYW0gbWVzc2Fn
ZXMgYW5kIGRvY3VtZW50YXRpb24gbm93IHNlZW0gdG8gcmVjb21tZW5kIChhdA0KPiBsZWFzdCB3
aGVyZSB0aGluZ3MgaGF2ZSBiZWVuIHVwZGF0ZWQpLg0KPiANCj4gSSBjb21wYXJlZCB0aGUgZGlm
ZmVyZW5jZXMgaW4gYnVpbGQgb3V0cHV0IGJldHdlZW4gdGhlIHJlc3VsdHMgb2YgdGhpcw0KPiBi
cmFuY2ggYW5kIGEgcHJldmlvdXMgcGFzc2luZyB4ZW4tdW5zdGFibGUgZmxpZ2h0LiAgVGhlIGxp
YnZpcnQNCj4gbGlicmFyeSB2ZXJzaW9uIGluY3JlYXNlZCBhbmQgYSBmaWxlDQo+ICAgIHVzci9s
b2NhbC9zaGFyZS9saWJ2aXJ0L2NwdV9tYXAvYXJtX2ZlYXR1cmVzLnhtbA0KPiBhcHBlYXJlZC4g
IEkgdGhpbmsgdGhpcyBpcyBqdXN0IGR1ZSB0byBjaGFuZ2VzIGluIHRoZSBsaWJ2aXJ0IHZlcnNp
b24sDQo+IDJjZmY2NWU0YzYwZS4uNzAyMThlMTBiY2RlLCBpbiBwYXJ0aWN1bGFyIDBkZTU0MWJm
YzU3NQ0KPiAgICBjcHVfbWFwOiBTaGlwIGFybV9mZWF0dXJlcy54bWwNCj4gDQo+IEkgYWxzbyB0
ZXN0ZWQgdGhhdCBhIHRlc3Qgam9iLCBidWlsdCB3aXRoIGN1cnJlbnQgbGlidmlydCBhbmQgdGhl
c2UNCj4gb3NzdGVzdCBjaGFuZ2VzLCBwYXNzZXMgYXMgZXhwZWN0ZWQuDQo+IA0KPiBDQzogSmlt
IEZlaGxpZyA8amZlaGxpZ0BzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+IFRlc3RlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgIHRzLWxpYnZpcnQtYnVpbGQgfCAx
MiArKysrKysrLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RzLWxpYnZpcnQtYnVpbGQgYi90cy1saWJ2
aXJ0LWJ1aWxkDQo+IGluZGV4IDJhMzYzZjQzLi5lNzk5ZjAwMyAxMDA3NTUNCj4gLS0tIGEvdHMt
bGlidmlydC1idWlsZA0KPiArKysgYi90cy1saWJ2aXJ0LWJ1aWxkDQo+IEBAIC01OCwxMSArNTgs
MTMgQEAgc3ViIGNvbmZpZygpIHsNCj4gICAgICAgbXkgJGdudWxpYiA9IHN1Ym1vZHVsZV9maW5k
KCRzdWJtb2R1bGVzLCAiZ251bGliIik7DQo+ICAgICAgIHRhcmdldF9jbWRfYnVpbGQoJGhvLCAz
NjAwLCAkYnVpbGRkaXIsIDw8RU5EKTsNCj4gICAgICAgICAgIGNkIGxpYnZpcnQNCj4gKwlta2Rp
ciBidWlsZA0KPiArCWNkIGJ1aWxkDQo+ICAgICAgICAgICBDRkxBR1M9Ii1nIC1JJHhlbnByZWZp
eC9pbmNsdWRlLyIgXFwNCj4gICAgICAgICAgIExERkxBR1M9Ii1nIC1MJHhlbnByZWZpeC9saWIv
IC1XbCwtcnBhdGgtbGluaz0keGVucHJlZml4L2xpYi8iIFxcDQo+ICAgICAgICAgICBQS0dfQ09O
RklHX1BBVEg9IiR4ZW5wcmVmaXgvbGliL3BrZ2NvbmZpZy8iIFxcDQo+ICAgICAgICAgICBHTlVM
SUJfU1JDRElSPSRidWlsZGRpci9saWJ2aXJ0LyRnbnVsaWItPntQYXRofSBcXA0KPiAtICAgICAg
ICAgICAgLi9hdXRvZ2VuLnNoIC0tbm8tZ2l0IFxcDQo+ICsgICAgICAgICAgICAuLi9hdXRvZ2Vu
LnNoIC0tbm8tZ2l0IFxcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1saWJ4
bCAtLXdpdGhvdXQteGVuIC0td2l0aG91dC14ZW5hcGkgLS13aXRob3V0LXNlbGludXggXFwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS13aXRob3V0LWx4YyAtLXdpdGhvdXQtdmJveCAt
LXdpdGhvdXQtdW1sIFxcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aG91dC1x
ZW11IC0td2l0aG91dC1vcGVudnogLS13aXRob3V0LXZtd2FyZSBcXA0KPiBAQCAtNzIsOSArNzQs
OSBAQCBFTkQNCj4gICANCj4gICBzdWIgYnVpbGQoKSB7DQo+ICAgICAgIHRhcmdldF9jbWRfYnVp
bGQoJGhvLCAzNjAwLCAkYnVpbGRkaXIsIDw8RU5EKTsNCj4gLSAgICAgICAgY2QgbGlidmlydA0K
PiAtICAgICAgICAobWFrZSAkbWFrZWZsYWdzIDI+JjEgJiYgdG91Y2ggLi4vYnVpbGQtb2stc3Rh
bXApIHx0ZWUgLi4vbG9nDQo+IC0gICAgICAgIHRlc3QgLWYgLi4vYnVpbGQtb2stc3RhbXAgIy8N
Cj4gKyAgICAgICAgY2QgbGlidmlydC9idWlsZA0KPiArICAgICAgICAobWFrZSAkbWFrZWZsYWdz
IDI+JjEgJiYgdG91Y2ggLi4vLi4vYnVpbGQtb2stc3RhbXApIHx0ZWUgLi4vbG9nDQo+ICsgICAg
ICAgIHRlc3QgLWYgLi4vLi4vYnVpbGQtb2stc3RhbXAgIy8NCj4gICAgICAgICAgIGVjaG8gb2su
DQo+ICAgRU5EDQo+ICAgfQ0KPiBAQCAtODIsNyArODQsNyBAQCBFTkQNCj4gICBzdWIgaW5zdGFs
bCgpIHsNCj4gICAgICAgdGFyZ2V0X2NtZF9idWlsZCgkaG8sIDMwMCwgJGJ1aWxkZGlyLCA8PEVO
RCk7DQo+ICAgICAgICAgICBta2RpciAtcCBkaXN0DQo+IC0gICAgICAgIGNkIGxpYnZpcnQNCj4g
KyAgICAgICAgY2QgbGlidmlydC9idWlsZA0KPiAgICAgICAgICAgbWFrZSAkbWFrZWZsYWdzIGlu
c3RhbGwgREVTVERJUj0kYnVpbGRkaXIvZGlzdA0KPiAgICAgICAgICAgbWtkaXIgLXAgJGJ1aWxk
ZGlyL2Rpc3QvZXRjL2luaXQuZA0KPiAgIEVORA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

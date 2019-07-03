Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066A5E304
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:42:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidc6-0004ww-2y; Wed, 03 Jul 2019 11:39:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hidc4-0004wf-1j
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:39:48 +0000
X-Inumbo-ID: 4148c56e-9d87-11e9-b61f-a7c1adfa3183
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4148c56e-9d87-11e9-b61f-a7c1adfa3183;
 Wed, 03 Jul 2019 11:39:46 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 11:36:09 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 11:38:29 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 11:38:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3153.namprd18.prod.outlook.com (10.255.136.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 11:38:28 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 11:38:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2] x86/ept: pass correct level to p2m_entry_modify
Thread-Index: AQHVMZM7uFiCyG68f06A3zHs6D7pwqa4xHwA
Date: Wed, 3 Jul 2019 11:38:28 +0000
Message-ID: <4ac5b6af-7c89-c72c-a390-a3e0562a8341@suse.com>
References: <20190703113326.2344-1-roger.pau@citrix.com>
In-Reply-To: <20190703113326.2344-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0033.eurprd05.prod.outlook.com
 (2603:10a6:4:67::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45593923-e184-47c0-33c2-08d6ffaaf7af
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3153; 
x-ms-traffictypediagnostic: BY5PR18MB3153:
x-microsoft-antispam-prvs: <BY5PR18MB3153A5D788E590C658C3EA06B3FB0@BY5PR18MB3153.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(53546011)(26005)(66066001)(386003)(102836004)(486006)(446003)(72206003)(4744005)(476003)(2616005)(186003)(6916009)(99286004)(6506007)(76176011)(6246003)(256004)(36756003)(478600001)(66446008)(11346002)(31696002)(5660300002)(73956011)(64756008)(66476007)(66556008)(66946007)(25786009)(14444005)(53936002)(14454004)(6436002)(8676002)(8936002)(80792005)(7736002)(305945005)(6116002)(229853002)(81166006)(31686004)(81156014)(6512007)(3846002)(52116002)(6486002)(2906002)(4326008)(71200400001)(71190400001)(86362001)(316002)(54906003)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3153;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7oV+UsmXjxzKkGKAxH+8CUy4gq/ff4ItigQaeBNZngk/IqZ5YkQ6BITYzEmyCvo9SvCPybcUaYPdhkrgU/y7c2E9fxW6bjeWEoJMFp0mDZWQsROHbV13KGp7yxzSN6H/JbJ2FRgAqo+GUZ/hicGRqfcmI72kTQnZGe3uWFHfaua0VuFVXhFaCPs+bW8IG+3A5ruwZsGJdeJu864I1unuYC4QeKQ7x8YX21iE7JEBbvPAkCpoUGD2bfOkZFasLZWUsJdY8nVn5fKxYXpdA7WbzzogsDmxJk+7/X4ctaYIiwex5KCXjE2/uAGZl8l4Hnqmb3gnxdOVDKhYycmhFVLbDJiZtdTwvvuu/tApO8H/u1xVxbrARpZSgco3jZnwzv+DNF33KzbmedzMBY3Z2Ssi4X3e1fSmntdwnKmemhbghQ8=
Content-ID: <AA312E48A3C6CB479DB6B6B633064F4B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45593923-e184-47c0-33c2-08d6ffaaf7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:38:28.6630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3153
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/ept: pass correct level to
 p2m_entry_modify
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMzozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBFUFQgZGlmZmVy
cyBmcm9tIE5QVCBhbmQgc2hhZG93IHdoZW4gdHJhbnNsYXRpbmcgcGFnZSBvcmRlcnMgdG8gbGV2
ZWxzDQo+IGluIHRoZSBwaHlzbWFwIHBhZ2UgdGFibGVzLiBFUFQgcGFnZSB0YWJsZXMgbGV2ZWwg
Zm9yIG9yZGVyIDAgcGFnZXMgaXMNCj4gMCwgd2hpbGUgTlBUIGFuZCBzaGFkb3cgaW5zdGVhZCB1
c2UgMSwgaWU6IEVQVCBwYWdlIHRhYmxlcyBsZXZlbHMNCj4gc3RhcnRzIGF0IDAgd2hpbGUgTlBU
IGFuZCBzaGFkb3cgc3RhcnRzIGF0IDEuDQo+IA0KPiBGaXggdGhlIHAybV9lbnRyeV9tb2RpZnkg
Y2FsbCBpbiBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIGFsd2F5cyBhZGQNCj4gb25lIHRvIHRo
ZSBsZXZlbCwgaW4gb3JkZXIgdG8gbWF0Y2ggTlBUIGFuZCBzaGFkb3cgdXNhZ2UuDQo+IA0KPiBX
aGlsZSB0aGVyZSBhbHNvIGFkZCBhIGNoZWNrIHRvIGVuc3VyZSBwMm1fZW50cnlfbW9kaWZ5IGlz
IG5ldmVyDQo+IGNhbGxlZCB3aXRoIGxldmVsID09IDAuIFRoYXQgc2hvdWxkIGFsbG93IHRvIGNh
dGNoIGZ1dHVyZSBlcnJvcnMNCj4gcmVsYXRlZCB0byB0aGUgbGV2ZWwgcGFyYW1ldGVyLg0KPiAN
Cj4gRml4ZXM6IGM3YTRjMDg4YWQxYyAoJ3g4Ni9tbTogc3BsaXQgcDJtIGlvcmVxIHNlcnZlciBw
YWdlcyBzcGVjaWFsIGhhbmRsaW5nIGludG8gaGVscGVyJykNCj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

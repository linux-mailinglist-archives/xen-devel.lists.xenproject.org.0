Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B55E05B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 10:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hib3P-00075h-BX; Wed, 03 Jul 2019 08:55:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hib3O-00075c-5Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 08:55:50 +0000
X-Inumbo-ID: 5946f455-9d70-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5946f455-9d70-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 08:55:48 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 08:55:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 08:55:29 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 08:55:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 08:55:28 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 08:55:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH RFC v2 10/10] AMD/IOMMU: correct IRTE updating
Thread-Index: AQHVMO8VcMRLe2IwpkWgp9GM6g8MxKa4mDkA
Date: Wed, 3 Jul 2019 08:55:28 +0000
Message-ID: <2aacdea9-d5a1-eee6-6c1b-7dca6315d8e6@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DF81020000780023B9DF@prv1-mh.provo.novell.com>
 <f3798406-3072-14db-cb15-d88cc1762c55@citrix.com>
In-Reply-To: <f3798406-3072-14db-cb15-d88cc1762c55@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0801CA0045.eurprd08.prod.outlook.com
 (2603:10a6:4:2b::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf87a760-1fb6-497c-5d7c-08d6ff9431f2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB328255412E4CA34D687A96DFB3FB0@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(6506007)(6436002)(316002)(4326008)(229853002)(66946007)(66476007)(72206003)(36756003)(66066001)(53936002)(54906003)(486006)(5660300002)(110136005)(478600001)(6512007)(6486002)(2906002)(25786009)(68736007)(305945005)(31686004)(52116002)(14454004)(2616005)(11346002)(66556008)(3846002)(64756008)(73956011)(80792005)(476003)(66446008)(26005)(256004)(14444005)(71190400001)(71200400001)(102836004)(446003)(7736002)(186003)(31696002)(6116002)(99286004)(76176011)(8936002)(81156014)(6246003)(86362001)(53546011)(8676002)(386003)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 233um8uOdBk493uNjk4RK4q4Kt39qnOUhSYx0z919hn9Iq0VFqlCyL12BOU7Fr9tLHCFnCf8qG7uamWPCT3ZBXVXOJX/1l04ncfY0lkhgs272qxBqtfC+TkQRPxzvOBAunPKXzLvQ9JvdCbGkRCqSNXMoZGBwvxy8/R4adG6MIhtmHzrH3BvK40TaGRH9d2k4odxsLxHBCpczqmItLxpsV1sI2JRFmqIS9Ak+RwwU6DP5btsmP1z33xSU8UEKmfiZbGESOhzrUci8m2z4qx1704iuPeil819B9Kqm6qZB5l7PntKhc86xLigYW7SmRO4mCfA7lfZh2ALsF1G+72IgNpa7UJfBls4EOtGmfbg/2nByVHqUVc2J56mU3h7KgoCfWMYir0wwbDmLErj9wkNRFWIedXRtlV40LIHZ7RWXWw=
Content-ID: <FA61B885E3891948ACCAD7F5617391C5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf87a760-1fb6-497c-5d7c-08d6ff9431f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 08:55:28.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH RFC v2 10/10] AMD/IOMMU: correct IRTE
 updating
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNzowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoyMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBXaGlsZSBmb3IgMzItYml0IElSVEVzIEkg
dGhpbmsgd2UgY2FuIHNhZmVseSBjb250aW51ZSB0byBhc3N1bWUgdGhhdCB0aGUNCj4+IHdyaXRl
cyB3aWxsIHRyYW5zbGF0ZSB0byBhIHNpbmdsZSBNT1YsIHRoZSB1c2Ugb2YgQ01QWENIRzE2QiBp
cyBtb3JlDQo+IA0KPiBUaGUgQ01QWENIRzE2QiBoZXJlIGlzIHN0YWxlLg0KDQpJbmRlZWQsIGFz
IGlzIHRoZSAzMi1iaXQgSVJURSBwYXJ0IG9mIHRoZSBzZW50ZW5jZSAobm93IHRoYXQgSQ0KdXNl
IEFDQ0VTU19PTkNFKCkgYWxyZWFkeSBiZWZvcmUgdGhpcyBwYXRjaCkuDQoNCj4+IGhlYXZ5IGhh
bmRlZCB0aGFuIG5lY2Vzc2FyeSBmb3IgdGhlIDEyOC1iaXQgZm9ybSwgYW5kIHRoZSBmbHVzaGlu
Zw0KPj4gZGlkbid0IGdldCBkb25lIGFsb25nIHRoZSBsaW5lcyBvZiB3aGF0IHRoZSBzcGVjaWZp
Y2F0aW9uIHNheXMuIE1hcmsNCj4+IGVudHJpZXMgdG8gYmUgdXBkYXRlZCBhcyBub3QgcmVtYXBw
ZWQgKHdoaWNoIHdpbGwgcmVzdWx0IGluIGludGVycnVwdA0KPj4gcmVxdWVzdHMgdG8gZ2V0IHRh
cmdldCBhYm9ydGVkLCBidXQgdGhlIGludGVycnVwdHMgc2hvdWxkIGJlIG1hc2tlZA0KPj4gYW55
d2F5IGF0IHRoYXQgcG9pbnQgaW4gdGltZSksIGlzc3VlIHRoZSBmbHVzaCwgYW5kIG9ubHkgdGhl
biB3cml0ZSB0aGUNCj4+IG5ldyBlbnRyeS4gSW4gdGhlIDEyOC1iaXQgSVJURSBjYXNlIHNldCBS
ZW1hcEVuIHNlcGFyYXRlbHkgbGFzdCwgdG8gdGhhdA0KPj4gdGhlIG9yZGVyaW5nIG9mIHRoZSB3
cml0ZXMgb2YgdGhlIHR3byA2NC1iaXQgaGFsdmVzIHdvbid0IG1hdHRlci4NCg0KVGhpcyBsYXN0
IHNlbnRlbmNlIGlzIHN0YWxlIHRvbywgYW5kIGhlbmNlIEkndmUgbm93IHJlbW92ZWQgaXQuDQoN
Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMNCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMNCj4+IEBAIC0yMzgs
OCArMjM4LDcgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2ludHJlbWFwX2VudHJ5KHVuaW9uDQo+PiAg
ICAgICAgICAgYnJlYWs7DQo+PiAgIA0KPj4gICAgICAgY2FzZSBpcnRlMTI4Og0KPj4gLSAgICAg
ICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5yYXdbMF0pID0gMDsNCj4+IC0gICAgICAgIGJh
cnJpZXIoKTsNCj4+ICsgICAgICAgIEFTU0VSVCghZW50cnkucHRyMTI4LT5mdWxsLnJlbWFwX2Vu
KTsNCj4+ICAgICAgICAgICBlbnRyeS5wdHIxMjgtPnJhd1sxXSA9DQo+PiAgICAgICAgICAgICAg
IGNvbnRhaW5lcl9vZigmZnVsbCwgdW5pb24gaXJ0ZTEyOCwgZnVsbCktPnJhd1sxXTsNCj4+ICAg
ICAgICAgICBiYXJyaWVyKCk7DQo+PiBAQCAtMzA4LDYgKzMwNywyMCBAQCBzdGF0aWMgaW50IHVw
ZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX2lvDQo+PiAgICAgICB9DQo+PiAgIA0KPj4gICAgICAg
ZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoaW9tbXUtPnNlZywgcmVxX2lkLCBvZmZzZXQpOw0K
Pj4gKw0KPj4gKyAgICAvKiBUaGUgUmVtYXBFbiBmaWVsZHMgbWF0Y2ggZm9yIGFsbCBmb3JtYXRz
LiAqLw0KPj4gKyAgICB3aGlsZSAoIGlvbW11LT5lbmFibGVkICYmIGVudHJ5LnB0cjMyLT5iYXNp
Yy5yZW1hcF9lbiApDQo+IA0KPiBXaHkgd2hpbGU/wqAgKGFuZCBieSB0aGlzLCB3aGF0IEkgbWVh
biBpcyB0aGF0IHRoaXMgZGVmaW5pdGVseSBuZWVkcyBhDQo+IGNvbW1lbnQsIGJlY2F1c2UgdGhl
IGNvZGUgbG9va3MgbGlrZSBpdCBvdWdodCB0byBiZSBhbiBpZi4pDQoNCldlbGwgLSBzZWUgdGhl
IFJGQyByZW1hcmsgYWZ0ZXIgdGhlIGRlc2NyaXB0aW9uLiBJJ2QgYmUgaGFwcHkgdG8NCmNoYW5n
ZSB0byBpZigpLCBidXQgb25seSBvbiBzb2xpZCBncm91bmRzLiBXaXRob3V0IGNsZWFyDQpndWFy
YW50ZWVzIHRoYXQgbm8gcmFjZXMgYmV0d2VlbiBJUlRFIHVwZGF0ZXMgY2FuIG9jY3VyLCB3ZSBu
ZWVkDQp0byBjb250aW51ZSBmbHVzaGluZyBhcyBsb25nIGFzIHdlIGZpbmQgUmVtYXBFbiB0byBo
YXZlIGdvdCBzZXQNCmFnYWluIGFmdGVyIGEgZmx1c2guIE5vdGUgaG93IHRoZSBuZWNlc3Nhcnkg
bG9jayBndWFyZGluZyBhZ2FpbnN0DQpzdWNoIGlzIGdldHRpbmcgZHJvcHBlZCBhbmQgcmUtYWNx
dWlyZWQgaW4gdGhlIGxvb3AgYm9kaWVzLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

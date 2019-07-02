Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2CF5CC10
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:33:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEAu-0000iy-Fu; Tue, 02 Jul 2019 08:30:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiEAt-0000Z0-5F
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:30:03 +0000
X-Inumbo-ID: 8a06be44-9ca3-11e9-8695-3777c6244593
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a06be44-9ca3-11e9-8695-3777c6244593;
 Tue, 02 Jul 2019 08:30:00 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:29:27 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:29:31 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:29:31 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3409.namprd18.prod.outlook.com (10.255.139.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 08:29:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 08:29:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 13/60] xen/sched: move some per-vcpu items to struct
 sched_unit
Thread-Index: AQHVMBZ1o3Yy0YSI1EOsynhkarGQtKa13jMZgAAJyQCAAPckdIAAF4MAgAAHmICAAAIWgA==
Date: Tue, 2 Jul 2019 08:29:30 +0000
Message-ID: <ae74f899-b3ea-6349-5352-88b07c0dc9d8@suse.com>
References: <be24ad7e-9510-912c-9984-7eec792fae86@suse.com>
 <45139cf0-0b53-1ca2-c8b2-2c2e8813a82d@suse.com>
 <de741925-b823-92ee-c9be-c4cc55da859d@suse.com>
 <0bb81eb9-8303-2dae-2fba-28c73ac74050@suse.com>
 <ee6a055b-2a47-e6ee-91d4-f23bfce5243d@suse.com>
 <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
In-Reply-To: <ace01bb733d0dd624b9e9ee07c5da4f5567a8a8a.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0035.eurprd06.prod.outlook.com
 (2603:10a6:4:17::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7a1f1a8-3a91-4c25-4a1d-08d6fec76705
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3409; 
x-ms-traffictypediagnostic: BY5PR18MB3409:
x-microsoft-antispam-prvs: <BY5PR18MB3409B2A41E12B25DCC6AECEAB3F80@BY5PR18MB3409.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(99286004)(305945005)(73956011)(6636002)(316002)(81156014)(8676002)(110136005)(6116002)(102836004)(66946007)(7736002)(64756008)(8936002)(52116002)(54906003)(486006)(72206003)(14454004)(256004)(11346002)(86362001)(66476007)(66556008)(81166006)(476003)(31696002)(5660300002)(186003)(53546011)(6506007)(386003)(80792005)(3846002)(7416002)(446003)(2616005)(76176011)(66446008)(478600001)(6246003)(71190400001)(71200400001)(31686004)(229853002)(6512007)(68736007)(26005)(66066001)(25786009)(4326008)(6436002)(36756003)(2906002)(53936002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3409;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3ytxMRTsrhJ53rDpfDkD/pza4MrFsEiboGI0q7dbWuFxy4rAzYKBSx0qPhbjN+QHwnEaiZi/MI/n2YbWkO4W5wCn70AU69GnNGGwWGG/v2+1sCkCRd4alwhHTwzI+0wUtGZ3J1OS6v4TuxSBeu6pnr8+s3aZNg/cW9CJCP3eLciKOVM/7FRYGpY6Ym6IbbBZVdFVRhgxb/LUc1IGVvT+g1V5qkBTc0Zjk0YQ2Ho/SEN5KuSfmo+wDT4QIYLReMELDlbJYVyCS68pqwphtRDen2wWh1zYfBxPdAA04mr3XbV/h5a2If47qYC52eG6BTbeyNd3fLpo49a2t/E2AL+pXRL/I3NksZytpuiLprmA+uLVIQamgF01WXOhg3gEN0+4Fuj+dhIM3wOOyPZx/rLel0/LLF4Hhr7TSNxDZitDwdg=
Content-ID: <CC3861776F1A1F41A5045E6D86C09026@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a1f1a8-3a91-4c25-4a1d-08d6fec76705
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:29:30.3298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3409
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxMDoyMSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6DQo+IE9uIFR1ZSwgMjAx
OS0wNy0wMiBhdCAwNzo1NCArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMi4wNy4y
MDE5IDA4OjMwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDAxLjA3LjE5IDE3OjQ2LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4NCj4+Pj4gSG1tLCB0aGF0J3MgaW5kZWVkIHdoYXQgSSB3
YXMgZGVkdWNpbmcsIGJ1dCBob3cgd2lsbCB3ZSBzZWxsIHRoaXMNCj4+Pj4gdG8gcGVvcGxlIGFj
dHVhbGx5IGZpZGRsaW5nIHdpdGggdkNQVSBhZmZpbml0aWVzPyBJIGZvcmVzZWUNCj4+Pj4gZ2V0
dGluZw0KPj4+PiBidWcgcmVwb3J0cyB0aGF0IHRoZSByZXNwZWN0aXZlIHhsIGNvbW1hbmQocykg
ZG8oZXMpbid0IGRvDQo+Pj4+IGFueW1vcmUNCj4+Pj4gd2hhdCBpdCB1c2VkIHRvIGRvLg0KPj4+
DQo+Pj4gVGhlIG5ldyBiZWhhdmlvciBtdXN0IGJlIGRvY3VtZW50ZWQsIHN1cmUuDQo+Pg0KPj4g
RG9jdW1lbnRhdGlvbiBpcyBqdXN0IG9uZSBhc3BlY3QuIE9mdGVuIGVub3VnaCBwZW9wbGUgb25s
eSByZWFkIGRvY3MNCj4+IHdoZW4gd2FudGluZyB0byBpbnRyb2R1Y2UgbmV3IGZ1bmN0aW9uYWxp
dHksIHdoaWNoIEkgY29uc2lkZXIgYSBmYWlyDQo+PiBtb2RlbC4gU3VjaCBwZW9wbGUgd2lsbCBi
ZSBjYXVnaHQgYnkgc3VycHJpc2UgdGhhdCB0aGUgcGlubmluZw0KPj4gYmVoYXZpb3IgZG9lcyBu
b3Qgd29yayB0aGUgc2FtZSB3YXkgYW55bW9yZS4NCj4+DQo+IFRoYXQgaXMgaW5kZWVkIHRoZSBj
YXNlLCBhbmQgd2UgbmVlZCB0byB0aGluayBhYm91dCBob3cgdG8gYWRkcmVzcyBpdCwNCj4gSSBh
Z3JlZS4NCj4gDQo+PiBBbmQgYWdhaW4gLSBpZiBzb21lb25lIHBpbnMgZXZlcnkgdkNQVSB0byBh
IHNpbmdsZSBwQ1BVLCB0aGF0IGxhc3QNCj4+IHN1Y2ggcGlubmluZyBvcGVyYXRpb24gd2lsbCBi
ZSB3aGF0IHRha2VzIGxvbmcgdGVybSBlZmZlY3QuIEFpdWkgYWxsDQo+PiB2Q1BVLXMgaW4gdGhl
IHVuaXQgd2lsbCB0aGVuIGJlIHBpbm5lZCB0byB0aGF0IG9uZSBwQ1BVLCBpLmUuDQo+PiB0aGV5
J2xsIGVpdGhlciBhbGwgY29tcGV0ZSBmb3IgdGhlIG9uZSBwQ1BVJ3MgdGltZSwgb3Igb25seSBv
bmUgb2YNCj4+IHRoZW0gd2lsbCBldmVyIGdldCBzY2hlZHVsZWQuDQo+Pg0KPiBJJ20gbm90IHN1
cmUgSSdtIGdldHRpbmcgdGhpcy4gT24gYW4sIHNheSwgU01UIHN5c3RlbSwgd2l0aCA0IHRocmVh
ZHMNCj4gcGVyIGNvcmUsIGEgdW5pdCBpcyA0IHZDUFVzIGFuZCBhIHBDUFUgaXMgNCB0aHJlYWRz
Lg0KDQpObywgdGhlIG1lYW5pbmcgb2YgcENQVSBpcyBhIHNpbmdsZSB0aHJlYWQgb2YgYSBzaW5n
bGUgY29yZS4gSS5lLg0Kd2hhdCBpcyByZXByZXNlbnRlZCBieSBhIHNpbmdsZSBjcHVtYXNrX3Qg
Yml0Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

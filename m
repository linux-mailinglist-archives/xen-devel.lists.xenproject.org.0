Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07485DE5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveOI-0002ds-6a; Thu, 08 Aug 2019 09:07:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hveOG-0002dm-8d
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:07:20 +0000
X-Inumbo-ID: e70af375-b9bb-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e70af375-b9bb-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 09:07:19 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 09:07:00 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 09:04:26 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 09:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn7KI0GlhdI5Y25sXyhI44g4AvFt2zbfppuSRYGwQQQt4tdH7zigvtuk3xmLcnVGsFFU76ZWiEtelGW73rpmddB+PVpXd0NQyxQwUqEXsn+dkSpolLaxU1NiFY+Zg7Oged97DqQen/C2srRO/Yol7pCpVPxqaDnWMeRG5AvVP3M6OXCvsnIUyZqfqv28xwj/CVah2PdLWGcQg5Ka44otmSH4bIAR1RdXc6rOIDQZbW0xTBy/frD9eYuUNvW6sI5dTLAP2MB93bENJctcDVbW+5o0KCLhXh74MLD873XsR2sOb+Y+B+9nk22orC97E5vp8sRdMXla4eBRF/OhUx5Sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJCrev7ly1mIoHIRA+XFP5EFowGwH7lQv7R3LozRJP8=;
 b=deJEqs3D+NyfxttjvfHwN4Fb6Eh3GmrZsNSfTKCMWR8yz4zkpv/e/goDtHA3Nbe9OC3bFbdNrtauDnksotmiSlQXNKXii7bhVxS2lDvqmd/VB6Ybr0obJljiVt5ACjhl54CS0cQ7LDrtUpSmDtZQvR05pAgVvmBWxCc+ZpBzKBnFeiDSP/Bx3sj5+oXYQTRVraFW/0zrJ6Uk8RvqdEUnw+274+1Kt+fRp7an4oki4kDcfuOTjUBEQMfrdyKmUBsUesIptxtEPW8KNXZ2S58ZIC0HaY0lnXNsDhOcFCPKgFqzqoRVS9Ao0qltzQbwg0EfK48SEpu9W1soV+wfWp2RMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2672.namprd18.prod.outlook.com (20.179.84.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Thu, 8 Aug 2019 09:04:24 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 09:04:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: Terminology for "guest" - Was: [PATCH] docs/sphinx: Introduction
Thread-Index: AQHVTVg9HA+V/L6GaUOhZY0QYGP536bw6jIAgAAF3ZyAAAWxgA==
Date: Thu, 8 Aug 2019 09:04:24 +0000
Message-ID: <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
In-Reply-To: <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:208:1::42) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce081398-7a52-4b19-796d-08d71bdf68c3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2672; 
x-ms-traffictypediagnostic: MN2PR18MB2672:
x-microsoft-antispam-prvs: <MN2PR18MB2672C360C452EA85D4632DC1B3D70@MN2PR18MB2672.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(199004)(189003)(31696002)(66556008)(8676002)(14454004)(446003)(256004)(54906003)(14444005)(11346002)(6512007)(53936002)(6506007)(386003)(81166006)(6246003)(86362001)(6916009)(486006)(53546011)(8936002)(81156014)(52116002)(36756003)(99286004)(76176011)(229853002)(26005)(478600001)(2906002)(316002)(186003)(6436002)(6486002)(25786009)(102836004)(2616005)(476003)(4326008)(66066001)(7736002)(80792005)(5660300002)(3846002)(6116002)(305945005)(71190400001)(64756008)(66446008)(71200400001)(66946007)(66476007)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2672;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NSde2y2hcmzAQjiglxySY/HITJoyi/FtNdfwlOwJJ3GPIT8K3JxKTwjozWmdTTHzS/X+HgLDcSpU0E6Wuf6WnSfYQjrSfjwsxyKhb8HBgTnSuqcKFpfMfM9viPc2176CrauRHGmeJNj9GTmYn9wY6FUIWmBEnJSO2T12jz3AyRDRiXdSfYhlb+dWvIFRs97VPsyntEDrN/1XsVp/m7IqDH9yKx4A+P/1Q2PGX309unNj2avoJ5GmFrXlMqNCjseFb+RFBsZn/N17PtrezrSJvvC7VX5hSIjOoEQgO64dbQfVYOeF2MsN8DkHspBJG5R3l9xJgBAaBWHlyjTL+QcGSkKIUxPUZQUM6lrOhe3JgZ2LiZZNKfSXefKn08VzbzHFidBEVigFRQlQrT1Z4fguZby6eC7h7H1G4i5nCYmTvCk=
Content-ID: <8660180E57A1F54BB6800B57315EB0CA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ce081398-7a52-4b19-796d-08d71bdf68c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 09:04:24.7291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5bKbwQKapF9w2Jy9rFPwCTMBtBDxHmDtL54vdKQ9CXTzSOIahfk+sMHBfvGFWxfUoqoic4oEojFod9SMAWRmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2672
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDgvMDgvMjAx
OSAwNzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwNy4wOC4yMDE5IDIxOjQxLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9kb2NzL2dsb3Nz
YXJ5LnJzdA0KPj4+IEBAIC0wLDAgKzEsMzcgQEANCj4+PiArR2xvc3NhcnkNCj4+PiArPT09PT09
PT0NCj4+PiArDQo+Pj4gKy4uIFRlcm1zIHNob3VsZCBhcHBlYXIgaW4gYWxwaGFiZXRpY2FsIG9y
ZGVyDQo+Pj4gKw0KPj4+ICsuLiBnbG9zc2FyeTo6DQo+Pj4gKw0KPj4+ICvCoMKgIGNvbnRyb2wg
ZG9tYWluDQo+Pj4gK8KgwqDCoMKgIEEgOnRlcm06YGRvbWFpbmAsIGNvbW1vbmx5IGRvbTAsIHdp
dGggdGhlIHBlcm1pc3Npb24gYW5kDQo+Pj4gcmVzcG9uc2liaWxpdHkNCj4+PiArwqDCoMKgwqAg
dG8gY3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLg0KPj4+ICsN
Cj4+PiArwqDCoCBkb21haW4NCj4+PiArwqDCoMKgwqAgQSBkb21haW4gaXMgWGVuJ3MgdW5pdCBv
ZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkgaGFzDQo+Pj4gYXQgdGhlDQo+Pj4g
K8KgwqDCoMKgIG1pbmltdW0gc29tZSBSQU0gYW5kIHZpcnR1YWwgQ1BVcy4NCj4+PiArDQo+Pj4g
K8KgwqDCoMKgIFRoZSB0ZXJtcyA6dGVybTpgZG9tYWluYCBhbmQgOnRlcm06YGd1ZXN0YCBhcmUg
Y29tbW9ubHkgdXNlZA0KPj4+ICvCoMKgwqDCoCBpbnRlcmNoYW5nZWFibHksIGJ1dCB0aGV5IG1l
YW4gc3VidGx5IGRpZmZlcmVudCB0aGluZ3MuDQo+Pj4gKw0KPj4+ICvCoMKgwqDCoCBBIGd1ZXN0
IGlzIGEgc2luZ2xlIHZpcnR1YWwgbWFjaGluZS4NCj4+PiArDQo+Pj4gK8KgwqDCoMKgIENvbnNp
ZGVyIHRoZSBjYXNlIG9mIGxpdmUgbWlncmF0aW9uIHdoZXJlLCBmb3IgYSBwZXJpb2Qgb2YNCj4+
PiB0aW1lLCBvbmUNCj4+PiArwqDCoMKgwqAgZ3Vlc3Qgd2lsbCBiZSBjb21wcmlzZWQgb2YgdHdv
IGRvbWFpbnMsIHdoaWxlIGl0IGlzIGluIHRyYW5zaXQuDQo+Pj4gKw0KPj4+ICvCoMKgIGRvbWlk
DQo+Pj4gK8KgwqDCoMKgIFRoZSBudW1lcmljIGlkZW50aWZpZXIgb2YgYSBydW5uaW5nIDp0ZXJt
OmBkb21haW5gLsKgIEl0IGlzDQo+Pj4gdW5pcXVlIHRvIGENCj4+PiArwqDCoMKgwqAgc2luZ2xl
IGluc3RhbmNlIG9mIFhlbiwgdXNlZCBhcyB0aGUgaWRlbnRpZmllciBpbiB2YXJpb3VzIEFQSXMs
DQo+Pj4gYW5kIGlzDQo+Pj4gK8KgwqDCoMKgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2VxdWVudGlh
bGx5IGZyb20gMC4NCj4+PiArDQo+Pj4gK8KgwqAgZ3Vlc3QNCj4+PiArwqDCoMKgwqAgU2VlIDp0
ZXJtOmBkb21haW5gDQo+Pg0KPj4gSSB0aGluayB5b3Ugd2FudCB0byBtZW50aW9uIHRoZSB1c3Vh
bCBkaXN0aW5jdGlvbiBoZXJlOiBEb20wIGlzLA0KPj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5
IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuDQo+IA0KPiBUbyBiZSBob25lc3QsIEkgaGFkIHRvdGFs
bHkgZm9yZ290dGVuIGFib3V0IHRoYXQuwqAgSSBndWVzcyBub3cgaXMgdGhlDQo+IHByb3BlciB0
aW1lIHRvIHJlaGFzaCBpdCBpbiBwdWJsaWMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoZSB3YXkg
aXQgY3VycmVudGx5IGdldHMgdXNlZCBoYXMgYSBjbGVhciBvciBjb2hlcmVudCBzZXQNCj4gb2Yg
cnVsZXMsIGJlY2F1c2UgSSBjYW4ndCB0aGluayBvZiBhbnkgdG8gZGVzY3JpYmUgaG93IGl0IGRv
ZXMgZ2V0IHVzZWQuDQo+IA0KPiBFaXRoZXIgdGhlcmUgYXJlIGEgY2xlYXIgYW5kIGNvaGVyZW50
IChhbmQgc2ltcGxlISkgc2V0IG9mIHJ1bGVzIGZvcg0KPiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0
IiwgYXQgd2hpY2ggcG9pbnQgdGhleSBjYW4gbGl2ZSBoZXJlIGluIHRoZQ0KPiBnbG9zc2FyeSwg
b3IgdGhlIGZ1enp5IHdheSBpdCBpcyBjdXJyZW50IHVzZWQgc2hvdWxkIGNlYXNlLg0KDQpXaGF0
J3MgZnV6enkgYWJvdXQgRG9tMCBub3QgYmVpbmcgYSBndWVzdCAoZHVlIHRvIGJlaW5nIGEgcGFy
dCBvZiB0aGUNCmhvc3QgaW5zdGVhZCk/DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

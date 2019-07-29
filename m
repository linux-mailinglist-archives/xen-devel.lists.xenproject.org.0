Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F7790E6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8Wj-0000cq-4G; Mon, 29 Jul 2019 16:29:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8Wh-0000cl-AU
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:29:31 +0000
X-Inumbo-ID: 084f09a6-b21e-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 084f09a6-b21e-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 16:29:29 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:29:26 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 16:07:54 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 16:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0dluIBJdWIbtC8I9NNwO1WH25id+Wt1Anw1W750Q9HKKIVNiB4ZXbmt8x/253yTMdWsymUz+LRcW4z6fqAaKYxLvw+lgG1GeZ4UEPZzCb2bJubmVOhiXQmzZ+ANjuuUH0wiSY+PwBRj2AZ1TqF8hZ5UevlApbhyjeR91YQlyeTG1RPpxK4R/vBI4Ela1hSc6ggSlYdQJH90BwClWH7Wm1V0RBZt6m89SHjeNKCAry4cO4A8PsZl/tdp/8RN3qfkvM1ZAxBJmw0mkAXQVy95os8kyE0lVjf8fEn8un5S6rQb3eKlnDj2WVPlPBYD9+gzte87685QUU1imOrxp8cGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na/fnEzAJZTPekTGJj+ch8Zv+/jx1GTTKmI4nfmdgRM=;
 b=gJgMslWUaZXx1d9Fi5JRC0ncvxQnRuACGVnKH++91DRdkq52nc/31lbW6GtDcyPbW1q1XV4Jqbl9y01SFdUH4ldirXZ+HtfaPnXPm2zY/rmhBph7rNiRavjUj4eslNEgw/tNcrE6/USSJ7PH+p8UK+eQFFSjw8PiryHm5qUZZ9P0pjbY6mTBMgcbq5xbDaxhx9ioaJmsNxauSGogmI6p15T9TRAx3b5Yw2+ZgsScawZrXrCHM4RozCbOnV2b0GFZ6qlcoZYm+/IIQW2wU9X+liGdN8DxayzuvpHxiv/u1JVcf51at9/rbMZtbQWrpKZIwFtv3kvRyNgiG2hg1JQ0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3314.namprd18.prod.outlook.com (10.255.138.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 16:07:53 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 16:07:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
Thread-Index: AQHVQ/FLGOl3AfgP2E20kStBm0Ng06bhoW4AgAAjGGqAAAMcAA==
Date: Mon, 29 Jul 2019 16:07:53 +0000
Message-ID: <43997a60-4c4a-0733-e247-b14c302b755a@suse.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-3-andrew.cooper3@citrix.com>
 <c72b3b9a-4e4a-2a6f-3d94-fedf56018b00@suse.com>
 <d13d7b00-e040-6aad-cfbf-f51c4ab5e709@citrix.com>
In-Reply-To: <d13d7b00-e040-6aad-cfbf-f51c4ab5e709@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:6::25)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e591b8c-c35c-486e-81cf-08d7143ee938
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3314; 
x-ms-traffictypediagnostic: BY5PR18MB3314:
x-microsoft-antispam-prvs: <BY5PR18MB3314D18649A199B0F2CBC3A8B3DD0@BY5PR18MB3314.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(189003)(199004)(4326008)(7736002)(316002)(6116002)(86362001)(6486002)(6436002)(6506007)(386003)(53546011)(66066001)(80792005)(25786009)(8936002)(71190400001)(3846002)(31696002)(8676002)(71200400001)(305945005)(6246003)(54906003)(6916009)(478600001)(5660300002)(14454004)(26005)(68736007)(66446008)(66946007)(64756008)(486006)(66556008)(186003)(6512007)(99286004)(36756003)(2906002)(2616005)(476003)(31686004)(446003)(11346002)(52116002)(76176011)(256004)(81156014)(81166006)(14444005)(66476007)(229853002)(53936002)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3314;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4hVuJTa0t6vfeizEXiJHY6Do5u91HFWtLB9tpRo6Dme13q/zUE4eX31XsmL3M3+P5f445c0v2kFTrF+yZG8zSHRVPIhbD5hWge07/f2Gx3nWUD+AntWJ5NeVByslbhRJLFGRFGMpC+iQ7NF/rgZXBtppRmfsiiMy+W3Ug0rjjZMG/JxtzE3kpU3oW9zDyVIcoL8otzJnL+vSxhN2Jlqfb43ZbG/PEHaUqstBCopo9KKcqwu/rz0enkeH+4kEcfuR9rlxQAgVhIa8jj2GMoB/bx0f9Xj3Tgc1exvpYg7JZxsxVOArLrUg97WarfUq50znJNg/Q20aGuWdd1qODOyEzgJcKEurSNkgIwc95A6ymnEWcHLrqcHcWq0w5+HesqAROidS5uUE4bhAnQOqiGBZUSfphMOezhXEl3/1wVlUoZs=
Content-ID: <71616EC719503647914DCE66BAB95FAB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e591b8c-c35c-486e-81cf-08d7143ee938
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 16:07:53.1186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3314
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNzo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMDcvMjAx
OSAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyNi4wNy4yMDE5IDIyOjMyLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29y
LmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oDQo+Pj4gQEAgLTQx
MSw3ICs0MTEsNyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIF9fbXdhaXQodW5zaWduZWQg
bG9uZyBlYXgsIHVuc2lnbmVkIGxvbmcgZWN4KQ0KPj4+ICAgICNkZWZpbmUgSU9CTVBfQllURVMg
ICAgICAgICAgICAgODE5Mg0KPj4+ICAgICNkZWZpbmUgSU9CTVBfSU5WQUxJRF9PRkZTRVQgICAg
MHg4MDAwDQo+Pj4gICAgDQo+Pj4gLXN0cnVjdCBfX3BhY2tlZCBfX2NhY2hlbGluZV9hbGlnbmVk
IHRzc19zdHJ1Y3Qgew0KPj4+ICtzdHJ1Y3QgX19wYWNrZWQgdHNzX3N0cnVjdCB7DQo+Pj4gICAg
ICAgIHVpbnQzMl90IDozMjsNCj4+PiAgICAgICAgdWludDY0X3QgcnNwMCwgcnNwMSwgcnNwMjsN
Cj4+PiAgICAgICAgdWludDY0X3QgOjY0Ow0KPj4+IEBAIC00MjUsNiArNDI1LDcgQEAgc3RydWN0
IF9fcGFja2VkIF9fY2FjaGVsaW5lX2FsaWduZWQgdHNzX3N0cnVjdCB7DQo+Pj4gICAgICAgIC8q
IFBhZHMgdGhlIFRTUyB0byBiZSBjYWNoZWxpbmUtYWxpZ25lZCAodG90YWwgc2l6ZSBpcyAweDgw
KS4gKi8NCj4+PiAgICAgICAgdWludDhfdCBfX2NhY2hlbGluZV9maWxsZXJbMjRdOw0KPj4+ICAg
IH07DQo+Pj4gK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOw0K
Pj4gVGFraW5nIHBhdGNoIDEgdGhpcyBleHBhbmRzIHRvDQo+Pg0KPj4gICAgICAgX19ERUZJTkVf
UEVSX0NQVShfX3NlY3Rpb24oIi5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCIpIFwNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgX19hbGlnbmVkKFBBR0VfU0laRSksIHN0cnVjdCB0c3Nfc3RydWN0
LCBfaW5pdF90c3MpOw0KPj4NCj4+IGFuZCB0aGVuDQo+Pg0KPj4gICAgICAgX19zZWN0aW9uKCIu
YnNzLnBlcmNwdS5wYWdlX2FsaWduZWQiKSBfX2FsaWduZWQoUEFHRV9TSVpFKQ0KPj4gICAgICAg
X190eXBlb2ZfXyhzdHJ1Y3QgdHNzX3N0cnVjdCkgcGVyX2NwdV9faW5pdF90c3M7DQo+Pg0KPj4g
d2hpY2ggaXMgbm90IHdoYXQgeW91IHdhbnQ6IFlvdSBoYXZlIGFuIG9iamVjdCBvZiBzaXplDQo+
PiBzaXplb2Yoc3RydWN0IHRzc19zdHJ1Y3QpIHdoaWNoIGlzIFBBR0VfU0laRSBhbGlnbmVkLiBB
ZmFpY3QgeW91DQo+PiB0aGVyZWZvcmUgc3RpbGwgbGVhayBldmVyeXRoaW5nIHRoYXQgZm9sbG93
cyBpbiB0aGUgc2FtZSBwYWdlLg0KPiANCj4gV2hhdCBkYXRhIG1pZ2h0IHRoaXMgYmU/DQoNCldo
YXRldmVyIHNpdHMgZWFybHkgZW5vdWdoIGluIC5ic3MucGVyY3B1LiBUaGVyZSdzIG5vIHBhZ2Ug
c2l6ZQ0KYWxpZ25tZW50IGVuZm9yY2VkIGJldHdlZW4gdGhlIHR3byBzZWN0aW9ucywgLi4uDQoN
Cj4gRXZlcnkgb2JqZWN0IHB1dCBpbnRvIHRoaXMgc2VjdGlvbiBpcyBzdWl0YWJseSBhbGlnbmVk
LCBzbyBub3RoaW5nIHdpbGwNCj4gc2l0IGluIHRoZSBzbGFjayBiZXR3ZWVuIHRoZSBUU1MgYW5k
IHRoZSBlbmQgb2YgdGhlIHBhZ2UuDQoNCi4uLiBzbyBmb3IgdGhlIG9iamVjdCBiZWluZyBsYXN0
IGluIC5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCBpdA0KaXMgaXRzIHNpemUgdGhhdCBtYXR0ZXJz
LCBub3QgaXRzIGFsaWdubWVudC4NCg0KPj4gUGVyaGFwcyB0aGUgc29sdXRpb24gaXMgYSB0d28t
bGF5ZXIgYXBwcm9hY2g6DQo+Pg0KPj4gc3RydWN0IF9fYWxpZ25lZChQQUdFX1NJWkUpIHhlbl90
c3Mgew0KPj4gICAgICAgc3RydWN0IF9fcGFja2VkIHRzc19zdHJ1Y3Qgew0KPj4gICAgICAgICAg
IC4uLg0KPj4gICAgICAgfTsNCj4+IH07DQo+Pg0KPj4gd2hlcmUgdGhlIGlubmVyIHN0cnVjdHVy
ZSBkZXNjcmliZXMgdGhlIGhhcmR3YXJlIGludGVyZmFjZSBhbmQgdGhlDQo+PiBjb250YWluaW5n
IG9uZSBvdXIgb3duIHJlcXVpcmVtZW50KHMpLiBCdXQgcGVyc29uYWxseSBJIGFsc28NCj4+IHdv
dWxkbid0IG1pbmQgcHV0dGluZyB0aGUgX19hbGlnbmVkKFBBR0VfU0laRSkgcmlnaHQgb24gc3Ry
dWN0DQo+PiB0c3Nfc3RydWN0LCB3aGVyZSBfX2NhY2hlbGluZV9hbGlnbmVkIGhhcyBiZWVuIHNp
dHRpbmcuDQo+IA0KPiBUaGUgb25seSB3YXkgdGhhdCB3b3VsZCBtYWtlIHRoaW5ncyBtb3JlIHJv
YnVzdCBpcyBpZiB4ZW5fdHNzIHdhcyBhDQo+IHVuaW9uIHdpdGggY2hhcls0MDk2XSB0byBleHRl
bmQgaXRzIHNpemUuDQo+IA0KPiBIb3dldmVyLCBJIHRoaW5rIHRoaXMgaXMgb3ZlcmtpbGwsIGdp
dmVuIHRoZSBpbnRlcm5hbHMgb2YNCj4gREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKCkNCj4g
DQo+PiBPZiBjb3Vyc2UgZWl0aGVyIGFwcHJvYWNoIGdvZXMgYWdhaW5zdCB0aGUgaWRlYSBvZiBh
dm9pZGluZyB1c2FnZQ0KPj4gbWlzdGFrZXMgKGFzIHBvaW50ZWQgb3V0IGJ5IG90aGVycyBpbiB0
aGUgdjEgZGlzY3Vzc2lvbiwgaWlyYyk6DQo+PiBUaGVyZSBiZXR0ZXIgd291bGRuJ3QgYmUgYSBu
ZWVkIHRvIGdldCB0aGUgdHdvICJwYWdlIGFsaWduZWQiDQo+PiBhdHRyaWJ1dGVzIGluIHN5bmMs
IGkuZS4gdGhlIGluc3RhbnRpYXRpb24gb2YgdGhlIHN0cnVjdHVyZQ0KPj4gd291bGQgYmV0dGVy
IGVuZm9yY2UgdGhlIHJlcXVlc3RlZCBhbGlnbm1lbnQuIEkndmUgbm90IHRob3VnaHQNCj4+IHRo
cm91Z2ggd2hldGhlciB0aGVyZSdzIHRyaWNrZXJ5IHRvIGFjdHVhbGx5IG1ha2UgdGhpcyB3b3Jr
LCBidXQNCj4+IEknZCBob3BlIHdlIGNvdWxkIGF0IHRoZSB2ZXJ5IGxlYXN0IGRldGVjdCB0aGlu
Z3Mgbm90IGJlaW5nIGluDQo+PiBzeW5jIGF0IGNvbXBpbGUgdGltZS4NCj4gDQo+IFRoZXJlIGlz
IGEgcmVhc29uIHdoeSBJIHB1dCBpbiBhIGxpbmtlciBhc3NlcnRpb24gZm9yIHRoZSBUU1MgYmVp
bmcNCj4gbm9uLWFsaWduZWQuDQoNCkhtbSwgSSBpbmRlZWQgZGlkbid0IGhhdmUgdGhhdCBvbmUg
b24gbXkgcmFkYXIgd2hlbiB3cml0aW5nIHRoZSByZXBseS4NCkhvd2V2ZXIsIGEgY29tcGlsZSB0
aW1lIGRpYWdub3N0aWMgd2FzIHdoYXQgSSB3b3VsZCBwcmVmZXI6IEhhdmluZyB0bw0KYWRkIGxp
bmtlciBhc3NlcnRpb25zIGZvciBlYWNoIGFuZCBldmVyeSBvYmplY3Qgd2UgcHV0IGluIHRoaXMg
bmV3DQpzZWN0aW9uIHdvdWxkbid0IHJlYWxseSBiZSBuaWNlLCBldmVuIGlmIHJpZ2h0IG5vdyB3
ZSBjZXJ0YWlubHkgaG9wZQ0KZm9yIHRoaXMgdG8gYmUgdGhlIG9ubHkgc3VjaCBvYmplY3QuDQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

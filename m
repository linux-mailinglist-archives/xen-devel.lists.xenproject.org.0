Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05128657CF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 15:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlYwx-0001rg-DH; Thu, 11 Jul 2019 13:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlYwv-0001rQ-Mo
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 13:17:25 +0000
X-Inumbo-ID: 371a3674-a3de-11e9-9dc5-9be4685c857f
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 371a3674-a3de-11e9-9dc5-9be4685c857f;
 Thu, 11 Jul 2019 13:17:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 11 Jul 2019 13:17:19 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 11 Jul 2019 12:52:29 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 11 Jul 2019 12:52:29 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2812.namprd18.prod.outlook.com (20.179.50.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Thu, 11 Jul 2019 12:52:28 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 12:52:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v2 2/2] common/grant_table: harden version
 dependent accesses
Thread-Index: AQHVNx797H4kFsFQpE+CSmXDhIWzgKbFYL8A
Date: Thu, 11 Jul 2019 12:52:28 +0000
Message-ID: <92c68b7d-c691-6111-1ac2-246290489317@suse.com>
References: <1562763277-11674-1-git-send-email-nmanthey@amazon.de>
 <1562763277-11674-3-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1562763277-11674-3-git-send-email-nmanthey@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR15CA0026.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::39) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7bb9132-a9a9-4128-51f8-08d705fea129
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2812; 
x-ms-traffictypediagnostic: DM6PR18MB2812:
x-microsoft-antispam-prvs: <DM6PR18MB2812D2F3C8C37EE5911335CAB3F30@DM6PR18MB2812.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(189003)(199004)(52314003)(66066001)(76176011)(8936002)(102836004)(80792005)(71190400001)(66446008)(36756003)(8676002)(26005)(7736002)(81166006)(6512007)(2906002)(86362001)(71200400001)(81156014)(256004)(186003)(31696002)(6246003)(53546011)(52116002)(386003)(6506007)(54906003)(305945005)(53936002)(446003)(66476007)(66556008)(7416002)(316002)(64756008)(2616005)(25786009)(68736007)(6486002)(6916009)(14444005)(3846002)(478600001)(6436002)(6116002)(476003)(14454004)(486006)(4326008)(99286004)(66946007)(31686004)(5660300002)(229853002)(11346002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2812;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m+V3SLPaK/Q9EXpDpm5o1Vm7MH+ax8It0YLPJw0L7Lpde33yHsWXLX/PnKRUVdpiAMWTgWxB9h/4cawiiJTOAhGhHulPy81diNdU9tfVj8ILCHPhFgZ4ULEFkWwct3st+3qpkco5SkQS+QebdyW0khX5NEVCatZQ+NjqtQtjoX+QX1bWp11KK7U3DODZ6HkGT8CiSy2D/Kb0K1L6+8NFAtHWuWa5U0XtvOS0HR2d9I8uMCiQ8aYZoocXJSQYUyQgAYTiqs+zmPROL26lkRnZHCw9+z2i77x5iZqZpIKGVSYkmFsiLnaHb/fovQB7pI6KQvgBmax/QLKYqnpQTfuu/2NE25aHHFGqmTdV3tkkBLh2bDniNhaJCtjOyF0vTrDO/BMV64vIRJ82C45xN4D2rP+u1LOOR4vJSpCsJsTawjs=
Content-ID: <F15A7B395BEF75439D7E8590034ECB02@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bb9132-a9a9-4128-51f8-08d705fea129
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 12:52:28.1195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2812
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v2 2/2] common/grant_table:
 harden version dependent accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDcuMjAxOSAxNDo1NCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBHdWVzdHMgY2Fu
IGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxl
ZA0KPiBkYXRhIHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkg
bG9hZHMgYWZ0ZXIgYm91bmQNCj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBEZXBlbmRpbmcgb24g
dGhlIGdyYW50IHRhYmxlIHZlcnNpb24sIHRoZQ0KPiBzaXplIG9mIGVsZW1lbnRzIGluIGNvbnRh
aW5lcnMgZGlmZmVyLiBBcyB0aGUgYmFzZSBkYXRhIHN0cnVjdHVyZSBpcw0KPiBhIHBhZ2UsIHRo
ZSBudW1iZXIgb2YgZWxlbWVudHMgcGVyIHBhZ2UgYWxzbyBkaWZmZXJzLiBDb25zZXF1ZW50bHks
DQo+IGJvdW5kIGNoZWNrcyBhcmUgdmVyc2lvbiBkZXBlbmRlbnQsIHNvIHRoYXQgc3BlY3VsYXRp
dmUgZXhlY3V0aW9uIGNhbg0KPiBoYXBwZW4gaW4gc2V2ZXJhbCBzdGFnZXMsIHRoZSBib3VuZCBj
aGVjayBhcyB3ZWxsIGFzIHRoZSB2ZXJzaW9uIGNoZWNrLg0KPiANCj4gVGhpcyBjb21taXQgbWl0
aWdhdGVzIGNhc2VzIHdoZXJlIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyBjb3VsZCBoYXBwZW4NCj4g
ZHVlIHRvIHRoZSB2ZXJzaW9uIGNvbXBhcmlzb24uIEluIGNhc2VzLCB3aGVyZSBubyBkaWZmZXJl
bnQgbWVtb3J5DQo+IGxvY2F0aW9ucyBhcmUgYWNjZXNzZWQgb24gdGhlIGNvZGUgcGF0aCB0aGF0
IGZvbGxvdyBhbiBpZiBzdGF0ZW1lbnQsDQo+IG5vIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQuIE5v
IGRpZmZlcmVudCBtZW1vcnkgbG9jYXRpb25zIGFyZSBhY2Nlc3NlZA0KPiBpbiB0aGUgZm9sbG93
aW5nIGZ1bmN0aW9ucyBhZnRlciBhIHZlcnNpb24gY2hlY2s6DQo+IA0KPiAgICogZ250dGFiX3Nl
dHVwX3RhYmxlOiBvbmx5IGNhbGN1bGF0ZWQgbnVtYmVyc2kgYXJlIHVzZWQsIGFuZCB0aGVuDQo+
ICAgICAgICAgIGZ1bmN0aW9uIGdudHRhYl9ncm93X3RhYmxlIGlzIGNhbGxlZCwgd2hpY2ggaXMg
dmVyc2lvbiBwcm90ZWN0ZWQNCj4gDQo+ICAgKiBnbnR0YWJfdHJhbnNmZXI6IHRoZSBjYXNlIHRo
YXQgZGVwZW5kcyBvbiB0aGUgdmVyc2lvbiBjaGVjayBqdXN0IGdldHMNCj4gICAgICAgICAgaW50
byBjb3B5aW5nIGEgcGFnZSBvciBub3QNCj4gDQo+ICAgKiBhY3F1aXJlX2dyYW50X2Zvcl9jb3B5
OiB0aGUgbm90IGZpeGVkIGNvbXBhcmlzb24gaXMgb24gdGhlIGFib3J0IHBhdGgNCj4gICAgICAg
ICAgYW5kIGRvZXMgbm90IGFjY2VzcyBvdGhlciBzdHJ1Y3R1cmVzLCBhbmQgb24gdGhlIGVsc2Ug
YnJhbmNoDQo+ICAgICAgICAgIGFjY2Vzc2VzIG9ubHkgc3RydWN0dXJlcyB0aGF0IGhhdmUgYmVl
biB2YWxpZGF0ZWQgYmVmb3JlDQo+IA0KPiAgICogZ250dGFiX3NldF92ZXJzaW9uOiBhbGwgYWNj
ZXNzaWJsZSBkYXRhIGlzIGFsbG9jYXRlZCBmb3IgYm90aCB2ZXJzaW9ucw0KDQpPbiB2MSBJIGRp
ZCBzYXkgIlRoZSB2ZXJ5IGZpcnN0IGxvb3AgaXMgc2FmZSBvbmx5IGJlY2F1c2UgbnJfZ3JhbnRf
ZW50cmllcygpDQppcy4iIEJ1dCBhbnl3YXksIC4uLg0KDQo+ICAgICAgICAgIEZ1cnRoZXJtb3Jl
LCB0aGUgZnVuY3Rpb25zIGdudHRhYl9wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzIGFuZA0KPiAgICAg
ICAgICBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzIHJlY2VpdmVkIGEgYmxvY2tfc3Bl
Y3VsYXRpb24NCj4gICAgICAgICAgbWFjcm8uIEhlbmNlLCB0aGlzIGNvZGUgd2lsbCBvbmx5IGJl
IGV4ZWN1dGVkIG9uY2UgdGhlIGNvcnJlY3QNCj4gICAgICAgICAgdmVyc2lvbiBpcyB2aXNpYmxl
IGluIHRoZSBhcmNoaXRlY3R1cmFsIHN0YXRlLg0KPiANCj4gICAqIGdudHRhYl9yZWxlYXNlX21h
cHBpbmdzOiB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbmx5IGR1cmluZyBkb21haW4NCj4gICAg
ICAgICBkZXN0cnVjdGlvbiBhbmQgY29udHJvbCBpcyBub3QgcmV0dXJuZWQgdG8gdGhlIGd1ZXN0
DQo+IA0KPiAgICogbWVtX3NoYXJpbmdfZ3JlZl90b19nZm46IHNwZWN1bGF0aW9uIHdpbGwgYmUg
c3RvcGVkIGJ5IHRoZSBzZWNvbmQgaWYNCj4gICAgICAgICBzdGF0ZW1lbnQsIGFzIHRoYXQgcGxh
Y2VzIGEgYmFycmllciBvbiBhbnkgcGF0aCB0byBiZSBleGVjdXRlZC4NCj4gDQo+ICAgKiBnbnR0
YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm46IG5vIHZlcnNpb24gZGVwZW5kZW50IGNoZWNrLCBiZWNh
dXNlIGFsbA0KPiAgICAgICAgIGFjY2Vzc2VzLCBleGNlcHQgdGhlIGd0LT5zdGF0dXNbaWR4XSwg
ZG8gbm90IHBlcmZvcm0gaW5kZXgtYmFzZWQNCj4gICAgICAgICBhY2Nlc3Nlcywgb3Igc3BlY3Vs
YXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGluIHRoZQ0KPiAgICAgICAgIGdudHRhYl9ncm93
X3RhYmxlIGZ1bmN0aW9uIGNhbGwuDQo+IA0KPiAgICogZ250dGFiX3VzYWdlX3ByaW50OiBjYW5u
b3QgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBndWVzdA0KPiANCj4gVGhpcyBpcyBwYXJ0IG9mIHRoZSBz
cGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

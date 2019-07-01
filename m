Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C75C073
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyOZ-0001HK-Qm; Mon, 01 Jul 2019 15:39:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhyOY-0001HE-61
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:39:06 +0000
X-Inumbo-ID: 4cc6d236-9c16-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4cc6d236-9c16-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 15:39:04 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:38:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:32:38 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:32:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 15:32:37 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:32:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Alexandru Stefan ISAILA
 <aisaila@bitdefender.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a11zaAgAAH7sGAAAUTAA==
Date: Mon, 1 Jul 2019 15:32:37 +0000
Message-ID: <9096a851-2102-26f4-dd57-d63f7719bf68@suse.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <b7379982-20d5-3e2f-0957-e038bb08b5cf@bitdefender.com>
In-Reply-To: <b7379982-20d5-3e2f-0957-e038bb08b5cf@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0024.eurprd05.prod.outlook.com
 (2603:10a6:10:36::37) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f60c2333-f1fb-4760-3a4f-08d6fe395898
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB310744E8B94DCD8989C86E44B3F90@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(76176011)(53936002)(81166006)(86362001)(4326008)(478600001)(68736007)(3846002)(6116002)(6506007)(53546011)(386003)(81156014)(102836004)(6512007)(99286004)(7416002)(52116002)(31696002)(66446008)(73956011)(6486002)(26005)(8936002)(6246003)(31686004)(186003)(25786009)(6436002)(256004)(14444005)(71190400001)(71200400001)(229853002)(5660300002)(110136005)(66066001)(316002)(66946007)(486006)(72206003)(2906002)(2616005)(476003)(446003)(11346002)(36756003)(14454004)(80792005)(7736002)(54906003)(305945005)(66556008)(66476007)(64756008)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L5p2+6o8wS8CI9wjXMak+tGkA7IcTJbuIf3CGHI5pAO+zn6gRTQBKWh+Im8f5bNNfgCXJ4koEa0ZzUIugjHQtDQ9e/IQ+fc+lhK6h3Q9kbjokyg9dUMdF5Nms7LjRgDUTb/e+aSY7ohRLbh73+/mWDaz4vsRemcyF2Kg0pLwxUMhmt0++TXhUUVtwQgsuHpmLLcOzKGkaAwpfQE4G3tWRR/gSt4oYijTthtANXd0xlqRq2XJuzn+GhMEgRA+M53QeI/9DWv4QWOOTKIqXDD1O4buW6IMKgVyL6tG13vuWd4ngTg+vRr6QuW68koF5UYryL3TP/VwyCT/YxcoKU3uV6l0GTUMXEnYsNkzcqPEo5KOaJf5t7kzBdsPJbcR0/Bl7rugXR2zNeMCQa+ZIg5LOhj27qNGH0b1XJvCEkJTPDc=
Content-ID: <D3378C5A93502545B1F3AA959D480C03@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f60c2333-f1fb-4760-3a4f-08d6fe395898
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:32:37.5764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3107
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNzoxMywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0KPiBPbiA3LzEvMTkg
NTo0NSBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDAx
LjA3LjIwMTkgMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDA0LjA2LjE5IGF0
IDEzOjQ5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+PiBUaGlzIHBhdGNo
IGFpbXMgdG8gaGF2ZSBtZW0gYWNjZXNzIHZtIGV2ZW50cyBzZW50IGZyb20gdGhlIGVtdWxhdG9y
Lg0KPj4+PiBUaGlzIGlzIHVzZWZ1bCB3aGVyZSB3ZSB3YW50IHRvIG9ubHkgZW11bGF0ZSBhIHBh
Z2Ugd2FsayB3aXRob3V0DQo+Pj4+IGNoZWNraW5nIHRoZSBFUFQsIGJ1dCB3ZSBzdGlsbCB3YW50
IHRvIGNoZWNrIHRoZSBFUFQgd2hlbiBlbXVsYXRpbmcNCj4+Pj4gdGhlIGluc3RydWN0aW9uIHRo
YXQgY2F1c2VkIHRoZSBwYWdlIHdhbGsuIEluIHRoaXMgY2FzZSwgdGhlIG9yaWdpbmFsDQo+Pj4+
IEVQVCBmYXVsdCBpcyBjYXVzZWQgYnkgdGhlIHdhbGsgdHJ5aW5nIHRvIHNldCB0aGUgYWNjZXNz
ZWQgb3IgZGlydHkNCj4+Pj4gYml0cywgYnV0IGV4ZWN1dGluZyB0aGUgaW5zdHJ1Y3Rpb24gaXRz
ZWxmIG1pZ2h0IGFsc28gY2F1c2UgYW4gRVBUDQo+Pj4+IGZhdWx0IGlmIHBlcm1pdHRlZCB0byBy
dW4sIGFuZCB0aGlzIHNlY29uZCBmYXVsdCBzaG91bGQgbm90IGJlIGxvc3QuDQo+Pj4NCj4+PiBJ
J20gYWZyYWlkIEkgc3RpbGwgY2FuJ3QgdHJhbnNsYXRlIHRoaXMgaW50byB3aGF0IGV4YWN0bHkg
aXMgd2FudGVkIGFuZA0KPj4+IHdoeS4gV2hpbGUgdHlwaWNhbGx5IHdlIGRvbid0IHVzZSBleGFt
cGxlcyB0byBkZW1vbnN0cmF0ZSB0aGF0IGlzDQo+Pj4gd2FudGVkIGluIGNvbW1pdCBtZXNzYWdl
cywgSSB0aGluayB0aGlzIGlzIGEgcmF0aGVyIGdvb2QgY2FuZGlkYXRlDQo+Pj4gZm9yIGFjdHVh
bGx5IHVzaW5nIHN1Y2ggYW4gYXBwcm9hY2guIFRoaXMgbWF5IHRoZW4gLi4uDQo+Pj4NCj4+Pj4g
V2UgdXNlIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKCkgdG8gaW50ZXJjZXB0IHIvdyBhY2Nlc3Mg
YW5kDQo+Pj4+IF9faHZtX2NvcHkoKSB0byBpbnRlcmNlcHQgZXhlYyBhY2Nlc3MuDQo+Pj4+DQo+
Pj4+IEZpcnN0IHdlIHRyeSB0byBzZW5kIGEgdm0gZXZlbnQgYW5kIGlmIHRoZSBldmVudCBpcyBz
ZW50IHRoZW4gZW11bGF0aW9uDQo+Pj4+IHJldHVybnMgWDg2RU1VTF9SRVRSWSBpbiBvcmRlciB0
byBzdG9wIGVtdWxhdGlvbiBvbiBpbnN0cnVjdGlvbnMgdGhhdA0KPj4+PiB1c2UgYWNjZXNzIHBy
b3RlY3RlZCBwYWdlcy4gSWYgdGhlIGV2ZW50IGlzIG5vdCBzZW50IHRoZW4gdGhlDQo+Pj4+IGVt
dWxhdGlvbiBnb2VzIG9uIGFzIGV4cGVjdGVkLg0KPj4+DQo+Pj4gLi4uIGFsc28gaGVscCB1bmRl
cnN0YW5kaW5nIHRoaXMgcGFydCwgd2hpY2ggSSBjb250aW51ZSB0byBiZSBjb25mdXNlZA0KPj4+
IGJ5LCB0b28uDQo+IA0KPiBTaW1wbHkgcHV0LCB0aGUgaW50cm9zcGVjdGlvbiBhZ2VudCB3YW50
cyB0byB0cmVhdCBhbGwgQS9EIGJpdCB3cml0ZXMgYXMgYmVuaWduLiBSZWNlaXZpbmcgdm1fZXZl
bnRzIGFib3V0IHRoZW0gaXMgYSBiaWcgcGVzc2ltaXphdGlvbiwgYW5kIHdlIHdhbnQgdG8gb3B0
aW1pemUuDQo+IA0KPiBXZSdkIGxpa2UgdG8gZmlsdGVyIHRoZXNlIGV2ZW50cyBvdXQuDQo+IA0K
PiBUbyB0aGlzIGVuZCwgd2UncmUgY3VycmVudGx5IChpbiB0aGUgcHJlc2VudCBpbmNhcm5hdGlv
biBvZiB0aGUgWGVuIGNvZGUpIGZ1bGx5IGVtdWxhdGluZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQ
IHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMgYW4gRVBUIGZhdWx0IHdpdGggbnBmZWMua2luZCAhPSBu
cGZlY19raW5kX3dpdGhfZ2xhLiBUaGlzIGlzLCBob3dldmVyLCBpbmNvcnJlY3QsIGJlY2F1c2Ug
dGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRlbHkgY2F1c2UgYW4gRVBUIGZh
dWx0IG9mIGl0cyBvd24gKHdoaWxlIGFjY2Vzc2luZyBhIF9kaWZmZXJlbnRfIHBhZ2UgZnJvbSB0
aGUgb3JpZ2luYWwgb25lLCB3aGVyZSBBL0Qgd2VyZSBzZXQpLg0KPiANCj4gV2UndmUgdHJpZWQg
dG8gc29sdmUgdGhpcyBieSBhY3R1YWxseSB3cml0aW5nIHRoZSBBL0QgYml0cyBhbmQgcmV0dXJu
aW5nIGZyb20gcDJtX21lbV9hY2Nlc3NfY2hlY2soKSwgaG93ZXZlciB0aGF0IGhhcyBsZWQgdG8g
YSBzbGlnaHRseSBwaGlsb3NvcGhpY2FsIGRpc2N1c3Npb24gYWJvdXQgdGhlIHByb3BlciB3YXkg
dG8gYWNoaWV2ZSBvdXIgZ29hbHMgd2hpbGUgdGFraW5nIGludG8gYWNjb3VudCBzcGVjdWxhdGl2
ZSBzZXR0aW5nIG9mIHRoZXNlIGJpdHMuIFRoZSBpc3N1ZXMgcmFpc2VkIGhhdmUgbm90IGJlZW4g
c2F0aXNmYWN0b3JpbHkgYW5zd2VyZWQgaW4gYW4gYXV0aG9yaXRhdGl2ZSBtYW5uZXIgdG8gdGhp
cyBkYXkuDQo+IA0KPiBTbyB0aGUgb25seSBvcHRpb24gd2Ugc2VlbSB0byBoYXZlIGxlZnQgYXQg
dGhpcyBwb2ludCBpcyB0byBwZXJmb3JtIHRoZSB3aG9sZSBlbXVsYXRpb24sIF93aGlsZV8gaWdu
b3JpbmcgRVBUIHJlc3RyaWN0aW9ucyBmb3IgdGhlIHdhbGsgcGFydCwgYW5kIHRha2luZyB0aGVt
IGludG8gYWNjb3VudCBmb3IgdGhlICJhY3R1YWwiIGVtdWxhdGluZyBvZiB0aGUgaW5zdHJ1Y3Rp
b24gQCBSSVAuDQo+IA0KPiBJZiB3ZSdyZSBzZW5kaW5nIG91dCBhIHZtX2V2ZW50LCB0aGVuIHdl
IGRvbid0IHdhbnQgdGhlIGVtdWxhdGlvbiB0byBjb21wbGV0ZSAtIHNpbmNlIGluIHRoYXQgY2Fz
ZSB3ZSB3b24ndCBiZSBhYmxlIHRvIHZldG8gd2hhdGV2ZXIgaXMgZG9pbmcuIFRoYXQgd291bGQg
bWVhbiB0aGF0IHdlIGNhbid0IGFjdHVhbGx5IHByZXZlbnQgYW55IG1hbGljaW91cyBhY3Rpdml0
eSB0aGF0IGhhcHBlbnMgaGVyZSwgaW5zdGVhZCB3ZSdkIG9ubHkgYmUgYWJsZSB0byByZXBvcnQg
b24gaXQuDQo+IA0KPiBTbyB3aGVuIHdlIHNlZSBhICJzZW5kLXZtX2V2ZW50IiBjYXNlIHdoaWxl
IGVtdWxhdGluZywgd2UgbmVlZCB0byBkbyB0d28gdGhpbmdzOg0KPiANCj4gMS4gc2VuZCB0aGUg
ZXZlbnQgb3V0Ow0KPiAyLiBfZG9uJ3RfIGNvbXBsZXRlIHRoZSBlbXVsYXRpb24gKHJldHVybiBY
ODZFTVVMX1JFVFJZKS4NCj4gDQo+IFdoZW4gMi4gaGFwcGVucywgd2UnbGwgaGl0IGh2bV92bV9l
dmVudF9kb19yZXN1bWUoKSBhZ2FpbiBfYWZ0ZXJfIHRoZSBpbnRyb3NwZWN0aW9uIGFnZW50IHRy
ZWF0cyB0aGUgZXZlbnQgYW5kIHJlc3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlIGluc3RydWN0
aW9uIGF0IFJJUCB3aWxsIGJlIGZ1bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkg
aWYgdGhlIGludHJvc3BlY3Rpb24gYXBwbGljYXRpb24gYWxsb3dzIGl0LCBhbmQgdGhlIGd1ZXN0
IHdpbGwgY29udGludWUgdG8gcnVuIHBhc3QgdGhlIGluc3RydWN0aW9uLg0KPiANCj4gVGhhdCdz
IG91ciBwbGFuLCBhbnl3YXkuIEhvcGVmdWxseSB3ZSdyZSBub3QgZ29pbmcgaW4gYSB3cm9uZyBk
aXJlY3Rpb24gYWJvdXQgaXQgKGFsbCBoZWxwIGlzIHZlcnkgbXVjaCBhcHByZWNpYXRlZCkuDQo+
IA0KPiBJIGhvcGUgdGhpcyBoYXMgbWFkZSB0aGluZyBjbGVhcmVyLg0KDQpJIHRoaW5rIHNvLCB5
ZXMsIGFuZCBJJ20gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IGluIHJlcGx5IHRvIGFuDQpl
YXJsaWVyIHZlcnNpb24geW91J3ZlIGFscmVhZHkgb25jZSBleHBsYWluZWQgdGhpcy4gVGhlIHRo
aW5nIGlzIC0NCnRoZSBleHBsYW5hdGlvbiBuZWVkcyB0byBjb21lIF93aXRoXyB0aGUgcGF0Y2gs
IG5vdCBfYWZ0ZXJfIGl0Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

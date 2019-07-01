Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728205BCC0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 15:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhwCz-0005Qz-6d; Mon, 01 Jul 2019 13:19:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhwCx-0005Qp-Li
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 13:18:59 +0000
X-Inumbo-ID: c5f6f174-9c02-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c5f6f174-9c02-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 13:18:57 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 13:18:35 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 13:13:58 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 13:13:58 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3361.namprd18.prod.outlook.com (10.255.138.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 13:13:57 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 13:13:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhsw==
Date: Mon, 1 Jul 2019 13:13:56 +0000
Message-ID: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::28)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9503ad42-e2b2-4f23-77f0-08d6fe25f91f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3361; 
x-ms-traffictypediagnostic: BY5PR18MB3361:
x-microsoft-antispam-prvs: <BY5PR18MB33619AAE1C49ECBD2241E160B3F90@BY5PR18MB3361.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(136003)(39850400004)(376002)(346002)(189003)(199004)(186003)(6486002)(66556008)(52116002)(64756008)(66476007)(7736002)(73956011)(6246003)(8936002)(7416002)(25786009)(36756003)(305945005)(14454004)(2616005)(478600001)(66066001)(5660300002)(66946007)(476003)(66446008)(8676002)(53936002)(99286004)(72206003)(31686004)(486006)(81166006)(4326008)(6436002)(3846002)(6116002)(81156014)(53546011)(6512007)(80792005)(54906003)(386003)(86362001)(6506007)(26005)(316002)(14444005)(229853002)(256004)(31696002)(71200400001)(68736007)(2906002)(71190400001)(6916009)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3361;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WivRuGBy3XqXhXGB0YNbsQbrOR4CZFRqgbG1vVSKuJQFVnkra2VGciYtbzRPcIaPPZYfRmnjLntLMI4cLRA13BzL3DcQT+NFYaa2wxSHw/5yyuKd+8FEd2SKQK3SsKiS8ZWInA9kXilOUGZFqY83idNiV5BLAh+NzLLkNXwd2fd5IDVzx0lq4qlUAD7fFTE9/YFYnEbeaXAV83McXHPkqBl3LWdsTSVjbBlzjgI5rj6c7N0opQaKJ4+Wu2EzoYQMCW3+0g+D+60TqIOm3+3rGIL8gkL6+VU+GsZAtFPjp2/0rERkNt2fmzIMUwScjbIn1hAVf7fLVSYP7h9a4RgssEJi1YVY9Clv8hbNMY8zjMMEY9uFrO4ADbK2Pxg1hEUcrSfaP0yU0Exv55FAohCNWzCPmVA7kpGaro6XfeGKbwc=
Content-ID: <B2A870D85EB5DD4893E2776150EC4B1D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9503ad42-e2b2-4f23-77f0-08d6fe25f91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 13:13:56.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3361
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
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul
 Durrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDEzOjQ5LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Og0KPiBUaGlzIHBhdGNoIGFpbXMgdG8gaGF2ZSBtZW0gYWNjZXNzIHZtIGV2ZW50cyBzZW50IGZy
b20gdGhlIGVtdWxhdG9yLg0KPiBUaGlzIGlzIHVzZWZ1bCB3aGVyZSB3ZSB3YW50IHRvIG9ubHkg
ZW11bGF0ZSBhIHBhZ2Ugd2FsayB3aXRob3V0DQo+IGNoZWNraW5nIHRoZSBFUFQsIGJ1dCB3ZSBz
dGlsbCB3YW50IHRvIGNoZWNrIHRoZSBFUFQgd2hlbiBlbXVsYXRpbmcNCj4gdGhlIGluc3RydWN0
aW9uIHRoYXQgY2F1c2VkIHRoZSBwYWdlIHdhbGsuIEluIHRoaXMgY2FzZSwgdGhlIG9yaWdpbmFs
DQo+IEVQVCBmYXVsdCBpcyBjYXVzZWQgYnkgdGhlIHdhbGsgdHJ5aW5nIHRvIHNldCB0aGUgYWNj
ZXNzZWQgb3IgZGlydHkNCj4gYml0cywgYnV0IGV4ZWN1dGluZyB0aGUgaW5zdHJ1Y3Rpb24gaXRz
ZWxmIG1pZ2h0IGFsc28gY2F1c2UgYW4gRVBUDQo+IGZhdWx0IGlmIHBlcm1pdHRlZCB0byBydW4s
IGFuZCB0aGlzIHNlY29uZCBmYXVsdCBzaG91bGQgbm90IGJlIGxvc3QuDQoNCkknbSBhZnJhaWQg
SSBzdGlsbCBjYW4ndCB0cmFuc2xhdGUgdGhpcyBpbnRvIHdoYXQgZXhhY3RseSBpcyB3YW50ZWQg
YW5kDQp3aHkuIFdoaWxlIHR5cGljYWxseSB3ZSBkb24ndCB1c2UgZXhhbXBsZXMgdG8gZGVtb25z
dHJhdGUgdGhhdCBpcw0Kd2FudGVkIGluIGNvbW1pdCBtZXNzYWdlcywgSSB0aGluayB0aGlzIGlz
IGEgcmF0aGVyIGdvb2QgY2FuZGlkYXRlDQpmb3IgYWN0dWFsbHkgdXNpbmcgc3VjaCBhbiBhcHBy
b2FjaC4gVGhpcyBtYXkgdGhlbiAuLi4NCg0KPiBXZSB1c2UgaHZtZW11bF9tYXBfbGluZWFyX2Fk
ZHIoKSB0byBpbnRlcmNlcHQgci93IGFjY2VzcyBhbmQNCj4gX19odm1fY29weSgpIHRvIGludGVy
Y2VwdCBleGVjIGFjY2Vzcy4NCj4gDQo+IEZpcnN0IHdlIHRyeSB0byBzZW5kIGEgdm0gZXZlbnQg
YW5kIGlmIHRoZSBldmVudCBpcyBzZW50IHRoZW4gZW11bGF0aW9uDQo+IHJldHVybnMgWDg2RU1V
TF9SRVRSWSBpbiBvcmRlciB0byBzdG9wIGVtdWxhdGlvbiBvbiBpbnN0cnVjdGlvbnMgdGhhdA0K
PiB1c2UgYWNjZXNzIHByb3RlY3RlZCBwYWdlcy4gSWYgdGhlIGV2ZW50IGlzIG5vdCBzZW50IHRo
ZW4gdGhlDQo+IGVtdWxhdGlvbiBnb2VzIG9uIGFzIGV4cGVjdGVkLg0KDQouLi4gYWxzbyBoZWxw
IHVuZGVyc3RhbmRpbmcgdGhpcyBwYXJ0LCB3aGljaCBJIGNvbnRpbnVlIHRvIGJlIGNvbmZ1c2Vk
DQpieSwgdG9vLg0KDQo+IEBAIC01MzAsNiArNTMyLDU3IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9k
b19tbWlvX2FkZHIocGFkZHJfdCBtbWlvX2dwYSwNCj4gICAgICByZXR1cm4gaHZtZW11bF9kb19p
b19hZGRyKDEsIG1taW9fZ3BhLCByZXBzLCBzaXplLCBkaXIsIGRmLCByYW1fZ3BhKTsNCj4gIH0N
Cj4gIA0KPiArYm9vbCBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KHVuc2lnbmVkIGxvbmcgZ2xh
LCBnZm5fdCBnZm4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
cGZlYywgYm9vbCBzZW5kX2V2ZW50KQ0KPiArew0KPiArICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nl
c3M7DQo+ICsgICAgdm1fZXZlbnRfcmVxdWVzdF90IHJlcSA9IHt9Ow0KPiArICAgIHBhZGRyX3Qg
Z3BhID0gKChnZm5feChnZm4pIDw8IFBBR0VfU0hJRlQpIHwgKGdsYSAmIH5QQUdFX01BU0spKTsN
Cg0KZ2ZuX3RvX2dhZGRyKCkNCg0KPiArICAgIGlmICggIXNlbmRfZXZlbnQgfHwgIXBmZWMgKQ0K
PiArICAgICAgICByZXR1cm4gZmFsc2U7DQoNCkkgdGhpbmsgSSd2ZSBzYWlkIGJlZm9yZSB0aGF0
IHRoZSAhcGZlYyBwYXJ0IG5lZWQgYW4gZXhwbGFuYXRpb24gKGluDQphIGNvbW1lbnQpLiBXaXRo
b3V0IHN1Y2ggYW4gZXhwbGFuYXRpb24gSSdtIGluY2xpbmVkIHRvIHNheSBpdA0Kc2hvdWxkIGJl
IGRlbGV0ZWQuIElmIG90b2ggdGhpcyBpcyBzaW1wbHkgbWVhbiB0byBiZSBhIHNob3J0Y3V0LA0K
dGhlbiB5b3Ugc2hvdWxkIHJlYWxseSBqdXN0IGNoZWNrIHRoZSB0d28gYml0cyB5b3UgYWN0dWFs
bHkgY2FyZQ0KYWJvdXQgZnVydGhlciBkb3duLg0KDQpTaW1pbGFybHkgSSB0aGluayBJJ3ZlIHNh
aWQgYmVmb3JlIHRoYXQgSSdtIG5vdCBoYXBweSBmb3IgdGhlIGNvbW1vbg0KY2FzZSB0byBub3cg
YmUgdG8gY2FsbCBpbnRvIGhlcmUganVzdCB0byBiYWlsIGJhY2sgb3V0ICh3aGVuIFZNDQpldmVu
dHMgYXJlIGRpc2FibGVkIG9uIGEgZ3Vlc3QpLiBJT1cgSSBkb24ndCB0aGluayB5b3Ugc2hvdWxk
IGNhbGwNCmludG8gdGhpcyBmdW5jdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2Ugd2hlbiAic2VuZF9l
dmVudCIgaXMgZmFsc2UuDQoNCj4gKyAgICBpZiAoIHAybV9nZXRfbWVtX2FjY2VzcyhjdXJyZW50
LT5kb21haW4sIGdmbiwgJmFjY2VzcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
bHRwMm1fdmNwdV9pZHgoY3VycmVudCkpICE9IDAgKQ0KPiArICAgICAgICByZXR1cm4gZmFsc2U7
DQo+ICsNCj4gKyAgICBzd2l0Y2ggKCBhY2Nlc3MgKSB7DQoNClN0eWxlLg0KDQo+ICsgICAgY2Fz
ZSBYRU5NRU1fYWNjZXNzX3g6DQo+ICsgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3J4Og0KPiArICAg
ICAgICBpZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApDQo+ICsgICAgICAgICAgICByZXEu
dS5tZW1fYWNjZXNzLmZsYWdzID0gTUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0KPiArICAg
ICAgICBicmVhazsNCj4gKw0KPiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc193Og0KPiArICAgIGNh
c2UgWEVOTUVNX2FjY2Vzc19ydzoNCj4gKyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ19pbnNuX2Zl
dGNoICkNCj4gKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgPSBNRU1fQUNDRVNT
X1g7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3I6
DQo+ICsgICAgY2FzZSBYRU5NRU1fYWNjZXNzX246DQo+ICsgICAgICAgIGlmICggcGZlYyAmIFBG
RUNfd3JpdGVfYWNjZXNzICkNCj4gKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3Mg
fD0gTUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0KPiArICAgICAgICBpZiAoIHBmZWMgJiBQ
RkVDX2luc25fZmV0Y2ggKQ0KPiArICAgICAgICAgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8
PSBNRU1fQUNDRVNTX1g7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICsgICAgZGVmYXVsdDoN
Cj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIG1vcmUgZnV0
dXJlIHByb29mIHRvIG5vdCBoYXZlIGEgZGVmYXVsdCBjYXNlDQpoZXJlOiBXaGVuIGEgbmV3IGFj
Y2VzcyBlbnVtZXJhdG9yIGdldHMgaW50cm9kdWNlZCwgbW9zdA0KY29tcGlsZXJzIHdvdWxkIHRl
bGwgdGhlIGRldmVsb3BlciByaWdodCBhd2F5IHRoYXQgdGhpcyBuZXcNCmVudW1lcmF0b3IgdmFs
dWUgbmVlZHMgYWN0aXZlbHkgaGFuZGxpbmcgaGVyZS4NCg0KPiArICAgIH0NCj4gKw0KPiArICAg
IGlmICggIXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQ0KPiArICAgICAgICByZXR1cm4gZmFsc2U7
IC8qIG5vIHZpb2xhdGlvbiAqLw0KDQpIb3cgaXMgdGhlICJmYWxzZSIgaGVyZSAoSSB0aGluayB0
aGlzIGlzIHRoZSBvbmUgdGhlIGRlc2NyaXB0aW9uIHRhbGtzDQphYm91dCkgbWF0Y2hpbmcgdXAg
d2l0aCB0aGUgdmFyaW91cyBvdGhlciBvbmVzIGluIHRoZSBmdW5jdGlvbj8NCg0KPiBAQCAtNjE1
LDYgKzY2OSwxMyBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoDQo+ICAN
Cj4gICAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQ0KPiAgICAgICAgICB7
DQo+ICsgICAgICAgICAgICBpZiAoIGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoYWRkciwgZ2Zu
LCBwZmVjLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2
bWVtdWxfY3R4dC0+c2VuZF9ldmVudCkgKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAgICAg
ICAgICAgIGVyciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkpOw0KPiArICAgICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPiArICAgICAgICAgICAgfQ0KDQpIb3cgY29tZSB0aGlzIHNpdHMgb25seSBv
biB0aGUgd3JpdGUgcGF0aD8NCg0KPiBAQCAtMTExNSw3ICsxMTc2LDggQEAgc3RhdGljIGludCBs
aW5lYXJfcmVhZCh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGludCBieXRlcywgdm9pZCAq
cF9kYXRhLA0KPiAgICAgICAqIGNsZWFuIHVwIGFueSBpbnRlcmltIHN0YXRlLg0KPiAgICAgICAq
Lw0KPiAgICAgIGlmICggIWh2bWVtdWxfZmluZF9tbWlvX2NhY2hlKHZpbywgYWRkciwgSU9SRVFf
UkVBRCwgZmFsc2UpICkNCj4gLSAgICAgICAgcmMgPSBodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVh
cihwX2RhdGEsIGFkZHIsIGJ5dGVzLCBwZmVjLCAmcGZpbmZvKTsNCj4gKyAgICAgICAgcmMgPSBo
dm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcihwX2RhdGEsIGFkZHIsIGJ5dGVzLCBwZmVjLCAmcGZp
bmZvLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2bWVtdWxf
Y3R4dC0+c2VuZF9ldmVudCk7DQoNCkknbSBub3QgdmVyeSBoYXBweSB0byBzZWUgdGhpcyBuZXcg
cGFyYW1ldGVyL2FyZ3VtZW50IGFkZGl0aW9uLg0KRGlkIHlvdSBjb25zaWRlciBwdXR0aW5nIHRo
ZSBmbGFnIG9mIGludGVyZXN0IGVsc2V3aGVyZSAoaW50byBhDQpzdHJ1Y3R1cmUgaGFuZ2luZyBv
ZmYgb2YgY3VycmVudCwgb3IgaW50byBwYWdlZmF1bHRfaW5mb190KT8NCg0KRnVydGhlcm1vcmUs
IGlmIHRoZSBwYXJhbWV0ZXIgaXMgcmVhbGx5IHVuYXZvaWRhYmxlLCB0aGVuIHBsZWFzZQ0Kc2Vw
YXJhdGUgdGhlIG1lY2hhbmljcyBvZiBpbnRyb2R1Y2luZyBpdCBmcm9tIHRoZSBhY3R1YWwgY2hh
bmdlDQp5b3UncmUgYWZ0ZXIuDQoNCj4gQEAgLTI2MjksNyArMjY5Miw3IEBAIHZvaWQgaHZtX2Vt
dWxhdGVfaW5pdF9wZXJfaW5zbigNCj4gICAgICAgICAgICAgICBodm1fY29weV9mcm9tX2d1ZXN0
X2xpbmVhcihodm1lbXVsX2N0eHQtPmluc25fYnVmLCBhZGRyLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihodm1lbXVsX2N0eHQtPmluc25fYnVmKSwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZmVjIHwgUEZFQ19p
bnNuX2ZldGNoLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5V
TEwpID09IEhWTVRSQU5TX29rYXkpID8NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVUxMLCBmYWxzZSkgPT0gSFZNVFJBTlNfb2theSkgPw0KDQpJZiB5b3UgcGFz
cyBmYWxzZSBoZXJlLCB3aGF0J3MgdGhlIHBvaW50IG9mIGhhbmRsaW5nIGluc24gZmV0Y2hlcw0K
aW4gdGhlIG5ldyBmdW5jdGlvbiB5b3UgYWRkPw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

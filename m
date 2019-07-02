Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B35CB00
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiDop-0006xe-DK; Tue, 02 Jul 2019 08:07:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiDoo-0006xZ-Bf
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 08:07:14 +0000
X-Inumbo-ID: 5b19a4bf-9ca0-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b19a4bf-9ca0-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 08:07:12 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 08:06:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 08:01:40 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 08:01:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 08:01:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 08:01:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a2CYCA///QXACAAD23gP//0oIAgAENioCAAAD6gA==
Date: Tue, 2 Jul 2019 08:01:39 +0000
Message-ID: <193216ae-a9f5-4d83-4acd-c6786bb2ccbb@suse.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
 <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
 <031156bc-936f-79e0-e1ca-3e49a1274c71@suse.com>
 <23adc806-181b-8190-06ed-84e654628424@bitdefender.com>
In-Reply-To: <23adc806-181b-8190-06ed-84e654628424@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73e62e71-cd34-4faf-c396-08d6fec382fa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB3107F2C056B3E5B3C85CD596B3F80@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(199004)(189003)(76176011)(102836004)(53936002)(4326008)(3846002)(66446008)(68736007)(81166006)(86362001)(6116002)(6506007)(53546011)(386003)(81156014)(52116002)(99286004)(7416002)(31696002)(6486002)(6512007)(73956011)(6916009)(26005)(478600001)(6436002)(6246003)(25786009)(186003)(31686004)(8936002)(66066001)(14454004)(446003)(14444005)(71200400001)(256004)(229853002)(5660300002)(316002)(8676002)(66946007)(486006)(72206003)(2906002)(2616005)(476003)(11346002)(36756003)(71190400001)(80792005)(7736002)(66556008)(54906003)(305945005)(66476007)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9tJfkMFtChVnRAaW5OC7clRbgCbjLJllkqpTksHJaPxnABX/iidfE+4Q+/cPmbVnkQNSQifENNw/CpYHDI8n5qgZocyxHJiaempBTFr7ulTjxcipqCMi2BuXQT9jTvMItQe+ggduzed91XXkoTQe3PSk+cje8n2txhUcDSFutcRNFFdvFgcBkM+aTljv3Moamhb5yYK+YaRtaOALhwiNwrWxYVFesMs4zL+poSkQPrQvZdo4LUcFMds1C/SfwFpkJxcJug+BsTpXaZGFSlaWu3k8IczTPQQXTEw18CznadOd70tXJgeoWwjyYXTRB7Vxa3hwpcPlJ8kruhxPyKthtQlrhF9veU2FYaDvIkV9YMkguJ3tAsu77khY2fF15jMgrSc8TSzh5s0WYVqUiTkYth460cfY94AaLnhcn0LCcTI=
Content-ID: <E5413B159637EF439A74609D077CF648@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e62e71-cd34-4faf-c396-08d6fec382fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:01:39.0592 (UTC)
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
Cc: Wei Liu <wl@xen.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 PaulDurrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 RogerPauMonne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAwOTo1OCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IA0K
PiANCj4gT24gMDEuMDcuMjAxOSAxODo1MywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMS4w
Ny4yMDE5IDE3OjM2LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+PiBPbiAwMS4w
Ny4yMDE5IDE3OjU1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDEuMDcuMjAxOSAxNjo0
NSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+PiBPbiAwMS4wNy4yMDE5IDE2
OjEzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAwNC4wNi4xOSBhdCAxMzo0OSwg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+Pj4+Pj4gKyAgICBpZiAoICFyZXEu
dS5tZW1fYWNjZXNzLmZsYWdzICkNCj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOyAvKiBu
byB2aW9sYXRpb24gKi8NCj4+Pj4+Pg0KPj4+Pj4+IEhvdyBpcyB0aGUgImZhbHNlIiBoZXJlIChJ
IHRoaW5rIHRoaXMgaXMgdGhlIG9uZSB0aGUgZGVzY3JpcHRpb24gdGFsa3MNCj4+Pj4+PiBhYm91
dCkgbWF0Y2hpbmcgdXAgd2l0aCB0aGUgdmFyaW91cyBvdGhlciBvbmVzIGluIHRoZSBmdW5jdGlv
bj8NCj4+Pj4+DQo+Pj4+PiBUaGVyZSBzaG91bGQgYmUgbm8gZXZlbnQgaWYgdGhlcmUgaXMgbm8g
YWNjZXNzIHZpb2xhdGlvbi4gU28gaW4gdGhpcw0KPj4+Pj4gY2FzZSB0aGUgZW11bGF0aW9uIGlz
IGNvbnRpbnVlZCBhcyBleHBlY3RlZC4NCj4+Pj4NCj4+Pj4gQnV0IHRoaXMgZG9lc24ndCBhbnN3
ZXIgbXkgcXVlc3Rpb246IFlvdSB1c2UgImZhbHNlIiBhcyByZXR1cm4gdmFsdWUNCj4+Pj4gdG8g
aW5kaWNhdGUgZGlmZmVyZW50IHRoaW5ncy4gT25seSB0aGUgb25lIGhlcmUgbWVhbnMgIm5vIGFj
Y2Vzcw0KPj4+PiB2aW9sYXRpb24iLg0KPj4+DQo+Pj4gU29ycnkgYWJvdXQgdGhhdCwgc2luY2Ug
dGhpcyB3aWxsIHJlbWFpbiB0aGUgb25seSByZXR1cm4gZmFsc2UgYXBhcnQNCj4+PiBmb3JtIHRo
ZSBtYWluIG9uZSAocmV0dXJuIG1vbml0b3JfdHJhcHMoKSksIGZhbHNlICA9IGV2ZW50IHdhcyBu
b3Qgc2VudA0KPj4+IGFuZCB0cnVlID0gZXZlbnQgd2FzIHNlbnQuDQo+Pj4NCj4+PiBJIHVuZGVy
c3RhbmQgdGhhdCB5b3UgYXJlIGFza2luZyBhYm91dCB0aGUgc2NlbmFyaW8gd2hlbiB0aGVyZSB3
YXMgYQ0KPj4+IHZpb2xhdGlvbiBhbmQgdGhlIGV2ZW50IHdhcyBub3Qgc2VudC4gVGhlbiBJIGNh
biBpc3N1ZSBhIGRvbWFpbl9jcmFzaCgpDQo+Pj4gYXMgdGhhdCBpcyBwb3RlbnRpYWxseSBhIGJp
ZyBpc3N1ZS4NCj4+Pg0KPj4+IEkgaG9wZSBJIGdvdCB0aGF0IGNvcnJlY3RseS4NCj4+DQo+PiBJ
IGRvbid0IGdldCB0aGUgaW1wcmVzc2lvbiB0aGF0IHlvdSBkaWQuIEkgY291bnQgYSB0b3RhbCBv
ZiBmb3VyDQo+PiAicmV0dXJuIGZhbHNlIiBpbiB0aGUgZnVuY3Rpb24sIG9ubHkgb25lIG9mIHdo
aWNoIGV4cGxpY2l0bHkgbWVhbnMNCj4+ICJubyBhY2Nlc3MgdmlvbGF0aW9uIiAob3RoZXJzIG1h
eSBoYXZlIHRoYXQgbWVhbmluZyBpbXBsaWNpdGx5KS4gTGV0J3MNCj4+IHRha2UgdGhlIHAybV9n
ZXRfbWVtX2FjY2VzcygpIGZhaWx1cmUgY2FzZSBhcyBhbiBleGFtcGxlOiBXaGF0IEkgZG9uJ3QN
Cj4+IHVuZGVyc3RhbmQgaXMgd2h5IHRoaXMgY2FzZSBhbmQgdGhlICJubyBhY2Nlc3MgdmlvbGF0
aW9uIiBvbmUgYXJlIGJvdGgNCj4+IG1lYW50IHRvIGJlIHRyZWF0ZWQgdGhlIHNhbWUuDQo+IA0K
PiBSaWdodCwgYXQgdGhlIG1vbWVudCwgZmFsc2UgbWVhbnMgdGhhdCBlbXVsYXRpb24gc2hvdWxk
IGNvbnRpbnVlIGFuZA0KPiB0cnVlIG1lYW5zIHRoYXQgZW11bGF0aW9uIHNob3VsZCBzdG9wLiBJ
ZiBpdCBpcyBhIG11c3QgdGhhdCBJIHJldHVybg0KPiBkaWZmZXJlbnQgZXJyb3JzIEkgd2lsbCBj
aGFuZ2UgdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIGJ1dCBpbiB0aGUgd2F5DQo+IHRoYXQgdGhl
IGNvZGUgaXMgcmlnaHQgbm93IHRoZXkgd2lsbCBiZSB0cmVhdGVkIHRoZSBzYW1lIHdheS4NCg0K
QWdhaW4gLSBpdCdzIG5vdCBhIHJlcXVpcmVtZW50LiBJdCBkZXBlbmRzIG9uIHdoZXRoZXIgdGhl
IGJlaGF2aW9yIGlzDQppbnRlbmRlZCB0byBiZSB0aGF0IHdheS4gSWYgaXQgaXMsIGl0IHNob3Vs
ZCBiZSBjbGFyaWZpZWQgaW4gdGhlDQpkZXNjcmlwdGlvbiBvciBtYXliZSBiZXR0ZXIgaW4gYSBj
b2RlIGNvbW1lbnQuIEJ1dCB0byBtZSwgd2l0aG91dCBzdWNoDQphIGNsYXJpZmljYXRpb24sIGl0
IGRvZXNuJ3QgbG9vayBsaWtlIGl0IHNob3VsZCBiZSB0aGF0IHdheS4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2046CF4E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6wA-0003WP-1e; Thu, 18 Jul 2019 13:59:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBbd=VP=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ho6w8-0003WK-LF
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:59:08 +0000
X-Inumbo-ID: 34c540ab-a964-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::71c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34c540ab-a964-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8iwGZheCcOA2bCjQ4iMQOpr1+NVWGszS4W2zAJNs+LAKizDpTqT2Vd//31nEYU+8e3Ga4jFOapM61RQtZYbvqTDy2r9q2OaoySRAXymazNSbpJHKh5TaTiirkoG3bfh133ZrGS7raM1RSP2ingGUuN+c0EMfODRhJ6L66/kq78fRlbrN/6RsqjynydqqvVLUYPuB8FPjAoBtk7WGzqRQy8FhHAIZRmEQIO4kaZ530EeGjnlrvatc6zBo8jbF3MbEr6UVCUpAhLKMhTqH6l8TbzXIh9vE0qf8wE2DJpIEVVKWSGp1ONsOl3GpnFa8DQRND67WLHYMG4MYGrq8dRukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++z9s6LIlHwnUHY7Nt+UefiZj09XmBAKX7/mU+6w4XA=;
 b=L+cirqmNzNZFUlAe0pZHN7ARY0C1rBDWifTBi2Ch//SZ7+GATaKrhXtwOk4Jkp5GtA7WEWQ79xSQ5mEwD0plLFSQdKSGOwFToZ7qEmJw4wLTipQ1o/+a74On9BIWq603QEdNLDobyIe/NNVRP5bS7grXsh4I863s8TQ4pei/BfsP+O+vt2t34zkkk2qN8SFkmnYVmeOvUCBrCtvCcei4t0pU3l7CySU1EXdotxJeK7QRUoH1e9lVgkfDTCpXlnpQMtKUDCX/5MOTa2o+X09DHcNcqCmRKYcAXny8wuk3KATx66GXsNPQuZCJ2RO/KF3QbyN9CLrbQjh97zzoBp5AYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++z9s6LIlHwnUHY7Nt+UefiZj09XmBAKX7/mU+6w4XA=;
 b=d7Q0iIWoEHP39qxYjkOXVL3BDpDPUbyoHvWkdkBpjzIAG7GvTW3e0M383Iujl+S5Q5i/SEPMASHbF5cxD9ovXcw4wc6bxvl3bVCKVVutN1KgTr4KCj0nSrWMuHxYjDqckImWMBiMCjLmOYq/N7tCTLCD/rN4fB9IqPbKTUPKZ0A=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4502.eurprd02.prod.outlook.com (20.177.197.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Thu, 18 Jul 2019 13:59:03 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 13:59:03 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabOlq4AgABMy4CAAB8oAIABZ1KA
Date: Thu, 18 Jul 2019 13:59:02 +0000
Message-ID: <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
In-Reply-To: <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::20) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94cfacec-ba7e-4b0e-73e5-08d70b88170d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4502; 
x-ms-traffictypediagnostic: AM6PR02MB4502:|AM6PR02MB4502:
x-microsoft-antispam-prvs: <AM6PR02MB4502140A062F489ABABD9EB5D6C80@AM6PR02MB4502.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(136003)(366004)(346002)(189003)(199004)(53936002)(52116002)(486006)(6246003)(11346002)(478600001)(66066001)(3846002)(6116002)(316002)(5660300002)(102836004)(386003)(26005)(86362001)(6506007)(4326008)(53546011)(229853002)(2616005)(76176011)(25786009)(118296001)(54906003)(110136005)(7736002)(305945005)(6436002)(7416002)(71190400001)(71200400001)(8676002)(14454004)(68736007)(8936002)(50226002)(6486002)(66946007)(6512007)(256004)(14444005)(446003)(66446008)(64756008)(66556008)(66476007)(186003)(99286004)(2906002)(81166006)(81156014)(476003)(36756003)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4502;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2+qGjhztRsBO2RgTTu7hI/VTMimkJcHaqsvd9CK7/uYbC4krepw6iHVYT7po1umVG8XxP7iOw4+tG6HoME/aRwYKg+MpjimdgrKFZT5U5LhSdAz5MU1KO5Az+EI/8xT8VdTcGAWbNfIUdkNaC3bLCmiB66MA2A6mJZtTS751zHtLSGNSGbJHtuUaDESyER5m1ZA52CIv5GRAzNxTW4Tr5CvNWPKB0nLLFCDJo+mUDpr5we+N8KTfo7IvUq0Tow4/ESfqQUyW91lgNuRm3+JcFtvTez8an3aPSHM6jf9NT7Q6Wi8v+ZqFvUUy4D/hzJeMluNQi9ND7cniRT2U8bY5+Mk+UFz0jlxtFswufaIxUY2ob7mqK/NfRBdL/I4P1bnAZaIZnzZNNpJzQe1t5qgN1WZdcUTWKnv01oDB3Y6tc+4=
Content-ID: <1F27008FD345B642A846A879BF530178@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cfacec-ba7e-4b0e-73e5-08d70b88170d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:59:02.8708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4502
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDE2OjMyICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTcuMDcuMjAxOSAxNjo0MSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gPiBP
biBXZWQsIDIwMTktMDctMTcgYXQgMTA6MDYgKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
ID4gT24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiA+ID4gPiAr
c3RhdGljIHZvaWQgdm1fZXZlbnRfY2hhbm5lbHNfZnJlZV9idWZmZXIoc3RydWN0DQo+ID4gPiA+
IHZtX2V2ZW50X2NoYW5uZWxzX2RvbWFpbiAqaW1wbCkNCj4gPiA+ID4gICAgew0KPiA+ID4gPiAt
ICAgIHZtX2V2ZW50X3JpbmdfcmVzdW1lKHRvX3Jpbmcodi0+ZG9tYWluLQ0KPiA+ID4gPiA+dm1f
ZXZlbnRfbW9uaXRvcikpOw0KPiA+ID4gPiArICAgIGludCBpOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsgICAgdnVubWFwKGltcGwtPnNsb3RzKTsNCj4gPiA+ID4gKyAgICBpbXBsLT5zbG90cyA9IE5V
TEw7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGltcGwtPm5yX2Zy
YW1lczsgaSsrICkNCj4gPiA+ID4gKyAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3Bh
Z2UoaW1wbC0+bWZuW2ldKSk7DQo+ID4gPiA+ICAgIH0NCj4gPiA+IA0KPiA+ID4gV2hhdCBndWFy
YW50ZWVzIHRoYXQgdGhlcmUgYXJlIG5vIG1hcHBpbmdzIGxlZnQgb2YgdGhlIHBhZ2VzIHlvdQ0K
PiA+ID4gZnJlZQ0KPiA+ID4gaGVyZT8gU2hhcmluZyBwYWdlcyB3aXRoIGd1ZXN0cyBpcyAoc28g
ZmFyKSBhbiAoYWxtb3N0KQ0KPiA+ID4gaXJyZXZlcnNpYmxlDQo+ID4gPiBhY3Rpb24sIGkuZS4g
dGhleSBtYXkgZ2VuZXJhbGx5IG9ubHkgYmUgZnJlZWQgdXBvbiBkb21haW4NCj4gPiA+IGRlc3Ry
dWN0aW9uLg0KPiA+ID4gU2VlIGdudHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMoKSBmb3Ig
YSBjYXNlIHdoZXJlIHdlDQo+ID4gPiBhY3R1YWxseQ0KPiA+ID4gbWFrZSBhbiBhdHRlbXB0IGF0
IGZyZWVpbmcgc3VjaCBwYWdlcyAoYnV0IHdoZXJlIHdlIGZhaWwgdGhlDQo+ID4gPiByZXF1ZXN0
DQo+ID4gPiBpbiBjYXNlIHJlZmVyZW5jZXMgYXJlIGxlZnQgaW4gcGxhY2UpLg0KPiA+ID4gDQo+
ID4gDQo+ID4gSSd2ZSB0ZXN0ZWQgbWFudWFsbHkgMiBjYXNlcyBhbmQgdGhleSBib3RoIHdvcmsg
KG5vIGNyYXNoZXMpOg0KPiA+IDE6IGludHJvc3BlY3RlZCBkb21haW4gc3RhcnRzIC0+IG1vbml0
b3Igc3RhcnRzIC0+IG1vbml0b3Igc3RvcHMgLT4NCj4gPiBkb21haW4gc3RvcHMNCj4gPiAyOiBp
bnRyb3NwZWN0ZWQgZG9tYWluIHN0YXJ0cyAtPiBtb25pdG9yIHN0YXJ0cyAtPiBkb21haW4gc3Rv
cHMgLT4NCj4gPiBtb25pdG9yIHN0b3BzLg0KPiANCj4gV2VsbCwgdGVzdGluZyBpcyBpbXBvcnRh
bnQsIGJ1dCBkb2luZyB0ZXN0cyBsaWtlIHlvdSBkZXNjcmliZSB3b24ndA0KPiBjYXRjaCBhbnkg
bWlzYmVoYXZpbmcgb3IgbWFsaWNpb3VzIG1vbml0b3IgZG9tYWluLg0KPiANCj4gPiBIb3dldmVy
LCBJIHdpbGwgdGFrZSBhIGNsb3NlciBsb29rIGF0DQo+ID4gZ250dGFiX3VucG9wdWxhdGVfc3Rh
dHVzX2ZyYW1lcw0KPiA+IGFuZCBwb3N0IGEgZm9sbG93IHVwIGVtYWlsLg0KPiANCj4gVGhhbmtz
Lg0KPiANCkhpIEphbiwNCg0KQ291bGQgeW91IGhlbHAgbWUgY2xhcmlmeSBzb21lIHRoaW5ncz8g
TWF5YmUgYW0gYXBwcm9hY2hpbmcgdGhlIHdob2xlDQpwcm9ibGVtIGluY29ycmVjdGx5Lg0KDQpU
byBoZWxwIGV4cGxhaW5pbmcgdGhpbmdzIGEgbGl0dGxlIGJldHRlciBJIHdpbGwgdXNlIHRoZSBm
b2xsb3dpbmcNCmFiYnJldmlhdGlvbnM6DQpJRCAtIGludHJvc3BlY3RlZCBkb21haW4gKHRoZSBk
b21haW4gZm9yIHdoaWNoIHRoZSB2bV9ldmVudCByZXF1ZXN0cw0KYXJlIGdlbmVyYXRlZCkNCk1E
IC0gbW9uaXRvciBkb21haW4gKHRoZSBkb21haW4gd2hpY2ggaGFuZGxlcyB0aGUgcmVxdWVzdHMg
YW5kIHBvc3RzDQp0aGUgcmVzcG9uc2VzKQ0KDQpUaGUgbGVnYWN5IGFwcHJvYWNoIChyaW5nKSBp
cyB0byBoYXZlIGEgZGVkaWNhdGVkIGdmbiBpbiBJRCAocmluZw0KcGFnZSksIHdoaWNoIGlzIG1h
cHBlZCBieSBYRU4gdXNpbmcgX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsIGFuZCB0aGVuDQpNRCB1
c2UgeGNfbWFwX2ZvcmVpZ25fcGFnZXMgdG8gY3JlYXRlIHRoZSBtYXBwaW5nIGFuZA0KeGNfZG9t
YWluX2RlY3JlYXNlX3Jlc2VydmF0aW9uX2V4YWN0IHRvIHJlbW92ZSB0aGUgcGFnZSBmcm9tIElE
J3MNCnBoeXNtYXAuDQpUaGUgYXJlIGEgbnVtYmVyIG9mIHByb2JsZW1zIHdpdGggdGhpcyBhcHBy
b2FjaCwgdGhlIG1vc3QgaW1wYWN0ZnVsbA0KYmVpbmcgdGhhdCBndWVzdHMgd2l0aCBhIGhpZ2gg
bnVtYmVyIG9mIHZjcHVzIHdpbGwgZmlsbHMtdXAgdGhlIHJpbmcNCnF1aXRlIHF1aWNseS4gVGhp
cyBhbmQgdGhlIGZhY3Qgdm1fZXZlbnRfcmVxdWVzdCBzaXplIGluY3JlYXNlcyBhcw0KbW9uaXRv
ciBhcHBsaWNhdGlvbnMgYmVjb21lIG1vcmUgY29tcGxleCBpbmN1ciBpZGxlIHRpbWVzIGZvciB2
Y3B1cw0Kd2FpdGluZyB0byBwb3N0IGEgcmVxdWVzdC4gDQoNClRvIGFsbGV2aWF0ZSB0aGlzIHBy
b2JsZW0gSSBuZWVkIHRvIGhhdmUgYSBudW1iZXIgb2YgZnJhbWVzIHNoYXJlZA0KYmV0d2VlbiB0
aGUgaHlwZXJ2aXNvciBhbmQgTUQuIFRoZSBJRCBkb2Vzbid0IG5lZWQgdG8ga25vdyBhYm91dCB0
aG9zZQ0KZnJhbWVzIGJlY2F1c2UgaXQgd2lsbCBuZXZlciBhY2Nlc3MgdGhpcyBtZW1vcnkgYXJl
YSAodW5saWtlIGlvcmVxIHdobw0KaW50ZXJjZXB0cyB0aGUgYWNjZXNzIHRvIGNlcnRhaW4gYWRk
cmVzc2VzKS4NCg0KQmVmb3JlIHVzaW5nIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlIEkg
aW52ZXN0aWdhdGVkIHNldmVyYWwNCmRpZmZlcmVudCBhcHByb2FjaGVzOg0KLSBBbGxvY2F0ZSB0
aGUgbWVtb3J5IGluIGh5cGVydmlzb3IgYW5kIHhjX21hcF9mb3JlaWduX3BhZ2VzIChkb2Vzbid0
IA0Kd29yayBiZWNhdXNlIHlvdSBjYW5ub3QgImZvcmVpZ25tYXAiIHBhZ2VzIG9mIHlvdXIgb3du
IGRvbWFpbi4NCi0gQWxsb2NhdGUgdGhlIG1lbW9yeSBpbiBndWVzdCwgYW5kIG1hcCB0aGUgYWxs
b2NhdGVkIHBhZ2VzIGluIFhFTi4gVG8NCm15IGtub3dsZWRnZSB0aGVyZSBpcyBubyBzdWNoIEFQ
SSBpbiBsaW51eCB0byBkbyB0aGlzIGFuZCB0aGUgbW9uaXRvcg0KYXBwbGljYXRpb24sIGFzIGFu
IHVzZXJzcGFjZSBwcm9ncmFtLCBpcyBub3QgYXdhcmUgb2YgdGhlIGFjdHVhbCBnZm5zDQpmb3Ig
YW4gYWxsb2NhdGVkIG1lbW9yeSBhcmVhLg0KDQpTbywgYXQgdGhpcyBwb2ludCB0aGUgbW9zdCBw
cm9taXNpbmcgc29sdXRpb24gaXMgYWxsb2NhdGluZyB0aGUgbWVtb3J5DQppbiBYRU4sIHNoYXJp
bmcgaXQgd2l0aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQgbWFwcGlu
Zw0KaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUgZmxhZw0K
WEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCBzZXQpDQoNClRvIG15IHVuZGVyc3RhbmRpbmcg
dGhlIGNsZWFudXAgc2VxdWVuY2UgZnJvbQ0KZ250dGFiX3VucG9wdWxhdGVfc3RhdHVzX2ZyYW1l
cyBiYXNpY2FsbHkgYm9pbHMgZG93biB0bzoNCjEuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2Ug
DQoyLiBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBnLT5jb3VudF9p
bmZvKSApDQogICAgICAgcHV0X3BhZ2UocGcpOw0KMy4gZnJlZV94ZW5oZWFwX3BhZ2UNCg0KTXkg
Y3VycmVudCBpbXBsZW1lbnRhdGlvbiB1c2VzIHZ6YWxsb2MgaW5zdGVhZCBvZiBhbGxvY194ZW5o
ZWFwX3BhZ2VzDQphbmQgdGhhdCdzIHdoeSBJIGFzc3VtZWQgdnVubWFwIGFuZCBmcmVlX2RvbWhl
YXBfcGFnZXMgd2lsbCBzdWZmaWNlIChJDQp3b3VsZCBoYXZlIGNhbGxlZCB2ZnJlZSBkaXJlY3Rs
eSwgYnV0IHRoZSB0ZW1wb3JhcnkgbGlua2VkIGxpc3QgdGhhdCBpcw0KdXNlZCB0byBob2xkIHRo
ZSBwYWdlIHJlZmVyZW5jZXMgY2F1c2VzIGZyZWVfZG9taGVhcF9wYWdlcyB0byBjcmFzaCkNCg0K
RG8gSSBhbHNvIGhhdmUgdG8gY2FsbCBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlIGFuZCBwdXRf
cGFnZT8gKHN0ZXBzDQoxLiBhbmQgMi4pDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHN1cHBvcnQs
DQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5390685D1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 10:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwlB-0003EM-9R; Mon, 15 Jul 2019 08:55:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmwl8-0003E9-TD
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 08:54:58 +0000
X-Inumbo-ID: 364c5ca6-a6de-11e9-b526-43b4e87032fc
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 364c5ca6-a6de-11e9-b526-43b4e87032fc;
 Mon, 15 Jul 2019 08:54:55 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 08:54:51 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 08:38:13 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 08:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnobZTeuPFLQ6JXXpIqPWAIqBJNqUFMRZxxKkiE9ndDHn0ZyTpxcgrTdpaTQp9Il5Z4jDCKaOhPNmMLGf+OyLLhQEccuikgtl9b88FkIzMDcuhEkZbn3ZjRDHHLp6luVIKGQyjS/X+WflTMoQrmsVaaY7on63eHAESaxWcjq4UmnDaBCab8pDWh/JBxE9hc7nfeaEg4O7okTyZNdZzR2KkUWTH2Me9CiBW+nSykwWvoYfmE2E7WV9AYyebdc+7XBFA1myEFgI/P0KQ964iAjatpX439jO68r6LsbkjaW1ZbYGk99WpYg545cIDo6B01ZOd5eauyBsK5dB1xkEB5dcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAsXtX85XhsGUu+xJzeaW9NOh+PMDtlWLgvzRGs576w=;
 b=dij6EJpCe881rNRfg3ZOjTkZakHW7Nik2g7HAHN8NN1rvgXQdfjmo5OtJBgkd6q4XQP9ecmwcKAIUOg5LY15oDpcUmlOpo0sSCf6BHoTaf8s1KtaNKCmu21T+CckZq6niPtpg6hjZetr0AEOYrDne7pOGTQJl/EfCEckLULQcM/bfxA9l9g+Sssvv9TUFiK4lfv5a1Nnvj01O1iNRl6B+DaTZlQyt2ZkP3R6gOGxdQtt3kadV4B/8Qv43nAJnd//DGxlDiVUxnIC9RVIr5gcvQ11fq4j9Q7L4U7RTxNsxD9HTl1BDiWYlIFjPqa7bM1hIBcx3XeHc+Dn59fRT+gzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2635.namprd18.prod.outlook.com (20.179.106.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 08:38:12 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 08:38:12 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: Ping: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with device
 pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFabLbhUA
Date: Mon, 15 Jul 2019 08:38:12 +0000
Message-ID: <508a6344-f351-01a2-54ff-4a8d078611cf@suse.com>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
In-Reply-To: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:4:29::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d227b352-d5ef-46c8-f5f6-08d708ffc5bb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2635; 
x-ms-traffictypediagnostic: DM6PR18MB2635:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB2635ADA19A2A4D1368FDB9C3B3CF0@DM6PR18MB2635.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(189003)(6116002)(26005)(3846002)(966005)(54906003)(14454004)(31686004)(305945005)(8676002)(446003)(53936002)(2616005)(11346002)(14444005)(8936002)(256004)(36756003)(186003)(81156014)(81166006)(316002)(6436002)(52116002)(86362001)(31696002)(6506007)(386003)(76176011)(66066001)(4326008)(53546011)(6916009)(68736007)(476003)(102836004)(66946007)(6486002)(66556008)(66476007)(64756008)(66446008)(478600001)(71190400001)(71200400001)(7736002)(5660300002)(99286004)(25786009)(486006)(6512007)(6306002)(80792005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2635;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Yid8GuK1OiNc3opwtqwIX6aX7B8U7J7xnvS/ibDJ39gPtm6WoVQMLkp21N3rEBRe8Nd4/oWHSgTfZVCm+FJ5eN+QH6c0LBuOqImME0fBPwOogpLojOpQSeZ+48wIxeaKUrLsGg00/GeFL+JTvbWfjYFSYMoXcX13nX5bc9wlmi5wJMCmIVHOEAKlAgUjWxmCQkRh7qbxcMJ2n6O8RmUqzBMZe4/aed8VN49JlhzwDjPyohqt2kk4J9npdkCss6hBF+fnQ356captSuPvysf+op7Fz5pjCcQO4Fe97bXCd2caOfwC2mfWZYrE3Z2ZleNxt4KXPHTxmt85mbuwvEE63fMKZa4SK8vei9hg2VsECDPqDBfAHQjXY+0698QFdVZEmX8hEuhT9JmkvPsXA222Ua/EepONpygXAEz66UtqpY=
Content-ID: <6C2E073834BA7C46B7FA34DB74B37285@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d227b352-d5ef-46c8-f5f6-08d708ffc5bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:38:12.4876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2635
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Ping: [PATCH v2] x86/HVM: p2m_ram_ro is incompatible
 with device pass-through
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMzozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSB3cml0ZS1kaXNj
YXJkIHByb3BlcnR5IG9mIHRoZSB0eXBlIGNhbid0IGJlIHJlcHJlc2VudGVkIGluIElPTU1VDQo+
IHBhZ2UgdGFibGUgZW50cmllcy4gTWFrZSBzdXJlIHRoZSByZXNwZWN0aXZlIGNoZWNrcyAvIHRy
YWNraW5nIGNhbid0DQo+IHJhY2UsIGJ5IHV0aWxpemluZyB0aGUgZG9tYWluIGxvY2suIFRoZSBv
dGhlciBzaWRlcyBvZiB0aGUgc2hhcmluZy8NCj4gcGFnaW5nL2xvZy1kaXJ0eSBleGNsdXNpb24g
Y2hlY2tzIHNob3VsZCBzdWJzZXF1ZW50bHkgcGVyaGFwcyBhbHNvIGJlDQo+IHB1dCB1bmRlciB0
aGF0IGxvY2sgdGhlbi4NCj4gDQo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGNvbnZl
cnQgbmVpZ2hib3JpbmcgYm9vbF90IHRvIGJvb2wgaW4NCj4gc3RydWN0IGh2bV9kb21haW4uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFs
b25nc2lkZSBQYXVsJ3MgUi1iIGNvdWxkIEkgZ2V0IGFuIGFjayBvciBvdGhlcndpc2UgZnJvbSB5
b3U/DQoNClRoYW5rcywgSmFuDQoNCj4gLS0tDQo+IHYyOiBEb24ndCBzZXQgcDJtX3JhbV9yb191
c2VkIHdoZW4gZmFpbGluZyB0aGUgcmVxdWVzdC4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vZG0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RtLmMNCj4gQEAgLTI1NSwxNiArMjU1
LDMzIEBAIHN0YXRpYyBpbnQgc2V0X21lbV90eXBlKHN0cnVjdCBkb21haW4gKmQNCj4gICAgDQo+
ICAgICAgICBtZW1fdHlwZSA9IGFycmF5X2luZGV4X25vc3BlYyhkYXRhLT5tZW1fdHlwZSwgQVJS
QVlfU0laRShtZW10eXBlKSk7DQo+ICAgIA0KPiAtICAgIGlmICggbWVtX3R5cGUgPT0gSFZNTUVN
X2lvcmVxX3NlcnZlciApDQo+ICsgICAgc3dpdGNoICggbWVtX3R5cGUgKQ0KPiAgICAgICAgew0K
PiAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFnczsNCj4gICAgDQo+ICsgICAgY2FzZSBIVk1N
RU1faW9yZXFfc2VydmVyOg0KPiAgICAgICAgICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkNCj4g
ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAgICANCj4gICAgICAgICAgICAv
KiBEbyBub3QgY2hhbmdlIHRvIEhWTU1FTV9pb3JlcV9zZXJ2ZXIgaWYgbm8gaW9yZXEgc2VydmVy
IG1hcHBlZC4gKi8NCj4gICAgICAgICAgICBpZiAoICFwMm1fZ2V0X2lvcmVxX3NlcnZlcihkLCAm
ZmxhZ3MpICkNCj4gICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKyAgICAg
ICAgYnJlYWs7DQo+ICsNCj4gKyAgICBjYXNlIEhWTU1FTV9yYW1fcm86DQo+ICsgICAgICAgIC8q
IHAybV9yYW1fcm8gY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUgbWFwcGluZ3MuICovDQo+
ICsgICAgICAgIGRvbWFpbl9sb2NrKGQpOw0KPiArICAgICAgICBpZiAoIGhhc19pb21tdV9wdChk
KSApDQo+ICsgICAgICAgICAgICByYyA9IC1FWERFVjsNCj4gKyAgICAgICAgZWxzZQ0KPiArICAg
ICAgICAgICAgZC0+YXJjaC5odm0ucDJtX3JhbV9yb191c2VkID0gdHJ1ZTsNCj4gKyAgICAgICAg
ZG9tYWluX3VubG9jayhkKTsNCj4gKw0KPiArICAgICAgICBpZiAoIHJjICkNCj4gKyAgICAgICAg
ICAgIHJldHVybiByYzsNCj4gKw0KPiArICAgICAgICBicmVhazsNCj4gICAgICAgIH0NCj4gICAg
DQo+ICAgICAgICB3aGlsZSAoIGl0ZXIgPCBkYXRhLT5uciApDQo+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3BjaS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
DQo+IEBAIC0xNDQ4LDE3ICsxNDQ4LDM2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1
Y3QgZG9tYWluICoNCj4gICAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9y
bV9vcHMgKQ0KPiAgICAgICAgICAgIHJldHVybiAwOw0KPiAgICANCj4gLSAgICAvKiBQcmV2ZW50
IGRldmljZSBhc3NpZ24gaWYgbWVtIHBhZ2luZyBvciBtZW0gc2hhcmluZyBoYXZlIGJlZW4NCj4g
LSAgICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiAqLw0KPiAtICAgIGlmICggdW5saWtlbHko
ZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fA0KPiAtICAgICAgICAgICAgICAgICAg
dm1fZXZlbnRfY2hlY2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8DQo+ICsgICAgZG9tYWlu
X2xvY2soZCk7DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIFByZXZlbnQgZGV2aWNlIGFzc2ln
bm1lbnQgaWYgYW55IG9mDQo+ICsgICAgICogLSBtZW0gcGFnaW5nDQo+ICsgICAgICogLSBtZW0g
c2hhcmluZw0KPiArICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQ0KPiArICAgICAqIC0gZ2xv
YmFsIGxvZy1kaXJ0eSBtb2RlDQo+ICsgICAgICogYXJlIGluIHVzZSBieSB0aGlzIGRvbWFpbi4N
Cj4gKyAgICAgKi8NCj4gKyAgICBpZiAoIHVubGlrZWx5KHZtX2V2ZW50X2NoZWNrX3JpbmcoZC0+
dm1fZXZlbnRfcGFnaW5nKSB8fA0KPiArI2lmZGVmIENPTkZJR19IVk0NCj4gKyAgICAgICAgICAg
ICAgICAgIChpc19odm1fZG9tYWluKGQpICYmDQo+ICsgICAgICAgICAgICAgICAgICAgKGQtPmFy
Y2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwNCj4gKyAgICAgICAgICAgICAgICAgICAgZC0+
YXJjaC5odm0ucDJtX3JhbV9yb191c2VkKSkgfHwNCj4gKyNlbmRpZg0KPiAgICAgICAgICAgICAg
ICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgZG9tYWluX3VubG9jayhkKTsNCj4gICAgICAgICAgICByZXR1cm4gLUVYREVW
Ow0KPiArICAgIH0NCj4gICAgDQo+ICAgICAgICBpZiAoICFwY2lkZXZzX3RyeWxvY2soKSApDQo+
ICsgICAgew0KPiArICAgICAgICBkb21haW5fdW5sb2NrKGQpOw0KPiAgICAgICAgICAgIHJldHVy
biAtRVJFU1RBUlQ7DQo+ICsgICAgfQ0KPiAgICANCj4gICAgICAgIHJjID0gaW9tbXVfY29uc3Ry
dWN0KGQpOw0KPiArICAgIGRvbWFpbl91bmxvY2soZCk7DQo+ICAgICAgICBpZiAoIHJjICkNCj4g
ICAgICAgIHsNCj4gICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L2h2bS9kb21haW4uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9kb21haW4uaA0KPiBAQCAtMTU2LDEwICsxNTYsMTEgQEAgc3RydWN0IGh2bV9kb21haW4gew0K
PiAgICANCj4gICAgICAgIHN0cnVjdCB2aXJpZGlhbl9kb21haW4gKnZpcmlkaWFuOw0KPiAgICAN
Cj4gLSAgICBib29sX3QgICAgICAgICAgICAgICAgIGhhcF9lbmFibGVkOw0KPiAtICAgIGJvb2xf
dCAgICAgICAgICAgICAgICAgbWVtX3NoYXJpbmdfZW5hYmxlZDsNCj4gLSAgICBib29sX3QgICAg
ICAgICAgICAgICAgIHFlbXVfbWFwY2FjaGVfaW52YWxpZGF0ZTsNCj4gLSAgICBib29sX3QgICAg
ICAgICAgICAgICAgIGlzX3MzX3N1c3BlbmRlZDsNCj4gKyAgICBib29sICAgICAgICAgICAgICAg
ICAgIGhhcF9lbmFibGVkOw0KPiArICAgIGJvb2wgICAgICAgICAgICAgICAgICAgbWVtX3NoYXJp
bmdfZW5hYmxlZDsNCj4gKyAgICBib29sICAgICAgICAgICAgICAgICAgIHAybV9yYW1fcm9fdXNl
ZDsNCj4gKyAgICBib29sICAgICAgICAgICAgICAgICAgIHFlbXVfbWFwY2FjaGVfaW52YWxpZGF0
ZTsNCj4gKyAgICBib29sICAgICAgICAgICAgICAgICAgIGlzX3MzX3N1c3BlbmRlZDsNCj4gICAg
DQo+ICAgICAgICAvKg0KPiAgICAgICAgICogVFNDIHZhbHVlIHRoYXQgVkNQVXMgdXNlIHRvIGNh
bGN1bGF0ZSB0aGVpciB0c2Nfb2Zmc2V0IHZhbHVlLg0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQo+IA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

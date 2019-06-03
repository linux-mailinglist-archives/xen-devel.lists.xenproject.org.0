Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EF331BA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnZp-0005fW-5T; Mon, 03 Jun 2019 14:04:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b4kp=UC=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hXnZn-0005fQ-IZ
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:04:39 +0000
X-Inumbo-ID: 85bf3ed0-8608-11e9-819f-6b462a9c92f6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.119]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85bf3ed0-8608-11e9-819f-6b462a9c92f6;
 Mon, 03 Jun 2019 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zglfnYTsq0dvuED9VB53hW/XPvNSXS/nPLDrS/2EyOg=;
 b=EtpLkez22ckA0scCVjCfR3i4R6J5AfUnmKFbCvfldtxDPgS2ZB2A9N5a7zPtv6ho5Y1Btr5Nu+sZBeR1/uJkEhnytzCRGyi/224DDblFDWP2OLEgm+ijCVMB3NJNzTU1t/MTmW4SD3xH5VgMazC6Yrs8dRRx6KnU9hoDXUhpOyc=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB4372.eurprd02.prod.outlook.com (20.178.18.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 14:04:35 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 14:04:35 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/9] Per vcpu vm_event channels
Thread-Index: AQHVFvKYzbGJ8biygUyTgkCpYOT3iqaF8yCAgAQJgwA=
Date: Mon, 3 Jun 2019 14:04:35 +0000
Message-ID: <5602445f814563590618f730e381530ef00a0cac.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <36fe4bc2-06ba-41aa-59ed-d365837dd9d0@citrix.com>
In-Reply-To: <36fe4bc2-06ba-41aa-59ed-d365837dd9d0@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0601CA0029.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::39) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035f0ffd-b6d8-4369-4ea2-08d6e82c68c3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR02MB4372; 
x-ms-traffictypediagnostic: AM0PR02MB4372:|AM0PR02MB4372:
x-microsoft-antispam-prvs: <AM0PR02MB437263F7625E0DC012B5A290D6140@AM0PR02MB4372.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(66066001)(52116002)(76176011)(7736002)(86362001)(478600001)(8676002)(68736007)(81166006)(81156014)(2501003)(53546011)(14454004)(102836004)(50226002)(305945005)(54906003)(110136005)(36756003)(6506007)(386003)(8936002)(6512007)(316002)(186003)(26005)(7416002)(118296001)(71190400001)(71200400001)(6246003)(4326008)(99286004)(6436002)(229853002)(6116002)(6486002)(5660300002)(66476007)(446003)(2616005)(3846002)(476003)(73956011)(66946007)(486006)(25786009)(14444005)(53936002)(2906002)(256004)(64756008)(66446008)(66556008)(11346002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4372;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WynenQcyEz7dvsD0rqJQi9DhXqvgFUc8Kwvyh0/zANAqkWku4wdbZpprizvVUUh/1Yp9FavWtcg80eXXaOrSouRRd8OjQiboo/4MxATPG8rSWwnMWGfxKfDuj4Cy6CNjTmZXeDxVPqTV2UCCw8eh2XA0sUPJ03+ln1I5FnKo0yovBcyNR37/+qx9Mms/oBXHRREFvGUsYuQmLS4m3tozdJqJ886UUSoDoSg5cbUXvntAscV4dMhbLpdeZ4DvsRcpM9OfD52SniHmVrp+HilTFbXDW60Zl356UW57QKT3KmxExjaw19JNWVGu+X56VUcUM2CM3NrGirWZMox0YnQQ4UA4SZnYZGnXzxS1dJuEKxNQfMo5YOfspv6Ds15NgM2QM6q1c4t6TW27iQQ6xi0weE7NbjkmqaHBAZeRpf4YzTs=
Content-ID: <9D08DD3C4FAE0146814CB843C4E60C9E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035f0ffd-b6d8-4369-4ea2-08d6e82c68c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 14:04:35.5967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4372
Subject: Re: [Xen-devel] [PATCH 0/9] Per vcpu vm_event channels
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE3OjI1IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gVGhpcyBw
YXRjaHNldCBhZGRzIGEgbmV3IG1lY2hhbmlzbSBvZiBzZW5kaW5nIHN5bmNocm9ub3VzIHZtX2V2
ZW50DQo+ID4gcmVxdWVzdHMgYW5kIGhhbmRsaW5nIHZtX2V2ZW50IHJlc3BvbnNlcyB3aXRob3V0
IHVzaW5nIGEgcmluZy4NCj4gPiBBcyBlYWNoIHN5bmNocm9ub3VzIHJlcXVlc3QgcGF1c2VzIHRo
ZSB2Y3B1IHVudGlsIHRoZSBjb3JyZXNwb25kaW5nDQo+ID4gcmVzcG9uc2UgaXMgaGFuZGxlZCwg
aXQgY2FuIGJlIHN0b3JlZCBpbiBhIHNsb3R0ZWQgbWVtb3J5IGJ1ZmZlcg0KPiA+IChvbmUgcGVy
IHZjcHUpIHNoYXJlZCBiZXR3ZWVuIHRoZSBoeXBlcnZpc29yIGFuZCB0aGUgY29udHJvbGxpbmcN
Cj4gPiBkb21haW4uDQo+ID4gDQo+ID4gVGhlIG1haW4gYWR2YW50YWdlcyBvZiB0aGlzIGFwcHJv
YWNoIGFyZToNCj4gPiAtIHRoZSBhYmlsaXR5IHRvIGR5bmFtaWNhbHkgYWxsb2NhdGUgdGhlIG5l
Y2Vzc2FyeSBtZW1vcnkgdXNlZCB0bw0KPiA+IGhvbGQNCj4gPiB0aGUgcmVxdWVzdHMvcmVzcG9u
c2VzICh0aGUgc2l6ZSBvZg0KPiA+IHZtX2V2ZW50X3JlcXVlc3RfdC92bV9ldmVudF9yZXNwb25z
ZV90DQo+ID4gY2FuIGdyb3cgdW5yZXN0cmljdGVkIGJ5IHRoZSByaW5nJ3Mgb25lIHBhZ2UgbGlt
aXRhdGlvbikNCj4gPiAtIHRoZSByaW5nJ3Mgd2FpdHF1ZXVlIGxvZ2ljIGlzIHVubmVjZXNzYXJ5
IGluIHRoaXMgY2FzZSBiZWNhdXNlDQo+ID4gdGhlDQo+ID4gdmNwdSBzZW5kaW5nIHRoZSByZXF1
ZXN0IGlzIGJsb2NrZWQgdW50aWwgYSByZXNwb25zZSBpcyByZWNlaXZlZC4NCj4gPiANCj4gDQo+
IEJlZm9yZSBJIHJldmlldyBwYXRjaGVzIDctOSBmb3IgbW9yZSB0aGFuIHN0eWxpc3RpYyB0aGlu
Z3MsIGNhbiB5b3UNCj4gYnJpZWZseSBkZXNjcmliZSB3aGF0J3MgbmV4dD8NCj4gDQo+IEFGQUNU
LCB0aGlzIGludHJvZHVjZXMgYSBzZWNvbmQgaW50ZXJmYWNlIGJldHdlZW4gWGVuIGFuZCB0aGUg
YWdlbnQsDQo+IHdoaWNoIGlzIGxpbWl0ZWQgdG8gc3luY2hyb25vdXMgZXZlbnRzIG9ubHksIGFu
ZCBleGNsdXNpdmVseSB1c2VzDQo+IHNsb3R0ZWQgc3lzdGVtIHBlciB2Y3B1LCB3aXRoIGEgcGVy
LXZjcHUgZXZlbnQgY2hhbm5lbD8NCg0KVXNpbmcgYSBkaXN0aW5jdCBpbnRlcmZhY2Ugd2FzIHBy
b3Bvc2VkIGJ5IEdlb3JnZSBpbiBvcmRlciB0byBhbGxvdyB0aGUNCmV4aXN0aW5nIHZtX2V2ZW50
IGNsaWVudHMgdG8gcnVuIHVubW9kaWZpZWQuDQo+IA0KPiBXaGF0IChpZiBhbnkpIGFyZSB0aGUg
ZnV0dXJlIGRldmVsb3BtZW50IHBsYW5zLCBhbmQgd2hhdCBhcmUgdGhlDQo+IHBsYW5zDQo+IGZv
ciBkZXByZWNhdGluZyB0aGUgdXNlIG9mIHRoZSBvbGQgaW50ZXJmYWNlPyAgKFRoZSBhbnN3ZXJz
IHRvIHRoZXNlDQo+IHdpbGwgYWZmZWN0IG15IHJldmlldyBvZiB0aGUgbmV3IGludGVyZmFjZSku
DQo+IA0KPiB+QW5kcmV3DQo+IA0KQXQgdGhlIG1vbWVudCwgd2UncmUgb25seSB1c2luZyBzeW5j
IHZtX2V2ZW50cywgc28gdGhlICJvbmUgc2xvdCBwZXINCnZjcHUiIGFwcHJvYWNoIHN1aXRzIHVz
LiBBbHNvLCBieSBhbGxvY2F0aW5nIGR5bmFtaWNhbGx5IHRoZQ0Kdm1fZXZlbnRfcmVxdWVzdHMv
cmVzcG9uc2VzLCB3ZSBjYW4gaW5jcmVhc2UgdGhlaXIgc2l6ZSB3aXRob3V0DQpzdWZmZXJpbmcg
dGhlIHBlcmZvcm1hbmNlIGRyb3AgaW5jdXJyZWQgd2hlbiB1c2luZyB0aGUgcmluZw0KKCt3YWl0
cXVldWUpLg0KQXQgdGhpcyBtb21lbnQsIHdlIGRvbid0IGhhdmUgYSBzY2hlZHVsZSB0byBkZXBy
ZWNhdGUgdGhlIGxlZ2FjeSAocmluZw0KYmFzZWQpIGludGVyZmFjZSwgYnV0IHdlIHdpbGwgYWRh
cHQgdGhlIG5ldyBpbnRlcmZhY2UgYmFzZWQgb24gdGhlDQpmZWVkYmFjayB3ZSByZWNlaXZlIGZy
b20gb3RoZXIgdm1fZXZlbnQgdXNlcnMuIA0KDQo+IF9fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBUaGlzIGVtYWlsIHdhcyBzY2FubmVkIGJ5IEJpdGRlZmVuZGVyDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

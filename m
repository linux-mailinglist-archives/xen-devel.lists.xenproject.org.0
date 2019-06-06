Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A1375A7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 15:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYskZ-0003Ef-AY; Thu, 06 Jun 2019 13:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ANSu=UF=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hYskY-0003EW-Ca
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 13:48:14 +0000
X-Inumbo-ID: b9ba04c6-8861-11e9-9f90-03ef21837fdf
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.109]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9ba04c6-8861-11e9-9f90-03ef21837fdf;
 Thu, 06 Jun 2019 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Rok/vcuD79H3PVsU88ER3KQy8bJQ5umDz3nWeFMCJc=;
 b=akqznLIVNoi/RFbf06HIUL7EYzm3lHtERST+YSH4hbgayFr77eU/5UIs1HEXyOOLUVDUjqNwj1bvP3GXn7DSbFizTwiJPUZdUzQ1zGNs4VFFsAibgehFMol+9H6TStqPRLTJDr06mZiYe/G3Wmhq4WD3fFAuV7X4CZdbNONyBTU=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB3713.eurprd02.prod.outlook.com (52.134.82.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 13:48:10 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 13:48:10 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 8/9] vm_event: Add vm_event_ng interface
Thread-Index: AQHVFvKbpX1coRM25UyAvnVo6EqQ76aLmcoAgAG5AACAAQVeAIAAVuQA
Date: Thu, 6 Jun 2019 13:48:10 +0000
Message-ID: <8e6872513e24eeec5171d738643abc3c4e6cc969.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <3ec19ed5425a62ecbc524e44c4bba86d5fe41762.1559224640.git.ppircalabu@bitdefender.com>
 <74176687-4c9f-f2dc-fafa-a999e3129f3c@citrix.com>
 <2d36968a158b9ff12ef8b717d9ae617062abae6c.camel@bitdefender.com>
 <5CF8D0B40200007800235CAA@prv1-mh.provo.novell.com>
In-Reply-To: <5CF8D0B40200007800235CAA@prv1-mh.provo.novell.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P194CA0089.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::30) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b2b7f3f-a7ba-4d15-cf7c-08d6ea859ce6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB3713; 
x-ms-traffictypediagnostic: AM0PR02MB3713:|AM0PR02MB3713:
x-microsoft-antispam-prvs: <AM0PR02MB371338A944C7E901BA780A3DD6170@AM0PR02MB3713.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(136003)(39860400002)(366004)(189003)(199004)(71200400001)(71190400001)(7736002)(6246003)(4326008)(81166006)(6512007)(54906003)(305945005)(118296001)(14454004)(8676002)(110136005)(81156014)(8936002)(256004)(316002)(50226002)(6486002)(6436002)(25786009)(229853002)(66066001)(478600001)(52116002)(2616005)(68736007)(476003)(446003)(5660300002)(36756003)(11346002)(3846002)(6116002)(486006)(7416002)(66556008)(102836004)(186003)(73956011)(66946007)(66446008)(64756008)(66476007)(26005)(99286004)(76176011)(86362001)(53546011)(6506007)(386003)(2906002)(53936002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3713;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uT9McNUlu3m+MtgnSWNbXrFnZ4kIjAR1OOiU6khLwQmoNci4WXMye62KGEO8xreASHAg88Q6FYVIeMZKLoqykKs3PMuxG2dpr4/CCsXOSJWduExwZuEWcr6gcZ5VBH5i6FosgQGzMEH4xj8riXTumBIfyetM1IOE6nKUTgIvy4b1pldW6ymF8fGskOUSxYn5I1lSoO0imoBFkJKUa+1wSlkbY2yIK44UhiPTUK4MXuEvg7JRjjHZE5ysoRmBc7FG85H6EPpyFMvZ+KkdhIU/1KUmkm4Q4hDdg+3P7+bDiS3dBE/33WJwU7fy06ZU8NmdFDarNvRC/V/e3wkD9L4x1Wb9rUSGOupxxV9m9ACRC1onLK0LBenx/cTurauiXtSca3m+0ZwQ9GNuSmtPaLYqW1x0RjIkQeQS/supRmRXFI8=
Content-ID: <E573EFF26A072A429B39308231E44958@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2b7f3f-a7ba-4d15-cf7c-08d6ea859ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 13:48:10.6064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3713
Subject: Re: [Xen-devel] [PATCH 8/9] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA2LTA2IGF0IDAyOjM3IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiA+ID4gT24gMDUuMDYuMTkgYXQgMTk6MDEsIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4g
d3JvdGU6DQo+ID4gDQo+ID4gT24gVHVlLCAyMDE5LTA2LTA0IGF0IDE1OjQzICswMTAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPiA+ID4gT24gMzAvMDUvMjAxOSAxNToxOCwgUGV0cmUgUGlyY2Fs
YWJ1IHdyb3RlOg0KPiA+ID4gPiArc3RhdGljIGludCB2bV9ldmVudF9jaGFubmVsc19hbGxvY19i
dWZmZXIoc3RydWN0DQo+ID4gPiA+IHZtX2V2ZW50X2NoYW5uZWxzX2RvbWFpbiAqaW1wbCkNCj4g
PiA+ID4gK3sNCj4gPiA+ID4gKyAgICBpbnQgaSwgcmMgPSAtRU5PTUVNOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApDQo+ID4g
PiA+ICsgICAgew0KPiA+ID4gPiArICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlID0gYWxs
b2NfZG9taGVhcF9wYWdlKGltcGwtDQo+ID4gPiA+ID52ZWQuZCwNCj4gPiA+ID4gMCk7DQo+ID4g
PiANCj4gPiA+IFRoaXMgY3JlYXRlcyBwYWdlcyB3aGljaCBhcmUgcmVmZXJlbmNlLWFibGUgKGlu
IHByaW5jaXBsZSkgYnkgdGhlDQo+ID4gPiBndWVzdCwNCj4gPiA+IGFuZCBhcmUgYm91bmRlZCBi
eSBkLT5tYXhfcGFnZXMuDQo+IA0KPiBOb3QgYnkgYSBIVk0gb25lLCBiZWNhdXNlIHRoZXkgY2Fu
J3QgcmVmZXJlbmNlIHBhZ2VzIGJ5IE1GTi4NCj4gT3IgZWxzZSwgYXMgUGV0cmUgaW1wbGllcywg
dGhlIGlvcmVxIGFwcHJvYWNoIHdvdWxkIGJlIHdyb25nLCB0b28uDQo+IA0KPiA+ID4gQm90aCBv
ZiB0aGVzZSBhcmUgcHJvcGVydGllcyBvZiB0aGUgZXhpc3RpbmcgaW50ZXJmYWNlIHdoaWNoIHdl
J2QNCj4gPiA+IHByZWZlcg0KPiA+ID4gdG8gcmVtb3ZlLg0KPiA+IA0KPiA+IFRoZSBhbGxvY2F0
aW9uIG1lY2hhbmlzbSBpcyBzaW1pbGFyIHdpdGggdGhlIG9uZSB1c2VkIGJ5IGlvcmVxICh0aGUN
Cj4gPiBtYWluIGRpZmZlcmVuY2UgaXMgdGhlIG51bWJlciBvZiBwYWdlcykuDQo+IA0KPiBRdWVz
dGlvbiBpcyB3aGV0aGVyIGhlcmUgeW91IHdhbnQgdG8gdXNlIHRoZSAiY2FsbGVyIG93bmVkIg0K
PiB2YXJpYW50LiBJIGhhdmVuJ3QgdGhvdWdodCB0aHJvdWdoIHdoZXRoZXIgdGhpcyB3b3VsZCBh
Y3R1YWxseQ0KPiBiZSBiZXR0ZXIsIHNvIGl0J3MgbWVyZWx5IGEgcmVtYXJrLg0KPiANClhFTk1F
TV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgZmxhZyBjYW4gb25seSBiZSB1c2VkIHRoZW4gdGhlIGNh
bGxpbmcNCmRvbWFpbiBpcyB0aGUgaGFyZHdhcmUgZG9tYWluLiBVbmZvcnR1bmF0ZWx5IGZvciB1
cywgdGhpcyBpcyBhIHNldmVyZQ0KbGltaXRhdGlvbiBhcyB3ZSdyZSBydW5uaW5nIHRoZSBtb25p
dG9yIGNsaWVudCBmb3JtIGEgc2VwYXJhdGUgRG9tVS4NCg0KRnJvbSB4ZW4vY29tbW9uL21lbW9y
eS5jIDoNCi4uLi4NCi8qDQogKiBGSVhNRTogVW50aWwgZm9yZWlnbiBwYWdlcyBpbnNlcnRlZCBp
bnRvIHRoZSBQMk0gYXJlIHByb3Blcmx5DQogKiAgICAgICAgcmVmZXJlbmNlIGNvdW50ZWQsIGl0
IGlzIHVuc2FmZSB0byBhbGxvdyBtYXBwaW5nIG9mDQogKiAgICAgICAgbm9uLWNhbGxlci1vd25l
ZCByZXNvdXJjZSBwYWdlcyB1bmxlc3MgdGhlIGNhbGxlciBpcw0KICogICAgICAgIHRoZSBoYXJk
d2FyZSBkb21haW4uDQogKi8NCiBpZiAoICEoeG1hci5mbGFncyAmIFhFTk1FTV9yc3JjX2FjcV9j
YWxsZXJfb3duZWQpICYmDQogICAgICAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJkKSApDQogICAg
IHJldHVybiAtRUFDQ0VTOw0KLi4uDQo+ID4gPiA+ICsgICAgICAgIGlmICggIXBhZ2UgKQ0KPiA+
ID4gPiArICAgICAgICAgICAgZ290byBlcnI7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAg
aWYgKCAhZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgaW1wbC0+dmVkLmQsDQo+ID4gPiA+IFBHVF93
cml0YWJsZV9wYWdlKSApDQo+ID4gPiA+ICsgICAgICAgIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
IHJjID0gLUVOT0RBVEE7DQo+ID4gPiA+ICsgICAgICAgICAgICBnb3RvIGVycjsNCj4gPiA+ID4g
KyAgICAgICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgIGltcGwtPm1mbltpXSA9IHBh
Z2VfdG9fbWZuKHBhZ2UpOw0KPiA+ID4gPiArICAgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAg
IGltcGwtPnNsb3RzID0gKHN0cnVjdCB2bV9ldmVudF9zbG90ICopdm1hcChpbXBsLT5tZm4sDQo+
ID4gPiA+IGltcGwtDQo+ID4gPiA+ID4gbnJfZnJhbWVzKTsNCj4gPiA+IA0KPiA+ID4gWW91IGFw
cGVhciB0byBoYXZlIG9wZW5jb2RlZCB2bWFsbG9jKCkgaGVyZS4gIElzIHRoZXJlIGFueSByZWFz
b24NCj4gPiA+IG5vdA0KPiA+ID4gdG8NCj4gPiA+IHVzZSB0aGF0Pw0KPiA+ID4gDQo+ID4gDQo+
ID4gVGhlIHByb2JsZW0gd2l0aCB2bWFsbG9jIGlzIHRoYXQgaWYgdGhlIHBhZ2VzIGFyZSBub3Qg
YXNzaWduZWQgdG8gYQ0KPiA+IHNwZWNpZmljIGRvbWFpbiB0aGUgcmVtYXBwaW5nIGZhaWxzIGlu
IHRoZSBtb25pdG9yIGRvbWFpbi4NCj4gPiBlLmcuOg0KPiA+IC4uLg0KPiA+IChYRU4pIG1tLmM6
MTAxNTpkMHYyIHBnX293bmVyIGQxIGwxZV9vd25lciBkMCwgYnV0IHJlYWxfcGdfb3duZXIgZC0N
Cj4gPiAxDQo+ID4gKFhFTikgbW0uYzoxMDkxOmQwdjcgRXJyb3IgZ2V0dGluZyBtZm4gNWZiZjUz
IChwZm4NCj4gPiBmZmZmZmZmZmZmZmZmZmZmKQ0KPiA+IGZyb20gTDEgZW50cnkgODAwMDAwMDVm
YmY1MzIyNyBmb3IgbDFlX293bmVyIGQwLCBwZ19vd25lciBkMQ0KPiANCj4gSW4gd2hpY2ggY2Fz
ZSBtYXliZSB1c2Ugdm1hbGxvYygpIGFuZCB0aGVuIGFzc2lnbl9wYWdlcygpPw0KPiBKYW4NClVu
Zm9ydHVuYXRlbHkgSSB3YXNuJ3QgYWJsZSB0byBtYWtlIGl0IHdvcms6DQpJIHJlcGxhY2VkIHRo
ZSBidWZmZXIgYWxsb2NhdGlvbiB3aXRoIHRoaXMgY29kZToNCi4uLi4NCiAgICBpbXBsLT5zbG90
cyA9IHZ6YWxsb2MoaW1wbC0+bnJfZnJhbWVzICogUEFHRV9TSVpFKTsNCiAgICBpZiAoICFpbXBs
LT5zbG90cyApDQogICAgICAgIHJldHVybiAtRU5PTUVNOw0KDQogICAgZm9yICggaSA9IDA7IGkg
PCBpbXBsLT5ucl9mcmFtZXM7IGkrKyApDQogICAgew0KICAgICAgICBpbXBsLT5tZm5baV0gPSB2
bWFwX3RvX21mbihpbXBsLT5zbG90cyArIGkgKiBQQUdFX1NJWkUpOw0KICAgICAgICBpZiAoIGFz
c2lnbl9wYWdlcyhjdXJyZW50LT5kb21haW4sIG1mbl90b19wYWdlKGltcGwtPm1mbltpXSksDQow
LCAwLypNRU1GX25vX3JlZmNvdW50Ki8gKSApDQogICAgICAgIHsNCiAgICAgICAgICAgIHByaW50
aygiJXM6IGFzc2lnbl9wYWdlcyByZXR1cm5lZCBlcnJvclxuIiwgX19mdW5jX18pOw0KICAgICAg
ICB9DQogICAgfQ0KLi4uDQpBbmQgdGhlIGVycm9yIGlzIHNpbWlsYXIgd2l0aCB0aGUgb25lIHdp
dGhvdXQgYXNzaWduX3BhZ2VzOg0KLi4uLg0KKFhFTikgbW0uYzoxMDE1OmQwdjQgcGdfb3duZXIg
ZDEgbDFlX293bmVyIGQwLCBidXQgcmVhbF9wZ19vd25lciBkMA0KKFhFTikgbW0uYzoxMDkxOmQw
djQgRXJyb3IgZ2V0dGluZyBtZm4gNjBkZWFmIChwZm4gZmZmZmZmZmZmZmZmZmZmZikNCmZyb20g
TDEgZW50cnkgODAwMDAwMDYwZGVhZjIyNyBmb3IgbDFlX293bmVyIGQwLCBwZ19vd25lciBkMQ0K
DQpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KDQpNYW55IHRoYW5rcywNClBldHJlDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

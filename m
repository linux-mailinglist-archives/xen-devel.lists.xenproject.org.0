Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99F34A4E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYALL-0005QO-66; Tue, 04 Jun 2019 14:23:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tugb=UD=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hYALK-0005QI-Bu
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 14:23:14 +0000
X-Inumbo-ID: 489872e7-86d4-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::714])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 489872e7-86d4-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKBWqG+ve4C00iPTKe1JPuRJl/xkWG3UgSEoNrzwFsI=;
 b=Lu5RWuWsT0B5RMVvjnXpMKefV2gU2+JdxPD21PS+K6Tra9y/X/HAW39wFsLuSnlVtDc4WTlufMfcHFfR2fpAXWzIO41ulk9BhpLr5sosIPJGovEochq6KqQRpW2vUdbuyjsQg3hFpgnYd12ukLYc8uWx+8//vtvXzIfXwZjOxV8=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB5876.eurprd02.prod.outlook.com (52.132.213.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 14:23:10 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 14:23:10 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 1/9] tools/libxc: Consistent usage of
 xc_vm_event_* interface
Thread-Index: AQHVFvKfZq39Yb5OeESThuJyjeA8PaaF26+AgAW4ewA=
Date: Tue, 4 Jun 2019 14:23:10 +0000
Message-ID: <5ef191be3afcaad4596c1b24b6c50dcddd20b16a.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <a7acd18a3c4bcd288338de12d13ce1cb9fb6d8b2.1559224640.git.ppircalabu@bitdefender.com>
 <9119ed35-e90c-c91e-2138-e2f9afa17d6f@citrix.com>
In-Reply-To: <9119ed35-e90c-c91e-2138-e2f9afa17d6f@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0105.eurprd05.prod.outlook.com
 (2603:10a6:207:1::31) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bb9adf2-cf52-46c6-9496-08d6e8f82bae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR02MB5876; 
x-ms-traffictypediagnostic: AM0PR02MB5876:|AM0PR02MB5876:
x-microsoft-antispam-prvs: <AM0PR02MB58762C246E04E8DA409CA72FD6150@AM0PR02MB5876.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(446003)(71200400001)(6246003)(71190400001)(50226002)(8936002)(8676002)(81156014)(68736007)(6436002)(99286004)(53936002)(81166006)(52116002)(11346002)(73956011)(102836004)(66446008)(64756008)(66556008)(66476007)(66946007)(7736002)(305945005)(110136005)(76176011)(54906003)(6512007)(4326008)(26005)(186003)(53546011)(386003)(2616005)(36756003)(6506007)(478600001)(14444005)(256004)(25786009)(118296001)(229853002)(476003)(5660300002)(2906002)(316002)(86362001)(6486002)(2501003)(486006)(66066001)(3846002)(6116002)(14454004)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5876;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9vz6ZajxIKSY8Nt5e9v2FTUvSS6xvnPvwt2J21VHbVKWb91Co5MI07aVok3NYZEAj8pL8dksr+bda9tsqutwdc/7BLKLoINMd615Xxp7at4tfGqdPFQE4ICN76C3YQ3jjymeggj4DNw9EMmDFpNh01d4suYbYBqfIbK5xl91QQPPsUnB21+zEFhy9div7RCtptYyuJax2JaX5icCMInxKmgwL5NT7EEAPidtLi70iEuY+/J7HI766TCC5fOznlYnjaE5zIPOY3aQTkxqNMGP9JDL7dxfq20hFqkfgcRMEzYc4F4sTto4scTSfuywgBQyZ/9Nd3iRlg/kb1EdAfU7sV55Od7vjDPqm/YtRmgyZBYk3HMZBe+5FxOLqmsCJvTWDXtpkisYJ03bys0vtiuxd5JMclc6XVYlmMuZtOVHjE=
Content-ID: <91AE679CFF444B4DB053018331774281@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb9adf2-cf52-46c6-9496-08d6e8f82bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 14:23:10.5306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5876
Subject: Re: [Xen-devel] [PATCH 1/9] tools/libxc: Consistent usage of
 xc_vm_event_* interface
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE2OjAxIC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gTW9kaWZp
ZWQgeGNfbWVtX3BhZ2luZ19lbmFibGUgdG8gdXNlIGRpcmVjdGx5IHhjX3ZtX2V2ZW50X2VuYWJs
ZQ0KPiA+IGFuZA0KPiA+IG1vdmVkIHRoZSByaW5nX3BhZ2UgaGFuZGxpbmcgZnJvbSBjbGllbnQg
dG8gbGlieGMgKHhlbnBhZ2luZykuDQo+ID4gDQo+ID4gUmVzdHJpY3RlZCB2bV9ldmVudF9jb250
cm9sIHVzYWdlIG9ubHkgdG8gc2ltcGxlc3QgZG9tY3RscyB3aGljaCBkbw0KPiA+IG5vdCBleHBl
Y3QgYW55IHJldHVybiB2YWx1ZXMgYW5kIGNoYW5nZSB4Y192bV9ldmVudF9lbmFibGUgdG8gY2Fs
bA0KPiA+IGRvX2RvbWN0bA0KPiA+IGRpcmVjdGx5Lg0KPiA+IA0KPiA+IFJlbW92ZWQgeGNfbWVt
c2hyX3JpbmdfZW5hYmxlL2Rpc2FibGUgYW5kIHhjX21lbXNocl9kb21haW5fcmVzdW1lLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZl
bmRlci5jb20+DQo+ID4gLS0tDQo+ID4gIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwg
NDkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtLS0tDQo+ID4gIHRvb2xzL2xp
YnhjL3hjX21lbV9wYWdpbmcuYyAgIHwgMjMgKysrKystLS0tLS0tLS0tLQ0KPiA+ICB0b29scy9s
aWJ4Yy94Y19tZW1zaHIuYyAgICAgICB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
IHRvb2xzL2xpYnhjL3hjX21vbml0b3IuYyAgICAgIHwgMzEgKysrKysrKysrKysrKysrKystLS0t
DQo+ID4gIHRvb2xzL2xpYnhjL3hjX3ByaXZhdGUuaCAgICAgIHwgIDIgKy0NCj4gPiAgdG9vbHMv
bGlieGMveGNfdm1fZXZlbnQuYyAgICAgfCA2NCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tDQo+ID4gLS0tLS0tLS0tLS0tDQo+ID4gIHRvb2xzL3hlbnBhZ2luZy94ZW5wYWdpbmcuYyAg
IHwgNDIgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gU28sIHRoZSBkaWZmc3Rh
dCBoZXJlIGlzIHZlcnkgaW1wcmVzc2l2ZSwgYW5kIGp1ZGdpbmcgYnkgdGhlIGRlbHRhLA0KPiBp
dHMNCj4gYWxsIGFib3V0IG5vdCBvcGVuY29kaW5nIHRoZSB1c2Ugb2YgdGhlIEhWTV9QQVJBTSBp
bnRlcmZhY2UuIA0KPiBPdmVyYWxsLA0KPiB0aGlzIGlzIGNsZWFybHkgYSBnb29kIHRoaW5nLg0K
PiANCj4gSG93ZXZlciwgaXQgaXMgcXVpdGUgZGlmZmljdWx0IHRvIGZvbGxvdyBleGFjdGx5IHdo
YXQgaXMgZ29pbmcgb24uDQo+IA0KPiBBRkFJQ1QsIHRoaXMgd2FudHMgc3BsaXR0aW5nIGludG8g
JE4gcGF0Y2hlcy4NCj4gDQo+IE9uZSBwYXRjaCBzaG91bGQgcmVmYWN0b3IgeGNfbWVtX3BhZ2lu
Z19lbmFibGUoKSB0byB1c2UNCj4geGNfdm1fZXZlbnRfZW5hYmxlKCksIHdpdGggdGhlIGFzc29j
aWF0ZWQgeGVucGFnaW5nIGNsZWFudXAuDQo+IA0KPiBPbmUgcGF0Y2ggc2hvdWxkIGJlIHRoZSBk
ZWxldGlvbiBvZiB4Y19tZW1zaHJfKiBvbiBpdHMgb3duLCBiZWNhdXNlDQo+IEFGQUlDVCBpdCBp
cyBhbiBpc29sYXRlZCBjaGFuZ2UuICBJdCBhbHNvIG5lZWRzIHNvbWUganVzdGlmaWNhdGlvbiwN
Cj4gZXZlbg0KPiBpZiBpdCBpcyAiaW50ZXJmYWNlIGlzIHVudXNlZCBhbmQvb3IgcmVkdW5kYW50
IHdpdGggJFgiLg0KPiANCj4gT25lIHBhdGNoIChhbG9uZSkgc2hvdWxkIGJlIHRoZSByZXBvc2l0
aW9uaW5nIG9mIHRoZSBkb21haW5fcGF1c2UoKQ0KPiBjYWxscy4gIFRoaXMgZG9lcyBjZXJ0YWlu
bHkgbG9vayBsaWtlIGEgdmFzdCBpbXByb3ZlbWVudCBXUlQgZXJyb3INCj4gaGFuZGxpbmcgaW4g
eGNfdm1fZXZlbnRfZW5hYmxlKCksIGJ1dCB5b3UndmUgZGVmaW5pdGVseSBjaGFuZ2VkIHRoZQ0K
PiBBUEkNCj4gKGluc29mYXIgYXMgdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGNhbGxlciBoYXMg
cGF1c2VkIHRoZSBkb21haW4pDQo+IGdvZXMsDQo+IGFuZCBpdHMgbm90IGF0IGFsbCBvYnZpb3Vz
IHRoYXQgdGhpcyBjaGFuZ2UgaXMgc2FmZS4gIEl0IG1heSB2ZXJ5DQo+IHdlbGwNCj4gYmUsIGJ1
dCB5b3UgbmVlZCB0byBjb252aW5jZSBwZW9wbGUgYXMgdG8gd2h5IGluIHRoZSBjb21taXQgbWVz
c2FnZS4NCj4gDQo+IA0KPiBJIHN0aWxsIGhhdmVuJ3QgZmlndXJlZCBvdXQgd2hhdCB0aGUgcHVy
cG9zZSBiZWhpbmQgZHJvcHBpbmcgdGhlIHBvcnQNCj4gcGFyYW1ldGVyIGZyb20geGNfdm1fZXZl
bnRfY29udHJvbCgpIGlzLg0KPiANCj4gfkFuZHJldw0KDQpUaGUgbWFpbiByZWFzb24gZm9yIHRo
aXMgcGF0Y2ggd2FzIHRvIHVzZSBhbiB1bmlmb3JtIGNhbGxpbmcgY29udmVudGlvbg0KZm9yIGFs
bCB4Y192bV9ldmVudCB3cmFwcGVycy4gDQpIb3dldmVyLCBhdCB0aGlzIHN0YWdlIEkgdGhpbmsg
aXQncyBiZXN0IHRvIGRyb3AgaXQgYWx0b2doZXRlciBhcyBpdCdzDQpub3QgYSByZXF1aXJlbWVu
dCBmb3IgdGhlIG5ldyB2bV9ldmVudCBpbnRlcmZhY2UgKG5ldyBkb21jdGxzIGFyZSB1c2VkDQph
bG9uZyB3aXRoIHRoZWlyIG93biBzZXBhcmF0ZSB3cmFwcGVycykuDQoNCk1hbnkgdGhhbmtzIGZv
ciB5b3VyIHN1cHBvcnQsDQpQZXRyZQ0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

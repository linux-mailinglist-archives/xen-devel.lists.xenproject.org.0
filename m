Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7123440D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:14:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY6QN-0004Zi-HA; Tue, 04 Jun 2019 10:12:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tugb=UD=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hY6QM-0004Zd-2W
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 10:12:10 +0000
X-Inumbo-ID: 33874c53-86b1-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::72a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33874c53-86b1-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXOfK2MSTVLClmPu+q1wsV0a8/iV3TsMZAwgmn+V4Eo=;
 b=udGA0ocb1VFCNl3Lae7+ypSOfnphyHgvM5lr3heasn78s+c/MUlwPURl6ArAYs5YyOmC14i5ZlurG+isaNghQWnMZgjHvrxow+sVCnVBbuMtjx+63qS9r5dp4uWWh0OSOART5IyW6BUXNTTiEk9G/SQ1fgyCt9qaiYbXajRV4E8=
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com (10.255.30.141) by
 AM0PR02MB4340.eurprd02.prod.outlook.com (20.177.108.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 10:12:02 +0000
Received: from AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204]) by AM0PR02MB5572.eurprd02.prod.outlook.com
 ([fe80::1120:f8e6:62cc:c204%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 10:12:02 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/9] vm_event: Define VM_EVENT type
Thread-Index: AQHVFvKa7xVz9Nd710SfyjOGLnYs4aaF4siAgAVrNoA=
Date: Tue, 4 Jun 2019 10:12:02 +0000
Message-ID: <be318d96d9c237942fa40c313e5e43509d49f066.camel@bitdefender.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9cde4926b56fa05afffee270e5e28a3b9bd830d9.1559224640.git.ppircalabu@bitdefender.com>
 <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
In-Reply-To: <9616b56c-7acf-1abf-1c63-8a1009744dac@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:203:69::16) To AM0PR02MB5572.eurprd02.prod.outlook.com
 (2603:10a6:208:161::13)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c62fea2-770f-42b8-8f28-08d6e8d51662
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB4340; 
x-ms-traffictypediagnostic: AM0PR02MB4340:|AM0PR02MB4340:
x-microsoft-antispam-prvs: <AM0PR02MB4340ABB6E2A8FB5A7BC2525BD6150@AM0PR02MB4340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(396003)(376002)(136003)(366004)(189003)(199004)(256004)(14454004)(7736002)(52116002)(8676002)(6436002)(76176011)(81166006)(81156014)(8936002)(50226002)(36756003)(478600001)(14444005)(5660300002)(99286004)(229853002)(6486002)(118296001)(316002)(110136005)(68736007)(54906003)(6246003)(26005)(66066001)(2906002)(386003)(6506007)(53546011)(186003)(486006)(102836004)(6512007)(7416002)(4326008)(53936002)(86362001)(11346002)(71190400001)(71200400001)(476003)(2616005)(73956011)(2501003)(446003)(64756008)(66556008)(66476007)(66446008)(66946007)(6116002)(3846002)(305945005)(25786009)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4340;
 H:AM0PR02MB5572.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q3zp5ClQQpPeRy/9j7i+1+cGVOLeO6LvHoIsbPYvcBH3Pjwx84dQOPb+zkmxkwOVENd288l3MPGNQcbqXqZ75UO3yO95MLaCNCd2ZIczPCb3YILUgGF/DNX0RgFcE6PGkUHwMFIeFje7aye/p1jY2kXO7gKDF/44YpAJpAoo7co0Ld/gx0Tjkjh6ZHgrvis/OoyRDB2oZUSuK/0BGAGDQANiIExDl4ugUMgq0B4HTTpvEnQbVEDzFttp2/y1e55j70LSHzhnKivJFNHRAb3N7Aq35U19BNzZwHkC2NxRhYKEjLZhfhbhmVIYw0pX4tSmiMtx392xLqsNicXaV5fMkBPRKTsrU1pMNRGaJC3y4LU7OhbJ3WkhyevI3wADNtRJ9HydBH+bhNQ5FiNvvY1Fx3uiS/tKTeqik7jdGKEKB1E=
Content-ID: <549A3DD44BE97E43B94D068B9825AF28@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c62fea2-770f-42b8-8f28-08d6e8d51662
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 10:12:02.3008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4340
Subject: Re: [Xen-devel] [PATCH 2/9] vm_event: Define VM_EVENT type
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
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTA1LTMxIGF0IDE2OjI2IC0wNzAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAzMC8wNS8yMDE5IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6DQo+ID4gDQo+IA0K
PiBUaGlzIGlzIGFuIGludGVybmFsIGhlbHBlciwgc28gY2FuIHJlYXNvbmFibHkgYmUgZXhwZWN0
ZWQgdG8gbm90IGJlDQo+IGNhbGxlZCB3aXRoIGp1bmssIGFuZCBjYW4gZG8gYXdheSB3aXRoIHRo
ZSBwYXJhbSBwb2ludGVyLg0KPiANCj4gU29tZXRoaW5nIGxpa2UNCj4gDQo+IHN0YXRpYyBpbnQg
eGNfdm1fZXZlbnRfcmluZ19wZm5fcGFyYW0odW5zaWduZWQgaW50IHR5cGUpDQo+IHsNCj4gICAg
IHN3aXRjaCAoIHR5cGUgKQ0KPiAgICAgew0KPiAgICAgICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZ
UEVfUEFHSU5HOg0KPiAgICAgICAgICAgICByZXR1cm4gSFZNX1BBUkFNX1BBR0lOR19SSU5HX1BG
TjsNCj4gLi4uDQo+ICAgICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ICAgICB9DQo+IH0NCj4gDQo+IHdpbGwgd29yayBmaW5lIGJlY2F1c2UgSFZNX1BBUkFN
XyogYXJlIGFsbCB0aW55IHVuc2lnbmVkIGludGVnZXJzIGluDQo+IHByYWN0aWNlLiAgSXQgYWxz
byBoYXMgYSBtb3JlIHNlbnNpYmxlIEFQSSBmb3IgdGhlIGNhbGxlci4NCg0KSSB0aGluayBpbiB0
aGUgZW5kIGl0J3MgYmVzdCBqdXN0IHRvIG1vdmUgdGhlIGhlbHBlciB0bw0KeGNfdm1fZXZlbnRf
ZW5hYmxlIChpbmxpbmUgdGhlIHN3aXRjaCkgYXMgaXQgaXMgbm90IHVzZSBvdXRzaWRlIGl0Lg0K
DQo+IA0KPiA+IGluZGV4IDE5NDg2ZDUuLjE5MjgxZmEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oDQo+ID4gQEAgLTc2OSw4MCArNzY5LDE4IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2dkYnN4X2Rv
bXN0YXR1cyB7DQo+ID4gICAqIFZNIGV2ZW50IG9wZXJhdGlvbnMNCj4gPiAgICovDQo+ID4gIA0K
PiA+IA0KPiA+IC0NCj4gPiAtLyogVXNlIGZvciB0ZWFyZG93bi9zZXR1cCBvZiBoZWxwZXI8LT5o
eXBlcnZpc29yIGludGVyZmFjZSBmb3INCj4gPiBwYWdpbmcsDQo+ID4gLSAqIGFjY2VzcyBhbmQg
c2hhcmluZy4qLw0KPiA+ICBzdHJ1Y3QgeGVuX2RvbWN0bF92bV9ldmVudF9vcCB7DQo+ID4gLSAg
ICB1aW50MzJfdCAgICAgICBvcDsgICAgICAgICAgIC8qIFhFTl9WTV9FVkVOVF8qICovDQo+ID4g
LSAgICB1aW50MzJfdCAgICAgICBtb2RlOyAgICAgICAgIC8qIFhFTl9ET01DVExfVk1fRVZFTlRf
T1BfKiAqLw0KPiA+ICsgICAgdWludDMyX3QgICAgICAgIG9wOyAgICAgICAgICAgLyogWEVOX1ZN
X0VWRU5UXyogKi8NCj4gPiArICAgIHVpbnQzMl90ICAgICAgICB0eXBlOyAgICAgICAgIC8qIFhF
Tl9WTV9FVkVOVF9UWVBFXyogKi8NCj4gDQo+IFdoeSBkaWQgdGhlIHZlcnRpY2FsIGFsaWdubWVu
dCBjaGFuZ2U/DQoNClRoZSBpbml0aWFsIHZlcnRpY2FsIGFsaWdubWVudCB3YXMgbm90IDQgc3Bh
Y2VzIChJIHdpbGwgcmV2ZXJ0IGl0IGJhY2sNCnRvIHRoZSB3YXkgaXQgd2FzIGluIG9yZGVyIHRv
IHNpbXBsaWZ5IHRoZSByZXZpZXcgICkNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

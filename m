Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245BAFBAD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i812e-0007np-Qb; Wed, 11 Sep 2019 11:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg/j=XG=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1i812d-0007nk-9k
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:44:07 +0000
X-Inumbo-ID: 75896610-d489-11e9-978d-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.104]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75896610-d489-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 11:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2rY3xNeapVx1Y5GFWX/6LiiqLamNIqqngBqYqIRe1HCIx+U0nqqxKIUeIySuDSUSF5LuYlTGKBZEYLZ7ha6HuQ9PA/yFynepH5e2AFFywI4H3O7Xjz0vAbEGQ7DxeBHo5Uj1fs/tqQGD7LVGQBGwq3Dfz/oOtaMW7Jd7Ug2QC7nASCn631nXW9Rvzo6y7FCvXejbuu12masoV7bizglJB7YPVR++/CsBVB+P41rbYYoxUYnTktT3YxKeEvYR9aIGD7p/GYjKjGGxLSXVouydiDxC+V1rUjVzkVkS42D68GbThbUYPrfDFWCKCDCoOjzYOyv0JJztEGC/YjoBCP8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCawvUXLYm4n7+VxidohjIt8U6LQXWi3qNegnjgHZJI=;
 b=P59dBzAfJwyT00QnCh36PFAOWFtTTZuKw2W3gJDphRVjH0htpyNTgPxM2KAoahaBJinXWub+xIKmQhzb764l9eyVGNR8M0ZRF6f4piF+itUr/eMDaKheNvTWXqifAsjbQuuoyP7WRW5aYy49phWnf3g8JKUlU2waOZ21her6ZiU+8uIjfKf4UV/JBVhojEuFjXmVUlBRHPWvbIIRbZgO796Z4lWsIPjKfiYb5vgUHlaQuGqtIJq/N7aWD3Mok8DA+snpwBpYZJtwI5cQj//lMFzit+W1Dgc3r955o++eykl+tWeaxm/MKXEnw6+jHPyMVKjQ0MkPYAUU5FLUCuKDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bbu.bitdefender.biz; dkim=pass header.d=bbu.bitdefender.biz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCawvUXLYm4n7+VxidohjIt8U6LQXWi3qNegnjgHZJI=;
 b=VfE7Dy0GMRqg+ieb8pvARTUT/pKuh2Sw7KUojRU2iACxygjtcVP2Di+MBjMZauwDUYs0Df8Xx0wJOllK8uTJ6lUHjJrqBUiP95yHeZN6s6wy3sgeQ5HRioPHzg0TGSYpFq8gdXyG8GX4VeeVJepFzXDc++d4NsdLmNB/MEH+MLc=
Received: from AM0PR02MB4627.eurprd02.prod.outlook.com (20.178.20.81) by
 AM0PR02MB4978.eurprd02.prod.outlook.com (20.178.21.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Wed, 11 Sep 2019 11:44:04 +0000
Received: from AM0PR02MB4627.eurprd02.prod.outlook.com
 ([fe80::31c4:8275:626e:4dfd]) by AM0PR02MB4627.eurprd02.prod.outlook.com
 ([fe80::31c4:8275:626e:4dfd%5]) with mapi id 15.20.2241.022; Wed, 11 Sep 2019
 11:44:04 +0000
From: Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v9] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVZyQz09ftstBAgkqLCbI9BLbek6cmQG2AgAALiACAAD4ggP//03EAgAAAmQA=
Date: Wed, 11 Sep 2019 11:44:04 +0000
Message-ID: <14f9d8c2-3c10-2c5e-35ec-5a050509a0e0@bbu.bitdefender.biz>
References: <20190909153508.10847-1-aisaila@bitdefender.com>
 <4ae96ee9-192d-f790-b2cb-9d60a5aab292@suse.com>
 <e7330f19-9350-54f2-a066-730f1ab3c145@bitdefender.com>
 <607886a8-7eff-56e3-598c-85b3e4109d88@bbu.bitdefender.biz>
 <ed6eb96e-2a8b-55b3-9728-a574d957ab36@suse.com>
In-Reply-To: <ed6eb96e-2a8b-55b3-9728-a574d957ab36@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0067.eurprd08.prod.outlook.com
 (2603:10a6:205:2::38) To AM0PR02MB4627.eurprd02.prod.outlook.com
 (2603:10a6:208:f8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aa3c5a6-fd43-4a41-7744-08d736ad58cc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB4978; 
x-ms-traffictypediagnostic: AM0PR02MB4978:|AM0PR02MB4978:|AM0PR02MB4978:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4978C39EF1E41E2442DBB5EDABB10@AM0PR02MB4978.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(25786009)(186003)(81156014)(81166006)(7736002)(42882007)(3846002)(6116002)(54906003)(4326008)(8936002)(316002)(229853002)(6486002)(6436002)(6916009)(5660300002)(99286004)(386003)(6506007)(53546011)(26005)(102836004)(14454004)(6246003)(53936002)(305945005)(76176011)(52116002)(6512007)(66066001)(71200400001)(71190400001)(2906002)(66556008)(66476007)(31696002)(486006)(66446008)(64756008)(11346002)(2616005)(476003)(446003)(66946007)(256004)(8676002)(478600001)(14444005)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4978;
 H:AM0PR02MB4627.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VQpgiiyiX++5C1w5enOFclZEQLXqvQD4eLQEHrYGssfWBSPmJxdAT9gY80BdMFsxab+RHXb9ar6jpwwC9u8lshW41bL/RISxoxYwkkjSyjC3rlSb8OMUA3kUbbPPaYPsG1YYDNVjOpc9ZEdXYljoAuTehduHkYxRhadSX+RXd95u8Yut+8SxCZ9xOmMwsOKhKJKJyqFMVwqxfkfRf4TT8e4favifSqKMV5UXqMq+pV22xtP9F8mSlx9YXPe4vJPOZaXttuKoo31dwzcM5dcDxudXW5i2zL67TY6HPdRm1aEEqJdvwMYJmIwUpXrd+oaLyYKXVOsdSGi8DF8S3pqhpAkxeGs+/GnhAWNlK6FBe09T0nWVBFgKoY+t/akMbtK/C89idWydItIIXgKFapAj1Xl3m3QMKupwG9qVXaN3uNQ=
Content-ID: <8542BB4856C45644A7597C239037F83D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bbu.bitdefender.biz
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa3c5a6-fd43-4a41-7744-08d736ad58cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 11:44:04.4440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BijcfOyf+SZ3l598uYb8WkKWF8Y6p+WvafRCqqaKFGNFSEjJKOKT8DwY0vnYXmH855NEJ+lxmQMpPQ8zWpB/5PS71ASSvnpBWur6DKGIrjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4978
Subject: Re: [Xen-devel] [PATCH v9] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMS8xOSAyOjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMDkuMjAxOSAx
MzoyMSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0KPj4gT24gOS8xMS8xOSAxOjM5IFBNLCBBbGV4
YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gT24gMTEuMDkuMjAxOSAx
Mjo1NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA5LjA5LjIwMTkgMTc6MzUsIEFsZXhh
bmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+Pj4gKy8qDQo+Pj4+PiArICogU2VuZCBtZW1v
cnkgYWNjZXNzIHZtX2V2ZW50cyBiYXNlZCBvbiBwZmVjLiBSZXR1cm5zIHRydWUgaWYgdGhlIGV2
ZW50IHdhcw0KPj4+Pj4gKyAqIHNlbnQgYW5kIGZhbHNlIGZvciBwMm1fZ2V0X21lbV9hY2Nlc3Mo
KSBlcnJvciwgbm8gdmlvbGF0aW9uIGFuZCBldmVudCBzZW5kDQo+Pj4+PiArICogZXJyb3IuIEFz
c3VtZXMgdGhlIGNhbGxlciB3aWxsIGNoZWNrIGFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQuDQo+
Pj4+PiArICoNCj4+Pj4+ICsgKiBOT1RFOiBwMm1fZ2V0X21lbV9hY2Nlc3MoKSBjYW4gZmFpbCBp
ZiB0aGUgZW50cnkgd2FzIG5vdCBmb3VuZCBpbiB0aGUgRVBUDQo+Pj4+PiArICogKGluIHdoaWNo
IGNhc2UgYWNjZXNzIHRvIGl0IGlzIHVucmVzdHJpY3RlZCwgc28gbm8gdmlvbGF0aW9ucyBjYW4g
b2NjdXIpLg0KPj4+Pj4gKyAqIEluIHRoaXMgY2FzZXMgaXQgaXMgZmluZSB0byBjb250aW51ZSB0
aGUgZW11bGF0aW9uLg0KPj4+Pj4gKyAqLw0KPj4+Pj4gK2Jvb2wgaHZtX21vbml0b3JfY2hlY2tf
ZXB0KHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsDQo+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qga2luZCkNCj4+Pj4NCj4+Pj4gV2h5
IGRpZCB5b3UgY2hvb3NlIHRvIGhhdmUgImVwdCIgaW4gdGhlIG5hbWUgYW5kIGFsc28gbWVudGlv
biBpdA0KPj4+PiBpbiB0aGUgY29tbWl0PyBJcyB0aGVyZSBhbnl0aGluZyBpbiBoZXJlIHdoaWNo
IGlzbid0IGdlbmVyaWMgcDJtPw0KPj4+DQo+Pj4gVGhlIG5hbWUgd2FzIHN1Z2dlc3RlZCBieSBS
YXp2YW4gQ29qb2NhcnUuIEkgaGF2ZSBubyBwcmVmZXJlbmNlIGluIHRoZQ0KPj4+IG5hbWUuIE1h
eWJlIFRhbWFzIGNhbiBzdWdnZXN0IGEgZ29vZCBvbmUuDQo+Pg0KPj4gSSd2ZSBzdWdnZXN0ZWQg
ImVwdCIgaW4gdGhlIG5hbWUgYmVjYXVzZSAicmVndWxhciIgZW11bGF0aW9uIGlnbm9yZXMgaXQs
DQo+PiBhbmQgdGhpcyBmdW5jdGlvbiB0YWtlcyBpdCBpbnRvIGFjY291bnQsIGhlbmNlIHRoZSAi
Y2hlY2tfZXB0IiAod2hpY2ggSQ0KPj4gdGhvdWdodCB3b3VsZCBiZSByZWFkIHRvZ2V0aGVyKS4g
SXQncyBmaW5lIHRvIGNoYW5nZSBpdCB0byBzb21ldGhpbmcgZWxzZS4NCj4gDQo+IFRoZW4gImNo
ZWNrX3AybSIgcGVyaGFwcz8NCg0KU291bmRzIGdvb2QgdG8gbWUuDQoNCg0KVGhhbmtzLA0KUmF6
dmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

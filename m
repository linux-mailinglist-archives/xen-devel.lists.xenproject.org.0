Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A342F8EE
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 11:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWGu7-0003Mj-HS; Thu, 30 May 2019 08:59:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XWjc=T6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hWGu6-0003Me-Hx
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 08:59:18 +0000
X-Inumbo-ID: 33a0774a-82b9-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.124]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33a0774a-82b9-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LetZa2xFM6ZaxQY85soZgmtd5bHvb2+5S2RZuN0Jxmo=;
 b=TMjhFfIIJgd7mVIo9RQqwreueMwSyRbYjjoa/cSTUFmOyF4iMr1SC+MftIy9Dou01dPWQteG4LjtNXaC2zSzmdmepzsADAY9iIqWxjSl7idap3OJqMBXvyY7oBpJp3E/MNChY8a/ZaBsWh8QTq8ZSJ1X6HeCaNP9uQzyPLYcJ5E=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3582.eurprd02.prod.outlook.com (52.134.11.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 30 May 2019 08:59:14 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 08:59:13 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 2/2] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVDwtG9NQRMXonfUaGlUQCgO162qZ26xeAgAyCtgA=
Date: Thu, 30 May 2019 08:59:13 +0000
Message-ID: <b6f3254b-2bce-ecd6-cddb-10131f075fb6@bitdefender.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
In-Reply-To: <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::41) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 424d1fa2-29b4-4cd4-f1cc-08d6e4dd162b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3582; 
x-ms-traffictypediagnostic: VI1PR0202MB3582:|VI1PR0202MB3582:
x-microsoft-antispam-prvs: <VI1PR0202MB3582D38B8729D6A47C0173CAAB180@VI1PR0202MB3582.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(39860400002)(376002)(396003)(136003)(189003)(199004)(186003)(256004)(26005)(99286004)(6506007)(11346002)(2616005)(476003)(68736007)(25786009)(31686004)(316002)(2906002)(102836004)(4744005)(446003)(52116002)(76176011)(386003)(66476007)(66446008)(66946007)(66556008)(5660300002)(64756008)(486006)(73956011)(229853002)(7736002)(6486002)(6436002)(6512007)(81156014)(6116002)(3846002)(8936002)(53936002)(81166006)(8676002)(6246003)(54906003)(305945005)(71200400001)(4326008)(478600001)(6916009)(66066001)(86362001)(36756003)(71190400001)(31696002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3582;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6sBRSrUCeGFZuzGVxKmtKE+NCroG3StkTG1rStdhAGd238jG72MWZ0UCdXksIUqxyZ2pkUIzq79wmS/BEk7tH5Isr+BzMHjTiYolVGKtc7UMo20StzYsEjt15C/qx4Wxi5eeS4u1RUsn5TrcBMAzp8W2Q3MATR5AZQK2swsctFk62GEuaerZ2nCDxe5Sa5OsJYb0guJGxvY2OPsGwRKaZaDjOEqVrtLB+y88Bre2Gor/3nW7awXGzRGvnfYOBiF/55v18m4uSbpWcxKfKHQLfOtlp1NH9HljaxpN7E3uvTCz6G40kbdFrs1SrKSSWSRgYCl4FbJIcA2AFcUTF9tN+soilNgoS3VqU1ed+bdMJl5huY3oPrJ40U573mZ9NOsX8AQB3MeUBYGK9pDEbCuFRZWnnr3IRY/m8i5YaleUn84=
Content-ID: <5673A7100E62F34AA40E52A9DD371A08@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424d1fa2-29b4-4cd4-f1cc-08d6e4dd162b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 08:59:13.7444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3582
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiANCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgICAgcmMgPSBodm1lbXVs
X2xpbmVhcl90b19waHlzKGdsYSwgJmdwYSwgYnl0ZXMsICZyZXBzLCBwZmVjLCAmY3R4dCk7DQo+
IA0KPiBBcyBzYWlkIGJlZm9yZSAtIEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBk
byB0aGUgcGFnZSB3YWxrDQo+IHR3aWNlOiBUaGlzIGFuZCB0aGUgcHJlLWV4aXN0aW5nIG9uZSBj
YW4gZWFzaWx5IHJldHVybiBkaWZmZXJlbnQNCj4gcmVzdWx0cy4NCg0KV2hhdCBwcmVleGlzdGlu
ZyBwYWdlIHdhbGsgYXJlIHlvdSB0YWxraW5nIGFib3V0IGhlcmU/IEkgZG9uJ3QgdGhpbmsgDQp0
aGVyZSBpcyBhIHdheSB0byBnZXQgdGhlIGdwYSBieSBwYXNzaW5nIGl0IGZyb20gc29tZXdoZXJl
Lg0KDQpBbGV4DQoNCj4gDQo+IEFkZGl0aW9uYWxseSwgYXMgYWxzbyBzYWlkIGJlZm9yZSAoSSB0
aGluayksIHRoZSBmdW5jdGlvbiBtYXkgcmFpc2UNCj4gI1BGLCB3aGljaCB5b3UgZG9uJ3Qgc2Vl
bSB0byBkZWFsIHdpdGggZGVzcGl0ZSBkaXNjYXJkaW5nIHRoZQ0KPiBYODZFTVVMX0VYQ0VQVElP
TiByZXR1cm4gdmFsdWUgLi4uDQo+IA0KPj4gKyAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSAp
DQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+IA0KPiAuLi4gaGVyZS4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

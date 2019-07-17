Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D66B7CD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 10:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hneqL-0003hF-38; Wed, 17 Jul 2019 07:59:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hneqK-0003h6-4a
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 07:59:16 +0000
X-Inumbo-ID: c470153b-a868-11e9-8980-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.118]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c470153b-a868-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 07:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ce4M16m40U1BANPxcQDY1tGHWH3jVI1dBstKaoMznv/qaMN4HRgJlmb9AZ8+Yj2eLILIfDScUpwXnITxx9zHYNeQk3wlN4SLEarreJOp+jD+hntsLTGa0ZJtLxsSq0nkJCWjtqmcqntNg5EE9PHyIvcboH3Qjfo+iMjrRmPiGo/FJgkPnYvkuYpGv5KYL48fgWMl5ZlrQn1xZRRnLTzkCUpF5AFUrQVyyKxxfrLwGYcpNG5uZwb8ZWS7PAcaF2R6XyQE3DKkdSd1e9NbScLU6H9rwAKBix1AfbwsuUW8H4LYWeHEdDMDQ8kltA8g3zwgnY/Whf4HNW42oZCVac49Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k4cVyBM0GqcHa3Ro1CwdNAZVq++vr/KDohX7Kd0BUw=;
 b=Q+dZBdK/hyyzpxl9HHUYIhO9WLBqx37oVzMTStXFbWALnyUL4S0GyhrOvwzzDEi1DgNAoqXmvuI3UKzwvjJ1PEYWBiC/gS3YF2VvzdXBRbLB0SVVLNfGys6+s2KAlqiCy0SrZU6L2KDYBqGPDqu0OAS94z8UNTeAdTscuTbKmac1yyHf1g/x/opyXxlLyrB7Dy2Di5R6q8SzQGg0xnwy28OftTAvwTG5xIiQ58od1KhU70lOyzMin6xW9hsgpDWtn+epjFGNcDUjwEyL7w5wqQ6QsRSc6snT1S9DrTQSYoaz5q5dSaLD4OPTTF9ZIBDHBDli40TmWMoDAs/X0dwU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k4cVyBM0GqcHa3Ro1CwdNAZVq++vr/KDohX7Kd0BUw=;
 b=Ix7w4I5TSuD6MwrQqatf7k6IRK5WeMqbKxD+IEpvpBwP5h5okiJiAeeCjLwTfdWhZI7XGMddPwjAS9XIB5OzjBAwYou+gbj0LQjOdtzH0dEvn9r4hpA2XB5CaAcdODxDLj/P8x/LEE9cCRFmHlbPP/gEk0jAmJo2iiadgOIaISs=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4470.eurprd02.prod.outlook.com (20.177.191.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 07:59:12 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 07:59:12 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v2 01/10] vm_event: Define VM_EVENT type
Thread-Index: AQHVO/jiC7r7Phv/mUucGqu2PM/TjKbNurYAgAC4XoA=
Date: Wed, 17 Jul 2019 07:59:11 +0000
Message-ID: <a22fb10d1512f930c6fa259053463e202f140928.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
 <CABfawhnSMtVCiS9fmS1zU1QcuVC34Z9x_3HSSEaA=euBrhzfPQ@mail.gmail.com>
In-Reply-To: <CABfawhnSMtVCiS9fmS1zU1QcuVC34Z9x_3HSSEaA=euBrhzfPQ@mail.gmail.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::23) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14b811b1-8deb-4f44-14b4-08d70a8ca775
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4470; 
x-ms-traffictypediagnostic: AM6PR02MB4470:|AM6PR02MB4470:
x-microsoft-antispam-prvs: <AM6PR02MB4470FDA564179D2FEC12C96BD6C90@AM6PR02MB4470.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(39860400002)(396003)(346002)(199004)(189003)(305945005)(118296001)(14454004)(66946007)(5660300002)(66446008)(2906002)(446003)(476003)(2616005)(66556008)(7736002)(64756008)(54906003)(11346002)(86362001)(4326008)(66476007)(486006)(14444005)(8676002)(66066001)(6916009)(6116002)(3846002)(256004)(186003)(50226002)(7416002)(71190400001)(6506007)(386003)(53936002)(71200400001)(76176011)(68736007)(52116002)(99286004)(8936002)(6512007)(81156014)(81166006)(6436002)(25786009)(478600001)(102836004)(229853002)(6486002)(26005)(6246003)(36756003)(107886003)(316002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4470;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gZXZZeAT27E5urYoXpttgFDTbr2v4owwymLLSTLgKGCrFb8MTyVYEU6OKpVyyS1C5w7DsCGoEpZ0LvKK4RZKvI7xonR+c6U+oCgJfiNLELbVBIERg96lpeoerrcc+84ua3v6mRlJp9e1W4uq2E/JsCpcBTDShpltRF7lroHgE8OdFFw0X+gI9NTntdoJoyLsaEkh3yQgHeQO26n9Ud2Y/5t/m1d+e9f3Vr3k/mQ0JIE8WBzrQ1sAvyM6TDiYFW5YYIgu/TTreJZ4R0RtVBD1Qads0mKNHIkXlCW1ZhaWOl+aacCxHEX/B0c3rKogneXhlL5rSiETapbmaZBaK5FuNh3QYx1kowQGOP4S4X0i4amx38t7I4wy8KCJ/ucNcAmACQQju0BHEyzLvc6lo8MU68DJUtkU3QA9IEAcsXSPFSU=
Content-ID: <21267ADDF2612E4C8A264B453D646364@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b811b1-8deb-4f44-14b4-08d70a8ca775
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 07:59:11.9450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4470
Subject: Re: [Xen-devel] [PATCH v2 01/10] vm_event: Define VM_EVENT type
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDE0OjU5IC0wNjAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oDQo+ID4gYi94
ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaA0KPiA+IGluZGV4IDk1OTA4M2QuLmM0OGJjMjEg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaA0KPiA+IEBAIC0zNiw2ICszNiwzNyBAQA0K
PiA+ICAjaW5jbHVkZSAiaW8vcmluZy5oIg0KPiA+IA0KPiA+ICAvKg0KPiA+ICsgKiBUaGVyZSBh
cmUgY3VycmVudGx5IHRocmVlIHR5cGVzIG9mIFZNIGV2ZW50cy4NCj4gPiArICovDQo+IA0KPiBU
aGlzIGlzIGEgYml0IG1pc2xlYWRpbmcgYW5kIGNvbmZ1c2luZyBpZiBzb21lb25lIGp1c3QgbG9v
a3MgYXQgdGhlDQo+IGhlYWRlci4gUmlnaHQgbm93IHdlIGFjdHVhbGx5IGhhdmUgMTQgZGlmZmVy
ZW50IFZNX0VWRU5UX1JFQVNPTnMNCj4gZGVmaW5lZC4gV2hhdCB3ZSBoYXZlIDMgb2YgYXJlIHRo
ZSBkaWZmZXJlbnQgcmluZ3Mgd2hlcmUgdGhlc2UgZXZlbnRzDQo+IHdvdWxkIGJlIGRlbGl2ZXJl
ZCwgd2l0aCBwYWdpbmcgYW5kIHNoYXJpbmcgaGF2aW5nIHRoZWlyIG93biByaW5nDQo+IHNlcGFy
YXRlIGZyb20gdGhlIGV2ZW50cyB1bmRlciB0aGUgIm1vbml0b3IiIGxhYmVsLg0KPiANClRoZSBy
ZWFzb24gSSByZXBsYWNlZCAicmluZyIgd2l0aCAidHlwZSIgaXMgYmVjYXVzZSB0aGUgbmV4dCBw
YXRjaGVzDQppbnRyb2R1Y2UgYSBuZXcgbWVjaGFuaXNtIGZvciBoYW5kbGluZyByZXF1ZXN0cy9y
ZXNwb25zZXMgd2l0aG91dCB1c2luZw0KYSByaW5nLg0KDQpJIGFzc3VtZWQgdGhlIGZvbGxvd2lu
ZyBuYW1pbmcgY29udmVudGlvbjoNCg0KVHlwZSAtIHRoZSAic3Vic3lzdGVtIiB3aGljaCBnZW5l
cmF0ZXMgdGhlIHZtX2V2ZW50IHJlcXVlc3Q6IG1vbml0b3IsDQpwYWdpbmcgb3Igc2hhcmluZy4N
ClJlYXNvbiAtIFRoZSByZWFzb24gd2h5IHRoZSB2bV9ldmVudCByZXF1ZXN0IHdhcyBzZW50IChl
LmcuDQpWTV9FVkVOVF9SRUFTT05fTUVNX0FDQ0VTUykNCg0KSG93ZXZlciwgSSBkbyB1bmRlcnN0
YW5kIHRoYXQgaXQgY2FuIGJlIG1pc2xlYWRpbmcgd2l0aG91dCBhIHByb3Blcg0KZGVzY3JpcHRp
b24gc28gSSB3aWxsIHVwZGF0ZSB0aGUgZGVzY3JpcHRpb24uDQoNCk1hbnkgdGhhbmtzLA0KUGV0
cmUNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

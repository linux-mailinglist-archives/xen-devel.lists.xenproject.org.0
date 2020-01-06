Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60603130F75
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 10:30:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioOeL-0000PW-9I; Mon, 06 Jan 2020 09:26:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rIFB=23=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ioOeJ-0000PR-H5
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 09:26:11 +0000
X-Inumbo-ID: 92c52618-3066-11ea-aada-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.118]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92c52618-3066-11ea-aada-12813bfff9fa;
 Mon, 06 Jan 2020 09:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMTZfZdeCu5pRkh7cBpfTIoNQX0aC/XC808s+l8pRK/VQPZ6cd6XOzP/lD2Bz4UnRE0Yokn0vxBoOYVEFbTil2Rpj1s9Bnkjp4GllRbc73VNRdfCEvTcX//0CduzLw3y0SIlUk9FlFqw9aSEMf9HJRjYBuCNWkMf9D/vbtcbLZdXJeger/DEDGxVIkOjK0DrS4SoUmTGe0I96vXyaFrabH1pr6+5ry31sAIp0rIR0giM9KhHzrrstWeQstHIOpc/BwYtR1vabsQLps6+RzpF12QPr3o1HyWfc/i7zqPLMc0Lu47EFqzpw7XU0QhPJSCgDq0F9G4KphmAsN9Rfa94kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvWxfLNFhmyNtKz2R+X0EbjliBjbP+1TBYbwQL0H9Io=;
 b=Qjkgtl6FiSBGkAsSkT1GNQcklOcx/o0xZuaVe8hvvTBd0NNmLA0rpQKyRJeBbHIPcGcI/LAI2dc1yM+T42aaSV3RsJdF1POspFio/Zz2nl9GiEReaXxM3+Veu930SDzWOi/9gcsG8TyTBIqunlLXkSq3MHZsj8Hi67GrFpBp99Rfqsh82t5hD6MEigEzV6uBrxYXCygtoQC6rM6dPDya3Nx9EvDfSk2+vDGgpqUM6eQyO7CkX/b0YIheqp9q63/5D4AkVKFWpajvsu7YcVWmTzsdVWtOuFm4EULpsMNZSxKPdr86pnJUK1/IlQhBDsjPnWGQTrTSie0U6y0NwDJz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvWxfLNFhmyNtKz2R+X0EbjliBjbP+1TBYbwQL0H9Io=;
 b=lDxyTdcd2jxGbmfbnBRCtAwGZjDoLfJ0fK2Hx2unSMtoQBc/BxC8gKrB/8JFWC3/c3mIZO70d/BHzjHetQqZOOjgVfaujh0SCM8IxJvTWbSAOu/cJBKvSuiwmKzr8PE8hTB7JrvHusm+DTABxkCC3gC0oOVdwCrhDEhXcJId+aY=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB2983.eurprd02.prod.outlook.com (10.170.219.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Mon, 6 Jan 2020 09:21:07 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 09:21:07 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR01CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:208:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Mon, 6 Jan 2020 09:21:06 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH V6 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVuZnoQDql7d7Su0+P124sSAtk36fH6bYAgBWIVIA=
Date: Mon, 6 Jan 2020 09:21:07 +0000
Message-ID: <9e308acb-cc30-841b-c19c-5319fac99ca2@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
 <CABfawhkemF16-MzBTqKfzt4K_nAzYKbyx+RLWCSHkNjoO5M7qQ@mail.gmail.com>
In-Reply-To: <CABfawhkemF16-MzBTqKfzt4K_nAzYKbyx+RLWCSHkNjoO5M7qQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::16) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f213ff99-1109-4506-26e6-08d79289c2fd
x-ms-traffictypediagnostic: DB6PR02MB2983:|DB6PR02MB2983:|DB6PR02MB2983:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB2983D4A3F5662565264839AAAB3C0@DB6PR02MB2983.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(31686004)(71200400001)(53546011)(2616005)(956004)(26005)(5660300002)(186003)(6486002)(16526019)(316002)(16576012)(86362001)(54906003)(66446008)(64756008)(66556008)(66476007)(7416002)(31696002)(6916009)(478600001)(2906002)(52116002)(107886003)(8936002)(8676002)(81166006)(81156014)(4326008)(66946007)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB2983;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FTc+kJalTQ8Ei3woPFuTVo2NBqUarHexEDI2/zx74TdBEvPPjJ9n+/q1OoRFf2B9OHLOvYDUvomxH+OfMHxCyarwnr0EeX5Xf6xXwp+itbXN59RxdTcOfqrTIH9IpBrHnl64B4/nPy15iA9LZW28CglXis7KFEkbHNEJpizdEAEnybahkaEebQ5nUKSRpkLUmGQUdAAVFFPijqY+hiRGd94mrG6uM2deRb6c5HvA4EbMdtsyQUpfnNX60vgBGMiUGqtvpzsMlYs+OJBn6knvgmvgnkw9A+BoPVg3sX1R6CKKQEYBC5/20A2WXF3yQdYZjrJIho9xP0y2nUs8b+OjsoD3xN+Y2K7dNnGM/AiWWfK+/K27dzyJUQ62gkub8ode0dU1LI8GXHBvnWTYlHQ+xdrL1oSPLbdN8qVCxaj+kjxEtDJhTlC46V0U6WLgLY5W
Content-ID: <8375F996DAFF064BB180B518368FBE6B@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f213ff99-1109-4506-26e6-08d79289c2fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 09:21:07.8178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NeAz5ryqg/FhU34aBfnXHZaogaFi0lniwxBMDGJvMh4cjiUwykwj0SjdzMM5so0fnQ7BBGk8ut54Y+O0CARVx0G9HrMLOu02oh3NYFkN2LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB2983
Subject: Re: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIzLjEyLjIwMTkgMTg6MzEsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+
IGluZGV4IDRmYzkxOWE5YzUuLmRlODMyZGNjNmQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vcDJtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4gQEAgLTMwNzAs
NiArMzA3MCw3MCBAQCBvdXQ6DQo+PiAgICAgICByZXR1cm4gcmM7DQo+PiAgIH0NCj4+DQo+PiAr
LyoNCj4+ICsgKiBTZXQvY2xlYXIgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIG11bHRpcGxlIHBh
Z2VzLiAgT25seSBhdmFpbGFibGUgb24gVk1YLg0KPj4gKyAqLw0KPiANCj4gSSBoYXZlIHRvIHNh
eSBJIGZpbmQgaXQgYSBiaXQgb2RkIHdoeSB0aGlzIGZ1bmN0aW9uIGlzIGluIHAybS5jIGJ1dA0K
PiBpdCdzIGRlY2xhcmF0aW9uLi4uDQo+IA0KPj4gK2ludCBwMm1fc2V0X3N1cHByZXNzX3ZlX211
bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpICpzdmUpDQo+PiArew0KPiAN
Cj4gLi4uDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oDQo+PiBpbmRleCBlNGQyNDUwMmUwLi4wMGU1
OTRhMGFkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaA0KPj4gQEAgLTc1LDYgKzc1LDkgQEAg
bG9uZyBwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAgaW50
IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sIHN1
cHByZXNzX3ZlLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0
cDJtX2lkeCk7DQo+Pg0KPiANCj4gLi4gaW4gbWVtX2FjY2Vzcy5oPw0KPiANCj4+ICtpbnQgcDJt
X3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0
aSAqc3VwcHJlc3NfdmUpOw0KPj4gKw0KPiANCj4gSSBtZWFuLCBldmVuIGFsdHAybS5oIHdvdWxk
IG1ha2Ugc29yZSBzZW5zZSBmb3IgdGhpcy4gU28gd2hhdCdzIHRoZQ0KPiByYXRpb25hbCBiZWhp
bmQgdGhhdD8NCj4gDQoNCkluZGVlZCBpdCdzIG9kZCBidXQgcDJtX3NldF9zdXBwcmVzc192ZSgp
IGlzIGRlY2xhcmVkIGFib3ZlIHRoaXMuIEkgDQpkb24ndCBub3cgaG93IGl0IGdvdCB0aGVyZSBp
biB0aGUgZmlyc3QgcGxhY2UgYnV0IEkganVzdCBmb2xsb3dlZCB0aGF0IA0KcGF0dGVybi4NCg0K
QWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

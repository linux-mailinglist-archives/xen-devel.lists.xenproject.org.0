Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F71405A3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:52:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNJR-0001S7-TX; Fri, 17 Jan 2020 08:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pu3f=3G=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1isNJQ-0001S2-Em
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:49:04 +0000
X-Inumbo-ID: 311f92ce-3906-11ea-b89f-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.100]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 311f92ce-3906-11ea-b89f-bc764e2007e4;
 Fri, 17 Jan 2020 08:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+iRqn2aFuOUS8ylyvrDKaLyVW/7iDcfT7rEsFNBJ+PpoQ3haa1jYGtiUXZCNQKxO53QJCA2+8U2rdFQrL8WANPoBd4J/lxDExs/ax9SQ3odAmzZeCSoU4BZG1fnqEG38DZDgXk4MHGw04M3l3EpK5vgua1m7A6G6VWKm6FCsw4lTKfGSaQBFaPsC4UPBeHYczCms1Yn55AEvoWnPCcNS2sWT/BTXQW83t5p7NOov+W8+c+ykIMhk+BWPJh1ycif8Lcnluo4b5648yHl4x7v1oCoAT++yuL4S+jsv4A4j7hAJayOZomTTn6r1z/9e16EZoNNtv2Tdgg13pjZoafk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAA8GyehXNYNjaZRESiCo7nIJHussc3Auja5VUcxpgk=;
 b=BaqD4lyBVHzDEKQ5gFu2lXFW2gRLFGz1JkSLVxBp7hjfSNFmTvnIkQDW7qaABP83BIfZ+TPioMBOMgY02X+UB/ZVesU85gsaeIlu9hW1/kvXmCSUj3tIvRyqcWC4/6yPJoziKrpzwwXpKt4y+7tonlC+HV8rG388UgPc883Nm1KDy9X2zJX9p8ef/kIxcGnTbfxzqSsXl+oN7SO1TtbTAAp4xTqntjjS3iOe1V9Zjll1n1hDdjqie+MwdKoBZAcxyqfOH4qWDRZfvTejnP5h0KHA/BK+DjCu4lSrvkeVYfAItfOqOPKJczdZstMEEdrHGTCIZCoIsljXZl0721+ECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAA8GyehXNYNjaZRESiCo7nIJHussc3Auja5VUcxpgk=;
 b=WCqR2+Qgjxrf3zuq1d0OAWfdLtX+vziiHNqIBEqfdAy2jqrxWjQX4/CVsBVbEcGQd7fuggVGnkoh79bidsn/iirLvBHc9zrrz8I71Ujsi9yNxu3ydU/ZxrpvBDn0Fk5NSnFV6pAKIWKwSt0dWWweOCxT1XzfdOdkch9C5OiWSXQ=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3127.eurprd02.prod.outlook.com (10.175.233.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Fri, 17 Jan 2020 08:48:44 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 08:48:43 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 ZR0P278CA0018.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Fri, 17 Jan 2020 08:48:41 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V7 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
Thread-Index: AQHVxi0djSZfDHZ8NkyVFOFmjVTSAafkFTuAgAqEPwA=
Date: Fri, 17 Jan 2020 08:48:42 +0000
Message-ID: <95a0443e-4398-5557-ef13-fefc07a67d2e@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
 <bad288d5-c3e1-2af1-cabd-2d4c50535cdf@suse.com>
In-Reply-To: <bad288d5-c3e1-2af1-cabd-2d4c50535cdf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::28) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4982c9b0-b180-40e1-f08f-08d79b2a0e42
x-ms-traffictypediagnostic: DB6PR02MB3127:|DB6PR02MB3127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB3127A8C6AC018A6812B4231BAB310@DB6PR02MB3127.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(136003)(346002)(366004)(376002)(189003)(199004)(31686004)(478600001)(71200400001)(956004)(2616005)(8676002)(26005)(186003)(52116002)(66556008)(6486002)(16526019)(64756008)(8936002)(31696002)(36756003)(2906002)(16576012)(5660300002)(316002)(86362001)(81166006)(6916009)(54906003)(4326008)(53546011)(66476007)(81156014)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3127;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CO8Bu7IRDP7oPQdcpZVTdCXYK3U18xgR2dR+mp5Nck7BCO6HmhoSmtkOvqTrAOYL3gw5rnkzc2zru8Ftl7o+qgGV8NLyZ5zGBEYs7ue6Dyx6LdahpA155xkjRCzonvRFGAaJG02RoGB0xFyBfi2I5gcQvV+1j4YMhLreR8k92kMxdvisAwGsdDkqy0v3hFs+wUF4AB68u8BrJAmZTBi1AcjDdnirglO8OC5c/xBpD0ZEEQjSrIRJWztl/gRWdlwHgRx7xacmmvT4J+qBalB7zpfx7hck+oq8yDYlTG3Pk1bPIuuHofL+tQXqif2ScrG78580yQt+KoWI6oOnGQ1Yiz+vZAdHbfONXtYghODZlUP5rSBpsm4xlQL33+SduAAz5V0dmPl2xGxFPhZpUeXrEDXGhAMKCrX947YkmA2tJXgWCm9St6AMBNtCLXmO7K3C
Content-ID: <82C0144E7CA11445A48381F6CDB4EA20@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4982c9b0-b180-40e1-f08f-08d79b2a0e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 08:48:43.0491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkG53E7oqK1D66BDenKUzwltaJVHFSKCE4pNkrwj66DlCNcoZyS1aqdH/1C8dQ3WOfEG3DagYq4hDKBRHif0YQUwV5qKQg3o7t54TG2UpAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3127
Subject: Re: [Xen-devel] [PATCH V7 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEwLjAxLjIwMjAgMTg6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wMS4y
MDIwIDE1OjA4LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IENoYW5nZXMgc2lu
Y2UgVjY6DQo+PiAJLSBSZW1vdmUgc3RyYXkgc3BhY2VzDQo+PiAJLSBVc2UgQVJSQVlfU0laRShk
LT5hcmNoLmFsdHAybV9wMm0pIGluc2VhZCBvZiBNQVhfQUxUUDJNLg0KPiANCj4gSSdtIG5vdCB1
dHRlcmx5IGNvbmZ1c2VkOg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNz
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+IEBAIC0zNjYsMTEg
KzM2NiwxMyBAQCBsb25nIHAybV9zZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5f
dCBnZm4sIHVpbnQzMl90IG5yLA0KPj4gICAjaWZkZWYgQ09ORklHX0hWTQ0KPj4gICAgICAgaWYg
KCBhbHRwMm1faWR4ICkNCj4+ICAgICAgIHsNCj4+IC0gICAgICAgIGlmICggYWx0cDJtX2lkeCA+
PSBNQVhfQUxUUDJNIHx8DQo+PiAtICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0
cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+ICsgICAgICAgIGlmICggYWx0cDJt
X2lkeCA+PSBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0pLCBNQVhfRVBUUCkgfHwN
Cj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMo
YWx0cDJtX2lkeCwgTUFYX0VQVFApXSA9PQ0KPj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElE
X01GTikgKQ0KPj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICAgDQo+PiAtICAg
ICAgICBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FsdHAybV9pZHhdOw0KPj4gKyAgICAgICAg
YXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShkLT5hcmNo
LmFsdHAybV9wMm0pKV07DQo+IA0KPiBXaHkgaXMgdGhpcyBzdGlsbCBub3QNCj4gDQo+ICAgICAg
ICAgIGFwMm0gPSBhcnJheV9hY2Nlc3Nfbm9zcGVjKGQtPmFyY2guYWx0cDJtX3AybSwgYWx0cDJt
X2lkeCk7DQo+IA0KPiA/IFdoYXQgYW0gSSBtaXNzaW5nPw0KPiANCg0KU29ycnkgZm9yIHRoZSBt
aXN1bmRlcnN0YW5kaW5nIGhlcmUsIEkgd2lsbCB1c2UgIGFycmF5X2FjY2Vzc19ub3NwZWMoKSAN
CndoZXJlIHRoZSBBUlJBWV9TSVpFKGQtPmFyY2guYWx0cDJtX3AybSkgaXMgdXNlZC4NCg0KDQpB
bGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16C6BE86
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 16:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnlCc-0004SZ-6d; Wed, 17 Jul 2019 14:46:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnlCa-0004SU-TA
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 14:46:40 +0000
X-Inumbo-ID: ae287f5e-a8a1-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.131]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae287f5e-a8a1-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 14:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw+U5R4+tiSVKa/yxkJVtmpCEWmSFe35bkUSSbj5mWDKCzK5ko0mcRdpI87CwKinwEYzIFNrtqwkSaozSzQfc91qgP+Ivdb90+sa45InMDGhQjO57GtnZc9ssPi0gfgdk4JqWpMR8rSzz4k2TcqQVKF0NYu49yYVXYMXBjecHrc2aZ57f9+hvzrweaUBnqD7JtBVjIAzQHBkgr2VVLizjwM48fnLCsxPjBz2vteiHXhVYIOnJewmUYxtGQdWX2WKyCyK6JpywbfvSTXjT3/C48PYPYKQ6gNrcN0VyqMNCQCe3dcnjKKObjI7/hWBFABycPNj8/S8XZB+dcpN4hP4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BPUIR9eaYvqraUIW0AEWU2lZP7HbeCGpp0YovLeRgE=;
 b=RZB2xJxkJIB9hvUpET9xsG19C7wEmj3rRlIyyJRtFtu+FUH64EO0mVtuyad489TQMoTtU6tWkzwBu/q9oPTrT97tjXGjFbh0J5plf5w+UQ88V92NBQYxERdR0k3W0suz3Ub/lmOqRMBQMPOCQ9MBsaIacjg8wck6nmIvtyuCc9ua/Zb4yD27Ln87hRt+Tvz1H22YploGqXOsWF5OTQadJMYSzVz4rC14AOp2t7qAvFzSxWwSSH1iiPTUloP9rEynVEhFNOBD8RaLaDoFW78pni0VG3rcfBBFRD8bsZ/XHTjRaLtHtZpo89+R4UVOlzX7cB5DgBf+xWCjJxUGDnUrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BPUIR9eaYvqraUIW0AEWU2lZP7HbeCGpp0YovLeRgE=;
 b=JuBU22ejrQkmEXarKs7QBgq/ID94QpuldKuNdi0TfT3dgJ0Sj6lRmo5ZFes1vd1gEgEgOXl9pUyROM2g1JXm8d2UOAR3qT/hqC1VoUtQGhb6tMfrasKit3OwxmIdgcATttMC9uEerDrGbLNvQOroisB6xmdeTkpN7Oq89Rbp9mw=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4549.eurprd02.prod.outlook.com (20.177.196.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 14:46:36 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 14:46:36 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ji+ep3hd1WrES1BL2P0bM6cabO0xCAgAAR2IA=
Date: Wed, 17 Jul 2019 14:46:36 +0000
Message-ID: <03f14635d0b8193cecaed2e417b0eb0fd8b2722f.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <24c588b3-41db-b558-cae6-d586970038b2@bitdefender.com>
In-Reply-To: <24c588b3-41db-b558-cae6-d586970038b2@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::35) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f22a0ab-258f-478d-9f49-08d70ac5917b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4549; 
x-ms-traffictypediagnostic: AM6PR02MB4549:|AM6PR02MB4549:
x-microsoft-antispam-prvs: <AM6PR02MB45493AABA6946C96512557E4D6C90@AM6PR02MB4549.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(26005)(2906002)(256004)(14444005)(186003)(53936002)(6246003)(14454004)(6486002)(6436002)(486006)(4326008)(36756003)(6116002)(6512007)(76176011)(3846002)(81166006)(110136005)(71200400001)(71190400001)(81156014)(50226002)(305945005)(54906003)(7736002)(8936002)(2501003)(99286004)(316002)(52116002)(7416002)(66556008)(66476007)(102836004)(66446008)(64756008)(66946007)(6506007)(386003)(68736007)(8676002)(229853002)(86362001)(476003)(5660300002)(2616005)(25786009)(478600001)(11346002)(446003)(118296001)(66066001)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4549;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jz0Ku2A1dwg4+YU4diywYd2IikpdRfpLCVpit3OdcxnVmc+I4VJaA4PbGlLapoKi19H9dMqcWNWD+JSKMOzKxbC++/swoY5IZ/8nYiAyf/tTA3OwBfYZtjVYKJbYoFy22Wafb0t2lL9X3yEDgMEy+fdDERcSpSDSfG8GTsNDl8EZVcWbrXWSsCpHyzQtR4/r34smZ32zo5kKH21XnIpbaPhwShKMwymVpswQx1BGMgCQowczlFRaeS0vQrbVEj7B76OYBz0AKlid2Nzlddfn8+xeV3E6JMrJ4fE9XHwjGyByLYIsKEB3KZE3o2VcI5K+DB/otorQPLrTdHU8ap5xmgn7uTsIYWBmfoX3qPaObyjEeGhHZ+B9x0viPCuLgqRA+z4Sh1LEf+9U6mTpeQXeVTohhQaWjc/Cf5MregQ+VKM=
Content-ID: <A7D195FF5A56354285EC29C08D154022@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22a0ab-258f-478d-9f49-08d70ac5917b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 14:46:36.3126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4549
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDE2OjQyICswMzAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gPiArDQo+ID4gK291dDoNCj4gPiArICAgIHJjMiA9IHhjX2RvbWFpbl91bnBh
dXNlKHhjaCwgZG9tYWluX2lkKTsNCj4gPiArICAgIGlmICggcmMxIHx8IHJjMiApDQo+ID4gKyAg
ICB7DQo+ID4gKyAgICAgICAgaWYgKCByYzIgKQ0KPiA+ICsgICAgICAgICAgICBQRVJST1IoIlVu
YWJsZSB0byBwYXVzZSBkb21haW5cbiIpOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoIHJjMSA9
PSAwICkNCj4gPiArICAgICAgICAgICAgcmMxID0gcmMyOw0KPiANCj4gWW91IGNhbiB1c2UgIXJj
MSBoZXJlLg0KPiANCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZXR1cm4gcmMxOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICtpbnQgeGNfdm1fZXZlbnRfbmdfZGlzYWJsZSh4Y19pbnRlcmZhY2Ug
KnhjaCwgdWludDMyX3QgZG9tYWluX2lkLA0KPiA+IGludCB0eXBlLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICB4ZW5mb3JlaWdubWVtb3J5X3Jlc291cmNlX2hhbmRsZQ0KPiA+ICoq
ZnJlcykNCj4gPiArew0KPiA+ICsgICAgeGVuZm9yZWlnbm1lbW9yeV91bm1hcF9yZXNvdXJjZSh4
Y2gtPmZtZW0sICpmcmVzKTsNCj4gPiArICAgICpmcmVzID0gTlVMTDsNCj4gPiArDQo+ID4gKyAg
ICByZXR1cm4geGNfdm1fZXZlbnRfY29udHJvbCh4Y2gsIGRvbWFpbl9pZCwNCj4gPiBYRU5fVk1f
RVZFTlRfRElTQUJMRSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwg
WEVOX1ZNX0VWRU5UX0ZMQUdTX05HX09QLA0KPiA+IE5VTEwpOw0KPiA+ICt9DQo+ID4gKw0KPiAN
Cj4gDQo+IA0KPiA+ICAgDQo+ID4gK3N0YXRpYyBpbnQgdm1fZXZlbnRfcmluZ19wZm5fcGFyYW0o
dWludDMyX3QgdHlwZSkNCj4gPiArew0KPiA+ICsgICAgc3dpdGNoKCB0eXBlICkNCj4gPiArICAg
IHsNCj4gPiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1BBR0lORw0KPiA+ICsgICAgY2FzZSBYRU5f
Vk1fRVZFTlRfVFlQRV9QQUdJTkc6DQo+ID4gKyAgICAgICAgcmV0dXJuIEhWTV9QQVJBTV9QQUdJ
TkdfUklOR19QRk47DQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgY2FzZSBYRU5fVk1fRVZFTlRfVFlQ
RV9NT05JVE9SOg0KPiA+ICsgICAgICAgIHJldHVybiBIVk1fUEFSQU1fTU9OSVRPUl9SSU5HX1BG
TjsNCj4gPiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcNCj4gPiArICAgIGNhc2UgWEVO
X1ZNX0VWRU5UX1RZUEVfU0hBUklORzoNCj4gPiArICAgICAgICByZXR1cm4gSFZNX1BBUkFNX1NI
QVJJTkdfUklOR19QRk47DQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgfTsNCj4gPiArDQo+ID4gKyAg
ICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPiArICAgIHJldHVybiAtMTsNCj4gDQo+IEJsYW5r
IGxpbmUgYmVmb3JlIGZpbmFsIHJldHVybi4uLg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIGludCB2bV9ldmVudF9wYXVzZV9mbGFnKHVpbnQzMl90IHR5cGUpDQo+ID4gK3sNCj4gPiAr
ICAgIHN3aXRjaCggdHlwZSApDQo+ID4gKyAgICB7DQo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX01F
TV9QQUdJTkcNCj4gPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVfUEFHSU5HOg0KPiA+ICsg
ICAgICAgIHJldHVybiBfVlBGX21lbV9wYWdpbmc7DQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgY2Fz
ZSBYRU5fVk1fRVZFTlRfVFlQRV9NT05JVE9SOg0KPiA+ICsgICAgICAgIHJldHVybiBfVlBGX21l
bV9hY2Nlc3M7DQo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5HDQo+ID4gKyAgICBj
YXNlIFhFTl9WTV9FVkVOVF9UWVBFX1NIQVJJTkc6DQo+ID4gKyAgICAgICAgcmV0dXJuIF9WUEZf
bWVtX3NoYXJpbmc7DQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgfTsNCj4gPiArDQo+ID4gKyAgICBB
U1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPiArICAgIHJldHVybiAtMTsNCj4gDQo+IGhlcmUNCj4g
DQo+ID4gK30NCj4gPiArDQo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX01FTV9QQUdJTkcNCj4gPiAr
c3RhdGljIHZvaWQgbWVtX3BhZ2luZ19ub3RpZmljYXRpb24oc3RydWN0IHZjcHUgKnYsIHVuc2ln
bmVkIGludA0KPiA+IHBvcnQpOw0KPiA+ICsjZW5kaWYNCj4gPiArc3RhdGljIHZvaWQgbW9uaXRv
cl9ub3RpZmljYXRpb24oc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludA0KPiA+IHBvcnQpOw0K
PiA+ICsjaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORw0KPiA+ICtzdGF0aWMgdm9pZCBtZW1f
c2hhcmluZ19ub3RpZmljYXRpb24oc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludA0KPiA+IHBv
cnQpOw0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gK3N0YXRpYyB4ZW5fZXZlbnRfY2hhbm5lbF9u
b3RpZmljYXRpb25fdA0KPiA+IHZtX2V2ZW50X25vdGlmaWNhdGlvbl9mbih1aW50MzJfdCB0eXBl
KQ0KPiA+ICt7DQo+ID4gKyAgICBzd2l0Y2goIHR5cGUgKQ0KPiA+ICsgICAgew0KPiA+ICsjaWZk
ZWYgQ09ORklHX0hBU19NRU1fUEFHSU5HDQo+ID4gKyAgICBjYXNlIFhFTl9WTV9FVkVOVF9UWVBF
X1BBR0lORzoNCj4gPiArICAgICAgICByZXR1cm4gbWVtX3BhZ2luZ19ub3RpZmljYXRpb247DQo+
ID4gKyNlbmRpZg0KPiA+ICsgICAgY2FzZSBYRU5fVk1fRVZFTlRfVFlQRV9NT05JVE9SOg0KPiA+
ICsgICAgICAgIHJldHVybiBtb25pdG9yX25vdGlmaWNhdGlvbjsNCj4gPiArI2lmZGVmIENPTkZJ
R19IQVNfTUVNX1NIQVJJTkcNCj4gPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVfU0hBUklO
RzoNCj4gPiArICAgICAgICByZXR1cm4gbWVtX3NoYXJpbmdfbm90aWZpY2F0aW9uOw0KPiA+ICsj
ZW5kaWYNCj4gPiArICAgIH07DQo+ID4gKw0KPiA+ICsgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
DQo+ID4gKyAgICByZXR1cm4gTlVMTDsNCj4gDQo+IGFuZCBoZXJlDQo+IA0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICsvKg0KPiA+ICsgKiBWTSBldmVudCByaW5nIGltcGxlbWVudGF0aW9uOw0KPiA+ICsg
Ki8NCj4gDQo+IEFsZXgNClRoYW5rcyBmb3Igbm90aWNpbmcgdGhlc2UuIEkgd2lsbCBmaXggdGhl
bSBpbiB0aGUgbmV4dCBwYXRjaCBpdGVyYXRpb24uDQoNClBldHJlDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

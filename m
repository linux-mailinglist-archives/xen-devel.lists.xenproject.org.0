Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E2F5BAE1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:42:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhufS-0004vR-TW; Mon, 01 Jul 2019 11:40:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhufQ-0004vM-Vs
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:40:17 +0000
X-Inumbo-ID: fe2bbffe-9bf4-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fe2bbffe-9bf4-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 11:40:15 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:36:40 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:39:17 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:39:17 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3204.namprd18.prod.outlook.com (10.255.137.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Mon, 1 Jul 2019 11:39:16 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:39:16 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xstate: make use_xsave non-init
Thread-Index: AQHVMAGdCquHeScd+UuKxH/O+V4l3A==
Date: Mon, 1 Jul 2019 11:39:16 +0000
Message-ID: <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
References: <20190701104903.72364-1-roger.pau@citrix.com>
In-Reply-To: <20190701104903.72364-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::30)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcb2b73b-8682-436d-bd4e-08d6fe18bf8e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3204; 
x-ms-traffictypediagnostic: BY5PR18MB3204:
x-microsoft-antispam-prvs: <BY5PR18MB3204E8DC645327619CFDF25AB3F90@BY5PR18MB3204.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(2906002)(73956011)(66946007)(14454004)(66476007)(66556008)(64756008)(66446008)(72206003)(229853002)(6486002)(71190400001)(6512007)(71200400001)(6436002)(53936002)(54906003)(36756003)(4326008)(5660300002)(4744005)(6246003)(110136005)(31696002)(305945005)(316002)(7736002)(66066001)(86362001)(25786009)(5024004)(81166006)(186003)(26005)(478600001)(68736007)(3846002)(6116002)(31686004)(256004)(8936002)(81156014)(52116002)(386003)(486006)(8676002)(6506007)(76176011)(80792005)(102836004)(2616005)(476003)(53546011)(11346002)(2501003)(446003)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3204;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1LLdiLIPiui7vd02m2QsCTqQyLn5TUnMCrKBhafdrr35E51Ix0bwL1x73G6pTxAJdo9OuKOFv/G+PtU53ALN6urGkv6l1ojicWPKj3zVGV9VMv3oFQE4jhszHuR2wIgORmdEDQBTv2l3vJyWoyJctweGyVdbTV0gEP9wdDlkp7B8j+T1ptBj3DWzib6n1K57bBzcT0VjijZ391qjy1zzVmjHhI4jxry7L3qN3qVSPGXlLL8wPyx5AOCmIIgmEyTDAdFnbU2mclE/eMhv6WTpWjo76PhvqazwH1ONOpNk/CX5TvwyT/pmDQIohjCR/Dc2MWzOY8itVEBMnMjDHnFFoniXLk3xmk5Pdb0q/thuplz9vtWz0qUBSJ7tBoyGNqcdJeGtPX2ym751HKrPyp7G16TIIoWNp+HHCIoFIeTqnNU=
Content-ID: <398838398079584AB10E2641C101DC71@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb2b73b-8682-436d-bd4e-08d6fe18bf8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:39:16.7895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3204
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiAtLS0gYS94ZW4v
YXJjaC94ODYveHN0YXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3hzdGF0ZS5jDQo+IEBAIC01
NzcsNyArNTc3LDcgQEAgdW5zaWduZWQgaW50IHhzdGF0ZV9jdHh0X3NpemUodTY0IHhjcjApDQo+
ICAgLyogQ29sbGVjdCB0aGUgaW5mb3JtYXRpb24gb2YgcHJvY2Vzc29yJ3MgZXh0ZW5kZWQgc3Rh
dGUgKi8NCj4gICB2b2lkIHhzdGF0ZV9pbml0KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4gICB7
DQo+IC0gICAgc3RhdGljIGJvb2wgX19pbml0ZGF0YSB1c2VfeHNhdmUgPSB0cnVlOw0KPiArICAg
IHN0YXRpYyBib29sIHVzZV94c2F2ZSA9IHRydWU7DQoNClBsZWFzZSBhdHRhY2ggYXQgbGVhc3Qg
YSBicmllZiBjb21tZW50IGhlcmUsIHN1Y2ggdGhhdCBwZW9wbGUNCndvbid0IGNvbnNpZGVyIHRo
ZSBfX2luaXRkYXRhIG1pc3NpbmcuDQoNCk9mIGNvdXJzZSBJJ2QgYWN0dWFsbHkgcHJlZmVyIHRo
ZSBhbm5vdGF0aW9uIHRvIHN0YXkgaGVyZSBpbg0KdGhlIGdjYyBjYXNlLiBJaXJjIHRoZXJlIHdh
cyBvbmUgb3RoZXIgY2FzZSB3aGVyZSB0aGVyZSB3YXMNCnN1Y2ggYW4gaXNzdWU7IEkgZG9uJ3Qg
cmVjYWxsIHdoZXRoZXIgdGhlcmUgaXQgdG9vIGdvdCBkZWFsdA0Kd2l0aCBieSByZW1vdmluZyBh
biBhbm5vdGF0aW9uLiBIb3cgYWJvdXQgd2UgaW50cm9kdWNlIGFuDQphbm5vdGF0aW9uIHRoYXQg
ZXhwYW5kcyB0byBub3RoaW5nIGluIHRoZSBjbGFuZyBjYXNlLCBidXQNCmNvbnRpbnVlcyB0byBw
cm92aWRlIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgZm9yIGdjYz8gVGhhdA0Kd291bGQgdGhlbiBh
bHNvIGNsYXJpZnkgdGhlIHJlYXNvbiBmb3IgaXQgYmVpbmcgaW4gYW55DQpwYXJ0aWN1bGFyIHBs
YWNlIChJIGd1ZXNzIHRoZXJlIGFyZSBnb2luZyB0byBiZSBtb3JlKSB3aXRob3V0DQp0aGUgbmVl
ZCBmb3IgZnVydGhlciBjb21tZW50YXJ5Lg0KDQpKYW4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

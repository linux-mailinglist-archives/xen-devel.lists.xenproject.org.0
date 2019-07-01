Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746075BCE9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 15:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhwMW-0006KD-7l; Mon, 01 Jul 2019 13:28:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhwMU-0006K8-UY
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 13:28:50 +0000
X-Inumbo-ID: 262861fb-9c04-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 262861fb-9c04-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 13:28:49 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 13:28:40 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 13:27:10 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 13:27:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3378.namprd18.prod.outlook.com (10.255.139.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 13:27:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 13:27:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v1] x86/mm: Clean IOMMU flags from p2m-pt code
Thread-Index: AQHVMBCvc0kBssqrdkaDdozFbSPhbw==
Date: Mon, 1 Jul 2019 13:27:09 +0000
Message-ID: <15db3f77-ba0f-4d42-bbea-30909d02b705@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::32) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e16094b-63f3-4ea6-a69f-08d6fe27d1b9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3378; 
x-ms-traffictypediagnostic: BY5PR18MB3378:
x-microsoft-antispam-prvs: <BY5PR18MB33788FF3AAC2D7B786012B12B3F90@BY5PR18MB3378.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(199004)(189003)(81156014)(52116002)(8676002)(86362001)(31696002)(73956011)(478600001)(53546011)(81166006)(36756003)(6436002)(229853002)(7736002)(64756008)(14454004)(66946007)(186003)(66446008)(4326008)(8936002)(6512007)(99286004)(25786009)(6246003)(6506007)(305945005)(102836004)(386003)(316002)(54906003)(80792005)(5660300002)(66066001)(6116002)(71200400001)(53936002)(6916009)(486006)(476003)(72206003)(68736007)(3846002)(26005)(31686004)(66476007)(66556008)(256004)(6486002)(2906002)(14444005)(2616005)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3378;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A4ND/ky9Jo3hKIeFEuDMn0g2mfWZqJuWQiFEW1P9zBblI4gw3g1ly6xt2hKpTrLhDoznKfD8e6BS6fWjpNGjB1CutK9qqJJ3oNlz+iLsQS8e7WnqCryr7KeVJlTIAsxLpPsPp0Y0qbkAI6BMRwTyANj0P2tb6d1INjaCZsInm2lggGT/1A0QtCCuNuj6r3PetHD9VhZR+taN3ylaTQjCL8LoVafOhPWDehf5MVkwKDLcQSG9wyz5FF9SX/2AULQM03rqQ7B41V890jhof7IxzGhD4TcH6Yu1VSag7otGkJMvmZELzpf9F1/JFwDY0kSPBQLJkBgv8662N5xGewgqIGFTlA9kVX5br63xzVcrkbX7CDD6UTNW5S/9XiZseoYQJh5abWUI3wWPlaOqtYHCxuQEOX8/KLdieFs5AktU/Rc=
Content-ID: <7970CD0D7E1E7444A29FCD1557F18680@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e16094b-63f3-4ea6-a69f-08d6fe27d1b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 13:27:09.7896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3378
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Clean IOMMU flags from p2m-pt
 code
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDEzOjU0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Og0KPiBBdCB0aGUgbW9tZW50IHRoZSBJT01NVSBmbGFncyBhcmUgbm90IHVzZWQgaW4gcDJtLXB0
IGFuZCBjb3VsZCBiZSB1c2VkDQo+IG9uIG90aGVyIGFwcGxpY2F0aW9uLg0KDQpJIGRvbid0IHVu
ZGVyc3RhbmQgdGhlIHNlY29uZCBoYWxmIG9mIHRoaXMgc2VudGVuY2UuIEkgZ3Vlc3MgYW55d2F5
DQp0aGF0IHlvdSB3YW50IHRvIGF0IGxlYXN0IG1lbnRpb24gdGhlIGZhY3QgdGhhdCBDUFUgYW5k
IElPTU1VIHBhZ2UNCnRhYmxlcyBjYW4ndCBiZSBzaGFyZWQgYW55bW9yZSwgaWRlYWxseSBjaXRp
bmcgdGhlIGNvbW1pdCB0aGF0IG1hZGUNCnRoaXMgaW1wb3NzaWJsZS4NCg0KPiBUaGlzIHBhdGNo
IGFpbXMgdG8gY2xlYW4gdGhlIHVzZSBvZiBJT01NVSBmbGFncyBvbiB0aGUgQU1EIHAybSBzaWRl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZl
bmRlci5jb20+DQo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPg0KDQpOaXQ6IFRoZSBuYXR1cmFsIG9yZGVyIGlzIHRoZSBvdGhlciB3YXkgYXJv
dW5kLCBzaG93aW5nIHRoZSBmbG93DQpvZiBldmVudHMuDQoNCj4gQEAgLTM2LDEzICszNSwxMiBA
QA0KPiAgI2luY2x1ZGUgPGFzbS9wMm0uaD4NCj4gICNpbmNsdWRlIDxhc20vbWVtX3NoYXJpbmcu
aD4NCj4gICNpbmNsdWRlIDxhc20vaHZtL25lc3RlZGh2bS5oPg0KPiAtI2luY2x1ZGUgPGFzbS9o
dm0vc3ZtL2FtZC1pb21tdS1wcm90by5oPg0KPiAgDQo+ICAjaW5jbHVkZSAibW0tbG9ja3MuaCIN
Cj4gIA0KPiAgLyoNCj4gICAqIFdlIG1heSBzdG9yZSBJTlZBTElEX01GTiBpbiBQVEVzLiAgV2Ug
bmVlZCB0byBjbGlwIHRoaXMgdG8gYXZvaWQgdHJhbXBsaW5nDQo+IC0gKiBvdmVyIGhpZ2hlci1v
cmRlciBiaXRzIChOWCwgcDJtIHR5cGUsIElPTU1VIGZsYWdzKS4gIFdlIHNlZW0gdG8gbm90IG5l
ZWQNCj4gKyAqIG92ZXIgaGlnaGVyLW9yZGVyIGJpdHMgKE5YLCBwMm0gdHlwZSkuICBXZSBzZWVt
IHRvIG5vdCBuZWVkDQo+ICAgKiB0byB1bmNsaXAgb24gdGhlIHJlYWQgcGF0aCwgYXMgY2FsbGVy
cyBhcmUgY29uY2VybmVkIG9ubHkgd2l0aCBwMm0gdHlwZSBpbg0KPiAgICogc3VjaCBjYXNlcy4N
Cj4gICAqLw0KDQpQbGVhc2UgcmUtZmxvdyB0aGUgcmVtYWluZGVyIG9mIHRoZSBjb21tZW50Lg0K
DQo+IEBAIC0xNjUsMTYgKzE2Myw2IEBAIHAybV9mcmVlX2VudHJ5KHN0cnVjdCBwMm1fZG9tYWlu
ICpwMm0sIGwxX3BnZW50cnlfdCANCg0KQmVsb3cgdGhlIHByZXZpb3VzIGJ1dCBhaGVhZCBvZiB0
aGlzIGh1bmsgdGhlcmUncyBwMm1fdHlwZV90b19mbGFncygpLA0Kd2hpY2ggaGFzIGEgY29tbWVu
dCB0aGF0IGxvb2tzIHRvIHdhbnQgYWRqdXN0bWVudCAocmVtb3ZhbD8pIGFzIHdlbGwuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

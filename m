Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70385E56B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:26:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hifDc-0006Xe-P4; Wed, 03 Jul 2019 13:22:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SCRb=VA=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hifDb-0006XX-PF
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:22:39 +0000
X-Inumbo-ID: a00c16dd-9d95-11e9-8980-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.113]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a00c16dd-9d95-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SlKw7IBpYP93EeUunwuRFFPA/fzY6NaSxMF6Tr0Wf0=;
 b=f11ldJHspgosYfTPdY4fhGtXWeiXUM1NuBapegtgBfUmdSUNkxDrUk4tXUlC7bDljb99W3NlKU7eWKspLf7I3RKKkLn9TbJM8O/EHLxwfq8T+tc/IG8d8deX4g13OzUeIL9ix/pqC+xFLX//f0OMRw5bbj+q3p5cfyQUjNfCDfE=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2734.eurprd02.prod.outlook.com (10.171.101.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 13:22:34 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 13:22:34 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
Thread-Index: AQHVMZ+vT4qTqzV7vk6Vbk2g8RMb26a44X0A
Date: Wed, 3 Jul 2019 13:22:34 +0000
Message-ID: <e735f34e-f8b2-ff15-ea3f-943efc83b23a@bitdefender.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
In-Reply-To: <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::22)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af0e6e3f-fb2d-429c-afa7-08d6ffb9827a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2734; 
x-ms-traffictypediagnostic: VI1PR0202MB2734:|VI1PR0202MB2734:
x-microsoft-antispam-prvs: <VI1PR0202MB27346F69253DFFA12849EF0EABFB0@VI1PR0202MB2734.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(136003)(366004)(396003)(346002)(189003)(199004)(31686004)(486006)(66066001)(7736002)(5660300002)(186003)(2906002)(68736007)(256004)(8936002)(446003)(11346002)(2501003)(6116002)(3846002)(2616005)(305945005)(73956011)(476003)(66946007)(26005)(66476007)(66556008)(478600001)(102836004)(64756008)(66446008)(71190400001)(71200400001)(99286004)(6436002)(6486002)(36756003)(229853002)(6246003)(8676002)(81156014)(81166006)(386003)(25786009)(6506007)(53936002)(31696002)(14454004)(6512007)(316002)(54906003)(76176011)(52116002)(110136005)(86362001)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2734;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xNtPSP4TxhmFBZDVh4nRPju7TROG63A7NruhBrDQDEC9X89GEMtsPylFqoFNKoQf0YkW3geJ3DV7MN6WsyLkjXorNunH6N/nmFneN5ae7It/3HhTTcsd8OJHMJBNdEmZX90C0cJff5eKWi/c5dNSfxrCJmt+mKorkjawYFJRgC7LHPZqU/EdfO4YzNbyJNM/G5+b52iNRl4TTVCSz6Y18Kn6nUs4w1vDUvsueSDSSUfd7JKSujpIX+pE8Nu0AFuKAAdx8bQsnghJynp5U9dpcuaz1VmptndVc/kK8x8mZPCb8mWD7masYCSD2xBCPdedzQdZiGu7hGVel2xXnmh51fEwfzuHZZ8r9EW68PT7z45TnfDPv71NCMBeoTKwwQutJmpg6SPADtzNM6s/AiwI6PRNGELQncdKMe4CkAOYzgg=
Content-ID: <CF9CDF986B9C5F409D97C30010623CDD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0e6e3f-fb2d-429c-afa7-08d6ffb9827a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:22:34.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2734
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+ICAgICAgICB7DQo+IEBAIC0xMzk2LDEyICsxNDA1LDEyIEBAIGludCBwbXN0YXRfcmVzZXRf
Y3hfc3RhdCh1aW50MzJfdCBjcHVpZCkNCj4gICAgDQo+ICAgIHZvaWQgY3B1aWRsZV9kaXNhYmxl
X2RlZXBfY3N0YXRlKHZvaWQpDQo+ICAgIHsNCj4gLSAgICBpZiAoIG1heF9jc3RhdGUgPiAxICkN
Cj4gKyAgICBpZiAoIG1heF9jc3RhdGUgPiBBQ1BJX1NUQVRFX0MxICkNCj4gICAgICAgIHsNCj4g
ICAgICAgICAgICBpZiAoIGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgKQ0KPiAtICAgICAgICAgICAg
bWF4X2NzdGF0ZSA9IDI7DQo+ICsgICAgICAgICAgICBtYXhfY3N0YXRlID0gQUNQSV9TVEFURV9D
MjsNCj4gICAgICAgICAgICBlbHNlDQo+IC0gICAgICAgICAgICBtYXhfY3N0YXRlID0gMTsNCj4g
KyAgICAgICAgICAgIG1heF9jc3RhdGUgPSBBQ1BJX1NUQVRFX0MxOw0KPiAgICAgICAgfQ0KPiAg
ICANCj4gICAgICAgIGhwZXRfZGlzYWJsZV9sZWdhY3lfYnJvYWRjYXN0KCk7DQo+IEBAIC0xNDA5
LDcgKzE0MTgsOCBAQCB2b2lkIGNwdWlkbGVfZGlzYWJsZV9kZWVwX2NzdGF0ZSh2b2lkKQ0KPiAg
ICANCj4gICAgYm9vbCBjcHVpZGxlX3VzaW5nX2RlZXBfY3N0YXRlKHZvaWQpDQo+ICAgIHsNCj4g
LSAgICByZXR1cm4geGVuX2NwdWlkbGUgJiYgbWF4X2NzdGF0ZSA+IChsb2NhbF9hcGljX3RpbWVy
X2MyX29rID8gMiA6IDEpOw0KPiArICAgIHJldHVybiB4ZW5fY3B1aWRsZSAmJiBtYXhfY3N0YXRl
ID4gKGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgPyBBQ1BJX1NUQVRFX0MyDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IEFD
UElfU1RBVEVfQzEpOw0KPiAgICB9DQo+ICAgIA0KPiAgICBzdGF0aWMgaW50IGNwdV9jYWxsYmFj
aygNCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMNCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2NwdS9td2FpdC1pZGxlLmMNCj4gQEAgLTczMSw3ICs3MzEsOCBAQCBzdGF0aWMgdm9p
ZCBtd2FpdF9pZGxlKHZvaWQpDQo+ICAgIAkJfSB3aGlsZSAoY3gtPnR5cGUgPiBtYXhfY3N0YXRl
ICYmIC0tbmV4dF9zdGF0ZSk7DQo+ICAgIAkJaWYgKCFuZXh0X3N0YXRlKQ0KPiAgICAJCQljeCA9
IE5VTEw7DQo+IC0JCW1lbnVfZ2V0X3RyYWNlX2RhdGEoJmV4cCwgJnByZWQpOw0KPiArCQllbHNl
IGlmICh0Yl9pbml0X2RvbmUpDQo+ICsJCQltZW51X2dldF90cmFjZV9kYXRhKCZleHAsICZwcmVk
KTsNCg0KU3R5bGUgPz8NCg0KfkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

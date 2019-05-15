Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C71EB36
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:45:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqRW-0001eA-NM; Wed, 15 May 2019 09:43:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Nxe=TP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hQqRV-0001e2-11
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:43:21 +0000
X-Inumbo-ID: deaf8bfa-76f5-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::729])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id deaf8bfa-76f5-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H+mMS+L8QjMHyLDkCpgilKmDESRzjG0viIbFebbj7w=;
 b=s/l6ZOwFLBktMNilw5XFyEryuDUprs7Z6AkqTXZjtYkfJvU/Kr5gUsl4W5Nkv+KIM66o9OHZJ87rAUSUWc14wTS+kMT7o3Sx/M/vPT0/uVsUeA0egvo/nHCVGgqTRYDx2MAx8Qtjv75LZC8wVA0wAVvSKPxcys0Om9bYM2Di7+w=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2944.eurprd02.prod.outlook.com (10.171.103.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 09:43:16 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 09:43:16 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
Thread-Index: AQHVCvfE74ZM3VzNHESzrMongqde4aZr70sA
Date: Wed, 15 May 2019 09:43:16 +0000
Message-ID: <cbedbbc7-48f9-be8d-e99b-aaae65297cf0@bitdefender.com>
References: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
In-Reply-To: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0043.eurprd05.prod.outlook.com
 (2603:10a6:208:be::20) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9624d5d5-23c8-42fb-2932-08d6d919c190
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2944; 
x-ms-traffictypediagnostic: VI1PR0202MB2944:|VI1PR0202MB2944:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0202MB294402D313F91FC01841A840AB090@VI1PR0202MB2944.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(478600001)(6246003)(5660300002)(86362001)(14454004)(14444005)(110136005)(54906003)(256004)(66066001)(966005)(316002)(36756003)(68736007)(31696002)(71200400001)(71190400001)(8676002)(53936002)(229853002)(6512007)(6306002)(305945005)(386003)(25786009)(53546011)(6506007)(73956011)(7736002)(66946007)(4326008)(8936002)(26005)(52116002)(66476007)(81156014)(6486002)(66556008)(64756008)(81166006)(446003)(6436002)(66446008)(102836004)(99286004)(186003)(76176011)(3846002)(6116002)(476003)(2906002)(486006)(31686004)(2616005)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2944;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ctqSlfAuD/Ad8OvKrOgZTPY/QFiLKDoo191yDVdHujQz/6Q1VkXujna8RCbZ4GoDtIDG4Yh0+gfWPQBwxajX1CIOf2wd2LNLamY490Vv2O2AE1P5odPhgM2WRPxEePzRWQNVwCZfBRzmAUCOvui/3SPhVon6q+SlUvmUC+hOAjJvPI45/3KaVhCCdq/Arxz2iRYFTwfdCeYsY2Nc/ke4rov9Yo+cddTfI3+AS9wIqPbiESpwEQ9huVad/3j60CRC8ZeWQa0IAI0Sp20ucMBoijgkU5QD3qoDrX/b8GotYnzPu40rOvuyBLKI6c4AuXS3rjeDM+XW27vMk8vn5I+WuoNwCE3ccxLOS02ogkWXB9qz6stWROOs7ZH2HePJyjXC8dVIGnoj275r7VchZbkrjKGSxFoI2Y4wffsr775GEoo=
Content-ID: <DDC6968326B60A438C28C9AFA9F5AAF4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9624d5d5-23c8-42fb-2932-08d6d919c190
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 09:43:16.7126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2944
Subject: Re: [Xen-devel] [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE1LjA1LjIwMTkgMTE6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGVpciBwcmUt
QVZYNTEyIGluY2FybmF0aW9ucyBoYXZlIGNsZWFybHkgYmVlbiBvdmVybG9va2VkIGR1cmluZyBt
dWNoDQo+IGVhcmxpZXIgd29yay4gVGhlaXIgbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGVudGly
ZWx5IHN0YW5kYXJkLCBzbyBubw0KPiBzcGVjaWZpYyB0ZXN0cyBnZXQgYWRkZWQgdG8gdGhlIGhh
cm5lc3MuDQo+IA0KPiBSZXBvcnRlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQoNClRlc3RlZC1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQo+IEBA
IC02NjI0LDYgKzY2MjQsOCBAQCB4ODZfZW11bGF0ZSgNCj4gICAgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZiwgMHhmMyk6IC8qIHZwc2xscSB4bW0vbTEyOCx7eCx5fW1tLHt4LHl9bW0g
Ki8NCj4gICAgICAgY2FzZSBYODZFTVVMX09QQ182NigweDBmLCAweGY0KTogICAgIC8qIHBtdWx1
ZHEgeG1tL20xMjgseG1tICovDQo+ICAgICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYs
IDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8NCj4gKyAg
ICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBmLCAweGY1KTogICAgLyogcG1hZGR3ZCB7LHh9bW0v
bWVtLHsseH1tbSAqLw0KPiArICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjUp
OiAvKiB2cG1hZGR3ZCB7eCx5fW1tL21lbSx7eCx5fW1tLHt4LHl9bW0gKi8NCj4gICAgICAgY2Fz
ZSBYODZFTVVMX09QQ182NigweDBmLCAweGY2KTogICAgIC8qIHBzYWRidyB4bW0vbTEyOCx4bW0g
Ki8NCj4gICAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNik6IC8qIHZwc2Fk
Yncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovDQo+ICAgICAgIENBU0VfU0lNRF9QQUNL
RURfSU5UKDB4MGYsIDB4ZjgpOiAgICAvKiBwc3ViYiB7LHh9bW0vbWVtLHsseH1tbSAqLw0KPiAN
Cj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVsDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A54E9F0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 15:52:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heJv1-0004PW-Ao; Fri, 21 Jun 2019 13:49:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2/GD=UU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1heJuz-0004PR-RG
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 13:49:29 +0000
X-Inumbo-ID: 62dbf391-942b-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::72f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62dbf391-942b-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e0HfqNuwIg6oqyuTQ/pdol4hT4U3E/B/FIwmy/ntcQ=;
 b=I4OOPTnqOYm4nuUb0l5ThqhgzA3ab1vdhCffb00B8nRUorOIc3lCqEcJRjmPcaZ5ZbnOuMkuqqYfNvoaa8/ZN/ru9jGdL4a5QmYMcn0guQb7hsmfzguaL0QAAtP0hLX03ibuSlK4/i8ioE4Dh1lEuh9jrNJXJ6pL6ci+Uw3u5gU=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2541.eurprd02.prod.outlook.com (10.173.79.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 21 Jun 2019 13:49:26 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 13:49:25 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] viridian: unify time sources
Thread-Index: AQHVJOZ9TJ6Ax2/iJkOya88b+ayUTaamJnaA
Date: Fri, 21 Jun 2019 13:49:25 +0000
Message-ID: <a517fc98-cdd7-4bc4-e096-08826399ddf7@bitdefender.com>
References: <20190617082358.2734-1-paul.durrant@citrix.com>
In-Reply-To: <20190617082358.2734-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::25) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e507e43-8477-41a8-06d9-08d6f64f45ed
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2541; 
x-ms-traffictypediagnostic: VI1PR0202MB2541:|VI1PR0202MB2541:
x-microsoft-antispam-prvs: <VI1PR0202MB2541CEB0691B7AA1429C91B6ABE70@VI1PR0202MB2541.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(5660300002)(6116002)(3846002)(6486002)(8936002)(14454004)(36756003)(31686004)(71190400001)(4326008)(256004)(71200400001)(110136005)(54906003)(86362001)(229853002)(31696002)(81156014)(81166006)(8676002)(7736002)(73956011)(6436002)(66446008)(64756008)(66556008)(66476007)(316002)(305945005)(66946007)(53936002)(476003)(99286004)(486006)(6512007)(26005)(76176011)(52116002)(386003)(6506007)(2906002)(186003)(102836004)(25786009)(66066001)(2501003)(6246003)(478600001)(11346002)(446003)(68736007)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2541;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X3/BOvLMrmsA04tvfDO2k8ct4S/VPZsmrJUCLwWtyUa8c+LDzcFI4QyaKjs9uvmgMbFisWfluSJYNQEo6+oIDvJvuWbgJYofAcunChiOCn+3JLZs6nb9NFuJRq08N5vnbTr/HhcJNegiXsQI3y2UwcHHZ3Mf/Bk89R9NBAuzFCHhLjzVncH6WT+3oUy/KivXO1v9/ax5OG0rv5sh7N20AXqlkCvX8aPVI3TGynTDLlvMag137fgwCL/a05Xkay7qfCjN/a+qR75bP686DkWrHgX6XEp/h6NbPXKmztNX0XWbnhWIfbYz69eliAo6cc+HQOmW95ygkhFXEYowqVSNUv55aUxw0jzv8RYqWBpl/A9z48vNO0+jGTNeOoHblqWt4SQTKvRZrBQpc/b8jiCJnheBe5U6bqHPZrhnYmYUOu0=
Content-ID: <58982C3F656A15439F0F40C401CA342A@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e507e43-8477-41a8-06d9-08d6f64f45ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 13:49:25.8547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2541
Subject: Re: [Xen-devel] [PATCH v2] viridian: unify time sources
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAgIC8qDQo+IEBAIC0xMzYsNyArMTAwLDcgQEAgc3RhdGljIGludDY0X3QgdGltZV9yZWZfY291
bnQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4gICAgKiAxMjggYml0IG51bWJlciB3aGljaCBp
cyB0aGVuIHNoaWZ0ZWQgNjQgdGltZXMgdG8gdGhlIHJpZ2h0IHRvIG9idGFpbg0KPiAgICAqIHRo
ZSBoaWdoIDY0IGJpdHMuIg0KPiAgICAqLw0KDQpJcyB0aGVyZSBhIGdvb2QgcmVhc29uIGZvciB1
c2luZyBzaWduZWQgb2Zmc2V0IGhlcmU/IElmIHNvIHRoZW4gbWF5YmUgDQp5b3Ugc2hvdWxkIGNo
YW5nZSB0aGUgcmV0dXJuIHR5cGUgb3IgY2hlY2sgZm9yIGJvdW5kcy4NCg0KPiAtc3RhdGljIHVp
bnQ2NF90IHNjYWxlX3RzYyh1aW50NjRfdCB0c2MsIHVpbnQ2NF90IHNjYWxlLCB1aW50NjRfdCBv
ZmZzZXQpDQo+ICtzdGF0aWMgdWludDY0X3Qgc2NhbGVfdHNjKHVpbnQ2NF90IHRzYywgdWludDY0
X3Qgc2NhbGUsIGludDY0X3Qgb2Zmc2V0KQ0KPiAgIHsNCj4gICAgICAgdWludDY0X3QgcmVzdWx0
Ow0KPiAgIA0KPiBAQCAtMTUzLDIyICsxMTcsNDYgQEAgc3RhdGljIHVpbnQ2NF90IHNjYWxlX3Rz
Yyh1aW50NjRfdCB0c2MsIHVpbnQ2NF90IHNjYWxlLCB1aW50NjRfdCBvZmZzZXQpDQo+ICAgICAg
IHJldHVybiByZXN1bHQgKyBvZmZzZXQ7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHVpbnQ2NF90
IHRpbWVfbm93KHN0cnVjdCBkb21haW4gKmQpDQo+ICtzdGF0aWMgdWludDY0X3QgdHJjX3ZhbChj
b25zdCBzdHJ1Y3QgZG9tYWluICpkLCBpbnQ2NF90IG9mZnNldCkNCj4gICB7DQo+ICAgICAgIHVp
bnQ2NF90IHRzYywgc2NhbGU7DQo+ICAgDQo+IC0gICAgLyoNCj4gLSAgICAgKiBJZiB0aGUgcmVm
ZXJlbmNlIFRTQyBwYWdlIGlzIG5vdCBlbmFibGVkLCBvciBoYXMgYmVlbiBpbnZhbGlkYXRlZA0K
PiAtICAgICAqIGZhbGwgYmFjayB0byB0aGUgcGFydGl0aW9uIHJlZmVyZW5jZSBjb3VudGVyLg0K
PiAtICAgICAqLw0KPiAtICAgIGlmICggIWQtPmFyY2guaHZtLnZpcmlkaWFuLT5yZWZlcmVuY2Vf
dHNjX3ZhbGlkICkNCj4gLSAgICAgICAgcmV0dXJuIHRpbWVfcmVmX2NvdW50KGQpOw0KPiAtDQo+
IC0gICAgLyogT3RoZXJ3aXNlIGNvbXB1dGUgcmVmZXJlbmNlIHRpbWUgaW4gdGhlIHNhbWUgd2F5
IHRoZSBndWVzdCB3b3VsZCAqLw0KPiAgICAgICB0c2MgPSBodm1fZ2V0X2d1ZXN0X3RzYyhwdF9n
bG9iYWxfdmNwdV90YXJnZXQoZCkpOw0KPiAgICAgICBzY2FsZSA9ICgoMTAwMDB1bCA8PCAzMikg
LyBkLT5hcmNoLnRzY19raHopIDw8IDMyOw0KPiAgIA0KPiAtICAgIHJldHVybiBzY2FsZV90c2Mo
dHNjLCBzY2FsZSwgMCk7DQo+ICsgICAgcmV0dXJuIHNjYWxlX3RzYyh0c2MsIHNjYWxlLCBvZmZz
ZXQpOw0KPiArfQ0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

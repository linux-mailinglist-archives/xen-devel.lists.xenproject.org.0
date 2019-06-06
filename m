Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944637476
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:45:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrim-0006Me-Ni; Thu, 06 Jun 2019 12:42:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3Qq=UF=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hYril-0006MZ-AE
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:42:19 +0000
X-Inumbo-ID: 846b6566-8858-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::705])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 846b6566-8858-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00DdJ1VE6RuvXLnh3wRKORd5VjawoEtZEgra3vfH5AA=;
 b=IywSBlR1sDCQlzH5y/d3teg6dTntudXLDpBXApSilbgbrWbBiLPGE2h9Bww9/Q1FSz3qKgQhbl+tI3ZjivugZggw86S7dNFGe8Zv79gOKMs7fH72Mtzhg1TSzxAp4ads47d28afK+l3uwTcutxSneAVubgnWX4c0vVuFav48lZk=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3309.eurprd02.prod.outlook.com (52.134.15.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 12:42:15 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::fdcf:4771:37b7:9830%9]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 12:42:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v1] x86/altp2m: Add xc_altp2m_get_vcpu_p2m_idx
Thread-Index: AQHVHGGlu0NbVCknh0ips2+nSWSJiaaOjR8AgAAEhAA=
Date: Thu, 6 Jun 2019 12:42:14 +0000
Message-ID: <56eb353a-8f79-3e86-b26e-f8ed70861ce6@bitdefender.com>
References: <20190606121548.2075-1-aisaila@bitdefender.com>
 <5CF906400200007800235ED6@prv1-mh.provo.novell.com>
In-Reply-To: <5CF906400200007800235ED6@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0132.eurprd05.prod.outlook.com
 (2603:10a6:207:2::34) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a26beb2-7de8-48a4-5a09-08d6ea7c6725
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3309; 
x-ms-traffictypediagnostic: VI1PR0202MB3309:|VI1PR0202MB3309:
x-microsoft-antispam-prvs: <VI1PR0202MB330973EA67FE4C80BC7F963EAB170@VI1PR0202MB3309.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(39860400002)(136003)(396003)(376002)(199004)(189003)(256004)(14444005)(486006)(31686004)(386003)(66066001)(6116002)(8936002)(2906002)(3846002)(6486002)(66556008)(53546011)(68736007)(102836004)(73956011)(31696002)(81156014)(7736002)(446003)(11346002)(8676002)(66946007)(66446008)(66476007)(25786009)(6506007)(64756008)(186003)(86362001)(81166006)(26005)(305945005)(99286004)(6246003)(6512007)(6916009)(5660300002)(476003)(6436002)(76176011)(4326008)(53936002)(229853002)(316002)(478600001)(36756003)(7416002)(54906003)(52116002)(71200400001)(71190400001)(2616005)(14454004)(70780200001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3309;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8qPXiU6UTCclLrk3xAyUo8JuEnGAslpkh20JI9MgfUgkF1wE9aAOBqCKm9fi1Yc+/pnVjS3inZ9/mOYXcsprh716TrCjPcRCPVUC3riCnicHffGuJnpJlv6jmEro/HIR9lhJNl8eioKXhaBB28/xtN2lEps+BLnteArsi8fBNQIPwecNCFXCZyEqMHUQILPnWCtM6p86sK0YzlowUaIKonxJkElSxYpctXd/xJT5cekfSABRDBu2+2g4DuC64eh9mjvx4jYmAnMYpzgLRjFAQuP2K40o9EDPoUczrvE5c9T1XDICJCJVTJLkf54RqMRx4cJ6pauu8/wVqnGp8VqaRu0lhvnSQq0cTwNtDAoIm1cBniVQqZNrhaO3EbpM3xr4e8yonugaHV5X3qFF+mLXR2hjdEjUXumaiIIFKy4qRAQ=
Content-ID: <7F42923A2643B048B61B86A7B93AC66E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a26beb2-7de8-48a4-5a09-08d6ea7c6725
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 12:42:14.9311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3309
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add
 xc_altp2m_get_vcpu_p2m_idx
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA2LjA2LjIwMTkgMTU6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNi4w
Ni4xOSBhdCAxNDoxNiwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+IEBAIC00
NzM1LDYgKzQ3MzYsMjkgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm5ld19nZm4pKTsNCj4+ICAgICAgICAgICBi
cmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X3AybV9pZHg6DQo+PiAr
ICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCB2Y3B1ICp2Ow0KPj4gKw0KPj4gKyAgICAgICAgaWYg
KCBhLnUuZ2V0X3ZjcHVfcDJtX2lkeC52Y3B1X2lkID49IGQtPm1heF92Y3B1cyApDQo+PiArICAg
ICAgICB7DQo+PiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPj4gKyAgICAgICAgICAgIGJy
ZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCAhYWx0cDJtX2FjdGl2
ZShkKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsN
Cj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAg
IHYgPSBkLT52Y3B1W2EudS5nZXRfdmNwdV9wMm1faWR4LnZjcHVfaWRdOw0KPiANCj4gUGxlYXNl
IGNhbiB5b3UgYXZvaWQgcmUtaW50cm9kdWNpbmcgdGhpcyBhY2Nlc3MgcGF0dGVybj8gV2UgaGF2
ZQ0KPiBkb21haW5fdmNwdSgpIG5vdyBleGFjdGx5IGZvciB0aGlzIHB1cnBvc2UuDQoNCk9rLCBJ
IHdpbGwgdXNlIGRvbWFpbl92Y3B1KCkgaW4gVjIuDQoNCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2
bV9vcC5oDQo+PiBAQCAtMzA0LDYgKzMwNCwxNCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fY2hh
bmdlX2dmbiB7DQo+PiAgIHR5cGVkZWYgc3RydWN0IHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm4g
eGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dmbl90Ow0KPj4gICBERUZJTkVfWEVOX0dVRVNUX0hBTkRM
RSh4ZW5faHZtX2FsdHAybV9jaGFuZ2VfZ2ZuX3QpOw0KPj4gICANCj4+ICtzdHJ1Y3QgeGVuX2h2
bV9hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeCB7DQo+PiArICAgIHVpbnQzMl90IHZjcHVfaWQ7DQo+
PiArICAgIHVpbnQxNl90IGFsdHAybV9pZHg7DQo+PiArfTsNCj4+ICt0eXBlZGVmIHN0cnVjdCB4
ZW5faHZtX2FsdHAybV9nZXRfdmNwdV9wMm1faWR4DQo+PiArICAgICAgICAgICAgICAgeGVuX2h2
bV9hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeF90Ow0KPj4gK0RFRklORV9YRU5fR1VFU1RfSEFORExF
KHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHhfdCk7DQo+IA0KPiBXaGF0IGRvIHlvdSBu
ZWVkIHRoaXMgdHlwZSBhbmQgaGFuZGxlIGZvcj8NCj4gDQoNCllvdSBhcmUgcmlnaHQsIHRoaXMg
aXMgdXNlbGVzcyBoZXJlLCBJIHdpbGwgZHJvcCBpdCBpbiB2Mi4NCg0KDQpBbGV4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

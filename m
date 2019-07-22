Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB466FFF3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXbO-0004K2-4E; Mon, 22 Jul 2019 12:39:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KpNR=VT=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hpXbM-0004J2-PC
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:39:36 +0000
X-Inumbo-ID: c219eebf-ac7d-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::71d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c219eebf-ac7d-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 12:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpBVSeI/GwZGZxgHCo8c87SufmjUSW3vVeMjrEHQPnjoX0QbH5pYxEdlXLv5dnmyZ3jwpEriinXOwcMUVc9X3LCIzCwUS/32O2iMBD2k5hwQ+bQ4qS1q6nCM+I20zKr2dWE7Igg8/27sJF7x6YiN9TNGmM6J/nb02/QY2SU6H4VXPGo8hHkZXWABUYjnJtWZTbguHEbWBSd6tB6Ef+AduhgvvHCzmouf8wiOBra6Uhbj9xJeiCSYk5kVM25I93XLqzLTgyDl6Cl9i+FVP1hbciW658QmssChhqzsGGfL63SDmjI51q5kX7W6KgRNP6yH9Jt9TFPvjgkP1uh7wlZWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyISo+wQwKp11fQT0NnfFLEVSjLvKRVOisYcoQY46Ss=;
 b=aIMpD+3bbo1vBFyA6isPKqGUK6k/xRs3fQSVY3DiVWAiw9p3r6YZzbQzolv9ajvq6/7jjkTKRLe7ZuNgESr998GFSjoVZThQUdJQqCL0Zobrxs/KB/vfsCRz7vcrEbGeKpP/jCoX1GXdkITyPyCLCTqZdD831KHMrPqQfa1UUBW+CSyEHGRVDmyV+kvSqSh+1JjSZhfNhYb4XDPWGp7OWOc3CN00n0oGdZTLx0aAudUgXdLMyA71ZCYtebKcPQ3iZKhmsSKs5ngMD9sQYV9haTSw0JmD89LqakAKrcjZlCDioBdWNswvYEB6jeA8rtx5r/d+nOTaVMehQED67jCP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyISo+wQwKp11fQT0NnfFLEVSjLvKRVOisYcoQY46Ss=;
 b=Sn9uVHTyAbXuLYnx9SlPaLB4eE+Z9+FXn9+/emvhok/FNJZwV9E4r/ojwV4uzbfNSN3Kj6WF8sBugIBGbaOGPLbOS91rpkd3kJaHrlPaKKoe9TegttBzJDrBLa0LNf2FCKT5oGm3gkFFYUhbsxhP56nF1SABiWZmjrsjLhq9A88=
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com (10.171.76.8) by
 DB6PR0202MB2920.eurprd02.prod.outlook.com (10.171.73.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 12:39:32 +0000
Received: from DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::5414:4955:b37b:a3ea]) by DB6PR0202MB2917.eurprd02.prod.outlook.com
 ([fe80::5414:4955:b37b:a3ea%9]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 12:39:32 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>
Thread-Topic: [PATCH v3] x86/altp2m: Add a new hypercall to get the active
 altp2m index
Thread-Index: AQHVHR91gFCC2wnfik6rp2c4QxPTkqaQFCmAgEbGmYA=
Date: Mon, 22 Jul 2019 12:39:32 +0000
Message-ID: <cc40b093-86a5-f1b1-d316-f8787f7b717b@bitdefender.com>
References: <20190607105449.28167-1-aisaila@bitdefender.com>
 <5CFA4F850200007800236337@prv1-mh.provo.novell.com>
In-Reply-To: <5CFA4F850200007800236337@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::32) To DB6PR0202MB2917.eurprd02.prod.outlook.com
 (2603:10a6:4:b1::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f620774d-fc12-4cd2-7724-08d70ea1a535
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0202MB2920; 
x-ms-traffictypediagnostic: DB6PR0202MB2920:|DB6PR0202MB2920:
x-microsoft-antispam-prvs: <DB6PR0202MB292092E2B0802CA11990FD3BABC40@DB6PR0202MB2920.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(66066001)(54906003)(316002)(110136005)(36756003)(7736002)(2906002)(6436002)(256004)(102836004)(31696002)(229853002)(86362001)(6486002)(305945005)(76176011)(52116002)(486006)(26005)(186003)(478600001)(99286004)(2616005)(7416002)(476003)(6506007)(386003)(25786009)(11346002)(53546011)(446003)(14444005)(31686004)(6116002)(8676002)(66446008)(64756008)(3846002)(14454004)(66476007)(8936002)(4326008)(66556008)(66946007)(81166006)(81156014)(5660300002)(53936002)(68736007)(71200400001)(71190400001)(6246003)(6512007)(15583001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2920;
 H:DB6PR0202MB2917.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ih9UOqKYzAjx7S8I/6i+1xxXk2JLatUeP4Hevq3/GcN2+eK1j0jzJ2AuwbWbe/dMxDEGyRXs+0X6qS9MAkpD+1t1sts9cD+lvBVvxq+rZMz+sym3SAxHYyQSFtv186nWODx1XCSBQKCROoNqYW2X+wcPUxd3gjiazMN694/1Stoo5QImRFY/iVJomM7OmNRNb0XU+6XQB0RJXBSEHJigqnTc6uOTRgXODVgDjjKHRXTELiHumX40O7EftsqQftUlv5DDAewGWHM4HAKY+7RJ9qdrAQJPVleUi4ESz2jDGoU7Zg5lVR8PfwXpLZSsQ4xnRxgQ9H0wITADwm1KCbJ5d7r5PE0fy+P+2XdMfRCv7ak8uMuxx1ZuHLqKbyXJAs0wJRkY8LticfDgXTQPxEwtqJeHRkFcylJi+UgYorg8iIE=
Content-ID: <CA38F327BC9442418A44B6ACB2CAB773@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f620774d-fc12-4cd2-7724-08d70ea1a535
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 12:39:32.3301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2920
Subject: Re: [Xen-devel] [PATCH v3] x86/altp2m: Add a new hypercall to get
 the active altp2m index
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZywNCg0KQW55IHJldmlld3Mgb24gdGhpcyBwYXRjaCBhcmUgYXBwcmVjaWF0ZWQuDQoNClJl
Z2FyZHMsDQpBbGV4DQoNCk9uIDA3LjA2LjIwMTkgMTQ6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+PiBPbiAwNy4wNi4xOSBhdCAxMjo1NSwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90
ZToNCj4+IEBAIC00NzM1LDYgKzQ3MzYsMjggQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm5ld19nZm4pKTsNCj4+
ICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X3Ay
bV9pZHg6DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCB2Y3B1ICp2Ow0KPj4gKw0KPj4g
KyAgICAgICAgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApDQo+PiArICAgICAgICB7DQo+PiArICAg
ICAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsg
ICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGlmICggKHYgPSBkb21haW5fdmNwdShkLCBhLnUu
Z2V0X3ZjcHVfcDJtX2lkeC52Y3B1X2lkKSkgPT0gTlVMTCApDQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAg
ICAgICAgfQ0KPiANCj4gVGhlIG9yZGVyIG9mIHJldHVybiB2YWx1ZXMgd2FzIHRoZSBvdGhlciB3
YXkgYXJvdW5kIGJlZm9yZSwgYnV0DQo+IEkgc3VwcG9zZSB0aGlzIGRvZXNuJ3QgbWF0dGVyIG11
Y2g/DQo+IA0KPj4gKyAgICAgICAgYS51LmdldF92Y3B1X3AybV9pZHguYWx0cDJtX2lkeCA9IGFs
dHAybV92Y3B1X2lkeCh2KTsNCj4+ICsgICAgICAgIHJjID0gX19jb3B5X3RvX2d1ZXN0KGFyZywg
JmEsIDEpID8gLUVGQVVMVCA6IDA7DQo+IA0KPiBKdXN0IGFzIHJlbWFyayBmb3IgdGhlIGZ1dHVy
ZSAoSSBkaWRuJ3QgcGF5IGF0dGVudGlvbiBiZWZvcmUsDQo+IGFuZCB0aGUgZGlmZmVyZW5jZSBp
c24ndCBvdmVybHkgbWVhbmluZ2Z1bCBmb3Igb3BlcmF0aW9ucyB0aGF0DQo+IGRvbid0IG9jY3Vy
IGZyZXF1ZW50bHkpIC0gX19jb3B5X2ZpZWxkX3RvX2d1ZXN0KCkgd291bGQgYmUNCj4gbGVzcyBv
dmVyaGVhZCBoZXJlLiBPaCwgcmlnaHQgLSB0aGlzIGlzIG9uY2UgYWdhaW4gbm90IHBvc3NpYmxl
DQo+IGJlY2F1c2Ugb2YgYXJnIChzdGlsbCkgYmVpbmcgYSBoYW5kbGUgb2Ygdm9pZC4NCj4gDQo+
IEphbg0KPiANCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX18NCj4gVGhpcyBlbWFp
bCB3YXMgc2Nhbm5lZCBieSBCaXRkZWZlbmRlcg0KPiANCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

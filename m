Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A6765F4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzQ2-0000V5-Ki; Fri, 26 Jul 2019 12:33:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqzQ1-0000V0-6t
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:33:53 +0000
X-Inumbo-ID: 9f83ec85-afa1-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::618])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f83ec85-afa1-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPpsn8u7xdP/duAPwhnUEIm/c8qTcEK3IJRudowtoc4duoTkwOxMKffdvXfrCaH64AgTNhBtbXVQgk2yyZ+Ze8S/3PU34leinGpK9NCrB72GRlamRsu6etXE2IKOIszVZZOUi4WCfRgswvB4hH/q2pbJFUBqhPglHh1Gl2S/36NtSiLwsESZDLLOin8gdRlLt/JSg1ZmIXpP4kB0yRO24lSn5yx6DlTlnHVmfZRsRVLQ/JAc0OOD++1s91L99Kow5lW4McWncV+P+d9ax529sg2JCLogyzJx7qpyxDyImkv2cavcJ93mMEvmLsxNtukXTyWnL5DoSPBI7odcdiMRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDFk9sNvCKFny8OZ+KO/5vgBjXKK+ftwC6zR+ROp4uw=;
 b=gnfdX0yCO1av2Hgse7w+h3uYPf8DSeBp1PUyE63gXsGO+KweHKnVqS4N1m5UTDpc02HLG68dVD4fVpjGDcHaVAmQbpDDD0doVWvdWt3KBIsj1RgrjSOwPafF5hSExytASronyPL3nPq92kNNr3bqv0VDOeKPzQUV7BWrPn7VLOR5jgFzkfnUO/V78sQhqnsr+8+vWl/7akRt5IfpdeOtsZw4o93xYkKA6sD31RJh9YJi8/ZB3qp/QczG16iENoresp9POMmYPJeNRAajBw9/V8AXCC5RlUgc7mp5TFxtQ58ltNTiVEcqG5cpHX7B7Ez19rLmjEqUqUZjfdg2fzGi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDFk9sNvCKFny8OZ+KO/5vgBjXKK+ftwC6zR+ROp4uw=;
 b=XOAfadyczv8CIQDgn2DaMlLTG0Bbc2bhIxMjzwl5IqrTxPQlV8jBKTjiLOx33vT6ceJnFE5sOGSg8JVio6Mkw5MQem1u9uIDpVGClU4Aw4X/erJH6qffMi4BuXlRhAsydozYgOPP/+eEFvM7/7vE/+/kKr8IUYJp7pwIpaYQ1H1LHSJ1cRN7mWDVKQ1d2guY9I2DRGbsCH5m0d+OaR4TnYi7S66AF/FkuGbjeuV/B0Xa3d78sN+/54WrKnn7GiDpaCnJtaNz2gFGen1h3by+muXN9lUNWgeoxoCgDoSAwMKkcu3ZkwcQAtUQht99zxH0DmW5Tqf8646PwCjsmTHg6w==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4259.eurprd03.prod.outlook.com (20.177.41.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 12:33:50 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:33:50 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 4/7] xen/arm: traps: Avoid using BUG_ON() in
 _show_registers()
Thread-Index: AQHVQZ6jkn14PosZBEuHDyOOLSG7sKbc2YEA
Date: Fri, 26 Jul 2019 12:33:50 +0000
Message-ID: <87muh1ht5f.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-5-julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-5-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a8eace6-d577-4623-ba36-08d711c5831d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4259; 
x-ms-traffictypediagnostic: AM0PR03MB4259:|AM0PR03MB4259:
x-microsoft-antispam-prvs: <AM0PR03MB4259E4FA3CF0DEF7D35CC5F4E6C00@AM0PR03MB4259.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(6246003)(478600001)(256004)(316002)(80792005)(2616005)(486006)(68736007)(446003)(11346002)(6486002)(476003)(99286004)(6436002)(305945005)(91956017)(76116006)(66946007)(6512007)(7736002)(53936002)(3846002)(54906003)(2906002)(6916009)(14454004)(229853002)(76176011)(186003)(86362001)(66476007)(66556008)(64756008)(66446008)(26005)(71190400001)(55236004)(5660300002)(71200400001)(102836004)(36756003)(81156014)(81166006)(8676002)(107886003)(6506007)(66066001)(25786009)(4326008)(8936002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4259;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iukQzzHdoxhYa2LSzLaPcpUoOJ6MQqbfC/uu8qDqVY1S3kAdwP2guzlAmFzImQxoR6FiqIiXHi62fx+nvTIyFpWMZmakaaPP0u98WAS0hOmw1XcQvJpCgQvFEu1U62639q2qKmm/0h3BowrArlymoQKSaTq6+4w//O1C92r8/cJC60Zbg8reuNQ1Vyf3OI5Nk/vh7Gv0o2RUo/CgjKB8wkFEiocsW4GCmipJ1H1mKPclWdenKwzvi28f0vKeXXFLgzLCudoW4CIAUDKw1+nS+HssfbH4aSY4WeILUMXRMf5t1gIE5nelKd5WtUeBq5PINURyB10QxsCYDX84mIDWpVMHrughHhCr1II96jzAolidbPdyTL1iqBcmYRbCND9+j/A0UgS0TXvpd15WxnkuWwvksvXLgCxOYeEIajtqNSM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8eace6-d577-4623-ba36-08d711c5831d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:33:50.1198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4259
Subject: Re: [Xen-devel] [PATCH 4/7] xen/arm: traps: Avoid using BUG_ON() in
 _show_registers()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIF9zaG93X3JlZ2lzdGVycygp
IGlzIHVzaW5nIGEgQlVHX09OKCkgdG8gYXNzZXJ0IG9ubHkKPiB1c2Vyc3BhY2Ugd2lsbCBydW4g
MzItYml0IGNvZGUgaW4gYSA2NC1iaXQgZG9tYWluLgo+Cj4gU3VjaCBleHRyYSBwcmVjYXV0aW9u
IGlzIG5vdCBuZWNlc3NhcnkgYW5kIGNvdWxkIGJlIGF2b2lkZWQgYnkgb25seQo+IGNoZWNraW5n
IHRoZSBDUFUgbW9kZSB0byBkZWNpZGUgd2hldGhlciBzaG93X3JlZ2lzdGVyc182NCgpIG9yCj4g
c2hvd19yZWlnc3RlcnNfMzIoKSBzaG91bGQgYmUgY2FsbGVkLgo+Cj4gVGhpcyBoYXMgYWxzbyB0
aGUgbmljZSBhZHZhbnRhZ2UgdG8gYXZvaWQgbmVzdGVkIGlmIGluIHRoZSBjb2RlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQt
Ynk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KCj4gLS0t
Cj4gIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgMTYgKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gaW5kZXggNTRl
NjZhODZkMC4uMTMyNjg2ZWUwZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gQEAgLTkxNCwyMSArOTE0LDExIEBAIHN0YXRp
YyB2b2lkIF9zaG93X3JlZ2lzdGVycyhjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywK
PiAgCj4gICAgICBpZiAoIGd1ZXN0X21vZGUgKQo+ICAgICAgewo+IC0gICAgICAgIGlmICggaXNf
MzJiaXRfZG9tYWluKHYtPmRvbWFpbikgKQo+ICsgICAgICAgIGlmICggcHNyX21vZGVfaXNfMzJi
aXQocmVncykgKQo+ICAgICAgICAgICAgICBzaG93X3JlZ2lzdGVyc18zMihyZWdzLCBjdHh0LCBn
dWVzdF9tb2RlLCB2KTsKPiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAtICAgICAgICBlbHNlIGlm
ICggaXNfNjRiaXRfZG9tYWluKHYtPmRvbWFpbikgKQo+IC0gICAgICAgIHsKPiAtICAgICAgICAg
ICAgaWYgKCBwc3JfbW9kZV9pc18zMmJpdChyZWdzKSApCj4gLSAgICAgICAgICAgIHsKPiAtICAg
ICAgICAgICAgICAgIEJVR19PTighdXNyX21vZGUocmVncykpOwo+IC0gICAgICAgICAgICAgICAg
c2hvd19yZWdpc3RlcnNfMzIocmVncywgY3R4dCwgZ3Vlc3RfbW9kZSwgdik7Cj4gLSAgICAgICAg
ICAgIH0KPiAtICAgICAgICAgICAgZWxzZQo+IC0gICAgICAgICAgICB7Cj4gLSAgICAgICAgICAg
ICAgICBzaG93X3JlZ2lzdGVyc182NChyZWdzLCBjdHh0LCBndWVzdF9tb2RlLCB2KTsKPiAtICAg
ICAgICAgICAgfQo+IC0gICAgICAgIH0KPiArICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIHNo
b3dfcmVnaXN0ZXJzXzY0KHJlZ3MsIGN0eHQsIGd1ZXN0X21vZGUsIHYpOwo+ICAjZW5kaWYKPiAg
ICAgIH0KPiAgICAgIGVsc2UKCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5016BCBCF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCn1d-0001fl-Mm; Tue, 24 Sep 2019 15:46:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCn1b-0001fE-VR
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:46:48 +0000
X-Inumbo-ID: 83a3900a-dee2-11e9-9621-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.81]) by localhost (Halon) with ESMTPS
 id 83a3900a-dee2-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1toiu+JtBL+dJZBK0dDV9iDcddDNqakMEbzDwOLNeYFKKGHXNhZdwTd1ByKw9vovp8jFJzBUKHMrY/Jjy/NKt9TvsuqSh844uO+rU/Ku42JEBr5tx0KN4TFZ5udvbseuPqK+m70w2ajAl+NylD1HNPWFaVVXPf4UHktrGo55t8MYYk1TPLMVww/wF24lRm3VU0AHATHaG4RD1ZqRXw1QjHQ5/WFyf5ywXg2l2tHqTDQy/yAEC8huqt8hOmD/HvIR0PKk4h4eVBRHFuHqmh8ZHnbz5J06YyhTVwgvCEn55vkVwa+SdU3Pu5hBjp0Z5lqxZGoGKO1RngZ5yeod3HwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aQhvMTTGItzx98e52ulqwZul3ylXhkg0Xw2Rik5xQo=;
 b=iKIbZ80eeTja8OaUCTuqVl+ic4VEZxCQ6Z+Gpmmr1HtTgCvZBWbYKI4DuJteWOQANMd0ZuEBmJFprWxLXO+ZcgUxb/2YysOSLhBLcOVsZILMop5ie4LCo59ntpbW+s9pCpJQXdsCSQEJaHJjIsTAo2dJvThhDHicVuWqqBI+tpJAOiCF229xBcvGFxjgBd9pbdWiPJTRuZKs7tF7IRFyoL6MagY1/1wY+Rc/g3tNANp2WZ4yjssT61TkzkwWngoXcZHgCqMWjNlvt7qMrvZNreoDiwgeqoMhmXs7OgHRNx+D+seIvaC/L64Calp6yI+7Osgyw+W5dNxWCxmRjaujCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aQhvMTTGItzx98e52ulqwZul3ylXhkg0Xw2Rik5xQo=;
 b=GDC+O4+/rGMDqxha1SC5ewtLm4VYoaygybgYYmvi+7+edCoKXmt84eb3FwfoZ3APWeH/vmk68gNVRDgac8Z2MtnXo1aemE1MecgCS82096CkxeYPtqKHMH3MxQHxCfPC0k3c+nMYq74iSDE88SzEM8Klxoz7SBPl4a4X4kFRIOo=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4757.eurprd03.prod.outlook.com (20.177.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:46:45 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:46:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 1/3] xen/arm: optee: handle shared buffer translation
 error
Thread-Index: AQHVcu9E2rWJhDZVyUqVZe08oBSB3w==
Date: Tue, 24 Sep 2019 15:46:45 +0000
Message-ID: <20190924154633.852828-2-volodymyr_babchuk@epam.com>
References: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dff67be1-dc63-4b98-f0ac-08d741066753
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4757; 
x-ms-traffictypediagnostic: AM6PR03MB4757:|AM6PR03MB4757:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB4757EA8F67F2030E6241DCD2E6840@AM6PR03MB4757.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(51234002)(64756008)(66946007)(6116002)(3846002)(54906003)(476003)(2616005)(11346002)(76176011)(86362001)(8936002)(256004)(6916009)(2906002)(81156014)(5640700003)(81166006)(446003)(186003)(2351001)(14444005)(55236004)(6436002)(486006)(99286004)(6512007)(80792005)(36756003)(5660300002)(4326008)(14454004)(6486002)(66066001)(8676002)(305945005)(2501003)(6506007)(7736002)(25786009)(478600001)(66556008)(66476007)(91956017)(76116006)(316002)(71200400001)(66446008)(71190400001)(1076003)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4757;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y42+wx3sxcmo33nVlxq7dwq0+5mgCVvVk3JN++RRbnlW6Zq1aC0atcWhD/lgjZ5m/ZmBsdy8H/AXqh/HhnRGMmNCvO4NCkDxniafRPSgygq9VOTqfGAiE4TRIECn0Qkwg2AKrPpo0sFFdncxcquaLmLaMCsstwOKy9ep3JFLlAxAzFhwhs1PFZI2MR2VP9Akq4rGBcGwg1XkvOUV38JY8XInyQqwAJQ2gBjJ8Hj6ZjbXIL1zTR//ykbt45FNn7ihtHfz1TrUCUPyO5UwLZJf0GOWuhqJ/yWc8rj4Z53KhG7y5/XHBe8mKOxAKPrLIVpvknKKj1h8nwMNwE6rORgxWukPySXDgiB6b9TblmP6kjgfCfCPSQS48STglw7J+kytSRdp87sv34P5QEC571ZWgvHso/+2k3fAtM7AloqFr6w=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff67be1-dc63-4b98-f0ac-08d741066753
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:46:45.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tF6BsqJCKjdiKyHbaCHnHarfL0X02UIINyrXLBLrUoZRZtYV3TnNiqmBuEmDpRNGcBWngePZ/+iotKEf4d0rso8+BYnHPOTrMb3sfVW2AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4757
Subject: [Xen-devel] [PATCH v3 1/3] xen/arm: optee: handle shared buffer
 translation error
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgYSBjYXNlIHBvc3NpYmxlLCB3aGVuIE9QLVRFRSBhc2tzIGd1ZXN0IHRvIGFsbG9j
YXRlIHNoYXJlZApidWZmZXIsIGJ1dCBYZW4gZm9yIHNvbWUgcmVhc29uIGNhbid0IHRyYW5zbGF0
ZSBidWZmZXIncyBhZGRyZXNzZXMuIEluCnRoaXMgc2l0dWF0aW9uIHdlIHNob3VsZCBkbyB0d28g
dGhpbmdzOgoKMS4gVGVsbCBndWVzdCB0byBmcmVlIGFsbG9jYXRlZCBidWZmZXIsIHNvIHRoZXJl
IHdpbGwgYmUgbm8gbWVtb3J5CmxlYWsgZm9yIGd1ZXN0LgoKMi4gVGVsbCBPUC1URUUgdGhhdCBi
dWZmZXIgYWxsb2NhdGlvbiBmYWlsZWQuCgpUbyBhc2sgZ3Vlc3QgdG8gZnJlZSBhbGxvY2F0ZWQg
YnVmZmVyIHdlIHNob3VsZCBwZXJmb3JtIHRoZSBzYW1lCnRoaW5nLCBhcyBPUC1URUUgZG9lcyAt
IGlzc3VlIFJQQyByZXF1ZXN0LiBUaGlzIGlzIGRvbmUgYnkgZmlsbGluZwpyZXF1ZXN0IGJ1ZmZl
ciAobHVja2lseSB3ZSBjYW4gcmV1c2UgdGhlIHNhbWUgYnVmZmVyLCB0aGF0IE9QLVRFRSB1c2Vk
CnRvIGlzc3VlIG9yaWdpbmFsIHJlcXVlc3QpIGFuZCB0aGVuIHJldHVybiB0byBndWVzdCB3aXRo
IHNwZWNpYWwKcmV0dXJuIGNvZGUuCgpUaGVuIHdlIG5lZWQgdG8gaGFuZGxlIG5leHQgY2FsbCBm
cm9tIGd1ZXN0IGluIGEgc3BlY2lhbCB3YXk6IGFzIFJQQwp3YXMgaXNzdWVkIGJ5IFhlbiwgbm90
IGJ5IE9QLVRFRSwgaXQgc2hvdWxkIGJlIGhhbmRsZWQgYnkgWGVuLgpCYXNpY2FsbHksIHRoaXMg
aXMgdGhlIG1lY2hhbmlzbSB0byBwcmVlbXB0IE9QLVRFRSBtZWRpYXRvci4KClRoZSBzYW1lIG1l
Y2hhbmlzbSBjYW4gYmUgdXNlZCBpbiB0aGUgZnV0dXJlIHRvIHByZWVtcHQgbWVkaWF0b3IKZHVy
aW5nIHRyYW5zbGF0aW9uIGxhcmdlICg+NTEyIHBhZ2VzKSBzaGFyZWQgYnVmZmVycy4KClNpZ25l
ZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4K
Ci0tLQoKQ2hhbmdlcyBmcm9tIHYxOgogLSBSZW5hbWVkIE9QVEVFTV9DQUxMXyogdG8gT1BURUVf
Q0FMTF8qCiAtIEZpeGVkIGNvbW1lbnRzCiAtIEFkZGVkIEFTU0VSVCgpIGluICBoYW5kbGVfeGVu
X3JwY19yZXR1cm4oKQoKQ2hhbmdlcyBmcm9tIHYyOgogLSBBU1NFUlQoKSBpbiBoYW5kbGVfeGVu
X3JwY19yZXR1cm4oKSBpcyByZXBsYWNlZCB3aXRoIGRvbWFpbl9jcmFzaCgpCi0tLQogeGVuL2Fy
Y2gvYXJtL3RlZS9vcHRlZS5jIHwgMTczICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0MiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0v
dGVlL29wdGVlLmMKaW5kZXggMzUwYWY4N2Q5MC4uNmEwMzUzNTVkYiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL3RlZS9vcHRlZS5jCisrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwpAQCAt
OTgsNiArOTgsMTEgQEAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX1NNQ19T
RUNfQ0FQX1VOUkVHSVNURVJFRF9TSE0gfCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBPUFRFRV9TTUNfU0VDX0NBUF9EWU5BTUlDX1NITSkKIAorZW51bSBvcHRlZV9jYWxsX3N0YXRl
IHsKKyAgICBPUFRFRV9DQUxMX05PUk1BTCwKKyAgICBPUFRFRV9DQUxMX1hFTl9SUEMsCit9Owor
CiBzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbWF4X29wdGVlX3RocmVhZHM7CiAK
IC8qCkBAIC0xMTQsNiArMTE5LDkgQEAgc3RydWN0IG9wdGVlX3N0ZF9jYWxsIHsKICAgICBwYWRk
cl90IGd1ZXN0X2FyZ19pcGE7CiAgICAgaW50IG9wdGVlX3RocmVhZF9pZDsKICAgICBpbnQgcnBj
X29wOworICAgIC8qIFNhdmVkIGJ1ZmZlciB0eXBlIGZvciB0aGUgY3VycmVudCBidWZmZXIgYWxs
b2NhdGUgcmVxdWVzdCAqLworICAgIHVuc2lnbmVkIGludCBycGNfYnVmZmVyX3R5cGU7CisgICAg
ZW51bSBvcHRlZV9jYWxsX3N0YXRlIHN0YXRlOwogICAgIHVpbnQ2NF90IHJwY19kYXRhX2Nvb2tp
ZTsKICAgICBib29sIGluX2ZsaWdodDsKICAgICByZWdpc3Rlcl90IHJwY19wYXJhbXNbMl07CkBA
IC0zMDEsNiArMzA5LDcgQEAgc3RhdGljIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqYWxsb2NhdGVf
c3RkX2NhbGwoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4KQogCiAgICAgY2FsbC0+b3B0ZWVfdGhy
ZWFkX2lkID0gLTE7CiAgICAgY2FsbC0+aW5fZmxpZ2h0ID0gdHJ1ZTsKKyAgICBjYWxsLT5zdGF0
ZSA9IE9QVEVFX0NBTExfTk9STUFMOwogCiAgICAgc3Bpbl9sb2NrKCZjdHgtPmxvY2spOwogICAg
IGxpc3RfYWRkX3RhaWwoJmNhbGwtPmxpc3QsICZjdHgtPmNhbGxfbGlzdCk7CkBAIC0xMDg2LDYg
KzEwOTUsMTAgQEAgc3RhdGljIGludCBoYW5kbGVfcnBjX3JldHVybihzdHJ1Y3Qgb3B0ZWVfZG9t
YWluICpjdHgsCiAgICAgICAgICAgICByZXQgPSAtRVJFU1RBUlQ7CiAgICAgICAgIH0KIAorICAg
ICAgICAvKiBTYXZlIHRoZSBidWZmZXIgdHlwZSBpbiBjYXNlIHdlIHdpbGwgd2FudCB0byBmcmVl
IGl0ICovCisgICAgICAgIGlmICggc2htX3JwYy0+eGVuX2FyZy0+Y21kID09IE9QVEVFX1JQQ19D
TURfU0hNX0FMTE9DICkKKyAgICAgICAgICAgIGNhbGwtPnJwY19idWZmZXJfdHlwZSA9IHNobV9y
cGMtPnhlbl9hcmctPnBhcmFtc1swXS51LnZhbHVlLmE7CisKICAgICAgICAgdW5tYXBfZG9tYWlu
X3BhZ2Uoc2htX3JwYy0+eGVuX2FyZyk7CiAgICAgfQogCkBAIC0xMjUwLDE4ICsxMjYzLDEwOCBA
QCBlcnI6CiAgICAgcmV0dXJuOwogfQogCisvKgorICogUHJlcGFyZSBSUEMgcmVxdWVzdCB0byBm
cmVlIHNoYXJlZCBidWZmZXIgaW4gdGhlIHNhbWUgd2F5LCBhcworICogT1AtVEVFIGRvZXMgdGhp
cy4KKyAqCisgKiBSZXR1cm4gdmFsdWVzOgorICogIHRydWUgIC0gc3VjY2Vzc2Z1bGx5IHByZXBh
cmVkIFJQQyByZXF1ZXN0CisgKiAgZmFsc2UgLSB0aGVyZSB3YXMgYW4gZXJyb3IKKyAqLworc3Rh
dGljIGJvb2wgaXNzdWVfcnBjX2NtZF9mcmVlKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNh
bGwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNobV9ycGMgKnNobV9y
cGMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgY29va2llKQorewor
ICAgIHJlZ2lzdGVyX3QgcjEsIHIyOworCisgICAgLyogSW4gY2FzZSBpZiBndWVzdCB3aWxsIGZv
cmdldCB0byB1cGRhdGUgaXQgd2l0aCBtZWFuaW5nZnVsIHZhbHVlICovCisgICAgc2htX3JwYy0+
eGVuX2FyZy0+cmV0ID0gVEVFQ19FUlJPUl9HRU5FUklDOworICAgIHNobV9ycGMtPnhlbl9hcmct
PmNtZCA9IE9QVEVFX1JQQ19DTURfU0hNX0ZSRUU7CisgICAgc2htX3JwYy0+eGVuX2FyZy0+bnVt
X3BhcmFtcyA9IDE7CisgICAgc2htX3JwYy0+eGVuX2FyZy0+cGFyYW1zWzBdLmF0dHIgPSBPUFRF
RV9NU0dfQVRUUl9UWVBFX1ZBTFVFX0lOUFVUOworICAgIHNobV9ycGMtPnhlbl9hcmctPnBhcmFt
c1swXS51LnZhbHVlLmEgPSBjYWxsLT5ycGNfYnVmZmVyX3R5cGU7CisgICAgc2htX3JwYy0+eGVu
X2FyZy0+cGFyYW1zWzBdLnUudmFsdWUuYiA9IGNvb2tpZTsKKworICAgIGlmICggYWNjZXNzX2d1
ZXN0X21lbW9yeV9ieV9pcGEoY3VycmVudC0+ZG9tYWluLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2ZuX3RvX2dhZGRyKHNobV9ycGMtPmdmbiksCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaG1fcnBjLT54ZW5fYXJnLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgT1BURUVfTVNHX0dFVF9BUkdfU0laRSgxKSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpICkKKyAgICB7CisgICAgICAgIC8qCisg
ICAgICAgICAqIFdlbGwsIHRoaXMgaXMgcXVpdGUgYmFkLiBXZSBoYXZlIGVycm9yIGluIHRoZSBl
cnJvcgorICAgICAgICAgKiBwYXRoLiBUaGlzIGNhbiBoYXBwZW4gb25seSBpZiBndWVzdCBiZWhh
dmVzIGJhZGx5LCBzbyBhbGwKKyAgICAgICAgICogd2UgY2FuIGRvIGlzIHRvIHJldHVybiBlcnJv
ciB0byBPUC1URUUgYW5kIGxlYXZlIGd1ZXN0J3MKKyAgICAgICAgICogbWVtb3J5IGxlYWtlZC4g
V2UgYWxyZWFkeSBoYXZlIGZyZWVkIGFsbCByZXNvdXJjZXMKKyAgICAgICAgICogYWxsb2NhdGVk
IGZvciB0aGlzIGJ1ZmZlciwgYnV0IGd1ZXN0IHdpbGwgbmV2ZXIgcmVjZWl2ZQorICAgICAgICAg
KiBPUFRFRV9SUENfQ01EX1NITV9GUkVFIHJlcXVlc3QsIHNvIGl0IHdpbGwgbm90IGtub3cgdGhh
dCBpdAorICAgICAgICAgKiBjYW4gcmVsZWFzZSBhbGxvY2F0ZWQgYnVmZmVyLgorICAgICAgICAg
Ki8KKyAgICAgICAgc2htX3JwYy0+eGVuX2FyZy0+cmV0ID0gVEVFQ19FUlJPUl9HRU5FUklDOwor
ICAgICAgICBzaG1fcnBjLT54ZW5fYXJnLT5udW1fcGFyYW1zID0gMDsKKworICAgICAgICByZXR1
cm4gZmFsc2U7CisgICAgfQorCisgICAgdWludDY0X3RvX3JlZ3BhaXIoJnIxLCAmcjIsIHNobV9y
cGMtPmNvb2tpZSk7CisKKyAgICBjYWxsLT5zdGF0ZSA9IE9QVEVFX0NBTExfWEVOX1JQQzsKKyAg
ICBjYWxsLT5ycGNfb3AgPSBPUFRFRV9TTUNfUlBDX0ZVTkNfQ01EOworICAgIGNhbGwtPnJwY19w
YXJhbXNbMF0gPSByMTsKKyAgICBjYWxsLT5ycGNfcGFyYW1zWzFdID0gcjI7CisgICAgY2FsbC0+
b3B0ZWVfdGhyZWFkX2lkID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDMpOworCisgICAgc2V0X3VzZXJf
cmVnKHJlZ3MsIDAsIE9QVEVFX1NNQ19SRVRVUk5fUlBDX0NNRCk7CisgICAgc2V0X3VzZXJfcmVn
KHJlZ3MsIDEsIHIxKTsKKyAgICBzZXRfdXNlcl9yZWcocmVncywgMiwgcjIpOworCisgICAgcmV0
dXJuIHRydWU7Cit9CisKKy8qIEhhbmRsZXMgcmV0dXJuIGZyb20gWGVuLWlzc3VlZCBSUEMgKi8K
K3N0YXRpYyB2b2lkIGhhbmRsZV94ZW5fcnBjX3JldHVybihzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpj
dHgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG9wdGVl
X3N0ZF9jYWxsICpjYWxsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBzaG1fcnBjICpzaG1fcnBjKQoreworICAgIGNhbGwtPnN0YXRlID0gT1BURUVfQ0FMTF9OT1JN
QUw7CisKKyAgICAvKgorICAgICAqIFJpZ2h0IG5vdyB3ZSBoYXZlIG9ubHkgb25lIHJlYXNvbiB0
byBiZSB0aGVyZSAtIHdlIGFza2VkIGd1ZXN0CisgICAgICogdG8gZnJlZSBzaGFyZWQgYnVmZmVy
IGFuZCBpdCBkaWQgaXQuIE5vdyB3ZSBjYW4gdGVsbCBPUC1URUUKKyAgICAgKiB0aGF0IGJ1ZmZl
ciBhbGxvY2F0aW9uIGZhaWxlZC4gV2UgYXJlIG5vdCBzdG9yaW5nIGV4YWN0IGNvbW1hbmQKKyAg
ICAgKiB0eXBlLCBvbmx5IHR5cGUgb2YgUlBDIHJldHVybi4gU28sIHRoaXMgaXMgdGhlIG9ubHkg
Y2hlY2sgd2UKKyAgICAgKiBjYW4gcGVyZm9ybSB0aGVyZS4KKyAgICAgKi8KKyAgICBpZiAoIGNh
bGwtPnJwY19vcCAhPSBPUFRFRV9TTUNfUlBDX0ZVTkNfQ01EICkKKyAgICAgICAgZG9tYWluX2Ny
YXNoKGN1cnJlbnQtPmRvbWFpbik7CisKKyAgICAvKgorICAgICAqIFdlIGFyZSBub3QgY2hlY2tp
bmcgcmV0dXJuIHZhbHVlIGZyb20gYSBndWVzdCBiZWNhdXNlIHdlIGFzc3VtZQorICAgICAqIHRo
YXQgT1BURUVfUlBDX0NNRF9TSE1fRlJFRSBuZXZlciBmYWlscy4KKyAgICAgKi8KKyAgICBzaG1f
cnBjLT54ZW5fYXJnLT5yZXQgPSBURUVDX0VSUk9SX0dFTkVSSUM7CisgICAgc2htX3JwYy0+eGVu
X2FyZy0+bnVtX3BhcmFtcyA9IDA7Cit9CisKIC8qCiAgKiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxl
ZCB3aGVuIGd1ZXN0IGlzIGZpbmlzaGVkIHByb2Nlc3NpbmcgUlBDCiAgKiByZXF1ZXN0IGZyb20g
T1AtVEVFIGFuZCB3aXNoZWQgdG8gcmVzdW1lIHRoZSBpbnRlcnJ1cHRlZCBzdGFuZGFyZAogICog
Y2FsbC4KKyAqCisgKiBSZXR1cm4gdmFsdWVzOgorICogIGZhbHNlIC0gdGhlcmUgd2FzIGFuIGVy
cm9yLCBkbyBub3QgY2FsbCBPUC1URUUKKyAqICB0cnVlICAtIHN1Y2Nlc3MsIHByb2NlZWQgYXMg
bm9ybWFsCiAgKi8KLXN0YXRpYyB2b2lkIGhhbmRsZV9ycGNfY21kX2FsbG9jKHN0cnVjdCBvcHRl
ZV9kb21haW4gKmN0eCwKK3N0YXRpYyBib29sIGhhbmRsZV9ycGNfY21kX2FsbG9jKHN0cnVjdCBv
cHRlZV9kb21haW4gKmN0eCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IG9wdGVlX3N0ZF9jYWxsICpjYWxsLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHNobV9ycGMgKnNobV9ycGMpCiB7CiAgICAgaWYgKCBzaG1fcnBjLT54ZW5f
YXJnLT5yZXQgfHwgc2htX3JwYy0+eGVuX2FyZy0+bnVtX3BhcmFtcyAhPSAxICkKLSAgICAgICAg
cmV0dXJuOworICAgICAgICByZXR1cm4gdHJ1ZTsKIAogICAgIGlmICggc2htX3JwYy0+eGVuX2Fy
Zy0+cGFyYW1zWzBdLmF0dHIgIT0gKE9QVEVFX01TR19BVFRSX1RZUEVfVE1FTV9PVVRQVVQgfAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX01TR19B
VFRSX05PTkNPTlRJRykgKQpAQCAtMTI2OSw3ICsxMzcyLDcgQEAgc3RhdGljIHZvaWQgaGFuZGxl
X3JwY19jbWRfYWxsb2Moc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgICAgICBnZHByaW50
ayhYRU5MT0dfV0FSTklORywKICAgICAgICAgICAgICAgICAgIkludmFsaWQgYXR0cnMgZm9yIHNo
YXJlZCBtZW0gYnVmZmVyOiAlIlBSSXg2NCJcbiIsCiAgICAgICAgICAgICAgICAgIHNobV9ycGMt
Pnhlbl9hcmctPnBhcmFtc1swXS5hdHRyKTsKLSAgICAgICAgcmV0dXJuOworICAgICAgICByZXR1
cm4gdHJ1ZTsKICAgICB9CiAKICAgICAvKiBGcmVlIHBnIGxpc3QgZm9yIGJ1ZmZlciAqLwpAQCAt
MTI4NSwyMSArMTM4OCwxNCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfcnBjX2NtZF9hbGxvYyhzdHJ1
Y3Qgb3B0ZWVfZG9tYWluICpjdHgsCiAgICAgewogICAgICAgICBjYWxsLT5ycGNfZGF0YV9jb29r
aWUgPSAwOwogICAgICAgICAvKgotICAgICAgICAgKiBPa2F5LCBzbyB0aGVyZSB3YXMgcHJvYmxl
bSB3aXRoIGd1ZXN0J3MgYnVmZmVyIGFuZCB3ZSBuZWVkCi0gICAgICAgICAqIHRvIHRlbGwgYWJv
dXQgdGhpcyB0byBPUC1URUUuCi0gICAgICAgICAqLwotICAgICAgICBzaG1fcnBjLT54ZW5fYXJn
LT5yZXQgPSBURUVDX0VSUk9SX0dFTkVSSUM7Ci0gICAgICAgIHNobV9ycGMtPnhlbl9hcmctPm51
bV9wYXJhbXMgPSAwOwotICAgICAgICAvKgotICAgICAgICAgKiBUT0RPOiBXaXRoIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24sIE9QLVRFRSB3aWxsIG5vdCBpc3N1ZQotICAgICAgICAgKiBSUEMgdG8g
ZnJlZSB0aGlzIGJ1ZmZlci4gR3Vlc3QgYW5kIE9QLVRFRSB3aWxsIGJlIG91dCBvZgotICAgICAg
ICAgKiBzeW5jOiBndWVzdCBiZWxpZXZlcyB0aGF0IGl0IHByb3ZpZGVkIGJ1ZmZlciB0byBPUC1U
RUUsCi0gICAgICAgICAqIHdoaWxlIE9QLVRFRSB0aGlua3Mgb2Ygb3Bwb3NpdGUuIElkZWFsbHks
IHdlIG5lZWQgdG8KLSAgICAgICAgICogZW11bGF0ZSBSUEMgd2l0aCBPUFRFRV9NU0dfUlBDX0NN
RF9TSE1fRlJFRSBjb21tYW5kLgorICAgICAgICAgKiBXZSBhcmUgdW5hYmxlIHRvIHRyYW5zbGF0
ZSBndWVzdCdzIGJ1ZmZlciwgc28gd2UgbmVlZCB0ZWxsIGd1ZXN0CisgICAgICAgICAqIHRvIGZy
ZWUgaXQsIGJlZm9yZSByZXBvcnRpbmcgYW4gZXJyb3IgdG8gT1AtVEVFLgogICAgICAgICAgKi8K
LSAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywKLSAgICAgICAgICAgICAgICAidHJhbnNs
YXRlX25vbmNvbnRpZygpIGZhaWxlZCwgT1AtVEVFL2d1ZXN0IHN0YXRlIGlzIG91dCBvZiBzeW5j
LlxuIik7CisgICAgICAgIHJldHVybiAhaXNzdWVfcnBjX2NtZF9mcmVlKGN0eCwgcmVncywgY2Fs
bCwgc2htX3JwYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2htX3JwYy0+
eGVuX2FyZy0+cGFyYW1zWzBdLnUudG1lbS5zaG1fcmVmKTsKICAgICB9CisKKyAgICByZXR1cm4g
dHJ1ZTsKIH0KIAogc3RhdGljIHZvaWQgaGFuZGxlX3JwY19jbWQoc3RydWN0IG9wdGVlX2RvbWFp
biAqY3R4LCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKQEAgLTEzNDksMjIgKzE0NDUsMzcg
QEAgc3RhdGljIHZvaWQgaGFuZGxlX3JwY19jbWQoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LCBz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0g
ICAgc3dpdGNoIChzaG1fcnBjLT54ZW5fYXJnLT5jbWQpCisgICAgaWYgKCBjYWxsLT5zdGF0ZSA9
PSBPUFRFRV9DQUxMX05PUk1BTCApCiAgICAgewotICAgIGNhc2UgT1BURUVfUlBDX0NNRF9HRVRf
VElNRToKLSAgICBjYXNlIE9QVEVFX1JQQ19DTURfV0FJVF9RVUVVRToKLSAgICBjYXNlIE9QVEVF
X1JQQ19DTURfU1VTUEVORDoKLSAgICAgICAgYnJlYWs7Ci0gICAgY2FzZSBPUFRFRV9SUENfQ01E
X1NITV9BTExPQzoKLSAgICAgICAgaGFuZGxlX3JwY19jbWRfYWxsb2MoY3R4LCByZWdzLCBjYWxs
LCBzaG1fcnBjKTsKLSAgICAgICAgYnJlYWs7Ci0gICAgY2FzZSBPUFRFRV9SUENfQ01EX1NITV9G
UkVFOgotICAgICAgICBmcmVlX29wdGVlX3NobV9idWYoY3R4LCBzaG1fcnBjLT54ZW5fYXJnLT5w
YXJhbXNbMF0udS52YWx1ZS5iKTsKLSAgICAgICAgaWYgKCBjYWxsLT5ycGNfZGF0YV9jb29raWUg
PT0gc2htX3JwYy0+eGVuX2FyZy0+cGFyYW1zWzBdLnUudmFsdWUuYiApCi0gICAgICAgICAgICBj
YWxsLT5ycGNfZGF0YV9jb29raWUgPSAwOwotICAgICAgICBicmVhazsKLSAgICBkZWZhdWx0Ogot
ICAgICAgICBicmVhazsKKyAgICAgICAgc3dpdGNoIChzaG1fcnBjLT54ZW5fYXJnLT5jbWQpCisg
ICAgICAgIHsKKyAgICAgICAgY2FzZSBPUFRFRV9SUENfQ01EX0dFVF9USU1FOgorICAgICAgICBj
YXNlIE9QVEVFX1JQQ19DTURfV0FJVF9RVUVVRToKKyAgICAgICAgY2FzZSBPUFRFRV9SUENfQ01E
X1NVU1BFTkQ6CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgY2FzZSBPUFRFRV9SUENfQ01E
X1NITV9BTExPQzoKKyAgICAgICAgICAgIGlmICggIWhhbmRsZV9ycGNfY21kX2FsbG9jKGN0eCwg
cmVncywgY2FsbCwgc2htX3JwYykgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIC8q
IFdlIGZhaWxlZCB0byB0cmFuc2xhdGUgYnVmZmVyLCByZXBvcnQgYmFjayB0byBndWVzdCAqLwor
ICAgICAgICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHNobV9ycGMtPnhlbl9hcmcpOworICAg
ICAgICAgICAgICAgIHB1dF9zdGRfY2FsbChjdHgsIGNhbGwpOworCisgICAgICAgICAgICAgICAg
cmV0dXJuOworICAgICAgICAgICAgfQorICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIGNhc2Ug
T1BURUVfUlBDX0NNRF9TSE1fRlJFRToKKyAgICAgICAgICAgIGZyZWVfb3B0ZWVfc2htX2J1Zihj
dHgsIHNobV9ycGMtPnhlbl9hcmctPnBhcmFtc1swXS51LnZhbHVlLmIpOworICAgICAgICAgICAg
aWYgKCBjYWxsLT5ycGNfZGF0YV9jb29raWUgPT0KKyAgICAgICAgICAgICAgICAgc2htX3JwYy0+
eGVuX2FyZy0+cGFyYW1zWzBdLnUudmFsdWUuYiApCisgICAgICAgICAgICAgICAgY2FsbC0+cnBj
X2RhdGFfY29va2llID0gMDsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICBkZWZhdWx0Ogor
ICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKyAgICB9CisgICAgZWxzZQorICAgIHsKKyAg
ICAgICAgaGFuZGxlX3hlbl9ycGNfcmV0dXJuKGN0eCwgcmVncywgY2FsbCwgc2htX3JwYyk7CiAg
ICAgfQogCiBvdXQ6Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

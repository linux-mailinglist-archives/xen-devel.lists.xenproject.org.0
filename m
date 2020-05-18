Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CCC1D6EAC
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUxv-00054w-3X; Mon, 18 May 2020 01:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDU1=7A=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jaUxt-00054r-Kd
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:53:13 +0000
X-Inumbo-ID: 53a3a200-98aa-11ea-a82d-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53a3a200-98aa-11ea-a82d-12813bfff9fa;
 Mon, 18 May 2020 01:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZXnPSIulmQAA0NeXcpgP3yo/bQ9MYx+SRpwBAk/YYjNW4up4aJflsPPV3hSJSP0LeexEWjuDpnDN3uDHpX5pm3bv1wIcPninXn6YDWImTr3XF3T9KE7s6slFeeldcTf6fE7Lf573pI+iMlM/6R94nohcV6YZx9TOprE7M6vki2bIVIp6JsOn1At+R5LnWVXbq5DiO/dim2fOsN6bIIlv7BcnpyZcijcFaYtXvpLl7Q9iJmztBOU2pvTgPijEyMChe2CIaG/IS8qNk+YJLSxPn1YqVvv2lgmthaGORIaDgc2VvHbEOmHaUYGsA9Xto/P9jmNLxorluwVYfLXs4JzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ZTmz7ZkuJd8she9nbYHz8c8nga6+mSjhcSH14/Cso=;
 b=hRRqk4aosQjGq11MWAjEUwwkd3shu2nMhf284TYrop4ADstuFu7Tq+078L3PRYN8poNDmoUZsYaCLA3Ng8mVeScD/V8ou5o2eIL4zqc6StQ1fXkaaWwz9PSwFRTiRSi9aYiglh9F2yKE3uhEpXoJVGs46UrYbHuYDCUIVGpQmyJaee+8jhwsbJIIJED83GOZi3zGiipJNLoz/5EJtw2l9BxYjBhAiFbuMCTYzmhVWdTAG64ItfEGAD4MQY+UIq9Vcewo8oSmsqE4n1+L35Zv0h6+/kXYHFFbbQOgEZ9KPamAWCtcFQueeee/S1tjbFETNUleDScinkdNpoFY6FGC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ZTmz7ZkuJd8she9nbYHz8c8nga6+mSjhcSH14/Cso=;
 b=LUuQkGNfVhj50WuCZF5h4pG9oHufSTIfp1q772aOvjwL/5tOVEBZZEG7U0NGgCqo1d1O1/OnkF5rK+cCqsk+yT88BmkyueTuHiJMzex0vtZCcDvgfWjzv7ssFTfLhCD8gxWlt0QQq++925MJ8YhGT0pMUwjOMTtD5LJF/cF43+M=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2640.eurprd03.prod.outlook.com
 (2603:10a6:800:e1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.33; Mon, 18 May
 2020 01:53:06 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3000.022; Mon, 18 May 2020
 01:53:06 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
 <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
Thread-Topic: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL
 address
Thread-Index: AQHWLLcTxhZtogukPEOG78aedSZTLQ==
Date: Mon, 18 May 2020 01:53:06 +0000
Message-ID: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f03da269-fdc3-4f1c-6c22-08d7face35bd
x-ms-traffictypediagnostic: VI1PR0302MB2640:
x-microsoft-antispam-prvs: <VI1PR0302MB26409110A42B7A0BD4C40943E6B80@VI1PR0302MB2640.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSUU8g8CFFGS49noMtYaZTrPrjA9IBiKtbE/JGFyIIefUH3w2SwuI6ynmj6H/KKfIv3C5q2wCPwPlx2cH6U3GRsMZvSyGGfkz8rUJchCnszJGjlMGq2U4sl/W9xlEww9ErBTrLiddELc2bqfXvpy8gLXQvsA/7Lw1GZKIVXFdhS2dExgr+5U2w72qfhJyJ3xDq65cHRoumjOXWyiqazO67HfPRHjVEt77EUpa3ozJycx4h50CqaPgXA6na+2SBEh3p5DqN9YfvE6RiuJN5HJRPhEaNnWcWC68uiLPTUO2ealJg73gYfzrq1U804cd1qpuEq7RBaaAgKnW4TpF666rzCZ0LCKVXiipXki8nbwzjaw71uVKBHtVBVCitPTx2GLT0majsw7aXwt+Fv2YI5TnNtG2oCmvlxwNrJFC4Y+8jMGlpt8MlL1bp9/vIsDpQ8T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(36756003)(478600001)(2906002)(86362001)(6512007)(6486002)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(8676002)(55236004)(186003)(26005)(2616005)(5660300002)(316002)(8936002)(6506007)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: DImgU2KnJH7Uho1iQB9Q0w6r4Wecfz+85ZBGpDI36C3CTwQMH3xUdooZMZNUEnksOuWswXOzcswhsiTUX7bBy64j0+5E5FAXDDmDt3Qz6ydCrmLM5rALdXIt3485kw20ReZYzv/3DrtimEWuSS31pLVS9BfnBzttcId9oATFHIaxhnUlku62ovXbMMB8DZ2xvGLFxrmfWtUIwJXzRJrNFTUe9CLBxeLBYHjYQjP7yAfeVod0NKIYWfw6PLKtvZB3QfgPGA46EbIFzvvY7d42LjfIpxnKdK0A4GGHysf332jyBNElKgE95OgJDObYO9/O2SYTIuCIThcxncSw1b0gADvguVG5AkUznwAPoWohNfU3DxXmGinK4Y3snJfgxeuKBaCNZBUDMAzPa/N/wRcKxaIuP+TN7XP9oXc8VrIqv/sNB0VR+AMSEyj6+mJ42wPAxXS0BWyd3OpcMyHS1xZFqzcBlmMwNCoJ5UId/lAWPc8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <24933F503D2E4A419B0B0F6CA6A2F68A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03da269-fdc3-4f1c-6c22-08d7face35bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 01:53:06.6428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGrOR4dWWfmp9CEK7KoTb2h9bJ2SH5GijUIiDfCptqpOr4NJL9XiXGDmK+enFnhQ4fVsYDiDl+QgMQnt4U7VrzW4VwLDV+7skohkT0mEdrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2640
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJ1c3RlZCBBcHBsaWNhdGlvbnMgdXNlIHBvcHVsYXIgYXBwcm9hY2ggdG8gZGV0ZXJtaW5lIHJl
cXVpcmVkIHNpemUNCm9mIGJ1ZmZlcjogY2xpZW50IHByb3ZpZGVzIGEgbWVtb3J5IHJlZmVyZW5j
ZSB3aXRoIHRoZSBOVUxMIHBvaW50ZXIgdG8NCmEgYnVmZmVyLiBUaGlzIGlzIHNvIGNhbGxlZCAi
TnVsbCBtZW1vcnkgcmVmZXJlbmNlIi4gIFRBIHVwZGF0ZXMgdGhlDQpyZWZlcmVuY2Ugd2l0aCB0
aGUgcmVxdWlyZWQgc2l6ZSBhbmQgcmV0dXJucyBpdCBiYWNrIHRvIGNsaWVudC4gVGhlbg0KY2xp
ZW50IGFsbG9jYXRlcyBidWZmZXIgb2YgbmVlZGVkIHNpemUgYW5kIHJlcGVhdHMgdGhlIG9wZXJh
dGlvbi4NCg0KVGhpcyBiZWhhdmlvciBpcyBkZXNjcmliZWQgaW4gVEVFIENsaWVudCBBUEkgU3Bl
Y2lmaWNhdGlvbiwgcGFyYWdyYXBoDQozLjIuNS4gTWVtb3J5IFJlZmVyZW5jZXMuDQoNCk9QLVRF
RSByZXByZXNlbnRzIHRoaXMgbnVsbCBtZW1vcnkgcmVmZXJlbmNlIGFzIGEgVE1FTSBwYXJhbWV0
ZXIgd2l0aA0KYnVmX3B0ciA9PSBOVUxMLiBUaGlzIGlzIHRoZSBvbmx5IGNhc2Ugd2hlbiB3ZSBz
aG91bGQgYWxsb3cgVE1FTQ0KYnVmZmVyIHdpdGhvdXQgdGhlIE9QVEVFX01TR19BVFRSX05PTkNP
TlRJRyBmbGFnLg0KDQpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXly
X2JhYmNodWtAZXBhbS5jb20+DQotLS0NCiB4ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgfCA5ICsr
KysrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0v
dGVlL29wdGVlLmMNCmluZGV4IGFmMTlmYzMxZjguLmZiN2Q0OTFiMjUgMTAwNjQ0DQotLS0gYS94
ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMNCisrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYw0K
QEAgLTg2NSw5ICs4NjUsMTIgQEAgc3RhdGljIGludCB0cmFuc2xhdGVfcGFyYW1zKHN0cnVjdCBv
cHRlZV9kb21haW4NCipjdHgsDQogICAgICAgICAgICAgfQ0KICAgICAgICAgICAgIGVsc2UNCiAg
ICAgICAgICAgICB7DQotICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAi
R3Vlc3QgdHJpZXMgdG8gdXNlIG9sZCB0bWVtDQphcmdcbiIpOw0KLSAgICAgICAgICAgICAgICBy
ZXQgPSAtRUlOVkFMOw0KLSAgICAgICAgICAgICAgICBnb3RvIG91dDsNCisgICAgICAgICAgICAg
ICAgaWYgKCBjYWxsLT54ZW5fYXJnLT5wYXJhbXNbaV0udS50bWVtLmJ1Zl9wdHIgKQ0KKyAgICAg
ICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklO
RywgIkd1ZXN0IHRyaWVzIHRvIHVzZSBvbGQNCnRtZW0gYXJnXG4iKTsNCisgICAgICAgICAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7DQorICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCisg
ICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICBicmVhazsNCiAg
ICAgICAgIGNhc2UgT1BURUVfTVNHX0FUVFJfVFlQRV9OT05FOg0K


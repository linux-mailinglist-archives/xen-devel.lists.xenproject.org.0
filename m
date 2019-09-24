Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D4BCBD0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:50:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCn1i-0001ha-Dr; Tue, 24 Sep 2019 15:46:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCn1g-0001h7-VW
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:46:53 +0000
X-Inumbo-ID: 83a3900b-dee2-11e9-9621-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.81]) by localhost (Halon) with ESMTPS
 id 83a3900b-dee2-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBjT1HtTk87Qo1jkBNcwOYwBSSxiFowvWirRYaBiC9SK0U/cur9jLTwb6PxNe2eewYLjOyp8sFc/UTGJcvJpsYkq8lRUdpwz9aJzc8Gs90Qsa6POORJGEnMa68ie73CKhq65VwCEpU82HQPn2wI6MKntz2Fbg5CVw92PD2uhTLhMhugDHGqxOp7MfCSWtklP+ptSEtzSH/8QxqB2LaCL9HQtOczahMo6ae+Sa6Yu9/n6/8z/wSXDcXCNcRFV8dkZ2ySnFfv8O1s5CkX7hRgup+zgmMtjPVYov4O5E3E2o4zlEfAIagJxKSY2U64MqnlBUblg4pxIMNtT4WuPj9N6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoAS8wknDbM6x9BpcPFNq5xOopYwjTR4sn8ROaIL1VU=;
 b=hwxaI6Q6qCbYUK8uxALoOhot5/y62thupEFW8v9UE6846AvxYk1gnZ6jBNXPTHHkLDM+aqRaP8f6SuvsyWWMRnc/V8ANzqW919YZu8UlfBMsbIrSDUYbioABzLFJ6CMZ89BpdT7G5PB/PyjLhiYlMNAVz+HFA5VN7rvaQugUk4ealggLGIRVIKVSQWxMcr9XKDgeGl+OG0JX/FS/aNyXyuRKOCER80MGhGOxUSYtUh94MoEAhThNPvCiTfszUP7eFfIS0nEN8xYPc2SHSH1CIAlKvMaJJQ6yfT3gAWiJeDTtnpP89L+/XmW53M+1bWoDBeakO5fX+pXULsozr4xBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoAS8wknDbM6x9BpcPFNq5xOopYwjTR4sn8ROaIL1VU=;
 b=W6K8SM1BXIS2dMzQU8zynD9RJODmEYJs24sF2iLlwzNnJ74n4seG8mgyd68HU/jRGurUIg0D+rcBRwPON0hkMtMkxevU5zmU5wHEUScxz1N/gjO+Ek3unXWNuPeOxo7SB4x/mWrp2xgJx89dwtcwEqHsOoLqCf4OkDjoVDvGUNA=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4757.eurprd03.prod.outlook.com (20.177.35.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:46:47 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:46:47 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/3] SUPPORT.md: Describe OP-TEE mediator
Thread-Index: AQHVcu9F6B3J9fIrM0GdSK7nI4W0uQ==
Date: Tue, 24 Sep 2019 15:46:47 +0000
Message-ID: <20190924154633.852828-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: eb18c440-10c8-4210-33b0-08d741066862
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4757; 
x-ms-traffictypediagnostic: AM6PR03MB4757:|AM6PR03MB4757:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB47574223F12150E4265703E4E6840@AM6PR03MB4757.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(64756008)(66946007)(6116002)(3846002)(54906003)(476003)(2616005)(11346002)(76176011)(86362001)(8936002)(256004)(6916009)(2906002)(81156014)(5640700003)(4744005)(81166006)(446003)(186003)(2351001)(55236004)(6436002)(486006)(99286004)(6512007)(80792005)(36756003)(5660300002)(4326008)(14454004)(6486002)(66066001)(8676002)(305945005)(2501003)(6506007)(7736002)(25786009)(478600001)(66556008)(66476007)(7416002)(91956017)(76116006)(316002)(71200400001)(66446008)(71190400001)(1076003)(26005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4757;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wPQWHcRMdYJ51LIyZRHl2q92rGNGw8ls3B3d3zBRYsCOxbcugaa3Vd5D05hjO1kIbu22d8kjb+dumz4nJYYFpoXv1DewayhLEizm4PfbMff1Bu7NndzQ1bJSyw6DiVlohOO37c27rLx7nuk52lnUhLw4rm2vMgTb7okbG6QIdTT88ykVpDL8y1O0h/r9+CfyZouyCkV4C1uLiavCmbyn3VAzs98lBiIJwyPtKs213XlPAF9naY3q1AMjnpN1HyEEadj4tu4IQU9FNm5/WGxuHN9Yg2XkcX/YEhdEsRvtRvUUTPCNhWsOMGgAffPTStugh1nx/4AVmtUgu6jEHr3/aIaYrrobzM+TEtQtC5kDyrRKZYAAOSW5jH2s0mDMAT0fkZtAU0m2lGsGLTyEkDzniQ6T9hV9/YiZt26h7EouYtY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb18c440-10c8-4210-33b0-08d741066862
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:46:47.1767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFrrS3wQ3OibA7XeuSXi7F1LAqcmB5rLORqPoTdq2QCRVjl/CgZGBehmuQdAbLK9MQvsYins2+z+FN9RnWLCrNMGFqzqQj+L2zuLyJls1Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4757
Subject: [Xen-devel] [PATCH v3 2/3] SUPPORT.md: Describe OP-TEE mediator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCB0aGUgbGF0ZXN0IHBhdGNoZXMgdG8gdGhlIG1lZGlhdG9yLCBpdCBjYW4gYmUgY29uc2lk
ZXJlZAphcyBUZWNobm9sb2dpY2FsIFByZXZpZXcgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KCk5vdGUgZm9yIGNvbW1pdGVy
OgpPYnZpb3VzbHkgdGhpcyBwYXRjaCBzaG91bGQgYmUgbWVyZ2VkIGFmdGVyIGFsbCBvdGhlciBw
YXRjaGVzIGluCnRoaXMgc2VyaWVzLgoKQ2hhbmdlcyBmcm9tIHYyOgogLSBBUk0tPkFybQogLSBB
ZGRlZCBhLWIgdGFnIGJ5IEp1bGllbgotLS0KIFNVUFBPUlQubWQgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9S
VC5tZAppbmRleCAzNzU0NzNhNDU2Li5hNzMzZDc0NDY0IDEwMDY0NAotLS0gYS9TVVBQT1JULm1k
CisrKyBiL1NVUFBPUlQubWQKQEAgLTY2MCw2ICs2NjAsMTAgQEAgTm8gc3VwcG9ydCBmb3IgUUVN
VSBiYWNrZW5kcyBpbiBhIDE2SyBvciA2NEsgZG9tYWluLgogCiAgICAgU3RhdHVzOiBTdXBwb3J0
ZWQKIAorIyMjIEFybTogT1AtVEVFIE1lZGlhdG9yCisKKyAgICBTdGF0dXM6IFRlY2ggUHJldmll
dworCiAjIyBWaXJ0dWFsIEhhcmR3YXJlLCBRRU1VCiAKIFRoaXMgc2VjdGlvbiBkZXNjcmliZXMg
c3VwcG9ydGVkIGRldmljZXMgYXZhaWxhYmxlIGluIEhWTSBtb2RlIHVzaW5nIGEKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

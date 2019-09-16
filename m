Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B23B3797
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nfX-0005oz-9t; Mon, 16 Sep 2019 09:51:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gS2T=XL=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1i9nfV-0005ou-N5
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:51:37 +0000
X-Inumbo-ID: 91cb3452-d867-11e9-978d-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91cb3452-d867-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 09:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrPJnOpTBkVylyJtRpsRntiLtvIWd3Cz9EfihoRQHLP2d/2kQr58nfSIr0F5THakU5GbLyAXdg7hUvQQHpYjiY/zVbXVRdEvoTp5hsKIQ2fTgu8XXyWNTlOuzwDav9FDKAXpR3X+Uirk+ViG4SvL7U8sZ1eyhKvHqobqOd9whBcCyTtHnwaLn52vBGW++jjl175IaUNSATeMLuuMmnT8GbbCFm5jXtkMYIjSioyHsCxmnnGRXRGXkGodBK2upJPkouRauy7o7M5z4qcCyuiIU1FYXh/HPC5l7zrjrWUObob/BdKXWz5OVklErWUzryUauhby3jA1XMy+W74Yf6MLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8F5CzEJ/age1CHHHPqTMUHg6wLBT35cM6qcA/wKMQA=;
 b=KYFcb5BoA3Qer+mVYvhXLgEQL+H4SljhmErNxmtDpLYZCNrh4bAFdEAir9MV/akGqXlsXR6kMkfv0BOvIGO7iKfBxdNXYZySTT52EVZtGGxECOlNHg+KGC7ayze7pCQhqCgeshGQE5Z9DNps4rtGMaOSWlG7PDr4EE58qFHU1YnLRadgp7vlPI7wVMv/TUdIZrr3YEz9uEfrfCXXqPMKb65W4TbIZIOWMeHdwMq4i2ljYu+zrNtw/T2BrU9eyj8qsIAKsYqSHRVaQRPzZpYRmyQqH+LgodasmScQEujN45zAVHtrrHxqSRcvmfLWVH4Xvvk5u1nAebGvONJUoxnQ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8F5CzEJ/age1CHHHPqTMUHg6wLBT35cM6qcA/wKMQA=;
 b=oKdwZU3zDYX9Dy2TCF7VDy7nRB4A1mXtto4MzWFYRlsnKtWlA0iksceR/uvaxkjf+Va7BWRucsVUodAXCK+s2Eb4ltTCdIzVVR+g/EQSxEpXX6m6K3ROLHv4qJdWx4mTPRtINnXZW9lCoCdDGOYh/QohNFd3fB8P5EsYIA1pKow=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5186.eurprd04.prod.outlook.com (20.176.215.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.14; Mon, 16 Sep 2019 09:51:34 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::6ca2:ec08:2b37:8ab8]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::6ca2:ec08:2b37:8ab8%6]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 09:51:34 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
 "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>
Thread-Topic: [PATCH V3] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVbHRSaJ8nL5OcZUKnpAnuiJ+Vsw==
Date: Mon, 16 Sep 2019 09:51:33 +0000
Message-ID: <1568627400-21335-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0189.apcprd02.prod.outlook.com
 (2603:1096:201:21::25) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dde092f-4dc9-47c8-17f2-08d73a8b7522
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR04MB5186; 
x-ms-traffictypediagnostic: AM0PR04MB5186:|AM0PR04MB5186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB518625B959CEEB06504C5075888C0@AM0PR04MB5186.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:133;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(199004)(189003)(7736002)(86362001)(25786009)(8676002)(54906003)(81166006)(26005)(2501003)(81156014)(8936002)(2906002)(102836004)(110136005)(6506007)(486006)(256004)(2201001)(53936002)(386003)(44832011)(6486002)(14444005)(14454004)(36756003)(50226002)(99286004)(305945005)(6436002)(66066001)(478600001)(71200400001)(5660300002)(71190400001)(4326008)(6512007)(6116002)(186003)(476003)(66476007)(66556008)(52116002)(2616005)(64756008)(66446008)(3846002)(66946007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5186;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GhFLTZUam2svVQUPfjTqJv8m65Dws5Irh+w2L39xjcuMTVdubiAYjtwT2WQKVVU8D2+kHmSaevnpE3jJc4lPnMoG8i3WKRx2Ow5tOeSRI47Q7qzoKGC1PZb5IsELH+tdaBRO9VKjLK6V9kIlHhZIlv7Hwmd/dJUEidO+ST8vyYQbyZ0ZQjonStJohxsxTDkos8R/yvg5Tl+s+P/Ctsn6vV9W5ydKWHYuT0Fgj6pYRxnumcc9IwGHLtz4VxZqqyeLoZU2KPzIQPzeLPiY5A9FfhUw+OzN5E+uVW71KavCG4WIOnBFhF6wDETw5HjSakweBONA2oAm8EjeCOFqptF4ZypqQqxWtKiGafebOAuR3RYlNcX3755D5BcDc7F/VLMI3fFhPKMAA3BSjXlG7fj7K4GmR5KDJFjUVLhL/OZfI/Q=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dde092f-4dc9-47c8-17f2-08d73a8b7522
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 09:51:34.0156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZul6er8FMN9aOpYNr+i019whEoXmd9DgIzfC5geVUjcschdPUlhGkHT6jldF2wMNuybY6gTW7DCDBnUsUGWag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5186
Subject: [Xen-devel] [PATCH V3] arm: xen: mm: use __GPF_DMA32 for arm64
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
 Peng Fan <peng.fan@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cgphcm02NCBzaGFyZXMgc29tZSBjb2Rl
IHVuZGVyIGFyY2gvYXJtL3hlbiwgaW5jbHVkaW5nIG1tLmMuCkhvd2V2ZXIgWk9ORV9ETUEgaXMg
cmVtb3ZlZCBieSBjb21taXQKYWQ2N2Y1YTY1NDUoImFybTY0OiByZXBsYWNlIFpPTkVfRE1BIHdp
dGggWk9ORV9ETUEzMiIpLgoKU28gYWRkIGEgY2hlY2sgaWYgQ09ORklHX1pPTkVfRE1BMzIgaXMg
ZW5hYmxlZCB1c2UgX19HRlBfRE1BMzIuCgpTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4KLS0tCgpWMzoKIFVzZSBJU19FTkFCTEVEKENPTkZJR19aT05FX0RNQTMyKSBh
bmQgZHJvcCB4ZW5fc2V0X2dmcF9kbWEuCgpWMjoKIEZvbGxvdyBzdWdnZXN0aW9uIGZyb20gU3Rl
ZmFubywKIGludHJvZHVjZSBzdGF0aWMgaW5saW5lIHZvaWQgeGVuX3NldF9nZnBfZG1hKGdmcF90
ICpmbGFncykgZm9yIGFybTMyL2FybTY0LCBhbmQKIGZvciBhcm02NCB1c2luZyBfX0dGUF9ETUEg
Zm9yIHRoZSBmb3JtZXIgYW5kIF9fR0ZQX0RNQTMyIGZvciB0aGUgbGF0dGVyLgoKCiBhcmNoL2Fy
bS94ZW4vbW0uYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJtL3hl
bi9tbS5jCmluZGV4IDJiMmMyMDg0MDhiYi4uMzhmYTkxN2M4NTg1IDEwMDY0NAotLS0gYS9hcmNo
L2FybS94ZW4vbW0uYworKysgYi9hcmNoL2FybS94ZW4vbW0uYwpAQCAtMjgsNyArMjgsMTAgQEAg
dW5zaWduZWQgbG9uZyB4ZW5fZ2V0X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZCBpbnQgb3Jk
ZXIpCiAKIAlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewogCQlpZiAocmVnLT5iYXNl
IDwgKHBoeXNfYWRkcl90KTB4ZmZmZmZmZmYpIHsKLQkJCWZsYWdzIHw9IF9fR0ZQX0RNQTsKKwkJ
CWlmIChJU19FTkFCTEVEKENPTkZJR19aT05FX0RNQTMyKSkKKwkJCQlmbGFncyB8PSBfX0dGUF9E
TUEzMjsKKwkJCWVsc2UKKwkJCQlmbGFncyB8PSBfX0dGUF9ETUE7CiAJCQlicmVhazsKIAkJfQog
CX0KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

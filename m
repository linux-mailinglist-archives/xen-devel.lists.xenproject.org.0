Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB6632D3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 10:26:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hklOc-0005in-8G; Tue, 09 Jul 2019 08:22:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0K9z=VG=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1hklOa-0005ii-H8
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 08:22:40 +0000
X-Inumbo-ID: b3219447-a222-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.77]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3219447-a222-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 08:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFFjx8Bfr95fqxYAYadzrFzzMV8DGJioJm9RQ/xO/pxzqRpJh617EOleAGGjjL9V1Stoqv8zbaTdIO8zE4/OXH6MebtLMuIuEcDY7uGVlDjIWAMlZNpafUYi1xQXQqSU11MU3bnxSejXu/Cbseexo7jtGSdiNWjxvaSTPYrAB0hu+7KhInjrRLKINUzUUe+caWFMa80EmOMJL8zkIw2nZz679ibn2RXZ+rYiC/KtvXKpYmd/5NcNSfZPJYzqCN72kqMAdXh3hrSkqSA4jKAiDnEbFeHzF1EGxyYoeFVXpcDu3VHdVKqA5LzJrfBreY6r0RgTd+ehBrkSMFbIGvFHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0VeOYnQJzd+/2ZaGMz39y9y70V69Y7YVJV+39rC1WU=;
 b=CmAzxd13ZyP/Bo7XcEueHl+dMo61VjdK6Oho2vDiU8DyAiDiRE6YNsXY+pNxBkZuxG9wSAwAp6DPP1eblJMyNj5Dn886suOlXoy0090MlWOH3DynWzx+y08eZBCe+fktMKGhbOhMIw3ofmsw7mFeHkUPvEZHmng5AGTUuPa6forofKYxUwugFlzWjJKzRvZhWtjcxNbfHizVmR/yHWL/xtdxDPeC8H4dhqz5eOgOlUilmcv1/t7GnDmmp8LwuPdMKgWYOGgVccqbu/xF5U8tpVXXApGX3ABP+NZY272woR6OqB160PSZm45PCtOQjjUeC6cjgSACHEpjNQmiCPtnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0VeOYnQJzd+/2ZaGMz39y9y70V69Y7YVJV+39rC1WU=;
 b=GzifLgaLwt+rSoT4WuEWTwgjCBp/ktWL/wPP2tyXjxHkMBJ+5VLi2rq96Zadlplh5RT6MsHnX95SuMjYyIgv/iirqIPrRhyITPtzN8aqP/i8zhts6p1/zAAiVt24SXVeW70nmHoG08W+RzduvzABv42RsMn+jRRcD81CDdk3NfE=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6050.eurprd04.prod.outlook.com (20.179.32.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 08:22:30 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::2023:c0e5:8a63:2e47%5]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 08:22:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>
Thread-Topic: [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVNi9zmpVhxJk2Z0aPUBEkePn3cw==
Date: Tue, 9 Jul 2019 08:22:30 +0000
Message-ID: <20190709083729.11135-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.16.4
x-clientproxiedby: HK0PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::16) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9121fe40-b778-47ae-ea76-08d7044695ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6050; 
x-ms-traffictypediagnostic: AM0PR04MB6050:
x-microsoft-antispam-prvs: <AM0PR04MB605051BEAB92F04288000EDE88F10@AM0PR04MB6050.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:194;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(478600001)(7736002)(50226002)(386003)(4326008)(5660300002)(6436002)(6506007)(4744005)(99286004)(2906002)(66066001)(52116002)(54906003)(6486002)(2501003)(8936002)(186003)(26005)(110136005)(14444005)(256004)(305945005)(316002)(102836004)(6512007)(81166006)(81156014)(486006)(25786009)(68736007)(86362001)(6116002)(3846002)(53936002)(8676002)(1076003)(476003)(44832011)(2616005)(73956011)(36756003)(66446008)(66476007)(66556008)(64756008)(71200400001)(14454004)(66946007)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6050;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gdfL97amVfYXLuvxiFtdG8YKtio0ybCCX44aY3h+w3W0ckmOmYG9WW5UBijEnmx7Qv3uJAik2y9m3zVAf3Dh49uYf8e2ax0+DPY7pixHax2DJR0TOq1p2Yk8Sz/kyRS40l0LCqMxvCbwuv3meeKaFKZ6iNxHNoSSjm1Fd5Rch/gDZvgrb39UXGc60D3GQRng2iHSpFALYtQHG6flwkZ9yF2KawuoTwR8I0Mu4foJBYoI8G1JVRnlX7GR/oNHgcKClzRRQzzKR0kkdEWSiVHHycKzECvLtd/a/oFFNHA8o15TvDNzgwc6vQBsv4TBIrMcvxCqkE36S3nLePywz/26Lm3x3Q5s1/eJDYsxKi8JaWh6z+e2FEy/B1kkCriNg4Spq9zpnehdo/RnRT103oqtK3Xkq0nrK304bkjPic/tyLs=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9121fe40-b778-47ae-ea76-08d7044695ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 08:22:30.5672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peng.fan@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6050
Subject: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: Peng Fan <peng.fan@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YXJtNjQgc2hhcmVzIHNvbWUgY29kZSB1bmRlciBhcmNoL2FybS94ZW4sIGluY2x1ZGluZyBtbS5j
LgpIb3dldmVyIFpPTkVfRE1BIGlzIHJlbW92ZWQgYnkgY29tbWl0CmFkNjdmNWE2NTQ1KCJhcm02
NDogcmVwbGFjZSBaT05FX0RNQSB3aXRoIFpPTkVfRE1BMzIiKS4KU28gdG8gQVJNNjQsIG5lZWQg
dXNlIF9fR0ZQX0RNQTMyLgoKU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5j
b20+Ci0tLQogYXJjaC9hcm0veGVuL21tLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBi
L2FyY2gvYXJtL3hlbi9tbS5jCmluZGV4IGUxZDQ0YjkwM2RmYy4uYTk1ZTc2ZDE4YmY5IDEwMDY0
NAotLS0gYS9hcmNoL2FybS94ZW4vbW0uYworKysgYi9hcmNoL2FybS94ZW4vbW0uYwpAQCAtMjcs
NyArMjcsNyBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9mcmVlX3BhZ2VzKHVuc2ln
bmVkIGludCBvcmRlcikKIAogCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7CiAJCWlm
IChyZWctPmJhc2UgPCAocGh5c19hZGRyX3QpMHhmZmZmZmZmZikgewotCQkJZmxhZ3MgfD0gX19H
RlBfRE1BOworCQkJZmxhZ3MgfD0gX19HRlBfRE1BIHwgX19HRlBfRE1BMzI7CiAJCQlicmVhazsK
IAkJfQogCX0KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

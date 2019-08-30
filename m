Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F2A2CE0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 04:30:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Wed-00026x-UB; Fri, 30 Aug 2019 02:28:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KxH1=W2=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1i3Wec-00026s-42
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 02:28:46 +0000
X-Inumbo-ID: e2d59b50-cacd-11e9-b95f-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d59b50-cacd-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 02:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV1nuaGbeX4EPMKY1an+ImXugJLAjAEJ1dehoyAbT9OvDS1yDbz9h7O2f+tu7enreGOIzC5gqRm7Xr8POpuGFdCUluXQPGiWMivDJWsU4bVGmk6qPdJP6R7JzwwRkEwIRV67uO0k5b0fK0DZPT3nwOcdrf4zLtBmVxg9I3iqma05kKMkTPXALsZl0I588y7N+t6Wu1fjWJdO4YqOWyyaOE7nhiEChKExtDG6r72JSo4zI1e2qiMiK4vxQFUCjV4Vi1YCwEgjVtnXfSUUl3STpjpmh6DsciwChE/WbRvvkpT1UkC0wAsC2oAAa/btxm6Bgv4WmNBBb8kN36tmHPPGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0rWLhe7eNDoZpMeoGrKroXqtpjwdJE3AtA5mD/wiY=;
 b=HT3fvlaB0TcTU6e2ggEbeISFp0OvWqrWXYeCgRnlq5SUOcU84C+8Lcy8npoT2/GR2iSUdm7s5mA0I1rgfbfDmDIpjGRRHevsKyOH7kV39+FiX8gx7Q2I4pscroFxo9c+xGSVpT4r5r4Xt1O67Vy7AtCZkW/mSLpPZ0ROyKHFQj9pMn7nPIRBWNyisF8JbmS4dGtMK7U6+h0RY9NEtO1GOO292Mf20ca+cQ1NkaPM21xFvrFDCjp/RuRt+rHeUUlxANxPWGyskG6kq1kfQSZtv9C6VFDVEwNxFJmOkiXkMji7wDazstBe8KR/WeE4CsWUTDYjvgex2ofE5C7i5fWoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0rWLhe7eNDoZpMeoGrKroXqtpjwdJE3AtA5mD/wiY=;
 b=A3T4KAeeBq77ovOm4k8dtp0QJ/lRVeGgQt8PFLs50cRGXR9AeiZAC4xZ56TsEFgPZ/WwNc7hu5Ogj3KeGVgLM1nm/KBZDhmdYn2WUVOQey3qCq54XYO4+Qt7Cr7KtpexBPhCraFr7fv37DS7qaCAmK5u2dgvq+wIg6TY8Gd3lzs=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6291.eurprd04.prod.outlook.com (20.179.33.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 02:28:41 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::5d98:e1f4:aa72:16b4%4]) with mapi id 15.20.2178.023; Fri, 30 Aug 2019
 02:28:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
 "will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>
Thread-Topic: [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
Thread-Index: AQHVXtqjidV/KwEkYkeguLx++Vlcnw==
Date: Fri, 30 Aug 2019 02:28:41 +0000
Message-ID: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ee84b63-a69a-4742-4102-08d72cf1c5c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6291; 
x-ms-traffictypediagnostic: AM0PR04MB6291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB62914DE8E9F2819EEE3528F888BD0@AM0PR04MB6291.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:372;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(8676002)(5660300002)(8936002)(186003)(81156014)(81166006)(99286004)(386003)(305945005)(6116002)(3846002)(7736002)(54906003)(256004)(14444005)(6506007)(102836004)(52116002)(64756008)(66446008)(71200400001)(71190400001)(66476007)(66556008)(66946007)(66066001)(486006)(50226002)(110136005)(86362001)(26005)(2201001)(6512007)(2906002)(316002)(36756003)(478600001)(6436002)(25786009)(6486002)(14454004)(4326008)(53936002)(44832011)(2501003)(2616005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6291;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: duFuzaG8BXU1w9kvD1sB/VxKZd2tdZLi8Vpk11QXgy3x7NbdXAI431GwYvlY1Rps3uMl/T7+QOTSll4qkuaPRZ+/X7myFvNHUIo9vMv2aru0IcKb/QQHGEjCCl4M5gw+kjhw3Ws+vREUwn9lvE6Ms+dj79EhtcIgJVZZMXKbjwR6cCDfo/ai6R/A669U8956xXozSb+GVLUIWjpJCveB/BJfVBzKJi56DcQ7wKC8gGIWqEG022lMN8ZDc45Ky0D80vmzTu8ALM915n5xUXTUPHVbTteSKJBZJhSMOstVOnuiuhlOwGEI0OyxHdZ7rZqtIkjv1FQ2NsjeWycMJPqFwICtgXqlttnNGMsOGU5IWn2HN4k9WVe53mEDHy+nwjXsPrdFvbYFGB5h9qJzjDCaebIPgy8ku5ubGguXElyvwD4=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee84b63-a69a-4742-4102-08d72cf1c5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 02:28:41.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhnWXYbjB7mW7NrJOCXPTqWe5Oc7ZC65iD3r3bd8OswenBirSpNZnTWLvGBK6ADNX7981PRV223XgyV/ZRcWPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6291
Subject: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
dGggWk9ORV9ETUEzMiIpLgpTbyBpbnRyb2R1Y2UgeGVuX3NldF9nZnBfZG1hIGZvciBhcm0zMi9h
cm02NCBhbmQgdXNpbmcgX19HRlBfRE1BCmZvciB0aGUgZm9ybWVyIGFuZCBfX0dGUF9ETUEzMiBm
b3IgdGhlIGxhdHRlci4KClNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
PgotLS0KClYyOgogRm9sbG93IHN1Z2dlc3Rpb24gZnJvbSBTdGVmYW5vLAogaW50cm9kdWNlIHN0
YXRpYyBpbmxpbmUgdm9pZCB4ZW5fc2V0X2dmcF9kbWEoZ2ZwX3QgKmZsYWdzKSBmb3IgYXJtMzIv
YXJtNjQsIGFuZAogZm9yIGFybTY0IHVzaW5nIF9fR0ZQX0RNQSBmb3IgdGhlIGZvcm1lciBhbmQg
X19HRlBfRE1BMzIgZm9yIHRoZSBsYXR0ZXIuCgogYXJjaC9hcm0vaW5jbHVkZS9hc20veGVuL3Bh
Z2UuaCAgIHwgNSArKysrKwogYXJjaC9hcm0veGVuL21tLmMgICAgICAgICAgICAgICAgIHwgMiAr
LQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oIHwgNSArKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vaW5jbHVkZS9hc20veGVuL3BhZ2UuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9w
YWdlLmgKaW5kZXggMzFiYmM4MDNjZWNiLi5kMDgzMDljNDVlNmMgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3hlbi9wYWdlLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20veGVu
L3BhZ2UuaApAQCAtMSArMSw2IEBACiAjaW5jbHVkZSA8eGVuL2FybS9wYWdlLmg+CisKK3N0YXRp
YyBpbmxpbmUgdm9pZCB4ZW5fc2V0X2dmcF9kbWEoZ2ZwX3QgKmZsYWdzKQoreworCSpmbGFncyB8
PSBfX0dGUF9ETUE7Cit9CmRpZmYgLS1naXQgYS9hcmNoL2FybS94ZW4vbW0uYyBiL2FyY2gvYXJt
L3hlbi9tbS5jCmluZGV4IGQzM2I3N2U5YWRkMy4uODI4ZjQ5ZGM5NWY5IDEwMDY0NAotLS0gYS9h
cmNoL2FybS94ZW4vbW0uYworKysgYi9hcmNoL2FybS94ZW4vbW0uYwpAQCAtMjgsNyArMjgsNyBA
QCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9mcmVlX3BhZ2VzKHVuc2lnbmVkIGludCBv
cmRlcikKIAogCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7CiAJCWlmIChyZWctPmJh
c2UgPCAocGh5c19hZGRyX3QpMHhmZmZmZmZmZikgewotCQkJZmxhZ3MgfD0gX19HRlBfRE1BOwor
CQkJeGVuX3NldF9nZnBfZG1hKCZmbGFncyk7CiAJCQlicmVhazsKIAkJfQogCX0KZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL3BhZ2UuaCBiL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20veGVuL3BhZ2UuaAppbmRleCAzMWJiYzgwM2NlY2IuLjVlZWFiZjJjNjQ5NCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oCisrKyBiL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20veGVuL3BhZ2UuaApAQCAtMSArMSw2IEBACiAjaW5jbHVkZSA8eGVuL2FybS9w
YWdlLmg+CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fc2V0X2dmcF9kbWEoZ2ZwX3QgKmZsYWdz
KQoreworCSpmbGFncyB8PSBfX0dGUF9ETUEzMjsKK30KLS0gCjIuMTYuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

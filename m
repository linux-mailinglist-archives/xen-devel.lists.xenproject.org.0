Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA8F25F3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 04:23:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSYKa-0003ww-Fn; Thu, 07 Nov 2019 03:19:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HX6Q=Y7=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iSYKZ-0003wr-15
 for xen-devel@lists.xen.org; Thu, 07 Nov 2019 03:19:31 +0000
X-Inumbo-ID: 65c17050-010d-11ea-a1b4-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65c17050-010d-11ea-a1b4-12813bfff9fa;
 Thu, 07 Nov 2019 03:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui4Bl9qj7HlHbF1GwDajg5Iv67XMfn49Iv1/0AFfLICgsUxKLK9relNmzyUU1zBYjFMqJqIQ4dYKB6uHc0JnGtzeFKC3as8dsLIeiM7GsuyRD83a4kufShQYfQTQjsJMoDUGarAwmZrWobOD+d2zXVy1yXEMs57J2U/5gZ/irHOD2o7EYCudYi6NKTh3QM8Col9xyfrgRoU+29Zax/pan/eWhpGCBhQDsUA0JjYMnd/MjDygelTePSXNufIFeLOmrfnAj9LzgPZ2EvpjbyimT0wcDbxidzrsPhOZ0PoWfhQufEc/vjxYzopAACP4LoXIBVI5ObSfifYnH1bft5lItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMsVX+IFUYG7J8IrrpruP23i9N+90rT7taeus722l9Q=;
 b=gLiPCmiKGOaBnSFbN+SVYC9YOCNjFtUg5JOYPbb5zEdbnBHG7D4mvHKpyXgTV1Eti39nSzRHa3CdiIRHp+VvZafOimSCLKUOIUo0NjQ469lE8TtTR20ZZbgJASZ1aDx8s5yidHJDgEe7Hk6daBPJxHnCP7XdAkHHIeYPKifJA61LqD0yO+9p8UWOqSAq28jkY4HuUuVDtk6F2lTsfr2//vnKVjODAqhep4j1rGBEZZX3Bst0cTh4w9pRjfvmbHm1s1Ur3Tp8g4tPwojfiA+ykotPTQHo06Mfh3t68um0X2a8nULG5zCTSz8Vbi1gURMi22x5Jitr/EnZyyLKn+QXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMsVX+IFUYG7J8IrrpruP23i9N+90rT7taeus722l9Q=;
 b=H+HG7+qRmUNMuQ/tGnL01i9fYMCEWcrunG/KaFd130WTIfXvDwNq1o02vcGzqGolyXRWPul4GvszkY01iYAI290ahATxM1kXeXr48+cCENmhobqxfdeQhyes22sqzU1Z2urxI0H/GnslRTuesh/Of76Fc/pyjA5eXbFoFjQfnAY=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4908.eurprd04.prod.outlook.com (20.176.234.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Thu, 7 Nov 2019 03:19:22 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::115f:1e4f:9ceb:2a2c]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::115f:1e4f:9ceb:2a2c%7]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 03:19:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
Thread-Index: AQHVlRomdHS3ryIcQEao8h2tiDDndQ==
Date: Thu, 7 Nov 2019 03:19:21 +0000
Message-ID: <20191107033709.17575-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.16.4
x-clientproxiedby: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To DB7PR04MB4490.eurprd04.prod.outlook.com
 (2603:10a6:5:36::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7a46b6a0-5759-410a-9662-08d763314870
x-ms-traffictypediagnostic: DB7PR04MB4908:|DB7PR04MB4908:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4908392B96AA722BB1429A3288780@DB7PR04MB4908.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(14454004)(6512007)(36756003)(256004)(14444005)(86362001)(486006)(99286004)(66066001)(478600001)(2616005)(6486002)(2501003)(25786009)(4744005)(1076003)(6436002)(4326008)(5660300002)(110136005)(66446008)(316002)(8676002)(54906003)(7736002)(3846002)(305945005)(476003)(66556008)(64756008)(66946007)(2906002)(66476007)(81166006)(8936002)(186003)(81156014)(26005)(44832011)(50226002)(71190400001)(71200400001)(52116002)(386003)(102836004)(6506007)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4908;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oMa/+0zpTanPmww+Ik03l0N3hO/14OlfzE8lu/Pqf/ieIyHvRuwBcVQubxLglJK9gbs2jQewtTum+r9Xm5ObXaAzt9NKVdNxW2T8301UzXj4quOCV6dUAaviYFHPBTvw4haZvPyBPI6CYeMuweft3dchxkk0X+7HHKteGJSYF9s9P63K33OEyupJvREwkNADZ/kc5vPB7OFcKNQwSUSMIKdl5mNLHV5O3gwlCMIEGCP+CkV9EdHRpMWEUQq3T1aOh3oajCxwxAPolID146w7HtBt+ShuCZ9Pr+GeDOsGY2pVNSAvAtpHipFAWkT3v2BN3IEBQb4+l5jw/oRhYzMgSv7hCJVHYEwUMlvk4rbwlaUgeMMHtP8gmuleoJI2FpsiLAmU8pCjCcEbBpaUkwlzBYxrpDrSU4/YoP+Lb0/6Mz6CtoWanxN/Lc1G7QO61Qfo
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a46b6a0-5759-410a-9662-08d763314870
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 03:19:22.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z83h3tYeqKNnZCygKcsRxZabUeVMfUm5XG3lloDSDA5rP53UKIsoVD73naC5Zg3sKYVlvLx3HL7NUB8ceQ1Y9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4908
Subject: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGVuZCBzaG91bGQgYmUgR0lDRF9JU0FDVElWRVJOIG5vdCBHSUNEX0lTQUNUSVZFUi4KClNp
Z25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS92Z2ljLXYzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy12My5jIGIveGVuL2FyY2gv
YXJtL3ZnaWMtdjMuYwppbmRleCA0MjJiOTRmOTAyLi5lODAyZjIwNTVhIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vdmdpYy12My5jCisrKyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKQEAgLTcw
Niw3ICs3MDYsNyBAQCBzdGF0aWMgaW50IF9fdmdpY192M19kaXN0cl9jb21tb25fbW1pb19yZWFk
KGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICBnb3RvIHJlYWRfYXNf
emVybzsKIAogICAgIC8qIFJlYWQgdGhlIGFjdGl2ZSBzdGF0dXMgb2YgYW4gSVJRIHZpYSBHSUNE
L0dJQ1IgaXMgbm90IHN1cHBvcnRlZCAqLwotICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JU0FDVElW
RVIsIEdJQ0RfSVNBQ1RJVkVSKToKKyAgICBjYXNlIFZSQU5HRTMyKEdJQ0RfSVNBQ1RJVkVSLCBH
SUNEX0lTQUNUSVZFUk4pOgogICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0FDVElWRVIsIEdJQ0Rf
SUNBQ1RJVkVSTik6CiAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwogCi0tIAoyLjE2LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

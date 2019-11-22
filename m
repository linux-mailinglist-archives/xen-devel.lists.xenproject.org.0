Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBE106747
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 08:49:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY3c0-0002Db-Iz; Fri, 22 Nov 2019 07:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cyae=ZO=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iY3by-0002DW-Fw
 for xen-devel@lists.xen.org; Fri, 22 Nov 2019 07:44:14 +0000
X-Inumbo-ID: dfaf4beb-0cfb-11ea-a346-12813bfff9fa
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfaf4beb-0cfb-11ea-a346-12813bfff9fa;
 Fri, 22 Nov 2019 07:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNx11GtA0Z3Cl4jQ1W6SuMeAdEPObpuL6LrtRXTR25OJXtq/JSq6pQr01lUzmmsl2cxLe4XoT2yYBRMTfypFvRj/My5Tm/0SY+wCdRo46vhZsDnRtfpMjmFQtZkasSkyouISlZlHw7KvZf18sF1PzvAhyseYWvM8BiiOBCqiKHQhCvqd1fUHoyCqPBMpJKc9vX9VoPczpSRQwpmwetegzf7hOMh4tbAgMS153W1Obt6EOme/TNwnb//uTioF9ay/pl+B4J7B2kJIR4GSX0fnTjXxikrQg2pnuRML1mbgj6O6Oi1+/Q5Hl+66ug7kUu6G56TzLT/woPF9+ivMjPoeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQOURUxil261Yr8eiRHq5OhflJZm3PhDYnhyhniwnmc=;
 b=OEjyoU8UQFpOBGqPnqBWW/CNlRdCXayusQ3uANWFxpLlff2VgE5jjtT+ilWt1R3yJ93hEDRD0uKUWkTJo4IEOyI4wZRy3v1tcxmgJW3dog609/0GVv7S01Pc0Rck+Pin37atlzIf99BBLijfAX0z1XLXdXckMkX+ZqqOEDX/oNeTaC9v0wgCIaTkqTRQT+zPF5M1Eo0/59NlabEdeQ4pTTw/+cT0AKaph11jcTnCkAu9hxZEVmudBm4tqOYVaM8zHustL8OcT3mJCbaC8dTJELrSX3fFtL8jV2ku2bckFkQiWjc8YdYeIaaUtGXkaa28pchq7oDRHXoKAM5n4EYusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQOURUxil261Yr8eiRHq5OhflJZm3PhDYnhyhniwnmc=;
 b=GUFIa35UpyGp103tZobQZvOwuH6VxRPaamIkr6YjxlPmg6ieqG7HYcMMR+iCzeMNdzQyw35TStLObjyMAbSzx4FPUjA/FP04vXZrcW1CdTf6xenkGLilcE4xbaeBfsy9/ZZ8IrozrnDBzo66SVvw6kY80bow1j7iETldtO4+75U=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4513.eurprd04.prod.outlook.com (52.135.149.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Fri, 22 Nov 2019 07:44:11 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 07:44:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com"
 <julien.grall@arm.com>, "Volodymyr_Babchuk@epam.com"
 <Volodymyr_Babchuk@epam.com>
Thread-Topic: [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER range
Thread-Index: AQHVoQigeBpkjI1AYkOsm95VpW/YYQ==
Date: Fri, 22 Nov 2019 07:44:10 +0000
Message-ID: <20191122080226.6817-1-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.16.4
x-clientproxiedby: HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::18) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 067e727c-dd55-41c8-913a-08d76f1fc334
x-ms-traffictypediagnostic: AM0PR04MB4513:|AM0PR04MB4513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4513BE86CBFD5D9BB9441E5C88490@AM0PR04MB4513.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(66476007)(66556008)(66446008)(99286004)(4326008)(86362001)(50226002)(81166006)(81156014)(8936002)(54906003)(2501003)(386003)(6506007)(110136005)(52116002)(66946007)(71190400001)(305945005)(7736002)(71200400001)(64756008)(14444005)(186003)(6486002)(26005)(256004)(316002)(6436002)(102836004)(2201001)(478600001)(2616005)(14454004)(44832011)(4744005)(8676002)(1076003)(2906002)(25786009)(6512007)(66066001)(3846002)(6116002)(5660300002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4513;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 888zzQ4VjKuf12Z/n47ePPTvsxKHfaH9V6GZz5ObTUjYx4sZa2Ww+wbbfj91/DECVVmnTOPndHScEICAncmJgJaVgG0JdpovMv6o3yj1qIlZMbtmiZBr3a+C5a2h5kIbA/JTI5MgL9ZwZrxU0QgY9SPKOpGjijIZMPuViuVkPVeQknEOfOJyBx+3rtrVH1WgvcY0dQbkO4k0cqk/S8BVrH97wCMuu/GdmbggrkcSRALF5WkMdYMYRm3qy6EqOEiXdmBuW9iHm0tTnBSFIKe791gr3mWcCR5A3ArKbLb38tmswYNclNTx9YsUejyS2VJWIHsl4WeE/mCUs+3qGo7HeAc0X7yDyDCE0QFq9tYkUoSEkp0BU0vT6sRkS3cGdgdcRnTKWbTaII8QMz/WcyUWNCpHufGND3MSBLh70O6+kvBTD+cItBazSWNeRQbFHrbS
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067e727c-dd55-41c8-913a-08d76f1fc334
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 07:44:10.9164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z58Yw3ywBuojyi08c1mFkCehDaMPvB2/892oLe4PRHXJw11fU4t6ROUHTt+723M3JhQ4ShGcQXeYf1t1eEK9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4513
Subject: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGVuZCBzaG91bGQgYmUgR0lDRF9JU0FDVElWRVJOIG5vdCBHSUNEX0lTQUNUSVZFUiwKYW5k
IGFsc28gcHJpbnQgYSB3YXJuaW5nIGZvciB0aGUgdW5oYW5kbGVkIHJlYWQuCgpTaWduZWQtb2Zm
LWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KLS0tCgpWMjoKIEFkZCBhIHdhcm5pbmcg
bWVzc2FnZQoKIHhlbi9hcmNoL2FybS92Z2ljLXYzLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3ZnaWMtdjMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYzLmMKaW5kZXggNDIyYjk0ZjkwMi4u
YTE1YjlmNjQ0MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMtdjMuYworKysgYi94ZW4v
YXJjaC9hcm0vdmdpYy12My5jCkBAIC03MDYsNyArNzA2LDEwIEBAIHN0YXRpYyBpbnQgX192Z2lj
X3YzX2Rpc3RyX2NvbW1vbl9tbWlvX3JlYWQoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0IHZjcHUg
KnYsCiAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwogCiAgICAgLyogUmVhZCB0aGUgYWN0aXZl
IHN0YXR1cyBvZiBhbiBJUlEgdmlhIEdJQ0QvR0lDUiBpcyBub3Qgc3VwcG9ydGVkICovCi0gICAg
Y2FzZSBWUkFOR0UzMihHSUNEX0lTQUNUSVZFUiwgR0lDRF9JU0FDVElWRVIpOgorICAgIGNhc2Ug
VlJBTkdFMzIoR0lDRF9JU0FDVElWRVIsIEdJQ0RfSVNBQ1RJVkVSTik6CisgICAgICAgIHByaW50
ayhYRU5MT0dfR19FUlIgIiVwdjogdkdJQ0Q6IHVuaGFuZGxlZCByZWFkIGZyb20gSVNBQ1RJVkVS
JWRcbiIsCisgICAgICAgICAgICAgICB2LCAocmVnIC0gR0lDRF9JU0FDVElWRVIpIC8gNCk7Cisg
ICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwogICAgIGNhc2UgVlJBTkdFMzIoR0lDRF9JQ0FDVElW
RVIsIEdJQ0RfSUNBQ1RJVkVSTik6CiAgICAgICAgIGdvdG8gcmVhZF9hc196ZXJvOwogCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

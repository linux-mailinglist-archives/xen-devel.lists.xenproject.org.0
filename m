Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3729B673
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 20:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1EcW-0001lx-5X; Fri, 23 Aug 2019 18:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZL1=WT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i1EcU-0001lf-A3
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 18:49:06 +0000
X-Inumbo-ID: a741ae0e-c5d6-11e9-adef-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a741ae0e-c5d6-11e9-adef-12813bfff9fa;
 Fri, 23 Aug 2019 18:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad5fKwy9DG2nwsbGrXpelTmd9x5ALVRKqIB309j716g6n0FsjC4rDqIzH34Vh7WJRLrQ3xf63jrHX2TsT7RIteqEj+Psj4s+0664sgwZ76N8+dNaRoa48idJ0xpwnQfSgCgpF/9qsPUnXQAMgFUquNgrPuOVf1VJKKqrkQ3FwYsSWfoqsGeOz6sx65hg/b9BpviklkaDPypew5ilEViKa0xmU7+UdBFrSf5Zbo8hDIcaJKb0DzkA97DzH9QDsM4UqOpdNrIewzjE+l93n6GFXI3cXTdvWvnvcKONlQnT94tpGWtw+Knr0FLf1pcslNXLqjkuNx7g148ZVkZ/lMJNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKNlUydcpEIc21n2004Y8GBYZPuUKMCqVcPOcbw9S2U=;
 b=T/Rkr9huJUvBJuxLTFnA6daCtD4iq4cHg7YsrncCcqGn6IJu3zu+8zdK2ydt9D4EIS+VaXExsP8n5vk6IS7dMsPa5KivR0UioP8Oj1iAD2LlyezJWYEkHhTtSInNrOKRoWc3ey/SZcvgkmT3bb0JRa4N1RdUp+rOBjlBTw4mNL5wHWRlYxbI/bTVIL+5Z9DoxyGPpXQBQnPin2DHSiOOutB7vy+MCyUGzRvduCgv9H0iBbtATLJV+9uD17pnO6uiaGfYY+crViMssZAT2V2tMUWvbZZHVQy4QnHhApWhUFWaQb8kYCbapgoemLuquKvBHM6Gba13/mAEbWM2iPVmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKNlUydcpEIc21n2004Y8GBYZPuUKMCqVcPOcbw9S2U=;
 b=TeR4bJXEX8b9Dy8IGAMwfNFlxCqjA0hcFMa1Of1fl0SPOEIqa61rzo2ORT5LmjQyi0V6/o8NKK1TdxOdy1lJxy3ZJgXid4+2McGUpqAkMdY5sVjN0i2tL5AotT5L+cRZGPsP8Q3JJYO2doHfTDd8ARInylrKl5ms/vYKr245MuFCXhfhxlEcfsH6H3iqEaun8Jk6Atche1qvtQXRJ7Os3d1CcHMg6WrWmf1FyvMA4IvAjjW45i588uySytWLH/9/U9Qh1Ipu6sRTvr6cdkx8arrGMrSCgdXmRQeEOrbcpx1yT/mypTIkBYNoHhhxPDHJGJuuK8dlmJIUyscFiB3HTQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4690.eurprd03.prod.outlook.com (20.177.41.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 18:48:51 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 23 Aug 2019
 18:48:51 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 5/5] xen/arm: optee: remove experimental status
Thread-Index: AQHVWeNoGYDEXCwUxUmqcOQgXXsTCA==
Date: Fri, 23 Aug 2019 18:48:51 +0000
Message-ID: <20190823184826.14525-6-volodymyr_babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f6acd41-71b4-41b4-c8f1-08d727fa8aa4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4690; 
x-ms-traffictypediagnostic: AM0PR03MB4690:|AM0PR03MB4690:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB46901545CA4D6E04F6D6F461E6A40@AM0PR03MB4690.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(189003)(199004)(6436002)(305945005)(25786009)(76176011)(81166006)(71190400001)(478600001)(7736002)(81156014)(966005)(5660300002)(8676002)(71200400001)(4326008)(186003)(6506007)(99286004)(2351001)(6486002)(1076003)(2501003)(26005)(2906002)(6916009)(66446008)(55236004)(66946007)(91956017)(14454004)(76116006)(66476007)(66556008)(36756003)(64756008)(6116002)(6512007)(446003)(11346002)(107886003)(3846002)(476003)(6306002)(2616005)(316002)(54906003)(86362001)(80792005)(102836004)(5640700003)(8936002)(66066001)(14444005)(486006)(256004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4690;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QTjXemp9Q3t2vUWYnD57tUU9tEgfJnFvCUkIEgOUpNXvBmIKjTMb2/XWKMMeKgakR8X84SMaNhYL+k6awm9/ozBNsqE82vxWoClgdHWzd6ecsU2/THIoxBxBRkaPahUMIjEzrfDdhz4cWHa/yLyxxO6RKcnZwk202R+fcFcB9UpzgmUK0yXPqzARcEV/4s2tI2Qfc8JORMF23HIDdXCitoADTPlhr+GtsLyLwquG6X8zvv3jTDYM58/4ElPv15lXhT5cPHStS9tDKilASmCcYyoP/4mvbnhS28U/6KIg3D2nRUpcLQhJKFb3MxOK+NNRQfXwFQmJA/yDqVd9erfH912U2/qDsoRtzxWf4ZclKsfk2pXoXcOc4E5toOHxYX/iGJajn8nP0z3iwDvLBBnas+SMnMXY3Rzh9I7Ma8VL3hM=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6acd41-71b4-41b4-c8f1-08d727fa8aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 18:48:51.6697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7KOIc+E10xH5/9iS1skpVY5PpfiqG+tBYQ87JXh959BpPAUJFaDQYvO8nVk92tkRiI7kzNKrQt7YvOY95DIk+LUAUIubqPIgNTzy22Pu68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4690
Subject: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental status
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

QXMgYWxsIFRPRE9zIGFuZCBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWVzIGFyZSByZXNvbHZlZCBu
b3csCnJlbW92ZSBleHBlcmltZW50YWwgc3RhdHVzIGZyb20gT1AtVEVFIG1lZGlhdG9yLgoKU2ln
bmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29t
PgoKLS0tCgpOb3RlIGZvciBtYWludGFpbmVyOiBvYnZpb3VzbHkgdGhpcyBwYXRjaCBzaG91bGQg
YmUgY29tbWl0dGVkCm9ubHkgaWYgYWxsIG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJl
IGNvbW1pdHRlZCBhcyB3ZWxsCi0tLQogeGVuL2FyY2gvYXJtL0tjb25maWcgICAgIHwgMiArLQog
eGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25m
aWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZwppbmRleCBjMmRiMmE2OTUzLi45YjM1NzgzZjY4IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZworKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZp
ZwpAQCAtMTA3LDcgKzEwNyw3IEBAIGNvbmZpZyBIQVJERU5fQlJBTkNIX1BSRURJQ1RPUgogCSAg
SWYgdW5zdXJlLCBzYXkgWS4KIAogY29uZmlnIFRFRQotCWJvb2wgIkVuYWJsZSBURUUgbWVkaWF0
b3JzIHN1cHBvcnQiIGlmIEVYUEVSVCA9ICJ5IgorCWJvb2wgIkVuYWJsZSBURUUgbWVkaWF0b3Jz
IHN1cHBvcnQiCiAJZGVmYXVsdCBuCiAJaGVscAogCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBnZW5l
cmljIFRFRSBtZWRpYXRvcnMgc3VwcG9ydC4gSXQgYWxsb3dzIGd1ZXN0cwpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnCmluZGV4
IGI0YjZhYTI2MTAuLjBiNDYzYmEzNjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS90ZWUvS2Nv
bmZpZworKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcKQEAgLTMsNyArMyw3IEBAIGNvbmZp
ZyBPUFRFRQogCWRlZmF1bHQgbgogCWRlcGVuZHMgb24gVEVFCiAJaGVscAotCSAgRW5hYmxlIGV4
cGVyaW1lbnRhbCBPUC1URUUgbWVkaWF0b3IuIEl0IGFsbG93cyBndWVzdHMgdG8gYWNjZXNzCisJ
ICBFbmFibGUgT1AtVEVFIG1lZGlhdG9yLiBJdCBhbGxvd3MgZ3Vlc3RzIHRvIGFjY2VzcwogCSAg
T1AtVEVFIHJ1bm5pbmcgb24geW91ciBwbGF0Zm9ybS4gVGhpcyByZXF1aXJlcyB2aXJ0dWFsaXph
dGlvbi1lbmFibGVkCiAJICBPUC1URUUgcHJlc2VudC4gWW91IGNhbiBsZWFybiBtb3JlIGFib3V0
IHZpcnR1YWxpemF0aW9uIGZvciBPUC1URUUKIAkgIGF0IGh0dHBzOi8vb3B0ZWUucmVhZHRoZWRv
Y3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWwKLS0gCjIuMjIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

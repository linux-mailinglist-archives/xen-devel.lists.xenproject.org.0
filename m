Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A6C0470
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoXJ-0007cF-5w; Fri, 27 Sep 2019 11:35:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDoXH-0007c3-Df
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:35:43 +0000
X-Inumbo-ID: efa625d0-e11a-11e9-8628-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.57]) by localhost (Halon) with ESMTPS
 id efa625d0-e11a-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 11:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEb4bHUfeAMyvkJ+fo4mk7H3nlUbtxOAO1T+98GE76L9MaprlQB99PNFUf9h0xEVNpc7PzXr6Gj4Y+0uJ81p+dfktikSqyPqppkd2xGdavJlUO/QhVO2T/8iH39mnIbLlmh6Hmpopit/HaxAcoMflSs1BUD88MqAGg7xqQ6lztBt/3mkHJjPuusIWP7VPBtCKqKMeMxe7wWuw7/RVxSMMQhwZpzdD+so896xhTwamKYTgvaN5//Y/jstJ4adKOjWIURMbSr1NOiVHRPW2/UNWgrum0xKcUKEzPqhZxlRGGWSaCwV/sodjmI6upPh7RrAhAhVMRZLWO3dv4ebPKYiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKMO4sNTPg6uRvjclDiIrzWJscoaScmbNIRYnmfOe0c=;
 b=aYWzmXhRFPGKDYDa1+E/K52QYwu/VVYpUoIawUciFDtTl6l2B6vlEV9Js76CUUThTRSvtDY7fSVl5S/qnhMoaE4jKAN2Qu2wb+CIBPeE5dptS8GdFzmQkRpNEyoQMjEOjz5/+YtIjQnORyPL3DSELqOTpbcwmDJjKOc7M3QzUeQ1ickgPOmnhI2PumXa21/WjGQbQP0TW3McqppJj3CW/U1d9y946FeVtT+Bd8nnoNUijZtTlToF7LaxvaKILiSxvN0G5gGdAeo5ca9qxB4Qin00ib0MoQW/JjaZDEaMhVF3PHJxEGB+zQuE6dETiRHmSBT7MBDKLTa3JyjxWM42UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKMO4sNTPg6uRvjclDiIrzWJscoaScmbNIRYnmfOe0c=;
 b=j1u84OVhpKmH1lcT038aaCr8FRJzDhAuec5RW73Tbm/yAJVwu+7xqerBJs/YK5Ibm2O5hpDp25Z1jmxxhN1+jh+S5+DLN91jbVgZcyA+8Resk6u6bd3c6TiEd/EjkVSQojWqO40YjfJtR2OTUeOttvAxqsPZYsTjBIm4ubm9Kn4=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4276.eurprd03.prod.outlook.com (20.176.214.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Fri, 27 Sep 2019 11:35:41 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:35:41 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 02/10] xen/arm64: head: Check if an SError
 is pending when receiving a vSError
Thread-Index: AQHVdJmSJrxE3Qm/3EG8DE9qdUJxVqc/Zi0A
Date: Fri, 27 Sep 2019 11:35:41 +0000
Message-ID: <8736gi9dkj.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-3-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-3-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bd433eb-327f-475d-d6d7-08d7433ed37b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4276; 
x-ms-traffictypediagnostic: AM0PR03MB4276:|AM0PR03MB4276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4276EA727BB87F45D9FDC644E6810@AM0PR03MB4276.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(186003)(71200400001)(71190400001)(305945005)(4326008)(76176011)(6512007)(6506007)(2616005)(476003)(5660300002)(6436002)(6486002)(55236004)(14444005)(6116002)(81156014)(256004)(486006)(25786009)(36756003)(107886003)(99286004)(54906003)(14454004)(102836004)(3846002)(76116006)(80792005)(8676002)(81166006)(66066001)(66946007)(86362001)(66556008)(66476007)(66446008)(446003)(7736002)(2906002)(6246003)(26005)(6916009)(11346002)(8936002)(229853002)(478600001)(64756008)(316002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4276;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fSCBDRA03tMl2cGAHSYRwxcBJti9f6Uv7ndbkJihiHTAOqz16nUdL0FYojos6UcnbGlru+RKXzTKywEfWXFBZjJ9kW3ab/P75AB+wwYBnM5L10uTbTzWpT0+jdoBgPDJtnq7atHFXHOBwH/nhl6qLCDLHlNsfZ25NXMKTyCYUc9Bj4XJH+7bHUbe435DKtVd4bYRT8Gfgl+hdzdLTw0aBqHHVrrxAZEVDpClYbAXG9Y8c199lBJqn5inuBRi4mtQICn1wzH9RzQIpi1Xio1UTlUSzlBsJuFaSBKInyCC5kL+5vInNXau11cxcjQK3jpCQDZTRkBso7t6nh9ZKVOXLDK8CL6ia+8GFNMfxjqXTYWMtwADjkGY0AUsiAsWMcPopSXU+qHd63eGEgryIFZYM4H2kpNZ3s3EzkWO7G0fXnA=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd433eb-327f-475d-d6d7-08d7433ed37b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:35:41.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiyIcD5z8/lIO2JTjkrDpwShgcnw4d3aAdPGM/HuDHSlwDXDtPbbpog9A+tp+DK5wtxnPYBF1HWAd7Nq8hdG5Gb+8hsoe4dG8zhKpEiJl1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4276
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 02/10] xen/arm64: head: Check
 if an SError is pending when receiving a vSError
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIHdoZW4gd2UgcmVjZWl2ZSBh
biBTRXJyb3IgZXhjZXB0aW9uIGZyb20gdGhlIGd1ZXN0LCB3ZQo+IGRvbid0IGNoZWNrIGlmIHRo
ZXJlIGFyZSBhbnkgb3RoZXIgcGVuZGluZy4gRm9yIGhhcmRlbmluZyB0aGUgY29kZSwgd2UKPiBz
aG91bGQgZW5zdXJlIGFueSBwZW5kaW5nIFNFcnJvciBhcmUgYWNjb3VudGVkIHRvIHRoZSBndWVz
dCBiZWZvcmUKPiBleGVjdXRpbmcgYW55IGNvZGUgd2l0aCBTRXJyb3IgdW5tYXNrZWQuCj4KPiBU
aGUgcmVjZW50bHkgaW50cm9kdWNlZCBtYWNybyAnZ3Vlc3RfdmVjdG9yJyBjb3VsZCB1c2VkIHRv
IGdlbmVyYXRlIHRoZQo+IHR3byB2ZWN0b3JzIGFuZCB0aGVyZWZvcmUgdGFrZSBhZHZhbnRhZ2Ug
b2YgYW55IGNoYW5nZSByZXF1aXJlZCBpbiB0aGUKPiBmdXR1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5
bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKLS0gClZvbG9keW15ciBC
YWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

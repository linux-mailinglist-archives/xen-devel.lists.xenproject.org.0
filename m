Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205417C89B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 18:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrP6-0001pl-SC; Wed, 31 Jul 2019 16:24:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdxT=V4=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hsrP5-0001pg-J6
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:24:39 +0000
X-Inumbo-ID: b06fe8a8-b3af-11e9-9274-739c9f511046
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b06fe8a8-b3af-11e9-9274-739c9f511046;
 Wed, 31 Jul 2019 16:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI0svGeEjyH5LQFvZCmXchnl3Xj0+tvAleEOO1XVtHfGQPAFzwxVuhL8swVYXwUQwVcbj9M/82XI+/HSTDFQ8n5LMvCAELsH77cwSUJI3xezvjMhOrz/bL/5XLpnz6MHDBrB7nDrQm3SY1WhAsdSv/bbCYScKugB2XhDNyuxAk0m3m5tzE81a1fm/2ZjF5mji6XP9LQU28B1P4f8UxIiwN9Mh9Bg6kdQwhca7+GV84gfoih0JGvBOYXibBjJ7S+xyaVhQdx4z0OWBh9nMpngMLVj1zW/EqVZv0UK1z/v+j+c0oPOXO+m2YuZeoLZHNfF1OjjgQDv3ghltkA4dzlu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4Icszp+qMBGi4WXCocZNRIFeB0s66xmS2xeoK537P4=;
 b=VydJ4MjIUidSyI7oHJ8h1RxCz44LKUX2qZTB5IDCJonUJxb9dGe7fOM58eNcIEMSogkcEZu+eXCmujdVczlHNIKYBjQYROBSOJECdQxUmdphCMDZE2esC52x2yIhH2lRbfXOxG3My6VkJjFxTKN3vmFJ4/2GeuDSce/af6y+R0QHrUzjQJnzq7lT2uDxuU4+UgHiCauNkTZktYHZCzvpDtC1kbSqyRG/EJJCIjXriOopMeMZvbYv58iogP4JRsaORKJrNR/wti9N+xP04ksieWXNu/4xQ11fCc0RwCN7pm2i982slkKRcgY0iJWv4UYkbC/49LDZoTbQ0fSD1jZfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4Icszp+qMBGi4WXCocZNRIFeB0s66xmS2xeoK537P4=;
 b=OPubfq2TZYVEKrVwCgrMyrL0ztTOQAwoPDYHdrJw1AfUcJqCXaA9uBuQaJhMJWrugX9dTdxab8yLLgYdYg6MyKBc2ENB0jqmd3DV7xPLW57o/MKdaS2ZprD/f6XSh62qbnNNEoA43H9KZwnfSBg8dLpM4TWBKdK8M9FtJNGymKuGwIGYcLPWzH4wcT7KAyE6s+4x1RaeiuOkEPJrVksNwFT/GDTrX2UlbGriBFWy5cb4LE3a/x4k0uOVRrAjExv27dAKuhsQz3sXelA8uejWh0crLjPXpuEvQqar7ctx7UU/MqS1otx4pWfXtTIN9UbCZ6xZ3e+XU5r+UvbWxEySpA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6097.eurprd03.prod.outlook.com (10.255.31.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 16:24:36 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 16:24:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] CODING_STYLE: clarify function argument indentation
Thread-Index: AQHVR7xxvb8iYZ/UOE68NI2ovvNVUw==
Date: Wed, 31 Jul 2019 16:24:36 +0000
Message-ID: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d06bcf0f-28f1-4f8d-9370-08d715d39419
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6097; 
x-ms-traffictypediagnostic: AM0PR03MB6097:|AM0PR03MB6097:
x-microsoft-antispam-prvs: <AM0PR03MB6097DF3C5FFF964B44C5977FE6DF0@AM0PR03MB6097.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(199004)(189003)(5640700003)(4326008)(8676002)(81166006)(6436002)(81156014)(2501003)(8936002)(478600001)(6486002)(6116002)(256004)(7416002)(54906003)(3846002)(2906002)(7736002)(305945005)(25786009)(14454004)(316002)(86362001)(2351001)(6916009)(71190400001)(71200400001)(99286004)(66066001)(36756003)(1076003)(5660300002)(476003)(2616005)(6506007)(6512007)(80792005)(186003)(91956017)(55236004)(26005)(66476007)(66556008)(64756008)(66446008)(102836004)(76116006)(66946007)(53936002)(68736007)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6097;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cSPBPq6JDQEGUe6iK2s5gLKp1fImIsP67x3iYxqIH6mgynYWS3kNy+D1TPrveYYp5aTkUuWHHj8Gyk6sUsREt71ZUtbO2jQPaIXyOjg+E9iCqxG1r8afV+RtGc4oBGqTzTD6Fy5Ic23FxXZoGB3yVkPeSMQnNs+p707CaVbfPSGdJ1iRaOOTEYYDnqdDViy++Hu8Y+tm52TDDi+JMQGZBictMpNSYRa4GIkod+XsaKx3Jg3dOQr6pPRSWnPxs7JtIX/9kbdIJ0G+QkZkkw/Z/X7oB0aKpM0preFUqispClWHlbXBX3BuAleu1FiW1RRr4gf+rVDVGl+X++svS027isKXORDdDvTxv6KqNvm30wOoAZT0zFbSECFKpKrumQCWPqa6IWNhyUJQzwLwivLHPTzuSfH3JWi5odx4ZUsgBBs=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06bcf0f-28f1-4f8d-9370-08d715d39419
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 16:24:36.1792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6097
Subject: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGNvZGluZyBzdHlsZSBydWxlcyB0aGF0IGFyZSB3aWRlbHkgYWNjZXB0ZWQgYnkg
Y29tbXVuaXR5LApidXQgbmV3ZXIgd2VyZSBmb3JtYWxpemVkIGluIHRoZSBkb2N1bWVudC4gTm90
YWJsZSBleGFtcGxlIGlzIHRoZQpxdWVzdGlvbiBvbiBob3cgZnVuY3Rpb24gYXJndW1lbnRzIGFu
ZCBwYXJhbWV0ZXJzIHNob3VsZCBiZSBpbmRlbnRlZAp3aGVuIHRoZXkgZG8gbm90IGZpdCBpbnRv
IG9uZSBsaW5lLgoKVGhpcyBxdWVzdGlvbiB3YXMgcmFpc2VkIG11bHRpcGxlIHRpbWVzIGxhdGVs
eSwgbW9zdGx5IGJlY2F1c2Ugb2YKb25nb2luZyBlZmZvcnRzIHRvIGNyZWF0ZSBYZW4gY29kaW5n
IHN0eWxlIGZvcm1hdHRpbmcgdG9vbCBhbmQgYmVjYXVzZQpvZiBuZXcgY29tbXVuaXR5IG1lbWJl
cnMsIHdobyBhcmUgbm90IGF3YXJlIG9mIHN1Y2ggdW53cml0dGVuIHJ1bGVzLgoKQWN0dWFsbHks
IHRoaXMgcnVsZSBpcyBhbHJlYWR5IGltcGxpY2l0bHkgZGVmaW5lZCBpbiB0aGUgZG9jdW1lbnQg
YnkKZGVmaW5pbmcgZW1hY3MgY29kaW5nIHN0eWxlOiAnYy1maWxlLXN0eWxlOiAiQlNEIicuIElu
IHRoaXMgbW9kZSBlbWFjcwpsaW5lcyB1cCBmdW5jdGlvbiBhcmd1bWVudHMgdW5kZXIgdGhlIGZp
cnN0IGFyZ3VtZW50LiBOYXR1cmFsbHksIG1vc3QKb2YgWGVuIGNvZGUgaXMgd3JpdHRlbiBpbiB0
aGlzIHN0eWxlLgoKU28sIGxldHMgc3RhdGUgdGhlIG9idmlvdXMgYW5kIGZpeCB0aGlzIHJ1bGUg
ZXhwbGljaXRseS4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJf
YmFiY2h1a0BlcGFtLmNvbT4KLS0tCiBDT0RJTkdfU1RZTEUgfCAxNCArKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9DT0RJTkdfU1RZ
TEUgYi9DT0RJTkdfU1RZTEUKaW5kZXggNmNjNWI3NzRjZi4uNjQ3OTIxNWExNSAxMDA2NDQKLS0t
IGEvQ09ESU5HX1NUWUxFCisrKyBiL0NPRElOR19TVFlMRQpAQCAtNTMsNiArNTMsMjAgQEAgTGlu
ZSBMZW5ndGgKIExpbmVzIHNob3VsZCBiZSBsZXNzIHRoYW4gODAgY2hhcmFjdGVycyBpbiBsZW5n
dGguICBMb25nIGxpbmVzIHNob3VsZAogYmUgc3BsaXQgYXQgc2Vuc2libGUgcGxhY2VzIGFuZCB0
aGUgdHJhaWxpbmcgcG9ydGlvbnMgaW5kZW50ZWQuCiAKK0ZvciBtdWx0aWxpbmUgZnVuY3Rpb24g
ZGVjbGFyYXRpb24gYW5kIGNhbGwgZWFjaCBuZXcgbGluZSBzaG91bGQgYmUKK2FsaWduZWQgd2l0
aCB0aGUgZmlyc3QgdGhlIHBhcmFtZXRlciBvciBhcmd1bWVudC4gZS5nLjoKKwordm9pZCBteV9m
dW5jdGlvbl93aXRoX2xvbmdfbmFtZShzdHJ1Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0
MSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxlbmd0aHlfc3RydWN0
X25hbWUgKnN0cnVjdDIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBs
ZW5ndGh5X3N0cnVjdF9uYW1lICpzdHJ1Y3QzKTsKKworb3IKKworZnVuY3Rpb25fd2l0aF9zb19t
YW55X3BhcmFtcyh3b3JkeV9wYXJhbWV0ZXIxLCB3b3JkeV9wYXJhbWV0ZXIyLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB3b3JkeV9wYXJhbWV0ZXIzLCB3b3JkeV9wYXJhbWV0ZXI0KTsK
KworVGhlIHNhbWUgYXBwbGllcyBmb3IgbWFjcm9zLgorCiBVc2VyIHZpc2libGUgc3RyaW5ncyAo
ZS5nLiwgcHJpbnRrKCkgbWVzc2FnZXMpIHNob3VsZCBub3QgYmUgc3BsaXQgc28KIHRoZXkgY2Fu
IHNlYXJjaGVkIGZvciBtb3JlIGVhc2lseS4KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

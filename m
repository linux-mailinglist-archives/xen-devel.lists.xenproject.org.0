Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3BB6B11
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2s-0006LT-EM; Wed, 18 Sep 2019 18:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2q-0006Kf-B7
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:51:16 +0000
X-Inumbo-ID: 44f995da-da45-11e9-a337-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44f995da-da45-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 18:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjO/oaWLiqnM9g5n03u/3T8FGlaKQM98vl60M6a2Qp2mQIKnmKH3zC+Yr2jsnowK+l/ZFK5xvfu9Rsqmkv5DF0CiyHXrur/zNTjauzfFh6O6mpiKO6+xGcQkQk567qSNdl0KswezaGXjPr4wg6ME2GEPxzoDMCMQjwwhyU38Qc+T26kkWt7qnzWKXger20oQO2J4MMmtTZABBL0qas8ZcpXSLOEhc/7TB5n+rxIAas50i5JHzhqLbzTXrKy6l2EmXx0gwebKxATZq8CAachLGFmZdlAcWSeo3ob3hwba/4nKrA9qvFIxEJ9Ssc68V5Fx1kOJj2DaxGpKTPQqsPy9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeWvlhtWuBD4ntb7QEGBTsN2iWtPfNci12MkBpwkoxg=;
 b=jB3qpBVgqdDFSWXhTOsTwLkbSdnAD5qjAyh4r2Zut3Kd5AcnAHfjkWpYr7kQba6pfT9m8tqD7Z8gmwxo+S/nXFWhNpZlpKelu9VH7phHze3NwG0JqvwNE5bFsqY9IKEXBw0rraSa06340Xd6H5G1BDBkcpWv4agB6sk+AApLVA2MJdue8XYsy4x3lzGMWQ/4ZcWHICa2qE2kzp40/S2uzdXIzq3QGRBnvHIuJh40J0cBGvdF4fbRypcmA/wNpgDgbVyrn+IXGHqvk8PPlsHriD2UdQTk/1pefZSK9k1c31dqgpQpKxo3N744MH+sbBO65L89ekK9z9URWQUDmW5VkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeWvlhtWuBD4ntb7QEGBTsN2iWtPfNci12MkBpwkoxg=;
 b=JgtcfhS8AJWA3T7B4744/TKCGE+xo1UsgluM5/NdTxQxmlQ+SqaPk3dlP4YJk82kiMMP7R2iajNJlQaVDQTj8C5JP6xbPcOUKyvX+CgyAnvXze/fnP65Zn6EtOefekBJTFFDLQdsft+qusXhANJuR5LBjV/LwQ2xm8/z2r08Ka4=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:51:05 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:51:05 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 5/6] SUPPORT.md: Describe OP-TEE mediator
Thread-Index: AQHVblIGqnn1V5za7UCJVAcfeG8CpQ==
Date: Wed, 18 Sep 2019 18:51:04 +0000
Message-ID: <20190918185041.22738-6-volodymyr_babchuk@epam.com>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab811c8e-ca41-457e-b2ca-08d73c6928e1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5761A388718F5142F231075DE68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(11346002)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(4744005)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(7416002)(66946007)(36756003)(476003)(446003)(4326008)(316002)(6436002)(76176011)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jh3OiARshy6W5f8qV49KN1usX4g8v8WcGyLDzMy82SRWtDiNiIvtH88ugrwkEdgLm3/Xlh/iIvuWpK199t1GP18F3ihAegOnQOS3pXP5j56cZdB+Nt5GmEhxWCXNTNv547edeC2ZcsNG+tgjucS1KePgOjHs9DPByAf4GApSUkUFEU3CLSiDW4aCsnAH7ND03Vmvekm08I7mx6Tj/x8tqBiup08W30/27bloRheTu65f5pg92br+re0A4RIBXjAR9u9nBOsQ58PcrwoEkoEmu27+eda5oCUMvuF7NPx9mESasBNX65ytzWnKufuZoaQCb+0e5cNgUNfFLtmeIYBommwQG+LNID2ZsAIIEamZesMurh25XWoHEwKOSxxob+l9fFSizkrILMu3OlhhkbDuf1HgiiWEhneRLuLtzqz9VJo=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab811c8e-ca41-457e-b2ca-08d73c6928e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:51:05.0047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUAl3bW1nPmK0XZ1R670Xai476J+Y3E0N4Tgokt7Zol9t4XQK4J5la9F/stn/emndythkUKi/J4kXMJ1zswySrnlOhEg9lUgQzg9Ad4EIwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 5/6] SUPPORT.md: Describe OP-TEE mediator
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCB0aGUgbGF0ZXN0IHBhdGNoZXMgdG8gdGhlIG1lZGlhdG9yLCBpdCBjYW4gYmUgY29uc2lk
ZXJlZAphcyBUZWNobm9sb2dpY2FsIFByZXZpZXcgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KCi0tLQoKTm90ZSBm
b3IgY29tbWl0ZXI6Ck9idmlvdXNseSB0aGlzIHBhdGNoIHNob3VsZCBiZSBtZXJnZWQgYWZ0ZXIg
YWxsIG90aGVyIHBhdGNoZXMgaW4KdGhpcyBzZXJpZXMuCi0tLQogU1VQUE9SVC5tZCB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL1NVUFBPUlQu
bWQgYi9TVVBQT1JULm1kCmluZGV4IDM3NTQ3M2E0NTYuLjhkNTBhNzJkY2IgMTAwNjQ0Ci0tLSBh
L1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAtNjYwLDYgKzY2MCwxMCBAQCBObyBzdXBw
b3J0IGZvciBRRU1VIGJhY2tlbmRzIGluIGEgMTZLIG9yIDY0SyBkb21haW4uCiAKICAgICBTdGF0
dXM6IFN1cHBvcnRlZAogCisjIyMgQVJNOiBPUC1URUUgTWVkaWF0b3IKKworICAgIFN0YXR1czog
VGVjaCBQcmV2aWV3CisKICMjIFZpcnR1YWwgSGFyZHdhcmUsIFFFTVUKIAogVGhpcyBzZWN0aW9u
IGRlc2NyaWJlcyBzdXBwb3J0ZWQgZGV2aWNlcyBhdmFpbGFibGUgaW4gSFZNIG1vZGUgdXNpbmcg
YQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC653B6B23
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 20:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAf2w-0006O8-Pt; Wed, 18 Sep 2019 18:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cKO=XN=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iAf2v-0006NS-AD
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 18:51:21 +0000
X-Inumbo-ID: 46790abc-da45-11e9-978d-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46790abc-da45-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 18:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h55enY2AF+bLBBSdmrlZlUV27GcQ0kW5AsX6FjNcUHEVhR6Lq6Ebl+ycjwbsSgR1bxsKrZ/mIrnbZZxGlsu48+aPgxQK2vUV/FyqXlDDhQ4CYCqL/K8ha17CeWZFpuGWRU0QBx3Wb0XNaCEh3XaFg/RONiJ/3RAhVEqJ/wQPgPvMPlV6ptwCv4MEoMl4VPaq3ZMb0XhQUpllqItu7heK2mQhq0N4/hSOavjP3pyJwCd6W5LAIdMComfRJWgTIQQmgLK6GY3A33HNhq+G1JKmaRWmXTMdjve2UKBh1+JovPbMkLFJKcxRDhIh9H3G6ZT4bN2tIWYGOW9tpW6y3iCYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCVoa2GAD67/GurLR3WHoCdGmxTn0Rmps4y56oV/E2s=;
 b=ZRSSp8KaPECAjQ26rrM1TkzC9fcabIOqHgBO71YY4TPsgq7IlB0K0TCOZ4f+5oMTkos3hp1bNPuajUiguJPKBE9WrC1J1tlODutsk9r9mqiDB3N6EH0GPu/aWyQt1DgZ6JSmn04TDVURFplfyqNy3kinUKsDM/TtHJf6wmGiJ9/W80CXAX0Gi1qJIwae6GzvpnmByNfDE3VgmtuLSme9I0GaBSIP6wNvqwQvqSsU2Pz9Z5oF6gwm8rxi30A+1p9CMe8bcNGkkWiraAFiy1YOvIzovxeULU/KTRsSLjpVYcKRj1w9F7kM8P2KBvNFj4k3UjMiJrxGzDufSFOJw+wu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCVoa2GAD67/GurLR3WHoCdGmxTn0Rmps4y56oV/E2s=;
 b=GMo9Sc3HKaBNHBd3DcduRenCpubMXS8NgeUIdxPQkmFMearchJ7rPTaU+qt0J1GXg/r6U6+KLRVMLXL+YvdA7N1rPVmAd6LC6tOIkMZ4kJgPq5rT9OVy+fePgnl+OAWIwK1eXD/8sQBTiQZBfCYC9Jd9ZvdcmFyfTkU3j7XQheA=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5761.eurprd03.prod.outlook.com (20.179.252.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 18:51:07 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 18 Sep 2019
 18:51:07 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 6/6] xen/arm: optee: update description in Kconfig
Thread-Index: AQHVblIHV7dQjvLf+kWDWtyVMQZofA==
Date: Wed, 18 Sep 2019 18:51:07 +0000
Message-ID: <20190918185041.22738-7-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 812e6c6d-b940-4145-0b8e-08d73c692a3a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB5761; 
x-ms-traffictypediagnostic: AM0PR03MB5761:|AM0PR03MB5761:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB5761C81060D684A42FFBE450E68E0@AM0PR03MB5761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(66476007)(6116002)(478600001)(14454004)(66446008)(80792005)(2616005)(55236004)(8936002)(966005)(6306002)(66066001)(5660300002)(2501003)(81156014)(305945005)(7736002)(81166006)(66556008)(8676002)(256004)(71200400001)(14444005)(15650500001)(71190400001)(99286004)(54906003)(1076003)(86362001)(26005)(11346002)(6512007)(5640700003)(2906002)(186003)(102836004)(3846002)(64756008)(76116006)(2351001)(91956017)(6506007)(25786009)(486006)(66946007)(36756003)(476003)(446003)(4326008)(316002)(6436002)(76176011)(6486002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5761;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1yg2kTi++b3M62QcKj4rdGH1BBaM7CB/xhSHYcpXOuB+OZfoBE4MZVjRMFwOLMrZCWHHzC47Pl1+mI8/aO6eJD2v1+vRbI0G8FJh6zhy1zw7JVmHmTiuueaoqSqPOyofttNBFFSFY9hc+7G6FTkvvM4b9IWQF3pOoqm8YTYV3L3N8J099tjoUhC13943agUqI89XNolyMBfSnYZdahEl46agtbG8ueFs6RXuKKe/NB/wZBbfoU7PsMtAYVx6f5AZs0rT6m+MZCv3HlBwIgOVnVngdvpZVEtUaJ4bsbW6drXIqVJQdSS14ZFfdt+kuBwEawRvI/f//H6XKJSDovVjrmyBezwiqitsPksOGby2ZydnULiNQP6zsD5Rq8b8bkIvdYybg8jM8TTk2GlcZJYZE55JDyUJ2fKDmlMGWDdOF+8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812e6c6d-b940-4145-0b8e-08d73c692a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 18:51:07.3044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4aCS8McfLmrH5SfCTCrQllp0YTkZI4DKfbQSmUBmiaJKwQg/g+RlU7OAmXYgZjKVBmkJzTBOLNUaJuwtbTj7YO52Ad7GtgAtnmRCD7jokE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5761
Subject: [Xen-devel] [PATCH v2 6/6] xen/arm: optee: update description in
 Kconfig
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

T1AtVEVFIG1lZGlhdG9yIG5vdyBpcyAiVGVjaCBQcmV2aWV3IiBzdGF0ZSwgYW5kIHdlIHdhbnQg
dG8gdXBkYXRlCml0J3MgZGVzY3JpcHRpb24gaW4gS2NvbmZpZyBhY2NvcmRpbmdseS4KClNpZ25l
ZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4K
Ci0tLQoKTm90ZSB0byBjb21taXRlcjogdGhpcyBwYXRjaCBkZXBlbmRzIG9uIGZpcnN0IDQgcGF0
Y2hlcyBpbiB0aGUgc2VyaWVzLgotLS0KIHhlbi9hcmNoL2FybS90ZWUvS2NvbmZpZyB8IDEyICsr
KysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcgYi94ZW4vYXJjaC9hcm0v
dGVlL0tjb25maWcKaW5kZXggYjRiNmFhMjYxMC4uYTRhNTk4MTkxZSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL3RlZS9LY29uZmlnCisrKyBiL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZwpAQCAt
Myw3ICszLDExIEBAIGNvbmZpZyBPUFRFRQogCWRlZmF1bHQgbgogCWRlcGVuZHMgb24gVEVFCiAJ
aGVscAotCSAgRW5hYmxlIGV4cGVyaW1lbnRhbCBPUC1URUUgbWVkaWF0b3IuIEl0IGFsbG93cyBn
dWVzdHMgdG8gYWNjZXNzCi0JICBPUC1URUUgcnVubmluZyBvbiB5b3VyIHBsYXRmb3JtLiBUaGlz
IHJlcXVpcmVzIHZpcnR1YWxpemF0aW9uLWVuYWJsZWQKLQkgIE9QLVRFRSBwcmVzZW50LiBZb3Ug
Y2FuIGxlYXJuIG1vcmUgYWJvdXQgdmlydHVhbGl6YXRpb24gZm9yIE9QLVRFRQotCSAgYXQgaHR0
cHM6Ly9vcHRlZS5yZWFkdGhlZG9jcy5pby9hcmNoaXRlY3R1cmUvdmlydHVhbGl6YXRpb24uaHRt
bAorCSAgRW5hYmxlIHRoZSBPUC1URUUgbWVkaWF0b3IuIEl0IGFsbG93cyBndWVzdHMgdG8gYWNj
ZXNzCisJICBPUC1URUUgcnVubmluZyBvbiB5b3VyIHBsYXRmb3JtLiBUaGlzIHJlcXVpcmVzCisJ
ICB2aXJ0dWFsaXphdGlvbi1lbmFibGVkIE9QLVRFRSBwcmVzZW50LiBZb3UgY2FuIGxlYXJuIG1v
cmUKKwkgIGFib3V0IHZpcnR1YWxpemF0aW9uIGZvciBPUC1URUUgYXQKKwkgIGh0dHBzOi8vb3B0
ZWUucmVhZHRoZWRvY3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWwKKworCSAg
UmlnaHQgbm93IE9QLVRFRSBtZWRpYXRvciBpcyAiVGVjaCBQcmV2aWV3IiBzdGF0ZSwgc28gaXQg
aXMKKwkgIG5vdCBnb29kIGlkZWEgdG8gdXNlIGl0IGluIHByb2R1Y3Rpb24uCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D14BD3C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:47:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdcl9-0003tF-KH; Wed, 19 Jun 2019 15:44:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdcl8-0003tA-4v
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:44:26 +0000
X-Inumbo-ID: 1c36747a-92a9-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::606])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c36747a-92a9-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EHuo0FvA0y9S3Qn/KpjYExL8x7sw4dkw876Pwqw9k8=;
 b=oZBNkz+26YdexOxyB3Z3BYd/dbfNJgk+3hZ8jWcN3IXigTVShi+U4l0Y0i3fZl5xEIl19qcCaGtzYoAuq4SGJOoVNFU4lDzVerPW8cYJuC0n1t6/m8qJeFm9pILTO9nGWb+TnwLwcQBo3X1n5JvrreYygEc8ZQf2bL1M+Q9ADwaELLl9MUQlcZAkOf/Jn9bUg+zXDE5KGikBLkdTFW0sHqGY4spYSXgYWtG+qpWAE9k23dYNx/wDiLNmp51RA7jR/DKocI9M1YYT0ykIhEo8m/Kp2dIHLltHPUIh3zVCHSaqZW6rSfioKti0KnZGwM0sZscUNDk5ye9aex8Op4cbYQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6020.eurprd03.prod.outlook.com (10.255.31.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Wed, 19 Jun 2019 15:44:21 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 15:44:21 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v6 03/10] xen/arm: optee: add OP-TEE mediator skeleton
Thread-Index: AQHVIIX5JIrUFB/Eb0ygbhRZDB7RGKai24wAgAAArICAAE51gA==
Date: Wed, 19 Jun 2019 15:44:21 +0000
Message-ID: <87r27p7f6y.fsf@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-4-volodymyr_babchuk@epam.com>
 <5d151e6b-f640-5b0f-abae-3ff504da0662@arm.com>
 <81925453-ff32-7f00-b08f-774066b57c84@arm.com>
In-Reply-To: <81925453-ff32-7f00-b08f-774066b57c84@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa19e3bb-d059-4d09-5eaa-08d6f4ccffac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6020; 
x-ms-traffictypediagnostic: AM0PR03MB6020:
x-microsoft-antispam-prvs: <AM0PR03MB6020D1AB7981A38BCECC921EE6E50@AM0PR03MB6020.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(396003)(366004)(376002)(189003)(199004)(99286004)(68736007)(72206003)(316002)(66066001)(66946007)(66476007)(6916009)(81166006)(81156014)(54906003)(305945005)(6246003)(3846002)(71190400001)(86362001)(6486002)(53546011)(8676002)(53936002)(256004)(76176011)(71200400001)(6512007)(229853002)(5660300002)(11346002)(486006)(478600001)(55236004)(80792005)(6436002)(64756008)(6506007)(36756003)(14454004)(6116002)(186003)(2906002)(25786009)(8936002)(91956017)(66446008)(2616005)(73956011)(446003)(76116006)(26005)(7736002)(476003)(4326008)(66556008)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6020;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dC5J9Tr/FRemnLf2PDhphMsXKBu5fhESVYd3YOTaW72903/DjJ0uaPevlsCrPlfMbEFQb6efBxvwx2dkPLkJaJkAckLSKahDgkcjjWG4fzKR1MhFBucgJHo1/lO8U29jTqagiLdu5PK2tTIfu2+K5IOJCYjHv9lrr7U4dWqeviLj9F2+EKdXAxr0Y4b2ycyNUYq3pxgY091dkEdClGrMlAh3zVJ3poqdebPx/6P8yh6qLHZo6kIwSPZryfFtbdSPtqB1Q9GuuOaPw6hesOfMWOdsMEsbljvxlgNzFk7lAwgTg+5roHeFo2m1IeEmSlFrxwEEz1MsBVkKNd5YaLPujBxO5kuwdTpZUKHrBXXelBVfw9hnCrb8rAMl8vIyHtlL9UeaQWUu0bGVHRmXMB7uO20h5CPSskOypgmlc0QdobQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa19e3bb-d059-4d09-5eaa-08d6f4ccffac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 15:44:21.7807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6020
Subject: Re: [Xen-devel] [PATCH v6 03/10] xen/arm: optee: add OP-TEE
 mediator skeleton
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDE5LzA2LzIwMTkgMTI6MDEs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgVm9sb2R5bXlyLAo+Pgo+PiBPbiAxMS8wNi8yMDE5
IDE5OjQ2LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdGVlL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcKPj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi41YjgyOWRiMmU5Cj4+PiAtLS0gL2Rl
di9udWxsCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcKPj4+IEBAIC0wLDAgKzEs
NCBAQAo+Pj4gK2NvbmZpZyBPUFRFRQo+Pj4gKyBib29sICJFbmFibGUgT1AtVEVFIG1lZGlhdG9y
Igo+Pj4gKyBkZWZhdWx0IG4KPj4+ICsgZGVwZW5kcyBvbiBURUUKPj4KPj4gSSBoYXZlIHBsYXll
ZCBhIGJpdCB3aXRoIHRoZSBtZW51Y29uZmlnIHRoYXQgIkVuYWJsZSBPUC1URUUKPj4gbWVkaWF0
b3IiIHdpbGwgYXBwZWFyIGF0IHRoZSB0b3AtbGV2ZWwgd2hpbGUgIkVuYWJsZSBURUUgbWVkaWF0
b3JzCj4+IHN1cHBvcnQiIGlzIHVuZGVyICJBcmNoaXRlY3R1cmUgZmVhdHVyZXMiLgo+Pgo+PiBB
cmd1YWJseSwgYm90aCBzaG91bGQgYmUgdW5kZXIgIkRldmljZSBEcml2ZXJzIi4gQ2FuIHlvdSBz
ZW5kIGEKPj4gZm9sbG93LXVwIHBhdGNoIHRvIGZpeCB0aGF0IHVwPwo+Cj4gQW5vdGhlciBhbHRl
cm5hdGl2ZSBpcyBtb3ZpbmcgdGhlIHR3byBpbiAiQXJjaGl0ZWN0dXJlIGZlYXR1cmVzIiB3aXRo
Cj4gIkVuYWJsZSBPUC1URUUgbWVkaWF0b3IiIHVuZGVyICJFbmFibGUgVEVFIG1lZGlhdG9yIHN1
cHBvcnRzIi4KPgpJJ2xsIGRvIGluIHRoaXMgd2F5LCBpZiB0aGVyZSBpcyBubyBvYmplY3Rpb25z
LiBBcyBURUUgaXMgbm90IGEgZGV2aWNlLApzdHJpY3RseSBzcGVha2luZywgSSBkb24ndCB0aGlu
ayB0aGF0ICJEZXZpY2UgRHJpdmVycyIgaXMgYSBnb29kIHBsYWNlCmZvciBpdC4KCi0tIApCZXN0
IHJlZ2FyZHMsVm9sb2R5bXlyIEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

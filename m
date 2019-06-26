Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D9567DD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 13:43:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg6IK-0005Pj-Or; Wed, 26 Jun 2019 11:40:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HplO=UZ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hg6IJ-0005Pe-P7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 11:40:55 +0000
X-Inumbo-ID: 413f16b2-9807-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::708])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 413f16b2-9807-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSmwjH/e3AwNrQOH89nJpq8orqIefrFrBPRaPwdUJeQ=;
 b=ORTdMdF4bcwoQ8gyVV+qlB2SRwmH0zpHKfEfikkLv59UUaM+95awLm6fPlrBZ6rfI2EkRVUAC5GxcATpzu9aHcsi4FDSipJPqrFfNoSpxI/sNZ+IVn7528tO7ZvijfQ++BiDoqQ2xPLLYwHOlzHIHpSbRKrfT8vOeacnDDhiR+Y=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2846.eurprd02.prod.outlook.com (10.171.108.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.15; Wed, 26 Jun 2019 11:40:52 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::647b:2795:a1b:ee09%5]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 11:40:52 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] xen/public: arch-arm: Use xen_mk_ullong
 instead of suffixing value with ULL
Thread-Index: AQHVGibh9/r7Csn3ck6Jg9kEzx82Zqat87MA
Date: Wed, 26 Jun 2019 11:40:52 +0000
Message-ID: <1b25dd21-cf9f-a4ce-f1ca-e97b31e12063@bitdefender.com>
References: <20190603160829.31912-1-julien.grall@arm.com>
In-Reply-To: <20190603160829.31912-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::23) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5eeb3821-9da2-425e-30f0-08d6fa2b247e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2846; 
x-ms-traffictypediagnostic: VI1PR0202MB2846:|VI1PR0202MB2846:
x-microsoft-antispam-prvs: <VI1PR0202MB28467C22BB43ED2B916561CFABE20@VI1PR0202MB2846.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(110136005)(102836004)(14454004)(52116002)(76176011)(186003)(31686004)(6506007)(386003)(3846002)(68736007)(8936002)(31696002)(36756003)(81166006)(6116002)(81156014)(54906003)(4744005)(99286004)(8676002)(256004)(2906002)(5660300002)(86362001)(66066001)(73956011)(66946007)(66556008)(64756008)(66446008)(66476007)(446003)(6486002)(53936002)(229853002)(25786009)(6436002)(11346002)(4326008)(7736002)(305945005)(476003)(71190400001)(71200400001)(2616005)(2501003)(486006)(316002)(478600001)(26005)(6246003)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2846;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l+XDho5BOyzi80lDTm1IOLdUtJd67AkgM3eePpWDeEr+W15uj51n4ZPI00FTxdIG/Qj7MrghDoQLuqkrPkzzDt1DZVQ5oE+zTdhkYz8kkKN4hy0Vid8UyNnIdDeWJbKg6MjRlqFoDLgvfQkvRXaEj3/AEpk1lx1Aep+YikXY14HuFsNsn0vQSt2VakybuvE/z049DH8s/2gZnmOqDCCXnNMpxuMlYgy/NNUesneiK2y6foiiU8ac4nekY8I5I6DAA9RP9z+Htwka2zUJeU7FsDCl9FJ5yFQZx9tdnAwP+1Y1uNKuhcAbjEyCbbe4Nqz9DzTtoJnCI/MVfb5XEDEkXKa0o4Ib5uN6vFFadc3Qv5SzYE5GkiIeHZnBkxKttuEh41NXBNPteybvIg1kzV8iDlxMOZKIjDcWENRtwVHMcCg=
Content-ID: <5BF0A8678239C94F9F37A9B3CC864698@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eeb3821-9da2-425e-30f0-08d6fa2b247e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 11:40:52.5744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2846
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Use xen_mk_ullong
 instead of suffixing value with ULL
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpMb29rcyBnb29kIHRvIG1lDQoNCj4gVGhlcmUgYXJlIGEgZmV3IHBsYWNlcyBpbiBpbmNsdWRl
L3B1YmxpYy9hcmNoLWFybS5oIHRoYXQgYXJlIHN0aWxsDQo+IHN1ZmZpeGluZyBpbW1lZGlhdGUg
d2l0aCBVTEwgaW5zdGVhZCBvZiB1c2luZyB4ZW5fbWtfdWxsb25nLg0KPiANCj4gVGhlIGxhdHRl
ciBhbGxvd3MgYSBjb25zdW1lciB0byBlYXNpbHkgdHdlYWsgdGhlIGhlYWRlciBpZiBVTEwgaXMg
bm90DQo+IHN1cHBvcnRlZC4NCj4gDQo+IFNvIHN3aXRjaCB0aGUgcmVtYWluaW5nIHVzZXJzIG9m
IFVMTCB0byB4ZW5fbWtfdWxsb25nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KDQpDaGVlcnMNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

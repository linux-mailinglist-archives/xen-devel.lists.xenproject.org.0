Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44808905E8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyf7W-0000iY-Ok; Fri, 16 Aug 2019 16:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1kBP=WM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyf7V-0000iP-LC
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:30:29 +0000
X-Inumbo-ID: 283b7aec-c043-11e9-b90c-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 283b7aec-c043-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 16:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6W7uV+pwrk4X3205/VT6z3DY71/Ua8NhmDOfSUbplWFSXxAwoxgGUZUotuvaw6pvM+cU4jEWIp286K8c847pw4lYmadkOii9YgxsW2GFWG5/i+sHku1Oc/4zt2MK6nvzu3iPKqgT4pIL7us6HEQ4yCHnOiToZ2KH2A+5uD9xuAFnnOxIw2oeFKu+KTN9tczVxR0KkJMl1ChaOU4hxLtH4AFgYXclQj8frkOzfiW3lqD+Itu8A4ygKbbQv/Ha5+OcrYr4zKyHRjQatmp3DjXD9C6S7AOj8rLOx6KtiLJi3vxa/m/HfNAI6jbOHMkQumu4/u2XdWkPg/TE7fN1IuRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UefegNIGMBZMHwpHytZAKtaOxPxSIH9qu/R5tZ6RwHk=;
 b=CDdAYQQ8KafBF+q8Uqrsk+TvxrYLSW3fymHuMywKfSlKtEPGz5/39UykbT0iTj79TKLJJ4KNhocSd+R/4KVgoY2GzMW7LCb25+oN+wraF96IHwU1bkG76H5jK73eTgcv/7N06w0JlwC7G8X7u/mm6LJdccxq6oj7vbrZ4s1mhzN0SgjdWvHXpL6X6HnzqcvuTkJfjzBtIuU7G4yQE9rjVnUERs6hoP6imHnp4J06Qv19L6YNWM37XJZfGLMhCngQSW6QAgAWxcuP7s6tmEcGlaeL2rO0kte6JurF4Cm325HgT7LeRJRUjW9uNLhs1OxWF55gdUZ2MTJfxMznIAHfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UefegNIGMBZMHwpHytZAKtaOxPxSIH9qu/R5tZ6RwHk=;
 b=Ox2hNydsUWPHmBuA/Jruxr+WM7VpGPdkeMLphP8k3nAlHWsPhPui2+fMjaOSVFeOmKw9ct8VC3b++2iru3Ye5YxF3i1y/9eiF46gvVR1DdPk8FYeMrZyG2doXKu3ZA7HkeAiMqTYTn0et1zsEdEYaKbmVp2De105HT4OfA96lyvgtslJRCn/1+0/6eGPNfv6rLz0wjuyhid+KZs1DF4S7DzSFDSVCyXSUSxgLMYNsTJNDbF0ubjqU1F7ECzdopkfH07sA/EJya2MwaB1rqnCtgiP5tthzhxqIZR9NmuUO8GQyAof8/rG5+KylhuLPNCScY4WURFOg2jBQj8w9wbBJg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0SPR01MB14.eurprd03.prod.outlook.com (52.134.87.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 16:30:27 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 16:30:27 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: domain_build: Print the correct domain in
 construct_domain()
Thread-Index: AQHVU4/cH7ZH5mITaU2l9I2LeyfLd6b9+LEA
Date: Fri, 16 Aug 2019 16:30:27 +0000
Message-ID: <87zhk9f4yl.fsf@epam.com>
References: <20190815173533.26310-1-julien.grall@arm.com>
In-Reply-To: <20190815173533.26310-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a5d8d45-5556-44f5-9c96-08d722670bf0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0SPR01MB14; 
x-ms-traffictypediagnostic: AM0SPR01MB14:|AM0SPR01MB14:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0SPR01MB14DFE48FABDA33AA613C7BE6AF0@AM0SPR01MB14.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(91956017)(64756008)(66946007)(14444005)(66476007)(2616005)(81166006)(6486002)(66556008)(66446008)(8676002)(54906003)(14454004)(6436002)(81156014)(66066001)(486006)(71200400001)(6916009)(71190400001)(2906002)(8936002)(76116006)(86362001)(256004)(4744005)(229853002)(6512007)(5660300002)(55236004)(80792005)(26005)(478600001)(102836004)(186003)(6246003)(6506007)(4326008)(53936002)(7736002)(305945005)(107886003)(446003)(99286004)(6116002)(11346002)(3846002)(25786009)(76176011)(476003)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB14;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KW5UrKZkw4EgOT2OznEtY5/1rS42ddY+Ru6YeSm+3vJtfir1J2x+S6sZjk0nm8F3rNZfYbScz5Y18MUfREX0JIv2FLJ77Zt3UU9wDB02fGVdJ1cufT2tKrSK0f3Zdwim/mMbXBsgNXiXSUKTGXeuTvZYUK5pB+VZxOCS0bnPbDC6X5s6HvjECg9ceStRcUVLX+c4c/wxRMlpl50wm9kLioJTt1USReW8e2L8zbcqes7LaLxfhuNQL0eJNiGjq1PEeAESjZEZsn//JvsAdkyKhC0tOrDuK3NQNevB2M2WYh2/0eY1QuajOYAorYKYK35o9vz9dksC28wjEZ63e/XwAMnKbtheIl8bpady2qEGJzwIiyk8z8rqebQ5SLvy3aWClP22fmor7Md57kd11md4MEeEUTLSLppzqAKZO+hgwyY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5d8d45-5556-44f5-9c96-08d722670bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:30:27.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTjawgspNRWLn594q4bYXfGx1OYKGWMX4n/swUlQlP5JOaOQHj7x55J5ktC3gKlPgvyLeXtSAB7vFcXSjMsXPNU4V8KoqVmaSqjdMhaUfjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB14
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in construct_domain()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBjb25zdHJ1Y3RfZG9tYWluKCkgY2FuIGJlIGNhbGxl
ZCBieSBvdGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZAo+IGNvbmZ1c2lvbiBpbiB0aGUg
bG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNo
dWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCAzMzE3MTA4MWVhLi5jZjlmZmJj
MzYwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0xOTc4LDcgKzE5NzgsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8pCj4gICAgICAgICAgY3B1ID0gY3B1bWFza19jeWNsZShjcHUsICZjcHVf
b25saW5lX21hcCk7Cj4gICAgICAgICAgaWYgKCB2Y3B1X2NyZWF0ZShkLCBpLCBjcHUpID09IE5V
TEwgKQo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgcHJpbnRrKCJGYWlsZWQgdG8gYWxsb2Nh
dGUgZG9tMCB2Y3B1ICVkIG9uIHBjcHUgJWRcbiIsIGksIGNwdSk7Cj4gKyAgICAgICAgICAgIHBy
aW50aygiRmFpbGVkIHRvIGFsbG9jYXRlICVwZCB2Y3B1ICVkIG9uIHBjcHUgJWRcbiIsIGQsIGks
IGNwdSk7Cj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgIH0KCgotLSAKVm9sb2R5bXly
IEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

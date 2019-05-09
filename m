Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EF194E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 23:48:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOqsA-0000U3-8K; Thu, 09 May 2019 21:46:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOqs8-0000Ty-E1
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 21:46:36 +0000
X-Inumbo-ID: e966b907-72a3-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e966b907-72a3-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMJdFm5q/+M/lIZz132Rs3GgXv5I8+SeT3r+aCIhcks=;
 b=Fpc0o30tHQubskLuiJcmARHCrAxYdfge2ZGJ7YIgYsA1RxTP5PGG2tETx+o9TK3ywRzMyQWYDBqOVDxJAmlwIg0jWa7I1TvHEtzMDdZKoZ710QCG5Uun2MgTxNJdt9cMjLGG8Oskys+qSPx5JDXY47vmbMzENV4S77rGV6MSAT8=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB2995.eurprd08.prod.outlook.com (52.134.94.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 21:46:31 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 21:46:31 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs helpers name
Thread-Index: AQHVBbleI/E+c66c/k2S05mcqExj0KZjO/yAgAAV8ACAAAPygA==
Date: Thu, 9 May 2019 21:46:31 +0000
Message-ID: <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
In-Reply-To: <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b6ea194-c060-431b-bf05-08d6d4c7cc51
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB2995; 
x-ms-traffictypediagnostic: AM0PR08MB2995:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB2995A995E2F411E1F7DD5C6680330@AM0PR08MB2995.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(39860400002)(366004)(346002)(396003)(136003)(199004)(189003)(6486002)(44832011)(102836004)(4326008)(6436002)(6916009)(6246003)(53936002)(3846002)(476003)(2616005)(446003)(5660300002)(68736007)(11346002)(26005)(54906003)(305945005)(7736002)(256004)(14444005)(186003)(229853002)(486006)(6116002)(6512007)(31686004)(8936002)(2906002)(36756003)(6506007)(76176011)(52116002)(25786009)(81156014)(8676002)(316002)(81166006)(386003)(99286004)(71200400001)(71190400001)(31696002)(66066001)(86362001)(72206003)(53546011)(478600001)(14454004)(73956011)(64756008)(66556008)(66476007)(66946007)(66446008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB2995;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DZnG6mPhDLQoDCKcnBfZ9vR3Ba3VoInCqBxp4RDLu4m26PGPp/JAIcPMXxQoRVH39ChATVL8SC75qkL5HlbyoElxShuomwz4b0r6yhh1BPdykhfYDALeNIwJc7gKUQkT9ReXR5aYp9FON3lNav/1FZnewJCnU3IF8/pzba4yD1U+MHODIBBNXKp5E+n+O8sy+QCy/20vhaRj2m2Yw980/Tn2B+6S6pgSHDh+p27mpM8H8dZ67ZD1w15e9lTBquyfk17gpRI8XinuM/nZCFrtH1pO86ivjC0J3kjkXoAphEPrAxDD0WKX0TW6HSMWsTxCZEZDgIjSmS+eb7XFF8zI627YnQM8ozYP5JMSI/7qISPZdUoFsJlDzo++shUE11azhcHNb5VxoLgmFi6kTXxXqO/FUI8AbTizIiD3BvI2haE=
Content-ID: <BB9C0D893FDC2643BF955CBADC35952F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ea194-c060-431b-bf05-08d6d4c7cc51
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 21:46:31.3222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2995
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDA5LzA1LzIwMTkgMjE6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+
IA0KPiBPbiAwOS8wNS8yMDE5IDIxOjEzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBP
biBXZWQsIDggTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiDCoCAvKiBSZWxlYXNl
IGFsbCBfX2luaXQgYW5kIF9faW5pdGRhdGEgcmFuZ2VzIHRvIGJlIHJldXNlZCAqLw0KPj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaCANCj4+PiBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oDQo+Pj4gaW5kZXggNDBhNzdkYWE5ZC4uMGI0MWI5
MjE0YiAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaA0K
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oDQo+Pj4gQEAgLTYxLDEy
ICs2MSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnZhbGlkYXRlX2ljYWNoZV9sb2NhbCh2b2lk
KQ0KPj4+IMKgwqDCoMKgwqAgaXNiKCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIFN5bmNocm9uaXplIGZldGNoZWQgaW5zdHJ1Y3Rpb24gDQo+Pj4gc3RyZWFt
LiAqLw0KPj4+IMKgIH0NCj4+PiAtLyoNCj4+PiAtICogRmx1c2ggYWxsIGh5cGVydmlzb3IgbWFw
cGluZ3MgZnJvbSB0aGUgZGF0YSBUTEIgb2YgdGhlIGxvY2FsDQo+Pj4gLSAqIHByb2Nlc3Nvci4g
VGhpcyBpcyBub3Qgc3VmZmljaWVudCB3aGVuIGNoYW5naW5nIGNvZGUgbWFwcGluZ3Mgb3INCj4+
PiAtICogZm9yIHNlbGYgbW9kaWZ5aW5nIGNvZGUuDQo+Pj4gLSAqLw0KPj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgZmx1c2hfeGVuX2RhdGFfdGxiX2xvY2FsKHZvaWQpDQo+Pj4gKy8qIEZsdXNoIGFs
bCBoeXBlcnZpc29yIG1hcHBpbmdzIGZyb20gdGhlIFRMQiBvZiB0aGUgbG9jYWwgDQo+Pj4gcHJv
Y2Vzc29yLiAqLw0KPj4NCj4+IEkgcmVhbGl6ZSB0aGF0IHRoZSBzdGF0ZW1lbnQgIlRoaXMgaXMg
bm90IHN1ZmZpY2llbnQgd2hlbiBjaGFuZ2luZyBjb2RlDQo+PiBtYXBwaW5ncyBvciBmb3Igc2Vs
ZiBtb2RpZnlpbmcgY29kZSIgaXMgbm90IHF1aXRlIGFjY3VyYXRlLCBidXQgSSB3b3VsZA0KPj4g
cHJlZmVyIG5vdCB0byByZW1vdmUgaXQgY29tcGxldGVseS4gSXQgd291bGQgYmUgZ29vZCB0byBy
ZXRhaW4gYSB3YXJuaW5nDQo+PiBzb21ld2hlcmUgYWJvdXQgSUMgYmVlbiBuZWVkZWQgd2hlbiBj
aGFuZ2luZyBYZW4ncyBvd24gbWFwcGluZ3MuIE1heWJlDQo+PiBvbiB0b3Agb2YgaW52YWxpZGF0
ZV9pY2FjaGVfbG9jYWw/DQo+IA0KPiBDYW4geW91IHBsZWFzZSBleHBhbmQgaW4gd2hpY2ggY2ly
Y3Vtc3RhbmNlIHlvdSBuZWVkIHRvIGludmFsaWQgdGhlIA0KPiBpbnN0cnVjdGlvbiBjYWNoZSB3
aGVuIGNoYW5naW5nIFhlbidzIG93biBtYXBwaW5ncz8NCg0KUmVhZGluZyB0aGUgQXJtdjcgKEIz
LjExLjIgaW4gQVJNIERESSAwNDA2Qy5jKSBhbmQgQXJtdjggKEQ1LjExLjIgaW4gQVJNIA0KRERJ
IDA0ODdELmEpLCBtb3N0IG9mIHRoZSBpbnN0cnVjdGlvbiBjYWNoZXMgaW1wbGVtZW50IHRoZSBJ
VklQVCANCmV4dGVuc2lvbi4gVGhpcyBtZWFucyB0aGF0IGluc3RydWN0aW9uIGNhY2hlIG1haW50
ZW5hbmNlIGlzIHJlcXVpcmVkIA0Kb25seSBhZnRlciB3cml0ZSBuZXcgZGF0YSB0byBhIFBBIHRo
YXQgaG9sZHMgaW5zdHJ1Y3Rpb25zIChzZWUgRDUtMjUyMiANCmluIEFSTSBEREkgMDQ4N0QuYSBh
bmQgQjMuMTEuMiBpbiBBUk0gRERJIDA0MDZDLmMpLg0KDQpUaGUgb25seSBvbmUgdGhhdCBkaWZm
ZXJzIHdpdGggdGhhdCBiZWhhdmlvciBpcyBBU0lEIGFuZCBWTUlEIHRhZ2dlZCANClZJVlQgaW5z
dHJ1Y3Rpb24gY2FjaGVzIHdoaWNoIGlzIG9ubHkgcHJlc2VudCBpbiBBcm12NyAoSSBjYW4ndCBy
ZW1lbWJlciANCndoeSBpdCB3YXMgZHJvcHBlZCBpbiBBcm12OCkuIEluc3RydWN0aW9uIGNhY2hl
IG1haW50ZW5hbmNlIGNhbiBiZSANCnJlcXVpcmVkIHdoZW4gY2hhbmdpbmcgdGhlIHRyYW5zbGF0
aW9uIG9mIGEgdmlydHVhbCBhZGRyZXNzIHRvIGEgDQpwaHlzaWNhbCBhZGRyZXNzLg0KDQpUaGVy
ZSBhcmUgb25seSBhIGZldyBsaW1pdGVkIHBsYWNlcyB3aGVyZSBYZW4gbWFwcGluZ3MgY2FuIGNo
YW5nZSBhbmQgYSANCmluc3RydWN0aW9uIGNhY2hlIGZsdXNoIGlzIHJlcXVpcmVkIChuYW1lbHkg
bGl2ZXBhdGNoLCBjaGFuZ2luZyANCnBlcm1pc3Npb24sIGZyZWUgaW5pdCkuIEFsbCB0aGUgb3Ro
ZXJzIGFyZSBub3QgbmVjZXNzYXJ5Lg0KDQpBIGNvbW1lbnQgb24gdG9wIG9mIGludmFsaWRhdGVf
aWNhY2hlX2xvY2FsKCkgaXMgbm90IGdvaW5nIHRvIGhlbHAgYXMgDQp5b3UgcmVseSBvbiB0aGUg
ZGV2ZWxvcGVyIGtub3dzIHdoaWNoIGZ1bmN0aW9uIHRvIHVzZS4gVGhlIG9uZSBvbiB0b3Agb2Yg
DQpmbHVzaCB0bGIgaGVscGVycyBpcyBhdCBiZXN0IG1pc2xlYWRpbmcgd2l0aG91dCBhIGxvbmcg
ZXhwbGFuYXRpb24uIEF0IA0Kd2hpY2ggcG9pbnQsIHlvdSBiZXR0ZXIgcmVhZCB0aGUgQXJtIEFy
bS4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

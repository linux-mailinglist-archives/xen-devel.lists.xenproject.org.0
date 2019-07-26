Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9276611
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:41:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzU6-0000d0-80; Fri, 26 Jul 2019 12:38:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqzU4-0000cv-FF
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:38:04 +0000
X-Inumbo-ID: 34fe14ff-afa2-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::626])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34fe14ff-afa2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVVr4ZorwVefKLJi6o1fmsV6Pdl++XYD1Fkitk1h6uq0SekSn4IMFeHTrH6s/tFYdJjimt9D91YnFsNpHxjlfgAwvXy5b1WYGwYwahD2PNe8ojPGOYleTasexdDcGK4Ge9NQ9ztryH5RghGZX4emdH7WLql1wTmPlsacD38aGNPD89UzbTH9xk9nTrWZ/T5rokboZgnOXZvajnUSBg/ozBVs7lgjgIH7jPI0mU+7HAICFEwk1ST5k8H2E7FSlsSA+nl+kMWzCL3z/uW2dYdugkruQt4s/IhOumUGZTaO9HzgI4Iy6xVgLKcjKI4dDRO5mlqTXcREhuJGX+Q8F0znuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvz5vPKTu9agTW5zKiIEAVKqfBPNIJKml6Kxtby7vSE=;
 b=MCR9HKfprucA2duZHtALWYBjKhDdEzs3yCQvibrXJ6IOm06ardNEWQ182/sJoFo+H5Cvk6ttfhtCMLLTcYr+OMjrnkiR/wVnFN4JHgjmCX88tVTmdiKM8Gl+qnA1EjxKDPx1OrCMXUS+1ctKsk8if/QpRuq97c0XCTG4gi3vt3A1RYpfUXcBgzw0Ws3NJqaK7/QnpZ0sXoKjMVJP+1CPLMThMhHrqPjWrEXDfjWUGGe5lQ9elmFBTPg0lPyo9r4XFrUocHfUNZPCrLhzQuWDddfzO4TxIRsH8njIx9DroBoli/Pq5+c92TeLPq0ka8h4eOPzDVv5XYgrCIrSoruh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvz5vPKTu9agTW5zKiIEAVKqfBPNIJKml6Kxtby7vSE=;
 b=c071nU8fOgx419U1DeqxZOcxIocNnCrw40mMrPnSckh9dE61KN5AMZilF2/QLWjzXmcWNG1fcMcD5g4IzDDDK7bpn1YuI3PNILZBFZKDmw/dnC3eTTItULXqXAb07aWROgz32SxePzePTzD/xBci2w3WfX+wjzf0U8N9p6KYVH6Z6ktF+dS+ZvBZNTs7LVGaRzeeGliEl+OLk3DNUuNi+TCQPGKXponnWWuLv/YqaU/qynWFwd/oueU1885GzP+0f1CGwkdUXXwgz2I59mJYXpTvqDtM7iy+VtmbxJCJUqhc0rtWBi6JKZOhE5qUqPXKJQACPy3bWlouprQ+HKLwqA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3537.eurprd03.prod.outlook.com (52.134.82.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 12:38:00 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:38:00 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in do_trap_brk()
Thread-Index: AQHVQZ6k8qwLfZd6ak+FKyeZYDhv0qbc2qsA
Date: Fri, 26 Jul 2019 12:38:00 +0000
Message-ID: <87lfwlhsyh.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-6-julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-6-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5639f8a-b46e-4e87-479a-08d711c61856
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3537; 
x-ms-traffictypediagnostic: AM0PR03MB3537:
x-microsoft-antispam-prvs: <AM0PR03MB3537DD21A0B0540F9286508BE6C00@AM0PR03MB3537.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(478600001)(54906003)(2616005)(14454004)(81166006)(99286004)(11346002)(7736002)(305945005)(26005)(5660300002)(6512007)(53936002)(316002)(6916009)(55236004)(76176011)(68736007)(81156014)(2906002)(86362001)(446003)(3846002)(6116002)(6246003)(8936002)(476003)(186003)(6506007)(256004)(6436002)(64756008)(66446008)(71190400001)(66476007)(4326008)(25786009)(71200400001)(36756003)(76116006)(229853002)(91956017)(6486002)(66946007)(66066001)(107886003)(486006)(66556008)(8676002)(102836004)(80792005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3537;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g6+zDpckjrAaejWi8ULbZqjZXdOLISmtJXjkfd/YopiSWRFLoSCfDEFwDyMl44Z0SKG1YF27XK+sqbsh3E2VtK425RdRd+rdSZXPRN+x4PKobjhVXLx9HzPcpgnillRPUrtEsMhhdabRrxeDBLfmd3hw2+0n9odjxz4TUhaoh2qbLJiVYE/4B3q3FvDww3INR95lxceE/3TXAklpLyOgFlr74KU9E06JlZSSassKKUa5KXcl+WyMsDsqJ4ePRVqG/qOnDNKRvGK7h+LC1LI+2NkfVbI5EyEeZy5yVbmrip2j0itK2BgqIzBYqnRSdtNju1BRQwy7ca7NR5Y7VmhAH6ps99B6naFLP6sG2iAURuMd2yNih5wnlpRoOuCzqgh8gjbRdFbaFqnJ9bUVKl9EyPONuMi0tAIxh3erZgiDTyE=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5639f8a-b46e-4e87-479a-08d711c61856
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:38:00.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3537
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIGRvX3RyYXBfYnJrKCkgaXMg
dXNpbmcgYSBCVUdfT04oKSB0byBjaGVjayB0aGUgaGFyZHdhcmUKPiBoYXMgYmVlbiBjb3JyZWN0
bHkgY29uZmlndXJlZCBkdXJpbmcgYm9vdC4KPgo+IEFueSBlcnJvciB3aGVuIGNvbmZpZ3VyaW5n
IHRoZSBoYXJkd2FyZSBjb3VsZCByZXN1bHQgdG8gYSBndWVzdCAnYnJrJwo+IHRyYXBwaW5nIGlu
IHRoZSBoeXBlcnZpc29yIGFuZCBjcmFzaCBpdC4KPgo+IFRoaXMgaXMgcHJldHR5IGhhcnNoIHRv
IGtpbGwgWGVuIHdoZW4gYWN0dWFsbHkga2lsbGluZyB0aGUgZ3Vlc3Qgd291bGQKPiBiZSBlbm91
Z2ggYXMgbWlzY29uZmlndXJpbmcgdGhpcyB0cmFwIHdvdWxkIG5vdCBsZWFkIHRvIGV4cG9zaW5n
Cj4gc2Vuc2l0aXZlIGRhdGEuIFJlcGxhY2UgdGhlIEJVR19PTigpIHdpdGggY3Jhc2hpbmcgdGhl
IGd1ZXN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgMTEgKysrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4g
aW5kZXggMTMyNjg2ZWUwZi4uZWYzN2NhNmJkZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0v
dHJhcHMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gQEAgLTEzMDQsMTAgKzEzMDQs
MTUgQEAgaW50IGRvX2J1Z19mcmFtZShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywg
dmFkZHJfdCBwYykKPiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAgc3RhdGljIHZvaWQgZG9fdHJh
cF9icmsoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhzciBoc3IpCj4g
IHsKPiAtICAgIC8qIEhDUl9FTDIuVEdFIGFuZCBNRENSX0VMMi5UREUgYXJlIG5vdCBzZXQgc28g
d2UgbmV2ZXIgcmVjZWl2ZQo+IC0gICAgICogc29mdHdhcmUgYnJlYWtwb2ludCBleGNlcHRpb24g
Zm9yIEVMMSBhbmQgRUwwIGhlcmUuCj4gKyAgICAvKgo+ICsgICAgICogSENSX0VMMi5UR0UgYW5k
IE1EQ1JfRUwyLlREUiBhcmUgY3VycmVudGx5IG5vdCBzZXQuIFNvIHdlIHNob3VsZAo+ICsgICAg
ICogbmV2ZXIgcmVjZWl2ZSBzb2Z0d2FyZSBicmVha3BvaW5nIGV4Y2VwdGlvbiBmb3IgRUwxIGFu
ZCBFTDAgaGVyZS4KPiAgICAgICAqLwo+IC0gICAgQlVHX09OKCFoeXBfbW9kZShyZWdzKSk7Cj4g
KyAgICBpZiAoICFoeXBfbW9kZShyZWdzKSApCj4gKyAgICB7Cj4gKyAgICAgICAgZG9tYWluX2Ny
YXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4gKyAgICAgICAgcmV0dXJuOwo+ICsgICAgfQo+ICAKPiAg
ICAgIHN3aXRjaCAoIGhzci5icmsuY29tbWVudCApCj4gICAgICB7CgoKLS0gClZvbG9keW15ciBC
YWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

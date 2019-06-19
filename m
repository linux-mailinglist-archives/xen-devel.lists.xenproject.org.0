Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413DA4C05F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 19:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdemu-0007zA-JT; Wed, 19 Jun 2019 17:54:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdems-0007yb-N7
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 17:54:22 +0000
X-Inumbo-ID: 441b74f3-92bb-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::620])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 441b74f3-92bb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP8vJPN22b6OLgoR82XgeZN8aCm/Eqc6Z8g29fVGTPY=;
 b=nsIEIj5ROWE0wq607l2rF/0q2ZETjjUXToPFlGtmub6v30TXVMneRssbY18l7Xeqq+5Al6gyFwJgyDUFSTcPgrdvNKDeD/inOBMdFmRBS35YWr4ug97ssqV2NdyU0ki3XiESSyYDLicdkDfCCK/u95igRBMlBxZgBzjDFtgbEYPqD1eqWFakDk5ai578N6xqSaFH6bIeeUvf9jIxBi6pBLenpOzwF4DHcKKIg5Nm/UNaBmj1BUcElox+wqFPSZCqBzinlViolWKOCxAr8eJNhXccMCPH7NeU3Hu7xeA6iARcMGF+EEzRnh0Cuqyxn10XYCNwsEI7SY74tXTXX9IA+g==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6051.eurprd03.prod.outlook.com (10.255.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 17:54:19 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 17:54:19 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 2/5] tools/arm: optee: create optee firmware node in
 DT if tee=optee
Thread-Index: AQHVJsgFm0lDectG80mAA7GOe+3Yow==
Date: Wed, 19 Jun 2019 17:54:19 +0000
Message-ID: <20190619175333.29938-3-volodymyr_babchuk@epam.com>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cad1f351-4f6c-4253-5e02-08d6f4df2795
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6051; 
x-ms-traffictypediagnostic: AM0PR03MB6051:
x-microsoft-antispam-prvs: <AM0PR03MB60510364ECE69E43E7EB70EEE6E50@AM0PR03MB6051.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(81156014)(186003)(3846002)(76116006)(26005)(6506007)(14454004)(72206003)(64756008)(6436002)(2616005)(1076003)(2351001)(54906003)(486006)(4326008)(5660300002)(36756003)(6486002)(80792005)(66556008)(8936002)(66446008)(55236004)(66946007)(446003)(71190400001)(476003)(102836004)(68736007)(66476007)(71200400001)(99286004)(53936002)(6512007)(76176011)(7736002)(86362001)(8676002)(25786009)(73956011)(305945005)(316002)(2501003)(66066001)(6116002)(478600001)(256004)(11346002)(2906002)(5640700003)(91956017)(81166006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6051;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9EcSxbO1Fd2VcqE5QdwLT3DQ7ilEA+eGe/i1BKu8xBbnKYirxG4N9Ks+0yvEbs6f+QmdWvCekTb6ZJwvBPFuXEvahrf75wzhK8QWtCsJdFGmt6oWpR9ihoy698ZpS5J0ggv9kLx4Zk+Qz1iXbO9SRT+OcgqY6J49S55htOfc83n1Ke+pLAUb4oxsS1O60TjNv+ujJToUAhg6WldIF6GCUD8Z5p8ZdVAKi4WS58JygrGcoiY5ikb1C9+0NXltJZc8OSJZG4hPGGZQBJEtYfB+SZcWFefrRQwbA79amHKYHw3NOofZIfxDHaYT5IwXw2EgkfZhIdYMhfo67g+S6lZpvjohcZ3H9WD/KJgE3H6FLbN8VVQTRR/jhErUUEz/gAqBfBL7Ixktqo+Y9/Ngy/xpcvJ6PnZKX2p8HT52nbAeMzg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad1f351-4f6c-4253-5e02-08d6f4df2795
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:54:19.7679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6051
Subject: [Xen-devel] [PATCH v7 2/5] tools/arm: optee: create optee firmware
 node in DT if tee=optee
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgVEVFIHN1cHBvcnQgaXMgZW5hYmxlZCB3aXRoICJ0ZWU9b3B0ZWUiIG9wdGlvbiBpbiB4bC5j
ZmcsCnRoZW4gd2UgbmVlZCB0byBpbmZvcm0gZ3Vlc3QgYWJvdXQgYXZhaWxhYmxlIFRFRSwgYnkg
Y3JlYXRpbmcKY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBndWVzdCdzIGRldmljZSB0cmVlLgoK
U2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKLS0tCiBUaGlz
IHBhdGNoIGRlcGVuZHMgb24gcGF0Y2hlcyB0byBvcHRlZS5jLgoKIENoYW5nZXMgZnJvbSB2NDoK
ICAtICJuYXRpdmUiIG9wdGlvbiByZXBsYWNlZCB3aXRoICJvcHRlZSIKCiBDaGFuZ2VzIGZyb20g
djM6CiAgLSAic21jIiBtZXRob2QgcmVwbGFjZWQgd2l0aCAiaHZjIgogIC0gQ29kaW5nIHN0eWxl
IGZpeGVzCi0tLQogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgfCAyOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCmlu
ZGV4IDZiNzJjMDA5NjAuLmJmMzFiOWIzY2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2FybS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2FybS5jCkBAIC00MjAsNiArNDIwLDMyIEBA
IHN0YXRpYyBpbnQgbWFrZV9wc2NpX25vZGUobGlieGxfX2djICpnYywgdm9pZCAqZmR0KQogICAg
IHJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG1ha2Vfb3B0ZWVfbm9kZShsaWJ4bF9fZ2MgKmdj
LCB2b2lkICpmZHQpCit7CisgICAgaW50IHJlczsKKyAgICBMT0coREVCVUcsICJDcmVhdGluZyBP
UC1URUUgbm9kZSBpbiBkdGIiKTsKKworICAgIHJlcyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgImZp
cm13YXJlIik7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAgIHJlcyA9IGZkdF9iZWdp
bl9ub2RlKGZkdCwgIm9wdGVlIik7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAgIHJl
cyA9IGZkdF9wcm9wZXJ0eV9jb21wYXQoZ2MsIGZkdCwgMSwgImxpbmFybyxvcHRlZS10eiIpOwor
ICAgIGlmIChyZXMpIHJldHVybiByZXM7CisKKyAgICByZXMgPSBmZHRfcHJvcGVydHlfc3RyaW5n
KGZkdCwgIm1ldGhvZCIsICJodmMiKTsKKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOworCisgICAg
cmVzID0gZmR0X2VuZF9ub2RlKGZkdCk7CisgICAgaWYgKHJlcykgcmV0dXJuIHJlczsKKworICAg
IHJlcyA9IGZkdF9lbmRfbm9kZShmZHQpOworICAgIGlmIChyZXMpIHJldHVybiByZXM7CisKKyAg
ICByZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBtYWtlX21lbW9yeV9ub2RlcyhsaWJ4bF9fZ2Mg
KmdjLCB2b2lkICpmZHQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB4Y19kb21faW1hZ2UgKmRvbSkKIHsKQEAgLTkzMyw2ICs5NTksOSBAQCBuZXh0X3Jlc2l6ZToK
ICAgICAgICAgaWYgKGluZm8tPmFyY2hfYXJtLnZ1YXJ0ID09IExJQlhMX1ZVQVJUX1RZUEVfU0JT
QV9VQVJUKQogICAgICAgICAgICAgRkRUKCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUoZ2MsIGZkdCwg
YWluZm8sIGRvbSkgKTsKIAorICAgICAgICBpZiAoaW5mby0+dGVlID09IExJQlhMX1RFRV9UWVBF
X09QVEVFKQorICAgICAgICAgICAgRkRUKCBtYWtlX29wdGVlX25vZGUoZ2MsIGZkdCkgKTsKKwog
ICAgICAgICBpZiAocGZkdCkKICAgICAgICAgICAgIEZEVCggY29weV9wYXJ0aWFsX2ZkdChnYywg
ZmR0LCBwZmR0KSApOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F17663C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzdi-0001q3-0m; Fri, 26 Jul 2019 12:48:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hqzdg-0001pv-7k
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:48:00 +0000
X-Inumbo-ID: 9831df8e-afa3-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9831df8e-afa3-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrXemUg4J7iuhLUGUEblreMMGFb6Fj5XMlnJwnh0QXbtZNGUBoy70zlWsy9YpPK8cL7TWWNeXtk4iUbkf+45YYaMDZh2bQOc8DDHXzC5hBudHs4uMNPuOYEbjr97jLpAksvYtKXPWPJ4YTC+1HoPzN4P5dIrudFx05VESeg9QMNy2Ekr6zuIndjeab0lnAHF7q5+/2hic/lbwAwHcs7/c/Z+twASfqX6b5UcPa0aHYwFjyeekMMSmgdjXq6JPrR5QOK3/GZt+pH+NAGeiVPgj9aTnA8PgK1Z4RN2Q913u6SKmUV7qaITLrnyui01y1wge8d6i4Mr6yCpWDZ3TSHlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54qDCgHGOv6WK2RenKY5q1KPCmsmQJjR8QGg7yLHdEw=;
 b=BQ73XsGlZAlIRKks5LaXS3qgv0/53SpVUGyLpCTZbs61M6TOay/qCR5OsR59dXDFnmqbJUCJxKgMzUigYTlXOMED8DyMYlgxjkiunpRvOpwZvY8j4bngWe7rNaZ9Fe6sxlv/ODFOpmxIaX+Thki3i9vUx/hqC4rsjPpt/jUDfI9VNzDE7mUqRKoKyqRtCCCy6Es3yKzxtGkslnuOZQkgLJmMIzaNN2bhMSobaI3d62c6TEEhp3AhB2exMqYVxXnySjQ+Xwm3ksAirpSzrmFWcp3atQOCycILt5q677MbDhLHyhuFi4xqslAlFdgP8d9fAwVRLRrgRbN508e0XPst7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54qDCgHGOv6WK2RenKY5q1KPCmsmQJjR8QGg7yLHdEw=;
 b=Y4qEAQ+4KpCo52iDk+/XZFWseT/lVMhTqjV9DxeGBX+GC9SKbnA5HtPdSJGoyOh89nQGwF1hQNsXQb4si66UO8OzZHcU49WII26JNfmi4TGFacAmeSMI0VpzEPBk57yDOJqhyZbBFe3cAda5uqa3MB6eRTbk1oBk1KMsnjqohNcGX4RQ6vlcuA7oa2AvsxvX+fdyIdz5vQnijQvX6n/AYe45ML3aMpE6LuPfH8b5Vz46h4QJlmbmdbLZbZMwGbUOiR+JZqkF4A4dTQpYuNNqavoPm2DRaTT15cLslVe77MgWmKTXll2IK4W62X/5nWCZVNVZKiZeQKTXRBPk2/jhuQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3746.eurprd03.prod.outlook.com (52.134.81.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 12:47:56 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 12:47:56 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 7/7] xen/arm: types: Specify the zero padding in the
 definition of PRIregister
Thread-Index: AQHVQZ6lXvwm3o0b10iCA+aCZUR7cabc3XOA
Date: Fri, 26 Jul 2019 12:47:55 +0000
Message-ID: <87imrphshw.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-8-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51809606-c5f6-48da-467f-08d711c77b4c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3746; 
x-ms-traffictypediagnostic: AM0PR03MB3746:|AM0PR03MB3746:
x-microsoft-antispam-prvs: <AM0PR03MB3746718AECE5289C4EA17B7CE6C00@AM0PR03MB3746.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(80792005)(64756008)(2616005)(3846002)(54906003)(446003)(316002)(99286004)(6116002)(76176011)(186003)(256004)(71190400001)(486006)(55236004)(305945005)(7736002)(36756003)(476003)(8936002)(6916009)(68736007)(81166006)(81156014)(8676002)(66066001)(102836004)(6506007)(86362001)(6512007)(478600001)(107886003)(6436002)(76116006)(53936002)(2906002)(91956017)(66946007)(66476007)(6486002)(26005)(66446008)(66556008)(6246003)(14454004)(11346002)(4326008)(5660300002)(229853002)(25786009)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3746;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BEhS5tOB8ZiLk3doR9T099c5TTLdU4wFtuAFWNyuLQtzuXRt0LfeFWqZooC19g/hVjG+6Gla8z0nGurWCxmO+LQN96YqAeBVp9lctLjjhGyjRf1UwC5SvIIKKRHg6Xc84vrpw3IAvie1pvWICfM461wMaCLISYHZSywoSndOlGqocKi2YebJQSke45BBn+/gMRokDki56FQhgFRSFxZC5VZILrBREp7it1rKUrYPHLhvjXNUBRBo9lVkgli79+t/a71QyBY7nye+hy79jmusqL04I/KdMFTvYGQs915N3R56lnlwD5UZUFwl9U4prbK0GojdU1WbXh//QvNB2eSQLU/hN1a7D70WK900uIQDSZACTCpGzl7GgHiTBGqeTq0HkoNionXpdFEo59brjfDKgPJa6gjmyiCtVyjmW8u811U=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51809606-c5f6-48da-467f-08d711c77b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 12:47:55.9575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3746
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: types: Specify the zero
 padding in the definition of PRIregister
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IFRoZSBkZWZpbml0aW9uIG9mIFBSSXJlZ2lzdGVyIHZh
cmllcyBiZXR3ZWVuIEFybTMyIGFuZCBBcm02NCAoMzItYml0IHZzCj4gNjQtYml0KS4gSG93ZXZl
ciwgc29tZSBvZiB0aGUgdXNlcnMgdXNlcyB0aGUgd3JvbmcgcGFkZGluZy4KdHlwZTogInVzZXJz
IHVzZSIKCj4gRm9yIG1vcmUgY29uc2lzdGVuY3ksIHRoZSBwYWRkaW5nIGlzIG5vdyBtb3ZlZCBp
bnRvIHRoZSBQUklyZWdpc3RlciBhbmQKPiB2YXJpZXMgZGVwZW5kaW5nIG9uIHRoZSBhcmNoaXRl
Y3R1cmUuCkknbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4gVGhlcmUg
YXJlIGxvdHMgb2YgY29kZQooZXNwZWNpYWxseSBpbiB2Z2ljKSB0aGF0IGRvZXMgbm90IHVzZSBw
YWRkaW5nIGF0IGFsbC4gTm93IGl0IHdpbGwgcHJpbnQKcGFkZGluZywgZXZlbiBpZiBvcmlnaW5h
bCBhdXRob3IgZG9lcyBub3Qgd2FudGVkIHRvLiBBbmQsIGhvbmVzdGx5IGl0IGlzCmhhcmQgdG8g
cGFyc2UgMTUtMTYgemVyb2VzIGluIGEgcm93LgoKSSBhbSBzdWdnZXN0aW5nIHRvIGFkZCBhbm90
aGVyIG1hY3JvIGxpa2UgUFJJcmVnaXN0ZXJfcGFkIG9yIHNvbWV0aGluZwpsaWtlIHRoYXQuCgo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0t
Cj4gIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS90eXBlcy5oIHwgIDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
dHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gaW5kZXggZWYzN2NhNmJkZS4uZjA2MmFl
NmY2YSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS90cmFwcy5jCj4gQEAgLTc5Nyw3ICs3OTcsNyBAQCBzdGF0aWMgdm9pZCBzaG93X3JlZ2lz
dGVyc18zMihjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKPgo+ICAgICAgaWYgKCBn
dWVzdF9tb2RlICkKPiAgICAgIHsKPiAtICAgICAgICBwcmludGsoIlVTUjogU1A6ICUwOCJQUkl4
MzIiIExSOiAlMDgiUFJJcmVnaXN0ZXIiXG4iLAo+ICsgICAgICAgIHByaW50aygiVVNSOiBTUDog
JTA4IlBSSXgzMiIgTFI6ICUiUFJJcmVnaXN0ZXIiXG4iLAo+ICAgICAgICAgICAgICAgICByZWdz
LT5zcF91c3IsIHJlZ3MtPmxyKTsKPiAgICAgICAgICBwcmludGsoIlNWQzogU1A6ICUwOCJQUkl4
MzIiIExSOiAlMDgiUFJJeDMyIiBTUFNSOiUwOCJQUkl4MzIiXG4iLAo+ICAgICAgICAgICAgICAg
ICByZWdzLT5zcF9zdmMsIHJlZ3MtPmxyX3N2YywgcmVncy0+c3Bzcl9zdmMpOwo+IEBAIC04MTUs
NyArODE1LDcgQEAgc3RhdGljIHZvaWQgc2hvd19yZWdpc3RlcnNfMzIoY29uc3Qgc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsCj4gICNpZm5kZWYgQ09ORklHX0FSTV82NAo+ICAgICAgZWxzZQo+
ICAgICAgewo+IC0gICAgICAgIHByaW50aygiSFlQOiBTUDogJTA4IlBSSXgzMiIgTFI6ICUwOCJQ
UklyZWdpc3RlciJcbiIsIHJlZ3MtPnNwLCByZWdzLT5scik7Cj4gKyAgICAgICAgcHJpbnRrKCJI
WVA6IFNQOiAlMDgiUFJJeDMyIiBMUjogJSJQUklyZWdpc3RlciJcbiIsIHJlZ3MtPnNwLCByZWdz
LT5scik7Cj4gICAgICB9Cj4gICNlbmRpZgo+ICAgICAgcHJpbnRrKCJcbiIpOwo+IEBAIC04MjMs
NyArODIzLDcgQEAgc3RhdGljIHZvaWQgc2hvd19yZWdpc3RlcnNfMzIoY29uc3Qgc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAgICBpZiAoIGd1ZXN0X21vZGUgKQo+ICAgICAgewo+ICAg
ICAgICAgIHByaW50aygiICAgICBTQ1RMUjogJSJQUklyZWdpc3RlciJcbiIsIGN0eHQtPnNjdGxy
X2VsMSk7Cj4gLSAgICAgICAgcHJpbnRrKCIgICAgICAgVENSOiAlMDgiUFJJcmVnaXN0ZXIiXG4i
LCBjdHh0LT50Y3JfZWwxKTsKPiArICAgICAgICBwcmludGsoIiAgICAgICBUQ1I6ICUiUFJJcmVn
aXN0ZXIiXG4iLCBjdHh0LT50Y3JfZWwxKTsKPiAgICAgICAgICBwcmludGsoIiAgICAgVFRCUjA6
ICUwMTYiUFJJeDY0IlxuIiwgY3R4dC0+dHRicjBfZWwxKTsKPiAgICAgICAgICBwcmludGsoIiAg
ICAgVFRCUjE6ICUwMTYiUFJJeDY0IlxuIiwgY3R4dC0+dHRicjFfZWwxKTsKPiAgICAgICAgICBw
cmludGsoIiAgICAgIElGQVI6ICUwOCJQUkl4MzIiLCBJRlNSOiAlMDgiUFJJeDMyIlxuIgo+IEBA
IC04OTUsNyArODk1LDcgQEAgc3RhdGljIHZvaWQgc2hvd19yZWdpc3RlcnNfNjQoY29uc3Qgc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgcHJpbnRrKCIgICBGQVJfRUwxOiAl
MDE2IlBSSXg2NCJcbiIsIGN0eHQtPmZhcik7Cj4gICAgICAgICAgcHJpbnRrKCJcbiIpOwo+ICAg
ICAgICAgIHByaW50aygiIFNDVExSX0VMMTogJSJQUklyZWdpc3RlciJcbiIsIGN0eHQtPnNjdGxy
X2VsMSk7Cj4gLSAgICAgICAgcHJpbnRrKCIgICBUQ1JfRUwxOiAlMDgiUFJJcmVnaXN0ZXIiXG4i
LCBjdHh0LT50Y3JfZWwxKTsKPiArICAgICAgICBwcmludGsoIiAgIFRDUl9FTDE6ICUiUFJJcmVn
aXN0ZXIiXG4iLCBjdHh0LT50Y3JfZWwxKTsKPiAgICAgICAgICBwcmludGsoIiBUVEJSMF9FTDE6
ICUwMTYiUFJJeDY0IlxuIiwgY3R4dC0+dHRicjBfZWwxKTsKPiAgICAgICAgICBwcmludGsoIiBU
VEJSMV9FTDE6ICUwMTYiUFJJeDY0IlxuIiwgY3R4dC0+dHRicjFfZWwxKTsKPiAgICAgICAgICBw
cmludGsoIlxuIik7Cj4gQEAgLTkzNCw3ICs5MzQsNyBAQCBzdGF0aWMgdm9pZCBfc2hvd19yZWdp
c3RlcnMoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAgICBwcmludGsoIlxu
Iik7Cj4KPiAgICAgIHByaW50aygiIFNDVExSX0VMMjogJTA4IlBSSXgzMiJcbiIsIFJFQURfU1lT
UkVHMzIoU0NUTFJfRUwyKSk7Cj4gLSAgICBwcmludGsoIiAgIEhDUl9FTDI6ICUwMTYiUFJJcmVn
aXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhIQ1JfRUwyKSk7Cj4gKyAgICBwcmludGsoIiAgIEhDUl9F
TDI6ICUiUFJJcmVnaXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhIQ1JfRUwyKSk7Cj4gICAgICBwcmlu
dGsoIiBUVEJSMF9FTDI6ICUwMTYiUFJJeDY0IlxuIiwgUkVBRF9TWVNSRUc2NChUVEJSMF9FTDIp
KTsKPiAgICAgIHByaW50aygiXG4iKTsKPiAgICAgIHByaW50aygiICAgRVNSX0VMMjogJTA4IlBS
SXgzMiJcbiIsIHJlZ3MtPmhzcik7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
dHlwZXMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vdHlwZXMuaAo+IGluZGV4IDMwZjk1MDc4Y2Iu
Ljg5YWFlMjVmZmUgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS90eXBlcy5oCj4g
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS90eXBlcy5oCj4gQEAgLTQxLDcgKzQxLDcgQEAgdHlw
ZWRlZiB1NjQgcGFkZHJfdDsKPiAgI2RlZmluZSBJTlZBTElEX1BBRERSICh+MFVMTCkKPiAgI2Rl
ZmluZSBQUklwYWRkciAiMDE2bGx4Igo+ICB0eXBlZGVmIHUzMiByZWdpc3Rlcl90Owo+IC0jZGVm
aW5lIFBSSXJlZ2lzdGVyICJ4Igo+ICsjZGVmaW5lIFBSSXJlZ2lzdGVyICIwOHgiCj4gICNlbGlm
IGRlZmluZWQgKENPTkZJR19BUk1fNjQpCj4gIHR5cGVkZWYgc2lnbmVkIGxvbmcgczY0Owo+ICB0
eXBlZGVmIHVuc2lnbmVkIGxvbmcgdTY0Owo+IEBAIC01MSw3ICs1MSw3IEBAIHR5cGVkZWYgdTY0
IHBhZGRyX3Q7Cj4gICNkZWZpbmUgSU5WQUxJRF9QQUREUiAofjBVTCkKPiAgI2RlZmluZSBQUklw
YWRkciAiMDE2bHgiCj4gIHR5cGVkZWYgdTY0IHJlZ2lzdGVyX3Q7Cj4gLSNkZWZpbmUgUFJJcmVn
aXN0ZXIgImx4Igo+ICsjZGVmaW5lIFBSSXJlZ2lzdGVyICIwMTZseCIKPiAgI2VuZGlmCj4KPiAg
I2lmIGRlZmluZWQoX19TSVpFX1RZUEVfXykKCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

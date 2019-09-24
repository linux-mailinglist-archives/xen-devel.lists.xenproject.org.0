Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D20BC701
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj8K-0007wW-TL; Tue, 24 Sep 2019 11:37:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCj8I-0007wM-Ti
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:37:27 +0000
X-Inumbo-ID: ae36ead8-debf-11e9-ae5c-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::606]) by localhost (Halon) with ESMTPS
 id ae36ead8-debf-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 11:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzBA/f2/5t4BYm+WyonAJ3x0JQxy3zKc9Dml3UO3wF/3jwp4JZrAK+dlMFMMDd2eH1m6w+v/XFRMKQOIcjGlvM2WdOf51W1Yv9vjfTC2ZHSQQSF2xw7TI3GuGYoNhXddneX+/cEDgTKMfLiDLjZCFilbUVh8D6oO70jFir2d2CWVJzK/IGItPt3Jfyt/C64ju3s/ElVCOMj0Q0uJz/A9dFv+/+yd53++S4fGmV2CUcUYWQiys9gO/ikLkSzvKVmMdTccpwF2oPsYtInpzGMznZ6U4BNb9vC9v9aoU9y2sOkRGv9DIPx6hDBTofJ89ShO3hkEr49XNMrEAB1/7x7+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLzU5aFVmGJ6tNyCUUAXas/sZsTJbtPHW/lqf1FhdwA=;
 b=FALcpVWfdG+26LxLPTQ81A26andpMLAeIpkfwCpxU1L7/BSWzTvlA9IGBtvT421IeyoketxaAPR5+Cd77om5DNujj0bV6sMOY26VInaT3CsSEPI2C2Ux2CXpdo1K00cmSHQvK8ThY00Pgyz6Wy3dMLj8O71w8NBpFd59MaFgXmqgR83RRi/qM13Ym7bk0enTVlwKTqXSCeGt0Gf3lMYpy4MbOCFjvmHmbUmh8GPQez35bDW/ohSH757NWH8kwlIJnNz6X0/IIvkqW/ICw3pTxA4kenY7g2EAGT91sro0vc66BhOr5612toSIwp495RoP2j1s2YD/kQFxMiK78hFE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLzU5aFVmGJ6tNyCUUAXas/sZsTJbtPHW/lqf1FhdwA=;
 b=MPpSQYaOLkKpfrYkvZADxrA7zSKIWT8Rl1PfU8unMugw+EwTpwL+KUmkPEk6jF05zLbqtmXAsCm4SB6qbdxauQ7F1LGEv/jzPD7WQ+03+pl+z/5ms3kYvZ8PTY7XgjrFlfbBErmKOrDt6vaL3Wayd2Nz15+X1H4piMAZAVg7wUI=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB3783.eurprd03.prod.outlook.com (20.177.37.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 11:37:24 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 11:37:24 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 4/6] xen/arm: optee: handle shared buffer translation
 error
Thread-Index: AQHVblIEDLSpGG3MwUmqKYBWTkOKG6c5CdYAgAGyYoA=
Date: Tue, 24 Sep 2019 11:37:24 +0000
Message-ID: <87ef069b7w.fsf@epam.com>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-5-volodymyr_babchuk@epam.com>
 <b6ddb159-463f-2e30-35b8-5aefae38b94f@arm.com>
In-Reply-To: <b6ddb159-463f-2e30-35b8-5aefae38b94f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad3abb0f-050f-4e85-17ce-08d740e391ef
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB3783; 
x-ms-traffictypediagnostic: AM6PR03MB3783:|AM6PR03MB3783:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB37835E74BDCB523B2AB7965FE6840@AM6PR03MB3783.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(14454004)(14444005)(6116002)(3846002)(36756003)(476003)(5660300002)(256004)(6486002)(6436002)(11346002)(2616005)(6512007)(25786009)(71200400001)(71190400001)(54906003)(6916009)(316002)(66066001)(26005)(102836004)(81166006)(8676002)(81156014)(486006)(446003)(2906002)(80792005)(8936002)(7736002)(6506007)(53546011)(305945005)(186003)(6246003)(229853002)(99286004)(76116006)(76176011)(66446008)(91956017)(64756008)(66556008)(66946007)(4326008)(55236004)(66476007)(86362001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB3783;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pjNmuwyQTPolTEv/Al9YgYzloKSje1CyPC0J+m/9fdUElX6/DG6rxsHF1XyplCwTEaegErPGon6Ztwv5dVbFzNt79D+JBc2CDFN1258NUJ8b6imdN7lepSOlNTUG4FZ4g37B/0JWRYjOm/LlgvhxDAfGgtH/18cJX7ryvnmh5PayDFZchXR9IkzUd8adIFYE0gjRoUoZZ/+U2ryIln8Cmnios6UMXCyNB2bGrg5sJ8ZhPKkNYmM0jY/lx3SCg8RO01+AYXUpDv0IxJuyC37+BCfITnrXcWOAveiee2i+3FyfUUWBuAQaxfmPRAtOJf52KwX4WZQc5HU0ZLu3o9mqWgMxUvJCNP/+8KMRDTIOyOkNGnv+EjMSvwovTF5erPXczt8gLWyfYPw9oU3SNZdSO7yaeVmAfCFIsV/OTYaE1Yg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3abb0f-050f-4e85-17ce-08d740e391ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 11:37:24.4906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TkXwwwZCcmR0fhUbEczKNATCKOksli7yrtk1LcP3g/5YMVmvSiDJd95GbSYKfySNSbiaV/Xk8JAXNyIcoxAJVUh9+a4ZIwtxFbE9wifPZbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3783
Subject: Re: [Xen-devel] [PATCH v2 4/6] xen/arm: optee: handle shared buffer
 translation error
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

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMTgvMDkvMjAx
OSAxOTo1MSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+ICsvKiBIYW5kbGVzIHJldHVybiBm
cm9tIFhlbi1pc3N1ZWQgUlBDICovCj4+ICtzdGF0aWMgdm9pZCBoYW5kbGVfeGVuX3JwY19yZXR1
cm4oc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqY2FsbCwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2htX3JwYyAqc2htX3JwYykKPj4g
K3sKPj4gKyAgICBjYWxsLT5zdGF0ZSA9IE9QVEVFX0NBTExfTk9STUFMOwo+PiArCj4+ICsgICAg
LyoKPj4gKyAgICAgKiBSaWdodCBub3cgd2UgaGF2ZSBvbmx5IG9uZSByZWFzb24gdG8gYmUgdGhl
cmUgLSB3ZSBhc2tlZCBndWVzdAo+PiArICAgICAqIHRvIGZyZWUgc2hhcmVkIGJ1ZmZlciBhbmQg
aXQgZGlkIGl0LiBOb3cgd2UgY2FuIHRlbGwgT1AtVEVFCj4+ICsgICAgICogdGhhdCBidWZmZXIg
YWxsb2NhdGlvbiBmYWlsZWQuIFdlIGFyZSBub3Qgc3RvcmluZyBleGFjdCBjb21tYW5kCj4+ICsg
ICAgICogdHlwZSwgb25seSB0eXBlIG9mIFJQQyByZXR1cm4uIFNvLCB0aGlzIGlzIHRoZSBvbmx5
IGNoZWNrIHdlCj4+ICsgICAgICogY2FuIHBlcmZvcm0gdGhlcmUuCj4+ICsgICAgICovCj4+ICsg
ICAgQVNTRVJUKGNhbGwtPnJwY19vcCA9PSBPUFRFRV9TTUNfUlBDX0ZVTkNfQ01EKTsKPgo+IEFz
IEkgcG9pbnRlZCBvdXQgaW4gdjEsIEFTU0VSVCgpIGlzIHByb2JhYmx5IHRoZSBsZXNzIGRlc2ly
YWJsZQo+IHNvbHV0aW9uIGhlcmUgYXMgdGhpcyBpcyBhbiBlcnJvciBwYXRoLgpMb29rcyBsaWtl
IEkgbWlzdW5kZXJzdG9vZCB5b3UgOigKCj4gQ2FuIHlvdSBleHBsYWluIHdoeSB5b3UgY2hvc2Ug
dGhhdCBvdmVyIHRoZSAzIHNvbHV0aW9ucyBJIHN1Z2dlc3RlZD8KSSB0aGluayBJIG5lZWQgc29t
ZSBjbGFyaWZpY2F0aW9uIHRoZXJlLiBBU1NFUlQoKSBpcyBhZG9wdGVkIHdheSB0byB0ZWxsCmFi
b3V0IGludmFyaWFudC4gQ2xlYXJseSwgdGhpcyBpcyBwcm9ncmFtbWluZyBlcnJvciBpZiBBU1NF
UlQoKSBmYWlscy4KCkJ1dCBJIHVuZGVyc3RhbmQsIHRoYXQgQVNTRVJUKCkgaXMgYXZhaWxhYmxl
IG9ubHkgaW4gZGVidWcgYnVpbGQuIFNvLCBpbgpyZWxlYXNlIGl0IHdpbGwgbmV2ZXIgZmlyZS4g
QXMgdGhpcyBpcyB2ZXJ5IHVubGlrZWx5IGVycm9yIHBhdGgsIGJ1Zwp0aGVyZSBjYW4gbGl2ZSBm
b3JldmVyLiBPa2F5LCBzbyBBU1NFUlQoKSBpcyB0aGUgbGVhc3QgZGVzaXJhYmxlIHdheS4KCldh
cm5pbmcgaXMgbm90IGVub3VnaCwgYXMgd2UgYXJlIGFscmVhZHkgaW4gaW5jb3JyZWN0IHN0YXRl
LgoKU28sIGJlc3Qgd2F5IGlzIHRvIGNyYXNoIGd1ZXN0LCBpdCB0aGlzIGNvcnJlY3Q/IEknbGwg
ZG8gdGhpcyBpbiB0aGUKbmV4dCB2ZXJzaW9uIHRoZW4uCgotLSAKVm9sb2R5bXlyIEJhYmNodWsg
YXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

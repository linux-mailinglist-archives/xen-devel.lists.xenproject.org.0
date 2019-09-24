Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637EBC9D4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClSJ-0005Qz-CR; Tue, 24 Sep 2019 14:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iClSH-0005Qi-RG
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:06:13 +0000
X-Inumbo-ID: 76f477e2-ded4-11e9-97fb-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::60b]) by localhost (Halon) with ESMTPS
 id 76f477e2-ded4-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2XC3riKIIinWnaVMrHpyty/LMWVA02R8jDAGHziObOy+X61/yTEyM+o6mHyacaTxZZMZ4cyzy16LNIQpj5XMBBe/6iH3WBVbDaBMojjsFMqihjrRZG1QUQd4FVgSEC9QfGrxsFkdgaTW2L0lLMxeD2b3sXdmjiI2XNnWIGv93lMKqz5pS6Myj12ofsHYp8ku7dX59A+z9s8ZwfrsIBHvAY/RrtaK+oQIWqcLYlzyJrTClIZWL4kLD118ofuiX4t0p5pRKMcITqEqsMqLu/BtCbcmklUpSMpxmci7fg6GlbvUhFHRDpsmmX66k+PDCD+UVvjdMm53TDuJ4tl0+j64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsUwyl6sWwpc+noh1WbXBzCk5wF43YCVajQSUvRiRbE=;
 b=aMjdwTXDlmxr2eKclO7/zk7Im2qL6Ns1o/II2KSUam6i+QQGuQCNAtLsEMhCDeINGiq2VREh3CrbNMPRYlKzIBXdgAPkijoev6qCTZhq46feRABwcdXi3HSBXTD6b2VzBGMfpDOEIyXpPV92RPAbN430MmHJ6Mh4lLefj1rbWmfz3ikOXCEn28nWWXViKjY6NDJVW8suFtC1nCXo4v37OfR2UnF5PDK43iHhXV3dSy6QMsNVTGdwlcHq4KnBbuLxjE/H0Efaq3MO7NPAAmfGC6Pqq0piavamtSY8aLkCOEZ0KGHWBpfpM9WLx7NMStgFpWSLh+iNeY5LoN/37vEL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsUwyl6sWwpc+noh1WbXBzCk5wF43YCVajQSUvRiRbE=;
 b=vL5C77d6KEO3EFmQPgdHFs/JBI+Gg7gegBV2vwPZq13QuJGHsPkzEmjTDhg8m2Orqyw1MEmRhvpYjf2z67u0KqxuKHslpfWrLcGUV9xHCdAHsU+S/H9cvEwyPhUJmTdhCr/H7AgEgUqDVfeIPYgqMErMov7AdLtSisvd2l8Ixx4=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB5284.eurprd03.prod.outlook.com (10.255.99.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 14:06:11 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 14:06:11 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH for-4.13] xen/arm: Implement workaround for Cortex A-57
 and Cortex A72 AT speculate
Thread-Index: AQHVcshSxoPdo79l10O4lpLJvULUNqc63N4A
Date: Tue, 24 Sep 2019 14:06:10 +0000
Message-ID: <87a7ataiwd.fsf@epam.com>
References: <20190924110749.18210-1-julien.grall@arm.com>
In-Reply-To: <20190924110749.18210-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1341912-49e7-4025-2193-08d740f85a9c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB5284; 
x-ms-traffictypediagnostic: AM6PR03MB5284:|AM6PR03MB5284:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB52842E27194199C3AF642A00E6840@AM6PR03MB5284.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(66066001)(81156014)(26005)(6486002)(6436002)(486006)(446003)(186003)(476003)(11346002)(2616005)(5660300002)(3846002)(229853002)(6116002)(14454004)(71190400001)(71200400001)(36756003)(2906002)(6246003)(6512007)(7736002)(478600001)(76116006)(4326008)(102836004)(6916009)(256004)(80792005)(91956017)(99286004)(25786009)(55236004)(76176011)(316002)(86362001)(54906003)(66446008)(66946007)(8936002)(107886003)(64756008)(8676002)(6506007)(66556008)(66476007)(305945005)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5284;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jz30Dehup3A495u3zsAHMTcY+4dcB7YC94LQZ/V5ZPsKeDbwFocF2Nvw3MJ2HWXDd7sCenJ/ikW5rBX+/j332PBi02SU98k03mejlFB+/3ldveACh8N7Ylfd8qNnWPFQ0xEF87wiuLlNCk27uepwr9VjqxnFMrBXVZVsjHRpImsFF9VfBZmTv0atDaqmCgJ0c8SdjoYVYOLwN4TAl+RJRlbOV8f8F8YcSTaOhK2WDvVrMkLrmNMNKjmXY8alzlzgkbmwxy5VnqEZCGTq6Qv+lsw7XunTOFsXxlw8wLW0tnnML2CqedsIvRKGNejCGpIjzguO/b1EXV4JuedDMVLXdm6CzbAJFObmxYLWXV5YXX2AV6pZ04YIUXOEnNGBolgAYTXmcWtxBwkOThRdMXW5DcAaglyJdcCdLe+buY7v4GU=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1341912-49e7-4025-2193-08d740f85a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 14:06:11.0382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8y0ArkiizOl9gzuOpyU+NbGuJqXm34ysCbk8E+soZJvUO3QHpj2hkKoLqQtUKzf3PqWGqs3U4h3Lomu0kzRyRonpYZAY2NNcWMo0DIk0f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5284
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Implement workaround for
 Cortex A-57 and Cortex A72 AT speculate
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

CgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBCb3RoIENvcnRleC1BNTcgKGVycmF0dW0gMTMxOTUz
NykgYW5kIENvcnRleC1BNzIgKGVycmF0dW0gMTMxOTM2NykgY2FuCj4gZW5kIHdpdGggY29ycnVw
dCBUTEJzIGlmIHRoZXkgc3BlY3VsYXRlIGFuIEFUIGluc3RydWN0aW9uIHdoaWxlIFMxL1MyCj4g
c3lzdGVtIHJlZ2lzdGVycyBpbiBpbmNvbnNpc3RlbnQgc3RhdGUuCj4KPiBUaGUgd29ya2Fyb3Vu
ZCBpcyB0aGUgc2FtZSBhcyBmb3IgQ29ydGV4IEEtNzYgaW1wbGVtZW50ZWQgYnkgY29tbWl0Cj4g
YTE4YmUwNmFjYSAieGVuL2FybTogSW1wbGVtZW50IHdvcmthcm91bmQgZm9yIENvcnRleC1BNzYg
ZXJyYXR1bSAxMTY1NTIyIiwKPiBzbyBpdCBpcyBvbmx5IG5lY2Vzc2FyeSB0byBwbHVtYiBpbiB0
aGUgY3B1ZXJyYXRhIGZyYW1ld29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CldpdGggYSBmZXcgbml0czoKClJldmlld2VkLWJ5OiBWb2xv
ZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cgo+IC0tLQo+ICBkb2Nz
L21pc2MvYXJtL3NpbGljb24tZXJyYXRhLnR4dCB8ICAyICsrCj4gIHhlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYyAgICAgICAgIHwgMTAgKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRh
LnR4dCBiL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0Cj4gaW5kZXggNmNkMTM2NmYx
NS4uY2YxOTNhNmQ0ZCAxMDA2NDQKPiAtLS0gYS9kb2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRh
LnR4dAo+ICsrKyBiL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0Cj4gQEAgLTQ4LDUg
KzQ4LDcgQEAgc3RhYmxlIGh5cGVydmlzb3JzLgo+ICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4
LUE1NyAgICAgIHwgIzg1MjUyMyAgICAgICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAgfAo+
ICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzgzMjA3NSAgICAgICAgIHwg
QVJNNjRfRVJSQVRVTV84MzIwNzUgICAgfAo+ICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1
NyAgICAgIHwgIzgzNDIyMCAgICAgICAgIHwgQVJNNjRfRVJSQVRVTV84MzQyMjAgICAgfAo+ICt8
IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzEzMTk1MzcgICAgICAgIHwgTi9B
Cj4gK3wgQVJNICAgICAgICAgICAgfCBDb3J0ZXgtQTcyICAgICAgfCAjMTMxOTM2NyAgICAgICAg
fCBOL0EKTG9va3MgbGlrZSB5b3UgbWlzc2VkIHRoZSBsYXN0IHwuCgpBbHNvLCBpcyB0aGlzICJB
Uk0iIG9yICJBcm0iPyBJIGJlbGlldmUgeW91IGFza2VkIG1lIHRvIHVzZXIgdGhlIGxhdHRlci4K
Cj4gIHwgQVJNICAgICAgICAgICAgfCBDb3J0ZXgtQTc2ICAgICAgfCAjMTE2NTUyMiAgICAgICAg
fCBOL0EgICAgICAgICAgICAgICAgICAgICB8Cj4gIHwgQVJNICAgICAgICAgICAgfCBNTVUtNTAw
ICAgICAgICAgfCAjODQyODY5ICAgICAgICAgfCBOL0EgICAgICAgICAgICAgICAgICAgICB8Cj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYwo+IGluZGV4IDZmNDgzYjJkOGQuLmRhNzJiMDI0NDIgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL2NwdWVycmF0YS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCj4g
QEAgLTQ4MSw2ICs0ODEsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxp
dGllcyBhcm1fZXJyYXRhW10gPSB7Cj4gICAgICAgICAgLmNhcGFiaWxpdHkgPSBBUk02NF9XT1JL
QVJPVU5EX0FUX1NQRUNVTEFURSwKPiAgICAgICAgICBNSURSX1JBTkdFKE1JRFJfQ09SVEVYX0E3
NiwgMCwgMiA8PCBNSURSX1ZBUklBTlRfU0hJRlQpLAo+ICAgICAgfSwKPiArICAgIHsKPiArICAg
ICAgICAuZGVzYyA9ICJBUk0gZXJyYXR1bSAxMzE5NTM3IiwKPiArICAgICAgICAuY2FwYWJpbGl0
eSA9IEFSTTY0X1dPUktBUk9VTkRfQVRfU1BFQ1VMQVRFLAo+ICsgICAgICAgIE1JRFJfQUxMX1ZF
UlNJT05TKE1JRFJfQ09SVEVYX0E3MiksCj4gKyAgICB9LAo+ICsgICAgewo+ICsgICAgICAgIC5k
ZXNjID0gIkFSTSBlcnJhdHVtIDEzMTkzNjciLAo+ICsgICAgICAgIC5jYXBhYmlsaXR5ID0gQVJN
NjRfV09SS0FST1VORF9BVF9TUEVDVUxBVEUsCj4gKyAgICAgICAgTUlEUl9BTExfVkVSU0lPTlMo
TUlEUl9DT1JURVhfQTU3KSwKPiArICAgIH0sCj4gICAgICB7fSwKPiAgfTsKCgotLSAKVm9sb2R5
bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

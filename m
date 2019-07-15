Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316969681
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:04:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2UJ-0007vx-1d; Mon, 15 Jul 2019 15:01:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn2UH-0007vq-3S
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:01:57 +0000
X-Inumbo-ID: 7c25f942-a711-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c25f942-a711-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 15:01:55 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 15:01:54 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 15:01:49 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 15:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hofg3HTdXEFbsaPiGCcfJ0aZg00+43ksKZdHnx5GL2k1s3bt2+UMMQYG9U850Aglto+cXKO7HaKxyujiwtmLRKbdduOp5QkU4tvgdqIPpbDU1bkOvVu1DF2vei0gLXZB0YfMoA1v4vl6CLBBC55KhjDBkkz0nC3W7weDVGeSRQYE8SjaH00kzWfghdoFyi7tnPYsqibYHhoSGff0+gfe7wlCr5605vjR+i/IwE/D4B8NTwVsdehE9PXXGR0eJA4kivvlJT9kE7MMrQ47pYg3FMwN4Qd2phv8vN2kH/FUFUoCtt6ZtxJbLgRX/qXduy0lBih9xxHiRY6qvvVYIYha2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2cazIOyh7LE75lofnhmeJoVVzFQKabxaZbFI4PDVMw=;
 b=gkAjp7OAei9mrkmJBEp8NCm1OAv44w/BYudroEwIWbYBOvR22s8+bVl8U6HaZYfBx9BGOOEqe/WcBAYa7X0ccRilFcMIfmVDe3q4Ky9dTADo5v0QzLPTcgHHHsJ3oQLQG4LnoPcDVBY6EniEJnns5DJioXsLqsJyYs9HB7UMK0Oykm5ueXc83RatIR8TF01uphsMjz+FdubDC2rJB7E7ePWycAR/gJhc17vDwoRI491UIsrGFiOL8DdtASEEYuv9oDk0YH/0okE6skdCzgW34VVyGTVKuhAbugdqNY8AOWxNEehkblog155a4UfMHQeudBeKi268mGJBWxAILHn1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3370.namprd18.prod.outlook.com (10.255.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 15:01:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 15:01:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/2] x86/traps: widen condition for logging
 top-of-stack
Thread-Index: AQHVOx458UZbeIiSyUGxKqSxhGezcA==
Date: Mon, 15 Jul 2019 15:01:48 +0000
Message-ID: <c7d800a0-6a4f-83e6-de3e-e58ad0d7ec10@suse.com>
References: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
In-Reply-To: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:8:1::42) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf2c5d65-5512-4a30-250e-08d709355c52
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3370; 
x-ms-traffictypediagnostic: DM6PR18MB3370:
x-microsoft-antispam-prvs: <DM6PR18MB33707A44F015CB8B17E18FBBB3CF0@DM6PR18MB3370.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(189003)(199004)(8936002)(68736007)(6486002)(81156014)(81166006)(71200400001)(31686004)(71190400001)(2906002)(99286004)(53936002)(4326008)(2351001)(5640700003)(54906003)(316002)(6436002)(6512007)(66066001)(478600001)(102836004)(36756003)(14454004)(26005)(66946007)(80792005)(186003)(31696002)(5660300002)(8676002)(86362001)(52116002)(6916009)(256004)(76176011)(7736002)(305945005)(446003)(11346002)(2501003)(6116002)(3846002)(2616005)(476003)(4744005)(486006)(66556008)(66476007)(66446008)(64756008)(25786009)(6506007)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3370;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hVHG+8vBIrk6ja2ibC8ybDEEbkLJO6RqDQRirMbeEa200MEF7XygXH+2KoHCtvTEmOj0e6RC+t5vtNelFu2dna2Y7K8j9ukDnfGdXIOB8jaeg9VKrx0RWJFtFxpXoBYfnTsbWJKJmDPJL1LbBNFH8w9J3o8djA7ppIsiX464JH/9z9J2dMNYEpiQETW/Cqma5Tp8Dufz5AsflX1MpI/CruU3BZtmlLH3WcylKKnanYrZS3j1TEAPpzRnwApoNuwBUZXaZPPviVK+7frLauYK0/chue9bKasINNYMNYVzsbG24w4/jgLa+fvA/vkNyC9GPbp7k61koksnAwffcT9XYH8eDFz02g6Wqs0UB542acs2SJgBiXXwm3Tma/khQnFNULtRcc3uN/j4lMwdbsp1s1qa57cY+kJD40kc/klPoBY=
Content-ID: <F6AFE4508F791B4B9A2A4817101EF5A8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2c5d65-5512-4a30-250e-08d709355c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 15:01:48.4737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3370
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 2/2] x86/traps: widen condition for logging
 top-of-stack
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVzcGl0ZSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciB0aGUgY29tcGlsZXIgbWF5IG9taXQgdGhl
IGZyYW1lIHBvaW50ZXIsDQpvZnRlbiBmb3IgcmVsYXRpdmVseSBzaW1wbGUgbGVhZiBmdW5jdGlv
bnMuIChUbyBnaXZlIGEgc3BlY2lmaWMgZXhhbXBsZSwNCnRoZSBjYXNlIEkndmUgcnVuIGludG8g
dGhpcyB3aXRoIGlzIF9wY2lfaGlkZV9kZXZpY2UoKSBhbmQgZ2NjIDguDQpJbnRlcmVzdGluZ2x5
IHRoZSBldmVuIG1vcmUgc2ltcGxlIG5laWdoYm9yaW5nIGlvbW11X2hhc19mZWF0dXJlKCkgZG9l
cw0KZ2V0IGEgZnJhbWUgcG9pbnRlciBzZXQgdXAsIGFyb3VuZCBqdXN0IGEgc2luZ2xlIGluc3Ry
dWN0aW9uLiBCdXQgdGhpcw0KbWF5IGJlIGEgcmVzdWx0IG9mIHRoZSBzaXplLW9mLWFzbSgpIGVm
ZmVjdHMgZGlzY3Vzc2VkIGVsc2V3aGVyZS4pDQoNCkxvZyB0aGUgdG9wLW9mLXN0YWNrIHZhbHVl
IGlmIGl0IGxvb2tzIHZhbGlkIF9vcl8gaWYgUklQIGxvb2tzIGludmFsaWQuDQoNCkFsc28gYW5u
b3RhdGUgYWxsIHN0YWNrIHRyYWNlIGVudHJpZXMgd2l0aCBhIG1hcmtlciwgdG8gaW5kaWNhdGUg
dGhlaXINCm9yaWdpbjoNClI6IHJlZ2lzdGVyIHN0YXRlDQpGOiBmcmFtZSBwb2ludGVyIGJhc2Vk
DQpTOiByYXcgc3RhY2sgY29udGVudHMNCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KLS0tDQp2MzogVGFnIHN0YWNrIGVudHJpZXMgY29uc2lzdGVudGx5
LCBidXQgZGlmZmVyZW50bHkgdGhhbiBpbiB2Mi4NCnYyOiBSZS1iYXNlIG92ZXIgY2hhbmdlcyB0
byBlYXJsaWVyIHBhdGNoLg0KDQotLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYw0KKysrIGIveGVu
L2FyY2gveDg2L3RyYXBzLmMNCkBAIC00MzMsNyArNDMzLDcgQEAgc3RhdGljIHZvaWQgX3Nob3df
dHJhY2UodW5zaWduZWQgbG9uZyBzcA0KICAgICAgew0KICAgICAgICAgIGFkZHIgPSAqc3RhY2sr
KzsNCiAgICAgICAgICBpZiAoIGlzX2FjdGl2ZV9rZXJuZWxfdGV4dChhZGRyKSApDQotICAgICAg
ICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcChhZGRyKSwgX3AoYWRkcikpOw0KKyAg
ICAgICAgICAgIHByaW50aygiICAgWzwlcD5dIFMgJXBTXG4iLCBfcChhZGRyKSwgX3AoYWRkcikp
Ow0KICAgICAgfQ0KICB9DQogIA0KQEAgLTQ3Niw3ICs0NzYsNyBAQCBzdGF0aWMgdm9pZCBfc2hv
d190cmFjZSh1bnNpZ25lZCBsb25nIHNwDQogICAgICAgICAgICAgIGFkZHIgID0gZnJhbWVbMV07
DQogICAgICAgICAgfQ0KICANCi0gICAgICAgIHByaW50aygiICAgWzwlcD5dICVwU1xuIiwgX3Ao
YWRkciksIF9wKGFkZHIpKTsNCisgICAgICAgIHByaW50aygiICAgWzwlcD5dIEYgJXBTXG4iLCBf
cChhZGRyKSwgX3AoYWRkcikpOw0KICANCiAgICAgICAgICBsb3cgPSAodW5zaWduZWQgbG9uZykm
ZnJhbWVbMl07DQogICAgICB9DQpAQCAtNTA1LDIxICs1MDUsMjYgQEAgc3RhdGljIHZvaWQgc2hv
d190cmFjZShjb25zdCBzdHJ1Y3QgY3B1Xw0KICAgICAgICovDQogICAgICBpZiAoIGlzX2FjdGl2
ZV9rZXJuZWxfdGV4dChyZWdzLT5yaXApIHx8DQogICAgICAgICAgICFpc19hY3RpdmVfa2VybmVs
X3RleHQodG9zKSApDQotICAgICAgICBwcmludGsoIiAgIFs8JXA+XSAlcFNcbiIsIF9wKHJlZ3Mt
PnJpcCksIF9wKHJlZ3MtPnJpcCkpOw0KLSAgICBlbHNlIGlmICggZmF1bHQgKQ0KKyAgICAgICAg
cHJpbnRrKCIgICBbPCVwPl0gUiAlcFNcbiIsIF9wKHJlZ3MtPnJpcCksIF9wKHJlZ3MtPnJpcCkp
Ow0KKw0KKyAgICBpZiAoIGZhdWx0ICkNCiAgICAgIHsNCiAgICAgICAgICBwcmludGsoIiAgIFtG
YXVsdCBvbiBhY2Nlc3NdXG4iKTsNCiAgICAgICAgICByZXR1cm47DQogICAgICB9DQorDQogICAg
ICAvKg0KLSAgICAgKiBFbHNlIFJJUCBsb29rcyBiYWQgYnV0IHRoZSB0b3Agb2YgdGhlIHN0YWNr
IGxvb2tzIGdvb2QuICBQZXJoYXBzIHdlDQotICAgICAqIGZvbGxvd2VkIGEgd2lsZCBmdW5jdGlv
biBwb2ludGVyPyBMZXRzIGFzc3VtZSB0aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBhDQorICAgICAq
IElmIFJJUCBsb29rcyBiYWQgb3IgdGhlIHRvcCBvZiB0aGUgc3RhY2sgbG9va3MgZ29vZCwgbG9n
IHRoZSB0b3Agb2YNCisgICAgICogc3RhY2sgYXMgd2VsbC4gIFBlcmhhcHMgd2UgZm9sbG93ZWQg
YSB3aWxkIGZ1bmN0aW9uIHBvaW50ZXIsIG9yIHdlJ3JlDQorICAgICAqIGluIGEgZnVuY3Rpb24g
d2l0aG91dCBmcmFtZSBwb2ludGVyLCBvciBpbiBhIGZ1bmN0aW9uIHByb2xvZ3VlIGJlZm9yZQ0K
KyAgICAgKiB0aGUgZnJhbWUgcG9pbnRlciBnZXRzIHNldCB1cD8gIExldCdzIGFzc3VtZSB0aGUg
dG9wIG9mIHRoZSBzdGFjayBpcyBhDQogICAgICAgKiByZXR1cm4gYWRkcmVzczsgcHJpbnQgaXQg
YW5kIHNraXAgcGFzdCBzbyBfc2hvd190cmFjZSgpIGRvZXNuJ3QgcHJpbnQNCiAgICAgICAqIGl0
IGFnYWluLg0KICAgICAgICovDQotICAgIGVsc2UNCisgICAgaWYgKCAhaXNfYWN0aXZlX2tlcm5l
bF90ZXh0KHJlZ3MtPnJpcCkgfHwNCisgICAgICAgICBpc19hY3RpdmVfa2VybmVsX3RleHQodG9z
KSApDQogICAgICB7DQotICAgICAgICBwcmludGsoIiAgIFs8JXA+XSAlcFNcbiIsIF9wKHRvcyks
IF9wKHRvcykpOw0KKyAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gUyAlcFNcbiIsIF9wKHRvcyks
IF9wKHRvcykpOw0KICAgICAgICAgIHNwKys7DQogICAgICB9DQogIA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

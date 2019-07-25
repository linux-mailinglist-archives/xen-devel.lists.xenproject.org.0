Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421FE74B37
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqac2-0007Ml-Jh; Thu, 25 Jul 2019 10:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqac0-0007Ll-T7
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:04:36 +0000
X-Inumbo-ID: 988d603a-aec3-11e9-a6fb-7f05c0be5013
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 988d603a-aec3-11e9-a6fb-7f05c0be5013;
 Thu, 25 Jul 2019 10:04:33 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:04:31 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:03:27 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:03:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgZ6H/c++uVVMggGNajlyNF3hQaHtgVPq0TPSpMlCuedRw0Ld+VVNZZQsGuWOyUIJxtM3SXoT9tB7jfIJgYfLI3o3X1/y3DXyisNB7oa+bOT1fD4pwU7SGozEU70zUzn+b54OJ7rqZgsinA21qn04VbvubSCyqTiWO1G7P2s9dEWHPbK8mh3qICeXZR+7zqAyU+uwR7YgA6j6ILH0bOzPvRP8hpPl7eyAkELxB0T6yw9CVgaCF8gN/7YPd9fXtprohJYj3HQKRBEOVFwYZtO/kzk3xuADun+v06NmA/NHfzYSj6KXBvGfR3pzaZgpdJ0IdzR24MZbHlbt5zSgVS3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BRqYAjOKXtpmbCJWGJY0duPcZghRuvCJ3XV/EdLOiA=;
 b=bkWlLx5pJgVZ+jkoSO5woS4OF8GqQ8MI/xJuGvsE2ZDknrlr4wEOz7+m7vtG/bc4/cTr0KdTz1OGpJVtPLl6cAZbnT+4qDJWY789So9u38zik6DJeAfEAXabiXg1sILKi8/2z+fOm22reX2W5sF1erfrcl6Vq+HLwfO8Zm5DgSuxmCzH8BU3sOUzPGMIiunQagT+qhRYMz4JYYF3Ivndh6fKNizAK+luZjX3mGN7fiCIKg/7bydSBS87tr5bBEVpy5pu2OJg53/s8aiR47ZdY6CddrCmkjCZn+/GILWZc0W/LlXIIwFgOLfSZ0Rf39Fs9xjBmOXmu02LUV/Sj0k53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 10:03:26 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 10:03:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Thread-Topic: [PATCH] tests/cpu-policy: fix format-overflow warning by null
 terminating strings
Thread-Index: AQHVQoNqxP3NLSDaSUO4Yjwj1hPOv6bbG1gA
Date: Thu, 25 Jul 2019 10:03:26 +0000
Message-ID: <8e756470-0209-deec-4f4d-17147586b144@suse.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
In-Reply-To: <20190725005326.3553-1-christopher.w.clark@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f68d0fb-181b-4fbd-9603-08d710e755f6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB31074FC87069D452FCB9EDE8B3C10@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(256004)(71200400001)(305945005)(36756003)(4326008)(54906003)(81166006)(102836004)(71190400001)(316002)(486006)(476003)(6116002)(53546011)(7736002)(2616005)(11346002)(99286004)(6512007)(1361003)(81156014)(8936002)(446003)(26005)(2906002)(6506007)(186003)(68736007)(3846002)(386003)(5640700003)(80792005)(31696002)(14454004)(76176011)(6916009)(6486002)(52116002)(6436002)(31686004)(6246003)(2501003)(478600001)(2351001)(86362001)(66946007)(66446008)(66556008)(64756008)(66476007)(25786009)(229853002)(5660300002)(8676002)(53936002)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dcRMuBlobOH7enCIHf4lmrHbVY9diOinbrjQ446qUszSjXPl7pC4PPkX3TuRBc+hsZNFsehghgaoumr/3QPj2ix3HDv6a9ZygYNSpvacFTQWVKQWOlOJDHeezj9C3+ytAteSjK5GLO3wNeTkSttPOJO0SHDqsZEPd+nWPGT3hE05lIkUGGmZTVrctVwLLn2phMhyugDaqkP62P2YL50jv5b/JNeIoPjmyNjmcmYIzt44GXTSFNNrJTI2eJvgsEK0bb9RIo3MvUtfBOlt+utE8UpICXJzJWlEMUd/nQh9MdvJEfNZuQ3AxykwARzBsJVjfk32HiFvO/uQZ9UTA8A0raBClJEwpytVrFJGYfoAuyfpixbePjpS96HQLAp3ApMax/BtGhK1jKBydu2EL+V51LgSe/8M1B8Ta+cdgi+x0nI=
Content-ID: <C446D82AEDAE434CA3DF0BEDA0E8919B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f68d0fb-181b-4fbd-9603-08d710e755f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:03:26.3307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3107
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
 Roger Pau Monne <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAwMjo1MywgY2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20gd3JvdGU6
DQo+IGdjYyA5LjEuMCByZXBvcnRzOg0KPiANCj4gfCB0ZXN0LWNwdS1wb2xpY3kuYzo2NDoxODog
ZXJyb3I6ICclLjEycycgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG5vdCBhIG51bC10ZXJtaW5hdGVk
IHN0cmluZyBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQ0KPiB8ICAgIDY0IHwgICAgICAgICAg
ICAgZmFpbCgiICBUZXN0ICclLjEycycsIGV4cGVjdGVkIHZlbmRvciAldSwgZ290ICV1XG4iLA0K
PiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+DQo+IHwgdGVzdC1jcHUtcG9saWN5LmM6MjA6MTI6IG5vdGU6IGlu
IGRlZmluaXRpb24gb2YgbWFjcm8gJ2ZhaWwnDQo+IHwgICAgMjAgfCAgICAgcHJpbnRmKGZtdCwg
IyNfX1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAgICBcDQo+IHwgICAgICAgfCAgICAgICAgICAg
IF5+fg0KPiB8IHRlc3QtY3B1LXBvbGljeS5jOjY0OjI3OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlz
IGRlZmluZWQgaGVyZQ0KPiB8ICAgIDY0IHwgICAgICAgICAgICAgZmFpbCgiICBUZXN0ICclLjEy
cycsIGV4cGVjdGVkIHZlbmRvciAldSwgZ290ICV1XG4iLA0KPiB8ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fg0KPiB8IHRlc3QtY3B1LXBvbGljeS5jOjQ0Ojc6IG5vdGU6
IHJlZmVyZW5jZWQgYXJndW1lbnQgZGVjbGFyZWQgaGVyZQ0KPiB8ICAgIDQ0IHwgICAgIH0gdGVz
dHNbXSA9IHsNCj4gfCAgICAgICB8ICAgICAgIF5+fn5+DQoNCkkgbXVzdCBiZSBtaXNzaW5nIHNv
bWV0aGluZyBoZXJlOiAlLjEycyBzYXlzIHRoYXQgbm8gbW9yZSB0aGFuIDEyDQpieXRlcyBhcmUg
dG8gYmUgcmVhZCBmcm9tIHRoZSBzdHJpbmcuIFRoZXJlJ3MgbnVsIHRlcm1pbmF0b3INCnJlcXVp
cmVkLiBUaGlzIGlzIHdoYXQgdGhlIHN0YW5kYXJkIHNheXMNCg0KIkNoYXJhY3RlcnMgZnJvbSB0
aGUgYXJyYXkgYXJlIHdyaXR0ZW4gdXAgdG8gKGJ1dCBub3QgaW5jbHVkaW5nKQ0KICB0aGUgdGVy
bWluYXRpbmcgbnVsbCBjaGFyYWN0ZXIuIElmIHRoZSBwcmVjaXNpb24gaXMgc3BlY2lmaWVkLCBu
bw0KICBtb3JlIHRoYW4gdGhhdCBtYW55IGJ5dGVzIGFyZSB3cml0dGVuLiBJZiB0aGUgcHJlY2lz
aW9uIGlzIG5vdA0KICBzcGVjaWZpZWQgb3IgaXMgZ3JlYXRlciB0aGFuIHRoZSBzaXplIG9mIHRo
ZSBhcnJheSwgdGhlIGFycmF5DQogIHNoYWxsIGNvbnRhaW4gYSBudWxsIGNoYXJhY3Rlci4iDQoN
CkZvciB0aGUgbW9tZW50IGl0IGxvb2tzIHRvIG1lIGFzIGlmIHRoZSBjb21waWxlciB3YXMgd3Jv
bmcgdG8NCmNvbXBsYWluLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

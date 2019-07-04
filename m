Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4A5F5C7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:38:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiy8c-0000hG-5p; Thu, 04 Jul 2019 09:34:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiy8a-0000hB-G2
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:34:44 +0000
X-Inumbo-ID: e851c48a-9e3e-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e851c48a-9e3e-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 09:34:43 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 09:34:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 09:32:06 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 09:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=becCkZ3x8Glqa+KYrnFdbIFym99Tf8B5V6IPonE2fWguSEE6biMw2QuBJBsSihP9JcC8iBXC6rPYDapBdJRaXbyLP8Bmdsha7mzVC5vpfIrhP+zvCQyw6tECSar9dI1s2O3/Z6IF8RaoK6xhFr7d5vDX0SrMnDmsodd66fJdRm0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8uUjJY61xiXwA0NSqkSyUwew+OXpS8jVq2DDzvyNHw=;
 b=EK2pVvqFf6+Mu8azjDWs45JDt9xX74R2xTeZxadBIiaCSs9qwUXJI9CM44++7kmXtOK10m5XpHDvz78S9TtCavSS7SJ7wzEXEJ6PnrV+CLF/t3UF2JL7qut2BJHOVq4D3fDvPCT4D/KHYxl0mF5mOqQLQ8UxZ3Tyc3uzttC7HaU=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3201.namprd18.prod.outlook.com (10.255.137.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 4 Jul 2019 09:32:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 09:32:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 01/15] x86/IRQ: deal with move-in-progress
 state in fixup_irqs()
Thread-Index: AQHVMbWZ9IwNX6bswEGaHnGKN9GVPKa6Mz+A
Date: Thu, 4 Jul 2019 09:32:05 +0000
Message-ID: <cbb64da8-c1df-2892-c8d2-529245354152@suse.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE90950200007800230069@prv1-mh.provo.novell.com>
 <2527ed0d-8372-faa3-a620-b98a57d2cf84@citrix.com>
In-Reply-To: <2527ed0d-8372-faa3-a620-b98a57d2cf84@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0070.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::47) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8ee5171-8669-4502-1e77-08d700627a21
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3201; 
x-ms-traffictypediagnostic: BY5PR18MB3201:
x-microsoft-antispam-prvs: <BY5PR18MB3201FB86852B322D08E86A97B3FA0@BY5PR18MB3201.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(189003)(199004)(36756003)(14454004)(76176011)(8676002)(476003)(52116002)(81156014)(81166006)(8936002)(68736007)(11346002)(26005)(80792005)(446003)(6246003)(99286004)(2616005)(72206003)(7736002)(25786009)(186003)(305945005)(14444005)(86362001)(66556008)(110136005)(66476007)(54906003)(5660300002)(66446008)(6506007)(53936002)(3846002)(4326008)(31696002)(66066001)(102836004)(6436002)(31686004)(64756008)(6486002)(478600001)(6116002)(66946007)(73956011)(2906002)(53546011)(256004)(486006)(6512007)(71190400001)(229853002)(316002)(386003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3201;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fZwZxENZs+RbJQqt5OGTVOKH2elpSIozq/0hNLSzbWLs8fXe/GOooKeBRqRt23ww96Dx+TuYVXOvYBceecsdsfuTjMrIhJp6v90KikAqo5RGs12LFimM9iqq4HiKNYnNtyI3/XJpfEGjzhQv5zwOPELiIwIm/g6thktbzDs4h19Vi6isR5mQg7ea0X+VjXQMop/BFhl7xsg40lMbsVI5K+X9jXFfR23MwGJYlh4HT+EQaG4pT9bngemBixZNOlXoMskSTsSfCFwYwhFyQUPMPnK3M+50+v24PpXpEdW20k7g37SH1ntjY3FqC6iREsgsbFkbqDi58NZEy75sdEra/qUJ23QIxpz+UGssv93QmOCk8lPKCYTW/2amnS0KGgeBFT/OxEaDKW/gUJrxg6zYUaqTV2oTxcA+W9w0qJOBMvI=
Content-ID: <057755BB1C36924D90C78CF51A520A89@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ee5171-8669-4502-1e77-08d700627a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 09:32:05.3679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3201
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 01/15] x86/IRQ: deal with
 move-in-progress state in fixup_irqs()
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNzozOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDUvMjAx
OSAxMTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBUaGUgZmxhZyBiZWluZyBzZXQgbWF5IHBy
ZXZlbnQgYWZmaW5pdHkgY2hhbmdlcywgYXMgdGhlc2Ugb2Z0ZW4gaW1wbHkNCj4+IGFzc2lnbm1l
bnQgb2YgYSBuZXcgdmVjdG9yLiBXaGVuIHRoZXJlJ3Mgbm8gcG9zc2libGUgZGVzdGluYXRpb24g
bGVmdA0KPj4gZm9yIHRoZSBJUlEsIHRoZSBjbGVhcmluZyBvZiB0aGUgZmxhZyBuZWVkcyB0byBo
YXBwZW4gcmlnaHQgZnJvbQ0KPj4gZml4dXBfaXJxcygpLg0KPj4NCj4+IEFkZGl0aW9uYWxseSBf
YXNzaWduX2lycV92ZWN0b3IoKSBuZWVkcyB0byBhdm9pZCBzZXR0aW5nIHRoZSBmbGFnIHdoZW4N
Cj4+IHRoZXJlJ3Mgbm8gb25saW5lIENQVSBsZWZ0IGluIHdoYXQgZ2V0cyBwdXQgaW50byAtPmFy
Y2gub2xkX2NwdV9tYXNrLg0KPj4gVGhlIG9sZCB2ZWN0b3IgY2FuIGJlIHJlbGVhc2VkIHJpZ2h0
IGF3YXkgaW4gdGhpcyBjYXNlLg0KPiANCj4gVGhpcyBzdWdnZXN0cyB0aGF0IGl0IGlzIGEgYnVn
Zml4LCBidXQgaXQgaXNuJ3QgY2xlYXIgd2hhdCBoYXBwZW5zIHdoZW4NCj4gdGhpbmdzIGdvIHdy
b25nLg0KDQpUaGUgdmVjdG9yIGNsZWFudXAgd291bGRuJ3QgZXZlciB0cmlnZ2VyLCBhcyB0aGUg
SVJRIHdvdWxkbid0IGdldA0KcmFpc2VkIGFueW1vcmUgdG8gYW55IG9mIGl0cyBwcmlvciB0YXJn
ZXQgQ1BVcy4gSGVuY2UgdGhlIGltbWVkaWF0ZQ0KY2xlYW51cCB0aGF0IGdldHMgZG9uZSBpbiB0
aGF0IGNhc2UuIEkgdGhvdWdodCB0aGUgMm5kIHNlbnRlbmNlDQp3b3VsZCBtYWtlIHRoaXMgY2xl
YXIuIElmIGl0IGRvZXNuJ3QsIGRvIHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBvbg0KaG93IHRvIGlt
cHJvdmUgdGhlIHRleHQ/DQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPj4gKysrIGIv
eGVuL2FyY2gveDg2L2lycS5jDQo+PiBAQCAtMjQxOCwxNSArMjQ2MiwxOCBAQCB2b2lkIGZpeHVw
X2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiDQo+PiAgICAgICAgICAgaWYgKCBkZXNjLT5o
YW5kbGVyLT5lbmFibGUgKQ0KPj4gICAgICAgICAgICAgICBkZXNjLT5oYW5kbGVyLT5lbmFibGUo
ZGVzYyk7DQo+PiAgIA0KPj4gKyAgICAgICAgY3B1bWFza19jb3B5KCZhZmZpbml0eSwgZGVzYy0+
YWZmaW5pdHkpOw0KPj4gKw0KPj4gICAgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsN
Cj4+ICAgDQo+PiAgICAgICAgICAgaWYgKCAhdmVyYm9zZSApDQo+PiAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPj4gICANCj4+IC0gICAgICAgIGlmICggYnJlYWtfYWZmaW5pdHkgJiYgc2V0X2Fm
ZmluaXR5ICkNCj4+IC0gICAgICAgICAgICBwcmludGsoIkJyb2tlIGFmZmluaXR5IGZvciBpcnEg
JWlcbiIsIGlycSk7DQo+PiAtICAgICAgICBlbHNlIGlmICggIXNldF9hZmZpbml0eSApDQo+PiAt
ICAgICAgICAgICAgcHJpbnRrKCJDYW5ub3Qgc2V0IGFmZmluaXR5IGZvciBpcnEgJWlcbiIsIGly
cSk7DQo+PiArICAgICAgICBpZiAoICFzZXRfYWZmaW5pdHkgKQ0KPj4gKyAgICAgICAgICAgIHBy
aW50aygiQ2Fubm90IHNldCBhZmZpbml0eSBmb3IgSVJRJXVcbiIsIGlycSk7DQo+PiArICAgICAg
ICBlbHNlIGlmICggYnJlYWtfYWZmaW5pdHkgKQ0KPj4gKyAgICAgICAgICAgIHByaW50aygiQnJv
a2UgYWZmaW5pdHkgZm9yIElSUSV1LCBuZXc6ICUqcGJcbiIsDQo+PiArICAgICAgICAgICAgICAg
ICAgIGlycSwgbnJfY3B1X2lkcywgJmFmZmluaXR5KTsNCj4gDQo+IFdoaWxlIEkgY2VydGFpbmx5
IHByZWZlciB0aGlzIHZlcnNpb24sIEkgc2hvdWxkIHBvaW50IG91dCB0aGF0IHlvdQ0KPiByZWZ1
c2VkIHRvIGFjY2VwdCBteSBwYXRjaGVzIGxpa2UgdGhpcywgYW5kIGZvciBjb25zaXN0ZW5jeSB3
aXRoIHRoZQ0KPiByZXN0IG9mIHRoZSBjb2RlYmFzZSwgeW91IHNob3VsZCBiZSB1c2luZyBjcHVt
YXNrX2JpdHMoKS4NCg0KT2gsIGluZGVlZC4gSSBndWVzcyBJIGhhZCBjb252ZXJ0ZWQgYSBkZWJ1
Z2dpbmcgb25seSBwcmludGsoKSBpbnRvDQp0aGlzIG9uZSB3aXRob3V0IG5vdGljaW5nIHRoZSBu
ZWNlc3NhcnkgdGlkeWluZywgdGhlIG1vcmUgdGhhdA0KZWxzZXdoZXJlIGluIHRoZSBzZXJpZXMg
SSdtIGFjdHVhbGx5IGRvaW5nIHNvIGFscmVhZHkuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

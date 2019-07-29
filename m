Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9478CF9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:37:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5nA-0006VQ-8s; Mon, 29 Jul 2019 13:34:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs5n8-0006VL-PF
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:34:18 +0000
X-Inumbo-ID: 8fc0f6f8-b205-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8fc0f6f8-b205-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:34:17 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 13:34:14 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 13:17:31 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 13:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQfdRIcVA2WA3fVykNwjwXN4pmNSR7E1PkFoFF611pvG6yKThL3QD6JgvLQJdUqXfyyh6YpJxtrvXXU1O+DS9QwiR6/nznvpz5kX1q7rJWuTQs0i9QF92GX1YdYorhWeE6gL9G2zDPX1RJgJWmlBdw40jhX6s5sBnQ/9dHwGblhN/jM2lM9UqPje1huZRRnqRnuZsPJdt9idgUgmlEGVIayNqj1EWJZWkSoKjjfBFiD352pwTe1XzshcmCBSpLxpAaHUrBuWO9CFzbVI3FvTom4Ds7RwJ2qc0TQipgBW+JgI3rK+4hLuHSkQYcq0svtAnOR/eGMSaphuHPT2mpZrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt5XUBdvJz1n6bhglTvkGfXvGb4wW3QuvCq6w7zNB3o=;
 b=ZhBRnyjRPqoqKxpPejudgLBleLBDGyORPjO9GWxXOqUOBO/GJIpKCQ3xDrpFX0+JuPtsn+w4uqbV1oGJSrHbK03/XgRLxI0rY3BpFE/hGkEYUay3POLQ9WuUkoX9tZeW/5Z/o+kaoJzcmLG87WWmdI2lP1lqDIo3QB1bIKEFN585/3XFMvo1lL+ICpeCJr8oyn9a/HSFl3KE/J+PRaXdl2Oy9Q8sFVsJJQw1SOhg13Nu1EsYKJjOzzDVQi3yNB3DefQbEh+KyBlQoPLMAWHkIdGRBfauWWWVMsU7uG9bE3Gkr08NU1eOdEMTtdRKb5BRzLT2XyrXh4sLCmUjbnoqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3187.namprd18.prod.outlook.com (10.255.139.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 13:17:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 13:17:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
Thread-Index: AQHVQ/FyveAxY3hrR029jOQeDtxaXKbhmAYA
Date: Mon, 29 Jul 2019 13:17:29 +0000
Message-ID: <a27cfac4-231b-e06c-11a9-5bf8f839fee2@suse.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-2-andrew.cooper3@citrix.com>
In-Reply-To: <20190726203222.4833-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0038.eurprd06.prod.outlook.com
 (2603:10a6:10:120::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e3dbdc4-1ee8-45f2-1bd4-08d714271b88
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3187; 
x-ms-traffictypediagnostic: BY5PR18MB3187:
x-microsoft-antispam-prvs: <BY5PR18MB318755311AE04849CEA069FDB3DD0@BY5PR18MB3187.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(189003)(199004)(6506007)(256004)(25786009)(53546011)(186003)(102836004)(26005)(386003)(6246003)(14444005)(3846002)(8936002)(80792005)(8676002)(81156014)(6116002)(81166006)(4326008)(305945005)(66066001)(486006)(99286004)(31686004)(11346002)(446003)(2616005)(476003)(76176011)(52116002)(68736007)(316002)(6916009)(66946007)(36756003)(54906003)(6436002)(86362001)(6512007)(66476007)(31696002)(229853002)(66556008)(66446008)(64756008)(71190400001)(71200400001)(5660300002)(2906002)(6486002)(7736002)(14454004)(478600001)(53936002)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3187;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ggt6e3rsGYVcZkMdBi1Ud2mslYjisxpbci7bGSll4rvBSp/dz/WrIz4ZyvsV/+p7iTOeAlP3LCfwn98yTI8RNiWO5qg+CgUwg9jQWnjQdfcHq2vop1S5fIEVYJX6/5rCF6eJ5wTzGISGAEmMbsrAhUSKwZLFt9akpdv5dsRCN8DeJsF7v0jg8THimeQwwLa3bKAYs0dmvaN1Anf1xdcDcHDP1+nfQgIjDLmgUclA6NszvAx/JOqlPKgR9nkldSocv0/DPQTPTLQSjtlJJhjR4K+Eues1SS5KkAO0oCUwkbhCm6cMORX03lJNC3M/L2OH595KroK5P3NjD1cN6S3GzfIC6YTl2B1w7tvvVClKyoYrlJUUhKYxtNlYliehKnDd7zhb5BrBoi3vmWuV1bhd0DshBci1pdWVcOtVO0WyTZI=
Content-ID: <D0CD0E3C1E6F474E886958F632BE04D0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3dbdc4-1ee8-45f2-1bd4-08d714271b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 13:17:29.5628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3187
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAyMjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gRnV0dXJlIGNoYW5n
ZXMgYXJlIGdvaW5nIHRvIG5lZWQgdG8gcGFnZSBhbGlnbiBzb21lIHBlcmNwdSBkYXRhLg0KPiAN
Cj4gVGhpcyBtZWFucyB0aGF0IHRoZSBwZXJjcHUgYXJlYSBuZWVkcyBzdWl0YWJseSBhbGlnbmlu
ZyBpbiB0aGUgQlNTIHNvIENQVTAgaGFzDQo+IGNvcnJlY3RseSBhbGlnbmVkIGRhdGEuICBTaHVm
ZmxlIHRoZSBleGFjdCBsaW5rIG9yZGVyIG9mIGl0ZW1zIHdpdGhpbiB0aGUgQlNTDQo+IHRvIGdp
dmUgLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkIGFwcHJvcHJpYXRlIGFsaWdubWVudC4NCj4gDQo+
IEluIGFkZGl0aW9uLCB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gc3BlY2lmeSBhbiBhbGlnbm1lbnQg
YXR0cmlidXRlIHRvDQo+IF9fREVGSU5FX1BFUl9DUFUoKS4gIFJld29yayBpdCBzbyB0aGUgY2Fs
bGVyIHBhc3NlcyBpbiBhbGwgYXR0cmlidXRlcywgYW5kDQo+IGFkanVzdCBERUZJTkVfUEVSX0NQ
VXssX1JFQURfTU9TVExZfSgpIHRvIG1hdGNoLiAgVGhpcyBoYXMgdGhlIGFkZGVkIGJvbnVzDQo+
IHRoYXQgaXQgaXMgbm93IHBvc3NpYmxlIHRvIGdyZXAgZm9yIC5ic3MucGVyY3B1IGFuZCBmaW5k
IGFsbCB0aGUgdXNlcnMuDQoNCkFuZCBpdCBoYXMgdGhlIG1lYW5pbmdmdWwgZG93bnNpZGUgb2Yg
bm93IGV2ZXJ5IHVzZSBzaXRlIG5lZWRpbmcgdG8gZ2V0DQp0aGluZ3MgcmlnaHQuIFRoaXMgaXMg
bm90IHJlYWxseSBhIHByb2JsZW0gc29sZWx5IGJlY2F1c2UNCl9fREVGSU5FX1BFUl9DUFUoKSBp
cyBhIGhlbHBlciBmb3IgYWxsIHRoZSByZWFsIERFRklORV9QRVJfQ1BVKigpLiBUaGUNCmdyZXAt
aW5nIGFyZ3VtZW50IGlzIG5vdCBhIHJlYWxseSBtZWFuaW5nZnVsIG9uZSBpbW8gYW55d2F5IC0g
eW91IGNvdWxkDQphcyB3ZWxsIGdyZXAgZm9yIERFRklORV9QRVJfQ1BVLg0KDQpBbnl3YXkgLSB0
aGlzIGlzIG5vdCBhbiBvYmplY3Rpb24gdG8gdGhlIGNob3NlbiBhcHByb2FjaCwganVzdCBhIHJl
bWFyay4NCkknZCBsaWtlIHRvIG5vdGUgdGhvdWdoIHRoYXQgeW91IGV4cGxpY2l0bHkgdW5kbyBz
b21ldGhpbmcgSSBoYWQgZG9uZQ0KKGlpcmMpLCBhbmQgSSBtYXkgZmluZCBvZGQgd2hlbiBydW5u
aW5nIGludG8gYWdhaW4gZG93biB0aGUgcm9hZCwNCnBvdGVudGlhbGx5IHJlc3VsdGluZyBpbiBh
biAidW5kby10aGUtdW5kbyIgcGF0Y2guIEkgdGhpbmsgd2UgcmVhbGx5DQpuZWVkIHRvIGZpbmQg
YSB3YXkgdG8gYXZvaWQgcmUtZG9pbmcgdGhpbmdzIHRoYXQgd2VyZSBkb25lIGludGVudGlvbmFs
bHkNCmluIGNlcnRhaW4gd2F5cywgd2hlbiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHZhcmlhbnRz
IGlzIG1lcmVseSBwZXJzb25hbA0KdGFzdGUuDQoNCj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IEBAIC0yOTMsMTQgKzI5Mywx
NSBAQCBTRUNUSU9OUw0KPiAgICAgICAgICBfX2Jzc19zdGFydCA9IC47DQo+ICAgICAgICAgICoo
LmJzcy5zdGFja19hbGlnbmVkKQ0KPiAgICAgICAgICAqKC5ic3MucGFnZV9hbGlnbmVkKikNCj4g
LSAgICAgICAqKC5ic3MpDQo+IC0gICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7DQo+
ICAgICAgICAgIF9fcGVyX2NwdV9zdGFydCA9IC47DQo+ICsgICAgICAgKiguYnNzLnBlcmNwdS5w
YWdlX2FsaWduZWQpDQoNCk5vdyB0aGlzIGlzIGEgY2FzZSB3aGVyZSBJIHRoaW5rIGFuIGV4cGxp
Y2l0IEFMSUdOKFBBR0VfU0laRSkgd291bGQgYmUNCmRlc2lyYWJsZTogSWYgdGhlIGxhc3QgaXRl
bSBpbiAuYnNzLnBhZ2VfYWxpZ25lZCB3YXMgbm90IGEgbXVsdGlwbGUgb2YNClBBR0VfU0laRSBp
biBzaXplLCB0aGVuIF9fcGVyX2NwdV9zdGFydCB3b3VsZCBsaXZlIG5lZWRsZXNzbHkgZWFybHks
DQpwb3NzaWJseSBpbmNyZWFzaW5nIG91ciBtZW1vcnkgb3ZlcmhlYWQgYnkgYSBwYWdlIHBlciBD
UFUgZm9yIG5vIGdhaW4NCmF0IGFsbC4NCg0KPiAgICAgICAgICAqKC5ic3MucGVyY3B1KQ0KPiAg
ICAgICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsNCj4gICAgICAgICAgKiguYnNzLnBl
cmNwdS5yZWFkX21vc3RseSkNCj4gICAgICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7
DQo+ICAgICAgICAgIF9fcGVyX2NwdV9kYXRhX2VuZCA9IC47DQo+ICsgICAgICAgKiguYnNzKQ0K
PiArICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOw0KPiAgICAgICAgICBfX2Jzc19l
bmQgPSAuOw0KDQpXaHkgaXMgdGhpcyBsYXN0IEFMSUdOKCkgbmVlZGVkPw0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

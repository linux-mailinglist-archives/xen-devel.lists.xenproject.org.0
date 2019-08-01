Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFF7DE07
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:38:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCBA-0005zI-Uw; Thu, 01 Aug 2019 14:35:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htCBA-0005zC-5u
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:35:40 +0000
X-Inumbo-ID: 9fe2c762-b469-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9fe2c762-b469-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:35:38 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  1 Aug 2019 14:35:34 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 1 Aug 2019 14:34:07 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 1 Aug 2019 14:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOzP7JOSAUBAnu1ztyZb9fJzpjVv4QpI6WRIzpE2Rjt0VXBBHs0L8XQiEDVAPRFZpNyg7k3l0is7ewBVrSgO2rCqI4IAgCYZlorWnKJPuIQ/+z4I1iuNEZpxWGwz60wGgdac/epYfCwZ5CSzA2XZ308Sk42bHAg/V33pn9n4dv5Luz7TPp5yiMqAndzc2F+cR032oNjOK5t2smi/CPN1CaHn2utE84pA49IoPIWD/AMlo0fd4F+MDgwKOgivQwewT2k0m7CDqrVfkStn1oqRghev+cK3wCgmg9ADmF+6GnrVhUeFCy03FU5NOwrzrXUGGtRtptPAk6DIdGArUiSRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oexHWcBZ3fjkw+si60HJ1mhC/TI1puqMAw7Z/pO2KA=;
 b=OEWddd6gc06dWy1Hv1iplgiBUdoPtmBxav5YZB4MeRu9yeTSmgIxDtkrpY43IyaI2eP8ZrGQZ0n2zGJG81wmC7yjQWlgKNsvZwCQFK5Z27gnL+V9Q5qb0Jd+NKGoAkPhJnac6EtLaSK4ekWu7Nrq60QBNRSeeDcTowVOjcivZ7qEmwlDWEzfw8xC9QWuhctudu4cjNp/M9is7zGnvOjLDsXPMHfplra8C5SJKm3CCHtYYQGxNU7PAzG199BqAfukeXXpICJQA8eYeq8PctlBklbYDJjQqPUW+QruTcS0DxmlFea5/Sh1l7Yv8UrWRAoSgoeFrtFwpAUkuFcrwwhY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3252.namprd18.prod.outlook.com (10.255.136.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 14:34:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 14:34:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Oleksandr <olekstysh@gmail.com>
Thread-Topic: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
Thread-Index: AQHVSHMGyAlemcbWoE2ESYTmEuHFv6bmVsbbgAAEHCWAAACGAA==
Date: Thu, 1 Aug 2019 14:34:05 +0000
Message-ID: <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
In-Reply-To: <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0044.eurprd05.prod.outlook.com
 (2603:10a6:4:67::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bbc4d0f-6e0d-4cbc-d13c-08d7168d4e1a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3252; 
x-ms-traffictypediagnostic: BY5PR18MB3252:
x-microsoft-antispam-prvs: <BY5PR18MB32521EAA20F45BE447E1CACCB3DE0@BY5PR18MB3252.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(199004)(189003)(31696002)(76176011)(52116002)(6246003)(6486002)(486006)(4744005)(80792005)(2906002)(3846002)(6116002)(86362001)(446003)(11346002)(386003)(6506007)(102836004)(2616005)(53936002)(186003)(14444005)(476003)(53546011)(99286004)(66066001)(305945005)(31686004)(71200400001)(256004)(36756003)(6512007)(26005)(66556008)(66946007)(64756008)(7736002)(5660300002)(68736007)(1411001)(316002)(71190400001)(66446008)(81156014)(6436002)(229853002)(6916009)(81166006)(54906003)(478600001)(8676002)(4326008)(8936002)(25786009)(66476007)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3252;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HRZ+vFQaC9/QBrsqV6h8UUyL5/HEAqhHfNdgrwwW69G6S54XLahIpXNorOuMDT7KVEPtUZLCqw1P4RjyRTC8jC1CqOS2fe9u35Ar/p7RgK49wiMBrp58ZW7dRZIjYN3YYnLuvGDdhBTE1pezk5yAYF7BLO4nRRhc/P46PxZEjh06cQ7WVLO04LT3VnVPirMF//Fc5lsrfaHHcoQMcpQA88NHWTwjGbCLFmtl6Y3pJmYsomhhfszlqAfX7n4dVYJ9qm9JQzr0U9JurzaBRxRYfZuL41okysxz5vySN/8PFcBWkpUKyk7QTSoTL3/hOtah2nIrbGUu/sOarQgeAbXlvF11x10xV5Clz9196rrQHsucrCCjxI4Y6FyLlfC51Vc79CCbCPmHV493CIHbw2kHXV8fRIQBLtli8gsoCjnzSHE=
Content-ID: <0251967289E0E241B7EAF89BD0FA89A3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbc4d0f-6e0d-4cbc-d13c-08d7168d4e1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 14:34:05.4473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3252
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxNjozMSwgT2xla3NhbmRyIHdyb3RlOg0KPiAgwqBUaGlzIGlzIG5lZWRl
ZCBmb3IgdGhlIHVwY29taW5nIFYyIG9mIHRoZSBJUE1NVSBkcml2ZXIgKEFSTSkgWzFdIHdoaWNo
IG1heSByZXF1ZXN0DQo+ICDCoGRlZmVycmVkIHByb2JpbmcgKHJldHVybnMgLUVQUk9CRV9ERUZF
UikgZGVwZW5kaW5nIG9uIHdoYXQgZGV2aWNlIHdpbGwgYmUgcHJvYmVkIHRoZSBmaXJzdA0KPiAg
wqAoUm9vdCBkZXZpY2UgbXVzdCBiZSByZWdpc3RlcmVkIGJlZm9yZSBDYWNoZSBkZXZpY2VzLiBJ
ZiBub3QgdGhlIGNhc2UsDQo+ICDCoGRyaXZlciB3aWxsIGRlbnkgZnVydGhlciBDYWNoZSBkZXZp
Y2UgcHJvYmVzIHVudGlsIFJvb3QgZGV2aWNlIGlzIHJlZ2lzdGVyZWQpLg0KPiANCj4gQXMgd2Ug
Y2FuJ3QgZ3VhcmFudGVlIGEgZml4ZWQgcHJlLWRlZmluZWQgb3JkZXIgZm9yIHRoZSBkZXZpY2Ug
bm9kZXMgaW4gRFQsIHdlIG5lZWQgdG8gYmUgcmVhZHkgZm9yIHRoZSBzaXR1YXRpb24gd2hlcmUg
ZGV2aWNlcyBiZWluZyBwcm9iZWQNCj4gaW4gImFueSIgb3JkZXIuIFNvLCBmcmFtZXdvcmsgKGRy
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMpIHdpbGwgYmUgbW9kaWZpZWQgYSBiaXQgdG8g
YmUgYWJsZSB0byBoYW5kbGUgLUVQUk9CRV9ERUZFUiByZXR1cm5pbmcgYnkgZHJpdmVyLg0KDQpJ
J20gc3VyZSB0aGlzIGNhbiBiZSBoYWQgd2l0aG91dCBpbnRyb2R1Y2luZyBhIG5ldyBlcnJvciBj
b2RlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

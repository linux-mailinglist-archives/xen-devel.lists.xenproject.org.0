Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BA7A3FD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOKk-0006rl-Hd; Tue, 30 Jul 2019 09:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsOKi-0006rR-D2
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:22:12 +0000
X-Inumbo-ID: 7f7a0274-b2ab-11e9-ab74-5bb5a42455d6
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f7a0274-b2ab-11e9-ab74-5bb5a42455d6;
 Tue, 30 Jul 2019 09:22:06 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:22:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:17:24 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbLdGruUKJKo72BekdE8SUHtW5nxXc0AdwCsEEamJCm3AyVkTsV1v0pwmekYfma3qXq4n14afJDRmCOmyzmeJmk0DrCbl1YAGLARUyDtfn9A94GD6jeIU/YuNFisYja1OXiSS7uy6q9vRU3z32hxRPZMptzt/djXwVQn+85YglF4hMVdPn6Wt2W8fwOraqg5T4f8/cpP3lFm8LyxRDXosf3rHff+KHi0r7RUeoDvI7zXSPSqLedZafdAdWX219+aTE6TheIwadKUGi8ewAPI8Tg/SdJ0iahVMcAi9X2D9ehVEBTq8+UNcO+dWx8P5qXvBwRoFGkxH7cOC7yjztMz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQSGqpbs1ISNeSc+d49++n04ytQIchLRhUbiraBhkBY=;
 b=NafAdPDJ7ttDlWnDqUgY9KabvvTShBATMSp3gjmV3k/ZRSRXAb81PaBL6ioYSdLroYOx0Iycbp8EGWFEo8KAwWhsX5wjkFtj2utDQCAND7O2z+gas/w+dr8HyuMzGorcWKtCPki55E5JemXYBx40zZWZMjul+eBl3E1JMV1ncLqkPI97j+yAN1d57s4Zcz7/5FWxsYdUOo6Rq+qFd4nvlMoVgT3Ar75UfWzSbLVPnoxrp+F/WCTp1AICsxuIBY2Hy9OZVXwlZOdfvNyvUZ91FQ+GvD+yCRTsKEb9AptREwCbdO+z053Iri3G+Y/INUt3QC7wciFtQ4RjOXbjeaE1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 09:17:23 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:17:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/6] domain: stash xen_domctl_createdomain
 flags in struct domain
Thread-Index: AQHVQu6akvnjr7AS1UCxO+8m8M4Duqbi6UsA
Date: Tue, 30 Jul 2019 09:17:22 +0000
Message-ID: <f1afdb08-b40d-99a7-1938-5a0ad8a66bc4@suse.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
 <20190725133920.40673-2-paul.durrant@citrix.com>
In-Reply-To: <20190725133920.40673-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c38c4bd-7704-4e57-a497-08d714cebad5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB32673F57722EFCDA9A172632B3DC0@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(71200400001)(4744005)(66446008)(64756008)(66556008)(66946007)(66476007)(71190400001)(31696002)(68736007)(8936002)(6436002)(31686004)(6486002)(476003)(86362001)(305945005)(7736002)(14454004)(229853002)(6246003)(6916009)(53936002)(446003)(2616005)(6506007)(25786009)(36756003)(11346002)(54906003)(4326008)(66066001)(186003)(102836004)(99286004)(2906002)(80792005)(5660300002)(7416002)(6116002)(53546011)(81156014)(478600001)(256004)(8676002)(486006)(81166006)(3846002)(76176011)(6512007)(316002)(52116002)(26005)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uA7cC5m2zWEWSWNJGOdeqLwCbnw9AY63KhtxRsVqh3r5DhcmmM2QeOZIMkrbqXb6fVActA8t9WT9K7IwRNPeZzpycVHuXthgYG/iTRnoaebxRXuyfDQLhQPPpfRWTQpmPgZDKcJ9TG0cBRFsY96ynmFHkMmm0I233xmFL2eReIyiFb1CQtwuSohxN9VOpz4bWSsJmaK7yPa5twrLiwvg6u7pvzuUurLz5v83hHhkQKmT7O+3PkqWW9sNOMhicA3yhOrYBFfgIY7KicCDo39sNjBzJLxTypIxBoW4uDYhnvi/7YeDoqRU47ySBCW2D1rSJsIlC31UYH8/dzRgzwdoVCP3MgNtO8aJq6Apo3hhYdp5k54prEepvMHS3q0iKI3vB14/Q7r1xR4dqc2U+fLZj47siHCLlNfJVVkGnUOhpkI=
Content-ID: <0ECDEECE48CF5143B64547D58187905C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c38c4bd-7704-4e57-a497-08d714cebad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:17:22.9804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/6] domain: stash
 xen_domctl_createdomain flags in struct domain
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPiBAQCAt
MzA2LDYgKzMwNiw3IEBAIGVudW0gZ3Vlc3RfdHlwZSB7DQo+ICAgDQo+ICAgc3RydWN0IGRvbWFp
bg0KPiAgIHsNCj4gKyAgICB1bnNpZ25lZCBpbnQgICAgIG9wdGlvbnM7ICAgICAgICAgLyogY29w
eSBvZiBjcmVhdGVkb21haW4gZmxhZ3MgKi8NCj4gICAgICBkb21pZF90ICAgICAgICAgIGRvbWFp
bl9pZDsNCj4gICANCj4gICAgICB1bnNpZ25lZCBpbnQgICAgIG1heF92Y3B1czsNCg0KSSB3YXMg
YWJvdXQgdG8gY29tbWl0IHRoaXMgd2hlbiBJIG5vdGljZWQgdGhlIHBsYWNlbWVudCBoZXJlOg0K
SSB0aGluayBpdCB3b3VsZCBiZSBwcmV0dHkgZ29vZCB0byByZXRhaW4gZG9tYWluX2lkIGFzIHRo
ZQ0KZmlyc3QgZmllbGQuIEknbGwgYmUgaGFwcHkgdG8gbWFrZSB0aGF0IGFkanVzdG1lbnQgd2hp
bGUNCmNvbW1pdHRpbmcsIGFzIGxvbmcgYXMgeW91IGFyZSBmaW5lIHdpdGggbWUgZG9pbmcgc28u
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

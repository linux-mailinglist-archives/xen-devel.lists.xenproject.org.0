Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B166D103
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8CU-0003WU-GL; Thu, 18 Jul 2019 15:20:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho8CT-0003Nz-HM
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:20:05 +0000
X-Inumbo-ID: 8455e093-a96f-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8455e093-a96f-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:20:04 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:20:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:19:50 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:19:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELFKfQXEsgSdZ3HcKgnGxjGMnnngXzGGMeVwnLUUZno2Px+FxyGTb1hhyu849toG41SHEQWyr8ipKr1D305t13ByQQhbREt3V1V/DubnRIigrZB7z4uLoyy9J8G1EJoXE8BbQadlvv9z56K2DUypY/e3YNDQL5JX+GPO1GxFQ18+I8Vp0qg0Qzd1cLNzBZeyz2QwGBufCdFIeAE6lTockhi09kLVyyj4BwvprNmtI79uPGpeK+rF0wN67HmCpy7PdvPsbC9MBGyibhaIiDj/p+nOefnvK8ruS45AKTW124O+BydpV+fffTDH95myVKBTNmzawcO7JppZNnKMpNbDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSzVHat8P5/Um51F8tL0xZ94BIgvFOfEPwySc/b1pvE=;
 b=msr7zx0bgPq/wqLHlek9Em66g+vJPuLM/EFm1YmYRqiHfCdvme3nGrUIQD5DxYb6QJAMzcKdBmzxPg9rOfQGhD+iSx6p1vE5Ju7pXHbOoKwjgmnCkWMt1EGDU8qkocY0yHzJwshfZ2Qx8UYaPTpSqQW0aNLK4XKq5NOuWwwIxRoxb/A6AsEeFtis+7VXgY/Ow0/bbgqnhfcTDpTS2cGML1YybGfvJ/62SLBsQzOcpg7mrjRUgsMZKen9hw58UhosBhWo7/erQWPWlSR7VCTVTMzm9nqD/hVf8TWPcz8ub5MGVS20ZbV+rV1q8jxAIShqfGuETIswVeucWhA7+VYPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2475.namprd18.prod.outlook.com (20.179.104.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:19:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:19:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xen/trace: Fix build with !CONFIG_TRACEBUFFER
Thread-Index: AQHVPXEjGxZD9sgSDUiWFm9J2OB9NabQfZOA
Date: Thu, 18 Jul 2019 15:19:49 +0000
Message-ID: <b2049b2e-48b4-e993-1225-fb596f834146@suse.com>
References: <20190718140005.15975-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190718140005.15975-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:6:14::48) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 789d0c7d-bdf1-4a37-5618-08d70b935ff3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2475; 
x-ms-traffictypediagnostic: DM6PR18MB2475:
x-microsoft-antispam-prvs: <DM6PR18MB2475A7C9E7CD3A1A25BB1969B3C80@DM6PR18MB2475.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(99286004)(71200400001)(71190400001)(8936002)(7736002)(31686004)(446003)(11346002)(68736007)(6436002)(256004)(6486002)(476003)(2616005)(3846002)(8676002)(305945005)(53936002)(25786009)(26005)(76176011)(102836004)(6246003)(36756003)(486006)(6506007)(386003)(53546011)(6116002)(6512007)(4744005)(80792005)(4326008)(229853002)(186003)(81166006)(52116002)(81156014)(14454004)(66946007)(64756008)(66446008)(66556008)(2906002)(478600001)(110136005)(86362001)(54906003)(66476007)(31696002)(5660300002)(66066001)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2475;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ih4T9+Yfy7CHUFfckmDQdfj7ZF15S7HDFeG5tx8sYgbZetTCcRaH0DNHFcc2z5/uIyfGaou2NuegwP5SdzrpW1nZNnP0V6/38UCBzRF/SsGc+6JUSBbdRhLLYdi5XvEC7ElSgFnKblBPWfZe8sW0XNIHoqXtWS0p/Wyo63gv+U9K6q/mvFl7QcF3SXxCKUA/TR5c9UWwArUlc6WIs5OJ25ho7HsNas9u75PRg0kjQLFOns5y8KSLmbVtxvOfzjabnuPuKjt/sK0P7mxnUEhj9CvxTTNVEi0WHnZMDd6ZvBAF9ngNqduCTYzE5tnDrKm6Mn9BXl+mEqL/GsVhzGSEonWmjPiDfjj/3wen0Tv6xX8W71zs6y75olYnJJjywWTHK8Jp8Vz7PS44alx8qVf9gyAwbWweUezNq//LxMGnQEw=
Content-ID: <6A9AAA9BD5617F428616BF5B851E65AC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 789d0c7d-bdf1-4a37-5618-08d70b935ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:19:49.6364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2475
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/trace: Fix build with
 !CONFIG_TRACEBUFFER
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNjowMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gR0NDIHJlcG9ydHM6
DQo+IA0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaHZtLmM6MjQ6MDoNCj4gL2xvY2FsL3hlbi5n
aXQveGVuL2luY2x1ZGUveGVuL3RyYWNlLmg6IEluIGZ1bmN0aW9uIOKAmHRiX2NvbnRyb2zigJk6
DQo+IC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi90cmFjZS5oOjYwOjEzOiBlcnJvcjog
4oCYRU5PU1lT4oCZDQo+IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0K
PiAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4gICAgICAgICAgICAgICBefn5+fn4NCj4gDQo+IElu
Y2x1ZGUgeGVuL2Vycm5vLmggdG8gcmVzb2x2ZSB0aGUgaXNzdWUuICBXaGlsZSB0d2Vha2luZyB0
aGlzLCBhZGQgY29tbWVudHMNCj4gdG8gdGhlICNlbHNlIGFuZCAjZW5kaWYsIGFzIHRoZXkgYXJl
IGEgZmFpciBkaXN0YW5jZSBhcGFydC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=

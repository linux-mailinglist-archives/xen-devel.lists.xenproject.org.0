Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97B6B940
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:33:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hngHp-00047J-1h; Wed, 17 Jul 2019 09:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hngHn-00047C-Hy
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:31:43 +0000
X-Inumbo-ID: a98940ce-a875-11e9-b8f8-4f31a98cb2f2
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a98940ce-a875-11e9-b8f8-4f31a98cb2f2;
 Wed, 17 Jul 2019 09:31:40 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 09:31:31 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 09:31:09 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 09:31:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHZaWAmSHkjcdJKFOlgI55ywhI1HcnkpfXF8iS+oHH3mJsmUlwh+uYzCwdpf++aHXftt2wFLHw1EZY+Zx4YAdl4PYq5/r03MJD/sK6FTGUrZ7wMNGqCD9tabhwMp9bGZV7s7HYdV00icoF+pkr6OBwc7//g1lZKUhQLDM9w4de2MsK2F6kJmCxOOlQJGTzr0HZk42hE6owmTlTQ0ItZyYaBFWgLcf/kY0URjTdD+d3vkiHX29Lma9esvc3H9CrWgnIrDOgmpLcjdZBlW5ulwvMr72GQbB0T0w+sJVAFGTNMDPdVRTrOv++6OcFIvw1gLIOLrmttiXqztr90UXxxUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw6qinWTIRycw955OedeaVtYx4Lvv6XaJ06zQPUxshE=;
 b=gDvkXX7so4lqAA/cMrC6OE/X4eeVWRd+fWdt08Wx6IIeYfBAF4hwK/Bt2wfUJsCiI3mjqDQpe2sl/kDSnxm0mLGGRNbutPSMgSSVfAox9x0NmApRWqYPJOsYb1iyQehZe7w9F/pkbETG8ptjnKSpjIjWmdir3ZFykFYvB+AWEpPvJKK3NUZQDrwBYnZdyeYIGMFhW3cuKLMM7gwyxiHU3KU1BQJB6pa92fYrg46Ud5pNKp7Y5gl5jXaoQxE9TXYeksW+REeEli6Y4r0TnyGOaJHO7AtLtlYMUY39OR/r/wnKM9VLP/aEy48f0ZSGDPQ+xYUyu5Zq7fvaWi9w+K8QrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2714.namprd18.prod.outlook.com (20.179.51.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 09:31:08 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:31:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 05/10] vm_event: Move struct vm_event_domain to
 vm_event.c
Thread-Index: AQHVO/joeWZMqMxaRUeisF2L2kXifabOjMKA
Date: Wed, 17 Jul 2019 09:31:08 +0000
Message-ID: <fa5b2ba3-ac7c-2d29-4a6e-4eba61b3963f@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <93d50867ea8e45270a180a8f93aaed5a89619510.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <93d50867ea8e45270a180a8f93aaed5a89619510.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:45::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0162fb41-df2d-4345-6812-08d70a997fa0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2714; 
x-ms-traffictypediagnostic: DM6PR18MB2714:
x-microsoft-antispam-prvs: <DM6PR18MB27143735B3F5EAF7DFEFFB72B3C90@DM6PR18MB2714.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(189003)(80792005)(7416002)(7736002)(99286004)(305945005)(68736007)(66066001)(8936002)(316002)(52116002)(186003)(446003)(8676002)(2616005)(11346002)(102836004)(26005)(14454004)(64756008)(66476007)(66556008)(81156014)(53936002)(6512007)(386003)(54906003)(66946007)(66446008)(81166006)(3846002)(6116002)(2906002)(36756003)(25786009)(6486002)(478600001)(256004)(6916009)(31696002)(6436002)(86362001)(486006)(229853002)(76176011)(71200400001)(5660300002)(6506007)(53546011)(71190400001)(31686004)(4744005)(6246003)(476003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2714;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y/jgrbLiQzY3vSlYZztEOccEmxY8KMQutTwOomxegb0Vw0k59z4+Wq/u65ck/edfDtuze1Mn2aTDiGp4IxeFilK9QGYVKiOuK7P6xgxHr1o9D9u76hfWoIWo3CepUWdvA+p5v8pqkDxLmMDvKqnxTge/cY/+OI0/QrHZcfjfyfLevJ2Pd3MZyR7QszB8H08RnYw8T0FNh2yBzhxm0F/XW8eJ50iEWc8o9z0MOrjABISWNjiWezSDcXTRvNcYhJ6qqPpfLCrovCA+akI4EjcWznJWiXxhQTbAloncjhyjf11C91+v1/j/S4W8O/BseFtSSgiOcMbbFu6uV2y7SJ4C2Sp1R466Ik0m5jntyT0FTOquGtg9geDLGMyBSVacmdvtbM5oH3CudbzandJYD+rMMDd1hA6MwaRh3rRspU5WBWc=
Content-ID: <0A0302A5D6A0D046ADA95D0E8C146B8A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0162fb41-df2d-4345-6812-08d70a997fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:31:08.4596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2714
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 05/10] vm_event: Move struct
 vm_event_domain to vm_event.c
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiBUaGUgdm1fZXZl
bnRfZG9tYWluIG1lbWJlcnMgYXJlIG5vdCBhY2Nlc3NlZCBvdXRzaWRlIHZtX2V2ZW50LmMgc28g
aXQncw0KPiBiZXR0ZXIgdG8gaGlkZSBkZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4NCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQo+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IC0t
LQ0KPiAgIHhlbi9jb21tb24vdm1fZXZlbnQuYyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDI2ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkNCg0KQWgsIGhlcmUgaXQgY29tZXMuIFRoaXMgd291bGQgYmV0dGVyIGhhdmUgYmVl
biBhaGVhZCBvZiB0aGUgb3RoZXINCmNoYW5nZSAod2hlcmUgSSBkaWQgY29tbWVudCkuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

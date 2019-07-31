Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FA7BC0F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:46:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskDz-0005j1-SH; Wed, 31 Jul 2019 08:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hskDy-0005ir-1y
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:44:42 +0000
X-Inumbo-ID: 6c8faf0a-b36f-11e9-bbea-b75124043df4
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c8faf0a-b36f-11e9-bbea-b75124043df4;
 Wed, 31 Jul 2019 08:44:38 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 08:44:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:31:30 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:31:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr4KO2XeEcWlQDoM+RdzbjnSDwL3jNU8s/vllWXfIHUgCY7QHrNywTiGO/VjQ76v7O6XG/Dl+mUKllhqOX/6mRjQ5PEePRAsPfSbhqgTtUyq4TifKJalTRvfcbT02ZVQ9QazPwTTbCI/1yY78jGDBXBX+p0QfLpivZvB+qcw/ZUdIbKg1vPf0NxbnVmwJayoBo+D0NjjsmkhTymN6nYBg8LUGntaWdHJZ8oKNr8gKPyXB+0A+eM0pTvv1MTmUaP4YrdAAOFi6KDCJ7LXgnpB3HASZUS+ghqNd4YcdEjdOYyIeD80fosVcyqP17ImZDG9VJtM92NMGU8YiPsqi93MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmHH34Z7/+R4S8PB94KAdMJBYMBTmIC4piUMHJmP1CQ=;
 b=jqvFd+QaTaAnAkC/iWLe04H0sW0CIkTD85zKD81KbNvGDiUJSihACKzQmd3myAwq9prwdrrV6LfqJTOhb/1Sa7L85er/QjrWwPlnxAYYfuhfp+vpyOiGC4FEH6K4W1KvEQbvR6GjyrFG8c719GfQtbbM/7VLxp3/kVRtWJpJ8CtS5vfY6ZMl+V/K7IEyqKMdLYkZM76lF94OwkL1X8Mauub3HuI/JUcOazNM6jgWx5/6/lqRhQgXsQnAq38WbRxpUsvdoXCeUFssk4mdHjpVmHUNFqa2tnveoX0GiYtroePAeh+tTvQghcqhGQmBIn+yjNk/tMaP+ERWH0cXOjSaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3259.namprd18.prod.outlook.com (10.255.173.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 08:31:29 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:31:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAVqcJ4ACQ4I9gACTsOWABkWlEIAAj2PVgAD0gQA=
Date: Wed, 31 Jul 2019 08:31:29 +0000
Message-ID: <ac522213-494c-3295-46ba-f8571cb8b6bf@suse.com>
References: <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
In-Reply-To: <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::45) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 929e43f0-7646-4536-d41a-08d715917c16
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3259; 
x-ms-traffictypediagnostic: DM6PR18MB3259:
x-microsoft-antispam-prvs: <DM6PR18MB32597999D2ACA78097B91D14B3DF0@DM6PR18MB3259.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(199004)(189003)(66476007)(66556008)(71200400001)(71190400001)(66066001)(99286004)(6436002)(2906002)(54906003)(486006)(53546011)(6506007)(386003)(66946007)(102836004)(229853002)(5024004)(256004)(31696002)(86362001)(4744005)(6246003)(478600001)(6116002)(6486002)(64756008)(66446008)(53936002)(76176011)(6512007)(3846002)(52116002)(305945005)(446003)(316002)(186003)(4326008)(476003)(7736002)(36756003)(107886003)(14454004)(26005)(8676002)(80792005)(8936002)(25786009)(68736007)(11346002)(6916009)(5660300002)(81166006)(81156014)(2616005)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3259;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SeKnkGttOAALw3FgehtiHBDPerkXhUWj5XQ7DTWtbf77CoWZSC3bhn5YZs4kZ+OyGyNdKJ/kiwRa5WHqvCiajOywXQZXF9GBr8jODw3RdOhlt0QfrC0nAgaOeaVtGCjTEArZn71sLiYeupWR7OWUNsfeud6KjSergYO9uS7rQId8ceXECMQjLGKfuSfyA+x7dNa5C7eZ4CyUIrUmP5pjz+9GB3qL4+q/UMqyRSror5nzr4+iZQxjjFRy6yzd6kMkwUEQxgKs87Q6dWW4X6BDwqAPk5Cbfte+Im7Vk3wehf1nye+UY2pJF9vuLHqdKYIKyj40nJGh4XqSwqNZn5A99/Bo4EthXy559t1jtjWiPxHBWER6LmrblzN1JWLh4DxwQPeSwQf+UAhmmMl6Cdbt0LL7XYcQkUJGccJcfxSHDNY=
Content-ID: <AE5C7912EE0A964F87AD27F066726333@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 929e43f0-7646-4536-d41a-08d715917c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 08:31:29.4445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3259
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxOTo1NSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4gU29ycnkgLS0g
Z290IGEgYml0IGRpc3RyYWN0ZWQgeWVzdGVyZGF5LiBBdHRhY2hlZCBpcyB0aGUgbG9nIHdpdGgg
b25seQ0KPiB5b3VyIGxhdGVzdCBwYXRjaCBhdHRhY2hlZC4gSW50ZXJlc3RpbmdseSBlbm91Z2gg
dGhlIGJveCBib290ZWQgZmluZQ0KPiB3aXRob3V0IHNjcmVlbiBhcnRpZmFjdHMuIFNvIEkgZ3Vl
c3Mgd2UncmUgZ2V0dGluZyBjbG9zZXIuLi4NCg0KSSdtIGFmcmFpZCBJIGNhbid0IG1ha2Ugc2Vu
c2Ugb2YgdGhpcyBhbmQgdGhlIHByaW9yIHJlc3VsdHM6IEFmYWljcw0KaXQgd2FzIG9ubHkgZGVi
dWdnaW5nIGNvZGUgd2hpY2ggZ290IGNoYW5nZWQsIHRoZSBhY3R1YWwgY29kZQ0KY2hhbmdlcyB0
byBhZGRyZXNzIHRoZSBpc3N1ZSByZW1haW5lZCB0aGUgc2FtZS4gSGVuY2UgdGhlIGVhcmxpZXIN
CnBhdGNoIHNob3VsZCBoYXZlIHdvcmtlZCB0b28sIGlmIHRoaXMgbGF0ZXN0IG9uZSBkb2VzLg0K
DQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

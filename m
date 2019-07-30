Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614817A3B8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:13:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsO91-0005W6-AV; Tue, 30 Jul 2019 09:10:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsO8z-0005In-Cw
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:10:05 +0000
X-Inumbo-ID: cf709678-b2a9-11e9-baa5-db1d1e418ea4
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf709678-b2a9-11e9-baa5-db1d1e418ea4;
 Tue, 30 Jul 2019 09:10:02 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:09:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:55:32 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZlHT4eXHW8N4J17HmIbU5gcZuCGsBn/HHVYVMIeTrayDrEjunOPphlj2PgdBqXnomEzGHP6TmJlYCuQpCOQANS9dw8qgr1snW+1YjIxGddHLc4BndcEYUOOZjw6vHbnth1TFwDlsn+BrqIXZXRO09DtjbcHlotzz+LVk8im8BiyMAf2+y4zfQHdcsi4XJAAXhbxsdM73BgPhDWmDClUK1HaSPUsR1HpiGuURqdb+h88VAMJyr2R8vKz2xk+MrzPE60224gQq1w7nSIbcNb5dgnJ/tUilK7E0WCNkapc2A1gorWlwMpVzC6ciiKHjv8xdGJ9KUix9VAVNQG0oXV55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjlHzNJobSHcwFSG2Kyg3mvhn2BC/h5rSEhIbIDbDq0=;
 b=l6LBtZSu8UzPu+DmdsNeqJCvY932O5trTlpaBVXaILyyrM6MYHC8Eqzb4orm9NDl071idbdMleO7OPHTGLbn4rJIIQ7KuqT/0QpmhhaDgcCLTuFSkyhOBdAECuQKAYqWcs01orGVKoWbFC2rwRU42FWzNDUMSca7kCko8P2fT0J3NCIGbgjPufs2IKXZvJacdSgYXk6T7QSLEovm8PZXxGYJpUt73UomaSq/c9Bbc3xhLMds8XEjwi5F6ezL5VczaLtUDrK1oHVqGW3reJpjEYySaDigxIeUL+pzV2bsf+VOzR92VVKaDo+9iavNnDETvpAUx8Oz1N4XrSTfS2sq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3377.namprd18.prod.outlook.com (10.255.139.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 08:55:30 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:55:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 05/10] xen/cpumask: Introduce a CPUMASK_PR() wrapper
 for printing
Thread-Index: AQHVRgbpJR+vHriez0+AHn/bSB7qcqbi3P2A
Date: Tue, 30 Jul 2019 08:55:29 +0000
Message-ID: <468dd9ea-5c84-ccaf-8590-80f613edbd52@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-6-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-6-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:5:16::18) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7c49355-5c75-4285-6144-08d714cbac24
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3377; 
x-ms-traffictypediagnostic: BY5PR18MB3377:
x-microsoft-antispam-prvs: <BY5PR18MB3377CFC339C5C6FE92E05BBCB3DC0@BY5PR18MB3377.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(199004)(189003)(478600001)(36756003)(68736007)(186003)(71200400001)(81166006)(316002)(71190400001)(102836004)(66476007)(6246003)(486006)(256004)(26005)(6512007)(53546011)(66066001)(53936002)(386003)(6506007)(54906003)(99286004)(64756008)(66446008)(66556008)(66946007)(6486002)(8936002)(6436002)(4326008)(86362001)(3846002)(25786009)(14454004)(2906002)(6116002)(31696002)(305945005)(5660300002)(6916009)(476003)(11346002)(76176011)(446003)(8676002)(81156014)(558084003)(7736002)(80792005)(31686004)(52116002)(229853002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3377;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: INfdHhq2nb2LtPdgLen3+0w7ue31oAf7xSVGd6M1FCQSMI3Zx+c+NSTlE8qCsQP9fwCHdbra/Z+VOkgmR1xCwSesBZLWBnJR9iS1BFky+F560VBNV6p9OYogb+Pp7xGNxeMSO6/NkmDtgQE0DMSZsWz5ED0CRmkBSr7jMPqn/PPXt8NOUK/p035xk9bFGJeP34HsREcZL5RU98ROS3k5lxOLTv9VI6MiHdwWnw43V0jsizQ/zrmxIuFRO8jJT5WpuhFwaLIu0nOdKXfiFpb7qFF/3wAQowa9pGKaWnvygCAaRU+mJV5zVJU6rFiKNVZvSj7v8Vf6vhJi1CUo24O66sU36n6z3bPwoPPu2sowBDSeME7cjoWzPv75LIrtVEoM+dIggR3SW6Heif/bVqeD7yr80S+zVtIjzqmBdxEvT/Q=
Content-ID: <38092F01E34C5845967EC449D40B517D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c49355-5c75-4285-6144-08d714cbac24
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:55:29.8924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3377
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 05/10] xen/cpumask: Introduce a
 CPUMASK_PR() wrapper for printing
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
Cc: Juergen Gross <JGross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gSGF2aW5nIHRvIHNw
ZWNpZnkgJ25yX2NwdV9pZCwgY3B1bWFza19iaXRzKGZvbyknIGZvciBhbGwgcHJpbnRpbmcgb3Bl
cmF0aW9ucw0KPiBpcyBxdWl0ZSByZXBldGF0aXZlLiAgSW50cm9kdWNlIGEgd3JhcHBlciB0byBo
ZWxwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

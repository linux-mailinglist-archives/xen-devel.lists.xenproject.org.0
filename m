Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C799E60887
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:58:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPcK-0005HU-1N; Fri, 05 Jul 2019 14:55:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjPcI-0005HI-77
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:55:14 +0000
X-Inumbo-ID: d48e8c10-9f34-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d48e8c10-9f34-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 14:55:12 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 14:54:46 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 14:52:20 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 14:52:20 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.139.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Fri, 5 Jul 2019 14:52:20 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 14:52:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v3 2/2] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVM0DNcGQvE/RYpkSilNVQSkasDaa8G/cA
Date: Fri, 5 Jul 2019 14:52:19 +0000
Message-ID: <d48a7ce8-547d-fa97-d7c2-e10535670587@suse.com>
References: <20190705144855.15259-1-paul.durrant@citrix.com>
 <20190705144855.15259-3-paul.durrant@citrix.com>
In-Reply-To: <20190705144855.15259-3-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2c1bf9c-6fb5-44c8-88bd-08d70158613b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3410; 
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-microsoft-antispam-prvs: <BY5PR18MB3410F5FA92B96DDA079936B1B3F50@BY5PR18MB3410.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(199004)(189003)(66556008)(66476007)(66446008)(64756008)(36756003)(73956011)(305945005)(66946007)(86362001)(102836004)(25786009)(6506007)(386003)(476003)(26005)(53546011)(11346002)(2616005)(446003)(7736002)(80792005)(2906002)(4744005)(6512007)(54906003)(99286004)(6916009)(14454004)(6436002)(5660300002)(316002)(6486002)(229853002)(31696002)(53936002)(7416002)(66066001)(31686004)(71200400001)(71190400001)(256004)(8676002)(81156014)(8936002)(186003)(81166006)(4326008)(486006)(6246003)(52116002)(76176011)(68736007)(72206003)(478600001)(3846002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3410;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cx4P4hKVqQpA9n+cT6oG3dDUN/U4QWslJbRgzzM4b6l9iJcD76RBzXfMdCd2+XLZu3oFfFrd+4Ss8dSCEk/HkfJIYp3SCCmJFTrv/ALUuY8MqJy1sZcReTuJyrFjKfz5dXKE8tFOycswhycMl/wZNgXkiqfdWYyPROpzTgWhbd1HI2fmZH1x69ZLBt7WF9Rl3ziGOeArqCXVkr8/jtAhl1cKjiWpXkWdBuUKDkod3lXxOcz3M8nlKAX+vYhCElL8W+Cj+xMjqKDx1Ra5nY0mE7bVDRNdf+9CW5ykB9U2dBYVryhy9apfqoAyelmga8SwHk/JHKeQeWr7axXk9Sgf646zXXB0zag8UTA9PpMl0Kxs4bUNlRToUlwpbpRgy2IhY9Kis54i2sQVLsqjPOO13w2c13x57TmFasnBab43sKw=
Content-ID: <EBF0F4307CFB3542B00E8DFCBB4443E4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c1bf9c-6fb5-44c8-88bd-08d70158613b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 14:52:19.8314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 2/2] xmalloc: add a Kconfig option to
 poison free pool memory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDcuMjAxOSAxNjo0OCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGlzIHBhdGNoIGFk
ZHMgWE1FTV9QT09MX1BPSVNPTiB0byB0aGUgS2NvbmZpZyBERUJVRyBvcHRpb25zLiBJZiBzZXQs
DQo+IGZyZWUgYmxvY2tzIChncmVhdGVyIHRoYW4gTUlOX0JMT0NLX1NJWkUpIHdpbGwgYmUgcG9p
c29uZWQgd2l0aCAweEFBDQo+IGJ5dGVzIHdoaWNoIHdpbGwgdGhlbiBiZSB2ZXJpZmllZCB3aGVu
IG1lbW9yeSBpcyBzdWJzZXF1ZW50bHkgYWxsb2NhdGVkLg0KPiBUaGlzIGNhbiBoZWxwIGluIHNw
b3R0aW5nIGhlYXAgY29ycnVwdGlvbiwgcGFydGljdWxhcmx5IHVzZS1hZnRlci1mcmVlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KKEknbSBw
b25kZXJpbmcgd2hldGhlciB0byBhZGQgdGhlIHN1Z2dlc3RlZCBibGFuayBsaW5lcyB3aGlsZQ0K
Y29tbWl0dGluZy4pDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=

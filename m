Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F686BC5C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 14:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnj1Q-0001NN-Ij; Wed, 17 Jul 2019 12:27:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnj1P-0001NI-6x
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 12:26:59 +0000
X-Inumbo-ID: 2a4e15b6-a88e-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.93]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a4e15b6-a88e-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 12:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCEZbudUBULSqCNy5ceRr7DDH9Tuj73qCRz0/waA5Wj2QgfhMxFg8iB+XzcTU4ndYofa/pFn75X/mkQ/DYnGrDvXDUa4SEiU66tfliVvLyhj8Di6VoyDfnusxl/y3QP9sGnLwS83nb7eghTjRkekslZnqXB0ExetVByFSFMF0aKp6d1/gJw0L8WbvKcJk0/aCtbE1G0ColusjjizeE6Y4U5lzHabwGSXsTFVEV+8oafqM+mj+usbXzMYg5CmzS2A1PH6I/gJ/N7iZOXhmcgfKuJNzlbun8iqGF3dblbVWoYlt4uXQO9XOlpG/VO9CllBXhGvocWB/uH9SAPvQemTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/2C4m9g/zbgccKKrt2/j4tIS4QzGs0tENy2W0aHciU=;
 b=PZ5V6VMjUaohZ1T3TqMYfjuCDri7eKcgCr7x5rMlxipAfm4ZXVTQWUjZTcG7E0tFh8adQNw4XQrU57iKto90WRHbbi0JIFWUkTjK3KVPg3f8g9L/dJaZjTHt+pW0KUwZSi0PHppyAHLEXy9yHzj94ti+MGUuAx45/t5ix4bPkgry6lSHENVusKMLcPhczwBT5OFVX176afkVs3Aw+7OG95AsqZARdb27ogWSA7LHWiuKJ7XESpDZ5EZMqPVRT1OTK3w3t+MPstbQTs267dT9JfXaTbEZmFy4+Y/qXAYjY8HwIKoELIltnAHlchubv6KVuHI2DzLfedUDbOM+ePm/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/2C4m9g/zbgccKKrt2/j4tIS4QzGs0tENy2W0aHciU=;
 b=RX6oL6/SYWWx4VZuuWrTgT7WFWT7icM3WlBwT5p6Ry3oS9C2bUtc4l+viM+xb4xGHdZtQjFiI14Hyqb1F6vl1wvxZFOtk3yL5x9X7Tnu603y6AMSoC3oaiFmWDr9h9MsAbel0eMU47i0unWFGXz4aUawoz6f87Rmdjbn12bnWKk=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB5462.eurprd02.prod.outlook.com (10.255.121.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 12:26:54 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 12:26:54 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2 05/10] vm_event: Move struct vm_event_domain to
 vm_event.c
Thread-Index: AQHVO/jbzD1oqCgvEEuasp+B2X266abOjMgAgAAxGIA=
Date: Wed, 17 Jul 2019 12:26:54 +0000
Message-ID: <2ebf4ff471c2e4f093bf76e366b17036b4daea23.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <93d50867ea8e45270a180a8f93aaed5a89619510.1563293545.git.ppircalabu@bitdefender.com>
 <fa5b2ba3-ac7c-2d29-4a6e-4eba61b3963f@suse.com>
In-Reply-To: <fa5b2ba3-ac7c-2d29-4a6e-4eba61b3963f@suse.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0210.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::30) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf38f8f3-408a-4f56-3147-08d70ab20d8d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB5462; 
x-ms-traffictypediagnostic: AM6PR02MB5462:|AM6PR02MB5462:
x-microsoft-antispam-prvs: <AM6PR02MB546279B3A1CC631237026684D6C90@AM6PR02MB5462.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(376002)(346002)(396003)(199004)(189003)(36756003)(118296001)(66066001)(7416002)(305945005)(7736002)(14454004)(4744005)(8676002)(81166006)(6916009)(229853002)(6436002)(486006)(6512007)(50226002)(6486002)(81156014)(8936002)(6246003)(4326008)(53936002)(5660300002)(66476007)(66556008)(71190400001)(71200400001)(256004)(66446008)(64756008)(386003)(53546011)(6506007)(102836004)(54906003)(316002)(76176011)(52116002)(86362001)(11346002)(2616005)(476003)(25786009)(446003)(478600001)(68736007)(26005)(99286004)(186003)(6116002)(3846002)(2906002)(66946007)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5462;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W/QZ5k8kzEA5a3szYEFfQ4RAbTUCJVUR0jQzN8jOCVmrdaccwLCayP41iHdvY4aI2frGDXbhzA0+axhN5SA7PMvDq/6W3ucfXhiueIOSMEMlwEhR+/RlXvjgFsv5W5E4OZpqYXxE7DNCKc2TFGi7iy5qEesr5errOeCGaWdlZsEyoc8sxnsWZ6WnfvRnxZrf72NUXVSacu13h9SLciBVEb6ZnIpjJavGMnMHaVoNbl4EzStyYy8djqrPOUzPjHxj8qmYdsZB7yLAhXb4OCQMi+Z76ZIvE4GoUjzQJPtbTw6Wac7OSzAJiwQGc7vZwQPrgPEHyWW+/b44BPL39m83QxamIE+WxSedWlrQC24C8pMOA/WOFrO6VHr9XaYMHWmt/zCZo0D4bzYdr8hgad1N3iSv2I2ilhHGvAnrgdEUjck=
Content-ID: <6FC61DE57AE8D845A0028913675D3739@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf38f8f3-408a-4f56-3147-08d70ab20d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 12:26:54.5627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5462
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDA5OjMxICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTYuMDcuMjAxOSAxOTowNiwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOg0KPiA+IFRoZSB2bV9l
dmVudF9kb21haW4gbWVtYmVycyBhcmUgbm90IGFjY2Vzc2VkIG91dHNpZGUgdm1fZXZlbnQuYyBz
bw0KPiA+IGl0J3MNCj4gPiBiZXR0ZXIgdG8gaGlkZSBkZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxz
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBi
aXRkZWZlbmRlci5jb20+DQo+ID4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+ID4gQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9jb21tb24vdm1fZXZlbnQuYyAgIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
IHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+IA0KPiBBaCwgaGVyZSBpdCBjb21l
cy4gVGhpcyB3b3VsZCBiZXR0ZXIgaGF2ZSBiZWVuIGFoZWFkIG9mIHRoZSBvdGhlcg0KPiBjaGFu
Z2UgKHdoZXJlIEkgZGlkIGNvbW1lbnQpLg0KPiANCj4gSmFuDQpJIHdpbGwgcmVvcmRlciB0aGUg
cGF0Y2hlcyBpbiB0aGUgbmV4dCBpdGVyYXRpb24uDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIGNv
bW1lbnRzLA0KUGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8031FE2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 18:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hX6XE-0000ZX-Tg; Sat, 01 Jun 2019 16:07:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lel2=UA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hX6XD-0000ZS-Mv
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 16:07:07 +0000
X-Inumbo-ID: 4bddc17d-8487-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.73]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4bddc17d-8487-11e9-8980-bc764e045a96;
 Sat, 01 Jun 2019 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/tIyejNijG027a0JEa3hMgkvRe0RwbhsCB+CRyANDw=;
 b=XO3VySum+8AtBioic1rApfPGwKnkHfUg4mZN2Zr4cdHtKSHWO+uJRAwwuUrMPniwnkU9MWaCwNi7QizA5VusOAnbpGT8zBrVAwg3esES1o7nEdiJXmOq4JhIri8hMAyE4FOwbCkX8skfB61qtDsLvSx0YoJQ9sNWzAlO29E7xNN9IWu0lGtW/us9OkK1RuityvXXI0g2djzpSyC1e2nVL9ZgaXNb2op4w4sfLws1wjPC0HwblSEBlauwsRTX54M48x4seDJZ1VDk9AX7/eBazrrCcAFWpn7qkaT/AmxDrKO9b1J3dno3X9PSTeTY36qunmLC10FUgamWF/IDnVRNJg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB5473.eurprd03.prod.outlook.com (10.255.182.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Sat, 1 Jun 2019 16:07:01 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1922.021; Sat, 1 Jun 2019
 16:07:01 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 00/10] TEE mediator (and OP-TEE) support in XEN
Thread-Index: AQHVGIlVzDL8mSGCTEW70ujDnLhEbqaG9wMA
Date: Sat, 1 Jun 2019 16:07:00 +0000
Message-ID: <8736kt8f2z.fsf@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <06a4f534-e671-004c-93bb-31b60ed77d28@arm.com>
In-Reply-To: <06a4f534-e671-004c-93bb-31b60ed77d28@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 748720d2-6716-4a20-d58d-08d6e6ab2e4b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5473; 
x-ms-traffictypediagnostic: AM0PR03MB5473:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB5473DBCAE8B1538A7173F2D9E61A0@AM0PR03MB5473.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00550ABE1F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(68736007)(72206003)(316002)(6506007)(229853002)(6306002)(558084003)(25786009)(2616005)(6512007)(76176011)(11346002)(99286004)(102836004)(6486002)(55236004)(80792005)(446003)(66066001)(6246003)(2906002)(478600001)(6916009)(53936002)(14454004)(6436002)(36756003)(966005)(71190400001)(71200400001)(66476007)(86362001)(76116006)(91956017)(66446008)(64756008)(8676002)(81166006)(81156014)(7416002)(5660300002)(66556008)(66946007)(476003)(186003)(4326008)(3846002)(7736002)(305945005)(73956011)(54906003)(8936002)(6116002)(256004)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5473;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TBm+y4cBtT4upLk+h6s1uOkFzHQ1thX73FCcyHBiLKxnsQKC1+TI9Jk4gScZEVPJCVy5q7o2hp6SaHi/JxJz/0MWkjtRlGwEFMeb6ji6Gl9k0S92NRt2MDYn7eXA+76WS6KWPZLS9ehxCRfJ4NNbe14dOF64bQQjOxfk3arPhSLgYTdYuh7RoT7aHn1IUlY8gpNC9J/xGJgIxj3JSo/jhQpUxRAa4FKsrvsA69LZsb81u0pPkgTIV9z5W08jvuGjPBooIrqnviJi0qOyHBhnc5vL2/C7WHUawmSje+R2/Pz6QOvG/qbwp7zEh6m0SlQTj2GSjDAKUmw1uhzWpczv+3YNyUG4qvmoz/xBoeA2Hfa0N8KPVzxJOVjn16SqHFojjhgJaIufAkCsELoN9FamE3cdgymoSC6nb83pM7TuWBg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748720d2-6716-4a20-d58d-08d6e6ab2e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2019 16:07:00.8734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5473
Subject: Re: [Xen-devel] [PATCH v5 00/10] TEE mediator (and OP-TEE) support
 in XEN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IEkg
dHJpZWQgdG8gYXBwbHkgdGhlIHBhdGNoZXMgdG8gc3RhZ2luZyBidXQgZmFpbCBiZWNhdXNlIHRo
ZSBwYXRjaGVzCj4gY29udGFpbnMgPTIwLiBEbyB5b3UgaGF2ZSBhIHRyZWUgd2l0aCB0aGUgc2Vy
aWVzIGFwcGxpZWQ/CgpTdXJlLCB5b3UgY2FuIGZpbmQgdGhlbSBhdCBbMV0KClsxXSBodHRwczov
L2dpdGh1Yi5jb20vbG9yYy94ZW4vdHJlZS9vcHRlZV92NQoKLS0gCkJlc3QgcmVnYXJkcywgVm9s
b2R5bXlyIEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F11093BE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 19:52:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZJQN-00019i-TT; Mon, 25 Nov 2019 18:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pm/i=ZR=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1iZJQN-00019d-4T
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 18:49:27 +0000
X-Inumbo-ID: 424c2740-0fb4-11ea-9455-bc764e2007e4
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 424c2740-0fb4-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 18:49:19 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 25 Nov 2019 18:46:26 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 25 Nov 2019 18:44:25 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 25 Nov 2019 18:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGw+aw4FFmAUV6FLXZf7Znflr6ZdGxnVPkXvkET3JvRjoHoXnyR3Kp6AJstTjCrKUgZLOIGzd815GUVcpDsFzW+d7BalsxjrSQA5agEhPv+bTWJW6NWnozQeeK0kQPqfqiFOwOQYlcIgCpY7DENKfv5Ky7IJxmtmZ7bM/p02pvEM5XUS7rE/uinJ+uFBXghM1oXXp1ldyUGbdks1rVvNwL0AzgJI63UDRZfsUYIRJ5LEtrv8jVP1Gk4FsfTZpZMSfS7mIORoTHH39eXb1OZIQOwk5XyevpJpgITAVskSD39VU4x0NL1gSIAH9AkFrPFpR14ZgwUnlWogqJ4zKggSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejk3u8viTHSt4Q+bz+Ap+bloMlbWPN9w+12k4sopb5E=;
 b=cdRzVdei8xDaboO6AHIyoQRpuGToypRVjEJwyPoZu/VFV4QLRl2MIXOHEl+h+G2Hrru5yY+HoOoHegl9diunb9bYjkmENfsepHlx8grZuyG79g5TwYUUP8/unh2kCH9PmX7rM5pauYlchOjdfn56/NRrF7nzjAtfC96OepO//fXSzgVpmNIRi7RfKP942Cm/Q9qeU0Kgl5bilKLSeZOuyDzvRS4UeSdvDAGInvDqMw33HL16ojlXKCjqDdfRujIIMA7vw2EVvETq23lS0juZIAnkOrhG0wOQpOKe4YN8dHPxjzaQgw1IwQfwUj4v7D3/70+Y6rmamC0n7kYwZOAwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3155.namprd18.prod.outlook.com (10.255.136.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 18:44:24 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c%6]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 18:44:24 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [XEN PATCH for-4.13 v2 1/9] libxl: Offer API
 versions 0x040700 and 0x040800
Thread-Index: AQHVf303LovIaJOvDkaU+MQECOVejKecgbiA
Date: Mon, 25 Nov 2019 18:44:24 +0000
Message-ID: <c846d30d-b939-f9be-cfbd-699bacf9cc72@suse.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-2-ian.jackson@eu.citrix.com>
In-Reply-To: <20191010151111.22125-2-ian.jackson@eu.citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:180::45) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [75.169.5.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af34fa6d-f3e6-465a-c6b4-08d771d77e09
x-ms-traffictypediagnostic: BY5PR18MB3155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB315554EDA62AAD13720BABC7C64A0@BY5PR18MB3155.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(229853002)(76176011)(52116002)(4744005)(2906002)(4326008)(26005)(54906003)(5660300002)(110136005)(386003)(6506007)(53546011)(102836004)(66476007)(66946007)(36756003)(66556008)(6512007)(6436002)(316002)(31686004)(99286004)(256004)(3846002)(6116002)(6246003)(186003)(71200400001)(71190400001)(2616005)(66446008)(11346002)(64756008)(6486002)(8936002)(66066001)(25786009)(81166006)(81156014)(31696002)(2501003)(86362001)(478600001)(14454004)(446003)(305945005)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3155;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yqGNCuGlKM2RlzGurtYp3knWIesJOq5Zo6aWWDt2s5Ty3MgEjKnCSV0vyYrTE2zqx25xf78jAgq+eW7e5kdLYXFrbCJxMbfRyirefxBaG//acQGfqXr3/tiOLrQF0wm0By4deA0eveyP2LeneyI/JzXimkQpvAOQvAnMngbBrF1GrRoS5uzJjpfg/4NUOFAquhTA0i/Jc/AouFuxRClA4U79HZAJKR0qErbuVJ5HSW/OTrG1wZKOtRMjiTQgeTG7LLg9hitlJSf1BZJFI6IsU2AJkBKOk5RACZOOAl4Ep93SQ+6BK1LLtIaJkzvbNH/+aeDDazSR7C3OnXlzSh27l+a3KvL8aLLATX7qfn/AiZz9reonN8VHRlJU6Fr8MmOefIUlVBz/OpxpVqMC1r+LdAUt629f2aOWou6vYmJ7MMaeX41yIQRMFQnqbLxbZMEC
Content-ID: <94B2C4122A70EE4D83B8872A70408CE5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af34fa6d-f3e6-465a-c6b4-08d771d77e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 18:44:24.5260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDLWKh8yHhx7Kqk7tnTpWfVtz9ugLVBlS6ZbUaw/yj+TTWk4efH1Flv/1xcx+3qyqzFmtOKf7eVdsZjrz02reQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3155
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 1/9] libxl: Offer API
 versions 0x040700 and 0x040800
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Paul Durrant <pdurrant@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTAvMTkgOToxMSBBTSwgSWFuIEphY2tzb24gd3JvdGU6DQo+IEFjY29yZGluZyB0byBn
aXQgbG9nIC1HOg0KPiANCj4gMHgwNDA3MDAgd2FzIGludHJvZHVjZWQgaW4gMzA0NDAwNDU5ZWYw
IChha2EgNC43LjAtcmMxfjQ4MSkNCj4gICAgInRvb2xzL2xpYnhsOiByZW5hbWUgcmVtdXMgZGV2
aWNlIHRvIGNoZWNrcG9pbnQgZGV2aWNlIg0KPiANCj4gMHgwNDA4MDAgd2FzIGludHJvZHVjZWQg
aW4gNTdmOGIxM2M3MjQwIChha2EgNC44LjAtcmMxfjQzNykNCj4gICAgImxpYnhsOiBtZW1vcnkg
c2l6ZSBpbiBrYiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiDQo+IA0KPiBJdCBpcyBzdXJwcmlz
aW5nIHRoYXQgbm8tb25lIG5vdGljZWQgdGhpcy4NCg0KSSBhbSBub3cgbm90aWNpbmcgaXQgOi0o
Lg0KDQpBcyBBbnRob255IG5vdGVkIGluIFYxLCBsaWJ2aXJ0IHVzZXMgTElCWExfQVBJX1ZFUlNJ
T04gYW5kIGN1cnJlbnRseSBoYXMgaXQgc2V0IA0KdG8gMHgwNDA1MDAuIEknbSBhdHRlbXB0aW5n
IHRvIGJ1bXAgbGlidmlydCdzIG1pbmltdW0gc3VwcG9ydGVkIFhlbiB2ZXJzaW9uIHRvIA0KNC45
LjAgYW5kIGZvciB0aGF0IHdvdWxkIHVzZSAweDA0MDgwMCwgYnV0IGl0J3Mgbm90IHBvc3NpYmxl
IHdpdGhvdXQgdGhpcyBjb21taXQgDQpiYWNrcG9ydGVkIHRocm91Z2ggNC45IGFuZCBwaWNrZWQg
dXAgYW5kIHJlbGVhc2VkIGJ5IGFsbCB0aGUgZG93bnN0cmVhbXMuDQoNCkFueSBpZGVhcyBvbiBo
b3cgdG8gdXNlIHRoZSBBUElzIGNoYW5nZXMgdGhyb3VnaCAweDA0MDgwMCwgYnV0IGF2b2lkIHRo
ZSBvbmVzIA0KaW50cm9kdWNlZCBpbiAweDA0MTMwMCB3b3VsZCBiZSBtdWNoIGFwcHJlY2lhdGVk
Lg0KDQpSZWdhcmRzLA0KSmltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

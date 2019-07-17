Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B2A6B8FE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnfyB-0001cB-32; Wed, 17 Jul 2019 09:11:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnfy9-0001aO-FN
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:11:25 +0000
X-Inumbo-ID: d680ec38-a872-11e9-bbf2-5f9dbc2c4266
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d680ec38-a872-11e9-bbf2-5f9dbc2c4266;
 Wed, 17 Jul 2019 09:11:21 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 09:11:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 09:11:04 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 09:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/T2T6QBcLiD3n/3azMkng+myAJxZJxhmn73VGhJ+n8N/jAR2QqcqmPAshNylCXK0f7w8v/6vFJ0wmONRj8NSWr0InDhnK8Ojlead8mC3ANlqXec6b3qM5HmIvGDAedfZ/At5KkNNJbYJfR9t9pguMINFK+M+ce6wh1anCwxvGEIIjqMPQFGosy4y6QHKGyZK3rnO6jHJbhloejKc/35Q9Yn8s/erjIixoZEl+mktFL9h9avt1cMCqM4DHZFlWkFXDYvQsLNaSuHBPKEZoErYD4TADnBMtAB40k4Bxy2V6xg4bL9yismCsgAWcJIPQhjuJR07T+XKxOWVY0ZIKzKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QGkslEFkhqjpALjl7AXD9dpbGAeGKkeXsK/DQzcOWA=;
 b=cEGt6RCln7nwvfpowiNJAXxqqK+RuQXROzwPy9IXCVlfXvxPJolstcoXULdUQSXnd+iOHkgetC2UJ92qThd57STqXkgJb3GgymXUtqtW1BHQAleoP2zmFmfVqUxrgFskgcSmM8MGyzX5ItOjpbWkReFfNQ4DVEycNjCjbqvX4X6ay7st9syOUVni7xzzlWlm4YJZP+RUM9H+pp3NhGvTh9u/Kyaq3uf0qmVwo7Kf9WBR7U5XJzgEu+CiOAvMCIMaXwVG0AfS65RRdBd64Ruhy9BHxvh+3BUjcIx1wo5frh1SdrQ1/Rc1zLhp1t7zSxjmw73axDXsH1ThKFBPB7Q9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3435.namprd18.prod.outlook.com (10.255.175.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 09:11:04 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:11:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 5/5] tools/libxc: allow controlling the max C-state
 sub-state
Thread-Index: AQHVMZ/Q+p945gYsm0arEFP/PvEB76bNbQ5mgAEuzAA=
Date: Wed, 17 Jul 2019 09:11:03 +0000
Message-ID: <b6449907-ba56-1602-ca49-71a360456e9b@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <16586069-2940-bf5b-aed1-6c9e150c70b5@suse.com>
 <20190716150608.pesnooijitkb25n5@Air-de-Roger.citrite.net>
In-Reply-To: <20190716150608.pesnooijitkb25n5@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15808e57-f425-45ef-c8d3-08d70a96b196
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3435; 
x-ms-traffictypediagnostic: DM6PR18MB3435:
x-microsoft-antispam-prvs: <DM6PR18MB34350EAAE3DF2012B5B4F4B1B3C90@DM6PR18MB3435.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(102836004)(53936002)(14454004)(76176011)(6246003)(6436002)(6916009)(316002)(99286004)(6512007)(53546011)(386003)(66066001)(68736007)(80792005)(66946007)(52116002)(6506007)(31696002)(86362001)(8676002)(8936002)(5660300002)(229853002)(81156014)(26005)(478600001)(486006)(186003)(4326008)(25786009)(31686004)(305945005)(256004)(476003)(7736002)(446003)(11346002)(2616005)(2906002)(66476007)(81166006)(6116002)(6486002)(36756003)(66446008)(54906003)(66556008)(3846002)(71190400001)(71200400001)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3435;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tc/Z0KmS6FrfFhoD3s0sxSdUoVPEKRWqzEeGU80oxk3knPrhyzt2a6UVGly0ZivLknsUS2zEXZhDKlVZ8VyX95cdWpfIuM0aeyETIKjPdmOGkUg2ziXz1Eh7HJXTO7aQtM4ZqCiVj3gsQsxi/GM3siATEluSZYHUbAGR0Y6/BjGCeAEpHXCUO7my6YvXxJS09oFKC+NzowrN9mHZcPk8dGvpSN8jlTOAVxTpSyGhMAFHW8+Fc3M5SE9PaQ023Vk+IhaIhDbE8m4GQFYX9QYwWnUknk5tySIXzPMnjFgkvl/RRQQGCHABduBV2LOuLSGhS4oLBUBuMowGOz7WUHq1MNou0uTeA+R8U6KgBqdWKHDi7wlSQWJp9KUSCcjHXY9WXiOX9bPb3T1Z/hH2FpdB5cKvuRzWiXCyVM+l4SoWQvM=
Content-ID: <A77EBF613C35D547AEA05B9252AAEC03@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 15808e57-f425-45ef-c8d3-08d70a96b196
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:11:03.7975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3435
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 5/5] tools/libxc: allow controlling the
 max C-state sub-state
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxNzowNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDAzLCAyMDE5IGF0IDAxOjA0OjEzUE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
LS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jDQo+PiArKysgYi90b29scy9taXNjL3hlbnBtLmMNCj4+
IEBAIC02NCw3ICs2NCw5IEBAIHZvaWQgc2hvd19oZWxwKHZvaWQpDQo+PiAgICAgICAgICAgICAg
ICAiIHNldC1zY2hlZC1zbXQgICAgICAgICAgIGVuYWJsZXxkaXNhYmxlIGVuYWJsZS9kaXNhYmxl
IHNjaGVkdWxlciBzbXQgcG93ZXIgc2F2aW5nXG4iDQo+PiAgICAgICAgICAgICAgICAiIHNldC12
Y3B1LW1pZ3JhdGlvbi1kZWxheSAgICAgIDxudW0+IHNldCBzY2hlZHVsZXIgdmNwdSBtaWdyYXRp
b24gZGVsYXkgaW4gdXNcbiINCj4+ICAgICAgICAgICAgICAgICIgZ2V0LXZjcHUtbWlncmF0aW9u
LWRlbGF5ICAgICAgICAgICAgZ2V0IHNjaGVkdWxlciB2Y3B1IG1pZ3JhdGlvbiBkZWxheVxuIg0K
Pj4gLSAgICAgICAgICAgICIgc2V0LW1heC1jc3RhdGUgICAgICAgIDxudW0+fCd1bmxpbWl0ZWQn
IHNldCB0aGUgQy1TdGF0ZSBsaW1pdGF0aW9uICg8bnVtPiA+PSAwKVxuIg0KPj4gKyAgICAgICAg
ICAgICIgc2V0LW1heC1jc3RhdGUgICAgICAgIDxudW0+fCd1bmxpbWl0ZWQnWyw8bnVtMj58J3Vu
bGltaXRlZCddXG4iDQoNClRoZSBjb21tYSBoZXJlIGlzIHdyb25nLCAuLi4NCg0KPj4gQEAgLTEx
MjAsMTMgKzExMzAsMTcgQEAgdm9pZCBnZXRfdmNwdV9taWdyYXRpb25fZGVsYXlfZnVuYyhpbnQg
YQ0KPj4gICAgDQo+PiAgICB2b2lkIHNldF9tYXhfY3N0YXRlX2Z1bmMoaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkNCj4+ICAgIHsNCj4+IC0gICAgaW50IHZhbHVlOw0KPj4gKyAgICBpbnQgdmFsdWUs
IHN1YnZhbCA9IFhFTl9TWVNDVExfQ1hfVU5MSU1JVEVEOw0KPj4gICAgICAgIGNoYXIgYnVmWzEy
XTsNCj4+ICAgIA0KPj4gLSAgICBpZiAoIGFyZ2MgIT0gMSB8fA0KPj4gKyAgICBpZiAoIGFyZ2Mg
PCAxIHx8IGFyZ2MgPiAyIHx8DQo+IA0KPiBJJ20gcXVpdGUgc3VyZSBJJ20gbWlzc2luZyBzb21l
dGhpbmcsIGJ1dCBzaG91bGRuJ3QgYXJnYyBzdGlsbCBiZSAxDQo+IHJlZ2FyZGxlc3Mgb2Ygd2hl
dGhlciB0aGUgbWF4IHN1Yi1zdGF0ZSBpcyBzZXQgb3Igbm90Pw0KPiANCj4gSSB3b3VsZCBleHBl
Y3QgdG8gc2NhbiBmb3Igc29tZXRoaW5nIGxpa2U6ICIlZCwlZCIgb3Igc29tZSBzdWNoLCBidXQN
Cj4gbWF5YmUgdGhlcmUncyBhIHN0ZXAgSSdtIG1pc3NpbmcgdGhhdCBzcGxpdHMgdGhlIHN0cmlu
ZyB1c2luZyB0aGUgJywnDQo+IHNlcGFyYXRvcj8NCg0KLi4uIG1pc2xlYWRpbmcgeW91IGhlcmUu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

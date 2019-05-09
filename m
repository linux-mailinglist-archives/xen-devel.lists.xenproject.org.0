Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14FB193BE
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 22:46:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOpt8-0003rO-1w; Thu, 09 May 2019 20:43:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOpt6-0003rJ-As
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:43:32 +0000
X-Inumbo-ID: 1a45a9c3-729b-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::62e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a45a9c3-729b-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV4IUDOEDDhSNdj6x3RKYmD120pbpqSrF+mWxcpo/ak=;
 b=KPwoYT9mv+WDQWf3DgC7zoJjdcC6dOePOSOi+TisXU/A5s6J1M+Xn2B0RyU9tDRe9v3QPNZl9HLn7PSLlD4QRJSsGOdUZyU6zuxAyaaeBJAVIDNYM3lutZ1WorXSYwmrZFtcaLTKpB9IyKtpkolAtBjep3OpP/8JLlwCfIebb1g=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4004.eurprd08.prod.outlook.com (20.178.118.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 20:43:14 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 20:43:14 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 6/7] xen/arm: tlbflush: Rework TLB helpers
Thread-Index: AQHVBblfwBVeW+nZH0GHadftfOMHMKZjQTiAgAAC+YA=
Date: Thu, 9 May 2019 20:43:14 +0000
Message-ID: <fc4f79d2-5d48-c57b-53de-0fa020b46fb7@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091319520.25766@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905091319520.25766@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::32) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69397153-2e1d-4646-932b-08d6d4bef56b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4004; 
x-ms-traffictypediagnostic: AM0PR08MB4004:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB4004FF621CD26A1B0351491A80330@AM0PR08MB4004.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(64756008)(73956011)(66476007)(53936002)(66556008)(66446008)(4326008)(66946007)(72206003)(6246003)(25786009)(478600001)(36756003)(256004)(66066001)(6512007)(6916009)(8676002)(6486002)(81156014)(81166006)(316002)(229853002)(7736002)(8936002)(54906003)(6436002)(2616005)(102836004)(3846002)(53546011)(2906002)(6506007)(52116002)(386003)(76176011)(305945005)(26005)(186003)(71200400001)(31686004)(14454004)(31696002)(71190400001)(86362001)(68736007)(446003)(486006)(476003)(6116002)(5660300002)(99286004)(11346002)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4004;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W39UCx67gwoaBvQpfBBRzeEv4bsbb1ln536zS8ax8YWKAdMvf91viUybDmKaUFePS8s2ILodTKWHS67GjQnaotG/4rpW9TV8QH+BKjlO69w0bPWvqpGJzTQgJUO+wOc0+TZboOv5N7vL6Ulc+PDlVqK1Riaes5nZuYimxISEfMxNDcPCF5Vseo9evVqEa2EcmymuYraB/LakTKl0TNnC9P455zRXjlAye5P4T5vCVWLCz0+4srohBLNyewgkaxzyafmFdQzjcuLwqNm8puM7lteJqcFPDugZPzVv3G/6FaYwTBq9Qs6o/zCw8CR3CpT1ZejlY+9dwqfypsuKBAYbrpKW3Xm29WkC/Pn9WzvgUcMWggGnKNGUSj3c3OEADF21Dh9VN0OzaMvqLp3BFKw50jY/MPFGRX1Sz242ldC+I24=
Content-ID: <9213AAF23D087A40B29CD3D78736DCF4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69397153-2e1d-4646-932b-08d6d4bef56b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 20:43:14.7855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4004
Subject: Re: [Xen-devel] [PATCH v2 6/7] xen/arm: tlbflush: Rework TLB helpers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDA5LzA1LzIwMTkgMjE6MzIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
V2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEkgYWdyZWUgd2l0aCB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGFjaGlldmUgd2l0aCB0aGlzIHBhdGNoIGFuZCBJIGxpa2UNCj4g
dGhlIGlkZWEgb2YgcmVkdWNpbmcgY29kZSBkdXBsaWNhdGlvbi4gQXMgSSBsb29rIGF0IHRoZSBj
b2RlLCBJIHdhcw0KPiBob3BpbmcgdG8gZmluZCBhIHdheSB0byBhdm9pZCBpbnRyb2R1Y2luZyBt
YWNyb3MgYW5kIHVzZSBzdGF0aWMgaW5saW5lDQo+IGZ1bmN0aW9ucyBpbnN0ZWFkLCBidXQgaXQg
ZG9lc24ndCBsb29rIGxpa2UgaXQgaXMgcG9zc2libGUgZm9yIGFybTMyLg0KPiBUaGVyZSBpcyBu
byB3YXkgdG8gcGFzcyBUTEJJQUxMSVMgYXMgYSBwYXJhbWV0ZXIgdG8gYSBmdW5jdGlvbiBmb3IN
Cj4gaW5zdGFuY2UuIEl0IG1pZ2h0IGJlIHBvc3NpYmxlIGZvciBhcm02NCBhcyB0aGV5IGFyZSBq
dXN0IHN0cmluZ3MsIGJ1dCBhdA0KPiB0aGF0IHBvaW50IGl0IG1pZ2h0IGJlIGJldHRlciB0byBr
ZWVwIHRoZSBjb2RlIHNpbWlsYXIgYmV0d2VlbiBhcm0zMiBhbmQNCj4gYXJtNjQgaGF2aW5nIGJv
dGggb2YgdGhlbSBhcyBtYWNyb3MsIGluc3RlYWQgb2YgaGF2aW5nIG9uZSBhcyBtYWNybyBhbmQN
Cj4gdGhlIG90aGVyIGFzIHN0YXRpYyBpbmxpbmUuDQo+IA0KPiBEbyB5b3UgYWdyZWUgd2l0aCBt
ZT8gQ2FuIHlvdSBzZWUgYW55IG90aGVyIHdheXMgdG8gdHVybiBUTEJfSEVMUEVSIGludG8NCj4g
YSBzdGF0aWMgaW5saW5lPw0KDQpJIHJlYWxseSBjYW4ndCBzZWUgaG93IHlvdSBjYW4gZXZlbiB0
dXJuIHRoZSBhcm02NCB2ZXJzaW9uIGFzIGEgc3RhdGljIA0KaW5saW5lLi4uIEV2ZW4gaWYgVExC
SUFMTElTIGlzIGEgc3RyaW5nLCB3ZSBhcmUgdXNpbmcgaXQgdG8gZ2VuZXJhdGUgdGhlIA0KYXNz
ZW1ibHkuIFdpdGhvdXQgdGhlIGhlbHAgb2YgdGhlIHByZS1wcm9jZXNzb3IsIHlvdSB3b3VsZCBo
YXZlIHRvIGxvb2sgDQphdCB0aGUgc3RyaW5nIGFuZCBnZW5lcmF0ZSB0aGUgYXNzb2NpYXRlZCBv
cGVyYXRpb24uDQoNClNvIHRoZXJlIGFyZSBubyB3YXkgeW91IGNhbiBkbyB0aGUgc2FtZSB3aXRo
IHN0YXRpYyBpbmxpbmUgdW5sZXNzIHlvdSANCmR1cGxpY2F0ZSBhbGwgdGhlIGhlbHBlcnMuIEJ1
dCB0aGlzIHdvdWxkIGRlZmVhdCB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoLg0KDQpDaGVlcnMs
DQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

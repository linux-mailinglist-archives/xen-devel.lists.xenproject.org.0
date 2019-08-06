Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97E82D4A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 10:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huuLr-0006Me-6U; Tue, 06 Aug 2019 07:57:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huuLp-0006MW-Ms
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 07:57:45 +0000
X-Inumbo-ID: d589b034-b81f-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d589b034-b81f-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 07:57:45 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  6 Aug 2019 07:57:25 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 6 Aug 2019 07:56:40 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 6 Aug 2019 07:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ganwmF/lMEBiA4Mb4LEUctFUnJvQ9srrXKAg4s/0enXRvCCIIaG0z6DG9ajZBYEEJVm5cZMgD3XtXPOK/XBdP8qHjsKOXj2g7PZQsf3Q9hqt0AKgUS/enxZBNaKThMQVGwlej6gf09oVHX7kBpgUP1QT1MSq0E6SZKeAYQMF1U5kYKHe2/ACJQhlcM2TV9Qq2f5SRf0jhxIHSSfHtEuKumqyE6TVttZA6wkg+wrRlV6v5yMKxUClmPSvM2C2lwhuKdlPEaDUAzJMg7U4FLwiRpEa5lvuDKcJjMb2i7l0kbeI4O3PzkVLlypKlsSnjL7DVQddxpB1UeZhUgF7q7ZPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5BxLNhQzYYpa2Ahtr8qII4Ei4zjp+1rQUQwLMw6+7I=;
 b=El9JKVAug4uKfwbxir4MwaO84bmUPZnyc8FOIOQVjgmo+oYDgXUb7StMi3efleUf/4CcrwmoV2XV+W6CWpUP1MzCDuM/riuwj60czyGSRTXmp5T853q1gDvhN1pjV89UamQXy7jbXFH2PNnrpJEQxS6QFoaqeTwZgirIG9RaE5Ai6LS9FGmQkXC+2f7ev2FQcX3GG7go1HDXVG+dgI9vAmPt5Mc4eXfQem9iHYl6Kyk2fvMPEAU8kI1mftsnjdjFttpth7AHaHI77C18vFiQ8Ak1b8QAg3OsBCfe+PMuLNnduqSN2pULr4GsWxcllFVR6vH+OYVlYLByt5QdmNPReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3375.namprd18.prod.outlook.com (10.255.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 07:56:40 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 07:56:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
Thread-Index: AQHVPW85l6TypzCOPUKKzJbbmldm3qbQfOwAgAAauduAAP6xgIAAEDIrgAALaYCAGvscGIABMQMA
Date: Tue, 6 Aug 2019 07:56:39 +0000
Message-ID: <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
In-Reply-To: <20190805134424.GJ1549@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0136.eurprd05.prod.outlook.com
 (2603:10a6:207:3::14) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a1086b5-8fc3-44ad-4a7d-08d71a439d2e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3375; 
x-ms-traffictypediagnostic: MN2PR18MB3375:
x-microsoft-antispam-prvs: <MN2PR18MB3375CC5CB9B4AB8F69B51689B3D50@MN2PR18MB3375.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(189003)(199004)(68736007)(6486002)(229853002)(6436002)(7736002)(81166006)(81156014)(71200400001)(54906003)(305945005)(5660300002)(71190400001)(3846002)(66574012)(26005)(4326008)(2906002)(6116002)(36756003)(8676002)(31686004)(66066001)(76176011)(316002)(14454004)(14444005)(66446008)(7416002)(476003)(11346002)(478600001)(6916009)(64756008)(256004)(66556008)(66476007)(6246003)(66946007)(53546011)(386003)(6506007)(102836004)(52116002)(53936002)(446003)(2616005)(99286004)(86362001)(25786009)(80792005)(31696002)(6512007)(486006)(186003)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3375;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j23jpmlzu2amYvPqkr01qXbF+B6WRaxouaPZLNunZBhqZnyIY7AbmYzAzsu1mvsBsnnZg6X063owVo9bIrxx6Yl2gmMtRQw0b7y2u/ZXY2HzNOnbxH1MXGDiiDqBTZ2Npye0iaEZhwhHPa/n0B13261kAXEoTuYMt5kYfRJswM5Pdv5tWIaUVMNMGyb9DsBYAy80tbPAhIfdqfUmhHQYMw6mH6o+7E6KbepTTA3ZR5xs0tXcL1yS4n145ERwiA13DReJV1/sQoI1Tj5VxWBP1dTFV/Lxctly6H89H5rEUz8NDDQBVqGHLoCjvxUaSRxe9fbDDDKJBqsvqyivn5q9mYLg5xXjUhc4Dn+iEwTmPnchAW3ZGWCXWvZOjKbkjpbsKvyXzHv094tyZFSSGTVpy7xPFde+JRGkXYlPDGFBt+8=
Content-ID: <C7D577BF0322DB4D84B1BD0529F51218@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1086b5-8fc3-44ad-4a7d-08d71a439d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 07:56:39.9941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3375
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNTo0NCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDk6NDM6MjZBTSArMDAwMCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+PiBPbiAxOS4wNy4yMDE5IDExOjAyLCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToN
Cj4+PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwODowNDo0NUFNICswMDAwLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4gT24gMTguMDcuMjAxOSAxODo1MiwgUm9nZXIgUGF1IE1vbm7DqSAgd3Jv
dGU6DQo+Pj4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAwMzoxNzoyN1BNICswMDAwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAxOC4wNy4yMDE5IDE1OjQ2LCBSb2dlciBQYXUgTW9u
bsOpICB3cm90ZToNCj4+Pj4+Pj4gSW4gZmFjdCBJIGRvbid0IHRoaW5rIElOVHggc2hvdWxkIGJl
IGVuYWJsZWQgd2hlbiBNU0koLVgpIGlzIGRpc2FibGVkLA0KPj4+Pj4+PiBRRU1VIGFscmVhZHkg
dHJhcHMgd3JpdGVzIHRvIHRoZSBjb21tYW5kIHJlZ2lzdGVyLCBhbmQgaXQgd2lsbCBtYW5hZ2UN
Cj4+Pj4+Pj4gSU5UeCBlbmFibGluZy9kaXNhYmxpbmcgYnkgaXRzZWxmLiBJIHRoaW5rIHRoZSBv
bmx5IGNoZWNrIHJlcXVpcmVkIGlzDQo+Pj4+Pj4+IHRoYXQgTVNJKC1YKSBjYW5ub3QgYmUgZW5h
YmxlZCBpZiBJTlR4IGlzIGFsc28gZW5hYmxlZC4gSW4gdGhlIHNhbWUNCj4+Pj4+Pj4gd2F5IGJv
dGggTVNJIGNhc3BhYmlsaXRpZXMgY2Fubm90IGJlIGVuYWJsZWQgc2ltdWx0YW5lb3VzbHkuIFRo
ZQ0KPj4+Pj4+PiBmdW5jdGlvbiBzaG91bGQgbm90IGV4cGxpY2l0bHkgZGlzYWJsZSBhbnkgb2Yg
dGhlIG90aGVyIGNhcGFiaWxpdGllcywNCj4+Pj4+Pj4gYW5kIGp1c3QgcmV0dXJuIC1FQlVTWSBp
ZiB0aGUgY2FsbGVyIGF0dGVtcHRzIGZvciBleGFtcGxlIHRvIGVuYWJsZQ0KPj4+Pj4+PiBNU0kg
d2hpbGUgSU5UeCBvciBNU0ktWCBpcyBlbmFibGVkLg0KPj4+Pj4+DQo+Pj4+Pj4gWW91IGRvIHJl
YWxpemUgdGhhdCBwY2lfaW50eCgpIG9ubHkgZXZlciBnZXRzIGNhbGxlZCBmb3IgWGVuDQo+Pj4+
Pj4gaW50ZXJuYWxseSB1c2VkIGludGVycnVwdHMsIGkuZS4gbWFpbmx5IHRoZSBzZXJpYWwgY29u
c29sZSBvbmU/DQo+Pj4+Pg0KPj4+Pj4gWW91IHdpbGwgaGF2ZSB0byBiZWFyIHdpdGggbWUgYmVj
YXVzZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoeQ0KPj4+Pj4gaXQgZG9lcyBtYXR0ZXIu
IERvIHlvdSBtZWFuIHRvIHBvaW50IG91dCB0aGF0IGRvbTAgaXMgdGhlIG9uZSBpbiBmdWxsDQo+
Pj4+PiBjb250cm9sIG9mIElOVHgsIGFuZCB0aHVzIFhlbiBzaG91bGRuJ3QgY2FyZSBvZiB3aGV0
aGVyIElOVHggYW5kDQo+Pj4+PiBNU0koLVgpIGFyZSBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWU/
DQo+Pj4+Pg0KPj4+Pj4gSSBzdGlsbCB0aGluayB0aGF0IGF0IGxlYXN0IGEgd2FybmluZyBzaG91
bGQgYmUgcHJpbnRlZCBpZiBhIGNhbGxlcg0KPj4+Pj4gdHJpZXMgdG8gZW5hYmxlIE1TSSgtWCkg
d2hpbGUgSU5UeCBpcyBhbHNvIGVuYWJsZWQsIGJ1dCB1bmxlc3MgdGhlcmUncw0KPj4+Pj4gYSBy
ZWFzb24gdG8gaGF2ZSBib3RoIE1TSSgtWCkgYW5kIElOVHggZW5hYmxlZCBhdCB0aGUgc2FtZSB0
aW1lIChtYXliZQ0KPj4+Pj4gYSBxdWlyayBmb3Igc29tZSBoYXJkd2FyZSBpc3N1ZT8pIGl0IHNo
b3VsZG4ndCBiZSBhbGxvd2VkIG9uIHRoaXMgbmV3DQo+Pj4+PiBpbnRlcmZhY2UuDQo+Pj4+DQo+
Pj4+IEkgZG9uJ3QgbWluZCBpbXByb3ZlbWVudHMgdG8gdGhlIGN1cnJlbnQgc2l0dWF0aW9uIChp
LmUuIHN1Y2ggYQ0KPj4+PiB3YXJuaW5nIG1heSBpbmRlZWQgbWFrZSBzZW5zZSk7IEkgbWVyZWx5
IHN0YXRlZCBob3cgdGhpbmdzIGN1cnJlbnRseQ0KPj4+PiBhcmUuIElOVHggdHJlYXRtZW50IHdh
cyBjb21wbGV0ZWx5IGxlZnQgYXNpZGUgd2hlbiBNU0kgc3VwcG9ydCB3YXMNCj4+Pj4gaW50cm9k
dWNlZCBpbnRvIFhlbi4NCj4+Pg0KPj4+IEluIG9yZGVyIHRvIGdpdmUgTWFyZWsgYSBtb3JlIGNv
bmNpc2UgcmVwbHksIHdvdWxkIHlvdSBhZ3JlZSB0byByZXR1cm4NCj4+PiAtRUJVU1kgKG9yIHNv
bWUgZXJyb3IgY29kZSkgYW5kIHByaW50IGEgd2FybmluZyBtZXNzYWdlIGlmIHRoZSBjYWxsZXIN
Cj4+PiBhdHRlbXB0cyB0byBlbmFibGUgTVNJKC1YKSB3aGlsZSBJTlR4IGlzIGFsc28gZW5hYmxl
ZD8NCj4+DQo+PiBBcyB0byByZXR1cm5pbmcgYW4gZXJyb3IgLSBJIHRoaW5rIHNvLCB5ZXMuIEkn
bSBsZXNzIHN1cmUgYWJvdXQgbG9nZ2luZw0KPj4gYSBtZXNzYWdlLg0KPiANCj4gSSdtIHRyeWlu
ZyB0byBnZXQgaXQgd29ya2luZyBhbmQgaXQgaXNuJ3QgY2xlYXIgdG8gbWUgd2hhdCBzaG91bGQg
SQ0KPiBjaGVjayBmb3IgIklOVHggaXMgYWxzbyBlbmFibGVkIi4gSSBhc3N1bWVkIFBDSV9DT01N
QU5EX0lOVFhfRElTQUJMRQ0KPiBiaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGd1ZXN0IGhhcyBubyBj
b250cm9sIG92ZXIgdGhpcyBiaXQsIGV2ZW4gaW4NCj4gcGVybWlzc2l2ZSBtb2RlLiAgVGhpcyBt
ZWFucyBlbmFibGluZyBNU0koLVgpIGFsd2F5cyBmYWlscyBiZWNhdXNlIGd1ZXN0DQo+IGhhcyBu
byB3YXkgdG8gc2V0IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQgYmVmb3JlLg0KDQpXZWxs
LCB0aGUgZ3Vlc3QgaGFzIG5vIGNvbnRyb2wsIGJ1dCBpbiBvcmRlciB0byBlbmFibGUgTVNJeywt
WH0gSSdkDQpoYXZlIGV4cGVjdGVkIHFlbXUgb3IgdGhlIERvbTAga2VybmVsIHRvIHNldCB0aGlz
IGJpdCB1cCBmcm9udC4gSWYNCnRoYXQncyBub3QgdGhlIGNhc2UsIHRoZW4gb2YgY291cnNlIG5l
aXRoZXIgY2hlY2tpbmcgbm9yIGxvZ2dpbmcgYQ0KbWVzc2FnZSBpcyBhcHByb3ByaWF0ZSBhdCB0
aGlzIHBvaW50IGluIHRpbWUuIEl0IG1heSBiZSB3b3J0aHdoaWxlDQpjYWxsaW5nIG91dCB0aGlz
IGFub21hbHkgdGhlbiBpbiB0aGUgZGVzY3JpcHRpb24uDQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

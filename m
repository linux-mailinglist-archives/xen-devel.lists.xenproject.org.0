Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C69E4F6C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0lc-0003KD-8Q; Fri, 25 Oct 2019 14:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZZIQ=YS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iO0la-0003K8-Sz
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:40:38 +0000
X-Inumbo-ID: 687195d2-f735-11e9-94ca-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.127]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 687195d2-f735-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 14:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGAuEFZ+dBG2E1lXztkg6nWW+Hu5Bp7yn2YK/W/gyzV4SLFKjhqNzYCGEM4RYO/oOfQ0UWTAtiKHgiNq7ZN4NhhektuzW1rbbhQebFuBWYbtAzpNqooukymLsslhCEw9X2U59N2FPGiBN1jpcACOGYhtNzcGBtwpqCEVmTtkIZLpqj9S0QVrZNefHHsbYT8BxISHy5+lVzSTEriTciv0XcqsBKTDqWgGs4g5q62qttF/ryjj7Q+yOeFLiCtsBYGXPCYujKbOuYOgX8gPz6xMFRhv5mbzsnAerHpu1ndzTMXs8GmYYVNFwqpLMRhk9pzAk6uYP9ykrr43/xcm81Ge+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjrPZQlS2Q1mkJUuQWcSmBUwMdIdrtstRs3/0dHn54I=;
 b=jo1zc+THUw/ZAmUZuZ3cQFXQQBs3Ts5vLo6Q/vPogLNdTUWlJ+qlU+4+PWko4DDpjHL/G78goFQcDl5Dic4xeFTB55uoxu7BMuxkGPVcxLYc9yutSKZ0oeXljYqFotPAgyB9JQGUTdLh0mwvo5P45xCYMgSidLdnjnMCRO8CdaOxZk208KDssjKBYilXnL5fsoRBscFETjGe0+RyAIMs/balexV1Z/mBLHjMUOovT8bWD5kYMKrqsBxbw5QMbD8D5n2wAk9S/tv0ogW7TMFsj8FRIxicRO2Z7bEMCgmHktMKQBoSofp5rINt/J4kGDmDLH2FW2rnEIaMfNPUGSWnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjrPZQlS2Q1mkJUuQWcSmBUwMdIdrtstRs3/0dHn54I=;
 b=T6QNlsUWF9UxPY2SBLZiuYmbK4BRZXzrvtb8yOP/o98rhUxkx8FGhNx6xN6kZPm0XPFsvRbsib3M3kMl+eccdF7SnLoCRDSeF5gswjPlC/enWcwzwrPWym96MYYevnWQjjdqXvUJtNZySCmtnAH73HGR8xJCe2uOKRRTl3Pw7sE=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3494.eurprd02.prod.outlook.com (52.133.27.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 25 Oct 2019 14:40:36 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::f0d8:e3a6:48ce:4b0]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::f0d8:e3a6:48ce:4b0%5]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 14:40:36 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a new
 view and set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAAZmgCATj09AP///F+AgAOC3oD//874AA==
Date: Fri, 25 Oct 2019 14:40:36 +0000
Message-ID: <6b546dcd-779b-d3cb-6602-d2fee2c66fd9@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
 <41a47abf-ec6f-1b19-8803-099b7d54b5bd@bitdefender.com>
 <20191023115715.GR17494@Air-de-Roger>
 <050b1ecd-8c3e-ae4a-60a9-f9b36340f749@bitdefender.com>
In-Reply-To: <050b1ecd-8c3e-ae4a-60a9-f9b36340f749@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:208:55::23) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dcce2cf-363f-4ff8-208d-08d759594c20
x-ms-traffictypediagnostic: AM6PR0202MB3494:|AM6PR0202MB3494:|AM6PR0202MB3494:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR0202MB34945545B2B96DA2B61B9373AB650@AM6PR0202MB3494.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(366004)(376002)(39860400002)(51444003)(189003)(199004)(256004)(14444005)(14454004)(3846002)(36756003)(186003)(2616005)(86362001)(4326008)(31696002)(6116002)(446003)(6306002)(6916009)(6512007)(476003)(76176011)(31686004)(52116002)(6486002)(8676002)(11346002)(6436002)(229853002)(7736002)(305945005)(486006)(66066001)(6246003)(81166006)(8936002)(102836004)(81156014)(54906003)(966005)(316002)(25786009)(26005)(64756008)(66556008)(66446008)(66476007)(66946007)(5660300002)(6506007)(53546011)(71190400001)(71200400001)(478600001)(386003)(2906002)(99286004)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3494;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFsAXYQn7QN1F93q3ESfP6/jQQK7+i2DlXh55crTbInh5VqFQrBjHaHCHjNOTySpShty+ToAszBaVia8HtcJJuNaM4yHbl2Ydf4TyI2DEUTfSWlsgliTWIVARjqWFFpwekyQ0HicdE6kSRAfVhCk87ziLPh0Ks2r5srYS++jNa2BjvR3yygrMiikqAz+7mZY9JzTaJ5D7Q5auEiaoOxDovZJdHQqSFnePB3FL1nuc/Qc+nYMGlzyGAWBKSmYQPHz86B/pEBZXVNtrmYo0JK16wjT+qhFaUG6AKenCJNdfImuRq5yU9nchxHlTl4Gz3+tYTA1M0jSwkb8i3dplGiSWjcIxgone2EZakXCikWVahUaCStFD/qz2wCy71Hvzj+56+UbK+s87wERW9q/A849VrMrNdGQAoL379SqZdvk7w2P4sCOQy0eiAN33QQlxuKL+1/MVEY1UV/B9LSMAshvAbApi9KjclU/8Prgxrp9SkA=
Content-ID: <A369F944B7F49E46A21FD2E1F6BEEA8E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcce2cf-363f-4ff8-208d-08d759594c20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 14:40:36.1739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5bot5JKHTDV8GOh1jieHYi56TepxMu+cGXTROnIec+IiaGbqdUZUKTrXf1flW60O5EvCxg7yaAJJrmp1P8wcowfcSw20kuZQVP0Tw0RY/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3494
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI1LjEwLjIwMTkgMTc6MzYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
PiANCj4gDQo+IE9uIDIzLjEwLjIwMTkgMTQ6NTgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+
PiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAwOToxMTo1NEFNICswMDAwLCBBbGV4YW5kcnUgU3Rl
ZmFuIElTQUlMQSB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gT24gMDMuMDkuMjAxOSAyMDoyNCwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOg0KPj4+PiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDk6NTMgQU0g
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBPbiAw
Mi4wOS4yMDE5IDEwOjExLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQo+Pj4+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPj4+Pj4+IEBAIC0yNDQsNiArMjQ0LDcgQEAgc3Ry
dWN0IHhlbl9odm1fYWx0cDJtX3ZpZXcgew0KPj4+Pj4+ICAgICAgICAgLyogQ3JlYXRlIHZpZXcg
b25seTogZGVmYXVsdCBhY2Nlc3MgdHlwZQ0KPj4+Pj4+ICAgICAgICAgICogTk9URTogY3VycmVu
dGx5IGlnbm9yZWQgKi8NCj4+Pj4+PiAgICAgICAgIHVpbnQxNl90IGh2bW1lbV9kZWZhdWx0X2Fj
Y2VzczsgLyogeGVubWVtX2FjY2Vzc190ICovDQo+Pj4+Pj4gKyAgICB1aW50OF90IHNldF9zdmU7
IC8qIGJvb2wgdmFsdWUgKi8NCj4+Pj4+PiAgICAgfTsNCj4+Pj4+DQo+Pj4+PiBUaGlzIGludGVy
ZmFjZSBpcywgZ2l2ZW4gdGhlIHJpZ2h0IGNvbmZpZ3VyYXRpb24sIGF2YWlsYWJsZSB0bw0KPj4+
Pj4gZ3Vlc3RzLiBIZW5jZSB5b3UgY2FuJ3Qgc2ltcGx5IGFkZCBhIGZpZWxkIGhlcmUuIEp1c3Qg
Y29uc2lkZXINCj4+Pj4+IHdoYXQgaGFwcGVucyBmb3IgYW4gZXhpc3RpbmcgY2FsbGVyIHdoZW4g
dGhlcmUgaXMgcmFuZG9tIGRhdGENCj4+Pj4+IGluIHRoZSBmaWVsZCB5b3Ugbm93IGFzc2lnbiBh
IG1lYW5pbmcuDQo+Pj4+DQo+Pj4+IFBlcmhhcHMgaW5zdGVhZCBvZiBleHRlbmRpbmcgdGhlIEhW
TU9QIGl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0bw0KPj4+PiBqdXN0IGFkZCBhIHhsIGNvbmZp
ZyBvcHRpb24gdGhhdCBkZWZpbmVzIHRoZSAiZGVmYXVsdCIgc3ZlIGJpdCBmb3INCj4+Pj4gYWx0
cDJtIHZpZXdzIGluIHRoZSBkb21haW4/DQo+Pj4+DQo+Pj4NCj4+PiBBZGRpbmcgYSB4bCBjb25m
aWcgb3B0aW9uIHdpbGwgbm90IHdvcmsgZm9yIHN5c3RlbXMgdGhhdCBkbyB1c2UgeGwuDQo+Pj4g
VGhlcmUgaXMgYSBuZWVkIHRoYXQgdGhpcyB3aWxsIHdvcmsgaW4gYWxsIGNhc2VzLg0KPj4NCj4+
IEkgYXNzdW1lIHRoYXQgc3VjaCBvcHRpb24gd291bGQgYmUgaW1wbGVtZW50ZWQgdXNpbmcgYSBE
T01DVEwsIHdoaWNoDQo+PiBjYW4gYWxzbyBiZSB1c2VkIGJ5IG90aGVyIHRvb2xzdGFja3MuIEkg
aG93ZXZlciBoYXZlIG5vIGlkZWEgd2hldGhlcg0KPj4gdGhpcyBpcyBhIHN1aXRhYmxlIGludGVy
ZmFjZSBvciBub3QgZm9yIHRoaXMgZmVhdHVyZS4NCj4+DQo+IA0KPiBJIHRoaW5rIHRoYXQgaGF2
aW5nIGEgSFZNT1BfYWx0cDJtX2dldF9zdXBwcmVzc192ZV9tdWx0aSBhbmQgbGV0dGluZyB0aGUN
CkhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkgKHNvcnJ5IGZvciB0aGUgdHlwbykN
Cj4gY2FsbGVyIHByb3ZpZGUgdGhlIHN0YXJ0IGdmbiBhbmQgdGhlIG5yIG9mIHBhZ2VzIHRvIGhh
dmUgdGhlIHN2ZSBiaXRzDQo+IHNldCB3aWxsIHByb3ZpZGUgYSBnb29kIHNvbHV0aW9uIGZvciBp
bml0IGFuIGRmb3IgZnVydGhlciBkZXZlbG9wbWVudC4NCj4gDQo+IEkgd2lsbCBnbyBvbiB0aGlz
IHdheSBmb3IgdmVyc2lvbiAyIGlmIGV2ZXJ5b25lIGlzIG9rIHdpdGggdGhpcy4NCj4gDQo+IFRo
YW5rcywNCj4gQWxleA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVsDQo+IF9fX19fX19fX19fX19fX19fX19fX19fXw0KPiBUaGlzIGVtYWlsIHdh
cyBzY2FubmVkIGJ5IEJpdGRlZmVuZGVyDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05615B50E9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAExg-0006nf-6e; Tue, 17 Sep 2019 15:00:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=biJV=XM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iAExf-0006nZ-42
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:00:11 +0000
X-Inumbo-ID: d75ba764-d95b-11e9-b299-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.98]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d75ba764-d95b-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 15:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLQj9T2CCDAGP3YVEvDu1WXexCov2HUAtkm2xaNoSVdPME/f35Aw5a5z/OfjXPvUzbyFurBut90p1PQMKNl33IF+yC09OOBzWjDYwUP48nNDl7EHTFwSKQisd4mnwQ1ESDg7Iz684sAGBoMxUgxI8cfS7TiCAUGSxxAUC5eD2a7secCG96bPkzZNfw89anuz4c212Wh3Ehcih2vuzyjaS83swmf/MsT/0LvdAPX1LSwL2QddWlG/QGqvtt1tw/OcAajPHVkdtMMZScNQMwwo8V1ISGW+PYzBk4OSAtPf/Z0NjDdudCVT6GYwhcOWETTVhZXBCmbMc3uh7bKw/m0IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpululCJFR0WMrB7SSWewhlM0I1YhTEn6oaEJM61yEA=;
 b=n2H2YGD/JQx2LLgZ9JtW7LwfmyRmJt7IuT7yg5EySsQlVH4lsPpOrXsRM8vjbGOIpwhy/tvDj+ym3TdAxBdugvqAioryMZLRut40fOM/kOkldlGn+4zzNFeykAfHGcRP3Uz7dy6lHs+ZvM/E2PU7BSZbv0yqvynyLL4kjZJCLmk+6oKF+qRQsEcDHhDxqTcZ/etq2moeSnrQ4UjfqRKiD2RCvxGN04OakZrxLmB/y3k4tllQcyXo16dRFvOH9g88fUC6azJfthB8vy8XRBKAvq9zKpLDv6LM8fqh5NRjC6YU2QD8mtkvlBsfjTnlhYR1CYea+21YR4Acr9K4Q6SF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpululCJFR0WMrB7SSWewhlM0I1YhTEn6oaEJM61yEA=;
 b=l/5i6tTFibIk5R5Qxku/b1gVLYEjHmTNYtr3dURF6lptkdYn6/zvnr/SGgYrQDAlOsTdcLKa4gsiMx9aDsWPSsl+KQWgH8+lKJ82aa2MHYSGwAKwj4NA0HtiQNGwlOgDsw0kR2hN9VZR/HLM3fXbVhakVcg/ubuDvUbzvHEpmNs=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5958.eurprd02.prod.outlook.com (10.141.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 15:00:08 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:00:08 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgCAAATfAIAAl0IA///TxQCAAAeXAA==
Date: Tue, 17 Sep 2019 15:00:07 +0000
Message-ID: <b1f9bb69-5fe5-69b8-0dce-93d13f363b0a@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
In-Reply-To: <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0201.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::21) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66b3457-5c1a-4d8c-96ec-08d73b7fbadb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR02MB5958; 
x-ms-traffictypediagnostic: AM7PR02MB5958:|AM7PR02MB5958:|AM7PR02MB5958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB59586D665FF9F2168FD3892BAB8F0@AM7PR02MB5958.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(396003)(366004)(376002)(199004)(189003)(6436002)(3846002)(102836004)(186003)(5660300002)(478600001)(305945005)(7736002)(31696002)(6246003)(6512007)(446003)(36756003)(86362001)(256004)(14444005)(26005)(486006)(476003)(11346002)(4326008)(2616005)(54906003)(6116002)(99286004)(14454004)(52116002)(386003)(229853002)(31686004)(316002)(76176011)(71190400001)(66556008)(64756008)(66476007)(66946007)(66066001)(6506007)(53546011)(81166006)(8936002)(81156014)(8676002)(2906002)(66446008)(6486002)(71200400001)(6916009)(25786009)(3714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5958;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 16qe+mAm3xHgo8+GoS95eueuaHw+ty7lQApdfnlgXeZUgs5osuWYSkzGdSiLs/KbKA/AKDYSbWIFTv/G3a/Q2fyA9uICRxS7jA1GtPCKmw68lsdzc3e0MAkaOP9zr52iFJCYfP+tmeCpNGvoIciv/8IXFllRg0fMXp3Vas1VlyelNqoUKIeABci/Bl98wu7VLScUUpN2I8qLYiZziS1hw0W0C+5gtYPCGdehBWfGPk2uLb84PRCkRy+pIO8Ydef/UWqerOXFG1fDzeNpHZgQGX2k9juS/tAgtY5MGYLBuq6pwrji3yjVLtcYSvgGyRnctaVqhj4o2tVljWgbxf1Zt/m6vVRZNp6HLfEGRrF0do8tQ9QB0T0BzaZCF9GxN6AXmUbfaVn0bSX0Wo1pQrR+MOJ9T7D/TQhnTh3DDqXSBqg=
Content-ID: <ACE488D16C496A4C98E463CB22607EBD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66b3457-5c1a-4d8c-96ec-08d73b7fbadb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:00:07.9744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/mtSB3KhIm5Dkfc6g6N2xYqMmHW60vSJiSPMB5s0nRS2bA61CtJRCOrAwgUppJGYdQFbmYsKoFZu7IRzjrrzJoTOtxunz8f57FbGfgDnwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5958
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE3LjA5LjIwMTkgMTc6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4y
MDE5IDE2OjExLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pg0KPj4gT24g
MTcuMDkuMjAxOSAxMTowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTcuMDkuMjAxOSAw
OTo1MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+IE9uIDE2LjA5LjIwMTkg
MTg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMTYuMDkuMjAxOSAxMDoxMCwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+Pj4+PiBAQCAt
MzIyNCw2ICszMjI0LDE0IEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19o
dm1fY29weSgNCj4+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIEhWTVRSQU5TX2JhZF9nZm5f
dG9fbWZuOw0KPj4+Pj4+ICAgICAgICAgICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gKyAgICAg
ICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJg0KPj4+Pj4+ICsgICAgICAgICAg
ICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJg0KPj4+Pj4+ICsgICAgICAgICAgICAg
aHZtX21vbml0b3JfY2hlY2tfcDJtKGFkZHIsIGdmbiwgcGZlYywgbnBmZWNfa2luZF93aXRoX2ds
YSkgKQ0KPj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+PiArICAgICAgICAgICAgcHV0X3BhZ2UocGFn
ZSk7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Ow0K
Pj4+Pj4NCj4+Pj4+IEknbSBzb3JyeSwgYnV0IHRoZXJlIGlzIF9zdGlsbF8gbm8gY29tbWVudCBu
ZXh0IHRvIHRoaXMgYXBwYXJlbnQNCj4+Pj4+IG1pcy11c2Ugb2YgSFZNVFJBTlNfZ2ZuX3BhZ2Vk
X291dC4NCj4+Pj4NCj4+Pj4gSSB3aWxsIGFkZCB0aGlzIGNvbW1lbnQgaGVyZToNCj4+Pj4NCj4+
Pj4gIi8qDQo+Pj4+ICAgICAgKiBJbiBjYXNlIGEgdm0gZXZlbnQgd2FzIHNlbnQgcmV0dXJuIHBh
Z2VkX291dCBzbyB0aGUgZW11bGF0aW9uIHdpbGwNCj4+Pj4gICAgICAqIHN0b3Agd2l0aCBubyBz
aWRlIGVmZmVjdA0KPj4+PiAgICAgICovIg0KPj4+DQo+Pj4gRmlyc3Qgb2YgYWxsIC0gd2h5ICJ3
YXMgc2VudCI/IFRoZSBldmVudCBpcyB5ZXQgdG8gYmUgc2VudCwgaXNuJ3QgaXQ/DQo+Pg0KPj4g
WWVzIGl0IHNob3VsZCBzdGF0ZSAiaWYgdGhlIGV2ZW50IGlzIHNlbnQiLg0KPiANCj4gImlzIHNl
bnQiIGlzIHN0aWxsIG5vdCBpbmRpY2F0aW5nIHRoaXMgaXMgc29tZXRoaW5nIHlldCB0byBoYXBw
ZW4uDQo+ICJpcyB0byBiZSBzZW50IiB3b3VsZCBiZSB0byBtZSAoY2F2ZWF0IC0gSSdtIG5vdCBh
IG5hdGl2ZSBzcGVha2VyKS4NCj4gDQo+Pj4gQW5kIHRoZW4gSSdtIGFmcmFpZCB0aGlzIHN0aWxs
IGlzbid0IGVub3VnaC4gX19odm1fY29weSgpIGdldHMgdXNlZA0KPj4+IGZvciBtYW55IHB1cnBv
c2VzLiBGb3IgZXhhbXBsZSwgd2hpbGUgbG9va2luZyBpbnRvIHRoaXMgYWdhaW4gd2hlbg0KPj4+
IHByZXBhcmluZyB0aGUgcmVwbHkgaGVyZSwgSSd2ZSBub3RpY2VkIHRoYXQgYWJvdmUgeW91IG1h
eSB3cm9uZ2x5DQo+Pj4gY2FsbCBodm1fbW9uaXRvcl9jaGVja19wMm0oKSB3aXRoIG5wZmVjX2tp
bmRfd2l0aF9nbGEgLSB0aGVyZSdzIG5vDQo+Pj4gbGluZWFyIGFkZHJlc3Mgd2hlbiBIVk1DT1BZ
X2xpbmVhciBpcyBub3Qgc2V0LiBJZiwgd2hpbGUgcHV0dGluZw0KPj4NCj4+IFlvdSBhcmUgcmln
aHQsIGEgY2hlY2sgZm9yIEhWTUNPUFlfbGluZWFyIHNob3VsZCBnbyBpbiB0aGUgaWYgc28gd2Ug
YXJlDQo+PiBzdXJlIHRoYXQgaXQgaXMgY2FsbGVkIHdpdGggYSBsaW5lYXIgYWRkcmVzcyBvbmx5
Lg0KPj4NCj4+PiB0b2dldGhlciB3aGF0IHRoZSBjb21tZW50IG5lZWRzIHRvIGV4cGxhaW4gKGku
ZS4gZXZlcnl0aGluZyB0aGF0DQo+Pj4gY2FuJ3QgYmUgaW1wbGllZCBmcm9tIHRoZSBjb2RlIHlv
dSBhZGQpLCB5b3UgY29uc2lkZXJlZCBhbGwgY2FzZXMNCj4+PiB5b3Ugc2hvdWxkIGhhdmUgbm90
aWNlZCB0aGlzIHlvdXJzZWxmLg0KPj4NCj4+IFdpdGggdGhpcyBuZXcgY2hlY2sgaW4gcGxhY2Ug
KEhWTUNPUFlfbGluZWFyKSBfX2h2bV9jb3B5KCkgd2lsbCBiZQ0KPj4gY2FsbGVkIGZyb20gbGlu
ZWFyX3JlYWQoKSBsaW5lYXJfd3JpdGUoKSB3aGVyZSBpdCB3aWxsIHBhc3MgZG93bg0KPj4gWDg2
RU1VTF9SRVRSWS4NCj4+DQo+PiBUaGUgY29tbWVudCBjYW4gY2hhbmdlIHRvOg0KPj4gIklmIGEg
ZXZlbnQgaXMgc2VudCByZXR1cm4gcGFnZWRfb3V0LiBUaGUgZW11bGF0aW9uIHdpbGwgaGF2ZSBu
byBzaWRlDQo+PiBlZmZlY3QgYW5kIHdpbGwgcmV0dXJuIFg4NkVNVUxfUkVUUlkiDQo+IA0KPiBJ
J20gc29ycnkgdG8gYmUgYSBwYWluIGluIHlvdXIgbmVjaywgYnV0IG5vLCB0aGlzIHN0aWxsIGlz
IG5vdA0KPiBzdWZmaWNpZW50IGltby4gVGhlIGNvbW1lbnQsIHdoYXRldmVyIHdvcmRpbmcgeW91
IGNob29zZSwNCj4gc2hvdWxkIG1ha2UgY2xlYXIgdGhhdCB5b3UgaGF2ZSB1bmRlcnN0b29kIHRo
ZSBwb3NzaWJsZSBlZmZlY3RzDQo+IG9mIHVzaW5nIGEgc3VzcGljaW91cyByZXR1cm4gdmFsdWUs
IGFuZCBpdCBzaG91bGQgYWxzbyBtYWtlDQo+IGNsZWFyIHRvIHJlYWRlcnMgdGhhdCB0aGlzIGlz
IGluIGZhY3Qgbm90IGdvaW5nIHRvIGNhdXNlIGENCj4gcHJvYmxlbSBfZm9yIGFueSBjYWxsZXJf
Lg0KPiANCg0KVGhlcmUgaXMgbm8gcHJvYmxlbSwgSSB1bmRlcnN0YW5kIHRoZSByaXNrIG9mIGhh
dmluZyBzdXNwaWNpb3VzIHJldHVybiANCnZhbHVlcy4gSSBhbSBub3QgaGFuZ2VkIG9uIGhhdmlu
ZyB0aGlzIHJldHVybi4gSSB1c2VkIHRoaXMgdG8gc2tpcCANCmFkZGluZyBhIG5ldyByZXR1cm4g
dmFsdWUuIEkgY2FuIGRvIHRoaXMgaWYgd2UgYWdyZWUgb24gYSBzdWl0YWJsZSBuYW1lIA0KZm9y
IGEgbmV3IHJldHVybiB2YWx1ZSBpbiBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQuIEkgY2Fu
IHByb3Bvc2UgDQpIVk1UUkFOU19iYWRfZ2ZuX2FjY2Vzcy4NCg0KQWxleA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

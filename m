Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6578717
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs0lR-0004A3-RB; Mon, 29 Jul 2019 08:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OUEA=V2=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hs0lQ-00049y-GS
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:12:12 +0000
X-Inumbo-ID: 8edb56e2-b1d8-11e9-84b2-3b5d1073d0d8
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.101]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8edb56e2-b1d8-11e9-84b2-3b5d1073d0d8;
 Mon, 29 Jul 2019 08:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcNF7SXzxxpRM7+dDOi05XL20c4T05wVraIL2dmUh/vuL5tAnBpZuMXUnPqptnusA4FS06AN2xJj9SzDNDrR51K0tVXllWDDkrxRMsLqFz7PMVT/mSDBn3fh0ZzfSqotibYy+ehObG8KZDkM8Km4xRquaWeSJNwefoTVF+bMmPFDCUji6UvtSiAamSA8D4QcRNs8GthotXSE/SMg3nEX1dS7tBT/FgI2tzlFpkhhL8wqhDWcZBYP/BT3Goyg05aL1wiMl7fdIG5A4l1es4pj+t29ZowEwbZteecyK2uX6+pbJ09qBgg6ceYwYsFqprGQ+Vb6zCdADW6zWV71AN8A3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+ab+Gig7fN5T3f/5rL51xwMjEjfZ3ehOhy66u52c9Q=;
 b=KAWNUQJb+T4lEYwTNHg+pmBAmWec1XiNBjkgBN5zIMyODVT43kceScgDPQPthuHcZvnxBa4ymxgchWpNM+uKTJi967DYOxtI2f/cm5hroOZ2+pzU3BagwRJ8r/sKQmdD1icbBJjD18TsCf0SKKFZQqyRj5JaQr4d5CBWS+nxCyVz/Pjg8tYW50STOsg14vzTK26tzwu94DHs7JWZLe5Aer6xwF8OHTKEb8T1ay/wRK9ePkQk7AUAGVGDGOqmM0Tf7Ak5qEgtJvhvy1HS+jXpsm364jFZfH4Rtf1Ov04hbN4+G71EZpJoDx5Cfgvrjx9Mc/9jzfsvpZ3xxwoJHvKA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+ab+Gig7fN5T3f/5rL51xwMjEjfZ3ehOhy66u52c9Q=;
 b=IKhSNg5h3CSFiUmo1WZliKemj+spK5WyOEO34xGuVYKMEOFUhiNtJNFs2Rq+66dWrcxGc9qmJ6shvim6ubHVZYe+iyReBXzYYfr9dVdM5sm9AyF0T0Oj08LSt37Ajrn+WoFsI1DERqvi9C79XTBCbFrC5++1tx5s+/kiKUsK+eA=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2704.eurprd02.prod.outlook.com (10.173.85.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 08:12:05 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18%3]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 08:12:05 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich
 <JBeulich@suse.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAAA2iAgAACSgCAAAxnAIAPT4MA
Date: Mon, 29 Jul 2019 08:12:05 +0000
Message-ID: <9a509cd8-d91a-036d-f949-f1c5d54059d6@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
 <08ed1d56-b24b-66bd-34da-d0c329a2eecf@suse.com>
 <ded7b153-d2cd-15e1-93cc-9aaab2a06d95@bitdefender.com>
In-Reply-To: <ded7b153-d2cd-15e1-93cc-9aaab2a06d95@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::29) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e60bd82f-acef-40a8-73f4-08d713fc7132
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2704; 
x-ms-traffictypediagnostic: VI1PR0202MB2704:|VI1PR0202MB2704:
x-microsoft-antispam-prvs: <VI1PR0202MB27042DDA9C41B62557156F1DABDD0@VI1PR0202MB2704.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(39860400002)(396003)(136003)(51444003)(189003)(199004)(26005)(52116002)(14454004)(66946007)(6486002)(99286004)(66476007)(64756008)(66556008)(66446008)(4326008)(102836004)(53546011)(478600001)(386003)(76176011)(86362001)(6506007)(229853002)(11346002)(446003)(71200400001)(186003)(71190400001)(486006)(2616005)(31696002)(476003)(6436002)(5660300002)(54906003)(53936002)(316002)(110136005)(14444005)(256004)(6512007)(2906002)(8936002)(81156014)(81166006)(8676002)(25786009)(36756003)(68736007)(6246003)(31686004)(3846002)(305945005)(66066001)(7736002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2704;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V2Mh5IZSyCk3XntV0yQ4dP6RbqjPCuFiGMvOEakBB3UvzMpsT5hB6Iqs/HRJGOMicHP0c99Ehzk1CYpa9t6mexOwBWg+f53/B1s+WpC6/F+r5RWkzXH0uL3U/T51HNwmnog0PtAj7VhzjzgrIyX5Qe4LaDT8dtjszD/Zi9XTL9uBaCAH/xFTw0GSb35qYWUqXWoZN+Lpz1A/9HyAHpJwJ0VPBaZ4makRjZGBNzRNwGYbmigVO6wsTlIYk21MIveyhjh4/dPHxaxlNGvqownMv4gt4TjwBbfDvOYrvbFSDDv+2OU+tpKt4tQkdv2J3915SBHN8dYAajUYFsUOBXE4rAznC7Ukwhb7Nh7vHxDt1wnmUS098khkjerYriZsNysn65DjaUuki9DdLf5QpGEVqaBLTxND4DkN4vggRmt7di0=
Content-ID: <31A6444A7CEDA742AF6DDC6D34E76645@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60bd82f-acef-40a8-73f4-08d713fc7132
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 08:12:05.3637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2704
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjA3LjIwMTkgMTc6MjMsIFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4gT24gNy8x
OS8xOSA0OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE5LjA3LjIwMTkgMTU6MzAs
IFJhenZhbiBDb2pvY2FydSB3cm90ZToNCj4+PiBPbiA3LzE5LzE5IDQ6MTggUE0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+PiBPbiAxOS4wNy4yMDE5IDE0OjM0LCBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSB3cm90ZToNCj4+Pj4+IE9uIDE4LjA3LjIwMTkgMTU6NTgsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+IE9uIDAzLjA3LjIwMTkgMTI6NTYsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdy
b3RlOg0KPj4+Pj4+PiBBL0QgYml0IHdyaXRlcyAob24gcGFnZSB3YWxrcykgY2FuIGJlIGNvbnNp
ZGVyZWQgYmVuaWduIGJ5IGFuIA0KPj4+Pj4+PiBpbnRyb3NwZWN0aW9uDQo+Pj4+Pj4+IGFnZW50
LCBzbyByZWNlaXZpbmcgdm1fZXZlbnRzIGZvciB0aGVtIGlzIGEgcGVzc2ltaXphdGlvbi4gV2Ug
dHJ5IA0KPj4+Pj4+PiBoZXJlIHRvDQo+Pj4+Pj4+IG9wdGltaXplIGJ5IGZpdGVyaW5nIHRoZXNl
IGV2ZW50cyBvdXQuDQo+Pj4+Pj4NCj4+Pj4+PiBCdXQgeW91IGFkZCB0aGUgc2VuZGluZyBvZiBt
b3JlIGV2ZW50cyAtIGhvdyBkb2VzICJmaWx0ZXIgb3V0IiBtYXRjaA0KPj4+Pj4+IHRoZSBhY3R1
YWwgaW1wbGVtZW50YXRpb24/DQo+Pj4+Pg0KPj4+Pj4gVGhlIGV2ZW50cyBhcmUgc2VuZCBvbmx5
IGlmIHRoZXJlIGlzIGEgbWVtIGFjY2VzcyB2aW9sYXRpb24gDQo+Pj4+PiB0aGVyZWZvcmUgd2UN
Cj4+Pj4+IGFyZSBmaWx0ZXJpbmcgYW5kIG9ubHkgc2VuZGluZyB0aGUgZXZlbnRzIHRoYXQgYXJl
IGludGVyZXN0aW5nIHRvDQo+Pj4+PiBpbnRyb3NwZWN0aW9uLg0KPj4+Pg0KPj4+PiBXaGVyZSBp
cyBpdCB0aGF0IHlvdSBwcmV2ZW50IGFueSBldmVudCBmcm9tIGJlaW5nIHNlbnQ/IEFzIHNhaWQs
DQo+Pj4+IHJlYWRpbmcgdGhlIHBhdGNoIEkgb25seSBzZWUgbmV3IHNlbmRpbmcgc2l0ZXMgdG8g
Z2V0IGFkZGVkLg0KPj4+DQo+Pj4gSWYgd2UgZG9uJ3QgZW11bGF0ZSwgd2Ugd291bGQgcmVjZWl2
ZSB0aGUgcGFnZS13YWxrLWdlbmVyYXRlZCBldmVudHMNCj4+PiBfYW5kXyB0aGUgdG91Y2hpbmct
dGhlLXBhZ2UtdGhlLWluc3RydWN0aW9uLWlzLXRvdWNoaW5nIGV2ZW50cy4NCj4+DQo+PiBTaW5j
ZSB0aGUgcGF0Y2ggaGVyZSBhbHRlcnMgZW11bGF0aW9uIHBhdGhzIG9ubHksIGhvdyBkbyB5b3Ug
a25vdw0KPj4gd2hldGhlciB0byBlbXVsYXRlPyBJbiBvcmRlciB0byBub3QgcmVjZWl2ZSB1bmR1
ZSBldmVudHMgaXQgd291bGQNCj4+IHNlZW0gdG8gbWUgdGhhdCB5b3UnZCBmaXJzdCBoYXZlIHRv
IGludGVyY2VwdCB0aGUgZ3Vlc3Qgb24gaW5zbnMNCj4+IG9mIGludGVyZXN0IC4uLiBPdmVyYWxs
IEkgdGhpbmsgdGhhdCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sIHdoaWxlDQo+PiBpdCBoYXMgaW1w
cm92ZWQsIGlzIHN0aWxsIGxhY2tpbmcgc3VmZmljaWVudCBpbmZvcm1hdGlvbiBmb3IgYQ0KPj4g
cGVyc29uIGxpa2UgbWUgKG5vdCBrbm93aW5nIG11Y2ggYWJvdXQgeW91ciBtb25pdG9yIHRvb2xz
KSB0byBiZQ0KPj4gYWJsZSB0byBzZW5zaWJseSByZXZpZXcgdGhpcyAod2hpY2ggaW5jbHVkZXMg
dW5kZXJzdGFuZGluZyB0aGUNCj4+IHByZWNpc2Ugc2NlbmFyaW8geW91IHdhbnQgdG8gaW1wcm92
ZSkuDQo+IA0KPiBJZiB0aGUgaGFyZHdhcmUgZXhpdHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQg
Y2F1c2VkIGJ5IGEgcGFnZSB3YWxrLCB3ZSANCj4gZW5kIHVwIGluIHAybV9tZW1fYWNjZXNzX2No
ZWNrKCksIGF0IHdoaWNoIHBvaW50IHdlIG5lZWQgdG8gZGVjaWRlIGlmIHdlIA0KPiB3YW50IHRv
IHNlbmQgb3V0IGEgdm1fZXZlbnQgb3Igbm90Lg0KPiANCj4gSWYgd2Ugd2VyZSB0byBzZW5kIG91
dCB0aGlzIHZtX2V2ZW50LCBhbmQgaXQgd291bGQgdGhlbiBiZSBtYWdpY2FsbHkgDQo+IHRyZWF0
ZWQgc28gdGhhdCB3ZSBnZXQgdG8gYWN0dWFsbHkgcnVuIHRoZSBpbnN0cnVjdGlvbiBhdCBSSVAs
IHNhaWQgDQo+IGluc3RydWN0aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVkIHBhZ2UgYW5k
IHByb3Zva2UgYSB2bV9ldmVudC4NCj4gDQo+IE5vdywgaWYgbnBmZWMua2luZCAhPSBucGZlY19r
aW5kX3dpdGhfZ2xhLCB0aGVuIHdlJ3JlIGluIHRoZSBwYWdlIHdhbGsgDQo+IGNhc2UsIGFuZCBz
byBpbiB0aGlzIGNhc2Ugb25seSwgYW5kIG9ubHkgaWYgDQo+IGQtPmFyY2gubW9uaXRvci5pbmd1
ZXN0X3BhZ2VmYXVsdF9kaXNhYmxlZCBpcyB0cnVlLCB3ZSB3b3VsZCBjaG9vc2UgdG8gDQo+IGRv
IHRoaXMgZW11bGF0aW9uIHRyaWNrOiBlbXVsYXRlIF90aGVfcGFnZV93YWxrXyB3aGlsZSBpZ25v
cmluZyB0aGUgRVBULCANCj4gYnV0IGRvbid0IGlnbm9yZSB0aGUgRVBUIGZvciB0aGUgZW11bGF0
aW9uIG9mIHRoZSBhY3R1YWwgaW5zdHJ1Y3Rpb24uDQo+IA0KPiBTbyB3aGVyZSBpbiB0aGUgZmly
c3QgY2FzZSB3ZSB3b3VsZCBoYXZlIDIgRVBUIGV2ZW50cywgaW4gdGhlIHNlY29uZCB3ZSANCj4g
b25seSBoYXZlIG9uZSAob3IgaWYgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBkb2VzIG5vdCB0cmln
Z2VyIGFuIEVQVCANCj4gZXZlbnQsIHdlIHdvdWxkIGhhdmUgMSBldmVudCBpbiB0aGUgZmlyc3Qg
Y2FzZSwgYW5kIG5vbmUgaW4gdGhlIHNlY29uZCkuDQo+IEhlbmNlIHRoZSBmaWx0ZXJpbmcgbWVu
dGlvbmVkLg0KPiANCj4gU28gdG8gYW5zd2VyIHlvdXIgcXVlc3Rpb246ICJob3cgZG8geW91IGtu
b3cgd2hldGhlciB0byBlbXVsYXRlIiwgd2UgZG8gDQo+IHNvIG9ubHkgaWYgbnBmZWMua2luZCAh
PSBucGZlY19raW5kX3dpdGhfZ2xhICYmIA0KPiBkLT5hcmNoLm1vbml0b3IuaW5ndWVzdF9wYWdl
ZmF1bHRfZGlzYWJsZWQuDQo+IA0KPiBJIGhvcGUgdGhpcyBjbGVhcnMgaXQgdXAgc29tZXdoYXQu
DQo+IA0KDQpUbyBzdW1tYXJpemUgdGhlIGNoYW5nZXMgbmVlZGVkIGZvciB0aGUgbmV4dCB2ZXJz
aW9uLCBhcGFydCBmcm9tIHRoZSANCmNvZGUgY2hhbmdlcywgaXMgdGhlIGRlc2NyaXB0aW9uIGdv
b2Qgb3IgZG8gSSBoYXZlIHRvIGFkZCBzb21ldGhpbmcgZWxzZT8NCg0KVGhhbmtzLA0KQWxleA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

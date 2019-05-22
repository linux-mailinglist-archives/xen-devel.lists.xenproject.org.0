Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41226996
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 20:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTVcO-0005zZ-Un; Wed, 22 May 2019 18:05:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q8vz=TW=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1hTVcM-0005zU-RP
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 18:05:35 +0000
X-Inumbo-ID: 2ff5380f-7cbc-11e9-8980-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::626])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ff5380f-7cbc-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAMQNpSLhtdoQH0nCxe3/bX/LTbz/YZ/O6d+8tvYtVU=;
 b=hpeDmvjqSuBeZThkWkVYtDZyA+aI4CZsiZurzvnYjLkr9QHScixTOXHzWMa4szGo/UcWEJ8OGq6N9dJMOVkd39gHC5Twhcc3py4tTuF6GXR5OkyVagchpzgj6l7oFYDpW4ITV/w3nV+kS7cADS75jLg3vAH9QUKXKJFEGNYerTxrQKfCysGn+UgNDtMPDUHbOFflGVoLDEf1KHHQM7vcdSutdq2UCJcA54HnYxbe4Q/bi8Dz6R+VYKdKF/5uoLbMADEqGVY72lUOLfc+Pv32SrYCOKFyWcEP0IvqSaPZdtIVaG2Hqhz0xZdJxglsuOwwgjpHyMGCl9GXY9boABlsxg==
Received: from DB6PR03MB2968.eurprd03.prod.outlook.com (10.165.162.21) by
 DB6PR03MB3094.eurprd03.prod.outlook.com (10.165.162.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 18:05:27 +0000
Received: from DB6PR03MB2968.eurprd03.prod.outlook.com
 ([fe80::794b:7116:d1ab:c1a5]) by DB6PR03MB2968.eurprd03.prod.outlook.com
 ([fe80::794b:7116:d1ab:c1a5%7]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 18:05:27 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "JBeulich@suse.com" <JBeulich@suse.com>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/public: arch-arm: Restrict the visibility of struct
 vcpu_guest_core_regs
Thread-Index: AQHVEJ5fLi9eyflPOU6zm5EuUWMRmaZ3cKAA
Date: Wed, 22 May 2019 18:05:27 +0000
Message-ID: <59be6ac5f732609593c263eb29fcae372301a2f2.camel@epam.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
 <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
 <5CE540960200007800231571@prv1-mh.provo.novell.com>
 <109e62db-9ed6-309b-44cc-63e7cffa2c67@arm.com>
In-Reply-To: <109e62db-9ed6-309b-44cc-63e7cffa2c67@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [194.53.196.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 153fce08-9bc0-49ae-91dd-08d6dee01224
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:DB6PR03MB3094; 
x-ms-traffictypediagnostic: DB6PR03MB3094:
x-microsoft-antispam-prvs: <DB6PR03MB3094E68D5188BFF72CA8370FF4000@DB6PR03MB3094.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(39860400002)(366004)(346002)(51914003)(199004)(189003)(102836004)(6436002)(68736007)(6246003)(4326008)(25786009)(6486002)(54906003)(99286004)(229853002)(3846002)(6116002)(66066001)(7736002)(305945005)(26005)(2906002)(256004)(66446008)(76116006)(64756008)(66556008)(91956017)(86362001)(316002)(186003)(80792005)(73956011)(5660300002)(36756003)(66476007)(66946007)(53546011)(8676002)(81156014)(81166006)(71200400001)(71190400001)(6506007)(486006)(14454004)(72206003)(118296001)(6512007)(53936002)(76176011)(11346002)(446003)(2616005)(110136005)(2501003)(478600001)(8936002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR03MB3094;
 H:DB6PR03MB2968.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YhqZFkkxI6tXZnhVKBC6dYLk98mdrwVfZyCMGbEtPABZ94Y3ztUsomox3xLJ6YHYyBGdpnwE3Mp6ABXRpzNjA8P+UkISBvXVaVBdDrNK03dU4BITjK0i7x2S/VM422U22Hs2O9BQoNMr9xdPytl2UNDTetHPsPLZXgXvhbLnxBcQiaszpejnlOYorBdQQcTbWAc7nQjio4OLH2qkczsHaULwpe8RFElA7WTPn7mnx1YvBgU83+snDjk2o4+u60ezEBlI/GEJc256q4+F6q7h7b9y1iRPxcuOzd4L4iJD/3pYiZ/SWAhLLLYwHOYbvU6TiaBQui6BG5xKjfxmHJeiK62/6NP4pxoHPGe4USYPfJbCyGRn0x64y+Y4VdkPoJN5s5POKBw+SENAnEKlay/CmqCFOG2p1erx7r2qgemll1A=
Content-ID: <C0D710873C3D9046B1054E55BC235376@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153fce08-9bc0-49ae-91dd-08d6dee01224
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 18:05:27.7191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB3094
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLCBKYW4NCg0KT24gV2VkLCAyMDE5LTA1LTIyIGF0IDE0OjAwICswMTAwLCBK
dWxpZW4gR3JhbGwgd3JvdGU6DQo+ICgrQXJ0ZW0pDQo+IA0KPiBIaSBKYW4sDQo+IA0KPiBPbiAy
Mi8wNS8yMDE5IDEzOjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiA+ID4gPiBPbiAyMi4wNS4x
OSBhdCAxNDoyMCwgPA0KPiA+ID4gPiA+IGp1bGllbi5ncmFsbEBhcm0uY29tDQo+ID4gPiA+ID4g
PiB3cm90ZToNCj4gPiA+IE9uIDIxLzA1LzIwMTkgMTA6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4gPiA+ID4gSGkgSmFuLA0KPiA+ID4gPiANCj4gPiA+ID4gT24gNS8yMS8xOSAxMDo0MyBBTSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gMjEuMDUuMTkgYXQgMTE6MzUs
IDwNCj4gPiA+ID4gPiA+ID4gPiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQ0KPiA+ID4gPiA+ID4gPiA+
ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IE9uIDUvMjEvMTkgMTA6MjYgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiAyMC4wNS4xOSBhdCAy
MDoxMiwgPA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+
ICAgICAgICBBcyB0aGlzIGlzIG5vdyBYZW4gYW5kIHRvb2xzIG9ubHksIEkgYW0NCj4gPiA+ID4g
PiA+ID4gPiB3b25kZXJpbmcgd2hldGhlciB0aGUgY2hlY2sgb24NCj4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgR05VX0MgaXMgc3RpbGwgbmVjZXNzYXJ5LiBJIGFtIGhhcHB5IHRvIHNlbmQgYQ0KPiA+
ID4gPiA+ID4gPiA+IGZvbGxvdy11cCBwYXRjaCAob3IgZm9sZA0KPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICBpbiB0aGlzIG9uZSkgaWYgaXQgY2FuIGJlIHJlbW92ZWQuDQo+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGRyb3BwZWQgaWYgaXQgY2FuIGJl
IHdpdGhvdXQNCj4gPiA+ID4gPiA+ID4gYnJlYWtpbmcgYW55DQo+ID4gPiA+ID4gPiA+IHBhcnQg
b2YgdGhlIGJ1aWxkLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGlzIGlzIGJlY2F1c2Ug
YWxsIHRoZSB0b29scyBhcmUgcGFydCBvZiB4ZW4uZ2l0LCByaWdodD8NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1cHBvc2VkIHRvIGRlZmluZSBfX1hFTl9U
T09MU19fLCBvcg0KPiA+ID4gPiA+IGlmIGFueW9uZSBkb2VzLCB0aGV5J3JlIG9uIHRoZWlyIG93
bi4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBJIHdpbGwg
ZG8gYSBmdWxsIGJ1aWxkIGNoZWNrLg0KPiA+ID4gDQo+ID4gPiBJIHRob3VnaHQgYWJvdXQgdGhp
cyBhZ2FpbiwgbG9uZyB0ZXJtIHRoZXJlIGFyZSBhbiBhdHRlbXB0IHRvDQo+ID4gPiBidWlsZCB4
ZW4gd2l0aA0KPiA+ID4gb3RoZXIgY29tcGlsZXIgbm90IG5lY2Vzc2FyaWx5IHN1cHBvcnRpbmcg
R05VIEMgZXh0ZW5zaW9uLg0KPiA+ID4gV2hpbGUgdGhpcyB3b3VsZCBwcm9iYWJseSBub3QgYmUg
dGhlIG9ubHkgcGxhY2UgdGhhdCBuZWVkIHRvIGJlDQo+ID4gPiByZXdvcmtlZCwgd2UNCj4gPiA+
IHdvdWxkIGhhdmUgdG8gcmV2ZXJ0IHBhcnQgb2YgdGhpcyBjaGFuZ2UuIFNvIEkgd2lsbCBub3Qg
ZHJvcCB0aGUNCj4gPiA+ICNpZmRlZiBoZXJlLg0KPiA+IA0KPiA+IFdlbGwsIEkgZG9uJ3Qga25v
dyBob3cgaXQgaXMgZm9yIEFybSwgYnV0IG9uIHg4NiB3ZSBhY3R1YWxseSB1c2UNCj4gPiB0aGUN
Cj4gPiAiZXh0ZW5kZWQiIG5hbWluZyBxdWl0ZSBleHRlbnNpdmVseSwgc28gYnVpbGRpbmcgd2l0
aCBhIGNvbXBpbGVyDQo+ID4gdGhhdCBkb2Vzbid0IHN1cHBvcnQgdGhpcyBleHRlbnNpb24gaXMg
bm90IHJlYWxseSBhbiBvcHRpb24gdGhlcmUuDQo+IA0KPiBGb3IgdGhlIEFybSwgSSB0aGluayBv
bmx5IGNwdV91c2VyX3JlZ3MgaXMgdXNpbmcgImV4dGVuZGVkIiBuYW1pbmcuDQo+IEl0IHNob3Vs
ZCBiZSANCj4gcG9zc2libGUgdG8gcmVtb3ZlIGl0IHdpdGhvdXQgdG9vIG11Y2ggdHJvdWJsZSBo
ZXJlLg0KPiANCj4gQEFydGVtLCBpcyB0aGVyZSBhbnkgcmVzdHJpY3Rpb24gdG8gdXNlIGFub255
bW91cyB1bmlvbiBpbiBmdW5jdGlvbmFsDQo+IHNhZmV0eT8NCj4gDQoNCkluIGdlbmVyYWwsIHVu
aW9ucyBhcmUgbm90IGFsbG93ZWQgaW4gc2FmZXR5IHJlZ3VsYXRlZCBwcm9ncmFtbWluZywNCnRo
ZXkgYWx3YXlzIHJlcXVpcmUgYSAiZGV2aWF0aW9uIiAtIGUuZy4gdW5pb25zIHVzZSBmb3IgZGF0
YSBwYWNraW5nIGlzDQp1c3VhbGx5IGFjY2VwdGVkIGRpc3JlZ2FyZGluZyBhbm9ueW1vdXMgb3Ig
bm90Lg0KDQpDb3VwbGUgb2Ygb3RoZXIgdGhpbmdzIEkgd2FudGVkIHRvIG1lbnRpb246DQoxLiBh
bGwgcHJvdGVjdGl2ZSBwcm9ncmFtbWluZyBzdGFuZGFyZHMgZS5nLiBNSVNSQSByZWNvbW1lbmQg
cmVkdWNpbmcNCnZpc2liaWxpdHkgb2YgZnVuY3Rpb25zIGFuZCB2YXJpYWJsZXMgdG8gcmVkdWNl
IEFQSSBzdXJmYWNlIGFucyB0aHVzDQpuZWVkIGZvciB0ZXN0IGNvdmVyYWdlIGFuZCBzeXN0ZW1h
dGljIGZhdWx0IHByb2JhYmlsaXR5Lg0KMi4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiB4ZW4gdG9v
bHMgYXJlIHZlcnkgaGFyZCB0byB1c2UgaW4gc2FmZXR5IGZvcg0KbWFueSByZWFzb25zLCBJIGhv
cGUgdG8gZm9sbG93IHVwIG9uIHRoaXMgc29vbi4uLg0KDQogLS0gQXJ0ZW0NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

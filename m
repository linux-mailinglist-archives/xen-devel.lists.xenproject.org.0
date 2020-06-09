Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A7D1F4A2B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 01:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jio3U-00012V-26; Tue, 09 Jun 2020 23:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AJG=7W=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jio3S-00012Q-PY
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 23:53:18 +0000
X-Inumbo-ID: 62ae44e4-aaac-11ea-bb8b-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62ae44e4-aaac-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 23:53:16 +0000 (UTC)
IronPort-SDR: BcHilgKA5Uhn85YuR4C9YpzHmsoIFlAvK/LyJu5E2qESxT0zyDS1fwfGgIWoatufkogmkXAX14
 qSA3pW+MY1LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 16:53:13 -0700
IronPort-SDR: AYOQbkY+EpXjge3byPdsUher9dE5q+vgpvJmG+7Q91/JKgSSNbvAHs2DcC/nJBxWTcRGSD0IAg
 61k47Suxfp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; d="scan'208";a="260235733"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2020 16:53:13 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jun 2020 16:53:13 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jun 2020 16:53:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 9 Jun 2020 16:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mg8eTHDps640Q1dfC+N2TgQKbuiFaorcABOBHCEKBbDEyKp1IsoBnzk+ien/nbGhXN7kAAIvvxhngPZiT1GORw1eEOjcUFNpYDHQeAAcOyUMkKlGEEdjWnShdLmzjCLc8mDltKyDMo+HKtMhQ6xsL6YyoUPX113Ef+KPnDlIOX/NlQa2hkvXA6kkn6TEcmbY8/8JCNUrQqrHXwblkY/HVVg1aBP/syiFnSxVqOa+rJZGXtfuOhHHYd5H6Le4NLS4xLD7eLQH//wdKdh7h7iMANh2oIj+3FRdqqMeWFcMGFUWXOuJytqdBGewf3l9X0MKBWqGK8l81SMfYPQS9uEP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Idu8MoGDiheqPhqpXQ5cBxu78CtPxyFHMKB4nyBFHuA=;
 b=JWzdl5JUTgorhFy91x1GWtGEGVGG8PBolzf95/abjbePYX757qCI0ooAcIv6ItUXVVqxK0Pycks/9r0lEaVureo8B31xXvNxZvpO9UWAw4bXu5ocPMSUPUpb36sn9CgTZ5BMg9agp5c49AtXe+Rw7okxEmycT4HNVIjxn7lSZ33ioVtULn3pR+Tp+BOlTrcBt9On/1qJfyzGHFMD+weeom09YGBBwyyaiB+BUcKzNidVTZ1Iw+U7tQ3ymXhAnqZwzEQzsgNO9kJ0ydaJzLGhf4Qxpo/DXv+6sCt76pHqsusX/ZG7NfMWIA+WpeoheeUp7YLOOvjnRTYve40tuFPxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Idu8MoGDiheqPhqpXQ5cBxu78CtPxyFHMKB4nyBFHuA=;
 b=Bk7mPTQaLpBJBVzu+vfWX9QX8qeB4ibYtfvUulEt59TRncI2wkruuyIXdpm17WLpbCUnAx2oETR2z6ErlmrgmYDjv/LyhYwhnfCmKxyi7uOvWvh5+vV9eWuRNe2NWuEjB4buQUJg1mRCnNlX5YDIeNnyc8/b978+flcTkmudEsU=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1405.namprd11.prod.outlook.com (2603:10b6:300:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 23:53:11 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 23:53:11 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Thread-Topic: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Thread-Index: AQHWOBerUwuHg20nGUicDfuX+ypR+ajQ/TJwgAADv5A=
Date: Tue, 9 Jun 2020 23:53:11 +0000
Message-ID: <MWHPR11MB1645DBCA96748D2E924275288C820@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
 <MWHPR11MB16457D9235F56F9F10BDFE358C820@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB16457D9235F56F9F10BDFE358C820@MWHPR11MB1645.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9fb07d8-c426-4a0a-2f65-08d80cd04480
x-ms-traffictypediagnostic: MWHPR11MB1405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1405AC65FFFA52C37C2D885C8C820@MWHPR11MB1405.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYkwyI4/YfykewoKpZ/HsBjE/zZkR+OrNGD2pR6MYkmDG6VWkgqFY9HKRYKxKttvkI7pHsRFpGtG+LMyOWepyUwtY6mY96wQCU7UeP9FIscRR9QNuucCjzj8T7LoXUwt0guttTlzOyED2P2MRiQdJLu4X9MeeMISRyHMGg4SQ/b6qhK7L3UH3DhKZzh8D6p3EnVLnoivoCSZsrzUWlO4haIZoAlOmBS6HJXp2v+SJxI6e+fOj1F2qgKcJwrz+LuRbfbyvvFK/KCZHDpMF/fuDKhCxqKy1Ophqz611un0JLK91R3ubkWv4vau1Vnl+Z+ihnWMvN5e2GuBYpDU2sZOIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(5660300002)(8676002)(86362001)(7696005)(8936002)(54906003)(4326008)(83380400001)(52536014)(33656002)(2906002)(71200400001)(110136005)(6506007)(186003)(76116006)(478600001)(64756008)(66476007)(66446008)(26005)(316002)(66556008)(9686003)(66946007)(55016002)(2940100002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IX6lhPQs0yQG39kjaQEG9JSXbuIA5gS05E4aANRi0XmtOF17bTIPt9SfvqpHsCVzp/m52upvkG6faLY4afKappnq1nM/CYtJl/KveOcsYbMficgBaD+Ic63q0Nysd7ODwUTHWSl2ESzHExGwRSJEltxNiJw57hFSuIY4yjDPZ8jQ+wFziImFPBjPfDJRQ4xM2WU3ek9Mcc2smYDa+19WDGLgfAT5qNbOXOO/j2qVysNqSGxcCAH9CPe/TYe/j1o+4+ktDKMFrMu5wArcKQ6JMtkCpCOcoIGTd3Ldk4eQ7uBYosMJcXJU4luLj0kmtB7b1Bp/4wwHSPkOVZ3uIhVOIgsC+yioxzXiJ0PVFkJwwMOQ3MVT3cZDZxE3KK8OTQV3p/jJMuBFLQ3Ut6nct+dalNq9RvIenWr7bWh4+zEMnP/IVop4nGk0EN0WWQL9y4iFWVL9ev92Yejq5aN2ejJ/uEIB1JMZZ+ew2xi1BgmRfNGS5D837AU7h0njeRNrBYzC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fb07d8-c426-4a0a-2f65-08d80cd04480
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 23:53:11.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZiyAoZHaZ7EsBRI7+bGiedZH7A08XxlnLTu0b4GtO1vPdy0FCqv+3bAwarwSlIOIh8mCDXj2fOqbDrgoITSSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1405
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBUaWFuLCBLZXZpbg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMjAgNzo0
NCBBTQ0KPiANCj4gPiBGcm9tOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5j
b20+DQo+ID4gU2VudDogTW9uZGF5LCBKdW5lIDEsIDIwMjAgOToyMiBQTQ0KPiA+DQo+ID4gV2hl
biBydW5uaW5nIFZNIGZvcmtzIHdpdGhvdXQgZGV2aWNlIG1vZGVscyAoUUVNVSksIGl0IG1heQ0K
PiA+IGJlIHVuZGVzaXJhYmxlIGZvciBYZW4gdG8gaW5qZWN0IGludGVycnVwdHMuIFdoZW4gY3Jl
YXRpbmcgc3VjaCBmb3JrcyBmcm9tDQo+ID4gV2luZG93cyBWTXMgd2UgaGF2ZSBvYnNlcnZlZCB0
aGUga2VybmVsIHRyeWluZyB0byBwcm9jZXNzIGludGVycnVwdHMNCj4gPiBpbW1lZGlhdGVseSBh
ZnRlciB0aGUgZm9yayBpcyBleGVjdXRlZC4gSG93ZXZlciB3aXRob3V0IFFFTVUgcnVubmluZw0K
PiBzdWNoDQo+ID4gaW50ZXJydXB0IGhhbmRsaW5nIG1heSBub3QgYmUgcG9zc2libGUgYmVjYXVz
ZSBpdCBtYXkgYXR0ZW1wdCB0byBpbnRlcmFjdA0KPiA+IHdpdGgNCj4gPiBkZXZpY2VzIHRoYXQg
YXJlIG5vdCBlbXVsYXRlZCBieSBhIGJhY2tlbmQuIEluIHRoZSBiZXN0IGNhc2Ugc2NlbmFyaW8g
c3VjaA0KPiANCj4gSSBhc2tlZCB0aGlzIHF1ZXN0aW9uIGJlZm9yZS4gdGhlIGludGVycnVwdHMg
Y291bGQgY29tZSBmcm9tIFhlbiBpdHNlbGYsIGUuZy4NCj4gZHVlIHRvIHRpbWVyIHZpcnR1YWxp
emF0aW9uLiBTbyBJIGRpZG4ndCBnZXQgd2h5IGl0J3MgZGVzaXJlZCB0byBibG9jayBhbGwNCj4g
aW50ZXJydXB0cw0KPiBqdXN0IGJlY2F1c2Ugbm8gUUVNVSBpcyBydW5uaW5nLiBBbHNvIGl0J3Mg
d2VpcmQgd2h5IFdpbmRvd3MgVk1zIGFyZQ0KPiBvYnNlcnZlZCB0byBwcm9jZXNzIGludGVycnVw
dHMgdGhhdCBhcmUgZ2VuZXJhdGVkIGJ5IFFFTVUgd2hlbiBubyBzdWNoDQo+IGJhY2tlbmQgZW11
bGF0aW9uIGV4aXN0cyBhdCBhbGwuIEl0IHNvdW5kcyBsaWtlIGEgd29ya2Fyb3VuZCBpbnN0ZWFk
IG9mIGEgcmVhbA0KPiBmaXguLi4NCg0Kb2ssIEkgcmVjaGVja2VkIHlvdXIgcmVwbHkuIExvb2tz
IGl0J3MgYWJvdXQgdGhlIGNhc2UgdGhhdCBwYXJlbnQgVk0gaGFzIFFFTVUNCmFuZCBwZW5kaW5n
IGludGVycnVwdHMgd2hpbGUgeW91IGZvcmsgaXQgaW50byBjaGlsZCBWTXMgd2l0aG91dCBRRU1V
IHNvIHRob3NlDQpwZW5kaW5nIGludGVycnVwdHMgYmVjb21lIHByb2JsZW1hdGljLg0KDQpSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IA0KPiA+
IGludGVycnVwdCBoYW5kbGluZyB3b3VsZCBvbmx5IHByZXNlbnQgYSBkZXRvdXIgaW4gdGhlIFZN
IGZvcmtzJyBleGVjdXRpb24NCj4gPiBmbG93LCBidXQgaW4gdGhlIHdvcnN0IGNhc2UgYXMgd2Ug
YWN0dWFsbHkgb2JzZXJ2ZWQgY2FuIGNvbXBsZXRlbHkgc3RhbGwgaXQuDQo+ID4gQnkgZGlzYWJs
aW5nIGludGVycnVwdCBpbmplY3Rpb24gYSBmdXp6ZXIgY2FuIGV4ZXJjaXNlIHRoZSB0YXJnZXQg
Y29kZQ0KPiB3aXRob3V0DQo+ID4gaW50ZXJmZXJlbmNlLiBGb3Igb3RoZXIgdXNlLWNhc2VzIHRo
aXMgb3B0aW9uIHByb2JhYmx5IGRvZXNuJ3QgbWFrZSBzZW5zZSwNCj4gPiB0aGF0J3Mgd2h5IHRo
aXMgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4gPg0KPiA+IEZvcmtzICYgbWVtb3J5IHNo
YXJpbmcgYXJlIG9ubHkgYXZhaWxhYmxlIG9uIEludGVsIENQVXMgc28gdGhpcyBvbmx5DQo+IGFw
cGxpZXMNCj4gPiB0byB2bXguIE5vdGUgdGhhdCB0aGlzIGlzIHBhcnQgb2YgdGhlIGV4cGVyaW1l
bnRhbCBWTSBmb3JraW5nIGZlYXR1cmUgdGhhdCdzDQo+ID4gY29tcGxldGVseSBkaXNhYmxlZCBi
eSBkZWZhdWx0IGFuZCBjYW4gb25seSBiZSBlbmFibGVkIGJ5IHVzaW5nDQo+ID4gWEVOX0NPTkZJ
R19FWFBFUlQgZHVyaW5nIGNvbXBpbGUgdGltZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+ICB4
ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMgICAgICB8IDYgKysrKysrDQo+ID4gIHhlbi9hcmNo
L3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgIHwgNiArKysrKy0NCj4gPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vZG9tYWluLmggfCAyICstDQo+ID4gIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnku
aCAgICAgIHwgMyArKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14
L2ludHIuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYw0KPiA+IGluZGV4IDAwMGUxNGFm
NDkuLjgwYmZiYjQ3ODcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvaW50
ci5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5jDQo+ID4gQEAgLTI1Niw2
ICsyNTYsMTIgQEAgdm9pZCB2bXhfaW50cl9hc3Npc3Qodm9pZCkNCj4gPiAgICAgIGlmICggdW5s
aWtlbHkodi0+YXJjaC52bV9ldmVudCkgJiYgdi0+YXJjaC52bV9ldmVudC0+c3luY19ldmVudCAp
DQo+ID4gICAgICAgICAgcmV0dXJuOw0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJ
TkcNCj4gPiArICAgIC8qIEJsb2NrIGV2ZW50IGluamVjdGlvbiBmb3IgVk0gZm9yayBpZiByZXF1
ZXN0ZWQgKi8NCj4gPiArICAgIGlmICggdW5saWtlbHkodi0+ZG9tYWluLT5hcmNoLmh2bS5tZW1f
c2hhcmluZy5ibG9ja19pbnRlcnJ1cHRzKSApDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+ICsj
ZW5kaWYNCj4gPiArDQo+ID4gICAgICAvKiBDcmFuayB0aGUgaGFuZGxlIG9uIGludGVycnVwdCBz
dGF0ZS4gKi8NCj4gPiAgICAgIHB0X3ZlY3RvciA9IHB0X3VwZGF0ZV9pcnEodik7DQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gPiBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+ID4gaW5kZXggMTk5MjJhYjVkMS4uYzQyOGZkMTZj
ZSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+ID4gQEAgLTIxMDYsNyArMjEwNiw4
IEBAIGludA0KPiA+DQo+IG1lbV9zaGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0o
eGVuX21lbV9zaGFyaW5nX29wDQo+ID4gX3QpIGFyZykNCj4gPiAgICAgICAgICByYyA9IC1FSU5W
QUw7DQo+ID4gICAgICAgICAgaWYgKCBtc28udS5mb3JrLnBhZCApDQo+ID4gICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPiA+IC0gICAgICAgIGlmICggbXNvLnUuZm9yay5mbGFncyAmIH5YRU5NRU1f
Rk9SS19XSVRIX0lPTU1VX0FMTE9XRUQgKQ0KPiA+ICsgICAgICAgIGlmICggbXNvLnUuZm9yay5m
bGFncyAmDQo+ID4gKyAgICAgICAgICAgICB+KFhFTk1FTV9GT1JLX1dJVEhfSU9NTVVfQUxMT1dF
RCB8DQo+ID4gWEVOTUVNX0ZPUktfQkxPQ0tfSU5URVJSVVBUUykgKQ0KPiA+ICAgICAgICAgICAg
ICBnb3RvIG91dDsNCj4gPg0KPiA+ICAgICAgICAgIHJjID0gcmN1X2xvY2tfbGl2ZV9yZW1vdGVf
ZG9tYWluX2J5X2lkKG1zby51LmZvcmsucGFyZW50X2RvbWFpbiwNCj4gPiBAQCAtMjEzNCw2ICsy
MTM1LDkgQEAgaW50DQo+ID4NCj4gbWVtX3NoYXJpbmdfbWVtb3AoWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh4ZW5fbWVtX3NoYXJpbmdfb3ANCj4gPiBfdCkgYXJnKQ0KPiA+ICAgICAgICAgICAgICBy
YyA9IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKF9fSFlQRVJWSVNPUl9tZW1vcnlfb3As
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImxo
IiwgWEVOTUVNX3NoYXJpbmdfb3AsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYXJnKTsNCj4gPiArICAgICAgICBlbHNlIGlmICggIXJjICYmICht
c28udS5mb3JrLmZsYWdzICYNCj4gPiBYRU5NRU1fRk9SS19CTE9DS19JTlRFUlJVUFRTKSApDQo+
ID4gKyAgICAgICAgICAgIGQtPmFyY2guaHZtLm1lbV9zaGFyaW5nLmJsb2NrX2ludGVycnVwdHMg
PSB0cnVlOw0KPiA+ICsNCj4gPiAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihwZCk7DQo+ID4g
ICAgICAgICAgYnJlYWs7DQo+ID4gICAgICB9DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLQ0KPiA+IHg4Ni9odm0vZG9t
YWluLmgNCj4gPiBpbmRleCA5NWZlMThjZGRjLi45ZDI0N2JhZjRkIDEwMDY0NA0KPiA+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmgNCj4gPiBAQCAtNjcsNyArNjcsNyBAQCBzdHJ1Y3QgaHZtX2lv
cmVxX3NlcnZlciB7DQo+ID4gICNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcNCj4gPiAgc3RydWN0
IG1lbV9zaGFyaW5nX2RvbWFpbg0KPiA+ICB7DQo+ID4gLSAgICBib29sIGVuYWJsZWQ7DQo+ID4g
KyAgICBib29sIGVuYWJsZWQsIGJsb2NrX2ludGVycnVwdHM7DQo+ID4NCj4gPiAgICAgIC8qDQo+
ID4gICAgICAgKiBXaGVuIHJlbGVhc2luZyBzaGFyZWQgZ2ZuJ3MgaW4gYSBwcmVlbXB0aWJsZSBt
YW5uZXIsIHJlY2FsbCB3aGVyZQ0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMv
bWVtb3J5LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4gPiBpbmRleCBkYmQzNTMw
NWRmLi44NTBiZDcyYzUyIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1v
cnkuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPiA+IEBAIC01MzYs
NyArNTM2LDEwIEBAIHN0cnVjdCB4ZW5fbWVtX3NoYXJpbmdfb3Agew0KPiA+ICAgICAgICAgIH0g
ZGVidWc7DQo+ID4gICAgICAgICAgc3RydWN0IG1lbV9zaGFyaW5nX29wX2ZvcmsgeyAgICAgIC8q
IE9QX0ZPUksgKi8NCj4gPiAgICAgICAgICAgICAgZG9taWRfdCBwYXJlbnRfZG9tYWluOyAgICAg
ICAgLyogSU46IHBhcmVudCdzIGRvbWFpbiBpZCAqLw0KPiA+ICsvKiBPbmx5IG1ha2VzIHNlbnNl
IGZvciBzaG9ydC1saXZlZCBmb3JrcyAqLw0KPiA+ICAjZGVmaW5lIFhFTk1FTV9GT1JLX1dJVEhf
SU9NTVVfQUxMT1dFRCAoMXUgPDwgMCkNCj4gPiArLyogT25seSBtYWtlcyBzZW5zZSBmb3Igc2hv
cnQtbGl2ZWQgZm9ya3MgKi8NCj4gPiArI2RlZmluZSBYRU5NRU1fRk9SS19CTE9DS19JTlRFUlJV
UFRTICAgKDF1IDw8IDEpDQo+ID4gICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzOyAgICAgICAg
ICAgICAgIC8qIElOOiBvcHRpb25hbCBzZXR0aW5ncyAqLw0KPiA+ICAgICAgICAgICAgICB1aW50
MzJfdCBwYWQ7ICAgICAgICAgICAgICAgICAvKiBNdXN0IGJlIHNldCB0byAwICovDQo+ID4gICAg
ICAgICAgfSBmb3JrOw0KPiA+IC0tDQo+ID4gMi4yNS4xDQoNCg==


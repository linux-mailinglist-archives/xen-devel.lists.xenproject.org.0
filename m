Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8A1E5AEB
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:35:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeE0k-0007Ml-7z; Thu, 28 May 2020 08:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSPA=7K=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jeE0j-0007Ma-4m
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:35:33 +0000
X-Inumbo-ID: 30418a7c-a0be-11ea-81bc-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30418a7c-a0be-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 08:35:30 +0000 (UTC)
IronPort-SDR: hPkfe3QjEuz2Frmg1AVTaV7TGzUNqbMdW7UQsRPqS04mxgC5348Q+SI2IHjG/uwn90vG6Le3et
 AgZz5Gh24k/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 01:35:30 -0700
IronPort-SDR: mUQCBgh8mNSZs578D1herbj5WSqxNp6iEeeZQOHzWJ/d4EXHdG6gNDW1W1uJbHc429BYOdWDEy
 k0qvxe0llDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; d="scan'208";a="310847005"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by FMSMGA003.fm.intel.com with ESMTP; 28 May 2020 01:35:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 28 May 2020 01:35:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:35:28 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 01:35:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 28 May 2020 01:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuzAcwmI9mu4A/JWDeNruJotcWkU63DRfEiFDab6xc3ucrPW96sI5s6GsdjNctw0rvl41Nw/Oqy2JwfEoveEU2FVL9h/Au4GFsBMYhWbQZfe6VQva0tN2lS4UiVqxmvXZJ298p+oRngr57cuNrmp6Hf9khoaHqQ7nB6ut1EcOMJKgrv3lMaqrHz1ftYhGO9ubUo++re/PPCXSdguxeZMTXFU9BOCs8lOkwmf9ATiglsCfLBFLGo7YhcEA9UGy9pHwjJZ6o2qUlouguSH4uykZHAdeUGvkrjp/uXYheMJQWamHehzzdZxHQ2VMJ4dwGjKEQQA45B2cBJDW42w0P9aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACSaxWbDr43wovmngDVWebOVHFVDVMM5zB0rC2bhq94=;
 b=MUnYDSZerAnAdBe4wb5t3OLlYPkh0jWr5C+xktY0UFVLCS9ExC5+OkxxEk5Vr3TS+d6dc1bYCm5Q8zCDqxcByK2ZQgF6OSalsscZ/fGhww3P4LPvhKnQQ/KkUWyV3q18rg0w07bwBi2qy/OCYCNVtQnGPst9CjLu1sAzirSKsGS364MB11pxfDvFfVXcABHu6ftdEN+0W80pB5tk56awN2ZKR7wCeR/0OZImvzJVooBLBDggv98DBKnTimeGo5sMiDfmjKTIuxRV8e4ZaOsgBYPq8tuMplOl2sJTcSwCeSNuU/ybIIzex3sdlue7xwPqVyzBItPmw61CENQiXuaarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACSaxWbDr43wovmngDVWebOVHFVDVMM5zB0rC2bhq94=;
 b=PfhePK5na11wnQyUh6hfVepvXQMLW6TiOApNK/WXVqvhCvJ1Zi1pcMKi2/4Z+1YrWguUCqesXnmTv9s46hsvEoJ0tRt3kM4Dp3C5OP3LGz5GFsdOOerCCX5v4OozQ2rndU5MUrI4mo1Z0T1BXZnYGog6biY4NNt75Cdeh2Ol/xo=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1550.namprd11.prod.outlook.com (2603:10b6:301:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 28 May
 2020 08:35:27 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41%2]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 08:35:27 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] VT-x: extend LBR Broadwell errata coverage
Thread-Topic: [PATCH v2] VT-x: extend LBR Broadwell errata coverage
Thread-Index: AQHWMqXfhCtjE8umXE6fYTlaghat+ai9MHkw
Date: Thu, 28 May 2020 08:35:27 +0000
Message-ID: <MWHPR11MB1645307CE610D333B208AD1D8C8E0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <c43b9d43-2e37-d2a8-ba32-dd06062a05e2@suse.com>
In-Reply-To: <c43b9d43-2e37-d2a8-ba32-dd06062a05e2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a2c8468-98c7-4548-9d51-08d802e21305
x-ms-traffictypediagnostic: MWHPR11MB1550:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB155078038F2BC45247A9C09B8C8E0@MWHPR11MB1550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m9Ivao+MaIEDjKgihdZXwkbLvdDtptIiITG9HIWyMlCUI3yJecCyafrx1ARVF0SOuFGK4SyirSksltkNN/oulmXXsopTnT+hKafyQhp/kVaiBEK8H57fyrpx89ID9s10ePnEKOl2OtdkrYPPxO5mxArQjzikZNhpSXHNTkcnlwjeYUTBwA9jlwB3ozXuyUaDToeE+tozS9+G4UKd4tZVA6a5t5ydel3WYHdUblLoJnCe/YYKYt9Bg05ooAiPUMsCdz6hZie15iMkIpkCoaS3xuHlIEdlZNnHC0GqAiM0ySQLPB9H0x7Du5CvTi+Ger2K2OPqZ4XcfRFHEhheaHZfSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(39860400002)(366004)(396003)(346002)(136003)(54906003)(55016002)(110136005)(5660300002)(478600001)(8676002)(8936002)(52536014)(26005)(107886003)(71200400001)(66556008)(7696005)(66476007)(2906002)(66446008)(66946007)(6506007)(316002)(76116006)(64756008)(4326008)(83380400001)(186003)(86362001)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: h7zGrhnRDvr1OyB10uEi6yzfjrxGVqwnhyiV5mid94GQdP8AF/Wm3IR0m/ERKjdjUrhVQyMaRSoXWedwneV52/TH6HHzdD6QcsuFb6grYI7hRcht51Sy6hJ+OKqqhEJBV+Q0wgnz99gachHvVfQbMRHdWn0L5Mvt2aP9A4M9Z6OGbthmBQ5iy52rzBnhjnZAwQAk8N5HaSb9oBGdnuQE5Vabsv9YdEnlIW0vTEsyK2jI9YrvJGjupEVw2vxs6iP3E1W4qHakOdoIYW8C5B8kgJZ4VeBBoUHdpxJWcf2uCEFUz8+ecKPlThaw3IdNFF3YukYY785GrOazIwCrib5IZ9XgHO9GfOTJeKyQRp3lsYKLljaZxBj54yPUg8u+/5lQosEkJuI8VPCdyhNPLnxPZEgRvETsZJnTNNkNRvsb8HfEAZ5Kt+rlxccF0i3BXiihzVkey7GtaMlRvrgvnIPCdoTonl1P1w2juFcK/JvYmI/VOgyRqZ9v0VrznxCsl6ia
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2c8468-98c7-4548-9d51-08d802e21305
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:35:27.5505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyyQrp1KiVEpLWiAJfcX3wHFUZv/QrdXnli/VyohUvT/m9wmG8rZjyL0OohBE3rwetruF+QzuP91VMDSeo0DOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1550
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWF5IDI1LCAyMDIwIDExOjA0IFBNDQo+IA0KPiBGb3IgbGJyX3RzeF9maXh1cF9jaGVjaygpIHNp
bXBseSBuYW1lIGEgZmV3IG1vcmUgc3BlY2lmaWMgZXJyYXR1bQ0KPiBudW1iZXJzLg0KPiANCj4g
Rm9yIGJkZjkzX2ZpeHVwX2NoZWNrKCksIGhvd2V2ZXIsIG1vcmUgbW9kZWxzIGFyZSBhZmZlY3Rl
ZC4gT2RkbHkgZW5vdWdoDQo+IGRlc3BpdGUgYmVpbmcgdGhlIHNhbWUgbW9kZWwgYW5kIHN0ZXBw
aW5nLCB0aGUgZXJyYXR1bSBpcyBsaXN0ZWQgZm9yDQo+IFhlb24gRTMgYnV0IG5vdCBpdHMgQ29y
ZSBjb3VudGVycGFydC4gQXBwbHkgdGhlIHdvcmthcm91bmQgdW5pZm9ybWx5LA0KPiBhbmQgYWxz
byBmb3IgWGVvbiBELCB3aGljaCBvbmx5IGhhcyB0aGUgTEJSLWZyb20gb25lIGxpc3RlZCBpbiBp
dHMgc3BlYw0KPiB1cGRhdGUuDQo+IA0KPiBTZWVpbmcgdGhpcyBicm9hZGVyIGFwcGxpY2FiaWxp
dHksIHJlbmFtZSBhbnl0aGluZyBCREY5My1yZWxhdGVkIHRvIG1vcmUNCj4gZ2VuZXJpYyBuYW1l
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0t
LQ0KPiB2MjogTmFtZSB5ZXQgYW5vdGhlciBwYWlyIG9mIGVycmF0YS4gU3BlY3VsYXRpdmVseSBj
b3ZlciBYZW9uIEQgYWxzbw0KPiAgICAgaW4gdGhlIDJuZCBjYXNlLiBJZGVudGlmaWVyIHJlbmFt
aW5nLg0KPiANCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gQEAgLTIzODAsNyArMjM4MCw3IEBAIHN0YXRpYyB2
b2lkIHBpX25vdGlmaWNhdGlvbl9pbnRlcnJ1cHQoc3QNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9p
ZCBfX2luaXQgbGJyX3RzeF9maXh1cF9jaGVjayh2b2lkKTsNCj4gLXN0YXRpYyB2b2lkIF9faW5p
dCBiZGY5M19maXh1cF9jaGVjayh2b2lkKTsNCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBsZXJfdG9f
Zml4dXBfY2hlY2sodm9pZCk7DQo+IA0KPiAgLyoNCj4gICAqIENhbGN1bGF0ZSB3aGV0aGVyIHRo
ZSBDUFUgaXMgdnVsbmVyYWJsZSB0byBJbnN0cnVjdGlvbiBGZXRjaCBwYWdlDQo+IEBAIC0yNTU0
LDcgKzI1NTQsNyBAQCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICogX19pbml0DQo+
ICAgICAgfQ0KPiANCj4gICAgICBsYnJfdHN4X2ZpeHVwX2NoZWNrKCk7DQo+IC0gICAgYmRmOTNf
Zml4dXBfY2hlY2soKTsNCj4gKyAgICBsZXJfdG9fZml4dXBfY2hlY2soKTsNCj4gDQo+ICAgICAg
cmV0dXJuICZ2bXhfZnVuY3Rpb25fdGFibGU7DQo+ICB9DQo+IEBAIC0yODMyLDExICsyODMyLDEx
IEBAIGVudW0NCj4gDQo+ICAjZGVmaW5lIExCUl9NU1JTX0lOU0VSVEVEICAgICAgKDF1IDw8IDAp
DQo+ICAjZGVmaW5lIExCUl9GSVhVUF9UU1ggICAgICAgICAgKDF1IDw8IDEpDQo+IC0jZGVmaW5l
IExCUl9GSVhVUF9CREY5MyAgICAgICAgKDF1IDw8IDIpDQo+IC0jZGVmaW5lIExCUl9GSVhVUF9N
QVNLICAgICAgICAgKExCUl9GSVhVUF9UU1ggfCBMQlJfRklYVVBfQkRGOTMpDQo+ICsjZGVmaW5l
IExCUl9GSVhVUF9MRVJfVE8gICAgICAgKDF1IDw8IDIpDQo+ICsjZGVmaW5lIExCUl9GSVhVUF9N
QVNLICAgICAgICAgKExCUl9GSVhVUF9UU1ggfCBMQlJfRklYVVBfTEVSX1RPKQ0KPiANCj4gIHN0
YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgbGJyX3RzeF9maXh1cF9uZWVkZWQ7DQo+IC1zdGF0aWMg
Ym9vbCBfX3JlYWRfbW9zdGx5IGJkZjkzX2ZpeHVwX25lZWRlZDsNCj4gK3N0YXRpYyBib29sIF9f
cmVhZF9tb3N0bHkgbGVyX3RvX2ZpeHVwX25lZWRlZDsNCj4gDQo+ICBzdGF0aWMgdm9pZCBfX2lu
aXQgbGJyX3RzeF9maXh1cF9jaGVjayh2b2lkKQ0KPiAgew0KPiBAQCAtMjg0NCw3ICsyODQ0LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGxicl90c3hfZml4dXBfY2hlY2sodg0KPiAgICAgIHVpbnQz
Ml90IGxicl9mb3JtYXQ7DQo+IA0KPiAgICAgIC8qDQo+IC0gICAgICogSFNNMTgyLCBIU0QxNzIs
IEhTRTExNywgQkRNMTI3LCBCREQxMTcsIEJERjg1LCBCREUxMDU6DQo+ICsgICAgICogSGFzd2Vs
bCBlcnJhdHVtIEhTTTE4MiBldCBhbCwgQnJvYWR3ZWxsIGVycmF0dW0gQkRNMTI3IGV0IGFsOg0K
PiAgICAgICAqDQo+ICAgICAgICogT24gcHJvY2Vzc29ycyB0aGF0IGRvIG5vdCBzdXBwb3J0IElu
dGVsIFRyYW5zYWN0aW9uYWwgU3luY2hyb25pemF0aW9uDQo+ICAgICAgICogRXh0ZW5zaW9ucyAo
SW50ZWwgVFNYKSAoQ1BVSUQuMDdILkVCWCBiaXRzIDQgYW5kIDExIGFyZSBib3RoIHplcm8pLA0K
PiBAQCAtMjg2OCw4ICsyODY4LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBsYnJfdHN4X2ZpeHVw
X2NoZWNrKHYNCj4gICAgICBjYXNlIDB4NDU6IC8qIEhTTTE4MiAtIDR0aCBnZW4gQ29yZSAqLw0K
PiAgICAgIGNhc2UgMHg0NjogLyogSFNNMTgyLCBIU0QxNzIgLSA0dGggZ2VuIENvcmUgKEdUMykg
Ki8NCj4gICAgICBjYXNlIDB4M2Q6IC8qIEJETTEyNyAtIDV0aCBnZW4gQ29yZSAqLw0KPiAtICAg
IGNhc2UgMHg0NzogLyogQkREMTE3IC0gNXRoIGdlbiBDb3JlIChHVDMpICovDQo+IC0gICAgY2Fz
ZSAweDRmOiAvKiBCREY4NSAgLSBYZW9uIEU1LTI2MDAgdjQgKi8NCj4gKyAgICBjYXNlIDB4NDc6
IC8qIEJERDExNyAtIDV0aCBnZW4gQ29yZSAoR1QzKQ0KPiArICAgICAgICAgICAgICAgICAgQkRX
MTE3IC0gWGVvbiBFMy0xMjAwIHY0ICovDQo+ICsgICAgY2FzZSAweDRmOiAvKiBCREY4NSAgLSBY
ZW9uIEU1LTI2MDAgdjQNCj4gKyAgICAgICAgICAgICAgICAgIEJESDc1ICAtIENvcmUtaTcgZm9y
IExHQTIwMTEtdjMgU29ja2V0DQo+ICsgICAgICAgICAgICAgICAgICBCRFg4OCAgLSBYZW9uIEU3
LXg4MDAgdjQgKi8NCj4gICAgICBjYXNlIDB4NTY6IC8qIEJERTEwNSAtIFhlb24gRC0xNTAwICov
DQo+ICAgICAgICAgIGJyZWFrOw0KPiAgICAgIGRlZmF1bHQ6DQo+IEBAIC0yODkwLDE4ICsyODkz
LDMxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBsYnJfdHN4X2ZpeHVwX2NoZWNrKHYNCj4gICAgICAg
ICAgbGJyX3RzeF9maXh1cF9uZWVkZWQgPSB0cnVlOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2b2lk
IF9faW5pdCBiZGY5M19maXh1cF9jaGVjayh2b2lkKQ0KPiArc3RhdGljIHZvaWQgX19pbml0IGxl
cl90b19maXh1cF9jaGVjayh2b2lkKQ0KPiAgew0KPiAgICAgIC8qDQo+IC0gICAgICogQnJvYWR3
ZWxsIGVycmF0dW0gQkRGOTM6DQo+ICsgICAgICogQnJvYWR3ZWxsIGVycmF0dW0gQkRGOTMgZXQg
YWw6DQo+ICAgICAgICoNCj4gICAgICAgKiBSZWFkcyBmcm9tIE1TUl9MRVJfVE9fTElQIChNU1Ig
MURFSCkgbWF5IHJldHVybiB2YWx1ZXMgZm9yDQo+IGJpdHNbNjM6NjFdDQo+ICAgICAgICogdGhh
dCBhcmUgbm90IGVxdWFsIHRvIGJpdFs0N10uICBBdHRlbXB0aW5nIHRvIGNvbnRleHQgc3dpdGNo
IHRoaXMgdmFsdWUNCj4gICAgICAgKiBtYXkgY2F1c2UgYSAjR1AuICBTb2Z0d2FyZSBzaG91bGQg
c2lnbiBleHRlbmQgdGhlIE1TUi4NCj4gICAgICAgKi8NCj4gLSAgICBpZiAoIGJvb3RfY3B1X2Rh
dGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0lOVEVMICYmDQo+IC0gICAgICAgICBib290X2Nw
dV9kYXRhLng4NiA9PSA2ICYmIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsID09IDB4NGYgKQ0KPiAt
ICAgICAgICBiZGY5M19maXh1cF9uZWVkZWQgPSB0cnVlOw0KPiArICAgIGlmICggYm9vdF9jcHVf
ZGF0YS54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgfHwNCj4gKyAgICAgICAgIGJvb3Rf
Y3B1X2RhdGEueDg2ICE9IDYgKQ0KPiArICAgICAgICByZXR1cm47DQo+ICsNCj4gKyAgICBzd2l0
Y2ggKCBib290X2NwdV9kYXRhLng4Nl9tb2RlbCApDQo+ICsgICAgew0KPiArICAgIGNhc2UgMHgz
ZDogLyogQkRNMTMxIC0gNXRoIGdlbiBDb3JlICovDQo+ICsgICAgY2FzZSAweDQ3OiAvKiBCREQ/
Pz8gLSA1dGggZ2VuIENvcmUgKEgtUHJvY2Vzc29yIGxpbmUpDQo+ICsgICAgICAgICAgICAgICAg
ICBCRFcxMjAgLSBYZW9uIEUzLTEyMDAgdjQgKi8NCj4gKyAgICBjYXNlIDB4NGY6IC8qIEJERjkz
ICAtIFhlb24gRTUtMjYwMCB2NA0KPiArICAgICAgICAgICAgICAgICAgQkRIODAgIC0gQ29yZS1p
NyBmb3IgTEdBMjAxMS12MyBTb2NrZXQNCj4gKyAgICAgICAgICAgICAgICAgIEJEWDkzICAtIFhl
b24gRTcteDgwMCB2NCAqLw0KPiArICAgIGNhc2UgMHg1NjogLyogQkRFPz8/IC0gWGVvbiBELTE1
MDAgKi8NCj4gKyAgICAgICAgbGVyX3RvX2ZpeHVwX25lZWRlZCA9IHRydWU7DQo+ICsgICAgICAg
IGJyZWFrOw0KPiArICAgIH0NCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50IGlzX2xhc3RfYnJhbmNo
X21zcih1MzIgZWN4KQ0KPiBAQCAtMzI3Niw4ICszMjkyLDggQEAgc3RhdGljIGludCB2bXhfbXNy
X3dyaXRlX2ludGVyY2VwdCh1bnNpZw0KPiAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lmxi
cl9mbGFncyB8PSBMQlJfTVNSU19JTlNFUlRFRDsNCj4gICAgICAgICAgICAgIGlmICggbGJyX3Rz
eF9maXh1cF9uZWVkZWQgKQ0KPiAgICAgICAgICAgICAgICAgIHYtPmFyY2guaHZtLnZteC5sYnJf
ZmxhZ3MgfD0gTEJSX0ZJWFVQX1RTWDsNCj4gLSAgICAgICAgICAgIGlmICggYmRmOTNfZml4dXBf
bmVlZGVkICkNCj4gLSAgICAgICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubGJyX2ZsYWdzIHw9
IExCUl9GSVhVUF9CREY5MzsNCj4gKyAgICAgICAgICAgIGlmICggbGVyX3RvX2ZpeHVwX25lZWRl
ZCApDQo+ICsgICAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lmxicl9mbGFncyB8PSBMQlJf
RklYVVBfTEVSX1RPOw0KPiAgICAgICAgICB9DQo+IA0KPiAgICAgICAgICBfX3Ztd3JpdGUoR1VF
U1RfSUEzMl9ERUJVR0NUTCwgbXNyX2NvbnRlbnQpOw0KPiBAQCAtNDMzOCw3ICs0MzU0LDcgQEAg
c3RhdGljIHZvaWQgc2lnbl9leHRlbmRfbXNyKHN0cnVjdCB2Y3B1DQo+ICAgICAgICAgIGVudHJ5
LT5kYXRhID0gY2Fub25pY2FsaXNlX2FkZHIoZW50cnktPmRhdGEpOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyB2b2lkIGJkZjkzX2ZpeHVwKHZvaWQpDQo+ICtzdGF0aWMgdm9pZCBsZXJfdG9fZml4dXAo
dm9pZCkNCj4gIHsNCj4gICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7DQo+IA0KPiBA
QCAtNDM1MSw4ICs0MzY3LDggQEAgc3RhdGljIHZvaWQgbGJyX2ZpeHVwKHZvaWQpDQo+IA0KPiAg
ICAgIGlmICggY3Vyci0+YXJjaC5odm0udm14Lmxicl9mbGFncyAmIExCUl9GSVhVUF9UU1ggKQ0K
PiAgICAgICAgICBsYnJfdHN4X2ZpeHVwKCk7DQo+IC0gICAgaWYgKCBjdXJyLT5hcmNoLmh2bS52
bXgubGJyX2ZsYWdzICYgTEJSX0ZJWFVQX0JERjkzICkNCj4gLSAgICAgICAgYmRmOTNfZml4dXAo
KTsNCj4gKyAgICBpZiAoIGN1cnItPmFyY2guaHZtLnZteC5sYnJfZmxhZ3MgJiBMQlJfRklYVVBf
TEVSX1RPICkNCj4gKyAgICAgICAgbGVyX3RvX2ZpeHVwKCk7DQo+ICB9DQo+IA0KPiAgLyogUmV0
dXJucyBmYWxzZSBpZiB0aGUgdm1lbnRyeSBoYXMgdG8gYmUgcmVzdGFydGVkICovDQo=


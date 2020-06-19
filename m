Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C921FFFA5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 03:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm5oF-0003XO-Ig; Fri, 19 Jun 2020 01:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYJs=AA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jm5oE-0003XJ-Ib
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 01:27:10 +0000
X-Inumbo-ID: fd7639e8-b1cb-11ea-bb1b-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd7639e8-b1cb-11ea-bb1b-12813bfff9fa;
 Fri, 19 Jun 2020 01:27:08 +0000 (UTC)
IronPort-SDR: OZ62ioNrKfck6emZnBlQf+qYdCiA933GPsgQjmN4Wk+XCZn0rUdcN4xuUZMb03IFuc3x/QuINr
 zWZbg6KGv8Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="140329186"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="140329186"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 18:27:07 -0700
IronPort-SDR: UxsThT7uRVvLTBfdffEPEWM16aZCaMp5VIYe5D0d0zW0t5t/lS5bn0dJYRPhYIue4uw6kQRc4T
 u7UyIfxsq3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; d="scan'208";a="352584598"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga001.jf.intel.com with ESMTP; 18 Jun 2020 18:27:07 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 18 Jun 2020 18:27:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 18 Jun 2020 18:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQT9ML8TWEJxKs96urnUIkr/Vv1860WAhNOeAOmaY1lgCUANwWUvqeB/Dotw1R3IF7wLA5PECQ2KVDCLDF6XgpY5FTD6nHx0WGE/WwX/YWnmUlbMdbSpZqQyEsYehWjfTQR0UoozxWs0ZR8fqAADhHteNO0rjToXSkm7q3AwbM18Z9S6r8j4bk1N9BXAzFkYj41B61v36NxAgfNMujovrCkXKTHezO4ONAZQ3OY0p/5ueOTb9rADLAO3aoJj73t6IaPFPxlMGPwoYBhQI6sbC4g+x461mA/0RWxUPKmYHazMSmhipz9oz81sgt1XfYj6Ne4p22pFjKIqRSJQCwRO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQkI0yamfSNutIMYlfjEegApKS7mS2dEbOKvygxGeok=;
 b=K6Rxo/h4uBquS2zf9gcEqrCaULzVb6wriviFEkuQ50+bWY31SVugGuolG9HECFtmi7yvctuG47MMA+GRpWvMTQV+hnrRof5+TRa1co5yMEtj0QelNdzsAeMOwhMiKdRAbQm4EYD6Wh/08E3U9NMXgyTbN5DBBWRhAzeJdPAwgkOWyYfCy7dqrVXatSrD+Uj/dcPkhogrkxOso4P9lpvUMfatQ3EauyyMzYotKe6JbMEMsmBwaB1T/zEM/OgZ+rYnIy+yPNZ8EdL4ynFuWet58CpMGrICtE2L3nkwhD6w432CsNG7DBWeqWDfoJM8rSqOECDQzmZxkY8rNWozcK+xSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQkI0yamfSNutIMYlfjEegApKS7mS2dEbOKvygxGeok=;
 b=zCr/iMULXKBDm6VUMQ9aOFDrn8rY/4eRGfB2UTLGqQiDmyQX9j4ky7pxbN3A2SpEjpDSGLW8E0xP9dG9cByaP3ZxFTrKDumnicpyVYwtzIP2utf5aaINlrBPYbs47JCF6FO/Pf7evqHXDCPyyyxXENiCziOkcTViEEZfpeEZh44=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1391.namprd11.prod.outlook.com (2603:10b6:300:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 01:27:05 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 01:27:05 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
Thread-Topic: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
Thread-Index: AQHWRTsZ99HPJcDaf0KsaKSIfuDNiajfJt7Q
Date: Fri, 19 Jun 2020 01:27:05 +0000
Message-ID: <MWHPR11MB164560AA63A391E26C31029A8C980@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
In-Reply-To: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1adbc222-4249-4656-d623-08d813efe052
x-ms-traffictypediagnostic: MWHPR11MB1391:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB13910A00CBED4DDEBD5A23018C980@MWHPR11MB1391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dlVqeHZ9XoOz+brk7Kufp+J1aXvSvA1YZc1/iFq4rq4P0tAcICJKK4ixaFiWAQTxQhVBO2llevdiJt6sHG1or3gHs5dTpkTE/4mnuB1F4KuyuTHZ/8ubXO6Y4k3c0nCgoZj2osia3tjfSglOAjexALj4X9zCjl0ZAMNqTSS7y7D4eAzs7KQ8d/uhbF1QaBVJzJeCYIZTp1mbTFGOAoNWVlr2v8ik46NZ7PcqqGpEbHX04qAuKZnjzCGic3ZxSEkyPvig6A0iHCpjQK3jcnoPqFpLClz7IJ7xHCuAj+O2OZ1mIj5wVO6ViqmC9FebwuoVXG14B/CoWCA9Xqvapipc/NU4bo1FmHzQMBABAVVAdcCLIYQ7uA2eEbZjABFjb/J1Vog7rVN/ToseGWzg4XZ7zA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(26005)(52536014)(66946007)(71200400001)(64756008)(66556008)(76116006)(66476007)(66446008)(5660300002)(55016002)(9686003)(186003)(4326008)(86362001)(316002)(966005)(8676002)(83380400001)(2906002)(33656002)(110136005)(8936002)(478600001)(54906003)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bsCh0OPydHwGEi0FnST3R0qi/vDLo4h+hkz82FA3IQvl+MepHoH+HevqbWOCsZ7s4L8DKdAXE1tEaRbH3K3n5nOqyErDIOeEGIZqG6qQvKAODbrHPBLJy2rVf/1DTjF3+nriwBTM6DrxA39jm3XLRjJYNaA/q6mo5aGumZfTzE6d3ICYHk+zxcmRCTmf2TGClghErbkxgrUqN6d5P1SmqsC31neBT0T+ZmWnsw9Y3RxNc8RIjWoS7ktBqY/LKX1iyZ7orUHSqInJ7GtcptGMShGTlr/moQnDKqQV8sxLtdg5v0WoxQTbe8ITSoewmB414ICv2d6A+HtoBimAUQiiZB+rU9ZGTXtEBryrLwMV5BpJse/pTXcrbUPcriH8ewmhEaCJe4ZMeZKmwPKfAMNoFGi2v5PP70iiOdHqusc89USvZjEjXIyFvAygKZ42+hcrJJoPvQF57GxC34HSzwXbpY8be4bGHrof7pYtFP6HV5rYpuoNlaVcXug8iZh49nqP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adbc222-4249-4656-d623-08d813efe052
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 01:27:05.3462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRfzIMin9XHSXD7P4mx7E4s8pd060nARDakS6uck2bVtFzReo50Wq4i0oIWIju6EToZ2DmMaGUg7DL6pGGMjfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1391
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBKdW5lIDE4LCAyMDIwIDI6MzggUE0NCj4gDQo+ICogR3Vlc3RzIG91dHNpZGUgb2YgbG9uZyBt
b2RlIGNhbid0IGhhdmUgUENJRCBlbmFibGVkLiBEcm9wIHRoZQ0KPiAgIHJlc3BlY3RpdmUgY2hl
Y2sgdG8gbWFrZSBtb3JlIG9idmlvdXMgdGhhdCB0aGVyZSdzIG5vIHNlY3VyaXR5IGlzc3VlDQo+
ICAgKGZyb20gcG90ZW50aWFsbHkgYWNjZXNzaW5nIHBhc3QgdGhlIG1hcHBlZCBwYWdlJ3MgYm91
bmRhcnkpLg0KPiANCj4gKiBPbmx5IHRoZSBsb3cgMzIgYml0cyBvZiBDUjMgYXJlIHJlbGV2YW50
IG91dHNpZGUgb2YgbG9uZyBtb2RlLCBldmVuDQo+ICAgaWYgdGhleSByZW1haW5lZCB1bmNoYW5n
ZWQgYWZ0ZXIgbGVhdmluZyB0aGF0IG1vZGUuDQo+IA0KPiAqIERyb3AgdGhlIHVubmVjZXNzYXJ5
IGFuZCBiYWRseSB0eXBlZCBsb2NhbCB2YXJpYWJsZSBwLg0KPiANCj4gKiBEb24ndCBvcGVuLWNv
ZGUgaHZtX2xvbmdfbW9kZV9hY3RpdmUoKSAoYW5kIGV4dGVuZCB0aGlzIHRvIHRoZSByZWxhdGVk
DQo+ICAgbmVzdGVkIFZULXggY29kZSkuDQo+IA0KPiAqIENvbnN0aWZ5IGd1ZXN0X3BkcHRlcyB0
byBjbGFyaWZ5IHRoYXQgd2UncmUgb25seSByZWFkaW5nIGZyb20gdGhlDQo+ICAgcGFnZS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBU
aGlzIGlzIGludGVudGlvbmFsbHkgbm90IGFkZHJlc3NpbmcgYW55IG9mIHRoZSBvdGhlciBzaG9y
dGNvbWluZ3Mgb2YNCj4gdGhlIGZ1bmN0aW9uLCBhcyB3YXMgZG9uZSBieSB0aGUgcHJldmlvdXNs
eSBwb3N0ZWQNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE4LQ0KPiAwNy9tc2cwMTc5MC5odG1sLg0KPiBUaGlzIHdpbGwgbmVlZCB0byBi
ZSB0aGUgc3ViamVjdCBvZiBhIGZ1cnRoZXIgY2hhbmdlLg0KPiANCj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4g
QEAgLTEzMTIsMTcgKzEzMTIsMTYgQEAgc3RhdGljIHZvaWQgdm14X3NldF9pbnRlcnJ1cHRfc2hh
ZG93KHN0cg0KPiANCj4gIHN0YXRpYyB2b2lkIHZteF9sb2FkX3BkcHRycyhzdHJ1Y3QgdmNwdSAq
dikNCj4gIHsNCj4gLSAgICB1bnNpZ25lZCBsb25nIGNyMyA9IHYtPmFyY2guaHZtLmd1ZXN0X2Ny
WzNdOw0KPiAtICAgIHVpbnQ2NF90ICpndWVzdF9wZHB0ZXM7DQo+ICsgICAgdWludDMyX3QgY3Iz
ID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM107DQo+ICsgICAgY29uc3QgdWludDY0X3QgKmd1ZXN0
X3BkcHRlczsNCj4gICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPiAgICAgIHAybV90eXBl
X3QgcDJtdDsNCj4gLSAgICBjaGFyICpwOw0KPiANCj4gICAgICAvKiBFUFQgbmVlZHMgdG8gbG9h
ZCBQRFBUUlMgaW50byBWTUNTIGZvciBQQUUuICovDQo+IC0gICAgaWYgKCAhaHZtX3BhZV9lbmFi
bGVkKHYpIHx8ICh2LT5hcmNoLmh2bS5ndWVzdF9lZmVyICYgRUZFUl9MTUEpICkNCj4gKyAgICBp
ZiAoICFodm1fcGFlX2VuYWJsZWQodikgfHwgaHZtX2xvbmdfbW9kZV9hY3RpdmUodikgKQ0KPiAg
ICAgICAgICByZXR1cm47DQo+IA0KPiAtICAgIGlmICggKGNyMyAmIDB4MWZVTCkgJiYgIWh2bV9w
Y2lkX2VuYWJsZWQodikgKQ0KPiArICAgIGlmICggY3IzICYgMHgxZiApDQo+ICAgICAgICAgIGdv
dG8gY3Jhc2g7DQo+IA0KPiAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbih2LT5kb21haW4s
IGNyMyA+PiBQQUdFX1NISUZULCAmcDJtdCwNCj4gUDJNX1VOU0hBUkUpOw0KPiBAQCAtMTMzMiwx
NCArMTMzMSwxMiBAQCBzdGF0aWMgdm9pZCB2bXhfbG9hZF9wZHB0cnMoc3RydWN0IHZjcHUNCj4g
ICAgICAgICAgICogcXVldWUsIGJ1dCB0aGlzIGlzIHRoZSB3cm9uZyBwbGFjZS4gV2UncmUgaG9s
ZGluZyBhdCBsZWFzdA0KPiAgICAgICAgICAgKiB0aGUgcGFnaW5nIGxvY2sgKi8NCj4gICAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX0VSUiwNCj4gLSAgICAgICAgICAgICAgICAgIkJhZCBjcjMgb24g
bG9hZCBwZHB0cnMgZ2ZuICVseCB0eXBlICVkXG4iLA0KPiArICAgICAgICAgICAgICAgICAiQmFk
IGNyMyBvbiBsb2FkIHBkcHRycyBnZm4gJSJQUkl4MzIiIHR5cGUgJWRcbiIsDQo+ICAgICAgICAg
ICAgICAgICAgIGNyMyA+PiBQQUdFX1NISUZULCAoaW50KSBwMm10KTsNCj4gICAgICAgICAgZ290
byBjcmFzaDsNCj4gICAgICB9DQo+IA0KPiAtICAgIHAgPSBfX21hcF9kb21haW5fcGFnZShwYWdl
KTsNCj4gLQ0KPiAtICAgIGd1ZXN0X3BkcHRlcyA9ICh1aW50NjRfdCAqKShwICsgKGNyMyAmIH5Q
QUdFX01BU0spKTsNCj4gKyAgICBndWVzdF9wZHB0ZXMgPSBfX21hcF9kb21haW5fcGFnZShwYWdl
KSArIChjcjMgJiB+UEFHRV9NQVNLKTsNCj4gDQo+ICAgICAgLyoNCj4gICAgICAgKiBXZSBkbyBu
b3QgY2hlY2sgdGhlIFBEUFRScyBmb3IgdmFsaWRpdHkuIFRoZSBDUFUgd2lsbCBkbyB0aGlzIGR1
cmluZw0KPiBAQCAtMTM1Niw3ICsxMzUzLDcgQEAgc3RhdGljIHZvaWQgdm14X2xvYWRfcGRwdHJz
KHN0cnVjdCB2Y3B1DQo+IA0KPiAgICAgIHZteF92bWNzX2V4aXQodik7DQo+IA0KPiAtICAgIHVu
bWFwX2RvbWFpbl9wYWdlKHApOw0KPiArICAgIHVubWFwX2RvbWFpbl9wYWdlKGd1ZXN0X3BkcHRl
cyk7DQo+ICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+ICAgICAgcmV0dXJuOw0KPiANCj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3Z2bXguYw0KPiBAQCAtMTIzNCw3ICsxMjM0LDcgQEAgc3RhdGljIHZvaWQgdmlydHVhbF92bWVu
dHJ5KHN0cnVjdCBjcHVfdQ0KPiAgICAgICAgICBwYWdpbmdfdXBkYXRlX3BhZ2luZ19tb2Rlcyh2
KTsNCj4gDQo+ICAgICAgaWYgKCBudm14X2VwdF9lbmFibGVkKHYpICYmIGh2bV9wYWVfZW5hYmxl
ZCh2KSAmJg0KPiAtICAgICAgICAgISh2LT5hcmNoLmh2bS5ndWVzdF9lZmVyICYgRUZFUl9MTUEp
ICkNCj4gKyAgICAgICAgICFodm1fbG9uZ19tb2RlX2FjdGl2ZSh2KSApDQo+ICAgICAgICAgIHZ2
bWNzX3RvX3NoYWRvd19idWxrKHYsIEFSUkFZX1NJWkUoZ3BkcHRlX2ZpZWxkcyksIGdwZHB0ZV9m
aWVsZHMpOw0KPiANCj4gICAgICByZWdzLT5yaXAgPSBnZXRfdnZtY3ModiwgR1VFU1RfUklQKTsN
Cj4gQEAgLTE0MzcsNyArMTQzNyw3IEBAIHN0YXRpYyB2b2lkIHZpcnR1YWxfdm1leGl0KHN0cnVj
dCBjcHVfdXMNCj4gICAgICBzeW5jX2V4Y2VwdGlvbl9zdGF0ZSh2KTsNCj4gDQo+ICAgICAgaWYg
KCBudm14X2VwdF9lbmFibGVkKHYpICYmIGh2bV9wYWVfZW5hYmxlZCh2KSAmJg0KPiAtICAgICAg
ICAgISh2LT5hcmNoLmh2bS5ndWVzdF9lZmVyICYgRUZFUl9MTUEpICkNCj4gKyAgICAgICAgICFo
dm1fbG9uZ19tb2RlX2FjdGl2ZSh2KSApDQo+ICAgICAgICAgIHNoYWRvd190b192dm1jc19idWxr
KHYsIEFSUkFZX1NJWkUoZ3BkcHRlX2ZpZWxkcyksIGdwZHB0ZV9maWVsZHMpOw0KPiANCj4gICAg
ICAvKiBUaGlzIHdpbGwgY2xlYXIgY3VycmVudCBwQ1BVIGJpdCBpbiBwMm0tPmRpcnR5X2NwdW1h
c2sgKi8NCg==


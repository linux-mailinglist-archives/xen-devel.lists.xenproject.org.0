Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12041E04A2
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:17:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd2es-0000qd-9G; Mon, 25 May 2020 02:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HJX=7H=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jd2er-0000qY-0J
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:16:05 +0000
X-Inumbo-ID: ae8e8a58-9e2d-11ea-ae71-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae8e8a58-9e2d-11ea-ae71-12813bfff9fa;
 Mon, 25 May 2020 02:16:03 +0000 (UTC)
IronPort-SDR: PzJLQh5JAQ0f2ZMICeFKYd4tW21tuW8yAjhWpOa8ge+30XuPo7+sikBcWqyGwIn52Y8Hj0Y7sl
 0yq0xyQ9dv0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2020 19:16:02 -0700
IronPort-SDR: 3iRDry9kWQHFIJQ+1+wxKBRaHYULvy/bSsV1KHhCZiwsxK2QpWBk06JCiMVT1mDtInNyhmQeyU
 qrvCeQ+FSdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,431,1583222400"; d="scan'208";a="254793388"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga007.fm.intel.com with ESMTP; 24 May 2020 19:16:01 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 May 2020 19:16:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 May 2020 19:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT+xX5BJsYcSZGgogAeoPyN24Y8y/PMly0xsMV5Mrs6ccdWx1kc1ccpIEBohoNSZdcqmshoU/TCpGa++iJYwBjslpH6n2mt5fr13taxMg4d7ZU7FHNTlGpilkek82OnkIgUV6XISsmIR81QgKFQNrTEjx34Cvz/GW0PHVZpuEtnpJ0vHnTWHWflzeMavKQ4xaXqyO9RZ1AjZM5EQtonGPKKd8bdkch5FtJT3s/Q3A30pTj8IDLiSfaH7yvgb9i/laX/jfD2sCwVKJbfPb+fTiPkdO05Jr2O1O4u0QBdsSrOPJelRzlJlmio9fRsRQrc8yNG6V8AOF3DKiDwZqtvXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv4DsR2Os+Y+RPx06qPQuuoviqK7msY4b3UoAh36O4U=;
 b=g+qxA5N6Iu+pppSvpxsEeMoFJVdMcySHRLKFC7fmHJadXJ53KUMDdrrm4ISasOz62a/Gek4L7NjGs6aUasdA2A2XbhmoGOU9s/nZBK42OZAIYOe6WH39pwki6XzcrQp+7p+ZHRAprjVtriRVg2gR6FGVyGmTsuHZrZ5FA2wi6najCfLLoG/bl0SC0TFE7gGGE0SUXS5QFDVBwjnB5EyureEYxMYKmOd8qUxzwHF17MRJAY0mPJb5Pc316T/j8RMTe4+WUXlfE88T2xH3OMh7mP9gS84I3bfYVWo7YVQwiLFaYlzTPFXHwlEHGrDD8w1ZdMz2JhFR2YHroyPQZtqoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv4DsR2Os+Y+RPx06qPQuuoviqK7msY4b3UoAh36O4U=;
 b=Rzk9U8cP2XLhy8zEO97NtpgKnJ3NC+H8D4/YLyxB4aeXM50Vrmr/qMtFwcmye/EoHlncewfUsLXVgzfeIv3D+uUxFt+e3jG6IY3Q00SWazONCcjzq79daaEbEWPrTPwUEK945a08x1iTuoE8nd+WBvh79GD9zfBPbuSbfz6ahDA=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1792.namprd11.prod.outlook.com (2603:10b6:300:10b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 02:15:59 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::b441:f6bd:703b:ba41%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 02:15:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, buy computer <buycomputer40@gmail.com>
Subject: RE: iommu=no-igfx
Thread-Topic: iommu=no-igfx
Thread-Index: AQHWKBPp26X0x5YGAUu393CB+jzHkKiw3nQAgAdCTsA=
Date: Mon, 25 May 2020 02:15:59 +0000
Message-ID: <MWHPR11MB1645DC1C5782DDA28C9BB1CB8CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <CANSXg2FGtiDT05sQUpSAshAsdP4wSjPgQbfw_+aKJuAzSwvJuQ@mail.gmail.com>
 <da7e41b5-88a1-13ab-d52b-0652c16608af@suse.com>
In-Reply-To: <da7e41b5-88a1-13ab-d52b-0652c16608af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b498a320-528f-4774-ce17-08d800519114
x-ms-traffictypediagnostic: MWHPR11MB1792:
x-microsoft-antispam-prvs: <MWHPR11MB1792D603F0B66027C4681E198CB30@MWHPR11MB1792.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yYLd2AAJZjDopHLJwKJaUdDPT4wxQzSdMqO7ilBl1WV0BndpE9l/GhpJhBQVw2n/RAIvWwFaVtX3K6e0XwMaxk1XV81XIFx8ugcO6o4oMWv/c8JVdnppsOMmI5pevGSyTEk3nSFMYpu0M1+8OyjjuFAAIT5VMfk1Jfn7dvIMRFsP+xNVR9zPUnemO9wq2Lv5SqetcFmPAkhqGaBUV+F9R0G5QEa5riEaQawvIE4mFq7McJaBod/Xo3RZ+f7jLXIxJmfdxHM67azUlWPBQs1bcwE3Q5XThDgeCmYKhoFhs4y3qKLO4YX/Gqpy54XlBKgbkjr976cU2PQjZVbwgXi9F5pcmwC9hr6CN28Kn9NkGe7fQy3AFC9JZxcKlKyyIuJCWEKkIa5vL2zuhLaJm2qIvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(52536014)(110136005)(55016002)(71200400001)(478600001)(9686003)(186003)(8676002)(5660300002)(316002)(8936002)(3480700007)(2906002)(26005)(86362001)(53546011)(4326008)(7696005)(66946007)(33656002)(66476007)(66556008)(64756008)(76116006)(6506007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YFw0uibh4Dpm1BA7mGNithu/ihv+/+8AMBhUuR7J36yUpGOROq1AiJVPfJPK1xfo6C8+mVc8rGVBUs7A6T2L8F3sYvLZCiBj2Dc0C99z02QJ9Aun5acIlLvtOT+r+XVGobD8jD7Iy65GtVowbLkea/n1Sprg42M1Andx3IPVtE40snGOx22YCNIoNcj5jUdfcdvVh8h7/mXduPtceEJeHWwGhbUbNn272lJsRDqhIjfgTTZiyDMd/apcncAv0zxepzkiCsk6Qih8us7lFcunNKqPfotcvktYX9d9YbEuM6atBdZY4kq0sS+WMth854U+zg/+bsstu3Iehfob8/nIgnyWolva5ebi9fiwlHoSsP7UldfTdYy7A69pdnMGklpQEFdi4YlXGiSrjBm/TfAKLtpJb1+B5vvSH+V6poDYz+WzTAwWu5XSjFXMT6rOhTQVWyFcaZNOMAIILpDKEfhOKYVlQbGXdc+TmAo8z5WnGkE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b498a320-528f-4774-ce17-08d800519114
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:15:59.7566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUgdS3UALeEI3bebw921luyIb7efvGaQU7/3y34BxOqgvxn3cUMgkUbek7aVXu8joK5Qgd33wEtUDHjjmEb4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1792
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWF5IDIwLCAyMDIwIDc6MTEgUE0NCj4gDQo+IE9uIDExLjA1LjIwMjAgMTk6NDMsIGJ1eSBj
b21wdXRlciB3cm90ZToNCj4gPiBJJ3ZlIGJlZW4gd29ya2luZyBvbiBhIFdpbmRvd3MgMTAgSFZN
IG9uIGEgRGViaWFuIDEwIGRvbTAuIFdoZW4gSQ0KPiB3YXMgZmlyc3QNCj4gPiB0cnlpbmcgdG8g
bWFrZSB0aGUgVk0sIEkgd2FzIGdldHRpbmcgSU9NTVUgZXJyb3JzLiBJIGhhZCBhIGhhcmQgdGlt
ZQ0KPiA+IGZpZ3VyaW5nIG91dCB3aGF0IHRvIGRvIGFib3V0IHRoaXMsIGFuZCBmaW5hbGx5IGRp
c2NvdmVyZWQgdGhhdCBwdXR0aW5nDQo+ID4gaW9tbXU9bm8taWdmeCBpbiB0aGUgZ3J1YiBzdG9w
cGVkIHRoZSBlcnJvcnMuDQo+ID4NCj4gPiBVbmZvcnR1bmF0ZWx5LCB3aXRob3V0IHRoZSBncmFw
aGljcyBzdXBwb3J0IHRoZSBWTSBpcyB1bmRlcnN0YW5kYWJseQ0KPiBzbG93LA0KPiA+IGFuZCBj
YW4gY3Jhc2guIEkgd2FzIGFsc28gb25seSBub3cgcG9pbnRlZCB0byB0aGUgcGFnZQ0KPiA+IDxo
dHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MveGVuLWNvbW1hbmQtDQo+
IGxpbmUuaHRtbCNpb21tdT4NCj4gPiB3aGljaCBzYXlzIHRvIHJlcG9ydCBhbnkgZXJyb3JzIHRo
YXQgZ2V0IGZpeGVkIGJ5IHVzaW5nIGlvbW11PW5vLWlnZnguDQoNCndoYXQgaXMgdGhlIHBsYXRm
b3JtIGFuZCBsaW51eCBrZXJuZWwgdmVyc2lvbiBpbiB0aGlzIGNvbnRleHQ/DQoNCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHJlcG9ydC4gRm9yIGNvbnRleHQgSSdsbCBxdW90ZSB0aGUgY29tbWl0IG1l
c3NhZ2Ugb2YNCj4gdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgb3B0aW9uIGFzIHdlbGwgYXMg
dGhlIHJlcXVlc3QgdG8gcmVwb3J0DQo+IGlzc3VlcyBmaXhlZCB3aXRoIGl0Og0KPiANCj4gIkFz
IHdlIHN0aWxsIGNhbm5vdCBmaW5kIGEgcHJvcGVyIGZpeCBmb3IgdGhpcyBwcm9ibGVtLCB0aGlz
IHBhdGNoIGFkZHMNCj4gIGlvbW11PWlnZnggb3B0aW9uIHRvIGNvbnRyb2wgd2hldGhlciBJbnRl
bCBncmFwaGljcyBJT01NVSBpcyBlbmFibGVkLg0KPiAgUnVubmluZyBYZW4gd2l0aCBpb21tdT1u
by1pZ2Z4IGlzIHNpbWlsYXIgdG8gcnVubmluZyBMaW51eCB3aXRoDQo+ICBpbnRlbF9pb21tdT1p
Z2Z4X29mZiwgd2hpY2ggZGlzYWJsZXMgSU9NTVUgZm9yIEludGVsIEdQVS4gVGhpcyBjYW4gYmUN
Cj4gIHVzZWQgYnkgdXNlcnMgdG8gbWFudWFsbHkgd29ya2Fyb3VuZCB0aGUgcHJvYmxlbSBiZWZv
cmUgYSBmaXggaXMNCj4gIGF2YWlsYWJsZSBmb3IgaTkxNSBkcml2ZXIuIg0KPiANCj4gVGhpcyB3
YXMgaW4gMjAxNSwgcmVmZXJlbmNpbmcgTGludXggPj0gMy4xOS4gSSBoYXZlIG5vIGlkZWEgd2hl
dGhlcg0KPiB0aGUgdW5kZXJseWluZyBkcml2ZXIgaXNzdWUocykgaGFzL2hhdmUgYmVlbiBmaXhl
ZC4gVGhlIGFkZHJlc3Nlcw0KPiByZWZlcmVuY2VkIGFyZSB2YXJpYWJsZSBlbm91Z2ggYW5kIGFs
bCB3aXRoaW4gUkFNLCBzbyBJJ2QgY29uY2x1ZGUNCj4gdGhpcyBpcyBub3QgYSAibWlzc2luZyBS
TVJSIiBpc3N1ZS4NCg0KVmFyaWFibGUgZW5vdWdoIGJ1dCBub3Qgd2l0aGluIFJBTS4gRnJvbSBF
ODIwOg0KDQooWEVOKSAgMDAwMDAwMDEwMDAwMDAwMCAtIDAwMDAwMDA4NzE4MDAwMDAgKHVzYWJs
ZSkNCg0KQnV0IHRoZSByZWZlcmVuY2VkIGFkZHJlc3NlcyBhcmUgd2F5IGhpZ2hlcjoNCg0KKFhF
TikgW1ZULURdRE1BUjpbRE1BIFJlYWRdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjAwOjAyLjBdIGZh
dWx0IA0KYWRkciA3NmM2MTVkMDAwLCBpb21tdSByZWcgPSBmZmZmODJjMDAwYTBjMDAwDQooWEVO
KSBbVlQtRF1ETUFSOiByZWFzb24gMDYgLSBQVEUgUmVhZCBhY2Nlc3MgaXMgbm90IHNldA0KDQo+
IA0KPiBDYy1pbmcgdGhlIFZULWQgbWFpbnRhaW5lciBmb3IgcG9zc2libGUgaW5zaWdodHMgb3Ig
dGhvdWdodHMuDQo+IA0KPiBKYW4NCg0KSSBkb24ndCBoYXZlIG90aGVyIHRob3VnaHRzIGV4Y2Vw
dCB0aGUgd2VpcmQgYWRkcmVzc2VzLiBJdCBtaWdodCBiZQ0KZ29vZCB0byBhZGQgc29tZSB0cmFj
ZSBpbiBkb20wJ3MgaTkxNSBkcml2ZXIgdG8gc2VlIHdoZXRoZXIgdGhvc2UNCmFkZHJlc3NlcyBh
cmUgaW50ZW5kZWQgb3Igbm90Lg0KDQpUaGFua3MNCktldmluDQo=


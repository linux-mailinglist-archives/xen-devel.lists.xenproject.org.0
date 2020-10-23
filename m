Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A62969AF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 08:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10703.28596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqYk-0000mK-Lt; Fri, 23 Oct 2020 06:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10703.28596; Fri, 23 Oct 2020 06:28:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqYk-0000lv-ID; Fri, 23 Oct 2020 06:28:18 +0000
Received: by outflank-mailman (input) for mailman id 10703;
 Fri, 23 Oct 2020 06:28:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3Pz=D6=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kVqYj-0000lq-9x
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:28:17 +0000
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b81548a9-9521-4773-87db-961948c2e7d6;
 Fri, 23 Oct 2020 06:28:13 +0000 (UTC)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 23:28:10 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 22 Oct 2020 23:28:10 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Oct 2020 23:28:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:07 -0700
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1711.namprd11.prod.outlook.com (2603:10b6:300:27::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 23 Oct
 2020 06:28:02 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 06:28:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q3Pz=D6=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
	id 1kVqYj-0000lq-9x
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:28:17 +0000
X-Inumbo-ID: b81548a9-9521-4773-87db-961948c2e7d6
Received: from mga06.intel.com (unknown [134.134.136.31])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b81548a9-9521-4773-87db-961948c2e7d6;
	Fri, 23 Oct 2020 06:28:13 +0000 (UTC)
IronPort-SDR: qgP7VG7/f8BrYJsRkYUIP35PVdvsYFX4XxfuKxMJtfd9qvpYZftsQhkVFiakONLmiG95O8q7eK
 IxLGF49REC4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="229269346"
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="229269346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 23:28:10 -0700
IronPort-SDR: lf498Q5QhkfcmkxGIUFxXi66Ge+t9y1l8e5Y6TgWOkBF9qDl0NVboAtNpz1GwqaAHE53v2a/OR
 7hlgMRvNxYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,407,1596524400"; 
   d="scan'208";a="360131184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP; 22 Oct 2020 23:28:10 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Oct 2020 23:28:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 22 Oct 2020 23:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1OQ72WkfJFzQKu5sXnSD2bf2L0ISTvgHZhOcBM5NUZNIvrgsTbbBu/4sJS9N5RTqqtzEA5tnn6nyN/UZfRnLbE1ASaC+dPUNDWJYKpF3303+67hTD4QrheRt7WDM8jB8rwWRMPLsmdnEqn+7a51uppZgG/PGNZFc/23NQeswZCVOZSxhBYBgRC1SxseYstjGMyri02LX3HXTbV9/MPBLn9/Z9pHOzgtuUh/TgDvTvx4EgG5A24d+fkyNQwcWAjir86WJVVWtN1lJ+8LpInvA+Cdh72v4pEUG+4dQ6NIlcmTZ/hLqZU16FRxKyai4Pd4wLb+ZRVriK1wy21oYZQ4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8XxxAvJfuAo9wQvDsy7omotezTw048hqHDi1GsBNPI=;
 b=VSvQRoE6rsRX8wLCwgBihczCCQVLQA+JjN15QuGAMJiG1dSB8mvKyz8yPlqyH0oVzYRUR/qf1vlhBuGcTpPD4Pbes0bBrJ8qvqzsH4hSC/JdF9QEX7j8ddes3tiM7qh3ygF4ha55A5ESpIWI+kTfDCTTOn48vw/QRHVZPE4MSDPVlS4faTHjvvQveqgvjkJH5Kt0eXcApXPI/CGYoIhofblH/8rXN1DQsQE8wkv4MVkNfEfCjyO/SW8MXQVp1VdWSna81sRWX5yH0AI04eQf9qbHIfBnf0++Fs0vNQHOCLpmrifHJ8LLtN1vWFJdEIufWEe12FU/NW+TQPH6vzKeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8XxxAvJfuAo9wQvDsy7omotezTw048hqHDi1GsBNPI=;
 b=xq2QVaFDDoOU0A4mZCJTMaCNPcv1cCeH0HhA5z3cPwfWjrsS0pqpnqM34wLmwOflob72RkpO9BFX62Z3OwImcnLL+4IWDbcSw2EL6RykM/A0X+qeUhYJYkU+LAa5PLEd0EZ91o6ZW7KYi7kTceRxJkXxZm94eTbvTcfVkWOau6A=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1711.namprd11.prod.outlook.com (2603:10b6:300:27::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 23 Oct
 2020 06:28:02 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::c88f:585f:f117:930b%8]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 06:28:02 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Paul
 Durrant" <paul@xen.org>
Subject: RE: [PATCH] IOMMU: avoid double flushing in shared page table case
Thread-Topic: [PATCH] IOMMU: avoid double flushing in shared page table case
Thread-Index: AQHWpuhdf0WK+guU3Ei2udEaPDozGamkvWZg
Date: Fri, 23 Oct 2020 06:28:02 +0000
Message-ID: <MWHPR11MB1645E262F83FEE9E2BDC9E8D8C1A0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
In-Reply-To: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1643216-2c13-4392-c6a7-08d8771ccb43
x-ms-traffictypediagnostic: MWHPR11MB1711:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1711C0DF10E99A3595A7884E8C1A0@MWHPR11MB1711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hvz8lv4n7kMSJv4MMkxQnVI+givG5paqjVIgh/HiI++vwt7/oDQZf3VG/45wVD406ccisAbaWdtCl9ED99wuHGQKqneurfGmX60vu0lG1dXXYvy2apHR099+sP41E/8nMZMCPZTXg4bEEUDFB0LkTfovhjMAGYjmJS5Lo2AdLnGG/4zK0ZA02qD+F1oSz2e2nOkq0uz/UVdi14Rkd7balwzA9MFn6/D9zyV5EyEuw8Y/DLXkBZ1S+Ez9RPw/1B1IrrmA+H6MQBbOgitXUgmNwso3tNRXh0OZuEqZiF3KrZUJeODT43yv1Dhdqa1kf9A8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(71200400001)(9686003)(83380400001)(64756008)(7696005)(66476007)(2906002)(66556008)(66946007)(76116006)(55016002)(66446008)(26005)(5660300002)(8936002)(186003)(33656002)(478600001)(6506007)(8676002)(54906003)(52536014)(4326008)(110136005)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: d8QHoHEyn3FbzLrEmsq8bRcUsbE4Ld8aRlnZ+Id4TvN4fBUVRXv/LHDrcpsjqZLydXfwrJ5+aLHELRySYabtBphb75qebkRNAhxtslCZJtjjDCPWdO0L2/XmJkaY3gsiylzko2gWN/zE8i1Fc1Vtd1q5CjxsHI/ajKE3KxfqNqOG2VlTyLMKjN4BWaIzSZZmu9vsK11xbDt2pXsxWMWia2Vzy8ifTkVhFenWDNayBpQNlzCSYStcvmO9FM8EtMZz7W2v5KhACAfqCSgvg8z5Lg/+8grmxYq9oIW5tn3GqWwxYVX2xDQ+zOTrsaDHvyT+M9kJvWkn+HKFG52aRZXQeni0YN3MLLG1XOAXpEEvLv1Q0W+8YXNMxwr3NAKLgOyO+ZUoiyQ7TEKFZplRv5TSzjgYY0gtdI52phYl3RJHGeqRBlMWHOMnooe3MzesH00C0fsdCbDuz/HWrxaJ9EbdB7SREgdYPwTFCEKU9muLnKzK/qfYgrg5tHxEbHrDNBdblW5GL5gFW5l2GJ7w7H6SWo6O+ttVMkt/AOyKcbB88JWO2w+OfqUE/AF0ZF2ECtTj6wSFCkPwelVZbbPWQOvnmpzyTAW/dD4ajTiFf4HJVfR77P8CIH3h6Tf/bMro2m2/YwVgXua/qTGOEujssOGCBw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1643216-2c13-4392-c6a7-08d8771ccb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 06:28:02.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/bwPwXdPK4PLMW685EFm7LgTk/hI+eHiERy7q1/hphXFleW0N6/MIuL+Stl4anwyHVGntCdtMHFK4wDUSlSLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1711
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE9jdG9iZXIgMjAsIDIwMjAgOTo1MyBQTQ0KPiANCj4gV2hpbGUgdGhlIGZsdXNoIGNvYWxlc2Np
bmcgb3B0aW1pemF0aW9uIGhhcyBiZWVuIGhlbHBpbmcgdGhlIG5vbi1zaGFyZWQNCj4gY2FzZSwg
aXQgaGFzIGFjdHVhbGx5IGxlYWQgdG8gZG91YmxlIGZsdXNoZXMgaW4gdGhlIHNoYXJlZCBjYXNl
ICh3aGljaA0KPiBvdWdodCB0byBiZSB0aGUgbW9yZSBjb21tb24gb25lIG5vd2FkYXlzIGF0IGxl
YXN0KTogT25jZSBmcm9tDQo+ICpfc2V0X2VudHJ5KCkgYW5kIGEgc2Vjb25kIHRpbWUgdXAgdGhl
IGNhbGwgdHJlZSBmcm9tIHdoZXJldmVyIHRoZQ0KPiBvdmVycmlkaW5nIGZsYWcgZ2V0cyBwbGF5
ZWQgd2l0aC4gSW4gYWxpZ25tZW50IHdpdGggWFNBLTM0NiBzdXBwcmVzcw0KPiBmbHVzaGluZyBp
biB0aGlzIGNhc2UuDQo+IA0KPiBTaW1pbGFybHkgYXZvaWQgZXhjZXNzaXZlIHNldHRpbmcgb2Yg
SU9NTVVfRkxVU0hGX2FkZGVkIG9uIHRoZSBiYXRjaGVkDQo+IGZsdXNoZXM6ICJpZHgiIGhhc24n
dCBiZWVuIGFkZGVkIGEgbmV3IG1hcHBpbmcgZm9yLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IFRCRDogVGhlIEFybSBwYXJ0IHJlYWxs
eSBpcyBqdXN0IGZvciBjb21wbGV0ZW5lc3MgKGFuZCBoZW5jZSBjb3VsZCBhbHNvDQo+ICAgICAg
YmUgZHJvcHBlZCkgLSB0aGUgYWZmZWN0ZWQgbWFwcGluZyBzcGFjZXMgYXJlbid0IGN1cnJlbnRs
eQ0KPiAgICAgIHN1cHBvcnRlZCB0aGVyZS4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0u
Yw0KPiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMNCj4gQEAgLTEwNDUsNyArMTA0NSw3IEBAIHN0
YXRpYyBpbnQgX19wMm1fc2V0X2VudHJ5KHN0cnVjdCBwMm1fZG8NCj4gICAgICAgICAgcDJtLT5s
b3dlc3RfbWFwcGVkX2dmbiA9IGdmbl9taW4ocDJtLT5sb3dlc3RfbWFwcGVkX2dmbiwgc2dmbik7
DQo+ICAgICAgfQ0KPiANCj4gLSAgICBpZiAoIGlzX2lvbW11X2VuYWJsZWQocDJtLT5kb21haW4p
ICYmDQo+ICsgICAgaWYgKCBpc19pb21tdV9lbmFibGVkKHAybS0+ZG9tYWluKQ0KPiAmJiAhdGhp
c19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgJiYNCj4gICAgICAgICAgIChscGFlX2lzX3Zh
bGlkKG9yaWdfcHRlKSB8fCBscGFlX2lzX3ZhbGlkKCplbnRyeSkpICkNCj4gICAgICB7DQo+ICAg
ICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFncyA9IDA7DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9tbS9wMm0tZXB0LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPiBAQCAt
ODQyLDcgKzg0Miw3IEBAIG91dDoNCj4gICAgICBpZiAoIHJjID09IDAgJiYgcDJtX2lzX2hvc3Rw
Mm0ocDJtKSAmJg0KPiAgICAgICAgICAgbmVlZF9tb2RpZnlfdnRkX3RhYmxlICkNCj4gICAgICB7
DQo+IC0gICAgICAgIGlmICggaW9tbXVfdXNlX2hhcF9wdChkKSApDQo+ICsgICAgICAgIGlmICgg
aW9tbXVfdXNlX2hhcF9wdChkKSAmJiAhdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikg
KQ0KPiAgICAgICAgICAgICAgcmMgPSBpb21tdV9pb3RsYl9mbHVzaChkLCBfZGZuKGdmbiksIDF1
bCA8PCBvcmRlciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGlvbW11
X2ZsYWdzID8gSU9NTVVfRkxVU0hGX2FkZGVkIDogMCkgfA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAodnRkX3B0ZV9wcmVzZW50ID8gSU9NTVVfRkxVU0hGX21vZGlmaWVk
DQo+IC0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gKysrIGIveGVuL2NvbW1vbi9tZW1vcnku
Yw0KPiBAQCAtODcwLDcgKzg3MCw3IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXAoc3RydWN0
IGRvbWFpbg0KPiAgICAgICAgICB0aGlzX2NwdShpb21tdV9kb250X2ZsdXNoX2lvdGxiKSA9IDA7
DQo+IA0KPiAgICAgICAgICByZXQgPSBpb21tdV9pb3RsYl9mbHVzaChkLCBfZGZuKHhhdHAtPmlk
eCAtIGRvbmUpLCBkb25lLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01N
VV9GTFVTSEZfYWRkZWQgfCBJT01NVV9GTFVTSEZfbW9kaWZpZWQpOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJT01NVV9GTFVTSEZfbW9kaWZpZWQpOw0KPiAgICAgICAgICBp
ZiAoIHVubGlrZWx5KHJldCkgJiYgcmMgPj0gMCApDQo+ICAgICAgICAgICAgICByYyA9IHJldDsN
Cj4gDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4D22314B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 04:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwGR0-00026t-Dz; Fri, 17 Jul 2020 02:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPx8=A4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jwGQz-00026k-Lj
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 02:49:13 +0000
X-Inumbo-ID: 17b64678-c7d8-11ea-9579-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17b64678-c7d8-11ea-9579-12813bfff9fa;
 Fri, 17 Jul 2020 02:49:11 +0000 (UTC)
IronPort-SDR: +v9j2Ftv0Gnvx+rSI4WTG+1sf5Wohq5SqryUN8XFzLwg8nMp92SJq2H9jbVVSLeo5EmKVoeO4n
 zIy5Jqsv5G1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="150909894"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="150909894"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 19:49:08 -0700
IronPort-SDR: 2OXcmu4kXRiDvZs7LK49cX/J3VfFh1LxC2zBc12YJSTerYHwnsI8IrvF2ZFmelWQxV1h/Gcfk1
 VJGZpIxOvywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="486829054"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2020 19:49:07 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 19:49:06 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 19:49:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 16 Jul 2020 19:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It9fFztwMRTYiuKbRJ30dg7bNTHtDsI/TrcCPNW3MiIOSY5oqrSuPR7LartyLIp5q9scr8klFkqa63uvxhBbK585RWXkeljxuoTKZjyT6NIBBY96Tv8dFGovULXWAT4RcSif3p04/xlHjov0lXudSTNmqeZ5gMXT1sbK0O04FbBDoyMurrj/8csb6auyGkBgPHPFu6WGHe6B9NkFlcip1uMjdMs52s/Cidle5N4EBOuv7t/G1lVlNrSD1fi3+PAH4HLBzxe55As6zR8Epm1ZF1OTWjW4/h+pF92bGLPeNvBJYwwDrTlpo2+utQ6tJWSW0UnPY/jus06KvJ3d0WzTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk965ARW+ikK3M59/OeHcUZO/J+ppj2m64EOXbCKxxU=;
 b=C4yHCYdPh/QU37lgHd3+bDRU+ZwEfSZPCq48aSVWNiWasO0aDGf7jKOouNuioNKVJJZv/0my7mERR8fmUSYcbO7lzcttAy2EcdhMQa+kaubfNPVoD1N6EFHg9RJQ1DxEqSOGD9+9ZUKC8pbqx/0wsebhL95QfnRooJRS0MPED6yVdsXrQHQ/GrlMnbCMHHN57ZHNCx6Az4yJht5ZmwDBgy/RN17sirjwKsqY8jRjNEus218U2fzsdiGBwepE9IOw4/QDpZBiDelyRsgxkSNoA0dyQDSrp6VngFtP7zlf61/+bCIuyPZ9hrxu9x/8fFxS1dRtivty8A7n3tPR4thNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk965ARW+ikK3M59/OeHcUZO/J+ppj2m64EOXbCKxxU=;
 b=ZU/gOdOFJ+KS/fTIExX3cVd0dZj64QWAv9KyWRn6Oyzv1+JPml+PY/aeSj8SGejQ2EJ3dJtlH4SqekR4EHWicTPohresq3aC1TgJ2rNt++5INMHQ/gHolJnTCWHQhQ/qUkvWlUwEf8mnOPH6JvndS+YuZ6ikgkyHzGayx8UAoXM=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2253.namprd11.prod.outlook.com (2603:10b6:301:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 02:49:04 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3195.018; Fri, 17 Jul 2020
 02:49:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] VT-d: use clear_page() in alloc_pgtable_maddr()
Thread-Topic: [PATCH 2/2] VT-d: use clear_page() in alloc_pgtable_maddr()
Thread-Index: AQHWWo9Tnv7rOln+0USMn9HVMeMuSqkLFGfQ
Date: Fri, 17 Jul 2020 02:49:04 +0000
Message-ID: <MWHPR11MB1645486699AEF7BF39B652518C7C0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <14f8b940-252f-9837-8958-5e76e1c3f06f@suse.com>
In-Reply-To: <14f8b940-252f-9837-8958-5e76e1c3f06f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c0412e2-7897-4269-bd1b-08d829fbf7e2
x-ms-traffictypediagnostic: MWHPR1101MB2253:
x-microsoft-antispam-prvs: <MWHPR1101MB22533CB1779F0FF580D61A1A8C7C0@MWHPR1101MB2253.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wTc5ML7CHni+LSqfffsROcfjVuoUW+S9adhdaZ9axefgS+RiZzFbvqZZ7Jt8hm9hEzMPstuwvWRMnIwieR87suqXS2q+NObRZKvfSsQJ6iwyQKQBiC6SdoxubOplICmumHtQSRt9OJVebozObd6/eC95sFhL+qwgEay69td24HOTqGftapgBsSvEpqa21xl+FCcLRMwRkhGqPOia9ljna694Q48dB6oTVYQwJpXMXqbMkx67EpdGzevu7cLotVvS8X+1oJmZ5wj2Rdfke7UNnX4Ka1Twatn0Qtqs9uLZ/SuKzjIqbGUjYtPsePAd1+dONCKQiWMI5NLBa+rpR2gN9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(76116006)(8936002)(9686003)(33656002)(66446008)(8676002)(66556008)(83380400001)(66476007)(4744005)(6506007)(64756008)(52536014)(7696005)(186003)(26005)(110136005)(5660300002)(71200400001)(66946007)(86362001)(55016002)(478600001)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pFmsTUr/C1iaHo7cSIDS7Yr4dAvZ7iWgvJFIrdwYpVuqR7sKk0Msi8df9Dmi7E+bnT9u42ksnnwPMWV3gs+Iw7emqJiBFSajHnxRmWNhyoY1YegmOFxxkvW50NM9hzSzfqGUjbd17vsKnDsZJPaMYeEPE9Jlclf135m9veysSl5jCHEawbbA9sUcikW1QZtNuKc/2TE7YHlN1NuFjCvJlkeH/fZF71S6W6PPWCqVvFPzVPNYJV30L2okvD7vwWTXv66uTPKFFZVZdutD+WZBAWobDvY/YqxMJDxKJVcTEgpHqLp+Apfa7yvMybgTDyZ6CKXzSOOb8wgmyFJO6ycuxXZeLSO7SyLjkZDctoXbeaOFboEbDSBmWrm79NTrLpAQSsp5vfmJ5e9p5k+Qny8+ZZH3VrtfgiroZ9zgtGpK7lVs0n5Hc/thSQe2nksL55LEYoY720Iuw4F0b8FHzloqRvcVQqusnCL9okabZYggrZO7WlaYXlJAnf3YcFdRmg6T
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0412e2-7897-4269-bd1b-08d829fbf7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 02:49:04.2928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EUJ5XUfSq6xTqBcpx470htxKZ/kPSD3VMUFs7/IyhQGRIkIg+7Lram1o73NhhCqh09SxFhir0W9iM4Qm6gIXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2253
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVseSAxNSwgMjAyMCA2OjA0IFBNDQo+IA0KPiBGb3IgZnVsbCBwYWdlcyB0aGlzIGlzICht
ZWFudCB0byBiZSkgbW9yZSBlZmZpY2llbnQuIEFsc28gY2hhbmdlIHRoZQ0KPiB0eXBlIGFuZCBy
ZWR1Y2UgdGhlIHNjb3BlIG9mIHRoZSBpbnZvbHZlZCBsb2NhbCB2YXJpYWJsZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTk5LDcgKzE5OSw2IEBAIHN0YXRpYyB2b2lkIHN5
bmNfY2FjaGUoY29uc3Qgdm9pZCAqYWRkciwNCj4gIHVpbnQ2NF90IGFsbG9jX3BndGFibGVfbWFk
ZHIodW5zaWduZWQgbG9uZyBucGFnZXMsIG5vZGVpZF90IG5vZGUpDQo+ICB7DQo+ICAgICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqcGcsICpjdXJfcGc7DQo+IC0gICAgdTY0ICp2YWRkcjsNCj4gICAgICB1
bnNpZ25lZCBpbnQgaTsNCj4gDQo+ICAgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2VzKE5VTEws
IGdldF9vcmRlcl9mcm9tX3BhZ2VzKG5wYWdlcyksDQo+IEBAIC0yMTAsOCArMjA5LDkgQEAgdWlu
dDY0X3QgYWxsb2NfcGd0YWJsZV9tYWRkcih1bnNpZ25lZCBsbw0KPiAgICAgIGN1cl9wZyA9IHBn
Ow0KPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnBhZ2VzOyBpKysgKQ0KPiAgICAgIHsNCj4gLSAg
ICAgICAgdmFkZHIgPSBfX21hcF9kb21haW5fcGFnZShjdXJfcGcpOw0KPiAtICAgICAgICBtZW1z
ZXQodmFkZHIsIDAsIFBBR0VfU0laRSk7DQo+ICsgICAgICAgIHZvaWQgKnZhZGRyID0gX19tYXBf
ZG9tYWluX3BhZ2UoY3VyX3BnKTsNCj4gKw0KPiArICAgICAgICBjbGVhcl9wYWdlKHZhZGRyKTsN
Cj4gDQo+ICAgICAgICAgIGlmICggKGlvbW11X29wcy5pbml0ID8gJmlvbW11X29wcyA6ICZ2dGRf
b3BzKS0+c3luY19jYWNoZSApDQo+ICAgICAgICAgICAgICBzeW5jX2NhY2hlKHZhZGRyLCBQQUdF
X1NJWkUpOw0KDQo=


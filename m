Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5C1FCD85
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXJg-0008Eq-Dw; Wed, 17 Jun 2020 12:37:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LTj=76=intel.com=luwei.kang@srs-us1.protection.inumbo.net>)
 id 1jlXJf-0008El-2s
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:37:19 +0000
X-Inumbo-ID: 462fb9a7-b097-11ea-b9d9-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 462fb9a7-b097-11ea-b9d9-12813bfff9fa;
 Wed, 17 Jun 2020 12:37:17 +0000 (UTC)
IronPort-SDR: ks2vvZwu9VS083fy6iHS7oaBKrYrvQjSwIqJhKbeB3QIm1SWeThsFsW7nM40PAs5pAZqzQFD1z
 d/FV3BZikWyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 05:37:16 -0700
IronPort-SDR: AOvhoC8mUFXcfT3wyIgHy00rdg0AdveeyuhNAbqbmEyRcB0RJKxgJJDEniP23GqTGrU8pk4YnL
 x4lkNqY6VfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,522,1583222400"; d="scan'208";a="352064235"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga001.jf.intel.com with ESMTP; 17 Jun 2020 05:37:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 05:37:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jun 2020 05:37:15 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jun 2020 05:37:15 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 17 Jun 2020 05:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EO94mCJCZl1L+cDJUZGd0aMkxMUx8ug3lsyFlkWkitvtwlpKZ2CGWl6nZkuu6aNv1IcGd+yHg/SkK+ZDvgGhbRfWYipArI8f/Cfi3vxnmxlAnnguTGJesRPPARoCJf5fuhkC6ITj4sFpZi0gsKdTCNe+fL6q1kpXNq0het3vz657AWhOFinBMjtMVaQ0cpDmmERySWwqJkiqFX3kqW0uRqul6EkyjrbsCOA34GqA7H1nrVWN1Exg4MB0Nru66xDIOPEuetVF0ubdLCOw9O+1L9R+leKq1THo1evo3SnARndN/p+MAua8eycSU/1ZOlrrzVpVSRC+aDzEDSzGLgEBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAk8Rz8sLYZVur/7OUUPH1uAbQL/e5JT09fayQ4nB0Q=;
 b=f/fmbgvMdLYFgORlDjz60QNvHJqtdazHYzG/qIqpeOlnBqVPAOTUf/bBho0qKOb9YVojjoDbC300+MvkrzPrY6B0D5gkx4xThOR1zrqmb2X4xZClXN2FCAtGDe9dUdaNlsAUMYi7vn9vvD+yBP22kuSq/f5mzisVzYZ08GdTMVO+rRWdc1QsNc+18gVp0nEugurCx8n/9RCN9BcEDqb/sdGsejvriVaEDls5Z8vVgMjIO960Uumzz2cEVS619n0XQhK5olgsMnk38jonumeeWDNCiJ/DfXLEkXgx8i089jK0PJBYDOi8YQ23YLJgs6zOro3gTZbnQwTkBTtENbDeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAk8Rz8sLYZVur/7OUUPH1uAbQL/e5JT09fayQ4nB0Q=;
 b=K2v6XnyOGXAtuZHIhNthE8m6g7XQZ8n5NpaxlMoq+chfWaxBBCLkGXXJATailXd3IZ2KSeEWPdWMpxU49nzq6qVgKNum/pLlmAXlesqzPcgbOAH3GXAqSsB0zfkjPNoglEBIrX4lIU7/eG2uHdZNbFwxXsQ8ViG8hZMCo2xnoqo=
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17)
 by DM5PR11MB1306.namprd11.prod.outlook.com (2603:10b6:3:b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Wed, 17 Jun 2020 12:37:13 +0000
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601]) by DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601%6]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 12:37:13 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Topic: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpiVzvKAgAAIowCAAHHNAIAAVp/wgAArhICAADbMIA==
Date: Wed, 17 Jun 2020 12:37:13 +0000
Message-ID: <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617092103.GZ735@Air-de-Roger>
In-Reply-To: <20200617092103.GZ735@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b06be3b8-b3fb-4bf6-2444-08d812bb295b
x-ms-traffictypediagnostic: DM5PR11MB1306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1306AE5CB4CA3E56F58A8296809A0@DM5PR11MB1306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EHDF7Fl+LS8W+08IRUqnNYH77Lt1V4KU3GS304K0fvQITCnC06V0s7/rd1f7Gpn3bJbKIbxIJpMfzwrhXJqksduBHlgBhHo3YFFPkhzasgfdqa01twQofptP8RqvqV6oOkgKe7N2mlBDjvprDKWrXAVjPFMi0J3aaI8JjA3qVH35OF+2PGWeRbPfIvVx2CdkGui3WJAv0avOBiqKNugyEdPZvdEk1hCQVbHENIZxO/J8YWKZvbvCQpwqLWq0nVpV/q6nC8ghBEmR/JlvJ5CufdSqbGq4bB6H7ObeqLJXWgY6rslKT5CZDlCX9ZXU8q1L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(86362001)(66946007)(33656002)(26005)(186003)(8676002)(8936002)(53546011)(6916009)(4326008)(64756008)(6506007)(66574015)(52536014)(76116006)(66556008)(5660300002)(66446008)(66476007)(7696005)(54906003)(55016002)(71200400001)(7416002)(316002)(2906002)(9686003)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y8/pmqf+THYt8oAwDVCu1BHSMJbkhRIVbGF3fdMYOXB+HteHVFfxJsvWc4eHwNGwzTxpqLHqnREZRLrTWj2/L6NxodyZeiGTCiBldbqs8IwSyEdyiTk+uL80aCGxoAX2Gtx41b1R1u6rerdYiogZPrXSXCNDjsAeH4TCbIonvHYEF0UhJ8SKEjxcF/bBaqa0zKJcXbhs0mBwZypPD+F1ztPkFPLpWEqwDHpaauQEyEAWuZjs38bIStzxo5c91JXBQOy3hS6AmZEjwoqvMkdnjYv+OBxZp+j6ydnYhk2U/5Mb4ImXHO+47xq3/vwTPWWRtHGQb5y19odz0qKECXtJTAUbAxwGJQYqXTzI3do/ZhLFyzFXnX9ZtAcMoXY+8M/pHAxWRoC0f+eZs/t2kptilpt+B5jBbCOq1YM4xWfX7abS2wz09RWtWDQV0ftICkPJt/dgGe6QG7dBaPybCSPnMb0NV5uHqssfHK3YF29sVMQSfxLRBE3TAriPio277xyZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b06be3b8-b3fb-4bf6-2444-08d812bb295b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 12:37:13.3049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsazTXPVYbU5ZQZO7AaIwXnw40MZz1V4pUabIRquGCC6ZpZ2gByD4oFbb7oMhGXHZDo/FhNAwBkbG33QSFI1UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1306
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFRpYW4sIEtldmlu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNywg
MjAyMCA5OjM1IEFNDQo+ID4gPiBUbzogTWljaGHFgiBMZXN6Y3p5xYRza2kgPG1pY2hhbC5sZXN6
Y3p5bnNraUBjZXJ0LnBsPjsgQW5kcmV3IENvb3Blcg0KPiA+ID4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+ID4gPiBDYzogWGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc+OyBKYW4gQmV1bGljaA0KPiA+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPiA+IDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IE5ha2FqaW1hLCBKdW4gPGp1bi5uYWthamltYUBpbnRlbC5jb20+Ow0KPiA+ID4gR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPiA+IDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFN0ZWZhbm8NCj4gPiA+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLYW5n
LCBMdXdlaQ0KPiA+ID4gPGx1d2VpLmthbmdAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogUkU6
IFtQQVRDSCB2MSAwLzddIEltcGxlbWVudCBzdXBwb3J0IGZvciBleHRlcm5hbCBJUFQNCj4gPiA+
IG1vbml0b3JpbmcNCj4gPiA+DQo+ID4gPiArTHV3ZWksIHdobyBkZXZlbG9wZWQgUFQgZm9yIEtW
TSBhbmQgaXMgdGhlIGJlc3Qgb25lIHdobyBjYW4gaGVscA0KPiA+ID4gcmV2aWV3IFZNWCBjaGFu
Z2VzIGZyb20gSW50ZWwgc2lkZS4gUGxlYXNlIGluY2x1ZGUgaGltIGluIGZ1dHVyZQ0KPiA+ID4g
cG9zdCBvciBkaXNjdXNzaW9uLg0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+ID4gRnJvbTogTWljaGHFgiBMZXN6Y3p5xYRza2kgPG1pY2hhbC5sZXN6Y3p5
bnNraUBjZXJ0LnBsPg0KPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTcsIDIwMjAgMjo0
OCBBTQ0KPiA+ID4gPiBUbzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gPiA+ID4gQ2M6IFhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
PjsgSmFuIEJldWxpY2gNCj4gPiA+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8d2xA
eGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPiA+ID4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjsgTmFrYWppbWEsIEp1biA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47DQo+ID4gPiA+IFRpYW4s
IEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPiA+ID4gPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+ID4gPiA+IDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47DQo+ID4gPiA+
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MSAwLzddIEltcGxlbWVudCBzdXBwb3J0IGZvciBleHRlcm5hbCBJ
UFQNCj4gPiA+ID4gbW9uaXRvcmluZw0KPiA+ID4gPg0KPiA+ID4gPiAtLS0tLSAxNiBjemUgMjAy
MCBvIDIwOjE3LCBBbmRyZXcgQ29vcGVyIGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20NCj4gPiA+
ID4gbmFwaXNhxYIoYSk6DQo+ID4gPiA+DQo+ID4gPiA+ID4gT24gMTYvMDYvMjAyMCAxNjoxNiwg
TWljaGHFgiBMZXN6Y3p5xYRza2kgd3JvdGU6DQo+ID4gPiA+ID4gV2hlbiB0aGlzIHN1YmplY3Qg
d2FzIGJyb2FjaGVkIG9uIHhlbi1kZXZlbCBiZWZvcmUsIG9uZSBpc3N1ZQ0KPiA+ID4gPiA+IHdh
cyB0aGUgZmFjdCB0aGF0IGFsbCBhY3Rpb25zIHdoaWNoIGFyZSBpbnRlcmNlcHRlZCBkb24ndCBl
bmQgdXANCj4gPiA+ID4gPiB3cml0aW5nIGFueSBhcHByb3ByaWF0ZSBwYWNrZXRzLsKgIFRoaXMg
aXMgcGVyaGFwcyBsZXNzIG9mIGFuDQo+ID4gPiA+ID4gaXNzdWUgZm9yIHRoaXMgZXhhbXBsZSwg
d2hlcmUgdGhlIGV4dGVybmFsIGFnZW50IGNhbiBzZWUgVk1FeGl0cw0KPiA+ID4gPiA+IGluIHRo
ZSB0cmFjZSwgYnV0IGl0IHN0aWxsIHJlc3VsdHMgaW4gbWlzc2luZyBpbmZvcm1hdGlvbi7CoCAo
SXQNCj4gPiA+ID4gPiBpcyBhIG1ham9yIHByb2JsZW0gZm9yIFBUIHdpdGhpbiB0aGUgZ3Vlc3Qs
IGFuZCBuZWVkcyBYZW4ncw0KPiA+ID4gPiA+IGludGVyY2VwdC9lbXVsYXRpb24gZnJhbWV3b3Jr
IGJlaW5nIHVwZGF0ZWQgdG8gYmUgUFQtYXdhcmUgc28gaXQNCj4gPiA+ID4gPiBjYW4gZmlsbCBp
biB0aGUgc2FtZSBwYWNrZXRzIHdoaWNoIGhhcmR3YXJlIHdvdWxkIGhhdmUgZG9uZSBmb3INCj4g
PiA+ID4gPiBlcXVpdmFsZW50IGFjdGlvbnMuKQ0KPiA+ID4gPg0KPiA+ID4gPiBPaywgdGhpcyBz
b3VuZHMgbGlrZSBhIGhhcmQgaXNzdWUuIENvdWxkIHlvdSBwb2ludCBvdXQgd2hhdCBjb3VsZA0K
PiA+ID4gPiBiZSB0aGUgcGFydGljdWxhciBwcm9ibGVtYXRpYyBjYXNlcz8gRm9yIGluc3RhbmNl
LCBpZiBzb21ldGhpbmcNCj4gPiA+ID4gd291bGQgYWx0ZXIgRUlQL1JJUCBvciBDUjMgdGhlbiBJ
IGJlbGl2ZSBpdCB3b3VsZCBzdGlsbCBiZQ0KPiA+ID4gPiByZWNvcmRlZCBpbiBQVCB0cmFjZSAo
aS5lLiB0aGVzZSB2YWx1ZXMgd2lsbCBiZSBsb2dnZWQgb24gVk0gZW50cnkpLg0KPiA+DQo+ID4g
ZS5nLiBJZiBhIFZNIGV4aXQgaXMgdGFrZW4gb24gYSBndWVzdCB3cml0ZSB0byBDUjMgKGluY2x1
ZGluZyDigJxNT1YNCj4gPiBDUjPigJ0gYXMgd2VsbCBhcyB0YXNrIHN3aXRjaGVzKSwgdGhlIFBJ
UCBwYWNrZXQgbm9ybWFsbHkgZ2VuZXJhdGVkIG9uIHRoZSBDUjMNCj4gd3JpdGUgd2lsbCBiZSBt
aXNzaW5nLiBUaGUgUElQIHBhY2tldCBuZWVkcyB0byBiZSB3cml0dGVuIHRvIHRoZSBQVCBidWZm
ZXIgYnkNCj4gc29mdHdhcmUuIEFub3RoZXIgZXhhbXBsZSBpcyBWTS1leGl0IHRha2VuIG9uIFJE
VFNDLg0KPiA+DQo+ID4gRm9yIFZNIGludHJvc3BlY3Rpb24sIGFsbCB0aGUgSW50ZWwgUFQgcGFj
a2V0cyBtYXkgbmVlZCB0byBlbXVsYXRlZCBieQ0KPiBzb2Z0d2FyZS4gU29tZSBkZXNjcmlwdGlv
biBpbiBTRE0gYXMgYmVsb3c6DQo+ID4gSWYgYSBWTU0gZW11bGF0ZXMgYW4gZWxlbWVudCBvZiBw
cm9jZXNzb3Igc3RhdGUgYnkgdGFraW5nIGEgVk0gZXhpdCBvbg0KPiByZWFkcyBhbmQvb3Igd3Jp
dGVzIHRvIHRoYXQgcGllY2Ugb2Ygc3RhdGUsIGFuZCB0aGUgc3RhdGUgZWxlbWVudCBpbXBhY3Rz
IEludGVsDQo+IFBUIHBhY2tldCBnZW5lcmF0aW9uIG9yIHZhbHVlcywgaXQgbWF5IGJlIGluY3Vt
YmVudCB1cG9uIHRoZSBWTU0gdG8gaW5zZXJ0DQo+IG9yIG1vZGlmeSB0aGUgb3V0cHV0IHRyYWNl
IGRhdGEuDQo+IA0KPiBJIGdvdCB0aGUgaW1wcmVzc2lvbiB0aGF0IElQVCB3YXMgbW9zdGx5IHVz
ZWZ1bCB0b2dldGhlciB3aXRoIGludHJvc3BlY3Rpb24sIGFzDQo+IHlvdSBjYW4gdGhlbiBnZXQg
ZXZlbnRzIGZyb20gdHJhcHBlZCBpbnN0cnVjdGlvbnMgKGFuZCBsaWtlbHkgZW11bGF0ZWQpIGZy
b20NCj4gdGhlIGludHJvc3BlY3Rpb24gaW50ZXJmYWNlLCB3aGlsZSBiZWluZyBhYmxlIHRvIGdl
dCB0aGUgcHJvY2Vzc29yIHRyYWNlIGZvciBub24tDQo+IHRyYXBwZWQgZXZlbnRzLg0KPiANCj4g
SSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhlcmUgd291bGQgYmUgY29ybmVyIGNhc2VzIHdpdGggdHJh
cHBlZCBpbnN0cnVjdGlvbnMNCj4gbm90IGJlaW5nIGhhbmRsZWQgYnkgdGhlIGludHJvc3BlY3Rp
b24gZnJhbWV3b3JrLg0KPiANCj4gSG93IGRvZXMgS1ZNIGRlYWwgd2l0aCB0aGlzLCBkbyB0aGV5
IGluc2VydC9tb2RpZnkgdHJhY2UgcGFja2V0cyBvbiB0cmFwcGVkDQo+IGFuZCBlbXVsYXRlZCBp
bnN0cnVjdGlvbnMgYnkgdGhlIFZNTT8NCg0KVGhlIEtWTSBpbmNsdWRlcyBpbnN0cnVjdGlvbiBk
ZWNvZGVyIGFuZCBlbXVsYXRvcihhcmNoL3g4Ni9rdm0vZW11bGF0ZS5jKSwgYW5kIHRoZSBndWVz
dCdzIG1lbW9yeSBjYW4gYmUgc2V0IHRvIHdyaXRlLXByb3RlY3QgYXMgd2VsbC4gQnV0IGl0IGRv
ZXNuJ3Qgc3VwcG9ydCBJbnRlbCBQVCBwYWNrZXRzIHNvZnR3YXJlIGVtdWxhdG9yLiBGb3IgS1ZN
LCB0aGUgSW50ZWwgUFQgZmVhdHVyZSB3aWxsIGJlIGV4cG9zZWQgdG8gS1ZNIGd1ZXN0IGFuZCBL
Vk0gZ3Vlc3QgY2FuIHVzZSBJbnRlbCBQVCBmZWF0dXJlIGxpa2UgbmF0aXZlLg0KDQpUaGFua3Ms
DQpMdXdlaSBLYW5nDQo=


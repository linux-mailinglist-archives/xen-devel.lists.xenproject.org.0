Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695A1FC362
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 03:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlMzD-0007SU-O2; Wed, 17 Jun 2020 01:35:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XM79=76=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jlMzC-0007SP-H4
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 01:35:30 +0000
X-Inumbo-ID: d278bf64-b03a-11ea-b977-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d278bf64-b03a-11ea-b977-12813bfff9fa;
 Wed, 17 Jun 2020 01:35:28 +0000 (UTC)
IronPort-SDR: Pe/kASU3GQrQzT7JT7cpfgYUYc/wfQvDha6Ib72q6YoFnu/RF8a25HUFqrHwih2m6kQ9+TgLgh
 P331QWDoMrJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 18:35:21 -0700
IronPort-SDR: 0u8esyyyIDW/FTM3vtBZ7JmjN7w6AhcQn42fKyszADqdZXCFuWWdug+6Q9gIMZkgmNV/+F+8Ax
 PwK6l8uUvu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; d="scan'208";a="309317458"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2020 18:35:22 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 16 Jun 2020 18:35:22 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 16 Jun 2020 18:35:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 16 Jun 2020 18:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5IQjX5bdmmUyjTfjDFVLxpaN/4pEV6dwrPhY3hA45GYbiGqB01YIowyu+qKIWLTV/zGDEyat5xl5Fkyp2+SpVwJR3qbR3VQsavII0/pDZ3Xs/NlS9ZAPDCTJxoUVzMGO/YwUIgmilE+7PAscqYI4jTwfH6F0HPuv4uY0Gnc7kL9bSKEL1JZgoUVd7+HpzUEponGm0MW6J98w0fsV6b3pEiFIAXRf+2vKWRFDUKsVvIX0IiRptMwwQB7gKrHtrUFEJBA4l+pVkE18IY8+RiOU5qN3PzSXgD+VVL7dtdnTfvXzjJlbQUSMY5ICrgPf5o1/DDs8xR1HbH3JWOTJpzcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMMSCmctEBUBruZM3Q2idlJszNvZMlQw119LQSZiRMs=;
 b=WFsz0BSAyMDjg7G61vtmLw9W4Oe6qx37VTm0nhfm2dVoBS9qfGuxCMnb916vtRr7n3StKXty2vZ9xuhVMfKJ9CQ0WHW1xDcV5SuCSIfYSV+goPvkDcy3cDO96AqVrEoJZFMljw3cOqI79YiKklFAzF9DD8bVeTR7McvuWNvUqVmsFz6eSQ58yO7vQQ+HO27axAkkWweOQ09S8dfMoenzcaCoTtPacsrHHaidQdmGlmiOiJR5a6CNGrT5J/+O/EhZAzHuUX3gq4961Y+qWRLbwGecHvpvmvetbrn55wAtdUkrH5mK52VA5Ze3UrG12ToFgkZZ856cckaLTMUaXecQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMMSCmctEBUBruZM3Q2idlJszNvZMlQw119LQSZiRMs=;
 b=Uav6HGG+aGGBYm0vLkEXlmYaK6xlTaEJHrEIP1lt9Hh1f4iRBankHnuWeTNHMC+qoH7xqqcMn/+YVYW+4IRivz/5Zg0xFXgMZ9xclewfSHX+UzD72CKVWsazXA+R5v/Xe5vskGv62J2xhBb4pZyLj6ZdmbuzW1iFlndup17/Eiw=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB0013.namprd11.prod.outlook.com (2603:10b6:301:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 01:35:20 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3088.029; Wed, 17 Jun 2020
 01:35:20 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Topic: [PATCH v1 0/7] Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpiVzvKAgAAIowCAAHHNAA==
Date: Wed, 17 Jun 2020 01:35:20 +0000
Message-ID: <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <cb530abc-bef6-23b9-86d8-f43167e14736@citrix.com>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
In-Reply-To: <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: cert.pl; dkim=none (message not signed)
 header.d=none;cert.pl; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53d06cdc-7e68-4994-4829-08d8125eb278
x-ms-traffictypediagnostic: MWHPR11MB0013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB00134E7723BBFA58AD1637448C9A0@MWHPR11MB0013.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1bJWTpTn6qii0pxy46q6J6y1KyjF6t/qwgH6MW2h9KgyOJiD+nlHy/tKkQQ3sBW8K5LMSAoWqZIsuq/VS3TpWuo0Mef4+pCYGRuKj0PjtynP+2e42Tlf2+yw5aYOCfh+hGY0TEhQxFF3y265URcOxhW3qLIWswf3lb5ZqcLc1NjyiHnw08k+oKwgvdLRu1L6Y5uVHwJBUMY1hEMLr5v6csDYny4sqbO8ISH7qEeReQScxHFGhmd/CZPtsOweJ0M8YqjkAKU3/VKKEgwUgSvYt7ncqhHEaDvs+OJgTzibJQbiHjp25ZO3ROcpT5w2Af8C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(76116006)(66946007)(66446008)(64756008)(86362001)(66556008)(5660300002)(52536014)(7416002)(33656002)(4326008)(107886003)(66476007)(478600001)(66574015)(55016002)(9686003)(2906002)(186003)(26005)(316002)(8936002)(110136005)(53546011)(54906003)(6506007)(83380400001)(71200400001)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L3fWBQ1/BlL9JLOeFC0Gj6uzOveCC2C0m1YkweNEX2el+ud58lJR6aiMeGWCMTf/oM6qJgWMhElWY8Hf2vdsmE9b22X86HMXK3mrQYpv6kTokEhYRO6Chtg/fIjcFrn7ZOkKepHKv7tjyUllMSlJKv0XGoRO/V7pitWmRqlaxSntiGcIagzvcOqCTlMk1ndKHa5uLBud5jv7RSaLrCQgsKaGSv1GeaOEB1xv1HqJrvsEUY52f8rtWACQ3nlayguTN2umz4IvrDIkvA6bJbziX18pR99cr0z94BxHphS+ehgESFwYP7NIqiX0ccL9RpNOZ+VtO2YCu/+0t+Z2msgFYF6RT+WtJAZjsIRIaz00hfKz53iw9VZbzL/nfrTUfVo6n7eu/QwQoC3DUTZyOnbRXssCRcih1ICiBeIFI3BSIMLnfb7YB/jSDxbwP2PISe837kGDytmnuLWikZV13M26G36qwu9dlcfCOCRYa2MUOb7hG2Zf4+DLMv2raPG6BYjT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d06cdc-7e68-4994-4829-08d8125eb278
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 01:35:20.1539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6b4ONsJv+msHm6UzI1hGddBKLLsnEDYkb5NwE8ZuKyNLX1FhCX4UsvdWsn4gc7UKl3JdFqe4SjSEZCmj8uYVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0013
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "Kang, Luwei" <luwei.kang@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K0x1d2VpLCB3aG8gZGV2ZWxvcGVkIFBUIGZvciBLVk0gYW5kIGlzIHRoZSBiZXN0IG9uZSB3aG8g
Y2FuIGhlbHANCnJldmlldyBWTVggY2hhbmdlcyBmcm9tIEludGVsIHNpZGUuIFBsZWFzZSBpbmNs
dWRlIGhpbSBpbiBmdXR1cmUNCnBvc3Qgb3IgZGlzY3Vzc2lvbi4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYcWCIExlc3pjennFhHNraSA8bWljaGFsLmxlc3pj
enluc2tpQGNlcnQucGw+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNywgMjAyMCAyOjQ4IEFN
DQo+IFRvOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzog
WGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBKYW4gQmV1bGljaA0K
PiA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBOYWthamltYSwgSnVuIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPjsgVGlhbiwNCj4gS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsN
Cj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYxIDAvN10gSW1wbGVtZW50IHN1cHBvcnQgZm9yIGV4dGVybmFsIElQVCBt
b25pdG9yaW5nDQo+IA0KPiAtLS0tLSAxNiBjemUgMjAyMCBvIDIwOjE3LCBBbmRyZXcgQ29vcGVy
IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20NCj4gbmFwaXNhxYIoYSk6DQo+IA0KPiA+IE9uIDE2
LzA2LzIwMjAgMTY6MTYsIE1pY2hhxYIgTGVzemN6ecWEc2tpIHdyb3RlOg0KPiA+PiBJbnRlbCBQ
cm9jZXNzb3IgVHJhY2UgaXMgYW4gYXJjaGl0ZWN0dXJhbCBleHRlbnNpb24gYXZhaWxhYmxlIGlu
IG1vZGVybg0KPiBJbnRlbA0KPiA+PiBmYW1pbHkgQ1BVcy4gSXQgYWxsb3dzIHJlY29yZGluZyB0
aGUgZGV0YWlsZWQgdHJhY2Ugb2YgYWN0aXZpdHkgd2hpbGUgdGhlDQo+ID4+IHByb2Nlc3NvciBl
eGVjdXRlcyB0aGUgY29kZS4gT25lIG1pZ2h0IHVzZSB0aGUgcmVjb3JkZWQgdHJhY2UgdG8NCj4g
cmVjb25zdHJ1Y3QNCj4gPj4gdGhlIGNvZGUgZmxvdy4gSXQgbWVhbnMsIHRvIGZpbmQgb3V0IHRo
ZSBleGVjdXRlZCBjb2RlIHBhdGhzLCBkZXRlcm1pbmUNCj4gPj4gYnJhbmNoZXMgdGFrZW4sIGFu
ZCBzbyBmb3J0aC4NCj4gPj4NCj4gPj4gVGhlIGFib3ZlbWVudGlvbmVkIGZlYXR1cmUgaXMgZGVz
Y3JpYmVkIGluIEludGVsKFIpIDY0IGFuZCBJQS0zMg0KPiBBcmNoaXRlY3R1cmVzDQo+ID4+IFNv
ZnR3YXJlIERldmVsb3BlcidzIE1hbnVhbCBWb2x1bWUgM0M6IFN5c3RlbSBQcm9ncmFtbWluZyBH
dWlkZSwNCj4gUGFydCAzLA0KPiA+PiBDaGFwdGVyIDM2OiAiSW50ZWwgUHJvY2Vzc29yIFRyYWNl
LiINCj4gPj4NCj4gPj4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyBhbiBpbnRlcmZhY2Ug
dGhhdCBEb20wIGNvdWxkIHVzZSBpbiBvcmRlciB0bw0KPiBlbmFibGUNCj4gPj4gSVBUIGZvciBw
YXJ0aWN1bGFyIHZDUFVzIGluIERvbVUsIGFsbG93aW5nIGZvciBleHRlcm5hbCBtb25pdG9yaW5n
LiBTdWNoIGENCj4gPj4gZmVhdHVyZSBoYXMgbnVtZXJvdXMgYXBwbGljYXRpb25zIGxpa2UgbWFs
d2FyZSBtb25pdG9yaW5nLCBmdXp6aW5nLCBvcg0KPiA+PiBwZXJmb3JtYW5jZSB0ZXN0aW5nLg0K
PiA+DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBJJ20gdmVyeSBleGNpdGVkIHRvIHNlZSBzdXBwb3J0
IGxpa2UgdGhpcyBhcHBlYXJpbmcuwqAgSG93ZXZlciwgYmUgYXdhcmUNCj4gPiB0aGF0IHdlJ3Jl
IGN1cnJlbnRseSBpbiBjb2RlIGZyZWV6ZSBmb3IgdGhlIDQuMTQgcmVsZWFzZSwgc28gaW4tZGVw
dGgNCj4gPiByZXZpZXdzIHdpbGwgcHJvYmFibHkgYmUgZGVsYXllZCBzb21ld2hhdCBkdWUgdG8g
b3VyIGJ1ZyBxdWV1ZSBhbmQNCj4gPiByZWxlYXNlIGFjdGl2aXRpZXMuDQo+IA0KPiBTdXJlLCB0
YWtlIHlvdXIgdGltZSA6KQ0KPiANCj4gDQo+ID4NCj4gPiBUaGF0IHNhaWQsIEkndmUgaGFkIGEg
dmVyeSBxdWljayBsb29rIHRocm91Z2ggdGhlIHNlcmllcywgYW5kIGhhdmUgYSBmZXcNCj4gPiBn
ZW5lcmFsIHF1ZXN0aW9ucyBmaXJzdC4NCj4gPg0KPiA+IEFGQUlDVCwgdGhpcyBpcyBzdHJpY3Rs
eSBmb3IgZXh0ZXJuYWwgbW9uaXRvcmluZyBvZiB0aGUgVk0sIG5vdCBmb3IgdGhlDQo+ID4gVk0g
dG8gdXNlIGl0c2VsZj/CoCBJZiBzbywgaXQgc2hvdWxkbid0IGhhdmUgdGhlIEggdGFnIGhlcmU6
DQo+ID4NCj4gPiBYRU5fQ1BVRkVBVFVSRShJUFQswqDCoMKgwqDCoMKgwqDCoMKgwqAgNSozMisy
NSkgLypIwqAgSW50ZWwgUHJvY2Vzc29yIFRyYWNlICovDQo+ID4NCj4gPiBiZWNhdXNlIHRoYXQg
ZXhwb3NlcyB0aGUgZmVhdHVyZSB0byB0aGUgZ3Vlc3QsIHdpdGggdGhlIGltcGxpY2F0aW9uIHRo
YXQNCj4gPiBhbGwgb3RoZXIgcGFydHMgb2YgdGhlIGZlYXR1cmUgd29yayBhcyBhZHZlcnRpc2Vk
Lg0KPiANCj4gT2ssIEkgd2lsbCByZW1vdmUgdGhlIEggdGFnLg0KPiANCj4gDQo+ID4NCj4gPg0K
PiA+IEFyZSB0aGVyZSBhbnkgcmVzdHJpY3Rpb25zIG9uIEVQVCBiZWluZyBlbmFibGVkIGluIHRo
ZSBmaXJzdCBwbGFjZT/CoCBJJ20NCj4gPiBub3QgYXdhcmUgb2YgYW55LCBhbmQgaW4gcHJpbmNp
cGxlIHdlIGNvdWxkIHVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkgZm9yDQo+ID4gUFYgZ3Vlc3RzIGFz
IHdlbGwgKHVzaW5nIHRoZSBDUEwgZmlsdGVyKS7CoCBUaGVyZWZvcmUsIEkgdGhpbmsgaXQgd291
bGQNCj4gPiBiZSBoZWxwZnVsIHRvIG5vdCB0aWUgdGhlIGZ1bmN0aW9uYWxpdHkgdG8gSFZNIGd1
ZXN0cywgZXZlbiBpZiB0aGF0IGlzDQo+ID4gdGhlIG9ubHkgb3B0aW9uIGVuYWJsZWQgdG8gc3Rh
cnQgd2l0aC4NCj4gDQo+IEkgdGhpbmsgYXQgdGhlIG1vbWVudCBpdCdzIG5vdCByZXF1aXJlZCB0
byBoYXZlIEVQVC4gVGhpcyBwYXRjaCBzZXJpZXMgZG9lc24ndA0KPiB1c2UgYW55IHRyYW5zbGF0
aW9uIGZlYXR1cmUgZmxhZ3MsIHNvIHRoZSBvdXRwdXQgYWRkcmVzcyBpcyBhbHdheXMgYSBtYWNo
aW5lDQo+IHBoeXNpY2FsIGFkZHJlc3MsIHJlZ2FyZGxlc3Mgb2YgY29udGV4dC4gSSB3aWxsIGNo
ZWNrIGlmIGl0IGNvdWxkIGJlIGVhc2lseSB1c2VkDQo+IHdpdGggUFYuDQo+IA0KPiANCj4gPg0K
PiA+IFRoZSBidWZmZXIgbWFwcGluZyBhbmQgY3JlYXRpb24gbG9naWMgaXMgZmFpcmx5IHByb2Js
ZW1hdGljLsKgIEluc3RlYWQgb2YNCj4gPiBmaWdodGluZyB3aXRoIGFub3RoZXIgb3BlbmNvZGVk
IGV4YW1wbGUsIHRha2UgYSBsb29rIGF0IHRoZSBJT1JFUQ0KPiA+IHNlcnZlcidzIHVzZSBvZiAi
YWNxdWlyZSByZXNvdXJjZSIgd2hpY2ggaXMgYSBtYXBwaW5nIGludGVyZmFjZSB3aGljaA0KPiA+
IHN1cHBvcnRzIGFsbG9jYXRpbmcgbWVtb3J5IG9uIGJlaGFsZiBvZiB0aGUgZ3Vlc3QsIG91dHNp
ZGUgb2YgdGhlIGd1ZXN0DQo+ID4gbWVtb3J5LCBmb3IgdXNlIGJ5IGNvbnRyb2wgdG9vbHMuDQo+
ID4NCj4gPiBJIHRoaW5rIHdoYXQgdGhpcyB3YW50cyBpcyBhIGJpdCBzb21ld2hlcmUgaW4gZG9t
YWluX2NyZWF0ZSB0byBpbmRpY2F0ZQ0KPiA+IHRoYXQgZXh0ZXJuYWwgdHJhY2luZyBpcyB1c2Vk
IGZvciB0aGlzIGRvbWFpbiAoYW5kIGFsbG9jYXRlIHdoYXRldmVyDQo+ID4gc3RydWN0dXJlcy9i
dWZmZXJzIGFyZSBuZWNlc3NhcnkpLCBhY3F1aXJlIHJlc291cmNlIHRvIG1hcCB0aGUgYnVmZmVy
cw0KPiA+IHRoZW1zZWx2ZXMsIGFuZCBhIGRvbWN0bCBmb3IgYW55IG5lY2Vzc2FyeSBydW50aW1l
IGNvbnRyb2xzLg0KPiA+DQo+IA0KPiBJIHdpbGwgY2hlY2sgdGhpcyBvdXQsIHRoaXMgc291bmRz
IGxpa2UgYSBnb29kIG9wdGlvbiBhcyBpdCB3b3VsZCByZW1vdmUgbG90cyBvZg0KPiBjb21wbGV4
aXR5IGZyb20gdGhlIGV4aXN0aW5nIGlwdF9lbmFibGUgZG9tY3RsLg0KPiANCj4gPg0KPiA+IFdo
YXQgc2VtYW50aWNzIGRvIHlvdSB3YW50IGZvciB0aGUgYnVmZmVyIGJlY29taW5nIGZ1bGw/wqAg
R2l2ZW4gdGhhdA0KPiA+IGRlYnVnZ2luZy90cmFjaW5nIGlzIHRoZSBnb2FsLCBJIHByZXN1bWUg
InBhdXNlIHZjcHUgb24gZnVsbCIgaXMgdGhlDQo+ID4gcHJlZmVycmVkIGJlaGF2aW91ciwgcmF0
aGVyIHRoYW4gZHJvcCBwYWNrZXRzIG9uIGZ1bGw/DQo+ID4NCj4gDQo+IFJpZ2h0IG5vdyB0aGlz
IGlzIGEgcmluZy1zdHlsZSBidWZmZXIgYW5kIHdoZW4gaXQgd291bGQgYmVjb21lIGZ1bGwgaXQg
d291bGQNCj4gc2ltcGx5IHdyYXAgYW5kIG92ZXJyaWRlIHRoZSBvbGQgZGF0YS4NCj4gDQo+ID4N
Cj4gPiBXaGVuIHRoaXMgc3ViamVjdCB3YXMgYnJvYWNoZWQgb24geGVuLWRldmVsIGJlZm9yZSwg
b25lIGlzc3VlIHdhcyB0aGUNCj4gPiBmYWN0IHRoYXQgYWxsIGFjdGlvbnMgd2hpY2ggYXJlIGlu
dGVyY2VwdGVkIGRvbid0IGVuZCB1cCB3cml0aW5nIGFueQ0KPiA+IGFwcHJvcHJpYXRlIHBhY2tl
dHMuwqAgVGhpcyBpcyBwZXJoYXBzIGxlc3Mgb2YgYW4gaXNzdWUgZm9yIHRoaXMgZXhhbXBsZSwN
Cj4gPiB3aGVyZSB0aGUgZXh0ZXJuYWwgYWdlbnQgY2FuIHNlZSBWTUV4aXRzIGluIHRoZSB0cmFj
ZSwgYnV0IGl0IHN0aWxsDQo+ID4gcmVzdWx0cyBpbiBtaXNzaW5nIGluZm9ybWF0aW9uLsKgIChJ
dCBpcyBhIG1ham9yIHByb2JsZW0gZm9yIFBUIHdpdGhpbg0KPiA+IHRoZSBndWVzdCwgYW5kIG5l
ZWRzIFhlbidzIGludGVyY2VwdC9lbXVsYXRpb24gZnJhbWV3b3JrIGJlaW5nIHVwZGF0ZWQNCj4g
PiB0byBiZSBQVC1hd2FyZSBzbyBpdCBjYW4gZmlsbCBpbiB0aGUgc2FtZSBwYWNrZXRzIHdoaWNo
IGhhcmR3YXJlIHdvdWxkDQo+ID4gaGF2ZSBkb25lIGZvciBlcXVpdmFsZW50IGFjdGlvbnMuKQ0K
PiANCj4gT2ssIHRoaXMgc291bmRzIGxpa2UgYSBoYXJkIGlzc3VlLiBDb3VsZCB5b3UgcG9pbnQg
b3V0IHdoYXQgY291bGQgYmUgdGhlDQo+IHBhcnRpY3VsYXIgcHJvYmxlbWF0aWMgY2FzZXM/IEZv
ciBpbnN0YW5jZSwgaWYgc29tZXRoaW5nIHdvdWxkIGFsdGVyIEVJUC9SSVANCj4gb3IgQ1IzIHRo
ZW4gSSBiZWxpdmUgaXQgd291bGQgc3RpbGwgYmUgcmVjb3JkZWQgaW4gUFQgdHJhY2UgKGkuZS4g
dGhlc2UgdmFsdWVzIHdpbGwNCj4gYmUgbG9nZ2VkIG9uIFZNIGVudHJ5KS4NCj4gDQo+ID4NCj4g
Pg0KPiA+IFRoYW5rcywNCj4gPg0KPiA+IH5BbmRyZXcNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IE1pY2hhxYIgTGVzemN6ecWEc2tpDQo+IENFUlQgUG9sc2thDQo=


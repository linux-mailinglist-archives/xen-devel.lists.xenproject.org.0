Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985E1FD9A3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 01:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlhVi-0006Tu-KH; Wed, 17 Jun 2020 23:30:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LTj=76=intel.com=luwei.kang@srs-us1.protection.inumbo.net>)
 id 1jlhVh-0006Tb-N1
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 23:30:25 +0000
X-Inumbo-ID: 845f92fe-b0f2-11ea-ba2c-12813bfff9fa
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 845f92fe-b0f2-11ea-ba2c-12813bfff9fa;
 Wed, 17 Jun 2020 23:30:24 +0000 (UTC)
IronPort-SDR: E6pNozX2IuE+MqZdflOlU9Y+GieO86k+l5sAOi/HCXLK+WxnXKCuCybI9cET3L8q5Ub4QXswzz
 KA74ZQuyGFSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 16:30:23 -0700
IronPort-SDR: n2p3/vyP3iCSioJUGvV2RNH8TzPCAX31ijwnjc5ryiHP6Y1JUg5ep4tpPQDVvugUNPxDiRIQbG
 6TBVEzjLTC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="262734323"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 17 Jun 2020 16:30:22 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 16:30:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 17 Jun 2020 16:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuGfLQ7FhDXmPVyiYK1g3IX2OHA87waAHB53igWKn9lRPBa6KuC6x66XWa2lqzhTLoky5gqSd7iTkloXnJo4p7FMsjvC/0YBZQme1EoY/BZzmZ/aIAWmHvQNv0SCb/2OQIHzluG7GKYJQYv1ANf3TWWoz9ualvjWqebv0u9HPGmeLUL0UogyZCJTel29qG0BTwp79okIfGVQpA3RP4sSf21GtPAlfmpazu9P2s1M+O7DU4kGI517jK240wLvDMKsQHLMkv/Wrz0Ukf3Dmt5RnT1cwb4u0Fu0ttVVNX6JyETd4VtiZd3m3bAQKc6YBDOvSKJOFtE2zkpNmXfBJsNjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbMPmNMCRf31sEUYAuqQ9dIp2fsZdxHCJN5Tg4Qo0l8=;
 b=HGin0GwZSnDeA2/QJME8hNKjOJng1ayQE8VDCMJQMCJ5/WXgSPqLO6KB8YoRZDpp1uR/989HNZ3gc/61ymBPoNwMoWLVRXFwnXc3NbaVIuk8Wb0W8ujytl+Ow6rmZL36JPCoxMGiTHFGu/AC8igfJYbJ6xeNyTGYES3+DwY+vQsTJFYbvWHa86ghKSwpkjQm9ONWiTbSOeTQbTCm+ReUIdVFSom3apQMg8p1SUUl/mqBKLFnvI+Bnq4yYJnaX4NYSdQmGJblgvMONKcZHe/5t2/6pceTiOO6LN2lXqFE5lxp4AsQGNVh6Fn3iLBO9b10X7QW9jOAr2Bhu/2FwTB2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbMPmNMCRf31sEUYAuqQ9dIp2fsZdxHCJN5Tg4Qo0l8=;
 b=oY70uqSQE3wYHAz6+27T6J/G6LyPzKbAS/SungBiDFlNpKfRnzq3VIzl9ODCMNeYQFRZ7ILiR/v3jtKQe98w8vHXfM9Dqy3KBE79yyHa5MG5RrmohUfFu92YILPTlRW9HISy8BCZsAciK3W93mhaedSZCahuY2BfJWYAQZasolE=
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17)
 by DM5PR11MB1306.namprd11.prod.outlook.com (2603:10b6:3:b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Wed, 17 Jun 2020 23:30:20 +0000
Received: from DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601]) by DM5PR1101MB2266.namprd11.prod.outlook.com
 ([fe80::b07e:e40:d34e:b601%6]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 23:30:20 +0000
From: "Kang, Luwei" <luwei.kang@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 =?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
Subject: RE: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Topic: [PATCH v1 7/7] x86/vmx: switch IPT MSRs on vmentry/vmexit
Thread-Index: AQHWRLorqrdGrNJzv0i3WWOReT69qqjdbEMA
Date: Wed, 17 Jun 2020 23:30:20 +0000
Message-ID: <DM5PR1101MB226679FFAF57E63704958110809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <317430261.8766476.1592321051337.JavaMail.zimbra@cert.pl>
 <20200616173857.GU735@Air-de-Roger>
 <676696113.8782412.1592329627666.JavaMail.zimbra@cert.pl>
 <20200617090942.GY735@Air-de-Roger>
 <574150.9103505.1592394885283.JavaMail.zimbra@cert.pl>
 <20200617125146.GA735@Air-de-Roger>
 <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
In-Reply-To: <5ad138bb-9195-a8de-5566-468db553422e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bd7b287-df72-43d5-643c-08d8131666e4
x-ms-traffictypediagnostic: DM5PR11MB1306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB130677C439C87DD91096FB39809A0@DM5PR11MB1306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6ye1gBGYqfP4o6QakFNDeplQkKCVXd5ARm/6dJ1AMpVkEqHnY9x66vueWBoQ3XnKrFRTTKrIyggDen/WnWCw8klhvzgXHQ5JTf7zpHFf1kCrYKBO6ceIpO5GhKBQLVP9dCEUQBgSQHZJGjVOqDp5W3EkBGNIfXkq2JEL9wr+pMBJ5XRP/zD98RopSg8YVjE/gOUt2pved/IVCMNwo2+KIJKnMbwMdOqQhYSRduKpepATCVM6NAcCZPSbzsv93q3CMkxLVU44xqxyiSKSiTeRhiCN6rD7dQFLg3xqFoy6GRNWWPXsHz90Y9r6NDvxEku
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(2906002)(110136005)(316002)(55016002)(478600001)(71200400001)(54906003)(9686003)(26005)(33656002)(8936002)(86362001)(66946007)(66556008)(66446008)(66476007)(66574015)(5660300002)(76116006)(7696005)(4326008)(6506007)(186003)(8676002)(52536014)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ktdcDN7ezG0N7HM+1st0e8SkZYoyebMMjdhnAGY6FPjl2oIhvtzhcq/B4Hlt5mb9nP3CpaivOj0B///8GEcN6OEEeNiQKAMgNGaVGTBLJWjf6zNANTm2bABOIzp0UYiU9QDI47CSANXxwI7ezRjBy6fckVwo38+VjOb40J/4s9GyuXmhCT8cN2/7OwCf9TtFklnO0J8UUjjob9QQwuLDJ08Ir5PyqbwEBF8W4E7NVMctM8zmIvHLsbYmBEOVESgmT28tekbEdEtCWOt9q+lPV0QAKC0uy/h6byyboNb0YzIS6PO+8tW3KhqbvxCBeby5QNzbf4J40eFs5ZqwGjaQBSN1A70kBxnnBQORLs3IAflFTxMXDBGAA/WcopaIyQGEHGnrMH8frox3XbciZTFMuj8KznvoTw02ztn+ELEOkH46Smsob3EK9r9BvMSnpOx1iP2jXSB6AYV2B9t0Jb1yBN13JdaQvh+4WBbEkF4dVxP9Qhn26P4GKLu7HGIzO7rm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd7b287-df72-43d5-643c-08d8131666e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 23:30:20.7808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvRViusavHclwPBwvlTmh9Gr82E8Lox6WPG8qApJ+Djy2Ovmco25+rQT8fvZvkmY5Z0sqi3O0kGGTKoc0F60IA==
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDAxOjU0OjQ1UE0gKzAyMDAsIE1pY2hhxYIgTGVz
emN6ecWEc2tpIHdyb3RlOg0KPiA+PiAtLS0tLSAxNyBjemUgMjAyMCBvIDExOjA5LCBSb2dlciBQ
YXUgTW9ubsOpIHJvZ2VyLnBhdUBjaXRyaXguY29tIG5hcGlzYcWCKGEpOg0KPiA+Pg0KPiA+Pj4g
MjQgVmlydHVhbCBNYWNoaW5lIENvbnRyb2wgU3RydWN0dXJlcyAtPiAyNC44IFZNLWVudHJ5IENv
bnRyb2wNCj4gPj4+IEZpZWxkcyAtPiAyNC44LjEgVk0tRW50cnkgQ29udHJvbHMgU29mdHdhcmUg
c2hvdWxkIGNvbnN1bHQgdGhlIFZNWA0KPiBjYXBhYmlsaXR5IE1TUnMgSUEzMl9WTVhfRU5UUllf
Q1RMUyB0byBkZXRlcm1pbmUgaG93IGl0IHNob3VsZCBzZXQgdGhlDQo+IHJlc2VydmVkIGJpdHMu
DQo+ID4+IFBsZWFzZSBsb29rIGF0IGJpdCBwb3NpdGlvbiAxOCAiTG9hZCBJQTMyX1JUSVRfQ1RM
Ii4NCj4gPiBJIHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIGRpZmZlcmVudCBmcm9tIHdoYXQgSSB3
YXMgcmVmZXJyaW5nIHRvLg0KPiA+IFRob3NlIG9wdGlvbnMgeW91IHJlZmVyIHRvIChsb2FkL2Ns
ZWFyIElBMzJfUlRJVF9DVEwpIGRlYWwgd2l0aA0KPiA+IGxvYWRpbmcvc3RvcmluZyBhIHNwZWNp
ZmljIGZpZWxkIG9uIHRoZSB2bWNzIHRoYXQgbWFwcyB0byB0aGUgZ3Vlc3QNCj4gPiBJQTMyX1JU
SVRfQ1RMLg0KPiA+DQo+ID4gT1RPSCBNU1IgbG9hZCBsaXN0cyBjYW4gYmUgdXNlZCB0byBsb2Fk
IGFuZCBzdG9yZSBhbnkgYXJiaXRyYXJ5IE1TUiBvbg0KPiA+IHZtZW50cnkvdm1leGl0LCBzZWUg
c2VjdGlvbiAyNi40IExPQURJTkcgTVNSUyBvbiB0aGUgU0RNLiBUaGVyZSdzDQo+ID4gYWxyZWFk
eSBpbmZyYXN0cnVjdHVyZSBvbiBYZW4gdG8gZG8gc28sIHNlZSB2bXhfe2FkZC9kZWwvZmluZH1f
bXNyLg0KPiANCj4gSWYgSSByZW1lbWJlciB0aGUgaGlzdG9yaWMgcm9hZG1hcHMgY29ycmVjdGx5
LCB0aGVyZSBhcmUgMyBjYXNlcy4NCj4gDQo+IFRoZSBmaXJzdCBoYXJkd2FyZSB0byBzdXBwb3J0
IFBUIChCcm9hZHdlbGw/KSBwcm9oaWJpdGVkIGl0cyB1c2UgY29tcGxldGVseSBpbg0KPiBWTVgg
b3BlcmF0aW9ucy7CoCBJbiB0aGlzIGNhc2UsIHdlIGNhbiB1c2UgaXQgdG8gdHJhY2UgUFYgZ3Vl
c3RzIGlmZiB3ZSBkb24ndA0KPiBlbmFibGUgVk1YIGluIGhhcmR3YXJlIHRvIGJlZ2luIHdpdGgu
DQo+IA0KPiBUaGlzIHdhcyByZWxheGVkIGluIGxhdGVyIGhhcmR3YXJlIChTa3lsYWtlPykgdG8g
cGVybWl0IHVzZSB3aXRoaW4gVk1YDQo+IG9wZXJhdGlvbnMsIGJ1dCB3aXRob3V0IGFueSBoZWxw
IGluIHRoZSBWTUNTLsKgIChpLmUuIG1hbnVhbCBjb250ZXh0IHN3aXRjaGluZw0KPiBwZXIgdGhp
cyBwYXRjaCwgb3IgTVNSIGxvYWQgbGlzdHMgYXMgbm90ZWQgaW4gdGhlIFNETS4pDQo+IA0KPiBT
dWJzZXF1ZW50IHN1cHBvcnQgZm9yICJ2aXJ0dWFsaXNlZCBQVCIgd2FzIGFkZGVkIChJY2VMYWtl
Pykgd2hpY2ggYWRkcyB0aGUNCj4gbG9hZC9zYXZlIGNvbnRyb2xzLCBhbmQgdGhlIGFiaWxpdHkg
dG8gdHJhbnNsYXRlIHRoZSBvdXRwdXQgYnVmZmVyIHVuZGVyIEVQVC4NCj4gDQo+IA0KPiBBbGwg
b2YgdGhpcyBpcyBmcm9tIG1lbW9yeSBzbyBJJ20gcXVpdGUgcG9zc2libHkgd3Jvbmcgd2l0aCBk
ZXRhaWxzLCBidXQgSSBiZWxpZXZlDQo+IHRoaXMgaXMgd2h5IHRoZSBjdXJyZW50IGNvbXBsZXhp
dHkgZXhpc3RzLg0KDQpZZXMsIEl0IGluY2x1ZGUgMyBjYXNlcy4NCjEuIEJlZm9yZSBJQTMyX1ZN
WF9NSVNDW2JpdCAxNF06DQogICAgIEludGVsIFBUIGRvZXNuJ3Qgc3VwcG9ydCB0cmFjaW5nIGlu
IFZNWCBvcGVyYXRpb24uIEV4ZWN1dGlvbiBvZiB0aGUgVk1YT04gaW5zdHJ1Y3Rpb24gY2xlYXJz
IElBMzJfUlRJVF9DVEwuVHJhY2VFbiBhbmQgYW55IGF0dGVtcHQgdG8gd3JpdGUgSUEzMl9SVElU
X0NUTCBpbiBWTVggb3BlcmF0aW9uIGNhdXNlcyBhIGdlbmVyYWwtcHJvdGVjdGlvbiBleGNlcHRp
b24gKCNHUCkNCjIuIFN1cHBvcnQgSUEzMl9WTVhfTUlTQ1tiaXQgMTRdIGJ1dCBubyBFUFQgdG8g
ZGlyZWN0IFBUIG91dHB1dDoNCiAgICBJbnRlbCBQVCBjYW4gYmUgZW5hYmxlZCBhY3Jvc3MgVk1Y
IGJ1dCB0aGUgYWRkcmVzcyBvZiBJbnRlbCBQVCBidWZmZXIgaXMgYWx3YXlzIEhQQSBmcm9tIEhX
IHBvaW50IG9mIHZpZXcuIFRoZXJlIGlzIG5vdCBWTUNTIHN1cHBvcnQgaW4gdGhpcyBzdGFnZS4g
VGhlIE1TUiBsb2FkIGxpc3QgY2FuIGJlIHVzZWQgZm9yIEludGVsIFBUIGNvbnRleHQgc3dpdGNo
KFZNLUVudHJ5L0V4aXQpLg0KMy4gSW50ZWwgUFQgVk0gaW1wcm92ZW1lbnRzIChzdGFydCBmcm9t
IEljZWxha2UpOg0KICAgIEFkZCBhIG5ldyBndWVzdCBJQTMyX1JUSVRfQ1RMIGZpZWxkIGluIFZN
Q1MsIGFuZCBIVyB0cmVhdCB0aGUgUFQgb3V0cHV0IGFkZHJlc3NlcyBhcyBHUEEgYW5kIHRyYW5z
bGF0ZSB0aGVtIHVzaW5nIEVQVC4NCg0KVGhhbmtzLA0KTHV3ZWkgS2FuZw0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A801F4A28
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 01:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jinun-00006I-58; Tue, 09 Jun 2020 23:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AJG=7W=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jinum-00006D-3G
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 23:44:20 +0000
X-Inumbo-ID: 21cb70e2-aaab-11ea-b38e-12813bfff9fa
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21cb70e2-aaab-11ea-b38e-12813bfff9fa;
 Tue, 09 Jun 2020 23:44:17 +0000 (UTC)
IronPort-SDR: LpJ7hP/xoCKV2NGAge4asPl9UQOTEwnU9b9Pn8wJ8/LYddkEjrdEdBy7wHCq6B29wgCcXvzCqI
 9Mb3NSfWAAjQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 16:44:16 -0700
IronPort-SDR: NAqZMuAphuXrPphGqtZtzlmnn1jZmDvqPFbKeFVogm84whrmnM6/zZLIfiEnIcRWEiY6j4RXyM
 ob8lEvPg0TjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; d="scan'208";a="379893976"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2020 16:44:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jun 2020 16:44:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jun 2020 16:44:15 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jun 2020 16:44:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 9 Jun 2020 16:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkCvmGe8EmONwuk4VxoN/0NEd9YhUPwZoKye7LWardL9RVJEufJoRGqxFrUhI0vaIrz0PvuH/ZZNZSqHlCGtO/iYmdMYFPwOM7FkjQIX81NqMjQehTPkrMbtSUc6/1k38K2deMR0SrpD/TfxV0RH/NteDKPghGUyu8pnwA5uWBk1RhhVsdZY3egpitKEkfB6tklAS/Gko1TzK51g9xKskUxr8V8ZbJv1iAbFwo+gk8RyudaQCF8v2sHP1j+Bnmb0VjV2WIfhiSI0Sp0nULs95ZV0VkkmAZuTqx7tFYIaGjeKu6R8DLxQIE6hUngmJ752JsvtYymQxAaWdREHP9pFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCMqnr7vTPBQE6HhvnPxSab0RucED1HLkIWc5y3pDhc=;
 b=IIk2qHmyOJzf8c3L5UFNHZ1DH+9eprkL6P9kyhtdxQmzR68bmnZTfWL6Bhm159DOKYOU5nrfGHhZn/dle9GGIWIxFenYPeL6XbeV/Z8aYx3Ocosx4lrL0oWOG6rjTxzZmzI+iLVx22iGSokn1nAaHxfblExumVJCt7HSTGwjXMadRSlNwja+Az8j13WKE65+1O64NOf2OINduAYKDfKSWQLAvbzCF3l1vWNZ8CQf2SYe9fnFHIkA6KTHeHAevABz9rLhR1tqxsKuqI0TC8epT2lzpHmGV2Zn1GwuqrGAIBdz1+xzIEpXjUlkYv3F6BiCHavmIR1aEkK1X8nqJ1P1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCMqnr7vTPBQE6HhvnPxSab0RucED1HLkIWc5y3pDhc=;
 b=RthxdP2yijL1osXhyHpq/PrpBWHc0kmQkxuufRd8lEaXx5BhVZ8Cbyf7XbBw8uxf54HYTFiG0Lt/bTDc14c9ONVz3ma5swXUKtQWCUEicJnQSRWpwewfOjhBZ/1uYWux90+wJb3UWHC3YnijMC7jd7RCQAAqZCaEW/URZUxYQf8=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1774.namprd11.prod.outlook.com (2603:10b6:300:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Tue, 9 Jun
 2020 23:44:14 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 23:44:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Thread-Topic: [PATCH v19 for-4.14 01/13] x86/mem_sharing: block interrupt
 injection for forks
Thread-Index: AQHWOBerUwuHg20nGUicDfuX+ypR+ajQ/TJw
Date: Tue, 9 Jun 2020 23:44:13 +0000
Message-ID: <MWHPR11MB164548EB2FCD46B8E2928E958C820@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
In-Reply-To: <a7ecf7703357130dbd9f23481d39adafea569872.1591017086.git.tamas.lengyel@intel.com>
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
x-ms-office365-filtering-correlation-id: c5d44fe2-c39a-4272-acd9-08d80ccf0422
x-ms-traffictypediagnostic: MWHPR11MB1774:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB177465A440C50FF47FE95C2B8C820@MWHPR11MB1774.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7osdBp6JkRa9iE3N46OA/qGUjzCdUZgrLikmGNRGX/e8wtQBAHWARzC3Fi7VF6lfsrv1vSbdly3HbG23AX9vRcAsR7VnEulBeGFUSFZSEPh8t5eKnrxFWwzqGVdgSLXMRo4RtdArkYI0C2Fd3LutSjfR4zd/1cuFa5r22a/J4pXBnVQAMJA4o799Pu9jDo+jMG3Ve5afox8m/PE+PA5mqaUs3QsZMXwLWyHqcyUr3RDp1jrUnzHcVvWiYEV/wDYm+4SDdx8sBk10tQK78kWYCyHN6oANS/PndsyOHUBm7cRGEJrdTRQFVszODqABiKtvNeMZwiR46JrKRb10BP6CKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(8936002)(66556008)(26005)(64756008)(76116006)(55016002)(9686003)(4326008)(7696005)(86362001)(52536014)(66446008)(66946007)(186003)(33656002)(6506007)(8676002)(5660300002)(2906002)(66476007)(83380400001)(7416002)(110136005)(54906003)(316002)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LXrQonLWRzS5NbWUbLDZ3hoUbYwdIk6Al5k5MDSd2S8NwJry+h57G5diEXGZ8243f+jycNKzW24XyyVGveY3LLCm4VFZaQx3r+mIV3+Nyr8VwLi3jKWYlMXj4kzXs/0SxhH7CvrLz4PW0LXG7uC66mjqrm6b9uxMQ+CMZk1ktx7kSUVa55JJ0WdpFZk8QZEYuTZgXDGlyDNaR07F49xtoD8t2+J+D2X8EcZJxMEEW0pKkx6ZQn4ERDM37ZtrRsoJQTY3H+Qz83tdg55+KM6WUuuSFrbzZ8H3jpK1VGJtbCQVf4DQUw73/3GgryHY14AMpO69C5M2+cIw8b8Nvy5cKUaGspQD9j4X2rAJA7lk1pd1Wv4O8MfCHj2AnJfCcvsFsjWFbFSKXyR4eG+OW+hRaNiSpQFUfEsibWrmdhV9e9c+KIud3cJk0ldcETLkwgURm2sG89B8nTCQfpwOJcHgIon2HGPrAQMnFiVu6YFU24U=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d44fe2-c39a-4272-acd9-08d80ccf0422
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 23:44:13.8545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vz7crzeNVH68wNuVr2sJkw5dN6h+fgrcOp5LeTyaU7stG/yscRRqOnZD1bmfmrfQgA1IvE61bQQNxXkqdUfczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1774
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

PiBGcm9tOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgSnVuZSAxLCAyMDIwIDk6MjIgUE0NCj4gDQo+IFdoZW4gcnVubmluZyBWTSBmb3Jr
cyB3aXRob3V0IGRldmljZSBtb2RlbHMgKFFFTVUpLCBpdCBtYXkNCj4gYmUgdW5kZXNpcmFibGUg
Zm9yIFhlbiB0byBpbmplY3QgaW50ZXJydXB0cy4gV2hlbiBjcmVhdGluZyBzdWNoIGZvcmtzIGZy
b20NCj4gV2luZG93cyBWTXMgd2UgaGF2ZSBvYnNlcnZlZCB0aGUga2VybmVsIHRyeWluZyB0byBw
cm9jZXNzIGludGVycnVwdHMNCj4gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGZvcmsgaXMgZXhlY3V0
ZWQuIEhvd2V2ZXIgd2l0aG91dCBRRU1VIHJ1bm5pbmcgc3VjaA0KPiBpbnRlcnJ1cHQgaGFuZGxp
bmcgbWF5IG5vdCBiZSBwb3NzaWJsZSBiZWNhdXNlIGl0IG1heSBhdHRlbXB0IHRvIGludGVyYWN0
DQo+IHdpdGgNCj4gZGV2aWNlcyB0aGF0IGFyZSBub3QgZW11bGF0ZWQgYnkgYSBiYWNrZW5kLiBJ
biB0aGUgYmVzdCBjYXNlIHNjZW5hcmlvIHN1Y2gNCg0KSSBhc2tlZCB0aGlzIHF1ZXN0aW9uIGJl
Zm9yZS4gdGhlIGludGVycnVwdHMgY291bGQgY29tZSBmcm9tIFhlbiBpdHNlbGYsIGUuZy4NCmR1
ZSB0byB0aW1lciB2aXJ0dWFsaXphdGlvbi4gU28gSSBkaWRuJ3QgZ2V0IHdoeSBpdCdzIGRlc2ly
ZWQgdG8gYmxvY2sgYWxsIGludGVycnVwdHMNCmp1c3QgYmVjYXVzZSBubyBRRU1VIGlzIHJ1bm5p
bmcuIEFsc28gaXQncyB3ZWlyZCB3aHkgV2luZG93cyBWTXMgYXJlDQpvYnNlcnZlZCB0byBwcm9j
ZXNzIGludGVycnVwdHMgdGhhdCBhcmUgZ2VuZXJhdGVkIGJ5IFFFTVUgd2hlbiBubyBzdWNoDQpi
YWNrZW5kIGVtdWxhdGlvbiBleGlzdHMgYXQgYWxsLiBJdCBzb3VuZHMgbGlrZSBhIHdvcmthcm91
bmQgaW5zdGVhZCBvZiBhIHJlYWwNCmZpeC4uLg0KDQoNCj4gaW50ZXJydXB0IGhhbmRsaW5nIHdv
dWxkIG9ubHkgcHJlc2VudCBhIGRldG91ciBpbiB0aGUgVk0gZm9ya3MnIGV4ZWN1dGlvbg0KPiBm
bG93LCBidXQgaW4gdGhlIHdvcnN0IGNhc2UgYXMgd2UgYWN0dWFsbHkgb2JzZXJ2ZWQgY2FuIGNv
bXBsZXRlbHkgc3RhbGwgaXQuDQo+IEJ5IGRpc2FibGluZyBpbnRlcnJ1cHQgaW5qZWN0aW9uIGEg
ZnV6emVyIGNhbiBleGVyY2lzZSB0aGUgdGFyZ2V0IGNvZGUgd2l0aG91dA0KPiBpbnRlcmZlcmVu
Y2UuIEZvciBvdGhlciB1c2UtY2FzZXMgdGhpcyBvcHRpb24gcHJvYmFibHkgZG9lc24ndCBtYWtl
IHNlbnNlLA0KPiB0aGF0J3Mgd2h5IHRoaXMgaXMgbm90IGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4g
DQo+IEZvcmtzICYgbWVtb3J5IHNoYXJpbmcgYXJlIG9ubHkgYXZhaWxhYmxlIG9uIEludGVsIENQ
VXMgc28gdGhpcyBvbmx5IGFwcGxpZXMNCj4gdG8gdm14LiBOb3RlIHRoYXQgdGhpcyBpcyBwYXJ0
IG9mIHRoZSBleHBlcmltZW50YWwgVk0gZm9ya2luZyBmZWF0dXJlIHRoYXQncw0KPiBjb21wbGV0
ZWx5IGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5kIGNhbiBvbmx5IGJlIGVuYWJsZWQgYnkgdXNpbmcN
Cj4gWEVOX0NPTkZJR19FWFBFUlQgZHVyaW5nIGNvbXBpbGUgdGltZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+IFJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+
ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMgICAgICB8IDYgKysrKysrDQo+ICB4ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYyAgICB8IDYgKysrKystDQo+ICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9kb21haW4uaCB8IDIgKy0NCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCAg
ICAgIHwgMyArKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL3ZteC9pbnRyLmMNCj4gaW5kZXggMDAwZTE0YWY0OS4uODBiZmJi
NDc4NyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvaW50ci5jDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vdm14L2ludHIuYw0KPiBAQCAtMjU2LDYgKzI1NiwxMiBAQCB2b2lk
IHZteF9pbnRyX2Fzc2lzdCh2b2lkKQ0KPiAgICAgIGlmICggdW5saWtlbHkodi0+YXJjaC52bV9l
dmVudCkgJiYgdi0+YXJjaC52bV9ldmVudC0+c3luY19ldmVudCApDQo+ICAgICAgICAgIHJldHVy
bjsNCj4gDQo+ICsjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HDQo+ICsgICAgLyogQmxvY2sgZXZl
bnQgaW5qZWN0aW9uIGZvciBWTSBmb3JrIGlmIHJlcXVlc3RlZCAqLw0KPiArICAgIGlmICggdW5s
aWtlbHkodi0+ZG9tYWluLT5hcmNoLmh2bS5tZW1fc2hhcmluZy5ibG9ja19pbnRlcnJ1cHRzKSAp
DQo+ICsgICAgICAgIHJldHVybjsNCj4gKyNlbmRpZg0KPiArDQo+ICAgICAgLyogQ3JhbmsgdGhl
IGhhbmRsZSBvbiBpbnRlcnJ1cHQgc3RhdGUuICovDQo+ICAgICAgcHRfdmVjdG9yID0gcHRfdXBk
YXRlX2lycSh2KTsNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYw0KPiBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+IGluZGV4IDE5OTIyYWI1
ZDEuLmM0MjhmZDE2Y2UgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmlu
Zy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+IEBAIC0yMTA2LDcg
KzIxMDYsOCBAQCBpbnQNCj4gbWVtX3NoYXJpbmdfbWVtb3AoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fbWVtX3NoYXJpbmdfb3ANCj4gX3QpIGFyZykNCj4gICAgICAgICAgcmMgPSAtRUlOVkFM
Ow0KPiAgICAgICAgICBpZiAoIG1zby51LmZvcmsucGFkICkNCj4gICAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPiAtICAgICAgICBpZiAoIG1zby51LmZvcmsuZmxhZ3MgJiB+WEVOTUVNX0ZPUktfV0lU
SF9JT01NVV9BTExPV0VEICkNCj4gKyAgICAgICAgaWYgKCBtc28udS5mb3JrLmZsYWdzICYNCj4g
KyAgICAgICAgICAgICB+KFhFTk1FTV9GT1JLX1dJVEhfSU9NTVVfQUxMT1dFRCB8DQo+IFhFTk1F
TV9GT1JLX0JMT0NLX0lOVEVSUlVQVFMpICkNCj4gICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiAN
Cj4gICAgICAgICAgcmMgPSByY3VfbG9ja19saXZlX3JlbW90ZV9kb21haW5fYnlfaWQobXNvLnUu
Zm9yay5wYXJlbnRfZG9tYWluLA0KPiBAQCAtMjEzNCw2ICsyMTM1LDkgQEAgaW50DQo+IG1lbV9z
aGFyaW5nX21lbW9wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbV9zaGFyaW5nX29wDQo+
IF90KSBhcmcpDQo+ICAgICAgICAgICAgICByYyA9IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0
aW9uKF9fSFlQRVJWSVNPUl9tZW1vcnlfb3AsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJsaCIsIFhFTk1FTV9zaGFyaW5nX29wLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmcpOw0KPiArICAgICAg
ICBlbHNlIGlmICggIXJjICYmIChtc28udS5mb3JrLmZsYWdzICYNCj4gWEVOTUVNX0ZPUktfQkxP
Q0tfSU5URVJSVVBUUykgKQ0KPiArICAgICAgICAgICAgZC0+YXJjaC5odm0ubWVtX3NoYXJpbmcu
YmxvY2tfaW50ZXJydXB0cyA9IHRydWU7DQo+ICsNCj4gICAgICAgICAgcmN1X3VubG9ja19kb21h
aW4ocGQpOw0KPiAgICAgICAgICBicmVhazsNCj4gICAgICB9DQo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCBiL3hlbi9pbmNsdWRlL2FzbS0NCj4geDg2L2h2
bS9kb21haW4uaA0KPiBpbmRleCA5NWZlMThjZGRjLi45ZDI0N2JhZjRkIDEwMDY0NA0KPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9kb21haW4uaA0KPiBAQCAtNjcsNyArNjcsNyBAQCBzdHJ1Y3QgaHZtX2lvcmVx
X3NlcnZlciB7DQo+ICAjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HDQo+ICBzdHJ1Y3QgbWVtX3No
YXJpbmdfZG9tYWluDQo+ICB7DQo+IC0gICAgYm9vbCBlbmFibGVkOw0KPiArICAgIGJvb2wgZW5h
YmxlZCwgYmxvY2tfaW50ZXJydXB0czsNCj4gDQo+ICAgICAgLyoNCj4gICAgICAgKiBXaGVuIHJl
bGVhc2luZyBzaGFyZWQgZ2ZuJ3MgaW4gYSBwcmVlbXB0aWJsZSBtYW5uZXIsIHJlY2FsbCB3aGVy
ZQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oIGIveGVuL2luY2x1
ZGUvcHVibGljL21lbW9yeS5oDQo+IGluZGV4IGRiZDM1MzA1ZGYuLjg1MGJkNzJjNTIgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvbWVtb3J5LmgNCj4gQEAgLTUzNiw3ICs1MzYsMTAgQEAgc3RydWN0IHhlbl9tZW1f
c2hhcmluZ19vcCB7DQo+ICAgICAgICAgIH0gZGVidWc7DQo+ICAgICAgICAgIHN0cnVjdCBtZW1f
c2hhcmluZ19vcF9mb3JrIHsgICAgICAvKiBPUF9GT1JLICovDQo+ICAgICAgICAgICAgICBkb21p
ZF90IHBhcmVudF9kb21haW47ICAgICAgICAvKiBJTjogcGFyZW50J3MgZG9tYWluIGlkICovDQo+
ICsvKiBPbmx5IG1ha2VzIHNlbnNlIGZvciBzaG9ydC1saXZlZCBmb3JrcyAqLw0KPiAgI2RlZmlu
ZSBYRU5NRU1fRk9SS19XSVRIX0lPTU1VX0FMTE9XRUQgKDF1IDw8IDApDQo+ICsvKiBPbmx5IG1h
a2VzIHNlbnNlIGZvciBzaG9ydC1saXZlZCBmb3JrcyAqLw0KPiArI2RlZmluZSBYRU5NRU1fRk9S
S19CTE9DS19JTlRFUlJVUFRTICAgKDF1IDw8IDEpDQo+ICAgICAgICAgICAgICB1aW50MTZfdCBm
bGFnczsgICAgICAgICAgICAgICAvKiBJTjogb3B0aW9uYWwgc2V0dGluZ3MgKi8NCj4gICAgICAg
ICAgICAgIHVpbnQzMl90IHBhZDsgICAgICAgICAgICAgICAgIC8qIE11c3QgYmUgc2V0IHRvIDAg
Ki8NCj4gICAgICAgICAgfSBmb3JrOw0KPiAtLQ0KPiAyLjI1LjENCg0K


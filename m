Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D79277972
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 21:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLX2S-0000dw-H2; Thu, 24 Sep 2020 19:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=18qK=DB=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kLX2R-0000dr-Mq
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 19:36:19 +0000
X-Inumbo-ID: 537f1d1d-21ba-4e7a-8d2e-cd1d2e263e0f
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 537f1d1d-21ba-4e7a-8d2e-cd1d2e263e0f;
 Thu, 24 Sep 2020 19:36:16 +0000 (UTC)
IronPort-SDR: 6iK2HvoUhI1I5IWgkEk7FN5tW4zFeuC2fZkAYHebepYcb09TkiizozBRwC3jLEFS1QUKYxlVs7
 KKj5RSMQuptg==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158670360"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="158670360"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 12:36:14 -0700
IronPort-SDR: 30Sku2KlS8rKIfLMYaZe1JzRMDJWqYOp85nwu9fjS9Ju2aUVndZ1SYF6/1BXRxvwXeLMtOSETZ
 3/FFikbc8dxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="339180928"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 24 Sep 2020 12:36:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 24 Sep 2020 12:36:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 24 Sep 2020 12:36:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 24 Sep 2020 12:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW18xeKW9+mMFLXrMV675Vnzm6i0yhobxcdPfLMta+N5PfHVJ5m/oOXPfWVa4Ftfyb/FMkDewoTAhx8PoWwysqnjFnTUHE7OPax2b4EAxzqMnAdmDV6+Np5QwSdW+x1GD7svvxA0CDTtnDNi+nXkUFUE5wLzxLvbkqm/Dwf/qcwj71XCYlz5ULnxHGPhH7vAQ4Bvtugg/EfC5h+KkUaKVBq6CPFs2x71SW6rCT9iqzop5nEdhGAtxWZ+WRezWm8sT2c4SXXl8YC8bnaZiY8HsclAjTdYI/SHFqiUwEFjV7HIlUeUxdzb5csIgz1g2ndZYR4FbYI6RNCd1/B6d/TsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nwqq6tFkkgRoefr2VPOSY407tkL0byfIZ5erHKuujE=;
 b=ffjY2BEcZBH+E0VEume1j/+1gm0rJuma5t6r1oVh1SwuprIurVW9Hx0Y5xQGM+ehvI1ox1eSiL5yrUW4HKeI1K/H5EHLRUQDmnIGd5oy2txvypuF/U/Q4jl0ePRu4t9+EoJ0p9RFzs1AdEq4HSgPgBcux4UlaC/siqvAgKjdoEp5JhyzXti2kjYTeWk8jQeb025L4xguVD6/jcqBWf4XvKY9uYkpPwg2v/SvjSaKX4U7mPfoBYxZ9Z/iy2yikPVRNiB/t16G6qGbfhdD46yimFC9UakPdWac8OC/+sZCHzZxQTHunAXpT9jpMyMGvfuWtCOnpgCCUZDeVMwX3HQmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nwqq6tFkkgRoefr2VPOSY407tkL0byfIZ5erHKuujE=;
 b=Frte1s8ipLGuqAX17VjgWdEf5p20rANL0XbOIEazp0ZsbgJlGgXIlqdBpXWRzIELgcOELsqHxsNdi/gJlqtuSbAFZirrfiZx+yYooPtBKXmyk9MLe5TXkrhy6YOPnaFdJLD1gTseT1SvOpHOZ6zauH8o0K2VJMhPTv5n1WUdkQk=
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1366.namprd11.prod.outlook.com (2603:10b6:903:2b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Thu, 24 Sep
 2020 19:36:12 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa%7]) with mapi id 15.20.3326.030; Thu, 24 Sep 2020
 19:36:12 +0000
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v9 0/8] domain context infrastructure
Thread-Topic: [PATCH v9 0/8] domain context infrastructure
Thread-Index: AQHWknRuHXFGg/c6C0CkM2JZfSFRjal4LpeA
Date: Thu, 24 Sep 2020 19:36:12 +0000
Message-ID: <CY4PR11MB0056034DE1EE8445CE816494FB390@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <20200924131030.1876-1-paul@xen.org>
In-Reply-To: <20200924131030.1876-1-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46a4bd9b-e57f-4390-4d2e-08d860c11808
x-ms-traffictypediagnostic: CY4PR11MB1366:
x-microsoft-antispam-prvs: <CY4PR11MB13662CB7EDDD7081DECE980BFB390@CY4PR11MB1366.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h11EoHbGxVXl5OLgL289rxdamSsL+domPBMKBeujtvPqdGMs7IrfcHyQuDDduFB3KDuzwpLulO0XvMJ8Rpk10QBdmrtL6Xnw7oO8F152n2I3YgXBx3X5N4ixBLxFShEe8Vi8NkgnI0U9CDCb5uppog/v+0NUfNuHJK1+L5I68p3w2KBaJ25OgyOba5kVybLAgtYwXJrbvzvcZNeqlJY84NapgnNKc2clt9tJJWo/jooA4bZv8iS1CTk09a539GdQ2lb56GteEPP/ZIYWQYkqjJcIhqfkrYkQ5+fwqDZMs/hVc+z5own8wRT4J4TNer+DYtAPnZ1kEWUwUWtWNAAhGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(71200400001)(33656002)(76116006)(7696005)(54906003)(478600001)(55016002)(86362001)(110136005)(5660300002)(66946007)(52536014)(9686003)(4326008)(316002)(66574015)(7416002)(83380400001)(8936002)(186003)(66446008)(66556008)(64756008)(53546011)(26005)(6506007)(66476007)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OxyzQE80B8rK6SiXgO/tfG+nIkkwLZWBCbQ6AaHXtyvsAhAE3c5g/1u4EeXVC8pFLg3Iabu+7sQ1ZthfxUWACBAgtLehI7V3kLFDGl9KYvoxNjUT7j4eED1B23NTm7XgH4cTyQATEGTTKKbIRVxamkGv5yu3bQQK6t7QQB4+gBIhQSxTpaclL3JCIAlanGOTwpFPX21PCRP0bgrHtV9NEnnK3ngulMIpQP4WXpLDTFXEWLFTjBDpaCFUi+DJcbdydt6R3Q8VzB2bQJTo/09R4oL985wHg/RUyQLVn6hR0T4rCyLDfbswFI09wo/Wy8DtfqKODy2Yd+7lqx8ooc80gsiO8lQ65oYZRWhcbH56178b8myi9QR4hxJwvUFp3lhGPC9CTjZ1qUOIDH5gxwnEg35+YyQZiGItHBpI3wpRMU2Lj8BzzQUvB/0tKUuUsvH/KQiH5ccjLAD4SmNu6cBaIvbwGypiIye0SPzdBmPmmPBY7Q9YfzQVLQqdDH+bu/m6R6lG0YrEOwJPnM22mlxh3acHgPQghUW8zw/XW1aTYUetrFUJdyxDnxzDuqXrAUTFENih8vOpW4fY6PZGtMaYeOPBLyKfba+r8xdlOD5tVJV3+yF+vTR932B19dsPti6o+fYQnr3l8RU5fKX3R1qhJw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a4bd9b-e57f-4390-4d2e-08d860c11808
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 19:36:12.0347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBy9k+Te2jG2YbvXHza9DbxifDb341mrgVH6JOix2TtvavN9J3VxXJcjSu4CXBXIztw/mw9/LSa1iDcNShpMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1366
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFBhdWwNCj4g
RHVycmFudA0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI0LCAyMDIwIDk6MTAgQU0NCj4g
VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PjsNCj4gR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbkB4ZW4ub3JnPjsgTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpDQo+IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPjsgUm9nZXIgUGF1IE1v
bm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNo
dWtAZXBhbS5jb20+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
djkgMC84XSBkb21haW4gY29udGV4dCBpbmZyYXN0cnVjdHVyZQ0KPiANCj4gRnJvbTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiANCj4gUGF1bCBEdXJyYW50ICg4KToNCj4g
ICB4ZW4vY29tbW9uOiBpbnRyb2R1Y2UgYSBuZXcgZnJhbWV3b3JrIGZvciBzYXZlL3Jlc3RvcmUg
b2YgJ2RvbWFpbicNCj4gICAgIGNvbnRleHQNCj4gICB4ZW4vY29tbW9uL2RvbWN0bDogaW50cm9k
dWNlIFhFTl9ET01DVExfZ2V0L3NldGRvbWFpbmNvbnRleHQNCj4gICB0b29scy9taXNjOiBhZGQg
eGVuLWRvbWN0eCB0byBwcmVzZW50IGRvbWFpbiBjb250ZXh0DQo+ICAgZG9jcy9zcGVjczogYWRk
IG1pc3NpbmcgZGVmaW5pdGlvbnMgdG8gbGlieGMtbWlncmF0aW9uLXN0cmVhbQ0KPiAgIGRvY3Mg
LyB0b29sczogc3BlY2lmaWMgbWlncmF0aW9uIHY0IHRvIGluY2x1ZGUgRE9NQUlOX0NPTlRFWFQN
Cj4gICBjb21tb24vZG9tYWluOiBhZGQgYSBkb21haW4gY29udGV4dCByZWNvcmQgZm9yIHNoYXJl
ZF9pbmZvLi4uDQo+ICAgeDg2L3RpbWU6IGFkZCBhIGRvbWFpbiBjb250ZXh0IHJlY29yZCBmb3Ig
dHNjX2luZm8uLi4NCj4gICB0b29scy9saWJ4YzogYWRkIERPTUFJTl9DT05URVhUIHJlY29yZHMg
dG8gdGhlIG1pZ3JhdGlvbiBzdHJlYW0uLi4NCg0KDQpIaSBQYXVsLA0KQ291bGQgeW91IHB1c2gg
YSBnaXQgYnJhbmNoIHNvbWV3aGVyZSBmb3IgdGhpcyBzZXJpZXM/IEkgd291bGQgbGlrZSB0byBz
ZWUgdGhpcyBiZWluZyBpbnRlZ3JhdGVkIHdpdGggVk0gZm9ya2luZyBhbmQgaWYgaXRzIG5vdCB0
b28gbXVjaCBlZmZvcnQganVzdCBjcmVhdGUgdGhlIHBhdGNoIGZvciB0aGF0IHNvIHRoYXQgaXQg
Y291bGQgYmUgYXBwZW5kZWQgdG8gdGhlIHNlcmllcy4NCg0KVGhhbmtzLA0KVGFtYXMNCg==


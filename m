Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA42444A6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 07:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Saj-0006c8-GX; Fri, 14 Aug 2020 05:49:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6Sah-0006c3-Io
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 05:49:23 +0000
X-Inumbo-ID: 5bc43d4e-adae-4cb8-9689-f6e190884ccb
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bc43d4e-adae-4cb8-9689-f6e190884ccb;
 Fri, 14 Aug 2020 05:49:21 +0000 (UTC)
IronPort-SDR: KfBgkyjYYju6SLXFkZU5Ngst67CZ/WdbAq7KuC1y/vST+XgBz5+KU4Iy/iGvVIPfpxBcYEy2eg
 eo7fvs+PpPFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="154324499"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="154324499"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 22:49:19 -0700
IronPort-SDR: /gsQ8DMMYbAoqH3NRVUQyoJiIrWfyf7ex2Z4g4ZpDbVw/gdhzKP9lrbBwEMxiRwHSHKvDwGpS/
 9rtBjurtLBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="333325952"
Received: from orsmsx601-2.jf.intel.com (HELO ORSMSX601.amr.corp.intel.com)
 ([10.22.229.81])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2020 22:49:19 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 22:49:19 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 22:49:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Aug 2020 22:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrvnW5oEKsWuaSZ+uvZli4FwWYeQGXkb0Q7dwFP6vN7WTSGm8MsE3swaMdxKKHcpjFq4tkX/LCEEC9ou5+KTNA/T1RCXkSXq4+kL4o2m2rDizQERamBjXTK6Gspjv+gvt5OQgu7qPPkHw1Kdkh8MvAwzGf1sDcilOh6u43hpgV48EFYBwIewcDyFtyQJDC+ykIVQIxMRbl0pmNPN2C7RNPk+zm13xHkD0qydp/4diKW8jemg+H7RSCOcXHPIFsggJvkiAn1q6ev3HLMYkjIns4EHog+AOQO/NZXSIEVBA2UjooYrHCS48OqEqWXz0PEPRoQvMjqiLXhtVLYujht11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIxBSQI7msz/K/WRvG6Tlv1HtvoGGDXamqo4cesr+/c=;
 b=LZVf6Bhl3JkDwYdry7gFnj4Mg8Z0GrrtoLje3T7zoiBwUrj0iJmumOjLB9A5bVS5GNlX7LSMuz0EtfNsqcr2kT0VQ23rPnaORkxPcr/lI3gaBXawtaby4EcYHyzzHUyhW4Woq6xFrbMtBrtHFhTlPAAiPe0DZBRoMIi18BaAYcQlZqhHBf9AUafoDjx9KU3CZ1RIYECc7cNyDbdbl+ooiRrUskYWGhW/pU2NKmi5YABI78Sy/+dAncgAAeGouQZ9+hrjAGJTQlouUEWgwLvM7ojmpQjyi01Mp8u4IGmubo+bcFPqHVlpMI5E8SmGffL6sSY9HtfgJ0mm4WUU1Xdl3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIxBSQI7msz/K/WRvG6Tlv1HtvoGGDXamqo4cesr+/c=;
 b=uzMvq7yuiIm6JWX/aYp8iuE89hYaUQS71X1yPJtjb/zpd71pXa7L6YuShtV4U7Ojd9FVRm+XvGV76AhBzMajBvtCkhh4PtwG2AKJIO7XsFjs4+sBkS3HetadKHpDinyf5OUpkeHr/0LlimmOOizjOQ00r2Vz9J4Y+c8Z/npTb5M=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1390.namprd11.prod.outlook.com (2603:10b6:300:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 05:49:08 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 05:49:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] x86/vmx: reorder code in vmx_deliver_posted_intr
Thread-Topic: [PATCH] x86/vmx: reorder code in vmx_deliver_posted_intr
Thread-Index: AQHWZnpX5qSV7E8ra0mIfy49Y9eyi6k3MDJw
Date: Fri, 14 Aug 2020 05:49:08 +0000
Message-ID: <MWHPR11MB16458D33512361590748B1DA8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200730140309.59916-1-roger.pau@citrix.com>
In-Reply-To: <20200730140309.59916-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8acbe42-4ce5-4cbd-afe1-08d84015c318
x-ms-traffictypediagnostic: MWHPR11MB1390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1390B72E804B2583165566D38C400@MWHPR11MB1390.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hLm0BgUzyxZmN6GAKcIzTncL8vJI52nXET9G1F+XeLYSe6j02+ZzlY/KG4CaSx6D21bc+ANzBwDDQGrFdSw7wwaTa16xvvvafaV5MI3t0Pfkh+00cqdLyn0Kcz059q4EZgbnviDt06eQvkWHZFrZuSWz8asz1vTLZ/5VIa6scEzuMqNzOnqZ7WGqA2ICJPoncEhh5STiJFS43JZfU0lrLxETFNYAFlg5Kn2pkI73WNdp2Z6BzBm/Y5iyQLrz9NHMxijHEdggxt1o1XtI6KrZ2mm0gW9kqUIYdVeY7h+m9UtkUuykjUsNOFElxvEA781pmA/nqE98EYVwLjAER8oGvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(8936002)(8676002)(110136005)(33656002)(316002)(9686003)(71200400001)(54906003)(6506007)(26005)(7696005)(186003)(55016002)(4326008)(66476007)(86362001)(478600001)(76116006)(83380400001)(2906002)(66446008)(66946007)(66556008)(64756008)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AmLEt/K4bWSffYQh/iMRcrtyHPTjhcsLYkBK2h/I0xdYlBrJpzZV7yum9SDaqcS9RvCsTHDSRXJS8Sp2lNSle0kDGDJbweeI4UjlvITUeK1ac9SvbP+wTXSbVxOqXUZ3t/bHEX8yQ1AmDduDm3b+kpOnGGgT0/0k7fo8bOcwJgiRuTQ2UZKM7JsIzipebbhe/URe+pbbp7mBlqJl2OGaCb+vSHJrkfdPbYWAuEFST45e8cvrDpx2iJ66b+DCuyh+n264uc1T+a1DEOqgDcGltJxEKvd5xVu6OpEAUzan4QnH4Wj2k70TzKen/qYdt1Cq0yKSUFTJrthClOqtRmV+rIWCU/bQGXzqGuYlp9yLs9nUEozGFlfL6YEWh7R+FBmLr+zAe0X5NxymnQNu5o3yzXPysEQgAfdNKpE8kK6kGmUvLPeLsBSKYqYU1NVzVS6IhpW//3Rlj9MBo/Pyy1USon2HYgGqLS48MGVBCgjoIoJCAA65MiLUJyK4BDKkBx6r6EjB/m3rJqjRGmTumbOQWNnxdbd9sGCtxQqPy/x/wfwmYS9YsWxRYK9hwq7TD0USzFxJJZZeuCz4fPE2GtVjkipFxaiRqyQkhIXOTTzn3/mTYw2QPK7pwlKJdW4eWJIONd4XbCW9uWHU1RcD1p1ezQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8acbe42-4ce5-4cbd-afe1-08d84015c318
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 05:49:08.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/zGRtUXSg7s9IEXHrCkH59IxOg0H1a3XjMKlpRPSTHHEYPRTbNIXeb6A+4UnFhKn053MdaUUfJdB20zIaaGgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1390
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgSnVseSAzMCwgMjAyMCAxMDowMyBQTQ0KPiANCj4gUmVtb3ZlIHRoZSB1bm5lZWRl
ZCBlbHNlIGJyYW5jaCwgd2hpY2ggYWxsb3dzIHRvIHJlZHVjZSB0aGUNCj4gaW5kZW50YXRpb24g
b2YgYSBsYXJnZXIgYmxvY2sgb2YgY29kZSwgd2hpbGUgbWFraW5nIHRoZSBmbG93IG9mIHRoZQ0K
PiBmdW5jdGlvbiBtb3JlIG9idmlvdXMuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+DQoNCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDU1ICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBpbmRleCBl
YjU0YWFkZmJhLi43NzczZGNhZTFiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiBAQCAtMjAwMyw2
ICsyMDAzLDggQEAgc3RhdGljIHZvaWQgX192bXhfZGVsaXZlcl9wb3N0ZWRfaW50ZXJydXB0KHN0
cnVjdA0KPiB2Y3B1ICp2KQ0KPiANCj4gIHN0YXRpYyB2b2lkIHZteF9kZWxpdmVyX3Bvc3RlZF9p
bnRyKHN0cnVjdCB2Y3B1ICp2LCB1OCB2ZWN0b3IpDQo+ICB7DQo+ICsgICAgc3RydWN0IHBpX2Rl
c2Mgb2xkLCBuZXcsIHByZXY7DQo+ICsNCj4gICAgICBpZiAoIHBpX3Rlc3RfYW5kX3NldF9waXIo
dmVjdG9yLCAmdi0+YXJjaC5odm0udm14LnBpX2Rlc2MpICkNCj4gICAgICAgICAgcmV0dXJuOw0K
PiANCj4gQEAgLTIwMTQsNDEgKzIwMTYsMzYgQEAgc3RhdGljIHZvaWQgdm14X2RlbGl2ZXJfcG9z
dGVkX2ludHIoc3RydWN0IHZjcHUNCj4gKnYsIHU4IHZlY3RvcikNCj4gICAgICAgICAgICogVk1F
bnRyeSBhcyBpdCB1c2VkIHRvIGJlLg0KPiAgICAgICAgICAgKi8NCj4gICAgICAgICAgcGlfc2V0
X29uKCZ2LT5hcmNoLmh2bS52bXgucGlfZGVzYyk7DQo+ICsgICAgICAgIHZjcHVfa2ljayh2KTsN
Cj4gKyAgICAgICAgcmV0dXJuOw0KPiAgICAgIH0NCj4gLSAgICBlbHNlDQo+IC0gICAgew0KPiAt
ICAgICAgICBzdHJ1Y3QgcGlfZGVzYyBvbGQsIG5ldywgcHJldjsNCj4gDQo+IC0gICAgICAgIHBy
ZXYuY29udHJvbCA9IHYtPmFyY2guaHZtLnZteC5waV9kZXNjLmNvbnRyb2w7DQo+ICsgICAgcHJl
di5jb250cm9sID0gdi0+YXJjaC5odm0udm14LnBpX2Rlc2MuY29udHJvbDsNCj4gDQo+IC0gICAg
ICAgIGRvIHsNCj4gLSAgICAgICAgICAgIC8qDQo+IC0gICAgICAgICAgICAgKiBDdXJyZW50bHks
IHdlIGRvbid0IHN1cHBvcnQgdXJnZW50IGludGVycnVwdCwgYWxsDQo+IC0gICAgICAgICAgICAg
KiBpbnRlcnJ1cHRzIGFyZSByZWNvZ25pemVkIGFzIG5vbi11cmdlbnQgaW50ZXJydXB0LA0KPiAt
ICAgICAgICAgICAgICogQmVzaWRlcyB0aGF0LCBpZiAnT04nIGlzIGFscmVhZHkgc2V0LCBubyBu
ZWVkIHRvDQo+IC0gICAgICAgICAgICAgKiBzZW50IHBvc3RlZC1pbnRlcnJ1cHRzIG5vdGlmaWNh
dGlvbiBldmVudCBhcyB3ZWxsLA0KPiAtICAgICAgICAgICAgICogYWNjb3JkaW5nIHRvIGhhcmR3
YXJlIGJlaGF2aW9yLg0KPiAtICAgICAgICAgICAgICovDQo+IC0gICAgICAgICAgICBpZiAoIHBp
X3Rlc3Rfc24oJnByZXYpIHx8IHBpX3Rlc3Rfb24oJnByZXYpICkNCj4gLSAgICAgICAgICAgIHsN
Cj4gLSAgICAgICAgICAgICAgICB2Y3B1X2tpY2sodik7DQo+IC0gICAgICAgICAgICAgICAgcmV0
dXJuOw0KPiAtICAgICAgICAgICAgfQ0KPiAtDQo+IC0gICAgICAgICAgICBvbGQuY29udHJvbCA9
IHYtPmFyY2guaHZtLnZteC5waV9kZXNjLmNvbnRyb2wgJg0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICB+KCgxIDw8IFBPU1RFRF9JTlRSX09OKSB8ICgxIDw8IFBPU1RFRF9JTlRSX1NOKSk7
DQo+IC0gICAgICAgICAgICBuZXcuY29udHJvbCA9IHYtPmFyY2guaHZtLnZteC5waV9kZXNjLmNv
bnRyb2wgfA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAoMSA8PCBQT1NURURfSU5UUl9P
Tik7DQo+ICsgICAgZG8gew0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBDdXJyZW50bHks
IHdlIGRvbid0IHN1cHBvcnQgdXJnZW50IGludGVycnVwdCwgYWxsDQo+ICsgICAgICAgICAqIGlu
dGVycnVwdHMgYXJlIHJlY29nbml6ZWQgYXMgbm9uLXVyZ2VudCBpbnRlcnJ1cHQsDQo+ICsgICAg
ICAgICAqIEJlc2lkZXMgdGhhdCwgaWYgJ09OJyBpcyBhbHJlYWR5IHNldCwgbm8gbmVlZCB0bw0K
PiArICAgICAgICAgKiBzZW50IHBvc3RlZC1pbnRlcnJ1cHRzIG5vdGlmaWNhdGlvbiBldmVudCBh
cyB3ZWxsLA0KPiArICAgICAgICAgKiBhY2NvcmRpbmcgdG8gaGFyZHdhcmUgYmVoYXZpb3IuDQo+
ICsgICAgICAgICAqLw0KPiArICAgICAgICBpZiAoIHBpX3Rlc3Rfc24oJnByZXYpIHx8IHBpX3Rl
c3Rfb24oJnByZXYpICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgdmNwdV9raWNrKHYp
Ow0KPiArICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAgICB9DQo+IA0KPiAtICAgICAgICAg
ICAgcHJldi5jb250cm9sID0gY21weGNoZygmdi0+YXJjaC5odm0udm14LnBpX2Rlc2MuY29udHJv
bCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkLmNvbnRyb2wsIG5l
dy5jb250cm9sKTsNCj4gLSAgICAgICAgfSB3aGlsZSAoIHByZXYuY29udHJvbCAhPSBvbGQuY29u
dHJvbCApOw0KPiArICAgICAgICBvbGQuY29udHJvbCA9IHYtPmFyY2guaHZtLnZteC5waV9kZXNj
LmNvbnRyb2wgJg0KPiArICAgICAgICAgICAgICAgICAgICAgIH4oKDEgPDwgUE9TVEVEX0lOVFJf
T04pIHwgKDEgPDwgUE9TVEVEX0lOVFJfU04pKTsNCj4gKyAgICAgICAgbmV3LmNvbnRyb2wgPSB2
LT5hcmNoLmh2bS52bXgucGlfZGVzYy5jb250cm9sIHwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAoMSA8PCBQT1NURURfSU5UUl9PTik7DQo+IA0KPiAtICAgICAgICBfX3ZteF9kZWxpdmVyX3Bv
c3RlZF9pbnRlcnJ1cHQodik7DQo+IC0gICAgICAgIHJldHVybjsNCj4gLSAgICB9DQo+ICsgICAg
ICAgIHByZXYuY29udHJvbCA9IGNtcHhjaGcoJnYtPmFyY2guaHZtLnZteC5waV9kZXNjLmNvbnRy
b2wsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkLmNvbnRyb2wsIG5ldy5j
b250cm9sKTsNCj4gKyAgICB9IHdoaWxlICggcHJldi5jb250cm9sICE9IG9sZC5jb250cm9sICk7
DQo+IA0KPiAtICAgIHZjcHVfa2ljayh2KTsNCj4gKyAgICBfX3ZteF9kZWxpdmVyX3Bvc3RlZF9p
bnRlcnJ1cHQodik7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgdm14X3N5bmNfcGlyX3RvX2ly
cihzdHJ1Y3QgdmNwdSAqdikNCj4gLS0NCj4gMi4yOC4wDQoNCg==


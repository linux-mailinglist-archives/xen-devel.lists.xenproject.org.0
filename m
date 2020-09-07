Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CA25F212
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 05:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kF7s2-0005MO-PD; Mon, 07 Sep 2020 03:31:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tOn7=CQ=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kF7s1-0005MJ-4g
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 03:31:05 +0000
X-Inumbo-ID: 93acac6b-a2fa-41cb-b2c6-9dfd4f73bca4
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93acac6b-a2fa-41cb-b2c6-9dfd4f73bca4;
 Mon, 07 Sep 2020 03:31:03 +0000 (UTC)
IronPort-SDR: s64FGT0BLmX6ZIgZor0k/pUfeURIeApxhPTsXnjKcHafID2L0MxAGS0L51HC9jjxE8xgSZqOa/
 rkF7DMlZQ3tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="155352470"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="155352470"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 20:31:02 -0700
IronPort-SDR: U2H+2zCtJBM90BRp5hpAbUFsOEOq3DYW62PRaf+yiTBPxSWVaBytD5E2YgBu1SrZymWK/kH/wB
 SYKZPvXaV4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="333012151"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 06 Sep 2020 20:31:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Sep 2020 20:31:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 6 Sep 2020 20:31:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 6 Sep 2020 20:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV7IwdEjlNKEIEGQT1YFIL4Sc0+Jt8aMlDlYxGaae44wMOo5SbjPhWhf2+A1hVRUdv9RPTCsPtVwIT0oy0bdUn38A4yZx5LWyZM3e9cheui2UBTJ8LBlDoPB9HFsJaJAIZQBW0z6/sq5XnyuPMaAGYQ63hZXTYOZqkSxW/H2u7VahBE9cg60RENJcmaub7jmxiGuIILEKRVFi4G6v357flHrqa+7nKqeyjBdnMHD6eOfkz9ZgWLFjg360y6213FNtmtFcqjs58vKI2mgNmTF32XbfYXeUBosC2ZMsh5aEK/ijwcmLrFUBCKQReFBqtS3fH3F6gE5+60mMmLIXg8TCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJu3zgSMgbaYOWtOzxIAxcOYkxDPRp7NThIKfOGWrS4=;
 b=WO/rCFxPai8QfgGoPmptEHRQRWnJnbqrUCR1RIaHb97PcHjVOeyJCVZpTvMfU4FvfKPclUZRy3MN2mo+NeuVqa5dED9NM2jRdJdj6N357qpo717h20dQWrHyhdqDss4wGHohSmruyPqhIRh8A0+F8PPCMQOR4uSNFHvK/8IE5tV+PjqkD90c6fKxwzgw1gG1RNaMmYm6nHPqZfkPN3HWAkmwe8yVvMd4Bq/XKxoZ4GjvuACJoZ0mWGHJE83HEDCo0CqXHo/9e7gsS6SuyhirHUjOwSOJAEe1V/03CX9CCdHHYb/O23zPHjjztFd9eRQRvgIZBzYDbsq9AeoQYtGTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJu3zgSMgbaYOWtOzxIAxcOYkxDPRp7NThIKfOGWrS4=;
 b=FbsFkUSfvzKceIxKaDQK705Xo6f0d/5D0M1AWZtGWyXpDkFV/k+X84ih9bQI0KkR06TpNhkp2I/wrczwRJDVoBF9VGSpCdrstzqIUxLN+23tQxNpW1SzBeP6p8cXiWt3kgVTbqgX8WRwXSP9AjVRySgA9vUB9JnPZky1NOGXp2Q=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2288.namprd11.prod.outlook.com (2603:10b6:301:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 03:31:00 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 03:31:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
 <jun.nakajima@intel.com>
Subject: RE: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
Thread-Topic: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
Thread-Index: AQHWgFCN/0PpkCrt6kWmM/Y2GUOEPKlcjeBA
Date: Mon, 7 Sep 2020 03:31:00 +0000
Message-ID: <MWHPR11MB164533BD3F0F8E57A61BB7498C280@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-8-roger.pau@citrix.com>
In-Reply-To: <20200901105445.22277-8-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ec6fe02-d857-4384-ba9a-08d852de70f3
x-ms-traffictypediagnostic: MWHPR1101MB2288:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB228836CE103B7F9C3CE8016E8C280@MWHPR1101MB2288.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDxkp3QGgEXcJZKkHGnUpJ/8TRk8uXrww6s9arRCsY9QIO2zN6zvMJusM0xK9ov+3zA5P4m4b4onU8AApcolRpPDJEHDzbQRpgPAbKEZyKJJTI5egmBDItsp6SM/SgcjW2QUKrC8x7SU6ADpj4Qb87hwD2zJPR0BL03ll6hTBTVIdcWdkThLBCepEYb3U4lAR+2cS0ODhKoGUTMGjkPJyj9hYqOlN16jh40HAZ4zxVEXKeMBNKL00dpXrjeTD8MElRpAaXE9q72FMl2Y3B9o7YoBEKrBAMIqoNMv6o38G3xvHRv3qiXCqK8Rhd9vwZnx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(107886003)(83380400001)(478600001)(2906002)(316002)(110136005)(33656002)(54906003)(8676002)(55016002)(9686003)(8936002)(4326008)(66446008)(52536014)(66476007)(5660300002)(66946007)(66556008)(7696005)(6506007)(64756008)(76116006)(86362001)(186003)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FPJ4bVD5zopJ20+l62XYBrNVLZWQHy+QS5rpbjTxazw4Zm6TzSNOWYsELaO5Yh4RwCGZHrUvhaxca71czt1y6ccfNFePTK+RQRtjXGtnGtwqhSEoy57cVO3g/t2iFm0YscJSGAR3l9Svk3CK+pILCiacT4Z9gThITVVPJSnZ513vIZGfVtgnmbiH8p+wbl3hnYP5/wM5msagAR3yci3OlBYTWoEcSmyEiM+GtT06krfxDJ22fnFxtR/gfYNql/FVl6Ql2sFdtVAKBc7WxzPBkLf/RHjKYcYPWjETdIk363NkaeS6pg40jGhbAT/eovoc/MWVmd6PmjT7TnjQh7KhUmNsmy/I+Lyp7CtLQlm5OCgsOSjkGDUQu0BxUexijnxuiGg3rD3ZOpTNXDoBKVaKo+a1mdImI23qU1nGVkV1D/mqg0sgO65BS218THRb5ieRKsUAe0iPWYkEPTdZauUu6Bub8HabrPnCJYR9EvoH2SFSRnuhEiE54G/UBlGfnmq3/GxNoTSrk+DFoy3R6nrIndlLBpIQRWzrrPByCexnZRBb0YubWiwLgcIizOoRC7jqUMhJfW1ViBQqMwcsCqwoKpuXt2lXKEbgzuVrlVoz2on4kgh5dkI41i4I2X45G6RP/mArZNb26x+kNX2YtEdf/Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec6fe02-d857-4384-ba9a-08d852de70f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 03:31:00.2734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QpZJnFxFbxEnPqkHz+8ohJtVrTvF+0mjiNOf0NTZ5+dy+yu1cm5vKd7bIOJ6q2n/zOW8UhMrbZ0tui/+CkIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2288
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
dWVzZGF5LCBTZXB0ZW1iZXIgMSwgMjAyMCA2OjU1IFBNDQo+IA0KPiBGcm9tOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4gQ2hhbmdlIHRoZSBjYXRjaC1h
bGwgYmVoYXZpb3IgZm9yIE1TUiBub3QgZXhwbGljaXRseSBoYW5kbGVkLiBJbnN0ZWFkDQo+IG9m
IGFsbG93IGZ1bGwgcmVhZC1hY2Nlc3MgdG8gdGhlIE1TUiBzcGFjZSBhbmQgc2lsZW50bHkgZHJv
cHBpbmcNCj4gd3JpdGVzIHJldHVybiBhbiBleGNlcHRpb24gd2hlbiB0aGUgTVNSIGlzIG5vdCBl
eHBsaWNpdGx5IGhhbmRsZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBbcmVtb3ZlIHJkbXNyX3NhZmUgZnJvbSBkZWZh
dWx0IGNhc2UgaW4gc3ZtX21zcl9yZWFkX2ludGVyY2VwdF0NCj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2
MToNCj4gIC0gRm9sZCBjaHVuayB0byByZW1vdmUgZXhwbGljaXQgd3JpdGUgaGFuZGxpbmcgb2Yg
Vk1YIE1TUnMganVzdCB0bw0KPiAgICAjR1AuDQo+ICAtIFJlbW92ZSBjYXRjaC1hbGwgcmRtc3Jf
c2FmZSBpbiBzdm1fbXNyX3JlYWRfaW50ZXJjZXB0Lg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9o
dm0vc3ZtL3N2bS5jIHwgMTAgKysrKy0tLS0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgfCAxNiArKysrLS0tLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiBpbmRleCAwZTQzMTU0
YzdlLi42NmIyMmVmZGFiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiBAQCAtMTk2NCw4ICsxOTY0
LDcgQEAgc3RhdGljIGludCBzdm1fbXNyX3JlYWRfaW50ZXJjZXB0KHVuc2lnbmVkIGludA0KPiBt
c3IsIHVpbnQ2NF90ICptc3JfY29udGVudCkNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAgICAg
IGRlZmF1bHQ6DQo+IC0gICAgICAgIGlmICggcmRtc3Jfc2FmZShtc3IsICptc3JfY29udGVudCkg
PT0gMCApDQo+IC0gICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9H
X1dBUk5JTkcsICJSRE1TUiAweCUwOHggdW5pbXBsZW1lbnRlZFxuIiwNCj4gbXNyKTsNCj4gICAg
ICAgICAgZ290byBncGY7DQo+ICAgICAgfQ0KPiANCj4gQEAgLTIxNTAsMTAgKzIxNDksOSBAQCBz
dGF0aWMgaW50IHN2bV9tc3Jfd3JpdGVfaW50ZXJjZXB0KHVuc2lnbmVkIGludA0KPiBtc3IsIHVp
bnQ2NF90IG1zcl9jb250ZW50KQ0KPiAgICAgICAgICBicmVhazsNCj4gDQo+ICAgICAgZGVmYXVs
dDoNCj4gLSAgICAgICAgLyogTWF0Y2ggdXAgd2l0aCB0aGUgUkRNU1Igc2lkZTsgdWx0aW1hdGVs
eSB0aGlzIHNob3VsZCBnbyBhd2F5LiAqLw0KPiAtICAgICAgICBpZiAoIHJkbXNyX3NhZmUobXNy
LCBtc3JfY29udGVudCkgPT0gMCApDQo+IC0gICAgICAgICAgICBicmVhazsNCj4gLQ0KPiArICAg
ICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywNCj4gKyAgICAgICAgICAgICAgICAgIldSTVNS
IDB4JTA4eCB2YWwgMHglMDE2IlBSSXg2NCIgdW5pbXBsZW1lbnRlZFxuIiwNCj4gKyAgICAgICAg
ICAgICAgICAgbXNyLCBtc3JfY29udGVudCk7DQo+ICAgICAgICAgIGdvdG8gZ3BmOw0KPiAgICAg
IH0NCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+IGluZGV4IGY2NjU3YWY5MjMuLjljYzlkODFjNDEgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3ZteC5jDQo+IEBAIC0zMDE1LDkgKzMwMTUsNyBAQCBzdGF0aWMgaW50IHZt
eF9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWduZWQgaW50DQo+IG1zciwgdWludDY0X3QgKm1zcl9j
b250ZW50KQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgIH0NCj4gDQo+IC0gICAg
ICAgIGlmICggcmRtc3Jfc2FmZShtc3IsICptc3JfY29udGVudCkgPT0gMCApDQo+IC0gICAgICAg
ICAgICBicmVhazsNCj4gLQ0KPiArICAgICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgIlJE
TVNSIDB4JTA4eCB1bmltcGxlbWVudGVkXG4iLA0KPiBtc3IpOw0KPiAgICAgICAgICBnb3RvIGdw
X2ZhdWx0Ow0KPiAgICAgIH0NCj4gDQo+IEBAIC0zMjkwLDExICszMjg4LDYgQEAgc3RhdGljIGlu
dCB2bXhfbXNyX3dyaXRlX2ludGVyY2VwdCh1bnNpZ25lZCBpbnQNCj4gbXNyLCB1aW50NjRfdCBt
c3JfY29udGVudCkNCj4gICAgICAgICAgX192bXdyaXRlKEdVRVNUX0lBMzJfREVCVUdDVEwsIG1z
cl9jb250ZW50KTsNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiAtICAgIGNhc2UgTVNSX0lBMzJf
RkVBVFVSRV9DT05UUk9MOg0KPiAtICAgIGNhc2UgTVNSX0lBMzJfVk1YX0JBU0lDIC4uLiBNU1Jf
SUEzMl9WTVhfVk1GVU5DOg0KPiAtICAgICAgICAvKiBOb25lIG9mIHRoZXNlIE1TUnMgYXJlIHdy
aXRlYWJsZS4gKi8NCj4gLSAgICAgICAgZ290byBncF9mYXVsdDsNCj4gLQ0KPiAgICAgIGNhc2Ug
TVNSX0lBMzJfTUlTQ19FTkFCTEU6DQo+ICAgICAgICAgIC8qIFNpbGVudGx5IGRyb3Agd3JpdGVz
IHRoYXQgZG9uJ3QgY2hhbmdlIHRoZSByZXBvcnRlZCB2YWx1ZS4gKi8NCj4gICAgICAgICAgaWYg
KCB2bXhfbXNyX3JlYWRfaW50ZXJjZXB0KG1zciwgJnRtcCkgIT0gWDg2RU1VTF9PS0FZIHx8DQo+
IEBAIC0zMzIwLDEwICszMzEzLDkgQEAgc3RhdGljIGludCB2bXhfbXNyX3dyaXRlX2ludGVyY2Vw
dCh1bnNpZ25lZCBpbnQNCj4gbXNyLCB1aW50NjRfdCBtc3JfY29udGVudCkNCj4gICAgICAgICAg
ICAgICBpc19sYXN0X2JyYW5jaF9tc3IobXNyKSApDQo+ICAgICAgICAgICAgICBicmVhazsNCj4g
DQo+IC0gICAgICAgIC8qIE1hdGNoIHVwIHdpdGggdGhlIFJETVNSIHNpZGU7IHVsdGltYXRlbHkg
dGhpcyBzaG91bGQgZ28gYXdheS4gKi8NCj4gLSAgICAgICAgaWYgKCByZG1zcl9zYWZlKG1zciwg
bXNyX2NvbnRlbnQpID09IDAgKQ0KPiAtICAgICAgICAgICAgYnJlYWs7DQo+IC0NCj4gKyAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ICsgICAgICAgICAgICAgICAgICJXUk1TUiAw
eCUwOHggdmFsIDB4JTAxNiJQUkl4NjQiIHVuaW1wbGVtZW50ZWRcbiIsDQo+ICsgICAgICAgICAg
ICAgICAgIG1zciwgbXNyX2NvbnRlbnQpOw0KPiAgICAgICAgICBnb3RvIGdwX2ZhdWx0Ow0KPiAg
ICAgIH0NCj4gDQo+IC0tDQo+IDIuMjguMA0KDQo=


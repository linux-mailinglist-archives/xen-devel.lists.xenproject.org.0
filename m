Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DCA244521
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 08:57:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6TeJ-0004Qa-As; Fri, 14 Aug 2020 06:57:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jt9a=BY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1k6TeI-0004QO-67
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 06:57:10 +0000
X-Inumbo-ID: 87e8bd0c-2abf-4b4a-85a0-6e2924362e85
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87e8bd0c-2abf-4b4a-85a0-6e2924362e85;
 Fri, 14 Aug 2020 06:57:08 +0000 (UTC)
IronPort-SDR: AKmDMp4M0pgYtrwgmWSgpPcvgA/RuhvGcnn1jY5yQptiN3he4W2EwWNH40rZyJx5MxKYfXXKmZ
 /3AFSJGMZmTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="152012950"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="152012950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 23:57:07 -0700
IronPort-SDR: lEGn2LLEeuAHf+2Lc5ysC2fQHyYm83yt7NanpvUamE0/KZElRyIsSkyQcHRUPYze/wfRsXqY7n
 Zhvpcy/7idfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="277056008"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2020 23:57:07 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 23:57:07 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 23:57:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 13 Aug 2020 23:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnlpg41kNksnadKUJMC/9t3s/LbonRcsU055dxJMrbvZ4T+ep7GgbeQxQqbWiOBdeUpO68mbu5LQWZFIzOHXgt45zyFlvTzT4PVej0E5t2pvrGBPh1iMjhhm2sjn3j04m9gzLdoqW2SH1aZ2eIxnLOyacqOY492AdrXRrZXnOSVUm/vJHGLANQQH455AMgqjPDw5S0/v89qSoBMEDh0/RgBufwqH/pVgTHb7dP8sQTcl81Va4AjbbGc/Pawqq9ZRXwpaJo0crE0Q04dYy0JpdgfkpVjDbKPj1Geuj8QNwl/IGGCqpYtPSNHlDB1nr91ijuUvVJoh3yEs1JBMAS1fXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsuMYi13MyzeZoitFJGmiP1c3xEu3kj1x8Ul5SCVJs=;
 b=K4zAcFzhWr3JI5/XJPUeRdwQjpOfEFKN9X9ja94oro+H0FyzlqK2htndPdM2EWKJ2yQ3RKuXS2hlkoCwranZIZx34UKCuQrBAVHKon+RjJUWe6nYjH7Ky4PkUkPoWrC7kJ+KXSiETTxTiZcX3QUllwDQOyPYAgFOBz7skUKMsU+RyoHsbUhEhuWY3YzOZw0WDciqM/VnwJNT4f088mJH6hl8gYmlpSzw6oNkbpxO3HxqxV73MJv6Gigi8/wzGLYthzoZepgvZKTopQxDMhJ3Nv7zh2ZRm9hW79mN9DdyDH9a7ZtWb5BwiowxQrN7IMb/hYeNORGYpFnuPWme6vqoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsuMYi13MyzeZoitFJGmiP1c3xEu3kj1x8Ul5SCVJs=;
 b=X+0EyIPjobVxuKjqXSRN6LT9W3rvT5FnWXByjNbpC43a1sOz2UYox6Dk8VGnuR1RpcJxOZ3OutUcSCtvpBHp7yc8d3xH3gs5IWqYpyPCLBovXnnWyyWBcIGh4lSaFzEn1cBCiDJ+bB5bgTlDmmPNNvmfM+hwMhvBg98O06WKszI=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2285.namprd11.prod.outlook.com (2603:10b6:301:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 06:57:05 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 06:57:05 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <pdurrant@amazon.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v4 07/14] iommu: make map, unmap and flush all take both
 an order and a count
Thread-Topic: [PATCH v4 07/14] iommu: make map, unmap and flush all take both
 an order and a count
Thread-Index: AQHWamUjxZsfcXwlgkeaKOBP1/0Smqkq2x4AgAxgEYA=
Date: Fri, 14 Aug 2020 06:57:05 +0000
Message-ID: <MWHPR11MB1645A1F08A8174FF19C9A98B8C400@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-8-paul@xen.org>
 <2765087f-4168-191d-c547-cbc2e74d3fee@suse.com>
In-Reply-To: <2765087f-4168-191d-c547-cbc2e74d3fee@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e211bc1b-f9fd-40f3-f585-08d8401f414e
x-ms-traffictypediagnostic: MWHPR1101MB2285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB22856624F9DD231040B3D3428C400@MWHPR1101MB2285.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q3b3n8j+cpQi39EjnF1eNzZDjnVmzv0kvbpqSBYonwZ7mY0/5+BL9IbwGX331QRNTkxib7jF2Bvhg4tFmrRsh07rahraG7M3t4X4NPe44/UVyhifYQhMIRvrueniqAnqXHiallTwgODkk1Vcrb8DS7hUlYtzeEqtg16NTToqlSc3TWQVqw9z4woCwaw4aMA8GheBQlNdBw9pyiIkrtkkUuGFCXfow6Lzkvmh5neQdxWlU/6rkrqOVu1ks0Z5RNK30zsVpDbngYqMvUsyQCLwhOa0LRB+h35dHvd5edwAdHqdkVSk79BnhUQujILa609+M6JIefmSjkBmiGY3e+J/Ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(9686003)(52536014)(186003)(8936002)(4326008)(76116006)(54906003)(6506007)(316002)(53546011)(478600001)(33656002)(71200400001)(83380400001)(66446008)(2906002)(64756008)(66476007)(110136005)(55016002)(5660300002)(7696005)(66946007)(66556008)(7416002)(26005)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: NeinQ6WR+XurDLKDODuZh/6X6S6MY9/99Z4O71z1potA5zq5yT9XaL8MGvYqvWASbDazioF4D4X5PQWISi3lj6XctqtZoZwH1EWFgt/sN35nfgv1DlxExPPpfB13oxjHfsfhm5rlQ+sS3VD4A9JHNMhoAXuKhsuotjfAmWuNsk76tjQeX0rGq6EUxwNkSt7YdsLG0BYm7+2o3YLnRundcecCD/sdKRpBuENU+wEO8wEAeXe1baoTYIn+G7VZHGTg/1vNYoB01ARl4/Nykoxw1JwE6mIoydi7YUwmPohZsvaTDRclEnGVF5ZXLfMhdufrAgB1EZWf4rZkct9wrPzG274RHwE2LPUdOPVRO1WgF6py2EbB0WEXO9cuwJ1qDVmyUHCWc0O70wMhkgH/razTcW157DU7IK6uD8oYpR5oI5uEjkJeX1juwPwiPqC2oJpXll96LHN3fFA2BHa6hlhbBtXmQRgGaPtcikpRKhsCEyg+8k995e852x1fm+uezFmVH596RAfMa8dY1903Ahy0GnUEei3zVwzxwFbfXEaZQnNjaiqi3usrjwvzros2otUx3113qIu/u0cePYn59TIoiHBFKFedRS5GmeyG/UlFSqvXzvCjmkH2ZetCQcAoBkr2I/IWR/ZTXLQ2VCiHA+u/oQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e211bc1b-f9fd-40f3-f585-08d8401f414e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 06:57:05.5673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wo5C1L9KHHx+UfsthbZ+ohHQ2BGeHVhjED4srF3HbBqWxq4PUJAe+XkiyUt/zSFhNGn0TEe4I2WoCoF/lPu0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2285
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

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBdWd1c3QgNiwgMjAyMCA1OjU3IFBNDQo+IA0KPiBPbiAwNC4wOC4yMDIwIDE1OjQyLCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPg0KPiA+DQo+ID4gQXQgdGhlIG1vbWVudCBpb21tdV9tYXAoKSBhbmQgaW9tbXVfdW5tYXAo
KSB0YWtlIGEgcGFnZSBvcmRlciBidXQNCj4gbm90IGENCj4gPiBjb3VudCwgd2hlcmVhcyBpb21t
dV9pb3RsYl9mbHVzaCgpIHRha2VzIGEgY291bnQgYnV0IG5vdCBhIHBhZ2Ugb3JkZXIuDQo+ID4g
VGhpcyBwYXRjaCBzaW1wbHkgbWFrZXMgdGhlbSBjb25zaXN0ZW50IHdpdGggZWFjaCBvdGhlci4N
Cj4gDQo+IFdoeSBjYW4ndCB3ZSBkbyB3aXRoIGp1c3QgYSBjb3VudCwgd2hlcmUgb3JkZXIgZ2V0
cyB3b3JrZWQgb3V0IGJ5DQo+IGZ1bmN0aW9ucyBrbm93aW5nIGhvdyB0byAvIHdhbnRpbmcgdG8g
ZGVhbCB3aXRoIGhpZ2hlciBvcmRlciBwYWdlcz8NCg0KQWdyZWUuIGVzcGVjaWFsbHkgdGhlIG5l
dyBtYXAvdW5tYXAgY29kZSBsb29rcyB3ZWlyZCB3aGVuIGhhdmluZyBib3RoIA0Kb3JkZXIgYW5k
IGNvdW50IGluIHBhcmFtZXRlcnMuDQoNClRoYW5rcw0KS2V2aW4NCg0KPiANCj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1l
cHQuYw0KPiA+IEBAIC04NDMsNyArODQzLDcgQEAgb3V0Og0KPiA+ICAgICAgICAgICBuZWVkX21v
ZGlmeV92dGRfdGFibGUgKQ0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIGlmICggaW9tbXVfdXNl
X2hhcF9wdChkKSApDQo+ID4gLSAgICAgICAgICAgIHJjID0gaW9tbXVfaW90bGJfZmx1c2goZCwg
X2RmbihnZm4pLCAoMXUgPDwgb3JkZXIpLA0KPiA+ICsgICAgICAgICAgICByYyA9IGlvbW11X2lv
dGxiX2ZsdXNoKGQsIF9kZm4oZ2ZuKSwgKDF1IDw8IG9yZGVyKSwgMSwNCj4gDQo+IEZvcmdvdCB0
byBkcm9wIHRoZSAiMSA8PCAiPyAoVGhlcmUgYXJlIHRoZW4gSSB0aGluayB0d28gbW9yZSBpbnN0
YW5jZXMNCj4gZnVydGhlciBkb3duLikNCj4gDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1vcnku
Yw0KPiA+ICsrKyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gPiBAQCAtODUxLDEyICs4NTEsMTIg
QEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluICpkLA0KPiBzdHJ1Y3Qg
eGVuX2FkZF90b19waHlzbWFwICp4YXRwLA0KPiA+DQo+ID4gICAgICAgICAgdGhpc19jcHUoaW9t
bXVfZG9udF9mbHVzaF9pb3RsYikgPSAwOw0KPiA+DQo+ID4gLSAgICAgICAgcmV0ID0gaW9tbXVf
aW90bGJfZmx1c2goZCwgX2Rmbih4YXRwLT5pZHggLSBkb25lKSwgZG9uZSwNCj4gPiArICAgICAg
ICByZXQgPSBpb21tdV9pb3RsYl9mbHVzaChkLCBfZGZuKHhhdHAtPmlkeCAtIGRvbmUpLCAwLCBk
b25lLA0KPiANCj4gQXJndW1lbnRzIHdyb25nIHdheSByb3VuZD8gKFRoaXMgcmlzayBvZiBpbnZl
cnRpbmcgdGhlaXIgb3JkZXIgaXMNCj4gb25lIG9mIHRoZSBwcmltYXJ5IHJlYXNvbnMgd2h5IEkg
dGhpbmsgd2Ugd2FudCBqdXN0IGEgY291bnQuKSBJJ20NCj4gYWxzbyB1bmNlcnRhaW4gYWJvdXQg
dGhlIHVzZSBvZiAwIHZzIFBBR0VfT1JERVJfNEsgaGVyZS4NCj4gDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRkxVU0hGX2FkZGVkIHwgSU9NTVVfRkxVU0hGX21v
ZGlmaWVkKTsNCj4gPiAgICAgICAgICBpZiAoIHVubGlrZWx5KHJldCkgJiYgcmMgPj0gMCApDQo+
ID4gICAgICAgICAgICAgIHJjID0gcmV0Ow0KPiA+DQo+ID4gLSAgICAgICAgcmV0ID0gaW9tbXVf
aW90bGJfZmx1c2goZCwgX2Rmbih4YXRwLT5ncGZuIC0gZG9uZSksIGRvbmUsDQo+ID4gKyAgICAg
ICAgcmV0ID0gaW9tbXVfaW90bGJfZmx1c2goZCwgX2Rmbih4YXRwLT5ncGZuIC0gZG9uZSksIDAs
IGRvbmUsDQo+IA0KPiBTYW1lIGhlcmUgdGhlbi4NCj4gDQo+IEphbg0K


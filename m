Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC5841026B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Sep 2021 02:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189773.339657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mROYI-0006cI-Oi; Sat, 18 Sep 2021 00:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189773.339657; Sat, 18 Sep 2021 00:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mROYI-0006Zx-Lf; Sat, 18 Sep 2021 00:49:58 +0000
Received: by outflank-mailman (input) for mailman id 189773;
 Sat, 18 Sep 2021 00:49:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Orqi=OI=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mROYH-0006Zr-Fc
 for xen-devel@lists.xenproject.org; Sat, 18 Sep 2021 00:49:57 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0f9c8bf-cdf2-4560-9f31-a54945cfcf27;
 Sat, 18 Sep 2021 00:49:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 17:49:52 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2021 17:49:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 17 Sep 2021 17:49:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 17 Sep 2021 17:49:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 17 Sep 2021 17:49:51 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR1101MB2148.namprd11.prod.outlook.com (2603:10b6:405:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Sat, 18 Sep
 2021 00:49:49 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.018; Sat, 18 Sep 2021
 00:49:49 +0000
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
X-Inumbo-ID: d0f9c8bf-cdf2-4560-9f31-a54945cfcf27
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="209986833"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; 
   d="scan'208";a="209986833"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; 
   d="scan'208";a="554909859"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTPUwn85ORayBI/GP58oeb3h095DX9aTn+IvDZCNacSIZQEyht61qvLarL8B9xt1VeTPR3h9pmM5rh+uDGXE5G443bSJ6MuWLO6yOWKIAAW/eftF6vYkRTr2TaKXiX1JANt7RbzprySclQ92SDh0t4ee924JK2mdT1wcY4GdZsUsGce8T74LC/JUvyQAusMwo7HioKYcSI9kz/j7hkEHssO3JFe9xTB0UvapDIGiGHsXKNRXpjNgyWDYBAC50ujilukYCzk/fLifCzuV90o2kZeoFkiIyyLTOrcYckSWDVImv9DsWCgH9bQOLqm5eViNRNWxRM15Ytcvt+GTEpEgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5dTTKHcpujEOYDG34UvjZmvHsr0DQdB8zXpj7ac5aQk=;
 b=C1uVo0kikXJ44Me+xQh3ajgSZyO69JKQWWnejLNdSdFb2/wHl7eitn37+8qtqC2LUvr7uXm7HGC2xUlGbYKr48BeEVvaZgCcMa/bx1HTDWjbOY3Cddykj2RX1DHRtIwPUPL6gju0PFM35I+hbXiq7MM4JS9nDYaV+D1zkdw8SolppRZPMFd85TkIgK9j3amEu3AfD+lWgAf/M3cSHQGrYxRH4McEYRl8YkW4j3Qul8NaHIphMcuI+VwGLC1/GVoFYzl6AjxPTnUIKBOHuKLtMe98aLycV4ROxI3E1oprhA4fia4phn2CW+N2M/ozPMH++cZteR1OCT1iefTJp1uGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dTTKHcpujEOYDG34UvjZmvHsr0DQdB8zXpj7ac5aQk=;
 b=OS6iOM/hEXb5rcQyXAESv4Xuk+QFwLMWGICtmkLvm1LRa5/2bcJtGEn8MLN4oQlhfTelO9piLE+nQzLVvo0nbe45rjHJ6c/hLuAsbeMRHq7z6zjVzj/FYgiGBKIWrLhJADwnqcTGA6PHGhJ31MVRoF8ujCfRCVFCj4qLbKnxc6A=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v2 2/3] VT-d: PCI segments are up to 16 bits wide
Thread-Topic: [PATCH v2 2/3] VT-d: PCI segments are up to 16 bits wide
Thread-Index: AQHXq7NLI4GDIompwEO0/aktEApWj6uo9l8Q
Date: Sat, 18 Sep 2021 00:49:49 +0000
Message-ID: <BN9PR11MB5433696E7D9D586C413773368CDE9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <c0a460c0-9d7e-c015-37cf-4775bdef33a8@suse.com>
 <ee538608-4be8-b277-099a-fa82e0b59a9c@suse.com>
In-Reply-To: <ee538608-4be8-b277-099a-fa82e0b59a9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8682f4-834d-4dc2-0320-08d97a3e381a
x-ms-traffictypediagnostic: BN6PR1101MB2148:
x-microsoft-antispam-prvs: <BN6PR1101MB21488C6BDF5D945BE53D00828CDE9@BN6PR1101MB2148.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3zLAeOY5EI5tv+2Pa+303DXToDKkOfwNFG/FTbmlZKcnl2SJO8NC/9gjRI/O7T9SRoqULIlrxIC9MKdsuD9HEV4nTzh5uQjM+ivsIhlGADmV6n3FHUA8IIz+h2/FDdQbJgsdxNq54v+ARmhWR/0vPI+0FJCiJHFhFVsM0n64kRXsXa+ttcm3UytiT9TU8TNHJGxYuej9yTFTTdt4LZdZiOOw5YMtOCGsbu3SZFRUu56sqHRI42Y1ae9T1xVFsfU9jmwX/qg2E/pKmIvpEu0w3YeDebDI40NENS+qqklPCaW+7/fzsQsdj0qCrCVf5GLHwJBToLKsddD0i0VzRKnE1ZPcR6GyiZGdSAEy9pDL0KDQ9zeIoL1+4Jy3v25wJk/hUUmCGbS7tSjHjHobyWSpiOjInAChKCFSPWlFJPhoDI6NLcjtrJ9iBQHhNaGICzivJZ7cTdjseMYICjLTepKijk/DcxXi4Y1Gcops+WM07JF12uu5LhHACHS21OGBLO8JVNS2UJr+T+acONDtnOCMan0ptQQr+Q35m5zO4wJcus/jDZr1d266zjUpbVFOCQz1vMKxLVZBUk9b77rsymS96tH3k+NvUh7d2h8ujZ8UvUDgEa42YSaEDokvATp/qN9GVObvufpm5svPQwAz8IX2fP5tsi0R6impmwqIeLSSMRRawbBKr15mcUfpi3OVLGMCUvPP1lNNjwS/8cbwfJ9F8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(64756008)(9686003)(55016002)(7696005)(186003)(110136005)(508600001)(71200400001)(26005)(86362001)(6506007)(66476007)(66446008)(66556008)(8936002)(76116006)(122000001)(52536014)(38100700002)(4326008)(33656002)(316002)(5660300002)(2906002)(8676002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk1NNVR0RDU2YTFsUHl1OHVmWWhGd1FCMDVwM2dFWVVFQWtkSjJ6dDJXVStp?=
 =?utf-8?B?Nzk0TGk2anptdGx6YmFtYnF5M0xhZzlDVzNkT1VnYi9kWjJGdTdFZEVyN2t3?=
 =?utf-8?B?c084VmFoNWRlOUpuMmthbVlhY2Y4Si9HN1dzVmY4UFpWRSszRzlCWFRCQWNv?=
 =?utf-8?B?Zm1aeExOQWI0Mm9vYlFnejEzbGZGTE9ERHJwOTR0TWJreUI5RTE3WGRNeEM2?=
 =?utf-8?B?R1VkL0FGVXI4WXVQYVNvQ1k4N1pMT2czYXRrRm8zTWkreG1MdDByaEFLUWEv?=
 =?utf-8?B?anEvaTMvck1QWEVGQkcrZVZWMHdKNzhQVGFjK3ZCS01XSi9oNXliQnEyL3JL?=
 =?utf-8?B?VkEvZzF2MjVoQmk5STR4RFpUQ0NNekx3WEJLYU9VVkNLbFlNZTBNMkF3L254?=
 =?utf-8?B?bFdvUy9vNXdvSmgzWnJEcUNpMmJNZnIySDl5VHppNVNvVFcvTVg1b1BKdHcy?=
 =?utf-8?B?MlFxVGdTYXdLUnYxaUs0MkhnVXh5RlkxTElHU2dFWXpsWVVKUWJmL0JKajJ3?=
 =?utf-8?B?cnBYakVNemZOUSt0SkN3OEF5SG95VmxVaTFlKzk4L2V4V21BS2RDWUFOVC8y?=
 =?utf-8?B?ZVNqZnVsb3dzMm9DM3VjK1BMbmFMWWJ4U1FvSURXeXFxODA5Uys0cEN6ek9O?=
 =?utf-8?B?MkM2WWtWRU9yVE1FQk1Pa1RyVGNPVmFFU2VlV3MyOU5KNmxHajRNQjZNZXlJ?=
 =?utf-8?B?aVNsdEdvbGRPQUpWbVJxSlhaVGtmWW9IS0dMbjBBUWFpNWRhRWt2NGhqZGVL?=
 =?utf-8?B?RFd0QncxUTRhaE9zSVdMbGoyVVpyQlVVaXUwSVk2QVNUWUdWT2pEanlQai92?=
 =?utf-8?B?a09aMWJNb0U1Z0thRTI1OHpLVVlGTDF5YW5DYnNBbmdQakp1Q2dRV2FBTmNG?=
 =?utf-8?B?Znc2Z1F4RTVyeTVvYjJGTXhiTHBHalc5cklGWWtoMUp1VXNBMi9OVTBHNFpy?=
 =?utf-8?B?QmdwNUNuM1I0ZDFJbEdkMHQ1OGZPVDRNT05wK2xRRTRsWUJNZmpPdi9yeEE2?=
 =?utf-8?B?aCsvUDhuTU44NnNQVWcxNHpvOUEvVVRGN0QrNjN2bCs3N09qcVB6NE9QcldH?=
 =?utf-8?B?SWthSnBodnFpTyt2M00ra1N5d2dVaVE5YUJRZEJqU3ByYmROTlMzdkMxbFQx?=
 =?utf-8?B?QkU2elcvenQwajR2TjlDZitza1Q5a1A1KzN4Z3ZTWVBydnU2OW5TWW9Lbmpu?=
 =?utf-8?B?czZGVUIzZHdZdzRiTkdTTEZhbUY1WlBJZHFiZDVnZ25RUFllaUFJTnM2MzNZ?=
 =?utf-8?B?QVhwenBTWWNXc1NpcXduTHVXTGRzNDMvKys1eE1vM0xSUDVmNzZaV0dkWDVW?=
 =?utf-8?B?eG5JUmNFc0NSdlh1d0lUeWZXNktxcmg0TTBtU0xrbFc0ZHlObkx0ZmU4RmNJ?=
 =?utf-8?B?Q3Z2aGFDYk9KN01Dd0grUTZuQW0vbytlcFNmWllWVmg5TktFWkpqRkRUQkNh?=
 =?utf-8?B?SlMxR2dZWXJUTWRmMWovdGJqc3crWExhd1p0bzVxQTlJWVI3VmwvbExvZFU1?=
 =?utf-8?B?V2Y1MVRUL2ZFNUxPTGNKMGpNbWFkK2MrRnZSdFQvc25KVXhvWEVvSVIyNkNC?=
 =?utf-8?B?cmF1TGNBN2pXY3owazZDMGZKaFdJdXQyQ0pRekNwdElPTDJBWFJkTkptdFhU?=
 =?utf-8?B?Z3MwR0dRc1liT1NNSElqb1UxaW96WHc0eXNhWFovdU42T2lSRXFQb3M1ZEFL?=
 =?utf-8?B?YUJoaFhLRU93bGJXMVdHVytXZTJpZGc5dmtRYXpPTFBhYzJwKzBIZUNuTUE1?=
 =?utf-8?Q?MklQwZRcQvC4Dd9usW6tY280gpXiIEmOqSsRojw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8682f4-834d-4dc2-0320-08d97a3e381a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 00:49:49.3731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFPyl1huvfmH2MadhB2gAGE0nm3KC7K2e2PLNC1P7aSubj3q3lhIiYUwIQ76F4f2Z5GGk3jGyK3+oAvBPLN1zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2148
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
U2VwdGVtYmVyIDE3LCAyMDIxIDc6MDAgUE0NCj4gDQo+IFdlIHNob3VsZG4ndCBzaWxlbnRseSB0
cnVuY2F0ZSByZXNwZWN0aXZlIHZhbHVlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBTdHJpY3RseSBzcGVha2luZyB3ZSBzaG91bGRu
J3QgdXNlIHVpbnQ8Tj5fdCBoZXJlIGF0IGFsbC4gSSB3YXNuJ3Qgc3VyZQ0KPiB0aG91Z2ggd2hl
dGhlciBnb2luZyBzdHJhaWdodCB0byB1bnNpZ25lZCBpbnQgd291bGRuJ3QgYmUgdmlld2VkIGFz
DQo+IGludHJvZHVjaW5nIGluY29uc2lzdGVuY2llcy4NCj4gLS0tDQo+IHYyOiBOZXcuDQo+IA0K
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTQ2Miw3ICsxNDYyLDggQEAg
c3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0cnVjdA0KPiAgew0KPiAgICAgIGNv
bnN0IHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZCA9IGFjcGlfZmluZF9tYXRjaGVkX2RyaGRf
dW5pdChwZGV2KTsNCj4gICAgICBpbnQgcmV0ID0gMDsNCj4gLSAgICB1OCBzZWcgPSBwZGV2LT5z
ZWcsIGJ1cyA9IHBkZXYtPmJ1cywgc2VjYnVzOw0KPiArICAgIHVpbnQxNl90IHNlZyA9IHBkZXYt
PnNlZzsNCj4gKyAgICB1aW50OF90IGJ1cyA9IHBkZXYtPmJ1cywgc2VjYnVzOw0KPiANCj4gICAg
ICAvKg0KPiAgICAgICAqIEdlbmVyYWxseSB3ZSBhc3N1bWUgb25seSBkZXZpY2VzIGZyb20gb25l
IG5vZGUgdG8gZ2V0IGFzc2lnbmVkIHRvIGENCj4gQEAgLTE2NzcsNyArMTY3OCw4IEBAIHN0YXRp
YyBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGQNCj4gICAgICBjb25zdCBzdHJ1Y3Qg
YWNwaV9kcmhkX3VuaXQgKmRyaGQgPSBhY3BpX2ZpbmRfbWF0Y2hlZF9kcmhkX3VuaXQocGRldik7
DQo+ICAgICAgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUgPSBkcmhkID8gZHJoZC0+aW9tbXUgOiBO
VUxMOw0KPiAgICAgIGludCByZXQ7DQo+IC0gICAgdTggc2VnID0gcGRldi0+c2VnLCBidXMgPSBw
ZGV2LT5idXMsIHRtcF9idXMsIHRtcF9kZXZmbiwgc2VjYnVzOw0KPiArICAgIHVpbnQxNl90IHNl
ZyA9IHBkZXYtPnNlZzsNCj4gKyAgICB1aW50OF90IGJ1cyA9IHBkZXYtPmJ1cywgdG1wX2J1cywg
dG1wX2RldmZuLCBzZWNidXM7DQo+ICAgICAgYm9vbCBmb3VuZDsNCj4gDQo+ICAgICAgc3dpdGNo
ICggcGRldi0+dHlwZSApDQoNCg==


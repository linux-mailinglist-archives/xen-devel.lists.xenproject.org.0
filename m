Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15540D3F1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188175.337255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlyf-0003EL-3o; Thu, 16 Sep 2021 07:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188175.337255; Thu, 16 Sep 2021 07:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQlyf-0003CM-0A; Thu, 16 Sep 2021 07:38:37 +0000
Received: by outflank-mailman (input) for mailman id 188175;
 Thu, 16 Sep 2021 07:38:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQlyd-0003CG-7b
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:38:35 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17d4786c-16c1-11ec-b5af-12813bfff9fa;
 Thu, 16 Sep 2021 07:38:33 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 00:38:32 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2021 00:38:31 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 00:38:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 00:38:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 00:38:30 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB1266.namprd11.prod.outlook.com (2603:10b6:404:49::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 07:38:23 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:38:23 +0000
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
X-Inumbo-ID: 17d4786c-16c1-11ec-b5af-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209598006"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="209598006"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="509214307"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grsD2ALQXPqTmpjouccUoQBSedObcShFH3LMRW9YV1PfiRrlGBLBOTutehCNctgb0izCtAFPU08MSQF9thm8eaRQWa/D8VBkP0de79demEBOANvcb6lH6wGcspsOPMb9X/q/UdReEGUxMtJR/xMZesduFXbYPGRatPzAJsHopW7v7g1Icm5uQt0Ed5VyYml0yNN8EpUs0EeBuBOARfBkHX7h3zRQUF09e77NPUtL81z6S3GVF7gykBrbml8vs7xIEmusWpa9jEeMAhgRaRmxA4SskyZFYfcFFRjE5O8u9zctipxQu2MG4H/S7Oml6Ts34hmejBr46gXj0ak2oSC5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+B+PeHhMAxaElaXnsp1gPzHe/Is6euh8kKAI3si2YAo=;
 b=GMg5OGgNA5ldoiPW0i0SmBIVsx0a2lrBOyJLrMw8y2qApwzTjd4QPLNR68Cftg3N5sS9PrsGWBANPjw7oySLZuq0M4jlYdQ3AsVQlZxZno97T33VLUCXR3ezBgbsaV0QlHGi5i7+fucntyCmbQyX/Gvbzuz+0Jlz84HPJxfSoSFiFspAcbcxTWdsNNrWe7YenSSGm3ut8poWKlDTvRyW9qZ58Mji1qF/JFqLhrHXJt1djAEoqFlMiKNhYDOKjj9+HMIa8U7jEMysXoa5y2+/1X/BCe6HmXnvghTRb+37lsqkXMOiQhfUUaoerz5kswtkZ4mogY7aWatEk1xAxG5lxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+B+PeHhMAxaElaXnsp1gPzHe/Is6euh8kKAI3si2YAo=;
 b=t906+oP9cOdU4VLMpxDA0+gQkL0/LBd3vALfbEEmaAL/KIGpf8bItLi9fHNwZVlmxkDRkrCM0l8DeF3EU3b24Dyrm7OtcZiOKj0SmezThmZM9WoJ7nfSdrziUFZe2lbHQbgoAvI7+R2bMhJRXryNCwpRm+ZLlN/zxeMlRN1tf68=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 04/17] IOMMU: have vendor code announce supported page
 sizes
Thread-Topic: [PATCH 04/17] IOMMU: have vendor code announce supported page
 sizes
Thread-Index: AQHXmPLSEQjLv6P2ME2fmo8TXLbyOqumaasQ
Date: Thu, 16 Sep 2021 07:38:23 +0000
Message-ID: <BN9PR11MB5433D5916CEEAC11E5EC31F18CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <53c5e1b5-b363-d2c0-edbc-f9fae1e6e2c1@suse.com>
In-Reply-To: <53c5e1b5-b363-d2c0-edbc-f9fae1e6e2c1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653ae5ef-f64c-40a1-d5b5-08d978e4f6bc
x-ms-traffictypediagnostic: BN6PR11MB1266:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB126693B5CAD41498B9DBB0888CDC9@BN6PR11MB1266.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tl3Gtwelk64/b+9clDKhWCNQICH8aiIkdMxng5uJx4XL4eK13exuRvz7iyOKC/wDJx/vyidCqewedcg3+YHcsHt3GJB+PWW9ZHgkdq/L11IfB7eiuPQSUSwpiQ90BPhhZ3jCqOhqEK9+vMUxecNLUnY8cI7FTEnBpQ8ndTRg3Mq6TpobZMFBzRn1KOvYS6n400Kv0NpLwl7ltintaSYHtnAfm6Z/I6ZNw/sie7jG8THlXz/qnl2MM5sRf6R7SrjMjLm7Uq/65vFNP5BOBGfY+k/hL6M/7A/bcKwOqT2W+K8yy/F8URA+hnMjpykyyQjvmXLg5SEqj/YRcPToTMXG0lIa9VTFZpO3jJcvinpaS4gVVp3muv/CO1olAfkot3yiyCLmOjQzVx+GzPvGRFZ4RI/846V4WXbcWdBUyqDKEC0um8z9pNRx4BcC0x1SbeuaDpQ0ovZ1Oxng6OheWvt/XxzMDchzCniKNjzsuxezg8TaH0Pb/doxN3HC9R7iHVL2XQ+mC4lU0mPEUNb4QPLFcZzhv+fWvUKmm6ZriB6+BWDclAD6VneC5T7nyv6YruzB9uu7wF2ynTi4XXsQbplrSvP5oFgWYxOhY4i8KuBNbIt0RuMkpCSgk3SVZvW5LOub2S9pYB6V3+Ck5UHMXslPo+CaH1VhbZ/FhlWpCEAT1mjH3+qhngF8Rm9occcKNAbENaUOAFffw7pV84n5FNiE7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(86362001)(38070700005)(83380400001)(5660300002)(54906003)(33656002)(8676002)(110136005)(38100700002)(55016002)(9686003)(26005)(7696005)(8936002)(316002)(6506007)(2906002)(71200400001)(4326008)(66946007)(122000001)(478600001)(52536014)(66446008)(64756008)(66556008)(66476007)(76116006)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHhNV2lqMUpWSU9Pa0pvalRQMjhvQjR2M0lvem5BTmk0Y3JhTEVOUGUra1pm?=
 =?utf-8?B?dDFrRXAxTEtiZG94SmloV2xQb1YrdTBJZVVYZXY0WmxaQml0UnFJRUN6ZDVM?=
 =?utf-8?B?aTRKUVQ2dWJlMWVXSnpCSzdMRkxOQmdqb0h5ZW4yaHNMdE9kdG1NTVZIWEFy?=
 =?utf-8?B?d1JkMlJJdHg4S3J2NjVuSXRYSEJSWlIrWFczc3VMWEgxcUsxQmQ5bzdXaTlT?=
 =?utf-8?B?aVVsd2ZqL080UGRLdU80a0ZxRXhYYTVXYlA4NW9pd29hUlBXMVJlRGozVk9E?=
 =?utf-8?B?b01ja2JXQ0kwbUI2VnZOYmVUUThYRFRLb1E5RjRDWlh6cXNYVjM1UkZDaWta?=
 =?utf-8?B?OWY1cTU5TVpFeUtjdjVSS2hvUjRRdXkydVc4ck5VZDRIVjNPbnUzcERBeUZy?=
 =?utf-8?B?RnV5Q09YMU1FdjBVUFljbHRhUVY0QmRDWExKWVJ2NE4wczFWb1RxNWVLT3Rh?=
 =?utf-8?B?allVTW1GNE1rb1lQd09WZGVtOTBPTjJYcmIraUdvTmFrTnFDeVo5UlNTY3FI?=
 =?utf-8?B?dlRwZm9sSlQ2RGxDL0VHR25mZGNBTG45Zy8wVDQ1enVMV2xINXVNOGNwbExk?=
 =?utf-8?B?NUpSdjJjeEp4b3YxdThKd1l1L3JZRUlnODZvT2t2S21vVVJDQTJQY2ZrUGoz?=
 =?utf-8?B?NWVnU0FWbVY4YjFnWGZOZUZYeklxTjhMMzNKSG5RQXpkamdTclBxY1g4WVNO?=
 =?utf-8?B?ZXlVMHJFTXI5S015VjZDOE9kL3c1ZXhMRXlPdTIway8yMy80NU96K2QxUzdJ?=
 =?utf-8?B?Mk11MmFsWGU5bXRSeUNyUzVuYzhLa3dpMjBqVGtKVWVBQzZBODJ2L2tQLytT?=
 =?utf-8?B?K0tZZDRLQ1h2M1AweDlmQmVWZkM0N1gvVktMNzIxNEZ5Q1ZPcll1YjRiODAx?=
 =?utf-8?B?Y2VPSmdMS1JIcmNnTERWK2NqdUgyRFJLMEVGUVFUZHo1QTVQZWFKNDIyblR5?=
 =?utf-8?B?SkNtRmJ4WUZlY2ZxOG9TdXdSUWF0M05KZVREMjdLang0Z1dpaDFRaHJIY1M0?=
 =?utf-8?B?a1ZXdmRMcjYza2J6UENaYmhKNHlMbjBLSWRPUVVBQmN5d3ZoQ25xbjZXeXZJ?=
 =?utf-8?B?SFp3R2hxSHQwdHNXRGpac0Fla2NEcEl3cCtpSmdKSDUrUW5PdGFQNm9EVVpo?=
 =?utf-8?B?c0xQeGdQYXMxdGdOdlRzT0N5RlpHYVdyaGFxV0ZVdUZZaFc1ZGc2WVdQcTVX?=
 =?utf-8?B?SWhEUURzNEtvN1BkUE4veXlOQlZGdzBSdWRPZDNIMi8rVXQ4TlRwOUZmUW9l?=
 =?utf-8?B?bU95bi81U215QW9raGYzajdjSnYxVGFHWUh6UWNOVVBpZjZ0MXJ3eVNOQ01p?=
 =?utf-8?B?eFF1MVJaQWJnWSswNnBTR3oreE1XVm51UC8rRFFxRnlKMWgxT2dIb0F4VVlB?=
 =?utf-8?B?WXZrOXZvbmZXQmx3OWJibElGT040TDBaZDJFRE1pSVJXWTIvbHdqTzBTVjhm?=
 =?utf-8?B?MkFKdng5bi9Gam9teEphSFBIbEZGcVd5SkliNFRPblgyTWRxczJzSFppeUo5?=
 =?utf-8?B?RVNoWkRxaFFJUWcwRktUdXRiMGlzWjYwVng1QUFDOXNpUUt6NGVnUUJvVi9x?=
 =?utf-8?B?aFJhSHBSUVhLWk8vdVppODd2YVFMWnVaTTJrK0srcFdOMVp3TTBOaHRwOUJL?=
 =?utf-8?B?VURTRXRhakRiRkRVL3RHdmhRN1VzdnRHL1JReS85cU9VR3Q2ZWNiZXJnclk5?=
 =?utf-8?B?QmlBUGx6Rm1OUDVlalFNR0pPakw2cGpFZXBBVGZySkI2d1B4QUdiWHMrbWUz?=
 =?utf-8?Q?bg2z1wUAY69ZxMkTtYaVvSRx07iq3UjOr7Y9kCO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653ae5ef-f64c-40a1-d5b5-08d978e4f6bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:38:23.5858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6g7QLCEtSmRprkISlxyy/vL2u5TEcpOoHrwUY8vAfDVszM+/3B2RkuHJUlMFJMILMTZJf0QRmj1n2BvJxrVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1266
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNCwgMjAyMSAxMDoxOCBQTQ0KPiANCj4gR2VuZXJpYyBjb2RlIHdpbGwgdXNlIHRo
aXMgaW5mb3JtYXRpb24gdG8gZGV0ZXJtaW5lIHdoYXQgb3JkZXIgdmFsdWVzDQo+IGNhbiBsZWdp
dGltYXRlbHkgYmUgcGFzc2VkIHRvIHRoZSAtPnssdW59bWFwX3BhZ2UoKSBob29rcy4gRm9yIG5v
dyBhbGwNCj4gb3BzIHN0cnVjdHVyZXMgc2ltcGx5IGdldCB0byBhbm5vdW5jZSA0ayBtYXBwaW5n
cyAoYXMgYmFzZSBwYWdlIHNpemUpLA0KPiBhbmQgdGhlcmUgaXMgKGFuZCBhbHdheXMgaGFzIGJl
ZW4pIGFuIGFzc3VtcHRpb24gdGhhdCB0aGlzIG1hdGNoZXMgdGhlDQo+IENQVSdzIE1NVSBiYXNl
IHBhZ2Ugc2l6ZSAoZXZlbnR1YWxseSB3ZSB3aWxsIHdhbnQgdG8gcGVybWl0IElPTU1VcyB3aXRo
DQo+IGEgYmFzZSBwYWdlIHNpemUgc21hbGxlciB0aGFuIHRoZSBDUFUgTU1VJ3MpLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMNCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPiBAQCAtNTgzLDYgKzU4Myw3
IEBAIHN0YXRpYyB2b2lkIGFtZF9kdW1wX3BhZ2VfdGFibGVzKHN0cnVjdA0KPiAgfQ0KPiANCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0cmVsIF9pb21tdV9vcHMg
PSB7DQo+ICsgICAgLnBhZ2Vfc2l6ZXMgPSBQQUdFX1NJWkVfNEssDQo+ICAgICAgLmluaXQgPSBh
bWRfaW9tbXVfZG9tYWluX2luaXQsDQo+ICAgICAgLmh3ZG9tX2luaXQgPSBhbWRfaW9tbXVfaHdk
b21faW5pdCwNCj4gICAgICAucXVhcmFudGluZV9pbml0ID0gYW1kX2lvbW11X3F1YXJhbnRpbmVf
aW5pdCwNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYw0K
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jDQo+IEBAIC0x
Mjk4LDYgKzEyOTgsNyBAQCBzdGF0aWMgdm9pZCBpcG1tdV9pb21tdV9kb21haW5fdGVhcmRvd24o
DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgaXBtbXVfaW9tbXVfb3BzID0N
Cj4gIHsNCj4gKyAgICAucGFnZV9zaXplcyAgICAgID0gUEFHRV9TSVpFXzRLLA0KPiAgICAgIC5p
bml0ICAgICAgICAgICAgPSBpcG1tdV9pb21tdV9kb21haW5faW5pdCwNCj4gICAgICAuaHdkb21f
aW5pdCAgICAgID0gaXBtbXVfaW9tbXVfaHdkb21faW5pdCwNCj4gICAgICAudGVhcmRvd24gICAg
ICAgID0gaXBtbXVfaW9tbXVfZG9tYWluX3RlYXJkb3duLA0KPiAtLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9zbW11LmMNCj4gQEAgLTI4NzMsNiArMjg3Myw3IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X2lv
bW11X2RvbWFpbl90ZWFyZG8NCj4gIH0NCj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11
X29wcyBhcm1fc21tdV9pb21tdV9vcHMgPSB7DQo+ICsgICAgLnBhZ2Vfc2l6ZXMgPSBQQUdFX1NJ
WkVfNEssDQo+ICAgICAgLmluaXQgPSBhcm1fc21tdV9pb21tdV9kb21haW5faW5pdCwNCj4gICAg
ICAuaHdkb21faW5pdCA9IGFybV9zbW11X2lvbW11X2h3ZG9tX2luaXQsDQo+ICAgICAgLmFkZF9k
ZXZpY2UgPSBhcm1fc21tdV9kdF9hZGRfZGV2aWNlX2dlbmVyaWMsDQo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3NtbXUtdjMuYw0KPiBAQCAtMzQyNiw3ICszNDI2LDggQEAgc3RhdGljIHZvaWQg
YXJtX3NtbXVfaW9tbXVfeGVuX2RvbWFpbl90ZQ0KPiAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaW9tbXVfb3BzIGFybV9zbW11X2lvbW11X29wcyA9IHsNCj4gLQkuaW5pdAkJPSBhcm1f
c21tdV9pb21tdV94ZW5fZG9tYWluX2luaXQsDQo+ICsJLnBhZ2Vfc2l6ZXMJCT0gUEFHRV9TSVpF
XzRLLA0KPiArCS5pbml0CQkJPSBhcm1fc21tdV9pb21tdV94ZW5fZG9tYWluX2luaXQsDQo+ICAJ
Lmh3ZG9tX2luaXQJCT0gYXJtX3NtbXVfaW9tbXVfaHdkb21faW5pdCwNCj4gIAkudGVhcmRvd24J
CT0NCj4gYXJtX3NtbXVfaW9tbXVfeGVuX2RvbWFpbl90ZWFyZG93biwNCj4gIAkuaW90bGJfZmx1
c2gJCT0gYXJtX3NtbXVfaW90bGJfZmx1c2gsDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiBA
QCAtNDcwLDcgKzQ3MCwxNyBAQCBpbnQgX19pbml0IGlvbW11X3NldHVwKHZvaWQpDQo+IA0KPiAg
ICAgIGlmICggaW9tbXVfZW5hYmxlICkNCj4gICAgICB7DQo+ICsgICAgICAgIGNvbnN0IHN0cnVj
dCBpb21tdV9vcHMgKm9wcyA9IE5VTEw7DQo+ICsNCj4gICAgICAgICAgcmMgPSBpb21tdV9oYXJk
d2FyZV9zZXR1cCgpOw0KPiArICAgICAgICBpZiAoICFyYyApDQo+ICsgICAgICAgICAgICBvcHMg
PSBpb21tdV9nZXRfb3BzKCk7DQo+ICsgICAgICAgIGlmICggb3BzICYmIChvcHMtPnBhZ2Vfc2l6
ZXMgJiAtb3BzLT5wYWdlX3NpemVzKSAhPSBQQUdFX1NJWkUgKQ0KPiArICAgICAgICB7DQo+ICsg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiSU9NTVU6IHBhZ2Ugc2l6ZSBtYXNrICVseCB1
bnN1cHBvcnRlZFxuIiwNCj4gKyAgICAgICAgICAgICAgICAgICBvcHMtPnBhZ2Vfc2l6ZXMpOw0K
PiArICAgICAgICAgICAgcmMgPSBvcHMtPnBhZ2Vfc2l6ZXMgPyAtRVBFUk0gOiAtRU5PREFUQTsN
Cj4gKyAgICAgICAgfQ0KPiAgICAgICAgICBpb21tdV9lbmFibGVkID0gKHJjID09IDApOw0KPiAg
ICAgIH0NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC0yODc1LDYg
KzI4NzUsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9pb21tdV9xdWFyYW50aW5lDQo+ICB9
DQo+IA0KPiAgc3RhdGljIHN0cnVjdCBpb21tdV9vcHMgX19pbml0ZGF0YSB2dGRfb3BzID0gew0K
PiArICAgIC5wYWdlX3NpemVzID0gUEFHRV9TSVpFXzRLLA0KPiAgICAgIC5pbml0ID0gaW50ZWxf
aW9tbXVfZG9tYWluX2luaXQsDQo+ICAgICAgLmh3ZG9tX2luaXQgPSBpbnRlbF9pb21tdV9od2Rv
bV9pbml0LA0KPiAgICAgIC5xdWFyYW50aW5lX2luaXQgPSBpbnRlbF9pb21tdV9xdWFyYW50aW5l
X2luaXQsDQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oDQo+IEBAIC0yMzEsNiArMjMxLDcgQEAgc3RydWN0IHBhZ2VfaW5mbzsN
Cj4gIHR5cGVkZWYgaW50IGlvbW11X2dyZG1fdCh4ZW5fcGZuX3Qgc3RhcnQsIHhlbl91bG9uZ190
IG5yLCB1MzIgaWQsIHZvaWQNCj4gKmN0eHQpOw0KPiANCj4gIHN0cnVjdCBpb21tdV9vcHMgew0K
PiArICAgIHVuc2lnbmVkIGxvbmcgcGFnZV9zaXplczsNCj4gICAgICBpbnQgKCppbml0KShzdHJ1
Y3QgZG9tYWluICpkKTsNCj4gICAgICB2b2lkICgqaHdkb21faW5pdCkoc3RydWN0IGRvbWFpbiAq
ZCk7DQo+ICAgICAgaW50ICgqcXVhcmFudGluZV9pbml0KShzdHJ1Y3QgZG9tYWluICpkKTsNCg0K


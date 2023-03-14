Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3B6B87DA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509422.785141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtnw-0003tO-9L; Tue, 14 Mar 2023 01:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509422.785141; Tue, 14 Mar 2023 01:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtnw-0003qt-5x; Tue, 14 Mar 2023 01:50:20 +0000
Received: by outflank-mailman (input) for mailman id 509422;
 Tue, 14 Mar 2023 01:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhtR=7G=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pbtnv-0003qM-6u
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:50:19 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f495bfb-c20a-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 02:50:14 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:50:14 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2023 18:50:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 18:50:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 18:50:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 18:50:13 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 01:50:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 01:50:11 +0000
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
X-Inumbo-ID: 8f495bfb-c20a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758616; x=1710294616;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2Vp3obsQObz7NQHNvls36ybmiS/4d5usQMg8X58VOao=;
  b=m8LQX2m21vKJaGGKYoMqgY8jSaqDZ0iybw21cC0/0/b1RBPrwGlZn8Nd
   k5spxwl9kEoxtRT5tFkPbQwua5wIC/thA27q2NOgy3xDrgZbVeLgmFToa
   T+EDa+2X/OhrCXysAQm2lSG19cXb2ALhKF4syvCZzFVvnkOoNJXmD1mAE
   XhNXVWC5FhjhBcyXmL8JLraSyRbBqktbZlBOs9vLbibut/025inGUiB5l
   C6asU2h8P3YTcEbemri5bA2LQG3I3xOpcQWU8xPEgtePP5MxR1CA4FxI2
   eKxpXMXpBCSpgyU1Hyl65dwLtkAxZEfkq5kvp3KcTkCqS/HKTY9Jrt0K/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399894018"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="399894018"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743115572"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="743115572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU67y0Zrds3gYgRmdLQ1wb8OGSR8KIAi1eSrKR5q+fUWIrB0MupwTDrSLlrkoD+fMVhYOIau+G+8izt+8pK2Dmkh7HvnwujEijWufiF8NBxggHprOXJR/IWhSr7Umc1LYLC0F/rFFprQIMvrKRWvr5t16VZ/LLXtyswfc4ORibzyvS5DAhVebCr+2h2iK5wx7zUBXdmZurkqgzqpud+Npj/R5K7JGg/Um2IzVWupsPUpNqgpLXQTiq34v/m95Fsv0b8zbRUh+ClyZ6LclA7m81lOUzF1WfUpF5tBGTQEqoYyK1kUY/3MfVGZMq1twrdnd9ATDUEEIRglP++dL6eavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Vp3obsQObz7NQHNvls36ybmiS/4d5usQMg8X58VOao=;
 b=SZ8cn2BtvWFQW171DkEGQQ1bL4JOMVCffsMSY5CPr3plQA8XMtlPsxuzmkqhdTaJNjCCU0is5HWZUT3gbdUq1eJtc0KO7l8edvX0qXXDkS9qJRCYUcpkfBG4hxIslEntV+hx/blt2a8s4AoB0pumi/KVD50xcp5a+RQ9B4Pw4XyzxcD/FdXf+iiqK8FsU4J4YqO1+Qyxia8oLSD9IHS36bY+V+FCfzCOCjPi/vtNx4x/gqyQiPNy5zedexi9BM7DvTZXjK2AQUhD9u9QkjpBW/vUw+I8UlTUTORqnqS4JPZgTEhj16X+bpZV+yOcvggRzG77B+6sMRnew7VtSX6nyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
Subject: RE: [PATCH v2] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope
 contains phantom device
Thread-Topic: [PATCH v2] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope
 contains phantom device
Thread-Index: AQHZVhT1Y3FxVamQLkqJ4quzo6CpTK75glJQ
Date: Tue, 14 Mar 2023 01:50:11 +0000
Message-ID: <BN9PR11MB5276832A2E3F31FB7695D0098CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230314013221.124930-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20230314013221.124930-1-marmarek@invisiblethingslab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB6070:EE_
x-ms-office365-filtering-correlation-id: 64f72d8e-dff5-4163-7581-08db242e72ca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wW1RC9yH8bK/Xqq+Qy3Wff4em3zOdR+G3Lit6sbNQW6Du4FIbEb+qqYzXgzOljX4fwJ+2q7ZyvMXolq5Jw8l3heUwkGdXlN5Ec/ya7rU++5h9Js/6cWMlO7MLb748dopDpMtQF0b1Xsku0qTl7XDF0P3smaM1Ae6T67tqGNHnBS+ew8+1Oy8mbeWaxBbYzJYWHggJh+5K06NaMFvtW60y20GXwucDCBrv78SzrjxjZOAMA3wc/vNhfHxq5gAlEJxYRohVYBWHI/dLS6UxGOP9wGpZZrhBFm8xxxsXFXNUPE0RsfMKf2DPkFotyTLcWK+RiUtQ/4u3qzIIqcZgJE1xQLPq3yk3NhEnbSDZrcp2rYifO1/RdYxPeLKtClAQFA/GVfOANnTcW2q98j2VEVi6OwnIT/d6ner+bjfbu+47KGch92wloWZPMYtKLbxaol/b6rZ5wUiuOpF6yws01qLqhhkBYCmj7pYhTv4WtIkkvmf+6x3c/ngwo8C8Rstd61/M7GtNWFakHNZhTwCcURFSc4fmqYkhBV1UBHERd/rOJclAUBycVmOtHBYyOOypJobm/GweC2C89VIotKq5PtXTBnLLDQQFiQsYdbQ17FkfW20XCjqi309cyUlJiLDAaYnSyngJToZRanE07kCGzaP+OgFwQetrp9VzdFATkSDta9khEYX0IJAQZ8f3c2TILzQQ4YTRrgE6JB9KkfD7b0CMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(478600001)(71200400001)(122000001)(2906002)(86362001)(82960400001)(8936002)(5660300002)(33656002)(52536014)(4744005)(38070700005)(7696005)(38100700002)(110136005)(64756008)(8676002)(66946007)(66556008)(66446008)(4326008)(316002)(41300700001)(55016003)(26005)(186003)(6506007)(9686003)(76116006)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0hoVDhIUUNnNmN4TXFsd2gzL1M3L1g2dkRCZ1paR081YTY4L0tEMXhjcjFn?=
 =?utf-8?B?WFhCUU10TGtzN1BKWkd1UkRrOWh2N29vY1FFb2xjYzdUVTRJN1FmbXRuem5D?=
 =?utf-8?B?ODZrVVo5K0FHNDRpbnltNUVWVzBMUUw2N0xmRDBpT3IrdEUzQWdRWWRodDlr?=
 =?utf-8?B?YjFvZGFRcFFyVW4xZVVxYThKaURpSU4zUnhJSXlSd1NQaEFhV1NQaytuaWYy?=
 =?utf-8?B?ZElqeWZGbjBrYzlVUTM0RW5Dd0RqdkV0TVQ4ZzNJckhod0lwVENrdTQ4eFA1?=
 =?utf-8?B?aWFFZ0twekFuSmM3VjBJWTBoNk8xV1B3QlVrcnBUMTJQSU50U1RCeThsZzhP?=
 =?utf-8?B?bGk0Q3AxUHVHM01zeHNaMXhRVTgxRDdLelgxVFZ1T0pnWXFSWUErTDQvTlB2?=
 =?utf-8?B?OEFubEdKVE1xaUtMN2JObWJBcndqcVNiSGtPWEZBSC9ZcVBOUWk5Q3dhYVNX?=
 =?utf-8?B?TkJpV1hIZXBCQk9FZFgvNWxwRU9IMVA5M0oxYmlqWGY5VUJqQ0x5VGlpVU1V?=
 =?utf-8?B?eUZoaktpWW9kcHo1SjVmeUs3WkNHbGV5c2JuYWlsb3huUUNTZGQxdkhQMzZS?=
 =?utf-8?B?V1RQb3Nyb2lDbGN2N0dEcW5ycGJoeWZ1TkI0eFA4aCt1S25Td3ZWWlNCQ28v?=
 =?utf-8?B?QTBzeExXZ1A3eGpGZk5MWGUvcTJLYTgxNVRuSVk1WDY2QTN1aVJXVTdMV3JJ?=
 =?utf-8?B?aTl2WGhIcGs0Q0NCVndrRHp3alRDR2UwUU13OVhIVEdVclZpRW9ScGFqcFh5?=
 =?utf-8?B?alN3anBqRHYrY3N0THhQRFNxQmJISkJtMm1YcGt2VUVxYThmN1Zqd3RGanNN?=
 =?utf-8?B?aWZiUXN4eXZlWkdsdDcvWlVCWVUxL08xY203dlVyM3V5ZUc1QWNVdHBWd3BF?=
 =?utf-8?B?NTNOY2RENDdQZHJZclA2d3FLRmt3Sm1WN2doSzBTMS9jWHJIQlZYM0F2ZWJJ?=
 =?utf-8?B?a2xLTjhlNmc1OGN1NVNLanhMMFpwYUxRaSsrcXM2bUtmRDFNdmNkK2JqaHJG?=
 =?utf-8?B?c3htT3d1aUFsVUE0RG5wbWNJWDhlNFArbmo0a0dIQ25vT29GVDlwLzZXWURT?=
 =?utf-8?B?RjFYM1pCaXh3VzlYT1lSU01yZ1h2K2hpejdhdS8rQVRIVTdxM2c2bjZCMzBl?=
 =?utf-8?B?NzFsWDhueUppQWU5TmNJV1pDaU9jdGpLYUdMVkdzUmthYjFJa0ZnMkMvR3JO?=
 =?utf-8?B?WDRoQnZyRGE3SEJYM3NQZ3EyWGRaeEU3NTZkcG5GSFRTblRFcHVNYjFQNGV4?=
 =?utf-8?B?YWFkemV5Ris2SUtNaEU1MkJ1N1RaQXRTV2k4K3FuRVNLRUVWU1k2UGVDSFI5?=
 =?utf-8?B?RnBESUc0V1FUaWNZcFRkTWFmaWhlVlpLOFdmdzJwemNBaDVjWUVaMFlVTmR6?=
 =?utf-8?B?a1RIbHhXRXJRM2l1SWtmMWRxVGpsS1F6SklCLzJwcy9CSy95V1dOYUwyUVpQ?=
 =?utf-8?B?NHVRTXVrMTB5UitNU1JORGFwdjRrUVowbEVkU1N2enNXd2QzSkd3TEZvTkdv?=
 =?utf-8?B?RUxRTSszT2F6L3Y5Y3ltV0ZPVkxZWkxpVWtxa1prWXhGajBnTW1pRm1LQjRD?=
 =?utf-8?B?eGFlbHdBWTRoRVRMNklNMXNadWpDTFRmK1dDNGVWK3JVZmJ6andidEk2RzJU?=
 =?utf-8?B?cVMzUStOTmIxS3FPb0hHVmdGb1JTUytwOUhwNEV6WDJQbnhjc3Byak9lbDQr?=
 =?utf-8?B?bnpQbkwremRUM082eG9kK3ZRbklFVzMyWGNFdGhXc3FIQWx6QlJzajcrWXVX?=
 =?utf-8?B?L2NLYTdFZ21oUmFwWWpENHp5ODRyZkVBYzRvNzFwMWJPbTlVNVZkS0RGZDkr?=
 =?utf-8?B?eDh3MlJ5MXRSempva0N6TmJtbUxjS2hjY3REanhBdE9YVENSbjcxVWNQbnl5?=
 =?utf-8?B?N2s0Q0RqYXQweGRYbHFyR2FVaDZKRG5KUHhPeGJVWHpJcERtZU1tUm9SOFBk?=
 =?utf-8?B?dGQvSE9BU1FPejNkbmdVZlp3QkRxU3EwN3MxVkpvdXpMUkhxdTVBR0tQT0w3?=
 =?utf-8?B?UitNNnRLc3FBbERFdUtaUDYvaDlVUXh0V2RTUHc5OTdNQWhocDdEbUlKN1Ru?=
 =?utf-8?B?RlVVSWpxRW9CdHB4UVpPc0crMXhtMi9wRHFkbUdQUk1xSS9yN2wvNGxRRnhL?=
 =?utf-8?Q?6G0cJ3jsDzLxJBe54OmtAtNU0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f72d8e-dff5-4163-7581-08db242e72ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 01:50:11.5399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tEwjtrM7Vj6SL9iM74tbxgn2v6uEsMUsxtwclGdvO6BtmVjvuny2zDhN3A3MlLg8vOQmOg1w7zGB2EI6AdoDng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
X-OriginatorOrg: intel.com

PiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDE0LCAyMDIzIDk6MzIgQU0NCj4g
DQo+IElmIHRoZSBzY29wZSBmb3IgSUdEJ3MgSU9NTVUgY29udGFpbnMgYWRkaXRpb25hbCBkZXZp
Y2UgdGhhdCBkb2Vzbid0DQo+IGFjdHVhbGx5IGV4aXN0LCBpb21tdT1uby1pZ2Z4IHdvdWxkIG5v
dCBkaXNhYmxlIHRoYXQgSU9NTVUuIEluIHRoaXMNCj4gcGFydGljdWxhciBjYXNlIChUaGlua3Bh
ZCB4MjMwKSBpdCBpbmNsdWRlZA0KPiAwMDowMi4xLCBidXQgdGhlcmUgaXMgbm8gc3VjaCBkZXZp
Y2Ugb24gdGhpcyBwbGF0Zm9ybS4NCj4gQ29uc2lkZXIgb25seSBleGlzdGluZyBkZXZpY2VzIGZv
ciAiZ2Z4IG9ubHkiIGNoZWNrLg0KPiANCj4gRml4ZXM6IDJkN2YxOTFiMzkyZSAoIlZULWQ6IGdl
bmVyYWxpemUgYW5kIGNvcnJlY3QgImlvbW11PW5vLWlnZngiDQo+IGhhbmRsaW5nIikNCj4gU2ln
bmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+IDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPg0KDQp0aGlzIHNob3VsZCBiZSByZWJhc2VkIG9uIHRvcCBvZiBK
YW4ncyBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0K


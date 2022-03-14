Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03464D79DE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 05:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289887.491559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcGP-0006e2-UI; Mon, 14 Mar 2022 04:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289887.491559; Mon, 14 Mar 2022 04:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcGP-0006ay-Qt; Mon, 14 Mar 2022 04:24:57 +0000
Received: by outflank-mailman (input) for mailman id 289887;
 Mon, 14 Mar 2022 04:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTcGO-00060u-AK
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 04:24:56 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b2ec6d-a34e-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 05:24:54 +0100 (CET)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 21:24:52 -0700
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2022 21:24:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:24:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 21:24:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 21:24:51 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 04:24:49 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 04:24:49 +0000
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
X-Inumbo-ID: b1b2ec6d-a34e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647231894; x=1678767894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QHOmEgQovgBEG71i/B/HYiSJ1oDHWnojD6X9SvX1PEQ=;
  b=gGYKpC9mStIX7CRuoEPuzPvfHJeEUnPbWEzmIoFdwj3SsEDKlfCd7nH/
   4kkMPDw0H12RQpTAWAfysTVi+2i6yFkJ1yCIzvprT8iHRzy5ERaqNl841
   3pybje2EZWmt6E2Lick8+e5PtQfg1gvkSc0GCmlO9ToZb4oNEGhLWsGAA
   gyjzkceXTcfeUFr0/kF4Uh3Z0xFUW+L4sTSlIRErooJw/wv3zPxvkEmc3
   WSHT8RpDa2yYYpozdMoMGexzKkZmnICXOWJpzyoZj7KwckpHSxWN8hhni
   hPHS3Na0+8A95Zx8y4QSFNT/BSEPURAcpDiMysfnhmYOaode1KYjthzrL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="255660681"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="255660681"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="612752553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImSscckDbjVm2fD0857lr7ONj+UlFNIQF1pvGTiNF/xKsffmkyqU6AL7ujHR5dMDONoZHtkTQbvFNUhPwrFBEElu+dHaQSMco3flkAhFuAajXOs9XR7kgg36uW8HDeSJHFPeaVab0oapnFRoFeerHI+a+QDKv4H9M3oWP01uW3bPUrSuR6QTuXDM5LbGzGATgka+XH4dbZh+Nzver32qA0dnlJgEkH24CPiVl+gfYrgc4jKgXJP7HdiySou8QJ5hpHmgkN49U40Jcr+ZHl/cfwBf/cY2YsnmdfhVzMS/QHGL5UTYedj0jKbG0yWVLNLaILpYms6Mk8qt0YzIKumzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHOmEgQovgBEG71i/B/HYiSJ1oDHWnojD6X9SvX1PEQ=;
 b=dIByqt6ZHr4V/pLn4MtmtG5ctzW4MdI7fWpaneGmd97lSB/jWaacCsXsiN8Saj5CmGgF+QpPRVsxSYdSUdv5WA+zsz/7fLJ4otsA3ZOmdIPdeIHhhiPruamUdkIbK6pINNDuMzz0jqnxmNu1p0spC+yYbnveTwxB/OA4F4OL1yorwx3GN6td27Ul91pjfi+meYo1WxFgw9OOYMqFUC3RGLBAtMFc1Jp4OyKW8rSBWr8qEoI0P9mgcR0pSjCVgYRQWZzBi1IDTqR0TYSrZs/VglwI1xrVcC+e4pF9rS1AtsqO6bmogEJps0wph7qsBJQUhjz61nskqSh5pmnCQDJ9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH] IOMMU/x86: tidy adjust_irq_affinities hook
Thread-Topic: [PATCH] IOMMU/x86: tidy adjust_irq_affinities hook
Thread-Index: AQHYMiCBwdBBME0p6k2Ozu7Ef1L2p6y+Uoqw
Date: Mon, 14 Mar 2022 04:24:49 +0000
Message-ID: <BN9PR11MB52764474C9C9C825258A2BBB8C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <67e34863-74fd-6d7f-8b63-26f45bf0426f@suse.com>
In-Reply-To: <67e34863-74fd-6d7f-8b63-26f45bf0426f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c8204d2-3c79-4ee8-bba4-08da057293f1
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB5293BFE30B67A7A13818ADB18C0F9@DM4PR11MB5293.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ri+EGXqCb47WTc2dgIzHTy6yfc9zyacv6wTtRsQxApCEe4hSemL1vJYfpThYagDcigUT3EweGf1BJNC2AzKJAXPY9oMINGef2byLko380X00K8J4cnBMns4vVBN06BXwddugHyatTvWzukuN4rzH4e0nsz73ehFswCsgNBLEla1L8fh/iPQUhB7PEtxvR3ak1InwAleCrYF0mL9U9n0ZvRSRsQfVI/dF4evvK1I/WDpcBpCZrc7tYJwQ+O9n4YQyQFmbWE/MRRmicdithNbJeQc2Oc74i1khd3PImKzVGEVGy/uYrzrwWrNFe+Pi5YoBAK7tb+fpP/VZrYIfwfLUJkTP06/jWjJiHF9Pv0qUi0xpGJ2WDUCT6C+E+bdq0fYFtYKBlvTtLDb3FElU1evfawa77vJNQzOgZnUcl/Hap0GbpN7HsFGBcoH3JE/nhXVZWj9Y8uXvyKsk7qYdVRhxqg38lmLDz0o79gRHMRreZEj/H9seAmO1cY/q2d7HVn8dYdpr5X4DFHbwQCh/hoALr2bA8Am874G53pdtRCTZEjkUqGClRbxzbe4GAxJWee28APAiE1VIhm889gJTBfjxbe6XQcIE3zh2ZN/uHtwIeYNElx5+1d96i4P6EXDjtVytzledQGbGM5NBjASxGBCuf6i/r/Y2Zm4g1hJj1sWSYIkWyxhizhzAz17XTyEKbBxtQBP9evml5bHCGTIJNrpIJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(52536014)(8936002)(38100700002)(66446008)(66476007)(66556008)(66946007)(76116006)(508600001)(7696005)(6506007)(26005)(5660300002)(33656002)(82960400001)(186003)(9686003)(122000001)(110136005)(54906003)(71200400001)(2906002)(83380400001)(316002)(8676002)(4326008)(38070700005)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzJpR2J1L1N3NEhpWW93eS95d01Kb3RNUXlNaG5qdVhCenAvQ1l3T00weTNM?=
 =?utf-8?B?Yk9uOXBkT2RNYjliZmU1cUlyWVdWeU55a09YN1ovS3lVazlFWENqaFUyTmZB?=
 =?utf-8?B?NktJVlFBdlM1bFFyalhZL001azFDOCtFYVFZM2VoSGcrZVNXU3Eya1FxRVNK?=
 =?utf-8?B?Mk5CM29QV0hYdC81RkNTYjEzYTl3NEU1MW8rK1BQYXhWeUlkSzFuQnBMME9X?=
 =?utf-8?B?bTJNOWFaYVhncHdrai95TklHaEpPeFlIWjRmcGFxb0hNQUFJMnpaRGVVcSs1?=
 =?utf-8?B?bm1iWG9JUnMrZi9vYXU1Vm50a0xSRE9URWZJUGtyTDUyL0NzYlBMWVhHN1B3?=
 =?utf-8?B?S0lQMnVwWW81T29NM1hOYnZSVjdFWk13MnBvVEt0V1lPME5mbDBYbWF2cEZ6?=
 =?utf-8?B?ekNXdUtrV291enNXc0F0WWdCQjJwM0VhcmFOeHl4ZnBjb21EeW1sbDNibXpa?=
 =?utf-8?B?UW9JYmh3REpDTEJxTVZOMDd5cmx0WFNpRWszSVhIaW9xRmJhRGttYnZFWmRh?=
 =?utf-8?B?QURMQzM5UkVKZDljdjlJMGJxTlZrTmxBWGJ6dFBscVRyeVdUQXJUWmkzclhu?=
 =?utf-8?B?MTdIc28reFpmODRNUVpHb1lUbmhERnAwQ3V0cE5CMlJLam1COGhKeU53V3NJ?=
 =?utf-8?B?NEgvWGV1QXlrSnVvQzNsQzNvQ0doaEIydXArVnM1NXZ2bGlHbHhnajY1cDFY?=
 =?utf-8?B?ZzZwaGRPKzF2UmluMU4yb0tRY0NPWEk4YWxsclRrTGZqbk1ueE9lbUxCbjZI?=
 =?utf-8?B?NWtMR0dsUmFWWFB5ancybWxYcVlwc2NOZUlIWlZkU0tuaVgyVGJCUFhrNjFo?=
 =?utf-8?B?VVFEQnlUSFRVVFROdzZPd0NyRHZSNmR5WnFtOEpzdGNSa214NjE2dVdEQTY3?=
 =?utf-8?B?d0hqdTZzVERzc3JVN2l2VHBxRHBwT1N1QWY1NjJSSFNNZExaZGY5ZzR2RERj?=
 =?utf-8?B?cWd5R0lWdHFrejJPcXRyd2U1TmVaL2JYeVJ5SVBraUlQREpvejFMdm5NU0RX?=
 =?utf-8?B?SWcvTFVwODQzYms3Q1dDSzBEU0hJTWNIM3BQdjI3Y3pTRnEyMUZsZDFGb2Q5?=
 =?utf-8?B?NUYyVGhIeU15L3JidWRwOWlYN0RIS2Q1Q0NUSGdReG9ndlZKMFltdEw2a3pW?=
 =?utf-8?B?eFg3Z2FYeC8ycmwxeUkveDJZYVFPZjZhcnl3Skhic2hldDRGMjhSUDhmQ3h4?=
 =?utf-8?B?cytSdFQ1QThXMTNVcW9KUllsUU9UQWNKc2xSazI3ZFA3ZndRNGNqRW03ckJM?=
 =?utf-8?B?OUxTd0Q4VFpYRy94dnBLVXZ6TnNITVpDaEJSQlZwUVk4aHpjSkZXWUtyOEkr?=
 =?utf-8?B?OGxhQmdBS0tIV1ZwUzhPelM5QTZ6NjdlNWEvSzdSVm00RGFnZnpQR3BNUFJt?=
 =?utf-8?B?dEcwRDVnS2cxMFZZT21mbHpoQ1lDNlYxbWJJM01XQTgxbk5sckV4b2RXSWlj?=
 =?utf-8?B?RzlpaE1Ma2NhdmUrOW9kK05jNGIrSUppNzBxSnJxUnlmaHo0VmxCQnZuSTE3?=
 =?utf-8?B?b3gxRllqNXVvcW1GblRwS2VYaXFDVTNiSkZ4U1M5MXVjOTBnbStQRDBFV05X?=
 =?utf-8?B?ditrbExBWUtQVEJ2QSt0Y0F3TGdnWjcwQ081YWY1OTR0Z3A1eE8rcUtjelQw?=
 =?utf-8?B?bjEwdzNjQmt4dm5JQi9NV0E4Vmt2NTlOdUhlay9IaDJ5dklPMlcwVlcwMWNP?=
 =?utf-8?B?MUJ6NlBuS1ZreEpla0wrSmZPL1FuWkR6Yi9FQ0I3NE91Vy9TM0xCQmxEOXJq?=
 =?utf-8?B?cmoraWZuRjdqYkxuNnAzbGVtNm9ZTVNaMWhrcDRBTVp4dFpKRjNNYjBocit4?=
 =?utf-8?B?L3krNVFqd2dZVHFKUHpUTXdaaWdpRk1PVkc3ZEM1UVFoNUFYbkNGWGFYT0d0?=
 =?utf-8?B?bmZ4bERNTmJlaFV3TFZNVDJpUDB5RTRqMmN5M2tUZGZxVi8vYlF5NnBwYmVC?=
 =?utf-8?Q?pZgEbztR2bHHjXCzRNBDUGUtfFhML063?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8204d2-3c79-4ee8-bba4-08da057293f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 04:24:49.1443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO3p+Inv8H7uMT0ssNkIoKlu6y5lBUssfIoZisF53XpHC+V/CkGMoPAgn5+PMQ3544epCbFBjC3ArALVDW9WGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggNywgMjAyMiA4OjQwIFBNDQo+IA0KPiBBcyBvZiAzZTU2NzU0YjA4ODcgKCJ4ZW4vY2V0
OiBGaXggX19pbml0Y29uc3RfY2ZfY2xvYmJlciIpIHRoZXJlJ3Mgbm8NCj4gbmVlZCBmb3IgYSBu
b24tdm9pZCByZXR1cm4gdmFsdWUgYW55bW9yZSwgYXMgdGhlIGhvb2sgZnVuY3Rpb25zIGFyZSBu
bw0KPiBsb25nZXIgdGhlbXNlbHZlcyBwYXNzZWQgdG8gX19pbml0Y2FsbCgpLiBGb3IgdGhlIHNh
bWUgcmVhc29uIHRoZQ0KPiBpb21tdV9lbmFibGVkIGNoZWNrcyBjYW4gbm93IG1vdmUgZnJvbSB0
aGUgaW5kaXZpZHVhbCBmdW5jdGlvbnMgdG8gdGhlDQo+IHdyYXBwZXIuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2lvbW11LmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2lvbW11LmgNCj4gQEAgLTEwMSwxMSArMTAxLDEwIEBAIHZvaWQgaW9tbXVfdXBkYXRlX2lyZV9m
cm9tX2FwaWModW5zaWduZWQNCj4gIHVuc2lnbmVkIGludCBpb21tdV9yZWFkX2FwaWNfZnJvbV9p
cmUodW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCByZWcpOw0KPiAgaW50IGlvbW11X3Nl
dHVwX2hwZXRfbXNpKHN0cnVjdCBtc2lfZGVzYyAqKTsNCj4gDQo+IC1zdGF0aWMgaW5saW5lIGlu
dCBpb21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCkNCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBpb21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCkNCj4gIHsNCj4gLSAgICByZXR1cm4g
aW9tbXVfb3BzLmFkanVzdF9pcnFfYWZmaW5pdGllcw0KPiAtICAgICAgICAgICA/IGlvbW11X2Nh
bGwoJmlvbW11X29wcywgYWRqdXN0X2lycV9hZmZpbml0aWVzKQ0KPiAtICAgICAgICAgICA6IDA7
DQo+ICsgICAgaWYgKCBpb21tdV9lbmFibGVkICYmIGlvbW11X29wcy5hZGp1c3RfaXJxX2FmZmlu
aXRpZXMgKQ0KPiArICAgICAgICBpb21tdV92Y2FsbCgmaW9tbXVfb3BzLCBhZGp1c3RfaXJxX2Fm
ZmluaXRpZXMpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBpb21tdV9zdXBwb3J0
c194MmFwaWModm9pZCkNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
LmgNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11LmgNCj4gQEAgLTIz
NCw3ICsyMzQsNyBAQCBpbnQgYW1kX2lvbW11X3ByZXBhcmUoYm9vbCB4dCk7DQo+ICBpbnQgYW1k
X2lvbW11X2luaXQoYm9vbCB4dCk7DQo+ICBpbnQgYW1kX2lvbW11X2luaXRfbGF0ZSh2b2lkKTsN
Cj4gIGludCBhbWRfaW9tbXVfdXBkYXRlX2l2cnNfbWFwcGluZ19hY3BpKHZvaWQpOw0KPiAtaW50
IGNmX2NoZWNrIGlvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCk7DQo+ICt2b2lkIGNmX2No
ZWNrIGlvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCk7DQo+IA0KPiAgaW50IGNmX2NoZWNr
IGFtZF9pb21tdV9xdWFyYW50aW5lX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+IA0KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMNCj4gQEAgLTgwOSwxMyArODA5LDEw
IEBAIHN0YXRpYyBib29sX3QgX19pbml0IHNldF9pb21tdV9pbnRlcnJ1cHQNCj4gICAgICByZXR1
cm4gMTsNCj4gIH0NCj4gDQo+IC1pbnQgY2ZfY2hlY2sgaW92X2FkanVzdF9pcnFfYWZmaW5pdGll
cyh2b2lkKQ0KPiArdm9pZCBjZl9jaGVjayBpb3ZfYWRqdXN0X2lycV9hZmZpbml0aWVzKHZvaWQp
DQo+ICB7DQo+ICAgICAgY29uc3Qgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7DQo+IA0KPiAtICAg
IGlmICggIWlvbW11X2VuYWJsZWQgKQ0KPiAtICAgICAgICByZXR1cm4gMDsNCj4gLQ0KPiAgICAg
IGZvcl9lYWNoX2FtZF9pb21tdSAoIGlvbW11ICkNCj4gICAgICB7DQo+ICAgICAgICAgIHN0cnVj
dCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlvbW11LT5tc2kuaXJxKTsNCj4gQEAgLTgy
OCw4ICs4MjUsNiBAQCBpbnQgY2ZfY2hlY2sgaW92X2FkanVzdF9pcnFfYWZmaW5pdGllcyh2DQo+
ICAgICAgICAgICAgICBzZXRfbXNpX2FmZmluaXR5KGRlc2MsIE5VTEwpOw0KPiAgICAgICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXNjLT5sb2NrLCBmbGFncyk7DQo+ICAgICAgfQ0KPiAt
DQo+IC0gICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgLyoNCj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2lvbW11LmMNCj4gQEAgLTIxMDcsMTcgKzIxMDcsMTIgQEAgc3RhdGljIHZvaWQgYWRqdXN0
X2lycV9hZmZpbml0eShzdHJ1Y3QgYQ0KPiAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRl
c2MtPmxvY2ssIGZsYWdzKTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IGNmX2NoZWNrIGFkanVz
dF92dGRfaXJxX2FmZmluaXRpZXModm9pZCkNCj4gK3N0YXRpYyB2b2lkIGNmX2NoZWNrIGFkanVz
dF92dGRfaXJxX2FmZmluaXRpZXModm9pZCkNCj4gIHsNCj4gICAgICBzdHJ1Y3QgYWNwaV9kcmhk
X3VuaXQgKmRyaGQ7DQo+IA0KPiAtICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQ0KPiAtICAgICAg
ICByZXR1cm4gMDsNCj4gLQ0KPiAgICAgIGZvcl9lYWNoX2RyaGRfdW5pdCAoIGRyaGQgKQ0KPiAg
ICAgICAgICBhZGp1c3RfaXJxX2FmZmluaXR5KGRyaGQpOw0KPiAtDQo+IC0gICAgcmV0dXJuIDA7
DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW5pdF92dGRfaHcoYm9vbCBy
ZXN1bWUpDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+IEBAIC00NjQsNyArNDY0
LDkgQEAgYm9vbCBhcmNoX2lvbW11X3VzZV9wZXJtaXR0ZWQoY29uc3Qgc3RydQ0KPiANCj4gIHN0
YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIGFkanVzdF9pcnFfYWZmaW5pdGllcyh2b2lkKQ0KPiAg
ew0KPiAtICAgIHJldHVybiBpb21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXMoKTsNCj4gKyAgICBp
b21tdV9hZGp1c3RfaXJxX2FmZmluaXRpZXMoKTsNCj4gKw0KPiArICAgIHJldHVybiAwOw0KPiAg
fQ0KPiAgX19pbml0Y2FsbChhZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0KPiANCj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL2lvbW11LmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4g
QEAgLTI2Nyw3ICsyNjcsNyBAQCBzdHJ1Y3QgaW9tbXVfb3BzIHsNCj4gDQo+ICAgICAgaW50ICgq
c2V0dXBfaHBldF9tc2kpKHN0cnVjdCBtc2lfZGVzYyAqKTsNCj4gDQo+IC0gICAgaW50ICgqYWRq
dXN0X2lycV9hZmZpbml0aWVzKSh2b2lkKTsNCj4gKyAgICB2b2lkICgqYWRqdXN0X2lycV9hZmZp
bml0aWVzKSh2b2lkKTsNCj4gICAgICB2b2lkICgqY2xlYXJfcm9vdF9wZ3RhYmxlKShzdHJ1Y3Qg
ZG9tYWluICpkKTsNCj4gICAgICBpbnQgKCp1cGRhdGVfaXJlX2Zyb21fbXNpKShzdHJ1Y3QgbXNp
X2Rlc2MgKm1zaV9kZXNjLCBzdHJ1Y3QgbXNpX21zZw0KPiAqbXNnKTsNCj4gICNlbmRpZiAvKiBD
T05GSUdfWDg2ICovDQoNCg==


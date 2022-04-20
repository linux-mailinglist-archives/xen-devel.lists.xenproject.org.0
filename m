Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07C508109
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308838.524689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3k6-0006iB-AI; Wed, 20 Apr 2022 06:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308838.524689; Wed, 20 Apr 2022 06:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3k6-0006g7-6Z; Wed, 20 Apr 2022 06:23:10 +0000
Received: by outflank-mailman (input) for mailman id 308838;
 Wed, 20 Apr 2022 06:23:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh3k4-0006Zi-Ii
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:23:08 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56778402-c072-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 08:23:07 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:23:04 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2022 23:23:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:23:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:23:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:23:03 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:23:01 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:23:01 +0000
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
X-Inumbo-ID: 56778402-c072-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650435787; x=1681971787;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BIWWfM9iZH0+bH/FAioA3hD07UHmH0hPVS3+Dk9IaFc=;
  b=k38Oo2tyO+40u1gCCy4gzXq9iE099gGLRcuon+fd+2tUl0jEotXdSJpn
   KQ9xyZduiZfjg961ZVazr2LBMAG8UBLsdHP0FFb/CAebSAMOkq9B56fbk
   KgWo99JDfoJHWaD2A1WNKgebszIbCeih49nJf93UTswQLS/to/s5Phgar
   yRJOWFqJYr0N/UJW6VeHEjRyw1ezRqqjayE5DQGAjTTKha3tjp7KYHEub
   W8Q5lgA2ef2Ov5CulViAT0dNn91nLCFNSSM+lB7ZbKUAOCvtf8Gz0H0U5
   o0dDF/nmszCRfKzq884m9RZ3Ckm23DS9dpvvLbltMRCEcg176RYuBhuac
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350399945"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="350399945"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="555053117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMJfUEhVSzm4yx1NkGLLGHqv3rxUvc/X4X1rEg7DSlBJtJxbCaHshMjmGzEZMHWRX0Sg8zL/sxPqohkFFR60UxUJ+TAhaqDxmd/ynWWBu4+rBZ9avfdn92o219Pvy84X3ADvgurArkKdTzGl1EbUf2r1Q/J4IlXmVNyEs/ftAtmEr3yzvhCBzfDqhh4Wq9b6C2c0WTHAg5nOtj6X4B+isHoj7gUOGijtNF8VixhFtBoIDw4o6vSEyeFtzZuKZFnkQECKfeiGCEQgqjBuCsl/xVarMC5Wafc4gfj/R2jc458e0+fAOoeV6xmPq1o32EjSbuQRftbPZQEZ1eKYXPMPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIWWfM9iZH0+bH/FAioA3hD07UHmH0hPVS3+Dk9IaFc=;
 b=WUA8Vbi9aTIGBqb9LLtzNNSbkayauJxceu9r1jV10fz09YX7KQaRUMGv8omFaWZuPaIzgB8nqiolz3V/fMEkdrbuhGNEPYts9X60Ezz4RhjQGwc/JtqDd3rmkSjX7X+birv5MBGbU2f/tjjKxOrw0ZB9cqp1K+JHSkeH62mf8u6sjWw83NtWoBi7uxmxrvgurrsUMFTFUw4UWXbZkwD/4fDe6y068C1Y1xDgOSj/BFWUzVM+PHEPMKPEVEbZ/roAqk+5fY8lp16pdDuHv89Xj3f9wDLrgrxqc5cdhTwng2Yv+HeVrCoumzdNCm51Vpv8I5C+puhVJtPM2CWD1WkwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH 3/8] VT-d: plug memory leaks in iommu_alloc()
Thread-Topic: [PATCH 3/8] VT-d: plug memory leaks in iommu_alloc()
Thread-Index: AQHYTYexZ6cM0C9e8k+mDwbf10797Kz4YUeQ
Date: Wed, 20 Apr 2022 06:23:01 +0000
Message-ID: <BN9PR11MB5276BC531E1BDD930D99F05F8CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <10f43cc4-7a09-9f4f-0a6b-fd7ffd88310d@suse.com>
In-Reply-To: <10f43cc4-7a09-9f4f-0a6b-fd7ffd88310d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70466c7c-737a-4909-893f-08da2296386d
x-ms-traffictypediagnostic: DM6PR11MB3500:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB350077457191236328DFDE808CF59@DM6PR11MB3500.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j7kvcC1kH34rVqv3ecn40ERBLjIKjG1qTxHzQzTu8X/5YALAn809sVoGGmzBf9Mg5aOmUO2M8VJeCVjP18DI8BcoSDGJ6vuzpdoTrinqF/hOCCIq1DbTUysreT3Fvo1XrB7Yv1vC7n6PJ80V3Yxt1S/0kk5NITAIbVHpj7rNgp+0CKxFfNr5/8PcQ9g4HGVgAVHXfCU3iJGCLrkPP3pMSmbqFwUqjJqHKE61ywi1wYVhpJ6eAU4Q7wNeWsZFIAIaV0of1R8JLZZDJOMv71vdxtAFCVXQx5+NJtQaFmw/7xcC8HnFWBAcJn3BwffiCVfdEIhGL1o4uNXd6y/+Uu4Q5FkRluwFrimWPItTr5Z57URO6CWdgPCay45D5LGkGpE401m9KeZiIyjV607sClmCM1WdupbTQJaZZ99xbMj7Om1Og1ZurvRA1tBkwpItthkbLhw4A/nyz95jPKoWrprbWX83Ggnxc3efTLh1M/fJgdfzNbD2tkWdIInP5rYzGTGcniMC+dD6l8JSjEJTrHpI8Jkbb32jXRvzanHvCE+4fmI7HS3kcW2xgGHQiQHPIDoiboYnowtwOoEmaoM2/qLMLJyE+PCrL9fas0eI/UVGYZu/zydnEoy/f34DNzfRDP8kVmd9Q/IUwT6ayqaK5mBgdTbjsg7h8tTuZhZQ9pwH3PVmzHRUgjwmB4P35IsL7P2nAAYFxYxMOGmSGgT/ST6Y4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(83380400001)(54906003)(2906002)(5660300002)(8936002)(52536014)(122000001)(38100700002)(33656002)(38070700005)(7696005)(9686003)(4326008)(8676002)(508600001)(6506007)(76116006)(66946007)(86362001)(64756008)(66446008)(66556008)(26005)(66476007)(110136005)(82960400001)(55016003)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2ZDSTFPVndsVFVpUmJlWG5haXBHb2VtYk5zbEdsdUh1RW1FdDUyNEZjd1dw?=
 =?utf-8?B?aTFqc3E3ODRzVm96NHFJNHlyaG1EdHRJbUNpL0tDWUZhWTZ2WVZtWStSNnA3?=
 =?utf-8?B?MXB6RTJpckhXVktuYkJLNVNWcjNGUzFVVnVxaWhxaVZYR3hMUlpMUi9lZytM?=
 =?utf-8?B?WXVjaFRNNUVIVEVEY0ZnOWdqUlQ5Tkg5YWo0VDFpY1psb1huRXIzclJnV0U5?=
 =?utf-8?B?a1V6MnFqWFdsck9wei9kaVQxaElvRm41SXV3QlYycVFEOFB5MHhkTUl5empS?=
 =?utf-8?B?ZGxWWEpma045QU1zc1VlLzFFZ2VZTGRFRTE1U0dxMk5MQ2xYNGlqaTdCL0E1?=
 =?utf-8?B?K2dHUTZmQnpQdHdtUDF1YWFlT0FNNWFnNWxDZzZVdXVZNFBFN2NzVThZeDAv?=
 =?utf-8?B?Z05DVE9EaUthb3V6YTFPanVwZDVsUkd0anFVb2l2WU9Kc1E5RFVlTjREN3kz?=
 =?utf-8?B?NUFZd0NWTWpFOGZwb1d4SVdPWU5jbFpKek5zVlBEWm5xc1lDWVhmUU4zd1JI?=
 =?utf-8?B?ZUtuV0tDSGp6TXFISVJ0TWZXNTdmN0U0Znc0UlV5SmpqblkxdVYwNGNUSlY3?=
 =?utf-8?B?S1A3S29WZHVGZkkySFp4WjdPV0lNalJCT3VZZGdueXNyOU5xR0ozbXlCKzU5?=
 =?utf-8?B?WjdBL1dDYkpiSGlXYzh1YXZmNHRVbFMray9tT1NDRFdhMk5DaXhCVUFTTUEz?=
 =?utf-8?B?c0thNE84aFlJVXlwWHFvSXpCek9YL0ltcWE4cnlCK2pGUGRKeVBvV016MTZv?=
 =?utf-8?B?amVLZm5lV1JTbGtZbnNNemlraTd4T1VhYWtBM0w4U2phOVpTbTg1Snc2ci8y?=
 =?utf-8?B?OXd4c1dKUVJnUzVrblJsRlJpNkVRdDNYTHZnQjNiYmp6ZXowMWRkaFRleVdT?=
 =?utf-8?B?MG9FZEZsR3lqVkhYbStHMEJ4cjZ2cFkzQ0VWK2g5RG9xUm0xMDZ2bUdSRXZY?=
 =?utf-8?B?OTRqK0F2OFZRanl5dEhzWGJlU2gzaFlENmpBYkU3dzVSY0MvRDRBaEhvUlMz?=
 =?utf-8?B?dmU5anlxQVQrNnZaQ1pFSzlZbWxBN0J2Q3lNZVkvMTY2OWtpenY5TjBtblFi?=
 =?utf-8?B?WEU5RldwY0ppTVg1Z1hJZ3BYY1ZwclZ2cVRTaFllakNuY0tJbHcvc0Q1N0hQ?=
 =?utf-8?B?eGZLSUFDdXJXc0h5czYzNkx6U3VWYUdHbkFicDBoU0lyMVEvcjR4ejlsZFBC?=
 =?utf-8?B?L3VnbDFRWnV3SFBycGh0bmh1K1NmQW1HNzB3REJaK3dzY3JQK3lBVnZCNTFj?=
 =?utf-8?B?djdLQlM3U1pqQ0lGZUVPZlRyMkN2SUZGc1pQRkxGNmE3b2dWSFdsWnBwWnBj?=
 =?utf-8?B?WVhpZVcyZjFkclZld1hMWUt6S2R5TXpOeis2VnVFU00vUGpGZEtveE8wQll2?=
 =?utf-8?B?NVUzNzJRbEYrVTc3Um41OFFncm9rcnZ3L2hlek9JOVRCenVDdlVPZTMvSmNL?=
 =?utf-8?B?SythVmpDeE9TajNXZFp5d3pnR0QydGJNQ0UvZEVWOXpmb0ZzRlJUL0ZWUDNY?=
 =?utf-8?B?S3p3OWFHTEJTTjAwTmdNWTh5eEFNNkhPMHl4ZjFCNng0SUlUbGRjT1JHM0RM?=
 =?utf-8?B?QWh0akdrc2d3a3BLaWRHb1NGY3RsaGkxOFdkNGFmVVVmditiUk96ZmhHU1Bu?=
 =?utf-8?B?Lzl4RWxUVzVsWkV0SWpqTmlZbnh1MmR0R2huWkF0UTNKekJIdkg5TUEwcGJB?=
 =?utf-8?B?QWhLTzd5a2NEQ1g4bUZ2YjdiNVBhUjIvS2FKQ3FTWTJPZS9ZczJESGYrZC9H?=
 =?utf-8?B?end1d1luWmdrVFRPUTA2SXNEMUVtWk56YkR0VFFtUHM5VjM2Q1dwOWpYNFRZ?=
 =?utf-8?B?OGhsS3VqTFA3anR6TGVCeU1vWlU5ZFp4RG9XaEpDQVJrV3UxeG8xVjEwdzNv?=
 =?utf-8?B?Q3JBL0NhdEdzS2JET29pejNCSUl4ZWNhTGs2YlloWndtTTB5dytUM25UNVJP?=
 =?utf-8?B?Y0Y1UDl4aDF6SEc0UnVrWTBNSjZoTVlpWW8yOENIaUs1cGF4MkZUK0JnZGd2?=
 =?utf-8?B?MGFTZnRvb3VaRFhVZzgyUE1yRVJTZFhTUi93RHErSlNDUXlyaFozRng2eWo2?=
 =?utf-8?B?QURHek1EYTR0QU8yNGRPdi9xOU5XWVl2QW0zZXlpcnA1NFZhVUFNL1FCNHd3?=
 =?utf-8?B?UkZBdnVJWTQyVVd3anNRRm5CL2E4Nm02M3hnaWw2dU1IRUlpazhYa0dRdzBR?=
 =?utf-8?B?QjlNRXNHMUN6MG13YUdBYXdmdFVqbkRJWVJic1VQekJuRnFFTGxHbDlPcElk?=
 =?utf-8?B?aklLcjZFMGxBUVI1bzlCM3F1MFA1aHF1a05vNGVScHpPSkE5OThDYnlHVE1i?=
 =?utf-8?B?OEZaL2c4MzhuVzNRY0t5bHh1V1gxN2l2UEhNYjBNblZzUUdMR0pwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70466c7c-737a-4909-893f-08da2296386d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:23:01.2081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGTrtn9kwwi10WF3qsLgYXX3ZWJJEJHUPVL6EvqKbkEopeTTb25bhkogL17zNsm2uCXtacq/xxKxI7fR9yKJbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3500
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTEsIDIwMjIgNTozNyBQTQ0KPiANCj4gV2hpbGUgOTdhZjA2MmI4OWQ1ICgiSU9NTVUv
eDg2OiBtYWludGFpbiBhIHBlci1kZXZpY2UgcHNldWRvIGRvbWFpbg0KPiBJRCIpDQo+IHRvb2sg
Y2FyZSBvZiBub3QgbWFraW5nIHRoaW5ncyB3b3JzZSwgcGx1Z2dpbmcgcHJlLWV4aXN0aW5nIGxl
YWtzIHdhc24ndA0KPiB0aGUgcHVycG9zZSBvZiB0aGF0IGNoYW5nZTsgdGhleSdyZSBub3Qgc2Vj
dXJpdHkgcmVsZXZhbnQgYWZ0ZXIgYWxsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+
IEBAIC0xMjM4LDggKzEyMzgsOSBAQCBpbnQgX19pbml0IGlvbW11X2FsbG9jKHN0cnVjdCBhY3Bp
X2RyaGRfDQo+ICAgICAgZHJoZC0+aW9tbXUgPSBpb21tdTsNCj4gDQo+ICAgICAgaW9tbXUtPnJl
ZyA9IGlvcmVtYXAoZHJoZC0+YWRkcmVzcywgUEFHRV9TSVpFKTsNCj4gKyAgICByYyA9IC1FTk9N
RU07DQo+ICAgICAgaWYgKCAhaW9tbXUtPnJlZyApDQo+IC0gICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiArICAgICAgICBnb3RvIGZyZWU7DQo+ICAgICAgaW9tbXUtPmluZGV4ID0gbnJfaW9tbXVz
Kys7DQo+IA0KPiAgICAgIGlvbW11LT5jYXAgPSBkbWFyX3JlYWRxKGlvbW11LT5yZWcsIERNQVJf
Q0FQX1JFRyk7DQo+IEBAIC0xMjYwLDggKzEyNjEsOSBAQCBpbnQgX19pbml0IGlvbW11X2FsbG9j
KHN0cnVjdCBhY3BpX2RyaGRfDQo+ICAgICAgICAgIHByaW50ayhWVERQUkVGSVggImNhcCA9ICUi
UFJJeDY0IiBlY2FwID0gJSJQUkl4NjQiXG4iLA0KPiAgICAgICAgICAgICAgICAgaW9tbXUtPmNh
cCwgaW9tbXUtPmVjYXApOw0KPiAgICAgIH0NCj4gKyAgICByYyA9IC1FTk9ERVY7DQo+ICAgICAg
aWYgKCAhKGlvbW11LT5jYXAgKyAxKSB8fCAhKGlvbW11LT5lY2FwICsgMSkgKQ0KPiAtICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCj4gKyAgICAgICAgZ290byBmcmVlOw0KPiANCj4gICAgICBxdWly
a19pb21tdV9jYXBzKGlvbW11KTsNCj4gDQo+IEBAIC0xMjcyLDcgKzEyNzQsOCBAQCBpbnQgX19p
bml0IGlvbW11X2FsbG9jKHN0cnVjdCBhY3BpX2RyaGRfDQo+ICAgICAgew0KPiAgICAgICAgICBw
cmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVggIklPTU1VOiB1bnN1cHBvcnRlZFxuIik7DQo+ICAg
ICAgICAgIHByaW50X2lvbW11X3JlZ3MoZHJoZCk7DQo+IC0gICAgICAgIHJldHVybiAtRU5PREVW
Ow0KPiArICAgICAgICByYyA9IC1FTk9ERVY7DQo+ICsgICAgICAgIGdvdG8gZnJlZTsNCj4gICAg
ICB9DQo+IA0KPiAgICAgIC8qIENhbGN1bGF0ZSBudW1iZXIgb2YgcGFnZXRhYmxlIGxldmVsczog
MyBvciA0LiAqLw0KPiBAQCAtMTI4Myw3ICsxMjg2LDggQEAgaW50IF9faW5pdCBpb21tdV9hbGxv
YyhzdHJ1Y3QgYWNwaV9kcmhkXw0KPiAgICAgIHsNCj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgVlREUFJFRklYICJJT01NVTogdW5zdXBwb3J0ZWQgc2FnYXcgJXhcbiIsDQo+IHNhZ2F3KTsN
Cj4gICAgICAgICAgcHJpbnRfaW9tbXVfcmVncyhkcmhkKTsNCj4gLSAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7DQo+ICsgICAgICAgIHJjID0gLUVOT0RFVjsNCj4gKyAgICAgICAgZ290byBmcmVlOw0K
PiAgICAgIH0NCj4gICAgICBpb21tdS0+bnJfcHRfbGV2ZWxzID0gYWdhd190b19sZXZlbChhZ2F3
KTsNCj4gDQo+IEBAIC0xMjk4LDggKzEzMDIsOSBAQCBpbnQgX19pbml0IGlvbW11X2FsbG9jKHN0
cnVjdCBhY3BpX2RyaGRfDQo+ICAgICAgICAgIGlvbW11LT5kb21pZF9iaXRtYXAgPSB4emFsbG9j
X2FycmF5KHVuc2lnbmVkIGxvbmcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEJJVFNfVE9fTE9OR1MobnJfZG9tKSk7DQo+ICAgICAgICAgIGlvbW11LT5k
b21pZF9tYXAgPSB4emFsbG9jX2FycmF5KGRvbWlkX3QsIG5yX2RvbSk7DQo+ICsgICAgICAgIHJj
ID0gLUVOT01FTTsNCj4gICAgICAgICAgaWYgKCAhaW9tbXUtPmRvbWlkX2JpdG1hcCB8fCAhaW9t
bXUtPmRvbWlkX21hcCApDQo+IC0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gKyAgICAg
ICAgICAgIGdvdG8gZnJlZTsNCj4gDQo+ICAgICAgICAgIC8qDQo+ICAgICAgICAgICAqIElmIENh
Y2hpbmcgbW9kZSBpcyBzZXQsIHRoZW4gaW52YWxpZCB0cmFuc2xhdGlvbnMgYXJlIHRhZ2dlZA0K
DQo=


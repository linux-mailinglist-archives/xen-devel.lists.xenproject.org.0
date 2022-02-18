Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924D4BB424
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275202.470965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKycB-0004ar-V9; Fri, 18 Feb 2022 08:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275202.470965; Fri, 18 Feb 2022 08:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKycB-0004Yl-Ru; Fri, 18 Feb 2022 08:27:43 +0000
Received: by outflank-mailman (input) for mailman id 275202;
 Fri, 18 Feb 2022 08:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKyc9-0004Yf-B1
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:27:41 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09246f6-9094-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 09:27:39 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 00:26:38 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2022 00:26:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 00:26:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 00:26:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 00:26:37 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3915.namprd11.prod.outlook.com (2603:10b6:5:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Fri, 18 Feb
 2022 08:26:35 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:26:35 +0000
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
X-Inumbo-ID: a09246f6-9094-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645172859; x=1676708859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l/f5xypZqjw2suVXTiTVySGThvVTUm5eh/LMP1QVt+c=;
  b=hO6OdeSOPIfQW/DghDsAjQXZVTp1wUUNNzxEQWCRsZJ+h5D0Fq1BM14i
   z2BxPQmA1700z/X/QXWQjR00yFus0gJOuIm4PA9aFDoKezIOl+DGpOg7h
   o8nMRqFoKNuApWFccWWnXKrGfabduFf4A1OmX3eJhgm5ejkyXI6uBjDRn
   U0Ne+eIj/PXdbxPG9T+y6f8liZ+6RgVV8T/hRaDvACZux+zp37ar0mChM
   dr13gkrrB4qjZR8gYw58SsZRN6jZWkR5eADcMHAlI5Lbi0bq9FtOlieDh
   iQ/fyn9Lg6KtlMv32U/D7eKQ3XC7TJMq2+FrcSYqh4fciiuUgGGUgCkVq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251279878"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="251279878"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="637670128"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Ga0UM1ZylmcVtZYWH5ME0FhcyQsYqpYOaYtXqHHA9HfcqCVKZPlBhaCDekbrKVnps7AJjlepJW/wL0yBHOaGgl/pswgwYqOw4XRy21NSExJ1LMiBWCzlz9UD0gpAz6AME5oxrNujMNGs/ZlvKDEcYTuiw1fkU6zNiFshriyvNBbbTQ8LiI7TDUjkJKXwFmNzkuF/AHW4RGFQKXtx6JkfZvYu9hDnzyRhXrmFTnflgciacALwjRyYi3zsrhAEpe8LFPAvtqzQFJs4/zMCB7ihhKkNS4IU3Mp/q3yT7/Bf75fiUT855nNci6CmdztzIU1yGpeYmyH+zIJjCpzWw11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/f5xypZqjw2suVXTiTVySGThvVTUm5eh/LMP1QVt+c=;
 b=oCMXcXGytK1Q881eNOtXC1gdaat18ltby+j/xN2WyJEQA3iIfuINAbdpMZ9UfyDzPYjfg6JyX0/ZBEGPm4RZbQRZVptjEfScF0OD+v9luUhmjTdnvcr1PqZ3feQC16dS5fVWXVyNPyWvPNrt/vpQh/WVSEl/y4wSluPeBFHH2BlJ/PVFt2GFv5BY/kURXDG1BwwbwavArXy9j8CHpWQS0tfyiXVVla0EeWqOn+Plhy24k75mm0rbWZROWLpnwQE6jChJNnSIKCCVdMmg9S6fi6QgVCG5HWyDO+7NOHKnLrmQcwAtVS/TeEC39L3oZ2vVwQuNvGKVq2zInZbOS9U4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
Thread-Topic: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
Thread-Index: AQHYBkAJc6JSR61nEESS/gtIFkcsm6yY/BvAgAA5aYCAAABjEA==
Date: Fri, 18 Feb 2022 08:26:35 +0000
Message-ID: <BN9PR11MB52765F822E3D17CAB12817AC8C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <b985d619-05ea-73c1-1919-b0343e5a9b8e@suse.com>
 <BN9PR11MB52763A2638F1460EC83420B38C379@BN9PR11MB5276.namprd11.prod.outlook.com>
 <78991818-ca76-2065-3511-f7e62a3f2e0c@suse.com>
In-Reply-To: <78991818-ca76-2065-3511-f7e62a3f2e0c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00f23e28-4363-4b7e-3acd-08d9f2b860aa
x-ms-traffictypediagnostic: DM6PR11MB3915:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3915DD4F6B6C2C861D3EFD108C379@DM6PR11MB3915.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TspQshZLq8ar8K8xIi076ax7oisbRYOiBIaqZajfvYr0xLcDwJ9PdXrVynHx8/wFjqYSfNPff5U7lwFNlArHWHUiOsLKSkwtU72Z4qlABSjGeSi6YvX90ngSxb2xox7vFBOok2mVj36uB6ty1P260sSBmm8jWGMGa8oPYfzfsqM1yjTFOWh+r+/WBg43Hq0907Np49CnpopaB4IQG4FM5TmkqGAojETsrLuGecrva+vlphwuvW4LE6ESXDjbeuN/PonUCIloKHlZyVp49gpo/HKIaL+KjXBroIs9gWCYIsX6/B9FUGF1czDVPsdXZoUA6bWYDd11VbTSWV6z+icq5GQpzPiBssrHHT8ShsL77p2UItrDtLR1pzLq3gCzFw0bogJgNiFyfVzLqSoCm6Y/cmXwq2FCfp+bWtvBiZ1FpkHWksernZSpMAC7ipxWd3aBAFQKVki9moo+1nW17ugBSCcb+36hmnFITNRkwMvCNjGkXtW2D+RMjMVPGGqXDYzXm7LwqjYLBai18c80LBuHO/euJJ+kObrhTaSFGEXUqmrNdQEtbq1xfG5KtK/myi5jNFNn6dUpBT3oaEMQ+bynNQIkmWtxV18iNA3QB4U2051uXaI+gowcgnMefryjerHesSkCniDka1trhUtnTVDeQLWmaad+skh+jgm18HP409nUqFA4PRkP59cvfUgxyZMEtdtlNSeDizFRSFgBWhQCAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(76116006)(6506007)(122000001)(508600001)(38100700002)(186003)(52536014)(2906002)(82960400001)(5660300002)(8936002)(66476007)(83380400001)(53546011)(86362001)(38070700005)(7696005)(66446008)(64756008)(66946007)(66556008)(8676002)(26005)(54906003)(6916009)(316002)(9686003)(4326008)(55016003)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmYxQ2JmbnhnMnBXdHVCMHlEc3Z3V1hqRFNXTHBrcjNHNUdKVGlMVU5vdXox?=
 =?utf-8?B?RGFTK1lueHpMMGg5aW5CN0t1a2NlMlpWa2ZUKzBvbi81TFZnK014TGMzNi9M?=
 =?utf-8?B?aTI3MEdRWWRRSHM4eDFSTmF4K0FDdjljVUF0UGwwMUI1MnRYdVJub1I2RTc3?=
 =?utf-8?B?UEQzUjVnR1BsTEFOWEN5RTc3OFdnR0xyVGsvbDY0TU9sRTBQbGlPN1orcmtE?=
 =?utf-8?B?VE9kOXM5cStUb09UZHhrZUZLZjJHaHI3bmdtK1N0cXhYUlJUbWZoQlhLQktT?=
 =?utf-8?B?NGJpN3VzOWF5WTZwUkNGSjNkbTZGOWF3amVZaUpvYlpxSmJkLy9vRGo5ZFZE?=
 =?utf-8?B?cFFwVnJYNTVMdzVSTjZ0QXlXMWF2Qk9NdW4zQUxic1lZOVU5RkNsVDYvL2ly?=
 =?utf-8?B?R2lGYXltRDl0M0lYWkpQTFYzeHN3K0wrOFFXN2Z6c3Q5M3FlcFRRcVd0b24x?=
 =?utf-8?B?OUdhS01wTXM5WWxQV0VzKzJjekNSb2ROSUNwVC9PMHprb1BhR1dsbVBKYXps?=
 =?utf-8?B?bWtTM1JtOU9EMElnSlFERFBVNVcrUisyV1FKR2F1QWhKV3BpMkRjUWpzQ0V0?=
 =?utf-8?B?WDROT252RU5INzBLclNISCtzTzZBTzVrMDV5VFlOVXByRG1YMzh2cDZJSFA1?=
 =?utf-8?B?eGNRLytzaStjRFQ3eHNybjI0ODd3UnJZM2ZUcWdwSTZ3VDlmV0NKTmkxWGZW?=
 =?utf-8?B?Tmp2dEZPdy9MUmpMeGQrTWFLVjZPNXh1eVp1Z0ZHcEE3YjJKUEErWjFZVWRu?=
 =?utf-8?B?Z0srdlFYWTZSRmZlMTVyQWUwSmJITHo2T2V2SVVPTjh4UFQ2QTNjNklYL2lU?=
 =?utf-8?B?QWxFNFdVdmVONWpjclFvdUV0QzVWeGQ4OTRHSkFXaUo0OGt3YkFQcmxDMUUx?=
 =?utf-8?B?Rk9nUGNFQS9jZDE5TTBtd3dHUXIzeWVjcW5yMGhOcUk2TlNwS0lHRHhwbUdL?=
 =?utf-8?B?YjV6TlVlVHgwaElkTjJlVTFqZ3kzYi9aZ0xMbUdxbDFjbjAzQk5xZjNEWlFz?=
 =?utf-8?B?MjdyUWpXTzhKZmhTckFaampoaTFudUhFTTc2bGZBS1dSemVDS0FPR2w4M0t3?=
 =?utf-8?B?ZHZjS2RTcWZTRldtaFA0TDV1RU42Y3NDaEpPMmU5bFJSaGVlUkNTN0IyWm1r?=
 =?utf-8?B?cmNIQUtoSzFrSUZnQm5ldFMvL3FrOVh3Q0F6eEhhZVNaV2tiejd4cDdJQXVM?=
 =?utf-8?B?S0NJVjhPZEF6RWRVNXU0UkNtNW1VckZGTWJRRy83YkpsWkdCSFhrdnJYUlZ3?=
 =?utf-8?B?Mkd0cE5BY3ZEczJpMFQ4Z2RhY2wxMHQyUDlEdVk2SVVpeGMvL1Q2OEltMFVJ?=
 =?utf-8?B?UWtGNTFGMWRHalBrUXgzVHNBeWxTRFo1OW1DUWNDazlydWFMQ05SZytRRCtm?=
 =?utf-8?B?STRWMWQrMmN2K0F4RDNGNjJBY2dLWUFuRWZjNnF6MHFZWmRJNnRpSUFKZmNX?=
 =?utf-8?B?b04rS1BsdS9JSXB2dGVtQkVPZGRwTEZNVG02WE1DV2ZTZEp1bFlQNU9oT0l1?=
 =?utf-8?B?RStMVXoxdFpzREtrNWtqWHJzZkVienlVU0txNjFjNklOQjdvMDRaMGJQY29J?=
 =?utf-8?B?ZS9aejV5cUMwN0Q5bHhtQkFXTHZWTVF3RFN1SkFNMnBXZ2NmV0xvdXk2Y0VB?=
 =?utf-8?B?QjVVZU9hZWVpTXhucFh2SndTSTBBaEhtTkwvK1A3STBSRGFLeWx5S1ZWQVpx?=
 =?utf-8?B?QWlEak1xZUQxVGI1b3BiVDRTMlNYMXI3WUtMUkxCT21KeWxWMG1wZTNJaVht?=
 =?utf-8?B?VkV2TnhONGhrY1hpa2dTY1R3Q1owZTFPS0tWT1VwZWd2Y2hQenpzODMzeVJB?=
 =?utf-8?B?TnNVTjJ1TDAyYU1qTEF1ODAzc0FKNFpWeGdEY0hlL3NSWTlyS1NYdW93Smdy?=
 =?utf-8?B?cUhrZFE2d0JFMVdXOWlxK3ltdHo2S04zZVduVG1jVkhyZFcyQmJEdHprSVd6?=
 =?utf-8?B?bEMyR00rcTczNmppVDFrMGxQcHUzYXFLcEpXcUFYNlpMY09HVW5yaDZOTlRP?=
 =?utf-8?B?SHIzWGZPL25tSVRydmRpT1RMaU9XbE4xZHhCRU51Y2xWUEpWc2tHRGpvOUUv?=
 =?utf-8?B?WlpFK1VUOEtzQzJVTndEeUI2RldPa3VzWkJ1WWFRbyt2Tmh3TGJlSjZlcFlC?=
 =?utf-8?B?QUVXRXRzL1lqczlDR2lPNEFmcGVQSmJ3aWljOEJLVXkxaWs5WFNFNEcvY2ds?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f23e28-4363-4b7e-3acd-08d9f2b860aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 08:26:35.8527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NqJE7CmSxn7EqmmEG8H32HYTg/S/W7560LQmZPE2RRXFRRraPD5BL3Bw7T+4OoY2Dzhl4vddU3lH5+mTQGSCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3915
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RmVicnVhcnkgMTgsIDIwMjIgNDoyNSBQTQ0KPiANCj4gT24gMTguMDIuMjAyMiAwNjowMSwgVGlh
biwgS2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxMSwgMjAyMiAxMjozNSBBTQ0KPiA+Pg0K
PiA+PiBQYWdlIHRhYmxlcyBhcmUgdXNlZCBmb3IgdHdvIHB1cnBvc2VzIGFmdGVyIGFsbG9jYXRp
b246IFRoZXkgZWl0aGVyDQo+ID4+IHN0YXJ0IG91dCBhbGwgZW1wdHksIG9yIHRoZXkgZ2V0IGZp
bGxlZCB0byByZXBsYWNlIGEgc3VwZXJwYWdlLg0KPiA+PiBTdWJzZXF1ZW50bHksIHRvIHJlcGxh
Y2UgYWxsIGVtcHR5IG9yIGZ1bGx5IGNvbnRpZ3VvdXMgcGFnZSB0YWJsZXMsDQo+ID4+IGNvbnRp
Z3VvdXMgc3ViLXJlZ2lvbnMgd2lsbCBiZSByZWNvcmRlZCB3aXRoaW4gaW5kaXZpZHVhbCBwYWdl
IHRhYmxlcy4NCj4gPj4gSW5zdGFsbCB0aGUgaW5pdGlhbCBzZXQgb2YgbWFya2VycyBpbW1lZGlh
dGVseSBhZnRlciBhbGxvY2F0aW9uLiBNYWtlDQo+ID4+IHN1cmUgdG8gcmV0YWluIHRoZXNlIG1h
cmtlcnMgd2hlbiBmdXJ0aGVyIHBvcHVsYXRpbmcgYSBwYWdlIHRhYmxlIGluDQo+ID4+IHByZXBh
cmF0aW9uIGZvciBpdCB0byByZXBsYWNlIGEgc3VwZXJwYWdlLg0KPiA+Pg0KPiA+PiBUaGUgbWFy
a2VycyBhcmUgc2ltcGx5IDQtYml0IGZpZWxkcyBob2xkaW5nIHRoZSBvcmRlciB2YWx1ZSBvZg0K
PiA+PiBjb250aWd1b3VzIGVudHJpZXMuIFRvIGRlbW9uc3RyYXRlIHRoaXMsIGlmIGEgcGFnZSB0
YWJsZSBoYWQganVzdCAxNg0KPiA+PiBlbnRyaWVzLCB0aGlzIHdvdWxkIGJlIHRoZSBpbml0aWFs
IChmdWxseSBjb250aWd1b3VzKSBzZXQgb2YgbWFya2VyczoNCj4gPj4NCj4gPj4gaW5kZXggIDAg
MSAyIDMgNCA1IDYgNyA4IDkgQSBCIEMgRCBFIEYNCj4gPj4gbWFya2VyIDQgMCAxIDAgMiAwIDEg
MCAzIDAgMSAwIDIgMCAxIDANCj4gPj4NCj4gPj4gIkNvbnRpZ3VvdXMiIGhlcmUgbWVhbnMgbm90
IG9ubHkgcHJlc2VudCBlbnRyaWVzIHdpdGggc3VjY2Vzc2l2ZWx5DQo+ID4+IGluY3JlYXNpbmcg
TUZOcywgZWFjaCBvbmUgc3VpdGFibHkgYWxpZ25lZCBmb3IgaXRzIHNsb3QsIGJ1dCBhbHNvIGEN
Cj4gPj4gcmVzcGVjdGl2ZSBudW1iZXIgb2YgYWxsIG5vbi1wcmVzZW50IGVudHJpZXMuDQo+ID4+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Pg0KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4sIHdp
dGggYSBuaXQ6DQo+IA0KPiBUaGFua3MuDQo+IA0KPiA+PiBAQCAtNDc4LDcgKzQ3OCwyOCBAQCBz
dHJ1Y3QgcGFnZV9pbmZvICppb21tdV9hbGxvY19wZ3RhYmxlKHN0DQo+ID4+ICAgICAgICAgIHJl
dHVybiBOVUxMOw0KPiA+Pg0KPiA+PiAgICAgIHAgPSBfX21hcF9kb21haW5fcGFnZShwZyk7DQo+
ID4+IC0gICAgY2xlYXJfcGFnZShwKTsNCj4gPj4gKw0KPiA+PiArICAgIGlmICggY29udGlnX21h
c2sgKQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAgdW5zaWduZWQgaW50IGksIHNoaWZ0ID0g
ZmluZF9maXJzdF9zZXRfYml0KGNvbnRpZ19tYXNrKTsNCj4gPj4gKw0KPiA+PiArICAgICAgICBB
U1NFUlQoKChQQUdFX1NISUZUIC0gMykgJiAoY29udGlnX21hc2sgPj4gc2hpZnQpKSA9PSBQQUdF
X1NISUZUIC0NCj4gMyk7DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgcFswXSA9IChQQUdFX1NISUZU
IC0gM3VsbCkgPDwgc2hpZnQ7DQo+ID4+ICsgICAgICAgIHBbMV0gPSAwOw0KPiA+PiArICAgICAg
ICBwWzJdID0gMXVsbCA8PCBzaGlmdDsNCj4gPj4gKyAgICAgICAgcFszXSA9IDA7DQo+ID4+ICsN
Cj4gPj4gKyAgICAgICAgZm9yICggaSA9IDQ7IGkgPCBQQUdFX1NJWkUgLyA4OyBpICs9IDQgKQ0K
PiA+PiArICAgICAgICB7DQo+ID4+ICsgICAgICAgICAgICBwW2kgKyAwXSA9IChmaW5kX2ZpcnN0
X3NldF9iaXQoaSkgKyAwdWxsKSA8PCBzaGlmdDsNCj4gPj4gKyAgICAgICAgICAgIHBbaSArIDFd
ID0gMDsNCj4gPj4gKyAgICAgICAgICAgIHBbaSArIDJdID0gMXVsbCA8PCBzaGlmdDsNCj4gPj4g
KyAgICAgICAgICAgIHBbaSArIDNdID0gMDsNCj4gPj4gKyAgICAgICAgfQ0KPiA+DQo+ID4gc29t
ZSBjb21tZW50IHNpbWlsYXIgdG8gd2hhdCBjb21taXQgbXNnIGRlc2NyaWJlcyBjYW4gaW1wcm92
ZQ0KPiA+IHRoZSByZWFkYWJpbGl0eSBoZXJlLg0KPiANCj4gSSB3b3VsZG4ndCB3YW50IHRvIHJl
cGxpY2F0ZSB3aGF0IHB0LWNvbnRpZy1tYXJrZXJzLmggZGVzY3JpYmVzLCBzbw0KPiBtYXliZSBh
IGNvbW1lbnQgcmVmZXJyaW5nIHRoZXJlIHdvdWxkIGRvPw0KPiANCg0Kc291bmRzIGdvb2QuDQo=


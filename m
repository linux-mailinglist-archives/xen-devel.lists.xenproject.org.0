Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01869711F04
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 06:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539943.841299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PSe-0000i7-6X; Fri, 26 May 2023 04:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539943.841299; Fri, 26 May 2023 04:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PSe-0000fm-2k; Fri, 26 May 2023 04:53:56 +0000
Received: by outflank-mailman (input) for mailman id 539943;
 Fri, 26 May 2023 04:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+8a=BP=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1q2PSc-0000fg-6J
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 04:53:54 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d12878f-fb81-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 06:53:50 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:53:47 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 25 May 2023 21:53:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:53:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:53:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:53:46 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 04:53:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00%3]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 04:53:41 +0000
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
X-Inumbo-ID: 4d12878f-fb81-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685076830; x=1716612830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SaulrSyKYfs1/+/Q4ScjH2ac5iTQsTWF0ItlPcCb8aE=;
  b=F4DBqIupzZuM+pPwscmy3x6w1Q6RZwvzGv1Nhz5floig20TDmvk1cGMg
   eQT5ec2KPU+OZxwCZrTGgR/RPHnDTbfIXlxQOiIq16h1tMhTLggQadD07
   V1faMLddAMUr/8EFV6buwWRQpihjWkxLnmwLcd1tV3lL6l04RlbcsP5vM
   4yi8wotZFfME9IQZfjer44y1fMhlBktLu3iLAmKnqB1PcxnRShMd+fm+d
   IWAYkZbQ6MFRhQ/1nZqDwFtrR5jpW1PC0DnO2/1s5rlcvKcvpGNDoL9zY
   j97DSzXPdpmtj8l2UzpDxWjhZDIKnI4fzr29FExhVI2JL/IMvaD1jqn+8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419872241"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="419872241"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="829363785"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="829363785"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3orqFzX26qLaAQ7ZAwOlOYkJ0LwR87NDhxkc5f6o5GPvkHwM0GpmVXcjc75r/BUJYoxZipkn+gc78EYdU9II8NzsiP06S5KRvy9eI58oDn0NbMXPNJRWX/mm0sGUgxkUOyKm5aBe6CgNkqNfKQWNr3M7hIeR9Vq+kwXR96epFZeXSucMM2pdGIOd9a6LD5lfzDHWeHvPfLGwF++a3WtXLipazNInTYZ0HsHMq0AAcNPTD+1qir6Tv3E736aArr5CL4HvJKf0EkpLDjbG9nt06UrSGz4xBqyRGxe99dglEJba9P6zYsxsn/53SkSXeG1m2WTNy+1KRLuqAJoFczagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaulrSyKYfs1/+/Q4ScjH2ac5iTQsTWF0ItlPcCb8aE=;
 b=lq7ZS2TUjhMgBR0VogLGsRcB3ifIkAQXspk/oH++Xm0UU4C3ObBbg5ilWGdh6d2CTEGvIewen8oAqgGrQHfZyoaruaV213vV8RInjDXeWyq3omlIbF7BOrSSi3Z5EDaJotFiGU9XF23n7E/kRGjcyaONPf1NIaJtwmgFuf1iTup7GKN1f2dpycrB/p9awMgGG5rcaZ50FwaMw6ps6Udssokw99v96QkhTL8g0Fxe3xxXBZhUhKpREjWZohMcIThqCnAJdHIRUhPC1uGlnZ577a7WKDjGIOiMPv2KrYsH8dtFQ3SYYq5eukmF2h33Z759NODdpt8hyt1ua+Fo4lUV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH 1/2] VMX/cpu-policy: check availability of RDTSCP and
 INVPCID
Thread-Topic: [PATCH 1/2] VMX/cpu-policy: check availability of RDTSCP and
 INVPCID
Thread-Index: AQHZeD7CR06R3EJga0ikV9LB8IqFva9sK3uQ
Date: Fri, 26 May 2023 04:53:40 +0000
Message-ID: <BN9PR11MB5276D6B7DEB5B1EA91F3B0498C479@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
 <cae19837-31f6-9fb3-5c90-37aaf8920594@suse.com>
In-Reply-To: <cae19837-31f6-9fb3-5c90-37aaf8920594@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: 844e1fab-f5b5-4044-5ef3-08db5da52d13
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBBBZ7Vd4bPd+A9BilqnAZnDIWVPD9+ZhgLR/OUVscwLqXGvUYfCqvaVqiGyINjgxBoxhd0i+5S1VqkDfi97sQxrg5PSr6yMDy1Sr3OtsXFjZmuXAasOwnEfHyqwaUvmYmwQepbE0xdDpcpsVYG5LttBpxEi8dxpnRQd9bLUJOKu/HwW2rX9ID4CqhsqGjTC59sWE5N9HJ8z7UPLQUEh1+A398i/jzqQycmRz+4Bxw85JnAxTQpwqNrZ5KhWLH19r9v2aLKkECyKgf7/6PJO/SnoRn4sDw+nCjv7Ijeq+LrB3Ejt7E4gmyeCkbdZwjj88mxHFJgEKlLq+1g6cYKQgVannCxodwTFLCBjKuRKS73FnO5KBCVCb+OfXhXXS4PO+XlL/pMG0YPpHMEPYI1JEU3/iNds1bawHYe6vVNzGHTDuZym5IaB2BHUgTd3btopNFv+X1XpLu5pxkdIl5Qg7sURffyq275wEXaO74ZNvNDftUqLej60HU1Rxvsxd7IGn5s1ClT4mrrHiVkGaEFLk67TuaoMPQAa2zKwMBqajWrXGk85BryPAt3+ho2YcZNd85uVywVGvUcjid74CkCOU7A43NAV/Lg4Le4kNxmrLG/5c+v6E2YrRTQGCNLJDgL1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(122000001)(316002)(71200400001)(52536014)(26005)(9686003)(76116006)(6506007)(82960400001)(107886003)(66476007)(66446008)(64756008)(66946007)(66556008)(4326008)(38100700002)(5660300002)(55016003)(33656002)(41300700001)(7696005)(8676002)(8936002)(86362001)(478600001)(54906003)(110136005)(186003)(4744005)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFdYYU9KOEV1NGpNdXgwb3BFU3lYbHNnS0xXOUVvWDNkczFCUnNhNU9EdjY2?=
 =?utf-8?B?WjgxT3YxbVJDZ1U2alhtTFE3eFhXMm5pYkR5cGNUVWpLR3FacC95MDF2VDBS?=
 =?utf-8?B?dEcybGNLNU5TOVQ3VE1jb0FsNUJOUURYVzFDeDc4bHc0SkRBWklhUW9RN05t?=
 =?utf-8?B?ZUw3UnVaQml1OHZtWHZuYWUwT0MzMWtpdG9zSEpJMVFtSnUyWm5MWCsyZGgr?=
 =?utf-8?B?MXhHU2ZwYXRwR1laMFM3QW4xZEJlRCtGOStBL2VHZEJyOEFoRkVzbmlRZW85?=
 =?utf-8?B?MVBLMmJyU2x2UzBnNlNCSGw4bFFoL21NRVEyZmd0WnpWV2VRM0IyZWUwYUVQ?=
 =?utf-8?B?YWZRRmdleFJObDJjd0NSWEM2Tno4Y0krVVdNY0loeUxaV01IdndLZnAzcFNL?=
 =?utf-8?B?K3BtVkJvbmd6TDJhdUVSSDJTNUlxYlBIL05yanZ6SUtLMDd2UUpncjBBcnpX?=
 =?utf-8?B?ck5KK0lWYjhxamNRT21JZE9tZkJMSGlvSW1hbExqNm4xZ0k2VXNBck81WlIr?=
 =?utf-8?B?RGFCSFFIRkpScmx4M1g1U0FzM1NWc0JRenA2TFJ1N0Q1WTVkajBkcjN4T0Zo?=
 =?utf-8?B?SWNmS2RkT3NVaUVQR3FOR1V5NG1DdlNnbm1FZmttemZ4WGFBMzlOanVRN2p5?=
 =?utf-8?B?TUhuRUFwYVNrcW03R3hNR1Rta3A5Ylh1WUJUdlpCemdhenJLRWVpR1IyS0Zu?=
 =?utf-8?B?UDBRb0tCVXdYMkxMejdLZkQ0TTJhOHFWM2xoZ3lpRDFEem5idGx3VzVoMGgr?=
 =?utf-8?B?K2VQaGZKWm5qbUFNcXFPSHV0YmJpZDhiMlpnZFIzRlc2aFJVTVBpaXR2ZjQ5?=
 =?utf-8?B?a1VPa0tUckxHNTJtb0krUVUrL1NVUWZpZUorOGlJSW1GaHk2T29SNzJKRlZ0?=
 =?utf-8?B?L2JOR0o4a0pnN2dMTmFxaWhZbEZJUjZ3TXlrNUVXZDlOdytkaTFaaU5FSUZx?=
 =?utf-8?B?am94SzBCRVFNa2lDRjdMWUtubTdnd1Q1aUQzQSs1aEtHSGNOSWF5WEhkV0dH?=
 =?utf-8?B?S0JPUnl5V3NQSmgvV0Y4dWhoNVNJdkxncVpWTDVxbXMvcmZYeTkyZFAxQm9n?=
 =?utf-8?B?eTlVTWdBV1kxWUVlaU1JNTdZVktlVmdiZ0NPdUt3VUZ2eXBQSDdNSjN4T3RO?=
 =?utf-8?B?dDhLWEdiaDFJdFphc1lpT1Avb3RWQlc2cHhqaHFSb2dsQXgyQmkrSDN4UTYr?=
 =?utf-8?B?Zjl1MWRBV1pmUzIvN2ZBTTMybXlpYXR6TEVCbFoyZW96VlR6THR2eW5aU0U0?=
 =?utf-8?B?OVFEaWwvNDdnWWRqRzFBbDBvUmNCL3FoK2ZmMzBVNzY3T0VqaXBsTEhPb2Jn?=
 =?utf-8?B?WlZ3U3pycmh2Y0ZVMzI5am5WcDdHMkNQRXRUdTZ4TWQyby8xTHhYOTA5UitK?=
 =?utf-8?B?b0ZyOUNjbWtJNEtkZ0hhK0lvZi84K1MrRXlFTzJ1SWswMEVtS0VodXhSSVJi?=
 =?utf-8?B?MTJLVVA5SVFrUDJDTFlLbGpDKzFhSkRrT1EwLzk1a1RvcUJaQ05hYU9TTHpQ?=
 =?utf-8?B?LzdnUEhTNjQ5MDlPem01YmxzUXZ6UkcyWW1ZUDVFb1hzWGtIS3RObGlxcjM4?=
 =?utf-8?B?N0t4WUpwS0hlUzVHbGpRZEw1TXg3dVpxMzMvR3VidzRyTTNPRE9TYXZ1ZXg5?=
 =?utf-8?B?S25rc1FGdnJHZk5tSGNtbHRJWmhzYlVxcG90ZlQ4Si9nMWFpNFZRMWNRZHBG?=
 =?utf-8?B?ZEVieVE0a2VOQnREaHRpVVVDMEw0UHVjR3huNFBzYUV6R0YwRnNSSlBPRE5n?=
 =?utf-8?B?VFEzbTRaZ2k2Yk9uMkxqc2lvaHdKK2paWnpZYjZPeXhsNjJCYnRoL2NGYkVm?=
 =?utf-8?B?MkxJMkY0MmpVOFJCTkxFNi91Nk92YnZDNTRraUc2bGFFM2VuM2x5TVBTSXNx?=
 =?utf-8?B?Y1k1SEZpaUV1Ujh0Ylp2aGtuS1RGQ2ZoZTFuaFc5ZDZGZDMvYUZ1cVd4TVZs?=
 =?utf-8?B?a05BOTFwLy9iWUlvaUNLaTlrOHZVSisyUjNJR0hpeUxWZzQydkRWdVZKZnBV?=
 =?utf-8?B?MjIxbWpGbXFEYW9tcmk2dDk5RU9UU0hpbWVIeVZRdU1HOFpKMlpuSm9JelFF?=
 =?utf-8?B?Z01EY0Y2cXJJUStidkZkZnNxQ0NUTGxvNjZlQlVtMTAweHBmWUZrL2hUMGt5?=
 =?utf-8?Q?CYuD5p90+yHKo9KR7E3GXNiZZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e1fab-f5b5-4044-5ef3-08db5da52d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 04:53:40.9818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qm7OYwW+u/vtORHWAKH7b3xofd+4VjziMKoY4oky3CEyTGVZPymy2rslwbxm810zog/8rNG/eAL/TXBmu2lP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMjYsIDIwMjMgODo1OCBQTQ0KPiANCj4gQm90aCBoYXZlIHNlcGFyYXRlIGVuYWJs
ZSBiaXRzLCB3aGljaCBhcmUgb3B0aW9uYWwuIFdoaWxlIG9uIHJlYWwNCj4gaGFyZHdhcmUgd2Ug
Y2FuIHBlcmhhcHMgZXhwZWN0IHRoZXNlIFZNWCBjb250cm9scyB0byBiZSBhdmFpbGFibGUgaWYN
Cj4gKGFuZCBvbmx5IGlmKSB0aGUgYmFzZSBDUFUgZmVhdHVyZSBpcyBhdmFpbGFibGUsIHdoZW4g
cnVubmluZw0KPiB2aXJ0dWFsaXplZCBvdXJzZWx2ZXMgdGhpcyBtYXkgbm90IGJlIHRoZSBjYXNl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
DQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F960711F05
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 06:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539944.841310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PSu-000148-Jw; Fri, 26 May 2023 04:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539944.841310; Fri, 26 May 2023 04:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PSu-0000zh-G3; Fri, 26 May 2023 04:54:12 +0000
Received: by outflank-mailman (input) for mailman id 539944;
 Fri, 26 May 2023 04:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+8a=BP=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1q2PSs-0000yE-VA
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 04:54:10 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5747a850-fb81-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 06:54:06 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:54:03 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 21:54:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:54:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:54:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:54:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:54:02 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 04:54:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00%3]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 04:54:00 +0000
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
X-Inumbo-ID: 5747a850-fb81-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685076847; x=1716612847;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pkqjBEQ7YSnExSyCl4Pjd3ZAfAz6UV3577RlgbCfLqM=;
  b=NWxx3KIsDFeXSyJwR7qL6BLZgwRDCqwti6MFmY82uY8gE88IGijjNMys
   xGPBYXVP2ci4AsA5z4Vm+f1JKsiwZRn4Cbmm5g/1eNOR3AcNT3Y7x3t/E
   L2ZPJkbeyWGHjbR17Mcyfd9x8Wl21murPFyjFMIG7hxRiC8ibjPbhxqY7
   Xg1C5DZCqJ3HqWbQ6nlb/2Bn2oiD+JM469hSykKabBkaFv0nuHN18Cp+a
   DxQT+SxMIDKnAbICyai8DTDvLdrPa7aw66ahbHGsf/uWyMlglmwN1BEeb
   kU61HHgvbC0gkwzzJldGqDcaNXuHKqDqhX1DWJqPhNcI80eQDAHKgoiNt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334462426"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="334462426"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="738110179"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="738110179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzOgazDEAth5diNqPh6TJ8ppZ/LTWor48q3PKhT0Vfa07ZGzBujrwpfMF+eR5JCE/XZBT5J42Puyz8rPH/QcVfpyYwhneMxyDsgp78FdeBtyqt53CVTKFWpQXDu2k4P3bJetlEbnX6FXig42BNSsCrol3wh2pynujkXlQeG0M7TPaz1Tzj90or86Diq1++kIqn0j4Q+1Kz5OFwLKjI3MTfYD9Sa3yA0Bd702mKF36hrLhkhrPNq/8uVFOZLtUaeqne4yQL2ZwPZvDm972uRXY8BilDp3P2g5oFtnRbE7/zb9ETSkwF6kJk17lupWnHJb4nGcxM7qKcK38MwcER3Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkqjBEQ7YSnExSyCl4Pjd3ZAfAz6UV3577RlgbCfLqM=;
 b=lskNkctDOHqc3U2PEgNvtvBbWCYpksj3b30FOv5YCHX4/piywd6ge1xsIzSg4rzC8u2uuNHSCBuanG9c5d1Xed/Dh5vJxBkm+25WTSP33I4xAgp9bZKZIlPUrbq4MWUBJQG5j4FSPhaXzP/vUdPNjpJhwxCDc5tpxUmySOC0UO0aA7+EEXhEX3noGucACFXEa/Y7hIQxM1loudwCXY4OxJRaNlxoY0+4eWaRM4gJ0/KokcrQIfO8GqFGTEGmp+skvVZd5ar3CagxbXL3aRW6/w39VKKTV4Ph6BqDYES9VM6OB8kUugWcv9YMq7ZWbMoB7Hd2pSaLtYY6rOTyQmRlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH 2/2] VMX/cpu-policy: disable RDTSCP and INVPCID insns as
 needed
Thread-Topic: [PATCH 2/2] VMX/cpu-policy: disable RDTSCP and INVPCID insns as
 needed
Thread-Index: AQHZeD7g5l4KMzlp30WzRh+c548YVq9sK54g
Date: Fri, 26 May 2023 04:54:00 +0000
Message-ID: <BN9PR11MB5276DC175A1696A92B7CE6F28C479@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <ea294e55-f543-640e-7b12-777941ac4500@suse.com>
 <fa9e9ece-df60-e249-7cc2-ad3af50d26bb@suse.com>
In-Reply-To: <fa9e9ece-df60-e249-7cc2-ad3af50d26bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: a66f340a-22fc-431f-71f4-08db5da5387b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qyCfA1Xj7rT/44tzROWug96+fcwKnT8bftBs96zrgiZCNdlBNJGC1vp752oA2i1xtAOe71LGhunbK5CUIAQS6xq1dzN58GIbc/EmrKWZbo2Bf4K3bV9380iW9QvX8wlwRwKQh7ghGV1KCJwXjzHq1njf3Usc0yWsV2nMXiLBc7BExpSDV9QqtGLGgi7IQtv21zzA1Yg6A8hY4QYl7/5dZbJfKVa+hDzgZ2Se9h6jF2BxtZMROVSBC9TMEEMC+jtQ9zH+aei9CiE9fsY7gFvvp+fLK+La2lvmOAiPWe21IBNzA9EH1Oe6uM0c3eUsbOEYJsedss1v7xYoJia/RTQ0IT4TxetWpa7moAOsixeQnjqfz4z+lBqBLhFumDCrLY/Ap72f46cd8dSglx3mODZafbeuT9+RJn35mvDbtq+PqN6DDAvdGDW8mctnbsdL439Gxy3wcWFTIiZjJheh7MgHyJjD/7TmwJk2wzEWjlGa1mqbxHR8I1yoAKOy5uzEFbzxn0cU8IQrA0TIgfhrDT7x3uf34mYo7OgfJyL/ssYZeKK5K0dTOgNYxgS6+4gFwH9vsI3R5ZOewLA11MP509Y1A+WLzg3lY8EqHW2gD8j5GoTdwNuSiRF6WrszjJ+Qpsl/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(122000001)(316002)(71200400001)(52536014)(26005)(9686003)(76116006)(6506007)(82960400001)(107886003)(66476007)(66446008)(64756008)(66946007)(66556008)(4326008)(38100700002)(558084003)(5660300002)(55016003)(33656002)(41300700001)(7696005)(8676002)(8936002)(83380400001)(86362001)(478600001)(54906003)(110136005)(186003)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmhWQjRiVWRVcXFzOVA3MDZ0N05UV3l4eDh4Y1U2UXdFZ2tBN0dOdElsSSt6?=
 =?utf-8?B?SndmN1pBQTNTU2J6WUxrWFpYUnAxRkhTbzM2bjFvR042MFBqdnYzYWEyN0RH?=
 =?utf-8?B?NmtTdytLdmp1MTBhTmVuSnFocytwRTY3SUtXY1BaUThuNVJ2ZTdwbWxNNmZu?=
 =?utf-8?B?bVVaYlBEdStqN084UCtXSUNpV0x5NkswaEJUSHpqS1QwVEtSMk84ay9XSDZN?=
 =?utf-8?B?WllKbTNWTEFiM1JhK3RXdmhROWhiWklpeEVQQVpadjgwL0RLMHp4alVuWDZm?=
 =?utf-8?B?Q2NFNFQ4dm5XOUkzSHhkZVQwaEdyTVFwOE8vNm55THZKdjU5OVp2Y0VNTUo4?=
 =?utf-8?B?L1d6SGlzUW1wUEhSY0pxSHE2M040RTVzN2M0M2N0em1heHdSSmF0Qk8vR2hl?=
 =?utf-8?B?Rys4SnlqMENCR2JGVDFaWWtNSGhWRzBKRm51OVR4QlpyRk9nUFVvNnFPQlk1?=
 =?utf-8?B?NHpadnYvOVdLZ2VvRXNYMkpUTWVJNURTWjFFeENJa0sxdnRvQThCOWdpKzJP?=
 =?utf-8?B?c0E3NWlRMEhTYVE0T1VMNGY4Y0svSjVJN1c5R2FmTmZheWM3NzkwcUh0aDVQ?=
 =?utf-8?B?YjY1MEU4cEdSaDNjbXdXWmt6cW9sV0FpTkVpQ2QycXVlOWpBQm8rcGJZaERX?=
 =?utf-8?B?bWJHRkdna1lseDh2T2JTelZrSFRlOWFSMjloWEg2SkZaRWJTMkxyRVBhK0da?=
 =?utf-8?B?Ryt6cGo5RXk2UUt0eU9TVVNUVnpkcW1EajdhU0NYS0xxbW9iTGVzczlkVkh1?=
 =?utf-8?B?MkxMRUs3bEtBVkpKUUIwQXRWL1NUL1JLdDlqSWpoRm9oYVpsQmdsNU1xUWh1?=
 =?utf-8?B?SEZlNERSUk9kNWN1VHVKbHpMaUFNSnAvKzJUbXJZdW5iSy9rd25UN0ZBRXpr?=
 =?utf-8?B?NWFpSE1GSU1yREp5cTcxbklTUHlNNTdDWW5IUnJwUWM4QjJoQWRTY2xyclpS?=
 =?utf-8?B?Vk10QTNZTjNIWCtTMkltQW1wZkExb1l5M2x5bmEzV2xCQWxoRURkcVhWRHQ0?=
 =?utf-8?B?VTIxU0VhYkxYeUpJRHBOS0Iyb3pzS21hNEowZDdrbTJZVXBLR2VvMjIrYlRT?=
 =?utf-8?B?SHVsRUlJTER5Tm56V1RWbWI0VmNRd2p1L1YrbXRMYysxeVplWkxzTDZKU1M2?=
 =?utf-8?B?VEoxcE51UU1lbnR5b3lyMWVoMUNQbngrelYrTHpqOFJWMXRxdTdGZHRPdk9G?=
 =?utf-8?B?dzhHZFV6ZGsycEh0M3M1Z25oTlkwY1ZPeXZKS2J0WU8zTVBiRGFpS2NhZnBt?=
 =?utf-8?B?Z0JyYXh4YmJ6cVA5eEVGaHFwek9sclNWVld0OUpnTjh6ZlVHTlNsZHNnZTJB?=
 =?utf-8?B?cEpnMjlZeWU0Mzc2dVE0THZxOC9mcFRuUnZBL0tpaXRwMTBaZmdObmU2RGti?=
 =?utf-8?B?V3k4Y2d4ckNodlNhNW9uaCsrSjFkVThySGtJeWpmdlpnRG0weVAwTkl6MGE1?=
 =?utf-8?B?NmVXUzhUY3Q1YmJjNktxeWFReVNOY0FzV0JUUjF0UkMrbjhLenBQbTh1OEhY?=
 =?utf-8?B?RElWMEYxd1puVUNXNVE3Y05sVjhQaDRVbXVxa0huaDl3TUJuMExCelo2Nzdw?=
 =?utf-8?B?eXg4Y0lFWVpaaTBZTS9zNUljakt5YXlJS25QSnRJMlU3Rk02bzFjUE8rVTNQ?=
 =?utf-8?B?bHo5cVRja0d2SGhNSlUydXFVZ0crb2Z1L1VNc1hpUDNVc1YyMXVsUXB2QTBU?=
 =?utf-8?B?bi9VNjdvYjJNejczUUNrdVIyRlh3NUVOVXk0MGZrdjJzb3VxYkl2Z3lqekpS?=
 =?utf-8?B?Y3dXZTJSdTNHM1pyTnZ1VzgvakpmSnNGUVpscTFIYmR1cU05YlFxYkRFTTgy?=
 =?utf-8?B?K1NLbmJqNHlIME1uRkhvamFCZGVDWkNyemhNQ1NNa1hEcXp3Umo5citkVXJj?=
 =?utf-8?B?UUQ0eTVsQWF4UVNuZUVnazl4ZHFiLzRzY0Y5eWY4L1NGdEx4MmlBRVlNRDg0?=
 =?utf-8?B?RExPQ1ZEd2N4d013K2pDQlRqMythOHBRU285eUlKMy9laTY4ZU9ibml4RDVE?=
 =?utf-8?B?Sk5mU3V1UXU4OTZmNlpQaVlNWi84TDFKYTdteVdLc2VBTTJBYitmdjVXVVhY?=
 =?utf-8?B?UFQ1ZDdIWmpnZXpYRkRtZ2lRUnhYUDF5dkVlRXBvRzhJenorWGNiekhtLzgx?=
 =?utf-8?Q?D4Qr8uYzob/1eQ6/TfKWyM2RT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66f340a-22fc-431f-71f4-08db5da5387b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 04:54:00.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8A0VwTjB0cenxQ08iV4LDHD82kYiStrVttQePYnQnHNXFs/0D5fsdugvAZAbfZLmu95HUc6d50Zu1EGpIXPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMjYsIDIwMjMgODo1OCBQTQ0KPiANCj4gV2hlbiBlaXRoZXIgZmVhdHVyZSBpcyBh
dmFpbGFibGUgaW4gaGFyZHdhcmUsIGJ1dCBkaXNhYmxlZCBmb3IgYSBndWVzdCwNCj4gdGhlIHJl
c3BlY3RpdmUgaW5zbiB3b3VsZCBiZXR0ZXIgY2F1c2UgI1VEIGlmIGF0dGVtcHRlZCB0byBiZSB1
c2VkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K


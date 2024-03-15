Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B681287C8E2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 07:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693641.1082031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl1Te-0007k4-C6; Fri, 15 Mar 2024 06:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693641.1082031; Fri, 15 Mar 2024 06:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl1Te-0007gy-8G; Fri, 15 Mar 2024 06:55:38 +0000
Received: by outflank-mailman (input) for mailman id 693641;
 Fri, 15 Mar 2024 06:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6zYK=KV=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1rl1Tc-0007fC-GT
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 06:55:36 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b7e297-e299-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 07:55:34 +0100 (CET)
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:55:30 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 23:55:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 23:55:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 23:55:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 23:55:29 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 06:55:27 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::39d:5a9c:c9f5:c327]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::39d:5a9c:c9f5:c327%5]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 06:55:27 +0000
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
X-Inumbo-ID: 03b7e297-e299-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710485734; x=1742021734;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zlJDIE1LCmYEb1YgXAoF3OL/6KnAQbgu58xuDblVz3g=;
  b=QmU51cEtw8wv2DdIfcujjFMdY04yxNHPxunxDi1DNv0cZ/6GI3Tn1GmY
   q53r5LrXXPve4uOBsvOePZ7Yfqbm0p95zhNCIDYaiNKIjsRqaqjk2GPkx
   hPUu092o/ysjcSuzTureWTnM7Fpo9s/Jf+al7xt9BOPsVTipEwCTRbgmE
   rQkhzv2aHRXbRGR+Yz3zrT0ZdCfpB0Lt6Mc/wbNFbPDP/gc+JUqxg+oF8
   W0MYvcEy7lfMBnnSCJTe9nCnt0fLNSkThtpkaRF2BcBEUhWdXnB0OPEic
   KFGI2XoZ4H1gB8TUUpqwwVyETcFNI1rfooE6We8jhp7226lO7L1BCMErI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16067326"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="16067326"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17261321"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaO/5hHseDAS1sPCzj84ZDAKLCwu3dPKL1jzvfxyrtOWtnizhkaqogDbGn9/rEpf2so7BpnDdRJMlxAVoiJteLk7hEaltUjwEb7ojNHnGvdzfK+LDMrXANGIHEN5ptM0Q6uLMKMDV+6QMULRhXFBCAhkhjPM7XR9XnVfT7ZZZ55jyBXf2MHyGikQTWrPnCW7MgN2ywlvph3RJKLaBaa158awCNtaQ5/5/vKt4U8bQs44bZBZARhQXYOSNq7mukrr8CZ52DcwT1zn23EfndUSVZgUbIypmhuNv9nMqLY8vq+rdzA7omoObGXKY59T3hQxMRm0DffwsXfdQHsxgXXofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlJDIE1LCmYEb1YgXAoF3OL/6KnAQbgu58xuDblVz3g=;
 b=LNj1CuW0WAXfogW+mIUH0lYJg+u659NXydmrk4Ylk5qLafJisOFVyTpgtM6j45Pd09YfUMcRAKlhnWbq3awrwRgZ4hcVkbYg47pa3haxM8Ib3+LBiQRjp5mUJQEtzi0+Cjn4ulHGBtX6/kGlwBcCiuz9U7yJEHAPStsSj3yKFBwUr/I2SvxPQYdRbx7YVZprZ4BhM8QGUEL+cNGH58p2adqMHhlJ9qwXjbELmDjGpjvK05jzoNY8Q47NaOLp52UhmRG0OXOGbCSVXnN+wxYfZ2FHFvn6SsstkQtZ8LXjqaA/R9XFskifmiyNG5Z8U8jfmV/ILYMXEsXhAZFNqpwodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH] MAINTAINERS: drop AMD IOMMU and Intel VT-d sections
Thread-Topic: [PATCH] MAINTAINERS: drop AMD IOMMU and Intel VT-d sections
Thread-Index: AQHadivoTV8SqgOV10K8LvzRFdAHwrE4Xw9A
Date: Fri, 15 Mar 2024 06:55:27 +0000
Message-ID: <BN9PR11MB5276816C77A68A4597ABCC268C282@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <36bf6c96-c266-4908-ae85-1ec9325b5bd9@suse.com>
In-Reply-To: <36bf6c96-c266-4908-ae85-1ec9325b5bd9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA0PR11MB8302:EE_
x-ms-office365-filtering-correlation-id: 10f4f093-db16-45b2-cfda-08dc44bce559
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: empezgXMXpOCA/mhHe6NPFiYO4cAdOPRsIZkaPpwUOJt++E79dyD0z0GSWlc1E/XN0Tn10zyvzaHiYJjWIzGecYtgLSIUS0OjB9ZN+LaVIS5MTJ7sNjql7aQXcW/jzTpnigZSmuKOFTh7qeHocK0ZwioIsbzdxnzxFqhYIl0bWgRY5PlP9JOQ2vubY1oGWDnKHkLnuOSgW720ob4ywXJk6nJtkn/7UeGebyJ65zQxe4MoC0tQ3CWgvjACauccZi1312asnF4S9ospujJ3fEinrH8fpo8ViN5/GcuAADV966NfLFGCa5itOt9nduuPTVcn+aHfHScVJHgws2PYX6eNPA4kukpmlQ42MAFs04P83dhsw1XIkODgtH7W6qC0ru4qs1xsdmwfvYukVqb9AElznVmogz2QFkIM244deUweHaHCT8x43bLGjW/2UakSArlo+D30t/f9gBRd08Z8Tp74YXaGEXg75Wd6yayn/UMc4RQnHwo/IPCmz1T3JMFA2esvtvVS0jsIYYurWmTqWBih75RzVqmHffnvUDF6eSe1BoCr2mVQhnp8fW57DrZlnWXyY08cGm0WHQLJoqqc+A0n7YXDcis/atOVWZgbGHVYvWDEAYGUoSk8s+MpNoO1d2Ba6WE03lXE+I/I2mtt568AjMZJdImICKhGeneq3MKW7fbuPLJfAqcKiKfou3X85c1fRtcX3bpeUEVEJKuxD/NyWDI/e29+cv4V7hsTpQtwz0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmlOOTlPSkNrU3Zad2k5VzArbTYzdThGLzAwVUZBcHdRRFl4UGdyUXRmSlVQ?=
 =?utf-8?B?TkZjdTNnY2VtckRTV0RRbC9JZkN5WWhCZlRGb21IMnh3aGMvSVdHenlUcmo1?=
 =?utf-8?B?NHFzK3VSdTJDeFpVdk5EM2QrMUJTYzB1dzZhU0lyS01iTVltbjN1L1RmR1o4?=
 =?utf-8?B?Q3RhbktXUS9GeGIxdHN3M0tsZDlwWWsvb2drRXpBeG9kRm5RT1JnL0V0Umtt?=
 =?utf-8?B?K2svQlJaTWd6TS9Ga2JXSU1tdFFzTFQ3TUVyaitMSlczaEMvQWJ1Y3hxVFdq?=
 =?utf-8?B?R3NVNmpxbUl3WTRVRW9MVmJUekxsa0RQOGhvZGtrSzNNbno0TC91VGtqVVRF?=
 =?utf-8?B?NlZaQWIwNW8yc2hiaGdQWURiNDIxTTZtTVo5UWQyeTNDcTRLck92cmVlUHBJ?=
 =?utf-8?B?RDFocGQ2K09KeWRDV2RNQURGa1JrdzBEQ0RHdUp5YVArWldXM0FyUmZFcDE2?=
 =?utf-8?B?TjFZMlFoL2lXei93NVowbkRzTy9UcXEzMWtFanBheUxQcC9xSEFwM0lsT3F6?=
 =?utf-8?B?L1BUMHMvR3htZkZjQ2FOUTFhYXg0NmRWTUNuSFlqajdlV2lqWlJvQ2tNd2Jn?=
 =?utf-8?B?RTFNSzdBejU1QS9PL0JSL09pVzFPQXZra0RxdG4xK0ludThYamJqOEI5MUtS?=
 =?utf-8?B?Mms0VXp4TW1acXZYbjhMZUhDcXlBbkVOWENQb3FTb0RIYkZ0TG83WEw4MXhy?=
 =?utf-8?B?Vko1bk9wVjkxL1cxRHJxTE9JUUZHQVp0L3NYTVNldStHSndVMVZpblVPdjh5?=
 =?utf-8?B?QnZNTEliVE5KWkhDRFB1c0QxTHphRE5RMzF6RlArWFE5YzNxaVpiN3FlVUpi?=
 =?utf-8?B?cUlid01iWFdjdStJTTZQU3lSOC9NRFQ5bFhFWGRydU05V3hoYTJOeFpxU0Jt?=
 =?utf-8?B?V0N5VTN2MGwxb0pVdXdQemNteUt5YUEzVUoya0dMdHFqYTI0UHl3WVAxcTBE?=
 =?utf-8?B?SytreHNERnpUQmJTMnN2NERNTjZMYjY5ZEVmMDRKdlZJcU03TjB2UE8xT2xj?=
 =?utf-8?B?dWFDREFaekRnKzZFa2NQVXV0dGRJb0FwWXdMdHg2eUpJdyt2OWZoQXZld25L?=
 =?utf-8?B?L3VkWW5CSzA0TysxWVppQzJWZlZkS3Q1YmVOL3FMRElhR3RXVmZpNEVGOHdL?=
 =?utf-8?B?M2RzRXVSYTFySU85WnAySS8vVDlERTFNdFhkeGxqMXVXeTc1Um5ncTRaTi9o?=
 =?utf-8?B?dGpQVG13aE1OTjdtUDFvdzFpazZWZTRkeTFHbS94Z2dOaCs2K21FNU01QUtG?=
 =?utf-8?B?MmxpNnBlS0J4c0RhSEhJRU1nNVVUMnVlcDJ5WEloczFhbjgvTVFWVjI1djRN?=
 =?utf-8?B?VzBkNjV4ditZR1M5RkViNWV3UXNFLzQrT3BVY2lVaVJmMGZiMVB4YW1aZG9s?=
 =?utf-8?B?RHY0ajBINXFRR2cwUWZTb2QyNjhRVE9nZUQ2Um9Sa0ptekNiRkRzc1hNdGlq?=
 =?utf-8?B?T0JLaWhTeVRuejFjTUsvblFJK3Zrelh0OHl1VktJK25saU9RUWxkK2R2OHJV?=
 =?utf-8?B?c1ozc1V2OUxURGhqWCtxeDF2Z25kSXg0SUhxYnNPbjRGNUZEUUFuTU9NckJk?=
 =?utf-8?B?cmdCWDRHUzZuMDhoL0hJWEF3aTJnbW14TXB5VTdnenU0U2pPNlRQQVR4VWJn?=
 =?utf-8?B?UnVFSlFZU0hUb0hPMDYwUU02aGdtVUhxUlR3Vnp3VlhpczNGUFhEdkExWWZ3?=
 =?utf-8?B?Q2ZWNVFxbEIxTW43Wk9BalQrM1BxLzVsRjRLWFd1bkgxa3htdEZ0Y1JvTVRX?=
 =?utf-8?B?K00rcWRVYTdPQXg1K1V4czdaUzhsSUh3Nmw1ZGhpaHFFdzJLcldpcW5kckpq?=
 =?utf-8?B?UnowYkkrNUFIdU1LVmxDRVI4R1lXVUdJRUNmTDEwQzF3V0VwbXhpM1hVQkw5?=
 =?utf-8?B?cjdtSjBHRTB1a0o1Z3ZsNG5kWjY4L1RkMWxQTHVkK0xqMlZYNGMyMzlZbkVW?=
 =?utf-8?B?UjhTNEVSK3ltNUhDeS83VG9nd2k3Y2dPVWhESGdITlVzUzBQVEFFT3pGc0x0?=
 =?utf-8?B?K0lyQVNxdHBvSFp0dnVJRkU1a2pkNitwSHBuakZzMGpMK1VycE85S1QzK0JG?=
 =?utf-8?B?cnAxdi92aVhWU1FUam9wUU5ualdWaFhMUXMvVElueG5nOEZKUHV3eWszTy9l?=
 =?utf-8?Q?gIekP2H2S+OlizW5bW/5Y+/JH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f4f093-db16-45b2-cfda-08dc44bce559
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:55:27.1784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SP6YwG8ghVfmFOlY46nF76TZMXKQNGfVbMcq3E6xfZ+gMoeA4k4FQ5qjB9HshSMUZSxkKazHXQ41fH4omJqyTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
TWFyY2ggMTUsIDIwMjQgMTI6MjMgQU0NCj4gDQo+IFdlJ2QgbGlrZSB0byB0aGFuayBLZXZpbiwg
c28gZmFyIHRoZSBWVC1kIG1haW50YWluZXIsIGZvciBoaXMgcGFzdA0KPiBjb250cmlidXRpb25z
LCB3aGlsZSBhdCB0aGUgc2FtZSB0aW1lIHdlJ2QgbGlrZSB0byByZWZsZWN0IHJlYWxpdHkgYXMg
aXQNCj4gaGFzIGJlZW4gZm9yIHF1aXRlIHNvbWUgdGltZS4gSGF2ZSBWVC1kIG1haW50YWluZXJz
aGlwIChhbmQgZm9yIHN5bW1ldHJ5DQo+IGFsc28gQU1EIElPTU1VJ3MpIGZhbGwgYmFjayB0byB0
aGUgbWFpbnRhaW5lcnMgb2YgZ2VuZXJhbCB4ODYuIFRoaXMgYWxzbw0KPiBicmluZ3MgdGhpbmdz
IGluIHN5bmMgd2l0aCBob3cgdGhleSBhcmUgZm9yIEFybS4NCj4gDQo+IFdoaWxlIHRvdWNoaW5n
IHRoZSBYODYgc2VjdGlvbiBhbHNvIGFwcGVuZCB0d28gc28gZmFyIG1pc3Npbmcgc2xhc2hlcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==


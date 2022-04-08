Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E24F8CE8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 06:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301107.513827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfpi-0002k2-JL; Fri, 08 Apr 2022 04:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301107.513827; Fri, 08 Apr 2022 04:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfpi-0002hU-Fs; Fri, 08 Apr 2022 04:02:50 +0000
Received: by outflank-mailman (input) for mailman id 301107;
 Fri, 08 Apr 2022 04:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiXL=US=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1ncfpg-0002hO-VU
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 04:02:49 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bed02cb5-b6f0-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 06:02:47 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 21:02:44 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2022 21:02:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 21:02:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 21:02:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 21:02:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 21:02:43 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB3970.namprd11.prod.outlook.com (2603:10b6:405:7a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 04:02:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%9]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 04:02:41 +0000
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
X-Inumbo-ID: bed02cb5-b6f0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649390567; x=1680926567;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=phGxcuf1slm3xC0SW6r11Hueh97a2kYsmSxyYMVtcsw=;
  b=Eq3c5u3jBMdum/AyevOnj7euRnKVjyE9p5BiYIiAPvV/kkqosYGybi3B
   zng06mGCYtOkucjhilQ+m9XE3LifRiw5joA7UMIDO6lA+g3Qs+ESJVuxL
   7GkZyMt1M4mZ26nM/Z7jQ8j73AH0CLyWOAyinGRTOxPOiat+rgcJZT50J
   HJUr0BbYL1C+cNySk4n+qbmhf9xivYBw6oUSsdYtmIhhLjA2O6RfxFsvs
   cLeD48XEbMl+z2r2JYjPt/JRmpwsPEWwKj9+E76m7cMrKss7d0S2VPM0w
   1IqnnSf9FC+QCZ43wdTrSvNNk0dFKrX/oJckjRVbbNhPDzCLdzZEeGK5b
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260337351"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="260337351"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="557628804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljicBIL4VZZDGWdEaeFOEPyfJwWRbVJUyl8hACmcBASM+i8OwXureU0x12pblQuoa6Nr8HZIPv7PCX9bQTVK/qWcQ2gpaACwE/DwtBnBKokB/4tVsUYSVSovb3pA92tw1Wsa6CUydMLhpAnrOUCnoXTdT4a63fjTgbqrfz8l7qz4emrN9FFgJQVm2cL8rQ+Ow86RMkmla6Z3omtpx2FwqyRBiR0kcLGk2+WvQZ3WXvKu3CqXHMdIFELWGtiUAwHL4EzoSy/8mf1oHjbfmAW+D2BED3MSWvddHYNF/jASjsLKcR+OoTte8mUPT70zz7s+VGS8Va7u/62plC+THjQDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phGxcuf1slm3xC0SW6r11Hueh97a2kYsmSxyYMVtcsw=;
 b=beX/Nx1+BUs6gm+3jQ76pZYRiO+ldtPDklhp5uJpa8zT2DqUvE1+eLi6S+UeyStemvDz9nhyvDvMa5qvh8/W4SHOXaylPp5Jk26TrFTUCSxC9WCLnJRRK5OgR2Py6OykNw+7zC+j8U0WxhwQxHrhmx06uOrou87AolqSnTXM4vUEPVIiawa4S8O85fkvfDb+nR2g5cgfLaMkbW/bAYRUxs2Bx+6BkbCl69STvGOaQX63DbQq6+6MK2xks/jfVlGTbnqvOMDX4WM+k7QZhZEkzEOTMTvuCE9mFbYh3g9Kcs/wg7gUMILgX2orEwJQSov78H9UloKtPHjNN6wdsqoCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v2 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Thread-Topic: [PATCH v2 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Thread-Index: AQHYSkZPFo7HWMZ/FU2EAP8xR7sG9KzkEVSAgAACUACAAVKe4A==
Date: Fri, 8 Apr 2022 04:02:41 +0000
Message-ID: <BN9PR11MB52762D79BCBE87DE0E21914C8CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
 <Yk6VvXJHWxJZTgeF@Air-de-Roger>
 <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
In-Reply-To: <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86cff8b7-4ec2-4dba-8887-08da1914a0e3
x-ms-traffictypediagnostic: BN6PR11MB3970:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB3970324B32D540AAC4A87E808CE99@BN6PR11MB3970.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EW0HMcgza0IwdS8yI7+n5R9oYu1oHtI+vXYqzSyL0+htWf4Zzqf+RcNfgDCruh8OSpeZeskJHIlNKhrcNwAifsVzcPUdtAFv28qclFmcwh646fiJjG6cfqvNU6aWiMWRBe84tR07nX/yDILrKr1IVlzS4EgmPK7xGygJpgZD45GifyjD4QFlXFCFblox+ejDpNWvVFwheXeEE2F2/EWS0y/L/bihdBYQb5mjf6bFFIGbDjkK9n7j6hy7JbYm/vq5Ml19gyMfKQvY6MxWi/1u/V3MSscV54TvKDVjrXZy3y9jTOMfo9okcvyWiEoy1TvRfQrAZmbTl0wabxTiT5HAZYo3tzSWUUD/jQ7s3oAXHFXVuRZgeVMr47yrOPsmRBfZFl8yMl8kN3TQmbCbLvno/HZJFrmEpHRddQiqDTZrlnmJaaY40aeVob77Qpo+WZNsOrvjNmnaxBFJQ1Av5wN6pGYUj2BHRjzyaouMpcPnDh9sKPn0l5E413Bz4DFoMsqpwXeyV1m1CaJjQnOurQSi6U2ibL5Ul8xSZrtI2WB4VbNfjD0Sg8rlqcniqFUjqq9s7QWDbYR57k/ldqp8jMLWKdBuWQrlNRcXEOsBvIzFPgcY2dyFiWgyPvCC1khMT5dxvHTEAHKDovZQOw1mkt34Xn73IGBOsmFTyU+9XEynSHpz1Ha2rhKgWygepjGAQrO3P95JIfecUa80/XqsKv+e0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(66946007)(8676002)(4326008)(83380400001)(76116006)(86362001)(66446008)(8936002)(64756008)(122000001)(66476007)(66556008)(33656002)(82960400001)(110136005)(54906003)(508600001)(38070700005)(26005)(52536014)(5660300002)(6506007)(7696005)(2906002)(186003)(55016003)(38100700002)(9686003)(316002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1hab0RLMTQ4ODh5ekdEQTJMdmJGZXFYZ2h2QmprSTFNUFVyT2ZzMlFBUG9q?=
 =?utf-8?B?Nyt3c2NxdkxDU1ZhZmZGdmY4bkxrVkxOMDF5Rmtkektpb2d3RldEQTBjN0Qv?=
 =?utf-8?B?NU10UlI3N3pQTUUvZG83QWpudnNSWlZ4MG54cEpZZG5pYVFuYzVKNlF5bHVQ?=
 =?utf-8?B?UkVxekg4Q2FGcVVya2duME5OS01qK0xkdVhDeVVZa3FCd2VlNkhyakZUTElL?=
 =?utf-8?B?MjhiblV1UWNoTURPN3F5N0x3Q1MrMkpHN2s3cFRGczNvSnFzWjlyYWNmWFV6?=
 =?utf-8?B?Q2VmUTZMVXMrQVlubnJRRmt6N2NyazRIRkRHTTdSYno5dHAzRHlSUVBnbU1K?=
 =?utf-8?B?alJ5cXUzbkdzaTZnUEVLWFpyZVJtcWZLVndNbFdUODJma2YybW5yRnRFanlx?=
 =?utf-8?B?M29uL05hTFJxdEN0UGptNWg5S253QlNKdTFLNFJTWitlYUVkUHRxOHJyVzVp?=
 =?utf-8?B?K3QvRG5sZTVoTkpqRzVwZFQ5Wm9oNERBU3NvVDNCQ3RnNEVwaWZ2VnhxUFZ1?=
 =?utf-8?B?Tm1LNzhvZWlXd0lpenBZRFdNNlJQaU5CSVN3T08yMXZWa0NRN29OdVhLaCsr?=
 =?utf-8?B?RkIzK1hORGloR3FMU083RXY0akdqc1pIR1gzK1pKTmlVZk1JY1lHN1RoMVhE?=
 =?utf-8?B?SGRwb0laclczMzFqbzVTSzdwR0NOcDJlQ28vbVU1QytLZk0wTTVWUFlPWTUx?=
 =?utf-8?B?Rjc3cUVFOW5tcGpYQVlXVlJ1ZVZDMzVIYUlFOUMxMlM0ZkIwUEZCSkVPVEhG?=
 =?utf-8?B?WjFYUjQvdlRGQ3pNalIwcjBlOWp6blg3SXJSK1BZNmVxU29wcklja0k3WndV?=
 =?utf-8?B?akpIVlR3ODFueS9Kb2ZhUVhYcTN0RzkxSExKc1VIU0t3ZTY1YzZxa0tSd0RS?=
 =?utf-8?B?Szk4c1JQWWtiNkJ1TVZvRzl4K2VGd3dsbzROUkFMc1BmbnBGU0lTNTVYSGNK?=
 =?utf-8?B?WE1qL1NJc2ZnenA1cGp2YnFwUnUzRjMvSGlSOWZaMUR4NmhJQjczdGVxZklL?=
 =?utf-8?B?d2NsTjJpdDZqMy90RTJUQ0lnSU9TMGpjQkMxQ2dBTGdLSldMT2VRZnFOQk8v?=
 =?utf-8?B?aFlhVG1TaGZzWGt4aXB4TzN6dmJaWEtCN3hVRENzV3YzYjBobHBmTkF6Z0ha?=
 =?utf-8?B?SW9KaGxKZlh5aktXQnJIRHpSM0h2cE13R1ZadTJGaHE2VDY5NG0xWWdqYzBM?=
 =?utf-8?B?OXlCT0I5VmJ3SElpYjFLSlRCQ0tVRllCYk0vSDRpOTdtVmFMN2VkbmFBOXpS?=
 =?utf-8?B?YWlyRXMxK0g1eS9Qc1IxMUs2Vmo5Z2xKM0FVc0FJVW41cXFQVDlzZlBCdlow?=
 =?utf-8?B?UGd2QjU0VXF5cjlJN2RHbkM0dW5QSjhvTThTZU5EMlBCaEwvN1ZyNW51UlBL?=
 =?utf-8?B?cndtcnBxajBEYmR2TTFWcm5CbzVHc2lOU0U4TUJ3cFZDUVdueUwvR3p1RDRN?=
 =?utf-8?B?YXZXNGhKSk56V1dqYSs5b3BvT1BHZ0dPQjBKOFVZYmprZExIek1SWk9lR09R?=
 =?utf-8?B?MTgwL1l2cUdtWXFsYWhoQUxCT0xtVmJXSnVMcSt6RkhUOHpTLzVleUNOWjBJ?=
 =?utf-8?B?ZVVSRncwYzFZWFZYYTZoZWVBNlg2cnhKRmJIS0RCeWgreGNmNHhYOEJxNTRJ?=
 =?utf-8?B?K2pxdXpPbmMrMy9UMWJubE1FQkV0LzNLWVU1T2l1Mmtid1pjRDdMbEpMc0ww?=
 =?utf-8?B?UTUrSmoyaktUNXlLTHZnWnZ0MFJHV2pldkZlSHpORVFOTkNVdWtuYzFjL2hD?=
 =?utf-8?B?WGdhVUIvb0NsY2twN2NBYnQwRUM0V2JpQUZGS3E2b3FyYUhucC9PM204Q1Fa?=
 =?utf-8?B?S25zNEFTSWo4clJ3VSsybHJkY2hRUk14amczd3o5dWVuZXVOc1gweHdwRWp1?=
 =?utf-8?B?UGpoZ1ZpdGV6ZnV5a0tObWJobnFBbDN6VnVscXVUblB4Ui9iK2VUL3FnbVFV?=
 =?utf-8?B?alZhMU82SXhoME9yR2Q0aktHTDR3OGptVWM2V2UxSm8ySk83Y1VycHdUL1hn?=
 =?utf-8?B?QlpDdDl1dnZiUHQwWU90ZU5zU242KzhmQmt0Q254bU5LTGR5eXZaRmNtRHQw?=
 =?utf-8?B?RG5ybHhPeitiWmh1V21BemVQZUYvbjVoV1JNWEgyZ2E2SHJEUDdTN1N1WGtW?=
 =?utf-8?B?dTkzZnljWXZ6Q2g2c2ZPWmd2NUdLbVNXRGwrSnM1dGtJWnJEbjNDN1FESmtQ?=
 =?utf-8?B?dUpQYW5uYXZkakZ5VWhoeVlZMmZtZzgxUkFVK0dTbGt2dEtmQmlzdWxJTENR?=
 =?utf-8?B?SURhOFU2cTYxWHNhMnRtTDFMTVYxTndkNUh4NWFjVTNObkQ3dlJwN3Q1M21F?=
 =?utf-8?B?ejZiaFNZUy8vQ2JQeUtldmVycnV3V0ZycE1aa2NxUXdFN2kwNE4wUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cff8b7-4ec2-4dba-8887-08da1914a0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 04:02:41.4559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yAFGxNsBEyDM8niAC48GxL0A+V6U72hYIgpLXRdso0okKjhBhvAdaBLvInBPOp2caTmW1MbWUsb5SKLZbLoXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3970
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBcHJpbCA3LCAyMDIyIDM6NTAgUE0NCj4gDQo+IE9uIDA3LjA0LjIwMjIgMDk6NDEsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+ID4gT24gVGh1LCBBcHIgMDcsIDIwMjIgYXQgMDg6MTE6MDZB
TSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IEZpcnN0IHRoZXJlJ3MgYSBwcmludGso
KSB3aGljaCBhY3R1YWxseSB3cm9uZ2x5IHVzZXMgcGRldiBpbiB0aGUgZmlyc3QNCj4gPj4gcGxh
Y2U6IFdlIHdhbnQgdG8gbG9nIHRoZSBjb29yZGluYXRlcyBvZiB0aGUgKHBlcmhhcHMgZmFrZSkg
ZGV2aWNlDQo+ID4+IGFjdGVkIHVwb24sIHdoaWNoIG1heSBub3QgYmUgcGRldi4NCj4gPj4NCj4g
Pj4gVGhlbiBpdCB3YXMgcXVpdGUgcG9pbnRsZXNzIGZvciBlYjE5MzI2YTMyOGQgKCJWVC1kOiBw
cmVwYXJlIGZvciBwZXItDQo+ID4+IGRldmljZSBxdWFyYW50aW5lIHBhZ2UgdGFibGVzIChwYXJ0
IEkpIikgdG8gYWRkIGEgZG9taWRfdCBwYXJhbWV0ZXIgdG8NCj4gPj4gZG9tYWluX2NvbnRleHRf
dW5tYXBfb25lKCk6IEl0J3Mgb25seSB1c2VkIHRvIHBhc3MgYmFjayBoZXJlIHZpYQ0KPiA+PiBt
ZV93aWZpX3F1aXJrKCkgLT4gbWFwX21lX3BoYW50b21fZnVuY3Rpb24oKS4gRHJvcCB0aGUgcGFy
YW1ldGVyDQo+IGFnYWluLg0KPiA+Pg0KPiA+PiBGaW5hbGx5IHRoZXJlJ3MgdGhlIGludm9jYXRp
b24gb2YgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoKSwgd2hpY2gNCj4gPj4gbmVlZHMgdG8g
YmUgcGFzc2VkIHRoZSBjb3JyZWN0IGRvbWFpbiBJRC4gQXZvaWQgdGFraW5nIHRoYXQgcGF0aCB3
aGVuDQo+ID4+IHBkZXYgaXMgTlVMTCBhbmQgdGhlIHF1YXJhbnRpbmUgc3RhdGUgaXMgd2hhdCB3
b3VsZCBuZWVkIHJlc3RvcmluZyB0by4NCj4gPj4gVGhpcyBtZWFucyB3ZSBjYW4ndCBzZWN1cml0
eS1zdXBwb3J0IFBDSSBkZXZpY2VzIHdpdGggUk1SUnMgKGlmIHN1Y2gNCj4gPj4gZXhpc3QgaW4g
cHJhY3RpY2UpIGFueSBsb25nZXIuDQo+ID4NCj4gPiBUaGUgc2VudGVuY2U6DQo+ID4NCj4gPiAi
VGhpcyBtZWFucyB3ZSBjYW4ndCBzZWN1cml0eS1zdXBwb3J0IFBDSSBkZXZpY2VzIHdpdGggUk1S
UnMiDQo+ID4NCj4gPiBTZWVtcyB0b28gYnJvYWQgYW5kIGNvdWxkIGxlYWQgdG8gY29uZnVzaW9u
LiBTbyBJIHdvdWxkIG1heWJlIHVzZToNCj4gPiAibGVnYWN5IFBDSSBkZXZpY2VzIiBvciAibm9u
IFBDSSBFeHByZXNzIGRldmljZXMiLg0KPiANCj4gUmlnaHQuIEkgZGlkIGFjdHVhbGx5IGZvcmdl
dCB0byBlaXRoZXIgZHJvcCBvciBlZGl0IHRoYXQgc2VudGVuY2UuIEkndmUNCj4gbm93IGV4dGVu
ZGVkIHRoaXMgdG8NCj4gDQo+ICJUaGlzIG1lYW5zIHdlIGNhbid0IHNlY3VyaXR5LXN1cHBvcnQg
bm9uLVBDSS1FeHByZXNzIGRldmljZXMgd2l0aCBSTVJScw0KPiAgKGlmIHN1Y2ggZXhpc3QgaW4g
cHJhY3RpY2UpIGFueSBsb25nZXI7IG5vdGUgdGhhdCBhcyBvZiB0cmhlIDFzdCBvZiB0aGUNCj4g
IHR3byBjb21taXRzIHJlZmVyZW5jZWQgYmVsb3cgYXNzaWduaW5nIHRoZW0gdG8gRG9tVS1zIGlz
IHVuc3VwcG9ydGVkDQo+ICBhbnl3YXkuIg0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A54BB141
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275099.470815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvju-0006F4-UA; Fri, 18 Feb 2022 05:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275099.470815; Fri, 18 Feb 2022 05:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvju-0006CY-Qw; Fri, 18 Feb 2022 05:23:30 +0000
Received: by outflank-mailman (input) for mailman id 275099;
 Fri, 18 Feb 2022 05:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvjs-000639-K0
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:23:28 +0000
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e46a225d-907a-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 06:23:25 +0100 (CET)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:23:23 -0800
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2022 21:23:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:23:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:23:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:23:22 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL0PR11MB3393.namprd11.prod.outlook.com (2603:10b6:208:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 18 Feb
 2022 05:23:20 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:23:20 +0000
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
X-Inumbo-ID: e46a225d-907a-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645161805; x=1676697805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EbWANJsRUZKLUt4JPLl6gZ4pr9WFC3q+JjvG5T4qSp4=;
  b=GzY0T+JzZQrzIfTf/7SlBGQ4M/347YCe6699vOlvLj+EmAEw64lWw3AR
   1DbMktSgXldxzmm0Z2Jf6BQDApAf6jJW2D38SpvLks2GGaCrX3znuBDMl
   2Vm4EWc5HbVg12Q2pQUDNQvos9FiTabJPG7/jZGJbT45ljjjmR3/8UHQA
   ayZbdQmth920/iXYUjqe/sy6o/S+5vd7YOGPOcACe4AvLHZLaQfWK+96A
   Khkvmpgg+judm9h3USDmc2mK1oPyCFUfytd9zqMzpnhyO5YyOyTiyIFcw
   Ql5vLLgkIXfdhDoBM9C9tYZojgVgp7gTnmKiJU9ZmgflNvdw7UXlTuD+c
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311796813"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="311796813"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="572170395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klsHyxy/ZHkhJQJCFMkK5yQt/Ugsqyb9YngqFE/kSoZso+AHvas1TD9n1TrUGBnxWjRZ1w66m/sEv5s/xDW+bAZGEwonyni+xjaxtg+Ufuw/CHfikuRMTNnnfH0sXjQn9EVRgeKM2Tu/E88RF8O3tlsQ5KKdcYqUz9gvKg57bpUJ0y+DrmDIjqZ0C9tGfR5a2tSDtD33YiUrskfUoFDree+gX/1RiJ40TMqctZj75b7CwkxbI/pNCKBEBHuzNzQ2H6IENAYZXQ/+CP7oK6n2X/IhYQiSO8VTs6TYLFLzh5MrtK+1ZGXEajMcBui/o5CvTAe+2rmizTKfySE7byo6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbWANJsRUZKLUt4JPLl6gZ4pr9WFC3q+JjvG5T4qSp4=;
 b=Z8q/0NvD1pfayOeYQ92if7xoc1QgzyAQs5TJb8CkET0u28bB1hsx4lV+beRUKIGWCVNGgbZs+3RIe4veGFgkF73mPhD6eIpR27IzzeOFczN75KVSxQkLccCcPYml2A2Uza8DrImWKcxMWguewbg3gOVZ65D25ePtpp3X2g128WVoDwD+prqC7nqe9Vy/YcGofQKBRE1xh0TIG07p2fBK58AKJP6UBxWjyWj19YIVULJFxDemWmXKnkXb/SZakw/NvDUsv8v1FvLxMUy8aJlT1Rho2WtLGs0C/0QKzS1NB+xvpZnG0TKiPz7UogSeo7RpLd4Nd37SBwhM5y+4t4PVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 23/23] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Thread-Topic: [PATCH v3 23/23] IOMMU/x86: add perf counters for page table
 splitting / coalescing
Thread-Index: AQHYBkCIiD6zzqjEpESy/R2RlVmrhayZAq9g
Date: Fri, 18 Feb 2022 05:23:20 +0000
Message-ID: <BN9PR11MB52767CD34997901F4455BD168C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <b5d5d7b1-7b53-5c74-1988-3baec74a9f45@suse.com>
In-Reply-To: <b5d5d7b1-7b53-5c74-1988-3baec74a9f45@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86909568-9e40-44a1-3461-08d9f29ec6d3
x-ms-traffictypediagnostic: BL0PR11MB3393:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB3393ABCB599BF9549D8C6E418C379@BL0PR11MB3393.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xgUTq2oB1+JV0x/gq9Pw9xHhT+eWq4cOwAf5aXiGb3g1OtH3Ky5BrbFOwAlgql14C3xUz9CR4o1ydyFkrtH1yS0ey2HdLkj4+KKpSgvmRMGwZpz5v37hr/2S1BELBvCFOLz2RMzYFsTChzU07+fJTNKJVobLD6ms+fvPAtDZETEuTTiol/L0/p2LvC6+rREvMi1rLCgU44nGmKl8S2bPlvZLati7sJXUfdqV/vn/w0/u8oAKDrvW42Xs+bsH5F2TU9+A2mTRyGZ+hsZZYJNGS/6MRSv9cCnYU9z2WpdcCwVlQI9nS8kEY3falYMvLNCp/P1mXzP9ShDfPjk9ZpEEWTBaB660PAQr60XkDIcYinTi5Ui7TQIOR5rT2bBsNgpz4DsB3TTGRCDDcV1UGIAzTW7+EJOMvGCYkAg81eY/R+zchvSGxN4mlEU4iXbevMbI8uZHhCzrSTU4Hwsi9RTQlG0PtZQH05sdtLcpcmJUWwhYEx28C4VPrDWhy0xR6qNGvGnFBH/a6YmY1GMSgCoBjRy70G9QvZbEEd6/VeiFLUwV+xtbRoiA6HT/kWOi+Tniae9o7YF8btmEbG5kmzSB6KsxfX8AlUEJq0+EC5sGU+837SE9iCoocGDQ9+AdjquCcmc2JlsZuwF+bsbMqXPyJt7qE+pXMRm+PTguDtqQXtGLq6jEpE5BM4q19cSrwe1ZAGOc16oGGG6UzR/bjsEhIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(2906002)(76116006)(5660300002)(64756008)(122000001)(26005)(38100700002)(54906003)(8676002)(83380400001)(186003)(66946007)(52536014)(66476007)(316002)(66556008)(110136005)(8936002)(66446008)(33656002)(71200400001)(7696005)(82960400001)(6506007)(38070700005)(55016003)(86362001)(508600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnRFU1dIMmcwWmlUb1FtQTByT2RXZkdTazM2azdTT0M3aVEwYTJZb0poQmc4?=
 =?utf-8?B?YWJPSUwwYU10c2U5dWhmWDZ1aytpN00va2VyK2lKblh4MzV6Wm15WGFFMDdv?=
 =?utf-8?B?Mk01dXZUa000QnN3SDBZdGpTNUNRUmVWYlg5UlpoMDNVTSt2U21jUGQ0STJi?=
 =?utf-8?B?UlF3SWRNdGdOU1ZFRkwxREZzTi8wYndjS2d2Vk5ybDlDNGplK1B6R0ZKODZr?=
 =?utf-8?B?T3dKOVhXY3NtS2lFR2EydUtlRUVBWVVTbHZybVN2MUN5MU05QTA5TUZOQkg2?=
 =?utf-8?B?c2hRcnVobS9lbEpBVkdDRHlQVDE3bktLbDFqZGsxeUJQU2tZT3dUMnpjWWJT?=
 =?utf-8?B?OFVqUW0zb0dWZWRxRWF3VUZQMTRVbjR4Ty9MQ2JacUJvQ1NUazdmL0pzQ2JS?=
 =?utf-8?B?VHN4WXg0d1dKMThPOUN2dHZDQndZcThreXhVK0V3dHJrenlXSFZSSFZjRlRD?=
 =?utf-8?B?YkRWdk8zYWNOeUhvdFFOcXprMGpGZGFGT1B1Qno1czFhZHF5R1dzclhxVm5W?=
 =?utf-8?B?eUs3VUc3SEZ4Y3RJRGp1WDRBdWgxZ1lLNnVnbUY3ZVYrOFlXSzdUcFhRc2Jy?=
 =?utf-8?B?NHlKTG5kajRkT0o4TUxLNldRd3RWeWFzbzFiUC9wOE5MSStqWjQ0Z0M5UU5B?=
 =?utf-8?B?NUE0QWtQOXRlaWR4NjhtME5yR1NxUWpKb2pkRUgrTTU1RmJHeUFOT3BEMVh4?=
 =?utf-8?B?NlptUVpBMnJnU2h1RWowaGRiRW9xak9ka2hCVVpsNDlsYURWMXUyVmNFenRH?=
 =?utf-8?B?RkdKY1V6T21VY2NtWnZMR3hVWmhXQllKVEhzYzJWMlBZZGJvMjZ6VGJjbEl5?=
 =?utf-8?B?RGJCbGdpb0NRYldGSHRnSjBTazE4cEhUM3NGYjVXdmJyUy9odWE1UFRHTmsy?=
 =?utf-8?B?RkNUa3lySDJXYUNIOFpkNUZhNHZmTEszTWx5M01NQm1YQ042dDBubFJRR0VB?=
 =?utf-8?B?L0RPMkY3VFdQNTlSdDlFeDBrcUhxRHF5V24rUktSRFhtbzdLY3dLZGtPcWNm?=
 =?utf-8?B?SSt2YnZZemVCNFJjUkRQU2FKVUROeGNBUkgxUEFYR2tJMkFNOGUwT0xVeEV5?=
 =?utf-8?B?TXNCRmYreW4zWmVHR3QxMTNiUkNFdnpkWXFVeHBuSGltNmJwUXRoWjJtU3RN?=
 =?utf-8?B?NUJGSTZvS3EyKzlIQ295TFBhY1hnWVR4OTFPdnpwSmM2SllWNWoxd2dUNkRz?=
 =?utf-8?B?dXNLVHVDRjZVQU4rUEZKU2hVd25kblljcm9CZ2U4SkhnWHpPOTVIV3BiV21Z?=
 =?utf-8?B?Wkc2NXdWeE1wZERTc25JeUhnNjlwSGlGbWduWFVnK1E5aXVOZG5waTJhOGdl?=
 =?utf-8?B?NGd4SUFZTHREbi8rbVVvSXZMcDM2K3dRUVNCMDBuVEM2YzhXWUVaZEFGTDFp?=
 =?utf-8?B?MG9memVGdGtRckNselBOeC9FempXSC92USsxeG9LWmNLK3FGOTd1WG94QkxQ?=
 =?utf-8?B?eTBrTVlFVGhaaTNjbXZNd1VyRjR0ZFBaUU1GNGpwaUVCOGN1Q1B2RUZzVW4w?=
 =?utf-8?B?dkdDSE5maDNpUURic0t1bEFZWFNzZE5sVVorZGZDV3hXZUowWHdkZTZ0cWxj?=
 =?utf-8?B?SXRQY29hMTlGai82Y0drb1JrRzJHcUxLMlJrTzdubTBPSlhSN1ROV0MwcDdE?=
 =?utf-8?B?VjZoZTFUOElYOFhYK3FuaEtpZDd6MHNkODVOYmw5ckJoa3pCUjBRZVFNSnZr?=
 =?utf-8?B?UndQb0lqMDlpVEVhNi94eFJlbC9hZFJsSVRPd0VLYWVVK0c4ZmQwT1ovb3Bz?=
 =?utf-8?B?eFZXeEVxZWtPblJKYjhXdGhTMndUdE9iRkFkVDNLYzM4R2JtemFqZXhLWUh1?=
 =?utf-8?B?VXQ1SWZzSWtRdWpJMXkxUjZUNnIzOGpab0ZXQnp6Y3JydnRkNGN0NW9SY05R?=
 =?utf-8?B?Z0s0aTRNUXhqbk8ycGFGT0JneE5sNUQ5OHJERE0vM2EvUXZTMXdDcDVXRW45?=
 =?utf-8?B?ZktMWkRjeGYxbGt2b3NXSjNWcEhlYWJSbEVoL25hY0M0d0E4WTNVZzBnSnlJ?=
 =?utf-8?B?TngwWlpKMlJIY2t2UFQ1UCtWbUNBdTIzNkFTU3hGT1FnSVl2bm5tL1JLSHlx?=
 =?utf-8?B?S0Vac01kKzhhOWpsdjlWUlhTdkVyOWh1N3cvU1RvdWwyenQzUGRKSmM0OTRI?=
 =?utf-8?B?ck1yck1HWnp3aU5Rd05TVGdEN1J3dFJPQmF3SFlZSG40bEhmb090cUVHdlVU?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86909568-9e40-44a1-3461-08d9f29ec6d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:23:20.3015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CGtUeAKF5NRfWXNa77yV6cfraRzMXxUiXrAW0zzzB0zoCPLcpO/gc/XMNrSXEBMpBsovALnEdCZw8dOqQHeZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3393
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MzkgQU0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIHRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiB2MzogTmV3Lg0KPiANCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYw0KPiBAQCAtMjgzLDYgKzI4Myw4IEBAIHN0YXRpYyBp
bnQgaW9tbXVfcGRlX2Zyb21fZGZuKHN0cnVjdCBkb20NCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsZXZlbCwgUFRFX2tpbmRfdGFibGUpOw0KPiANCj4gICAgICAgICAg
ICAgICpmbHVzaF9mbGFncyB8PSBJT01NVV9GTFVTSEZfbW9kaWZpZWQ7DQo+ICsNCj4gKyAgICAg
ICAgICAgIHBlcmZjX2luY3IoaW9tbXVfcHRfc2hhdHRlcnMpOw0KPiAgICAgICAgICB9DQo+IA0K
PiAgICAgICAgICAvKiBJbnN0YWxsIGxvd2VyIGxldmVsIHBhZ2UgdGFibGUgZm9yIG5vbi1wcmVz
ZW50IGVudHJpZXMgKi8NCj4gQEAgLTQxMSw2ICs0MTMsNyBAQCBpbnQgYW1kX2lvbW11X21hcF9w
YWdlKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
bGFncyAmIElPTU1VRl9yZWFkYWJsZSwgJmNvbnRpZyk7DQo+ICAgICAgICAgICpmbHVzaF9mbGFn
cyB8PSBJT01NVV9GTFVTSEZfbW9kaWZpZWQgfCBJT01NVV9GTFVTSEZfYWxsOw0KPiAgICAgICAg
ICBpb21tdV9xdWV1ZV9mcmVlX3BndGFibGUoZCwgcGcpOw0KPiArICAgICAgICBwZXJmY19pbmNy
KGlvbW11X3B0X2NvYWxlc2Nlcyk7DQo+ICAgICAgfQ0KPiANCj4gICAgICBzcGluX3VubG9jaygm
aGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4gQEAgLTQ3MSw2ICs0NzQsNyBAQCBpbnQgYW1kX2lv
bW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqDQo+ICAgICAgICAgICAgICBjbGVhcl9pb21t
dV9wdGVfcHJlc2VudChwdF9tZm4sIGRmbl94KGRmbiksIGxldmVsLCAmZnJlZSk7DQo+ICAgICAg
ICAgICAgICAqZmx1c2hfZmxhZ3MgfD0gSU9NTVVfRkxVU0hGX2FsbDsNCj4gICAgICAgICAgICAg
IGlvbW11X3F1ZXVlX2ZyZWVfcGd0YWJsZShkLCBwZyk7DQo+ICsgICAgICAgICAgICBwZXJmY19p
bmNyKGlvbW11X3B0X2NvYWxlc2Nlcyk7DQo+ICAgICAgICAgIH0NCj4gICAgICB9DQo+IA0KPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtNDUxLDYgKzQ1MSw4IEBAIHN0YXRp
YyB1aW50NjRfdCBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKHMNCj4gDQo+ICAgICAgICAgICAgICAg
ICAgaWYgKCBmbHVzaF9mbGFncyApDQo+ICAgICAgICAgICAgICAgICAgICAgICpmbHVzaF9mbGFn
cyB8PSBJT01NVV9GTFVTSEZfbW9kaWZpZWQ7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICBwZXJm
Y19pbmNyKGlvbW11X3B0X3NoYXR0ZXJzKTsNCj4gICAgICAgICAgICAgIH0NCj4gDQo+ICAgICAg
ICAgICAgICB3cml0ZV9hdG9taWMoJnB0ZS0+dmFsLCBuZXdfcHRlLnZhbCk7DQo+IEBAIC05MDcs
NiArOTA5LDcgQEAgc3RhdGljIGludCBkbWFfcHRlX2NsZWFyX29uZShzdHJ1Y3QgZG9tYQ0KPiAN
Cj4gICAgICAgICAgKmZsdXNoX2ZsYWdzIHw9IElPTU1VX0ZMVVNIRl9hbGw7DQo+ICAgICAgICAg
IGlvbW11X3F1ZXVlX2ZyZWVfcGd0YWJsZShkb21haW4sIHBnKTsNCj4gKyAgICAgICAgcGVyZmNf
aW5jcihpb21tdV9wdF9jb2FsZXNjZXMpOw0KPiAgICAgIH0NCj4gDQo+ICAgICAgc3Bpbl91bmxv
Y2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IEBAIC0yMDk5LDYgKzIxMDIsNyBAQCBzdGF0
aWMgaW50IF9fbXVzdF9jaGVjayBpbnRlbF9pb21tdV9tYXBfDQo+IA0KPiAgICAgICAgICAqZmx1
c2hfZmxhZ3MgfD0gSU9NTVVfRkxVU0hGX21vZGlmaWVkIHwgSU9NTVVfRkxVU0hGX2FsbDsNCj4g
ICAgICAgICAgaW9tbXVfcXVldWVfZnJlZV9wZ3RhYmxlKGQsIHBnKTsNCj4gKyAgICAgICAgcGVy
ZmNfaW5jcihpb21tdV9wdF9jb2FsZXNjZXMpOw0KPiAgICAgIH0NCj4gDQo+ICAgICAgc3Bpbl91
bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9wZXJmY19kZWZuLmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Bl
cmZjX2RlZm4uaA0KPiBAQCAtMTI1LDQgKzEyNSw3IEBAIFBFUkZDT1VOVEVSKHJlYWxtb2RlX2V4
aXRzLCAgICAgICJ2bWV4aXQNCj4gDQo+ICBQRVJGQ09VTlRFUihwYXVzZWxvb3BfZXhpdHMsICJ2
bWV4aXRzIGZyb20gUGF1c2UtTG9vcCBEZXRlY3Rpb24iKQ0KPiANCj4gK1BFUkZDT1VOVEVSKGlv
bW11X3B0X3NoYXR0ZXJzLCAgICAiSU9NTVUgcGFnZSB0YWJsZSBzaGF0dGVycyIpDQo+ICtQRVJG
Q09VTlRFUihpb21tdV9wdF9jb2FsZXNjZXMsICAgIklPTU1VIHBhZ2UgdGFibGUgY29hbGVzY2Vz
IikNCj4gKw0KPiAgLyojZW5kaWYqLyAvKiBfX1hFTl9QRVJGQ19ERUZOX0hfXyAqLw0KDQo=


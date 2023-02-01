Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515C685E9D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 05:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488091.755984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN526-0007eN-WD; Wed, 01 Feb 2023 04:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488091.755984; Wed, 01 Feb 2023 04:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN526-0007bj-TP; Wed, 01 Feb 2023 04:47:42 +0000
Received: by outflank-mailman (input) for mailman id 488091;
 Wed, 01 Feb 2023 04:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rT7Y=55=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pN525-0007bd-98
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 04:47:41 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b6db635-a1eb-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 05:47:37 +0100 (CET)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 20:47:33 -0800
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 20:47:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 20:47:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 20:47:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 20:47:31 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Wed, 1 Feb 2023 04:47:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 04:47:28 +0000
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
X-Inumbo-ID: 8b6db635-a1eb-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675226857; x=1706762857;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kFjD2zj6aJjG+o2lSli+t3S8WH0BY1DmT6LK2G+iY7I=;
  b=LbuDo/78mmTrfg6EBenCh1M3yHSbqJsTRudC/heJh/+Man9OWVYjpKzk
   iclntU1uMLYBXKnVbSDx39zOS3YqH5uH+Xh9aaKFD1tcaj1cmtBZefm9N
   CEZc+reQnYrqroBDpS7TLBfhmwAZNCUrhLRJR9eHxCjyEBmk4mAEwyjyz
   Cmpage9KLCVq4zDwq01ioIe+XX3riWUqRDqt3kmEmaQ12ofGHHnY4206+
   /RxElusSyUX1d8JkroXP0ARO47WieBYXtjQonwyVcr2hnvXNTPBp2puiC
   WZmx3ItXLPOsf1ZRuRtvf9yDYLb+05Xtw2ISk09sOvTgt6JVBipLhjUvD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392596328"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392596328"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="993543069"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="993543069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxtGd0LCkkULl+/TZwzWbqAHZUbphv3olrnbeRS9w35n6XoQIA3U9G/FljUrMVRiG5WCD5fCZQH35WzflshyHZlKkPy/h6FPnNjINjj5W1kEsUq0QbwKSAJeNjdAE6gloT2oD5b3xEdgDFDICF5VuKFd+NEx6vlEwL/KkxzIQUY3zhSaLYxv5K/jbGZOjki2aw8JYKAapmgC6QHPzsmKCobk/bFn6+db5mqqKLkH1ARiltEEyFY33juc82vt8OA4bWLsbZGDwnEBx7llkd49fb7wceqbWzWqyopHvGI15UVTNPmxHMENJ9rL3TMqJxiDadz4w4mvd+VbAyUfO6Mytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFjD2zj6aJjG+o2lSli+t3S8WH0BY1DmT6LK2G+iY7I=;
 b=fUOFGey2naTP/hYEXNlq/6tQIOzRmdY/IlUXC+U5SZa01OEyubWd4fgexZFo1nHvl95GvJyzGSLEV7lEyOWTtI7BqFnSjWzWeYOoM3FQ38oqRlpiFCYCl1YZm8reJF+mlpzYNIESGb4PIGG+Bi9h+qtbVWJqNX7l2i1YHzbr3pzJZp9e6F+f62qPIfxn939/QSPtOkl0+um3Lqh6LdMdRFq4+ssmL1PRvp+PBOcUQ7lvFhxi+Uk4NmFDEVwSEYwyohz7mqDZobH6kbElGl3129WuHgKrPRn5vDanzZWISx1wx8AtkrfjkQTAN/hZ8qPn92wh0sE/cRo5XRb6Cc8aHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Paul
 Durrant" <paul@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: RE: [PATCH v2] x86/shadow: make iommu_snoop usage consistent with
 HAP's
Thread-Topic: [PATCH v2] x86/shadow: make iommu_snoop usage consistent with
 HAP's
Thread-Index: AQHZLKt8IVjqligRc0qxDetLKfU0DK65lxGw
Date: Wed, 1 Feb 2023 04:47:28 +0000
Message-ID: <BN9PR11MB5276062E971D00873E9E33248CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <8d41b8ca-decb-e175-c77a-1c8f91fd2046@suse.com>
In-Reply-To: <8d41b8ca-decb-e175-c77a-1c8f91fd2046@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7786:EE_
x-ms-office365-filtering-correlation-id: e0cd8861-92c7-45e0-0213-08db040f6bfc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xl+1TrIEM9wA6fQhAA8bL65kIL4dKu01sEYc28Jm47POwJydPGGbmECI+uR7OxxkD140E4GuJyLFvxeP8wmnj+96p51c8SSe5m7J5rGw+QG8phpcgjGQXaaHdOWi5/j+T4borRqpzSGOXBGpsHraeFDVW7W2hCPcXJrMBi4SKSUQJaQKHQvm/rjWzigpICIpM+Vtn+00gGyh5vSSuNCG7+FM9QKIravGBCxh0eRSm6jl9jz7Mka+DOtBolqiemQaIpujl6v7uXM9otYNDZyViwMYM1WXfsFBPlqa5sUXtaIBwJcvJyvoMa/HSDRZE1RBmcdFvClpkr+df+AJ3jsUgVLe7Yvc5+jbVs4dzvA/pPDT4wjpeWoCJIs6cWecm7SYekzrecOruuejaGPlpFPRpidshzLZEKl8TxYmIwkWGX1v+0L2ZyfuDZSPR7mo17A5iIX8N9LlHIkMYHhAB6h7YBjAGsVn5CKkmazodbKcQPIym1ErRFDb+N/1nKA9puRLnLwSc6njwIVzNvsIKSyXitji6L3uVbAukOZodFXtz81WlEn7FnCSGWB0MjeUuDagNKFjMbvqmidotnC96m3BQjvj7urAkZ0DwnqY/j1XaCgj1Yzaq1+Hls08ciUDz8+hjUXHzYPmZWXoREGBPv/smBMQ33tsopIS9wF6CIb4fSgNOaA74FFtM5TjE2VgaFQpvmWR31DQLteUiafZJmVUTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(55016003)(71200400001)(4326008)(66476007)(7696005)(6506007)(478600001)(9686003)(2906002)(8676002)(8936002)(41300700001)(64756008)(26005)(4744005)(66446008)(66556008)(186003)(66946007)(76116006)(83380400001)(316002)(54906003)(110136005)(52536014)(5660300002)(122000001)(38100700002)(82960400001)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDk0U0Y5d3lVUEtPYWp1ajJOZHdCTVVaQ1QyYm0vRW5GRDFib1ZndDIzNjQr?=
 =?utf-8?B?NjI2NmF6SkpvYno5NzdxbWhrR3B4YlV3dHNWTEdyUk5CLzNRZ2VKZHZvYk52?=
 =?utf-8?B?dlhhbE5qellvaTZUeU9XWW9JNitBTW5CZkdheFRoa2xDMjEyWkZpeHRLeDBP?=
 =?utf-8?B?RUJBelY1YkExblYrNnFpWnVreGZJakRueUFPd0ZVVHY5UmpDWHoyNit2dEVW?=
 =?utf-8?B?bmtBMFNwNVlnQkkxcmRwRU8yYlBZMEk4L3pWWGYwQjAxaWpDVGdHWmhIREdp?=
 =?utf-8?B?TTF2ZUdJTFpWZEtNMGU5Wlp4TjcwalhvdThySTZkMjMrSXpPYWhYNmwrRHpF?=
 =?utf-8?B?ZGQwUC9zemd3SXFSSjR1U2lxMjJyMjU4Si8xVFpmZWdKakJFTlFDVGdWUVNY?=
 =?utf-8?B?OER0YlBUbFZJczJTVDBJUnpHM0pGWi8zenlPcGFXdGt6Z0hOeUlhSm9JWU9V?=
 =?utf-8?B?YWxZUGlaWUVkbTBVQ285eU41OFREd0djem80eUR4ZmtIYXEva2trS0pZWEY5?=
 =?utf-8?B?YTl0K2wwdURCMTNTQ1Q3SitRSVJmUXFkTzd4V204dEZBTVg4K0FhUGZkN2wr?=
 =?utf-8?B?SFFqbjltZWgrTVVmOVE0NkZlRFhFNmp1UUpvQVE2UzlCWXVwQ09CS1k0SEtu?=
 =?utf-8?B?RHFuMW9POWlCNlBFVS9Ub0pCallLSENYUUNoWGMyZGZOdE9EZ2QvRWdibGZw?=
 =?utf-8?B?dWJXY0YxMjJYT2RVdG8yL0U0aHMyckJ1OEVQV0pPZGNCemJicHY5QWliRzk1?=
 =?utf-8?B?OFB0eCtkdzRlcnk1VjFHMUdFeHgrN0NoWTRGajF6WS9RRStDRWcxdTlIUWpE?=
 =?utf-8?B?Ty8zWFNieE9xL2JQU1RXNFRWcXI3WTcxMldJVVBic3hxMjVSOENySjV0Vkpp?=
 =?utf-8?B?S0VSdGZQTjVxczFHaW5JekJkOE1SZTYxY0p2WVhWRzJSL2ZXdFlvQWNVM01G?=
 =?utf-8?B?RkNQMkFLRzRSU3BIYWpoRE45ZEpEY1RhKzJFSVVBQ2M4eGc0S0ljampmcGtq?=
 =?utf-8?B?aGIxSWwrczNjWHVxTERNM0FjSFV5VW8wbnFGY3pkVXV5RGYwd2NTZTdUQVVt?=
 =?utf-8?B?TDVIclowK2xjMFY3bXgvbVZ1b29LcGNsdWZiamxKcEtvejYweTJING4yTUVP?=
 =?utf-8?B?aFlqcndiYlZqUEhWdXQvUFZrL0xwVm9pOE9Majd2RllWYTYzdDZqUlpGMHFN?=
 =?utf-8?B?NkhxN1oyb3NGYmJJTE9jWFVTUjMyRytzRXB3SStocHptOUk1QVVkMFJRWm95?=
 =?utf-8?B?bGRTU1J0UnptK1JCZ1dIVEZoN1FQK0hzN1c5d1U3bHVNdXRMUzhuZUtaYmNL?=
 =?utf-8?B?elBtSi9PWUNoNTNVMWNyNmRyZ01WZjZIU25mdDJiVi9KeWprekdwYTZsQlNJ?=
 =?utf-8?B?ay8rejk5M0xIK2tVdGJ5R3FMU1FSSWxwWmRiVCswQmpEc0l0WFBXUGN6c1gv?=
 =?utf-8?B?Zldaa1lSRWJjTjkzRjNqTFFVZTVsMU9LVVNvMjlYcFZmTEk1MlFYN2Zuam90?=
 =?utf-8?B?OXh5cVRFUHcyRE9ucW5TUThMVjQzb3EwcXVnNjJkMzlGSzRmK01LY1JwRVJi?=
 =?utf-8?B?Y0xvOXA5eCtlb2tDNU54OEdMbjJqQ1JSanJEbWkvMElPNVhDMCtRNGFLMTZm?=
 =?utf-8?B?SG1HNTZqejVMVWdwK1paRmhjcDlDTjZiZmtyVzFQOWx6Q2ZjR3VwY3hkTjVq?=
 =?utf-8?B?TWZpblR3SjRySGtvV2gzelUrUC9XaCs0YjJQRTQ0MnhWbkFyUVFyQW9yZFFX?=
 =?utf-8?B?TERVUFh6a0IwR002SkkvNDRTU3lxN2R6TEFmdURoTmxjNktYZVRpNzJJNGh6?=
 =?utf-8?B?dklqcHowdWt6SW14RDNMTFVOL01mZ013aFJZY1V2L3FhZzYrWm1kdE90WFI0?=
 =?utf-8?B?Vm1ReUZLbmJoVTlma25KZEZyY3puM1JJTzBTSFlhaEJYZTUxMitNbE1nandu?=
 =?utf-8?B?dC9IeDg4UUdoZlhOWFVDNm8vVCtlOWJtVytFSkNJMngrZE4zalk2YTVjd2F3?=
 =?utf-8?B?eVNvOVlYRnFkMk1kZ0MzUDlvSVZ2YTRQVW5EeWFwWm8wNllPTERXSFJsMi9L?=
 =?utf-8?B?TjNqU1NQY0hKRktxN3hhaWF3VlFJS1JNQjFKU1p1RkFKaUVJNUcwMmxwRTB4?=
 =?utf-8?Q?DhNKUYAGDNYkL9A/IQ/NDblix?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cd8861-92c7-45e0-0213-08db040f6bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 04:47:28.5442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nz3j5PHBvh7+Fug8RT0yjpLguVwi+C4r0HIfBvfAD4cmbLBfLodLv0jZ0s8V1ZggvVsES24gOcN3RWZYjyPuUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
SmFudWFyeSAyMCwgMjAyMyA0OjQ0IFBNDQo+IA0KPiBGaXJzdCBvZiBhbGwgdGhlIHZhcmlhYmxl
IGlzIG1lYW5pbmdmdWwgb25seSB3aGVuIGFuIElPTU1VIGlzIGluIHVzZSBmb3INCj4gYSBndWVz
dC4gUXVhbGlmeSB0aGUgY2hlY2sgYWNjb3JkaW5nbHksIGxpa2UgZG9uZSBlbHNld2hlcmUuIEZ1
cnRoZXJtb3JlDQo+IHRoZSBjb250cm9sbGluZyBjb21tYW5kIGxpbmUgb3B0aW9uIGlzIHN1cHBv
c2VkIHRvIHRha2UgZWZmZWN0IG9uIFZULWQNCj4gb25seS4gU2luY2UgY29tbWFuZCBsaW5lIHBh
cnNpbmcgaGFwcGVucyBiZWZvcmUgd2Uga25vdyB3aGV0aGVyIHdlJ3JlDQo+IGdvaW5nIHRvIHVz
ZSBWVC1kLCBmb3JjZSB0aGUgdmFyaWFibGUgYmFjayB0byBzZXQgd2hlbiBpbnN0ZWFkIHJ1bm5p
bmcNCj4gd2l0aCBBTUQgSU9NTVUocykuDQo+IA0KPiBTaW5jZSBpdCBtYXkgZW5kIHVwIG1pc2xl
YWRpbmcsIGFsc28gcmVtb3ZlIHRoZSBjbGVhcmluZyBvZiB0aGUgZmxhZyBpbg0KPiBpb21tdV9z
ZXR1cCgpIGFuZCB2dGRfc2V0dXAoKSdzIGVycm9yIHBhdGguIFRoZSB2YXJpYWJsZSBzaW1wbHkg
aXMNCj4gbWVhbmluZ2xlc3Mgd2l0aCBJT01NVShzKSBkaXNhYmxlZCwgc28gdGhlcmUncyBubyBw
b2ludCB0b3VjaGluZyBpdA0KPiB0aGVyZS4NCj4gDQo+IEZpbmFsbHkgYWxzbyBjb3JyZWN0IGEg
cmVsZXZhbnQgbmVhcmJ5IGNvbW1lbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCg==


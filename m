Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00E508152
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308891.524779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh40N-0004hs-UP; Wed, 20 Apr 2022 06:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308891.524779; Wed, 20 Apr 2022 06:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh40N-0004ea-QU; Wed, 20 Apr 2022 06:39:59 +0000
Received: by outflank-mailman (input) for mailman id 308891;
 Wed, 20 Apr 2022 06:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh40M-0004eS-3S
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:39:58 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afef5691-c074-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 08:39:56 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:39:53 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2022 23:39:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:39:53 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:39:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:39:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:39:52 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB4095.namprd11.prod.outlook.com (2603:10b6:208:150::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:39:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:39:50 +0000
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
X-Inumbo-ID: afef5691-c074-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650436796; x=1681972796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7rBLHHrGkg/4TvPuK3RUJQbKvkw3gMsspWiitP1t69c=;
  b=KiS3z6YTf6xU/9jnnjhQdDM0AHL3xwzToIEdfhNYBdebCEXOaTcJszBZ
   G70dDQLHBuotcPtlpON4lgVKL1ANFee0iUL366s8AW9sbBsZfI2lAdtkA
   TpzCjR7cJyc2xqzp/8LAu/HpdZJNbYaFzGpz7jCS9dIfGtcZaRbPtDNZ3
   KW4hRm3LR0a7gXFG6DNm1l/USzBrt5W0owqCFH/LqIycohGEK7MVbYdg4
   7f4K09BeqVgLuRGNn2Fyjq4r7MSeW5wEvpfv/JKNveGkWNnkk2/4w49GM
   fGk/X062TAgM+u0qiI14y7yrzWZi/PEp8qii5luLs1hdTl7204Xx14E3F
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="261555351"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="261555351"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="555059532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADuumaRQXH0P66mVaCPMB7jiWjFxA6ugIRZ8ny9iSpr7eBAk+uwgT9PQxKKSMF96qqHHz6sEyyQ2DSFdzPmmsx+4VMv8A/U/OTDe3VNnJuDfG4AiPkzSKevjPmOdV+GjuQ9TwffvO+NGK16yu6aB120DkChk9D39VPaywUz6Kp1udY+RorH2YnFhqm9x79Xqo618Xo/mnlhbpTsEH9L8vr5YP8lLjPKanR93bXRgkEG7OyGZhCIEqs7whsNHanDwZ3TxQyfec2c3ZvCVcRXH+MVxdAPfvKQa+I76lyRQs0d0CKA1fLZmxAmnqML1/AVi8qHoy7w0/ly5pUjxYYgF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rBLHHrGkg/4TvPuK3RUJQbKvkw3gMsspWiitP1t69c=;
 b=XU6Ja0atnHnYU9FaXUuN+wmY/swxH7FwOdxa9HAENy+QOQcVVeKgWG5Duv8KK+5IfU9op0+f0+pXyOlBOxDS9mhaF83DAhQqY86hbTeC+Xnn3GdMujysfOIOES977l6JHGXSGcRpxOAaqpiQC7he47+hUD/eJTujgeW012PKTz3U3dTM09vwPp48KuMOfaHI74hY0n/CezrMpXHqmnTWrMr+mxXZ/aE27rPAo3XTKED7CSJzkdXfTjnRkO6emj1epGzAbj7IgYzosrQ7r8fV/iynNImlCNyitQXK2WV4VIsntu2QL/cWjItaJ6Lbbozny51HnCGp1SgImJvO7qyNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, "Lengyel, Tamas"
	<tamas.lengyel@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: RE: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Thread-Topic: [PATCH v5] x86/vmx: add hvm functions to get/set non-register
 state
Thread-Index: AQHYQE0JDO4TZ1lTNEeFxdnKer9Q96z2J8gAgAJaNrA=
Date: Wed, 20 Apr 2022 06:39:50 +0000
Message-ID: <BN9PR11MB527672E1BF038742F290A7798CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <e57797cbc2c0706c03363cc7fa1b3e234921fee5.1648214955.git.tamas.lengyel@intel.com>
 <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
In-Reply-To: <CABfawhk-oCAoz-99LOaOYKD-N1FvRnFvM9_AUCgsPEF16F=VCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e02c5df-8e21-40f4-ad15-08da229891f2
x-ms-traffictypediagnostic: MN2PR11MB4095:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4095DAC0CB6597FE23473CFE8CF59@MN2PR11MB4095.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4YR8MwGiD5hEOhMDn8FS0+0NhhGQY7ys3F81kUMvc+t50IQFrM+2SJ7NXv0q3mYkOLWLppAKKucwOXpcOVaAAa5crk87yGnaD/KVJS66283ItI0GZdJp8gofvqztRX6DkSrtuTX2Uocx9xdZv04Hv074bgVc53REnBp0gu9NpXRVCgfoqMZPpeRaPjKE/8L6z1bh8EyRunSP1GfCyycvYGMN9yEgrIjR+EWRnw0L/U9G/cFl84Fx9Wt/fwqHxuWP8DbBKM2R/Vw0I0/UFBzV+w8xcEmUJbzNp57r5NT8qUlFUMBfhvy1xTFr2IW2aJNUcAZaLOkxGPPhP81h2mGLHLD9YV1G7UT7zC+nDFLbJvfzOrotyrW5FAVcPDVLlUkvnRWyl8vXa/owg+f18SceMCZJ6YmAhFflfW1XoQ7XyE4OGU5LOu6evnGrxl7Ma+LUktEHWMTH8V7AQYFigOJihUDmwfveEDh9PMNlzCKkizKja9kaeyT+4s6nGRnTWd37inQWh/vOcn81arTiKtZab9/Lx83Hw6pwEw9ayc3R7o1OB8lluWsg3QCdy28TpAqngw/uGDkt6aP796Zdi9FuaHoLY38jYTYnEDXfBTxJRjRJpN1u5jz54cZgni/2VQUg/kKzQAnBfK44SUQVcPal8m04z7ykfWUauYClKTmZrm2Lrmopy6xht5DxapjUwKnHjm9/v6sJiMDPc8aSRCx7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66476007)(5660300002)(8936002)(66556008)(66946007)(4744005)(82960400001)(38070700005)(38100700002)(122000001)(52536014)(508600001)(76116006)(6636002)(316002)(26005)(55016003)(71200400001)(64756008)(186003)(66446008)(4326008)(7696005)(9686003)(53546011)(6506007)(33656002)(86362001)(8676002)(54906003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjVLQlNLQ2RUd1A0SytEZDBYYjRlUWc2TXBtUTR3UTNOcERrL290RnluVGxs?=
 =?utf-8?B?UDdqdytlb0VvemQxZFBFNUg5bW9ubEZDQ29qU1Y1TElDVkxFNGh6cVNWaGtK?=
 =?utf-8?B?KyswVGJTblFhK3hUSklGc2xUbDVhWWFaMHFDQVMxUkxxdzNEamQrZGJtTGN5?=
 =?utf-8?B?MDFlUHdjV2ZUbWc1TUl3aW9lZmVYYmRsZFBhNlN3amUrSmYrMTVMQ2ZKOU9o?=
 =?utf-8?B?WldycW5ON2haWHVKbVJYd0cza0N4MDJWQW0yWUFGQjlYdVUyaDBLdWFwZHdj?=
 =?utf-8?B?Q0xqbVl2WWJrZlFFd3lKakR6RlNZUEhnZmR2SUZvRHVKSUpOcy9XaURQNEJZ?=
 =?utf-8?B?QjFONlZCdFJLVlJ2dzJZdjByYTZiaTBYdlNXaytuVTV1YThObFBGdzkvY09O?=
 =?utf-8?B?RW0yMUN5V0hwVVY3UWFEMHJ0aDJJdUNTRURlZlBmM0VsVkc3VUdzaTdkZEtk?=
 =?utf-8?B?cTlPRGJGQ2lTLzN6Y0cxL1h5U3BXbmtMK2t0c3BMaURuUTMvRkdmT3kvdVQv?=
 =?utf-8?B?cHhPVlJ5dDJock1RUnd4Z2hXMWcyWmtDRmJqRllyT1lkMXFzUHdyUXhTcEFp?=
 =?utf-8?B?R3VQdm05aURCcWFOVDUxZit5bzdobWc1a0hwYkVJbFBML3MrY2ZUenBaeWNM?=
 =?utf-8?B?eXFjUEMxSFZsQ2ZuRVhhRmZKUFlwd2VsWkR2MUNDN3ZwQ1NLZWZieUkrMVlD?=
 =?utf-8?B?VVRUZzU5QndBVi9xNkJVMWRXamY1SmNwcEhVbnBuMEloTVEvdHV5UUoxVUtE?=
 =?utf-8?B?RHdjNmp1bUpVbG00cVBVRUhSRHExOTVuUS9vc0Z2REhQa3A0UThtR0toNDJn?=
 =?utf-8?B?NEVuUVh5R0dDdERxcEpQdzN4WGFRdWNSajhqeUFMVnpHd2xxZmtidnpqdzdH?=
 =?utf-8?B?RU5FOWtkejlReXJVcjNVSlNnNmFOemFCNWsvcEo1Q01zZzVQd0craEl3ZURH?=
 =?utf-8?B?c3FyYk1YOHkrSWcvZFFnbHBCeVd6ZzNFVDhEQSs1Z1NCRkNZOWNnc2tLQ3Y0?=
 =?utf-8?B?WVVPNlZ3V243SEtJU2hIWEplNENMSzZERmR1MlRtV0tVM3JPK2VoUTBIcVpO?=
 =?utf-8?B?MXZBVjd0QkJ3N0I2TjNjb2ZKQ3o5YkU0T2ZDN1JkWktXZzJlLzZXdk9oUTNV?=
 =?utf-8?B?OThGRzdTUzBNcjhudkw5VU11ZURhQ3didTJTSDFvdTlkdnFDZzc2Q1B1QkNM?=
 =?utf-8?B?Q2dhazl4TWN3L0lRc3NLdXJXblV1Z0tKcUpFMkg2SFhEUDBIeTZZNDVQV2xJ?=
 =?utf-8?B?dXlBeDdLbVhldnBXMmFrVHdWaTBKU0k2RGwvMW91dEdVb21FbVk1TUZSYVlz?=
 =?utf-8?B?dmlMYlhObnU3VkNYSWhtTHlwUWZDakN1NlZsRTQ4WDRzRTVwSmhhdS9JVEQw?=
 =?utf-8?B?N1JuMlBOK1F4M2JlWEUzT3VwSDQrelY1d3o1THZzajNRSmMwczc5Y3BWTU9l?=
 =?utf-8?B?RlNaTDN2WUVjWW1ITzYwVmo2bjlwNFcvYnZvSXdsbERUeHY2ejRWUXN5MWtN?=
 =?utf-8?B?MUZ6dmgwNko4R2dLYUNwOWhyZUgwVHowK3M5OXFvWHNhZVpvVk56SDRTdVBE?=
 =?utf-8?B?Vm1Yak9DUWh3YjR5L1BVdWNlOWxRNVozNzQ1c2JBMjNibXpSL2dxVVg5ZHhP?=
 =?utf-8?B?VnRrbCtKcVcybHRTdURaV1llbU1oZ1JOUHVyUUUrV0szdzdwdTBwbG1ZT0xk?=
 =?utf-8?B?T0REWXdMRDQ4UytSV0gxaEZ1SmNET0tpaTFlblAwdnlXNGlXZk5MSm9nZVdZ?=
 =?utf-8?B?aWRBVzh5c2FoNnVla3lKU3QwaU1rU1BEN3kyWmdDa3dwcGFWWFhremU4TGt1?=
 =?utf-8?B?MW11ZFJhT2NwRFdJUWRrb09GcklYS2ZZYnJFR1BRcU9mUmNtYVllbW93dVlT?=
 =?utf-8?B?WmZ3SXhPMGF1ZEdPeXFhZnRkaUVIbjFZcTROZ0sybGlHb2l2VW8xdERISUV5?=
 =?utf-8?B?N1BSYkprN2IzUi9rRnBKRnJjT0pISDgwYnFkYUJ3bldxMk0rUGpJZmRoUzB3?=
 =?utf-8?B?VjQvQnhWK0dXY0NlNkpJSVVZR0FQMTVaWXllVmxoUVhKQ2xZeWNsTkVlNjR5?=
 =?utf-8?B?aUFNSGRncGZGUFprTHM5MkthaXZ1RkRmMWMrYVhYL0ZQWnpTRDBhR3ZWRHo4?=
 =?utf-8?B?aTZFV1RFWFYzR2dYcVZMNzlKUmNDNWZQYlF1OEF1UXZvRmd3Zk5TUXQwRVIw?=
 =?utf-8?B?RXk0SjdvRGtqS2w0WXZLV1lLNlVzS0grcFpueXVmaUVkOHBObVdHVC9IL0lj?=
 =?utf-8?B?MnZVVVhhN1FZaDJYKzQ5b252RlpTSWYrVWNWTWRZTmNoZCsxa3BPZGNDN1dO?=
 =?utf-8?B?THVVZzZLem1vSmd5blVjVFA4dVJHRkxPSFNEeVBNaGgwVFM5M2VrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e02c5df-8e21-40f4-ad15-08da229891f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:39:50.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSipIzXbHl6IWvMx80n9oHRIih7X8sej176QpvGh0YfeDLoAPa6H83cbW2tOSFGq/ra1sqRj1d7Abx6sr3uCtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4095
X-OriginatorOrg: intel.com

PiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDE5LCAyMDIyIDI6NDMgQU0NCj4gDQo+IE9uIEZyaSwgTWFyIDI1LCAyMDIy
IGF0IDk6MzQgQU0gVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4NCj4g
d3JvdGU6DQo+ID4NCj4gPiBEdXJpbmcgVk0gZm9ya2luZyBhbmQgcmVzZXR0aW5nIGEgZmFpbGVk
IHZtZW50cnkgaGFzIGJlZW4gb2JzZXJ2ZWQgZHVlDQo+ID4gdG8gdGhlIGd1ZXN0IG5vbi1yZWdp
c3RlciBzdGF0ZSBnb2luZyBvdXQtb2Ytc3luYyB3aXRoIHRoZSBndWVzdCByZWdpc3Rlcg0KPiA+
IHN0YXRlLiBGb3IgZXhhbXBsZSwgYSBWTSBmb3JrIHJlc2V0IHJpZ2h0IGFmdGVyIGEgU1RJIGlu
c3RydWN0aW9uIGNhbiB0cmlnZ2VyDQo+ID4gdGhlIGZhaWxlZCBlbnRyeS4gVGhpcyBpcyBkdWUg
dG8gdGhlIGd1ZXN0IG5vbi1yZWdpc3RlciBzdGF0ZSBub3QgYmVpbmcgc2F2ZWQNCj4gPiBmcm9t
IHRoZSBwYXJlbnQgVk0sIHRodXMgdGhlIHJlc2V0IG9wZXJhdGlvbiBvbmx5IGNvcGllcyB0aGUg
cmVnaXN0ZXIgc3RhdGUuDQo+ID4NCj4gPiBGaXggdGhpcyBieSBhZGRpbmcgYSBuZXcgcGFpciBv
ZiBodm0gZnVuY3Rpb25zIHRvIGdldC9zZXQgdGhlIGd1ZXN0DQo+ID4gbm9uLXJlZ2lzdGVyIHN0
YXRlIHNvIHRoYXQgdGhlIG92ZXJhbGwgdkNQVSBzdGF0ZSByZW1haW5zIGluIHN5bmMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IHY1OiBTd2l0Y2ggdG8gaW50ZXJuYWwtb25seSBodm0gZnVuY3Mg
aW5zdGVhZCBvZiBhZGRpbmcgdG8gaHZtX2h3X2NwdQ0KPiANCj4gUGF0Y2ggcGluZy4NCg0KSSdk
IGxpa2UgdG8gaGVhciBvcGluaW9ucyBmcm9tIEFuZHJldy9KYW4gZmlyc3QuIE9idmlvdXNseSB0
aGV5IGhhdmUNCmRpZmZlcmVudCB0aG91Z2h0cyB3aGVuIHJldmlld2luZyB0aGUgZWFybGllciB2
ZXJzaW9ucy4NCg==


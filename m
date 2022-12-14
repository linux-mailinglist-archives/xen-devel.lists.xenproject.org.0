Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F284664C3B2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 07:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461723.719864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Kxo-00027D-GH; Wed, 14 Dec 2022 06:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461723.719864; Wed, 14 Dec 2022 06:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Kxo-00024n-Cg; Wed, 14 Dec 2022 06:09:56 +0000
Received: by outflank-mailman (input) for mailman id 461723;
 Wed, 14 Dec 2022 06:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNQb=4M=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1p5Kxm-00024h-JS
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 06:09:55 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e94d2d15-7b75-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 07:09:50 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 22:09:46 -0800
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 13 Dec 2022 22:09:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 22:09:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 22:09:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 22:09:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 22:09:11 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 06:09:09 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c9ee:bc36:6cf4:c6fb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c9ee:bc36:6cf4:c6fb%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 06:09:08 +0000
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
X-Inumbo-ID: e94d2d15-7b75-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670998190; x=1702534190;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sgrmIp58KvDHrKx/yXY/JLBzxh5dZF+tSmaoMZ7DzeY=;
  b=I4h9mIVI8VCgUoUYWDbtXK/LCTtbsFjTBdFrVKBZWJg9BMQ9686TPEXu
   ATTzbxl9PTeYAA9VD3QEXSQJkfGDNqI0Bv+618+deJyIUX96XkNvWc9Nm
   NbztbyUyinuKhXj80ooRnm623R1xE1rNKFcw3aSdxzzXaStoxy1FZGmqs
   ljdbyNINxjEhWS6ZY5Gpgzj/VeV4TDroUniw7sy98vdG2UWil/kZa94eE
   Lj/LWvniu6gin3jYT/u1CCkhmwfev4XFTEluLE6zDYz/j1PRG7tUhwGho
   HmHc0eZ/DZL2DdD+FZmrCiLEhyFNoXu8WE0iIEjq2fJWj7ebx2zct6QtO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="380527417"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="380527417"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="679558514"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="679558514"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc3LEZueRkYVgrdcQWCughFaox+8pDnlG/iJk/Mn9tbCsY726oZYqtIN43lqFmfBUE7ie5TPc3ms6+1HSchzgaRVRWFZPlkzNUm7IGziVEFy75nW5dH9B3onE9yOyy6SY3d3isc42vQwX3cjvRxCq4f0OPgYlDttit94+MzTyRA4ZIvRP/ouI/mpQ1rmhPzfDFtmOGB1fALIZ8OXETT3mwKkqPVaoiegMXraa8hEWHmd/SlMTfzBsTE3wgtwJYeT4YyguP3KtYvLsqlMf08GmxelurF+YeRID87s+4RsdZRNsBrDJ8lw7LnTsT/Hgp3F4uQYiL2Zf5zrSjX3+7K+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgrmIp58KvDHrKx/yXY/JLBzxh5dZF+tSmaoMZ7DzeY=;
 b=F6mnpbPMlq8WGM+WHWbzUUZB0/aoib6WaZMGTdChHxM9sTv4XSAeuLtuW5hwVfuHqlFVGTA+NBJpqW6iESYl7X29mCxknSPn7o3/8bHC/7K1gs1Q9bZiivqF/rmGjp+R14lwj34oPz4QYPIoItv/ZeCWdhs7weaxJcP2/Xb92tN79QR2pokzm0CchJ6J12SNlq7HfL7LnLsQPJv3IPQnNv4Nz8Y8IxueuxmUbyb18OhLcPMW2pz+z9TIBh/DnE2YDVDvyvE9JKXWFkHMIJMOsbgcIznKGtHSwnem7pPrJdnk0AJlhy8KHYtu5BuAUKF154Vo/bffVgu+uv0armYbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Topic: [PATCH v4 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Index: AQHZDxCBORosQTsnbEKGSZV8tCFS9K5s5s7w
Date: Wed, 14 Dec 2022 06:09:08 +0000
Message-ID: <BN9PR11MB5276CA82A976C9BC4ABAE7E38CE09@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
 <20221213163104.19066-2-roger.pau@citrix.com>
In-Reply-To: <20221213163104.19066-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7873:EE_
x-ms-office365-filtering-correlation-id: bbb155d6-8e23-4e3e-e654-08dadd99b681
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Z88ibzhHvYAlpdroDCQWj8YnWjfKXz5WDvRlrKNNlWMSyidyGRBZ39dqpmnkJ9ggJMLKXlPwpyO3s8JzDoftced/J/ocUefUG6hn4c4SWQUD11ikmTXzDY5HdEk8HtqDiGJ9Wp4UMiJX08wDsg0LtjzowmPde3CGDTLNvVpaqthtHxGdHsw7o3rVIklAozpVX9CNtc928IseJBHkBC0u7bWdn88AMtCiPz3zHQCxvJWq0X4UycitVGOugVXEiBs4ItLGkIQtB8H37cXpr5n+uNPKTucvkA8L+kxwH+NmK6fy3mCMUmAIGsZ/sUC9+ZoO9AwCyWbTLjL2ZgE9aYT4SR3dPTKJ8My7YlAwmmyG43Z0573tgpKtg3AiRay0kLX7Bo+j/UXgBD9TLcbexvfv09jOHlmHOBODurzZx9q8H9qpjxGKGrsgzlVTnNBBhi2rQtYk41AGAhWwJsfmUKgICw133BD65ixUL86C/AaFyOAVx5j8KXw+FoKOl9UGm7gTMbdYKuSOPiETc+x3shfhv2Sj4CcdRRZO3nMUFqdFpskWW6AZ52ueU9WARXCp4BjVH6CY1YE5XlgI6ii9k1Hv4FM6mYhWhRdU5Y02pA9uTNiyZUWcsl6Cysc2dZ9QCAmmB9FcKgXPm/IcNn5QKcJeiq6MY/sscT/z9joMOtZzRzb5jIidy1B2fB6npzC1Kuu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(76116006)(66946007)(52536014)(41300700001)(8676002)(64756008)(66446008)(66476007)(66556008)(4326008)(5660300002)(2906002)(316002)(8936002)(9686003)(7696005)(26005)(186003)(54906003)(71200400001)(110136005)(6506007)(478600001)(86362001)(55016003)(83380400001)(38100700002)(82960400001)(38070700005)(4744005)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1p0WkJ4dlhPRE1OOVp1L25jM1ZUSG1kWVdvTWtZOVdEN01sSVg5UTlxUmVX?=
 =?utf-8?B?ZzFLMjFNN1F6SHBSYTlXd2hWKzNwdlBLUThUWCs5aFhGTFZCN1ZQejQ5R09V?=
 =?utf-8?B?b2pSZVA4d3hoZkpGS2M3TzE2WEVlZGU3VU5qN2QrVjFjbzJCcWYzU29US3gz?=
 =?utf-8?B?RWFUVWZmM1VsUDAwM1N6c3Z0aTh2WUsyTVVtd3M2UTZqTldLNTFDakpyK0J6?=
 =?utf-8?B?K2MxYzRmeHdXL0xiRUJhblNxUlVZcDlXYTk4Lys2YlQ1MWNIOUlMdGw3Q1dC?=
 =?utf-8?B?c2kvNXZvV2dOSFBielRaYkFXQkQ3Ynl5QnB6czMxR3FGNnBLdTI2UmlORW84?=
 =?utf-8?B?ZXdrcmxBTldRWXdZVVVWSExvYjFkSWVhOTdqSGE4ZEkrYXFsblYvZ2VYdisw?=
 =?utf-8?B?My9zTlFKZ2pQV3J0ckZCSjRQbHJ3ZjVpRUwyNVdpUGFuQjdya3FDd1V3MjZ5?=
 =?utf-8?B?TExYWDZEeU9wN1FxUnN4bTZCN2FNMXNJalBadkxOamdtU2IvNkNPUjJPdGtW?=
 =?utf-8?B?N3ZaMUd5R3l3bGVMaitxK0NuMXplMkkrSWJKV0RuRHliMit6U3dMZ0NNV0Vj?=
 =?utf-8?B?dnZ4c0tIRFA3UjBLeWI1RGZUT3pzcVRueE1pcWNLcUMrUUJKalVhS2NEeUNW?=
 =?utf-8?B?K3VQaENoOENBd2JhSG1PTmdaYnlXNHFkN1ZMYTVsd01SR01IVnBQYzQ5WHFD?=
 =?utf-8?B?WTRKSWZCcGV4NVh1M1YxNWRTRndsOWlDcElVZld6UG81SG9WMUNPMlpYdjBq?=
 =?utf-8?B?aFJ4Ry8rZW5hTVJBd3lJZklFbjhIc3lKZU1WeGJEN255ZW1ZbCtXWUxlaGRa?=
 =?utf-8?B?N0xxNmNoUGFDaXNKQk14L1lzei9MYVZEZlBISlRiQzJOQkRsVzYxZ0x6MXFl?=
 =?utf-8?B?d1lFVllQeEZjYzlhbElRSXdJamxqaTZ1V08zUEJIdytVK2FvUEk0RTUxR29H?=
 =?utf-8?B?Y0xLY2VSOGV2RVpldlkvbzNjM2l1Z3dIajFHcTY4dVpOekNhdkZ5aWN2eS9y?=
 =?utf-8?B?VjZCRVJvcmtlUDZRNWpBQS9Obm03T1JWTk5pbTlpK3BKQXZJdUgrWHZ2TDJu?=
 =?utf-8?B?OGM5QVFuOWx0dHRHT0ozNld0dVQ4OGNYOWRnZEI3MDNsRm1JRXZJRm1WUnVJ?=
 =?utf-8?B?amRpVFEzQWFaZk1ydDdma2ZMaW85UnhvTFo0dGE3ZFIzdlc0K2FYOURPRzZu?=
 =?utf-8?B?d041b1hCNXFWZjJzN2tnQTVBWVpsaXhoS3ZDVFJFOG0zRUkzK0l3MHZtZU1G?=
 =?utf-8?B?NDJ4T041Y3ZGenRqSG1ZVzhMNlRRNTYvMW5PYUtsTkE5cittUXlBeTdWL1RY?=
 =?utf-8?B?dzRoSkVQeHZKL1FNc1BVRkpTNUZlbitwS2xSQjJiN1E0ODFpbmsvUldHanVG?=
 =?utf-8?B?eEh4Uzdvdm95ZGNCREZZdzVnTm4xM0pVcm95ZFNQakcyNDRkaDNLbEswY3VS?=
 =?utf-8?B?NUhMNjF0Q1FNWmJpbnVaYnA3K091Q3MvbEdSVEZkUFEzdGIzVVNKQ2g0QnQ1?=
 =?utf-8?B?VHozYW1sUUEvU3c1b3BkM2FYYTY5THR4SDVsYUt0TmhEYm1EMHREUG45SGQw?=
 =?utf-8?B?M3VpcDByY2RFYVVPZEllNWl0T09tTGxZUXBJSW9HYkUwNVFOUUtKTk9iUXJ6?=
 =?utf-8?B?bHl0YmMxUzVDeEE2eldya0JrVnFCeFJCK3FFZGh6NlEreG0vZE1La081MWNZ?=
 =?utf-8?B?ZjBrRlBZdFVYYkNGNXlhSEpMbHJSZi9DSlQ2VWxqQXN3b0tGaHZRMnpmVkQ4?=
 =?utf-8?B?UnkxU2lIOG5sVThsM1FJVHNkeGNON0FVeWhMdml0NHpTMmN0bVp2N3hxT3NK?=
 =?utf-8?B?NHFNcWIxSUc3bThSV0xVQzhrMmlORk00NlJ2RnQxL3oyRU9OOFNMVzFjYXJT?=
 =?utf-8?B?dkpweXR4YnBVekpxSGZUVk4wY1pHanhjc2Q0WTFXQ0s1ZlVheWxIeWNLS1hu?=
 =?utf-8?B?c2phYW1hRXBrdWpWblB4SFltSWFLTmxmUHQ0NWhrRmRWajRQZ1F4UTAyN0NJ?=
 =?utf-8?B?YTFicW9uSlB0N3lzOHB6aFhwVFQ2VnFDd3h5NkNZUWNZWFZGZGU1QitSSnF4?=
 =?utf-8?B?WnpBQWVmdW9MU1JiZVRvOUhLSEtGcGd5WkhYTE9pQ0RlRnFYYzgxN2NFbFpl?=
 =?utf-8?Q?jSeESoUUNFcGNiXD8lei71Uth?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb155d6-8e23-4e3e-e654-08dadd99b681
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 06:09:08.7422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZD9Ak2QUjhJMx3zXvb0cHHUGcDJ2BpneUlud8PhVaN+2mmCJX/gv7A4SiSdYQpOXBr7bPj2lFex1uVtmiunIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIERlY2VtYmVyIDE0LCAyMDIyIDEyOjMxIEFNDQo+IA0KPiBBZGQgc3VwcG9ydCBm
b3IgZW5hYmxpbmcgZ3Vlc3QgQnVzIExvY2sgRGV0ZWN0aW9uIG9uIEludGVsIHN5c3RlbXMuDQo+
IFN1Y2ggZGV0ZWN0aW9uIHdvcmtzIGJ5IHRyaWdnZXJpbmcgYSB2bWV4aXQsIHdoaWNoIG91Z2h0
IHRvIGJlIGVub3VnaA0KPiBvZiBhIHBhdXNlIHRvIHByZXZlbnQgYSBndWVzdCBmcm9tIGFidXNp
bmcgb2YgdGhlIEJ1cyBMb2NrLg0KPiANCj4gQWRkIGFuIGV4dHJhIFhlbiBwZXJmIGNvdW50ZXIg
dG8gdHJhY2sgdGhlIG51bWJlciBvZiBCdXMgTG9ja3MgZGV0ZWN0ZWQuDQo+IFRoaXMgaXMgZG9u
ZSBiZWNhdXNlIEJ1cyBMb2NrcyBjYW4gYWxzbyBiZSByZXBvcnRlZCBieSBzZXR0aW5nIHRoZSBi
aXQNCj4gMjYgaW4gdGhlIGV4aXQgcmVhc29uIGZpZWxkLCBzbyBhbHNvIGFjY291bnQgZm9yIHRo
b3NlLg0KPiANCj4gTm90ZSBFWElUX1JFQVNPTl9CVVNfTE9DSyBWTUV4aXRzIHdpbGwgYWx3YXlz
IGhhdmUgYml0IDI2IHNldCBpbg0KPiBleGl0X3JlYXNvbiwgYW5kIGhlbmNlIHRoZSBwZXJmb3Jt
YW5jZSBjb3VudGVyIGRvZXNuJ3QgbmVlZCB0byBiZQ0KPiBpbmNyZWFzZWQgZm9yIEVYSVRfUkVB
U09OX0JVU19MT0NLIGhhbmRsaW5nLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0K


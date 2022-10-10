Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D85FA897
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419387.664143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi23S-0008Mx-3B; Mon, 10 Oct 2022 23:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419387.664143; Mon, 10 Oct 2022 23:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi23S-0008JY-0M; Mon, 10 Oct 2022 23:19:26 +0000
Received: by outflank-mailman (input) for mailman id 419387;
 Mon, 10 Oct 2022 23:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lBe=2L=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1oi23Q-0008JS-7v
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 23:19:24 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7350fea-48f1-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 01:19:21 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 16:19:18 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 16:19:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 16:19:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 16:19:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 16:19:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 16:19:16 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5484.namprd11.prod.outlook.com (2603:10b6:408:105::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 10 Oct
 2022 23:19:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b2db:19f5:f440:f6a2]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b2db:19f5:f440:f6a2%8]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 23:19:14 +0000
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
X-Inumbo-ID: f7350fea-48f1-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665443961; x=1696979961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/nJSzPrbw8ZQgYvNNmNknEKOMk9hCAwrRnSkpx/282U=;
  b=Lbr1kmdXzlgNDyEtb2e+E2o7gtk1m4aiACbzjhTQeZaatD8mWP85Lm2C
   eeEDooHELcoYKwhRFH6VX8s0c/ZP3ibB3DnWQ1SQa128O2ARg1blzzrmL
   HlvjAyFf5c9ed0Td833dDgytOBz94UiRdtvADq7ae8KU9g1VbnZub0xnp
   5zSA/mqDPhARdw1SFKvsjgdSZEobcpOqMjzLTkVTaXyHBBpAWNvQ241EL
   iB/N53Zh7UAF6UxkxUnD3be+VweDQHrqzXbMp0Qf42D3XBu/bPCDB3dG2
   WNtDxUQ7Za4WDNb4W7yU4+OAtLq8Xzgvt8d1blTRm8PWTgXYfOkCGfd7t
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="390666118"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="390666118"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="657120626"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="657120626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3DdD/ZHS7WVy9Rp/XB4X90lae9Jj3Nd26DfjsO/UXpcFxOMGBWjdFv03tg7umAmhcgNfN/p93F1QLlOwMIGpQE4f2j/dM84NGZSCmecUzZsxrceHYZJBhwBj1uzCpAkfz8FpHkQHslx/i0Hrh2AZhPSJI8LNeAFZIoiHgyqllYr47N9oNeZvLkQTcZG7PojQBzBZKauyIK9o00tBq3stqggYLfDBb+ypcnbmfIPSPbo9CZzquEgGbV0vhqiviK6WMYxdD6uB4tUCrOOyS2VqRijIvFgBjRinf1wQQhlfHmnexYPvQajZjYIZ63q+T/Jjqu55lDnzcjjbPWQBvfk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nJSzPrbw8ZQgYvNNmNknEKOMk9hCAwrRnSkpx/282U=;
 b=CqXGmRn5eM78anz5GJ0iu2T1Q8HDEBDI58L/DnTaUXEPic+Ir7yyVsZ+Sb00UYgzBoyG80rvliNVbOCH789u2cRG3jLWfjgGcao3pLHehM/hPLQDTB3u/fV4wDFqGbDKTC5aXk3E0qN3RDj29t2vZ87g59K3/ZOMTE/zUaIlmXLLrcJqqxB1aimAUBlOl6IqFedfZR8qxxTkOm2SxjH/zRy8sAAPKux1zPxNa7zg+lAb27V16ljv2Uclar24W0W6G8ZKDILgvOarMStJAWFmYMLGHrQbTMZGKts9OIR0OaCO4ueOXn0lnF0RyxGVrxcvIkUtvRz+ietCHj/1TxrpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: RE: [PATCH][4.17?] VMX: correct error handling in vmx_create_vmcs()
Thread-Topic: [PATCH][4.17?] VMX: correct error handling in vmx_create_vmcs()
Thread-Index: AQHY3JKipcgRyk6QSEu91qZECWaYba4IRCqQ
Date: Mon, 10 Oct 2022 23:19:14 +0000
Message-ID: <BN9PR11MB5276393EFC9F9DB8CF9400828C209@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4c1cc983-6c16-4efc-9686-1e7a79c3122f@suse.com>
In-Reply-To: <4c1cc983-6c16-4efc-9686-1e7a79c3122f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|BN9PR11MB5484:EE_
x-ms-office365-filtering-correlation-id: 6a2ef2dc-39d9-40cb-e8f2-08daab15d8e4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lga4s6INqmomm+c9qIvQ3JJU0StlImZydq+lbh9arc064v7wZx3tb6Po0Q6s2J/EyYEaqYxcBZOfHd3Cr2wZ7dDhkBUNddjBFAuLMJTYI27UoHhGZiC1wBqlVL/gdwBZAddotbPvi+V/uGd09f3oNd4DuLKXBrUDLQyADp8pW+T8N12skyxp339/VqK49dca8gjGQAlzF2DbmJ3SkORWKjAqFzHpXQud8xgKu0mpb+yuFLPrznhw9l9xWwai/17HOJF42QO6GOIfsVDEoSidawhj7FSya6vqux7uxD9mrnk+rqyhywXlhYp5FlbxBG5z81+I+mT5epSJd9QJJGDmelceJ/p5oXvYwXDfnntYNxeJ2Y+CVlioO89rPFtpUyKTGqucw/eTUARxRXf4PnDpSCQnIFsgSvwn8hFhntEQ6JiapnUwowjj7JdvJkgZF8S8umXfPaRailp4W9BtzIMUs4GdqW/ZIjB7+3gTPq6ZBWnNNS7GI2V5CJWkkQ2igvwMYT/F2APTYcOX6y/SlqORC+w1TXAY80IwX6dT1aHJlsq0pgLAxdfvBOBHgsIKCiPAmG8/jT756UXwzDbKTxMcIntkkX2XRYAzktZbqsH6B/ydDq67IWo/9C3qXZbzvqVake8TCFFZ9R4dq8TdOUNo455pD+/Vi0CXf1bPl93bKhQY7g3PAJ4fc61pm0cwG/IjV7wSEjdQCGnx/T20H6iQcYNudt8I2mLLPBkw06ffWNuJmrYvQfaYdhejo+zCnj9DoFYp0FnRLFZJemH5NjDqeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(64756008)(316002)(4326008)(8676002)(66476007)(66446008)(76116006)(110136005)(66946007)(478600001)(38100700002)(33656002)(122000001)(82960400001)(26005)(2906002)(9686003)(41300700001)(66556008)(6506007)(71200400001)(7696005)(86362001)(5660300002)(54906003)(38070700005)(52536014)(4744005)(186003)(8936002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNVRzhsQ1E5eENJL3NxbERrb25jNWJFVEg5TU9jR2pvT2d6UzBDSER5Vm5j?=
 =?utf-8?B?OGFMRkl5dms1bUxSR3ZYVjlScmFlbHpwajMvM1V0YXlBM3NRODlEa1JWcFFZ?=
 =?utf-8?B?SGpvQzExQXFnVEtmdTVjNTZTaUtwcHZvWlZBb3Qyb0JUQXowNmRnT1hhWndS?=
 =?utf-8?B?ZWhUK2VBbTU0cmRJN1BQemNnNG5laTRnaHRmazQvajBjZ1BFY1lxQWxHck5E?=
 =?utf-8?B?MlBVbmhmRnZ3Slp6b1VNa0w2Y2doc1FFanpKWjJReDdrUkcwQlJMd0h3TDEy?=
 =?utf-8?B?U29QOFlDeVVLa0JGMVRQQkJFK2FVSWF2US9SOVhHa1BiK1h4dFBNZEdDQ3lv?=
 =?utf-8?B?ajNHVWxJRTFPVG5xUDJUTEJRbXpFUjRnVGZFb2U4bXA4VnN6cU9aUFM5aUVH?=
 =?utf-8?B?M0svNkZ6NjRHeExDQVd3eGNxY0tTSGZzcGw1V09qTU9qNzJxRFUxYng2dHFt?=
 =?utf-8?B?bTdWcnVzOGU1OUJzYVNoSnROWHBlaGZNcVAxRzVKK2daWEVHeHlhYit0dEJX?=
 =?utf-8?B?NU1jcWlpVko2UTdDVlQxeVFWeDRsRWhGanJ5cHhyaXNDOFBBSytSNWtEU3Vm?=
 =?utf-8?B?OCt4U0VJbTVsVC9mdlVmS3I1TGlXT3ZSWXV6SWcwVkRESGNWUU1kbGxMMDR5?=
 =?utf-8?B?d2tYaGNqeDdwNkdxTjUrdTFtbUZmcWhRcDFCdnZZRWFBY2Mzeko5Z1Bod0Mw?=
 =?utf-8?B?dnVkd3J3andRSE83VnJaQXpMUUFSYnFKc3E0dEVHSm5jZHhUT2ZyYXU5ZVRC?=
 =?utf-8?B?bkFMVXJaNFFRaFYxVlcyV0Zhb0dGTFUzZktZejhDYmVDSHdrcFcyR2lXS0t6?=
 =?utf-8?B?djJjanNhSS9iSTJnYVRvVVhGRm81RFA2RVN6Nm5sTjA4VENpYnlicGQ5VGxE?=
 =?utf-8?B?N2U2T3ZFb3Z2UkNJdXpnTWx0VWxzV3hyMk9vOTAyTzluZjRqWUNlRzJLOUN0?=
 =?utf-8?B?b1lzT2gvemUrTm04UG5FQ2tVbmEzK3RVU1dhSmticDdpcE1UN005bThaSjA1?=
 =?utf-8?B?UnN5dm0xRHY4YVBGTnF4aVlvbmF4TWdDY2FoaDArN3RUQlVOYmw4MWllVldV?=
 =?utf-8?B?VEdMOUZqUGlEcjliZTB1SFlxQmlxNGx1UjNDbW1Pemk4UDVBOGJjcGdyVTJF?=
 =?utf-8?B?d1VpOWhzdjV4ZXBDL0RsMXo3ZENYdU0rM2p3WmM3c0JzSTVTKy8wYTFab2M0?=
 =?utf-8?B?VTZIcFNkSGNTZHh0OXJ4bFNoM080MERYVk9hb2J2QmJKdndTYlJkb3ZPd1k2?=
 =?utf-8?B?b0Q1c3pReENHeHoxc0dJZDJTcFhGMHdGK3hxRUxsTk5jdGxTc3JDZFIySUNG?=
 =?utf-8?B?ZzJFa09XeG5ZNGF6bGxPNVpTK1NBTHdMUUJ4QmpnUHYzbG9Xc3VQUGlMSlR3?=
 =?utf-8?B?aGxPWjZzSjlkSjhRQ1dma0Q2bnN2VWxZdGpYeVFjQjJJRHNxT01xdUtYcHdY?=
 =?utf-8?B?Y1VmY285WnRoZmZUV242RXZCRXFYc1crVjZTTUNodkZ4U2E1dVdPLzlHeTNH?=
 =?utf-8?B?VWZrVWRhREh3WXBhMVlkZDl1ZFlEK0ZwWmdPUlExd1hOUWdpWm85VXovandX?=
 =?utf-8?B?V2VZYXdtK09RMktwellQd3VqTTMrSEg5cEhvbm13ekVtZU1oN3c1TS9yZ2No?=
 =?utf-8?B?UjBQSUJ5MWVUK0NtY3d5QVNBQzkwdHJwSGJkMkxPTlNNYTVzK2xHUzRmNGty?=
 =?utf-8?B?cSsxQzJiazc2QWkrbUI1bVF1cWlYR0dDV0pwWkl2T2QxQVIxQUhqb042NFFa?=
 =?utf-8?B?WTI5bG9sSSt6Y0VVekZoaEQ5eU1rdXVTNWVYRThiSTZCcXV0N3RhL256S0Rt?=
 =?utf-8?B?WFZnSjJoQnk3REVNQm1kOGxDODlMa053R3dueHBHZ3VqQ1VvWGMvN0RnWHB6?=
 =?utf-8?B?dHFsVS9iOFh1N0F2WHhHUk1XSkhUUkZnZTBDVWdPYzEwQUJRTENNajVxZ056?=
 =?utf-8?B?N0FQWE92TnRySVl6S2hEK1BJOW1OcFlWeWJrcEYwZkM2c3ljWGZ6a3J2N3RH?=
 =?utf-8?B?TXV4azNIVXBGWWlmWjhuQ0Q4OXdLYXduNGgvMkhQZm9qYWRCdzhCNjlPYldt?=
 =?utf-8?B?cnFDRjU4OXFTK3BTWWpSdFRWMEJFME11a3VrYjBnZkNkVjVTRFh4ODdhUnZv?=
 =?utf-8?Q?RB5AuHTqqOURL4E+d92FS8IJV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2ef2dc-39d9-40cb-e8f2-08daab15d8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 23:19:14.7265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMAsrQwwtkXyqGeFlOy2UICcqipE95X5/SjzaNovHkJIgghSlsCA0QvQX+oE5iwODatlYGAeE55faDrdZ/YPUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5484
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
T2N0b2JlciAxMCwgMjAyMiA2OjI1IFBNDQo+IA0KPiBXaXRoIHRoZSBhZGRpdGlvbiBvZiB2bXhf
YWRkX21zcigpIGNhbGxzIHRvIGNvbnN0cnVjdF92bWNzKCkgdGhlcmUgYXJlDQo+IG5vdyBjYXNl
cyB3aGVyZSBzaW1wbHkgZnJlZWluZyB0aGUgVk1DUyBpc24ndCBlbm91Z2g6IFRoZSBNU1IgYml0
bWFwDQo+IHBhZ2UgYXMgd2VsbCBhcyBvbmUgb2YgdGhlIE1TUiBhcmVhIG9uZXMgKGlmIGl0J3Mg
dGhlIDJuZCB2bXhfYWRkX21zcigpDQo+IHdoaWNoIGZhaWxzKSBtYXkgYWxzbyBuZWVkIGZyZWVp
bmcuIFN3aXRjaCB0byB1c2luZyB2bXhfZGVzdHJveV92bWNzKCkNCj4gaW5zdGVhZC4NCj4gDQo+
IEZpeGVzOiAzYmQzNjk1MmRhYjYgKCJ4ODYvc3BlYy1jdHJsOiBJbnRyb2R1Y2UgYW4gb3B0aW9u
IHRvIGNvbnRyb2wNCj4gTDFEX0ZMVVNIIGZvciBIVk0gSEFQIGd1ZXN0cyIpDQo+IEZpeGVzOiA1
M2E1NzBiMjg1NjkgKCJ4ODYvc3BlYy1jdHJsOiBTdXBwb3J0IElCUEItb24tZW50cnkiKQ0KPiBS
ZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=


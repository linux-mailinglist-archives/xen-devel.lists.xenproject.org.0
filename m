Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A4711F07
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 06:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539953.841318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PUb-0001ta-V5; Fri, 26 May 2023 04:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539953.841318; Fri, 26 May 2023 04:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PUb-0001qh-Rl; Fri, 26 May 2023 04:55:57 +0000
Received: by outflank-mailman (input) for mailman id 539953;
 Fri, 26 May 2023 04:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+8a=BP=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1q2PUa-0001qT-My
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 04:55:56 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97532b78-fb81-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 06:55:55 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:55:51 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 21:55:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:55:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:55:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:55:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:55:49 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 04:55:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00%3]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 04:55:45 +0000
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
X-Inumbo-ID: 97532b78-fb81-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685076955; x=1716612955;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m4iWD8+lw6JC2tVzQzm57VIb3ADGgqs1WLVgT7YIrqU=;
  b=E26m4uMn0E0/AHS2HIreZVlWCMjJL13uj9lfJnPVIlYt9suo3QSb4Ob1
   LGoiU3Qhn2+2jBtAYve3kgRHCxnf0WUt9lQBTI2oooaEHqhsgwy8U0NcQ
   QNqiwiKy+GvO+De2XuGoZk62GJIDjrgv059pe870x7YVj9/UPU0xRqrTA
   d1qfODjAupIRx4O4yEXFpZLRtyJr521DiGH+IHMASoU0tAaYuRonILJm6
   ftCaESd1IY7lpFLoQd4U5pDUtdlDJsLvUXKxpnQcyN37k3X65nECemRZg
   VGS+S5NAY7B+cxXJiRf13shFdHMsHHrCbwlfikyUBMDcbu+97gzvhgZes
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356499328"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356499328"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682598561"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="682598561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VULHrfWVbod17586tKbpX0pPZGv8YGY5nJF+anGLq2WepqeNUNjrLdMufd0p15u20Vz9QEsIZ7wgXj5r4x229hX76xZ4GuAikXki1rHadQIOJSJLfX4FE7dXTPlmSOHVbwqBXoKfswoyoTmNBXEFLfC6fNPGveUeBUVV+L2BCs0FZVynbsJaVeP6ksR+YK5YNK5cuUW/5Bb4cv54KK8uziggg37bQO3NMcOUYYuvw39VJxCPz2/XxKgp8c538+dMFtWYp+rHBQipGs69Zf15fs2Y+5THNL+fqn+0GI2Ew65XpvfOGq245OaF1m7+HQKg2BQLeB4W3CZJqULsIaygcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4iWD8+lw6JC2tVzQzm57VIb3ADGgqs1WLVgT7YIrqU=;
 b=BYZXTt6RNa3hoJmOYHa0p2rx+AL1D7TqONrTTqs+L/QJmf5TXdQDQ4RTd3Z32LPizOBhJdvceaWiS5YrmqelW+Gm0PgDLZpQBB7SdG7mNwUvUrWrGY8vYJLzHgxojpDxPcjxCaAk5K77SwryQduQnDxDzx+xEHuJUWXecyUsGpL9YrM2igCBb9lQ5GQzN6DlnASQiRPZuvBsqz3Ch77L3PW2TF22m9+Vk9JQ3Ly8CM7oCA19WSYRM4ojT2kbHcgLMHPxKSkPnTMkyVEYMw4lGC3k+kii8j+ci8ZiJ8vg8Pn5Uxk661G8O3DEOSE6GoQ9Bx8B6mTxY2Mh9ECrUE+45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH] x86: Use printk_once() instead of opencoding it
Thread-Topic: [PATCH] x86: Use printk_once() instead of opencoding it
Thread-Index: AQHZg3Zrj6JMEuxy80yDuy8o0bJaj69sFa4g
Date: Fri, 26 May 2023 04:55:45 +0000
Message-ID: <BN9PR11MB527686FE7AD93C1A4B1991168C479@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230510193357.12278-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230510193357.12278-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: db799f96-ab1a-4654-35a8-08db5da57772
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdNZ2ceY/Bm3OeoqiwMjqYSs1+jV4Qp/LIW7I9SsWVv+cocOfdIBYrjdD1MakC06msit05Wy9XLaU+u3u3iU0sBZ+Y+Xcqeq07R3KGe61zzdoYMhQGHj+A8GzJAPL5NQ4lUVIkOfj1B1mypypUuZCQ/7cnWpA7/acoycNwgoC0pD3HT9vKTtKt0UiAFmj958JwjcT8lMgYfxZrdYeuF3oWG1yZ60trDjO5d2RsajhUh5kFH+UQmzsPIfg5cFI7Ti8xn54o6pOAb9JT3fiWMQYYX/XFBhNt+3VQ399KW4qlbIQtpEcwG9uuimUbv4tDhtu2iRNo2Oe5/kFAW3+Z/oMgoOq4rukvI8J4pIf32HSeRf9Mh8dMHjonvtoYA4rXaDTqeYeXvcLW1QBNlXkZp6MnpehorZmurj03lkBehnAYjkxt3P4OFhv5rteCQBfQ+QwCpBkp9jd3dOFcjLPBk+EFruNhzkOF4El3HZIw/ZjgNexXpWEQhATEz7R16EFBzfQaEG2CiGTk7JTNV4MvaubpV5FBT5O9klVUn/L0nFYCsgP4/APAEYG9TA2cVvC13hILjwieA66QMp/3YH0ozcTVpUEdmXFJoddykRY5XKOqnizxOJDVZJzw2tV2csFBWr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(122000001)(316002)(71200400001)(52536014)(26005)(9686003)(76116006)(6506007)(82960400001)(107886003)(66476007)(66446008)(64756008)(66946007)(66556008)(4326008)(38100700002)(5660300002)(55016003)(33656002)(41300700001)(7696005)(8676002)(8936002)(83380400001)(86362001)(478600001)(54906003)(110136005)(186003)(4744005)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnA5SHJZMG1lN2ZtQnhQWGV4VnJSczhHSUJlVG1Ubkt3b3hpVFU4ZWh3Z3g2?=
 =?utf-8?B?eGZHQ0thK1B6TVZTSmFMQmREc3NNamhpVXRTclZ4MGdpcTlTVHpYZDFjbUR1?=
 =?utf-8?B?QSsybjBuMmprdGtzOFRXZ0oxRXJGQXVobWwwTHp2aTZ3NUlnYkMzeStXSjVi?=
 =?utf-8?B?SWNERGFOTWxrTWFSSUd4ZTVEK0dtM2s0RmlHYlVyR2hVYmFNT2ZNcC9HTmw0?=
 =?utf-8?B?MGxQa0ZnWk5nZ1FHNzU5ZE5mY0kwME12TitrbnhMT09RR2hjWEUyWURCSzI1?=
 =?utf-8?B?U21VeW9yS0NpTTg3VnRoNFpJaHJUTHk5NmdkSHJzbnlLbW5lbXg3VDVyM2FM?=
 =?utf-8?B?WWo3WHF2VVREN25LWVhhNGFLYzBmR2NYS1VTZ1lNT2FTczdINStlL1M0TVZq?=
 =?utf-8?B?SzRvZldDTnRJaFVMN0NjU3dXSFF5MDlHM09RWHA0Q1pRQ3duWEs4TnFuSW9K?=
 =?utf-8?B?QktvV0dVcnM4NEtaTTV6SDl4emV3UHFrQzhTaU5aQm5CUUlYcFE3cnowbGdl?=
 =?utf-8?B?clVKS2ZmVFg1aW5aUXJaeVo5ZE5kK0RVL29UTTVneU9XYVd1NUVjWXBWdzJZ?=
 =?utf-8?B?RGFKTUdCTmNHTGRmQzIxSm04OWZSczRJS2dXbW15YThrOEl3MXBXcHNzTXdj?=
 =?utf-8?B?bGtEYmt0UVBwdU1WcUplb2NYcVh0eXBORlN3aSs3Q2Z2aGsxWmxpWnJVNm5T?=
 =?utf-8?B?bTBoQXZjRi9SY2ViRTBUK0RaZUQ4R05ldEJMZEZjeGI0aHlWdTlEV09KZVdy?=
 =?utf-8?B?cFhMUXRTVUE4OWFlbDdsd2tMdFI5QmhSekFodWdsenBUK2g5MEZ0NVdyUFQ3?=
 =?utf-8?B?VXV1WUc2TXlmU2lCVWd5Y2pJUnZuK1c0eW1ERDlka1NaWWQyalUzSFUzZ3lE?=
 =?utf-8?B?a2k2VWtVb2ZRVzNrNEI0eTFWcGlGVFlteWNYbklJVlFMT3crZUxEcDNrcXVW?=
 =?utf-8?B?TzEyWlkzOFg1WEtOcWpoM3g3V0xuNWZ6QlFlcFNPTFVxT3RhT0xKL3lNQUZP?=
 =?utf-8?B?bDdPSXlZMmpiQVo5UWhqVkRDaDUwTnQ3Y2FQaDhXajhUckJkK25sVjY1Y2dR?=
 =?utf-8?B?UXF5TExOQ2xMaEs5QmlxWXUwOEF4M0ZMS05ObzZBTXlHREtZY3pwUUNjR3NS?=
 =?utf-8?B?TGcwbUZYQjJJOWNhaXpUb2diWktjNW02eG40cUt2QnJPMEJ5THpXWXhFNVky?=
 =?utf-8?B?S29vSFJEMDdmNTB6NWppQXJEYWc3cmxNcmxaWXNrU2VMalZZMWI2MFZjNlpl?=
 =?utf-8?B?NVppM1NqYXNydzFoaklvRTVjSTZ2M2NaTCtRcVdHRXNFMmxSaXMvRjRwWmFH?=
 =?utf-8?B?ZGlzcmFLSE9jNjc0RExQRnA3akt6dldkSTYzam1TSUtGUGh3cHYzS3cyTjJ4?=
 =?utf-8?B?YVJvWExTeldkRlBpYzQ1ZkJSY1ZFTHY3cnBCNEZoUytBdHJxL2ZueTc3Rmtp?=
 =?utf-8?B?bStvaStqSXM1VW1qbFZiaVFtaVYrek5NTjFMdHovcVlMMWVib2NLc2hHbnFD?=
 =?utf-8?B?OFlSQ2V5aXloZFZxTDNtRkY3aU9icVZtWWFTY1dUWXBvejNDNWpyVkxEcnlB?=
 =?utf-8?B?KzBkNlVFUkNSVHQ4MnY1NXFLTy9hck9lSjhrL1cxZG9Gc0ZlNWtObUowTFpy?=
 =?utf-8?B?NTNmTzVoOUNPbzM0ZFNDVkcvOVp4MWhSOTZ0c2djTkRBSXd1Q1lJb1QxM1hY?=
 =?utf-8?B?d0M1cnRXbnFpNHBpcHlOS2JxOG9GMmVxd1JaUS9Za2VsRE42Ymo5aWFCWFo4?=
 =?utf-8?B?K1loc0JaYnpPcGxVeFNVSXhjUFJvY1NJUW5MeDdXelYrclhhS0lkZmhEdXFL?=
 =?utf-8?B?aEt5aURXeDVxRVJvSGVuNEtsSWRIUm1ud1VEcHQ3WUpwT1Fhdll0dXU5MzZP?=
 =?utf-8?B?M0RMQTd4ejRGR3JxdEtER3pxcXBKVE1ydStxSzAxdk12QTlKMWc2RWhUeHA1?=
 =?utf-8?B?TitTVGpPUjFMKzdUY1dIcjE0ekh5cVJWWGhHcVE1d1luc1lXT2Vtc0lBSkw4?=
 =?utf-8?B?NEJUOFk5eno3WEoxTlNOUWg5Skc2VnFMWWF2L2RXVFlYYmQvOE5HcytYbEMz?=
 =?utf-8?B?cmQreVBOeERYY1o5SHdPM09lb1hkcE9lR3RyZ1JnT0NNbWh0MVpYY25CMmNk?=
 =?utf-8?Q?yWxuu5dtja8uYSn7ombhkESwn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db799f96-ab1a-4654-35a8-08db5da57772
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 04:55:45.7425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhc/0F0eRNiREZeNZGcmnUu2+RbvazXgl22tt6HMOTHyMkv4uLV45KZERu0JSgYK/7bs7TNiXsE96V8x+dgrRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgTWF5IDExLCAyMDIzIDM6MzQgQU0NCj4gDQo+IFRlY2huaWNhbGx5IG91ciBo
ZWxwZXIgcG9zdC1kYXRlcyBhbGwgb2YgdGhlc2UgZXhhbXBsZXMsIGJ1dCBpdCdzIGdvb2QgY2xl
YW51cA0KPiBuZXZlcnRoZWxlc3MuICBOb25lIG9mIHRoZXNlIGV4YW1wbGVzIHNob3VsZCBiZSB1
c2luZyBmdWxseSBsb2NrZWQNCj4gdGVzdF9hbmRfc2V0X2Jvb2woKSBpbiB0aGUgZmlyc3QgcGxh
Y2UuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCA4D79E0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 05:25:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289891.491570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcH6-0007E6-7K; Mon, 14 Mar 2022 04:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289891.491570; Mon, 14 Mar 2022 04:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTcH6-0007BS-4C; Mon, 14 Mar 2022 04:25:40 +0000
Received: by outflank-mailman (input) for mailman id 289891;
 Mon, 14 Mar 2022 04:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTcH4-0007B6-9M
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 04:25:38 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cab8cb58-a34e-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 05:25:36 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 21:25:28 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2022 21:25:27 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 21:25:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 21:25:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 21:25:27 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 04:25:24 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 04:25:24 +0000
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
X-Inumbo-ID: cab8cb58-a34e-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647231936; x=1678767936;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YK9ghu5VnXGGMB1HbKe/q46aWNwKy4qjP3wtzR5zOVI=;
  b=Fhz7yQzacy9V5MddGBvrKD+bjh1BF9hpYjuYKO40J4kLlsYw2QIVwvh7
   6orhzvsaNe4QWFByxhcg84V/Y665ji16pxySZ2oo8MCklZ7PPvmhjzo6h
   TQjc+G9NqB1adcYwNIGthlQr4reWHuE2iIYDt4JNI1Pu7pQTgC0BvHhCe
   hod4PQHkGwfQm/cCdbyQyigEwr3X7Py0LqmzwAVYJ8PHiNpQUVzTCy4iI
   6pP96do1whRH7HfOxplOFiisG5ATm/TnMRfRQvP1X0Hyfc1YsQW4Uk/bh
   tx6SyYbd+QGRhWXU7pNYV3SExQpHkjT5HPnzD0US7fP5Lr8RxTPQQokTQ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="255883565"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="255883565"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="634052406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB3Fu+3kAF3Uq+ONwRgN5kGHZ1A/js8NJUAbGMjr5iF3GviBXnnhH4ugYuEAOLHeNCQ0WzoBnL2LLNBhA6DwP0txmdIF3DmWxNnZPFn+AzEHDac4hVgJEXjyoA1wmzrNJFi0z4VR1E50jmtUHiPJo2C+6OQ4Hiwrllc3eqrR6nBer1wcEsUsvw47FjnrZVx39O392veqnqe8PCiJdj+nPulvtDvqKE8oQ4Yhtbbc/OhOrG1J62Upd2MBfpLD6IvBuJLzU45STs5TVzKGFK341YrlH4rUXM+wGZXKPQBuQAUdTPV/IVMQdVW2PC6RgYKhfSiYafPZ0df3Tyxt9sSLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK9ghu5VnXGGMB1HbKe/q46aWNwKy4qjP3wtzR5zOVI=;
 b=WjgaixnIxa+du4BAqG/NIHTWWkNFZLMdJwP6PV+RgqrGqbMOFHaXhVcCHAJy388NGWumleE1UVHKvA+qnmoOcXaIMnD1NMQwIq86O02xsVgt6r7xjXBfouWbrCP9mgWKz+9R4wbt9OXseSw4YwUtT2Itg9KNnPELr6wKFvDiIAVbzqi2JUFuyFE33lZoe7KL/6d1C9tSrjfcByQQviEN6ihUdEGQ7ZYRzW+HwdXI4IcR5wK4unxE5ZzC0g5Kv0HCQIy+EcsUk1+Gdh1P1+UgGQA/17Nf/4gjD15x8pUsmTSjjTx8FfUnoHv30vsfWAozCQkWYdDPqMUeNOVwP4/ZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 4.16] VT-d: drop undue address-of from
 check_cleanup_domid_map()
Thread-Topic: [PATCH 4.16] VT-d: drop undue address-of from
 check_cleanup_domid_map()
Thread-Index: AQHYMwD+JbApDZ2z+USosO8XsFJIAqy+UOtg
Date: Mon, 14 Mar 2022 04:25:24 +0000
Message-ID: <BN9PR11MB52761EFD184DBE00B53C27328C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <c71ac406-15a9-6291-d670-0f965a59bebf@suse.com>
In-Reply-To: <c71ac406-15a9-6291-d670-0f965a59bebf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0a6e194-ba9f-4de9-7a0e-08da0572a8ba
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB52933E92BC9221DC3530DC458C0F9@DM4PR11MB5293.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V3ejUBj6MEGee1NuzS2dT67zqdyvs4FCmFX0eETVL7xePwXgj2pUIam3LtXYqnFonrMS/0WVj4wdRwuGWJflR80YUyqXIaNbcQWjsj6c5R2ZkTqRgNmw2CimRtoup/Chf6TibCFcbiFh63XPqyYqM2ff/yiUaWhifvnvD1HqsctjR3+KXcuRW9J4gSoGmNufiLqgtzPxc3navv3+larLvIuxyyhoC+jA6faIW0OjrqP6T9UZ+fAHesFR2pjp7WZKwx6D1sBXP8SwrtHg51EUWD6/Plq/5BlCAVGhM+B6KCTD0BYP67h/3kOsKx6+6+0BWsoxfScHGBZjMaNZEpQDrm3rj0jvDueAAbf7iUR5XG1e5pQNbdiP2Pekbj67dBoA56JvPaAxz0nkirB04CX+I81IxecCTKkuk2+uR83Ux5u4R9WtguDiK+NnRhlm4vnVe52ayFo3WJPO26sUg/N6NEmrKujlFs4nAwQmaXQkvQQ57mXytrbCsAh6MycbSZ+95SyK5Hxxp56O/Ow0glcEGVuPwPwgU4qGOibEOVvfMKT+92DmigHIiXik4N9ZJA9xsWemYRhXl+f0wsqA8NxiMd2KL+jOo5Y28VSNady8luLK6BXWT0dUZOtOzbehMwijfEy3ZbhKuS9AbCPLf1uuHfnov+6nnujgDGLmCszulG7h+nvf0JyvljqETl+qm0IHq0dommoe+sL1ptR9mBIfSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(52536014)(8936002)(38100700002)(66446008)(66476007)(66556008)(66946007)(76116006)(508600001)(4744005)(7696005)(6506007)(26005)(5660300002)(33656002)(82960400001)(186003)(9686003)(122000001)(110136005)(71200400001)(2906002)(316002)(8676002)(4326008)(38070700005)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?by9SOXoxNVp6T3BDQlk4MTZlZkJqVDhXSVpzT2FJZlcydkxWSEVXOFFZYlNY?=
 =?utf-8?B?S2c5eDFJcjZuTXRrSWthMHM1L1Zsd1k4V2JWYmRVYm9SUlp2WGx3RTlEQTJC?=
 =?utf-8?B?aEVlMExKd01OdW91N2VCdHFwQkQ0bUhJa09BTDFzWHh0ak11VHNkM21WSFNk?=
 =?utf-8?B?dUVZU1ZQdzgzT0swYnlOK05NQW95WEhSRHZzbzNvSXkwdEdKR0tBQzZRbkhQ?=
 =?utf-8?B?RkptcHVxYUZEUDhxRi9ycDhHc1htQk5XQ0ZFbFdRcTRwMnRieUtoSFJTTWF6?=
 =?utf-8?B?U0p2NUVBbzhsc0lmUGZBbmVkTjlrRnkvclJEa2tUVUdWUDcwcGZIQ0lSem5t?=
 =?utf-8?B?dWhkMnVUSXZyMGJ5cW9Ed2lKMWk3STVSelhIUGc0RW5MZWd5VlpjeXFkNWg4?=
 =?utf-8?B?Lzd6UVFXTVlWYWRwbUdlWU1uVTYzUmRYRzJHWkFSdSswVkYvN1NwSjVUR1lD?=
 =?utf-8?B?TjFPMHBqazd5dWo1NTcwVEpiVXJPNis1N2YyVjhzL0R2MnFSR0VIa3NDeDB2?=
 =?utf-8?B?Z2NQUklKNWlNNDBYV1AyQWRzYVkrZFMyRnZLdTNSVXNjYTVrRVA3M24vYmZZ?=
 =?utf-8?B?SWlxZFA4bjFSTUZzUk1iY2JDdkVSWS92Tit4enlHVzcvVFJwT3JwQW1nbHd4?=
 =?utf-8?B?eVIwWG5vai9nUm04UmdUaXpFNjhkZGZQb3BSd0dPbVAwM1phcjJYVW5ta2hT?=
 =?utf-8?B?WUxTQ0h5ZkxjVlBrbFoyZTFyS1RxbU0vd0FjcHgxcUFOeVIxZDZZR2diVFA4?=
 =?utf-8?B?ZnN5dGgrSVUyajFUbjlNd0dwUTYwWXBCTlh5TlFjNllpTURZdTl1MVlUQlJR?=
 =?utf-8?B?ZDAyMEFpZUd1c0h6WUpUL1NBOXNONTlvL0RrM3RNVkhEbmFmSm5aM21MdjZW?=
 =?utf-8?B?alJ1K2NGQXk5cEtWbVd5cEh0aEErQVc0Wkg2MWphNzVjSEFYSnhwMm5lbzR5?=
 =?utf-8?B?VHljcWs1blZMVDBNaTFaWGJWTTlVR3luNWg5enVXTGFoK2YyQzR6ZGlGOGRR?=
 =?utf-8?B?L05jY3NGOWUyVWZ2NUZVL05GSzhqK0p0ZlJiUWpYQjc3aHo1ZWdoUTNLRGdK?=
 =?utf-8?B?QjQ3SzJ4NkhVRi9qWVA5SkNONjd4cU0zSFJiTGZmSjYvOTI1b2VsaWdVY0N1?=
 =?utf-8?B?Rnl5SzJkaTVEWE9SRWNRWXRBeHAxSTVucXhtSVRjeHM2UjhZb0EycS9CU2JL?=
 =?utf-8?B?N2tweTk0K09uTGI3dldHbnc4MmxRTnRoUlBISlJGZWxkcVRqR3paUXJ4M1Qv?=
 =?utf-8?B?R2VteUZycVBYTndCSlBmaS9RWWhKMTVldnBzU3lhNWlKUFZTNSs4OGRzakZ4?=
 =?utf-8?B?UDRqRTFCQTdyV0IvZXBUenFPeHpGK25QSGtFS3NNanRuR2VDR1Uzb1VaSUJx?=
 =?utf-8?B?cjBkalZaOFhUYVVOMVhvRkw5eDhPYnR1bUs5eWgxNVlFTURmT2R1a1p1d1ly?=
 =?utf-8?B?eTlXS1NWeFFxNkdGUmZCZEVqd1JDNHhPUENBdTdYZnl1cTAvZ0tqME9uTUpJ?=
 =?utf-8?B?UWdsYU93SCs5bFNucTh0TVBlRVVFL2RHVEFFWi9kdGNXRFdWZlVKMEhQVExn?=
 =?utf-8?B?ZkVPckw2TzFxK1hjQTZoQTdiWDdVYzJwd0FsWFpoZzBKQXlpd2xpdmgrd3Jn?=
 =?utf-8?B?M0lrVkFCRGJqRkpXd3hIUjFmckNyaWtnTTZrajV0QWlkZ0piV2Z0MUhlcExL?=
 =?utf-8?B?bFpub3liT3RsbnlidXNBdE9ZTFNNb0lMT3d4Tlg4cHJRUS96Q0lMSWhRT3Fy?=
 =?utf-8?B?QjBvZlpjSGdtYXVyWFRNSkJrMGlUWm45dW9pakllVHBoUE1yaS9NU1p6TVpu?=
 =?utf-8?B?ZVNFVjBjdXAvZ281YzQrSFRoY29uV1VzbVRzcDErOW8yRHljMWFId1p1YUEr?=
 =?utf-8?B?QkdFZ0E3THUvQUNRWU5hVVpRRW14T2ZiSWhEQ1VvNmhVcVpFOEUvcjIzTXdR?=
 =?utf-8?Q?fdCrVSPPHQVRd3ku5+aNJMQ0+FMpYict?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a6e194-ba9f-4de9-7a0e-08da0572a8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 04:25:24.0456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqUPK/MLVbg+Sc6uDrn7+o1ljOJyda6JtsYN89t95rBbMPEQbC8TfOe+xj3jCKMdp8LSg8bdsb4yp7pe+OVMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDgsIDIwMjIgMTE6MjcgUE0NCj4gDQo+IEZvciBhbiB1bmtub3duIHJlYXNvbiBJIGFk
ZGVkIGJhY2sgdGhlIG9wZXJhdG9yIHdoaWxlIGJhY2twb3J0aW5nLA0KPiBkZXNwaXRlIDQuMTYg
aGF2aW5nIGMwNmUzZDgxMDMxNCAoIlZULWQ6IHBlci1kb21haW4gSU9NTVUgYml0bWFwIG5lZWRz
DQo+IHRvIGhhdmUgZHluYW1pYyBzaXplIikuIEkgY2FuIG9ubHkgYXNzdW1lIHRoYXQgSSBtaXN0
YWtlbmx5IHRvb2sgdGhlDQo+IDQuMTUgYmFja3BvcnQgYXMgYmFzaXMgYW5kL29yIHJlZmVyZW5j
ZS4NCj4gDQo+IEZpeGVzOiBmYTQ1ZjZiNTU2MGUgKCJWVC1kOiBzcGxpdCBkb21pZCBtYXAgY2xl
YW51cCBjaGVjayBpbnRvIGEgZnVuY3Rpb24iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4g
QEAgLTE5Nyw3ICsxOTcsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19jbGVhbnVwX2RvbWlkX21hcChz
dHJ1DQo+IA0KPiAgICAgIGlmICggIWZvdW5kICkNCj4gICAgICB7DQo+IC0gICAgICAgIGNsZWFy
X2JpdChpb21tdS0+aW5kZXgsICZkb21faW9tbXUoZCktPmFyY2gudnRkLmlvbW11X2JpdG1hcCk7
DQo+ICsgICAgICAgIGNsZWFyX2JpdChpb21tdS0+aW5kZXgsIGRvbV9pb21tdShkKS0+YXJjaC52
dGQuaW9tbXVfYml0bWFwKTsNCj4gICAgICAgICAgY2xlYW51cF9kb21pZF9tYXAoZCwgaW9tbXUp
Ow0KPiAgICAgIH0NCj4gIH0NCg0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF2F3F9305
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 05:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173372.316352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJSmM-0004qs-Di; Fri, 27 Aug 2021 03:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173372.316352; Fri, 27 Aug 2021 03:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJSmM-0004ni-9O; Fri, 27 Aug 2021 03:43:42 +0000
Received: by outflank-mailman (input) for mailman id 173372;
 Fri, 27 Aug 2021 03:43:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1NWc=NS=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mJSmJ-0004nc-N3
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 03:43:39 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5da165a-06e8-11ec-aa88-12813bfff9fa;
 Fri, 27 Aug 2021 03:43:37 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 20:43:36 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2021 20:43:36 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 26 Aug 2021 20:43:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 26 Aug 2021 20:43:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 20:43:35 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 27 Aug
 2021 03:43:34 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%7]) with mapi id 15.20.4457.020; Fri, 27 Aug 2021
 03:43:34 +0000
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
X-Inumbo-ID: f5da165a-06e8-11ec-aa88-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197454654"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="scan'208";a="197454654"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; 
   d="scan'208";a="687305390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtSjf9HYm/czsHQdGjly55DMiBDS/Mub3k4ma1UC8G4JxOhz4of2/VhD1ZcybBgakCJHoxew8OE9S7j7x6TYtFoM5iPdXnZ/b4Gh9fqJddLLL/xpr52Wz4YYCHJmFRCg10zbWz7U49DHObzgC4H2tMP519jDH6VWcKEuWGtQYaScX9vpzlJHSlrurquqBb8yuhQ/LbC1ouyLk3jFjcOXHlrJqhMQHf/4tjahWVVxdFAQZit3xT0cJHvGfkj/JEzHtjz/oX8vV/+Fi/NYpU/iWvTZ2ka0ikG/dwXOdFlnSVAvPIb8aToLNhkQm0S4l2A1Qs4K/DUzD1orMzbLUNf/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWI/QdwE5y2BWGEZA+m3vE+TpcRJXyO2GWgwPbk9AjE=;
 b=JqgI65Z4zvaBAJDt1uroIioqMH9X3u64Fwd1ZnXSEKbpgyETKryuwlJR+pajOQs9Tw5m6Z+JY6OoM6V0axs9841Ctuz7y9DetFPJIg708x2Q+YfCV+GPBoqRDOa9m8eeUul4Jgvdjjx+/QFen1sMHpPrERbIUzqb3Im24u6HMWWWEirivFMc8DG1AHrBOonjnzwpel0VQjC8M3nJ7B/eaao7r1RHlxtweAX60Y8+D3b9AQuzhK5waAYsxr+hzy4ViCnVVADPTA5uSow0PI8g9HDVnVczdhMl/cUlgkmWnBz7QJORAr5e42g7aPmsNzCAYJa3V9KkgL2Ig7gIwOGXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWI/QdwE5y2BWGEZA+m3vE+TpcRJXyO2GWgwPbk9AjE=;
 b=Jjsw7UHcrqsAtvE+1tDujm5okXNVsrEMwKKk1dEMbqhvWhCVnT5AqJMq3nBWLQpyc+UFVUMa2+pc5wih0IEtWkqM6rPJzxdKVPp19aQLQdrOMGuY/l8whv0/jIBElz302GLpeEgy9w7pi6HZDsgnd95PBJ5bb3Mnkf1llvBRxus=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH] VT-d: fix caching mode IOTLB flushing
Thread-Topic: [PATCH] VT-d: fix caching mode IOTLB flushing
Thread-Index: AQHXlNEMfoGT1txCikWyu5KsojfNr6uGwaQA
Date: Fri, 27 Aug 2021 03:43:34 +0000
Message-ID: <BN9PR11MB54338B5C615A48CE313703578CC89@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <8b873e30-c1d1-3174-9e67-506887deedcc@suse.com>
In-Reply-To: <8b873e30-c1d1-3174-9e67-506887deedcc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de98a05c-c8be-4957-6ed8-08d9690cd8cd
x-ms-traffictypediagnostic: BN9PR11MB5530:
x-microsoft-antispam-prvs: <BN9PR11MB5530323C40D0CE93CB82FF048CC89@BN9PR11MB5530.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qbgqcSDGIMdbPxLre3gl6+x8QsY2zD9MWxjQBqRvdMWUHCqBXFmV/WkEY3Xuu9pgoBbUa37vLDquwiFpZD3EsE2rTFv6tFNzzF1XtrAntpdIqVTi/E5T3btVOYGcnB3KvnvJOwUwDrgSf5K9Jx0twhk4HRGph8Jq1NE3T012QQ1MvSR7CR9mvV3gtDVZk/PSCt3sYZGyGfRv1XKnfM3jzihFTb7+09Cdy3Xlv6U2kAntNyuaMrEpGoKqiMDMPQ8CCMirVRMTWP4/YXMa4nLbe6eBV4BoFI83r3q4jX1vQthAcYGRQE/U223JusxfofGmZMp8neLGedEWkfjAB6WNHYCyb/XZPntEuSdsbXe6Bam5uNjemjc9Ga1sYYmc4+bqVBttrDUugoIOvpFGInVhtsPeK0rRPWvrwJyp8bSZ3096G0z7YQmlRsDgYi0wpdNHOfJ48K18VNwk2C8ErIBpy9QBUuqE0/6887Fjm85xjAwB6GdjHsS/F3RfEOjYArz62UobfjNurrl5aHC4s59QDM4zggWlVUemF4Cv3B2kK8Tu8mzOEAwJ8UZFytS3W5iquoN/uEVl/aKx+qt7HBuGen0jr1dQLW0k903ms1ZTolzglk+5i0N2y8c9/j453HDLy33U1NQp/G0ifyf1I4KbiB531pSQNpoNa1QDQdALvnMfWLJdMA7wiu3U8iFm/aTF+vTOI+TuEfEk1m1yIxZv2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(66946007)(316002)(33656002)(76116006)(4326008)(186003)(38070700005)(66446008)(26005)(86362001)(55016002)(66556008)(478600001)(8676002)(122000001)(38100700002)(71200400001)(5660300002)(52536014)(9686003)(64756008)(2906002)(6506007)(110136005)(7696005)(66476007)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1ZRcGZBRThzbzdxOU96di9kUWZkUGxzelA4TkpiSldBUGJOa0xidUwrVHdP?=
 =?utf-8?B?b2RpSHVmL2s2ZGFRd2VFZUNtMHhqTGx3MHNwK2JsUVdwWlhZZGs0a1VkUTJo?=
 =?utf-8?B?SGxmODk5VmdieHpDNzdRWTBVbGpoVzFCZU50V20wT0EwZm5IYTFWeFZYZTVZ?=
 =?utf-8?B?czBsQm5YWjRpRUN4dE1UckhSL0R2NXYzSHRkVldTNjRxWUZqcDFZdms1OHhT?=
 =?utf-8?B?SExWQU1IbjZPRTNRSTZPbWtaS1RYQk5IOTlHeGxlV1JmNkszbWs4VzZCblRB?=
 =?utf-8?B?V2E3MjNUK3pzb2E2cnVtNFQ4RUUvRVAxdG04VU1SQ3p6Y2tKWmM3R05URW1v?=
 =?utf-8?B?WGYyY3VCYkJ6WThDZHFibENSbXdsS0ZFTUJIWTQ5SVhGZ2RSNTVtZ1g0bS9V?=
 =?utf-8?B?bU1wMlJSdldXVGFWTEZUOFh4R3VycmxBNTZjRnVBY0ZJL05meXpjam1HUU85?=
 =?utf-8?B?Nnp1b2tKVDVBTThDRWZUdWkycW1nT09peUtPNisvQ1BCSWJnS1dEcittUkR4?=
 =?utf-8?B?ekZYdHdVVnNheHBLUDJjRWw1N2ZCcWlRSEZJUUU0NTFpSGlLK0J4ekFLZFhv?=
 =?utf-8?B?MWxPMVo0N1JCTVFhRDZHMmV0SzlxVUxsYVdRQmw4VmRtbW92ZGNjaUFHR0hv?=
 =?utf-8?B?SDI2N2xCcmNia21hcGlmUzBVbnJINjkxK0M4bkR2NjZXSVhDMktzQW5QTDFY?=
 =?utf-8?B?dE0zTUVQU2dyQnNjQnBxNTFCd1pMMzBLa3lLWmFyaVdpNWRCdVVla3JMWWNK?=
 =?utf-8?B?VDJNc2xoRDVKRnc4Rmxaa00xZDQrUWRlNHFDN1BRZWxxY0VRaFJkSWo4c2lx?=
 =?utf-8?B?d2FaNklGUnRWV3M1Zk02S2djdVhjVm9zaE1lVVl2U0w3Y0hXN1U3QkFZWGRG?=
 =?utf-8?B?NWFQSCs4Z3VlMU9HTzF4UWRwV25FQkF3Z052R2g3d0cvVUc1YXdYTDJpcHY2?=
 =?utf-8?B?MmlFZHY5cmRsNEl2T1M5YlRyS2xxWlhFNGlXTEFabzhWVWtSdFFDVERvbmx5?=
 =?utf-8?B?enhKNzFuNXkxRmVEMEh5RjI3U25FdnE1S0k4V2ZSTG9NQmtQWk5Cd2g3U2dO?=
 =?utf-8?B?ZUJndFRaa29OSkIzeVJFVjdFdmdsY1gxQ00waGhabmtheEgybG1qL2Z1OHZJ?=
 =?utf-8?B?YkFEaTJEWXVoby8xUUR4ajlSTnN0Z3JXMmszS2VGbWtxcCtaaWpPZU40M1M3?=
 =?utf-8?B?UlFKR3l6WXE3VjFSVVJkMFhvL0dHNVJvU2tQaWc2aldpTDRUMyt4SytHYjlu?=
 =?utf-8?B?NjBzQzVSb1B6U2xlTzk2QlBnanNuaUZCRjZVbDQ2ekh2T0hFNk9kM2RpZjNZ?=
 =?utf-8?B?M0RMNW1sYVk3TUJLSnRia01HbmttaWlmS1BLdC9FVWJySFZvRStlaitsMVdQ?=
 =?utf-8?B?aFRUQU9MYTBkdmJiNUxwMG9TaW85ajBMY1ZWTnNOVjJmOFpSVUs2UG9aTW5H?=
 =?utf-8?B?a3dsWjVrM0NiRjJFUHF4b3VGeTRmY3JtL0Q5YTZ2THRYNU9FM3dqd0J0VGdu?=
 =?utf-8?B?MzN5c25jZTVJUE03NE0yMTZ4ZjBPWDdpZEF6MHFCTnVxT1BzdCttRy9pUHVz?=
 =?utf-8?B?Y3hKOEFubDhLNXFoTlN6bHRwZTFLM3JJdDdaYkE2QU05bWhhcE15MVBEZXhs?=
 =?utf-8?B?MnVtaC8zR0ZKTXNQL1NXQnNHbStCMWRzcVZHV0ZTbG9aOTdXdmVMZWNmUU5X?=
 =?utf-8?B?eFFvNFlGYUhqTW9oTks2SmYxV1BoYUwrWWpHN2NjQ0xGSHB4SnJKODhPa2py?=
 =?utf-8?Q?FZz0OD3hbhvdbMoX+Q4yHdqwZGgDsAUkeK7Ay6j?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de98a05c-c8be-4957-6ed8-08d9690cd8cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 03:43:34.6197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqqAgYx3/UxgdULKy4PCsk7g3lOfD9sr5nazhiE+W8avfJn/4/GQLrMmBAAE62Dt07wKB4PqeTQKgbmqdnD43w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5530
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBdWd1c3QgMTksIDIwMjEgNDowNiBQTQ0KPiANCj4gV2hpbGUgZm9yIGNvbnRleHQgY2FjaGUg
ZW50cnkgZmx1c2hpbmcgdXNlIG9mIGRpZCAwIGlzIGluZGVlZCBjb3JyZWN0DQo+IChhZnRlciBh
bGwgdXBvbiByZWFkaW5nIHRoZSBjb250ZXh0IGVudHJ5IHRoZSBJT01NVSB3b3VsZG4ndCBrbm93
IGFueQ0KPiBkb21haW4gSUQgaWYgdGhlIGVudHJ5IGlzIG5vdCBwcmVzZW50LCBhbmQgaGVuY2Ug
YSBzdXJyb2dhdGUgb25lIG5lZWRzDQo+IHRvIGJlIHVzZWQpLCBmb3IgSU9UTEIgZW50cmllcyB0
aGUgbm9ybWFsIGRvbWFpbiBJRCAoZnJvbSB0aGUgW3ByZXNlbnRdDQo+IGNvbnRleHQgZW50cnkp
IGdldHMgdXNlZC4gU2VlIHN1Yi1zZWN0aW9uICJJT1RMQiIgb2Ygc2VjdGlvbiAiQWRkcmVzcw0K
PiBUcmFuc2xhdGlvbiBDYWNoZXMiIGluIHRoZSBWVC1kIHNwZWMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gTHVja2lseSB0aGlzIGlz
IHN1cHBvc2VkIHRvIGJlIGFuIGlzc3VlIG9ubHkgd2hlbiBydW5uaW5nIG9uIGVtdWxhdGVkDQo+
IElPTU1VczsgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zIGFyZSBleHBlY3RlZCB0byBoYXZlIENB
UC5DTT0wLg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMN
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTQ3NCwx
NyArNDc0LDEwIEBAIGludCB2dGRfZmx1c2hfaW90bGJfcmVnKHN0cnVjdCB2dGRfaW9tbXUNCj4g
DQo+ICAgICAgLyoNCj4gICAgICAgKiBJbiB0aGUgbm9uLXByZXNlbnQgZW50cnkgZmx1c2ggY2Fz
ZSwgaWYgaGFyZHdhcmUgZG9lc24ndCBjYWNoZQ0KPiAtICAgICAqIG5vbi1wcmVzZW50IGVudHJ5
IHdlIGRvIG5vdGhpbmcgYW5kIGlmIGhhcmR3YXJlIGNhY2hlIG5vbi1wcmVzZW50DQo+IC0gICAg
ICogZW50cnksIHdlIGZsdXNoIGVudHJpZXMgb2YgZG9tYWluIDAgKHRoZSBkb21haW4gaWQgaXMg
dXNlZCB0byBjYWNoZQ0KPiAtICAgICAqIGFueSBub24tcHJlc2VudCBlbnRyaWVzKQ0KPiArICAg
ICAqIG5vbi1wcmVzZW50IGVudHJpZXMgd2UgZG8gbm90aGluZy4NCj4gICAgICAgKi8NCj4gLSAg
ICBpZiAoIGZsdXNoX25vbl9wcmVzZW50X2VudHJ5ICkNCj4gLSAgICB7DQo+IC0gICAgICAgIGlm
ICggIWNhcF9jYWNoaW5nX21vZGUoaW9tbXUtPmNhcCkgKQ0KPiAtICAgICAgICAgICAgcmV0dXJu
IDE7DQo+IC0gICAgICAgIGVsc2UNCj4gLSAgICAgICAgICAgIGRpZCA9IDA7DQo+IC0gICAgfQ0K
PiArICAgIGlmICggZmx1c2hfbm9uX3ByZXNlbnRfZW50cnkgJiYgIWNhcF9jYWNoaW5nX21vZGUo
aW9tbXUtPmNhcCkgKQ0KPiArICAgICAgICByZXR1cm4gMTsNCj4gDQo+ICAgICAgLyogdXNlIHJl
Z2lzdGVyIGludmFsaWRhdGlvbiAqLw0KPiAgICAgIHN3aXRjaCAoIHR5cGUgKQ0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcWludmFsLmMNCj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL3FpbnZhbC5jDQo+IEBAIC0zNjIsMTcgKzM2MiwxMCBAQCBzdGF0aWMg
aW50IF9fbXVzdF9jaGVjayBmbHVzaF9pb3RsYl9xaShzDQo+IA0KPiAgICAgIC8qDQo+ICAgICAg
ICogSW4gdGhlIG5vbi1wcmVzZW50IGVudHJ5IGZsdXNoIGNhc2UsIGlmIGhhcmR3YXJlIGRvZXNu
J3QgY2FjaGUNCj4gLSAgICAgKiBub24tcHJlc2VudCBlbnRyeSB3ZSBkbyBub3RoaW5nIGFuZCBp
ZiBoYXJkd2FyZSBjYWNoZSBub24tcHJlc2VudA0KPiAtICAgICAqIGVudHJ5LCB3ZSBmbHVzaCBl
bnRyaWVzIG9mIGRvbWFpbiAwICh0aGUgZG9tYWluIGlkIGlzIHVzZWQgdG8gY2FjaGUNCj4gLSAg
ICAgKiBhbnkgbm9uLXByZXNlbnQgZW50cmllcykNCj4gKyAgICAgKiBub24tcHJlc2VudCBlbnRy
aWVzIHdlIGRvIG5vdGhpbmcuDQo+ICAgICAgICovDQo+IC0gICAgaWYgKCBmbHVzaF9ub25fcHJl
c2VudF9lbnRyeSApDQo+IC0gICAgew0KPiAtICAgICAgICBpZiAoICFjYXBfY2FjaGluZ19tb2Rl
KGlvbW11LT5jYXApICkNCj4gLSAgICAgICAgICAgIHJldHVybiAxOw0KPiAtICAgICAgICBlbHNl
DQo+IC0gICAgICAgICAgICBkaWQgPSAwOw0KPiAtICAgIH0NCj4gKyAgICBpZiAoIGZsdXNoX25v
bl9wcmVzZW50X2VudHJ5ICYmICFjYXBfY2FjaGluZ19tb2RlKGlvbW11LT5jYXApICkNCj4gKyAg
ICAgICAgcmV0dXJuIDE7DQo+IA0KPiAgICAgIC8qIHVzZSBxdWV1ZWQgaW52YWxpZGF0aW9uICov
DQo+ICAgICAgaWYgKGNhcF93cml0ZV9kcmFpbihpb21tdS0+Y2FwKSkNCg0K


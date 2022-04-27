Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE2510F9E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 05:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314301.532296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYWG-00038Y-HQ; Wed, 27 Apr 2022 03:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314301.532296; Wed, 27 Apr 2022 03:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYWG-00035h-E5; Wed, 27 Apr 2022 03:39:12 +0000
Received: by outflank-mailman (input) for mailman id 314301;
 Wed, 27 Apr 2022 03:39:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/sE=VF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1njYWE-00035V-GO
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 03:39:11 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95d948be-c5db-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 05:39:06 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 20:39:03 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 20:39:03 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 20:39:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 20:39:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 20:39:02 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 03:39:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 03:39:00 +0000
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
X-Inumbo-ID: 95d948be-c5db-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651030746; x=1682566746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P4sda8vTB8u+PTFtV9QVyGUfwdsWbCqqA2coi5Sv3wg=;
  b=egYBCBIrn0OYCxAFuB/KRKmH8dTavPPPVlEb5nU7bmQFdmZLn5OGOO3Z
   z5DCcH24NL+W1uvlpEEoDD8Cb/GDN7zUvASGNb+OVou47BIq/GRcRKYgV
   xENK80Y8/8gIb98wJoMYMvTo4/XS8JmnhX4IsO5nuBk20LTSxOgzQIigZ
   XizdWMUrGmryCJnY1USqYcHe7OeissFv+xYitfAY5ZGrl2kvOTno0sztS
   BknqfEAXk9tB4PXQL8zgpckW2qtOhIs3DfRj1zBqEDVStlqWO9O0Ox6bJ
   +AQulWtRUIrWgTdmteYg6q31u3pJWIAdckD91989JXws4XPUhoJlE/QBi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245724112"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="245724112"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="513476546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwGHg0VblUxCdJGADxdXx833Xxdm4UqEbj3MXxX1GeJ0crilLPLHguwSQYFs1OS8BgDABaZ3hbG3X0weY8lmipSDsCa/u8ujTjswlrmLWG0T2ayZdF89m1jltDEnURBrwTrB+Hi22VxU59dtVMckdX1PAjl98v7BvLZG5Od9YYgccg7iBWo+rtIFu8DHGT5hwYAR4FcJ59WMp1ZIUkWwlzwV1AcVC0hoG8ZOoUpWALl8lKwq4ltiL+PwX+1nQo4H3Qv19r8FKwiFaPAINJSRu/2JM7Ubm+WIOv5RDfy+5ilGGzilgZ75jTnOj3+Klywm/3lcexsWynQ5tID/kIBWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4sda8vTB8u+PTFtV9QVyGUfwdsWbCqqA2coi5Sv3wg=;
 b=Dy/9GnrgOw/vwdJRFjF7Bc3s/3jHTIGwUxBEVofogqriip5h9iqNEP/k6JhpdabuXutELLdUZKDLNQg5McQNPoSp3EaodccJw1Oy9/2RXk8g8q2mdKcdw2nkp/AYPUYs05w9hcTfJo+Y2370B9lPs1oK3PpKjx+bdjvnD/T0QY7sMnzxSsDgD4qXkIwgDLvQ4unpWfOIk8m5C9xqT0QS4ACg6i0i0uDYdpkEioaPapleTP/TnC34uE6YgwDDZzRan2G4lBU3s0qYrJpOCYaTt9ENn+uFo7/aPf7tS1gnweM2zuzofChG7RmFbikR8bkKKbvVAyJut3wz7nYwT5APgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Cooper, Andrew" <andrew.cooper3@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>, Edwin Torok <edvin.torok@citrix.com>
Subject: RE: RMRRs and Phantom Functions
Thread-Topic: RMRRs and Phantom Functions
Thread-Index: AQHYWZZDIrEkmq9fL0+3qLNT2+7QyK0DHAnA
Date: Wed, 27 Apr 2022 03:39:00 +0000
Message-ID: <BN9PR11MB5276C91F31AA5119CD2B1B038CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
In-Reply-To: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae4c92a-8aa1-4a71-d204-08da27ff7796
x-ms-traffictypediagnostic: PH0PR11MB5829:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB58292149DF46ACBE9E1E08D18CFA9@PH0PR11MB5829.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UUYW34Ypi1+5iyy1CUGZnkEAyyToJLfY6s+bAMShMDYCuBbelALCwtyzW2cbuzMlUUW+2f7RXXB+waaswd/FDYlgXHxX4i3Dfbq0q3JH8KMh6iOhbvnakoOi/N2OAO71GAv6CJv5hF0fl2V9K6LHB6Z4f1zP6CYkaJ64i+gznAzmogx9wuNv2Taa6RYYfFxs4ymHT0TjHXFSdAf5XsEf3y3qvphorBO9yHTtmqOgN0OeLfJNynqPnPg8yWT3XUzZm7DAOXUX2qgFIgG1r0bJm83aon3yd5Jvfyr/G71TKnok/rokEwJlLfpVnJi4/EZuFk7rH6md7s+6fCnrHq/xiJObrzLx8ILeh8cO4kiXZHQKHMZojBQ3RxhNmPIOpCmZEjm9Awvt3VAp7eO+8NSw7NxM1fUudSLLv0lnawwcYQi3Z+gA1IGZ9SbwhoCAL4SPCT0p1AQVXO5ATi2/e1BbTR89aLzAEqP+mTiankFOequlGJgHIaakNM6qVzubsYT4BCOqBBMJRxdNzAYmo/STvVw4b33R8A5FqnUTWq2YxQFqEv+fnQSSCY5KfB5F7uWM0EKZW4e9lQPPP7bcijDPt2cwM9rycemuyMsMrY7ey9kA7IMVTRPQBPsd4wRwL1gHqnn3M3FiZSV+5exrrIiBBr6GGA5omJAUaTCQlxq/hbS9BhQfY8T531C7Z6ZEZ+0B/XrUPVabW84l+c5Qs2c1oA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(38070700005)(38100700002)(54906003)(2906002)(122000001)(508600001)(71200400001)(66476007)(66556008)(66946007)(64756008)(66446008)(8676002)(76116006)(3480700007)(186003)(33656002)(52536014)(316002)(86362001)(26005)(55016003)(82960400001)(7696005)(8936002)(6506007)(9686003)(110136005)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0RWQUp5ZUhreGRpMmxSUlY2M2JjVGQ5dHV6ZSszREVycjVYaXcrYjVCU3dZ?=
 =?utf-8?B?RWFDQkdZVHArRDhHVTl0bVl2NUVoeHRVSk40bXZwYk9PblRrd3ZxZkJVSWRC?=
 =?utf-8?B?Uk9EU2kzYyt5VjUrWXVVQjBib0wxUFZrUklKeXFMS21VUEIrOVZydW5wOGQ3?=
 =?utf-8?B?dHA0RWdpZ0dZam84OFdOOVN1anFKMFRnMC81WTU0LzN4dlF4TERQZzdEZXZu?=
 =?utf-8?B?TERWaTB2RmlrM1E2ckZraEFIMUNjbEt2d240cUJkT1o5dmlOTUJKR2VDWDk0?=
 =?utf-8?B?Ukl6ZWpuU1ZOQThpMFBuY0JaZWJjUXlydlQ3V2k1UVgvcjRpUm4rUDVUbWlV?=
 =?utf-8?B?eWdzZnYwYWFlNjZkM2hYS0g0QW1ybmY5U1RnTFNWa21pd1pVbzVTSmNmWG5E?=
 =?utf-8?B?L0RoSEZXZVZIZkJPUjNmVjMzbjh2TmdYT1dRZm5pR0lPZmlic3RtMmVwSnlK?=
 =?utf-8?B?VitOdTYyUExSUkxxNEVPbU8wRkZVZDlQcDQ1Mm9KblJya2l1ME1QYnZwQXh3?=
 =?utf-8?B?Lytma0xTcGdrQXhUWVh1M0lzU0psSEpWOENJTnYveGxvSm1DMGlOSDE5K1hr?=
 =?utf-8?B?YitjUXVYaUMreVpuYkNFTE5zYjN4V1dHaC9JUEt3ZGg3NzlWcDRYZ0tKM0NU?=
 =?utf-8?B?T3RUZ2VTUkdJQ29GanpFUm4wbHRkejNnd3g1TGZIbjRSYithN2N3VHdWa0dO?=
 =?utf-8?B?cjdtOTJVU29KUGJ2T3dQUElRNHorN1BVVndNVGdpYzBxZjJRdzU3QzJYWFBr?=
 =?utf-8?B?MnlWc20xWk9FZVVadmhxY2Z0S1BFdytoRmwvNjYrSldWUVIrc3lyeStaMSsv?=
 =?utf-8?B?Q2dwN0pmSkQzcEpHdnZqZDhNWjljdHlvWi9XNmVYSCtaN0ZwOHhKT2tjS2wr?=
 =?utf-8?B?T3pUTi9tNFF1YmxiTmpVc3JUNHF0eWdFMVh5QzErOXk3MnRwd1pXWjdKbXR0?=
 =?utf-8?B?SVBwQkE2REY0R3FaSHdPbW12d1JyUVIwUnNDekpkQ1VHTC9DQm1OUzJmTnBl?=
 =?utf-8?B?V2gzTDdwd1FRakRwa2VzTVNHTU1tZEVocHMwOWtUR1dIc2JrdDUrSEk1ZUor?=
 =?utf-8?B?Q2t0VzdOakxtS2JJdklnN290WFk0U3FoRmhvdjVLbllZRE1hRy9TQ1lTOTdz?=
 =?utf-8?B?QTlINWIrSHJBL0JyYU80RGhvVzNsMTZFVTFlWWpMQjI4RktBWGp5NzA1dmow?=
 =?utf-8?B?QUk2OFpIYzRtT3BnWHh1dzNaeUlRRFJ5a1Ryb1Z6M3ViS1E3SkRmNGovN01G?=
 =?utf-8?B?ejdOaWN1L01sY3RrS2xLVzhEbGh0ZmxQSFpjM1VGOVZnQXZVa0VtVEZpVFpS?=
 =?utf-8?B?QkVBbnhGTnlTRlM3cXFqMERnNDVlVk44ZVdYU0hhS0g5RDRTaUJWdWp3bDYx?=
 =?utf-8?B?d2tPbDZyaWEvdzFBeHdNeVk1RHBSN2dCYkgzM3E3RGxVUzl2Y0VBRllWeDR5?=
 =?utf-8?B?WUNNREFpZHdQVlF6S1RLeGJYbkc0ODJsbW5NcXlhWVFJUEFhWlhkT1pRWUVj?=
 =?utf-8?B?UEd0S25Yd1lZZzF1VkpNNk1uWUdpbXkxYzMweXg4ZTNqdC9WbitoVU9ZNmtW?=
 =?utf-8?B?bW5STVRnazN2MWlJRDZsUVpNdkRVTy9odkJ2MllOWHpGUlhORTNxZTRWQzRt?=
 =?utf-8?B?ZG15UHV6ZlV3Myt2UmtrTVIvTDFrZDAySzFERjFLMG0yN0taWWd5eHM2M2hV?=
 =?utf-8?B?c2RCOEppRWxubk1mTjkrYkRGZmlpSXZqMmxMb0plNDBMR0pzU0FnSTJJeDQ1?=
 =?utf-8?B?dDZQSnBsNGk5dTR6Zzgram1aL29YQU1QT2UvSGFuclZtVjhHRUdmVHMzMDZQ?=
 =?utf-8?B?dmVOSW90bi8zd2luaWNVVTJ2YWVnY2VQa3pKeVlBK2tyeC9zQ1NFdE9zR2Rh?=
 =?utf-8?B?NUtnYzNtN2FCcjhPU1BXQytIVjY1aVAxYzd4b20zK2M5Q0YxZVNvTThoUnly?=
 =?utf-8?B?NXlabHZob1BwbWlWTXFXa0FUN3JKaWZFby9Hd3huczZydWpmQzQrME9sdXht?=
 =?utf-8?B?dnJHTXpoSys4eHRncEl6cDIwL1BodVZnSnROeEhhVXBBenBxc3FTWmVxblM4?=
 =?utf-8?B?MHlPMGJMdm5qODd2aTJ6SE02c3JwWmp0WVlMcDhjRElFYjZxeG02d2hUUjJE?=
 =?utf-8?B?ZUxjaTJPWG0zdCtqNTUyMEdBbnJPQ0pvTVJQRDVzczlEZW5hcGlhN245aGRu?=
 =?utf-8?B?UGdiN0Y3cmxqNDFRR29ZY0xOTXdTeXhJN0JLc01NK0Y5UEE2OGdWSVZNbnZO?=
 =?utf-8?B?TllrMGJIb0t4TklUalVCd0RVby9ZN0NVekYxSDcrQzVHNEF4aHFJTVo2c3NY?=
 =?utf-8?B?UHhNWUgvNTVGK0lIaGEySitRai84TjJ5RjdHQnpLd2FySWNhUGpPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae4c92a-8aa1-4a71-d204-08da27ff7796
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 03:39:00.2394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBDcfxl7Cm0nfq8BZJeqDOhgF18/NC5rvfajVUorJhuxK7Mto2rg0mcB3ZRqLjQabJUvAC2KXfwqoF7cG59K3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBXZWRuZXNkYXksIEFwcmlsIDI3LCAyMDIyIDE6NTIgQU0NCj4gDQo+IEhlbGxvLA0KPiANCj4g
RWR2aW4gaGFzIGZvdW5kIGEgbWFjaGluZSB3aXRoIHNvbWUgdmVyeSB3ZWlyZCBwcm9wZXJ0aWVz
LsKgIEl0IGlzIGFuIEhQDQo+IFByb0xpYW50IEJMNDYwYyBHZW44IHdpdGg6DQo+IA0KPiDCoFwt
WzAwMDA6MDBdLSstMDAuMMKgIEludGVsIENvcnBvcmF0aW9uIFhlb24gRTUvQ29yZSBpNyBETUky
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLTAxLjAtWzExXS0tDQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArLTAxLjEtWzAyXS0tDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
LTAyLjAtWzA0XS0tKy0wMC4wwqAgRW11bGV4IENvcnBvcmF0aW9uIE9uZUNvbm5lY3QgMTBHYiBO
SUMNCj4gKGJlMykNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICstMDAuMcKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2IgTklDDQo+
IChiZTMpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArLTAwLjLCoCBFbXVsZXggQ29ycG9yYXRpb24gT25lQ29ubmVjdCAxMEdiDQo+IGlTQ1NJIElu
aXRpYXRvciAoYmUzKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXC0wMC4zwqAgRW11bGV4IENvcnBvcmF0aW9uIE9uZUNvbm5lY3QgMTBHYg0KPiBp
U0NTSSBJbml0aWF0b3IgKGJlMykNCj4gDQo+IHlldCBhbGwgNCBvdGhlciBmdW5jdGlvbnMgb24g
dGhlIGRldmljZSBwZXJpb2RpY2FsbHkgaGl0IElPTU1VIGZhdWx0cw0KPiAofm9uY2UgZXZlcnkg
NSBtaW5zLCBzbyBkZWZpbml0ZWx5IHN0YXRzKS4NCj4gDQo+IChYRU4pIFtWVC1EXURNQVI6W0RN
QSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6MDQ6MDAuNF0gZmF1bHQgYWRkcg0KPiBiZGY4
MDAwMA0KPiAoWEVOKSBbVlQtRF1ETUFSOltETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswMDAw
OjA0OjAwLjVdIGZhdWx0IGFkZHINCj4gYmRmODAwMDANCj4gKFhFTikgW1ZULURdRE1BUjpbRE1B
IFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowNDowMC42XSBmYXVsdCBhZGRyDQo+IGJkZjgw
MDAwDQo+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6
MDQ6MDAuN10gZmF1bHQgYWRkcg0KPiBiZGY4MDAwMA0KPiANCj4gVGhlcmUgYXJlIHNldmVyYWwg
Uk1SUnMgY292ZXJpbmcgdGhlIHRoZXNlIGRldmljZXMsIHdpdGg6DQo+IA0KPiAoWEVOKSBbVlQt
RF1mb3VuZCBBQ1BJX0RNQVJfUk1SUjoNCj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjAz
OjAwLjANCj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjAxOjAwLjANCj4gKFhFTikgW1ZU
LURdIGVuZHBvaW50OiAwMDAwOjAxOjAwLjINCj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAw
OjA0OjAwLjANCj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjENCj4gKFhFTikg
W1ZULURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjINCj4gKFhFTikgW1ZULURdIGVuZHBvaW50OiAw
MDAwOjA0OjAwLjMNCj4gKFhFTikgW1ZULURdZG1hci5jOjYwODrCoMKgIFJNUlIgcmVnaW9uOiBi
YXNlX2FkZHIgYmRmOGYwMDAgZW5kX2FkZHINCj4gYmRmOTJmZmYNCj4gDQo+IGJlaW5nIHRoZSBv
bmUgcmVsZXZhbnQgdG8gdGhlc2UgZmF1bHRzLsKgIEkndmUgbm90IG1hbnVhbGx5IGRlY29kZWQg
dGhlDQo+IERNQVIgdGFibGUgYmVjYXVzZSBkZXZpY2UgcGF0aHMgYXJlIGhvcnJpYmxlIHRvIGZv
bGxvdyBidXQgdGhlcmUgYXJlIGF0DQo+IGxlYXN0IHRoZSBjb3JyZWN0IG51bWJlciBvZiBlbmRw
b2ludHMuwqAgVGhlIGZ1bmN0aW9ucyBhbGwgaGF2ZSBTUi1JT1YNCj4gKGRpc2FibGVkKSBhbmQg
QVJJIChlbmFibGVkKS7CoCBOb25lIGhhdmUgYW55IFBoYW50b20gZnVuY3Rpb25zIGRlc2NyaWJl
ZC4NCj4gDQo+IFNwZWNpZnlpbmcgcGNpLXBoYW50b209MDQ6MDAsMSBkb2VzIGFwcGVhciB0byB3
b3JrIGFyb3VuZCB0aGUgZmF1bHRzLA0KPiBidXQgaXQncyBub3QgcmlnaHQsIGJlY2F1c2UgZnVu
Y3Rpb25zIDEgdGhydSAzIGFyZW4ndCBhY3R1YWxseSBwaGFudG9tLg0KPiANCj4gQWxzbywgSSBk
b24ndCBzZWUgYW55IGxvZ2ljIHdoaWNoIGFjdHVhbGx5IHdpcmVzIHVwIHBoYW50b20gZnVuY3Rp
b25zDQo+IGxpa2UgdGhpcyB0byBzaGFyZSBSTVJScy9JVk1EcyBpbiBJTyBjb250ZXh0cy7CoCBU
aGUgZmF1bHRzIG9ubHkNCj4gZGlzYXBwZWFyIGFzIGEgc2lkZSBlZmZlY3Qgb2YgMDQ6MDAuMCBh
bmQgMDQ6MDAuNCBiZWluZyBpbiBkb20wLCBhcyBmYXINCj4gYXMgSSBjYW4gdGVsbC4NCj4gDQo+
IFNpbXBseSBnaXZpbmcgdGhlIFJNUlIgdmlhIHJtcnI9IGRvZXNuJ3Qgd29yayAocHJlc3VtYWJs
eSBiZWNhdXNlIG9mIG5vDQo+IHBhdGNoaW5nIGFjdHVhbCBkZXZpY2VzLCBidXQgdGhlcmUncyBu
byB3YXJuaW5nKSwgYnV0IGl0IGZlZWxzIGFzIGlmIGl0DQo+IG91Z2h0IHRvLg0KPiANCg0KV2hh
dCBpcyB0aGUgWGVuIHZlcnNpb24/IERvZXMgaXQgaW5jbHVkZSBKYW4ncyBjaGFuZ2UgZm9yIHBl
ci1kZXZpY2UNCnF1YXJhbnRpbmU/DQoNCmJ0dyBpdCdzIHdlaXJkIHdoeSB0aG9zZSBOSUMgZGV2
aWNlcyByZXF1aXJlIFJNUlIgaW4gdGhlIGZpcnN0IHBsYWNlLi4uDQo=


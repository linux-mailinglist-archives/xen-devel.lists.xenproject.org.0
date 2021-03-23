Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFD345959
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 09:13:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100537.191585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOc9N-0005Nq-3A; Tue, 23 Mar 2021 08:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100537.191585; Tue, 23 Mar 2021 08:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOc9M-0005NU-WC; Tue, 23 Mar 2021 08:12:29 +0000
Received: by outflank-mailman (input) for mailman id 100537;
 Tue, 23 Mar 2021 08:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8rs=IV=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lOc9L-0005NN-MS
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 08:12:27 +0000
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd30cf12-73d5-41a4-a2f4-fe13e2bdb705;
 Tue, 23 Mar 2021 08:12:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 01:12:21 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2021 01:12:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 01:12:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 23 Mar 2021 01:12:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 23 Mar 2021 01:12:16 -0700
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1550.namprd11.prod.outlook.com (2603:10b6:301:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 08:12:15 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 08:12:15 +0000
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
X-Inumbo-ID: dd30cf12-73d5-41a4-a2f4-fe13e2bdb705
IronPort-SDR: +J+8DNzzXEA8KiNzrmtYDVa/KcQfaA2NOkjfMH/J0FKnqGuLrQWrVdoYksoVlRglcu3l0bDzaA
 nn3FNP9sc6sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="169764895"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="169764895"
IronPort-SDR: Dt4S00gxIzibZ1XyzmnRt+8ZZs0eODZP7jLTVWs3frT5JEYyWKcqEZtgMwFWWR8h+DFwYty1zt
 5WpjUuqpwmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="604211958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgpDd/JfrmLW1vuXzkT5sjl2mJlTuy549Dmqou+L/VS4Qn5PUtzrFbevNdkYJuWk9oNZ51Q729LgzC7c2Fhlrv6Iy0kRXgW72M5AbSBBg/1WSq2VD89UMF+//D7+ygGq25k60rM06XHNFWPQmAeb16W2Kebt2Qrb1E42RfIlx1MsOtnKr/ns7s6iFavjfAH572G6+nt+ZHCLBm1XR5A0ARV9ucpystIILXxS/JqDF4DvPk/SFm2WB0XoN/jw+Y/Cwhq+m+JvQQbx+M21TjkG6I0fTNnKLo2++AS7RU9dxGKWwesCaf7kYskUWaQORlgznLML3cGLVi3O8557mp69HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqHLCoWoZ1rYFPgtZ4Cu7PmZodqbAvTisK7++AyjNmE=;
 b=eqnF0f0j4BzBElJv5PkD+b/OseXletKhfrHDyjX/WCD2EwTN3AarKAUl4sACuVvuBnQPAAl83YRZG1IiEDk06o4gDjsNH5LtT3I0nnnb8jy7jq1IQFYGHM36ni4dMaqOaNu7bpI3hX2m4QDy+Ks4ZL6XGrEnaH/H9d6lqTqHM9+BqrDaSau7ewpC+1eT8QIw2ZaE6Gt8OL+9YH3BmI7AQ95uYmIcC/FXLUmTzdnwYus3AJnPZnnlyNNOGxqQAo7TZbZOhnHHvuwR/QmVj7kGFun+FNBnhJAfHJhqq8K9jvU06C3b6ZNKN5ObOecOIxBCk0H8QtlGOk4Zmh02rKvoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqHLCoWoZ1rYFPgtZ4Cu7PmZodqbAvTisK7++AyjNmE=;
 b=yQQJHaFbBaZzc+KEWXDkQ65z9UefKf4PgZHAsFKVODlsI8yh7lve+txQfFFSNEdb/a/VVyXDNb96FXzY2+ORGS+xwkcvMG3C2mYZgxURJX4+V+mcl5r8yKmzBvx3xbFbv3Urls+4o/tesrpi2ofzF+S/GFUQTEd83s2Jogn8nKg=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>
Subject: RE: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
Thread-Topic: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
Thread-Index: AQHXG98vy5+4PMtWhkqpUd8FCjUkXaqRQJ3g
Date: Tue, 23 Mar 2021 08:12:15 +0000
Message-ID: <MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
In-Reply-To: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2100e363-2c3c-4bed-792e-08d8edd35e87
x-ms-traffictypediagnostic: MWHPR11MB1550:
x-microsoft-antispam-prvs: <MWHPR11MB1550133CF28B753303B02CC08C649@MWHPR11MB1550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+zDQlVtReaVDZ1kFiaoBM3+0dkqu8gwORAOAU20mYJiDJ9bqp/Y7mnlqi+f7h4k7lMkfGwyWOSapKMkIUah/rOqxtjBJgqlnEdMAvzgpkkjRDldfQAY2I27QRFYVvLbYFgaeXzwVYTMXmtU6LLXTiK1mqwAQnb/NWxFQeA6u4sdDfhLQ5Ua+x+cLRKxkGdiMUzgVMiNOGXoX74gDRaAWQYyPDq21+g1JxB5VMp+QoYIHYkF5azxl6D4fdHsIUaIC6McR8upL42CIa2+6QK42ZywXfzLgIPfBkil6H6ZDUZLxPerSgRPKVbYM4NPO6beQyLW85Hfaf10hRJD9Bsjj+VoPODR6rGsjJ9BV1rZF7u+/xQ8pXMHl5GMR6WZauyf6jPXnYbFCvF+Wy8AHxGTHmrazvMLkixbOcczB3lSgyfzTJ+0892tiIh1no07kUAznSDnHNwxnnDQBtDoe70iFLsupZz5mvMWHyH4CKiV2JEj9PIXIM64q4LXuAU6AvsLXCO3Q442YkzGC4d8jsYu6Dzsa/VtuS8D5HwYUT5lfNoSm0iE+Y3hgBMbSJLXe1vmMhApmM3Ed1oZd/8Bfn47s1qT642FsDa5dhluBgncxGDsc9wTflwNlqdZiawda4iRtQft2t9ZLmfLdhpKpynq0hYP9pt80MRSIHxwCRVgAk0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(376002)(366004)(39860400002)(6506007)(8676002)(4744005)(9686003)(33656002)(26005)(66476007)(7696005)(186003)(64756008)(2906002)(52536014)(5660300002)(316002)(38100700001)(110136005)(66946007)(76116006)(66556008)(8936002)(4326008)(71200400001)(83380400001)(478600001)(86362001)(55016002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjR5blVXczhvWllzK3VmSmNPakt1dnAzeTQ1TytqaHBXeWwyc1BaczBvS25S?=
 =?utf-8?B?dC9ZWER5TU5oR3lHS0RvcHEwQ01TSXNsR1Q0ZnZLYVRGR0FwS2UvdFVJMCs2?=
 =?utf-8?B?aVdqbHNVZ3J4SHdRazFpL1QyNVVzeGhhdkNWdGFqdkpRcVQrV05YQUFZYlYy?=
 =?utf-8?B?NzVWYWF2QXZtSm8vUE8xNVJxZlNMNkIySXUrQzc5RFR1UmJjN0p5Q2hOaWtZ?=
 =?utf-8?B?Q1I0a0dmZWFGc2pmckpzdjhHQWlzSFNBUlhJeEdlOFdMZmhPbTRwVHp0cEI1?=
 =?utf-8?B?N2RJSTdvaStTUndZRmFZSytMZUtCWWdKQ2dwb29CbzJIbHZwZTJYa21QMndU?=
 =?utf-8?B?SmR2cjBRcmloc0k4UllRM3JaUk1kbm5MSW8vczFTcEV3dDJ4Y0VnUXMwTlF1?=
 =?utf-8?B?aHM3S0ZEMmFhMnJiR3V0MWtrT3J2bE0raVJ6NjRuQ2dKUVVhenBvaktMNmZz?=
 =?utf-8?B?eGR2akpUY09kOFZZeWp4bEJXU1VvZS9kSEpjZm4xSWtTMXp4L0MyeVFVRDYy?=
 =?utf-8?B?UEhVWFZIUTZTQWJFWWdSUUsxelFMZGRQTmNwbzV1bkl1OGxkbmZVcnN0Q0tV?=
 =?utf-8?B?UmJEUURibEpMeFdsdXJqbGg4cGFBdUZ1SkdtbTRCdWJrMzlhbmpEdHFSK2NX?=
 =?utf-8?B?R3FkWThHb0ttcytJNUYxMW0yN055TTh3ZUhQM1JvTmo0RWtnOVVzbHYyVDkx?=
 =?utf-8?B?Q0p5U0FVR05MbDlpYzFZQ09kVHhmKzBwV29aK1FZc3pRQjdEVUJjaHVjaEl1?=
 =?utf-8?B?OVg3LzZCUmVHTFh2TmRTQStOck1ob0FZdWFFbUFNbTZmTWpBM1NuKzdnbzAw?=
 =?utf-8?B?NDhtenRBWjFRU3YwSjNZcWdOMHFNTWhNR2U3enpXSHdRMTduOEhRcURqUGo5?=
 =?utf-8?B?VlVYZHlQNDVyVTRuZExqVTdoU1hEbndMcXl6QnpqMGhxNm9YZ09TN2VZdEtB?=
 =?utf-8?B?L0gvTmVvM3FLZTY5ODNDWFNiZDlKdU4rVitHb0grL3RpM201YW04S2dFNVdS?=
 =?utf-8?B?UTBjR3hFNDVwVjJVT0J0dGpyek0rV2hKRUNSTVdqM1lkSU9lSVFudzBiRHhM?=
 =?utf-8?B?aWhncERQNWF0NjkzTmVVdHJrenp3bU81S2hKUThZZVVWK1ZHRDBXLzYrR0oy?=
 =?utf-8?B?QThrUzRHZG1FaTJUNmt4aUJUbWRHT1lEeGsxOXgrd2VacUlxNm9WaTdCbmFy?=
 =?utf-8?B?NXdSU1EraVVQMFc2VE9CeDJ5VXJIc2tmL3JhZjA4VUIrOTk2TEJoMFVKMFp3?=
 =?utf-8?B?K0c5UWdJSThpZ3lGWUc5aWFaakg3NnViNDVDYzBwRXp3RG5jSzY5WnRNVlFw?=
 =?utf-8?B?UHEyVGJ5VlV3RWJyWDRWU05ZTE00bXVlWFd4ZlJWNWtCSzliamhTTU1uUDJG?=
 =?utf-8?B?ZUY1R1puQXBISXpKd29mZlhnWGFRaDE2TzJnN2VoaEoybGR2R05LRHU1blU0?=
 =?utf-8?B?RXpXK3hQQkVnQVV1UlhleVlYOEEzNHlzNmtCa0tNWDNaV2YyTmNuR3hjRXVK?=
 =?utf-8?B?WS9ubE1MUnFvMDB6UVRhVjgzVEYvK2tTSGRsYXJoMDZxNExDOTRjK0tPQ1oz?=
 =?utf-8?B?ZUJ2OVNGZ1FySGVLajh4YjN0RERoMm00SjhNeDQrSW9vTVZBK0xvZk5LWmRw?=
 =?utf-8?B?VHlJUTVKOVZXditjNll3Q3k1eXFoMG56Q1lUQXRyclM0M0MxVzFmSDU3U0Nj?=
 =?utf-8?B?MnpKVkhIRlRFZDR1YnhJSXpzV1U1VkJlSkNsbFppSEQzb0FNQ0pFRS93TlZa?=
 =?utf-8?Q?PlXFDYa/OWozgyCZPQd26rBaHhB4eJ4LdSVLzWp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2100e363-2c3c-4bed-792e-08d8edd35e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 08:12:15.1624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4C+4Qf5xvIBZlCBOlU8qbjXUINx6+ofBZVf2YwV/GNKTnvD1pxOHP5UngurMY80JdSniQllY+NGzxJ4CZuqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1550
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBNYXJjaCAxOCwgMjAyMSA2OjEyIFBNDQo+IA0KPiBOb25lIG9mIHRoZXNlIGFyZSByZWdyZXNz
aW9ucyBhZmFpY3QsIHNvIGNvbnNpZGVyaW5nIGhvdyBsYXRlIHdlIGFyZQ0KPiBpbiB0aGUgNC4x
NSBwcm9jZXNzLCBJIGNhbiBzZWUgcmVhc29ucyB0byBub3QgdGFrZSBhbnkgb2YgdGhlc2UuIEFs
bA0KPiBvZiB0aGVtIGFyZSBiYWNrcG9ydGluZyBjYW5kaWRhdGVzIHRob3VnaCwgaW1vLg0KPiAN
Cj4gMTogY29ycmVjdCBvZmYtYnktMSBpbiBudW1iZXItb2YtSU9NTVVzIGNoZWNrDQo+IDI6IGxl
YXZlIEZFQ1RMIHdyaXRlIHRvIHZ0ZF9yZXN1bWUoKQ0KPiAzOiByZS1vcmRlciByZWdpc3RlciBy
ZXN0b3JpbmcgaW4gdnRkX3Jlc3VtZSgpDQo+IDQ6IHJlc3RvcmUgZmx1c2ggaG9va3Mgd2hlbiBk
aXNhYmxpbmcgcWludmFsDQo+IA0KDQpGb3IgdGhlIHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K


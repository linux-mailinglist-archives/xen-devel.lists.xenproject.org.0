Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C543347ECCD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 08:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251249.432568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0fE7-0007yU-7n; Fri, 24 Dec 2021 07:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251249.432568; Fri, 24 Dec 2021 07:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0fE7-0007vx-4M; Fri, 24 Dec 2021 07:42:55 +0000
Received: by outflank-mailman (input) for mailman id 251249;
 Fri, 24 Dec 2021 07:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6v+=RJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1n0fE5-0007vr-PN
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 07:42:54 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17885e11-648d-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 08:42:51 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 23:42:48 -0800
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 23 Dec 2021 23:42:48 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:42:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:42:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 23:42:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 23:42:47 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2609.namprd11.prod.outlook.com (2603:10b6:406:b1::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Fri, 24 Dec
 2021 07:42:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 07:42:46 +0000
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
X-Inumbo-ID: 17885e11-648d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640331771; x=1671867771;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=iAHKDw9ZcvBAFKPdGUF4mVkR4H6L8g9tQhue9QZAZ7g=;
  b=jkD19uaeaer3ESIyKrUr19TVw2cxCPe4I4cfyx9/AndymH8/R6iTFydd
   R+Ue+pakxvBNp87dfnh5H1grBjgisyp+kxU56yXkxHpmUFpXQRXOZantB
   sQHgty4re6C81uBEFU6D6AbdsXHwikV99HqkfoWdTvwiMhJ/uEnUgptzT
   oRjKzsF1T2MSzHfWls3zKEyfbUhLnSVWCgofadDKRuMlX8VLwIDyJgVBO
   ufsGgt9xPB6dcYITGDF2RaCHT421e39LdEASQ3i9eeKuZp649CAa16BzF
   uyT4xw6Co1yWs4GdMJUMEBxVWEL69pqn3Cm4FKx457u6g52uzE1VYvckU
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="220954739"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="220954739"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="522674850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUQTSg4P0Gc0KCzj3taYy5zb0MtNnJiw0fApD54b1cnEAfMoAO0LbIhXvuQ8lXzAZ88WNzGm5yU2Avff+TU0HYFTptEbvFFr/m/g4kMnXEzET88L1HSwDXpXzGxiH8h1OGv/5PnvgPeCpOYNFLqk6O49P6+6LkI2m6hvF/Ped153z88X+2c1LgvcXBQCaSBqZVu92XIDfn/MANBNJVwnyQssxN6jr/TZa45Yi3Z5cuWQsXE0pa1XmidPV3iJ46CUUXWPip9zYZ+s3N10GPWUlac/wDLZF4hIW1dPuG2t8bcThWMq8PZv3icJ0qfW+gdbDMWzjdtXMVGDadHdDEOr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAHKDw9ZcvBAFKPdGUF4mVkR4H6L8g9tQhue9QZAZ7g=;
 b=ZpvTIdhpJHKFCjiseRmt96ATRy4dB+Gr1avx0VcNRey30tviJat6Uo2TatYC0skdoeuw7MXsq9LFda/KNS1GG+vQve1U56S8ALEHjmIdKUCjcl/rsh+pprUdwQKEGA2iZvXJVXtheHmNOFpONoMWq7r11204wW/VWUOBBSoBrN94q++48kSN+4fgCcJJUrEV0aI4F4gY1oYrqZeMWbU+/sa+NYbB4PZiqisEWodBXuJeJaY1t+BMd6zvbw+HCj2+wIpq0SDTvWOUYwlTfC8cLgyofknereXA4vFKyDhrCWfsHTtC+jRQjlSpP/AE6mw2T8rEuzP0fn32iOcr+XblwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 0/3] VT-d: macro definition / use tidying
Thread-Topic: [PATCH 0/3] VT-d: macro definition / use tidying
Thread-Index: AQHX7RS1D6BYURt9okGu4tcRyvfEyqxBWWWg
Date: Fri, 24 Dec 2021 07:42:46 +0000
Message-ID: <BN9PR11MB5276E67E45E7530057709ECE8C7F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
In-Reply-To: <5b1a5093-610d-f7d3-8d48-e843d86609da@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63597bbf-5cb9-4215-c95e-08d9c6b0fa11
x-ms-traffictypediagnostic: BN7PR11MB2609:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB26097DDF87D11E321597CC648C7F9@BN7PR11MB2609.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BNMxwiuaUMhTNiILY/LPNIGdtYxFpka5XwowrhUAN9B6pqVPePbAFpAdtTgA8t5zcejq40NG8UPCp6L9mtVQBsh8R5cPSw0YUIHHzH1RtyhPNKpivnQSbl68sqr8lPH02AQXacom09ze3V8eaX8Km+xrOa1IyGFKucSd5v7VK78/dZQZtiGUoqR7CKtajnekph49UCrWM6B+OLJu6QNE53f4qTS+Lcqf97dsMDxY0gRGU0rClXQJpFDpRgl9wut8q8l2HK2yCLUkF9ugGFJUQSjVYkRKXet309ijzhgR4qQLQwEwK3ZTnFVuwVyz/7tGZGA/97oCjq3UeTDZuaCc+YoElcJb1VpeSZoo2iTKGw3TfTAYMISb8r5Bkn2svA8Dy038dQCpcHnYcsnySjn5DhnT1Gk9O+IdB/ksBZpyUuno5TBzVIduyUHj/biUcSQYXkjJz/YIRLNNcVUzX6W83fTR6gs557h6xqw9lBQIkLlKESS64yVZKrrzd7fnr/RVz4lPLG8pUnKAnanL1EQzaQuYIRQPX82R3CQSsnIcmyQ415QIMio+TaNIhjLI9BIrkppHne9sIEpr64lrbGLkv9fFjWlLddE/9udqUc1FLuXzmziY7mgJYLFmvvwXS9t1XhhHYrpQ7P6Tn2fawYbkHIUPT29LBqQ3KyqBFvxhoeSumBZ6pmQJOeYeBTvCZf8xGDFpwV9L6Bhe99S+M0dZBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(86362001)(26005)(38070700005)(33656002)(2906002)(52536014)(83380400001)(71200400001)(186003)(7696005)(66476007)(76116006)(66446008)(66556008)(64756008)(4744005)(5660300002)(38100700002)(122000001)(82960400001)(316002)(8676002)(9686003)(55016003)(110136005)(66946007)(508600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFN6SmN3K2ZjRVUvRTg3QkRuMzhuOW5pTVBscUtKdnE1Y3RIVjY0UzN2SkFO?=
 =?utf-8?B?VjdmYk5RTzBsZjUzL2k3ZURHVG5RakZqaXU3WjdMdm1LL0lYZkMwRHZCSUxF?=
 =?utf-8?B?ayswWFdNU1duMjQvT1hhZkJLRE4zckVFT3M4TzZybkNIdzNZMzIwZ0F4dmtT?=
 =?utf-8?B?ZlE0R0JaTWJDdVc1Qk1sUm85YUsvTWNjK1R3aVZoMlRZR1dSeE13NVlqR3Yy?=
 =?utf-8?B?c2tvSTFEQWR2OWRDa2VUMVc1ZGtvR0h5c2NhaEIzbW9vdXBIS0xJcXYwWGdm?=
 =?utf-8?B?K0I5aDlZRHBIc2dZUWNzZndYNWhiWm8wNkYvY2ppOGJZUGtLV0RyUmNtVjdi?=
 =?utf-8?B?eTc4b2RweWhNTFJPSUpLSGcySTlTNHVUVC85dHA5bngwOHV6UlF5eEZqUmFv?=
 =?utf-8?B?cGcySFhRM1VSWDFxeFFtSWhPbFVlZHFCT1lNVWJhdkJNV0h3VHRmQjNpdlFE?=
 =?utf-8?B?eVd4TU94WkR2Wm9JckZKRHV3dDEyWEFNRkZLc0JVTllsTW1lblBwd3J6djlG?=
 =?utf-8?B?RGxUdlpxUGNyd3AvajlSbDNvL25SOGloMjBQcEhtUmxRbWRRS1pNU2hLNDl2?=
 =?utf-8?B?bnJEUXYrajFSTXd1NXkvbUdCZVN0Rm5xbjZvUm5Qd3hiL1pOaVBKb3VZQ1BT?=
 =?utf-8?B?bTYwbHpYTkN4Sis5cmt5TSt1YWw2Q3N2cFNnd3lMS2JUSTRKRkd2TjRnZUVX?=
 =?utf-8?B?djUwZncxM2lXT2xuTDJJMUlQRUQvd1NvS0pzVmlDODJ0bUZjemt3dWl5RjBU?=
 =?utf-8?B?UUtweDlCNG1iZFVwWVd5VzhpRkxBNEJRQzBEMGV3bE5UTzVSQTRBam5oVlpF?=
 =?utf-8?B?ajV3d3NHZGxMa3Rab2ZyR3RUeGZSRktpL0ljZDZ3R0M0M09iOHFQcGVXbE1Z?=
 =?utf-8?B?VU1QbEorNTdYaGg4SnJwMGVVNnhBSE9OYkZ1QkwvNDhHRGpLVDAvUys4Wm5y?=
 =?utf-8?B?THBYbmI4YlFJZjVSWGl4Qkc5Y3YxelRLZ1gwRGEvcEJGZGlNSFJ3VWRQMVVF?=
 =?utf-8?B?Qm94cmthaU1Ydm1Tbms5WDhjRDVOMHBvNnNyTncrQkJGN2NFK0Eza0UwZXll?=
 =?utf-8?B?ajZkZU9rSDFJS0JUUjhSblF5RzlJdG41WVRYQ0ovdTZJSTlLSmJETUVKQUpq?=
 =?utf-8?B?S0prM0RzSVhWZFJTMVh4VmhNNFhzby9EaEptRno2eitFaUhyaldJSmp2a01D?=
 =?utf-8?B?MGQvQmxkVlJhbTVRelNtMDRzWlp6TXVxZDAxTHFGTS9WZnB2ZmN5K1N5TjJm?=
 =?utf-8?B?WkYvb045b2hYVnJTTTRETkJMbWovQk1zdUtvZTUxTGlsVnc0c3hQNmhPMGlS?=
 =?utf-8?B?dnYwM3I3VlRkejBnZXRZT2pPMU9xdG9sdVZ6RmdqWEJBWmthVHVteExubHF1?=
 =?utf-8?B?Q0dDaWhNZlFoODhvdVhlSXI1UGFlZEo2a29EQXlJVjh2MWxDS1lHMnZMczI2?=
 =?utf-8?B?bUpKU0c1UUxhK0ZsdURMM1ZxN1R6cEJFSGhIcGZ3bTJQQUd2OEg2cDlVYU94?=
 =?utf-8?B?LzY4Nm9tMGJKRkJVNWxpekFXSXRROXdBdUpiTWJ6S0ZyejZsclZJWVM4VEt1?=
 =?utf-8?B?TjdMRVphaVFaVnVsV2NoS0ZmcmhZSWNNU2FmNDhTK1RxOEM0dDJyd0ZIQk8z?=
 =?utf-8?B?M3VJd1dzZFVkL3BIYTMyQVR5QU82bGZFRnh2ak8rcjFVcDEwLy9GaWpJU3pa?=
 =?utf-8?B?TXovVzJkUlY0MnQxUEtwSVFFTlFTUUw1ZzRFN2RHUjZhN1J0eXdnU0xKMUFu?=
 =?utf-8?B?VWRudDkwejRLbS80SW1rRnlicVlZUFEwSG5qbUx1SlRnZlpHRDNmMDJmTHIy?=
 =?utf-8?B?OEJENDVoZ0Z0S200M2dPZWxkeWFvSUc3RFhiMHBjUW5BTGJnaCszeUZKeXpP?=
 =?utf-8?B?OU40cTRsbmNiK0UzRmYvQ0hMNGFXaWJkSms0U2tZTlhzM0tUVk9ZT3ZGNVFs?=
 =?utf-8?B?S3NZN09yUjZ0SUM0UTJIUGVqNHNtSGF3OFRJK2hSWGFDNFFiVGVvYi9hdEpt?=
 =?utf-8?B?MmFhTm04K0dadHViSFpxVGJzRG4xdmhGRGtQNldZWmxJUitiMGNqK2F0V1hj?=
 =?utf-8?B?elpCQnVuMjdYK0tjZjhKcWVrTFJRWDlWR216ZlB2OGpxWGYzSUNVY21ta3JB?=
 =?utf-8?B?NVFvSE1HQ2VXR1I3ZkJ1aStjcndHY053UEhvcFhOeTdJSnNYajRpNHNGSFdM?=
 =?utf-8?Q?u2Mv3NiIICqnlaIZ6TM1noM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63597bbf-5cb9-4215-c95e-08d9c6b0fa11
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 07:42:46.0713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcuBF3g74atfxYE3/FRXZkKkfw80Ui58hh9mGTjW6xDYMyQuWZEpO/n0VRii/MQ/oqH/6nX+zPo9FaKODGZBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2609
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciA5LCAyMDIxIDExOjUyIFBNDQo+IA0KPiBXaGlsZSBwdXR0aW5nIHRvZ2V0aGVy
IHBhdGNoIDEsIEkndmUgbm90aWNlZCB0d28gZnVydGhlciBhc3BlY3RzIHRvDQo+IGNsZWFuIHVw
IGEgbGl0dGxlLg0KPiANCj4gMTogcHJvcGVybHkgcGFyZW50aGVzaXplIGEgbnVtYmVyIG9mIG1h
Y3Jvcw0KPiAyOiB1c2UgRE1BX1RMQl9JVkFfQUREUigpDQo+IDM6IHNob3J0ZW4gdnRkX2ZsdXNo
X3tjb250ZXh0LGlvdGxifV9yZWcoKQ0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPiBmb3IgdGhlIHNlcmllcy4NCg==


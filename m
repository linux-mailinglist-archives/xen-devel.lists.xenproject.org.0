Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3980666879
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 02:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475780.737614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFmVb-00013d-VE; Thu, 12 Jan 2023 01:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475780.737614; Thu, 12 Jan 2023 01:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFmVb-00010y-NW; Thu, 12 Jan 2023 01:35:59 +0000
Received: by outflank-mailman (input) for mailman id 475780;
 Thu, 12 Jan 2023 01:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pFmVZ-00010s-Rk
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 01:35:58 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 731450e7-9219-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 02:35:54 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 17:35:51 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2023 17:35:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 17:35:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 17:35:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 17:35:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 17:35:50 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:35:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 01:35:46 +0000
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
X-Inumbo-ID: 731450e7-9219-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673487354; x=1705023354;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=062Pw/QjRa03xkcJKM56gTmrb5zWdQp44PYzHol87us=;
  b=iIbllR/C1xRFsBzbQtQ9eVuTKga52WcdQGRE/JWYh2MUtVClJ6N62c10
   50aOS3DCayIqwhmufvFB3elU7yB5xsjpTSEWgwU9W1HuOTSNsIv8sLj65
   s1e/WhMsbffm+jDMZt0gpNqlTtjhQNyan7ovgiY0J3I2G29Zb89J6fGRZ
   kawi2e2yypWkapPz+fGKzcqDnVG9dI6phi2k+JbIXyr/FVkHCpnCFcide
   tqgzRLBtqWXJofO27zuSf2LqxVfKTy3+frkhJsInHnnWMB/ReXIOhWDcR
   n9xhx79KMYh39JtYNMbi1LWIZ2u2RB0BZTmzuJyYE64uBWNvPI72oki0h
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409821222"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="409821222"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746368034"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="746368034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJSZFLMHg12zsLcX+scT4ilOACJE82UZ4YGI1XLOHICIdjiC00ahc+K/zQE0OeqrI5M9b44QvhYd/77H4mfmeUu4ptfyiEN8bawt8Bn9xJ5iG98e3mR45hkE96T6zf6vhKQm64CPzbleptrD11F6/Qqh93Rxt4NXp4k83SgEksSp0+e0SQJvFyFrJsoYQ7LGSFbzs08XEPrJMoL3e+rcCIhSjq9GoHkPnhPPxi4/9wWlYymcWTZb2dY/Msb+cxFvAEN7dN4SPcgVQp99KWMxSzjNIeZttZ/VyOo4kitiZ+5iD+r8boN1ljLB0o/vsM91gpi4rgWdtD/2MWZQZqInhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=062Pw/QjRa03xkcJKM56gTmrb5zWdQp44PYzHol87us=;
 b=XsFU9vHDr9LId4ZD+9+gx64xGKZkRNQpVZ5hDRA5CyGUMx+UBmyxgLUYZTLTBFJBvJZYSI5Qe3+OThVSrNDOrmH+Y3dS8y8+3OtCZ8zI1tgwIF+T6mxSF1uraUXYjuwubZaf9X3waGjw1Gsyqs5K/OKTLOWQRPXZTDr1I8m5zhPuSC54ixCgVJpuvuDA0hrYXAOrBF9MkRk70sFRPGV3CfGNlHocFVN8kM1MbQegOoRT7N4wao3niFIbKd4HupWR8/6lKKmRNVf04SsuTFTZ8JH2lsIt0buZIWXDwFKK9T8lUGQXQONcU898jxDuay4Xho0rMpqF30gsZwTAwmWG9Q==
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
Subject: RE: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start
 of day
Thread-Topic: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start
 of day
Thread-Index: AQHZJCMqvD+lv3RMJEyTX9mVHWu5kK6aBACw
Date: Thu, 12 Jan 2023 01:35:46 +0000
Message-ID: <BN9PR11MB52766DB47FC1713963F966568CFD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
 <20230109120828.344-2-andrew.cooper3@citrix.com>
In-Reply-To: <20230109120828.344-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB6263:EE_
x-ms-office365-filtering-correlation-id: 8cbf9686-e99f-4399-32c2-08daf43d53fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 49asUTlnk0gjTXfEgMyE4wjntyaQgEdNKd+ZWbFKM3xpVWeqF2C0tIzrLqVsO9C/18ZHbQobVC5YYxSVMkCC99twvSUwBhHPz8dgnix+tCBmhgc2I2b4aoo43LCnp+qX/1SS7QHZOs4MUQh0JQW4pttHSOVM1QCWVvvm+NZC1cvuSGY1V8GhjaLZyo9PimCDWFvMz3YXF8qgnESZrVn9zFDA+8Fmd7nZfy1FLYtpuMTyr3wlPGDtSmHOp6EBVxF8Ft8l1Jkoz4LI/dRj80+TyCvgfzU1s609JFq6cESVAvS6UByfsn4FQpF8+arKQswkcZMSXRqXHIqjRhHKDsBiru6QKm9g58xKGn941bIpahnd4Ey6cRc4Wd+HEbefc+IxWgU4Mlh9QAaF3CoaKQ3tR8uCUbJb/bLD1zD6L284vBgB2Bt51Qh+vBT1c4aczjeyfAWRmllPj7w1sUbr0FYsB+gs1jZCJwi74voktBbvhaP3mUIaV/NONa91qmlHnkl27UqrfMJbFju3jumgC3zX3R9gniqeWlKpTXfVwsodZTVtCaIgUNBw+sx8UTJilWolJFEIDsjh8dfJ2j/nQ9/BroL+kH/pnpjoih/9NUmb3PZfG/m7ZNQsA1NpmOURrV0QKoVsZPJsN07OywU4/2a3ZLpe3N3YVyA4n4Ym5/P8Qqjy+55WJC4dXtgWgR8gFfKgK7s+V+KidlA0FXhV3ptRBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6506007)(38100700002)(122000001)(82960400001)(107886003)(2906002)(478600001)(33656002)(4744005)(316002)(26005)(186003)(5660300002)(7696005)(71200400001)(9686003)(86362001)(8936002)(38070700005)(52536014)(55016003)(64756008)(41300700001)(110136005)(76116006)(8676002)(66946007)(66556008)(66476007)(66446008)(54906003)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVNlVTNlUnBMWWRpc2pFaUFGdmhlK2JncGpSS3NSZVJxaThNSnloN3N6dmYz?=
 =?utf-8?B?TS91ZnhxSFJVNjI0NGEvRnh4QmNPb3BQMTVOVUQveVNTdVZJSUd1TDZXYVdG?=
 =?utf-8?B?Z3RRSTBwZG8wdjZMRTBNbHpVVlJrWmRRaWlPZXlUdGtJRStzanlCZ0tlMmxG?=
 =?utf-8?B?a3l0NFJUcDFCUHg1Vm9MMGNvb1R0dW04akppR3RuekpnLzVqVWtDSGlvdkRv?=
 =?utf-8?B?c1ErQ2lWb1hmdVgwK254QmNPZVN3YnZtcU1ObHdnc3MzSkRkbkpEQUtkSlcy?=
 =?utf-8?B?QUtpL3JEYlVTREhyRkQxRjI5Sm5SdjZYend3WDZyZEU4VE12elZPYURMUmJ4?=
 =?utf-8?B?RmNzU29RcjJVVU43REpCNm5sYXQyMEpZKzk2bkxSeHl2OGRkc1J5UUVkVWRl?=
 =?utf-8?B?UGtYSjNQNG5hZngwT0ZvOHNhM0tab1JNbGxISGZUSGVOQmcrMGFUN29CSURk?=
 =?utf-8?B?YXk2SmxaYUJCdGVPM3pIOTdMRmtkemdwQ1RVRFhLSEpsa3J5LzhKTFJCcDlO?=
 =?utf-8?B?UXE1SXpXeEw4bS9XT2lFM1VoSzA5NTFEajN0cEFPc3F3NFY2TmxlM25xNjd6?=
 =?utf-8?B?YVhwV2pkZHNjUUNpUzJvQkJJa3FxZEpFbC9NSGVQazdGc2xUTjJWUENWZU5q?=
 =?utf-8?B?S2syQ0xNeGVvcVJwM0NkTDA4VHJhODJBOHBSZVNzZ2NqMmFmVVduQmVTVndh?=
 =?utf-8?B?OG5XZ2YrYzZzd3hXK2wwTjNxdXdjY3ZqaVF0R0pEcUE0TDdvVk1URnFXd2F6?=
 =?utf-8?B?RzcwSlA5ck1qNFpsYXFmRS9tTUZldXhGTXRReTNBVlBLVmt5V3hjcFpaRWZv?=
 =?utf-8?B?bkgvQWhROVhqRUQ3VU5vSHBvcTg3Z1UzNjNHZk93eFBnR1ZjaFdjb3hxRjln?=
 =?utf-8?B?c2tXMXhLaWRxRy9YbXJ4VVBLa3BlK2xITDZLb2w5aVk1Y1pET09mU2pKZUFP?=
 =?utf-8?B?T2o3dXBZQzFCNE5IZXBoaWIvUFhpQkptdE1KOTBrQTJxZzRhNXVReWZQd3l5?=
 =?utf-8?B?akdlKzFYM0lGbjExalNkTytTNHFmRklmZGttMWVPT0tyYjNoZDJ0cFhWdUZ2?=
 =?utf-8?B?VXV3Yk96UkZGTnFwd1ZwSmFrU0daMzU5NU56MzlZWm1ZZWdYWFVJRzVjSWJQ?=
 =?utf-8?B?OGxHZmlhWGZINXEyT1BHekJ5UWIyL0NYcDkvV2lJMDB5TjZBQll1U25sdUxu?=
 =?utf-8?B?bXFieTJNcUZMS0NETVV6M3FVMFhVanBsNWhRVUpKcGQ3QzIxS1lIYjNvZXRz?=
 =?utf-8?B?S0RZdkZWTm5CRit5TUhhZnJhdGtwb3FFQ1NuRDhCdjV4dXBzY0xQV3lTY3lZ?=
 =?utf-8?B?M05sNFdDSkNhV0hQK001dTRra3VrajBFdXVYVjFBODBialBiaURUV2hUbmll?=
 =?utf-8?B?OENVdGNSOGc0VG80bVdMUFNuaENYWFZJRnIwQUdqY1ZNbUlhRVptemVDY0V3?=
 =?utf-8?B?MFlNM0dPbCtYenNid3g5WXAxWkx4NTBodWtQVTlpbFd5RmRiSzdidDFIQnov?=
 =?utf-8?B?czVuS1RoOG5QcXh0ZXJBRHhVdTlubEdQWmhUWjY2MkpWaUFRemZ2d0pWR0JY?=
 =?utf-8?B?N2pzQ1NoR2tNc1JVdmkvc3cwWHExdjFvZm1MODJjNlVnVVRPbzVlR0ZURUZF?=
 =?utf-8?B?RGNtTDllMVlLeHBXY25IKzIxNGJZWUU3WkhtWVBrbEFXS2hjZG5JN216S05D?=
 =?utf-8?B?TUdVbGVoend4cHZNc3lLM3U1MFF4WFpCRGY3c3RYcVM4anUzc3pMUFRvTDdj?=
 =?utf-8?B?MFB4NVg3QVhKZkxBSk9TSkNoWTltMEFDUk9vTkdyaEk1U3pWbmpBb3hHclEv?=
 =?utf-8?B?a2hUeG9qSkN0YXpyamlXRlBocDdhREUxOTdtMkRDWTQrQkgvR3FmbzlvYnpu?=
 =?utf-8?B?QndQRzJZaFdQbzhLcm9wTzFRQjRNMG5rQmtuQnhoVW90c3NlY2FGbUFKclFo?=
 =?utf-8?B?dlUrVjhKTlIrWC9WNE03cHJlMFRYakhSUDQ0R3krWVVtbGNoZGZDVFJuRUh3?=
 =?utf-8?B?QmdKU0FqejgrV21mdEVXQ0swd1JObEsyVFJHaFVWMXoyV0tWN0J4MVRTSnpK?=
 =?utf-8?B?RzVSNkw5NkV2SkhaeDRUY0NMT05KUDk0YlFpVmtsdlg5c2J1V3JMZnlFZGU2?=
 =?utf-8?Q?NY+mdxj/4rPUfe9um8PNGwLfR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbf9686-e99f-4399-32c2-08daf43d53fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 01:35:46.5187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0idUpcN3QkMNGOrsh+nV5BhyXQy94TrYfrQkxufdiWY6Oq4nkseGKtCIhCtWapstxtl9a85BCRQUye8Wn3otZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBNb25kYXksIEphbnVhcnkgOSwgMjAyMyA4OjA4IFBNDQo+IA0KPiBUaGVyZSBpcyBubyBwb2lu
dCByZXBlYXRpbmcgdGhpcyBjYWxjdWxhdGlvbiBhdCBydW50aW1lLCBlc3BlY2lhbGx5IGFzIGl0
IGlzDQo+IGluIHRoZSBmYWxsYmFjayBwYXRoIG9mIHRoZSBXUlNNUi9SRE1TUiBoYW5kbGVycy4N
Cj4gDQo+IE1vdmUgdGhlIGluZnJhc3RydWN0dXJlIGhpZ2hlciBpbiB2bXguYyB0byBhdm9pZCBm
b3J3YXJkIGRlY2xhcmF0aW9ucywNCj4gcmVuYW1pbmcgbGFzdF9icmFuY2hfbXNyX2dldCgpIHRv
IGdldF9tb2RlbF9zcGVjaWZpY19sYnIoKSB0byBoaWdobGlnaHQgdGhhdA0KPiB0aGVzZSBhcmUg
bW9kZWwtc3BlY2lmaWMgb25seS4NCj4gDQo+IE5vIHByYWN0aWNhbCBjaGFuZ2UuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
DQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=


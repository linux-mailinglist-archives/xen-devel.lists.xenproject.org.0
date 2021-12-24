Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087847ECAB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 08:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251243.432557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0f21-00069j-0Z; Fri, 24 Dec 2021 07:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251243.432557; Fri, 24 Dec 2021 07:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0f20-00067u-S5; Fri, 24 Dec 2021 07:30:24 +0000
Received: by outflank-mailman (input) for mailman id 251243;
 Fri, 24 Dec 2021 07:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6v+=RJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1n0f1y-00067m-Pz
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 07:30:22 +0000
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580b6d26-648b-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 08:30:20 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 23:30:17 -0800
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 23 Dec 2021 23:30:17 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:30:17 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:30:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 23:30:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 23:30:16 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5355.namprd11.prod.outlook.com (2603:10b6:408:11c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 07:30:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 07:30:15 +0000
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
X-Inumbo-ID: 580b6d26-648b-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640331020; x=1671867020;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+aXyCi8R+CXoH51lMPO3f2w+6caOk5sKsX0Q/5eYStc=;
  b=Hhcv/1uIS2JJIEWHkzyY2pUvn9yX0id1ThdeRFC6Vl3R4vWSymZubMnI
   apQ1L2XL9fzVKM/l30hD1ZhoxG/llgQ80LfMsAv8V2EFL1WtrbOeYxy9C
   hRGrAk2XUrgWuU8fzoyntQV94iDs1SxMfq5JFwNDPGqCOQj4QH0q/t/IQ
   nx1vnQDaAUSW2fWgBgzkdGkwuaUsoKXSW1wPjog+a/CErxFN57rzVxNCS
   /QZVaU/tmVnHBWpJBUSEqsAfDQuA/ZHdtT61NzNnFyftC9sPs2n05SSn6
   HvU2yVKaZhTkodXPcMcDgWYR8DakwhcgoQlb0HhKR9lYs3AKSwmqjZ4ZG
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="301705750"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="301705750"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="522362291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7yJImkjVNZ6VH7g1P9t5N7bwe6imuwHa6Kll4j4ZEvaFhwO2OArZ9o2rul3Y0kv/HUoBIzMvS4ADc0jPLw+qRC37FEQOLqCw93bLZIc+sDYx51bKZWgmntcrW/BGnzWDztpNXv5hZHxxfjjvRzC908BmnZmEFbokR48Rxv3G3R+PNI12jWlhkXTgqXaHZWALWDTOd0OhZVCKiEw6GsX91fUUa75pKsgSPX7lycvvLKCzJ9NWEKkh72wUo7cvKWpvtMhZ/I+cyOUDQq7MzMdsb8V2ZIvAKsjhsijwmvIG4Lo4hRwcPZWaR5XnRPwq6fakqr5U+YdNMMdL1GqPaHKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aXyCi8R+CXoH51lMPO3f2w+6caOk5sKsX0Q/5eYStc=;
 b=TVaYsKtsqMp3mYCBFsbuAkWbipO8ekHdiJ5yl72UZ2Xchak2wVZn2+wcN7pOCZFK55sCKv3b1oLx264b1gxluzcMHXizucaebp+SHRCA3SzOLlr6gegdljT267JAIHY1rOLTiQLmuk7T9k3KcJ4ayN1DhXcqTRm4D5GNfQ7aJRMCFoPuwHGg6y1uJI4sGv/FS7L+Xbq92/0L5cgUvia9fEMwMbgpMTltkMjQdUHb62Pm96JiEV4qXgdkuqTuTKF3qNNskwLfFfFFOtEhQsfp6xDMl2O8vI2yGtFkrMSkWkSVXp3vfOXaFEevvo+NdQkZsJQiyMHE5ZNF6orKHcKmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] VT-d: avoid allocating domid_{bit,}map[] when possible
Thread-Topic: [PATCH v2] VT-d: avoid allocating domid_{bit,}map[] when
 possible
Thread-Index: AQHX6DJRnNj7O40AdkiiHonQeffDF6xBX7bQ
Date: Fri, 24 Dec 2021 07:30:14 +0000
Message-ID: <BN9PR11MB5276613FCCBD6C5ACF444EE38C7F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <7fadbc39-4760-1be8-fdda-455a1a321eff@suse.com>
In-Reply-To: <7fadbc39-4760-1be8-fdda-455a1a321eff@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddf21494-359b-40fa-96e0-08d9c6af3a62
x-ms-traffictypediagnostic: BN9PR11MB5355:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB535538472398595348069B768C7F9@BN9PR11MB5355.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqwYRHK2m0rab4XBeGfJsy7KRpd6v/HjVUyheOOOidRExcQzfZ98vZi5q5TuauQ7aXkmC+0v1QiMO0yayg+44s89RczydbvTPF7EDpWmCQy6OqBYxfqEUkmupdeV/ZUV5uRK21QyGd7V7ly37m/NpIMqfd9aYkiQDRkDZx3bsOZ6zzbUoizv/nn6+XUmnqBocYIYg76wbOfPEi04augrAgwVFJpgVlfoBS6dxGBMfPs2Mx+wS1vJgzvLUDq9cALyV7gBRH7aaFJOQBWIsmYKZSa7rWTiqiJGwKohOor1qFW3/eqNgDiew27v4RUDn2USt0CL1KKnkvm7VlXwASIf2eFxk/ww/zg3WMziJyDrZPBREEghbfw34He3mLp/qu1NDtP8R5GhM02XcGq1vTmkZoiRvRIfISR7asbZH9VcyeZ7eGPskf8tXNH8tQkmtzEzLb+2qqPth0fhhuLqSnZ9nwN1rhlNXAmElhnKT888kaIolc9+H0+4iD1r+6d6HFixaTWqJWlnHs6dciCfKQbFe+y23Ok/f7PzsxTajaQzXKT5FEM88QeEvi7sWAb6UBNunmraUA45Mnuef/UDJfHaKJIk2SJLnqZK7jxYkk6KzIVELESdiFPw/sKxKc9GRm40Rxz+F8r1z8sSN96zr2mBZWeL7KBRn5jf8aWJMR9unx8j5wUWQtFxwbJ4OUeae6Pg145UFGV6A1ZLFgeqbEi6Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(82960400001)(186003)(8676002)(66946007)(8936002)(9686003)(6506007)(26005)(38100700002)(33656002)(2906002)(66476007)(83380400001)(76116006)(64756008)(52536014)(110136005)(71200400001)(66446008)(5660300002)(316002)(508600001)(122000001)(38070700005)(86362001)(55016003)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTQ3R0R6UityeENZVHVCcTFhcmVFVi9DdUFIS0dmTXUxTFhZQnYwd3NRQWlY?=
 =?utf-8?B?WG5xMTlFcnUrOC83ejBncGhGWXNrcndMcFYrRTRFOXphWFNLcGVkRzlkNlhI?=
 =?utf-8?B?ZmZmdEFjaVQ4amtPZWhveGpqTHVVVFRLdFRPYmRURlZMN2M2aXdGcWRuQ21p?=
 =?utf-8?B?QWRNUFFRREp4My9GVFc5ZXFHYkJJRmNOeFJZS3JVdXVFL0xuNVAycEVFZElk?=
 =?utf-8?B?YVFTM1ZnNHhMSG4wUmdKOVRIYnJIblcvT2N3Z3FHaGF2QlNTM1l3NlhMd0xF?=
 =?utf-8?B?SmxnM3czd2g4WkVKMDBySDc0MUdIaDAzeXRiOFFVanlQY1h4Lzk5VmJ2VzZC?=
 =?utf-8?B?cnFUMzlOU3Rtbm1oRllxL1Y0ZldBcDd1QnVMdVlMRUJDZUZFMC9BRzNtWGh1?=
 =?utf-8?B?T0FLVmlDd0dUOVhWRElnYU9sa0N6b1QwM29FWWZCNUxnSVZrVzNwSno4amY1?=
 =?utf-8?B?MUpiSGVBNkMzMVAwSElxVU1tZzNjQm55MWVrbU5TSnhrRk1lbEYrdk55MENG?=
 =?utf-8?B?M0lMcllNaDk2SW1GMTM1SmNKdGNrRFBsVEZzTldsRUt3T0NFMHUyQ2JoMnYw?=
 =?utf-8?B?dGs3b3NYWVdZVG4yTW9RSmFjNkpBY1VQWnRQRnNFa2lXeDdmK0cvQUVtQi96?=
 =?utf-8?B?ZVFsMWpHOWpYMjVtZmYrRXhBZlZINHhhUEJ5VlJZQTdZRndxYTVWSUM4VjRI?=
 =?utf-8?B?eWNzdm05aHVpc3lqY1NUTHA0QWp6d0dXRzF6bFA2NGJGaGlJZ2pTRThFbm9i?=
 =?utf-8?B?dDFJUkNaTnl3YkFyME95cjNhQnpzYlUrbTF5WmlFR3d6NGV1VHExMThINjc0?=
 =?utf-8?B?Vks3U3lNc3REck8rOThob0ZxUytDbzJhTjdMSGtyckc4a1FldlorSkFNNml5?=
 =?utf-8?B?QStsZTZuUTRWZEovKy9pMmtkUVdvOFlXZWxOekZpWHJzWXF5eVAwbzROa1lF?=
 =?utf-8?B?RFBMY1djOHFmczNFTHcyWUUzbnhmMEpQUWg5QTZaeDI4dWhiRFlDYWRHWUNE?=
 =?utf-8?B?ODdDdXBCY0k2NTdaenhmOUtYcmpxcjJqRWc1UGUyMGd3NTNqYnZOQWJZbFJP?=
 =?utf-8?B?L1IwMDRCRTBDak12ZGVsUE1IUE10UE9wZXdRdCsrZTZzTHVic2QxSDl4eXJS?=
 =?utf-8?B?T09rWjJaWEhnQXpaQWt3eFRuYzdsRXhka3Y2RzVFQ1hZWklkZys3Y3lrY1p4?=
 =?utf-8?B?SGkvZWpyeGcvZC9Qa2hLWnRzWmhOVmFVdFVpb010dGtMVVdiRVp5Y3o1YlJB?=
 =?utf-8?B?V01ZZnE4Tm1rL3l5dmxsZ1VkU1kxQVFVSXZNR0d0NTl4S3lTbkZ0MjJUajI5?=
 =?utf-8?B?Q09QR1ZoZXpFend3aTNqTllpVTg1VWkxT1dDTld5emNqeG5LL05BTkNSNUdN?=
 =?utf-8?B?TzlBY3hXaDhjUXppZGJmK0RIUjlDYS9GakpQZEY2ZTg2RzJ5dW5SbXZxejl4?=
 =?utf-8?B?aUtxVE5YT0JTZkhmcmJoU0lsQzhzazFlNUlZd0tiT1BoZzNLUzRXSnNaUVFh?=
 =?utf-8?B?TDV4Mm5UbWR1Rnh4VmxGWml4MldLMm56UU9oVm90a3FXaFFDM0ZFS2xDUjA3?=
 =?utf-8?B?R3QzdTAxMXpDZytENnR2ZnpndnpyUE1oaGtmTGozUVVLZ3hnVHlkenNxNkdv?=
 =?utf-8?B?bFhhZm82RjRFTEp6UkxDRmNtY3N1QlNNNDhRSDlwbEFVaUVIWjR2djUxVEtX?=
 =?utf-8?B?Mnl1Q1FFU1krV2orYjREa2R5TndLbWZ6RzQ2U3J3QXl6aWlnS0hZL1ZiNmtm?=
 =?utf-8?B?Z2t6NFQrZlZJZzZsbXhOZDR2M09PM0E3RGIyaitHb1M4SW5WdVNJNVUxbDFQ?=
 =?utf-8?B?ayt5NU9GRUI2S1JLeVdxWGd4bEY4bGxyblU4eDh1amRJVXlYbEUxZWJOMS9i?=
 =?utf-8?B?MWhSL3o1cmpsSG1XdkJZRWlSbElmblJvWlVQTGVBZCtWNnRlaHZJckJOUUJB?=
 =?utf-8?B?RzBjTjlRSXB2NlJGN0VpcjNPWU5PMFFLNFpvajZsS1NiSGxYanBoUi9Hb3Nx?=
 =?utf-8?B?cFErQzAzN0I4NkhlamFpc1AxNVl5d3A3UWtqTXQrazR1RExnREVGU01BNm4x?=
 =?utf-8?B?VCtYQUJhUVVsSGdoZTQwa3RHaUdWY2hFdDMwOHVIODhhSDI5RDE2am15M29S?=
 =?utf-8?B?eEt4T2hWamNCSitLbFFqbEVMNzRtUjNpWjBNenJVQVhTK01ROFFnSm9lb05U?=
 =?utf-8?Q?35TNEFO6cbHrADnJ6cDLjkA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf21494-359b-40fa-96e0-08d9c6af3a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 07:30:14.9099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+RtSEPn5YA/me8xB/NaEVuYmw6oqeBCkBYi5o1+SQeiCdQmP5VVwrB7V8pvxDUVQzaDylhfN3XfwCZo4sUKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5355
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMywgMjAyMSA2OjQxIFBNDQo+IA0KPiBXaGVuIGFuIElPTU1VIGltcGxlbWVudHMg
dGhlIGZ1bGwgMTYgYml0cyB3b3J0aCBvZiBESUQgaW4gY29udGV4dA0KPiBlbnRyaWVzLCB0aGVy
ZSdzIG5vIHBvaW50IGdvaW5nIHRocm91Z2ggYSBtZW1vcnkgYmFzZSB0cmFuc2xhdGlvbiB0YWJs
ZS4NCj4gRm9yIElPTU1VcyBub3QgdXNpbmcgQ2FjaGluZyBNb2RlIHdlIGNhbiBzaW1wbHkgdXNl
IHRoZSBkb21haW4gSURzDQo+IHZlcmJhdGltLCB3aGlsZSBmb3IgQ2FjaGluZyBNb2RlIHdlIG5l
ZWQgdG8gYXZvaWQgRElEIDAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCg0KPiAtLS0NCj4gRm9yIHRoZSBjYXNlIHdoZXJlIHRoZSBtZW1vcnkgdGFibGVz
IGFyZSBuZWVkZWQsIHh2emFsbG9jX2FycmF5KCkgd291bGQNCj4gb2YgY291cnNlIGJlIGFuIG9w
dGlvbiB0byB1c2UgaGVyZSBhcyB3ZWxsLCBkZXNwaXRlIHRoaXMgYmVpbmcgYm9vdCB0aW1lDQo+
IGFsbG9jYXRpb25zLiBZZXQgdGhlIGludHJvZHVjdGlvbiBvZiB4dm1hbGxvYygpIGV0IGFsIGNv
bnRpbnVlcyB0byBiZQ0KPiBzdHVjayAuLi4NCj4gLS0tDQo+IHYyOiBVc2UgZGlmZmVyZW50IEJV
SUxEX0JVR19PTigpLg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lv
bW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAg
LTYyLDExICs2MiwzMiBAQCBzdGF0aWMgc3RydWN0IHRhc2tsZXQgdnRkX2ZhdWx0X3Rhc2tsZXQ7
DQo+ICBzdGF0aWMgaW50IHNldHVwX2h3ZG9tX2RldmljZSh1OCBkZXZmbiwgc3RydWN0IHBjaV9k
ZXYgKik7DQo+ICBzdGF0aWMgdm9pZCBzZXR1cF9od2RvbV9ybXJyKHN0cnVjdCBkb21haW4gKmQp
Ow0KPiANCj4gK3N0YXRpYyBib29sIGRvbWlkX21hcHBpbmcoY29uc3Qgc3RydWN0IHZ0ZF9pb21t
dSAqaW9tbXUpDQo+ICt7DQo+ICsgICAgcmV0dXJuIChjb25zdCB2b2lkICopaW9tbXUtPmRvbWlk
X2JpdG1hcCAhPSAoY29uc3Qgdm9pZCAqKWlvbW11LQ0KPiA+ZG9taWRfbWFwOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgZG9taWRfdCBjb252ZXJ0X2RvbWlkKGNvbnN0IHN0cnVjdCB2dGRfaW9tbXUg
KmlvbW11LCBkb21pZF90DQo+IGRvbWlkKQ0KPiArew0KPiArICAgIC8qDQo+ICsgICAgICogV2hp
bGUgd2UgbmVlZCB0byBhdm9pZCBESUQgMCBmb3IgY2FjaGluZy1tb2RlIElPTU1VcywgbWFpbnRh
aW4NCj4gKyAgICAgKiB0aGUgcHJvcGVydHkgb2YgdGhlIHRyYW5zZm9ybWF0aW9uIGJlaW5nIHRo
ZSBzYW1lIGluIGVpdGhlcg0KPiArICAgICAqIGRpcmVjdGlvbi4gQnkgY2xpcHBpbmcgdG8gMTYg
Yml0cyB3ZSBlbnN1cmUgdGhhdCB0aGUgcmVzdWx0aW5nDQo+ICsgICAgICogRElEIHdpbGwgZml0
IGluIHRoZSByZXNwZWN0aXZlIGNvbnRleHQgZW50cnkgZmllbGQuDQo+ICsgICAgICovDQo+ICsg
ICAgQlVJTERfQlVHX09OKERPTUlEX01BU0sgPj0gMHhmZmZmKTsNCj4gKw0KPiArICAgIHJldHVy
biAhY2FwX2NhY2hpbmdfbW9kZShpb21tdS0+Y2FwKSA/IGRvbWlkIDogfmRvbWlkOw0KPiArfQ0K
PiArDQo+ICBzdGF0aWMgaW50IGRvbWFpbl9pb21tdV9kb21pZChjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZ0ZF9p
b21tdSAqaW9tbXUpDQo+ICB7DQo+ICAgICAgdW5zaWduZWQgaW50IG5yX2RvbSwgaTsNCj4gDQo+
ICsgICAgaWYgKCAhZG9taWRfbWFwcGluZyhpb21tdSkgKQ0KPiArICAgICAgICByZXR1cm4gY29u
dmVydF9kb21pZChpb21tdSwgZC0+ZG9tYWluX2lkKTsNCj4gKw0KPiAgICAgIG5yX2RvbSA9IGNh
cF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4gICAgICBpID0gZmluZF9maXJzdF9iaXQoaW9tbXUtPmRv
bWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4gICAgICB3aGlsZSAoIGkgPCBucl9kb20gKQ0KPiBAQCAt
OTEsMjYgKzExMiwzMiBAQCBzdGF0aWMgaW50IGNvbnRleHRfc2V0X2RvbWFpbl9pZChzdHJ1Y3QN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnRkX2lvbW11
ICppb21tdSkNCj4gIHsNCj4gLSAgICB1bnNpZ25lZCBpbnQgbnJfZG9tLCBpOw0KPiArICAgIHVu
c2lnbmVkIGludCBpOw0KPiANCj4gICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJmlvbW11LT5s
b2NrKSk7DQo+IA0KPiAtICAgIG5yX2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4gLSAg
ICBpID0gZmluZF9maXJzdF9iaXQoaW9tbXUtPmRvbWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4gLSAg
ICB3aGlsZSAoIGkgPCBucl9kb20gJiYgaW9tbXUtPmRvbWlkX21hcFtpXSAhPSBkLT5kb21haW5f
aWQgKQ0KPiAtICAgICAgICBpID0gZmluZF9uZXh0X2JpdChpb21tdS0+ZG9taWRfYml0bWFwLCBu
cl9kb20sIGkgKyAxKTsNCj4gLQ0KPiAtICAgIGlmICggaSA+PSBucl9kb20gKQ0KPiArICAgIGlm
ICggZG9taWRfbWFwcGluZyhpb21tdSkgKQ0KPiAgICAgIHsNCj4gLSAgICAgICAgaSA9IGZpbmRf
Zmlyc3RfemVyb19iaXQoaW9tbXUtPmRvbWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4gKyAgICAgICAg
dW5zaWduZWQgaW50IG5yX2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4gKw0KPiArICAg
ICAgICBpID0gZmluZF9maXJzdF9iaXQoaW9tbXUtPmRvbWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4g
KyAgICAgICAgd2hpbGUgKCBpIDwgbnJfZG9tICYmIGlvbW11LT5kb21pZF9tYXBbaV0gIT0gZC0+
ZG9tYWluX2lkICkNCj4gKyAgICAgICAgICAgIGkgPSBmaW5kX25leHRfYml0KGlvbW11LT5kb21p
ZF9iaXRtYXAsIG5yX2RvbSwgaSArIDEpOw0KPiArDQo+ICAgICAgICAgIGlmICggaSA+PSBucl9k
b20gKQ0KPiAgICAgICAgICB7DQo+IC0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIgVlRE
UFJFRklYLCAiSU9NTVU6IG5vIGZyZWUgZG9tYWluIGlkc1xuIik7DQo+IC0gICAgICAgICAgICBy
ZXR1cm4gLUVCVVNZOw0KPiArICAgICAgICAgICAgaSA9IGZpbmRfZmlyc3RfemVyb19iaXQoaW9t
bXUtPmRvbWlkX2JpdG1hcCwgbnJfZG9tKTsNCj4gKyAgICAgICAgICAgIGlmICggaSA+PSBucl9k
b20gKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X0VSUiBWVERQUkVGSVgsICJJT01NVTogbm8gZnJlZSBkb21haW4gaWRcbiIpOw0KPiArICAgICAg
ICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgICAg
ICBpb21tdS0+ZG9taWRfbWFwW2ldID0gZC0+ZG9tYWluX2lkOw0KPiArICAgICAgICAgICAgc2V0
X2JpdChpLCBpb21tdS0+ZG9taWRfYml0bWFwKTsNCj4gICAgICAgICAgfQ0KPiAtICAgICAgICBp
b21tdS0+ZG9taWRfbWFwW2ldID0gZC0+ZG9tYWluX2lkOw0KPiAtICAgICAgICBzZXRfYml0KGks
IGlvbW11LT5kb21pZF9iaXRtYXApOw0KPiAgICAgIH0NCj4gKyAgICBlbHNlDQo+ICsgICAgICAg
IGkgPSBjb252ZXJ0X2RvbWlkKGlvbW11LCBkLT5kb21haW5faWQpOw0KPiANCj4gICAgICBjb250
ZXh0LT5oaSB8PSAoaSAmICgoMSA8PCBESURfRklFTERfV0lEVEgpIC0gMSkpIDw8IERJRF9ISUdI
X09GRlNFVDsNCj4gICAgICByZXR1cm4gMDsNCj4gQEAgLTE0MCw3ICsxNjcsMTIgQEAgc3RhdGlj
IGludCBjb250ZXh0X2dldF9kb21haW5faWQoY29uc3Qgcw0KPiANCj4gIHN0YXRpYyB2b2lkIGNs
ZWFudXBfZG9taWRfbWFwKHN0cnVjdCBkb21haW4gKmRvbWFpbiwgc3RydWN0IHZ0ZF9pb21tdQ0K
PiAqaW9tbXUpDQo+ICB7DQo+IC0gICAgaW50IGlvbW11X2RvbWlkID0gZG9tYWluX2lvbW11X2Rv
bWlkKGRvbWFpbiwgaW9tbXUpOw0KPiArICAgIGludCBpb21tdV9kb21pZDsNCj4gKw0KPiArICAg
IGlmICggIWRvbWlkX21hcHBpbmcoaW9tbXUpICkNCj4gKyAgICAgICAgcmV0dXJuOw0KPiArDQo+
ICsgICAgaW9tbXVfZG9taWQgPSBkb21haW5faW9tbXVfZG9taWQoZG9tYWluLCBpb21tdSk7DQo+
IA0KPiAgICAgIGlmICggaW9tbXVfZG9taWQgPj0gMCApDQo+ICAgICAgew0KPiBAQCAtMTk2LDcg
KzIyOCwxMyBAQCBzdGF0aWMgdm9pZCBjaGVja19jbGVhbnVwX2RvbWlkX21hcChzdHJ1DQo+IA0K
PiAgZG9taWRfdCBkaWRfdG9fZG9tYWluX2lkKGNvbnN0IHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11
LCB1bnNpZ25lZCBpbnQNCj4gZGlkKQ0KPiAgew0KPiAtICAgIGlmICggZGlkID49IGNhcF9uZG9t
cyhpb21tdS0+Y2FwKSB8fCAhdGVzdF9iaXQoZGlkLCBpb21tdS0NCj4gPmRvbWlkX2JpdG1hcCkg
KQ0KPiArICAgIGlmICggZGlkID49IG1pbihjYXBfbmRvbXMoaW9tbXUtPmNhcCksIERPTUlEX01B
U0sgKyAxKSApDQo+ICsgICAgICAgIHJldHVybiBET01JRF9JTlZBTElEOw0KPiArDQo+ICsgICAg
aWYgKCAhZG9taWRfbWFwcGluZyhpb21tdSkgKQ0KPiArICAgICAgICByZXR1cm4gY29udmVydF9k
b21pZChpb21tdSwgZGlkKTsNCj4gKw0KPiArICAgIGlmICggIXRlc3RfYml0KGRpZCwgaW9tbXUt
PmRvbWlkX2JpdG1hcCkgKQ0KPiAgICAgICAgICByZXR1cm4gRE9NSURfSU5WQUxJRDsNCj4gDQo+
ICAgICAgcmV0dXJuIGlvbW11LT5kb21pZF9tYXBbZGlkXTsNCj4gQEAgLTEyOTcsMjQgKzEzMzUs
MzIgQEAgaW50IF9faW5pdCBpb21tdV9hbGxvYyhzdHJ1Y3QgYWNwaV9kcmhkXw0KPiAgICAgIGlm
ICggIWVjYXBfY29oZXJlbnQoaW9tbXUtPmVjYXApICkNCj4gICAgICAgICAgdnRkX29wcy5zeW5j
X2NhY2hlID0gc3luY19jYWNoZTsNCj4gDQo+IC0gICAgLyogYWxsb2NhdGUgZG9tYWluIGlkIGJp
dG1hcCAqLw0KPiAgICAgIG5yX2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4gLSAgICBp
b21tdS0+ZG9taWRfYml0bWFwID0geHphbGxvY19hcnJheSh1bnNpZ25lZCBsb25nLA0KPiBCSVRT
X1RPX0xPTkdTKG5yX2RvbSkpOw0KPiAtICAgIGlmICggIWlvbW11LT5kb21pZF9iaXRtYXAgKQ0K
PiAtICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IC0gICAgaW9tbXUtPmRvbWlkX21hcCA9
IHh6YWxsb2NfYXJyYXkoZG9taWRfdCwgbnJfZG9tKTsNCj4gLSAgICBpZiAoICFpb21tdS0+ZG9t
aWRfbWFwICkNCj4gLSAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsgICAgaWYgKCBucl9kb20g
PD0gRE9NSURfTUFTSyArIGNhcF9jYWNoaW5nX21vZGUoaW9tbXUtPmNhcCkgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgLyogQWxsb2NhdGUgZG9tYWluIGlkIChiaXQpIG1hcHMuICovDQo+ICsgICAg
ICAgIGlvbW11LT5kb21pZF9iaXRtYXAgPSB4emFsbG9jX2FycmF5KHVuc2lnbmVkIGxvbmcsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVFNfVE9fTE9O
R1MobnJfZG9tKSk7DQo+ICsgICAgICAgIGlvbW11LT5kb21pZF9tYXAgPSB4emFsbG9jX2FycmF5
KGRvbWlkX3QsIG5yX2RvbSk7DQo+ICsgICAgICAgIGlmICggIWlvbW11LT5kb21pZF9iaXRtYXAg
fHwgIWlvbW11LT5kb21pZF9tYXAgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
IA0KPiAtICAgIC8qDQo+IC0gICAgICogSWYgQ2FjaGluZyBtb2RlIGlzIHNldCwgdGhlbiBpbnZh
bGlkIHRyYW5zbGF0aW9ucyBhcmUgdGFnZ2VkIHdpdGgNCj4gLSAgICAgKiBkb21haW4gaWQgMC4g
SGVuY2UgcmVzZXJ2ZSBiaXQvc2xvdCAwLg0KPiAtICAgICAqLw0KPiAtICAgIGlmICggY2FwX2Nh
Y2hpbmdfbW9kZShpb21tdS0+Y2FwKSApDQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIElm
IENhY2hpbmcgbW9kZSBpcyBzZXQsIHRoZW4gaW52YWxpZCB0cmFuc2xhdGlvbnMgYXJlIHRhZ2dl
ZA0KPiArICAgICAgICAgKiB3aXRoIGRvbWFpbiBpZCAwLiBIZW5jZSByZXNlcnZlIGJpdC9zbG90
IDAuDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgICBpZiAoIGNhcF9jYWNoaW5nX21vZGUoaW9t
bXUtPmNhcCkgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBpb21tdS0+ZG9taWRfbWFw
WzBdID0gRE9NSURfSU5WQUxJRDsNCj4gKyAgICAgICAgICAgIF9fc2V0X2JpdCgwLCBpb21tdS0+
ZG9taWRfYml0bWFwKTsNCj4gKyAgICAgICAgfQ0KPiArICAgIH0NCj4gKyAgICBlbHNlDQo+ICAg
ICAgew0KPiAtICAgICAgICBpb21tdS0+ZG9taWRfbWFwWzBdID0gRE9NSURfSU5WQUxJRDsNCj4g
LSAgICAgICAgX19zZXRfYml0KDAsIGlvbW11LT5kb21pZF9iaXRtYXApOw0KPiArICAgICAgICAv
KiBEb24ndCBsZWF2ZSBkYW5nbGluZyBOVUxMIHBvaW50ZXJzLiAqLw0KPiArICAgICAgICBpb21t
dS0+ZG9taWRfYml0bWFwID0gWkVST19CTE9DS19QVFI7DQo+ICsgICAgICAgIGlvbW11LT5kb21p
ZF9tYXAgPSBaRVJPX0JMT0NLX1BUUjsNCj4gICAgICB9DQo+IA0KPiAgICAgIHJldHVybiAwOw0K
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiBAQCAtODIsNyArODIsNyBAQA0KPiAg
I2RlZmluZSBjYXBfcGxtcihjKSAgICAgICAgKCgoYykgPj4gNSkgJiAxKQ0KPiAgI2RlZmluZSBj
YXBfcndiZihjKSAgICAgICAgKCgoYykgPj4gNCkgJiAxKQ0KPiAgI2RlZmluZSBjYXBfYWZsKGMp
ICAgICAgICAoKChjKSA+PiAzKSAmIDEpDQo+IC0jZGVmaW5lIGNhcF9uZG9tcyhjKSAgICAgICAg
KDEgPDwgKDQgKyAyICogKChjKSAmIDB4NykpKQ0KPiArI2RlZmluZSBjYXBfbmRvbXMoYykgICAg
ICAgICgxVSA8PCAoNCArIDIgKiAoKGMpICYgMHg3KSkpDQo+IA0KPiAgLyoNCj4gICAqIEV4dGVu
ZGVkIENhcGFiaWxpdHkgUmVnaXN0ZXINCg0K


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F44666882
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 02:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475787.737626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFmYl-0001gV-Dz; Thu, 12 Jan 2023 01:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475787.737626; Thu, 12 Jan 2023 01:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFmYl-0001eM-B8; Thu, 12 Jan 2023 01:39:15 +0000
Received: by outflank-mailman (input) for mailman id 475787;
 Thu, 12 Jan 2023 01:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pFmYj-0001eG-Cz
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 01:39:13 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8d48d36-9219-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 02:39:11 +0100 (CET)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 17:39:08 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 17:39:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 17:39:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 17:39:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 17:39:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 17:39:07 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:39:05 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 01:39:05 +0000
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
X-Inumbo-ID: e8d48d36-9219-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673487551; x=1705023551;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OaWAnVeP0JWOVMEzqs0hGmjrGi1n6DfEAZ3Zh7ndx00=;
  b=gV4uYvsFkyNpQ98UbMYbZpwDtWhXOsjEiFmAY2wcZ3xP++Fci3U8ryxd
   q3dLJ1xRnsB+kkY6SQjhR4qC+rItum2X2a0AKibEBncBwKDOpA3HTsufk
   3UCqlFL3tQBuc6QKZL4Wroc1G8PANMbqI7GbfwscfSAIjQsyvxdD5tkrJ
   JdnXLwZ5J9SjkzCKrLx2ZYaC1fqdyK330/l1PrNifh3OHCRge1np67R6B
   F13sF2kxSHB9H+AnbjW+aAVoDhqD8xearbaoSEC9Ypi8li7NcoDZpsHDu
   +048JeD+iaf6RNSCTXsQcL5G3X1IzfmTG64rZ3mlZGVoBZkuzkpPXKPnO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311407704"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="311407704"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635194790"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="635194790"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCJxHNuT55VyAf84qkzjRi65dZeqdekhSE7xqJyAc1bbyWhImtoGe6P6sNXUB4oasYKzgDlBWO2QpgRbm4KHlZdcVI8T4qrxMui+9po2oFu/+zKgD4qqfAWxY8vGkEzzTor2+I5CCHchsFbMtrfw6Yv6c3b0PoSbXNTGEVuuvv4qK2nu70PEykodH4R3aUcUDccnVuUgvG4qYs6LKYNj9Gnf0Iw0c1om2BWc2veFPGrEbw35vKoVSf/yP0jZI5Sv2RRsmiVqGvkfbpjgxxlVdHFTyKCNK9es3cTozCES+5Dmh+eT/omkO1m9XN9BeND+Z2TuGVdGd2dGO/wL0zUNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaWAnVeP0JWOVMEzqs0hGmjrGi1n6DfEAZ3Zh7ndx00=;
 b=LBJXJTesMj5ZOrlIUj+4D0mVwckRTvh6mW22pLgGqoheo88lgFG36Scf85kRWW/1HsDrIev3a1sKukslZLSuVw0LxzEugfzkaPzvb843fFJr46Gutvwp+O4qTBNOBdPtsU/zJfoMyt+Ni5dgfLdkrN2Or0ztap7/+AEi7Odz2TPHEHJNAhhe4Nr4QKEflBJru9zxcm599udmVaQ9nr91nsoSUs89Y6iHcje9xGWZTaMgOOx8jUPjvxi9l5BFCkksesba0ooI4034ELZhdxg7zL6vqeu+0WBBnwr20JMmRVSz4CybSZw/T0FD27zecS1KiBmwHS7kNB12bKjVXbKvDQ==
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
Subject: RE: [PATCH 2/2] x86/vmx: Support for CPUs without model-specific LBR
Thread-Topic: [PATCH 2/2] x86/vmx: Support for CPUs without model-specific LBR
Thread-Index: AQHZJCMek6T83CtFrkaQg0ivmixH/a6aBOsw
Date: Thu, 12 Jan 2023 01:39:05 +0000
Message-ID: <BN9PR11MB5276D030EF1671A7509E84098CFD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
 <20230109120828.344-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230109120828.344-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW5PR11MB5930:EE_
x-ms-office365-filtering-correlation-id: 1b7dbf7e-00e3-4daa-75dd-08daf43dca8e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UYkibS0dum70SHkVJNKaQ6Oo5MqTdfjizuC4mUOxKvuicGMXJjxa6j+xQBlklABVfTD1DTliykQXD/4DTAMOH6G9FhL6MVmS+LOQRg9iFjFhPmEQKs1ilQ7LRjhkBWd7c6chzkxzpJ7yhQnToqayInmsSmr2OJ4Ki+6yEj1UhrH5ifHX/90EKT/rxRlHLUL0TVoLf9EM4NhdBC2xurYKW3IhU1IGGEpk7EJKJtEy9AA8njSF3NqPoER9wshq/9pXIGBIWSXCDnBCOOjbs3G+BzVY8Zfi52HY5RmmNv9PeCom0SSjHRQHDzqpNHHRaPY8p+gwxPcs/Dte/8lt+l9omW0UciFk0tIIwBqJSsISoUlsrKlR/LPrqoYDhp7/LnVX64Qx3wYkvHKKkX1Z01rk/ESNyeRzC3I3Bgdjtxym4VW4Fi/NuN/ERo+DBGuKUEqdbTSl9/jI09r3EG6eEkStqzK/kvpnm883MB9Uls73L448yBJsDlOvqfzjXvVNtpKMFX7t7yZPFzIErpeX6+I4PW66DdJx6CCf06kWfPAFr7M2QWf1sEjo+KB7LCs0PBuICZTu1Pep7CvYpeY4wnL6rz3UKy4KC3d7KeBZ6mS78+MuD2PQJSIFWyiIWYHuTcZJG5DE+5uDj/vahX2fcqtWr2RdfmzQIRdxFTcx49FH4vhUeTido4f/48eTSA83+MBI+UkPVJDkXyVNNQiBoVYqig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(41300700001)(4326008)(110136005)(66446008)(8676002)(55016003)(76116006)(66946007)(66556008)(66476007)(64756008)(54906003)(316002)(86362001)(38070700005)(8936002)(5660300002)(82960400001)(38100700002)(122000001)(33656002)(4744005)(52536014)(2906002)(6506007)(71200400001)(478600001)(9686003)(186003)(26005)(107886003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE11Z1hLUitMbFpBc2xMZmJHeDdibUJkd3JBdUhia1A0QnRSQlk1NTUvbkJQ?=
 =?utf-8?B?TndVanJST1UzYzluZE04UGFjaTVwaUZvdUkwR3lyNzBXTnFieVBlVkxMMllG?=
 =?utf-8?B?Z0hReTRBOC9sVXpJalB3UFJSaW5FbTdlczFLbTVBZWgxcHo3ZFFGdXRscEdS?=
 =?utf-8?B?UDlOd2E1bnNvLzFDZ25Mc2taTkdUNVdLZWJXNXlIRldhSXlpa0pQRVJxcU9J?=
 =?utf-8?B?NDdzNDdaYnRpTlVCNXVJNDJOc0JpdGZZL2NOWFZsZ0FNaEJPNExtaDF3Skp0?=
 =?utf-8?B?NzV5dy8wbXpRSjQwNlkrN01seGFJcWZ6Nzk4SGhIcWdyQ3lackI4TmR0d2hU?=
 =?utf-8?B?VXNxVnZIRUVLekZ1UFpqRUhaV0lqaS9LY2wvdk55WE03SnhJU0dYS1FxVVIw?=
 =?utf-8?B?ZjgwU1JRbFlndGFFUDl4eVh0VStpSVQ5dS82bE4xTDJnTUN1Vk81bW5ueFpL?=
 =?utf-8?B?OXdaY3d2QWpPQlo5eHBSNDZUVE45NTFFdTBBS1FkNUpxbXl5RnY1MzlYd3BZ?=
 =?utf-8?B?bkYrZ1g1L3BmV0UydkFXUW44NkJUZ0x0TDNsMlY3dk55UkJxRGt1VTJ6NHlh?=
 =?utf-8?B?RE9Eek9oTitKVmMwUmg2amFrWEJuSi9FUHZWaGhjQVBtVkM0NEhzUm1OZzEy?=
 =?utf-8?B?Zmc1OFlNNHk4Yk02dTkzQW5iOHdON0NxR1VnUG92eEV2MjZrOENCK0NJMGs2?=
 =?utf-8?B?MnB4Zm1wblhFZEo5ZEYrWGxPWkxkOWFXYjk0WkJjNkFhREJ6NDdvcWM3OEhP?=
 =?utf-8?B?dHE5OUNTYTJkZk5LUy9SakJTWFUrTlU2OTRsdVRSMjZ1RC8zb3ExcVhFUnJi?=
 =?utf-8?B?QUhQai9SOWRJSHlxbndmK25aQ0xRbkF2RjVvMzBjSnZIVGs4TkVubStlYnhs?=
 =?utf-8?B?QlZ1R1FveWJLdnA1S1R4UDRBblUwYW9WUXk2ZDlyS2VBOEs5MmJIRHRGNGtS?=
 =?utf-8?B?UXVzMUhiMjYyeGFINHAyZGxUU0dnUUxMS3B2TUNCQVNERUxrcU9oaUNKbVV3?=
 =?utf-8?B?S0VlVmtCZXhvU2FnVHlGSjBlb2k4U092amVtOUxMUEQ0OTJLcmtkL05RNmc1?=
 =?utf-8?B?QjJVOUc0YndlYURJWmtpQjBhQWQwTU0wRzA2NjcrRWZmTVFKWlNvaVhnQ1My?=
 =?utf-8?B?bXdzeGhYSHpOSkhLejl4eXNaN2pLTU5kMyt2eXFKVEQ5MTZyVytzSzEzQno3?=
 =?utf-8?B?TWZPcHh3NEx6OWFyT2hCM3lPMUgxOHRjUTZlREtxR25na3gxVkwzTmRiWVhK?=
 =?utf-8?B?SFRVaWJwajU0MzdyNGJYeW1RZ0dsSFRCYk9Tdjk0cmN2RnF3d3EzK0xpcFE4?=
 =?utf-8?B?QytIUStJdEd5T1B0SExKYXVyQVJWcU4yeHdySFNaVlBnN2txNTkvb1NYUGxI?=
 =?utf-8?B?ODNsZEJuMFFEUEFxRm1JZHpjS2hPM1NlbnZXSmZ6S2M3cmVXYnoxTW01ZjNF?=
 =?utf-8?B?RlJuclZKZDRrQzYyN0ZVcDhFWFpBVkZ4WEcrSjAvNlpRcGNYRmFNdTA3Z3BR?=
 =?utf-8?B?bkllRmpCcFRLRUllcjRnS3BhV3NwSkt3cVA1SUZleFhrZy95K1dNYXpSdHlu?=
 =?utf-8?B?cWlHUk4wRGM2NkdHekJSQXErZFp1ZkdhU0FjVGZRSXBMSE5VQ3NEbk80aEZF?=
 =?utf-8?B?V3QyVkVYVVNuU25YbG4wN3psckpJTHN2OUFSRWxWWGRmK203NVhtTUllejVs?=
 =?utf-8?B?WTIzQkJ1cjNXMWdNd2FKbGFseTVwTFo5eDNuYWJyNGdWOW1helY3ZXVhTTJV?=
 =?utf-8?B?TzBDelJIdnJucFh6TTNsUzJFWmR6bjlKTm0xUlhsUlUzZUFPWkY5dEsyWjZH?=
 =?utf-8?B?elQrTHpiclJGZHF6bkF2bmxpaWFCakRDdWdXWlgwU3JiYy9BWjdxa0tjNHk0?=
 =?utf-8?B?eTVDM1hlM2lNL0FUQ2VDY01XN3ZBbHpBbFhvc1AyQkJhbEhpdWVtUjlGTTYw?=
 =?utf-8?B?Z2NIY09pS2cybEZTU2ZkaTByR1c1eE9NeWNYZExoaWNITUZ6TzROVkJYUjcx?=
 =?utf-8?B?YUxJVW5kUlZTRWJhS0o4RnVJL09KeHBiZjdhQXkwRnZxcGJhblBzaVJBWFor?=
 =?utf-8?B?MktWdm4wSzQrUUszZU1Kd01LV3FrQ2ZoaEw1c3BWUy9GejZwb1Rvd2pDMWN2?=
 =?utf-8?Q?0YSCO64E+LSwi7yj6RNe4/Zc5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7dbf7e-00e3-4daa-75dd-08daf43dca8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 01:39:05.4394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sW4mBx5ZfEf/jpuS48NFvgpBP4JH2K3Vo0SxZhylL9N2AI3zraZqHoXiLzra6n0l9q7ivAyrJBE04/otOcNqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBNb25kYXksIEphbnVhcnkgOSwgMjAyMyA4OjA4IFBNDQo+IA0KPiBJY2UgTGFrZSAoc2VydmVy
IGF0IGxlYXN0KSBoYXMgYm90aCBBcmNoIExCUiBhbmQgbW9kZWwtc3BlY2lmaWMgTEJSLiAgU2Fw
cGhpcmUNCj4gUmFwaWRzIGRvZXMgbm90IGhhdmUgbW9kZWwtc3BlY2lmaWMgTEJSIGF0IGFsbC4g
IEkuZS4gT24gU1BSIGFuZCBsYXRlciwNCj4gbW9kZWxfc3BlY2lmaWNfbGJyIHdpbGwgYWx3YXlz
IGJlIE5VTEwsIHNvIHdlIG11c3QgbWFrZSBjaGFuZ2VzIHRvIGF2b2lkDQo+IHJlbGlhYmx5IGhp
dHRpbmcgdGhlIGRvbWFpbl9jcmFzaCgpLg0KPiANCj4gVGhlIEFyY2ggTEJSIHNwZWMgc3RhdGVz
IHRoYXQgQ1BVcyB3aXRob3V0IG1vZGVsLXNwZWNpZmljIExCUiBpbXBsZW1lbnQNCj4gTVNSX0RC
R19DVEwuTEJSIGJ5IGRpc2NhcmRpbmcgd3JpdGVzIGFuZCBhbHdheXMgcmV0dXJuaW5nIDAuDQo+
IA0KPiBEbyB0aGlzIGZvciBhbnkgQ1BVIGZvciB3aGljaCB3ZSBsYWNrIG1vZGVsLXNwZWNpZmlj
IExCUiBpbmZvcm1hdGlvbi4NCj4gDQo+IEFkanVzdCB0aGUgbm93LXN0YWxlIGNvbW1lbnQsIG5v
dyB0aGF0IHRoZSBBcmNoIExCUiBzcGVjIGhhcyBjcmVhdGVkIGENCj4gd2F5IHRvDQo+IHNpZ25h
bCAibm8gbW9kZWwgc3BlY2lmaWMgTEJSIiB0byBndWVzdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A534673167
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 06:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480857.745446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pINqu-0004K9-CB; Thu, 19 Jan 2023 05:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480857.745446; Thu, 19 Jan 2023 05:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pINqu-0004IQ-96; Thu, 19 Jan 2023 05:52:44 +0000
Received: by outflank-mailman (input) for mailman id 480857;
 Thu, 19 Jan 2023 05:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkQ4=5Q=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pINqs-0004II-Q8
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 05:52:43 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 794c4139-97bd-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 06:52:37 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 21:52:34 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 21:52:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 21:52:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 21:52:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 21:52:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 21:52:33 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 05:52:31 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 05:52:31 +0000
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
X-Inumbo-ID: 794c4139-97bd-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674107558; x=1705643558;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZwDno251y8g8lhGGleJtDy9ezZ9G7WUk5vdbPaatc0I=;
  b=ndLLiyYQJ5kcqBv8hdeXBHi8Zhlb8aD3Ry8UkungfEfOvefqgQbXMZtE
   Qxcl0WbjuT0HKZJWZf9vJlAGOfbbk6ebA75fVdapopwW52wnA7YXLD54+
   N9f/wU3e0TA0HkBQcHPetB8WythyZcNIOCX5JqMtSB0OV9eT465TsjXLY
   j1djsym2d6R7987yJIdYWJPx56aQxsIEgEPImuJBLsUAAdLN/P90qYokH
   1SahxKyCl8eyQrinYlvbc79UVZdOY0YZLUV4s3wyHuCn7Y6ukrkuNVWv9
   d4vgLyAhe4Iyha+k9FYT8mJ6XDrzHEBSe+S37d9wVvi20xHbxZOn+PF6k
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327277195"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="327277195"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768065843"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="768065843"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNStlZxjzWnCRzSxgW5CqlVkpznHrO8o4V1n/kTpdMs9v8T0XlFbMivEWQZYqzuHcZesdFHPkA6IitGsbTIHbkj8JKRCHKpvvUbgns1oJhXxkYi/CKgJw6O/Xel8Aw3Ed4apmAxIL3ZsZAxvBKO4nPK6e1Ca44hS6FYZ6XXInAjK/lIeNwuExQwF4ec+dvjoTUBqXzkAmDBEXmQbe2RJcPJHIIc7zOTeZ+NWiMa2W3o8PR/lzEgjWh89hLsS2LIFlt/XfflnVq7VEO6qv2nqL01auxpvopwGUds4WzEqAkQuFrzeoh89Tce/1TLdlGARD4IBWcPrX1VOysFvWuci1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwDno251y8g8lhGGleJtDy9ezZ9G7WUk5vdbPaatc0I=;
 b=EC06eQBciWN0SaNgxUnE9QEOAZ+4ntGzpIJn5L8lpngZtxf1X9hTdxqjT7+vfBRRlj16NHW9UbszpYtMVwkTbsOKU8kCIUkp1Zrck7dTTdu0pdRgapbbz2BWDLgmmpP+Cc/6ELV/JVQmwYj3jv4w/BcFLYqOhwmQ9kDIiQeevUeoezq2U4bridL1P3kT8MZYs7AmU4n/vb7kkGxRo6Xwh4sJjD9WyHd5vzT/onnDy3xb1JijC5Q7D+3FJ/uWC8sXlUwm9RPmWuUn4pupsyMcX3k4lSOwWoawxsuNoy8OUtXe8WmwGsd8HsrjKPCY7Jco4zdOHasOCdSzION2xvU7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] x86/vmx: Partially revert "x86/vmx: implement Notify VM
 Exit"
Thread-Topic: [PATCH] x86/vmx: Partially revert "x86/vmx: implement Notify VM
 Exit"
Thread-Index: AQHZK3RJ/0ZZPj3GFkGObjjpGm11Tq6lPW7Q
Date: Thu, 19 Jan 2023 05:52:31 +0000
Message-ID: <BN9PR11MB5276655FFF1ED3E6EE513CB58CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230118193637.8907-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230118193637.8907-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB6076:EE_
x-ms-office365-filtering-correlation-id: 96936b7f-3732-46f8-96e5-08daf9e15aad
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HHdrZcyeuGWYlz1WXhvnu2/IFGbgNTul/Q2AmaThCgVQtkFhUQiKPXSZcp+KD3a0yiflIDWATz4gs62MYI5LEdwLhczSosgnKIMOVuTFzgTxND3GOs97hYZ6FNx5KPeFooqMbgM1KA6v2SIQkfHdGWyULbbFEIPIuLszqGDtA7GOUBw9EetZ/VlZhjWp0HM/KflCLCZjgBiaB7QVTzb23i2iM/HKRp0gO9AaZeAWKW+mga+9NZZRICtOZD1h07u+k4axB7WfS6Srz2bodbTEMjvZ6hKPfBwY7CX+GutSVz6R7/26/Ou2YSzI8AyhPNVB6rfRYP2aKmYVHoHiDIuifg9gcWBX529JY0zxZngr7C1ShXCqmcpYnYLz9LvRFwtrE8jMsIj9spxWVU5UsKWmtQdxxz7rjxyCWyheMQThCM/OsP8GyeUZxE6BzEVvxudFyzFokfqaePfhED/AnLpy/obv0R9bj4DERhlaGEo6uIhKzrCXzhB7X1WHxP7KLxoe8rwMwFsGDVyGxwesZLH8I2s5DLjAWL1yGMkE/CFwXfusl8HLMhWBKjrC/XYaDx29Fwr0ekgu3icXwz+ziLCbCMf2CiOy8HSf/7J1b33riMGi6rlobuQ+Ezzy6mRfxOSIjJP9AXM79gNUq1sT31n5ix5kj7So0unCugeqUjphyaeZkdrHx8dhl4qi/FCbMG3ndAUpeaTbFt2/ZGdgQc64mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(2906002)(26005)(66946007)(4326008)(33656002)(76116006)(66476007)(66446008)(64756008)(8676002)(41300700001)(66556008)(9686003)(186003)(6506007)(55016003)(83380400001)(110136005)(86362001)(122000001)(316002)(38070700005)(54906003)(71200400001)(38100700002)(7696005)(4744005)(8936002)(52536014)(82960400001)(5660300002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUlLZDVVd1UyUVdoekRjeUltL3dyV0tlbWNhb3ZwWDJKbXpqaXlWdERWQjh2?=
 =?utf-8?B?L3FoeUUrR08xRVU4dGVpdlBvYUozY3NMc3hSZHAxeUU3cjA4bHdRVldCNzNr?=
 =?utf-8?B?bDh1RjlZOWZZbFBTWEhjY1RJV1RZaDZEYWMzZ3pUNStnOUo2VXNoV1d1S2JO?=
 =?utf-8?B?Q2dyYkFNUjVpZGs2Q3paTDhTRS9NVXl1R3MwK0U3aThKNVhoUDdsWXhnY3Iy?=
 =?utf-8?B?N0x2bE4zRnFlTk1XMHBVc3NTTVBLeENqSHBTVzVwenR2dmEyZ3BzOHNVdmxB?=
 =?utf-8?B?emUvd2E0ZzllK2lhdHhBdjhJY2VQNEY3Y3VrT1JWaFVTUjZjUUtqZzBmRGo3?=
 =?utf-8?B?dkJEZDRnMGVPWjJoZ01Da2lsQi9TSklCRFp2RmVNaGRDR1VPNXZmV1lhU3BH?=
 =?utf-8?B?Sk5oZ1FKVE5FUFdaMVNiUitpT2FWQ0lMZkYyOEo2Y3FaNTNtSEQvWXlsM2hJ?=
 =?utf-8?B?SXRVNHVzZUlPc0I3N3kwU1ZYMUVjWFZpRHpoYlRKcVBwUk91SnQzcjI4OUZv?=
 =?utf-8?B?WGs1NmdPTDJveU9vS0ZSMVNrT0VmWEpCM0pkYVNJenZFMFhBWVFDR2tnL1Br?=
 =?utf-8?B?S3JNSjQva0JQWktrNG5YT2hyN2xhK2VlbVlTTDZzL0pPbHdsS085Wm9IRjVK?=
 =?utf-8?B?eUR2V3hubUpDNkhoM0pBZ2RnbFViUEVvTjNIUDhZR0Y2RU1ITVpva085Tk9P?=
 =?utf-8?B?cWcvVG9xR0d1TG05SFFRaDNYS1ZFYk1zMnFzMDVyVnBtcnhKYW1idDNUL1Bu?=
 =?utf-8?B?Z0RmYXRHcDB5eEJyb0gvYkg0QTg5ZTYyNkN4RGk0MEp4TUozOUVGTCtGa3Ux?=
 =?utf-8?B?U3ZlRGFEVVdjNEpaQUFsQ0djZjlrNFppeC93K2RzdEwreG1Tb28zdnVZZlFm?=
 =?utf-8?B?VDQzOFdqdmlIZ3VvVDR1R0Zoby9WbEdmV1V2dVlLWkhjRzhxUFp0RG9oK2lu?=
 =?utf-8?B?ZzhZTWJ0L21wNnBuT2FhUjY2VGRQNWpRSE5HWGFBYXl3dHlBT0dMQ3ZPbWN2?=
 =?utf-8?B?TXBqNURZemZERVFFY3pYcjJ0dVovV1BNYVBlS3ZQYXZ4d2R4OVJoVStySXhV?=
 =?utf-8?B?RzBrREI5S0FVcW13QnNKWWVGVGo2a2RvQ2ppY05WN0xwMTVCVVNablorWUpl?=
 =?utf-8?B?SHFHbzlVT2NKUFh5bkJjbXhGSC9lSlhBUzFjWFRjOC9ycEo3RGVlQWtRNnRh?=
 =?utf-8?B?b2xLZHU4eGpOWXMxaElNTUpDWVlkY252TlNRWVlSWEJPak9FeGhOK3JhNm94?=
 =?utf-8?B?ZTgvRmZ6RDZERVhlbzFRMFlDanRwWGF4eUhXVm93WnFJbHNwbVQyWHU4cnZO?=
 =?utf-8?B?clJYYktxcjlvM2xxZlJ6WHNtVlpyY0lJOCtlazVuL0xtY2dtL1hIZ0hsbGZ5?=
 =?utf-8?B?Z2gzbmN3czkzYSttdU1ObnA0cWJBNjFIWlY5OHBhY1N1MGZEeGcyNjVYbTdu?=
 =?utf-8?B?Lzl0VWdCd0NhM3BwcEtxRGMrQ3VYQ1JaaHlTMk5CUUdjUmx2TnJ4cEd5SDhw?=
 =?utf-8?B?a1F3aGFldk9Nc2ZrVWhhdFRtSXdwY0hNM1VpOHF0cUU1azRZRTJzMEoxRjk5?=
 =?utf-8?B?WkorUnBBeHZwM0RkN3NERFdYN2d0enJCYXd6NlFrU3pqWmo1dzMydEo3bndE?=
 =?utf-8?B?dTk0M0FJVDF6UEcrWHBTYWdndndmRzAzREc2bHJKUzc2YlBxWHVkYWZwM09M?=
 =?utf-8?B?TlpmYnQ1U3czdUJTcGxYT3BNSHllT3E5Ky9DLzJDTTNaTmkzazRtdjNsZlN5?=
 =?utf-8?B?QWp4U0tJL2xRQW44SDNMRUpmaTFCWWVpcTlYcGlESkd3UGVXS1pEZkptVnJw?=
 =?utf-8?B?UjJTQi9LS01QbnJVZ2xyT1M3aGVNbUVDMC9jbEZkVDkydDhwVStKWklQb1dj?=
 =?utf-8?B?T0psY3ZyclVQdFFyU241WlArbUhmdzl0YVA3YUVpVHZzdTZ4Qit5SHNjRkI0?=
 =?utf-8?B?bTBlRnZNYnRIWG1ZQUdIclYyYnR0Y2tISmZYZzBTZWZqa2lGWndaaG5DeElN?=
 =?utf-8?B?ZitFSkRpcGw3S1NPUmd1WHhiRmxCMERMaGNkWER3dmJvMVBvVlpYM3VyVGVS?=
 =?utf-8?B?UC9JbWRMYzhndStybUVlY2VWSEQ1VW0zUW5HaTZhMStoRjd5ck1CVUQxelo0?=
 =?utf-8?Q?H7ZTeeTZHSzvpLTjjqoEWPhAw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96936b7f-3732-46f8-96e5-08daf9e15aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 05:52:31.0473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGnSsLI4fHGA1j+nafhfGGni5+cu6yfCzPq/PiKaMT0zWJf971l5wQekzEgHVVj6N/OFGDwIxhjNcF81xp9X/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgSmFudWFyeSAxOSwgMjAyMyAzOjM3IEFNDQo+IA0KPiBUaGUgb3JpZ2luYWwg
cGF0Y2ggdHJpZWQgdG8gZG8gdHdvIHRoaW5ncyAtIGltcGxlbWVudCBWTU5vdGlmeSwgYW5kDQo+
IHJlLW9wdGltaXNlIFZULXggdG8gbm90IGludGVyY2VwdCAjREIvI0FDIGJ5IGRlZmF1bHQuDQo+
IA0KPiBUaGUgc2Vjb25kIHBhcnQgaXMgYnVnZ3kgaW4gbXVsdGlwbGUgd2F5cy4gIEJvdGggR0RC
U1ggYW5kIEludHJvc3BlY3Rpb24NCj4gbmVlZA0KPiB0byBjb25kaXRpb25hbGx5IGludGVyY2Vw
dCAjREIsIHdoaWNoIHdhcyBub3QgYWNjb3VudGVkIGZvci4gIEFsc28sICNEQg0KPiBpbnRlcmNl
cHRpb24gaGFzIG5vdGhpbmcgYXQgYWxsIHRvIGRvIHdpdGggY3B1X2hhc19tb25pdG9yX3RyYXBf
ZmxhZy4NCj4gDQo+IFJldmVydCB0aGUgc2Vjb25kIGhhbGYsIGxlYXZpbmcgI0RCLyNBQyBpbnRl
cmNlcHRlZCB1bmlsYXRlcmFsbHksIGJ1dCB3aXRoDQo+IFZNTm90aWZ5IGFjdGl2ZSBieSBkZWZh
dWx0IHdoZW4gYXZhaWxhYmxlLg0KPiANCj4gRml4ZXM6IDU3MzI3OWNkZTFjNCAoIng4Ni92bXg6
IGltcGxlbWVudCBOb3RpZnkgVk0gRXhpdCIpDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==


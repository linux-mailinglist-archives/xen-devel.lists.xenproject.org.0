Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76294A337A
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 04:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262372.454572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0iv-00073k-HO; Sun, 30 Jan 2022 03:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262372.454572; Sun, 30 Jan 2022 03:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0iv-00070r-E0; Sun, 30 Jan 2022 03:17:53 +0000
Received: by outflank-mailman (input) for mailman id 262372;
 Sun, 30 Jan 2022 03:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkCg=SO=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nE0it-00070l-Iv
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 03:17:51 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 324bcecf-817b-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 04:17:48 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 19:17:45 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2022 19:17:45 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:17:45 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:17:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 29 Jan 2022 19:17:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 29 Jan 2022 19:17:44 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Sun, 30 Jan
 2022 03:17:42 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 03:17:42 +0000
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
X-Inumbo-ID: 324bcecf-817b-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643512668; x=1675048668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X1x5ghUz8gT10kTBSNaPGljWN6kTbKL31boUzP3kdJ0=;
  b=iAVo1Jj8kEMxbaaNo9JCapsWZYOGQoshsgTyEeTZravrQasiG7K2szT7
   bqCd0MkI2BrQ43zRcktIU1hwm7zAXTbfg7QrFtfoscGLLGzMoOmU8Q2df
   41kg2NUDWB/zdGRsL2jV5J0bRP8R47+D9PqgajpGz4Ry4pHqEVHXIQxEK
   7bs6MATsR+FEZZlAslWyTcoERGBw5OgiSxJ3VYBl7Fji64cp1M6yXZQ1n
   nnwYItGI7NROQ73Ymb843OrXl/3sT3OENsAWq2piAP2KJBDRgtZVOP0Fe
   USKuOdKAg3CG6IlJvry4NuOBmj9tqWwcwalG/Ok/6uiKKHS3lck4dAIya
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247263746"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="247263746"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="619071186"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+Qu1g5+deJ0mlOgp1h5lgavNtyEhCksKI2qM1QkVZd/AI6qb3mNEmxltqI2prHSuR9av6FHIuoj9PnXhM6h3kjqTdRfx9HTlegFNc/2SjfOEMVcv6e/0ZEBdrpvjZ6LU8lTtWJqCiL63UPMLkN5EQD3M98SqqLuszUrGpbCAMjyWkhs0FCOpHxVJ1LStdQcr9b0VdhAWsBsBW8SN42GmxH4KYt6d81KMY5i6fav4GaWOEyqL54rAbisfn73efqbeO/R3q17N1BWCA4lPPdaCF4fAH9TGX88rqATNVw96Hdn+ZMocfom7qqdrHpEF/1ynpxq+MRnjwT1yiQ+CAw6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1x5ghUz8gT10kTBSNaPGljWN6kTbKL31boUzP3kdJ0=;
 b=Cpg5nf9Mhuo12TUo0CMPbICbwmfE6vGacJ/+0smzhKH7g4rDYTJrNwV2qWQa6yGzQgQJL9WggojXAQcE7KWXZj1NeKyFX0RRnB1EeLIMfXP+lDlRlQO6MisE0Wb55Z9jW2vR6fOKqa1iFwPLj5+mwpUdClnvleu1KgIYGF6UvYn1R/1fBl5+vGr4EY9jSWQMbDGmm1cKQGkXSkz8G/R18IGCAJ2mEDO9pIzdxCwhlaQtkTBhs22HOjwztgS6+7PTgrZjdEPliYPdkv6thR9QVvqCfPGPxwxJdXjsAo75OVN1s0MSyy6nb91oJvQk7dc82gvOkC+PsmZl84jVUNrM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 02/23] VT-d: have callers specify the target level for
 page table walks
Thread-Topic: [PATCH v3 02/23] VT-d: have callers specify the target level for
 page table walks
Thread-Index: AQHYBj5aO/ech4sHz0qfOYxZoO/bAqx7AiWA
Date: Sun, 30 Jan 2022 03:17:42 +0000
Message-ID: <BN9PR11MB52768DA38F476850467574438C249@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <5bfc3618-12ff-f673-e880-6ea13bcf8fa3@suse.com>
In-Reply-To: <5bfc3618-12ff-f673-e880-6ea13bcf8fa3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a20321d0-d20a-47e5-b6b2-08d9e39f1414
x-ms-traffictypediagnostic: BN9PR11MB5226:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5226A4CD8D862F0599810DE68C249@BN9PR11MB5226.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MPaLtCH8gEdBCJFHFp1Yzhu6xKcxNm7dRmDBeVS7Pt/73ZlM4WSEm86G0QmN8T3sJB/gbfYA34NwB42VKrS5jnsQipLrd4RvHQSJFTcpKwMXGejeXcuV1QJctvh8qE1Z+0fY8Rtb5vihKrgl+sIM3WnkTFUvS+NuJJ/ocFtB7HAu+bvVW9UMujmTNzkHkBdJauunDn6KKvxQ7mDeXm/hWZy3SRVkjyl29V3KEW3OPG3RJPWZZW2srN+g4S8TqgWvXEI/lmR9a3eLBjBAWZv6713pcPDaPUWzwPCYJ2hPgn2GNHyKNR2wTK8A6u4tQ7TkPJLIYRaoRs2op+UlauA5titgWFSc6xilh45SDQ6S+rAq/iD5Kn7ep1YaVa0+gtjeYenujc0I9B0+QsOijYCBknwNuiOeLVOM5zIkhK2lTYAxs1zMPH6Y0yShMsz6n2TSfJNNXyT+kPFLd38QJkbBhAe7elVQKGC3CNm7BKUZt8D/I19vhEcvxrUFfgKJ7E1AXOC6uewoyxFYCUw60kA0u6gtlheD65B7Q4lz5GhAwntbAfSlohLzka3jaJ2FOC9B6OZ5oLVKv2eRyxPkvHY2o0EvJmoyK60ZA1bTSDn1WnuYnferoTAVCELbHKHycdizPvI9DO9O6Q69k6CJy7ENh7KZzuDJjbHyF1tbb/EBDafugb8FjTc3hKagLIpMJXE/zzlcQjsXVjh25dSQSlqCCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(55016003)(76116006)(186003)(71200400001)(26005)(66946007)(9686003)(6506007)(83380400001)(33656002)(8676002)(7696005)(8936002)(82960400001)(86362001)(64756008)(66446008)(38070700005)(66556008)(66476007)(38100700002)(5660300002)(2906002)(316002)(54906003)(110136005)(52536014)(4326008)(508600001)(122000001)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEUzdEgrK2pjMFhBT2FNcDRYTXBKMWJ1cUhWNVoveVlRSUxiaVlhb0hSSzFj?=
 =?utf-8?B?WDRCOWNBR3o3UlJEZjJQMm5Oa0kwQ2hBMlJ4VVJOQ29KV3hzdGp2YVdtWDlV?=
 =?utf-8?B?emdYYlJBdFJzMy94SURMZ3A1eE0wTFQ2dnNhTlE5LzV6THVGNlk1dGhqTmsv?=
 =?utf-8?B?dFRYU1dJcnJPMzkyd1ptb3NWZ0tvMlJVQzVGU3VlZ2JRNlNtd0hFZnRmZ1hV?=
 =?utf-8?B?R3JBVGNOVnBKMlpUZ3BPSGJRMGxkMkw4TFViRmVsTkpCWFZjUHpaaVdtOUZu?=
 =?utf-8?B?am9aaHIxdytvK0xldVYvNjJHOTlJTHlzUlNIVUc2cWg5NlhNT2gwak4va1gy?=
 =?utf-8?B?NS9tRWZyem9xQ0NqOWJjVjd0TmhkbWo1ejQvbTFuRlFKTnZDaXFGaWovUkZn?=
 =?utf-8?B?eFAzOG02d2Nrb3RGYmY2eWlQRjQ5eW94a0FnRHd3bjdTVTZVVUdQaFpVUW9v?=
 =?utf-8?B?UlhqdGh4TjB4NnVsRFNvM3hMNzRnNDV5UWkvc2pCU3Q1NFQ3NGt2ZWVrM2xl?=
 =?utf-8?B?YzQyTUNQTzVyMVBhS3YzZGRRMUNjTVZKeHVGWUdnUGs1eHJpUGtSbmp2RmFT?=
 =?utf-8?B?d0RyYVRWckNXSzk3cy9LdWluUnBUYUoyYjdycXRyN1EvQkIydWc5UlZaZVNF?=
 =?utf-8?B?QnZmV2tXODBLUEJVa0VFeW9IbG5MN1B5T0ZwZ3BvYXg0THFrTHlvVTZodkhX?=
 =?utf-8?B?bmpkZ0Z6eXQ3aEVMUHhaTjdvT0p2Sys2UDFOb2R5NFlkM1JHa1drMzFBMFNu?=
 =?utf-8?B?bkUyR2ZQbzA4SmNYa2RVNkxiRTBiMDJya2JJK0FXNnJZbDJQUHdHellRMU5Y?=
 =?utf-8?B?T3IxR25ZY3lPU0l4NDhVUmQ2czQ5aUhzVmJlY00vc091WHN6T01Ca1ZHZnk0?=
 =?utf-8?B?dVU1cDZJUE9jandzUGtPTTlNZzhvOUpuRmg5S1d6dmtVSHZ5UWVPdS8wV2hs?=
 =?utf-8?B?dWhhL0JFVlhBSkUxdFBTMXhPWThVTFRhcUxQS1RBbXBuYlpjdkZQemFUVFoz?=
 =?utf-8?B?Tkgzb294c0Z3aVlIVnY4YThsbDlyYVJ6TEhQM3NJczRhazJYcmMrR2w5WmtN?=
 =?utf-8?B?Rlk5YjB0ajA4VzRUck5hYjBmR2VUU1YwN21ZMmRuTHFyOXFqaFdmRXFnWWx3?=
 =?utf-8?B?QXd4bWY5bGVSc2VUT0xsQVdWbmJlTi82VHQrMHJxOUN3WE1iMFZhREhoYm5X?=
 =?utf-8?B?U0dOWmw5M2o1N0xPaVlXTmx4TE1BbzN6MmRuajlPdUNsN1c0RWN3S2c5OVJI?=
 =?utf-8?B?bE5YQ2R4cHVWMS92ekE2WUxSdmJkbWwxU1hVUlppOG8xN3hpVUxDa1o4LzQ1?=
 =?utf-8?B?QUpGN3psSlZVdmdLUG1iZVpUbmdyZDJYbW9wR1VDaVZmTS9GVEhUSXZSbDRN?=
 =?utf-8?B?M0I5Sy94SHhObFBxUGNjMFI1WjhxSi9FVUZWU2JmSXdTYjQvT2toMnZMeEts?=
 =?utf-8?B?TDM0UFIyQjQzVm5BemNoKzBZa3BvakZHSTU2OElsNGJPc1EycFdiV2pnR0hu?=
 =?utf-8?B?d0xZV1ZjNkZaL3RGa2s3VzFsZGhpT1JEU0R0a1Iwd3NkTWkzbWJJQlJreXJk?=
 =?utf-8?B?TmNpSkhHVnoxbmNLc09SV2hYMTJOSHlFN2ZrWjlwcUxXQ0xVUWlkRFhPSktE?=
 =?utf-8?B?dURqM04xK3VpNFdEMkg2dUxtQjRKVFMzcE9RSDVBYXRyNnBoMjRYS1NwbXVh?=
 =?utf-8?B?aTZ6Qzc5YXcvMHVGTXlSZERJT3ZOL1BYZnJTNkJnY3A2UWxYcmJwa0lsZHdD?=
 =?utf-8?B?K0xMak1vOTVoOWpKRFh6M2VmWjNXSE00b1prZitldStRYUJ2Y2R3UU9hZGV2?=
 =?utf-8?B?M25WQkF1M1JkMzg0T3p3SmpoMFZoY3N2SjN2MEdVUnRDSlEvVEcwMTRGUWd0?=
 =?utf-8?B?Z0R4YXNnUzI0Z21NaU1yMU1HOHl4Ym80L1VKUlZKYm9nMkV6TVRuZlIvNzVO?=
 =?utf-8?B?M2QwWXIyR3cvWnBWa1NiRzFKTk8xWGVsaDE0RTZmTURpWVpkMjU1WmhhTTRS?=
 =?utf-8?B?M3JlTWMzdnVkclB2cFJzQTlabTlzbVFiaXc4b0VaMkU1MWYyQ3IzUTB5OGty?=
 =?utf-8?B?dFBocVc3Q2FEcjdCM2UzMXFkUFFOUmJ6S2FrZ25WUitHOG50R1Rub0lLZkR3?=
 =?utf-8?B?TzZJdnFaWlYvVTFOV2sySlVYSzRtSjBsQnJ1UW1qUE80WFVid2NnZk9aVC9p?=
 =?utf-8?Q?eV99gdbqerapaXikW6+4K6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20321d0-d20a-47e5-b6b2-08d9e39f1414
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 03:17:42.5062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNeZA4WMk0OEAWqxKq0zLtsrIG/14Ksi+NbuYvPYw2tlGiAtvEw9QYcoWbbs5VUfU/Jx6ZHdiisIwMb0XGduwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MjMgQU0NCj4gDQo+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8g
aW5zZXJ0L3JlbW92ZSBzdXBlci1wYWdlcyB3ZSBuZWVkIHRvIGFsbG93DQo+IGNhbGxlcnMgb2Yg
dGhlIHdhbGtpbmcgZnVuY3Rpb24gdG8gc3BlY2lmeSBhdCB3aGljaCBwb2ludCB0byBzdG9wIHRo
ZQ0KPiB3YWxrLg0KPiANCj4gRm9yIGludGVsX2lvbW11X2xvb2t1cF9wYWdlKCkgaW50ZWdyYXRl
IHRoZSBsYXN0IGxldmVsIGFjY2VzcyBpbnRvDQo+IHRoZSBtYWluIHdhbGtpbmcgZnVuY3Rpb24u
DQo+IA0KPiBkbWFfcHRlX2NsZWFyX29uZSgpIGdldHMgb25seSBwYXJ0bHkgYWRqdXN0ZWQgZm9y
IG5vdzogRXJyb3IgaGFuZGxpbmcNCj4gYW5kIG9yZGVyIHBhcmFtZXRlciBnZXQgcHV0IGluIHBs
YWNlLCBidXQgdGhlIG9yZGVyIHBhcmFtZXRlciByZW1haW5zDQo+IGlnbm9yZWQgKGp1c3QgbGlr
ZSBpbnRlbF9pb21tdV9tYXBfcGFnZSgpJ3Mgb3JkZXIgcGFydCBvZiB0aGUgZmxhZ3MpLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0N
Cj4gSSB3YXMgYWN0dWFsbHkgd29uZGVyaW5nIHdoZXRoZXIgaXQgd291bGRuJ3QgbWFrZSBzZW5z
ZSB0byBpbnRlZ3JhdGUNCj4gZG1hX3B0ZV9jbGVhcl9vbmUoKSBpbnRvIGl0cyBvbmx5IGNhbGxl
ciBpbnRlbF9pb21tdV91bm1hcF9wYWdlKCksIGZvcg0KPiBiZXR0ZXIgc3ltbWV0cnkgd2l0aCBp
bnRlbF9pb21tdV9tYXBfcGFnZSgpLg0KDQpJIHRoaW5rIGl0J3MgdGhlIHJpZ2h0IHRoaW5nIHRv
IGRvLiBJdCB3YXMgdGhlcmUgZHVlIHRvIG11bHRpcGxlIGNhbGxlcnMNCndoZW4gZmlyc3RseSBp
bnRyb2R1Y2VkLiBCdXQgbm93IGdpdmVuIG9ubHkgb25lIGNhbGxlciBtZXJpbmcgaXQNCndpdGgg
dGhlIGNhbGxlciB0byBiZSBzeW1tZXRyeSBtYWtlcyBzZW5zZS4NCg0Kd2l0aCBvciB3aXRob3V0
IHRoYXQgY2hhbmdlIChnaXZlbiBpdCdzIHNpbXBsZSk6DQoNCglSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IHYyOiBGaXggYnVpbGQuDQo+
IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMzQ3LDYzICszNDcsMTE2
IEBAIHN0YXRpYyB1NjQgYnVzX3RvX2NvbnRleHRfbWFkZHIoc3RydWN0IHYNCj4gICAgICByZXR1
cm4gbWFkZHI7DQo+ICB9DQo+IA0KPiAtc3RhdGljIHU2NCBhZGRyX3RvX2RtYV9wYWdlX21hZGRy
KHN0cnVjdCBkb21haW4gKmRvbWFpbiwgdTY0IGFkZHIsIGludA0KPiBhbGxvYykNCj4gKy8qDQo+
ICsgKiBUaGlzIGZ1bmN0aW9uIHdhbGtzIChhbmQgaWYgcmVxdWVzdGVkIGFsbG9jYXRlcykgcGFn
ZSB0YWJsZXMgdG8gdGhlDQo+ICsgKiBkZXNpZ25hdGVkIHRhcmdldCBsZXZlbC4gSXQgcmV0dXJu
cw0KPiArICogLSAwIHdoZW4gYSBub24tcHJlc2VudCBlbnRyeSB3YXMgZW5jb3VudGVyZWQgYW5k
IG5vIGFsbG9jYXRpb24gd2FzDQo+ICsgKiAgIHJlcXVlc3RlZCwNCj4gKyAqIC0gYSBzbWFsbCBw
b3NpdGl2ZSB2YWx1ZSAodGhlIGxldmVsLCBpLmUuIGJlbG93IFBBR0VfU0laRSkgdXBvbiBhbGxv
Y2F0aW9uDQo+ICsgKiAgIGZhaWx1cmUsDQo+ICsgKiAtIGZvciB0YXJnZXQgPiAwIHRoZSBwaHlz
aWNhbCBhZGRyZXNzIG9mIHRoZSBwYWdlIHRhYmxlIGhvbGRpbmcgdGhlIGxlYWYNCj4gKyAqICAg
UFRFIGZvciB0aGUgcmVxdWVzdGVkIGFkZHJlc3MsDQo+ICsgKiAtIGZvciB0YXJnZXQgPT0gMCB0
aGUgZnVsbCBQVEUuDQo+ICsgKi8NCj4gK3N0YXRpYyB1aW50NjRfdCBhZGRyX3RvX2RtYV9wYWdl
X21hZGRyKHN0cnVjdCBkb21haW4gKmRvbWFpbiwgZGFkZHJfdA0KPiBhZGRyLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRhcmdldCwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmx1
c2hfZmxhZ3MsIGJvb2wgYWxsb2MpDQo+ICB7DQo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAq
aGQgPSBkb21faW9tbXUoZG9tYWluKTsNCj4gICAgICBpbnQgYWRkcl93aWR0aCA9IGFnYXdfdG9f
d2lkdGgoaGQtPmFyY2gudnRkLmFnYXcpOw0KPiAgICAgIHN0cnVjdCBkbWFfcHRlICpwYXJlbnQs
ICpwdGUgPSBOVUxMOw0KPiAtICAgIGludCBsZXZlbCA9IGFnYXdfdG9fbGV2ZWwoaGQtPmFyY2gu
dnRkLmFnYXcpOw0KPiAtICAgIGludCBvZmZzZXQ7DQo+ICsgICAgdW5zaWduZWQgaW50IGxldmVs
ID0gYWdhd190b19sZXZlbChoZC0+YXJjaC52dGQuYWdhdyksIG9mZnNldDsNCj4gICAgICB1NjQg
cHRlX21hZGRyID0gMDsNCj4gDQo+ICAgICAgYWRkciAmPSAoKCh1NjQpMSkgPDwgYWRkcl93aWR0
aCkgLSAxOw0KPiAgICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmaGQtPmFyY2gubWFwcGluZ19s
b2NrKSk7DQo+ICsgICAgQVNTRVJUKHRhcmdldCB8fCAhYWxsb2MpOw0KPiArDQo+ICAgICAgaWYg
KCAhaGQtPmFyY2gudnRkLnBnZF9tYWRkciApDQo+ICAgICAgew0KPiAgICAgICAgICBzdHJ1Y3Qg
cGFnZV9pbmZvICpwZzsNCj4gDQo+IC0gICAgICAgIGlmICggIWFsbG9jIHx8ICEocGcgPSBpb21t
dV9hbGxvY19wZ3RhYmxlKGRvbWFpbikpICkNCj4gKyAgICAgICAgaWYgKCAhYWxsb2MgKQ0KPiAr
ICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsNCj4gKyAgICAgICAgcHRlX21hZGRyID0gbGV2ZWw7
DQo+ICsgICAgICAgIGlmICggIShwZyA9IGlvbW11X2FsbG9jX3BndGFibGUoZG9tYWluKSkgKQ0K
PiAgICAgICAgICAgICAgZ290byBvdXQ7DQo+IA0KPiAgICAgICAgICBoZC0+YXJjaC52dGQucGdk
X21hZGRyID0gcGFnZV90b19tYWRkcihwZyk7DQo+ICAgICAgfQ0KPiANCj4gLSAgICBwYXJlbnQg
PSAoc3RydWN0IGRtYV9wdGUgKiltYXBfdnRkX2RvbWFpbl9wYWdlKGhkLQ0KPiA+YXJjaC52dGQu
cGdkX21hZGRyKTsNCj4gLSAgICB3aGlsZSAoIGxldmVsID4gMSApDQo+ICsgICAgcHRlX21hZGRy
ID0gaGQtPmFyY2gudnRkLnBnZF9tYWRkcjsNCj4gKyAgICBwYXJlbnQgPSBtYXBfdnRkX2RvbWFp
bl9wYWdlKHB0ZV9tYWRkcik7DQo+ICsgICAgd2hpbGUgKCBsZXZlbCA+IHRhcmdldCApDQo+ICAg
ICAgew0KPiAgICAgICAgICBvZmZzZXQgPSBhZGRyZXNzX2xldmVsX29mZnNldChhZGRyLCBsZXZl
bCk7DQo+ICAgICAgICAgIHB0ZSA9ICZwYXJlbnRbb2Zmc2V0XTsNCj4gDQo+ICAgICAgICAgIHB0
ZV9tYWRkciA9IGRtYV9wdGVfYWRkcigqcHRlKTsNCj4gLSAgICAgICAgaWYgKCAhcHRlX21hZGRy
ICkNCj4gKyAgICAgICAgaWYgKCAhZG1hX3B0ZV9wcmVzZW50KCpwdGUpIHx8IChsZXZlbCA+IDEg
JiYNCj4gZG1hX3B0ZV9zdXBlcnBhZ2UoKnB0ZSkpICkNCj4gICAgICAgICAgew0KPiAgICAgICAg
ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+ICsgICAgICAgICAgICAvKg0KPiArICAgICAg
ICAgICAgICogSGlnaGVyIGxldmVsIHRhYmxlcyBhbHdheXMgc2V0IHIvdywgbGFzdCBsZXZlbCBw
YWdlIHRhYmxlDQo+ICsgICAgICAgICAgICAgKiBjb250cm9scyByZWFkL3dyaXRlLg0KPiArICAg
ICAgICAgICAgICovDQo+ICsgICAgICAgICAgICBzdHJ1Y3QgZG1hX3B0ZSBuZXdfcHRlID0geyBE
TUFfUFRFX1BST1QgfTsNCj4gDQo+ICAgICAgICAgICAgICBpZiAoICFhbGxvYyApDQo+IC0gICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICB7DQo+ICsgICAgICAgICAgICAgICAg
cHRlX21hZGRyID0gMDsNCj4gKyAgICAgICAgICAgICAgICBpZiAoICFkbWFfcHRlX3ByZXNlbnQo
KnB0ZSkgKQ0KPiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gKw0KPiArICAgICAgICAg
ICAgICAgIC8qDQo+ICsgICAgICAgICAgICAgICAgICogV2hlbiB0aGUgbGVhZiBlbnRyeSB3YXMg
cmVxdWVzdGVkLCBwYXNzIGJhY2sgdGhlIGZ1bGwgUFRFLA0KPiArICAgICAgICAgICAgICAgICAq
IHdpdGggdGhlIGFkZHJlc3MgYWRqdXN0ZWQgdG8gYWNjb3VudCBmb3IgdGhlIHJlc2lkdWFsIG9m
DQo+ICsgICAgICAgICAgICAgICAgICogdGhlIHdhbGsuDQo+ICsgICAgICAgICAgICAgICAgICov
DQo+ICsgICAgICAgICAgICAgICAgcHRlX21hZGRyID0gcHRlLT52YWwgKw0KPiArICAgICAgICAg
ICAgICAgICAgICAoYWRkciAmICgoMVVMIDw8IGxldmVsX3RvX29mZnNldF9iaXRzKGxldmVsKSkg
LSAxKSAmDQo+ICsgICAgICAgICAgICAgICAgICAgICBQQUdFX01BU0spOw0KPiArICAgICAgICAg
ICAgICAgIGlmICggIXRhcmdldCApDQo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAr
ICAgICAgICAgICAgfQ0KPiANCj4gKyAgICAgICAgICAgIHB0ZV9tYWRkciA9IGxldmVsIC0gMTsN
Cj4gICAgICAgICAgICAgIHBnID0gaW9tbXVfYWxsb2NfcGd0YWJsZShkb21haW4pOw0KPiAgICAg
ICAgICAgICAgaWYgKCAhcGcgKQ0KPiAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAg
ICAgICAgICAgIHB0ZV9tYWRkciA9IHBhZ2VfdG9fbWFkZHIocGcpOw0KPiAtICAgICAgICAgICAg
ZG1hX3NldF9wdGVfYWRkcigqcHRlLCBwdGVfbWFkZHIpOw0KPiArICAgICAgICAgICAgZG1hX3Nl
dF9wdGVfYWRkcihuZXdfcHRlLCBwdGVfbWFkZHIpOw0KPiANCj4gLSAgICAgICAgICAgIC8qDQo+
IC0gICAgICAgICAgICAgKiBoaWdoIGxldmVsIHRhYmxlIGFsd2F5cyBzZXRzIHIvdywgbGFzdCBs
ZXZlbA0KPiAtICAgICAgICAgICAgICogcGFnZSB0YWJsZSBjb250cm9sIHJlYWQvd3JpdGUNCj4g
LSAgICAgICAgICAgICAqLw0KPiAtICAgICAgICAgICAgZG1hX3NldF9wdGVfcmVhZGFibGUoKnB0
ZSk7DQo+IC0gICAgICAgICAgICBkbWFfc2V0X3B0ZV93cml0YWJsZSgqcHRlKTsNCj4gKyAgICAg
ICAgICAgIGlmICggZG1hX3B0ZV9wcmVzZW50KCpwdGUpICkNCj4gKyAgICAgICAgICAgIHsNCj4g
KyAgICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX3B0ZSAqc3BsaXQgPSBtYXBfdnRkX2RvbWFpbl9w
YWdlKHB0ZV9tYWRkcik7DQo+ICsgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpbmMgPSAx
VUwgPDwgbGV2ZWxfdG9fb2Zmc2V0X2JpdHMobGV2ZWwgLSAxKTsNCj4gKw0KPiArICAgICAgICAg
ICAgICAgIHNwbGl0WzBdLnZhbCA9IHB0ZS0+dmFsOw0KPiArICAgICAgICAgICAgICAgIGlmICgg
aW5jID09IFBBR0VfU0laRSApDQo+ICsgICAgICAgICAgICAgICAgICAgIHNwbGl0WzBdLnZhbCAm
PSB+RE1BX1BURV9TUDsNCj4gKw0KPiArICAgICAgICAgICAgICAgIGZvciAoIG9mZnNldCA9IDE7
IG9mZnNldCA8IFBURV9OVU07ICsrb2Zmc2V0ICkNCj4gKyAgICAgICAgICAgICAgICAgICAgc3Bs
aXRbb2Zmc2V0XS52YWwgPSBzcGxpdFtvZmZzZXQgLSAxXS52YWwgKyBpbmM7DQo+ICsNCj4gKyAg
ICAgICAgICAgICAgICBpb21tdV9zeW5jX2NhY2hlKHNwbGl0LCBQQUdFX1NJWkUpOw0KPiArICAg
ICAgICAgICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShzcGxpdCk7DQo+ICsNCj4gKyAgICAg
ICAgICAgICAgICBpZiAoIGZsdXNoX2ZsYWdzICkNCj4gKyAgICAgICAgICAgICAgICAgICAgKmZs
dXNoX2ZsYWdzIHw9IElPTU1VX0ZMVVNIRl9tb2RpZmllZDsNCj4gKyAgICAgICAgICAgIH0NCj4g
Kw0KPiArICAgICAgICAgICAgd3JpdGVfYXRvbWljKCZwdGUtPnZhbCwgbmV3X3B0ZS52YWwpOw0K
PiAgICAgICAgICAgICAgaW9tbXVfc3luY19jYWNoZShwdGUsIHNpemVvZihzdHJ1Y3QgZG1hX3B0
ZSkpOw0KPiAgICAgICAgICB9DQo+IA0KPiAtICAgICAgICBpZiAoIGxldmVsID09IDIgKQ0KPiAr
ICAgICAgICBpZiAoIC0tbGV2ZWwgPT0gdGFyZ2V0ICkNCj4gICAgICAgICAgICAgIGJyZWFrOw0K
PiANCj4gICAgICAgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdlKHBhcmVudCk7DQo+ICAgICAgICAg
IHBhcmVudCA9IG1hcF92dGRfZG9tYWluX3BhZ2UocHRlX21hZGRyKTsNCj4gLSAgICAgICAgbGV2
ZWwtLTsNCj4gICAgICB9DQo+IA0KPiAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYXJlbnQp
Ow0KPiBAQCAtNDMwLDcgKzQ4Myw3IEBAIHN0YXRpYyB1aW50NjRfdCBkb21haW5fcGdkX21hZGRy
KHN0cnVjdA0KPiAgICAgICAgICBpZiAoICFoZC0+YXJjaC52dGQucGdkX21hZGRyICkNCj4gICAg
ICAgICAgew0KPiAgICAgICAgICAgICAgLyogRW5zdXJlIHdlIGhhdmUgcGFnZXRhYmxlcyBhbGxv
Y2F0ZWQgZG93biB0byBsZWFmIFBURS4gKi8NCj4gLSAgICAgICAgICAgIGFkZHJfdG9fZG1hX3Bh
Z2VfbWFkZHIoZCwgMCwgMSk7DQo+ICsgICAgICAgICAgICBhZGRyX3RvX2RtYV9wYWdlX21hZGRy
KGQsIDAsIDEsIE5VTEwsIHRydWUpOw0KPiANCj4gICAgICAgICAgICAgIGlmICggIWhkLT5hcmNo
LnZ0ZC5wZ2RfbWFkZHIgKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiBAQCAtNzcw
LDggKzgyMyw5IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGlvbW11X2ZsdXNoX2lvdGwNCj4g
IH0NCj4gDQo+ICAvKiBjbGVhciBvbmUgcGFnZSdzIHBhZ2UgdGFibGUgKi8NCj4gLXN0YXRpYyB2
b2lkIGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21haW4gKmRvbWFpbiwgdWludDY0X3QgYWRk
ciwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZmx1c2hf
ZmxhZ3MpDQo+ICtzdGF0aWMgaW50IGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21haW4gKmRv
bWFpbiwgZGFkZHJfdCBhZGRyLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgb3JkZXIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCAqZmx1c2hfZmxhZ3MpDQo+ICB7DQo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQg
PSBkb21faW9tbXUoZG9tYWluKTsNCj4gICAgICBzdHJ1Y3QgZG1hX3B0ZSAqcGFnZSA9IE5VTEws
ICpwdGUgPSBOVUxMOw0KPiBAQCAtNzc5LDExICs4MzMsMTEgQEAgc3RhdGljIHZvaWQgZG1hX3B0
ZV9jbGVhcl9vbmUoc3RydWN0IGRvbQ0KPiANCj4gICAgICBzcGluX2xvY2soJmhkLT5hcmNoLm1h
cHBpbmdfbG9jayk7DQo+ICAgICAgLyogZ2V0IGxhc3QgbGV2ZWwgcHRlICovDQo+IC0gICAgcGdf
bWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGRvbWFpbiwgYWRkciwgMCk7DQo+IC0gICAg
aWYgKCBwZ19tYWRkciA9PSAwICkNCj4gKyAgICBwZ19tYWRkciA9IGFkZHJfdG9fZG1hX3BhZ2Vf
bWFkZHIoZG9tYWluLCBhZGRyLCAxLCBmbHVzaF9mbGFncywNCj4gZmFsc2UpOw0KPiArICAgIGlm
ICggcGdfbWFkZHIgPCBQQUdFX1NJWkUgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgc3Bpbl91bmxv
Y2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IC0gICAgICAgIHJldHVybjsNCj4gKyAgICAg
ICAgcmV0dXJuIHBnX21hZGRyID8gLUVOT01FTSA6IDA7DQo+ICAgICAgfQ0KPiANCj4gICAgICBw
YWdlID0gKHN0cnVjdCBkbWFfcHRlICopbWFwX3Z0ZF9kb21haW5fcGFnZShwZ19tYWRkcik7DQo+
IEBAIC03OTMsNyArODQ3LDcgQEAgc3RhdGljIHZvaWQgZG1hX3B0ZV9jbGVhcl9vbmUoc3RydWN0
IGRvbQ0KPiAgICAgIHsNCj4gICAgICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdf
bG9jayk7DQo+ICAgICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdlKTsNCj4gLSAgICAg
ICAgcmV0dXJuOw0KPiArICAgICAgICByZXR1cm4gMDsNCj4gICAgICB9DQo+IA0KPiAgICAgIGRt
YV9jbGVhcl9wdGUoKnB0ZSk7DQo+IEBAIC04MDMsNiArODU3LDggQEAgc3RhdGljIHZvaWQgZG1h
X3B0ZV9jbGVhcl9vbmUoc3RydWN0IGRvbQ0KPiAgICAgIGlvbW11X3N5bmNfY2FjaGUocHRlLCBz
aXplb2Yoc3RydWN0IGRtYV9wdGUpKTsNCj4gDQo+ICAgICAgdW5tYXBfdnRkX2RvbWFpbl9wYWdl
KHBhZ2UpOw0KPiArDQo+ICsgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludCBp
b21tdV9zZXRfcm9vdF9lbnRyeShzdHJ1Y3QgdnRkX2lvbW11ICppb21tdSkNCj4gQEAgLTE5MTQs
OCArMTk3MCw5IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGludGVsX2lvbW11X21hcF8NCj4g
ICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgfQ0KPiANCj4gLSAgICBwZ19tYWRkciA9IGFkZHJf
dG9fZG1hX3BhZ2VfbWFkZHIoZCwgZGZuX3RvX2RhZGRyKGRmbiksIDEpOw0KPiAtICAgIGlmICgg
IXBnX21hZGRyICkNCj4gKyAgICBwZ19tYWRkciA9IGFkZHJfdG9fZG1hX3BhZ2VfbWFkZHIoZCwg
ZGZuX3RvX2RhZGRyKGRmbiksIDEsDQo+IGZsdXNoX2ZsYWdzLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cnVlKTsNCj4gKyAgICBpZiAoIHBnX21hZGRyIDwgUEFH
RV9TSVpFICkNCj4gICAgICB7DQo+ICAgICAgICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBw
aW5nX2xvY2spOw0KPiAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gQEAgLTE5NjUsMTcgKzIw
MjIsMTQgQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW50ZWxfaW9tbXVfdW5tYQ0KPiAgICAg
IGlmICggaW9tbXVfaHdkb21fcGFzc3Rocm91Z2ggJiYgaXNfaGFyZHdhcmVfZG9tYWluKGQpICkN
Cj4gICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiAtICAgIGRtYV9wdGVfY2xlYXJfb25lKGQsIGRm
bl90b19kYWRkcihkZm4pLCBmbHVzaF9mbGFncyk7DQo+IC0NCj4gLSAgICByZXR1cm4gMDsNCj4g
KyAgICByZXR1cm4gZG1hX3B0ZV9jbGVhcl9vbmUoZCwgZGZuX3RvX2RhZGRyKGRmbiksIDAsIGZs
dXNoX2ZsYWdzKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50IGludGVsX2lvbW11X2xvb2t1cF9w
YWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QNCj4gKm1mbiwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbGFncykNCj4gIHsN
Cj4gICAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4gLSAgICBz
dHJ1Y3QgZG1hX3B0ZSAqcGFnZSwgdmFsOw0KPiAtICAgIHU2NCBwZ19tYWRkcjsNCj4gKyAgICB1
aW50NjRfdCB2YWw7DQo+IA0KPiAgICAgIC8qDQo+ICAgICAgICogSWYgVlQtZCBzaGFyZXMgRVBU
IHBhZ2UgdGFibGUgb3IgaWYgdGhlIGRvbWFpbiBpcyB0aGUgaGFyZHdhcmUNCj4gQEAgLTE5ODcs
MjUgKzIwNDEsMTYgQEAgc3RhdGljIGludCBpbnRlbF9pb21tdV9sb29rdXBfcGFnZShzdHJ1Yw0K
PiANCj4gICAgICBzcGluX2xvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IA0KPiAtICAg
IHBnX21hZGRyID0gYWRkcl90b19kbWFfcGFnZV9tYWRkcihkLCBkZm5fdG9fZGFkZHIoZGZuKSwg
MCk7DQo+IC0gICAgaWYgKCAhcGdfbWFkZHIgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgc3Bpbl91
bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7DQo+IC0gICAgICAgIHJldHVybiAtRU5PRU5U
Ow0KPiAtICAgIH0NCj4gLQ0KPiAtICAgIHBhZ2UgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKHBnX21h
ZGRyKTsNCj4gLSAgICB2YWwgPSBwYWdlW2Rmbl94KGRmbikgJiBMRVZFTF9NQVNLXTsNCj4gKyAg
ICB2YWwgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGQsIGRmbl90b19kYWRkcihkZm4pLCAwLCBO
VUxMLCBmYWxzZSk7DQo+IA0KPiAtICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdlKTsNCj4g
ICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsNCj4gDQo+IC0gICAgaWYg
KCAhZG1hX3B0ZV9wcmVzZW50KHZhbCkgKQ0KPiArICAgIGlmICggdmFsIDwgUEFHRV9TSVpFICkN
Cj4gICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7DQo+IA0KPiAtICAgICptZm4gPSBtYWRkcl90b19t
Zm4oZG1hX3B0ZV9hZGRyKHZhbCkpOw0KPiAtICAgICpmbGFncyA9IGRtYV9wdGVfcmVhZCh2YWwp
ID8gSU9NTVVGX3JlYWRhYmxlIDogMDsNCj4gLSAgICAqZmxhZ3MgfD0gZG1hX3B0ZV93cml0ZSh2
YWwpID8gSU9NTVVGX3dyaXRhYmxlIDogMDsNCj4gKyAgICAqbWZuID0gbWFkZHJfdG9fbWZuKHZh
bCk7DQo+ICsgICAgKmZsYWdzID0gdmFsICYgRE1BX1BURV9SRUFEID8gSU9NTVVGX3JlYWRhYmxl
IDogMDsNCj4gKyAgICAqZmxhZ3MgfD0gdmFsICYgRE1BX1BURV9XUklURSA/IElPTU1VRl93cml0
YWJsZSA6IDA7DQo+IA0KPiAgICAgIHJldHVybiAwOw0KPiAgfQ0KDQo=


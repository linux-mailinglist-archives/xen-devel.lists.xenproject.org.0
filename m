Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C355FB1F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357673.586402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TUa-00012e-QY; Wed, 29 Jun 2022 08:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357673.586402; Wed, 29 Jun 2022 08:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TUa-000108-LL; Wed, 29 Jun 2022 08:56:12 +0000
Received: by outflank-mailman (input) for mailman id 357673;
 Wed, 29 Jun 2022 08:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wio=XE=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o6TUY-0000wG-Lc
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:56:10 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4ff375-f789-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 10:56:07 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 01:56:05 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2022 01:56:04 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 01:56:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 29 Jun 2022 01:56:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 29 Jun 2022 01:56:04 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB3200.namprd11.prod.outlook.com (2603:10b6:805:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:56:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 08:56:02 +0000
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
X-Inumbo-ID: 4f4ff375-f789-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656492967; x=1688028967;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CPmbE+BRc69ZfHF3vhM7wH1H0i6SmKhoV5Y0PgygeC8=;
  b=CnSBEsHV81QjV3yBg+esPKrS5TBTvehqYNUjUUMErlqoBKTUMTF4OoFR
   wj0YB5yC+KSmbZCQK5vklLyuMDCPH8+PxfXAjjSErs2p32INjeldPY4C0
   awkbky5qDakuSwn9F8otJyEChYACL1t6w/mYVj337F7JrW40PASiRZbra
   61QYnRuCgQavBTSpJRsOl7UoLOOOrTqudlhAqdTIq7ekivU9wDE39is8q
   AEuzS3HYUHOffFu1ptJowcHxj1OL6ygcMIqR5HLAeAk8dvU89iO/dIFNT
   ooUPmD8Kq7j0s9Yn0bp0NDtGCNhX0RaXMJOBJ+jm2hrZdVygwa/K4r3Oh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282710016"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="282710016"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="565372784"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3TY7PdeoLzgBjg80lojYIUgOnRDYus7XvXMmz1aw4Y3pCphLaGJ/qUlQDcgydTb+UcTAOL5Jc82vnO5H+N2TyU+ViXmqsmQl8C16HRH/eScJSVm/e3uEuihiYwQhkXbPvw0KE6I1DE9AxOWTJXRSbuqgfu1fwPZey/b5AoWrS0SaFGRMQBjLFKb86UzOd7EI4BnuMHMLz5I98hNPM88DdAdJMxXAbWY2iLmGAr/UsXyW3HdjoPVbXzdArmQUc6EWHyF2yX1Vc89HnpXWgYyTgNpDN08PVoNW+Ght1QIyklqyLuJ2sP7sUktY//iMMVLVRzguwWml0NzbmmYVyDQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPmbE+BRc69ZfHF3vhM7wH1H0i6SmKhoV5Y0PgygeC8=;
 b=CH6hVjzbeCaZvZsPcYqWA9Zrtcn1AQkBD5epSjZJ/tuLiXb8r09OPgwEH76oWcjxXaF2y6F0mHzhXpVNR3RAMwMfPHssLE2Qqj4PnBt3CXxYZ5cxB/3hQ8IupZBm98m+poMQ7rAyFU8Pl/b9DyndaiIscnFo7KfaFfv3CTJD+WN1FTiyiGu1ZyrOFnY/Ay99k13yUBC3CBC2sMiUbVK/5ZJJKgOB1iRksMwUp4nzk7oFdDyFsIdLcTxVrBboI/QJblCAwK/pgaCnhvYRGoGpmHp6OQXFqziRZus0wRWVgsk1vcyZbZXqX30a4FHbiPHbXjy2Dqoafhhw9v2iN4mQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH v6 02/12] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Thread-Topic: [PATCH v6 02/12] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Thread-Index: AQHYe+oq9bL7IByuf0q0gcGGaDvoUK1k4/GAgAFO9LA=
Date: Wed, 29 Jun 2022 08:56:02 +0000
Message-ID: <BN9PR11MB52768C93686842D9391000478CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
 <99086452-43a8-2d93-ab4d-0343a0259259@suse.com>
 <Yrr5fTdO1CAKfIH7@Air-de-Roger>
In-Reply-To: <Yrr5fTdO1CAKfIH7@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14c5bd58-fb27-4c12-ccb6-08da59ad31b0
x-ms-traffictypediagnostic: SN6PR11MB3200:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2PAorjsSuWXZvuVy9FNmGiN03dhuj/YZdsDVuuLJbAGo+dz7oqmdqpIIte0w8Ph2C1LRk6VQgoA0CQiMphwIKyS6vGNpRHzCZHzt4U/i+4G5XNZw+3gbYAMfnDgHU7Bfi1+Bai0DJLdxxtINjUbCjDNjUElvm+Ef/x5nQCLtpMLNG3JGvjO9UD1cCkCq7ksMeB9n/VkilgRtAv7TKYqG+yNwY1DgBByC1pTT42kw/s4MKXouLHBqkKOFaHUH7yLeB8wUVABi08kRNjNONUlKyydJViwVHabnJ8S+pIiX2tPOE/Y3DfkT1HwGMSnvrll/PKreKiQTPtnYj5kOrGUsNoOj5KbZWhT+7hTKGack/4XVrFfH/SlN3+HzJLKEfv94CDj1fj2tQ5GVHFnJV9Cmcwm4cQ/S/Z1f190gpHPc2PFj0/sqpqlARjGxCVV1gMA9XlPcu2aq85fFnQUtij3FhhI5KkbQ8yj8TIGzDh61wkzbWR8RQPR2zSv8kQAqJI0iU831BQjbJowoHIq0KeRkfTgqfD2Flqp7mG9zVo4cP+SbY31nwuubdlpBRBls9HSsIeVr8uV2cIepIBNJFRvP5VLSIXBzxvEuolBzpYXr6OvhTsJv9QdmDeoKGDzv7NhMIyPQgAJR7H2TAmHF163JgPKRMBVZNzHNxmZvRv/dS+Hw44Rw7MdXG2lvPM1fIar+EDYEzKyoiYC/rvloSbtDqi8+ewpWKLhD9Qy/VmEzUNY7P6VONjqFb9kod8OEXeR70ibRSWQ3AVAD3RlvKmXuRotu9ZqplB38T1KvprT/znk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(366004)(39860400002)(376002)(186003)(6506007)(41300700001)(7696005)(66476007)(76116006)(9686003)(26005)(66446008)(38100700002)(38070700005)(82960400001)(8936002)(83380400001)(5660300002)(52536014)(2906002)(33656002)(55016003)(86362001)(110136005)(316002)(4326008)(8676002)(54906003)(478600001)(71200400001)(66556008)(64756008)(66946007)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WSttNHErT3RMWnl6aXd1SnB0R0dsanovNUJudytBMS9FSWlDNVFsYlZYWStn?=
 =?utf-8?B?cHZQbnltVG0vSCtScUVGLzU2cFdXUXFjZlpIZEhEN1pvTVZ6RVI4bERsNmMv?=
 =?utf-8?B?TzBsb0ZGdWZtcFNOcXkxZkI3VWNRZHlXM2xFb201ZWtUQ3dtZE41ZE00QjVo?=
 =?utf-8?B?MElIMGhtU25SQ1J3UjRleHV1RXZKWUNlViszMFNQM2x6UTRHWkQyaEtETktN?=
 =?utf-8?B?dFFWZVdudHBDRThGazQ2R0lsclVwOWxGREI2cW1LeW0vK3pxOVZWUjVab1Vh?=
 =?utf-8?B?S0xacHhSMVh6V1BaaXRSSHpSUEFDM0s5MllNSzJPRHA3NFJ1V2NrZTFNb1hG?=
 =?utf-8?B?ZDdsa2ZTdHg5WW9LUWFlaTBwWXVMMmxGWjJEWFFqdld0NUNpNnZSV1NRNGts?=
 =?utf-8?B?bUNWVmsyWWh2L1FMUWtWaFYxalBGQnIxaGZwMGVoUm5lOFhBNkZlSURtejlw?=
 =?utf-8?B?K0d1QXl5RUV0dE1SVXRMQ1hWYUIrMDFnVDNVdFBHeHgyVGh5ME9hYkdmampV?=
 =?utf-8?B?ei8wOTJEVTBOMlhiYVczc0JBNHl6UmlkaSticFJiaVRQSElJZ2tkNXZCbHdq?=
 =?utf-8?B?YUU5YklRQ0JjSmc5YTNkNXlFRFowUFdUc0NoLzVkaTJvVTJuSktySEE2OURT?=
 =?utf-8?B?MVE5cGNNUlcydzFXbm95L29ZL3lqdmlWTHRPS2dXU1lJaGt5R1VnYVJzRW5M?=
 =?utf-8?B?dnFJVDVxMnhwR2ltQUxjUUhPMXRXS0pEcWpvMXFxOTFMSU1MR0I3Z0RaNjdj?=
 =?utf-8?B?L3Y4V2RZcjl1cFQ0OEs1eUdvRFFjUTJtQ05NdW9YUjJjMFA1QlJGcVZsVFpP?=
 =?utf-8?B?eWV6Y0wrVjZCMnZRQ2pmYVA2VEk2cjBQd3p1ZmRNNVZBaHdOWkVna1B3RXZ1?=
 =?utf-8?B?djNCaUR6emZXb3FRakR4ZEtWZTNIdzRuQStncmZEelRwV09JTUM1V2ZhV1hv?=
 =?utf-8?B?cFd6UDJCVlNUbkZhNDU5eXc4S2NxRFZrVHFhY2NOUWE4WEtkV1ZTT1F6OHUr?=
 =?utf-8?B?UEthTGZjOTRFSk9VcTRKNjUzb2loTkp4VXBwTW00ZW1WakFQbW5GUEo2K0RD?=
 =?utf-8?B?WDBqdlpydFdxTWhXZnYwZlI3YnMzNW1yZEx2VnZ2aVg4UnY4RkpkMjlGN2FK?=
 =?utf-8?B?bHBRNUdtTzduS00zRm1ILzY4UjhrOUFSMUVDRjlOaUZYQmFKMWdjZWJiRyt1?=
 =?utf-8?B?ck5VQW5EZm84RytXZWg3K2NXU0RqTmVZcDM3TVJTM0xvWUdpcHVOYzFVbFhn?=
 =?utf-8?B?Y1ZpT2ZnaG1JVjBZMWMybGtBQkZDajVYQzlaL3gvM1k1cERZWnoxVUdCUWhP?=
 =?utf-8?B?b0pMa3pMcHNhYmJEVjRKOVVkWVNoZXdROVVMN0J0UzRGT2tXWG9nbG9PZjFu?=
 =?utf-8?B?UU5KalluN0RsSUcvbWZmZnYzL3VRN21vNGR1ZE5IdEx2by83ZVdNMThCUHFm?=
 =?utf-8?B?Ukc5TmxEc2FVVmI0bmJuN2xDL1R6RFBKNUJtNFBLQmxNb3dtSXVseVRtcFBD?=
 =?utf-8?B?ZmFFYnpjVm1BOFBobGVRV1g0VmFQdW1QbzYwTE5PTmJuVVRlYmt6bkNSZGsy?=
 =?utf-8?B?d3Zjcm84dmk1cEUzZFVvMndYWk1OcUszY3FJWEd4Wk5FdVFJY1lHbnlpQWVU?=
 =?utf-8?B?QWRyd3Qyd0FuT1BNM214ZTJmazVobHdBNjcrbGtQRlpycUJMSlBvUkptc29M?=
 =?utf-8?B?Y3ZsOUpsaUpINkwxZC9ERDFCelVrY3I3QnJjeXdwbnB5K0xWUGRHMnlnYWVJ?=
 =?utf-8?B?b3V1c1AxczVsRnhDVlNGTzZkc0VxUE83akxIbWJiZVdRMWs0UUFhZWNneXZs?=
 =?utf-8?B?MitWS0Qvc2FBQW91OHJMQlRDeGM2TTUwenBEOExmcE1iL21ISGYySkVzM0Rp?=
 =?utf-8?B?bWxXN20wNVRRZ3FDM1gwZ0F0RkczUS9MS2FCckNFTGVaYjU2cDZ2dkNHakI1?=
 =?utf-8?B?NlF3R0U4ajdEdTlYYU5PYVJJVWRaY1lhV0tzRVAzQllhRG1JdHlMbHRIZHFB?=
 =?utf-8?B?a2tTR1RjUVZ3amdMbGc2NTBHVUpOZlFsZFVYTU44bnVhTTY5VXdjOGJZblY5?=
 =?utf-8?B?Qnl1Ykh2TUdSWEs2TkdQeTJxbWtYc1hJYy9xZWhtZG5nekxRUml6YkRKSnIx?=
 =?utf-8?Q?EqfZtzukA53ogCcOMY8jqhBkU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c5bd58-fb27-4c12-ccb6-08da59ad31b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 08:56:02.3918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJKfBEUT2xnsLpRBsjXU3F5lNfrzjux+xXZCDCsGkh6LJ88EjtYA+J2ALptpQ2P5rCKrF4eKu+OGi1NURJiNWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3200
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VHVlc2RheSwgSnVuZSAyOCwgMjAyMiA4OjUyIFBNDQo+IA0KPiBPbiBUaHUsIEp1biAwOSwgMjAy
MiBhdCAxMjoxNzoyM1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBCZWZvcmUgYWN0
dWFsbHkgZW5hYmxpbmcgdGhlaXIgdXNlLCBwcm92aWRlIGEgbWVhbnMgdG8gc3VwcHJlc3MgaXQg
aW4NCj4gPiBjYXNlIG9mIHByb2JsZW1zLiBOb3RlIHRoYXQgdXNpbmcgdGhlIG9wdGlvbiBjYW4g
YWxzbyBhZmZlY3QgdGhlIHNoYXJpbmcNCj4gPiBvZiBwYWdlIHRhYmxlcyBpbiB0aGUgVlQtZCAv
IEVQVCBjb21iaW5hdGlvbjogSWYgRVBUIHdvdWxkIHVzZSBsYXJnZQ0KPiA+IHBhZ2UgbWFwcGlu
Z3MgYnV0IHRoZSBvcHRpb24gaXMgaW4gZWZmZWN0LCBwYWdlIHRhYmxlIHNoYXJpbmcgd291bGQg
YmUNCj4gPiBzdXBwcmVzc2VkICh0byBwcm9wZXJseSBmdWxmaWxsIHRoZSBhZG1pbiByZXF1ZXN0
KS4NCj4gPg0KPiA+IFJlcXVlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiA+IC0tLQ0KPiA+IHY2OiBOZXcuDQo+ID4NCj4gPiAtLS0gYS9kb2NzL21pc2MveGVu
LWNvbW1hbmQtbGluZS5wYW5kb2MNCj4gPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MNCj4gPiBAQCAtMTQwNSw3ICsxNDA1LDcgQEAgZGV0ZWN0aW9uIG9mIHN5c3RlbXMg
a25vd24gdG8gbWlzYmVoYXZlDQo+ID4NCj4gPiAgIyMjIGlvbW11DQo+ID4gICAgICA9IExpc3Qg
b2YgWyA8Ym9vbD4sIHZlcmJvc2UsIGRlYnVnLCBmb3JjZSwgcmVxdWlyZWQsIHF1YXJhbnRpbmVb
PXNjcmF0Y2gtDQo+IHBhZ2VdLA0KPiA+IC0gICAgICAgICAgICAgICAgc2hhcmVwdCwgaW50cmVt
YXAsIGludHBvc3QsIGNyYXNoLWRpc2FibGUsDQo+ID4gKyAgICAgICAgICAgICAgICBzaGFyZXB0
LCBzdXBlcnBhZ2VzLCBpbnRyZW1hcCwgaW50cG9zdCwgY3Jhc2gtZGlzYWJsZSwNCj4gPiAgICAg
ICAgICAgICAgICAgIHNub29wLCBxaW52YWwsIGlnZngsIGFtZC1pb21tdS1wZXJkZXYtaW50cmVt
YXAsDQo+ID4gICAgICAgICAgICAgICAgICBkb20wLXtwYXNzdGhyb3VnaCxzdHJpY3R9IF0NCj4g
Pg0KPiA+IEBAIC0xNDgxLDYgKzE0ODEsMTIgQEAgYm9vbGVhbiAoZS5nLiBgaW9tbXU9bm9gKSBj
YW4gb3ZlcnJpZGUgdA0KPiA+DQo+ID4gICAgICBUaGlzIG9wdGlvbiBpcyBpZ25vcmVkIG9uIEFS
TSwgYW5kIHRoZSBwYWdldGFibGVzIGFyZSBhbHdheXMgc2hhcmVkLg0KPiA+DQo+ID4gKyogICBU
aGUgYHN1cGVycGFnZXNgIGJvb2xlYW4gY29udHJvbHMgd2hldGhlciBzdXBlcnBhZ2UgbWFwcGlu
Z3MgbWF5DQo+IGJlIHVzZWQNCj4gPiArICAgIGluIElPTU1VIHBhZ2UgdGFibGVzLiAgSWYgdXNp
bmcgdGhpcyBvcHRpb24gaXMgbmVjZXNzYXJ5IHRvIGZpeCBhbiBpc3N1ZSwNCj4gPiArICAgIHBs
ZWFzZSByZXBvcnQgYSBidWcuDQo+ID4gKw0KPiA+ICsgICAgVGhpcyBvcHRpb24gaXMgb25seSB2
YWxpZCBvbiB4ODYuDQo+ID4gKw0KPiA+ICAqICAgVGhlIGBpbnRyZW1hcGAgYm9vbGVhbiBjb250
cm9scyB0aGUgSW50ZXJydXB0IFJlbWFwcGluZyBzdWItZmVhdHVyZSwNCj4gYW5kDQo+ID4gICAg
ICBpcyBhY3RpdmUgYnkgZGVmYXVsdCBvbiBjb21wYXRpYmxlIGhhcmR3YXJlLiAgT24geDg2IHN5
c3RlbXMsIHRoZSBmaXJzdA0KPiA+ICAgICAgZ2VuZXJhdGlvbiBvZiBJT01NVXMgb25seSBzdXBw
b3J0ZWQgRE1BIHJlbWFwcGluZywgYW5kIEludGVycnVwdA0KPiBSZW1hcHBpbmcNCj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaW9tbXUuaA0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9pb21tdS5oDQo+ID4gQEAgLTEzMiw3ICsxMzIsNyBAQCBleHRlcm4gYm9v
bCB1bnRydXN0ZWRfbXNpOw0KPiA+ICBpbnQgcGlfdXBkYXRlX2lydGUoY29uc3Qgc3RydWN0IHBp
X2Rlc2MgKnBpX2Rlc2MsIGNvbnN0IHN0cnVjdCBwaXJxICpwaXJxLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgdWludDhfdCBndmVjKTsNCj4gPg0KPiA+IC1leHRlcm4gYm9vbCBpb21t
dV9ub25fY29oZXJlbnQ7DQo+ID4gK2V4dGVybiBib29sIGlvbW11X25vbl9jb2hlcmVudCwgaW9t
bXVfc3VwZXJwYWdlczsNCj4gPg0KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgaW9tbXVfc3luY19j
YWNoZShjb25zdCB2b2lkICphZGRyLCB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4gPiAgew0KPiA+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4gQEAgLTg4LDYgKzg4LDggQEAgc3RhdGljIGludCBf
X2luaXQgY2ZfY2hlY2sgcGFyc2VfaW9tbXVfcA0KPiA+ICAgICAgICAgICAgICBpb21tdV9pZ2Z4
ID0gdmFsOw0KPiA+ICAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigicWlu
dmFsIiwgcywgc3MpKSA+PSAwICkNCj4gPiAgICAgICAgICAgICAgaW9tbXVfcWludmFsID0gdmFs
Ow0KPiA+ICsgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic3VwZXJwYWdl
cyIsIHMsIHNzKSkgPj0gMCApDQo+ID4gKyAgICAgICAgICAgIGlvbW11X3N1cGVycGFnZXMgPSB2
YWw7DQo+ID4gICNlbmRpZg0KPiA+ICAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9v
bGVhbigidmVyYm9zZSIsIHMsIHNzKSkgPj0gMCApDQo+ID4gICAgICAgICAgICAgIGlvbW11X3Zl
cmJvc2UgPSB2YWw7DQo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmMNCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiA+IEBA
IC0yMjEzLDcgKzIyMTMsOCBAQCBzdGF0aWMgYm9vbCBfX2luaXQgdnRkX2VwdF9wYWdlX2NvbXBh
dGliDQo+ID4gICAgICBpZiAoIHJkbXNyX3NhZmUoTVNSX0lBMzJfVk1YX0VQVF9WUElEX0NBUCwg
ZXB0X2NhcCkgIT0gMCApDQo+ID4gICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+DQo+ID4gLSAg
ICByZXR1cm4gKGVwdF9oYXNfMm1iKGVwdF9jYXApICYmIG9wdF9oYXBfMm1iKSA8PQ0KPiBjYXBf
c3BzXzJtYih2dGRfY2FwKSAmJg0KPiA+ICsgICAgcmV0dXJuIGlvbW11X3N1cGVycGFnZXMgJiYN
Cj4gPiArICAgICAgICAgICAoZXB0X2hhc18ybWIoZXB0X2NhcCkgJiYgb3B0X2hhcF8ybWIpIDw9
DQo+IGNhcF9zcHNfMm1iKHZ0ZF9jYXApICYmDQo+ID4gICAgICAgICAgICAgKGVwdF9oYXNfMWdi
KGVwdF9jYXApICYmIG9wdF9oYXBfMWdiKSA8PSBjYXBfc3BzXzFnYih2dGRfY2FwKTsNCj4gDQo+
IElzbid0IHRoaXMgdG9vIHN0cmljdCBpbiByZXF1ZXN0aW5nIGlvbW11IHN1cGVycGFnZXMgdG8g
YmUgZW5hYmxlZA0KPiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgRVBUIGhhcyBzdXBlcnBhZ2Ugc3Vw
cG9ydD8NCj4gDQo+IFNob3VsZG4ndCB0aGlzIGluc3RlYWQgYmU6DQo+IA0KPiByZXR1cm4gaW9t
bXVfc3VwZXJwYWdlcyA/ICgoZXB0X2hhc18ybWIoZXB0X2NhcCkgJiYgb3B0X2hhcF8ybWIpIDw9
DQo+IGNhcF9zcHNfMm1iKHZ0ZF9jYXApICYmDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IChlcHRfaGFzXzFnYihlcHRfY2FwKSAmJiBvcHRfaGFwXzFnYikgPD0NCj4gY2FwX3Nwc18xZ2Io
dnRkX2NhcCkpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIDogISgoZXB0X2hhc18ybWIoZXB0
X2NhcCkgJiYgb3B0X2hhcF8ybWIpIHx8DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
ZXB0X2hhc18xZ2IoZXB0X2NhcCkgJiYgb3B0X2hhcF8xZ2IpKTsNCj4gDQo+IEkgdGhpbmsgd2Ug
d2FudCB0byBpbnRyb2R1Y2Ugc29tZSBsb2NhbCB2YXJpYWJsZXMgdG8gc3RvcmUgRVBUDQo+IHN1
cGVycGFnZSBhdmFpbGFiaWxpdHksIGFzIHRoZSBsaW5lcyBhcmUgdG9vIGxvbmcuDQo+IA0KDQpP
ciB0byBiZSBwYWlyIHdpdGggZXB0IHNpZGUgY2hlY2tzOg0KDQogICAgcmV0dXJuIChlcHRfaGFz
XzJtYihlcHRfY2FwKSAmJiBvcHRfaGFwXzJtYikgPD0NCiAgICAgICAgICAgKGNhcF9zcHNfMm1i
KHZ0ZF9jYXApICYmIGlvbW11X3N1cGVycGFnZXMpICYmDQogICAgICAgICAgIChlcHRfaGFzXzFn
YihlcHRfY2FwKSAmJiBvcHRfaGFwXzFnYikgPD0NCiAgICAgICAgICAgKGNhcF9zcHNfMWdiKHZ0
ZF9jYXApICYmIGlvbW11X3N1cGVycGFnZXMpOw0K


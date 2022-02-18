Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C454BB17C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275122.470849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvvb-0000az-Ke; Fri, 18 Feb 2022 05:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275122.470849; Fri, 18 Feb 2022 05:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvvb-0000Xp-HQ; Fri, 18 Feb 2022 05:35:35 +0000
Received: by outflank-mailman (input) for mailman id 275122;
 Fri, 18 Feb 2022 05:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvvZ-0000Ta-ON
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:35:33 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95dc2160-907c-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 06:35:32 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:35:29 -0800
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2022 21:35:29 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:35:28 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:35:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:35:28 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:35:27 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN6PR11MB2815.namprd11.prod.outlook.com (2603:10b6:805:62::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Fri, 18 Feb
 2022 05:35:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:35:26 +0000
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
X-Inumbo-ID: 95dc2160-907c-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645162532; x=1676698532;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KjN3JFxacm4iP65kvUanE9pOzvfIR6bD9mkByBqe6Hg=;
  b=jueK1+8l01tjjs37B3mSG5tbFMh5sIpFOCeD+HC5vdgl/ODMpME2ZYrc
   dNzb2kjlnVqkX3isMwaYQzh+4LNjz3bbzDslqTfIexcutMREchMeLzZ6g
   +StmGhaTpkGvB5M49urDH0+ILdZCPswShJrNEys4v/ICk0dh71XBLOjuL
   9QEoidIdnp1OWqa08JuhddPfVacFgeGP9onLzi25XXCw/rHnuwKc/NyrS
   HjVtDAsc0UbZX4DrKPGE2mO+1cULaYjtKOKzGiYjrVOAihZx5/TNh8CTC
   JCt5xkFl6/yzeegpQ9nYBU6+z6zVt8Oa9MtPJDcjmT4vgyz0soXG8Ooex
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238460050"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="238460050"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="775182339"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNTY3VcvPLdGdYpIH2fDKLLrIt1QpnxGZIM+QKxNxU9FgqbwpuAQ8/90olJgq6KvwBciCHmLFyWA2/a5ibPNLZ7sERxa37R5UjrgNZsTVVkjCISc3ZrHMvMoSSMHjMDsScF01Ye/AbLL1181Kxns+1RqDmfSFA4M1XTHPzYOiELM/v2BD1HXl/GNgwCG36TMXa5r0L2H03maDkDoxJtO0RP2BWfy4i0tRvgx9uUx1rD/kaL7zWD5/+XiQBFKs9V8gEGuDzB16nMMdKGqFrPFFQDwfaG6DLFxMjg4ZbhnQWo6HeWWHUHqU4NIu8BG8SQnG8ns1gBMBWq81oINORnyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjN3JFxacm4iP65kvUanE9pOzvfIR6bD9mkByBqe6Hg=;
 b=f9u1xTln6zEo1xBXr1UqJiKnKK2EwvMzHhNX9PvkVN3cYtgmn29yF+TJ2wwNtn/SyKqCx+cc6z2QI3i0X8iHCy5a9xCoHFxp5+PBQ6xtQNwzC/r9LvvyErUqV3XImjZg/8CXxpqz4de5q0sgHjk+G7eyOv4OE34MV7mQ6kIlvwxcwOJMsQpGhqyzURiu3JJv1TiXqHCfmt0Uhlb6DwPOEbNyD/WF//b9INQWEDLOj5aFt8u+hsvXmuvNu/PxzXnUhDMvuFxwWKklu2fmXPqssOK2j0BcO9sDf5uC//vn5hZE64xjHER+d1agN6p6JoHwodOA7Gk8Fv1Wke/1P5zRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 3/4] VT-d: replace flush_all_cache()
Thread-Topic: [PATCH v2 3/4] VT-d: replace flush_all_cache()
Thread-Index: AQHYE40cwzioqi7zCkCsPderd+h65ayY62ww
Date: Fri, 18 Feb 2022 05:35:26 +0000
Message-ID: <BN9PR11MB52761F4D52321571162676A28C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <2a39cb48-7d38-6d7e-0557-fd93d377a31b@suse.com>
In-Reply-To: <2a39cb48-7d38-6d7e-0557-fd93d377a31b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 415608c9-0efb-4693-84d5-08d9f2a0776b
x-ms-traffictypediagnostic: SN6PR11MB2815:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR11MB28151829A74CFE4380612E2F8C379@SN6PR11MB2815.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uv8S+nGscO5qaj64mqXCyNNaqXi142l2CM3Na6lLsznIBO/Fi3wkXtjZEcomhDln4hO66jIIBR6TmofbcqYZlPX3Ambs6kOrc/yITv4XbutZ5GVFZW9wd40hH4U9XJiMUmvI8wZ37SmeftjajzXVVseeVsta1yTvsyC4W2iJ7xlBVaL7gYy4+JCEZ0wF0b99eoLMz1JdjITZDAUPlHXEf9n+itVKvIuxdIecVFqLnLUebxbwxjI9z7ZZiv1kpmSMzDkd2yVLoS2AY+BJcHDN1kkZ/3Dap1uS8DnOSfTvOBMoOABPxHtr6rpMaDx11sUP08iR+vMzyHBq3rJBPC/CpoAdCsjyVcStOUC5joFHSnpim8lwnY1juF87k1beVh/eR2YFmd2OZRZMhwJJkLgj0HzbGQDfiCGS6IgxTVWtYaf2n3khJi+CRvIUZ12p5WK/RWZMfkR4rZ2HVczV/uSQJmVKpXzIDi2bjTBCfkMthkQhNd38oQ85RywZEYy18moqMcdJIoJds0cl79HCVOZ+9tGSiLTEwizlD6OOpClkDz6gMg+Dao5AsOHihmZhKrR4w3f0AA38e25JhYJQ8NlHYnXxIk5jOZsp3qKbuLtwcsPh7RIHb3CHhnoDAeJAqu5z5ke+WAmlRuUhBIQeWbCPa4ZFU1lkUgbhpZ33aiVaA6niClVEB4TS7mv57uRL6mVO6YqyeHEHLVR4b7aMaNNHQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(38100700002)(66446008)(71200400001)(38070700005)(64756008)(26005)(186003)(66476007)(122000001)(82960400001)(4326008)(66946007)(2906002)(508600001)(86362001)(110136005)(54906003)(9686003)(5660300002)(8936002)(66556008)(316002)(33656002)(7696005)(76116006)(52536014)(55016003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEdUbXozRmNROG9lN0VTQTRKZHBuOFhJb0VTNHFJRWJzRERqUnVpbkN0WEFu?=
 =?utf-8?B?ZGZtRlVaaW5jMU9ZZURLeVRPWXA5cUhrRXRVM2FkR2t1NmErN1RaU2praHVP?=
 =?utf-8?B?eEg2cXA5KzBTRkZyQkVPdHFBdE55a2FOTmdGdlp6WEt3OXgwMWRsbU9BZFRW?=
 =?utf-8?B?UGNKcVVnRkZOOVY3S05CYUhyc09kTHA3SlVHSHR1a3pZZzdZQzFpalRQQk5q?=
 =?utf-8?B?N0hrWDNZL0hDakFqd0NxVDdBYVJ0aldjWnh3bXA3Wk5acjBYR1Q4VmNzTEdo?=
 =?utf-8?B?S1p0WW5YaDVyYjVLUERCQUMwMWZZazlpMHZ1U2tDS2ErSWUrbytobWJobElV?=
 =?utf-8?B?VzhXYlNIWE9Jd1FRZDZGditqVVViYW5mVURTQ3dlL09OV3Z3TVVDRnYyaHFY?=
 =?utf-8?B?UzZKNjhxbG4zTUZZTS9veVIxMThDSFhaU2ozMGQ0c3EvOXVCK3BYKyt3aitz?=
 =?utf-8?B?NnU4Vzl0N3BBdWo2UFBHTmswU0x6d0tpQklWa1F2YTNIK3RyQWUvYkNrNkR4?=
 =?utf-8?B?cVpVU2ZwZG91aDhROFkxNGtkVWRKekl5WmVuR21yZGh6RU9NQWMrYUJidERa?=
 =?utf-8?B?cXlmb0gvSW5adW1XOVFlUVBqQTBOQWJmVHVBVFE3NGhTdmU2VUNMTTlMc0Fl?=
 =?utf-8?B?RnE0R3daN0NONGRra01jN0xaUUlIREhFUnNlcm9BQlB5L3Yydk9LN1lpQnZR?=
 =?utf-8?B?QlZpSTc4cVhDcWFmQm1XaVpHZlJhazZTOC9ZVStyc1VRWkdhSTcwYmtCaExm?=
 =?utf-8?B?TnVyQjdoQXNITDc2WEtEclpQQlZVYU8vRU4yT216aytINkpTTjlCUkNpWUJz?=
 =?utf-8?B?TUFnYUhjRDhDaVZLWnpObXNib09QK3BESjNCLzA0Q2cydndyTi9sWllwMjM2?=
 =?utf-8?B?bHpwTW9LOEtKZ080RFlDWk92Uk4vN1ZvdFNhejlVV21NaGd3amdvTk1Gc0pv?=
 =?utf-8?B?NDVxTGU1OEprY1piMGdVL3Rxdm1CdFZIcTRNaHVIQ251WEdmVVJXbWZRLzM1?=
 =?utf-8?B?WWRjcld4eFJWNWFGeFE2bnk3MlpOenErZTc0cTBxd3ZtejZ6RlgxREk2amFK?=
 =?utf-8?B?VlVTakx6Qy9ZMCtSU1NtSW9tcXJnakNwRVNRWTBxendEL3MrdjRRQjM0OEF2?=
 =?utf-8?B?UUcxc0lZajRVTUovdDNWTmM5S0svaHFYMDBjMWh1dzRZZUdsenhGZWxSb2Nn?=
 =?utf-8?B?T0NLUzFNdXBhSERYS1c2WFYzZ2NvNTRoR1pRQTh5eE1DMDErNkN5aGl4dlF2?=
 =?utf-8?B?VDNKcGtOZDFBODBZTHNZNkErbVdvdGJvaDQ5RGFydFFaOWFLZi9DOVphNDA3?=
 =?utf-8?B?QlJZWmticmxqK0JaVlVCTWlZcm9iMGU0ZWYvK01QNldCWHR4V2JSZHE1M0M2?=
 =?utf-8?B?ZzUxN0ZweW45dG03Uld3NXlidnI4WEtBNFFlZ2tLQmhsRzlma2hGU0NnZ3Mr?=
 =?utf-8?B?N0tpZWJ6Snpib1E5ZC8zTVhnNFgrUDN0SXI4N2h5UkhJd3FxUkFhQ0dMbUpo?=
 =?utf-8?B?VE9UMFZaMUdxeE53a3FmZzVnRStwa0U5d2wxbHlCbUFHZ25vcS9lMVhGSy9S?=
 =?utf-8?B?ZDNRcWJnVElINVl1NUdIR040WTBoTk1FcFQ2K3dRWm85WXJpRXcyREFuM0Qv?=
 =?utf-8?B?emZwVjNFSWMybGxyUG5Bc0R3WWRaSkM1dXBjNC8vQ1VEcWRINWsvbjRhMnU1?=
 =?utf-8?B?S2FWZ3RIc1J0aDFyZ3ZYdWQzVUpxVlhpWk1GMURhK0RsbFJkT3RhTlg3cGkr?=
 =?utf-8?B?Y2I2UXM1bU9wc3pRRWYxby9QNWNIZHRQYjVUeVdYcVdnWVozclNUc3diNlFO?=
 =?utf-8?B?bTBSY2VNUHJ4WmRpdmpuVVE0YjMyWjNzbGczOEl0OG5IczBvOUhURXUzY0ov?=
 =?utf-8?B?R2lRRGtjaUVzMERSZ3JmK1R1bmwwcnJqTUVkM043VzZjQVFlYTIyZ0dycVRV?=
 =?utf-8?B?S2FwazkyMjQwWXZIM3BHRlZjSkxVT3FlV3hKbmtNSUNxMWllNTVkYlN6K2du?=
 =?utf-8?B?U2MyMUlheGFqcnJERFI4cVM1K0szVUxyazUwaDh1bEFPSTZGWjVhWE5QYzlr?=
 =?utf-8?B?SVEvS29hc2RiejdFQWpTbW92cm9uSVVkMkRSOUlLdVFCYndvLzAvTnVUNmlu?=
 =?utf-8?B?aVJ3QmhoY21NRU9FTUg4TnBrbEd3WndRaG9rb1lhVFRnSEJMUmhncU10OHZT?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415608c9-0efb-4693-84d5-08d9f2a0776b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:35:26.1235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3KODe2GXImionF6UdboCBXbfEUTfyCXbboWPCOwVz5lWJufC5C892Or95HqajU+zhmXemD+LxsX1Xb2BxX5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2815
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyNywgMjAyMiAx
MDo0OSBQTQ0KPiANCj4gTGV0J3MgdXNlIGluZnJhc3RydWN0dXJlIHdlIGhhdmUgYXZhaWxhYmxl
IGluc3RlYWQgb2YgYW4gb3Blbi1jb2RlZA0KPiB3YmludmQoKSBpbnZvY2F0aW9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9leHRlcm4uaA0KPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvZXh0ZXJuLmgNCj4gQEAgLTc4LDggKzc4LDYgQEAgaW50IF9fbXVzdF9j
aGVjayBxaW52YWxfZGV2aWNlX2lvdGxiX3N5bg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MTYgZGlkLCB1MTYgc2l6ZSwgdTY0IGFkZHIp
Ow0KPiANCj4gLXZvaWQgZmx1c2hfYWxsX2NhY2hlKHZvaWQpOw0KPiAtDQo+ICB1aW50NjRfdCBh
bGxvY19wZ3RhYmxlX21hZGRyKHVuc2lnbmVkIGxvbmcgbnBhZ2VzLCBub2RlaWRfdCBub2RlKTsN
Cj4gIHZvaWQgZnJlZV9wZ3RhYmxlX21hZGRyKHU2NCBtYWRkcik7DQo+ICB2b2lkICptYXBfdnRk
X2RvbWFpbl9wYWdlKHU2NCBtYWRkcik7DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
DQo+IEBAIC02MjMsNyArNjIzLDggQEAgc3RhdGljIGludCBfX211c3RfY2hlY2sgaW9tbXVfZmx1
c2hfYWxsKA0KPiAgICAgIGJvb2xfdCBmbHVzaF9kZXZfaW90bGI7DQo+ICAgICAgaW50IHJjID0g
MDsNCj4gDQo+IC0gICAgZmx1c2hfYWxsX2NhY2hlKCk7DQo+ICsgICAgZmx1c2hfbG9jYWwoRkxV
U0hfQ0FDSEUpOw0KPiArDQo+ICAgICAgZm9yX2VhY2hfZHJoZF91bml0ICggZHJoZCApDQo+ICAg
ICAgew0KPiAgICAgICAgICBpbnQgY29udGV4dF9yYywgaW90bGJfcmM7DQo+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC94ODYvdnRkLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL3g4Ni92dGQuYw0KPiBAQCAtNDYsOCArNDYsMyBAQCB2b2lkIHVubWFwX3Z0
ZF9kb21haW5fcGFnZShjb25zdCB2b2lkICp2DQo+ICB7DQo+ICAgICAgdW5tYXBfZG9tYWluX3Bh
Z2UodmEpOw0KPiAgfQ0KPiAtDQo+IC12b2lkIGZsdXNoX2FsbF9jYWNoZSgpDQo+IC17DQo+IC0g
ICAgd2JpbnZkKCk7DQo+IC19DQo+IA0KDQo=


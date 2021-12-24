Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CC47ECCE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 08:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251253.432579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0fGK-00007f-Kr; Fri, 24 Dec 2021 07:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251253.432579; Fri, 24 Dec 2021 07:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0fGK-0008WO-HD; Fri, 24 Dec 2021 07:45:12 +0000
Received: by outflank-mailman (input) for mailman id 251253;
 Fri, 24 Dec 2021 07:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6v+=RJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1n0fGJ-0008WG-ED
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 07:45:11 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ad0242d-648d-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 08:45:10 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 23:45:08 -0800
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 23 Dec 2021 23:45:07 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:45:07 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:45:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 23:45:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 23:45:06 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2609.namprd11.prod.outlook.com (2603:10b6:406:b1::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Fri, 24 Dec
 2021 07:45:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 07:45:04 +0000
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
X-Inumbo-ID: 6ad0242d-648d-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640331910; x=1671867910;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j0OXZXnuQ69lr+yVsU4srU4fkQHx2hKe1jbgwHdYyh8=;
  b=UNuwwUsG9wbycBCzv5InXSeGJQypgaoQGtuTVskX9Tg6oxnMjXkYRINS
   l3lqOmV8pHjMdhKxgmeDzMjHzDH2Bl2B/q6cpIHUQ4+D6CfesoPmVeHei
   zLnP1xITvhaiw9g2cpuxg4vxVrToRuiUi201pIRlV7udCYMwrrTKP/Hnm
   8XuhxJZkDvhMpmSrSHwmq0fXErIeOtFfjRrIzAy0hROAPSuUokjVPihBf
   zFdEIopSn1nCe73LLWwCmCOC3nHoLn8W8A6T2rrJGI4fmyMwjfcf1jCts
   geLr28HGMxIN7S37t4VpJ8aIA5x3AGz1y2LncgZ2S0vCaJOpffa3MtX6D
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="220955004"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="220955004"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="485322075"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI4hzGYHgSLVjwXnb0T+AWMXYQrr0ATgzryTm3P/KPN0VODKqJUCeCcLaaT8nILHGRXugp/mfq1aAoDxygCU5nJcoFeGicoA4IyI8p6P2j7NwHz+lFy0hMvCUtcwl9aBj6lWO1K5X7pjzBP+VuMZFmVopvBPhp0hXZWxaiKtRPB7IPClPKglTFv5XBZkRnW4AAGgOSrnad9yxaonbFnj6cjtPhiLjHgET+WKro0Bx4ppq50YwxnH0xlGMkUgeqX/kws69kOqUSt+udGW1Zca8X6vSpXEQvaVclgnGWVbdT3tVVPPzEpf6aFxKBan5sjAJjFxK0xndOIKnci9Widapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0OXZXnuQ69lr+yVsU4srU4fkQHx2hKe1jbgwHdYyh8=;
 b=anEpK9YTmGDVHOrQgl0wXvQd3npM3jbPT17vvwuzB89TkrfD14vsjWQKn1dp/voL09fjIublUvuIS5/sbBk4FxxjhrmSK6DTh1ls2PjwyrkfBslm2cgNSlrYX70jV7c+lJAB+1nrMVyP71GpiyZw0UOQH0DTbvki4TuPgFRuGe6UxTeiITfmsmps7k7g6ScZp2wLMEtuPiLtxPBj0BkY4WhpKEupGTcL2PIXu4Nfe+l3KuyJrEEaO5xB2YuhseLuabSk1NEDphSdKhYo3GR4MDwaltny1dVm9IyXa7ehdjE+k0C+FVmeQrsj+JYy25Fu27qlrWeMJ9iruSjL7ubTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/EPT: squash meaningless TLB flush
Thread-Topic: [PATCH] x86/EPT: squash meaningless TLB flush
Thread-Index: AQHX5gUNjzdaZ7T5YkaXVYM1ZhmrS6xBaC8w
Date: Fri, 24 Dec 2021 07:45:04 +0000
Message-ID: <BN9PR11MB5276DC6941A924889D43B9EA8C7F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
In-Reply-To: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20080606-365f-4fed-7f9f-08d9c6b14ca0
x-ms-traffictypediagnostic: BN7PR11MB2609:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2609F85996386566167ED0098C7F9@BN7PR11MB2609.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LqlZMLrKJCCl7PuQdGp8gpHC/2jQiK/wmxfoLfW5yE3oCrOGEO+HbZTGFlnFs0ghX6CHUtZe+yE1HnWBveO2kW7t5YVg3OtrEAkdiSEtJazhfvju+KyWrmJmChw55+bVw59gk2Qh7iboO5uH3oEtl5c3n5m/epN+BbQpw48PaxL7D4YID4Z3Y8dOw/wxpFQ8tUp8Cceocgs2LU2GJ0QwDnBUkws9bY5PdMXf6YDtOAlv9732689ASlTM/6RG61YBQdpvV4myDM/tOpeSpPOfsIhaMluF1rmHt1oyTLkTD0pNrGklzvv1LPBhpTWjGX2oQiotRzJ62+A9QXcTJHJDxVcFZFrFdXufjTlzuma/uGcxrwJd0D0Ii+isADFqKCv6uaqtlykY96BfMDZKFQTYXuZqz0mHECd1YEyOUneI71JQvEwXZ8WoyePkPjACRoepXf1uff7MIaumZLBdF9OAYUZzYHfXHz82O6D8xCGr8NeB3ezqKL2A0iOCGLnt2VO4qqZL05DvqhqY7oH9oIox+Wjs9y55qqwWwNfCTJoTjSsQkGh+OHadHcYiFPQljp2ufX6asww5esTUT6Hc/EOh7xUoitiS2JlO0zT0ll7ZoCvKI2xb+FInwGGTksY2a5yhbqBYdq7fPQs2NgKjbqmcvG1LIq0u0/aK6QVozpdY6y+ZM1qqJvSv0P9GMMfkIFflT9Jz7OskY1XN9/0dAaNZFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(38100700002)(122000001)(107886003)(66476007)(4744005)(66556008)(64756008)(76116006)(66446008)(66946007)(110136005)(55016003)(6506007)(508600001)(316002)(82960400001)(9686003)(8676002)(38070700005)(4326008)(33656002)(8936002)(86362001)(26005)(7696005)(52536014)(2906002)(71200400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0YrVW00cXJJdWdPam5qaWY5Wkwra0NEbzBzd2p0NzhxUlpaVUdSZjBVN3dw?=
 =?utf-8?B?WlZ5SVdIWlN5OXE0NzlHbjlEQ1RQLzZ2RC9hMzZVZWtZVkx5UkVLT2RaclFs?=
 =?utf-8?B?QVVYaFlNQ1FzYk9tZGtLZlU5UStydlhqdEdmYjhMOHFMeUtFVlY2ck8rNHRJ?=
 =?utf-8?B?aGhyTERhS292UjBQTlFLNTk5SUNOdEwwZ01odGJWVVBGeFYyR3ByM2NFVkR2?=
 =?utf-8?B?d3VVcVFBckd4NTJOK2V4SlVMUzVlTzM3SmlIU1E5a1ppYkxoUkNGR2ROYUgv?=
 =?utf-8?B?NjF6R0pYWmhVdm1pSEtHai8vYWZLTU9uYXJ3NnhPQjNhd281ZkE1MW4xU2Ev?=
 =?utf-8?B?SCtNNTRIbFJBQmVLQjAzRXk3MHdtbjZtejdvUnhNeWhoMHpzdWk3bmliMjB4?=
 =?utf-8?B?ZnNRcFJ5QW1YWS85eGpjSG52Q3NMVkVrNXdQWlVjSHBRQ09DVndvSTJlMkFa?=
 =?utf-8?B?UlhtTVdxdVJ2cVpIQitTV1hTcTV4TU5aSUFHYmZGQmJSYmJRUzlCYlcvamR5?=
 =?utf-8?B?dWNLMDc5Tld0bFh6bHhmRDYxeUhyV2NhRTd2TjRZcnlRSm1SaU4zTnNnckRo?=
 =?utf-8?B?N0tKd0dVbklNN3pHUm12cC9IMnI3a1BuOGJmY1hYQUtQUm5NN2t2M0hDdFFl?=
 =?utf-8?B?NHJKZmFpYmUyVzF1THVTTC9nMm5vdnhPQkIzQmpCVVNRcUJNS21DQmVYVG1o?=
 =?utf-8?B?M0hEUW5pRmVMazQxVVVhWTlYMENhekV6SnpKUmxvblZRSnVJRXp4eitWSjFR?=
 =?utf-8?B?K0hmK0cwU3Fad1VoWjU0cXNwUkJXd1JiOU96K3AzandYOHhBcUl1R1Npa29V?=
 =?utf-8?B?QnNYMTVEK0U4eHd2UjcvSXFRT2dXdU5ZYmEyUXBIUDdtVXNtVnAxVmNGY1FR?=
 =?utf-8?B?NHBXMGxoVmt5MEoxRkZwa1Y3R21oUEd5QWVVTktRNGtHQURoRDh6dlJvdFUv?=
 =?utf-8?B?cVlQLy9YUWtCZUdOazJFMG96SDliNTRtejdBMUhCTzlySE92U3A2NTNoeFcy?=
 =?utf-8?B?OEtic0M5R0pOVWtJMElNMHVkbkk2MzJhRFc5MmRKbVN1RnNhZzRzMlFMZm0z?=
 =?utf-8?B?RHRjb210MzNJTkY1T2h3OTBpc01YVlVUZGlLME1RdThIZVVFc05iRm5EampX?=
 =?utf-8?B?VFNWMnMvbGJ6anRGdE1Yc0QxMlQycDFFaWVGbXZKNmllVnk0a3BhL0p6MkhO?=
 =?utf-8?B?WUlHdzVobHdHRTF4MGpvZUVyMTV1bGZ3ZnBPekMra1BiaUhhVG0yU1JoN2l1?=
 =?utf-8?B?YytreHNFd2Nwd1VpcThuSk42eWI4RkdDTzNpd2taelkwalExaUxseHBHOTZJ?=
 =?utf-8?B?VTFVS3luVUoyYTMrVkNBRjNtVlVIclkyOHN4R3pTQjhIMXJtcWMxeFlEMXlT?=
 =?utf-8?B?dTNCYytZdGp6ZUJjWUQ1YXFDZ3M5WU4xdVJBTE45aTBzdm84alRRVHk5UDBJ?=
 =?utf-8?B?QlVORnY3N01XVW5OVUY3d2w4TWNDZVFRc2IxU3Y2NVNEdWQvcUZuYzJRN25L?=
 =?utf-8?B?emo2cWVsSnZuQWJOaC9leGQzWi9xMThUS2xCQ2xwM2Rqa1pTMGxZM2RkL3pK?=
 =?utf-8?B?a1VSSEl6TEQ5WmMrSWNMalQ2MHY2MzB3T2lQa0R3QVRrMTkxWjg0cGJYT1dP?=
 =?utf-8?B?b2M1SXdBMFB5YXVkQ0lOL3hjazdqeTA2SUM2bm1lTGtUWng1UDVTY1RlUkpi?=
 =?utf-8?B?UTBFdzJDQ0ZMM2F4dHMvLzZEZFE4UmFwY0wyVnJGRWtPYzRuWi9lQi8vdE1r?=
 =?utf-8?B?S2d6NVZqQVl5Z3lzWmFLV1ErTTI0aXF1Zk5NRS9LNUtMZHJFNDlLTkVYMmFH?=
 =?utf-8?B?Tlh5d1RNc2pxOWFYSTF6cnV0K2JwZ2pnTFNoR1dnNHhrc1psek82QitqU1RT?=
 =?utf-8?B?RDhtcGl2OUNCVStQdzZDalBXblZ4eitLU0FTekcveGkwQmpINmhIV2w1T3Nj?=
 =?utf-8?B?aFJydzQ5TS9scktwejA2eXFwQS9DY1NQczRscGp4bnRzYlh1VmVYcnR4MFMv?=
 =?utf-8?B?QjBCNmwyRUN4djJaaUJOdnJWM3hNZjBlZUZsRG5wcU43RTZzdnM4Q2o4NkFC?=
 =?utf-8?B?UFBsZHN1UXZBYy84cWt0c1dpemczalc3bjhoeC8xclNQdmFweDhMOW5PRzBt?=
 =?utf-8?B?MEhvLzlVeHVyaVhyS0FYdlhQbmZCeURCTjYvQU5WSXpkcFp1QzQvZmR1K1V6?=
 =?utf-8?Q?4U9nFEq5sJjf4BS4GLNmQ1k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20080606-365f-4fed-7f9f-08d9c6b14ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 07:45:04.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUldZ/cd38Sby1pGlWkLwBM2L/77jDrpam8uRYCkYN/ddUM04N8d0O5bNlh6lXDj5Np9oWn3m5sBlq3cfu47VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2609
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgRGVjZW1iZXIgMSwgMjAyMSAxMjoxMSBBTQ0KPiANCj4gZXB0X2ZyZWVfZW50cnkoKSBnZXRz
IGNhbGxlZCBhZnRlciBhIGZsdXNoIC0gaWYgb25lIGlzIG5lY2Vzc2FyeSBpbiB0aGUNCj4gZmly
c3QgcGxhY2UgLSB3YXMgYWxyZWFkeSBpc3N1ZWQuIFRoYXQgYmVoYXZpb3IgaXMgc2ltaWxhciB0
byBOUFQsIHdoaWNoDQo+IGFsc28gZG9lc24ndCBoYXZlIGFueSBmdXJ0aGVyIGZsdXNoIGluIHAy
bV9mcmVlX2VudHJ5KCkuIChGdXJ0aGVybW9yZSwNCj4gdGhlIGZ1bmN0aW9uIGJlaW5nIHJlY3Vy
c2l2ZSwgaW4gY2FzZSBvZiByZWN1cnNpdmVuZXNzIHdheSB0b28gbWFueQ0KPiBmbHVzaGVzIHdv
dWxkIGhhdmUgYmVlbiBpc3N1ZWQuKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQoNCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPiBAQCAtMjQ2LDggKzI0Niw3IEBAIHN0
YXRpYyB2b2lkIGVwdF9mcmVlX2VudHJ5KHN0cnVjdCBwMm1fZG8NCj4gICAgICAgICAgICAgIGVw
dF9mcmVlX2VudHJ5KHAybSwgZXB0ZSArIGksIGxldmVsIC0gMSk7DQo+ICAgICAgICAgIHVubWFw
X2RvbWFpbl9wYWdlKGVwdGUpOw0KPiAgICAgIH0NCj4gLQ0KPiAtICAgIHAybV90bGJfZmx1c2hf
c3luYyhwMm0pOw0KPiArDQo+ICAgICAgcDJtX2ZyZWVfcHRwKHAybSwgbWZuX3RvX3BhZ2UoX21m
bihlcHRfZW50cnktPm1mbikpKTsNCj4gIH0NCj4gDQoNCg==

